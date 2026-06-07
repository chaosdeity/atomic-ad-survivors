extends RefCounted

const ROLE_KIOSK := "kiosk"
const ROLE_PROCEDURE_PANEL := "procedure_panel"
const ROLE_RENEWAL_GATE := "renewal_gate"
const ROLE_WAITING_RAIL := "waiting_rail"
const ROLE_ROOM_MEAL_ACCESS_PANEL := "room_meal_access_panel"
const ROLE_FLOOR_PAD := "floor_pad"
const ROLE_ROUTE_LANE := "route_lane"

const LAYER_FLOOR := "floor"
const LAYER_BACK := "back"
const LAYER_FRONT := "front"

const SUPPRESSED_PLACEHOLDERS := {
	"open_house_checkin_kiosk": ["open_house_street_anchor"],
	"guided_visit_floor_plan": ["open_house_street_anchor"],
	"consultation_kiosk_socket_placeholder": ["model_house_node_anchor"],
	"family_plan_terminal": ["model_house_node_anchor"],
	"floor_plan_line_placeholder": ["model_house_node_anchor"],
	"fake_recovery_marker": ["fake_return_route_anchor"],
	"recommended_route_decal_placeholder": ["fake_return_route_anchor"],
	"recommended_route_decal_placeholder_fake": ["fake_return_route_anchor"],
	"closed_return_lane_barrier": ["fake_return_route_anchor"],
}

const VISUAL_META := {
	ROLE_KIOSK: {
		"draw_size": Vector2(82, 86),
		"compact_size": Vector2(72, 72),
		"footprint_size": Vector2(58, 54),
	},
	ROLE_PROCEDURE_PANEL: {
		"draw_size": Vector2(84, 96),
		"wide_size": Vector2(112, 86),
		"footprint_size": Vector2(60, 42),
		"wide_footprint_size": Vector2(72, 48),
	},
	ROLE_RENEWAL_GATE: {
		"draw_size": Vector2(128, 120),
		"strong_size": Vector2(150, 132),
		"footprint_size": Vector2(96, 34),
	},
	ROLE_WAITING_RAIL: {
		"draw_size": Vector2(150, 34),
		"low_size": Vector2(150, 32),
		"footprint_size": Vector2(120, 22),
	},
	ROLE_ROOM_MEAL_ACCESS_PANEL: {
		"draw_size": Vector2(88, 96),
		"footprint_size": Vector2(56, 42),
	},
	ROLE_FLOOR_PAD: {
		"draw_size": Vector2(132, 82),
		"footprint_size": Vector2.ZERO,
	},
	ROLE_ROUTE_LANE: {
		"draw_size": Vector2(164, 46),
		"wide_size": Vector2(180, 54),
		"footprint_size": Vector2.ZERO,
	},
}

