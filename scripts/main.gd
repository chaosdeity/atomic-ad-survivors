extends Node2D

const C := preload("res://scripts/game_config.gd")
const UIFont := preload("res://scripts/ui_font.gd")
const AudioFactory := preload("res://scripts/audio_factory.gd")
const HudController := preload("res://scripts/hud_controller.gd")
const EffectsController := preload("res://scripts/effects_controller.gd")
const EnemyController := preload("res://scripts/enemy_controller.gd")
const LevelUpCards := preload("res://scripts/level_up_cards.gd")
const WaveDirector := preload("res://scripts/wave_director.gd")
const DebugTools := preload("res://scripts/debug_tools.gd")
const SpriteAssets := preload("res://scripts/sprite_assets.gd")
const MetaProgression := preload("res://scripts/meta_progression.gd")
const RoutePhraseResolver := preload("res://scripts/route_phrase_resolver.gd")
const BossController := preload("res://scripts/boss_controller.gd")
const RunResultEvaluator := preload("res://scripts/run_result_evaluator.gd")
const R01MapController := preload("res://scripts/r01_map_controller.gd")
const R01LayoutBlockout := preload("res://scripts/r01_layout_blockout.gd")
const R01CampaignMap := preload("res://scripts/r01_campaign_map.gd")
const OutpostLayoutBlockout := preload("res://scripts/outpost_layout_blockout.gd")

const FIRST_RECALL_WARNING_TIME := 70.0
const FIRST_RECALL_SURGE_TIME := 88.0
const FIRST_RECALL_COLLAPSE_TIME := 108.0
const THREAT_PRESSURE_RING := "pressure_ring"
const THREAT_FLYER_DROP := "flyer_drop"
const PRESSURE_RING_WARNING := 1.08
const PRESSURE_RING_LINGER := 0.34
const PRESSURE_RING_RADIUS := 72.0
const PRESSURE_RING_DAMAGE := 15.0
const PRESSURE_RING_KNOCKBACK := 28.0
const FLYER_DROP_WARNING := 0.82
const FLYER_DROP_LINGER := 0.30
const FLYER_DROP_RADIUS := 42.0
const FLYER_DROP_DAMAGE := 10.0
const ENTRY_CAMERA_PAN_DURATION := 1.2
const CHARGE_WEAPON_RETURN_STAMP := "return_stamp"
const CHARGE_WEAPONS := [
	{"id": CHARGE_WEAPON_RETURN_STAMP, "name": "반품 도장", "label": "관통 표식"},
]
const RETURN_STAMP_RANGE := 248.0
const RETURN_STAMP_DURATION := 5.0
const RETURN_STAMP_WIDTH := 10.0
const RETURN_STAMP_AUTO_PRIORITY_RANGE_BONUS := 48.0
const CONTAMINATION_MARK_LABEL_DISTANCE := 150.0
const CONTAMINATION_MARK_LABEL_ENEMY_LIMIT := 7
const MAX_PENDING_KILL_CONTEXTS := 32
const BOSS_SIGNAL_LABELS := {
	"none": "없음",
	"faint": "미약함",
	"detected": "감지됨",
	"near": "근접",
	"silent": "침묵",
}
const TERMINAL_STATES := ["game_over", "victory", "recalled", "boss_victory"]
const AUDIT_SEGMENTS := [
	{"time": 30.0, "name": "정상 고객 예비 감사", "threshold": 120.0, "pass": "첫 기준 통과", "fail": "검문 로봇 증원"},
	{"time": 60.0, "name": "전단 확산 감사", "threshold": 260.0, "pass": "태그 후보 판정 안정", "fail": "적 밀도 상승"},
	{"time": 90.0, "name": "오픈하우스 방문 감사", "threshold": 520.0, "pass": "수신태그 후보 노출", "fail": "오픈하우스 압력 상승"},
	{"time": 120.0, "name": "가족 적합성 감사", "threshold": 1000.0, "pass": "카드 시너지 안정", "fail": "빠른 검수 로봇 등장"},
	{"time": 150.0, "name": "정산 예비 감사", "threshold": 1800.0, "pass": "후보 승인률 보정", "fail": "후보 보류율 상승"},
	{"time": 180.0, "name": "모델하우스 신호 감사", "threshold": 3200.0, "pass": "신호 위치 표시", "fail": "회수선 안정도 감소"},
	{"time": 240.0, "name": "재심사 절차", "threshold": 6000.0, "pass": "심층 귀환 보정", "fail": "포위형 웨이브"},
	{"time": 300.0, "name": "결절 예비 감사", "threshold": 10000.0, "pass": "모델하우스 접근 암시", "fail": "강제 인양 위험"},
]
const ENEMY_DENSITY_UI_CULL_START := 115
const ENEMY_DENSITY_UI_HEAVY := 170
const DAMAGE_NUMBER_DENSE_START := 145
const DAMAGE_NUMBER_DENSE_NEAR_RADIUS := 18.0
const NODE_PRESSURE_CUE_START := 22.0
const NODE_PRESSURE_CUE_INTERVAL := 26.0

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
var sortie_index := 1
var preboss_signal_event_stage := 0
var boss_signal_state := "none"
var boss_signal_unlocked := false
var boss_result_reason := ""
var last_boss_recall_report := {}
var last_boss_victory_report := {}
var last_run_result := {}
var current_supply_actions: Array[Dictionary] = []
var last_supply_reaction_line := ""
var last_supply_action_surface := ""
var r01_visit_recorded_sortie_index := 0
var current_r01_node_id := R01CampaignMap.NODE_L01
var selected_r01_node_id := R01CampaignMap.NODE_L01
var last_completed_r01_node_id := ""
var r01_campaign_node_states := {}
var r01_campaign_map_open := false
var r01_campaign_new_signal_node_ids: Array[String] = []
var r01_zone_times := {}
var open_house_signal_stage := 0
var audit_segment_index := 0
var audit_processing := 0.0
var audit_total_processing := 0.0
var audit_pass_count := 0
var audit_fail_count := 0
var audit_pressure_level := 0
var audit_last_result := "대기"
var audit_segment_results: Array[Dictionary] = []
var card_contribution_log := {}
var playtest_metrics := {}

var auto_timer := 0.0
var charge_timer := 0.0
var charge_window_left := 0.0
var charge_ready_flash := 0.0
var charge_open_age := 0.0
var charge_warning_played := false
var charge_miss_notice := 0.0
var last_move_dir := Vector2.DOWN
var player_is_moving := false
var attack_pose_timer := 0.0
var attack_pose_dir := Vector2.RIGHT
var hurt_feedback_cooldown := 0.0
var auto_shot_counter := 0
var charge_puddles: Array[Dictionary] = []
var charge_effect_anchor := Vector2.ZERO
var charge_effect_anchor_active := false
var pending_kill_burst_contexts: Array[Dictionary] = []
var active_threats: Array[Dictionary] = []
var pressure_ring_timer := 0.0
var flyer_drop_timer := 0.0
var last_threat_label := ""
var node_pressure_cue_timer := 0.0
var entry_camera_offset := Vector2.ZERO
var entry_camera_timer := 0.0

var rng := RandomNumberGenerator.new()
var camera: Camera2D
var charge_warning_audio: AudioStreamPlayer
var charge_audio: AudioStreamPlayer
var fire_audio: AudioStreamPlayer
var hit_audio: AudioStreamPlayer
var miss_audio: AudioStreamPlayer
var sfx_players := {}
var sfx_last_played := {}
var sfx_cooldowns := {}
var music_players := {}
var current_music := ""
var audio_cleaned_up := false
var hud := HudController.new()
var effects := EffectsController.new()
var enemies := EnemyController.new()
var debug_tools := DebugTools.new()
var sprite_assets := SpriteAssets.new()
var meta_progression := MetaProgression.new()
var boss := BossController.new()
var r01_map := R01MapController.new()
var r01_blockout := R01LayoutBlockout.new()
var outpost_blockout := OutpostLayoutBlockout.new()

func _ready() -> void:
	rng.seed = 42
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	process_mode = Node.PROCESS_MODE_ALWAYS
	_reset_player_stats()
	_reset_r01_campaign_state()
	_ensure_input_map()
	_build_camera()
	r01_blockout.reset()
	if R01LayoutBlockout.ENABLED:
		r01_blockout.configure_camera(camera)
		enemies.configure_world(R01LayoutBlockout.WORLD_BOUNDS, Callable(r01_blockout, "enemy_spawn_position"))
		player_pos = _r01_campaign_start_position(current_r01_node_id)
		_arm_entry_camera_for_node(current_r01_node_id)
		r01_blockout.print_probe()
	_build_audio()
	if _audio_runtime_enabled():
		_set_music("amb_r01_suburb_loop")
	sprite_assets.load_all()
	hud.build(self)
	r01_map.reset(elapsed, true)
	_sync_r01_map_to_player_zone(false)
	_reset_r01_run_tracking()
	_reset_audit_run_tracking()
	_reset_playtest_metrics()
	_mark_current_campaign_node_visited()
	_record_r01_visit_for_current_sortie()
	set_process(true)

func _process(delta: float) -> void:
	entry_camera_timer = maxf(0.0, entry_camera_timer - delta)
	if match_state == "game_over" or match_state == "victory" or match_state == "recalled" or match_state == "boss_victory" or match_state == "supply":
		r01_map.update(delta, elapsed, false)
		effects.update(delta)
		_update_hud()
		camera.global_position = _camera_target_position().round()
		queue_redraw()
		if match_state != "supply" and Input.is_action_just_pressed("charge"):
			_handle_terminal_action()
		return
	if paused_for_card:
		r01_map.update(delta, elapsed, false)
		effects.update(delta)
		_update_hud()
		camera.global_position = _camera_target_position().round()
		queue_redraw()
		return

	elapsed += delta
	_update_r01_zone(delta)
	_update_audit_director(delta)
	_update_playtest_runtime_metrics()
	_update_first_recall_event(delta)
	_update_preboss_signal_events()
	_try_start_boss_encounter()
	_check_victory()
	if match_state == "victory" or match_state == "recalled" or match_state == "boss_victory":
		effects.update(delta)
		_update_hud()
		camera.global_position = _camera_target_position().round()
		queue_redraw()
		return
	wave_notice_timer = maxf(0.0, wave_notice_timer - delta)
	attack_pose_timer = maxf(0.0, attack_pose_timer - delta)
	hurt_feedback_cooldown = maxf(0.0, hurt_feedback_cooldown - delta)
	_update_player(delta)
	var wave_params := _wave_params_for_elapsed(elapsed)
	if not boss.active:
		enemies.update_spawning(delta, elapsed, player_pos, rng, wave_params)
		_update_wave_events(wave_params)
		_update_campaign_node_pressure_cues(delta, wave_params)
	_update_enemies(delta)
	_update_charge_marks(delta)
	_update_threats(delta)
	if match_state == "game_over" or match_state == "recalled" or match_state == "boss_victory":
		effects.update(delta)
		_update_hud()
		camera.global_position = _camera_target_position().round()
		queue_redraw()
		return
	_update_boss(delta)
	peak_enemy_count = maxi(peak_enemy_count, enemies.enemies.size())
	_update_auto_fire(delta)
	_update_charge(delta)
	_update_charge_puddles(delta)
	effects.update(delta)
	_update_hud()
	camera.global_position = _camera_target_position().round()
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

	if match_state == "supply":
		if _handle_campaign_map_input(event):
			return
		if _campaign_map_open_key(event):
			_open_r01_campaign_map()
			return
		var upgrade_choice := _supply_choice_from_event(event)
		if upgrade_choice != -1:
			_apply_supply_choice(upgrade_choice)
			return
		if event is InputEventKey and event.is_action_pressed("charge"):
			_handle_terminal_action()
			return

	var pressed_charge := event.is_action_pressed("charge")
	if event is InputEventScreenTouch and event.pressed:
		pressed_charge = true
	if pressed_charge:
		if match_state == "game_over" or match_state == "victory" or match_state == "recalled" or match_state == "boss_victory" or match_state == "supply":
			_handle_terminal_action()
		elif charge_window_left > 0.0:
			_fire_charge()

func _campaign_map_open_key(event: InputEvent) -> bool:
	if not event is InputEventKey or not event.pressed or event.echo:
		return false
	return event.keycode == KEY_M or event.keycode == KEY_TAB

func _handle_campaign_map_input(event: InputEvent) -> bool:
	if not r01_campaign_map_open:
		return false
	if not event is InputEventKey:
		return true
	if not event.pressed or event.echo:
		return true
	match event.keycode:
		KEY_ESCAPE:
			_close_r01_campaign_map()
			return true
		KEY_ENTER, KEY_KP_ENTER:
			_sortie_selected_r01_campaign_node()
			return true
		KEY_1, KEY_KP_1:
			_select_r01_campaign_node(R01CampaignMap.NODE_L01)
			return true
		KEY_2, KEY_KP_2:
			_select_r01_campaign_node(R01CampaignMap.NODE_L02)
			return true
		KEY_3, KEY_KP_3:
			_select_r01_campaign_node(R01CampaignMap.NODE_L03)
			return true
		KEY_4, KEY_KP_4:
			_select_r01_campaign_node(R01CampaignMap.NODE_L04)
			return true
		KEY_5, KEY_KP_5:
			_select_r01_campaign_node(R01CampaignMap.NODE_L05)
			return true
		KEY_M, KEY_TAB:
			_close_r01_campaign_map()
			return true
		_:
			return true

func _exit_tree() -> void:
	_cleanup_audio_players()

func _cleanup_audio_players() -> void:
	if audio_cleaned_up:
		return
	audio_cleaned_up = true
	var players: Array[AudioStreamPlayer] = []
	var seen := {}
	for player in sfx_players.values():
		if player is AudioStreamPlayer and is_instance_valid(player):
			var id: int = player.get_instance_id()
			if not seen.has(id):
				seen[id] = true
				players.append(player)
	for player in music_players.values():
		if player is AudioStreamPlayer and is_instance_valid(player):
			var id: int = player.get_instance_id()
			if not seen.has(id):
				seen[id] = true
				players.append(player)
	for player in players:
		player.stop()
		player.stream = null
		if player.get_parent() == self:
			remove_child(player)
		player.free()
	sfx_players.clear()
	sfx_last_played.clear()
	sfx_cooldowns.clear()
	music_players.clear()
	current_music = ""
	charge_warning_audio = null
	charge_audio = null
	fire_audio = null
	hit_audio = null
	miss_audio = null

func _charge_weapon_id() -> String:
	return CHARGE_WEAPON_RETURN_STAMP

func _charge_weapon_name() -> String:
	return "반품 도장"

func _charge_weapon_label() -> String:
	return "관통 표식"

func _charge_weapon_color() -> Color:
	return C.NEON_RED

func _build_camera() -> void:
	camera = Camera2D.new()
	camera.position_smoothing_enabled = false
	camera.zoom = Vector2.ONE
	add_child(camera)
	camera.make_current()

func _camera_target_position() -> Vector2:
	var entry_offset := Vector2.ZERO
	if entry_camera_timer > 0.0:
		var ratio := clampf(entry_camera_timer / ENTRY_CAMERA_PAN_DURATION, 0.0, 1.0)
		entry_offset = entry_camera_offset * ratio * ratio
	return player_pos + entry_offset + effects.shake_offset(rng)

func _build_audio() -> void:
	var sfx_rng := RandomNumberGenerator.new()
	sfx_rng.seed = 7022026
	charge_warning_audio = _register_sfx_player("charge_warning", AudioFactory.make_double_tone_stream(360.0, 540.0, 0.22, 0.12), -15.0, 0.80)
	charge_audio = _register_sfx_player("return_stamp_ready", AudioFactory.make_sfx_stream("return_stamp_ready", sfx_rng), -11.5, 0.34)
	fire_audio = _register_sfx_player("return_stamp_hit", AudioFactory.make_sfx_stream("return_stamp_hit", sfx_rng), -10.5, 0.12)
	hit_audio = _register_sfx_player("xp_pickup", AudioFactory.make_sfx_stream("xp_pickup", sfx_rng), -16.0, 0.10)
	miss_audio = _register_sfx_player("return_stamp_whiff", AudioFactory.make_sfx_stream("return_stamp_whiff", sfx_rng), -12.5, 0.20)
	var definitions := [
		{"name": "auto_fire", "volume_db": -19.0, "cooldown": 0.16},
		{"name": "enemy_hit", "volume_db": -21.0, "cooldown": 0.095},
		{"name": "enemy_kill", "volume_db": -16.0, "cooldown": 0.12},
		{"name": "return_stamp_mark", "volume_db": -15.5, "cooldown": 0.055},
		{"name": "return_stamp_expire", "volume_db": -18.0, "cooldown": 0.18},
		{"name": "return_stamp_combo", "volume_db": -11.5, "cooldown": 0.18},
		{"name": "speaker_pulse", "volume_db": -15.0, "cooldown": 0.75},
		{"name": "charger_warn", "volume_db": -13.0, "cooldown": 0.42},
		{"name": "charger_dash", "volume_db": -14.5, "cooldown": 0.28},
		{"name": "pressure_ring", "volume_db": -14.0, "cooldown": 1.00},
		{"name": "pressure_ring_hit", "volume_db": -12.0, "cooldown": 0.45},
		{"name": "danger_flyer_drop", "volume_db": -16.0, "cooldown": 0.55},
		{"name": "danger_flyer_hit", "volume_db": -13.5, "cooldown": 0.30},
		{"name": "outpost_return", "volume_db": -13.5, "cooldown": 0.50},
		{"name": "upgrade_buy", "volume_db": -12.0, "cooldown": 0.18},
		{"name": "result_settle", "volume_db": -13.0, "cooldown": 0.50},
		{"name": "boss_warning", "volume_db": -12.5, "cooldown": 0.65},
		{"name": "boss_hit", "volume_db": -17.0, "cooldown": 0.16},
		{"name": "boss_core_expose", "volume_db": -11.5, "cooldown": 0.35},
	]
	for definition in definitions:
		_register_sfx_player(String(definition["name"]), AudioFactory.make_sfx_stream(String(definition["name"]), sfx_rng), float(definition["volume_db"]), float(definition["cooldown"]))
	_register_music_player("amb_r01_suburb_loop", AudioFactory.make_placeholder_loop_stream("amb_r01_suburb_loop", sfx_rng), -30.0)
	_register_music_player("amb_outpost_loop", AudioFactory.make_placeholder_loop_stream("amb_outpost_loop", sfx_rng), -31.5)
	_register_music_player("bgm_boss_smile_home", AudioFactory.make_placeholder_loop_stream("bgm_boss_smile_home", sfx_rng), -27.5)

func _register_sfx_player(name: String, stream: AudioStream, volume_db: float, cooldown: float) -> AudioStreamPlayer:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.volume_db = volume_db
	add_child(player)
	sfx_players[name] = player
	sfx_cooldowns[name] = cooldown
	return player

func _register_music_player(name: String, stream: AudioStream, volume_db: float) -> AudioStreamPlayer:
	var player := AudioStreamPlayer.new()
	player.stream = stream
	player.volume_db = volume_db
	add_child(player)
	music_players[name] = player
	return player

func _set_music(name: String) -> void:
	if not _audio_runtime_enabled():
		return
	if current_music == name:
		return
	for music_name in music_players:
		var player: AudioStreamPlayer = music_players[music_name]
		if String(music_name) == name:
			if not player.playing:
				player.play()
		else:
			player.stop()
	current_music = name

func _audio_runtime_enabled() -> bool:
	return DisplayServer.get_name() != "headless"

func _play_sfx(name: String, pitch_scale: float = 1.0, cooldown_override: float = -1.0) -> void:
	if not sfx_players.has(name):
		return
	var now := float(Time.get_ticks_msec()) * 0.001
	var cooldown := cooldown_override if cooldown_override >= 0.0 else float(sfx_cooldowns.get(name, 0.0))
	if now - float(sfx_last_played.get(name, -999.0)) < cooldown:
		return
	var player: AudioStreamPlayer = sfx_players[name]
	player.pitch_scale = pitch_scale
	player.play()
	sfx_last_played[name] = now

func _update_player(delta: float) -> void:
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	player_is_moving = input_dir.length_squared() > 0.0
	if player_is_moving:
		last_move_dir = input_dir
	var old_pos := player_pos
	player_pos += input_dir * _move_speed() * delta
	if R01LayoutBlockout.ENABLED:
		player_pos = r01_blockout.resolve_player_position(old_pos, player_pos, C.PLAYER_RADIUS)
	_clamp_player_to_world()

func _clamp_player_to_world() -> void:
	if R01LayoutBlockout.ENABLED:
		player_pos = r01_blockout.clamp_player_position(player_pos)
		return
	player_pos.x = clampf(player_pos.x, -C.ARENA_HALF.x, C.ARENA_HALF.x)
	player_pos.y = clampf(player_pos.y, -C.ARENA_HALF.y, C.ARENA_HALF.y)

func _update_enemies(delta: float) -> void:
	var old_positions: Array[Vector2] = []
	if R01LayoutBlockout.ENABLED:
		for enemy in enemies.enemies:
			old_positions.append(Vector2(enemy["pos"]))
	var contact_damage := enemies.update_enemies(delta, player_pos)
	if R01LayoutBlockout.ENABLED:
		_apply_r01_enemy_navigation(old_positions, delta)
	else:
		enemies.apply_separation(delta)
	_update_special_enemy_sfx()
	if contact_damage <= 0.0:
		return
	player_hp = maxf(0.0, player_hp - _incoming_damage(contact_damage))
	if hurt_feedback_cooldown <= 0.0:
		hurt_feedback_cooldown = 0.32
		effects.add_impact_shake(0.10, 2.8)
		effects.add_status_ring(player_pos, C.NEON_RED, 18.0, 0.20)
		var contact_hint := enemies.contact_hint()
		if contact_hint != "":
			effects.add_floater(player_pos + Vector2(0, -18), contact_hint, C.NEON_RED, 12)
	if player_hp <= 0.0:
		if boss.active:
			boss_result_reason = "boss_recall"
			boss.active = false
			boss.state = "recall_escape"
			_finish_match("recalled")
		else:
			_finish_match("recalled" if _first_recall_active() else "game_over")

func _apply_r01_enemy_navigation(old_positions: Array[Vector2], delta: float) -> void:
	var count := mini(old_positions.size(), enemies.enemies.size())
	for i in range(count):
		var enemy := enemies.enemies[i]
		var role := _enemy_navigation_role(enemy)
		enemy["pos"] = r01_blockout.resolve_enemy_position(old_positions[i], Vector2(enemy["pos"]), role, float(enemy.get("radius", 8.0)))
	enemies.apply_separation(delta, Callable(self, "_resolve_enemy_separation_position"))

func _resolve_enemy_separation_position(old_pos: Vector2, proposed_pos: Vector2, enemy: Dictionary) -> Vector2:
	return r01_blockout.resolve_enemy_position(old_pos, proposed_pos, _enemy_navigation_role(enemy), float(enemy.get("radius", 8.0)))

func _enemy_navigation_role(enemy: Dictionary) -> String:
	var role := "elite" if bool(enemy.get("elite", false)) else String(enemy.get("role", "basic"))
	if String(enemy.get("sprite_kind", "")) == "coupon":
		role = "coupon" if role == "basic" or role == "fast" else role
	elif String(enemy.get("sprite_kind", "")) == "appliance":
		role = "robot" if role == "basic" else role
	return role

func _update_special_enemy_sfx() -> void:
	for enemy in enemies.enemies:
		var role := String(enemy.get("role", "basic"))
		if role != "speaker" and role != "charger":
			continue
		var state := String(enemy.get("action_state", "idle"))
		var previous_state := String(enemy.get("sfx_action_state", ""))
		if previous_state == state:
			continue
		enemy["sfx_action_state"] = state
		if role == "speaker" and state == "broadcast":
			_play_sfx("speaker_pulse")
		elif role == "charger" and state == "windup":
			_play_sfx("charger_warn")
		elif role == "charger" and state == "dash":
			_play_sfx("charger_dash")

func _update_threats(delta: float) -> void:
	_update_active_threats(delta)
	if match_state != "playing" or paused_for_card or boss.active or _first_recall_active():
		return
	_schedule_pressure_ring(delta)
	_schedule_flyer_drop(delta)

func _update_active_threats(delta: float) -> void:
	for threat in active_threats:
		threat["timer"] = float(threat.get("timer", 0.0)) - delta
		if float(threat["timer"]) <= 0.0 and not bool(threat.get("hit_checked", false)):
			threat["hit_checked"] = true
			_resolve_threat_hit(threat)
	active_threats = active_threats.filter(func(threat: Dictionary) -> bool: return float(threat.get("timer", 0.0)) > -float(threat.get("linger", 0.25)))

func _schedule_pressure_ring(delta: float) -> void:
	if elapsed < 150.0:
		return
	pressure_ring_timer = maxf(0.0, pressure_ring_timer - delta)
	if pressure_ring_timer > 0.0 or _active_threat_count(THREAT_PRESSURE_RING) >= 1:
		return
	var interval := 8.8
	if r01_map.current_zone_is_model_house():
		interval = 7.0
	if WaveDirector.is_finale(elapsed):
		interval = 5.8
	pressure_ring_timer = interval + rng.randf_range(0.0, 2.2)
	_spawn_pressure_ring()

func _schedule_flyer_drop(delta: float) -> void:
	if elapsed < 150.0 or not _has_threat_caller():
		return
	flyer_drop_timer = maxf(0.0, flyer_drop_timer - delta)
	if flyer_drop_timer > 0.0 or _active_threat_count(THREAT_FLYER_DROP) >= 2:
		return
	var interval := 6.2
	if r01_map.current_zone_is_model_house():
		interval = 4.9
	if WaveDirector.is_finale(elapsed):
		interval = 3.8
	flyer_drop_timer = interval + rng.randf_range(0.0, 1.6)
	_spawn_flyer_drop()

