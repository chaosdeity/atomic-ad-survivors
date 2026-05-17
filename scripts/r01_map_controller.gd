extends RefCounted

const C := preload("res://scripts/game_config.gd")
const UIFont := preload("res://scripts/ui_font.gd")
const R01ZoneLayout := preload("res://scripts/r01_zone_layout.gd")

const NOTICE_DURATION := 3.6

var _zone_id := R01ZoneLayout.ZONE_SILENT_EDGE
var _notice_text := ""
var _notice_timer := 0.0

func reset(elapsed: float = 0.0, show_entry_notice: bool = true) -> void:
	_zone_id = R01ZoneLayout.zone_id_for_elapsed(elapsed)
	_notice_text = ""
	_notice_timer = 0.0
	if show_entry_notice:
		_show_entry_notice()

func update(delta: float, elapsed: float, allow_entry_notice: bool = true) -> bool:
	_notice_timer = maxf(0.0, _notice_timer - delta)
	var next_zone := R01ZoneLayout.zone_id_for_elapsed(elapsed)
	if next_zone == _zone_id:
		return false
	_zone_id = next_zone
	if allow_entry_notice:
		_show_entry_notice()
	return true

func force_elapsed(elapsed: float, show_entry_notice: bool = true) -> void:
	_zone_id = R01ZoneLayout.zone_id_for_elapsed(elapsed)
	if show_entry_notice:
		_show_entry_notice()

func current_zone_id() -> String:
	return _zone_id

func current_zone_name() -> String:
	return R01ZoneLayout.zone_name(_zone_id)

func current_debug_label() -> String:
	return R01ZoneLayout.debug_label(_zone_id)

func active_notice_text() -> String:
	return _notice_text if _notice_timer > 0.0 else ""

func active_notice_timer() -> float:
	return _notice_timer

func draw(canvas: CanvasItem, elapsed: float, player_pos: Vector2, boss_route_ready: bool, boss_active: bool) -> void:
	match _zone_id:
		R01ZoneLayout.ZONE_HOUSING_LOOP:
			_draw_housing_loop(canvas, elapsed, player_pos)
		R01ZoneLayout.ZONE_MODEL_HOUSE_NEXUS:
			_draw_model_house_nexus(canvas, elapsed, player_pos, boss_route_ready or boss_active)
		_:
			_draw_silent_edge(canvas, elapsed, player_pos)

func _show_entry_notice() -> void:
	_notice_text = R01ZoneLayout.entry_phrase(_zone_id)
	_notice_timer = NOTICE_DURATION

func _draw_base(canvas: CanvasItem, base_color: Color, grid_a: Color, grid_b: Color, tile: int) -> void:
	canvas.draw_rect(Rect2(-C.ARENA_HALF, C.ARENA_HALF * 2.0), base_color)
	for x in range(int(-C.ARENA_HALF.x), int(C.ARENA_HALF.x) + tile, tile):
		var color := grid_a if int(x / tile) % 2 == 0 else grid_b
		canvas.draw_line(Vector2(x, -C.ARENA_HALF.y), Vector2(x, C.ARENA_HALF.y), color, 1.0)
	for y in range(int(-C.ARENA_HALF.y), int(C.ARENA_HALF.y) + tile, tile):
		var color := grid_b if int(y / tile) % 2 == 0 else grid_a
		canvas.draw_line(Vector2(-C.ARENA_HALF.x, y), Vector2(C.ARENA_HALF.x, y), color, 1.0)

func _draw_silent_edge(canvas: CanvasItem, elapsed: float, player_pos: Vector2) -> void:
	_draw_base(canvas, Color("#f4ead6"), Color("#d5dfd5"), Color("#ead7ba"), 38)
	for i in range(12):
		var x := -720.0 + float(i) * 132.0
		var y := -330.0 + float((i * 43) % 640)
		var alpha := 0.22 + 0.06 * sin(elapsed * 1.5 + float(i))
		canvas.draw_line(Vector2(x, y), Vector2(x + 76.0, y + 6.0), Color(0.46, 0.36, 0.27, alpha), 2.0)
		canvas.draw_line(Vector2(x + 8.0, y - 12.0), Vector2(x + 8.0, y + 16.0), Color(0.46, 0.36, 0.27, alpha), 1.5)
	for i in range(10):
		var p := Vector2(-680.0 + float((i * 151) % 1340), -380.0 + float((i * 97) % 720))
		canvas.draw_rect(Rect2(p, Vector2(44, 17)), Color(0.98, 0.87, 0.48, 0.18))
		canvas.draw_line(p + Vector2(6, 14), p + Vector2(34, 4), Color(0.47, 0.29, 0.22, 0.24), 1.0)

