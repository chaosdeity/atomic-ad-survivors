extends Node2D

const VIEWPORT_SIZE := Vector2(480, 270)
const ARENA_HALF := Vector2(760, 430)

const AD_PAPER := Color("#f5e9d0")
const PASTEL_BEIGE := Color("#e8c8a0")
const MINT_FADE := Color("#c8dcd8")
const CORAL_PINK := Color("#f2b8b0")
const LEMON_YELLOW := Color("#fad89c")
const SAGE_GREEN := Color("#a8c8b8")
const COCOA := Color("#7a4a3a")
const INK := Color("#2a2a28")
const TOXIC_GREEN := Color("#9fff5c")
const NEON_RED := Color("#ff4d5c")
const VITAMIN_YELLOW := Color("#ffe93f")

const PLAYER_SPEED := 118.0
const PLAYER_RADIUS := 10.0
const PLAYER_MAX_HP := 100.0
const BASE_DPS := 100.0
const AUTO_RANGE := 155.0
const AUTO_TICK := 0.12

const ENEMY_HP := 30.0
const ELITE_HP := 90.0
const ENEMY_SPEED := 36.0
const ELITE_SPEED := 25.0
const ENEMY_CONTACT_DPS := 10.5
const ENEMY_CAP := 150

const CHARGE_PERIOD := 5.0
const CHARGE_WINDOW := 1.0
const CHARGE_DAMAGE := BASE_DPS * CHARGE_WINDOW * 2.5
const CHARGE_AOE_TARGETS := 15
const DIRECTED_BONUS := 1.6
const DIRECTED_AOE_TARGETS := 22
const CHARGE_RANGE := 210.0
const DIRECTED_ARC_COS := 0.55
const PARTICLE_GRAVITY := Vector2(0, 34)

var player_pos := Vector2.ZERO
var player_hp := PLAYER_MAX_HP
var elapsed := 0.0
var xp := 0.0
var level := 1
var kills := 0
var game_over := false

var enemies: Array[Dictionary] = []
var shots: Array[Dictionary] = []
var bursts: Array[Dictionary] = []
var particles: Array[Dictionary] = []
var floaters: Array[Dictionary] = []

var spawn_timer := 0.0
var auto_timer := 0.0
var charge_timer := 0.0
var charge_window_left := 0.0
var charge_ready_flash := 0.0
var charge_open_age := 0.0
var screen_flash := 0.0
var shake_left := 0.0
var shake_power := 0.0

var rng := RandomNumberGenerator.new()
var camera: Camera2D
var charge_audio: AudioStreamPlayer
var fire_audio: AudioStreamPlayer
var hit_audio: AudioStreamPlayer
var hud: CanvasLayer
var hp_bar: ColorRect
var charge_bar: ColorRect
var charge_button: Label
var prompt_label: Label
var stat_label: Label
var card_panel: Panel
var paused_for_card := false

func _ready() -> void:
	rng.seed = 42
	_ensure_input_map()
	camera = Camera2D.new()
	camera.position_smoothing_enabled = false
	camera.zoom = Vector2.ONE
	add_child(camera)
	camera.make_current()
	_build_audio()
	_build_hud()
	set_process(true)

func _process(delta: float) -> void:
	if game_over:
		if Input.is_action_just_pressed("charge"):
			_restart()
		return
	if paused_for_card:
		return

	elapsed += delta
	_update_player(delta)
	_update_spawning(delta)
	_update_enemies(delta)
	_update_auto_fire(delta)
	_update_charge(delta)
	_update_effects(delta)
	_update_hud()
	camera.global_position = (player_pos + _shake_offset()).round()
	queue_redraw()

func _input(event: InputEvent) -> void:
	var pressed_charge := event.is_action_pressed("charge")
	if event is InputEventScreenTouch and event.pressed:
		pressed_charge = true
	if pressed_charge:
		if paused_for_card:
			_apply_card_choice()
		elif game_over:
			_restart()
		elif charge_window_left > 0.0:
			_fire_charge()

