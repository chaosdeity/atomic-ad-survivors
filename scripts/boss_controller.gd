extends RefCounted

const C := preload("res://scripts/game_config.gd")
const EnemyController := preload("res://scripts/enemy_controller.gd")
const UIFont := preload("res://scripts/ui_font.gd")

const BOSS_NAME := "캠페인 송출관"
const MAX_HP := 1750.0
const BODY_RADIUS := 58.0
const DEFAULT_POS := Vector2(0, -92)
const SWEEP_TELEGRAPH_TIME := 1.15
const SWEEP_FIRE_TIME := 0.32
const CORE_EXPOSE_TIME := 2.0
const PATTERN_COOLDOWN := 1.7
const SHIELD_COUNT := 4
const SHIELD_HP := 54.0

var active := false
var defeated := false
var hp := MAX_HP
var max_hp := MAX_HP
var phase := 1
var defense_type := EnemyController.DEFENSE_TYPE_PLATED
var core_exposed := false
var pos := DEFAULT_POS
var state := "inactive"
var pattern_name := ""
var pattern_timer := 0.0
var pattern_index := 0
var sweep_axis := "horizontal"
var sweep_damage_done := false
var shields: Array[float] = []
var hit_flash := 0.0
var defense_rules := EnemyController.new()

func start() -> void:
	active = true
	defeated = false
	hp = max_hp
	phase = 1
	pos = DEFAULT_POS
	pattern_index = 0
	shields.clear()
	_set_idle()

func reset() -> void:
	active = false
	defeated = false
	hp = max_hp
	phase = 1
	defense_type = EnemyController.DEFENSE_TYPE_PLATED
	core_exposed = false
	state = "inactive"
	pattern_name = ""
	pattern_timer = 0.0
	pattern_index = 0
	sweep_damage_done = false
	shields.clear()
	hit_flash = 0.0

func update(delta: float, player_pos: Vector2) -> Dictionary:
	if not active or defeated:
		return {}
	hit_flash = maxf(0.0, hit_flash - delta)
	pattern_timer -= delta
	_update_phase()
	match state:
		"idle":
			if pattern_timer <= 0.0:
				_start_next_pattern()
		"sweep_telegraph":
			if pattern_timer <= 0.0:
				state = "sweep_fire"
				pattern_timer = SWEEP_FIRE_TIME
				sweep_damage_done = false
		"sweep_fire":
			var result := {}
			if not sweep_damage_done and _sweep_hits_player(player_pos):
				sweep_damage_done = true
				result["player_damage"] = 25.0
				result["hit_pos"] = player_pos
			if pattern_timer <= 0.0:
				_expose_core(CORE_EXPOSE_TIME)
			return result
		"shield":
			if shields.size() == 0 or pattern_timer <= 0.0:
				_expose_core(1.65 if shields.size() == 0 else 0.9)
		"core_exposed":
			if pattern_timer <= 0.0:
				_set_idle()
	return {}

func apply_damage(base_damage: float, damage_type: String) -> Dictionary:
	if not active or defeated:
		return {}
	var shield_damage := 0.0
	var damage_mult := defense_rules.damage_multiplier(defense_type, damage_type)
	var boss_damage := base_damage * damage_mult
	var shield_broken := false
	if state == "shield" and shields.size() > 0:
		var shield_mult := _shield_damage_multiplier(damage_type)
		shield_damage = base_damage * shield_mult
		_damage_front_shield(shield_damage)
		shield_broken = true
		boss_damage *= 0.30 if damage_type == EnemyController.DAMAGE_TYPE_AUTO else 0.55
		if shields.size() == 0:
			_expose_core(2.2)
	hp = maxf(0.0, hp - boss_damage)
	hit_flash = 0.14
	if hp <= 0.0:
		defeated = true
		active = false
		state = "defeated"
		core_exposed = false
	return {
		"pos": pos + Vector2(0, -34),
		"damage": boss_damage,
		"base_damage": base_damage,
		"damage_type": damage_type,
		"defense_type": defense_type,
		"multiplier": damage_mult,
		"effectiveness": defense_rules.damage_effectiveness(damage_mult),
		"shield_damage": shield_damage,
		"shield_broken": shield_broken,
		"defeated": defeated,
	}

func force_expose_core(duration: float = 3.0) -> void:
	if not active or defeated:
		return
	_expose_core(duration)

