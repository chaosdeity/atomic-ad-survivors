extends RefCounted

const C := preload("res://scripts/game_config.gd")
const DamageRouter := preload("res://scripts/damage_router.gd")
const UIFont := preload("res://scripts/ui_font.gd")

const BOSS_NAME := "스마일 홈 심사관"
const BOSS_ROLE_NAME := "스마일 홈 가족심사 관리자"
const BOSS_ALIAS := "스마일 홈 시어머니"
const MAX_HP := 1750.0
const BODY_RADIUS := 58.0
const DEFAULT_POS := Vector2(0, -92)
const SWEEP_TELEGRAPH_TIME := 1.25
const SWEEP_FIRE_TIME := 0.32
const CORE_EXPOSE_TIME := 2.0
const PATTERN_COOLDOWN := 1.7
const ENRAGED_PATTERN_COOLDOWN := 0.95
const DISTORTION_TELEGRAPH_TIME := 1.15
const DISTORTION_ACTIVE_TIME := 4.6
const DEMO_TELEGRAPH_TIME := 1.25
const DEMO_CHARGE_TIME := 0.85
const DEMO_RECOVER_TIME := 0.55
const DEMO_CORE_EXPOSE_TIME := 2.2
const DEMO_DAMAGE := 34.0
const DEMO_RAIL_WIDTH := 46.0
const DEMO_TRAVEL_DISTANCE := 190.0
const SHIELD_COUNT := 4
const SHIELD_HP := 54.0

var active := false
var defeated := false
var hp := MAX_HP
var max_hp := MAX_HP
var phase := 1
var defense_type := DamageRouter.DEFENSE_TYPE_PLATED
var core_exposed := false
var pos := DEFAULT_POS
var state := "inactive"
var pattern_name := ""
var pattern_timer := 0.0
var pattern_index := 0
var sweep_axis := "horizontal"
var sweep_line_coord := 0.0
var sweep_damage_done := false
var demo_start_pos := DEFAULT_POS
var demo_end_pos := DEFAULT_POS
var demo_dir := Vector2.DOWN
var demo_hit_done := false
var shields: Array[float] = []
var hit_flash := 0.0
var core_expose_bonus := 0.0
var outcome_visual := ""

func start() -> void:
	active = true
	defeated = false
	hp = max_hp
	phase = 1
	pos = DEFAULT_POS
	pattern_index = 0
	sweep_line_coord = 0.0
	demo_start_pos = pos
	demo_end_pos = pos
	demo_dir = Vector2.DOWN
	demo_hit_done = false
	shields.clear()
	_set_idle()

func reset() -> void:
	active = false
	defeated = false
	hp = max_hp
	phase = 1
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	state = "inactive"
	pattern_name = ""
	pattern_timer = 0.0
	pattern_index = 0
	sweep_line_coord = 0.0
	sweep_damage_done = false
	demo_start_pos = DEFAULT_POS
	demo_end_pos = DEFAULT_POS
	demo_dir = Vector2.DOWN
	demo_hit_done = false
	shields.clear()
	hit_flash = 0.0
	core_expose_bonus = 0.0
	outcome_visual = ""

func update(delta: float, player_pos: Vector2) -> Dictionary:
	if not active or defeated:
		return {}
	hit_flash = maxf(0.0, hit_flash - delta)
	pattern_timer -= delta
	_update_phase()
	match state:
		"idle":
			if pattern_timer <= 0.0:
				_start_next_pattern(player_pos)
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
		"distortion_telegraph":
			if pattern_timer <= 0.0:
				_start_distortion_active()
		"distortion_active":
			if pattern_timer <= 0.0:
				_expose_core(1.35)
		"demo_telegraph":
			if pattern_timer <= 0.0:
				_start_demo_charge()
		"demo_charge":
			var result := {}
			var charge_ratio := 1.0 - clampf(pattern_timer / DEMO_CHARGE_TIME, 0.0, 1.0)
			pos = demo_start_pos.lerp(demo_end_pos, charge_ratio)
			if not demo_hit_done and _demo_hits_player(player_pos):
				demo_hit_done = true
				result["player_damage"] = DEMO_DAMAGE
				result["hit_pos"] = player_pos
				result["knockback"] = demo_dir * 20.0
			if pattern_timer <= 0.0:
				pos = demo_end_pos
				_start_demo_recover()
			return result
		"demo_recover":
			if pattern_timer <= 0.0:
				_expose_core(DEMO_CORE_EXPOSE_TIME)
		"core_exposed":
			if pattern_timer <= 0.0:
				_set_idle()
	return {}