func _spawn_pressure_ring() -> void:
	var offset := _threat_offset(88.0, 46.0)
	var hazard_role := _r01_pressure_hazard_role()
	var source_info := r01_blockout.hazard_source_position(hazard_role, player_pos, rng, player_pos + offset, R01CampaignMap.node_zone_id(current_r01_node_id)) if R01LayoutBlockout.ENABLED else {"pos": player_pos + offset, "used": false}
	active_threats.append({
		"type": THREAT_PRESSURE_RING,
		"pos": Vector2(source_info.get("pos", player_pos + offset)),
		"radius": PRESSURE_RING_RADIUS,
		"timer": PRESSURE_RING_WARNING,
		"duration": PRESSURE_RING_WARNING,
		"linger": PRESSURE_RING_LINGER,
		"damage": PRESSURE_RING_DAMAGE,
		"label": "압박 링",
		"hit_checked": false,
		"source_used": bool(source_info.get("used", false)),
		"source_pos": Vector2(source_info.get("source_pos", Vector2(INF, INF))),
		"source_label": _hazard_source_label(hazard_role),
	})
	last_threat_label = "%s 예고" % _hazard_source_label(hazard_role)
	_play_sfx("pressure_ring")

func _spawn_flyer_drop() -> void:
	var offset := _threat_offset(118.0, 32.0)
	var hazard_role := _r01_flyer_hazard_role()
	var source_info := r01_blockout.hazard_source_position(hazard_role, player_pos, rng, player_pos + offset, R01CampaignMap.node_zone_id(current_r01_node_id)) if R01LayoutBlockout.ENABLED else {"pos": player_pos + offset, "used": false}
	active_threats.append({
		"type": THREAT_FLYER_DROP,
		"pos": Vector2(source_info.get("pos", player_pos + offset)),
		"radius": FLYER_DROP_RADIUS,
		"timer": FLYER_DROP_WARNING,
		"duration": FLYER_DROP_WARNING,
		"linger": FLYER_DROP_LINGER,
		"damage": FLYER_DROP_DAMAGE,
		"label": "위험 전단 낙하",
		"hit_checked": false,
		"source_used": bool(source_info.get("used", false)),
		"source_pos": Vector2(source_info.get("source_pos", Vector2(INF, INF))),
		"source_label": _hazard_source_label(hazard_role),
	})
	last_threat_label = "%s 예고" % _hazard_source_label(hazard_role)
	_play_sfx("danger_flyer_drop")

func _resolve_threat_hit(threat: Dictionary) -> void:
	var center: Vector2 = threat["pos"]
	var radius := float(threat.get("radius", 0.0))
	if player_pos.distance_squared_to(center) > radius * radius:
		return
	var label := String(threat.get("label", "위험"))
	var damage := _incoming_damage(float(threat.get("damage", 0.0)))
	player_hp = maxf(0.0, player_hp - damage)
	last_threat_label = label
	effects.add_floater(player_pos + Vector2(0, -16), label, C.NEON_RED, 13)
	_show_damage_number(player_pos + Vector2(0, -12), damage, "hit")
	effects.add_status_ring(player_pos, C.NEON_RED, 24.0, 0.28)
	effects.add_impact_shake(0.18, 4.6)
	if String(threat.get("type", "")) == THREAT_PRESSURE_RING:
		_play_sfx("pressure_ring_hit")
		var push_dir := (player_pos - center).normalized() if player_pos.distance_squared_to(center) > 0.01 else last_move_dir.normalized()
		if push_dir.length_squared() <= 0.01:
			push_dir = Vector2.RIGHT
		player_pos += push_dir * PRESSURE_RING_KNOCKBACK
		_clamp_player_to_world()
	else:
		_play_sfx("danger_flyer_hit")
	if player_hp <= 0.0:
		_finish_match("game_over")

func _active_threat_count(threat_type: String) -> int:
	var count := 0
	for threat in active_threats:
		if String(threat.get("type", "")) == threat_type:
			count += 1
	return count

func _has_threat_caller() -> bool:
	if r01_map.current_zone_is_model_house() or WaveDirector.is_finale(elapsed):
		return true
	for enemy in enemies.enemies:
		var role := String(enemy.get("role", "basic"))
		if role == "speaker" or role == "signal":
			return true
	return false

func _r01_pressure_hazard_role() -> String:
	match current_r01_node_id:
		R01CampaignMap.NODE_L04:
			return "low_signal"
		R01CampaignMap.NODE_L05:
			return "fake_return"
		_:
			return "pressure_ring"

func _r01_flyer_hazard_role() -> String:
	match current_r01_node_id:
		R01CampaignMap.NODE_L04:
			return "silence_leak"
		R01CampaignMap.NODE_L05:
			return "rear_pincer"
		_:
			return "flyer_drop"

func _hazard_source_label(hazard_role: String) -> String:
	match hazard_role:
		"low_signal", "silence_leak":
			return "낮은 신호 오염"
		"fake_return", "rear_pincer":
			return "가짜 귀환 신호"
		"pressure_ring":
			return "심사 압박 링"
		"flyer_drop":
			return "우편함 전단 낙하"
		"sprinkler_ink":
			return "광고 잉크 분사"
		_:
			return "광고 위험"

func _threat_offset(max_radius: float, min_radius: float) -> Vector2:
	var angle := rng.randf_range(-PI, PI)
	var distance := rng.randf_range(min_radius, max_radius)
	return Vector2(cos(angle), sin(angle)) * distance

func _update_boss(delta: float) -> void:
	if not boss.active:
		return
	var previous_state := boss.state
	var result := boss.update(delta, player_pos)
	if boss.active and boss.state != previous_state:
		if boss.state == "core_exposed":
			_play_sfx("boss_core_expose")
		elif boss.state in ["sweep_telegraph", "shield", "distortion_telegraph", "demo_telegraph"]:
			_play_sfx("boss_warning")
	if result.has("player_damage"):
		var final_damage := _incoming_damage(float(result["player_damage"]))
		player_hp = maxf(0.0, player_hp - final_damage)
		if result.has("knockback"):
			player_pos += Vector2(result["knockback"])
			_clamp_player_to_world()
		_show_damage_number(player_pos + Vector2(0, -16), final_damage, "hit")
		var heavy_hit := result.has("knockback")
		effects.add_impact_shake(0.28 if heavy_hit else 0.18, 7.2 if heavy_hit else 5.2)
		effects.add_status_ring(player_pos, C.NEON_RED, 32.0 if heavy_hit else 24.0, 0.38 if heavy_hit else 0.30)
	if player_hp <= 0.0:
		boss_result_reason = "boss_recall"
		boss.active = false
		boss.state = "recall_escape"
		_finish_match("recalled")

func _update_auto_fire(delta: float) -> void:
	auto_timer -= delta
	if auto_timer > 0.0:
		return
	auto_timer = C.AUTO_TICK
	var target_idx := _preferred_auto_target(player_pos, _auto_range())
	var priority_target := target_idx != -1 and _enemy_has_return_stamp(enemies.enemies[target_idx])
	var boss_in_range := boss.active and player_pos.distance_to(boss.pos) <= _auto_range() + BossController.BODY_RADIUS
	if target_idx == -1 and not boss_in_range:
		return
	var damage := _auto_damage_per_tick()
	if boss_in_range and not priority_target and (target_idx == -1 or boss.target_distance_sq(player_pos) <= player_pos.distance_squared_to(enemies.enemies[target_idx]["pos"])):
		var boss_hit := _apply_boss_damage(damage, "auto")
		if not boss_hit.is_empty():
			_register_attack_pose(boss.pos - player_pos, 0.14)
			effects.add_auto_shot(player_pos, boss.pos)
			_play_sfx("auto_fire")
		return
	var target_pos: Vector2 = enemies.enemies[target_idx]["pos"]
	if priority_target:
		damage *= 1.12
	var hit := enemies.apply_damage(target_idx, _enemy_meta_damage(damage, target_idx), "auto")
	if not hit.is_empty():
		_show_damage_number(Vector2(hit["pos"]), float(hit["damage"]), "auto", String(hit["effectiveness"]))
		_add_audit_processing(float(hit["damage"]) * 1.4, "auto_hit", target_pos)
		_register_attack_pose(target_pos - player_pos, 0.14)
		_apply_hit_knockback(target_idx, player_pos, 5.5)
		_play_sfx("enemy_hit")
		if priority_target:
			effects.add_status_ring(target_pos, C.NEON_RED, 19.0, 0.22)
			effects.add_floater(target_pos + Vector2(0, -6), "반품 추적", C.NEON_RED, 11)
	_handle_dead_positions(_cleanup_dead_positions())
	effects.add_auto_shot(player_pos, target_pos)
	_play_sfx("auto_fire")
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
			charge_window_left = _charge_window()
			charge_open_age = 0.0
			charge_warning_played = false
			charge_ready_flash = C.CHARGE_READY_FLASH
			effects.show_charge_ready()
			_play_sfx("return_stamp_ready")
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
		var puddle_processing := 0.0
		for hit in hit_enemies:
			puddle_processing += float(hit.get("damage", 0.0)) * 1.15
		if puddle_processing > 0.0:
			_add_audit_processing(puddle_processing, "puddle", center)
		var boss_hit := {}
		if boss.active and boss.contains_point(center, float(puddle["radius"])):
			boss_hit = _apply_boss_damage(damage, "puddle", false)
		if float(puddle["display_tick"]) >= 0.32:
			puddle["display_tick"] = 0.0
			for n in range(mini(6, hit_enemies.size())):
				_show_damage_number(Vector2(hit_enemies[n]["pos"]), float(hit_enemies[n]["damage"]), "puddle", String(hit_enemies[n]["effectiveness"]))
			if not boss_hit.is_empty():
				_show_damage_number(Vector2(boss_hit["pos"]), float(boss_hit["damage"]), "puddle", String(boss_hit["effectiveness"]))
		_handle_dead_positions(_cleanup_dead_positions())
	charge_puddles = charge_puddles.filter(func(puddle: Dictionary) -> bool: return float(puddle["life"]) > 0.0)

func _charge_missed() -> void:
	charge_miss_notice = 0.48
	effects.show_charge_missed(player_pos)
	_play_sfx("return_stamp_whiff")

func _fire_charge() -> void:
	var aim_data := _charge_aim_data()
	var aim_dir: Vector2 = aim_data["dir"]
	var directed := true
	var limit := _charge_target_limit(directed)
	var damage := _charge_damage(directed)
	var perfect := _is_perfect_charge()
	if perfect:
		damage *= 1.0 + 0.25 * float(player_stats["perfect_charge_level"])
		limit += 2 * int(player_stats["perfect_charge_level"])
	if _emergency_charge_active():
		damage *= 1.0 + 0.25 * float(player_stats["emergency_charge_level"])

	charge_effect_anchor_active = false
	var hit_count := _fire_return_stamp(aim_dir, limit + 4, damage, perfect)
	_record_playtest_charge(hit_count, perfect)
	_handle_dead_positions(_cleanup_dead_positions())
	_apply_charge_aftereffects(hit_count, directed, aim_dir, perfect)
	charge_effect_anchor_active = false
	_fire_feedback(hit_count > 0)
	effects.spawn_charge_particles(player_pos, aim_dir, hit_count > 0, rng)
	charge_window_left = 0.0
	charge_timer = 0.0
	charge_open_age = 0.0
	charge_warning_played = false
	charge_miss_notice = 0.0

func _charge_aim_data() -> Dictionary:
	var aim := get_global_mouse_position() - player_pos
	var directed := aim.length() > C.CHARGE_AIM_DEADZONE
	var aim_dir := aim.normalized() if directed else _fallback_aim_dir()
	return {"aim": aim, "directed": directed, "dir": aim_dir}

func _fallback_aim_dir() -> Vector2:
	var dir := last_move_dir
	if dir.length_squared() <= 0.01:
		dir = attack_pose_dir
	if dir.length_squared() <= 0.01:
		dir = Vector2.RIGHT
	return dir.normalized()

func _fire_return_stamp(aim_dir: Vector2, limit: int, damage: float, perfect: bool) -> int:
	var hit_indices := _charge_line_hit_indices(aim_dir, RETURN_STAMP_RANGE, RETURN_STAMP_WIDTH)
	var hit_count := 0
	var line_start := player_pos + aim_dir * 14.0
	var trace_end := player_pos + aim_dir * RETURN_STAMP_RANGE
	var anchor_pos := trace_end
	_register_attack_pose(aim_dir, 0.24)
	for n in range(mini(limit, hit_indices.size())):
		var idx: int = hit_indices[n]
		if idx < 0 or idx >= enemies.enemies.size():
			continue
		var hit_pos: Vector2 = enemies.enemies[idx]["pos"]
		anchor_pos = hit_pos
		var hit := enemies.apply_damage(idx, _enemy_meta_damage(damage, idx), "focused")
		if hit.is_empty():
			continue
		_apply_return_stamp(idx, perfect)
		effects.spawn_hit_spark(hit_pos, true, rng)
		_show_damage_number(hit_pos, float(hit["damage"]), "focused", String(hit["effectiveness"]))
		_add_audit_processing(28.0 + float(hit["damage"]) * 2.2, "charge_hit", hit_pos)
		var heavy_target := bool(enemies.enemies[idx].get("elite", false)) or String(enemies.enemies[idx].get("role", "basic")) in ["tank", "signal", "speaker", "charger"]
		effects.add_impact_line(line_start, hit_pos, C.NEON_RED, 3.5 if heavy_target else 2.5, 0.16)
		effects.add_return_stamp_hit(hit_pos, aim_dir, perfect, heavy_target)
		effects.add_floater(hit_pos + Vector2(0, -6), "완벽 반품" if perfect else ("엘리트 반품" if heavy_target else "반품"), C.NEON_RED, 12 if perfect or heavy_target else 11)
		enemies.knockback_enemy(idx, aim_dir, 12.0)
		_apply_charge_hit_modifiers(idx, true, aim_dir)
		hit_count += 1
	if hit_count < limit and _charge_line_hits_boss(aim_dir, RETURN_STAMP_RANGE, RETURN_STAMP_WIDTH):
		var boss_hit := _apply_boss_damage(damage, "focused")
		if not boss_hit.is_empty():
			anchor_pos = boss.pos
			effects.spawn_hit_spark(boss.pos, true, rng)
			effects.add_impact_line(line_start, boss.pos, C.NEON_RED, 5.0, 0.22)
			effects.add_return_stamp_hit(boss.pos, aim_dir, perfect, true)
			effects.add_status_ring(boss.pos, C.NEON_RED, BossController.BODY_RADIUS + 24.0, 0.42)
			var boss_stamp_label := "결절 반품" if boss.core_exposed else "외피 반품"
			effects.add_floater(boss.pos + Vector2(0, -10), boss_stamp_label, C.NEON_RED, 13)
			effects.add_impact_shake(0.16, 4.8)
			hit_count += 1
	charge_effect_anchor = anchor_pos
	charge_effect_anchor_active = true
	if hit_count > 0:
		_play_sfx("return_stamp_hit")
		effects.add_impact_line(line_start, trace_end, C.NEON_RED, 4.0 if hit_count >= 3 else 3.0, 0.20)
		effects.add_status_ring(trace_end, C.NEON_RED, 9.0, 0.18)
		if hit_count >= 3:
			_play_sfx("return_stamp_combo")
			effects.add_floater(player_pos, "연속 반품 x%d" % hit_count, C.NEON_RED, 14)
			effects.add_impact_shake(0.18, 4.2)
		else:
			effects.add_floater(player_pos, "반품 도장!", C.NEON_RED, 14)
	else:
		effects.add_return_stamp_whiff(line_start, trace_end)
		_play_sfx("return_stamp_whiff")
	return hit_count

func _apply_return_stamp(index: int, perfect: bool = false) -> void:
	if index < 0 or index >= enemies.enemies.size():
		return
	var duration := RETURN_STAMP_DURATION
	duration += 0.45 * float(player_stats.get("return_label_level", 0))
	if perfect and int(player_stats["perfect_charge_level"]) > 0:
		duration += 1.4 + 0.3 * float(player_stats["perfect_charge_level"])
	enemies.enemies[index]["return_stamp_timer"] = duration
	enemies.enemies[index]["return_stamp_flash"] = 0.30
	_play_sfx("return_stamp_mark")

func _update_charge_marks(delta: float) -> void:
	for enemy in enemies.enemies:
		if enemy.has("return_stamp_flash"):
			enemy["return_stamp_flash"] = maxf(0.0, float(enemy["return_stamp_flash"]) - delta)
			if float(enemy["return_stamp_flash"]) <= 0.0:
				enemy.erase("return_stamp_flash")
		if enemy.has("return_stamp_timer"):
			enemy["return_stamp_timer"] = maxf(0.0, float(enemy["return_stamp_timer"]) - delta)
			if float(enemy["return_stamp_timer"]) <= 0.0:
				var pos: Vector2 = enemy["pos"]
				var radius := float(enemy.get("radius", 8.0))
				effects.add_status_ring(pos, Color(0.35, 0.70, 0.95), radius + 8.0, 0.20)
				enemy.erase("return_stamp_timer")
				_play_sfx("return_stamp_expire")

func _preferred_auto_target(origin: Vector2, max_range: float, excluded: Array = [], for_split: bool = false) -> int:
	var stamped_idx := _nearest_marked_enemy(origin, max_range + RETURN_STAMP_AUTO_PRIORITY_RANGE_BONUS, "return_stamp_timer", excluded)
	if stamped_idx != -1:
		return stamped_idx
	return enemies.nearest_enemy_excluding(origin, max_range, excluded)

func _nearest_marked_enemy(origin: Vector2, max_range: float, mark_key: String, excluded: Array = []) -> int:
	var best := -1
	var best_dist := max_range * max_range
	for i in range(enemies.enemies.size()):
		if excluded.has(i):
			continue
		if float(enemies.enemies[i].get(mark_key, 0.0)) <= 0.0:
			continue
		var dist := origin.distance_squared_to(enemies.enemies[i]["pos"])
		if dist < best_dist:
			best_dist = dist
			best = i
	return best

func _enemy_has_return_stamp(enemy: Dictionary) -> bool:
	return float(enemy.get("return_stamp_timer", 0.0)) > 0.0

func _cleanup_dead_positions(allow_burst_context: bool = true) -> Array[Vector2]:
	var dead_events: Array[Dictionary] = []
	for enemy in enemies.enemies:
		if float(enemy.get("hp", 0.0)) <= 0.0:
			dead_events.append({
				"pos": Vector2(enemy["pos"]),
				"return_stamp": _enemy_has_return_stamp(enemy),
				"role": String(enemy.get("role", "basic")),
				"sprite_kind": String(enemy.get("sprite_kind", "")),
				"elite": bool(enemy.get("elite", false)),
			})
	_add_audit_processing_for_dead_events(dead_events)
	var dead_positions := enemies.cleanup_dead()
	if allow_burst_context and int(player_stats.get("kill_burst_level", 0)) > 0:
		_queue_kill_burst_contexts(dead_events)
	return dead_positions

func _add_audit_processing_for_dead_events(dead_events: Array[Dictionary]) -> void:
	for event in dead_events:
		var role := String(event.get("role", "basic"))
		var sprite_kind := String(event.get("sprite_kind", ""))
		var pos: Vector2 = event.get("pos", player_pos)
		var base := 22.0
		var reason := "kill"
		if bool(event.get("elite", false)):
			base += 45.0
		if bool(event.get("return_stamp", false)):
			base += 24.0 + 8.0 * float(player_stats.get("return_label_level", 0))
			reason = "return_stamp_kill"
		if role in ["signal", "speaker", "charger"]:
			base += 14.0
		if role == "robot" or sprite_kind == "appliance":
			base += 18.0 + 10.0 * float(player_stats.get("battery_receipt_level", 0))
			reason = "robot_kill"
		if r01_map.current_zone_is_open_house() and _card_count("earn_open_house_checkin") > 0:
			base += 10.0 * float(_card_count("earn_open_house_checkin"))
		_add_audit_processing(base, reason, pos)

func _queue_kill_burst_contexts(dead_events: Array[Dictionary]) -> void:
	for event in dead_events:
		if bool(event.get("return_stamp", false)):
			pending_kill_burst_contexts.append(event.duplicate(true))
	while pending_kill_burst_contexts.size() > MAX_PENDING_KILL_CONTEXTS:
		pending_kill_burst_contexts.pop_front()

func _consume_kill_burst_context(pos: Vector2) -> Dictionary:
	for i in range(pending_kill_burst_contexts.size() - 1, -1, -1):
		var context: Dictionary = pending_kill_burst_contexts[i]
		var context_pos: Vector2 = context.get("pos", pos)
		if pos.distance_squared_to(context_pos) <= 16.0 * 16.0:
			pending_kill_burst_contexts.remove_at(i)
			return context
	return {}

func _enemy_indices_in_radius(center: Vector2, radius: float, max_targets: int = -1) -> Array[int]:
	var indices: Array[int] = []
	var radius_sq := radius * radius
	for i in range(enemies.enemies.size()):
		if center.distance_squared_to(enemies.enemies[i]["pos"]) <= radius_sq:
			indices.append(i)
	indices.sort_custom(func(a: int, b: int) -> bool:
		return center.distance_squared_to(enemies.enemies[a]["pos"]) < center.distance_squared_to(enemies.enemies[b]["pos"])
	)
	if max_targets <= 0 or indices.size() <= max_targets:
		return indices
	var limited: Array[int] = []
	for n in range(max_targets):
		limited.append(indices[n])
	return limited

func _charge_line_hit_indices(aim_dir: Vector2, max_range: float, width: float) -> Array[int]:
	var hit_indices: Array[int] = []
	for i in range(enemies.enemies.size()):
		var to_enemy: Vector2 = enemies.enemies[i]["pos"] - player_pos
		var forward := to_enemy.dot(aim_dir)
		if forward < 0.0 or forward > max_range:
			continue
		var lateral_sq := maxf(0.0, to_enemy.length_squared() - forward * forward)
		var radius := width + float(enemies.enemies[i].get("radius", 8.0))
		if lateral_sq > radius * radius:
			continue
		hit_indices.append(i)
	hit_indices.sort_custom(func(a: int, b: int) -> bool:
		var a_forward := Vector2(enemies.enemies[a]["pos"] - player_pos).dot(aim_dir)
		var b_forward := Vector2(enemies.enemies[b]["pos"] - player_pos).dot(aim_dir)
		return a_forward < b_forward
	)
	return hit_indices

func _charge_line_hits_boss(aim_dir: Vector2, max_range: float, width: float) -> bool:
	if not boss.active:
		return false
	var to_boss := boss.pos - player_pos
	var forward := to_boss.dot(aim_dir)
	if forward < 0.0 or forward > max_range + BossController.BODY_RADIUS:
		return false
	var lateral_sq := maxf(0.0, to_boss.length_squared() - forward * forward)
	var radius := width + BossController.BODY_RADIUS
	return lateral_sq <= radius * radius

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

func _charge_hits_boss(directed: bool, aim_dir: Vector2) -> bool:
	if not boss.active:
		return false
	var to_boss := boss.pos - player_pos
	var dist := to_boss.length()
	if dist > C.CHARGE_RANGE + BossController.BODY_RADIUS:
		return false
	if directed and to_boss.normalized().dot(aim_dir) < C.DIRECTED_ARC_COS:
		return false
	return true

func _apply_boss_damage(base_damage: float, damage_type: String, show_number: bool = true) -> Dictionary:
	if not boss.active:
		return {}
	var hit := boss.apply_damage(_boss_meta_damage(base_damage), damage_type)
	if hit.is_empty():
		return {}
	_play_sfx("boss_hit")
	_add_audit_processing(36.0 + float(hit.get("damage", 0.0)) * 1.6, "terms_boss_hit", Vector2(hit["pos"]))
	if show_number:
		_show_damage_number(Vector2(hit["pos"]), float(hit["damage"]), damage_type, String(hit["effectiveness"]))
	if float(hit.get("shield_damage", 0.0)) > 0.0:
		effects.add_status_ring(boss.pos, C.LEMON_YELLOW, BossController.BODY_RADIUS + 18.0, 0.24)
	if bool(hit.get("distorted_charge", false)):
		effects.add_floater(Vector2(hit["pos"]) + Vector2(0, -12), "신호 왜곡", Color(0.35, 0.70, 0.95), 14)
		effects.add_status_ring(boss.pos, Color(0.35, 0.70, 0.95), BossController.BODY_RADIUS + 24.0, 0.26)
		effects.add_impact_shake(0.08, 2.0)
	if bool(hit.get("defeated", false)):
		_on_boss_defeated()
	return hit