func force_phase_two_preview() -> void:
	if not active or defeated:
		return
	hp = minf(hp, max_hp * 0.66)
	phase = 2
	_expose_core(3.0)

func force_defeat() -> void:
	if not active:
		return
	hp = 0.0
	defeated = true
	active = false
	state = "defeated"
	core_exposed = false

func hp_ratio() -> float:
	return clampf(hp / maxf(0.001, max_hp), 0.0, 1.0)

func status_label() -> String:
	if core_exposed:
		return "코어 노출"
	if defense_type == EnemyController.DEFENSE_TYPE_ANTI_AUTO:
		return "방패"
	return "장갑"

func target_distance_sq(from_pos: Vector2) -> float:
	return from_pos.distance_squared_to(pos)

func contains_point(point: Vector2, extra_radius: float = 0.0) -> bool:
	return point.distance_squared_to(pos) <= pow(BODY_RADIUS + extra_radius, 2.0)

func draw(canvas: CanvasItem, elapsed: float) -> void:
	if not active and not defeated:
		return
	_draw_telegraphs(canvas)
	_draw_body(canvas, elapsed)

func _set_idle() -> void:
	state = "idle"
	pattern_name = ""
	pattern_timer = PATTERN_COOLDOWN
	defense_type = EnemyController.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_next_pattern() -> void:
	pattern_index += 1
	if pattern_index % 2 == 1:
		_start_sweep()
	else:
		_start_shield()

func _start_sweep() -> void:
	state = "sweep_telegraph"
	pattern_name = "황금 시간대 스윕"
	pattern_timer = SWEEP_TELEGRAPH_TIME
	sweep_axis = "horizontal" if pattern_index % 4 == 1 else "vertical"
	sweep_damage_done = false
	defense_type = EnemyController.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_shield() -> void:
	state = "shield"
	pattern_name = "보증서 방패"
	pattern_timer = 5.2
	defense_type = EnemyController.DEFENSE_TYPE_ANTI_AUTO
	core_exposed = false
	shields.clear()
	for i in range(SHIELD_COUNT):
		shields.append(SHIELD_HP)

func _expose_core(duration: float) -> void:
	state = "core_exposed"
	pattern_name = "코어 노출"
	pattern_timer = duration
	defense_type = EnemyController.DEFENSE_TYPE_EXPOSED_CORE
	core_exposed = true
	shields.clear()

func _update_phase() -> void:
	phase = 2 if hp <= max_hp * 0.65 else 1

func _sweep_hits_player(player_pos: Vector2) -> bool:
	if sweep_axis == "horizontal":
		return absf(player_pos.y - pos.y) <= 34.0
	return absf(player_pos.x - pos.x) <= 34.0

func _shield_damage_multiplier(damage_type: String) -> float:
	if damage_type == EnemyController.DAMAGE_TYPE_AUTO:
		return 0.55
	if damage_type == EnemyController.DAMAGE_TYPE_CHARGE:
		return 1.15
	if damage_type == EnemyController.DAMAGE_TYPE_FOCUSED:
		return 1.35
	if damage_type == EnemyController.DAMAGE_TYPE_BURST or damage_type == EnemyController.DAMAGE_TYPE_PUDDLE:
		return 1.25
	return 1.0

func _damage_front_shield(amount: float) -> void:
	if shields.size() == 0:
		return
	shields[0] = float(shields[0]) - amount
	while shields.size() > 0 and float(shields[0]) <= 0.0:
		shields.pop_front()

func _draw_telegraphs(canvas: CanvasItem) -> void:
	if state == "sweep_telegraph" or state == "sweep_fire":
		var alpha := 0.28 if state == "sweep_telegraph" else 0.62
		var color := Color(1.0, 0.91, 0.25, alpha)
		var hot := Color(1.0, 0.3, 0.36, alpha + 0.18)
		if sweep_axis == "horizontal":
			var rect := Rect2(Vector2(-C.ARENA_HALF.x, pos.y - 17.0), Vector2(C.ARENA_HALF.x * 2.0, 34.0))
			canvas.draw_rect(rect, color)
			canvas.draw_line(Vector2(-C.ARENA_HALF.x, pos.y), Vector2(C.ARENA_HALF.x, pos.y), hot, 4.0)
		else:
			var rect := Rect2(Vector2(pos.x - 17.0, -C.ARENA_HALF.y), Vector2(34.0, C.ARENA_HALF.y * 2.0))
			canvas.draw_rect(rect, color)
			canvas.draw_line(Vector2(pos.x, -C.ARENA_HALF.y), Vector2(pos.x, C.ARENA_HALF.y), hot, 4.0)