func apply_damage(base_damage: float, damage_type: String, player_stats: Dictionary) -> Dictionary:
	if not active or defeated:
		return {}
	var shield_damage := 0.0
	var dmg_result := DamageRouter.calculate_damage({
		"target_type": DamageRouter.TARGET_BOSS,
		"base_damage": base_damage,
		"damage_type": damage_type,
		"boss_state": state,
		"defense_type": defense_type,
		"player_stats": player_stats
	})

	var damage_mult := float(dmg_result["multiplier"])
	var boss_damage := float(dmg_result["final_damage"])
	var shield_broken := false
	var distorted_charge := state == "distortion_active" and (damage_type == DamageRouter.DAMAGE_TYPE_CHARGE or damage_type == DamageRouter.DAMAGE_TYPE_FOCUSED)

	if state == "shield" and shields.size() > 0:
		var shield_mult := _shield_damage_multiplier(damage_type)
		shield_damage = base_damage * shield_mult
		_damage_front_shield(shield_damage)
		shield_broken = true
		boss_damage *= 0.30 if damage_type == DamageRouter.DAMAGE_TYPE_AUTO else 0.55
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
		"effectiveness": String(dmg_result["effectiveness"]),
		"shield_damage": shield_damage,
		"shield_broken": shield_broken,
		"distorted_charge": distorted_charge,
		"defeated": defeated,
	}

func force_expose_core(duration: float = 3.0) -> void:
	if not active or defeated:
		return
	_expose_core(duration)

func set_core_expose_bonus(value: float) -> void:
	core_expose_bonus = maxf(0.0, value)

func set_outcome_visual(outcome: String) -> void:
	outcome_visual = outcome

func force_phase_two_preview() -> void:
	if not active or defeated:
		return
	hp = minf(hp, max_hp * 0.64)
	phase = 2
	_expose_core(3.0)

func force_enraged_preview() -> void:
	if not active or defeated:
		return
	hp = minf(hp, max_hp * 0.24)
	phase = 3
	_expose_core(2.6)

func force_distortion() -> void:
	if not active or defeated:
		return
	hp = minf(hp, max_hp * 0.64)
	phase = 2
	_start_distortion_telegraph()

func force_safety_demo(player_pos: Vector2) -> void:
	if not active or defeated:
		return
	hp = minf(hp, max_hp * 0.64)
	phase = 2
	_start_demo_telegraph(player_pos)

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
		return "마지막 코어" if phase >= 3 else "코어 노출"
	if defense_type == DamageRouter.DEFENSE_TYPE_ANTI_AUTO:
		return "자동저항"
	if defense_type == DamageRouter.DEFENSE_TYPE_ANTI_CHARGE:
		return "차징저항"
	if state == "demo_telegraph":
		return "시연 준비"
	if state == "demo_charge":
		return "돌진"
	if state == "demo_recover":
		return "시연 회수"
	if phase >= 3:
		return "마지막 방송"
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
	pattern_timer = ENRAGED_PATTERN_COOLDOWN if phase >= 3 else PATTERN_COOLDOWN
	pos = _clamp_demo_pos(pos)
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_next_pattern(player_pos: Vector2) -> void:
	pattern_index += 1
	if phase >= 3:
		match pattern_index % 6:
			1:
				_start_sweep(player_pos)
			2:
				_start_shield()
			3:
				_start_distortion_telegraph()
			4:
				_start_demo_telegraph(player_pos)
			5:
				_start_sweep(player_pos)
			_:
				_start_shield()
	elif phase >= 2:
		match pattern_index % 5:
			3:
				_start_distortion_telegraph()
			4:
				_start_demo_telegraph(player_pos)
			1:
				_start_sweep(player_pos)
			_:
				_start_shield()
	elif pattern_index % 2 == 1:
		_start_sweep(player_pos)
	else:
		_start_shield()

func _start_sweep(player_pos: Vector2) -> void:
	state = "sweep_telegraph"
	pattern_name = "완벽한 식탁 검사"
	pattern_timer = SWEEP_TELEGRAPH_TIME if phase < 3 else 1.05
	sweep_axis = "horizontal" if pattern_index % 4 == 1 else "vertical"
	sweep_line_coord = player_pos.y if sweep_axis == "horizontal" else player_pos.x
	sweep_damage_done = false
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_shield() -> void:
	state = "shield"
	pattern_name = "평생 보증 앞치마"
	pattern_timer = 5.2 if phase < 3 else 4.2
	defense_type = DamageRouter.DEFENSE_TYPE_ANTI_AUTO
	core_exposed = false
	shields.clear()
	for i in range(SHIELD_COUNT):
		shields.append(SHIELD_HP if phase < 3 else SHIELD_HP * 0.86)

func _start_distortion_telegraph() -> void:
	state = "distortion_telegraph"
	pattern_name = "행복 기준 재조정"
	pattern_timer = DISTORTION_TELEGRAPH_TIME if phase < 3 else 0.95
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_distortion_active() -> void:
	state = "distortion_active"
	pattern_name = "행복 기준 재조정"
	pattern_timer = DISTORTION_ACTIVE_TIME if phase < 3 else 3.6
	defense_type = DamageRouter.DEFENSE_TYPE_ANTI_CHARGE
	core_exposed = false
	shields.clear()