func _try_split_shot(primary_idx: int) -> void:
	var split_level := int(player_stats["split_shot_level"])
	if split_level <= 0:
		return
	auto_shot_counter += 1
	var cadence := maxi(2, 5 - split_level)
	var auto_damage_synergy := _card_count("auto_damage") >= 2
	if auto_damage_synergy:
		cadence = maxi(2, cadence - 1)
	if auto_shot_counter % cadence != 0:
		return
	var secondary_idx := _preferred_auto_target(player_pos, _auto_range() + 30.0 + split_level * 10.0, [primary_idx], true)
	if secondary_idx == -1:
		return
	var priority_target := _enemy_has_return_stamp(enemies.enemies[secondary_idx])
	var target_pos: Vector2 = enemies.enemies[secondary_idx]["pos"]
	var split_damage := _auto_damage_per_tick() * minf(0.85, 0.55 + 0.10 * split_level)
	if auto_damage_synergy:
		split_damage = _auto_damage_per_tick() * minf(0.90, 0.60 + 0.10 * split_level)
	if priority_target:
		split_damage *= 1.12
	var hit := enemies.apply_damage(secondary_idx, _enemy_meta_damage(split_damage, secondary_idx), "auto")
	if not hit.is_empty():
		_show_damage_number(target_pos, float(hit["damage"]), "auto", String(hit["effectiveness"]))
		_add_audit_processing(float(hit["damage"]) * 1.25, "auto_hit", target_pos)
		_apply_hit_knockback(secondary_idx, player_pos, 4.0)
		_play_sfx("enemy_hit")
		if priority_target:
			effects.add_status_ring(target_pos, C.NEON_RED, 17.0, 0.22)
	_handle_dead_positions(_cleanup_dead_positions())
	effects.add_alt_shot(player_pos, target_pos)
	_play_sfx("auto_fire", 1.18)
	effects.add_status_ring(target_pos, C.TOXIC_GREEN, 18.0 if auto_damage_synergy else 14.0, 0.28 if auto_damage_synergy else 0.24)
	var split_label := "증폭 분열!" if auto_damage_synergy else "분열!"
	if priority_target:
		split_label = "반품 분열!"
	effects.add_floater(target_pos, split_label, C.TOXIC_GREEN, 14)

func _try_kill_burst(pos: Vector2) -> Array[Vector2]:
	var burst_level := int(player_stats["kill_burst_level"])
	var dead_positions: Array[Vector2] = []
	if burst_level <= 0:
		return dead_positions
	var context := _consume_kill_burst_context(pos)
	var chance := minf(0.85, 0.25 * burst_level)
	var radius := 58.0 + 8.0 * burst_level
	var max_targets := 1 + mini(2, burst_level)
	var burst_color := C.CORAL_PINK
	var burst_label := "연쇄!"
	if bool(context.get("return_stamp", false)):
		chance = minf(0.92, chance + 0.25)
		max_targets += 1
		burst_color = C.NEON_RED
		burst_label = "반품 폭죽!"
	if rng.randf() > chance:
		return dead_positions
	var damage := 22.0 + 8.0 * burst_level
	var hit_enemies := enemies.damage_enemies_in_radius_with_hits(pos, radius, damage, max_targets, "burst")
	var boss_hit := {}
	if boss.active and boss.contains_point(pos, radius):
		boss_hit = _apply_boss_damage(damage, "burst")
	if hit_enemies.size() > 0:
		var burst_processing := 0.0
		for hit in hit_enemies:
			_show_damage_number(Vector2(hit["pos"]), float(hit["damage"]), "burst", String(hit["effectiveness"]))
			burst_processing += float(hit.get("damage", 0.0)) * 1.35
			_apply_hit_knockback(int(hit["index"]), pos, 13.0)
		_add_audit_processing(burst_processing, "burst", pos)
	if hit_enemies.size() > 0 or not boss_hit.is_empty():
		effects.add_small_burst(pos)
		effects.add_status_ring(pos, burst_color, radius, 0.34)
		effects.add_floater(pos, burst_label, burst_color, 14)
		if int(player_stats["charge_puddle_level"]) > 0:
			_spawn_burst_residue_puddle(pos)
		dead_positions = _cleanup_dead_positions()
	return dead_positions

func _apply_charge_hit_modifiers(idx: int, directed: bool, aim_dir: Vector2) -> void:
	var slow_level := int(player_stats["charge_slow_level"])
	if slow_level > 0:
		var slow_duration := 1.0 + 0.25 * slow_level
		var slow_mult := maxf(0.20, 0.58 - 0.08 * slow_level)
		var slow_color := C.TOXIC_GREEN
		var slow_label := "오류!"
		if _enemy_has_return_stamp(enemies.enemies[idx]):
			slow_duration += 0.30 + 0.08 * slow_level
			slow_mult = maxf(0.20, slow_mult - 0.06)
			slow_color = C.NEON_RED
			slow_label = "반품 오류!"
		enemies.apply_slow(idx, slow_duration, slow_mult)
		effects.add_status_ring(enemies.enemies[idx]["pos"], slow_color, 15.0, 0.30)
		if slow_level >= 2:
			effects.add_floater(enemies.enemies[idx]["pos"], slow_label, slow_color, 11)
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

func _try_charge_followthrough(hit_indices: Array[int], limit: int, damage: float, aim_dir: Vector2) -> void:
	if _build_count("charge") < 2 or hit_indices.size() <= limit:
		return
	var idx: int = hit_indices[limit]
	if idx < 0 or idx >= enemies.enemies.size():
		return
	var hit_pos: Vector2 = enemies.enemies[idx]["pos"]
	var follow_damage := damage * 0.28
	var hit := enemies.apply_damage(idx, _enemy_meta_damage(follow_damage, idx), "focused")
	if not hit.is_empty():
		_show_damage_number(hit_pos, float(hit["damage"]), "focused", String(hit["effectiveness"]))
		_apply_hit_knockback(idx, player_pos, 10.0)
		effects.add_impact_line(player_pos + aim_dir * 18.0, hit_pos, C.TOXIC_GREEN)
		effects.add_status_ring(hit_pos, C.TOXIC_GREEN, 16.0, 0.26)
		effects.add_floater(hit_pos, "관통!", C.TOXIC_GREEN, 13)
	_handle_dead_positions(_cleanup_dead_positions())

func _spawn_charge_puddle(directed: bool, aim_dir: Vector2) -> void:
	var puddle_level := int(player_stats["charge_puddle_level"])
	if puddle_level <= 0:
		return
	var pos := player_pos + (aim_dir * C.CHARGE_RANGE * 0.62 if directed else Vector2.ZERO)
	if charge_effect_anchor_active:
		pos = charge_effect_anchor
	var area_combo := int(player_stats["kill_burst_level"]) > 0
	var radius := 46.0 + 6.0 * puddle_level + (4.0 if area_combo else 0.0)
	var dps := (17.0 + 6.0 * puddle_level) * (1.10 if area_combo else 1.0) * 1.06
	var life := 2.10 + 0.25 * puddle_level
	var label := "반품 연쇄 잔류!" if area_combo else "반품 잔류!"
	charge_puddles.append({
		"pos": pos,
		"radius": radius,
		"dps": dps,
		"life": life,
		"duration": life,
		"tick": 0.0,
		"display_tick": 0.0,
	})
	while charge_puddles.size() > 2 + puddle_level:
		charge_puddles.pop_front()
	effects.add_status_ring(pos, C.TOXIC_GREEN, radius, 0.42)
	effects.add_floater(pos, label, C.TOXIC_GREEN, 14)

func _spawn_burst_residue_puddle(pos: Vector2) -> void:
	charge_puddles.append({
		"pos": pos,
		"radius": 34.0 + 4.0 * float(player_stats["charge_puddle_level"]),
		"dps": 10.0 + 3.0 * float(player_stats["kill_burst_level"]),
		"life": 1.05,
		"duration": 1.05,
		"tick": 0.0,
		"display_tick": 0.0,
	})
	while charge_puddles.size() > 2 + int(player_stats["charge_puddle_level"]):
		charge_puddles.pop_front()
	effects.add_status_ring(pos, C.TOXIC_GREEN, 36.0, 0.34)
	effects.add_floater(pos + Vector2(0, 8), "잉크 폭죽!", C.TOXIC_GREEN, 12)

func _try_charge_heal(hit_count: int) -> void:
	var heal_level := int(player_stats["charge_heal_level"])
	if heal_level <= 0:
		return
	var threshold := maxi(3, 6 - heal_level)
	var survival_combo := _build_count("survival") >= 2 and player_hp <= float(player_stats["max_hp"]) * 0.45
	if survival_combo:
		threshold = maxi(2, threshold - 1)
	if hit_count < threshold:
		return
	var heal_amount := 3.0 + 2.0 * heal_level
	if survival_combo:
		heal_amount += 3.0
	player_hp = minf(float(player_stats["max_hp"]), player_hp + heal_amount)
	_show_damage_number(player_pos, heal_amount, "heal")
	effects.add_floater(player_pos + Vector2(-16, -8), "생존 회복!" if survival_combo else "회복!", C.TOXIC_GREEN, 14)

func _is_perfect_charge() -> bool:
	return int(player_stats["perfect_charge_level"]) > 0 and charge_open_age <= 0.25

func _emergency_charge_active() -> bool:
	return int(player_stats["emergency_charge_level"]) > 0 and player_hp <= float(player_stats["max_hp"]) * 0.30

func _handle_dead_positions(dead_positions: Array[Vector2]) -> void:
	_handle_dead_positions_internal(dead_positions, true)

func _handle_dead_positions_internal(dead_positions: Array[Vector2], allow_kill_bursts: bool) -> void:
	var burst_dead_positions: Array[Vector2] = []
	if dead_positions.size() > 0:
		_play_sfx("enemy_kill", 0.96 + minf(0.16, float(dead_positions.size()) * 0.025))
	for pos in dead_positions:
		kills += 1
		xp += _xp_gain()
		_play_sfx("xp_pickup")
		effects.spawn_pop_particles(pos, rng)
		effects.add_burst(pos, Vector2.RIGHT, 0.18, false)
		if allow_kill_bursts:
			burst_dead_positions.append_array(_try_kill_burst(pos))
	if burst_dead_positions.size() > 0:
		_handle_dead_positions_internal(burst_dead_positions, false)
	if xp >= _xp_requirement():
		xp -= _xp_requirement()
		level += 1
		_play_sfx("xp_pickup", 1.22, 0.0)
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

func _update_r01_zone(delta: float) -> void:
	var world_zone_id := r01_blockout.nearest_zone_id(player_pos) if R01LayoutBlockout.ENABLED else ""
	var changed := r01_map.update(delta, elapsed, match_state == "playing", world_zone_id)
	if match_state == "playing":
		_record_r01_zone_time(delta)
		_update_open_house_signal_candidate()
	if changed and not _first_recall_active():
		if match_state == "playing":
			_record_playtest_zone_entry(r01_map.current_zone_id())
		var notice := r01_map.active_notice_text()
		var clause_notice := _zone_clause_entry_notice(r01_map.current_zone_id())
		if clause_notice != "":
			notice = "%s / %s" % [notice, clause_notice]
		_show_wave_notice(notice)

func _reset_r01_run_tracking() -> void:
	r01_zone_times = {}
	open_house_signal_stage = 0

func _record_r01_zone_time(delta: float) -> void:
	var zone_id := r01_map.current_zone_id()
	r01_zone_times[zone_id] = float(r01_zone_times.get(zone_id, 0.0)) + delta

func _r01_zone_time(zone_id: String) -> float:
	return float(r01_zone_times.get(zone_id, 0.0))

func _open_house_time() -> float:
	return _r01_zone_time("open_house_street_anchor")

func _drain_pocket_time() -> float:
	return _r01_zone_time("drain_pocket_anchor")

func _fake_return_time() -> float:
	return _r01_zone_time("fake_return_route_anchor")

func _zone_clause_entry_notice(zone_id: String) -> String:
	match zone_id:
		"open_house_street_anchor":
			return "지역 약관: 25초 체류=수신태그 후보, 밀도 상승"
		"drain_pocket_anchor":
			return "지역 약관: 20초 체류=수신태그 후보, 조용한 보정"
		"fake_return_route_anchor":
			return "지역 약관: 20초 체류=식량태그 후보, 오염 위험"
		"model_house_node_anchor":
			return "지역 약관: 결절 신호 감사 강화"
		_:
			return ""

func _update_open_house_signal_candidate() -> void:
	var open_time := _open_house_time()
	if open_house_signal_stage < 1 and open_time >= _open_house_signal_threshold(1):
		open_house_signal_stage = 1
		_set_boss_signal_state("faint")
		_show_wave_notice("오픈하우스 체류: 수신태그 후보가 감지됩니다")
	elif open_house_signal_stage < 2 and open_time >= _open_house_signal_threshold(2):
		open_house_signal_stage = 2
		_set_boss_signal_state("detected")
		_show_wave_notice("오픈하우스 체류: 수신태그 승인 가능성이 상승합니다")
	elif open_house_signal_stage < 3 and open_time >= _open_house_signal_threshold(3):
		open_house_signal_stage = 3
		_set_boss_signal_state("near")
		_show_wave_notice("오픈하우스 체류: 모델하우스 신호가 선명해집니다")

func _open_house_signal_threshold(stage: int) -> float:
	var reduction := float(player_stats.get("open_house_signal_threshold_reduction", 0.0))
	match stage:
		1:
			return maxf(12.0, 25.0 - reduction)
		2:
			return maxf(30.0, 50.0 - reduction * 1.25)
		3:
			return maxf(48.0, 75.0 - reduction * 1.50)
		_:
			return 9999.0

func _reset_audit_run_tracking() -> void:
	audit_segment_index = 0
	audit_processing = 0.0
	audit_total_processing = 0.0
	audit_pass_count = 0
	audit_fail_count = 0
	audit_pressure_level = 0
	audit_last_result = "대기"
	audit_segment_results = []
	card_contribution_log = {}

func _update_audit_director(delta: float) -> void:
	if int(player_stats.get("low_hp_allowance_level", 0)) > 0 and player_hp <= float(player_stats["max_hp"]) * 0.35:
		_add_audit_processing(14.0 * delta * float(player_stats.get("low_hp_allowance_level", 0)), "low_hp")
	while audit_segment_index < AUDIT_SEGMENTS.size() and elapsed >= float(AUDIT_SEGMENTS[audit_segment_index]["time"]):
		_resolve_audit_segment(AUDIT_SEGMENTS[audit_segment_index])
		audit_segment_index += 1

func _resolve_audit_segment(segment: Dictionary) -> void:
	var threshold := _audit_threshold(segment)
	_record_threshold_card_contributions(segment, threshold)
	var passed := audit_processing >= threshold
	var result := "pass" if passed else "fail"
	var ratio := audit_processing / maxf(1.0, threshold)
	audit_segment_results.append({
		"name": String(segment["name"]),
		"result": result,
		"processing": audit_processing,
		"threshold": threshold,
		"ratio": ratio,
	})
	if passed:
		audit_pass_count += 1
		audit_pressure_level = maxi(0, audit_pressure_level - 1)
		audit_last_result = "%s 통과 %.0f/%.0f" % [String(segment["name"]), audit_processing, threshold]
		_mark_playtest_time_once("first_audit_pass_time")
		_show_wave_notice("광고 감사 통과: %s" % String(segment["pass"]))
	else:
		audit_fail_count += 1
		audit_pressure_level += 1
		audit_last_result = "%s 미달 %.0f/%.0f" % [String(segment["name"]), audit_processing, threshold]
		_show_wave_notice("광고 감사 미달: %s" % String(segment["fail"]))
		_trigger_audit_failure_pressure(segment)
	audit_processing = 0.0

func _audit_threshold(segment: Dictionary) -> float:
	var sortie_mult := 1.0 + maxf(0.0, float(sortie_index - 1)) * 0.08
	var threshold_mult := 1.0 + float(player_stats.get("audit_threshold_mult", 0.0))
	var zone_id := r01_map.current_zone_id()
	if _open_house_time() >= 25.0 and _card_count("earn_open_house_checkin") > 0:
		threshold_mult -= 0.04 * float(_card_count("earn_open_house_checkin"))
	if player_hp <= float(player_stats["max_hp"]) * 0.35 and _card_count("earn_low_hp_allowance") > 0:
		threshold_mult -= 0.03 * float(_card_count("earn_low_hp_allowance"))
	if zone_id == "drain_pocket_anchor":
		threshold_mult -= 0.05
	elif zone_id == "fake_return_route_anchor":
		threshold_mult += 0.08
	threshold_mult = clampf(threshold_mult, 0.58, 1.75)
	return float(segment["threshold"]) * sortie_mult * threshold_mult

func _trigger_audit_failure_pressure(segment: Dictionary) -> void:
	if boss.active or paused_for_card:
		return
	var wave_params := _wave_params_for_elapsed(maxf(elapsed, float(segment["time"])))
	var count := mini(3, 1 + int(audit_pressure_level / 2))
	enemies.spawn_elite_group(count, elapsed, player_pos, rng, wave_params)
	effects.add_status_ring(player_pos, C.NEON_RED, 78.0 + 12.0 * float(audit_pressure_level), 0.42)

func _wave_params_for_elapsed(value: float) -> Dictionary:
	var params := WaveDirector.params_for_time(value, sortie_index, r01_map.current_zone_id())
	params = _apply_r01_contamination_spawn_pressure(params)
	params = _apply_r01_campaign_node_spawn_hint(params, value)
	return _apply_audit_spawn_pressure(params)

func _apply_r01_campaign_node_spawn_hint(params: Dictionary, value: float) -> Dictionary:
	var result := params.duplicate(true)
	var weights: Dictionary = result.get("role_weights", {}).duplicate(true)
	result["source_zone_id"] = R01CampaignMap.node_zone_id(current_r01_node_id)
	match current_r01_node_id:
		R01CampaignMap.NODE_L01:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 0.96
			weights["basic"] = float(weights.get("basic", 0.0)) + 0.03
			result["spawn_bias"] = R01CampaignMap.node_spawn_bias(current_r01_node_id)
			result["spawn_pincer_chance"] = 0.10
			result["spawn_axis_angle"] = -0.15
			result["node_pressure_label"] = "회수선 안정"
			result["source_spawn_chance"] = 0.22
			result["source_spawn_label"] = "흩어진 우편함과 외곽 표지"
		R01CampaignMap.NODE_L02:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.08
			result["speed_mult"] = float(result.get("speed_mult", 1.0)) * (1.025 if value >= 36.0 else 1.0)
			weights["basic"] = maxf(0.10, float(weights.get("basic", 0.0)) - 0.03)
			weights["speaker"] = float(weights.get("speaker", 0.0)) + 0.035
			weights["fast"] = float(weights.get("fast", 0.0)) + 0.055
			weights["charger"] = float(weights.get("charger", 0.0)) + (0.018 if value >= 72.0 else 0.0)
			result["spawn_bias"] = R01CampaignMap.node_spawn_bias(current_r01_node_id)
			result["spawn_pincer_chance"] = 0.46 if value >= 36.0 else 0.24
			result["spawn_axis_angle"] = 0.34
			result["node_pressure_label"] = "우편함 양쪽 발송"
			result["source_spawn_chance"] = 0.52
			result["source_spawn_label"] = "우편함/현관 장치 양쪽 발송"
		R01CampaignMap.NODE_L03:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.07
			result["speed_mult"] = float(result.get("speed_mult", 1.0)) * 1.02
			weights["basic"] = maxf(0.10, float(weights.get("basic", 0.0)) - 0.025)
			weights["signal"] = float(weights.get("signal", 0.0)) + 0.055
			weights["speaker"] = float(weights.get("speaker", 0.0)) + 0.035
			weights["charger"] = float(weights.get("charger", 0.0)) + 0.012
			result["spawn_bias"] = R01CampaignMap.node_spawn_bias(current_r01_node_id)
			result["spawn_pincer_chance"] = 0.34
			result["spawn_axis_angle"] = -0.62
			result["node_pressure_label"] = "심사 신호 증폭"
			result["source_spawn_chance"] = 0.58
			result["source_spawn_label"] = "모델하우스 안내판과 상담 부스"
		R01CampaignMap.NODE_L04:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 0.94
			result["speed_mult"] = float(result.get("speed_mult", 1.0)) * 0.98
			weights["basic"] = float(weights.get("basic", 0.0)) + 0.02
			weights["signal"] = float(weights.get("signal", 0.0)) + 0.025
			weights["tank"] = float(weights.get("tank", 0.0)) + 0.01
			result["spawn_bias"] = R01CampaignMap.node_spawn_bias(current_r01_node_id)
			result["spawn_pincer_chance"] = 0.14
			result["spawn_axis_angle"] = 1.12
			result["node_pressure_label"] = "침묵 흔적 접근"
			result["source_spawn_chance"] = 0.34
			result["source_spawn_label"] = "배수구 아래 낮은 신호"
		R01CampaignMap.NODE_L05:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.09
			result["speed_mult"] = float(result.get("speed_mult", 1.0)) * 1.035
			weights["basic"] = maxf(0.10, float(weights.get("basic", 0.0)) - 0.03)
			weights["fast"] = float(weights.get("fast", 0.0)) + 0.055
			weights["speaker"] = float(weights.get("speaker", 0.0)) + 0.045
			weights["charger"] = float(weights.get("charger", 0.0)) + 0.016
			result["spawn_bias"] = R01CampaignMap.node_spawn_bias(current_r01_node_id)
			result["spawn_pincer_chance"] = 0.42
			result["spawn_axis_angle"] = -0.95
			result["node_pressure_label"] = "가짜 귀환 신호"
			result["source_spawn_chance"] = 0.56
			result["source_spawn_label"] = "가짜 귀환 표지 뒤쪽 포위"
	result["role_weights"] = weights
	result["operation_zone"] = R01CampaignMap.node_name(current_r01_node_id)
	result["operation_spawn_axis"] = R01CampaignMap.node_spawn_axis_label(current_r01_node_id)
	return result

func _apply_r01_contamination_spawn_pressure(params: Dictionary) -> Dictionary:
	var r01_state := _r01_phrase_state()
	var contamination := clampi(int(r01_state.get("r01_contamination_total", 0)), 0, 5)
	if contamination <= 0:
		return params
	var result := params.duplicate(true)
	result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * (1.0 + 0.045 * float(contamination))
	result["speed_mult"] = float(result.get("speed_mult", 1.0)) * (1.0 + 0.012 * float(contamination))
	result["elite_chance"] = minf(0.70, float(result.get("elite_chance", 0.0)) + 0.012 * float(contamination))
	var weights: Dictionary = result.get("role_weights", {}).duplicate(true)
	weights["basic"] = maxf(0.12, float(weights.get("basic", 0.0)) - 0.018 * float(contamination))
	weights["speaker"] = float(weights.get("speaker", 0.0)) + 0.010 * float(contamination)
	weights["charger"] = float(weights.get("charger", 0.0)) + 0.006 * float(int(r01_state.get("r01_contaminated_food_count", 0)))
	weights["tank"] = float(weights.get("tank", 0.0)) + 0.008 * float(int(r01_state.get("r01_contaminated_power_count", 0)))
	weights["signal"] = float(weights.get("signal", 0.0)) + 0.012 * float(int(r01_state.get("r01_contaminated_signal_count", 0)))
	result["role_weights"] = weights
	return result

func _apply_audit_spawn_pressure(params: Dictionary) -> Dictionary:
	var result := params.duplicate(true)
	var pressure := audit_pressure_level
	if pressure <= 0:
		return result
	result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * (1.0 + 0.10 * float(pressure))
	result["speed_mult"] = float(result.get("speed_mult", 1.0)) * (1.0 + 0.035 * float(pressure))
	result["elite_chance"] = minf(0.70, float(result.get("elite_chance", 0.0)) + 0.025 * float(pressure))
	var weights: Dictionary = result.get("role_weights", {}).duplicate(true)
	weights["basic"] = maxf(0.12, float(weights.get("basic", 0.0)) - 0.04 * float(pressure))
	weights["fast"] = float(weights.get("fast", 0.0)) + 0.018 * float(pressure)
	weights["speaker"] = float(weights.get("speaker", 0.0)) + 0.014 * float(pressure)
	weights["charger"] = float(weights.get("charger", 0.0)) + 0.014 * float(pressure)
	weights["signal"] = float(weights.get("signal", 0.0)) + 0.012 * float(pressure)
	result["role_weights"] = weights
	return result

func _update_campaign_node_pressure_cues(delta: float, wave_params: Dictionary) -> void:
	if current_r01_node_id == R01CampaignMap.NODE_L01 or elapsed < NODE_PRESSURE_CUE_START:
		node_pressure_cue_timer = maxf(0.0, node_pressure_cue_timer - delta)
		return
	node_pressure_cue_timer = maxf(0.0, node_pressure_cue_timer - delta)
	if node_pressure_cue_timer > 0.0:
		return
	var label := String(wave_params.get("node_pressure_label", ""))
	if label == "":
		return
	node_pressure_cue_timer = NODE_PRESSURE_CUE_INTERVAL + rng.randf_range(-4.0, 5.0)
	var cue_color := C.NEON_RED
	if current_r01_node_id == R01CampaignMap.NODE_L04:
		cue_color = Color(0.35, 0.70, 0.95)
	effects.add_floater(player_pos + Vector2(rng.randf_range(-32.0, 32.0), rng.randf_range(-14.0, 6.0)), label, cue_color, 12)
	if current_r01_node_id == R01CampaignMap.NODE_L02 or current_r01_node_id == R01CampaignMap.NODE_L05:
		effects.add_status_ring(player_pos, cue_color, 46.0, 0.26)
	_show_wave_notice("%s: %s" % [R01CampaignMap.node_name(current_r01_node_id), R01CampaignMap.node_modifier_short(current_r01_node_id)])

func _show_damage_number(pos: Vector2, amount: float, kind: String, effectiveness: String = "normal") -> void:
	if _damage_number_visible(pos, kind, effectiveness):
		effects.add_damage_number(pos, amount, kind, effectiveness)

