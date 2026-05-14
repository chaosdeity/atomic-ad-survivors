extends Node2D

const C := preload("res://scripts/game_config.gd")
const AudioFactory := preload("res://scripts/audio_factory.gd")
const HudController := preload("res://scripts/hud_controller.gd")
const EffectsController := preload("res://scripts/effects_controller.gd")
const EnemyController := preload("res://scripts/enemy_controller.gd")
const LevelUpCards := preload("res://scripts/level_up_cards.gd")
const WaveDirector := preload("res://scripts/wave_director.gd")
const DebugTools := preload("res://scripts/debug_tools.gd")
const SpriteAssets := preload("res://scripts/sprite_assets.gd")

const FIRST_RECALL_WARNING_TIME := 70.0
const FIRST_RECALL_SURGE_TIME := 88.0
const FIRST_RECALL_COLLAPSE_TIME := 108.0

var player_pos := Vector2.ZERO
var player_hp := C.PLAYER_MAX_HP
var elapsed := 0.0
var xp := 0.0
var level := 1
var kills := 0
var match_state := "playing"
var game_over := false
var paused_for_card := false
var player_stats := {}
var offered_cards: Array[Dictionary] = []
var selected_card_count := 0
var peak_enemy_count := 0
var mid_event_triggered := false
var wave_notice_timer := 0.0
var wave_notice_text := ""
var first_sortie := true
var first_recall_done := false
var recall_event_stage := 0
var recall_pressure_spawn_timer := 0.0

var auto_timer := 0.0
var charge_timer := 0.0
var charge_window_left := 0.0
var charge_ready_flash := 0.0
var charge_open_age := 0.0
var charge_warning_played := false
var charge_miss_notice := 0.0
var last_move_dir := Vector2.DOWN
var player_is_moving := false
var auto_shot_counter := 0
var charge_puddles: Array[Dictionary] = []

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
var debug_tools := DebugTools.new()
var sprite_assets := SpriteAssets.new()

func _ready() -> void:
	rng.seed = 42
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	process_mode = Node.PROCESS_MODE_ALWAYS
	_reset_player_stats()
	_ensure_input_map()
	_build_camera()
	_build_audio()
	sprite_assets.load_all()
	hud.build(self)
	set_process(true)

func _process(delta: float) -> void:
	if match_state == "game_over" or match_state == "victory" or match_state == "recalled" or match_state == "supply":
		effects.update(delta)
		_update_hud()
		camera.global_position = (player_pos + effects.shake_offset(rng)).round()
		queue_redraw()
		if Input.is_action_just_pressed("charge"):
			_handle_terminal_action()
		return
	if paused_for_card:
		effects.update(delta)
		_update_hud()
		camera.global_position = (player_pos + effects.shake_offset(rng)).round()
		queue_redraw()
		return

	elapsed += delta
	_update_first_recall_event(delta)
	_check_victory()
	if match_state == "victory" or match_state == "recalled":
		effects.update(delta)
		_update_hud()
		camera.global_position = (player_pos + effects.shake_offset(rng)).round()
		queue_redraw()
		return
	wave_notice_timer = maxf(0.0, wave_notice_timer - delta)
	_update_player(delta)
	var wave_params := WaveDirector.params_for_time(elapsed)
	enemies.update_spawning(delta, elapsed, player_pos, rng, wave_params)
	_update_wave_events(wave_params)
	_update_enemies(delta)
	peak_enemy_count = maxi(peak_enemy_count, enemies.enemies.size())
	_update_auto_fire(delta)
	_update_charge(delta)
	_update_charge_puddles(delta)
	effects.update(delta)
	_update_hud()
	camera.global_position = (player_pos + effects.shake_offset(rng)).round()
	queue_redraw()

func _input(event: InputEvent) -> void:
	if debug_tools.handle_input(event, self):
		_update_hud()
		return

	if paused_for_card:
		var choice := _card_choice_from_event(event)
		if choice != -1:
			_apply_card_choice(choice)
		return

	var pressed_charge := event.is_action_pressed("charge")
	if event is InputEventScreenTouch and event.pressed:
		pressed_charge = true
	if pressed_charge:
		if match_state == "game_over" or match_state == "victory" or match_state == "recalled" or match_state == "supply":
			_handle_terminal_action()
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
	player_is_moving = input_dir.length_squared() > 0.0
	if player_is_moving:
		last_move_dir = input_dir
	player_pos += input_dir * _move_speed() * delta
	player_pos.x = clampf(player_pos.x, -C.ARENA_HALF.x, C.ARENA_HALF.x)
	player_pos.y = clampf(player_pos.y, -C.ARENA_HALF.y, C.ARENA_HALF.y)