func _draw_housing_loop(canvas: CanvasItem, elapsed: float, player_pos: Vector2) -> void:
	_draw_base(canvas, Color("#f1dfc0"), Color("#eeb8ae"), Color("#bfd7cd"), 32)
	for row in range(4):
		for col in range(7):
			var p := Vector2(-680.0 + float(col) * 220.0, -330.0 + float(row) * 205.0)
			var smear := sin(elapsed * 0.9 + float(row * 3 + col)) * 2.0
			_draw_house(canvas, p + Vector2(smear, 0.0), col + row)
	for i in range(8):
		var p := Vector2(-650.0 + float(i) * 186.0, -260.0 + float((i * 73) % 520))
		canvas.draw_rect(Rect2(p, Vector2(86, 19)), Color(1.0, 0.91, 0.25, 0.42))
		canvas.draw_rect(Rect2(p, Vector2(86, 19)), Color(0.48, 0.29, 0.23, 0.46), false, 1.0)
		canvas.draw_string(UIFont.get_font(), p + Vector2(43, 13), "단골 고객", HORIZONTAL_ALIGNMENT_CENTER, 82, 8, Color(0.25, 0.18, 0.15, 0.58))

func _draw_model_house_nexus(canvas: CanvasItem, elapsed: float, player_pos: Vector2, boss_route_ready: bool) -> void:
	_draw_base(canvas, Color("#ead7c2"), Color("#ffcfc4"), Color("#f5e88e"), 28)
	var center := Vector2.ZERO
	var pulse := 1.0 + 0.06 * sin(elapsed * 3.1)
	var ring_color := Color(1.0, 0.30, 0.36, 0.26 if boss_route_ready else 0.16)
	canvas.draw_circle(center, 132.0 * pulse, Color(1.0, 0.91, 0.25, 0.08 if boss_route_ready else 0.04))
	canvas.draw_arc(center, 132.0 * pulse, 0.0, TAU, 72, ring_color, 3.0)
	canvas.draw_arc(center, 184.0 + 12.0 * sin(elapsed * 1.7), -PI * 0.2, PI * 1.25, 72, Color(0.98, 0.87, 0.48, 0.30), 2.0)
	_draw_model_house_sign(canvas, center + Vector2(-78, -42), boss_route_ready)
	for i in range(14):
		var angle := float(i) / 14.0 * TAU + elapsed * 0.04
		var p := center + Vector2(cos(angle), sin(angle)) * (210.0 + float(i % 3) * 28.0)
		canvas.draw_circle(p, 6.0 + float(i % 2) * 2.0, Color(1.0, 0.93, 0.62, 0.48))
		canvas.draw_circle(p, 13.0, Color(1.0, 0.91, 0.25, 0.10))
	for i in range(9):
		var p := Vector2(-680.0 + float((i * 179) % 1320), -350.0 + float((i * 131) % 700))
		canvas.draw_rect(Rect2(p, Vector2(54, 68)), Color(0.60, 0.36, 0.28, 0.16))
		canvas.draw_circle(p + Vector2(27, 18), 10.0, Color(1.0, 0.91, 0.25, 0.26))

func _draw_house(canvas: CanvasItem, p: Vector2, variant: int) -> void:
	var body := Rect2(p, Vector2(72, 48))
	canvas.draw_rect(body, Color(0.70, 0.45, 0.34, 0.18))
	canvas.draw_colored_polygon(PackedVector2Array([
		p + Vector2(-6, 2),
		p + Vector2(36, -24),
		p + Vector2(78, 2),
	]), Color(0.48, 0.29, 0.23, 0.28))
	canvas.draw_rect(Rect2(p + Vector2(9, 16), Vector2(18, 18)), Color(1.0, 0.91, 0.25, 0.18))
	canvas.draw_rect(Rect2(p + Vector2(46, 15), Vector2(15, 33)), Color(0.38, 0.24, 0.19, 0.24))
	var plate := Rect2(p + Vector2(7, 38), Vector2(31, 9))
	canvas.draw_rect(plate, Color(0.98, 0.91, 0.76, 0.42))
	canvas.draw_string(UIFont.get_font(), plate.position + Vector2(15, 8), "문패", HORIZONTAL_ALIGNMENT_CENTER, 30, 7, Color(0.29, 0.20, 0.17, 0.50 + 0.04 * float(variant % 3)))

func _draw_model_house_sign(canvas: CanvasItem, p: Vector2, boss_route_ready: bool) -> void:
	canvas.draw_rect(Rect2(p, Vector2(156, 76)), Color(1.0, 0.94, 0.81, 0.74))
	canvas.draw_rect(Rect2(p, Vector2(156, 76)), Color(0.48, 0.29, 0.23, 0.78), false, 2.0)
	canvas.draw_rect(Rect2(p + Vector2(14, 48), Vector2(128, 12)), Color(1.0, 0.91, 0.25, 0.22 if boss_route_ready else 0.14))
	canvas.draw_string(UIFont.get_font(), p + Vector2(78, 28), "SMILE HOME", HORIZONTAL_ALIGNMENT_CENTER, 150, 12, Color(0.30, 0.20, 0.18, 0.82))
	canvas.draw_string(UIFont.get_font(), p + Vector2(78, 45), "모델하우스", HORIZONTAL_ALIGNMENT_CENTER, 150, 10, Color(0.30, 0.20, 0.18, 0.78))
