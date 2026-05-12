extends Node2D

const C := preload("res://scripts/game_config.gd")
const AudioFactory := preload("res://scripts/audio_factory.gd")
const HudController := preload("res://scripts/hud_controller.gd")
const EffectsController := preload("res://scripts/effects_controller.gd")
const EnemyController := preload("res://scripts/enemy_controller.gd")

var player_pos := Vector2.ZERO
var player_hp := C.PLAYER_MAX_HP
var elapsed := 0.0
var xp := 0.0
var level := 1
var kills := 0
var game_over := false
var paused_for_card := false

var auto_timer := 0.0
var charge_timer := 0.0
var charge_window_left := 0.0
var charge_ready_flash := 0.0
var charge_open_age := 0.0

var rng := RandomNumberGenerator.new()
var camera: Camera2D
var charge_audio: AudioStreamPlayer
var fire_audio: AudioStreamPlayer
var hit_audio: AudioStreamPlayer
var hud := HudController.new()
var effects := EffectsController.new()
var enemies := EnemyController.new()

func _ready() -> void:
	rng.seed = 42
	_ensure_input_map()
	_build_camera()
	_build_audio()
	hud.build(self)
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
	enemies.update_spawning(delta, elapsed, player_pos, rng)
	_update_enemies(delta)
	_update_auto_fire(delta)
	_update_charge(delta)
	effects.update(delta)
	_update_hud()
	camera.global_position = (player_pos + effects.shake_offset(rng)).round()
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

func _build_camera() -> void:
	camera = Camera2D.new()
	camera.position_smoothing_enabled = false
	camera.zoom = Vector2.ONE
	add_child(camera)
	camera.make_current()

func _build_audio() -> void:
	charge_audio = AudioStreamPlayer.new()
	charge_audio.stream = AudioFactory.make_tone_stream(520.0, 0.32, 0.18, 920.0)
	add_child(charge_audio)

	fire_audio = AudioStreamPlayer.new()
	fire_audio.stream = AudioFactory.make_burst_stream(0.34, rng)
	add_child(fire_audio)

	hit_audio = AudioStreamPlayer.new()
	hit_audio.stream = AudioFactory.make_tone_stream(740.0, 0.13, 0.10, 980.0)
	add_child(hit_audio)