func _update_enemies(delta: float) -> void:
	var contact_damage := enemies.update_enemies(delta, player_pos)
	if contact_damage <= 0.0:
		return
	player_hp = maxf(0.0, player_hp - contact_damage)
	if player_hp <= 0.0:
		_finish_match("recalled" if _first_recall_active() else "game_over")

func _update_auto_fire(delta: float) -> void:
	auto_timer -= delta
	if auto_timer > 0.0:
		return
	auto_timer = C.AUTO_TICK
	var target_idx := enemies.nearest_enemy(player_pos, _auto_range())
	if target_idx == -1:
		return
	var target_pos: Vector2 = enemies.enemies[target_idx]["pos"]
	var damage := _auto_damage_per_tick()
	var hit := enemies.apply_damage(target_idx, damage, "auto")
	if not hit.is_empty():
		effects.add_damage_number(Vector2(hit["pos"]), float(hit["damage"]), "auto", String(hit["effectiveness"]))
	_handle_dead_positions(enemies.cleanup_dead())
	effects.add_auto_shot(player_pos, target_pos)
	if paused_for_card:
		return
	_try_split_shot(target_idx)

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

func _update_charge_puddles(delta: float) -> void:
	for puddle in charge_puddles:
		puddle["life"] = float(puddle["life"]) - delta
		puddle["tick"] = float(puddle.get("tick", 0.0)) + delta
		if float(puddle["tick"]) < 0.16:
			continue
		var tick_delta := float(puddle["tick"])
		puddle["tick"] = 0.0
		puddle["display_tick"] = float(puddle.get("display_tick", 0.0)) + tick_delta
		var center: Vector2 = puddle["pos"]
		var damage := float(puddle["dps"]) * tick_delta
		var hit_enemies := enemies.damage_enemies_in_radius_with_hits(center, float(puddle["radius"]), damage, -1, "puddle")
		if float(puddle["display_tick"]) >= 0.32:
			puddle["display_tick"] = 0.0
			for n in range(mini(6, hit_enemies.size())):
				effects.add_damage_number(Vector2(hit_enemies[n]["pos"]), float(hit_enemies[n]["damage"]), "puddle", String(hit_enemies[n]["effectiveness"]))
		_handle_dead_positions(enemies.cleanup_dead())
	charge_puddles = charge_puddles.filter(func(puddle: Dictionary) -> bool: return float(puddle["life"]) > 0.0)

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
	var perfect := _is_perfect_charge()
	if perfect:
		damage *= 1.0 + 0.25 * float(player_stats["perfect_charge_level"])
		limit += 2 * int(player_stats["perfect_charge_level"])
	if _emergency_charge_active():
		damage *= 1.0 + 0.25 * float(player_stats["emergency_charge_level"])

	var hit_count := 0
	var damage_type := "focused" if directed else "charge"
	for n in range(mini(limit, hit_indices.size())):
		var idx: int = hit_indices[n]
		if idx < enemies.enemies.size():
			var hit_pos: Vector2 = enemies.enemies[idx]["pos"]
			effects.spawn_hit_spark(hit_pos, directed, rng)
			var hit := enemies.apply_damage(idx, damage, damage_type)
			effects.add_damage_number(hit_pos, float(hit["damage"]), damage_type, String(hit["effectiveness"]))
			_apply_charge_hit_modifiers(idx, directed, aim_dir)
			hit_count += 1

	_handle_dead_positions(enemies.cleanup_dead())
	_apply_charge_aftereffects(hit_count, directed, aim_dir, perfect)
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

func _try_split_shot(primary_idx: int) -> void:
	var split_level := int(player_stats["split_shot_level"])
	if split_level <= 0:
		return
	auto_shot_counter += 1
	var cadence := maxi(2, 5 - split_level)
	if auto_shot_counter % cadence != 0:
		return
	var secondary_idx := enemies.nearest_enemy_excluding(player_pos, _auto_range() + 30.0 + split_level * 10.0, [primary_idx])
	if secondary_idx == -1:
		return
	var target_pos: Vector2 = enemies.enemies[secondary_idx]["pos"]
	var split_damage := _auto_damage_per_tick() * minf(0.85, 0.55 + 0.10 * split_level)
	var hit := enemies.apply_damage(secondary_idx, split_damage, "auto")
	if not hit.is_empty():
		effects.add_damage_number(target_pos, float(hit["damage"]), "auto", String(hit["effectiveness"]))
	_handle_dead_positions(enemies.cleanup_dead())
	effects.add_alt_shot(player_pos, target_pos)
	effects.add_status_ring(target_pos, C.TOXIC_GREEN, 14.0, 0.24)
	effects.add_floater(target_pos, "분열!", C.TOXIC_GREEN, 14)

