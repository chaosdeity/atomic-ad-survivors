extends RefCounted

const C := preload("res://scripts/game_config.gd")
const R01SourceState := preload("res://scripts/r01_source_state.gd")

const DEFAULT_ART_KIT_ROOT := "res://assets/art_inbox/p0_commercial_runtime_v01"
const LEGACY_P0_ART_KIT_ROOT := "res://assets/art_inbox/p0_2_playable_art_kit"
const PLAYER_FRAME_SIZE := Vector2(48, 48)
const PLAYER_PIVOT := Vector2(24, 43)
const YUNSEO_COMBAT_FILES := {
	"idle_front": "characters/yunseo_idle_front.png",
	"idle_back": "characters/yunseo_idle_back.png",
	"idle_side": "characters/yunseo_idle_side.png",
	"walk_front_0": "characters/yunseo_walk_front_01.png",
	"walk_front_1": "characters/yunseo_walk_front_02.png",
	"walk_front_2": "characters/yunseo_walk_front_03.png",
	"walk_back_0": "characters/yunseo_walk_back_01.png",
	"walk_back_1": "characters/yunseo_walk_back_02.png",
	"walk_back_2": "characters/yunseo_walk_back_03.png",
	"walk_side_0": "characters/yunseo_walk_side_01.png",
	"walk_side_1": "characters/yunseo_walk_side_02.png",
	"walk_side_2": "characters/yunseo_walk_side_03.png",
	"stamp_ready": "characters/yunseo_charge_stamp_ready.png",
	"stamp_release": "characters/yunseo_charge_stamp_release.png",
	"manual_stamp": "characters/yunseo_manual_stamp_action.png",
	"interact": "characters/yunseo_interact_pose.png",
}
const TIER1_FILES := {
	"billboard": "enemies/smiling_mailbox_enemy.png",
	"appliance": "enemies/homecare_vacuum_enemy.png",
	"coupon": "enemies/coupon_swarm_small.png",
}
const ENEMY_HIT_FILE := "enemies/coupon_swarm_hit_residue.png"
const ENEMY_DEATH_FILE := "enemies/coupon_swarm_death_residue.png"
const ELITE_FILE := "enemies/happy_guarantee_consultant_elite.png"
const LARGE_ELITE_FILE := "enemies/happy_guarantee_consultant_elite.png"
const UI_VFX_FILES := {
	"charge_ready": "ui_vfx/charge_stamp_ready.png",
	"stamp_hit": "ui_vfx/manual_stamp_hit.png",
	"stamp_release": "ui_vfx/charge_stamp_release.png",
	"source_reveal": "ui_vfx/source_reveal_ring.png",
	"overload": "ui_vfx/source_overload_burst.png",
}
const SOURCE_OBJECT_STATE_FILES := {
	"mailbox": "mailbox",
	"projector": "door_sensor",
	"speaker": "speaker_ad_pylon",
	"fake_recovery": "fake_recall_sign",
	"drain": "drain",
	"kiosk": "consultation_booth",
	"photo": "family_photo_window",
	"model_house": "model_house_entrance",
	"node": "model_house_entrance",
	"house": "closed_house_door",
	"ad_device": "name_registry_device",
	"trace": "name_registry_device",
	"tag": "name_registry_device",
	"residue": "speaker_ad_pylon",
}
const SOURCE_STATE_FILE_SUFFIX := {
	R01SourceState.STATE_ACTIVE: "normal",
	R01SourceState.STATE_REVEALED: "revealed",
	R01SourceState.STATE_STAMPED: "stamped",
	R01SourceState.STATE_SUPPRESSED: "suppressed",
	R01SourceState.STATE_OVERLOADED: "overloaded",
	R01SourceState.STATE_SPENT: "spent",
}
const OUTPOST_PATHS := {
	"recovery_platform": "outpost/retrieval_platform.png",
	"settlement_counter": "outpost/settlement_counter.png",
	"maintenance_bench": "outpost/maintenance_bench.png",
	"name_archive": "outpost/name_archive_locker.png",
	"sortie_board": "outpost/sortie_board.png",
	"charging_tuner": "outpost/charge_tuning_station.png",
	"trace_storage_room": "outpost/trace_storage_shelf.png",
	"sortie_gate": "outpost/sortie_gate.png",
}

var player_texture: Texture2D
var art_kit_root := DEFAULT_ART_KIT_ROOT
var yunseo_textures := {}
var enemy_textures := {}
var enemy_hit_texture: Texture2D
var enemy_death_texture: Texture2D
var elite_texture: Texture2D
var large_elite_texture: Texture2D
var ui_vfx_textures := {}
var source_object_textures := {}
var outpost_textures := {}

func load_all() -> void:
	art_kit_root = _resolve_art_kit_root()
	for key in YUNSEO_COMBAT_FILES:
		yunseo_textures[key] = _load_texture(_asset_path(YUNSEO_COMBAT_FILES[key]))
	for kind in TIER1_FILES:
		enemy_textures[kind] = _load_texture(_asset_path(TIER1_FILES[kind]))
	enemy_hit_texture = _load_texture(_asset_path(ENEMY_HIT_FILE))
	enemy_death_texture = _load_texture(_asset_path(ENEMY_DEATH_FILE))
	elite_texture = _load_texture(_asset_path(ELITE_FILE))
	large_elite_texture = _load_texture(_asset_path(LARGE_ELITE_FILE))
	for key in UI_VFX_FILES:
		ui_vfx_textures[key] = _load_texture(_asset_path(UI_VFX_FILES[key]))
	for kind in SOURCE_OBJECT_STATE_FILES:
		for state_id in SOURCE_STATE_FILE_SUFFIX:
			var texture_key := "%s:%s" % [kind, state_id]
			var path := _asset_path("r01_objects/%s_%s.png" % [SOURCE_OBJECT_STATE_FILES[kind], SOURCE_STATE_FILE_SUFFIX[state_id]])
			source_object_textures[texture_key] = _load_texture(path, false)
	for facility_id in OUTPOST_PATHS:
		outpost_textures[facility_id] = _load_texture(_asset_path(OUTPOST_PATHS[facility_id]), false)