func _update_player(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_pos += input_dir * PLAYER_SPEED * delta
	player_pos.x = clampf(player_pos.x, -ARENA_HALF.x, ARENA_HALF.x)
	player_pos.y = clampf(player_pos.y, -ARENA_HALF.y, ARENA_HALF.y)

func _update_spawning(delta: float) -> void:
	spawn_timer -= delta
	var spawn_rate := 3.4 + elapsed * 0.018
	if spawn_timer <= 0.0 and enemies.size() < ENEMY_CAP:
		spawn_timer = maxf(0.08, 1.0 / spawn_rate)
		var count := 1
		if elapsed > 15.0 and rng.randf() < 0.35:
			count += 1
		if elapsed > 55.0 and rng.randf() < 0.20:
			count += 1
		for i in range(count):
			_spawn_enemy()

func _spawn_enemy() -> void:
	var side := rng.randi_range(0, 3)
	var pos := Vector2.ZERO
	if side == 0:
		pos = player_pos + Vector2(-270, rng.randf_range(-160, 160))
	elif side == 1:
		pos = player_pos + Vector2(270, rng.randf_range(-160, 160))
	elif side == 2:
		pos = player_pos + Vector2(rng.randf_range(-260, 260), -165)
	else:
		pos = player_pos + Vector2(rng.randf_range(-260, 260), 165)
	pos.x = clampf(pos.x, -ARENA_HALF.x, ARENA_HALF.x)
	pos.y = clampf(pos.y, -ARENA_HALF.y, ARENA_HALF.y)
	var elite := elapsed > 45.0 and rng.randf() < 0.14
	enemies.append({
		"pos": pos,
		"hp": ELITE_HP if elite else ENEMY_HP,
		"max_hp": ELITE_HP if elite else ENEMY_HP,
		"radius": 12.0 if elite else 8.0,
		"speed": ELITE_SPEED if elite else ENEMY_SPEED,
		"elite": elite,
	})

func _update_enemies(delta: float) -> void:
	var contact_damage := 0.0
	for enemy in enemies:
		var pos: Vector2 = enemy["pos"]
		var to_player := player_pos - pos
		var dist := maxf(1.0, to_player.length())
		enemy["pos"] = pos + to_player / dist * float(enemy["speed"]) * delta
		if dist < PLAYER_RADIUS + float(enemy["radius"]):
			contact_damage += ENEMY_CONTACT_DPS * delta * (1.7 if enemy["elite"] else 1.0)
	if contact_damage > 0.0:
		player_hp = maxf(0.0, player_hp - contact_damage)
		if player_hp <= 0.0:
			game_over = true
			prompt_label.text = "게임 오버  -  스페이스 / 클릭으로 다시 시작"
			prompt_label.visible = true

func _update_auto_fire(delta: float) -> void:
	auto_timer -= delta
	if auto_timer > 0.0:
		return
	auto_timer = AUTO_TICK
	var target_idx := _nearest_enemy(AUTO_RANGE)
	if target_idx == -1:
		return
	var damage := BASE_DPS * AUTO_TICK
	var target_pos: Vector2 = enemies[target_idx]["pos"]
	_damage_enemy(target_idx, damage)
	shots.append({"from": player_pos, "to": target_pos, "life": 0.08, "color": NEON_RED})

func _update_charge(delta: float) -> void:
	if charge_window_left > 0.0:
		charge_window_left = maxf(0.0, charge_window_left - delta)
		charge_open_age += delta
		if charge_window_left <= 0.0:
			charge_timer = 0.0
			charge_open_age = 0.0
	else:
		charge_timer += delta
		if charge_timer >= CHARGE_PERIOD:
			charge_window_left = CHARGE_WINDOW
			charge_open_age = 0.0
			charge_ready_flash = 0.22
			screen_flash = 0.12
			charge_audio.play()
	charge_ready_flash = maxf(0.0, charge_ready_flash - delta)

func _fire_charge() -> void:
	var mouse_world := get_global_mouse_position()
	var aim := mouse_world - player_pos
	var directed := aim.length() > 18.0
	var aim_dir := aim.normalized() if directed else Vector2.RIGHT
	var hit_indices: Array[int] = []

	for i in range(enemies.size()):
		var to_enemy: Vector2 = enemies[i]["pos"] - player_pos
		var dist := to_enemy.length()
		if dist > CHARGE_RANGE:
			continue
		if directed and to_enemy.normalized().dot(aim_dir) < DIRECTED_ARC_COS:
			continue
		hit_indices.append(i)

	hit_indices.sort_custom(func(a: int, b: int) -> bool:
		return player_pos.distance_squared_to(enemies[a]["pos"]) < player_pos.distance_squared_to(enemies[b]["pos"])
	)

	var limit := DIRECTED_AOE_TARGETS if directed else CHARGE_AOE_TARGETS
	var damage := CHARGE_DAMAGE * (DIRECTED_BONUS if directed else 1.0)
	for n in range(mini(limit, hit_indices.size())):
		var idx := hit_indices[n]
		if idx < enemies.size():
			_spawn_hit_spark(enemies[idx]["pos"], directed)
			enemies[idx]["hp"] = float(enemies[idx]["hp"]) - damage

	_cleanup_dead()
	_fire_feedback(directed)
	_spawn_charge_particles(player_pos, aim_dir, directed)
	bursts.append({
		"pos": player_pos,
		"dir": aim_dir,
		"life": 0.28,
		"directed": directed,
	})
	floaters.append({
		"pos": player_pos + Vector2(0, -24),
		"text": "집중!" if directed else "차징!",
		"life": 0.65,
		"color": TOXIC_GREEN if directed else VITAMIN_YELLOW,
	})
	charge_window_left = 0.0
	charge_timer = 0.0

func _update_effects(delta: float) -> void:
	screen_flash = maxf(0.0, screen_flash - delta)
	shake_left = maxf(0.0, shake_left - delta)
	for item in shots:
		item["life"] = float(item["life"]) - delta
	for item in bursts:
		item["life"] = float(item["life"]) - delta
	for item in particles:
		item["life"] = float(item["life"]) - delta
		item["vel"] = Vector2(item["vel"]) + PARTICLE_GRAVITY * delta
		item["pos"] = Vector2(item["pos"]) + Vector2(item["vel"]) * delta
	for item in floaters:
		item["life"] = float(item["life"]) - delta
		item["pos"] = Vector2(item["pos"]) + Vector2(0, -18) * delta
	shots = shots.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	bursts = bursts.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	particles = particles.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	floaters = floaters.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)