func _try_kill_burst(pos: Vector2) -> Array[Vector2]:
	var burst_level := int(player_stats["kill_burst_level"])
	var dead_positions: Array[Vector2] = []
	if burst_level <= 0:
		return dead_positions
	var chance := minf(0.85, 0.25 * burst_level)
	if rng.randf() > chance:
		return dead_positions
	var radius := 58.0 + 8.0 * burst_level
	var max_targets := 1 + mini(2, burst_level)
	var damage := 22.0 + 8.0 * burst_level
	var hit_enemies := enemies.damage_enemies_in_radius_with_hits(pos, radius, damage, max_targets, "burst")
	if hit_enemies.size() > 0:
		for hit in hit_enemies:
			effects.add_damage_number(Vector2(hit["pos"]), float(hit["damage"]), "burst", String(hit["effectiveness"]))
		effects.add_small_burst(pos)
		effects.add_status_ring(pos, C.CORAL_PINK, radius, 0.34)
		effects.add_floater(pos, "연쇄!", C.CORAL_PINK, 14)
		dead_positions = enemies.cleanup_dead()
	return dead_positions

func _apply_charge_hit_modifiers(idx: int, directed: bool, aim_dir: Vector2) -> void:
	var slow_level := int(player_stats["charge_slow_level"])
	if slow_level > 0:
		var slow_mult := maxf(0.20, 0.58 - 0.08 * slow_level)
		enemies.apply_slow(idx, 1.0 + 0.25 * slow_level, slow_mult)
		effects.add_status_ring(enemies.enemies[idx]["pos"], C.TOXIC_GREEN, 13.0, 0.28)
	var knockback_level := int(player_stats["charge_knockback_level"])
	if knockback_level > 0:
		var from_pos: Vector2 = enemies.enemies[idx]["pos"]
		var dir := aim_dir if directed else Vector2(enemies.enemies[idx]["pos"] - player_pos).normalized()
		enemies.knockback_enemy(idx, dir, 18.0 + 10.0 * knockback_level)
		var to_pos: Vector2 = enemies.enemies[idx]["pos"]
		effects.add_impact_line(from_pos, to_pos, C.NEON_RED)

func _apply_charge_aftereffects(hit_count: int, directed: bool, aim_dir: Vector2, perfect: bool) -> void:
	if perfect:
		effects.add_floater(player_pos + Vector2(0, -8), "완벽!", C.VITAMIN_YELLOW, 18)
		effects.add_status_ring(player_pos, C.VITAMIN_YELLOW, 34.0, 0.38)
	if _emergency_charge_active():
		effects.add_floater(player_pos, "역송출!", C.NEON_RED, 14)
	if int(player_stats["charge_slow_level"]) > 0 and hit_count > 0:
		effects.add_floater(player_pos + Vector2(16, -8), "오류!", C.TOXIC_GREEN, 14)
	_spawn_charge_puddle(directed, aim_dir)
	_try_charge_heal(hit_count)

func _spawn_charge_puddle(directed: bool, aim_dir: Vector2) -> void:
	var puddle_level := int(player_stats["charge_puddle_level"])
	if puddle_level <= 0:
		return
	var pos := player_pos + (aim_dir * C.CHARGE_RANGE * 0.62 if directed else Vector2.ZERO)
	charge_puddles.append({
		"pos": pos,
		"radius": 42.0 + 6.0 * puddle_level,
		"dps": 17.0 + 6.0 * puddle_level,
		"life": 2.0 + 0.25 * puddle_level,
		"duration": 2.0 + 0.25 * puddle_level,
		"tick": 0.0,
		"display_tick": 0.0,
	})
	while charge_puddles.size() > 2 + puddle_level:
		charge_puddles.pop_front()
	effects.add_status_ring(pos, C.TOXIC_GREEN, 42.0 + 6.0 * puddle_level, 0.42)
	effects.add_floater(pos, "잔류!", C.TOXIC_GREEN, 14)

func _try_charge_heal(hit_count: int) -> void:
	var heal_level := int(player_stats["charge_heal_level"])
	if heal_level <= 0:
		return
	var threshold := maxi(3, 6 - heal_level)
	if hit_count < threshold:
		return
	var heal_amount := 3.0 + 2.0 * heal_level
	player_hp = minf(float(player_stats["max_hp"]), player_hp + heal_amount)
	effects.add_damage_number(player_pos, heal_amount, "heal")
	effects.add_floater(player_pos + Vector2(-16, -8), "회복!", C.TOXIC_GREEN, 14)