func _start_demo_telegraph(player_pos: Vector2) -> void:
	state = "demo_telegraph"
	pattern_name = "방문 점검 돌진"
	pattern_timer = DEMO_TELEGRAPH_TIME if phase < 3 else 1.05
	demo_start_pos = _clamp_demo_pos(pos)
	pos = demo_start_pos
	var to_player := player_pos - demo_start_pos
	demo_dir = to_player.normalized() if to_player.length_squared() > 0.001 else Vector2.DOWN
	demo_end_pos = _clamp_demo_pos(demo_start_pos + demo_dir * DEMO_TRAVEL_DISTANCE)
	demo_hit_done = false
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_demo_charge() -> void:
	state = "demo_charge"
	pattern_name = "방문 점검 돌진"
	pattern_timer = DEMO_CHARGE_TIME
	demo_hit_done = false
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _start_demo_recover() -> void:
	state = "demo_recover"
	pattern_name = "방문 점검 돌진"
	pattern_timer = DEMO_RECOVER_TIME
	defense_type = DamageRouter.DEFENSE_TYPE_PLATED
	core_exposed = false
	shields.clear()

func _expose_core(duration: float) -> void:
	state = "core_exposed"
	pattern_name = "코어 노출"
	var phase_duration := duration
	if phase >= 3:
		phase_duration = maxf(1.15, duration - 0.25)
	pattern_timer = phase_duration + core_expose_bonus
	defense_type = DamageRouter.DEFENSE_TYPE_EXPOSED_CORE
	core_exposed = true
	shields.clear()

func _update_phase() -> void:
	if hp <= max_hp * 0.25:
		phase = 3
	elif hp <= max_hp * 0.65:
		phase = 2
	else:
		phase = 1

func _sweep_hits_player(player_pos: Vector2) -> bool:
	if sweep_axis == "horizontal":
		return absf(player_pos.y - sweep_line_coord) <= 26.0
	return absf(player_pos.x - sweep_line_coord) <= 26.0

func _demo_hits_player(player_pos: Vector2) -> bool:
	if contains_point(player_pos, 8.0):
		return true
	return _distance_to_segment(player_pos, demo_start_pos, demo_end_pos) <= DEMO_RAIL_WIDTH * 0.5

func _distance_to_segment(point: Vector2, a: Vector2, b: Vector2) -> float:
	var ab := b - a
	var length_sq := ab.length_squared()
	if length_sq <= 0.001:
		return point.distance_to(a)
	var t := clampf((point - a).dot(ab) / length_sq, 0.0, 1.0)
	return point.distance_to(a + ab * t)

func _clamp_demo_pos(value: Vector2) -> Vector2:
	return Vector2(
		clampf(value.x, -C.ARENA_HALF.x + BODY_RADIUS + 24.0, C.ARENA_HALF.x - BODY_RADIUS - 24.0),
		clampf(value.y, -C.ARENA_HALF.y + BODY_RADIUS + 72.0, C.ARENA_HALF.y - BODY_RADIUS - 72.0)
	)

