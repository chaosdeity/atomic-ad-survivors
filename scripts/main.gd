extends Node2D

const C := preload("res://scripts/game_config.gd")
const AudioFactory := preload("res://scripts/audio_factory.gd")
const HudController := preload("res://scripts/hud_controller.gd")
const EffectsController := preload("res://scripts/effects_controller.gd")
const EnemyController := preload("res://scripts/enemy_controller.gd")
const LevelUpCards := preload("res://scripts/level_up_cards.gd")

var player_pos := Vector2.ZERO
var player_hp := C.PLAYER_MAX_HP
var elapsed := 0.0
var xp := 0.0
var level := 1
var kills := 0
var game_over := false
var paused_for_card := false
var player_stats := {}
var offered_cards: Array[Dictionary] = []

var auto_timer := 0.0
var charge_timer := 0.0
var charge_window_left := 0.0
var charge_ready_flash := 0.0
var charge_open_age := 0.0
var charge_warning_played := false
var charge_miss_notice := 0.0

var rng := RandomNumberGenerator.new()
var camera: Camera2D
var charge_warning_audio: AudioStreamPlayer
var charge_audio: AudioStreamPlayer
var fire_audio: AudioStreamPlayer
var hit_audio: AudioStreamPlayer
var miss_audio: AudioStreamPlayer
var hud := HudController.new()
var effects := EffectsController.new()
var enemies := EnemyController.new()

func _ready() -> void:
	rng.seed = 42
	process_mode = Node.PROCESS_MODE_ALWAYS
	_reset_player_stats()
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
		effects.update(delta)
		_update_hud()
		camera.global_position = (player_pos + effects.shake_offset(rng)).round()
		queue_redraw()
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
	if paused_for_card:
		var choice := _card_choice_from_event(event)
		if choice != -1:
			_apply_card_choice(choice)
		return

	var pressed_charge := event.is_action_pressed("charge")
	if event is InputEventScreenTouch and event.pressed:
		pressed_charge = true
	if pressed_charge:
		if game_over:
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
	charge_warning_audio = AudioStreamPlayer.new()
	charge_warning_audio.stream = AudioFactory.make_double_tone_stream(360.0, 540.0, 0.22, 0.12)
	add_child(charge_warning_audio)

	charge_audio = AudioStreamPlayer.new()
	charge_audio.stream = AudioFactory.make_tone_stream(620.0, 0.24, 0.20, 1180.0)
	add_child(charge_audio)

	fire_audio = AudioStreamPlayer.new()
	fire_audio.stream = AudioFactory.make_burst_stream(0.34, rng)
	add_child(fire_audio)

	hit_audio = AudioStreamPlayer.new()
	hit_audio.stream = AudioFactory.make_tone_stream(740.0, 0.13, 0.10, 980.0)
	add_child(hit_audio)

	miss_audio = AudioStreamPlayer.new()
	miss_audio.stream = AudioFactory.make_tone_stream(280.0, 0.16, 0.11, 180.0)
	add_child(miss_audio)