func _is_perfect_charge() -> bool:
	return int(player_stats["perfect_charge_level"]) > 0 and charge_open_age <= 0.25

func _emergency_charge_active() -> bool:
	return int(player_stats["emergency_charge_level"]) > 0 and player_hp <= float(player_stats["max_hp"]) * 0.30

func _handle_dead_positions(dead_positions: Array[Vector2]) -> void:
	_handle_dead_positions_internal(dead_positions, true)

func _handle_dead_positions_internal(dead_positions: Array[Vector2], allow_kill_bursts: bool) -> void:
	var burst_dead_positions: Array[Vector2] = []
	for pos in dead_positions:
		kills += 1
		xp += _xp_gain()
		effects.spawn_pop_particles(pos, rng)
		effects.add_burst(pos, Vector2.RIGHT, 0.18, false)
		if allow_kill_bursts:
			burst_dead_positions.append_array(_try_kill_burst(pos))
	if burst_dead_positions.size() > 0:
		_handle_dead_positions_internal(burst_dead_positions, false)
	if xp >= _xp_requirement():
		xp -= _xp_requirement()
		level += 1
		hit_audio.play()
		_show_level_card()

func _update_wave_events(wave_params: Dictionary) -> void:
	if _first_recall_active():
		return
	if not mid_event_triggered and elapsed >= WaveDirector.MID_EVENT_TIME:
		mid_event_triggered = true
		enemies.spawn_elite_group(4, elapsed, player_pos, rng, wave_params)
		peak_enemy_count = maxi(peak_enemy_count, enemies.enemies.size())
		_show_wave_notice("대형 광고 마스코트 진입")
	elif WaveDirector.is_finale(elapsed) and wave_notice_timer <= 0.0:
		_show_wave_notice("피날레: 마지막 광고 공세")

func _show_wave_notice(text: String) -> void:
	wave_notice_text = text
	wave_notice_timer = 2.8

func _update_first_recall_event(delta: float) -> void:
	if not _first_recall_active():
		return
	if recall_event_stage < 1 and elapsed >= FIRST_RECALL_WARNING_TIME:
		recall_event_stage = 1
		_show_wave_notice("캠페인 압력이 비정상 상승")
		effects.add_status_ring(player_pos, C.NEON_RED, 58.0, 0.55)
		effects.add_floater(player_pos, "압력 상승", C.NEON_RED, 15)
	elif recall_event_stage < 2 and elapsed >= FIRST_RECALL_SURGE_TIME:
		recall_event_stage = 2
		recall_pressure_spawn_timer = 0.0
		_show_wave_notice("캠페인 신호 붕괴: 생체 한계 초과")
		effects.add_status_ring(player_pos, C.VITAMIN_YELLOW, 78.0, 0.65)
		effects.add_floater(player_pos, "신호 붕괴!", C.VITAMIN_YELLOW, 16)
		_spawn_recall_pressure(72)
	if recall_event_stage >= 2:
		_apply_first_recall_collapse(delta)
	if recall_event_stage < 3 and elapsed >= FIRST_RECALL_COLLAPSE_TIME:
		recall_event_stage = 3
		_finish_match("recalled")

func _first_recall_active() -> bool:
	return first_sortie and not first_recall_done and match_state == "playing"

func _apply_first_recall_collapse(delta: float) -> void:
	recall_pressure_spawn_timer -= delta
	if recall_pressure_spawn_timer <= 0.0:
		recall_pressure_spawn_timer = 2.2
		_spawn_recall_pressure(18)
		effects.add_status_ring(player_pos, C.NEON_RED, 92.0, 0.42)
	var collapse_ratio := clampf((elapsed - FIRST_RECALL_SURGE_TIME) / maxf(0.1, FIRST_RECALL_COLLAPSE_TIME - FIRST_RECALL_SURGE_TIME), 0.0, 1.0)
	var pressure_dps := lerpf(10.0, 34.0, collapse_ratio)
	player_hp = maxf(0.0, player_hp - pressure_dps * delta)
	if rng.randf() < delta * 1.8:
		effects.add_floater(player_pos + Vector2(rng.randf_range(-18.0, 18.0), rng.randf_range(-8.0, 8.0)), "회수 임계", C.NEON_RED, 12)
	if player_hp <= 0.0:
		recall_event_stage = 3
		_finish_match("recalled")