func _shield_damage_multiplier(damage_type: String) -> float:
	if damage_type == DamageRouter.DAMAGE_TYPE_AUTO:
		return 0.55
	if damage_type == DamageRouter.DAMAGE_TYPE_CHARGE:
		return 1.15
	if damage_type == DamageRouter.DAMAGE_TYPE_FOCUSED:
		return 1.35
	if damage_type == DamageRouter.DAMAGE_TYPE_BURST or damage_type == DamageRouter.DAMAGE_TYPE_PUDDLE:
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
		var alpha := 0.36 if state == "sweep_telegraph" else 0.70
		var color := Color(1.0, 0.91, 0.25, alpha)
		var hot := Color(1.0, 0.3, 0.36, alpha + 0.18)
		if sweep_axis == "horizontal":
			var rect := Rect2(Vector2(-C.ARENA_HALF.x, sweep_line_coord - 26.0), Vector2(C.ARENA_HALF.x * 2.0, 52.0))
			canvas.draw_rect(rect, color)
			canvas.draw_line(Vector2(-C.ARENA_HALF.x, sweep_line_coord - 26.0), Vector2(C.ARENA_HALF.x, sweep_line_coord - 26.0), hot, 3.0)
			canvas.draw_line(Vector2(-C.ARENA_HALF.x, sweep_line_coord + 26.0), Vector2(C.ARENA_HALF.x, sweep_line_coord + 26.0), hot, 3.0)
			canvas.draw_line(Vector2(-C.ARENA_HALF.x, sweep_line_coord), Vector2(C.ARENA_HALF.x, sweep_line_coord), hot, 5.0)
			_draw_coupon_sweep_cues(canvas, Vector2(-C.ARENA_HALF.x + 46.0, sweep_line_coord), Vector2.RIGHT, alpha)
			_draw_coupon_sweep_cues(canvas, Vector2(C.ARENA_HALF.x - 46.0, sweep_line_coord), Vector2.LEFT, alpha)
		else:
			var rect := Rect2(Vector2(sweep_line_coord - 26.0, -C.ARENA_HALF.y), Vector2(52.0, C.ARENA_HALF.y * 2.0))
			canvas.draw_rect(rect, color)
			canvas.draw_line(Vector2(sweep_line_coord - 26.0, -C.ARENA_HALF.y), Vector2(sweep_line_coord - 26.0, C.ARENA_HALF.y), hot, 3.0)
			canvas.draw_line(Vector2(sweep_line_coord + 26.0, -C.ARENA_HALF.y), Vector2(sweep_line_coord + 26.0, C.ARENA_HALF.y), hot, 3.0)
			canvas.draw_line(Vector2(sweep_line_coord, -C.ARENA_HALF.y), Vector2(sweep_line_coord, C.ARENA_HALF.y), hot, 5.0)
			_draw_coupon_sweep_cues(canvas, Vector2(sweep_line_coord, -C.ARENA_HALF.y + 46.0), Vector2.DOWN, alpha)
			_draw_coupon_sweep_cues(canvas, Vector2(sweep_line_coord, C.ARENA_HALF.y - 46.0), Vector2.UP, alpha)
	if state == "distortion_telegraph" or state == "distortion_active":
		var active_alpha := 0.42 if state == "distortion_active" else 0.24
		var wave_color := Color(0.35, 0.70, 0.95, active_alpha)
		var hot_color := Color(0.62, 1.0, 0.36, active_alpha + 0.18)
		for i in range(7):
			var y := -C.ARENA_HALF.y + 28.0 + float(i) * 34.0
			var points := PackedVector2Array()
			for n in range(18):
				var x := -C.ARENA_HALF.x + float(n) * (C.ARENA_HALF.x * 2.0 / 17.0)
				var wobble := sin(float(n) * 1.7 + float(i) * 0.8) * (8.0 if state == "distortion_active" else 5.0)
				points.append(Vector2(x, y + wobble))
			for n in range(points.size() - 1):
				canvas.draw_line(points[n], points[n + 1], wave_color, 2.0)
		canvas.draw_arc(pos, BODY_RADIUS + 28.0, 0.0, TAU, 48, hot_color, 4.0)
	if state == "demo_telegraph" or state == "demo_charge" or state == "demo_recover":
		var alpha := 0.34 if state == "demo_telegraph" else 0.54
		var rail_color := Color(1.0, 0.3, 0.36, alpha)
		var edge_color := Color(1.0, 0.91, 0.25, alpha + 0.18)
		var normal := demo_dir.orthogonal().normalized()
		var half_width := DEMO_RAIL_WIDTH * 0.5
		var rail := PackedVector2Array([
			demo_start_pos + normal * half_width,
			demo_end_pos + normal * half_width,
			demo_end_pos - normal * half_width,
			demo_start_pos - normal * half_width,
		])
		canvas.draw_colored_polygon(rail, rail_color)
		canvas.draw_line(demo_start_pos + normal * half_width, demo_end_pos + normal * half_width, edge_color, 3.0)
		canvas.draw_line(demo_start_pos - normal * half_width, demo_end_pos - normal * half_width, edge_color, 3.0)
		canvas.draw_line(demo_start_pos, demo_end_pos, Color(0.08, 0.06, 0.05, alpha + 0.16), 2.0)
		canvas.draw_circle(demo_end_pos, 12.0 + sin(Time.get_ticks_msec() * 0.012) * 2.0, edge_color)
		_draw_demo_safety_cues(canvas, alpha)

func _draw_coupon_sweep_cues(canvas: CanvasItem, anchor: Vector2, dir: Vector2, alpha: float) -> void:
	var side := dir.orthogonal().normalized()
	for i in range(-2, 3):
		var center := anchor + side * float(i) * 13.0
		var angle := dir.angle() + float(i) * 0.08
		_draw_rotated_rect(canvas, center, Vector2(20, 11), angle, Color(1.0, 0.96, 0.72, alpha + 0.14), C.COCOA, 1.2)
		canvas.draw_line(center - dir * 5.5, center + dir * 5.5, Color(1.0, 0.3, 0.36, alpha + 0.22), 1.0)

func _draw_demo_safety_cues(canvas: CanvasItem, alpha: float) -> void:
	var normal := demo_dir.orthogonal().normalized()
	for i in range(4):
		var ratio := (float(i) + 0.5) / 4.0
		var center := demo_start_pos.lerp(demo_end_pos, ratio)
		var offset := normal * (DEMO_RAIL_WIDTH * 0.5 + 12.0)
		for side_sign in [-1.0, 1.0]:
			var marker: Vector2 = center + offset * side_sign
			canvas.draw_rect(Rect2(marker - Vector2(5, 5), Vector2(10, 10)), Color(1.0, 0.96, 0.72, alpha + 0.16))
			canvas.draw_rect(Rect2(marker - Vector2(5, 5), Vector2(10, 10)), C.NEON_RED, false, 1.4)
			canvas.draw_line(marker + Vector2(-4, 4), marker + Vector2(4, -4), C.NEON_RED, 1.2)