func _damage_number_visible(pos: Vector2, kind: String, effectiveness: String) -> bool:
	if debug_tools.detail_debug_visible():
		return true
	if kind == "hit" or kind == "heal" or kind == "focused" or effectiveness == "weak":
		return true
	if enemies.enemies.size() < DAMAGE_NUMBER_DENSE_START:
		return true
	if kind == "auto" and effects.damage_numbers.size() >= 44:
		return false
	if kind == "puddle" and effects.damage_numbers.size() >= 34:
		return false
	var near_count := 0
	var radius_sq := DAMAGE_NUMBER_DENSE_NEAR_RADIUS * DAMAGE_NUMBER_DENSE_NEAR_RADIUS
	var near_limit := 1 if _enemy_heavy_density_ui() else 2
	for number in effects.damage_numbers:
		if pos.distance_squared_to(Vector2(number.get("pos", Vector2.ZERO))) <= radius_sq:
			near_count += 1
			if near_count >= near_limit:
				return false
	return true

func _add_audit_processing(base_value: float, reason: String, pos: Vector2 = Vector2(-999999.0, -999999.0)) -> void:
	if match_state != "playing" or base_value <= 0.0:
		return
	var amount := base_value * _audit_processing_mult(reason)
	audit_processing += amount
	audit_total_processing += amount
	_record_audit_card_contributions(base_value, reason, amount)
	if amount >= 80.0 and pos.x > -900000.0:
		effects.add_floater(pos + Vector2(0, -12), "처리량 +%d" % int(round(amount)), C.VITAMIN_YELLOW, 11)

func _record_audit_card_contributions(base_value: float, reason: String, amount: float) -> void:
	var zone_id := r01_map.current_zone_id()
	if _card_count("tool_return_label") > 0 and reason in ["charge_hit", "return_stamp_kill"]:
		var share := 0.18 if reason == "charge_hit" else 0.34
		_record_card_contribution("tool_return_label", amount * share, "반품 표식")
	if _card_count("tool_flyer_pop") > 0 and reason in ["burst", "return_stamp_kill"]:
		var share := 0.82 if reason == "burst" else 0.14
		_record_card_contribution("tool_flyer_pop", amount * share, "전단 연쇄")
	if _card_count("tool_broadcast_residue") > 0 and reason in ["puddle", "charge_hit"]:
		var share := 0.80 if reason == "puddle" else 0.08
		_record_card_contribution("tool_broadcast_residue", amount * share, "송출 잔류")
	if _card_count("tool_robot_command_flip") > 0 and reason == "robot_kill":
		_record_card_contribution("tool_robot_command_flip", amount * 0.24, "명령 오류 로봇")
	if _card_count("earn_battery_receipt") > 0:
		var share := 0.22 if reason == "robot_kill" else 0.04
		_record_card_contribution("earn_battery_receipt", amount * share, "충전태그 처리")
	if _card_count("earn_open_house_checkin") > 0 and r01_map.current_zone_is_open_house():
		_record_card_contribution("earn_open_house_checkin", amount * 0.20, "오픈하우스 체류")
	if _card_count("earn_low_hp_allowance") > 0 and (reason == "low_hp" or player_hp <= float(player_stats["max_hp"]) * 0.35):
		var share := 0.85 if reason == "low_hp" else 0.14
		_record_card_contribution("earn_low_hp_allowance", amount * share, "저체력 근무")
	if _card_count("terms_family_discount") > 0 and (r01_map.current_zone_is_open_house() or zone_id == "model_house_node_anchor"):
		_record_card_contribution("terms_family_discount", amount * 0.18, "가족 약관")
	if _card_count("terms_no_return_agreement") > 0 and reason == "charge_hit":
		_record_card_contribution("terms_no_return_agreement", amount * 0.30, "차징 약관")
	if _card_count("terms_auto_renewal") > 0 and (String(reason).begins_with("terms") or int(player_stats.get("terms_pressure_level", 0)) > 0):
		_record_card_contribution("terms_auto_renewal", amount * 0.10, "약관 증폭")

func _record_threshold_card_contributions(segment: Dictionary, threshold: float) -> void:
	var sortie_mult := 1.0 + maxf(0.0, float(sortie_index - 1)) * 0.08
	var base_threshold := float(segment["threshold"]) * sortie_mult
	var saved := maxf(0.0, base_threshold - threshold)
	if saved <= 0.0:
		return
	if _card_count("earn_overtime_sheet") > 0:
		_record_card_contribution("earn_overtime_sheet", base_threshold * 0.04 * float(_card_count("earn_overtime_sheet")), "감사 기준 완화")
	if _card_count("terms_normal_customer_sticker") > 0:
		_record_card_contribution("terms_normal_customer_sticker", base_threshold * 0.08 * float(_card_count("terms_normal_customer_sticker")), "정상 고객 판정")
	if _card_count("earn_low_hp_allowance") > 0 and player_hp <= float(player_stats["max_hp"]) * 0.35:
		_record_card_contribution("earn_low_hp_allowance", base_threshold * 0.03 * float(_card_count("earn_low_hp_allowance")), "위기 기준 완화")

func _record_card_contribution(card_id: String, processing_amount: float, note: String) -> void:
	if processing_amount <= 0.0 or _card_count(card_id) <= 0:
		return
	var entry: Dictionary = card_contribution_log.get(card_id, {})
	if entry.is_empty():
		entry = {
			"card_id": card_id,
			"name": _card_name(card_id),
			"processing": 0.0,
			"events": 0,
			"notes": [],
		}
	entry["processing"] = float(entry.get("processing", 0.0)) + processing_amount
	entry["events"] = int(entry.get("events", 0)) + 1
	var notes: Array = Array(entry.get("notes", []))
	if note != "" and not notes.has(note) and notes.size() < 4:
		notes.append(note)
	entry["notes"] = notes
	card_contribution_log[card_id] = entry

func _card_name(card_id: String) -> String:
	for card in LevelUpCards.CARDS:
		if String(card.get("id", "")) == card_id:
			return String(card.get("name", card_id))
	return card_id

func _card_contribution_snapshot() -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for card_id in card_contribution_log.keys():
		var entry: Dictionary = Dictionary(card_contribution_log[card_id]).duplicate(true)
		result.append(entry)
	return result

func _audit_processing_mult(reason: String) -> float:
	var mult := 1.0 + float(player_stats.get("audit_processing_mult", 0.0))
	var zone_id := r01_map.current_zone_id()
	if r01_map.current_zone_is_open_house():
		mult *= 1.0 + float(player_stats.get("open_house_processing_bonus", 0.0))
	elif zone_id == "drain_pocket_anchor" and reason in ["charge_hit", "puddle", "robot_kill"]:
		mult *= 1.08
	elif zone_id == "fake_return_route_anchor" and reason in ["charge_hit", "return_stamp_kill"]:
		mult *= 1.12
	if reason == "charge_hit":
		mult *= 1.0 + 0.10 * float(player_stats.get("return_label_level", 0))
		mult *= 1.0 + 0.12 * float(player_stats.get("no_return_agreement_level", 0))
	elif reason == "return_stamp_kill":
		mult *= 1.0 + 0.16 * float(player_stats.get("return_label_level", 0))
		mult *= 1.0 + 0.10 * float(player_stats.get("flyer_pop_level", 0))
	elif reason == "burst":
		mult *= 1.0 + 0.12 * float(player_stats.get("flyer_pop_level", 0))
	elif reason == "puddle":
		mult *= 1.0 + 0.12 * float(player_stats.get("broadcast_residue_level", 0))
	elif reason == "robot_kill":
		mult *= 1.0 + 0.18 * float(player_stats.get("battery_receipt_level", 0))
		mult *= 1.0 + 0.12 * float(player_stats.get("robot_command_flip_level", 0))
	if player_hp <= float(player_stats["max_hp"]) * 0.35:
		mult *= 1.0 + 0.14 * float(player_stats.get("low_hp_allowance_level", 0))
	var terms_level := float(player_stats.get("terms_auto_renewal_level", 0))
	if terms_level > 0.0 and String(reason).begins_with("terms"):
		mult *= 1.0 + 0.10 * terms_level
	return mult

func _audit_progress_ratio() -> float:
	if audit_segment_index >= AUDIT_SEGMENTS.size():
		return 1.0
	return audit_processing / maxf(1.0, _audit_threshold(AUDIT_SEGMENTS[audit_segment_index]))

func _audit_hud_data() -> Dictionary:
	if audit_segment_index >= AUDIT_SEGMENTS.size():
		return {
			"name": "결절 예비 감사",
			"processing": audit_processing,
			"threshold": 1.0,
			"ratio": 1.0,
			"time_left": 0.0,
			"pressure": audit_pressure_level,
		}
	var segment: Dictionary = AUDIT_SEGMENTS[audit_segment_index]
	var threshold := _audit_threshold(segment)
	return {
		"name": String(segment["name"]),
		"processing": audit_processing,
		"threshold": threshold,
		"ratio": audit_processing / maxf(1.0, threshold),
		"time_left": maxf(0.0, float(segment["time"]) - elapsed),
		"pressure": audit_pressure_level,
	}

func _ration_hud_data() -> Dictionary:
	if match_state != "playing":
		return {}
	var confirmed := {
		"food": 0,
		"power": 0,
		"signal": 0,
	}
	var candidates := {
		"food": 0,
		"power": 0,
		"signal": 0,
	}
	if elapsed >= 90.0:
		confirmed["food"] = 1
	if elapsed >= 120.0 or _card_count("earn_overtime_sheet") > 0:
		candidates["food"] = int(candidates["food"]) + 1
	if _card_count("earn_overtime_sheet") > 0 and audit_pass_count >= 2:
		candidates["food"] = int(candidates["food"]) + 1
	if _card_count("earn_low_hp_allowance") > 0 and (audit_fail_count > 0 or audit_total_processing >= 900.0):
		candidates["food"] = int(candidates["food"]) + 1
	if _fake_return_time() >= 20.0:
		candidates["food"] = int(candidates["food"]) + 1
	var effective_kills := int(round(float(kills) * _live_open_house_processing_mult()))
	if effective_kills >= 55 or _card_count("earn_battery_receipt") > 0:
		candidates["power"] = int(candidates["power"]) + 1
	if _card_count("earn_battery_receipt") > 0 and effective_kills >= 90:
		candidates["power"] = int(candidates["power"]) + 1
	if _card_count("tool_robot_command_flip") > 0 and audit_pass_count >= 2:
		candidates["power"] = int(candidates["power"]) + 1
	if open_house_signal_stage >= 1:
		candidates["signal"] = int(candidates["signal"]) + 1
	if open_house_signal_stage >= 2:
		candidates["signal"] = int(candidates["signal"]) + 1
	if _card_count("earn_open_house_checkin") > 0 and open_house_signal_stage >= 1:
		candidates["signal"] = int(candidates["signal"]) + 1
	if level >= 6 and audit_pass_count >= 3:
		candidates["signal"] = int(candidates["signal"]) + 1
	if _drain_pocket_time() >= 20.0:
		candidates["signal"] = int(candidates["signal"]) + 1
	var risk := ""
	if audit_pressure_level >= 3:
		risk = "오염"
	elif int(player_stats.get("terms_failure_risk", 0)) > 0:
		risk = "약관"
	elif _fake_return_time() >= 20.0:
		risk = "주의"
	return {
		"confirmed": confirmed,
		"candidates": candidates,
		"risk": risk,
		"clause": _current_region_clause_hud_label(),
	}

func _live_open_house_processing_mult() -> float:
	if open_house_signal_stage >= 3 or _open_house_time() >= 75.0:
		return 1.25
	if open_house_signal_stage >= 2 or _open_house_time() >= 50.0:
		return 1.16
	if open_house_signal_stage >= 1 or _open_house_time() >= 25.0:
		return 1.08
	return 1.0

func _reset_playtest_metrics() -> void:
	playtest_metrics = {
		"charge_uses": 0,
		"charge_hits": 0,
		"charge_whiffs": 0,
		"charge_hit_targets": 0,
		"charge_multihit_uses": 0,
		"perfect_charges": 0,
		"first_charge_time": -1.0,
		"first_card_time": -1.0,
		"first_open_house_time": -1.0,
		"first_ration_candidate_time": -1.0,
		"first_audit_pass_time": -1.0,
		"first_low_hp_time": -1.0,
		"danger_zone_entries": 0,
		"level_up_choices": 0,
		"max_audit_ratio": 0.0,
		"max_open_house_signal_stage": 0,
		"ration_candidate_peak": 0,
	}

func _record_playtest_charge(hit_count: int, perfect: bool) -> void:
	playtest_metrics["charge_uses"] = int(playtest_metrics.get("charge_uses", 0)) + 1
	_mark_playtest_time_once("first_charge_time")
	if hit_count > 0:
		playtest_metrics["charge_hits"] = int(playtest_metrics.get("charge_hits", 0)) + 1
		playtest_metrics["charge_hit_targets"] = int(playtest_metrics.get("charge_hit_targets", 0)) + hit_count
		if hit_count >= 3:
			playtest_metrics["charge_multihit_uses"] = int(playtest_metrics.get("charge_multihit_uses", 0)) + 1
	else:
		playtest_metrics["charge_whiffs"] = int(playtest_metrics.get("charge_whiffs", 0)) + 1
	if perfect:
		playtest_metrics["perfect_charges"] = int(playtest_metrics.get("perfect_charges", 0)) + 1

func _record_playtest_zone_entry(zone_id: String) -> void:
	if not _playtest_is_danger_zone(zone_id):
		return
	playtest_metrics["danger_zone_entries"] = int(playtest_metrics.get("danger_zone_entries", 0)) + 1
	if zone_id == "open_house_street_anchor":
		_mark_playtest_time_once("first_open_house_time")

func _playtest_is_danger_zone(zone_id: String) -> bool:
	return zone_id in [
		"open_house_street_anchor",
		"drain_pocket_anchor",
		"fake_return_route_anchor",
		"model_house_node_anchor",
	]

func _mark_playtest_time_once(key: String) -> void:
	if float(playtest_metrics.get(key, -1.0)) < 0.0:
		playtest_metrics[key] = elapsed

func _record_playtest_card_choice() -> void:
	playtest_metrics["level_up_choices"] = int(playtest_metrics.get("level_up_choices", 0)) + 1
	_mark_playtest_time_once("first_card_time")

func _update_playtest_runtime_metrics() -> void:
	if playtest_metrics.is_empty():
		_reset_playtest_metrics()
	playtest_metrics["max_audit_ratio"] = maxf(float(playtest_metrics.get("max_audit_ratio", 0.0)), _audit_progress_ratio())
	playtest_metrics["max_open_house_signal_stage"] = maxi(int(playtest_metrics.get("max_open_house_signal_stage", 0)), open_house_signal_stage)
	var candidate_count := _ration_candidate_count_snapshot()
	playtest_metrics["ration_candidate_peak"] = maxi(int(playtest_metrics.get("ration_candidate_peak", 0)), candidate_count)
	if candidate_count > 0:
		_mark_playtest_time_once("first_ration_candidate_time")
	if _open_house_time() > 0.1:
		_mark_playtest_time_once("first_open_house_time")
	if player_hp <= float(player_stats["max_hp"]) * 0.35:
		_mark_playtest_time_once("first_low_hp_time")

func _ration_candidate_count_snapshot() -> int:
	var ration_data := _ration_hud_data()
	var candidates: Dictionary = ration_data.get("candidates", {})
	return int(candidates.get("food", 0)) + int(candidates.get("power", 0)) + int(candidates.get("signal", 0))

func _playtest_metrics_snapshot() -> Dictionary:
	var snapshot := playtest_metrics.duplicate(true)
	var charge_uses := int(snapshot.get("charge_uses", 0))
	var charge_hits := int(snapshot.get("charge_hits", 0))
	var charge_hit_targets := int(snapshot.get("charge_hit_targets", 0))
	snapshot["charge_hit_rate"] = float(charge_hits) / maxf(1.0, float(charge_uses))
	snapshot["charge_avg_targets"] = float(charge_hit_targets) / maxf(1.0, float(charge_hits))
	var flags := _playtest_core_flags(snapshot)
	snapshot["core_flags"] = flags
	snapshot["first_5_score"] = _playtest_true_count(flags)
	snapshot["first_5_target_count"] = flags.size()
	snapshot["summary"] = _playtest_metrics_summary(snapshot)
	return snapshot

func _playtest_core_flags(metrics: Dictionary) -> Dictionary:
	return {
		"charge_hit": int(metrics.get("charge_hits", 0)) > 0,
		"card_choice": float(metrics.get("first_card_time", -1.0)) >= 0.0,
		"card_chain": int(metrics.get("level_up_choices", 0)) >= 2 or selected_card_count >= 2,
		"danger_zone": float(metrics.get("first_open_house_time", -1.0)) >= 0.0 or int(metrics.get("danger_zone_entries", 0)) > 0,
		"ration_candidate": float(metrics.get("first_ration_candidate_time", -1.0)) >= 0.0 or int(metrics.get("ration_candidate_peak", 0)) > 0,
		"audit_pass": float(metrics.get("first_audit_pass_time", -1.0)) >= 0.0 or audit_pass_count > 0,
		"pressure_visible": float(metrics.get("max_audit_ratio", 0.0)) >= 0.70 or audit_fail_count > 0 or int(metrics.get("max_open_house_signal_stage", 0)) > 0,
	}

func _playtest_true_count(flags: Dictionary) -> int:
	var count := 0
	for value in flags.values():
		if bool(value):
			count += 1
	return count

func _playtest_metrics_summary(metrics: Dictionary = {}) -> String:
	var data := metrics if not metrics.is_empty() else _playtest_metrics_snapshot()
	var score := int(data.get("first_5_score", 0))
	var target_count := int(data.get("first_5_target_count", 7))
	var hit_rate := float(data.get("charge_hit_rate", 0.0)) * 100.0
	var first_card := float(data.get("first_card_time", -1.0))
	var first_candidate := float(data.get("first_ration_candidate_time", -1.0))
	var card_text := "%.0fs" % first_card if first_card >= 0.0 else "--"
	var candidate_text := "%.0fs" % first_candidate if first_candidate >= 0.0 else "--"
	return "핵심 %d/%d | 차징 %.0f%%(%d/%d) | 카드 %s | 후보 %s | 위험 %.0fs" % [
		score,
		target_count,
		hit_rate,
		int(data.get("charge_hits", 0)),
		int(data.get("charge_uses", 0)),
		card_text,
		candidate_text,
		_open_house_time(),
	]

func _last_playtest_metrics_summary() -> String:
	var metrics: Dictionary = last_run_result.get("playtest_metrics", {})
	return str(metrics.get("summary", "")) if not metrics.is_empty() else ""

func _update_preboss_signal_events() -> void:
	if _first_recall_active():
		return
	if preboss_signal_event_stage < 1 and elapsed >= 120.0:
		preboss_signal_event_stage = 1
		_set_boss_signal_state("faint")
		_show_wave_notice("대형 광고 송출의 잔향이 감지됩니다")
	elif preboss_signal_event_stage < 2 and elapsed >= 180.0:
		preboss_signal_event_stage = 2
		_set_boss_signal_state("detected")
		_show_wave_notice("스마일 홈 검증 신호가 근처에서 회전합니다")
	elif preboss_signal_event_stage < 3 and elapsed >= 240.0:
		preboss_signal_event_stage = 3
		_set_boss_signal_state("near")
		boss_signal_unlocked = meta_progression.has_all_signal_clues()
		_show_wave_notice("스마일 홈 심사 절차가 노출됩니다")

func _try_start_boss_encounter() -> void:
	if boss.active or boss.defeated or match_state != "playing":
		return
	if _boss_route_ready() and elapsed >= 240.0:
		_start_boss_encounter()

func _start_boss_encounter() -> void:
	boss.set_core_expose_bonus(meta_progression.core_expose_bonus())
	boss.start()
	if R01LayoutBlockout.ENABLED:
		boss.pos = r01_blockout.anchor_position("model_house_node_anchor")
	_set_music("bgm_boss_smile_home")
	enemies.clear()
	active_threats.clear()
	wave_notice_timer = 4.0
	wave_notice_text = "보스 조우: %s" % BossController.BOSS_NAME
	effects.show_combat_banner(BossController.BOSS_NAME, C.VITAMIN_YELLOW)
	effects.add_status_ring(boss.pos, C.VITAMIN_YELLOW, BossController.BODY_RADIUS + 28.0, 0.62)
	effects.add_impact_shake(0.28, 5.8)
	_play_sfx("boss_warning")

func _on_boss_defeated() -> void:
	boss_signal_state = "silent"
	boss_signal_unlocked = false
	boss_result_reason = "boss_defeated"
	wave_notice_timer = 5.0
	wave_notice_text = "스마일 홈 결절 처리"
	effects.show_combat_banner("스마일 홈 결절 처리", C.TOXIC_GREEN)
	effects.add_status_ring(boss.pos, C.TOXIC_GREEN, BossController.BODY_RADIUS + 34.0, 0.72)
	effects.add_impact_shake(0.34, 7.0)
	_finish_match("boss_victory")

func _set_boss_signal_state(state: String) -> void:
	if _boss_signal_rank(state) < _boss_signal_rank(boss_signal_state):
		return
	boss_signal_state = state
	var color := C.VITAMIN_YELLOW
	if state == "detected" or state == "near":
		color = C.NEON_RED
	effects.add_status_ring(player_pos, color, 72.0, 0.50)
	effects.add_floater(player_pos, "심사 신호 %s" % _boss_signal_label(), color, 14)

func _boss_signal_rank(state: String) -> int:
	match state:
		"faint":
			return 1
		"detected":
			return 2
		"near":
			return 3
		_:
			return 0

func _show_wave_notice(text: String) -> void:
	wave_notice_text = text
	wave_notice_timer = 2.8
	var danger := text.contains("피날레") or text.contains("붕괴") or text.contains("압력") or text.contains("보스")
	effects.show_combat_banner(text, C.NEON_RED if danger else C.VITAMIN_YELLOW)

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
	return sortie_index == 1 and first_sortie and not first_recall_done and match_state == "playing"

func _boss_signal_label() -> String:
	return String(BOSS_SIGNAL_LABELS.get(boss_signal_state, boss_signal_state))

func _preboss_stage_label() -> String:
	if sortie_index <= 1:
		return "강제 회수"
	var clue_count := meta_progression.signal_clue_count()
	if clue_count <= 0:
		return "재출격 안정화"
	if clue_count == 1:
		return "신호 압력"
	if clue_count == 2:
		return "심사 신호 근접"
	return "스마일 홈 결절 노출"

func _next_objective_label() -> String:
	return _next_goal_label().replace("목표: ", "")

func _next_objective_short_label() -> String:
	if _route_display_sortie_index() <= 1:
		return "108초 회수까지 생존"
	return RoutePhraseResolver.r01_sortie_goal_short_phrase(_r01_phrase_state())

func _regional_clause_preview_line() -> String:
	var contamination := _r01_contamination_preview_line()
	if contamination != "":
		return contamination
	if _route_display_sortie_index() <= 1:
		return "30초마다 광고 감사 / 108초 회수 임계"
	if _boss_route_ready():
		return "모델하우스 240초 이후 결절 접근 / 신호 적 증가"
	var signal_level := meta_progression.signal_board_level()
	var clue_count := meta_progression.signal_clue_count()
	if signal_level >= 2 or clue_count >= 2:
		return "오픈하우스 25초=수신태그 / 모델하우스 경로 압력"
	if signal_level >= 1 or clue_count >= 1:
		return "오픈하우스 25초=수신태그 / 배수로 20초=수신태그"
	return "오픈하우스 25초=수신태그 / 산책로 20초=식량태그+오염"

func _regional_clause_short_line() -> String:
	var contamination := _r01_contamination_short_line()
	if contamination != "":
		return contamination
	if _route_display_sortie_index() <= 1:
		return "30초 감사, 108초 회수"
	if _boss_route_ready():
		return "모델하우스 결절 감사"
	if meta_progression.signal_board_level() >= 2 or meta_progression.signal_clue_count() >= 2:
		return "오픈25=신호, 경로압력"
	if meta_progression.signal_board_level() >= 1 or meta_progression.signal_clue_count() >= 1:
		return "오픈25/배수20=신호"
	return "오픈25=신호, 산책20=오염"

func _current_region_clause_hud_label() -> String:
	var r01_state := _r01_phrase_state()
	var contamination_total := int(r01_state.get("r01_contamination_total", 0))
	var last_contamination := str(r01_state.get("r01_last_contamination_ticket", ""))
	match r01_map.current_zone_id():
		"open_house_street_anchor":
			if contamination_total > 0 and last_contamination == MetaProgression.TICKET_SIGNAL:
				return "약관 오염신호 감사+"
			return "약관 오픈25=신호"
		"drain_pocket_anchor":
			return "약관 배수20=신호"
		"fake_return_route_anchor":
			if contamination_total > 0 and last_contamination == MetaProgression.TICKET_FOOD:
				return "약관 오염 식량태그 감사+"
			return "약관 산책20=오염"
		"model_house_node_anchor":
			if contamination_total > 0:
				return "약관 오염결절 감사+"
			return "약관 결절감사"
		_:
			if audit_segment_index < AUDIT_SEGMENTS.size():
				return "약관 %.0f초감사" % float(AUDIT_SEGMENTS[audit_segment_index]["time"])
			return "약관 정산대기"

func _r01_contamination_preview_line() -> String:
	var r01_state := _r01_phrase_state()
	if int(r01_state.get("r01_contamination_total", 0)) <= 0:
		return ""
	match str(r01_state.get("r01_last_contamination_ticket", "")):
		MetaProgression.TICKET_SIGNAL:
			return "오염 수신태그 꼬리표: 오픈하우스/모델하우스 감사 강화"
		MetaProgression.TICKET_POWER:
			return "오염 충전태그 꼬리표: 로봇 검수와 장갑 광고 증가"
		MetaProgression.TICKET_FOOD:
			return "오염 식량태그 꼬리표: 끊긴 산책로 감사와 오염 위험 증가"
		_:
			return "오염 꼬리표: 지역 감사 압력 증가"