func _spawn_recall_pressure(count: int) -> void:
	var wave_params := WaveDirector.params_for_time(maxf(elapsed, 150.0))
	wave_params["spawn_count_min"] = 7
	wave_params["spawn_count_max"] = 10
	wave_params["elite_chance"] = 0.48
	wave_params["speed_mult"] = float(wave_params.get("speed_mult", 1.0)) * 1.45
	wave_params["hp_mult"] = float(wave_params.get("hp_mult", 1.0)) * 1.35
	wave_params["contact_damage_mult"] = float(wave_params.get("contact_damage_mult", 1.0)) * 1.35
	wave_params["role_weights"] = {"basic": 0.12, "fast": 0.34, "tank": 0.26, "signal": 0.28}
	for i in range(maxi(0, mini(count, C.ENEMY_CAP - enemies.enemies.size()))):
		enemies.spawn_enemy(elapsed, player_pos, rng, wave_params)
	peak_enemy_count = maxi(peak_enemy_count, enemies.enemies.size())

func _check_victory() -> void:
	if match_state == "playing" and elapsed >= C.MATCH_DURATION:
		elapsed = C.MATCH_DURATION
		_finish_match("victory")

func _finish_match(result_state: String) -> void:
	match_state = result_state
	game_over = result_state == "game_over"
	paused_for_card = false
	if is_inside_tree():
		get_tree().paused = false
	offered_cards.clear()
	hud.hide_level_card()
	var callback := Callable(self, "_restart")
	if result_state == "recalled":
		callback = Callable(self, "_show_supply_depot")
	hud.show_result_screen(_result_data(result_state), callback)

func _result_data(result_state: String) -> Dictionary:
	if result_state == "recalled":
		return {
			"result": "긴급 회수",
			"description": "캠페인 신호에 삼켜지기 직전, 침묵 보급소가 당신을 끌어냈습니다.",
			"trace": "찢어진 광고 전단",
			"button_text": "보급소로 돌아가기",
			"prompt": "스페이스 / 클릭으로 보급소 이동",
			"survival_time": elapsed,
			"level": level,
			"kills": kills,
			"card_count": selected_card_count,
			"peak_enemy_count": peak_enemy_count,
			"final_enemy_count": enemies.enemies.size(),
		}
	return {
		"result": "SURVIVED" if result_state == "victory" else "GAME OVER",
		"survival_time": elapsed,
		"level": level,
		"kills": kills,
		"card_count": selected_card_count,
		"peak_enemy_count": peak_enemy_count,
		"final_enemy_count": enemies.enemies.size(),
	}

func _show_supply_depot() -> void:
	match_state = "supply"
	game_over = false
	first_recall_done = true
	first_sortie = false
	paused_for_card = false
	if is_inside_tree():
		get_tree().paused = false
	hud.show_supply_depot(Callable(self, "_restart"))

func _handle_terminal_action() -> void:
	match match_state:
		"recalled":
			_show_supply_depot()
		"supply":
			_restart()
		_:
			_restart()

func _show_level_card() -> void:
	if match_state != "playing":
		return
	match_state = "level_up"
	paused_for_card = true
	if is_inside_tree():
		get_tree().paused = true
	offered_cards = LevelUpCards.pick_three(rng)
	hud.show_level_cards(offered_cards, Callable(self, "_apply_card_choice"))

func _apply_card_choice(index: int) -> void:
	if index < 0 or index >= offered_cards.size():
		return
	var card := offered_cards[index]
	_apply_card_effect(card)
	selected_card_count += 1
	offered_cards.clear()
	match_state = "playing"
	paused_for_card = false
	if is_inside_tree():
		get_tree().paused = false
	hud.hide_level_card()