func draw_player(canvas: CanvasItem, pos: Vector2, row: int, frame: int, pose: String = "") -> bool:
	var key := _player_key(row, frame, pose)
	var texture: Texture2D = yunseo_textures.get(key)
	if texture == null:
		return false
	_draw_texture_fit(canvas, texture, pos, PLAYER_FRAME_SIZE, PLAYER_PIVOT, row == 1)
	return true

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
	if float(enemy.get("hit_flash", 0.0)) > 0.0 and enemy_hit_texture != null:
		texture = enemy_hit_texture
	_draw_texture_fit(canvas, texture, pos, cell, pivot, false)
	return true

func draw_enemy_death_residue(canvas: CanvasItem, pos: Vector2, radius: float, alpha: float = 1.0) -> bool:
	if enemy_death_texture == null:
		return false
	_draw_texture_fit(canvas, enemy_death_texture, pos, Vector2(radius * 3.0, radius * 3.0), Vector2(radius * 1.5, radius * 1.5), false, alpha)
	return true

func draw_ui_vfx(canvas: CanvasItem, effect_id: String, pos: Vector2, size: Vector2 = Vector2(96, 96), alpha: float = 1.0, rotation: float = 0.0) -> bool:
	var texture: Texture2D = ui_vfx_textures.get(effect_id)
	if texture == null:
		return false
	_draw_texture_fit(canvas, texture, pos, size, size * 0.5, false, alpha, rotation)
	return true

func draw_r01_object(canvas: CanvasItem, object: Dictionary, state_id: String) -> bool:
	var kind := String(object.get("kind", ""))
	var texture_key := "%s:%s" % [kind, state_id]
	var texture: Texture2D = source_object_textures.get(texture_key)
	if texture == null and state_id == R01SourceState.STATE_SPENT:
		texture = source_object_textures.get("%s:%s" % [kind, R01SourceState.STATE_SUPPRESSED])
	if texture == null:
		texture = source_object_textures.get("%s:%s" % [kind, R01SourceState.STATE_ACTIVE])
	if texture == null:
		return false
	var pos := Vector2(object.get("pos", Vector2.ZERO))
	var size := Vector2(object.get("size", Vector2(64, 64)))
	var pivot := Vector2(object.get("pivot", size * 0.5))
	_draw_texture_fit(canvas, texture, pos, size, pivot)
	return true

func outpost_texture(facility_id: String) -> Texture2D:
	return outpost_textures.get(facility_id)

func import_report() -> Dictionary:
	return {
		"alpha": "png Format32bppArgb / transparent import expected",
		"art_root": art_kit_root,
		"pivot": "player=%s r01=object.pivot outpost=centered TextureRect" % PLAYER_PIVOT,
		"filter": "project default nearest + Main.texture_filter nearest",
		"draw_layer": "r01 ground/object -> actor -> foreground/effects; outpost preview anchors in HUD layer",
		"collision_radius": "player=%s enemy=dict.radius r01=R01MapAssembly collision metadata" % C.PLAYER_RADIUS,
	}

func _player_key(row: int, frame: int, pose: String) -> String:
	if pose == "manual_stamp":
		return "manual_stamp"
	if pose == "stamp_release":
		return "stamp_release"
	if pose == "stamp_ready":
		return "stamp_ready"
	match row:
		0:
			return "walk_front_%d" % (frame % 3)
		1, 2:
			return "walk_side_%d" % (frame % 3)
		3:
			return "walk_back_%d" % (frame % 3)
		_:
			return "idle_front"

func _draw_texture_fit(canvas: CanvasItem, texture: Texture2D, pos: Vector2, size: Vector2, pivot: Vector2, flip_h: bool = false, alpha: float = 1.0, rotation: float = 0.0) -> void:
	var rect := Rect2((pos - pivot).round(), size)
	if flip_h:
		rect.position.x += size.x
		rect.size.x = -size.x
	var old_transform := canvas.get_transform()
	if rotation != 0.0:
		canvas.draw_set_transform(pos, rotation, Vector2.ONE)
		rect.position -= pos
	canvas.draw_texture_rect(texture, rect, false, Color(1, 1, 1, alpha))
	if rotation != 0.0:
		canvas.draw_set_transform_matrix(old_transform)

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

func _load_texture(path: String, warn_missing: bool = true) -> Texture2D:
	if ResourceLoader.exists(path, "Texture2D"):
		var imported_texture := load(path) as Texture2D
		if imported_texture != null:
			return imported_texture
	if not FileAccess.file_exists(path):
		if warn_missing:
			push_warning("Sprite asset missing: %s" % path)
		return null
	var image := Image.new()
	var error := image.load(path)
	if error != OK:
		push_warning("Sprite asset could not be loaded: %s" % path)
		return null
	return ImageTexture.create_from_image(image)

func _resolve_art_kit_root() -> String:
	var env_root := OS.get_environment("AAS_RUNTIME_ART_ROOT")
	if env_root != "":
		return env_root
	if DirAccess.dir_exists_absolute(DEFAULT_ART_KIT_ROOT):
		return DEFAULT_ART_KIT_ROOT
	return LEGACY_P0_ART_KIT_ROOT

func _asset_path(relative_path: String) -> String:
	return "%s/%s" % [art_kit_root.trim_suffix("/"), relative_path]