func _nearest_enemy(max_range: float) -> int:
	var best := -1
	var best_dist := max_range * max_range
	for i in range(enemies.size()):
		var dist := player_pos.distance_squared_to(enemies[i]["pos"])
		if dist < best_dist:
			best_dist = dist
			best = i
	return best

func _damage_enemy(index: int, damage: float) -> void:
	if index < 0 or index >= enemies.size():
		return
	enemies[index]["hp"] = float(enemies[index]["hp"]) - damage
	_cleanup_dead()

func _cleanup_dead() -> void:
	for i in range(enemies.size() - 1, -1, -1):
		if float(enemies[i]["hp"]) <= 0.0:
			var pos: Vector2 = enemies[i]["pos"]
			enemies.remove_at(i)
			kills += 1
			xp += 1.0
			_spawn_pop_particles(pos)
			bursts.append({"pos": pos, "dir": Vector2.RIGHT, "life": 0.18, "directed": false})
	if xp >= level * 10.0:
		xp = 0.0
		level += 1
		hit_audio.play()
		_show_level_card()

func _show_level_card() -> void:
	paused_for_card = true
	card_panel.visible = true
	prompt_label.visible = true
	prompt_label.text = "레벨 업  -  스페이스 / 클릭으로 선택"

func _apply_card_choice() -> void:
	paused_for_card = false
	card_panel.visible = false
	prompt_label.visible = false
	player_hp = minf(PLAYER_MAX_HP, player_hp + 18.0)