func _apply_card_effect(card: Dictionary) -> void:
	var effect: String = card["effect"]
	var value: float = float(card["value"])
	match effect:
		"auto_damage_mult":
			player_stats[effect] = float(player_stats[effect]) + value
			player_stats["auto_range_bonus"] = float(player_stats["auto_range_bonus"]) + 8.0
			auto_timer = 0.0
			if int(player_stats["split_shot_level"]) > 0:
				auto_shot_counter = maxi(auto_shot_counter, maxi(0, 4 - int(player_stats["split_shot_level"])))
				effects.add_floater(player_pos + Vector2(0, -10), "분열 증폭!", C.TOXIC_GREEN, 13)
			effects.add_floater(player_pos, "문구 강화!", C.NEON_RED, 13)
		"xp_gain_mult":
			player_stats[effect] = float(player_stats[effect]) + value
			var instant_xp := minf(_xp_requirement() * 0.35, 4.0 + float(level) * 1.5)
			xp = minf(_xp_requirement() - 0.1, xp + instant_xp)
			effects.add_floater(player_pos, "학습 완료!", C.VITAMIN_YELLOW, 13)
		"move_speed_mult", "charge_damage_mult":
			player_stats[effect] = float(player_stats[effect]) + value
		"auto_range_bonus", "charge_period_bonus":
			player_stats[effect] = float(player_stats[effect]) + value
		"charge_target_bonus":
			player_stats[effect] = int(player_stats[effect]) + int(value)
		"split_shot_level", "kill_burst_level", "charge_puddle_level", "perfect_charge_level", "emergency_charge_level", "charge_slow_level", "charge_heal_level", "charge_knockback_level":
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
	var terminal_state := match_state == "game_over" or match_state == "victory" or match_state == "recalled" or match_state == "supply"
	hud.update(player_hp, float(player_stats["max_hp"]), charge_window_left, charge_timer, _charge_period(), _charge_state(), elapsed, C.MATCH_DURATION, level, kills, enemies.enemies.size(), paused_for_card, terminal_state, wave_notice_text if wave_notice_timer > 0.0 else "")
	hud.set_debug_text(_debug_overlay_text())

func _debug_overlay_text() -> String:
	if not C.DEBUG_TOOLS_ENABLED:
		return ""
	var sections: Array[String] = []
	var help := debug_tools.help_text()
	if help != "":
		sections.append(help)
	var detail := debug_tools.detail_text(_debug_info())
	if detail != "":
		sections.append(detail)
	return "\n\n".join(sections)

func _debug_info() -> Dictionary:
	var wave_params := WaveDirector.params_for_time(elapsed)
	return {
		"match_state": match_state,
		"elapsed": elapsed,
		"match_duration": C.MATCH_DURATION,
		"wave_name": wave_params["name"],
		"enemy_count": enemies.enemies.size(),
		"enemy_cap": C.ENEMY_CAP,
		"player_hp": player_hp,
		"max_hp": float(player_stats["max_hp"]),
		"level": level,
		"xp": xp,
		"charge_state": _charge_state(),
		"charge_timer": charge_timer,
		"charge_period": _charge_period(),
		"charge_window_left": charge_window_left,
		"selected_card_count": selected_card_count,
		"mid_event_triggered": mid_event_triggered,
		"first_sortie": first_sortie,
		"first_recall_done": first_recall_done,
		"recall_stage": recall_event_stage,
		"fps": Engine.get_frames_per_second(),
	}

func _debug_force_level_up() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	_show_level_card()

func _debug_open_charge() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	charge_timer = _charge_period()
	charge_window_left = C.CHARGE_WINDOW
	charge_open_age = 0.0
	charge_warning_played = false
	charge_ready_flash = C.CHARGE_READY_FLASH
	charge_miss_notice = 0.0
	effects.show_charge_ready()
	charge_audio.play()

func _debug_drop_hp() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	player_hp = minf(player_hp, 20.0)

func _debug_jump_time(seconds: float) -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	elapsed = clampf(seconds, 0.0, C.MATCH_DURATION)
	if elapsed >= WaveDirector.MID_EVENT_TIME:
		mid_event_triggered = true
	if WaveDirector.is_finale(elapsed):
		_show_wave_notice("피날레: 마지막 광고 공세")
	enemies.spawn_timer = 0.0
	_check_victory()

func _debug_force_victory() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	elapsed = C.MATCH_DURATION
	_finish_match("victory")

func _debug_force_game_over() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	player_hp = 0.0
	_finish_match("game_over")

func _debug_clear_enemies() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	enemies.clear()

func _debug_spawn_swarm() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	var wave_params := WaveDirector.params_for_time(elapsed)
	var count := mini(24, C.ENEMY_CAP - enemies.enemies.size())
	for i in range(count):
		enemies.spawn_enemy(elapsed, player_pos, rng, wave_params)
	peak_enemy_count = maxi(peak_enemy_count, enemies.enemies.size())

func _draw() -> void:
	_draw_arena()
	_draw_charge_puddles()
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

func _draw_charge_puddles() -> void:
	for puddle in charge_puddles:
		var ratio := float(puddle["life"]) / maxf(0.001, float(puddle["duration"]))
		var pos: Vector2 = puddle["pos"]
		var radius := float(puddle["radius"])
		var pulse := 0.86 + 0.10 * sin(elapsed * 10.0)
		draw_circle(pos, radius, Color(0.62, 1.0, 0.36, 0.18 + 0.12 * ratio))
		draw_arc(pos, radius, 0.0, TAU, 40, Color(0.62, 1.0, 0.36, 0.56 * ratio), 3.0)
		draw_arc(pos, radius * pulse, 0.0, TAU, 32, Color(1.0, 0.3, 0.36, 0.42 * ratio), 2.5)

