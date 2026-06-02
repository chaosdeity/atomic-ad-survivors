extends RefCounted

const C := preload("res://scripts/game_config.gd")
const DamageRouter := preload("res://scripts/damage_router.gd")

var pos := Vector2.ZERO
var hp := C.PLAYER_MAX_HP
var stats := {}

var is_moving := false
var last_move_dir := Vector2.DOWN
var attack_pose_timer := 0.0
var attack_pose_dir := Vector2.RIGHT

var auto_timer := 0.0
var auto_shot_counter := 0
var hurt_feedback_cooldown := 0.0

var charge_timer := 0.0
var charge_window_left := 0.0
var charge_ready_flash := 0.0
var charge_open_age := 0.0
var charge_warning_played := false
var charge_miss_notice := 0.0
var charge_puddles: Array[Dictionary] = []
var charge_effect_anchor := Vector2.ZERO
var charge_effect_anchor_active := false

func setup() -> void:
	pos = Vector2.ZERO
	hp = C.PLAYER_MAX_HP
	stats = {
		"max_hp": C.PLAYER_MAX_HP,
		"move_speed": 100.0,
		"auto_damage": 10.0,
		"auto_range": 150.0,
		"charge_damage": 50.0,
		"low_hp_damage_reduction": 0.0,
		"elite_damage_mult": 0.0,
		"boss_shield_damage_mult": 0.0,
		"charge_window_bonus": 0.0,
		"perfect_charge_level": 0,
		"emergency_charge_level": 0,
		"return_label_level": 0
	}
	is_moving = false
	last_move_dir = Vector2.DOWN
	auto_timer = 0.0
	charge_timer = 0.0
	charge_window_left = 0.0

func apply_movement(input_dir: Vector2, delta: float, speed_mult: float = 1.0) -> void:
	is_moving = input_dir.length_squared() > 0.0
	if is_moving:
		last_move_dir = input_dir
	pos += input_dir * float(stats.get("move_speed", 100.0)) * speed_mult * delta

func clamp_position(arena_half: Vector2) -> void:
	pos.x = clampf(pos.x, -arena_half.x, arena_half.x)
	pos.y = clampf(pos.y, -arena_half.y, arena_half.y)

func register_attack_pose(dir: Vector2, duration: float) -> void:
	if dir.length_squared() > 0.01:
		attack_pose_dir = dir.normalized()
		attack_pose_timer = duration

func update_attack_pose(delta: float) -> void:
	attack_pose_timer = maxf(0.0, attack_pose_timer - delta)

func update_cooldowns(delta: float) -> void:
	hurt_feedback_cooldown = maxf(0.0, hurt_feedback_cooldown - delta)
	attack_pose_timer = maxf(0.0, attack_pose_timer - delta)

func update_auto_fire(delta: float, tick_rate: float) -> bool:
	auto_timer -= delta
	if auto_timer <= 0.0:
		auto_timer = tick_rate
		return true
	return false

func update_charge(delta: float, charge_period: float, charge_window: float, warning_time: float) -> Dictionary:
	var events := {"missed": false, "warning": false, "ready": false}
	charge_miss_notice = maxf(0.0, charge_miss_notice - delta)
	if charge_window_left > 0.0:
		charge_window_left = maxf(0.0, charge_window_left - delta)
		charge_open_age += delta
		if charge_window_left <= 0.0:
			events["missed"] = true
			charge_timer = 0.0
			charge_open_age = 0.0
			charge_warning_played = false
	else:
		charge_timer += delta
		var warning_left := charge_period - charge_timer
		if not charge_warning_played and warning_left <= warning_time:
			charge_warning_played = true
			events["warning"] = true
		if charge_timer >= charge_period:
			charge_window_left = charge_window
			charge_open_age = 0.0
			charge_warning_played = false
			charge_ready_flash = 0.25 # C.CHARGE_READY_FLASH
			events["ready"] = true
	charge_ready_flash = maxf(0.0, charge_ready_flash - delta)
	return events