func _draw_body(canvas: CanvasItem, elapsed: float) -> void:
	var ring_color := _defense_color()
	var pulse := 1.0 + sin(elapsed * 4.6) * 0.04
	var damage_tier := _damage_visual_tier()
	if phase >= 3:
		canvas.draw_arc(pos, BODY_RADIUS + 22.0 + sin(elapsed * 9.0) * 4.0, 0.0, TAU, 64, Color(1.0, 0.3, 0.36, 0.55), 6.0)
		canvas.draw_arc(pos, BODY_RADIUS + 34.0 + cos(elapsed * 7.5) * 5.0, 0.0, TAU, 64, Color(1.0, 0.91, 0.25, 0.38), 3.0)
		_draw_family_pressure(canvas, elapsed)
	if defeated:
		_draw_outcome_hook(canvas, elapsed)
	canvas.draw_circle(pos + Vector2(4, 8), BODY_RADIUS + 8.0, Color(0.0, 0.0, 0.0, 0.18))
	canvas.draw_circle(pos, BODY_RADIUS * 0.92, Color("#f6dfaa") if not defeated else Color("#d8ceb8"))
	canvas.draw_arc(pos, (BODY_RADIUS + 10.0) * pulse, 0.0, TAU, 64, ring_color, 5.0)
	_draw_model_house_roof(canvas, elapsed, damage_tier)
	_draw_coupon_skirt(canvas, elapsed, damage_tier)
	_draw_domestic_attachments(canvas, elapsed, damage_tier)
	canvas.draw_rect(Rect2(pos + Vector2(-46, -38), Vector2(92, 58)), Color("#f5e9d0") if not defeated else Color("#cfc4ad"))
	canvas.draw_rect(Rect2(pos + Vector2(-46, -38), Vector2(92, 58)), C.COCOA, false, 4.0)
	_draw_crt_face(canvas, elapsed, ring_color, damage_tier)
	_draw_doorbell_and_nameplate(canvas, elapsed, damage_tier)
	if state == "distortion_telegraph" or state == "distortion_active":
		var antenna_color := Color(0.35, 0.70, 0.95, 0.82)
		canvas.draw_arc(pos + Vector2(-42, -86), 13.0 + sin(elapsed * 12.0) * 2.0, 0.0, TAU, 24, antenna_color, 2.5)
		canvas.draw_arc(pos + Vector2(42, -86), 13.0 + cos(elapsed * 12.0) * 2.0, 0.0, TAU, 24, antenna_color, 2.5)
		_draw_crt_glitch(canvas, elapsed, 0.86)
	if state == "demo_telegraph":
		canvas.draw_line(pos + demo_dir * 12.0, pos + demo_dir * 46.0, C.NEON_RED, 5.0)
		canvas.draw_arc(pos, BODY_RADIUS + 18.0, demo_dir.angle() - 0.45, demo_dir.angle() + 0.45, 18, C.VITAMIN_YELLOW, 4.0)
	elif state == "demo_charge":
		canvas.draw_line(pos - demo_dir * 38.0, pos - demo_dir * 78.0, Color(1.0, 0.91, 0.25, 0.76), 5.0)
	if core_exposed:
		_draw_core_exposed(canvas, elapsed, damage_tier)
	if hit_flash > 0.0:
		canvas.draw_circle(pos, BODY_RADIUS + 12.0, Color(1.0, 1.0, 0.86, hit_flash * 2.8))
	_draw_shields(canvas, elapsed)

func _damage_visual_tier() -> int:
	if hp_ratio() <= 0.25:
		return 2
	if hp_ratio() <= 0.65:
		return 1
	return 0

