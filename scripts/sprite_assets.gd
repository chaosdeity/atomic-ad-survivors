extends RefCounted

const C := preload("res://scripts/game_config.gd")

const PLAYER_PATH := "res://assets/characters/player/player_survivor_48x48_4dir_walk.png"
const YUNSEO_POSE_SCALE := 0.11
const YUNSEO_POSE_ORIGIN := Vector2(320, 560)
const YUNSEO_POSE_CANVAS := Vector2(796, 658)
const YUNSEO_POSE_PATHS := {
	"idle": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_01_idle.png",
	"scan_low": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_02_scan_low.png",
	"cable_hook": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_03_cable_hook.png",
	"pull_retrieval": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_04_pull_retrieval.png",
	"stamp_ready": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_05_stamp_ready.png",
	"reject_stamp": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_06_reject_stamp.png",
	"hurt_interrupted": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_07_hurt_interrupted.png",
	"retrieval_escape": "res://assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_08_retrieval_escape.png",
}
const YUNSEO_LAYERED_WALK_PATHS := {
	"down": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_down_layered_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_down_layered_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_down_layered_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_down_layered_v01_04.png",
	],
	"left": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_left_layered_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_left_layered_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_left_layered_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_left_layered_v01_04.png",
	],
	"right": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_right_layered_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_right_layered_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_right_layered_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_right_layered_v01_04.png",
	],
	"up": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_up_layered_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_up_layered_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_up_layered_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_layered_v01/yunseo_v06_walk_up_layered_v01_04.png",
	],
}
const YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS := {
	"down": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_down_failed_edit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_down_failed_edit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_down_failed_edit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_down_failed_edit_v01_04.png",
	],
	"left": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_left_failed_edit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_left_failed_edit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_left_failed_edit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_left_failed_edit_v01_04.png",
	],
	"right": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_right_failed_edit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_right_failed_edit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_right_failed_edit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_right_failed_edit_v01_04.png",
	],
	"up": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_up_failed_edit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_up_failed_edit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_up_failed_edit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/yunseo_v06_walk_up_failed_edit_v01_04.png",
	],
}
const YUNSEO_S2_R2_WALK_PATHS := {
	"down": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_down_s2_r2_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_down_s2_r2_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_down_s2_r2_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_down_s2_r2_v01_04.png",
	],
	"left": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_left_s2_r2_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_left_s2_r2_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_left_s2_r2_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_left_s2_r2_v01_04.png",
	],
	"right": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_right_s2_r2_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_right_s2_r2_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_right_s2_r2_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_right_s2_r2_v01_04.png",
	],
	"up": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_up_s2_r2_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_up_s2_r2_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_up_s2_r2_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_up_s2_r2_v01_04.png",
	],
}
const YUNSEO_WALK_PATHS := {
	"down": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_04.png",
	],
	"left": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_04.png",
	],
	"right": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_04.png",
	],
	"up": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_04.png",
	],
}
const YUNSEO_LEGACY_WALK_PATHS := {
	"down": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_04.png",
	],
	"left": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_04.png",
	],
	"right": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_04.png",
	],
	"up": [
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_01.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_02.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_03.png",
		"res://assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_04.png",
	],
}
const TIER1_PATHS := {
	"billboard": "res://assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png",
	"appliance": "res://assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png",
	"coupon": "res://assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png",
}
const ELITE_PATH := "res://assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png"
const LARGE_ELITE_PATH := "res://assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png"

var player_texture: Texture2D
var yunseo_pose_textures := {}
var yunseo_failed_frame_walk_textures := {}
var yunseo_walk_textures := {}
var enemy_textures := {}
var elite_texture: Texture2D
var large_elite_texture: Texture2D

func load_all() -> void:
	player_texture = _load_texture(PLAYER_PATH)
	for pose_id in YUNSEO_POSE_PATHS:
		yunseo_pose_textures[pose_id] = _load_texture(String(YUNSEO_POSE_PATHS[pose_id]))
	yunseo_failed_frame_walk_textures = _load_yunseo_walk_set(YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS)
	yunseo_walk_textures = _load_yunseo_walk_set(YUNSEO_LAYERED_WALK_PATHS)
	if yunseo_walk_textures.is_empty():
		yunseo_walk_textures = _load_yunseo_walk_set(YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS)
	if yunseo_walk_textures.is_empty():
		yunseo_walk_textures = _load_yunseo_walk_set(YUNSEO_S2_R2_WALK_PATHS)
	if yunseo_walk_textures.is_empty():
		yunseo_walk_textures = _load_yunseo_walk_set(YUNSEO_WALK_PATHS)
	if yunseo_walk_textures.is_empty():
		yunseo_walk_textures = _load_yunseo_walk_set(YUNSEO_LEGACY_WALK_PATHS)
	for kind in TIER1_PATHS:
		enemy_textures[kind] = _load_texture(TIER1_PATHS[kind])
	elite_texture = _load_texture(ELITE_PATH)
	large_elite_texture = _load_texture(LARGE_ELITE_PATH)