func _r01_contamination_short_line() -> String:
	var r01_state := _r01_phrase_state()
	if int(r01_state.get("r01_contamination_total", 0)) <= 0:
		return ""
	match str(r01_state.get("r01_last_contamination_ticket", "")):
		MetaProgression.TICKET_SIGNAL:
			return "오염 신호: 신호 감사+"
		MetaProgression.TICKET_POWER:
			return "오염 전원: 로봇 검수+"
		MetaProgression.TICKET_FOOD:
			return "오염 식량태그: 산책로 감사+"
		_:
			return "오염 꼬리표 감사+"

func _sortie_start_notice() -> String:
	var parts: Array[String] = []
	parts.append(R01CampaignMap.node_sortie_notice(current_r01_node_id))
	parts.append("구역 상태: %s" % R01CampaignMap.node_blockout_phrase(current_r01_node_id))
	parts.append("지역 변조: %s" % R01CampaignMap.node_modifier(current_r01_node_id))
	if meta_progression.signal_board_level() > 0:
		parts.append(meta_progression.signal_board_guidance_line())
	parts.append("지역 약관: %s" % _regional_clause_preview_line())
	return " / ".join(parts)

func _route_display_sortie_index() -> int:
	if match_state == "supply" or match_state == "recalled" or match_state == "boss_victory":
		return sortie_index + 1
	return sortie_index

func _route_stage_label() -> String:
	if meta_progression.boss_clear_count > 0 or boss_signal_state == "silent":
		return "스마일 홈 결절 침묵"
	if match_state == "supply":
		return "출격 게시판: %s" % R01CampaignMap.node_name(selected_r01_node_id)
	if _boss_route_ready():
		return "모델하우스 결절 접근 가능"
	if _route_display_sortie_index() <= 1:
		return "침묵 보급소 회수선"
	if current_r01_node_id != "":
		return "%s 작전 중" % R01CampaignMap.node_name(current_r01_node_id)
	return "외곽 주택가 출격 게시판"

func _next_goal_label() -> String:
	if boss.active:
		return "목표: 스마일 홈 심사관 결절 무력화"
	if match_state == "supply":
		return "목표: %s로 출격 준비" % R01CampaignMap.node_name(selected_r01_node_id)
	if _route_display_sortie_index() <= 1:
		return "목표: 108초 회수까지 생존"
	if current_r01_node_id != "":
		return "목표: %s" % R01CampaignMap.node_combat_goal(current_r01_node_id)
	return "목표: %s" % RoutePhraseResolver.r01_sortie_goal_phrase(_r01_phrase_state())

func _combat_goal_label() -> String:
	if boss.active:
		return "심사관 대응"
	if current_r01_node_id != "":
		return "%s | 법칙: %s" % [R01CampaignMap.node_name(current_r01_node_id), R01CampaignMap.node_modifier_short(current_r01_node_id)]
	if sortie_index <= 1:
		return "%s | 회수 신호 대기" % r01_map.current_zone_name()
	return "%s | %s" % [r01_map.current_zone_name(), RoutePhraseResolver.r01_sortie_goal_short_phrase(_r01_phrase_state())]

func _boss_route_ready() -> bool:
	if meta_progression.boss_clear_count > 0:
		return false
	return meta_progression.has_all_signal_clues()

func _session_progress_data() -> Dictionary:
	_sync_boss_signal_from_clues()
	var r01_state := _r01_phrase_state()
	return {
		"sortie_index": sortie_index,
		"first_recall_done": first_recall_done,
		"preboss_stage": _preboss_stage_label(),
		"route_stage_label": _route_stage_label(),
		"r01_zone_name": r01_map.current_zone_name(),
		"current_campaign_node_name": R01CampaignMap.node_name(current_r01_node_id),
		"selected_campaign_node_name": R01CampaignMap.node_name(selected_r01_node_id),
		"last_completed_campaign_node_name": "없음" if last_completed_r01_node_id == "" else R01CampaignMap.node_name(last_completed_r01_node_id),
		"selected_campaign_node_objective": R01CampaignMap.node_objective(selected_r01_node_id),
		"selected_campaign_node_role": R01CampaignMap.node_operation_role(selected_r01_node_id),
		"selected_campaign_node_spawn": R01CampaignMap.node_spawn_axis_label(selected_r01_node_id),
		"selected_campaign_node_reaction": R01CampaignMap.node_region_reaction(selected_r01_node_id),
		"selected_campaign_node_tag_hint": R01CampaignMap.node_tag_hint(selected_r01_node_id, meta_progression.tag_context()),
		"campaign_board_line": _r01_campaign_board_line(),
		"campaign_new_signal_line": _r01_campaign_change_banner(),
		"boss_signal_state": boss_signal_state,
		"boss_signal_label": _boss_signal_label(),
		"boss_signal_unlocked": boss_signal_unlocked,
		"boss_route_ready": _boss_route_ready(),
		"signal_clue_count": meta_progression.signal_clue_count(),
		"signal_clue_required": MetaProgression.SIGNAL_CLUES.size(),
		"boss_analysis_level": meta_progression.boss_analysis_level,
		"boss_clear_count": meta_progression.boss_clear_count,
		"smile_home_boss_outcome": meta_progression.smile_home_boss_outcome,
		"next_goal_label": _next_goal_label(),
		"next_objective": _next_objective_label(),
		"next_objective_short": _next_objective_short_label(),
		"r01_sortie_goal_phrase": RoutePhraseResolver.r01_sortie_goal_phrase(r01_state),
		"r01_sortie_goal_short_phrase": RoutePhraseResolver.r01_sortie_goal_short_phrase(r01_state),
		"r01_outpost_phrase": RoutePhraseResolver.r01_outpost_phrase(r01_state),
		"r01_finale_recovery_description": RoutePhraseResolver.r01_finale_recovery_description(r01_state),
		"r01_finale_recovery_progress_phrase": RoutePhraseResolver.r01_finale_recovery_progress_phrase(r01_state),
		"ration_ticket_summary": meta_progression.ration_ticket_summary(),
		"tag_rights_summary": meta_progression.tag_rights_summary_line(),
		"tag_ledger_summary": meta_progression.tag_ledger_summary_line(last_run_result),
		"tag_facility_response": meta_progression.tag_facility_response_line(last_run_result),
		"recall_quality": String(last_run_result.get("recall_quality", "")),
		"recall_quality_label": String(last_run_result.get("recall_quality_label", "")),
		"recall_quality_line": String(last_run_result.get("recall_quality_line", "")),
		"anti_farm_reason": String(last_run_result.get("anti_farm_reason", "")),
		"allocation_summary": meta_progression.allocation_summary_short(),
		"allocation_human_count": meta_progression.allocation_count(MetaProgression.ALLOCATION_HUMAN_ZONE),
		"allocation_robot_count": meta_progression.allocation_count(MetaProgression.ALLOCATION_ROBOT_MAINTENANCE),
		"allocation_signal_count": meta_progression.allocation_count(MetaProgression.ALLOCATION_SIGNAL_BOARD),
		"allocation_reaction_summary": meta_progression.allocation_reaction_summary(),
		"outpost_event_log": meta_progression.outpost_event_log_lines(3),
		"outpost_event_log_summary": meta_progression.outpost_event_log_summary(2),
		"last_outpost_event": meta_progression.last_outpost_event_line(),
		"last_outpost_npc_id": meta_progression.last_outpost_focus_npc_id(),
		"last_outpost_facility_id": meta_progression.last_outpost_facility_id(),
		"last_supply_reaction": last_supply_reaction_line,
		"outpost_result_route_target": _outpost_result_route_target(),
		"outpost_selected_action_surface": last_supply_action_surface,
		"last_playtest_summary": _last_playtest_metrics_summary(),
		"next_run_change_summary": meta_progression.next_run_change_summary(),
		"signal_board_level": meta_progression.signal_board_level(),
		"signal_board_guidance": meta_progression.signal_board_guidance_line(),
		"regional_clause_preview": _regional_clause_preview_line(),
		"regional_clause_short": _regional_clause_short_line(),
		"r01_contamination_summary": str(r01_state.get("r01_contamination_summary", meta_progression.r01_contamination_summary())),
		"r01_contamination_total": int(r01_state.get("r01_contamination_total", 0)),
	}

func _outpost_result_route_target() -> String:
	match match_state:
		"supply":
			return "sortie_gate"
		"recalled", "game_over", "victory", "boss_victory":
			return "settlement_counter"
		_:
			return "recovery_platform"

func _r01_phrase_state() -> Dictionary:
	var r01_state := meta_progression.r01_state_summary()
	r01_state["r01_followup_ready"] = meta_progression.has_smile_home_boss_outcome() and (meta_progression.boss_clear_count > 0 or boss_signal_state == "silent")
	return r01_state

func _session_progress_lines() -> Array[String]:
	return [
		"%s" % _route_stage_label(),
		_next_goal_label(),
		_r01_campaign_region_reaction_line(),
	]

func _r01_campaign_region_reaction_line() -> String:
	var node_id: String = last_completed_r01_node_id if last_completed_r01_node_id != "" else current_r01_node_id
	return "지역 반응: %s" % R01CampaignMap.node_region_reaction(node_id)

func _finale_recovery_lines() -> Array[String]:
	var r01_state := _r01_phrase_state()
	var lines: Array[String] = [
		"외곽 주택가 정찰 완료",
		RoutePhraseResolver.r01_finale_recovery_progress_phrase(r01_state),
	]
	for line in _run_reward_lines():
		lines.append(line)
	return lines

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
	var wave_params := _wave_params_for_elapsed(maxf(elapsed, 150.0))
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
	if boss.active:
		return
	if match_state == "playing" and elapsed >= C.MATCH_DURATION:
		elapsed = C.MATCH_DURATION
		_finish_match("victory")

func _finish_match(result_state: String) -> void:
	if result_state == "recalled" and _first_recall_active():
		meta_progression.grant_first_recall_trace()
	if result_state == "recalled" and boss_result_reason == "boss_recall":
		last_boss_recall_report = meta_progression.record_boss_recall(boss.hp_ratio())
	if result_state == "boss_victory":
		last_boss_victory_report = meta_progression.record_boss_victory()
	_complete_current_campaign_node(result_state)
	last_run_result = RunResultEvaluator.evaluate_run_result(_run_result_input(result_state))
	_apply_run_result_progression()
	print("RunResult: %s" % JSON.stringify(last_run_result))
	match_state = result_state
	game_over = result_state == "game_over"
	paused_for_card = false
	if is_inside_tree():
		get_tree().paused = false
	offered_cards.clear()
	hud.hide_level_card()
	var callback := Callable(self, "_handle_terminal_action")
	hud.show_result_screen(_result_data(result_state), callback)
	_set_music("")
	_play_sfx("result_settle")

func _should_show_supply_after_result(result_state: String) -> bool:
	if result_state == "recalled" or result_state == "boss_victory":
		return true
	return first_recall_done and (result_state == "victory" or result_state == "game_over")

func _result_data(result_state: String) -> Dictionary:
	if result_state == "boss_victory":
		var fragments := int(last_boss_victory_report.get("fragments_awarded", 0))
		var clear_count := int(last_boss_victory_report.get("clear_count", meta_progression.boss_clear_count))
		return {
			"result": "결절 처리 결과",
			"description": "스마일 홈 심사관의 절차를 멈췄습니다. 지역은 조용해졌지만 상위 송출 잔향은 아직 남아 있습니다.",
			"trace": "캠페인 코어 파편 +%d" % fragments,
			"progress_lines": [
				"결절 처리: %d회" % clear_count,
				"결절 분석: %d/3" % meta_progression.boss_analysis_level,
				meta_progression.smile_home_boss_outcome_label(),
				"후속 선택 준비: 결절 파괴 또는 기억 추출",
			] + _run_reward_lines(),
			"button_text": "보급소로 돌아가기",
			"prompt": "스페이스 / 클릭으로 보급소 이동",
			"survival_time": elapsed,
			"level": level,
			"kills": kills,
			"card_count": selected_card_count,
			"peak_enemy_count": peak_enemy_count,
			"final_enemy_count": enemies.enemies.size(),
		}
	if result_state == "recalled":
		if boss_result_reason == "boss_recall":
			var analysis_level := int(last_boss_recall_report.get("analysis_after", meta_progression.boss_analysis_level))
			var fragments := int(last_boss_recall_report.get("fragments_awarded", 0))
			var trace_text := "캠페인 코어 파편 +%d" % fragments if fragments > 0 else "없음"
			return {
				"result": "심사 중단 회수",
				"description": "스마일 홈 심사관의 절차를 일부 벗기고 보급소로 복귀했습니다.",
				"trace": trace_text,
				"progress_lines": [
					"결절 분석: %d/3" % analysis_level,
					_boss_analysis_milestone_label(analysis_level),
					meta_progression.boss_weakness_label(),
					meta_progression.boss_hint().replace("다음 조우 힌트", "다음 출격"),
				] + _run_reward_lines(),
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
			"result": "신호 과부하 긴급 인양",
			"description": "캠페인이 윤서의 이름과 주소를 등록하기 직전, 침묵 보급소가 회수선을 당겼습니다.",
			"trace": "찢어진 광고 전단",
			"progress_lines": _session_progress_lines() + _run_reward_lines(),
			"button_text": "보급소로 돌아가기",
			"prompt": "스페이스 / 클릭으로 보급소 이동",
			"survival_time": elapsed,
			"level": level,
			"kills": kills,
			"card_count": selected_card_count,
			"peak_enemy_count": peak_enemy_count,
			"final_enemy_count": enemies.enemies.size(),
		}
	if result_state == "victory":
		return {
			"result": "정상 회수",
			"description": RoutePhraseResolver.r01_finale_recovery_description(_r01_phrase_state()),
			"trace": "",
			"progress_lines": _finale_recovery_lines(),
			"button_text": "보급소로 돌아가기" if _should_show_supply_after_result(result_state) else "스페이스 / 클릭으로 다시 시작",
			"prompt": "스페이스 / 클릭으로 보급소 이동" if _should_show_supply_after_result(result_state) else "스페이스 / 클릭으로 다시 시작",
			"survival_time": elapsed,
			"level": level,
			"kills": kills,
			"card_count": selected_card_count,
			"peak_enemy_count": peak_enemy_count,
			"final_enemy_count": enemies.enemies.size(),
		}
	return {
		"result": "긴급 인양",
		"description": "회수선이 끊기기 전 보급소로 복귀했습니다. 일부 후보는 정산 실패로 보류됩니다.",
		"progress_lines": _session_progress_lines() + _run_reward_lines(),
		"button_text": "보급소로 돌아가기" if _should_show_supply_after_result(result_state) else "스페이스 / 클릭으로 다시 시작",
		"prompt": "스페이스 / 클릭으로 보급소 이동" if _should_show_supply_after_result(result_state) else "스페이스 / 클릭으로 다시 시작",
		"survival_time": elapsed,
		"level": level,
		"kills": kills,
		"card_count": selected_card_count,
		"peak_enemy_count": peak_enemy_count,
		"final_enemy_count": enemies.enemies.size(),
		}

func _boss_analysis_milestone_label(analysis_level: int) -> String:
	if analysis_level >= 3:
		return "성과: 가족사진 뒤편의 송출 흔적이 흔들렸습니다"
	if analysis_level >= 2:
		return "성과: 앞치마 아래의 캠페인 결절이 드러났습니다"
	return "성과: 검증 절차의 첫 틈을 기록했습니다"

func _run_result_input(result_state: String) -> Dictionary:
	return {
		"match_state": result_state,
		"elapsed": elapsed,
		"kills": kills,
		"level": level,
		"peak_enemy_count": peak_enemy_count,
		"boss_active": boss.active,
		"boss_hp_ratio": boss.hp_ratio(),
		"boss_result_reason": boss_result_reason,
		"first_sortie": first_sortie,
		"card_counts": Dictionary(player_stats.get("card_counts", {})).duplicate(true),
		"terms_failure_risk": int(player_stats.get("terms_failure_risk", 0)),
		"r01_zone_times": r01_zone_times.duplicate(true),
		"open_house_time": _open_house_time(),
		"open_house_signal_stage": open_house_signal_stage,
		"audit_pass_count": audit_pass_count,
		"audit_fail_count": audit_fail_count,
		"audit_pressure_level": audit_pressure_level,
		"audit_total_processing": audit_total_processing,
		"audit_last_result": audit_last_result,
		"audit_segment_results": audit_segment_results.duplicate(true),
		"audit_progress_ratio": _audit_progress_ratio(),
		"card_contributions": _card_contribution_snapshot(),
		"playtest_metrics": _playtest_metrics_snapshot(),
	}

func _run_reward_lines() -> Array[String]:
	var lines: Array[String] = []
	for line in Array(last_run_result.get("reward_lines", [])):
		lines.append(str(line))
	return lines

func _apply_run_result_progression() -> void:
	var signal_report := meta_progression.grant_signal_clue_candidates(Array(last_run_result.get("signal_clue_candidates", [])))
	var run_flyer_bonus := meta_progression.grant_run_flyer_bonus(int(last_run_result.get("torn_ad_flyer_reward", 0)))
	var ration_report := meta_progression.grant_ration_ticket_settlement(Dictionary(last_run_result.get("ration_ticket_settlement", {})))
	meta_progression.record_recall_quality(String(last_run_result.get("recall_quality", "")), String(last_run_result.get("recall_quality_line", "")))
	var contamination_report := Dictionary(ration_report.get("contamination_report", {}))
	var reward_lines: Array = Array(last_run_result.get("reward_lines", []))
	for line in _signal_clue_reward_lines(signal_report):
		reward_lines.append(line)
	if run_flyer_bonus > 0:
		reward_lines.append("전단 회수 동선 보정: 찢어진 광고 전단 +%d" % run_flyer_bonus)
	var ration_summary := String(ration_report.get("summary", ""))
	if ration_summary != "":
		reward_lines.append("보급소 보관: %s" % ration_summary)
	for line in _contamination_progression_lines(contamination_report):
		reward_lines.append(line)
	last_run_result["reward_lines"] = reward_lines
	_sync_boss_signal_from_clues()

func _contamination_progression_lines(contamination_report: Dictionary) -> Array[String]:
	var lines: Array[String] = []
	if not bool(contamination_report.get("changed", false)):
		return lines
	lines.append("지역 오염 기록: %s" % str(contamination_report.get("summary", "오염 꼬리표")))
	match str(contamination_report.get("last_ticket", "")):
		MetaProgression.TICKET_SIGNAL:
			lines.append("다음 출격 변화: 오픈하우스/모델하우스 신호 감사가 더 민감해집니다.")
		MetaProgression.TICKET_POWER:
			lines.append("다음 출격 변화: 로봇 검수와 장갑 광고 비중이 오릅니다.")
		MetaProgression.TICKET_FOOD:
			lines.append("다음 출격 변화: 끊긴 광고 산책로의 식량태그 감사가 더 까다로워집니다.")
		_:
			lines.append("다음 출격 변화: R01 지역 감사 압력이 오릅니다.")
	return lines

func _signal_clue_reward_lines(signal_report: Dictionary) -> Array[String]:
	var lines: Array[String] = []
	var gained := Array(signal_report.get("gained", []))
	if not gained.is_empty():
		lines.append("신호 단서 획득: %s" % ", ".join(meta_progression.signal_clue_labels(gained)))
	var duplicates := int(signal_report.get("duplicate_flyers_awarded", 0))
	if duplicates > 0:
		lines.append("중복 신호 단서 전환: 찢어진 광고 전단 +%d" % duplicates)
	if not gained.is_empty() or duplicates > 0:
		lines.append("신호 추적 진행도: %d/%d" % [int(signal_report.get("count", 0)), int(signal_report.get("required", 3))])
	return lines

func _sync_boss_signal_from_clues() -> void:
	if meta_progression.boss_clear_count > 0 or boss_signal_state == "silent":
		return
	var clue_count := meta_progression.signal_clue_count()
	if clue_count >= 3:
		if _boss_signal_rank(boss_signal_state) < 3:
			boss_signal_state = "near"
		boss_signal_unlocked = true
	elif clue_count == 2:
		if _boss_signal_rank(boss_signal_state) < 2:
			boss_signal_state = "detected"
		boss_signal_unlocked = false
	elif clue_count == 1:
		if _boss_signal_rank(boss_signal_state) < 1:
			boss_signal_state = "faint"
		boss_signal_unlocked = false
	else:
		boss_signal_unlocked = false

func _show_supply_depot() -> void:
	match_state = "supply"
	game_over = false
	first_recall_done = true
	first_sortie = false
	paused_for_card = false
	if is_inside_tree():
		get_tree().paused = false
	last_supply_reaction_line = ""
	last_supply_action_surface = meta_progression.last_outpost_facility_id()
	r01_campaign_map_open = false
	hud.hide_campaign_map()
	current_supply_actions = _build_supply_actions()
	hud.show_supply_depot(meta_progression, Callable(self, "_apply_supply_choice"), Callable(self, "_restart"), "", _session_progress_data(), current_supply_actions, Callable(self, "_open_r01_campaign_map"))
	_set_music("amb_outpost_loop")
	_play_sfx("outpost_return")

func _handle_terminal_action() -> void:
	match match_state:
		"recalled", "boss_victory":
			_show_supply_depot()
		"victory", "game_over":
			if _should_show_supply_after_result(match_state):
				_show_supply_depot()
			else:
				_restart()
		"supply":
			_restart()
		_:
			_restart()

func _reset_r01_campaign_state() -> void:
	r01_campaign_node_states = R01CampaignMap.initial_states()
	current_r01_node_id = R01CampaignMap.NODE_L01
	selected_r01_node_id = R01CampaignMap.NODE_L01
	last_completed_r01_node_id = ""
	r01_campaign_map_open = false
	r01_campaign_new_signal_node_ids.clear()

func _open_r01_campaign_map() -> void:
	if match_state != "supply":
		return
	_ensure_selected_r01_campaign_node()
	r01_campaign_map_open = true
	hud.show_campaign_map(_r01_campaign_map_data(), Callable(self, "_select_r01_campaign_node"), Callable(self, "_sortie_r01_campaign_node"), Callable(self, "_close_r01_campaign_map"))
	_update_hud()

func _close_r01_campaign_map() -> void:
	r01_campaign_map_open = false
	hud.hide_campaign_map()
	_update_hud()

func _select_r01_campaign_node(node_id: String) -> void:
	if not R01CampaignMap.NODE_IDS.has(node_id):
		return
	if not R01CampaignMap.is_node_selectable(node_id, r01_campaign_node_states):
		selected_r01_node_id = node_id
		effects.show_combat_banner("%s: 아직 게시판 신호가 잠겨 있습니다" % R01CampaignMap.node_name(node_id), C.NEON_RED)
		if r01_campaign_map_open:
			hud.update_campaign_map(_r01_campaign_map_data())
		return
	selected_r01_node_id = node_id
	if r01_campaign_map_open:
		hud.update_campaign_map(_r01_campaign_map_data())
	effects.show_combat_banner("%s 선택" % R01CampaignMap.node_name(node_id), C.VITAMIN_YELLOW)

func _sortie_r01_campaign_node(node_id: String) -> void:
	if R01CampaignMap.NODE_IDS.has(node_id):
		selected_r01_node_id = node_id
	_sortie_selected_r01_campaign_node()

func _sortie_selected_r01_campaign_node() -> void:
	if not R01CampaignMap.is_node_selectable(selected_r01_node_id, r01_campaign_node_states):
		effects.show_combat_banner("잠긴 작전 지점입니다", C.NEON_RED)
		if r01_campaign_map_open:
			hud.update_campaign_map(_r01_campaign_map_data())
		return
	current_r01_node_id = selected_r01_node_id
	r01_campaign_new_signal_node_ids.clear()
	_mark_current_campaign_node_visited()
	_close_r01_campaign_map()
	_restart()

func _ensure_selected_r01_campaign_node() -> void:
	if R01CampaignMap.is_node_selectable(selected_r01_node_id, r01_campaign_node_states):
		return
	selected_r01_node_id = R01CampaignMap.first_selectable_node_id(r01_campaign_node_states, R01CampaignMap.NODE_L01)

func _mark_current_campaign_node_visited() -> void:
	var state := String(r01_campaign_node_states.get(current_r01_node_id, R01CampaignMap.STATE_LOCKED))
	if state == R01CampaignMap.STATE_AVAILABLE or state == R01CampaignMap.STATE_SELECTED or state == R01CampaignMap.STATE_DANGER or state == R01CampaignMap.STATE_BOSS_READY:
		r01_campaign_node_states[current_r01_node_id] = R01CampaignMap.STATE_VISITED