func _build_hud() -> void:
	hud = CanvasLayer.new()
	add_child(hud)

	var root := Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_child(root)

	var hp_back := ColorRect.new()
	hp_back.color = COCOA
	hp_back.position = Vector2(10, 10)
	hp_back.size = Vector2(112, 9)
	root.add_child(hp_back)

	hp_bar = ColorRect.new()
	hp_bar.color = NEON_RED
	hp_bar.position = Vector2(11, 11)
	hp_bar.size = Vector2(110, 7)
	root.add_child(hp_bar)

	var charge_back := ColorRect.new()
	charge_back.color = COCOA
	charge_back.position = Vector2(10, 24)
	charge_back.size = Vector2(112, 8)
	root.add_child(charge_back)

	charge_bar = ColorRect.new()
	charge_bar.color = TOXIC_GREEN
	charge_bar.position = Vector2(11, 25)
	charge_bar.size = Vector2(0, 6)
	root.add_child(charge_bar)

	charge_button = Label.new()
	charge_button.position = Vector2(362, 208)
	charge_button.size = Vector2(96, 44)
	charge_button.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	charge_button.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	charge_button.text = "차징\n대기중"
	charge_button.add_theme_color_override("font_color", INK)
	root.add_child(charge_button)

	stat_label = Label.new()
	stat_label.position = Vector2(132, 7)
	stat_label.add_theme_color_override("font_color", INK)
	root.add_child(stat_label)

	prompt_label = Label.new()
	prompt_label.position = Vector2(118, 226)
	prompt_label.add_theme_color_override("font_color", INK)
	prompt_label.add_theme_color_override("font_shadow_color", AD_PAPER)
	prompt_label.add_theme_constant_override("shadow_offset_x", 1)
	prompt_label.add_theme_constant_override("shadow_offset_y", 1)
	prompt_label.visible = false
	root.add_child(prompt_label)

	card_panel = Panel.new()
	card_panel.position = Vector2(130, 70)
	card_panel.size = Vector2(220, 116)
	card_panel.visible = false
	root.add_child(card_panel)
	var card_text := Label.new()
	card_text.position = Vector2(16, 14)
	card_text.size = Vector2(188, 88)
	card_text.text = "시리얼 경품!\n\n체력 +18 회복\n다음엔 더 많은 선택지"
	card_text.add_theme_color_override("font_color", INK)
	card_panel.add_child(card_text)

func _build_audio() -> void:
	charge_audio = AudioStreamPlayer.new()
	charge_audio.stream = _make_tone_stream(520.0, 0.32, 0.18, 920.0)
	add_child(charge_audio)

	fire_audio = AudioStreamPlayer.new()
	fire_audio.stream = _make_burst_stream(0.34)
	add_child(fire_audio)

	hit_audio = AudioStreamPlayer.new()
	hit_audio.stream = _make_tone_stream(740.0, 0.13, 0.10, 980.0)
	add_child(hit_audio)