func _draw_player() -> void:
	var charge_state := _charge_state()
	var aim := get_global_mouse_position() - player_pos
	var has_aim := aim.length() > C.CHARGE_AIM_DEADZONE
	draw_circle(player_pos + Vector2(2, 4), 11.0, Color(0, 0, 0, 0.18))
	var player_frame := int(elapsed * 6.0) % 2 if player_is_moving else 0
	if not sprite_assets.draw_player(self, player_pos, _player_sprite_row(), player_frame):
		sprite_assets.draw_player_fallback(self, player_pos)
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
		var radius := float(enemy["radius"])
		draw_circle(pos + Vector2(2, 3), radius, Color(0, 0, 0, 0.14))
		_draw_enemy_role_marker(enemy)
		_draw_enemy_defense_marker(enemy)
		var enemy_frame := int(float(enemy.get("age", elapsed)) * 5.0) % 2
		if not sprite_assets.draw_enemy(self, enemy, enemy_frame):
			sprite_assets.draw_enemy_fallback(self, enemy)
		_draw_enemy_hit_feedback(enemy)

func _draw_enemy_hit_feedback(enemy: Dictionary) -> void:
	var hit_flash := float(enemy.get("hit_flash", 0.0))
	if hit_flash <= 0.0:
		return
	var duration := maxf(0.001, float(enemy.get("hit_flash_duration", 0.12)))
	var ratio := clampf(hit_flash / duration, 0.0, 1.0)
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	var heavy := bool(enemy.get("elite", false)) or String(enemy.get("role", "basic")) == "tank"
	var flash_color := Color(1.0, 0.96, 0.72, 0.32 * ratio)
	if heavy:
		flash_color = Color(1.0, 0.91, 0.25, 0.38 * ratio)
	draw_circle(pos, radius + (3.0 if heavy else 1.5), flash_color)
	draw_arc(pos, radius + (6.0 if heavy else 4.0), 0.0, TAU, 28, Color(1.0, 1.0, 0.86, 0.82 * ratio), 2.5 if heavy else 1.8)
	if float(enemy.get("hp", 0.0)) < float(enemy.get("max_hp", 0.0)):
		_draw_enemy_hit_hp_bar(enemy, ratio)

func _draw_enemy_hit_hp_bar(enemy: Dictionary, alpha_ratio: float) -> void:
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	var width := 25.0 if bool(enemy.get("elite", false)) else 18.0
	var height := 3.0
	var hp_ratio := clampf(float(enemy["hp"]) / maxf(0.001, float(enemy["max_hp"])), 0.0, 1.0)
	var top_left := pos + Vector2(-width * 0.5, -radius - 12.0)
	draw_rect(Rect2(top_left, Vector2(width, height)), Color(0.08, 0.06, 0.05, 0.58 * alpha_ratio))
	draw_rect(Rect2(top_left, Vector2(width * hp_ratio, height)), Color(0.62, 1.0, 0.36, 0.86 * alpha_ratio))

func _draw_enemy_role_marker(enemy: Dictionary) -> void:
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	var role := String(enemy.get("role", "basic"))
	if bool(enemy.get("elite", false)):
		var pulse := 0.82 + 0.10 * sin(elapsed * 7.0)
		draw_circle(pos, radius + 9.0, Color(1.0, 0.3, 0.36, 0.16))
		draw_arc(pos, (radius + 10.0) * pulse, 0.0, TAU, 36, C.NEON_RED, 3.0)
		draw_arc(pos, radius + 16.0, -PI * 0.22, PI * 1.22, 28, C.VITAMIN_YELLOW, 2.5)
	if bool(enemy.get("aura_boosted", false)):
		draw_arc(pos, radius + 5.0, 0.0, TAU, 24, Color(1.0, 0.3, 0.36, 0.45), 1.5)
	match role:
		"fast":
			draw_arc(pos, radius + 3.0, -0.8, 0.8, 12, C.NEON_RED, 2.0)
			draw_line(pos + Vector2(-radius, -radius), pos + Vector2(-radius - 7.0, -radius - 2.0), C.NEON_RED, 2.0)
		"tank":
			draw_arc(pos, radius + 4.0, 0.0, TAU, 28, C.COCOA, 2.5)
			draw_circle(pos, radius + 2.0, Color(0.0, 0.0, 0.0, 0.08))
		"signal":
			var aura_alpha := 0.16 + 0.06 * sin(elapsed * 5.0)
			draw_circle(pos, 92.0, Color(1.0, 0.91, 0.25, aura_alpha))
			draw_arc(pos, 92.0, 0.0, TAU, 42, Color(1.0, 0.3, 0.36, 0.38), 2.0)
			draw_arc(pos, radius + 5.0, 0.0, TAU, 24, C.VITAMIN_YELLOW, 2.5)