func draw_player(canvas: CanvasItem, pos: Vector2, row: int, frame: int) -> bool:
	if player_texture == null:
		return false
	var cell := Vector2(48, 48)
	var pivot := Vector2(24, 43)
	var columns := maxi(1, int(player_texture.get_width() / int(cell.x)))
	var src := Rect2(Vector2((frame % columns) * cell.x, row * cell.y), cell)
	canvas.draw_texture_rect_region(player_texture, Rect2((pos - pivot).round(), cell), src)
	return true

func draw_yunseo_pose(canvas: CanvasItem, pos: Vector2, pose_id: String) -> bool:
	var texture: Texture2D = yunseo_pose_textures.get(pose_id)
	if texture == null:
		return false
	var draw_size := YUNSEO_POSE_CANVAS * YUNSEO_POSE_SCALE
	var top_left := pos - YUNSEO_POSE_ORIGIN * YUNSEO_POSE_SCALE
	canvas.draw_texture_rect(texture, Rect2(top_left.round(), draw_size), false)
	return true

func draw_yunseo_walk(canvas: CanvasItem, pos: Vector2, direction: String, frame: int) -> bool:
	var frames: Array = yunseo_walk_textures.get(direction, [])
	return _draw_yunseo_walk_frames(canvas, pos, direction, frame, frames)

func draw_yunseo_failed_frame_walk(canvas: CanvasItem, pos: Vector2, direction: String, frame: int) -> bool:
	var frames: Array = yunseo_failed_frame_walk_textures.get(direction, [])
	if not _draw_yunseo_walk_frames(canvas, pos, direction, frame, frames):
		return draw_yunseo_walk(canvas, pos, direction, frame)
	return true

func _draw_yunseo_walk_frames(canvas: CanvasItem, pos: Vector2, direction: String, frame: int, frames: Array) -> bool:
	if frames.is_empty():
		return false
	var texture: Texture2D = frames[posmod(frame, frames.size())]
	if texture == null:
		return false
	var side_scale := 0.985 if direction == "left" or direction == "right" else 1.0
	var draw_size := Vector2(YUNSEO_POSE_CANVAS.x * YUNSEO_POSE_SCALE * side_scale, YUNSEO_POSE_CANVAS.y * YUNSEO_POSE_SCALE)
	var scaled_origin := Vector2(YUNSEO_POSE_ORIGIN.x * YUNSEO_POSE_SCALE * side_scale, YUNSEO_POSE_ORIGIN.y * YUNSEO_POSE_SCALE)
	var top_left := pos - scaled_origin
	canvas.draw_texture_rect(texture, Rect2(top_left.round(), draw_size), false)
	return true

func draw_yunseo_walk_socket_debug(canvas: CanvasItem, pos: Vector2, direction: String, frame: int, socket_frame: Dictionary) -> bool:
	if not draw_yunseo_walk(canvas, pos, direction, frame):
		return false
	_draw_socket_debug_overlay(canvas, pos, direction, socket_frame)
	return true

func _draw_socket_debug_overlay(canvas: CanvasItem, pos: Vector2, direction: String, socket_frame: Dictionary) -> void:
	var side_scale := 0.985 if direction == "left" or direction == "right" else 1.0
	var scale := Vector2(YUNSEO_POSE_SCALE * side_scale, YUNSEO_POSE_SCALE)
	var origin := Vector2(YUNSEO_POSE_ORIGIN.x * scale.x, YUNSEO_POSE_ORIGIN.y * scale.y)
	var top_left := pos - origin
	var feet := _socket_point(socket_frame.get("feet_pivot", {}), top_left, scale)
	var body := _socket_point(socket_frame.get("body_anchor", {}), top_left, scale)
	var head := _socket_point(socket_frame.get("head_anchor", {}), top_left, scale)
	canvas.draw_line(feet, body, Color(1.0, 0.18, 0.24, 0.60), 1.0)
	canvas.draw_line(body, head, Color(0.08, 0.55, 1.0, 0.55), 1.0)
	canvas.draw_circle(feet, 2.4, Color(1.0, 0.18, 0.24, 0.80))
	canvas.draw_circle(body, 2.4, Color(0.08, 0.55, 1.0, 0.80))
	canvas.draw_circle(head, 2.4, Color(0.2, 0.9, 0.55, 0.80))
	_draw_socket_foot(canvas, socket_frame.get("leg_contact_l", {}), top_left, scale, Color(0.95, 0.0, 0.72, 0.88))
	_draw_socket_foot(canvas, socket_frame.get("leg_contact_r", {}), top_left, scale, Color(1.0, 0.45, 0.75, 0.88))