func _make_tone_stream(start_hz: float, seconds: float, volume: float, end_hz: float = -1.0) -> AudioStreamWAV:
	var sample_rate := 22050
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var phase := 0.0
	for i in range(count):
		var t := float(i) / float(maxi(1, count - 1))
		var hz := lerpf(start_hz, end_hz if end_hz > 0.0 else start_hz, t)
		phase += TAU * hz / sample_rate
		var env := sin(PI * t)
		var sample := int(clampf(sin(phase) * env * volume, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = sample_rate
	stream.stereo = false
	stream.data = data
	return stream

func _make_burst_stream(seconds: float) -> AudioStreamWAV:
	var sample_rate := 22050
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var phase_low := 0.0
	var phase_high := 0.0
	for i in range(count):
		var t := float(i) / float(maxi(1, count - 1))
		var env := pow(1.0 - t, 2.2)
		phase_low += TAU * lerpf(120.0, 48.0, t) / sample_rate
		phase_high += TAU * lerpf(1200.0, 240.0, t) / sample_rate
		var noise := rng.randf_range(-1.0, 1.0) * 0.18
		var wave := sin(phase_low) * 0.42 + sin(phase_high) * 0.18 + noise
		var sample := int(clampf(wave * env * 0.85, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = sample_rate
	stream.stereo = false
	stream.data = data
	return stream

func _fire_feedback(directed: bool) -> void:
	fire_audio.pitch_scale = 1.08 if directed else 0.92
	fire_audio.play()
	screen_flash = 0.24
	shake_left = 0.22 if directed else 0.15
	shake_power = 6.5 if directed else 4.0

func _shake_offset() -> Vector2:
	if shake_left <= 0.0:
		return Vector2.ZERO
	return Vector2(rng.randf_range(-shake_power, shake_power), rng.randf_range(-shake_power, shake_power))

func _ensure_input_map() -> void:
	_add_key_action("move_left", [KEY_A, KEY_LEFT])
	_add_key_action("move_right", [KEY_D, KEY_RIGHT])
	_add_key_action("move_up", [KEY_W, KEY_UP])
	_add_key_action("move_down", [KEY_S, KEY_DOWN])
	_add_key_action("charge", [KEY_SPACE])
	if not InputMap.has_action("charge"):
		InputMap.add_action("charge")
	var mouse := InputEventMouseButton.new()
	mouse.button_index = MOUSE_BUTTON_LEFT
	if not InputMap.action_has_event("charge", mouse):
		InputMap.action_add_event("charge", mouse)

func _add_key_action(action: StringName, keys: Array[int]) -> void:
	if not InputMap.has_action(action):
		InputMap.add_action(action)
	for key in keys:
		var event := InputEventKey.new()
		event.physical_keycode = key
		if not InputMap.action_has_event(action, event):
			InputMap.action_add_event(action, event)

func _update_hud() -> void:
	hp_bar.size.x = 110.0 * player_hp / PLAYER_MAX_HP
	var charge_ratio := charge_window_left / CHARGE_WINDOW if charge_window_left > 0.0 else charge_timer / CHARGE_PERIOD
	charge_bar.size.x = clampf(charge_ratio, 0.0, 1.0) * 110.0
	charge_bar.color = VITAMIN_YELLOW if charge_window_left > 0.0 else TOXIC_GREEN
	charge_button.modulate = Color.WHITE
	if charge_window_left > 0.0:
		charge_button.text = "지금!\n클릭/스페이스"
		charge_button.add_theme_color_override("font_color", NEON_RED)
	else:
		charge_button.text = "차징\n%.1f초" % maxf(0.0, CHARGE_PERIOD - charge_timer)
		charge_button.add_theme_color_override("font_color", INK)
	stat_label.text = "시간 %03d   레벨 %d   처치 %d   적 %d" % [int(elapsed), level, kills, enemies.size()]
	if charge_window_left > 0.0 and not paused_for_card:
		prompt_label.visible = true
		prompt_label.text = "차징 윈도우: 포인터로 조준하고 클릭/탭"
	elif not game_over and not paused_for_card:
		prompt_label.visible = false

func _draw() -> void:
	_draw_arena()
	_draw_effects_behind()
	_draw_player()
	_draw_enemies()
	_draw_effects_front()
	_draw_screen_flash()

func _draw_arena() -> void:
	draw_rect(Rect2(-ARENA_HALF, ARENA_HALF * 2.0), AD_PAPER)
	var tile := 32
	for x in range(int(-ARENA_HALF.x), int(ARENA_HALF.x) + tile, tile):
		var color := MINT_FADE if int(x / tile) % 2 == 0 else PASTEL_BEIGE
		draw_line(Vector2(x, -ARENA_HALF.y), Vector2(x, ARENA_HALF.y), color, 1.0)
	for y in range(int(-ARENA_HALF.y), int(ARENA_HALF.y) + tile, tile):
		var color := SAGE_GREEN if int(y / tile) % 2 == 0 else CORAL_PINK
		draw_line(Vector2(-ARENA_HALF.x, y), Vector2(ARENA_HALF.x, y), color, 1.0)
	for i in range(18):
		var p := Vector2((i * 83) % int(ARENA_HALF.x * 2.0) - ARENA_HALF.x, (i * 47) % int(ARENA_HALF.y * 2.0) - ARENA_HALF.y)
		draw_rect(Rect2(p, Vector2(36, 18)), LEMON_YELLOW)
		draw_rect(Rect2(p, Vector2(36, 18)), COCOA, false, 1.0)

func _draw_player() -> void:
	draw_circle(player_pos + Vector2(2, 4), 11.0, Color(0, 0, 0, 0.18))
	draw_circle(player_pos, 11.0, MINT_FADE)
	draw_circle(player_pos + Vector2(0, -2), 7.0, AD_PAPER)
	draw_circle(player_pos + Vector2(-3, -3), 1.5, INK)
	draw_circle(player_pos + Vector2(3, -3), 1.5, INK)
	draw_arc(player_pos + Vector2(0, 1), 4.0, 0.15, PI - 0.15, 10, COCOA, 1.0)
	draw_arc(player_pos, 11.0, 0.0, TAU, 28, INK, 1.0)
	if charge_ready_flash > 0.0 or charge_window_left > 0.0:
		var ratio := charge_window_left / CHARGE_WINDOW
		var pulse := 1.0 + sin(charge_open_age * 28.0) * 0.13
		draw_arc(player_pos, CHARGE_RANGE, -PI, PI, 72, Color(1.0, 0.3, 0.36, 0.28), 2.0)
		draw_arc(player_pos, 18.0 * pulse, -PI / 2.0, TAU * ratio - PI / 2.0, 32, TOXIC_GREEN, 3.0)
		draw_arc(player_pos, 25.0 + charge_open_age * 42.0, 0.0, TAU, 32, Color(1.0, 0.91, 0.25, 0.65), 2.0)
		draw_circle(player_pos, 34.0 + charge_open_age * 20.0, Color(0.62, 1.0, 0.36, 0.12))
		var aim := get_global_mouse_position() - player_pos
		if aim.length() > 18.0:
			var dir := aim.normalized()
			draw_colored_polygon(PackedVector2Array([
				player_pos,
				player_pos + dir.rotated(-0.55) * CHARGE_RANGE,
				player_pos + dir.rotated(0.55) * CHARGE_RANGE,
			]), Color(0.62, 1.0, 0.36, 0.16))

func _draw_enemies() -> void:
	for enemy in enemies:
		var pos: Vector2 = enemy["pos"]
		var elite: bool = enemy["elite"]
		var radius := float(enemy["radius"])
		draw_circle(pos + Vector2(2, 3), radius, Color(0, 0, 0, 0.14))
		draw_circle(pos, radius, CORAL_PINK if elite else LEMON_YELLOW)
		draw_circle(pos + Vector2(-3, -2), 1.7, INK)
		draw_circle(pos + Vector2(3, -2), 1.7, INK)
		draw_arc(pos + Vector2(0, 2), 4.0, 0.0, PI, 10, INK, 1.0)
		draw_circle(pos + Vector2(0, 5), 2.0, TOXIC_GREEN)
		draw_arc(pos, radius, 0.0, TAU, 24, INK, 1.0)

func _draw_effects_behind() -> void:
	for burst in bursts:
		var pos: Vector2 = burst["pos"]
		var life := float(burst["life"])
		var r := (1.0 - life / 0.28) * 54.0
		var color := TOXIC_GREEN if burst["directed"] else VITAMIN_YELLOW
		color.a = clampf(life * 3.0, 0.0, 0.75)
		draw_circle(pos, r, color)
		draw_arc(pos, r + 12.0, 0.0, TAU, 40, Color(1.0, 0.3, 0.36, color.a), 3.0)

func _draw_effects_front() -> void:
	for shot in shots:
		var color: Color = shot["color"]
		color.a = clampf(float(shot["life"]) * 12.0, 0.0, 1.0)
		draw_line(shot["from"], shot["to"], color, 2.0)
	for burst in bursts:
		var pos: Vector2 = burst["pos"]
		var directed: bool = burst["directed"]
		if directed:
			var dir: Vector2 = burst["dir"]
			var left := dir.rotated(-0.55) * 90.0
			var right := dir.rotated(0.55) * 90.0
			draw_colored_polygon(PackedVector2Array([pos, pos + left, pos + right]), Color(0.62, 1.0, 0.36, 0.25))
	for particle in particles:
		var color: Color = particle["color"]
		color.a = clampf(float(particle["life"]) * 4.0, 0.0, 1.0)
		var pos: Vector2 = particle["pos"]
		var size := float(particle["size"])
		if particle["shape"] == "star":
			_draw_star(pos, size, color)
		else:
			draw_circle(pos, size, color)
	for floater in floaters:
		draw_string(ThemeDB.get_fallback_font(), floater["pos"], floater["text"], HORIZONTAL_ALIGNMENT_CENTER, -1.0, 12, floater["color"])

func _spawn_charge_particles(origin: Vector2, dir: Vector2, directed: bool) -> void:
	var count := 42 if directed else 28
	for i in range(count):
		var spread := rng.randf_range(-0.8, 0.8) if directed else rng.randf_range(-PI, PI)
		var out_dir := dir.rotated(spread) if directed else Vector2.RIGHT.rotated(spread)
		var speed := rng.randf_range(80.0, 230.0 if directed else 170.0)
		particles.append({
			"pos": origin + out_dir * rng.randf_range(6.0, 26.0),
			"vel": out_dir * speed,
			"life": rng.randf_range(0.22, 0.55),
			"color": [TOXIC_GREEN, NEON_RED, VITAMIN_YELLOW][rng.randi_range(0, 2)],
			"size": rng.randf_range(2.0, 5.0),
			"shape": "star" if rng.randf() < 0.55 else "dot",
		})

func _spawn_hit_spark(pos: Vector2, directed: bool) -> void:
	for i in range(5 if directed else 3):
		var dir := Vector2.RIGHT.rotated(rng.randf_range(-PI, PI))
		particles.append({
			"pos": pos,
			"vel": dir * rng.randf_range(45.0, 115.0),
			"life": rng.randf_range(0.16, 0.32),
			"color": TOXIC_GREEN if directed else VITAMIN_YELLOW,
			"size": rng.randf_range(1.5, 3.5),
			"shape": "star",
		})

func _spawn_pop_particles(pos: Vector2) -> void:
	for i in range(8):
		var dir := Vector2.RIGHT.rotated(rng.randf_range(-PI, PI))
		particles.append({
			"pos": pos,
			"vel": dir * rng.randf_range(30.0, 95.0),
			"life": rng.randf_range(0.18, 0.38),
			"color": [CORAL_PINK, TOXIC_GREEN, LEMON_YELLOW][rng.randi_range(0, 2)],
			"size": rng.randf_range(1.5, 3.0),
			"shape": "dot",
		})

func _draw_star(pos: Vector2, radius: float, color: Color) -> void:
	var points := PackedVector2Array()
	for i in range(10):
		var r := radius if i % 2 == 0 else radius * 0.45
		var a := -PI / 2.0 + TAU * float(i) / 10.0
		points.append(pos + Vector2(cos(a), sin(a)) * r)
	draw_colored_polygon(points, color)

func _draw_screen_flash() -> void:
	if screen_flash <= 0.0:
		return
	var alpha := clampf(screen_flash * 2.8, 0.0, 0.38)
	draw_rect(Rect2(camera.global_position - VIEWPORT_SIZE * 0.5, VIEWPORT_SIZE), Color(1.0, 0.91, 0.25, alpha))

func _restart() -> void:
	player_pos = Vector2.ZERO
	player_hp = PLAYER_MAX_HP
	elapsed = 0.0
	xp = 0.0
	level = 1
	kills = 0
	game_over = false
	paused_for_card = false
	enemies.clear()
	shots.clear()
	bursts.clear()
	particles.clear()
	floaters.clear()
	spawn_timer = 0.0
	auto_timer = 0.0
	charge_timer = 0.0
	charge_window_left = 0.0
	charge_open_age = 0.0
	screen_flash = 0.0
	shake_left = 0.0
	prompt_label.visible = false
	card_panel.visible = false