func _draw_body(canvas: CanvasItem, elapsed: float) -> void:
	var ring_color := _defense_color()
	var pulse := 1.0 + sin(elapsed * 4.6) * 0.04
	canvas.draw_circle(pos + Vector2(4, 8), BODY_RADIUS + 8.0, Color(0.0, 0.0, 0.0, 0.18))
	canvas.draw_circle(pos, BODY_RADIUS * 0.92, Color("#f6dfaa"))
	canvas.draw_arc(pos, (BODY_RADIUS + 10.0) * pulse, 0.0, TAU, 64, ring_color, 5.0)
	canvas.draw_rect(Rect2(pos + Vector2(-46, -38), Vector2(92, 58)), Color("#f5e9d0"))
	canvas.draw_rect(Rect2(pos + Vector2(-46, -38), Vector2(92, 58)), C.COCOA, false, 4.0)
	canvas.draw_rect(Rect2(pos + Vector2(-32, -26), Vector2(64, 34)), Color("#c8dcd8"))
	canvas.draw_rect(Rect2(pos + Vector2(-32, -26), Vector2(64, 34)), ring_color, false, 2.0)
	canvas.draw_line(pos + Vector2(-24, -58), pos + Vector2(-42, -86), C.COCOA, 3.0)
	canvas.draw_line(pos + Vector2(24, -58), pos + Vector2(42, -86), C.COCOA, 3.0)
	canvas.draw_circle(pos + Vector2(-42, -86), 5.0, C.VITAMIN_YELLOW)
	canvas.draw_circle(pos + Vector2(42, -86), 5.0, C.NEON_RED)
	canvas.draw_rect(Rect2(pos + Vector2(-58, 20), Vector2(116, 18)), C.LEMON_YELLOW)
	canvas.draw_rect(Rect2(pos + Vector2(-58, 20), Vector2(116, 18)), C.COCOA, false, 2.0)
	canvas.draw_string(UIFont.get_font(), pos + Vector2(0, 34), "PRIME", HORIZONTAL_ALIGNMENT_CENTER, 112.0, 10, C.INK)
	if core_exposed:
		canvas.draw_circle(pos + Vector2(0, -9), 14.0 + sin(elapsed * 14.0) * 2.0, Color(0.62, 1.0, 0.36, 0.86))
		canvas.draw_circle(pos + Vector2(0, -9), 6.0, C.VITAMIN_YELLOW)
	if hit_flash > 0.0:
		canvas.draw_circle(pos, BODY_RADIUS + 12.0, Color(1.0, 1.0, 0.86, hit_flash * 2.8))
	_draw_shields(canvas, elapsed)

func _draw_shields(canvas: CanvasItem, elapsed: float) -> void:
	if shields.size() == 0:
		return
	for i in range(shields.size()):
		var angle := elapsed * 1.6 + TAU * float(i) / float(SHIELD_COUNT)
		var shield_pos := pos + Vector2(cos(angle), sin(angle)) * 78.0
		var ratio := clampf(float(shields[i]) / SHIELD_HP, 0.0, 1.0)
		canvas.draw_rect(Rect2(shield_pos - Vector2(13, 9), Vector2(26, 18)), Color("#fff7df"))
		canvas.draw_rect(Rect2(shield_pos - Vector2(13, 9), Vector2(26, 18)), C.COCOA, false, 2.0)
		canvas.draw_line(shield_pos + Vector2(-8, 3), shield_pos + Vector2(8, -3), C.NEON_RED, 1.5)
		canvas.draw_rect(Rect2(shield_pos + Vector2(-10, 12), Vector2(20.0 * ratio, 3)), C.TOXIC_GREEN)

func _defense_color() -> Color:
	match defense_type:
		EnemyController.DEFENSE_TYPE_ANTI_AUTO:
			return Color("#8a5a3f")
		EnemyController.DEFENSE_TYPE_EXPOSED_CORE:
			return C.TOXIC_GREEN
		_:
			return Color("#433227")