func station_scenes(r01) -> Array:
	var open_anchor: Vector2 = r01.anchor_position("open_house_street_anchor")
	var model_anchor: Vector2 = r01.anchor_position("model_house_node_anchor")
	var return_anchor: Vector2 = r01.anchor_position("fake_return_route_anchor")
	return [
		{
			"id": "active_target_checkin_station",
			"title": "checkin_station",
			"camera": open_anchor + Vector2(26, 34),
			"player": open_anchor + Vector2(22, 74),
			"objects": [
				_object(ROLE_ROUTE_LANE, open_anchor + Vector2(34, 84), "wide", LAYER_FLOOR),
				_object(ROLE_FLOOR_PAD, open_anchor + Vector2(16, 80), "", LAYER_FLOOR),
				_object(ROLE_PROCEDURE_PANEL, open_anchor + Vector2(-128, -16), "", LAYER_BACK),
				_object(ROLE_KIOSK, open_anchor + Vector2(-48, 2), "full", LAYER_BACK),
				_object(ROLE_ROOM_MEAL_ACCESS_PANEL, open_anchor + Vector2(224, -6), "", LAYER_BACK),
				_object(ROLE_WAITING_RAIL, open_anchor + Vector2(120, 74), "", LAYER_FRONT),
			],
		},
		{
			"id": "active_target_renewal_gate",
			"title": "renewal_gate",
			"camera": model_anchor + Vector2(-10, 56),
			"player": model_anchor + Vector2(-40, 118),
			"objects": [
				_object(ROLE_ROUTE_LANE, model_anchor + Vector2(-16, 118), "wide", LAYER_FLOOR),
				_object(ROLE_FLOOR_PAD, model_anchor + Vector2(-40, 108), "", LAYER_FLOOR),
				_object(ROLE_RENEWAL_GATE, model_anchor + Vector2(8, 38), "strong", LAYER_BACK),
				_object(ROLE_PROCEDURE_PANEL, model_anchor + Vector2(-168, 36), "wide", LAYER_BACK),
				_object(ROLE_ROOM_MEAL_ACCESS_PANEL, model_anchor + Vector2(192, 42), "", LAYER_BACK),
				_object(ROLE_WAITING_RAIL, model_anchor + Vector2(138, 126), "", LAYER_FRONT),
			],
		},
		{
			"id": "active_target_room_meal_lane",
			"title": "room_meal_lane",
			"camera": return_anchor + Vector2(-38, 34),
			"player": return_anchor + Vector2(-48, 102),
			"objects": [
				_object(ROLE_ROUTE_LANE, return_anchor + Vector2(-34, 112), "", LAYER_FLOOR),
				_object(ROLE_FLOOR_PAD, return_anchor + Vector2(-48, 100), "", LAYER_FLOOR),
				_object(ROLE_RENEWAL_GATE, return_anchor + Vector2(-188, 44), "", LAYER_BACK),
				_object(ROLE_PROCEDURE_PANEL, return_anchor + Vector2(-46, 36), "", LAYER_BACK),
				_object(ROLE_KIOSK, return_anchor + Vector2(114, 58), "compact", LAYER_BACK),
				_object(ROLE_ROOM_MEAL_ACCESS_PANEL, return_anchor + Vector2(214, 42), "", LAYER_BACK),
				_object(ROLE_WAITING_RAIL, return_anchor + Vector2(66, 112), "low", LAYER_FRONT),
			],
		},
	]

func suppressed_placeholder_ids() -> PackedStringArray:
	var ids := PackedStringArray()
	for id in SUPPRESSED_PLACEHOLDERS.keys():
		ids.append(String(id))
	return ids

func suppresses_placeholder(object: Dictionary) -> bool:
	var object_id := String(object.get("id", ""))
	if not SUPPRESSED_PLACEHOLDERS.has(object_id):
		return false
	var zones: Array = SUPPRESSED_PLACEHOLDERS[object_id]
	if zones.is_empty():
		return true
	var zone_id := String(object.get("zone_id", ""))
	return zone_id in zones

func draw_floor_layer(canvas: CanvasItem, scene: Dictionary) -> void:
	for object in _objects_for_layer(scene, LAYER_FLOOR):
		_draw_object(canvas, object)

func draw_back_layer(canvas: CanvasItem, scene: Dictionary, player_y: float) -> void:
	for object in _sorted_objects(scene, LAYER_BACK):
		if Vector2(object.get("pos", Vector2.ZERO)).y <= player_y:
			_draw_object(canvas, object)

func draw_front_layer(canvas: CanvasItem, scene: Dictionary, player_y: float) -> void:
	for object in _sorted_objects(scene, LAYER_BACK):
		if Vector2(object.get("pos", Vector2.ZERO)).y > player_y:
			_draw_object(canvas, object)
	for object in _sorted_objects(scene, LAYER_FRONT):
		_draw_object(canvas, object)

func object_measurements(scene: Dictionary) -> Array:
	var rows := []
	for object in scene.get("objects", []):
		var role := String(object.get("role", ""))
		var size := Vector2(object.get("draw_size", Vector2.ZERO))
		var footprint := Vector2(object.get("footprint_size", Vector2.ZERO))
		rows.append({
			"scene": String(scene.get("id", "")),
			"role": role,
			"draw_w": snappedf(size.x, 0.01),
			"draw_h": snappedf(size.y, 0.01),
			"footprint_w": snappedf(footprint.x, 0.01),
			"footprint_h": snappedf(footprint.y, 0.01),
			"layer": String(object.get("layer", "")),
			"variant": String(object.get("variant", "")),
		})
	return rows