func _complete_current_campaign_node(_result_state: String) -> void:
	if not R01CampaignMap.NODE_IDS.has(current_r01_node_id):
		return
	var previous_state := String(r01_campaign_node_states.get(current_r01_node_id, R01CampaignMap.STATE_LOCKED))
	if previous_state != R01CampaignMap.STATE_LOCKED:
		r01_campaign_node_states[current_r01_node_id] = R01CampaignMap.STATE_CLEARED
	last_completed_r01_node_id = current_r01_node_id
	match current_r01_node_id:
		R01CampaignMap.NODE_L01:
			_unlock_r01_campaign_node(R01CampaignMap.NODE_L02, R01CampaignMap.STATE_AVAILABLE)
			_unlock_r01_campaign_node(R01CampaignMap.NODE_L04, R01CampaignMap.STATE_DANGER)
		R01CampaignMap.NODE_L02:
			_unlock_r01_campaign_node(R01CampaignMap.NODE_L03, R01CampaignMap.STATE_BOSS_READY)
			_unlock_r01_campaign_node(R01CampaignMap.NODE_L04, R01CampaignMap.STATE_AVAILABLE)
			_unlock_r01_campaign_node(R01CampaignMap.NODE_L05, R01CampaignMap.STATE_DANGER)
		R01CampaignMap.NODE_L03:
			_unlock_r01_campaign_node(R01CampaignMap.NODE_L05, R01CampaignMap.STATE_DANGER)
		R01CampaignMap.NODE_L04:
			if String(r01_campaign_node_states.get(R01CampaignMap.NODE_L02, "")) == R01CampaignMap.STATE_CLEARED:
				_unlock_r01_campaign_node(R01CampaignMap.NODE_L03, R01CampaignMap.STATE_BOSS_READY)
		_:
			pass
	_ensure_selected_r01_campaign_node()

func _unlock_r01_campaign_node(node_id: String, state: String) -> void:
	var current_state := String(r01_campaign_node_states.get(node_id, R01CampaignMap.STATE_LOCKED))
	if current_state == R01CampaignMap.STATE_LOCKED:
		r01_campaign_node_states[node_id] = state
		if not r01_campaign_new_signal_node_ids.has(node_id):
			r01_campaign_new_signal_node_ids.append(node_id)

func _r01_campaign_map_data() -> Dictionary:
	return {
		"raw_states": r01_campaign_node_states.duplicate(true),
		"display_states": _r01_campaign_display_states(),
		"selected_node_id": selected_r01_node_id,
		"current_node_id": current_r01_node_id,
		"last_completed_node_id": last_completed_r01_node_id,
		"opened_node_ids": r01_campaign_new_signal_node_ids.duplicate(),
		"change_banner": _r01_campaign_change_banner(),
		"tag_context": meta_progression.tag_context(),
	}

func _r01_campaign_display_states() -> Dictionary:
	var display_states := r01_campaign_node_states.duplicate(true)
	var l03_state := String(display_states.get(R01CampaignMap.NODE_L03, R01CampaignMap.STATE_LOCKED))
	if _boss_route_ready() and l03_state != R01CampaignMap.STATE_LOCKED and l03_state != R01CampaignMap.STATE_CLEARED:
		display_states[R01CampaignMap.NODE_L03] = R01CampaignMap.STATE_BOSS_READY
	if selected_r01_node_id != "" and R01CampaignMap.NODE_IDS.has(selected_r01_node_id):
		display_states[selected_r01_node_id] = R01CampaignMap.STATE_SELECTED
	return display_states

func _r01_campaign_change_banner() -> String:
	var lines: Array[String] = []
	for node_id in r01_campaign_new_signal_node_ids:
		var state := String(r01_campaign_node_states.get(node_id, R01CampaignMap.STATE_AVAILABLE))
		lines.append(R01CampaignMap.opened_signal_line(node_id, state))
	if last_completed_r01_node_id != "":
		lines.append("%s 회수선 고정" % R01CampaignMap.node_name(last_completed_r01_node_id))
	if lines.is_empty():
		return "작전도: 외곽 회수선 기준 설정"
	return " / ".join(lines)

func _r01_campaign_board_line() -> String:
	var line := "작전도: %s 선택 / 목표 %s" % [
		R01CampaignMap.node_name(selected_r01_node_id),
		R01CampaignMap.node_objective(selected_r01_node_id),
	]
	var tag_hint := R01CampaignMap.node_tag_hint(selected_r01_node_id, meta_progression.tag_context())
	if tag_hint != "":
		line = "%s / %s" % [line, tag_hint]
	if not r01_campaign_new_signal_node_ids.is_empty():
		line = "%s / %s" % [line, _r01_campaign_change_banner()]
	return line

func _r01_campaign_start_position(node_id: String) -> Vector2:
	if not R01LayoutBlockout.ENABLED:
		return Vector2.ZERO
	var zone_id := R01CampaignMap.node_zone_id(node_id)
	var start_pos := r01_blockout.anchor_position(zone_id) + R01CampaignMap.node_start_offset(node_id)
	return r01_blockout.clamp_player_position(start_pos)

func _arm_entry_camera_for_node(node_id: String) -> void:
	entry_camera_offset = R01CampaignMap.node_entry_camera_offset(node_id)
	entry_camera_timer = ENTRY_CAMERA_PAN_DURATION
	if camera != null:
		camera.global_position = _camera_target_position().round()

func _sync_r01_map_to_player_zone(show_entry_notice: bool) -> void:
	if not R01LayoutBlockout.ENABLED:
		return
	var zone_id := r01_blockout.nearest_zone_id(player_pos)
	r01_map.update(0.0, elapsed, show_entry_notice, zone_id)

func _apply_supply_choice(index: int) -> void:
	if index < 0 or index >= current_supply_actions.size():
		return
	var action := current_supply_actions[index]
	var action_name := String(action.get("name", ""))
	last_supply_action_surface = String(action.get("facility_surface", ""))
	var applied := false
	match String(action.get("kind", "")):
		"allocation":
			var allocation_id := String(action.get("allocation_id", ""))
			applied = meta_progression.allocate_ticket(allocation_id)
			if applied:
				last_supply_reaction_line = meta_progression.last_allocation_reaction()
		"upgrade":
			applied = meta_progression.buy(String(action.get("upgrade_id", "")))
			if applied:
				var surface_label := outpost_blockout.natural_action_surface_label(last_supply_action_surface)
				last_supply_reaction_line = "%s가 %s 항목을 출격 전 점검표에 올렸습니다." % [surface_label, action_name]
	if applied:
		boss.set_core_expose_bonus(meta_progression.core_expose_bonus())
		effects.show_combat_banner("보급소 적용: %s" % action_name, C.TOXIC_GREEN)
		effects.add_status_ring(player_pos, C.TOXIC_GREEN, 36.0, 0.42)
		effects.add_impact_shake(0.14, 2.2)
		_play_sfx("upgrade_buy")
	else:
		effects.add_floater(player_pos, "배분/흔적 부족", C.NEON_RED, 13)
		action_name = ""
		last_supply_reaction_line = ""
		last_supply_action_surface = ""
	current_supply_actions = _build_supply_actions()
	hud.show_supply_depot(meta_progression, Callable(self, "_apply_supply_choice"), Callable(self, "_restart"), action_name, _session_progress_data(), current_supply_actions, Callable(self, "_open_r01_campaign_map"))

func _build_supply_actions() -> Array[Dictionary]:
	var actions: Array[Dictionary] = []
	actions.append(_allocation_action(
		MetaProgression.ALLOCATION_HUMAN_ZONE,
		"식량태그 배분: 인간 구역",
		"다음 출격 최대 HP +8 / 인간 구역 안정 +1",
		MetaProgression.TICKET_FOOD,
		"식량태그 1",
		1
	))
	actions.append(_allocation_action(
		MetaProgression.ALLOCATION_ROBOT_MAINTENANCE,
		"충전태그 배분: 정비대",
		"다음 출격 차징 피해 +1, 쿨다운 -0.15초",
		MetaProgression.TICKET_POWER,
		"충전태그 1",
		2
	))
	actions.append(_allocation_action(
		MetaProgression.ALLOCATION_SIGNAL_BOARD,
		"수신태그 배분: 출격 게시판",
		"오픈하우스 신호 기준 완화 / 목표 표시 강화",
		MetaProgression.TICKET_SIGNAL,
		"수신태그 1",
		3
	))
	var upgrades: Array = meta_progression.upgrade_defs()
	for i in range(upgrades.size()):
		var upgrade: Dictionary = upgrades[i]
		var upgrade_id := String(upgrade["id"])
		var facility_surface := _upgrade_facility_surface(upgrade)
		var can_buy := meta_progression.can_buy(upgrade_id)
		var unlocked := meta_progression.is_unlocked(upgrade_id)
		var level := meta_progression.upgrade_level(upgrade_id)
		var max_level := int(upgrade.get("max_level", 1))
		var state_text := "최대" if level >= max_level else ("선택 가능" if can_buy else ("잠김" if not unlocked else "흔적 부족"))
		var unlock_text := ""
		if not unlocked:
			unlock_text = " | 해금: %s" % meta_progression.unlock_condition_label(str(upgrade.get("unlock_condition", "")))
		actions.append({
			"kind": "upgrade",
			"upgrade_id": upgrade_id,
			"name": String(upgrade["name"]),
			"state": state_text,
			"level": level,
			"max_level": max_level,
			"effect_text": String(upgrade["effect_text"]),
			"cost_text": "%d %s" % [int(upgrade["cost"]), str(upgrade.get("trace_label", "전단"))],
			"input_hint": "키%d/클릭" % [i + 4] if i < 1 else "클릭",
			"can_use": can_buy,
			"locked": not unlocked,
			"applied": level >= max_level,
			"facility_surface": facility_surface,
			"surface_label": _facility_surface_label(facility_surface),
			"prefix": _facility_surface_prefix(facility_surface),
			"extra": unlock_text,
		})
	return actions

func _allocation_action(allocation_id: String, name: String, effect_text: String, ticket_id: String, cost_text: String, input_number: int) -> Dictionary:
	var count := meta_progression.ticket_count(ticket_id)
	var can_use := count > 0
	var reaction_preview := meta_progression.allocation_preview_line(allocation_id)
	var facility_surface := _allocation_facility_surface(allocation_id)
	return {
		"kind": "allocation",
		"allocation_id": allocation_id,
		"name": name,
		"state": "배분 가능" if can_use else "태그 없음",
		"level": meta_progression.allocation_count(allocation_id),
		"max_level": 99,
		"effect_text": effect_text,
		"cost_text": "%s / 보유 %d" % [cost_text, count],
		"input_hint": "키%d/클릭" % input_number,
		"can_use": can_use,
		"locked": false,
		"applied": false,
		"facility_surface": facility_surface,
		"surface_label": _facility_surface_label(facility_surface),
		"prefix": _facility_surface_prefix(facility_surface),
		"extra": "  %s" % reaction_preview if reaction_preview != "" else "",
	}

func _allocation_facility_surface(allocation_id: String) -> String:
	match allocation_id:
		MetaProgression.ALLOCATION_HUMAN_ZONE:
			return "settlement_counter"
		MetaProgression.ALLOCATION_ROBOT_MAINTENANCE:
			return "maintenance_bench"
		MetaProgression.ALLOCATION_SIGNAL_BOARD:
			return "sortie_board"
		_:
			return "settlement_counter"

func _upgrade_facility_surface(upgrade: Dictionary) -> String:
	var category := String(upgrade.get("category", ""))
	var upgrade_name := String(upgrade.get("name", ""))
	var trace_label := String(upgrade.get("trace_label", ""))
	if trace_label == "파편" or category == "보스 대응":
		return "name_archive"
	if category == "차징" or upgrade_name.find("차징") != -1 or upgrade_name.find("코일") != -1:
		return "charging_tuner"
	if category == "신호 분석" or upgrade_name.find("신호") != -1 or upgrade_name.find("좌표") != -1:
		return "sortie_board"
	if category == "성장/XP" or upgrade_name.find("복기") != -1 or upgrade_name.find("학습") != -1:
		return "trace_storage_room"
	return "maintenance_bench"

func _facility_surface_label(surface_id: String) -> String:
	return outpost_blockout.natural_action_surface_label(surface_id)

func _facility_surface_prefix(surface_id: String) -> String:
	match surface_id:
		"settlement_counter":
			return "정산"
		"maintenance_bench":
			return "정비"
		"charging_tuner":
			return "조율"
		"name_archive":
			return "보관"
		"sortie_board":
			return "게시"
		"trace_storage_room":
			return "흔적"
		"sortie_gate":
			return "출격"
		_:
			return "보급"

func _show_level_card() -> void:
	if match_state != "playing":
		return
	match_state = "level_up"
	paused_for_card = true
	if is_inside_tree():
		get_tree().paused = true
	player_stats["selected_card_count"] = selected_card_count
	offered_cards = LevelUpCards.pick_three(rng, player_stats)
	_apply_charge_weapon_card_hints(offered_cards)
	hud.show_level_cards(offered_cards, Callable(self, "_apply_card_choice"))

func _apply_card_choice(index: int) -> void:
	if index < 0 or index >= offered_cards.size():
		return
	var card := offered_cards[index]
	_record_card_choice(card)
	_record_playtest_card_choice()
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
		"return_label_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["charge_damage_mult"] = float(player_stats["charge_damage_mult"]) + 0.08
			effects.add_floater(player_pos, "반품 표식 강화!", C.NEON_RED, 13)
		"flyer_pop_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["kill_burst_level"] = int(player_stats["kill_burst_level"]) + int(value)
			effects.add_floater(player_pos, "전단 연쇄 승인!", C.CORAL_PINK, 13)
		"broadcast_residue_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["charge_puddle_level"] = int(player_stats["charge_puddle_level"]) + int(value)
			player_stats["open_house_processing_bonus"] = float(player_stats["open_house_processing_bonus"]) + 0.08
			effects.add_floater(player_pos, "송출 잔류!", C.VITAMIN_YELLOW, 13)
		"robot_command_flip_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["charge_slow_level"] = int(player_stats["charge_slow_level"]) + int(value)
			effects.add_floater(player_pos, "명령 오류!", C.TOXIC_GREEN, 13)
		"overtime_sheet_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["audit_threshold_mult"] = float(player_stats["audit_threshold_mult"]) - 0.04
			effects.add_floater(player_pos, "야근 정산 등록", C.VITAMIN_YELLOW, 13)
		"battery_receipt_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["audit_processing_mult"] = float(player_stats["audit_processing_mult"]) + 0.04
			effects.add_floater(player_pos, "충전태그 판정 준비", C.TOXIC_GREEN, 13)
		"open_house_checkin_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["open_house_processing_bonus"] = float(player_stats["open_house_processing_bonus"]) + 0.18
			effects.add_floater(player_pos, "방문 확인!", C.VITAMIN_YELLOW, 13)
		"low_hp_allowance_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["low_hp_damage_reduction"] = float(player_stats["low_hp_damage_reduction"]) + 0.05
			effects.add_floater(player_pos, "위험수당 계약", C.CORAL_PINK, 13)
		"normal_customer_sticker_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["audit_threshold_mult"] = float(player_stats["audit_threshold_mult"]) - 0.08
			player_stats["terms_pressure_level"] = int(player_stats["terms_pressure_level"]) + 1
			audit_pressure_level += 1
			effects.add_floater(player_pos, "정상 고객?", C.VITAMIN_YELLOW, 13)
		"family_discount_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["open_house_processing_bonus"] = float(player_stats["open_house_processing_bonus"]) + 0.22
			player_stats["terms_pressure_level"] = int(player_stats["terms_pressure_level"]) + 1
			audit_pressure_level += 1
			effects.add_floater(player_pos, "가족 할인 적용", C.NEON_RED, 13)
		"no_return_agreement_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["charge_damage_mult"] = float(player_stats["charge_damage_mult"]) + 0.40
			player_stats["terms_failure_risk"] = int(player_stats["terms_failure_risk"]) + 1
			effects.add_floater(player_pos, "반품 불가!", C.NEON_RED, 13)
		"terms_auto_renewal_level":
			player_stats[effect] = int(player_stats[effect]) + int(value)
			player_stats["audit_processing_mult"] = float(player_stats["audit_processing_mult"]) + 0.08
			player_stats["terms_pressure_level"] = int(player_stats["terms_pressure_level"]) + 1
			audit_pressure_level += 1
			effects.add_floater(player_pos, "자동 갱신됨", C.NEON_RED, 13)
		"max_hp_bonus":
			player_stats["max_hp"] = float(player_stats["max_hp"]) + value
			player_hp = minf(float(player_stats["max_hp"]), player_hp + value)
		"heal":
			player_hp = minf(float(player_stats["max_hp"]), player_hp + value)

func _record_card_choice(card: Dictionary) -> void:
	var card_counts: Dictionary = player_stats["card_counts"]
	var card_id := String(card["id"])
	card_counts[card_id] = int(card_counts.get(card_id, 0)) + 1
	var build_counts: Dictionary = player_stats["build_counts"]
	var tags: Array = card.get("build_tags", [])
	for tag_value in tags:
		var tag := String(tag_value)
		build_counts[tag] = int(build_counts.get(tag, 0)) + 1

func _card_count(card_id: String) -> int:
	var card_counts: Dictionary = player_stats.get("card_counts", {})
	return int(card_counts.get(card_id, 0))

func _build_count(tag: String) -> int:
	var build_counts: Dictionary = player_stats.get("build_counts", {})
	return int(build_counts.get(tag, 0))

func _apply_charge_weapon_card_hints(cards: Array[Dictionary]) -> void:
	for card in cards:
		var hint := _charge_weapon_card_hint(String(card.get("id", "")))
		if hint != "":
			card["weapon_hint"] = "%s: %s" % [_charge_weapon_name(), hint]

func _charge_weapon_card_hint(card_id: String) -> String:
	match card_id:
		"tool_return_label":
			return "표식 처리가 감사 처리량을 더 만듭니다."
		"tool_flyer_pop":
			return "표식 처리와 전단 폭발이 이어집니다."
		"tool_broadcast_residue":
			return "차징 흔적이 바닥에 남아 구역을 장악합니다."
		"tool_robot_command_flip":
			return "로봇형 적을 오류 상태로 묶습니다."
		"terms_no_return_agreement":
			return "차징 피해가 크게 오르지만 실패 정산이 위험해집니다."
	return ""

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
	_play_sfx("return_stamp_hit", 1.08 if directed else 0.92)
	effects.fire_feedback(directed)

func _active_notice_text() -> String:
	if wave_notice_timer > 0.0:
		return wave_notice_text
	return r01_map.active_notice_text()

func _update_hud() -> void:
	var terminal_state := match_state == "game_over" or match_state == "victory" or match_state == "recalled" or match_state == "boss_victory" or match_state == "supply"
	hud.update(player_hp, float(player_stats["max_hp"]), charge_window_left, charge_timer, _charge_period(), _charge_window(), _charge_state(), elapsed, C.MATCH_DURATION, level, kills, enemies.enemies.size(), paused_for_card, terminal_state, _active_notice_text(), _route_stage_label(), _combat_goal_label(), _charge_weapon_name(), _audit_hud_data(), _ration_hud_data())
	hud.update_boss(boss.active, BossController.BOSS_NAME, boss.hp_ratio(), boss.status_label(), boss.defense_type)
	hud.set_debug_text(_debug_overlay_text())

func _debug_overlay_text() -> String:
	if not C.DEBUG_TOOLS_ENABLED:
		return ""
	var sections: Array[String] = []
	var help := debug_tools.help_text()
	if help != "":
		sections.append(help)
	if debug_tools.detail_debug_visible():
		var detail := debug_tools.detail_text(_debug_info())
		if detail != "":
			sections.append(detail)
	return "\n\n".join(sections)

func _debug_info() -> Dictionary:
	_sync_boss_signal_from_clues()
	var wave_params := _wave_params_for_elapsed(elapsed)
	var r01_summary := _r01_phrase_state()
	var r01_collision_summary := r01_blockout.collision_summary() if R01LayoutBlockout.ENABLED else {}
	var r01_layer_summary := r01_blockout.layer_summary() if R01LayoutBlockout.ENABLED else {}
	var r01_source_zone := R01CampaignMap.node_zone_id(current_r01_node_id)
	var r01_last_source_spawn := r01_blockout.last_source_spawn_debug() if R01LayoutBlockout.ENABLED else {}
	var r01_last_hazard_source := r01_blockout.last_hazard_source_debug() if R01LayoutBlockout.ENABLED else {}
	var outpost_state := outpost_blockout.state_from_progress(_session_progress_data(), meta_progression)
	var outpost_collision_summary := outpost_blockout.collision_summary(outpost_state)
	return {
		"match_state": match_state,
		"elapsed": elapsed,
		"match_duration": C.MATCH_DURATION,
		"wave_name": wave_params["name"],
		"r01_zone_id": r01_map.current_zone_id(),
		"r01_zone_name": r01_map.current_zone_name(),
		"r01_zone_debug_label": r01_map.current_debug_label(),
		"current_r01_node_id": current_r01_node_id,
		"selected_r01_node_id": selected_r01_node_id,
		"last_completed_r01_node_id": last_completed_r01_node_id,
		"r01_campaign_map_open": r01_campaign_map_open,
		"r01_campaign_node_state_summary": R01CampaignMap.state_summary(r01_campaign_node_states),
		"r01_campaign_new_signal_summary": _r01_campaign_change_banner(),
		"r01_campaign_current_phrase": R01CampaignMap.node_blockout_phrase(current_r01_node_id),
		"r01_campaign_start_pos": "%d,%d" % [int(round(_r01_campaign_start_position(current_r01_node_id).x)), int(round(_r01_campaign_start_position(current_r01_node_id).y))],
		"r01_campaign_spawn_bias": R01CampaignMap.node_spawn_bias(current_r01_node_id),
		"r01_campaign_spawn_axis": R01CampaignMap.node_spawn_axis_label(current_r01_node_id),
		"r01_source_zone_id": r01_source_zone,
		"r01_active_source_count": r01_blockout.active_source_count() if R01LayoutBlockout.ENABLED else 0,
		"r01_source_summary": r01_blockout.source_summary_line(r01_source_zone) if R01LayoutBlockout.ENABLED else "",
		"r01_hazard_source_summary": r01_blockout.hazard_summary_line(r01_source_zone) if R01LayoutBlockout.ENABLED else "",
		"r01_source_spawn_bias": "%s/%s/%s" % [
			str(r01_last_source_spawn.get("role", "")),
			str(r01_last_source_spawn.get("source_role", "")),
			str(r01_last_source_spawn.get("source_id", "")),
		],
		"r01_hazard_source_bias": "%s/%s/%s" % [
			str(r01_last_hazard_source.get("hazard_role", "")),
			str(r01_last_hazard_source.get("source_role", "")),
			str(r01_last_hazard_source.get("source_id", "")),
		],
		"r01_blockout_enabled": R01LayoutBlockout.ENABLED,
		"r01_blockout_variant": r01_blockout.state_variant,
		"r01_blockout_nearest": r01_blockout.nearest_zone_id(player_pos),
		"r01_blockout_world": "%.0fx%.0f" % [R01LayoutBlockout.WORLD_BOUNDS.size.x, R01LayoutBlockout.WORLD_BOUNDS.size.y],
		"r01_blockout_screens": r01_blockout.world_screen_count(),
		"r01_open_house_time": _open_house_time(),
		"r01_open_house_signal_stage": open_house_signal_stage,
		"r01_zone_times": r01_zone_times,
		"r01_collision_hard": int(r01_collision_summary.get(R01LayoutBlockout.COLLISION_HARD, 0)),
		"r01_collision_soft": int(r01_collision_summary.get(R01LayoutBlockout.COLLISION_SOFT, 0)),
		"r01_collision_hazard": int(r01_collision_summary.get(R01LayoutBlockout.COLLISION_HAZARD, 0)),
		"r01_collision_trigger": int(r01_collision_summary.get(R01LayoutBlockout.COLLISION_TRIGGER, 0)),
		"r01_collision_none": int(r01_collision_summary.get(R01LayoutBlockout.COLLISION_NONE, 0)),
		"r01_pathing_probe": r01_blockout.pathing_probe_label() if R01LayoutBlockout.ENABLED else "",
		"r01_object_count": r01_blockout.object_count() if R01LayoutBlockout.ENABLED else 0,
		"r01_layer_ground_patch": int(r01_layer_summary.get("ground_patch", 0)),
		"r01_layer_ground_decal": int(r01_layer_summary.get("ground_decal", 0)),
		"r01_layer_travel_corridor": int(r01_layer_summary.get("travel_corridor", 0)),
		"r01_layer_hazard_decal": int(r01_layer_summary.get("hazard_decal", 0)),
		"r01_layer_blocker_back": int(r01_layer_summary.get("blocker_back", 0)),
		"r01_layer_prop_mid": int(r01_layer_summary.get("prop_mid", 0)),
		"r01_asset_key_sample": ", ".join(r01_blockout.asset_key_sample()) if R01LayoutBlockout.ENABLED else "",
		"outpost_variant": str(outpost_state.get("variant", "")),
		"outpost_facility_count": outpost_blockout.facility_count(),
		"outpost_world_bounds": "%.0fx%.0f" % [OutpostLayoutBlockout.WORLD_BOUNDS.size.x, OutpostLayoutBlockout.WORLD_BOUNDS.size.y],
		"outpost_collision_hard": int(outpost_collision_summary.get(OutpostLayoutBlockout.COLLISION_HARD, 0)),
		"outpost_collision_soft": int(outpost_collision_summary.get(OutpostLayoutBlockout.COLLISION_SOFT, 0)),
		"outpost_collision_interaction": int(outpost_collision_summary.get(OutpostLayoutBlockout.COLLISION_INTERACTION, 0)),
		"outpost_collision_decorative": int(outpost_collision_summary.get(OutpostLayoutBlockout.COLLISION_DECORATIVE, 0)),
		"outpost_collision_exit": int(outpost_collision_summary.get(OutpostLayoutBlockout.COLLISION_EXIT, 0)),
		"outpost_facility_state_summary": outpost_blockout.facility_state_summary_line(outpost_state),
		"outpost_tag_allocation_summary": outpost_blockout.tag_allocation_summary(outpost_state),
		"outpost_result_route_target": outpost_blockout.result_route_target(outpost_state),
		"outpost_selected_action_surface": outpost_blockout.selected_action_surface(outpost_state),
		"outpost_ui_bounds_summary": hud.outpost_ui_bounds_summary(),
		"outpost_debug_lines": outpost_blockout.debug_lines(outpost_state),
		"recall_quality": String(last_run_result.get("recall_quality", "")),
		"settlement_tag_ledger": JSON.stringify(last_run_result.get("settlement_tag_ledger", {})),
		"settlement_tag_ledger_line": String(last_run_result.get("settlement_tag_ledger_line", "")),
		"anti_farm_reason": String(last_run_result.get("anti_farm_reason", "")),
		"tag_access_hints": R01CampaignMap.all_tag_hint_summary(meta_progression.tag_context()),
		"current_node_tag_context": R01CampaignMap.node_tag_hint(current_r01_node_id, meta_progression.tag_context()),
		"enemy_role_summary": enemies.role_summary(),
		"threat_count": active_threats.size(),
		"last_threat_label": last_threat_label,
		"enemy_count": enemies.enemies.size(),
		"enemy_cap": C.ENEMY_CAP,
		"player_hp": player_hp,
		"max_hp": float(player_stats["max_hp"]),
		"level": level,
		"xp": xp,
		"charge_weapon": _charge_weapon_name(),
		"charge_state": _charge_state(),
		"charge_timer": charge_timer,
		"charge_period": _charge_period(),
		"charge_window_left": charge_window_left,
		"selected_card_count": selected_card_count,
		"audit_segment_index": audit_segment_index,
		"audit_processing": audit_processing,
		"audit_total_processing": audit_total_processing,
		"audit_progress_ratio": _audit_progress_ratio(),
		"audit_pass_count": audit_pass_count,
		"audit_fail_count": audit_fail_count,
		"audit_pressure_level": audit_pressure_level,
		"audit_last_result": audit_last_result,
		"audit_processing_mult": float(player_stats.get("audit_processing_mult", 0.0)),
		"audit_threshold_mult": float(player_stats.get("audit_threshold_mult", 0.0)),
		"playtest_live_summary": _playtest_metrics_summary(),
		"last_playtest_summary": _last_playtest_metrics_summary(),
		"mid_event_triggered": mid_event_triggered,
		"sortie_index": sortie_index,
		"session_depth": sortie_index,
		"preboss_stage": _preboss_stage_label(),
		"route_stage_label": _route_stage_label(),
		"next_goal_label": _next_goal_label(),
		"boss_route_ready": _boss_route_ready(),
		"boss_signal_state": boss_signal_state,
		"boss_signal_unlocked": boss_signal_unlocked,
		"boss_active": boss.active,
		"boss_state": boss.state,
		"boss_phase": boss.phase,
		"boss_hp": boss.hp,
		"boss_max_hp": boss.max_hp,
		"boss_defense": boss.defense_type,
		"first_sortie": first_sortie,
		"first_recall_done": first_recall_done,
		"recall_stage": recall_event_stage,
		"fps": Engine.get_frames_per_second(),
		"trace_torn_ad_flyer": meta_progression.trace_count(),
		"trace_campaign_core_fragment": meta_progression.trace_count("campaign_core_fragment"),
		"signal_clue_count": meta_progression.signal_clue_count(),
		"signal_clue_required": MetaProgression.SIGNAL_CLUES.size(),
		"boss_analysis_level": meta_progression.boss_analysis_level,
		"boss_clear_count": meta_progression.boss_clear_count,
		"smile_home_boss_outcome": meta_progression.smile_home_boss_outcome,
		"smile_home_boss_outcome_label": meta_progression.smile_home_boss_outcome_label(),
		"r01_revisit_count": int(r01_summary.get("r01_revisit_count", 0)),
		"r01_signal_records_found": int(r01_summary.get("r01_signal_records_found", 0)),
		"r01_boss_outcome": str(r01_summary.get("r01_boss_outcome", "")),
		"r01_campaign_pressure": int(r01_summary.get("r01_campaign_pressure", 0)),
		"r01_trace_preserved_count": int(r01_summary.get("r01_trace_preserved_count", 0)),
		"r01_trace_consumed_count": int(r01_summary.get("r01_trace_consumed_count", 0)),
		"r01_campaign_used_count": int(r01_summary.get("r01_campaign_used_count", 0)),
		"r01_sortie_goal_phrase": RoutePhraseResolver.r01_sortie_goal_phrase(r01_summary),
		"r01_outpost_phrase": RoutePhraseResolver.r01_outpost_phrase(r01_summary),
		"meta_summary": meta_progression.upgrade_summary(),
	}