func _draw_enemy_defense_marker(enemy: Dictionary) -> void:
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	var defense := String(enemy.get("defense_type", "normal"))
	var color := _defense_color(defense)
	if defense != "normal":
		draw_arc(pos, radius + 7.0, PI * 0.18, PI * 0.82, 12, color, 2.0)
		draw_arc(pos, radius + 7.0, PI * 1.18, PI * 1.82, 12, color, 2.0)
	var icon_pos := pos + Vector2(radius + 3.0, -radius - 3.0)
	match defense:
		"anti_auto":
			draw_rect(Rect2(icon_pos - Vector2(3, 3), Vector2(6, 6)), color)
			draw_line(icon_pos + Vector2(-5, 4), icon_pos + Vector2(5, -4), C.INK, 1.5)
		"anti_charge":
			draw_arc(icon_pos, 5.0, -PI * 0.35, PI * 1.35, 12, color, 2.0)
			draw_line(icon_pos + Vector2(-4, 4), icon_pos + Vector2(5, -5), C.INK, 1.5)
		"plated":
			draw_colored_polygon(PackedVector2Array([
				icon_pos + Vector2(0, -5),
				icon_pos + Vector2(5, -1),
				icon_pos + Vector2(3, 5),
				icon_pos + Vector2(-3, 5),
				icon_pos + Vector2(-5, -1),
			]), color)
		"exposed_core":
			draw_circle(icon_pos, 5.0, color)
			draw_circle(icon_pos, 2.0, C.NEON_RED)

func _defense_color(defense: String) -> Color:
	match defense:
		"anti_auto":
			return Color(0.62, 0.68, 0.72, 0.90)
		"anti_charge":
			return Color(0.35, 0.70, 0.95, 0.90)
		"plated":
			return Color(0.74, 0.64, 0.48, 0.92)
		"exposed_core":
			return Color(0.62, 1.0, 0.36, 0.95)
		_:
			return Color(1.0, 0.96, 0.72, 0.70)

func _player_sprite_row() -> int:
	if absf(last_move_dir.x) > absf(last_move_dir.y):
		return 2 if last_move_dir.x > 0.0 else 1
	return 0 if last_move_dir.y >= 0.0 else 3

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
	if is_inside_tree():
		get_tree().paused = false
	_reset_player_stats()
	player_pos = Vector2.ZERO
	player_hp = float(player_stats["max_hp"])
	elapsed = 0.0
	xp = 0.0
	level = 1
	kills = 0
	match_state = "playing"
	game_over = false
	paused_for_card = false
	offered_cards.clear()
	selected_card_count = 0
	peak_enemy_count = 0
	mid_event_triggered = false
	recall_event_stage = 0
	recall_pressure_spawn_timer = 0.0
	wave_notice_timer = 0.0
	wave_notice_text = ""
	auto_timer = 0.0
	auto_shot_counter = 0
	charge_timer = 0.0
	charge_window_left = 0.0
	charge_open_age = 0.0
	charge_ready_flash = 0.0
	charge_warning_played = false
	charge_miss_notice = 0.0
	enemies.clear()
	effects.clear()
	charge_puddles.clear()
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
		"split_shot_level": 0,
		"kill_burst_level": 0,
		"charge_puddle_level": 0,
		"perfect_charge_level": 0,
		"emergency_charge_level": 0,
		"charge_slow_level": 0,
		"charge_heal_level": 0,
		"charge_knockback_level": 0,
	}

func _move_speed() -> float:
	return C.PLAYER_SPEED * (1.0 + float(player_stats["move_speed_mult"]))

func _auto_range() -> float:
	return C.AUTO_RANGE + float(player_stats["auto_range_bonus"])

func _auto_damage_per_tick() -> float:
	return C.BASE_DPS * (1.0 + float(player_stats["auto_damage_mult"])) * C.AUTO_TICK

func _charge_period() -> float:
	var emergency_bonus := -0.45 * float(player_stats["emergency_charge_level"]) if _emergency_charge_active() else 0.0
	return maxf(1.2, C.CHARGE_PERIOD + float(player_stats["charge_period_bonus"]) + emergency_bonus)

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