func _draw_model_house_roof(canvas: CanvasItem, elapsed: float, damage_tier: int) -> void:
	var roof_y := -59.0
	var roof := PackedVector2Array([
		pos + Vector2(-48, roof_y),
		pos + Vector2(0, roof_y - 29),
		pos + Vector2(48, roof_y),
	])
	canvas.draw_colored_polygon(roof, Color("#f2b8b0") if not defeated else Color("#b8a49b"))
	for i in range(roof.size()):
		canvas.draw_line(roof[i], roof[(i + 1) % roof.size()], C.COCOA, 3.0)
	canvas.draw_rect(Rect2(pos + Vector2(-30, -59), Vector2(60, 14)), C.AD_PAPER if not defeated else Color("#c8bea8"))
	canvas.draw_rect(Rect2(pos + Vector2(-30, -59), Vector2(60, 14)), C.COCOA, false, 2.0)
	canvas.draw_line(pos + Vector2(-24, -72), pos + Vector2(-42, -96), C.COCOA, 3.0)
	canvas.draw_line(pos + Vector2(24, -72), pos + Vector2(42, -96), C.COCOA, 3.0)
	canvas.draw_circle(pos + Vector2(-42, -96), 5.0 + sin(elapsed * 10.0) * (1.5 if damage_tier > 0 else 0.4), C.VITAMIN_YELLOW)
	canvas.draw_circle(pos + Vector2(42, -96), 5.0 + cos(elapsed * 9.0) * (1.5 if damage_tier > 0 else 0.4), C.NEON_RED)
	if damage_tier >= 1:
		canvas.draw_line(pos + Vector2(19, -75), pos + Vector2(37, -58), C.NEON_RED, 2.0)
	if damage_tier >= 2:
		canvas.draw_line(pos + Vector2(-35, -56), pos + Vector2(-17, -48), C.NEON_RED, 2.0)
		canvas.draw_arc(pos + Vector2(0, -74), 24.0 + sin(elapsed * 8.0) * 2.5, 0.0, TAU, 36, Color(1.0, 0.3, 0.36, 0.38), 2.5)

func _draw_coupon_skirt(canvas: CanvasItem, elapsed: float, damage_tier: int) -> void:
	var spread := 1.0
	if state == "sweep_telegraph" or state == "sweep_fire":
		spread = 1.35
	for i in range(-3, 4):
		var angle := PI * 0.5 + float(i) * 0.23 * spread + sin(elapsed * 3.5 + float(i)) * 0.025
		var center := pos + Vector2(float(i) * 13.0 * spread, 45.0 + absf(float(i)) * 2.5)
		var fill := Color("#fff7df") if i % 2 == 0 else Color("#fad89c")
		if defeated:
			fill = Color("#cfc5ad")
			center.y += 10.0 + absf(float(i)) * 3.0
			angle += 0.25 * sign(float(i))
		_draw_rotated_rect(canvas, center, Vector2(23, 13), angle, fill, C.COCOA, 1.5)
		canvas.draw_line(center + Vector2(-5, 2), center + Vector2(7, -2), C.NEON_RED if damage_tier >= 2 else C.COCOA, 1.0)
	if damage_tier >= 1 and not defeated:
		canvas.draw_line(pos + Vector2(-36, 35), pos + Vector2(35, 47), C.NEON_RED, 2.0)

func _draw_domestic_attachments(canvas: CanvasItem, elapsed: float, damage_tier: int) -> void:
	var hose_color := C.COCOA if not defeated else Color("#7d7568")
	var hose_end := pos + Vector2(-78, 24 + sin(elapsed * 3.0) * 2.0)
	canvas.draw_line(pos + Vector2(-43, 5), hose_end, hose_color, 5.0)
	canvas.draw_arc(hose_end, 13.0, PI * 0.15, PI * 1.25, 18, hose_color, 4.0)
	canvas.draw_circle(hose_end + Vector2(-7, 5), 5.0, C.MINT_FADE if not defeated else Color("#899a94"))
	var frame_pos := pos + Vector2(66, -4)
	canvas.draw_rect(Rect2(frame_pos - Vector2(16, 13), Vector2(32, 26)), Color("#fff7df") if damage_tier < 1 else Color("#d4d8cf"))
	canvas.draw_rect(Rect2(frame_pos - Vector2(16, 13), Vector2(32, 26)), C.COCOA, false, 2.0)
	if damage_tier < 1:
		canvas.draw_circle(frame_pos + Vector2(-6, -2), 3.0, C.CORAL_PINK)
		canvas.draw_circle(frame_pos + Vector2(6, -2), 3.0, C.SAGE_GREEN)
		canvas.draw_line(frame_pos + Vector2(-10, 8), frame_pos + Vector2(10, 8), C.COCOA, 1.0)
	else:
		canvas.draw_line(frame_pos + Vector2(-11, -9), frame_pos + Vector2(12, 10), C.NEON_RED, 1.5)
		canvas.draw_line(frame_pos + Vector2(-12, 9), frame_pos + Vector2(11, -10), C.NEON_RED, 1.5)
	var caster_y := 61.0
	canvas.draw_line(pos + Vector2(-25, 42), pos + Vector2(-31, caster_y), C.COCOA, 3.0)
	canvas.draw_line(pos + Vector2(25, 42), pos + Vector2(31, caster_y), C.COCOA, 3.0)
	canvas.draw_circle(pos + Vector2(-31, caster_y), 6.0, C.INK)
	canvas.draw_circle(pos + Vector2(31, caster_y), 6.0, C.INK)