func _object(role: String, pos: Vector2, variant: String, layer: String) -> Dictionary:
	var meta: Dictionary = VISUAL_META[role]
	var draw_size := Vector2(meta.get("draw_size", Vector2.ZERO))
	var footprint_size := Vector2(meta.get("footprint_size", Vector2.ZERO))
	if variant == "compact" and meta.has("compact_size"):
		draw_size = Vector2(meta["compact_size"])
	elif variant == "wide" and meta.has("wide_size"):
		draw_size = Vector2(meta["wide_size"])
		if meta.has("wide_footprint_size"):
			footprint_size = Vector2(meta["wide_footprint_size"])
	elif variant == "strong" and meta.has("strong_size"):
		draw_size = Vector2(meta["strong_size"])
	elif variant == "low" and meta.has("low_size"):
		draw_size = Vector2(meta["low_size"])
	return {
		"role": role,
		"pos": pos,
		"draw_size": draw_size,
		"footprint_size": footprint_size,
		"variant": variant,
		"layer": layer,
	}

func _objects_for_layer(scene: Dictionary, layer: String) -> Array:
	var result := []
	for object in scene.get("objects", []):
		if String(object.get("layer", "")) == layer:
			result.append(object)
	return result

func _sorted_objects(scene: Dictionary, layer: String) -> Array:
	var objects := _objects_for_layer(scene, layer)
	objects.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return Vector2(a.get("pos", Vector2.ZERO)).y < Vector2(b.get("pos", Vector2.ZERO)).y
	)
	return objects

func _draw_object(canvas: CanvasItem, object: Dictionary) -> void:
	var role := String(object.get("role", ""))
	var pos := Vector2(object.get("pos", Vector2.ZERO))
	var size := Vector2(object.get("draw_size", Vector2.ZERO))
	match role:
		ROLE_ROUTE_LANE:
			_draw_route_lane(canvas, pos, size)
		ROLE_FLOOR_PAD:
			_draw_floor_pad(canvas, pos, size)
		ROLE_KIOSK:
			_draw_kiosk(canvas, pos, size)
		ROLE_PROCEDURE_PANEL:
			_draw_procedure_panel(canvas, pos, size)
		ROLE_RENEWAL_GATE:
			_draw_renewal_gate(canvas, pos, size)
		ROLE_WAITING_RAIL:
			_draw_waiting_rail(canvas, pos, size)
		ROLE_ROOM_MEAL_ACCESS_PANEL:
			_draw_room_meal_access_panel(canvas, pos, size)

func _bottom_rect(pos: Vector2, size: Vector2) -> Rect2:
	return Rect2(pos - Vector2(size.x * 0.5, size.y), size)