func _update_player(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_pos += input_dir * _move_speed() * delta
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
	var target_idx := enemies.nearest_enemy(player_pos, _auto_range())
	if target_idx == -1:
		return
	var target_pos: Vector2 = enemies.enemies[target_idx]["pos"]
	_handle_dead_positions(enemies.damage_enemy(target_idx, _auto_damage_per_tick()))
	effects.add_auto_shot(player_pos, target_pos)

func _update_charge(delta: float) -> void:
	charge_miss_notice = maxf(0.0, charge_miss_notice - delta)
	if charge_window_left > 0.0:
		charge_window_left = maxf(0.0, charge_window_left - delta)
		charge_open_age += delta
		if charge_window_left <= 0.0:
			_charge_missed()
			charge_timer = 0.0
			charge_open_age = 0.0
			charge_warning_played = false
	else:
		charge_timer += delta
		var warning_left := _charge_period() - charge_timer
		if not charge_warning_played and warning_left <= C.CHARGE_WARNING_TIME:
			charge_warning_played = true
			effects.add_charge_warning_ring(player_pos)
			charge_warning_audio.play()
		if charge_timer >= _charge_period():
			charge_window_left = C.CHARGE_WINDOW
			charge_open_age = 0.0
			charge_warning_played = false
			charge_ready_flash = C.CHARGE_READY_FLASH
			effects.show_charge_ready()
			charge_audio.play()
	charge_ready_flash = maxf(0.0, charge_ready_flash - delta)

func _charge_missed() -> void:
	charge_miss_notice = 0.48
	effects.show_charge_missed(player_pos)
	miss_audio.play()

func _fire_charge() -> void:
	var mouse_world := get_global_mouse_position()
	var aim := mouse_world - player_pos
	var directed := aim.length() > C.CHARGE_AIM_DEADZONE
	var aim_dir := aim.normalized() if directed else Vector2.RIGHT
	var hit_indices := _charge_hit_indices(directed, aim_dir)
	var limit := _charge_target_limit(directed)
	var damage := _charge_damage(directed)

	for n in range(mini(limit, hit_indices.size())):
		var idx: int = hit_indices[n]
		if idx < enemies.enemies.size():
			effects.spawn_hit_spark(enemies.enemies[idx]["pos"], directed, rng)
			enemies.enemies[idx]["hp"] = float(enemies.enemies[idx]["hp"]) - damage

	_handle_dead_positions(enemies.cleanup_dead())
	_fire_feedback(directed)
	effects.spawn_charge_particles(player_pos, aim_dir, directed, rng)
	effects.add_burst(player_pos, aim_dir, 0.36 if directed else 0.28, directed)
	effects.add_charge_floater(player_pos, directed)
	charge_window_left = 0.0
	charge_timer = 0.0
	charge_open_age = 0.0
	charge_warning_played = false
	charge_miss_notice = 0.0

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
		xp += _xp_gain()
		effects.spawn_pop_particles(pos, rng)
		effects.add_burst(pos, Vector2.RIGHT, 0.18, false)
	if xp >= _xp_requirement():
		xp -= _xp_requirement()
		level += 1
		hit_audio.play()
		_show_level_card()

func _show_level_card() -> void:
	paused_for_card = true
	get_tree().paused = true
	offered_cards = LevelUpCards.pick_three(rng)
	hud.show_level_cards(offered_cards, Callable(self, "_apply_card_choice"))

func _apply_card_choice(index: int) -> void:
	if index < 0 or index >= offered_cards.size():
		return
	var card := offered_cards[index]
	_apply_card_effect(card)
	offered_cards.clear()
	paused_for_card = false
	get_tree().paused = false
	hud.hide_level_card()

func _apply_card_effect(card: Dictionary) -> void:
	var effect: String = card["effect"]
	var value: float = float(card["value"])
	match effect:
		"auto_damage_mult", "move_speed_mult", "charge_damage_mult", "xp_gain_mult":
			player_stats[effect] = float(player_stats[effect]) + value
		"auto_range_bonus", "charge_period_bonus":
			player_stats[effect] = float(player_stats[effect]) + value
		"charge_target_bonus":
			player_stats[effect] = int(player_stats[effect]) + int(value)
		"max_hp_bonus":
			player_stats["max_hp"] = float(player_stats["max_hp"]) + value
			player_hp = minf(float(player_stats["max_hp"]), player_hp + value)
		"heal":
			player_hp = minf(float(player_stats["max_hp"]), player_hp + value)

func _card_choice_from_event(event: InputEvent) -> int:
	if not event is InputEventKey or not event.pressed or event.echo:
		return -1
	match event.keycode:
		KEY_1, KEY_KP_1:
			return 0
		KEY_2, KEY_KP_2:
			return 1
		KEY_3, KEY_KP_3:
			return 2
		_:
			return -1

func _fire_feedback(directed: bool) -> void:
	fire_audio.pitch_scale = 1.08 if directed else 0.92
	fire_audio.play()
	effects.fire_feedback(directed)

func _update_hud() -> void:
	hud.update(player_hp, float(player_stats["max_hp"]), charge_window_left, charge_timer, _charge_period(), _charge_state(), elapsed, level, kills, enemies.enemies.size(), paused_for_card, game_over)

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
	var charge_state := _charge_state()
	var aim := get_global_mouse_position() - player_pos
	var has_aim := aim.length() > C.CHARGE_AIM_DEADZONE
	draw_circle(player_pos + Vector2(2, 4), 11.0, Color(0, 0, 0, 0.18))
	draw_circle(player_pos, 11.0, C.MINT_FADE)
	draw_circle(player_pos + Vector2(0, -2), 7.0, C.AD_PAPER)
	draw_circle(player_pos + Vector2(-3, -3), 1.5, C.INK)
	draw_circle(player_pos + Vector2(3, -3), 1.5, C.INK)
	draw_arc(player_pos + Vector2(0, 1), 4.0, 0.15, PI - 0.15, 10, C.COCOA, 1.0)
	draw_arc(player_pos, 11.0, 0.0, TAU, 28, C.INK, 1.0)
	if charge_state == "warning":
		var warning_left := maxf(0.0, _charge_period() - charge_timer)
		var warning_ratio := 1.0 - clampf(warning_left / C.CHARGE_WARNING_TIME, 0.0, 1.0)
		var pulse := 1.0 + sin(warning_ratio * PI * 5.0) * 0.12
		draw_arc(player_pos, 23.0 * pulse, -PI / 2.0, TAU * warning_ratio - PI / 2.0, 36, C.NEON_RED, 3.0)
		draw_arc(player_pos, C.CHARGE_RANGE * (0.82 + warning_ratio * 0.18), 0.0, TAU, 72, Color(1.0, 0.91, 0.25, 0.20 + warning_ratio * 0.24), 2.0)
		draw_circle(player_pos, 34.0 + warning_ratio * 15.0, Color(1.0, 0.91, 0.25, 0.08))
		if has_aim:
			var dir := aim.normalized()
			draw_colored_polygon(PackedVector2Array([
				player_pos,
				player_pos + dir.rotated(-0.46) * C.CHARGE_RANGE * 0.74,
				player_pos + dir.rotated(0.46) * C.CHARGE_RANGE * 0.74,
			]), Color(1.0, 0.91, 0.25, 0.11))
	elif charge_ready_flash > 0.0 or charge_window_left > 0.0:
		var ratio := charge_window_left / C.CHARGE_WINDOW
		var pulse := 1.0 + sin(charge_open_age * 28.0) * 0.13
		var focus_color := Color(0.62, 1.0, 0.36, 0.22) if has_aim else Color(1.0, 0.91, 0.25, 0.20)
		draw_arc(player_pos, C.CHARGE_RANGE, -PI, PI, 72, Color(1.0, 0.3, 0.36, 0.32), 3.0)
		draw_arc(player_pos, 18.0 * pulse, -PI / 2.0, TAU * ratio - PI / 2.0, 32, C.TOXIC_GREEN if has_aim else C.VITAMIN_YELLOW, 4.0)
		draw_arc(player_pos, 25.0 + charge_open_age * 42.0, 0.0, TAU, 32, Color(1.0, 0.91, 0.25, 0.70), 2.0)
		draw_circle(player_pos, 34.0 + charge_open_age * 20.0, focus_color)
		if has_aim:
			var dir := aim.normalized()
			draw_colored_polygon(PackedVector2Array([
				player_pos,
				player_pos + dir.rotated(-0.55) * C.CHARGE_RANGE,
				player_pos + dir.rotated(0.55) * C.CHARGE_RANGE,
			]), Color(0.62, 1.0, 0.36, 0.22))
			draw_line(player_pos, player_pos + dir * C.CHARGE_RANGE, Color(1.0, 0.3, 0.36, 0.78), 3.0)
			draw_arc(player_pos, C.CHARGE_RANGE * 0.58, -0.55 + dir.angle(), 0.55 + dir.angle(), 28, C.TOXIC_GREEN, 3.0)

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
	get_tree().paused = false
	_reset_player_stats()
	player_pos = Vector2.ZERO
	player_hp = float(player_stats["max_hp"])
	elapsed = 0.0
	xp = 0.0
	level = 1
	kills = 0
	game_over = false
	paused_for_card = false
	offered_cards.clear()
	auto_timer = 0.0
	charge_timer = 0.0
	charge_window_left = 0.0
	charge_open_age = 0.0
	charge_ready_flash = 0.0
	charge_warning_played = false
	charge_miss_notice = 0.0
	enemies.clear()
	effects.clear()
	hud.reset()

func _reset_player_stats() -> void:
	player_stats = {
		"max_hp": C.PLAYER_MAX_HP,
		"move_speed_mult": 0.0,
		"auto_damage_mult": 0.0,
		"auto_range_bonus": 0.0,
		"charge_damage_mult": 0.0,
		"charge_target_bonus": 0,
		"charge_period_bonus": 0.0,
		"xp_gain_mult": 0.0,
	}

func _move_speed() -> float:
	return C.PLAYER_SPEED * (1.0 + float(player_stats["move_speed_mult"]))

func _auto_range() -> float:
	return C.AUTO_RANGE + float(player_stats["auto_range_bonus"])

func _auto_damage_per_tick() -> float:
	return C.BASE_DPS * (1.0 + float(player_stats["auto_damage_mult"])) * C.AUTO_TICK

func _charge_period() -> float:
	return maxf(1.2, C.CHARGE_PERIOD + float(player_stats["charge_period_bonus"]))

func _charge_state() -> String:
	if charge_window_left > 0.0:
		return "open"
	if charge_miss_notice > 0.0:
		return "missed"
	if _charge_period() - charge_timer <= C.CHARGE_WARNING_TIME:
		return "warning"
	return "cooldown"

func _charge_target_limit(directed: bool) -> int:
	var base_limit := C.DIRECTED_AOE_TARGETS if directed else C.CHARGE_AOE_TARGETS
	return base_limit + int(player_stats["charge_target_bonus"])

func _charge_damage(directed: bool) -> float:
	var directed_mult := C.DIRECTED_BONUS if directed else 1.0
	return C.CHARGE_DAMAGE * directed_mult * (1.0 + float(player_stats["charge_damage_mult"]))

func _xp_gain() -> float:
	return 1.0 * (1.0 + float(player_stats["xp_gain_mult"]))

func _xp_requirement() -> float:
	return level * 10.0