func _draw_crt_face(canvas: CanvasItem, elapsed: float, ring_color: Color, damage_tier: int) -> void:
	var jitter := Vector2.ZERO
	if damage_tier >= 1 and not defeated:
		jitter = Vector2(sin(elapsed * 31.0) * 2.0, cos(elapsed * 23.0) * 1.2)
	var screen_rect := Rect2(pos + Vector2(-32, -26) + jitter, Vector2(64, 34))
	canvas.draw_rect(screen_rect, Color("#c8dcd8") if not defeated else Color("#313633"))
	canvas.draw_rect(screen_rect, ring_color if not defeated else Color("#3b332f"), false, 2.0)
	if defeated and outcome_visual == "destroy_node":
		canvas.draw_line(screen_rect.position + Vector2(8, 8), screen_rect.position + Vector2(56, 26), C.INK, 2.0)
		canvas.draw_line(screen_rect.position + Vector2(56, 8), screen_rect.position + Vector2(8, 26), C.INK, 2.0)
		return
	var face_color := C.INK if damage_tier < 2 else C.NEON_RED
	if defeated and outcome_visual == "extract_memory":
		face_color = Color(0.62, 1.0, 0.36, 0.92)
	canvas.draw_circle(pos + Vector2(-13, -13) + jitter, 3.0, face_color)
	canvas.draw_circle(pos + Vector2(13, -13) + jitter, 3.0, face_color)
	canvas.draw_arc(pos + Vector2(0, -12) + jitter, 17.0, 0.10, PI - 0.10, 20, face_color, 2.5)
	if damage_tier >= 1 and not defeated:
		_draw_crt_glitch(canvas, elapsed, 0.52)
	if damage_tier >= 2 and not defeated:
		canvas.draw_string(UIFont.get_font(), pos + Vector2(0, -3), "OK?", HORIZONTAL_ALIGNMENT_CENTER, 56.0, 9, C.NEON_RED)

func _draw_crt_glitch(canvas: CanvasItem, elapsed: float, alpha: float) -> void:
	for i in range(4):
		var y := -25.0 + float(i) * 9.0 + sin(elapsed * 15.0 + float(i)) * 1.4
		var x_offset := sin(elapsed * 21.0 + float(i) * 2.0) * 5.0
		canvas.draw_line(pos + Vector2(-31 + x_offset, y), pos + Vector2(31 + x_offset, y), Color(1.0, 0.3, 0.36, alpha), 1.4)

func _draw_doorbell_and_nameplate(canvas: CanvasItem, elapsed: float, damage_tier: int) -> void:
	var bell_pos := pos + Vector2(-50, -16)
	canvas.draw_circle(bell_pos, 7.0, C.VITAMIN_YELLOW if not defeated else Color("#9f9278"))
	canvas.draw_circle(bell_pos, 3.0 + sin(elapsed * 7.0) * (1.0 if state == "distortion_active" else 0.25), C.NEON_RED)
	canvas.draw_rect(Rect2(pos + Vector2(-58, 20), Vector2(116, 18)), C.LEMON_YELLOW if not defeated else Color("#b9aa86"))
	canvas.draw_rect(Rect2(pos + Vector2(-58, 20), Vector2(116, 18)), C.COCOA, false, 2.0)
	var label := "SMILE HOME"
	if damage_tier >= 2 and not defeated:
		label = "FAMILY PASS?"
	elif defeated and outcome_visual == "extract_memory":
		label = "MEMORY KEPT"
	elif defeated and outcome_visual == "destroy_node":
		label = "NODE HELD"
	canvas.draw_string(UIFont.get_font(), pos + Vector2(0, 34), label, HORIZONTAL_ALIGNMENT_CENTER, 112.0, 9, C.INK)

func _draw_core_exposed(canvas: CanvasItem, elapsed: float, damage_tier: int) -> void:
	var core_pos := pos + Vector2(0, -9)
	var radius_bonus := 4.0 if damage_tier >= 2 else 0.0
	canvas.draw_rect(Rect2(pos + Vector2(-24, -4), Vector2(48, 24)), Color(0.08, 0.06, 0.05, 0.36))
	canvas.draw_line(pos + Vector2(-24, -4), pos + Vector2(-43, 12), C.COCOA, 2.5)
	canvas.draw_line(pos + Vector2(24, -4), pos + Vector2(43, 12), C.COCOA, 2.5)
	canvas.draw_circle(core_pos, 28.0 + radius_bonus + sin(elapsed * 10.0) * 4.0, Color(0.62, 1.0, 0.36, 0.22))
	canvas.draw_arc(core_pos, 24.0 + radius_bonus + sin(elapsed * 14.0) * 3.0, 0.0, TAU, 36, C.TOXIC_GREEN, 4.0)
	canvas.draw_circle(core_pos, 15.0 + radius_bonus + sin(elapsed * 14.0) * 2.0, Color(0.62, 1.0, 0.36, 0.90))
	canvas.draw_circle(core_pos, 6.0, C.VITAMIN_YELLOW)

