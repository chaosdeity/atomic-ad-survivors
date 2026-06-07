extends "res://scripts/r01_procedure_station_visuals.gd"

const TEXTURE_PATHS := {
	"floor_pad": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png",
	"route_lane": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png",
	"waiting_rail": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png",
	"renewal_gate": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png",
	"kiosk": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png",
	"procedure_panel": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png",
	"room_meal_access_panel": "res://assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png",
}

var _textures := {}

func _init() -> void:
	for role in TEXTURE_PATHS.keys():
		_textures[role] = load(String(TEXTURE_PATHS[role]))

func uses_production_textures() -> bool:
	return true

func _draw_route_lane(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "route_lane", pos, size):
		super._draw_route_lane(canvas, pos, size)

func _draw_floor_pad(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "floor_pad", pos, size):
		super._draw_floor_pad(canvas, pos, size)

func _draw_kiosk(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "kiosk", pos, size):
		super._draw_kiosk(canvas, pos, size)

func _draw_procedure_panel(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "procedure_panel", pos, size):
		super._draw_procedure_panel(canvas, pos, size)

func _draw_renewal_gate(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "renewal_gate", pos, size):
		super._draw_renewal_gate(canvas, pos, size)

func _draw_waiting_rail(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "waiting_rail", pos, size):
		super._draw_waiting_rail(canvas, pos, size)

func _draw_room_meal_access_panel(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	if not _draw_fixture_texture(canvas, "room_meal_access_panel", pos, size):
		super._draw_room_meal_access_panel(canvas, pos, size)

func _draw_fixture_texture(canvas: CanvasItem, role: String, pos: Vector2, size: Vector2) -> bool:
	var texture: Texture2D = _textures.get(role)
	if texture == null:
		return false
	canvas.draw_texture_rect(texture, _bottom_rect(pos, size), false)
	return true