func _draw_socket_foot(canvas: CanvasItem, contact: Dictionary, top_left: Vector2, scale: Vector2, color: Color) -> void:
	var foot := _socket_point(contact.get("foot_anchor", {}), top_left, scale)
	var radius := 3.2 if bool(contact.get("contact", false)) else 2.0
	canvas.draw_circle(foot, radius, color)
	if bool(contact.get("contact", false)):
		canvas.draw_arc(foot, radius + 2.0, 0.0, TAU, 18, color, 1.2)

func _socket_point(data: Dictionary, top_left: Vector2, scale: Vector2) -> Vector2:
	return top_left + Vector2(float(data.get("x", 0.0)) * scale.x, float(data.get("y", 0.0)) * scale.y)

func draw_enemy(canvas: CanvasItem, enemy: Dictionary, frame: int) -> bool:
	var pos: Vector2 = enemy["pos"]
	var kind := str(enemy.get("sprite_kind", "billboard"))
	var texture: Texture2D
	var cell := Vector2(32, 32)
	var pivot := Vector2(16, 28)
	if kind == "housewife":
		texture = elite_texture
		cell = Vector2(40, 40)
		pivot = Vector2(20, 37)
	elif kind == "large_elite":
		texture = large_elite_texture
		cell = Vector2(80, 80)
		pivot = Vector2(40, 74)
	else:
		texture = enemy_textures.get(kind)
	if texture == null:
		return false
	var src := Rect2(Vector2(frame * cell.x, 0), cell)
	canvas.draw_texture_rect_region(texture, Rect2((pos - pivot).round(), cell), src)
	return true

func draw_player_fallback(canvas: CanvasItem, player_pos: Vector2) -> void:
	canvas.draw_circle(player_pos, 11.0, C.MINT_FADE)
	canvas.draw_circle(player_pos + Vector2(0, -2), 7.0, C.AD_PAPER)
	canvas.draw_circle(player_pos + Vector2(-3, -3), 1.5, C.INK)
	canvas.draw_circle(player_pos + Vector2(3, -3), 1.5, C.INK)
	canvas.draw_arc(player_pos + Vector2(0, 1), 4.0, 0.15, PI - 0.15, 10, C.COCOA, 1.0)
	canvas.draw_arc(player_pos, 11.0, 0.0, TAU, 28, C.INK, 1.0)

func draw_enemy_fallback(canvas: CanvasItem, enemy: Dictionary) -> void:
	var pos: Vector2 = enemy["pos"]
	var elite: bool = enemy["elite"]
	var radius := float(enemy["radius"])
	canvas.draw_circle(pos, radius, C.CORAL_PINK if elite else C.LEMON_YELLOW)
	canvas.draw_circle(pos + Vector2(-3, -2), 1.7, C.INK)
	canvas.draw_circle(pos + Vector2(3, -2), 1.7, C.INK)
	canvas.draw_arc(pos + Vector2(0, 2), 4.0, 0.0, PI, 10, C.INK, 1.0)
	canvas.draw_circle(pos + Vector2(0, 5), 2.0, C.TOXIC_GREEN)
	canvas.draw_arc(pos, radius, 0.0, TAU, 24, C.INK, 1.0)

func _load_texture(path: String) -> Texture2D:
	if ResourceLoader.exists(path, "Texture2D"):
		var imported_texture := load(path) as Texture2D
		if imported_texture != null:
			return imported_texture
	if not FileAccess.file_exists(path):
		push_warning("Sprite asset missing: %s" % path)
		return null
	var image := Image.new()
	var error := image.load(path)
	if error != OK:
		push_warning("Sprite asset could not be loaded: %s" % path)
		return null
	return ImageTexture.create_from_image(image)

func _load_yunseo_walk_set(paths_by_direction: Dictionary) -> Dictionary:
	var textures := {}
	for direction in paths_by_direction:
		var frames: Array[Texture2D] = []
		for path in paths_by_direction[direction]:
			var texture := _load_texture(String(path))
			if texture == null:
				return {}
			frames.append(texture)
		textures[direction] = frames
	return textures