func _debug_force_level_up() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	_show_level_card()

func _debug_open_charge() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	charge_timer = _charge_period()
	charge_window_left = _charge_window()
	charge_open_age = 0.0
	charge_warning_played = false
	charge_ready_flash = C.CHARGE_READY_FLASH
	charge_miss_notice = 0.0
	effects.show_charge_ready()
	_play_sfx("return_stamp_ready", 1.0, 0.0)

func _debug_drop_hp() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	player_hp = minf(player_hp, 20.0)

func _debug_jump_time(seconds: float) -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	elapsed = clampf(seconds, 0.0, C.MATCH_DURATION)
	r01_map.force_elapsed(elapsed, true)
	if elapsed >= WaveDirector.MID_EVENT_TIME:
		mid_event_triggered = true
	_update_preboss_signal_events()
	if WaveDirector.is_finale(elapsed):
		_show_wave_notice("피날레: 마지막 광고 공세")
	enemies.spawn_timer = 0.0
	_check_victory()

func _debug_jump_preboss_signal(target_sortie_index: int, seconds: float) -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	sortie_index = maxi(target_sortie_index, 1)
	first_sortie = sortie_index <= 1
	first_recall_done = sortie_index > 1
	preboss_signal_event_stage = 0
	if sortie_index <= 2:
		boss_signal_state = "none"
		boss_signal_unlocked = false
	elif sortie_index == 3:
		boss_signal_state = "faint"
		boss_signal_unlocked = false
	else:
		boss_signal_state = "detected"
		boss_signal_unlocked = false
	_debug_jump_time(seconds)

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

func _debug_start_boss() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	first_sortie = false
	first_recall_done = true
	meta_progression.grant_signal_clue_candidates(["faint_signal", "detected_signal", "near_signal"])
	_sync_boss_signal_from_clues()
	elapsed = maxf(elapsed, 240.0)
	_start_boss_encounter()

func _debug_boss_phase_preview() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	if not boss.active:
		_debug_start_boss()
	boss.force_phase_two_preview()
	effects.show_combat_banner("보스 코어 강제 노출", C.TOXIC_GREEN)

func _debug_boss_enrage_preview() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	if not boss.active:
		_debug_start_boss()
	boss.force_enraged_preview()
	effects.show_combat_banner("마지막 방송", C.NEON_RED)

func _debug_boss_distortion() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	if not boss.active:
		_debug_start_boss()
	boss.force_distortion()
	effects.show_combat_banner("행복 기준 재조정", Color(0.35, 0.70, 0.95))

func _debug_boss_safety_demo() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	if not boss.active:
		_debug_start_boss()
	boss.force_safety_demo(player_pos)
	effects.show_combat_banner("방문 점검 돌진", C.VITAMIN_YELLOW)

func _debug_boss_recall_reward() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	if not boss.active:
		_debug_start_boss()
	boss.hp = minf(boss.hp, boss.max_hp * 0.62)
	boss_result_reason = "boss_recall"
	boss.active = false
	boss.state = "recall_escape"
	_finish_match("recalled")

func _debug_set_smile_home_boss_outcome(outcome: String) -> void:
	if not C.DEBUG_TOOLS_ENABLED:
		return
	var applied := meta_progression.set_smile_home_boss_outcome(outcome)
	var label := meta_progression.smile_home_boss_outcome_label() if applied else "잘못된 보스 처리 값"
	if applied:
		boss.set_outcome_visual(outcome)
	effects.show_combat_banner(label, C.TOXIC_GREEN if applied else C.NEON_RED)
	if match_state == "boss_victory":
		hud.show_result_screen(_result_data("boss_victory"), Callable(self, "_handle_terminal_action"))
	elif match_state == "supply":
		current_supply_actions = _build_supply_actions()
		hud.show_supply_depot(meta_progression, Callable(self, "_apply_supply_choice"), Callable(self, "_restart"), "", _session_progress_data(), current_supply_actions, Callable(self, "_open_r01_campaign_map"))

func _debug_r01_blockout_variant(variant: String) -> void:
	if not C.DEBUG_TOOLS_ENABLED or not R01LayoutBlockout.ENABLED:
		return
	if not r01_blockout.set_state_variant(variant):
		return
	effects.show_combat_banner("R01 blockout: %s" % variant, C.VITAMIN_YELLOW)
	_update_hud()
	queue_redraw()

func _debug_open_r01_campaign_map() -> void:
	if not C.DEBUG_TOOLS_ENABLED:
		return
	if match_state != "supply":
		_show_supply_depot()
	_open_r01_campaign_map()

func _debug_preview_r01_campaign_node(index: int) -> void:
	if not C.DEBUG_TOOLS_ENABLED:
		return
	var ids := R01CampaignMap.node_ids()
	if index < 0 or index >= ids.size():
		return
	selected_r01_node_id = String(ids[index])
	var current_state := String(r01_campaign_node_states.get(selected_r01_node_id, R01CampaignMap.STATE_LOCKED))
	var unlocked_for_preview := current_state == R01CampaignMap.STATE_LOCKED
	if unlocked_for_preview:
		r01_campaign_node_states[selected_r01_node_id] = R01CampaignMap.STATE_AVAILABLE
		if not r01_campaign_new_signal_node_ids.has(selected_r01_node_id):
			r01_campaign_new_signal_node_ids.append(selected_r01_node_id)
	if match_state != "supply":
		_show_supply_depot()
	if not r01_campaign_map_open:
		_open_r01_campaign_map()
	else:
		hud.update_campaign_map(_r01_campaign_map_data())
	var verb := "테스트 개방" if unlocked_for_preview else "상태 미리보기"
	effects.show_combat_banner("%s %s" % [R01CampaignMap.node_name(selected_r01_node_id), verb], C.VITAMIN_YELLOW)

func _debug_r01_campaign_unlock_all() -> void:
	if not C.DEBUG_TOOLS_ENABLED:
		return
	r01_campaign_new_signal_node_ids.clear()
	for node_id in R01CampaignMap.NODE_IDS:
		var id := String(node_id)
		r01_campaign_node_states[id] = R01CampaignMap.STATE_AVAILABLE
		r01_campaign_new_signal_node_ids.append(id)
	_ensure_selected_r01_campaign_node()
	if r01_campaign_map_open:
		hud.update_campaign_map(_r01_campaign_map_data())
	effects.show_combat_banner("R01 캠페인맵: 모든 지점 열림", C.TOXIC_GREEN)

func _debug_defeat_boss() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	if not boss.active:
		_debug_start_boss()
	boss.force_defeat()
	_on_boss_defeated()

func _debug_clear_enemies() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	enemies.clear()

func _debug_spawn_swarm() -> void:
	if not C.DEBUG_TOOLS_ENABLED or match_state != "playing" or paused_for_card:
		return
	var wave_params := _wave_params_for_elapsed(elapsed)
	var count := mini(24, C.ENEMY_CAP - enemies.enemies.size())
	for i in range(count):
		enemies.spawn_enemy(elapsed, player_pos, rng, wave_params)
	peak_enemy_count = maxi(peak_enemy_count, enemies.enemies.size())

func _draw() -> void:
	_draw_arena()
	_draw_signal_board_route_hints()
	_draw_r01_contamination_marks()
	_draw_charge_puddles()
	_draw_threats()
	effects.draw_behind(self)
	boss.draw(self, elapsed)
	_draw_actor_stack()
	if R01LayoutBlockout.ENABLED:
		r01_blockout.draw_foreground_hints(self, elapsed, debug_tools.blockout_debug_labels_visible())
	effects.draw_front(self)
	effects.draw_screen_flash(self, camera.global_position)

func _draw_arena() -> void:
	if R01LayoutBlockout.ENABLED:
		r01_blockout.draw(self, elapsed, player_pos, debug_tools.blockout_debug_labels_visible())
		return
	r01_map.draw(self, elapsed, player_pos, _boss_route_ready(), boss.active)

func _draw_signal_board_route_hints() -> void:
	if not R01LayoutBlockout.ENABLED:
		return
	if not (match_state == "playing" or match_state == "level_up"):
		return
	var signal_level := meta_progression.signal_board_level()
	if signal_level <= 0:
		return
	var open_pos := r01_blockout.anchor_position("open_house_street_anchor")
	var model_pos := r01_blockout.anchor_position("model_house_node_anchor")
	_draw_signal_board_corridor(open_pos, model_pos, signal_level)
	var target_pos := open_pos
	var target_label := "오픈하우스"
	if signal_level >= 2 and (r01_map.current_zone_is_open_house() or open_house_signal_stage >= 1 or player_pos.distance_to(open_pos) < 560.0):
		target_pos = model_pos
		target_label = "모델하우스"
	if _boss_route_ready():
		target_pos = model_pos
		target_label = "결절"
	_draw_signal_board_target_pin(open_pos, "수신태그 후보", signal_level, target_pos == open_pos)
	if signal_level >= 2 or _boss_route_ready():
		_draw_signal_board_target_pin(model_pos, "모델하우스 신호", signal_level + (1 if _boss_route_ready() else 0), target_pos == model_pos)
	_draw_signal_board_compass(target_pos, target_label, signal_level)

func _draw_signal_board_corridor(open_pos: Vector2, model_pos: Vector2, signal_level: int) -> void:
	var loop_pos := r01_blockout.anchor_position("subdivision_loop_center")
	var base_alpha := 0.12 + 0.04 * float(mini(signal_level, 3))
	var pulse := 0.5 + 0.5 * sin(elapsed * 3.0)
	var route_color := Color(0.35, 0.70, 0.95, base_alpha + 0.05 * pulse)
	var hot_color := Color(1.0, 0.91, 0.25, 0.24 + 0.06 * pulse)
	_draw_signal_board_path_segment(loop_pos + Vector2(220, -94), open_pos + Vector2(-120, 8), route_color, hot_color)
	if signal_level >= 2 or _boss_route_ready():
		_draw_signal_board_path_segment(open_pos + Vector2(130, -72), model_pos + Vector2(-170, 54), route_color, hot_color)

func _draw_signal_board_path_segment(from_pos: Vector2, to_pos: Vector2, route_color: Color, hot_color: Color) -> void:
	draw_line(from_pos, to_pos, route_color, 18.0)
	draw_line(from_pos, to_pos, hot_color, 3.0)
	var dir := (to_pos - from_pos).normalized()
	var side := dir.rotated(PI * 0.5)
	for i in range(5):
		var p := from_pos.lerp(to_pos, (float(i) + 0.5) / 5.0)
		draw_line(p - dir * 18.0 - side * 8.0, p + dir * 18.0, hot_color, 2.0)

func _draw_signal_board_target_pin(pos: Vector2, label: String, signal_level: int, active: bool) -> void:
	var pulse := 0.5 + 0.5 * sin(elapsed * 3.4 + pos.x * 0.01)
	var radius := 38.0 + 6.0 * pulse + 4.0 * float(mini(signal_level, 3))
	var fill := Color(0.35, 0.70, 0.95, 0.10 + 0.05 * float(active))
	var edge := Color(1.0, 0.91, 0.25, 0.42 + 0.18 * float(active))
	draw_circle(pos, radius, fill)
	draw_arc(pos, radius, 0.0, TAU, 48, edge, 3.0 if active else 2.0)
	draw_line(pos + Vector2(-20, 0), pos + Vector2(20, 0), edge, 2.0)
	draw_line(pos + Vector2(0, -20), pos + Vector2(0, 20), edge, 2.0)
	if active:
		draw_string(UIFont.get_font(), pos + Vector2(-64, -54), label, HORIZONTAL_ALIGNMENT_CENTER, 128, 10, Color(0.18, 0.13, 0.11, 0.82))

func _draw_signal_board_compass(target_pos: Vector2, label: String, signal_level: int) -> void:
	var delta := target_pos - player_pos
	if delta.length_squared() <= 100.0:
		return
	var dir := delta.normalized()
	var side := dir.rotated(PI * 0.5)
	var compass_pos := player_pos + dir * 78.0
	var pulse := 0.5 + 0.5 * sin(elapsed * 4.2)
	var fill := Color(0.35, 0.70, 0.95, 0.18 + 0.05 * pulse)
	var edge := Color(1.0, 0.91, 0.25, 0.62 + 0.12 * pulse)
	draw_circle(compass_pos, 22.0 + 2.0 * pulse, fill)
	draw_arc(compass_pos, 26.0 + 3.0 * pulse, 0.0, TAU, 32, edge, 2.4)
	var tip := compass_pos + dir * 18.0
	var left := compass_pos - dir * 8.0 + side * 12.0
	var right := compass_pos - dir * 8.0 - side * 12.0
	draw_colored_polygon(PackedVector2Array([tip, left, right]), Color(1.0, 0.91, 0.25, 0.58))
	draw_polyline(PackedVector2Array([tip, left, right, tip]), Color(0.25, 0.18, 0.15, 0.72), 1.6)
	var distance := int(round(player_pos.distance_to(target_pos) / 10.0) * 10.0)
	var text := "%s %dm" % [label, distance]
	if signal_level >= 3:
		text = "%s 고정 %dm" % [label, distance]
	draw_string(UIFont.get_font(), compass_pos + Vector2(-58, 38), text, HORIZONTAL_ALIGNMENT_CENTER, 116, 9, Color(0.18, 0.13, 0.11, 0.80))

func _draw_r01_contamination_marks() -> void:
	if not _r01_contamination_marks_should_draw():
		return
	for spec in _r01_contamination_mark_specs():
		_draw_r01_contamination_mark(
			spec["pos"],
			str(spec["label"]),
			int(spec["count"]),
			spec["fill"],
			spec["edge"]
		)

func _r01_contamination_marks_should_draw() -> bool:
	if not R01LayoutBlockout.ENABLED:
		return false
	if not (match_state == "playing" or match_state == "level_up"):
		return false
	if boss.active:
		return false
	var r01_state := _r01_phrase_state()
	return int(r01_state.get("r01_contamination_total", 0)) > 0

func _r01_contamination_mark_specs() -> Array[Dictionary]:
	var specs: Array[Dictionary] = []
	var r01_state := _r01_phrase_state()
	var food_count := int(r01_state.get("r01_contaminated_food_count", 0))
	var power_count := int(r01_state.get("r01_contaminated_power_count", 0))
	var signal_count := int(r01_state.get("r01_contaminated_signal_count", 0))
	if food_count > 0:
		specs.append({
			"pos": r01_blockout.anchor_position("fake_return_route_anchor") + Vector2(20, -20),
			"label": "오염 식량태그",
			"count": food_count,
			"fill": Color(0.46, 0.28, 0.20, 0.07),
			"edge": Color(0.44, 0.24, 0.18, 0.30),
		})
	if power_count > 0:
		specs.append({
			"pos": r01_blockout.anchor_position("subdivision_loop_center") + Vector2(110, 50),
			"label": "오염 전원",
			"count": power_count,
			"fill": Color(0.32, 0.28, 0.44, 0.07),
			"edge": Color(0.30, 0.25, 0.44, 0.30),
		})
	if signal_count > 0:
		specs.append({
			"pos": r01_blockout.anchor_position("open_house_street_anchor") + Vector2(72, -92),
			"label": "오염 신호",
			"count": signal_count,
			"fill": Color(0.18, 0.32, 0.40, 0.07),
			"edge": Color(0.16, 0.34, 0.42, 0.32),
		})
		if signal_count >= 2 or _boss_route_ready():
			specs.append({
				"pos": r01_blockout.anchor_position("model_house_node_anchor") + Vector2(-104, 86),
				"label": "신호 감사",
				"count": signal_count,
				"fill": Color(0.34, 0.30, 0.20, 0.06),
				"edge": Color(0.46, 0.38, 0.22, 0.28),
			})
	return specs

func _draw_r01_contamination_mark(pos: Vector2, label: String, count: int, fill: Color, edge: Color) -> void:
	var style := _r01_contamination_visual_style(pos, count, fill, edge)
	var clamped_count := int(style["clamped_count"])
	var radius := float(style["radius"])
	var pulse := float(style["pulse"])
	var fill_color: Color = style["fill"]
	var edge_color: Color = style["edge"]
	draw_circle(pos, radius, fill_color)
	draw_arc(pos, radius, -PI * 0.12, PI * 1.12, 30, edge_color, 1.25)
	draw_arc(pos, radius + 5.0 + pulse * 1.5, PI * 0.30, PI * 1.55, 24, Color(edge_color.r, edge_color.g, edge_color.b, edge_color.a * 0.42), 0.9)
	for i in range(clamped_count):
		var angle := (TAU / float(clamped_count)) * float(i) + elapsed * 0.18
		var dot := pos + Vector2(cos(angle), sin(angle)) * (radius + 4.0)
		draw_circle(dot, 1.45, Color(edge_color.r, edge_color.g, edge_color.b, minf(0.42, edge_color.a + 0.08)))
	if _r01_contamination_label_visible(pos):
		var text := "%s x%d" % [label, count]
		var label_color := Color(0.20, 0.12, 0.12, 0.50)
		draw_string(UIFont.get_font(), pos + Vector2(-48, radius + 10.0), text, HORIZONTAL_ALIGNMENT_CENTER, 96, 7, label_color)

func _r01_contamination_visual_style(pos: Vector2, count: int, fill: Color, edge: Color) -> Dictionary:
	var clamped_count := clampi(count, 1, 3)
	var pulse := 0.5 + 0.5 * sin(elapsed * 1.8 + pos.x * 0.004)
	var radius := 20.0 + 2.2 * float(clamped_count) + pulse * 1.6
	return {
		"clamped_count": clamped_count,
		"pulse": pulse,
		"radius": radius,
		"fill": fill,
		"edge": edge,
	}

func _r01_contamination_label_visible(pos: Vector2) -> bool:
	if boss.active:
		return false
	if debug_tools.blockout_debug_labels_visible():
		return true
	if player_pos.distance_squared_to(pos) > CONTAMINATION_MARK_LABEL_DISTANCE * CONTAMINATION_MARK_LABEL_DISTANCE:
		return false
	return _enemy_count_near(pos, CONTAMINATION_MARK_LABEL_DISTANCE) <= CONTAMINATION_MARK_LABEL_ENEMY_LIMIT

func _enemy_count_near(pos: Vector2, radius: float) -> int:
	var radius_sq := radius * radius
	var count := 0
	for enemy in enemies.enemies:
		var enemy_pos: Vector2 = enemy.get("pos", Vector2.ZERO)
		if enemy_pos.distance_squared_to(pos) <= radius_sq:
			count += 1
	return count

func _r01_contamination_readability_snapshot() -> Dictionary:
	if not _r01_contamination_marks_should_draw():
		return {
			"visible": false,
			"mark_count": 0,
			"label_count": 0,
			"max_radius": 0.0,
			"max_fill_alpha": 0.0,
			"max_edge_alpha": 0.0,
		}
	var specs := _r01_contamination_mark_specs()
	var label_count := 0
	var max_radius := 0.0
	var max_fill_alpha := 0.0
	var max_edge_alpha := 0.0
	for spec in specs:
		var style := _r01_contamination_visual_style(spec["pos"], int(spec["count"]), spec["fill"], spec["edge"])
		var fill_color: Color = style["fill"]
		var edge_color: Color = style["edge"]
		max_radius = maxf(max_radius, float(style["radius"]))
		max_fill_alpha = maxf(max_fill_alpha, fill_color.a)
		max_edge_alpha = maxf(max_edge_alpha, edge_color.a)
		if _r01_contamination_label_visible(spec["pos"]):
			label_count += 1
	return {
		"visible": true,
		"mark_count": specs.size(),
		"label_count": label_count,
		"max_radius": max_radius,
		"max_fill_alpha": max_fill_alpha,
		"max_edge_alpha": max_edge_alpha,
	}

func _draw_charge_puddles() -> void:
	for puddle in charge_puddles:
		var ratio := float(puddle["life"]) / maxf(0.001, float(puddle["duration"]))
		var pos: Vector2 = puddle["pos"]
		var radius := float(puddle["radius"])
		var pulse := 0.86 + 0.10 * sin(elapsed * 10.0)
		draw_circle(pos, radius, Color(0.62, 1.0, 0.36, 0.18 + 0.12 * ratio))
		draw_arc(pos, radius, 0.0, TAU, 40, Color(0.62, 1.0, 0.36, 0.56 * ratio), 3.0)
		draw_arc(pos, radius * pulse, 0.0, TAU, 32, Color(1.0, 0.3, 0.36, 0.42 * ratio), 2.5)

