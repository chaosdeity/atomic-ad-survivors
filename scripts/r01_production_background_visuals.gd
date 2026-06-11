extends RefCounted

const TEXTURE_PATHS := {
	"checkin_ground": "res://assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png",
	"checkin_queue": "res://assets/art_inbox/r01_map_background_v01/r01_bg_checkin_queue_wear_marks.png",
	"room_meal_floor": "res://assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png",
	"room_meal_marks": "res://assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_support_marks.png",
	"renewal_passage": "res://assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png",
	"renewal_shadow": "res://assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_shadow_wear.png",
	"contact_shadow": "res://assets/art_inbox/r01_map_background_v01/r01_bg_station_contact_shadow_set.png",
}

const BACKGROUND_META := {
	"active_target_checkin_station": [
		{"texture": "contact_shadow", "anchor": "floor_pad", "offset": Vector2(30, -42), "size": Vector2(480, 270), "alpha": 0.54},
		{"texture": "checkin_ground", "anchor": "floor_pad", "offset": Vector2(30, -42), "size": Vector2(420, 240), "alpha": 0.88},
		{"texture": "checkin_queue", "anchor": "floor_pad", "offset": Vector2(22, -22), "size": Vector2(420, 180), "alpha": 0.72},
	],
	"active_target_renewal_gate": [
		{"texture": "contact_shadow", "anchor": "floor_pad", "offset": Vector2(72, -52), "size": Vector2(480, 270), "alpha": 0.52},
		{"texture": "renewal_passage", "anchor": "floor_pad", "offset": Vector2(70, -55), "size": Vector2(460, 260), "alpha": 0.86},
		{"texture": "renewal_shadow", "anchor": "floor_pad", "offset": Vector2(72, -40), "size": Vector2(440, 200), "alpha": 0.68},
	],
	"active_target_room_meal_lane": [
		{"texture": "contact_shadow", "anchor": "floor_pad", "offset": Vector2(92, -42), "size": Vector2(480, 270), "alpha": 0.50},
		{"texture": "room_meal_floor", "anchor": "floor_pad", "offset": Vector2(92, -38), "size": Vector2(420, 240), "alpha": 0.86},
		{"texture": "room_meal_marks", "anchor": "floor_pad", "offset": Vector2(106, -30), "size": Vector2(400, 180), "alpha": 0.70},
	],
}

var _textures := {}

func _init() -> void:
	for role in TEXTURE_PATHS.keys():
		_textures[role] = load(String(TEXTURE_PATHS[role]))

func uses_production_background_textures() -> bool:
	return true

func draw_background_layer(canvas: CanvasItem, scene: Dictionary) -> void:
	var scene_id := String(scene.get("id", ""))
	if not BACKGROUND_META.has(scene_id):
		return
	for entry in BACKGROUND_META[scene_id]:
		var texture_key := String(entry.get("texture", ""))
		var anchor_role := String(entry.get("anchor", ""))
		var anchor := _scene_role_position(scene, anchor_role)
		if anchor == Vector2.INF:
			continue
		var center := anchor + Vector2(entry.get("offset", Vector2.ZERO))
		var size := Vector2(entry.get("size", Vector2.ZERO))
		var alpha := float(entry.get("alpha", 1.0))
		_draw_centered_texture(canvas, texture_key, center, size, alpha)

func texture_paths() -> Dictionary:
	return TEXTURE_PATHS.duplicate()

func _scene_role_position(scene: Dictionary, role: String) -> Vector2:
	for object in scene.get("objects", []):
		if String(object.get("role", "")) == role:
			return Vector2(object.get("pos", Vector2.ZERO))
	return Vector2.INF

func _draw_centered_texture(canvas: CanvasItem, texture_key: String, center: Vector2, size: Vector2, alpha: float) -> void:
	var texture: Texture2D = _textures.get(texture_key)
	if texture == null or size == Vector2.ZERO:
		return
	var rect := Rect2(center - size * 0.5, size)
	canvas.draw_texture_rect(texture, rect, false, Color(1, 1, 1, alpha))