func _draw_family_pressure(canvas: CanvasItem, elapsed: float) -> void:
	for i in range(5):
		var angle := elapsed * 1.2 + TAU * float(i) / 5.0
		var center := pos + Vector2(cos(angle), sin(angle)) * (BODY_RADIUS + 48.0)
		canvas.draw_rect(Rect2(center - Vector2(15, 10), Vector2(30, 20)), Color(1.0, 0.96, 0.72, 0.26))
		canvas.draw_rect(Rect2(center - Vector2(15, 10), Vector2(30, 20)), C.NEON_RED, false, 1.5)
		canvas.draw_line(center + Vector2(-10, 4), center + Vector2(10, -4), Color(1.0, 0.3, 0.36, 0.60), 1.0)
	canvas.draw_arc(pos, BODY_RADIUS + 48.0 + sin(elapsed * 8.0) * 4.0, 0.0, TAU, 64, Color(1.0, 0.3, 0.36, 0.28), 2.0)

func _draw_outcome_hook(canvas: CanvasItem, elapsed: float) -> void:
	if outcome_visual == "extract_memory":
		for i in range(4):
			var offset := Vector2(-42 + float(i) * 28.0, -75 - sin(elapsed * 3.0 + float(i)) * 6.0)
			canvas.draw_rect(Rect2(pos + offset, Vector2(20, 15)), Color(0.62, 1.0, 0.36, 0.18))
			canvas.draw_rect(Rect2(pos + offset, Vector2(20, 15)), C.TOXIC_GREEN, false, 1.5)
			canvas.draw_line(pos + offset + Vector2(4, 10), pos + offset + Vector2(16, 5), C.TOXIC_GREEN, 1.0)
		canvas.draw_arc(pos, BODY_RADIUS + 40.0, PI * 1.08, PI * 1.92, 34, Color(0.62, 1.0, 0.36, 0.42), 3.0)
	elif outcome_visual == "destroy_node":
		for i in range(5):
			var angle := -PI * 0.85 + float(i) * PI * 0.42
			var from := pos + Vector2(cos(angle), sin(angle)) * 28.0
			var to := pos + Vector2(cos(angle), sin(angle)) * (BODY_RADIUS + 34.0)
			canvas.draw_line(from, to, Color(1.0, 0.3, 0.36, 0.72), 3.0)
		canvas.draw_arc(pos, BODY_RADIUS + 30.0 + sin(elapsed * 8.0) * 2.0, 0.0, TAU, 40, Color(0.08, 0.06, 0.05, 0.44), 5.0)
	else:
		canvas.draw_arc(pos, BODY_RADIUS + 26.0, 0.0, TAU, 48, Color(1.0, 0.91, 0.25, 0.26), 3.0)

func _draw_rotated_rect(canvas: CanvasItem, center: Vector2, size: Vector2, angle: float, fill: Color, border: Color, border_width: float) -> void:
	var axis_x := Vector2(cos(angle), sin(angle)) * size.x * 0.5
	var axis_y := Vector2(-sin(angle), cos(angle)) * size.y * 0.5
	var points := PackedVector2Array([
		center - axis_x - axis_y,
		center + axis_x - axis_y,
		center + axis_x + axis_y,
		center - axis_x + axis_y,
	])
	canvas.draw_colored_polygon(points, fill)
	for i in range(points.size()):
		canvas.draw_line(points[i], points[(i + 1) % points.size()], border, border_width)

func _draw_shields(canvas: CanvasItem, elapsed: float) -> void:
	if shields.size() == 0:
		return
	for i in range(shields.size()):
		var angle := elapsed * 1.6 + TAU * float(i) / float(SHIELD_COUNT)
		var shield_pos := pos + Vector2(cos(angle), sin(angle)) * 78.0
		var ratio := clampf(float(shields[i]) / SHIELD_HP, 0.0, 1.0)
		_draw_rotated_rect(canvas, shield_pos, Vector2(30, 21), angle + PI * 0.08, Color("#fff7df"), C.COCOA, 2.0)
		canvas.draw_circle(shield_pos, 6.0, Color(1.0, 0.3, 0.36, 0.28))
		canvas.draw_arc(shield_pos, 8.0, 0.0, TAU, 18, C.NEON_RED, 1.6)
		canvas.draw_line(shield_pos + Vector2(-9, 3), shield_pos + Vector2(9, -3), C.NEON_RED, 1.5)
		canvas.draw_rect(Rect2(shield_pos + Vector2(-10, 12), Vector2(20.0 * ratio, 3)), C.TOXIC_GREEN)

func _defense_color() -> Color:
	match defense_type:
		DamageRouter.DEFENSE_TYPE_ANTI_AUTO:
			return Color("#8a5a3f")
		DamageRouter.DEFENSE_TYPE_ANTI_CHARGE:
			return Color(0.35, 0.70, 0.95)
		DamageRouter.DEFENSE_TYPE_EXPOSED_CORE:
			return C.TOXIC_GREEN
		_:
			return Color("#433227")