func _update_player(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_pos += input_dir * C.PLAYER_SPEED * delta
	player_pos.x = clampf(player_pos.x, -C.ARENA_HALF.x, C.ARENA_HALF.x)
	player_pos.y = clampf(player_pos.y, -C.ARENA_HALF.y, C.ARENA_HALF.y)

func _update_enemies(delta: float) -> void:
	var contact_damage := enemies.update_enemies(delta, player_pos)
	if contact_damage <= 0.0:
		return
	player_hp = maxf(0.0, player_hp - contact_damage)
	if player_hp <= 0.0:
		game_over = true
		hud.show_game_over()

func _update_auto_fire(delta: float) -> void:
	auto_timer -= delta
	if auto_timer > 0.0:
		return
	auto_timer = C.AUTO_TICK
	var target_idx := enemies.nearest_enemy(player_pos, C.AUTO_RANGE)
	if target_idx == -1:
		return
	var target_pos: Vector2 = enemies.enemies[target_idx]["pos"]
	_handle_dead_positions(enemies.damage_enemy(target_idx, C.BASE_DPS * C.AUTO_TICK))
	effects.add_auto_shot(player_pos, target_pos)

func _update_charge(delta: float) -> void:
	if charge_window_left > 0.0:
		charge_window_left = maxf(0.0, charge_window_left - delta)
		charge_open_age += delta
		if charge_window_left <= 0.0:
			charge_timer = 0.0
			charge_open_age = 0.0
	else:
		charge_timer += delta
		if charge_timer >= C.CHARGE_PERIOD:
			charge_window_left = C.CHARGE_WINDOW
			charge_open_age = 0.0
			charge_ready_flash = 0.22
			effects.show_charge_ready()
			charge_audio.play()
	charge_ready_flash = maxf(0.0, charge_ready_flash - delta)

func _fire_charge() -> void:
	var mouse_world := get_global_mouse_position()
	var aim := mouse_world - player_pos
	var directed := aim.length() > 18.0
	var aim_dir := aim.normalized() if directed else Vector2.RIGHT
	var hit_indices := _charge_hit_indices(directed, aim_dir)
	var limit := C.DIRECTED_AOE_TARGETS if directed else C.CHARGE_AOE_TARGETS
	var damage := C.CHARGE_DAMAGE * (C.DIRECTED_BONUS if directed else 1.0)

	for n in range(mini(limit, hit_indices.size())):
		var idx: int = hit_indices[n]
		if idx < enemies.enemies.size():
			effects.spawn_hit_spark(enemies.enemies[idx]["pos"], directed, rng)
			enemies.enemies[idx]["hp"] = float(enemies.enemies[idx]["hp"]) - damage

	_handle_dead_positions(enemies.cleanup_dead())
	_fire_feedback(directed)
	effects.spawn_charge_particles(player_pos, aim_dir, directed, rng)
	effects.add_burst(player_pos, aim_dir, 0.28, directed)
	effects.add_charge_floater(player_pos, directed)
	charge_window_left = 0.0
	charge_timer = 0.0

func _charge_hit_indices(directed: bool, aim_dir: Vector2) -> Array[int]:
	var hit_indices: Array[int] = []
	for i in range(enemies.enemies.size()):
		var to_enemy: Vector2 = enemies.enemies[i]["pos"] - player_pos
		var dist := to_enemy.length()
		if dist > C.CHARGE_RANGE:
			continue
		if directed and to_enemy.normalized().dot(aim_dir) < C.DIRECTED_ARC_COS:
			continue
		hit_indices.append(i)

	hit_indices.sort_custom(func(a: int, b: int) -> bool:
		return player_pos.distance_squared_to(enemies.enemies[a]["pos"]) < player_pos.distance_squared_to(enemies.enemies[b]["pos"])
	)
	return hit_indices

func _handle_dead_positions(dead_positions: Array[Vector2]) -> void:
	for pos in dead_positions:
		kills += 1
		xp += 1.0
		effects.spawn_pop_particles(pos, rng)
		effects.add_burst(pos, Vector2.RIGHT, 0.18, false)
	if xp >= level * 10.0:
		xp = 0.0
		level += 1
		hit_audio.play()
		_show_level_card()

func _show_level_card() -> void:
	paused_for_card = true
	hud.show_level_card()

func _apply_card_choice() -> void:
	paused_for_card = false
	hud.hide_level_card()
	player_hp = minf(C.PLAYER_MAX_HP, player_hp + 18.0)

func _fire_feedback(directed: bool) -> void:
	fire_audio.pitch_scale = 1.08 if directed else 0.92
	fire_audio.play()
	effects.fire_feedback(directed)

func _update_hud() -> void:
	hud.update(player_hp, charge_window_left, charge_timer, elapsed, level, kills, enemies.enemies.size(), paused_for_card, game_over)

func _draw() -> void:
	_draw_arena()
	effects.draw_behind(self)
	_draw_player()
	_draw_enemies()
	effects.draw_front(self)
	effects.draw_screen_flash(self, camera.global_position)

func _draw_arena() -> void:
	draw_rect(Rect2(-C.ARENA_HALF, C.ARENA_HALF * 2.0), C.AD_PAPER)
	var tile := 32
	for x in range(int(-C.ARENA_HALF.x), int(C.ARENA_HALF.x) + tile, tile):
		var color := C.MINT_FADE if int(x / tile) % 2 == 0 else C.PASTEL_BEIGE
		draw_line(Vector2(x, -C.ARENA_HALF.y), Vector2(x, C.ARENA_HALF.y), color, 1.0)
	for y in range(int(-C.ARENA_HALF.y), int(C.ARENA_HALF.y) + tile, tile):
		var color := C.SAGE_GREEN if int(y / tile) % 2 == 0 else C.CORAL_PINK
		draw_line(Vector2(-C.ARENA_HALF.x, y), Vector2(C.ARENA_HALF.x, y), color, 1.0)
	for i in range(18):
		var p := Vector2((i * 83) % int(C.ARENA_HALF.x * 2.0) - C.ARENA_HALF.x, (i * 47) % int(C.ARENA_HALF.y * 2.0) - C.ARENA_HALF.y)
		draw_rect(Rect2(p, Vector2(36, 18)), C.LEMON_YELLOW)
		draw_rect(Rect2(p, Vector2(36, 18)), C.COCOA, false, 1.0)

func _draw_player() -> void:
	draw_circle(player_pos + Vector2(2, 4), 11.0, Color(0, 0, 0, 0.18))
	draw_circle(player_pos, 11.0, C.MINT_FADE)
	draw_circle(player_pos + Vector2(0, -2), 7.0, C.AD_PAPER)
	draw_circle(player_pos + Vector2(-3, -3), 1.5, C.INK)
	draw_circle(player_pos + Vector2(3, -3), 1.5, C.INK)
	draw_arc(player_pos + Vector2(0, 1), 4.0, 0.15, PI - 0.15, 10, C.COCOA, 1.0)
	draw_arc(player_pos, 11.0, 0.0, TAU, 28, C.INK, 1.0)
	if charge_ready_flash > 0.0 or charge_window_left > 0.0:
		var ratio := charge_window_left / C.CHARGE_WINDOW
		var pulse := 1.0 + sin(charge_open_age * 28.0) * 0.13
		draw_arc(player_pos, C.CHARGE_RANGE, -PI, PI, 72, Color(1.0, 0.3, 0.36, 0.28), 2.0)
		draw_arc(player_pos, 18.0 * pulse, -PI / 2.0, TAU * ratio - PI / 2.0, 32, C.TOXIC_GREEN, 3.0)
		draw_arc(player_pos, 25.0 + charge_open_age * 42.0, 0.0, TAU, 32, Color(1.0, 0.91, 0.25, 0.65), 2.0)
		draw_circle(player_pos, 34.0 + charge_open_age * 20.0, Color(0.62, 1.0, 0.36, 0.12))
		var aim := get_global_mouse_position() - player_pos
		if aim.length() > 18.0:
			var dir := aim.normalized()
			draw_colored_polygon(PackedVector2Array([
				player_pos,
				player_pos + dir.rotated(-0.55) * C.CHARGE_RANGE,
				player_pos + dir.rotated(0.55) * C.CHARGE_RANGE,
			]), Color(0.62, 1.0, 0.36, 0.16))

func _draw_enemies() -> void:
	for enemy in enemies.enemies:
		var pos: Vector2 = enemy["pos"]
		var elite: bool = enemy["elite"]
		var radius := float(enemy["radius"])
		draw_circle(pos + Vector2(2, 3), radius, Color(0, 0, 0, 0.14))
		draw_circle(pos, radius, C.CORAL_PINK if elite else C.LEMON_YELLOW)
		draw_circle(pos + Vector2(-3, -2), 1.7, C.INK)
		draw_circle(pos + Vector2(3, -2), 1.7, C.INK)
		draw_arc(pos + Vector2(0, 2), 4.0, 0.0, PI, 10, C.INK, 1.0)
		draw_circle(pos + Vector2(0, 5), 2.0, C.TOXIC_GREEN)
		draw_arc(pos, radius, 0.0, TAU, 24, C.INK, 1.0)

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

func _restart() -> void:
	player_pos = Vector2.ZERO
	player_hp = C.PLAYER_MAX_HP
	elapsed = 0.0
	xp = 0.0
	level = 1
	kills = 0
	game_over = false
	paused_for_card = false
	auto_timer = 0.0
	charge_timer = 0.0
	charge_window_left = 0.0
	charge_open_age = 0.0
	charge_ready_flash = 0.0
	enemies.clear()
	effects.clear()
	hud.reset()