func _draw_threats() -> void:
	for threat in active_threats:
		var pos: Vector2 = threat["pos"]
		var radius := float(threat.get("radius", 0.0))
		var timer := float(threat.get("timer", 0.0))
		var duration := maxf(0.001, float(threat.get("duration", 1.0)))
		var type := String(threat.get("type", ""))
		if bool(threat.get("source_used", false)):
			var source_pos := Vector2(threat.get("source_pos", Vector2(INF, INF)))
			if source_pos.x < INF * 0.5:
				var source_alpha := 0.20 + 0.12 * sin(elapsed * 8.0)
				var source_color := Color(1.0, 0.91, 0.25, source_alpha)
				if type == THREAT_PRESSURE_RING:
					source_color = Color(1.0, 0.30, 0.36, source_alpha)
				draw_line(source_pos, pos, source_color, 2.0)
				draw_circle(source_pos, 10.0 + 3.0 * sin(elapsed * 6.0), Color(source_color.r, source_color.g, source_color.b, 0.12))
		if timer > 0.0:
			var progress := 1.0 - clampf(timer / duration, 0.0, 1.0)
			if type == THREAT_PRESSURE_RING:
				var warn_radius := lerpf(radius * 1.34, radius, progress)
				draw_circle(pos, warn_radius, Color(1.0, 0.3, 0.36, 0.08 + progress * 0.06))
				draw_arc(pos, warn_radius, 0.0, TAU, 64, Color(1.0, 0.3, 0.36, 0.38 + progress * 0.34), 3.0)
				draw_arc(pos, radius * 0.62, 0.0, TAU, 48, Color(1.0, 0.91, 0.25, 0.26 + progress * 0.22), 2.0)
			else:
				var marker_radius := lerpf(radius * 0.52, radius, progress)
				draw_rect(Rect2(pos - Vector2(radius, radius) * 0.72, Vector2(radius, radius) * 1.44), Color(1.0, 0.91, 0.25, 0.08 + progress * 0.08))
				draw_arc(pos, marker_radius, 0.0, TAU, 36, Color(1.0, 0.91, 0.25, 0.40 + progress * 0.28), 2.4)
				draw_line(pos + Vector2(-radius * 0.62, -radius * 0.62), pos + Vector2(radius * 0.62, radius * 0.62), Color(1.0, 0.3, 0.36, 0.48), 2.0)
				draw_line(pos + Vector2(radius * 0.62, -radius * 0.62), pos + Vector2(-radius * 0.62, radius * 0.62), Color(1.0, 0.3, 0.36, 0.48), 2.0)
		else:
			var linger_ratio := 1.0 - clampf(absf(timer) / maxf(0.001, float(threat.get("linger", 0.25))), 0.0, 1.0)
			var color := Color(1.0, 0.3, 0.36, 0.30 * linger_ratio) if type == THREAT_PRESSURE_RING else Color(1.0, 0.91, 0.25, 0.28 * linger_ratio)
			draw_circle(pos, radius, color)
			draw_arc(pos, radius * (1.0 + (1.0 - linger_ratio) * 0.22), 0.0, TAU, 44, Color(1.0, 0.3, 0.36, 0.52 * linger_ratio), 3.0)

func _draw_player() -> void:
	var charge_state := _charge_state()
	var aim := get_global_mouse_position() - player_pos
	var has_aim := aim.length() > C.CHARGE_AIM_DEADZONE
	var preview_dir := aim.normalized() if has_aim else _fallback_aim_dir()
	draw_circle(player_pos + Vector2(2, 4), 11.0, Color(0, 0, 0, 0.18))
	var player_frame := int(elapsed * 6.0) % 2 if player_is_moving else 0
	if not sprite_assets.draw_player(self, player_pos, _player_sprite_row(), player_frame):
		sprite_assets.draw_player_fallback(self, player_pos)
	if attack_pose_timer > 0.0:
		var pose_ratio := attack_pose_timer / 0.20
		var pose_dir := attack_pose_dir.normalized() if attack_pose_dir.length_squared() > 0.0 else Vector2.RIGHT
		draw_line(player_pos + pose_dir * 3.0, player_pos + pose_dir * (24.0 + 4.0 * pose_ratio), C.NEON_RED, 3.0)
		draw_arc(player_pos + pose_dir * 13.0, 18.0, pose_dir.angle() - 0.9, pose_dir.angle() + 0.9, 14, Color(1.0, 0.91, 0.25, 0.75 * pose_ratio), 2.5)
	if charge_state == "warning":
		var warning_left := maxf(0.0, _charge_period() - charge_timer)
		var warning_ratio := 1.0 - clampf(warning_left / C.CHARGE_WARNING_TIME, 0.0, 1.0)
		var pulse := 1.0 + sin(warning_ratio * PI * 5.0) * 0.12
		draw_arc(player_pos, 23.0 * pulse, -PI / 2.0, TAU * warning_ratio - PI / 2.0, 36, C.NEON_RED, 3.0)
		draw_circle(player_pos, 29.0 + warning_ratio * 10.0, Color(1.0, 0.91, 0.25, 0.07))
		_draw_charge_weapon_preview(aim, preview_dir, false)
	elif charge_ready_flash > 0.0 or charge_window_left > 0.0:
		var ratio := charge_window_left / _charge_window()
		var pulse := 1.0 + sin(charge_open_age * 28.0) * 0.13
		var focus_color := Color(0.62, 1.0, 0.36, 0.22) if has_aim else Color(1.0, 0.91, 0.25, 0.20)
		draw_arc(player_pos, 18.0 * pulse, -PI / 2.0, TAU * ratio - PI / 2.0, 32, C.TOXIC_GREEN if has_aim else C.VITAMIN_YELLOW, 4.0)
		draw_arc(player_pos, 25.0 + charge_open_age * 42.0, 0.0, TAU, 32, Color(1.0, 0.91, 0.25, 0.70), 2.0)
		draw_circle(player_pos, 34.0 + charge_open_age * 20.0, focus_color)
		_draw_charge_weapon_preview(aim, preview_dir, true)

func _draw_charge_weapon_preview(_aim: Vector2, aim_dir: Vector2, open: bool) -> void:
	var alpha := 0.58 if open else 0.34
	var line_color := C.NEON_RED
	line_color.a = alpha
	var edge_color := C.VITAMIN_YELLOW
	edge_color.a = alpha * 0.62
	var end_pos := player_pos + aim_dir * RETURN_STAMP_RANGE
	var side := aim_dir.rotated(PI * 0.5) * RETURN_STAMP_WIDTH
	draw_line(player_pos, end_pos, line_color, 4.0 if open else 2.4)
	draw_line(player_pos + side, end_pos + side, edge_color, 1.5)
	draw_line(player_pos - side, end_pos - side, edge_color, 1.5)
	draw_arc(end_pos, 8.0 if open else 6.0, 0.0, TAU, 24, line_color, 2.0)

func _draw_enemies() -> void:
	for enemy in enemies.enemies:
		_draw_enemy(enemy)

func _draw_actor_stack() -> void:
	var actors: Array[Dictionary] = [{"type": "player", "sort_y": player_pos.y}]
	for enemy in enemies.enemies:
		var pos: Vector2 = enemy["pos"]
		actors.append({"type": "enemy", "sort_y": pos.y, "enemy": enemy})
	actors.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return float(a["sort_y"]) < float(b["sort_y"]))
	for actor in actors:
		if String(actor["type"]) == "player":
			_draw_player()
		else:
			_draw_enemy(actor["enemy"])

func _draw_enemy(enemy: Dictionary) -> void:
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	draw_circle(pos + Vector2(2, 3), radius + 1.5, Color(0, 0, 0, 0.18))
	if _enemy_base_ring_visible(enemy):
		draw_arc(pos, radius + 3.0, 0.0, TAU, 24, Color(1.0, 0.96, 0.72, _enemy_base_ring_alpha(enemy)), 1.4)
	_draw_enemy_role_marker(enemy)
	_draw_enemy_defense_marker(enemy)
	var enemy_frame := int(float(enemy.get("age", elapsed)) * 5.0) % 2
	if not sprite_assets.draw_enemy(self, enemy, enemy_frame):
		sprite_assets.draw_enemy_fallback(self, enemy)
	_draw_charge_weapon_markers(enemy)
	_draw_enemy_nameplate(enemy)
	_draw_enemy_hit_feedback(enemy)

func _enemy_high_density_ui() -> bool:
	return enemies.enemies.size() >= ENEMY_DENSITY_UI_CULL_START and not debug_tools.detail_debug_visible()

func _enemy_heavy_density_ui() -> bool:
	return enemies.enemies.size() >= ENEMY_DENSITY_UI_HEAVY and not debug_tools.detail_debug_visible()

func _enemy_priority_visual(enemy: Dictionary) -> bool:
	if bool(enemy.get("elite", false)):
		return true
	var role := String(enemy.get("role", "basic"))
	return role == "speaker" or role == "charger" or role == "signal"

func _enemy_near_player_visual(enemy: Dictionary, distance: float = 155.0) -> bool:
	var pos: Vector2 = enemy.get("pos", Vector2.ZERO)
	return pos.distance_squared_to(player_pos) <= distance * distance

func _enemy_base_ring_visible(enemy: Dictionary) -> bool:
	if debug_tools.detail_debug_visible():
		return true
	if not _enemy_high_density_ui():
		return true
	if _enemy_priority_visual(enemy):
		return true
	return not _enemy_heavy_density_ui() and _enemy_near_player_visual(enemy, 132.0)

func _enemy_base_ring_alpha(enemy: Dictionary) -> float:
	if not _enemy_high_density_ui():
		return 0.18
	if _enemy_priority_visual(enemy):
		return 0.16
	return 0.08

func _enemy_role_marker_local_visible(enemy: Dictionary) -> bool:
	if debug_tools.detail_debug_visible():
		return true
	if not _enemy_high_density_ui():
		return true
	if _enemy_priority_visual(enemy):
		return true
	return not _enemy_heavy_density_ui() and _enemy_near_player_visual(enemy, 150.0)

func _enemy_defense_marker_visible(enemy: Dictionary) -> bool:
	if debug_tools.detail_debug_visible():
		return true
	var defense := String(enemy.get("defense_type", "normal"))
	if defense == "normal":
		return false
	if not _enemy_high_density_ui():
		return true
	if _enemy_priority_visual(enemy):
		return true
	var role := String(enemy.get("role", "basic"))
	if role == "tank" and not _enemy_heavy_density_ui():
		return true
	return _enemy_near_player_visual(enemy, 168.0)

func _draw_charge_weapon_markers(enemy: Dictionary) -> void:
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	if _enemy_has_return_stamp(enemy):
		var ratio := clampf(float(enemy.get("return_stamp_timer", 0.0)) / RETURN_STAMP_DURATION, 0.0, 1.0)
		var flash := clampf(float(enemy.get("return_stamp_flash", 0.0)) / 0.30, 0.0, 1.0)
		var expiry_pulse := sin(elapsed * 18.0) * 0.5 + 0.5 if ratio < 0.28 else 0.0
		var stamp_color := C.NEON_RED
		stamp_color.a = 0.58 + 0.28 * ratio + 0.18 * flash
		var box_radius := radius + 6.0 + flash * 4.0
		draw_rect(Rect2(pos - Vector2(box_radius, box_radius), Vector2(box_radius * 2.0, box_radius * 2.0)), Color(1.0, 0.3, 0.36, 0.08 + 0.10 * flash + 0.05 * expiry_pulse), false, 2.0)
		draw_arc(pos, radius + 10.0 + flash * 6.0 + expiry_pulse * 3.0, -PI * 0.22, PI * 1.22, 28, stamp_color, 2.5 + flash * 1.0)
		draw_line(pos + Vector2(-radius - 4.0, 0), pos + Vector2(radius + 4.0, 0), stamp_color, 2.0)
		draw_line(pos + Vector2(0, -radius - 4.0), pos + Vector2(0, radius + 4.0), Color(1.0, 0.91, 0.25, stamp_color.a * 0.68), 1.5)
		var text_pos := pos + Vector2(0, -radius - 12.0)
		draw_string(UIFont.get_font(), text_pos + Vector2(1, 1), "반품", HORIZONTAL_ALIGNMENT_CENTER, -1.0, 8, Color(0.08, 0.03, 0.03, stamp_color.a))
		draw_string(UIFont.get_font(), text_pos, "반품", HORIZONTAL_ALIGNMENT_CENTER, -1.0, 8, stamp_color)

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

func _draw_enemy_nameplate(enemy: Dictionary) -> void:
	var role := String(enemy.get("role", "basic"))
	if role == "basic":
		return
	if _enemy_high_density_ui() and not _enemy_priority_visual(enemy):
		if role != "tank" or not _enemy_near_player_visual(enemy, 132.0):
			return
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	var label := "ELITE" if bool(enemy.get("elite", false)) else _enemy_role_label(role)
	var width := 54.0 if label == "SIGNAL" or label == "LOUD" or label == "DASH" else 42.0
	var y := -radius - 20.0
	draw_rect(Rect2(pos + Vector2(-width * 0.5, y - 7.0), Vector2(width, 10.0)), Color(0.10, 0.06, 0.04, 0.62))
	draw_string(UIFont.get_font(), pos + Vector2(0, y), label, HORIZONTAL_ALIGNMENT_CENTER, width, 8, _defense_color(String(enemy.get("defense_type", "normal"))))

func _enemy_role_label(role: String) -> String:
	match role:
		"fast":
			return "FAST"
		"tank":
			return "TANK"
		"speaker":
			return "LOUD"
		"charger":
			return "DASH"
		"signal":
			return "SIGNAL"
		_:
			return role.to_upper()

func _draw_enemy_role_marker(enemy: Dictionary) -> void:
	var pos: Vector2 = enemy["pos"]
	var radius := float(enemy["radius"])
	var role := String(enemy.get("role", "basic"))
	var local_marker_visible := _enemy_role_marker_local_visible(enemy)
	if bool(enemy.get("elite", false)):
		var pulse := 0.82 + 0.10 * sin(elapsed * 7.0)
		draw_circle(pos, radius + 9.0, Color(1.0, 0.3, 0.36, 0.16))
		draw_arc(pos, (radius + 10.0) * pulse, 0.0, TAU, 36, C.NEON_RED, 3.0)
		draw_arc(pos, radius + 16.0, -PI * 0.22, PI * 1.22, 28, C.VITAMIN_YELLOW, 2.5)
	if bool(enemy.get("aura_boosted", false)) and local_marker_visible:
		draw_arc(pos, radius + 5.0, 0.0, TAU, 24, Color(1.0, 0.3, 0.36, 0.45), 1.5)
	if bool(enemy.get("speaker_boosted", false)) and local_marker_visible:
		draw_arc(pos, radius + 8.0, PI * 0.1, PI * 1.1, 20, C.VITAMIN_YELLOW, 2.0)
	match role:
		"fast":
			if not local_marker_visible:
				return
			draw_arc(pos, radius + 3.0, -0.8, 0.8, 12, C.NEON_RED, 2.0)
			draw_line(pos + Vector2(-radius, -radius), pos + Vector2(-radius - 7.0, -radius - 2.0), C.NEON_RED, 2.0)
		"tank":
			if not local_marker_visible:
				return
			draw_arc(pos, radius + 4.0, 0.0, TAU, 28, C.COCOA, 2.5)
			draw_circle(pos, radius + 2.0, Color(0.0, 0.0, 0.0, 0.08))
		"signal":
			var aura_alpha := (0.10 if _enemy_high_density_ui() else 0.16) + 0.04 * sin(elapsed * 5.0)
			draw_circle(pos, 92.0, Color(1.0, 0.91, 0.25, aura_alpha))
			draw_arc(pos, 92.0, 0.0, TAU, 42, Color(1.0, 0.3, 0.36, 0.30 if _enemy_high_density_ui() else 0.38), 2.0)
			draw_arc(pos, radius + 5.0, 0.0, TAU, 24, C.VITAMIN_YELLOW, 2.5)
		"speaker":
			var pulse_left := float(enemy.get("speaker_pulse", 0.0))
			draw_arc(pos, radius + 7.0, -PI * 0.16, PI * 1.16, 28, C.VITAMIN_YELLOW, 2.5)
			draw_line(pos + Vector2(radius - 2.0, -2.0), pos + Vector2(radius + 12.0, -8.0), C.VITAMIN_YELLOW, 2.0)
			draw_line(pos + Vector2(radius - 2.0, 2.0), pos + Vector2(radius + 12.0, 8.0), C.VITAMIN_YELLOW, 2.0)
			if pulse_left > 0.0:
				var ratio := 1.0 - clampf(pulse_left / EnemyController.SPEAKER_PULSE_DURATION, 0.0, 1.0)
				var pulse_radius := lerpf(42.0, EnemyController.SPEAKER_PULSE_RADIUS, ratio)
				draw_circle(pos, pulse_radius, Color(1.0, 0.91, 0.25, 0.08))
				draw_arc(pos, pulse_radius, 0.0, TAU, 56, Color(1.0, 0.91, 0.25, 0.42), 2.4)
		"charger":
			var state := String(enemy.get("action_state", "idle"))
			var dash_dir: Vector2 = enemy.get("dash_dir", Vector2.RIGHT)
			if dash_dir.length_squared() <= 0.01:
				dash_dir = Vector2.RIGHT
			if state == "windup":
				var telegraph_end := pos + dash_dir.normalized() * 150.0
				draw_line(pos, telegraph_end, Color(1.0, 0.3, 0.36, 0.62), 3.0)
				draw_arc(pos, radius + 9.0, -0.9 + dash_dir.angle(), 0.9 + dash_dir.angle(), 22, C.NEON_RED, 3.0)
				draw_circle(pos, radius + 8.0, Color(1.0, 0.3, 0.36, 0.16))
			elif state == "dash":
				draw_line(pos - dash_dir.normalized() * 28.0, pos, Color(1.0, 0.3, 0.36, 0.72), 4.0)
				draw_arc(pos, radius + 8.0, 0.0, TAU, 28, C.NEON_RED, 3.0)
			else:
				draw_arc(pos, radius + 5.0, -0.65, 0.65, 14, C.NEON_RED, 2.0)

func _draw_enemy_defense_marker(enemy: Dictionary) -> void:
	if not _enemy_defense_marker_visible(enemy):
		return
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
	var was_supply := match_state == "supply"
	var was_terminal_redeploy := TERMINAL_STATES.has(match_state) and first_recall_done
	if is_inside_tree():
		get_tree().paused = false
	if was_supply and R01CampaignMap.is_node_selectable(selected_r01_node_id, r01_campaign_node_states):
		current_r01_node_id = selected_r01_node_id
	r01_campaign_map_open = false
	if was_supply or was_terminal_redeploy:
		sortie_index += 1
		first_sortie = false
	_record_r01_visit_for_current_sortie()
	boss.reset()
	boss_result_reason = ""
	last_boss_recall_report = {}
	last_boss_victory_report = {}
	last_run_result = {}
	current_supply_actions.clear()
	last_supply_reaction_line = ""
	_reset_player_stats()
	player_pos = _r01_campaign_start_position(current_r01_node_id) if R01LayoutBlockout.ENABLED else Vector2.ZERO
	if R01LayoutBlockout.ENABLED:
		_arm_entry_camera_for_node(current_r01_node_id)
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
	preboss_signal_event_stage = 0
	recall_event_stage = 0
	recall_pressure_spawn_timer = 0.0
	wave_notice_timer = 0.0
	wave_notice_text = ""
	auto_timer = 0.0
	auto_shot_counter = 0
	attack_pose_timer = 0.0
	attack_pose_dir = Vector2.RIGHT
	hurt_feedback_cooldown = 0.0
	charge_timer = 0.0
	charge_window_left = 0.0
	charge_open_age = 0.0
	charge_ready_flash = 0.0
	charge_warning_played = false
	charge_miss_notice = 0.0
	charge_effect_anchor = Vector2.ZERO
	charge_effect_anchor_active = false
	pending_kill_burst_contexts.clear()
	enemies.clear()
	effects.clear()
	charge_puddles.clear()
	active_threats.clear()
	pressure_ring_timer = 0.0
	flyer_drop_timer = 0.0
	last_threat_label = ""
	node_pressure_cue_timer = 0.0
	hud.reset()
	var blockout_variant := R01CampaignMap.node_blockout_variant(current_r01_node_id)
	if R01LayoutBlockout.ENABLED:
		r01_blockout.set_state_variant(blockout_variant)
	r01_map.reset(elapsed, true)
	_sync_r01_map_to_player_zone(true)
	_reset_r01_run_tracking()
	_reset_audit_run_tracking()
	_reset_playtest_metrics()
	_mark_current_campaign_node_visited()
	_set_music("amb_r01_suburb_loop")
	_show_wave_notice(_sortie_start_notice())

func _record_r01_visit_for_current_sortie() -> void:
	if r01_visit_recorded_sortie_index == sortie_index:
		return
	r01_visit_recorded_sortie_index = sortie_index
	meta_progression.record_r01_visit()

func _reset_player_stats() -> void:
	var meta_bonuses := meta_progression.bonuses()
	player_stats = {
		"max_hp": C.PLAYER_MAX_HP + float(meta_bonuses["max_hp_bonus"]),
		"move_speed_mult": 0.0,
		"auto_damage_mult": 0.0,
		"auto_damage_bonus": float(meta_bonuses["auto_damage_bonus"]),
		"auto_range_bonus": float(meta_bonuses["auto_range_bonus"]),
		"charge_damage_mult": 0.0,
		"charge_damage_bonus": float(meta_bonuses["charge_damage_bonus"]),
		"charge_target_bonus": 0,
		"charge_period_bonus": float(meta_bonuses["charge_period_bonus"]),
		"charge_window_bonus": float(meta_bonuses["charge_window_bonus"]),
		"xp_gain_mult": float(meta_bonuses["xp_gain_mult"]),
		"low_hp_damage_reduction": float(meta_bonuses["low_hp_damage_reduction"]),
		"boss_shield_damage_mult": float(meta_bonuses["boss_shield_damage_mult"]),
		"elite_damage_mult": float(meta_bonuses["elite_damage_mult"]),
		"split_shot_level": 0,
		"kill_burst_level": 0,
		"charge_puddle_level": 0,
		"perfect_charge_level": 0,
		"emergency_charge_level": 0,
		"charge_slow_level": 0,
		"charge_heal_level": 0,
		"charge_knockback_level": 0,
		"return_label_level": 0,
		"flyer_pop_level": 0,
		"broadcast_residue_level": 0,
		"robot_command_flip_level": 0,
		"overtime_sheet_level": 0,
		"battery_receipt_level": 0,
		"open_house_checkin_level": 0,
		"low_hp_allowance_level": 0,
		"normal_customer_sticker_level": 0,
		"family_discount_level": 0,
		"no_return_agreement_level": 0,
		"terms_auto_renewal_level": 0,
		"audit_processing_mult": 0.0,
		"audit_threshold_mult": 0.0,
		"open_house_processing_bonus": 0.0,
		"terms_pressure_level": 0,
		"terms_failure_risk": 0,
		"open_house_signal_threshold_reduction": float(meta_bonuses.get("open_house_signal_threshold_reduction", 0.0)),
		"build_counts": {},
		"card_counts": {},
		"selected_card_count": selected_card_count,
	}

func _move_speed() -> float:
	return C.PLAYER_SPEED * (1.0 + float(player_stats["move_speed_mult"]))

func _auto_range() -> float:
	return C.AUTO_RANGE + float(player_stats["auto_range_bonus"])

func _auto_damage_per_tick() -> float:
	return C.BASE_DPS * (1.0 + float(player_stats["auto_damage_mult"])) * C.AUTO_TICK + float(player_stats["auto_damage_bonus"])

func _charge_period() -> float:
	var emergency_bonus := -0.45 * float(player_stats["emergency_charge_level"]) if _emergency_charge_active() else 0.0
	return maxf(1.2, C.CHARGE_PERIOD + float(player_stats["charge_period_bonus"]) + emergency_bonus)

func _charge_window() -> float:
	return C.CHARGE_WINDOW + float(player_stats["charge_window_bonus"])

func _incoming_damage(amount: float) -> float:
	var reduction := 0.0
	if player_hp <= float(player_stats["max_hp"]) * 0.35:
		reduction = float(player_stats["low_hp_damage_reduction"])
	return amount * maxf(0.65, 1.0 - reduction)

func _enemy_meta_damage(base_damage: float, index: int) -> float:
	if index < 0 or index >= enemies.enemies.size():
		return base_damage
	if bool(enemies.enemies[index].get("elite", false)):
		return base_damage * (1.0 + float(player_stats["elite_damage_mult"]))
	return base_damage

func _boss_meta_damage(base_damage: float) -> float:
	if boss.state == "shield":
		return base_damage * (1.0 + float(player_stats["boss_shield_damage_mult"]))
	return base_damage

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
	return (C.CHARGE_DAMAGE + float(player_stats["charge_damage_bonus"])) * directed_mult * (1.0 + float(player_stats["charge_damage_mult"]))

func _supply_choice_from_event(event: InputEvent) -> int:
	if not event is InputEventKey or not event.pressed or event.echo:
		return -1
	match event.keycode:
		KEY_1, KEY_KP_1:
			return 0
		KEY_2, KEY_KP_2:
			return 1
		KEY_3, KEY_KP_3:
			return 2
		KEY_4, KEY_KP_4:
			return 3
		_:
			return -1

func _register_attack_pose(dir: Vector2, duration: float) -> void:
	if dir.length_squared() <= 0.0:
		return
	attack_pose_dir = dir.normalized()
	attack_pose_timer = maxf(attack_pose_timer, duration)

func _apply_hit_knockback(index: int, source_pos: Vector2, distance: float) -> void:
	if index < 0 or index >= enemies.enemies.size():
		return
	var dir := Vector2(enemies.enemies[index]["pos"]) - source_pos
	if dir.length_squared() <= 0.0:
		dir = attack_pose_dir
	enemies.knockback_enemy(index, dir.normalized(), distance)

func _xp_gain() -> float:
	return 1.0 * (1.0 + float(player_stats["xp_gain_mult"]))

func _xp_requirement() -> float:
	return level * 10.0