func _draw_route_lane(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	canvas.draw_rect(rect, Color(0.26, 0.36, 0.34, 0.74))
	canvas.draw_rect(rect, Color(0.11, 0.18, 0.18, 0.78), false, 2.0)
	var center_y := rect.position.y + rect.size.y * 0.52
	for i in range(4):
		var x := rect.position.x + 18.0 + float(i) * maxf(28.0, rect.size.x * 0.21)
		var pts := PackedVector2Array([
			Vector2(x, center_y),
			Vector2(x + 16.0, center_y - 12.0),
			Vector2(x + 16.0, center_y + 12.0),
		])
		canvas.draw_colored_polygon(pts, Color(0.80, 0.86, 0.78, 0.72))

func _draw_floor_pad(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	canvas.draw_rect(rect, Color(0.64, 0.58, 0.38, 0.52))
	canvas.draw_rect(rect.grow(-8.0), Color(0.95, 0.85, 0.49, 0.22), false, 2.0)
	canvas.draw_line(rect.position + Vector2(12, rect.size.y * 0.5), rect.position + Vector2(rect.size.x - 12, rect.size.y * 0.5), Color(0.30, 0.28, 0.22, 0.25), 1.0)
	canvas.draw_rect(rect, Color(0.32, 0.29, 0.20, 0.55), false, 2.0)

func _draw_kiosk(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	canvas.draw_rect(rect, Color(0.18, 0.25, 0.28, 0.94))
	canvas.draw_rect(rect, Color(0.05, 0.08, 0.09, 0.86), false, 2.0)
	var screen := Rect2(rect.position + Vector2(size.x * 0.16, size.y * 0.13), Vector2(size.x * 0.68, size.y * 0.33))
	canvas.draw_rect(screen, Color(0.12, 0.37, 0.40, 0.92))
	canvas.draw_rect(screen, Color(0.58, 0.92, 0.86, 0.74), false, 2.0)
	var slot := Rect2(rect.position + Vector2(size.x * 0.24, size.y * 0.58), Vector2(size.x * 0.52, size.y * 0.13))
	canvas.draw_rect(slot, Color(0.08, 0.10, 0.10, 0.86))
	canvas.draw_rect(Rect2(rect.position + Vector2(size.x * 0.35, size.y * 0.80), Vector2(size.x * 0.30, size.y * 0.13)), Color(0.35, 0.38, 0.34, 0.92))

func _draw_procedure_panel(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	canvas.draw_rect(rect, Color(0.26, 0.22, 0.30, 0.94))
	canvas.draw_rect(rect, Color(0.10, 0.08, 0.13, 0.86), false, 2.0)
	var screen := Rect2(rect.position + Vector2(size.x * 0.13, size.y * 0.13), Vector2(size.x * 0.74, size.y * 0.44))
	canvas.draw_rect(screen, Color(0.08, 0.31, 0.32, 0.92))
	canvas.draw_rect(screen, Color(0.58, 0.88, 0.76, 0.74), false, 2.0)
	for i in range(3):
		var y := rect.position.y + size.y * (0.66 + float(i) * 0.07)
		canvas.draw_line(Vector2(rect.position.x + size.x * 0.16, y), Vector2(rect.position.x + size.x * 0.84, y), Color(0.86, 0.70, 0.35, 0.72), 2.0)

func _draw_renewal_gate(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	var post_w := maxf(12.0, size.x * 0.16)
	canvas.draw_rect(Rect2(rect.position + Vector2(0, size.y * 0.16), Vector2(post_w, size.y * 0.84)), Color(0.29, 0.23, 0.22, 0.94))
	canvas.draw_rect(Rect2(rect.position + Vector2(size.x - post_w, size.y * 0.16), Vector2(post_w, size.y * 0.84)), Color(0.29, 0.23, 0.22, 0.94))
	var lintel := Rect2(rect.position + Vector2(0, 0), Vector2(size.x, size.y * 0.22))
	canvas.draw_rect(lintel, Color(0.27, 0.33, 0.32, 0.96))
	canvas.draw_rect(lintel, Color(0.08, 0.11, 0.11, 0.86), false, 2.0)
	var opening := Rect2(rect.position + Vector2(post_w + 10.0, size.y * 0.37), Vector2(size.x - post_w * 2.0 - 20.0, size.y * 0.61))
	canvas.draw_rect(opening, Color(0.70, 0.80, 0.70, 0.12), false, 2.0)
	canvas.draw_circle(rect.position + Vector2(size.x - post_w - 12.0, size.y * 0.11), 5.5, Color(0.95, 0.22, 0.24, 0.88))

func _draw_waiting_rail(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	for x in [rect.position.x + 10.0, rect.position.x + size.x * 0.32, rect.position.x + size.x * 0.68, rect.position.x + size.x - 10.0]:
		canvas.draw_rect(Rect2(Vector2(x - 3.0, rect.position.y + 5.0), Vector2(6.0, size.y - 3.0)), Color(0.29, 0.27, 0.23, 0.92))
	var bar := Rect2(rect.position + Vector2(0, size.y * 0.30), Vector2(size.x, maxf(9.0, size.y * 0.32)))
	canvas.draw_rect(bar, Color(0.58, 0.49, 0.28, 0.94))
	canvas.draw_rect(bar, Color(0.23, 0.19, 0.13, 0.76), false, 2.0)

func _draw_room_meal_access_panel(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	var rect := _bottom_rect(pos, size)
	canvas.draw_rect(rect, Color(0.20, 0.30, 0.24, 0.94))
	canvas.draw_rect(rect, Color(0.07, 0.12, 0.09, 0.86), false, 2.0)
	var screen := Rect2(rect.position + Vector2(size.x * 0.16, size.y * 0.14), Vector2(size.x * 0.68, size.y * 0.36))
	canvas.draw_rect(screen, Color(0.10, 0.34, 0.22, 0.92))
	canvas.draw_rect(screen, Color(0.64, 0.92, 0.62, 0.74), false, 2.0)
	canvas.draw_circle(rect.position + Vector2(size.x * 0.24, size.y * 0.72), 8.0, Color(0.95, 0.78, 0.28, 0.92))
	canvas.draw_rect(Rect2(rect.position + Vector2(size.x * 0.46, size.y * 0.62), Vector2(size.x * 0.34, size.y * 0.17)), Color(0.38, 0.46, 0.38, 0.94))
