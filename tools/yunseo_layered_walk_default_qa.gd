extends SceneTree

const MainScene := preload("res://scenes/main.tscn")
const MainScript := preload("res://scripts/main.gd")
const SpriteAssets := preload("res://scripts/sprite_assets.gd")

const OUTPUT_ROOT := "res://qa/yunseo_layered_walk_default_enable"
const RESULTS_PATH := "res://qa/yunseo_layered_walk_default_enable/results.json"
const PROOF_PATH := "res://qa/yunseo_layered_walk_default_enable/default_walk_gameplay_480x270.png"
const CONTACT_PATH := "res://qa/yunseo_layered_walk_default_enable/default_walk_contact_sheet_480x270.png"

var failures: Array[String] = []
var sprite_assets := SpriteAssets.new()
var main

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	root.size = Vector2i(480, 270)
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUTPUT_ROOT))
	sprite_assets.load_all()
	_probe_flags()
	_probe_textures()
	_probe_gameplay_priority()
	_write_proof_images()
	_write_results()
	_cleanup()
	if failures.is_empty():
		print("YUNSEO_LAYERED_WALK_DEFAULT_QA PASS proof=%s contact=%s" % [ProjectSettings.globalize_path(PROOF_PATH), ProjectSettings.globalize_path(CONTACT_PATH)])
		quit(0)
		return
	for failure in failures:
		push_error(failure)
	print("YUNSEO_LAYERED_WALK_DEFAULT_QA FAIL count=%d" % failures.size())
	quit(1)

func _probe_flags() -> void:
	_record("default walk flag ON", MainScript.PLAYER_USE_YUNSEO_WALK_FRAMES == true, str(MainScript.PLAYER_USE_YUNSEO_WALK_FRAMES))
	_record("failed-frame debug flag OFF", MainScript.PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG == false, str(MainScript.PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG))
	_record("pseudo-socket debug flag OFF", MainScript.PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG == false, str(MainScript.PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG))

func _probe_textures() -> void:
	var directions := ["down", "up", "left", "right"]
	var loaded_total := 0
	var failed_debug_total := 0
	for direction in directions:
		var default_frames: Array = sprite_assets.yunseo_walk_textures.get(direction, [])
		var failed_frames: Array = sprite_assets.yunseo_failed_frame_walk_textures.get(direction, [])
		_record("%s default frame count" % direction, default_frames.size() == 4, str(default_frames.size()))
		_record("%s failed debug frame count" % direction, failed_frames.size() == 4, str(failed_frames.size()))
		for i in range(default_frames.size()):
			var texture: Texture2D = default_frames[i]
			var ok := texture != null and texture.get_width() == 796 and texture.get_height() == 658
			_record("%s default %02d 796x658" % [direction, i + 1], ok, _texture_size(texture))
			loaded_total += 1 if ok else 0
		for texture in failed_frames:
			failed_debug_total += 1 if texture != null else 0
	_record("layered default load 16/16", loaded_total == 16, str(loaded_total))
	_record("failed-frame controlled cache 16/16", failed_debug_total == 16, str(failed_debug_total))
	_record("default/failure cache separated", sprite_assets.yunseo_walk_textures != sprite_assets.yunseo_failed_frame_walk_textures, "")

func _probe_gameplay_priority() -> void:
	main = MainScene.instantiate()
	root.add_child(main)
	await process_frame
	await process_frame
	main.player_is_moving = true
	main.player_walk_anim_time = 0.0
	main.player_pose_override_id = "stamp_ready"
	main.player_pose_override_timer = 0.2
	_record("action pose priority method returns override", main._player_runtime_action_pose_id() == "stamp_ready", main._player_runtime_action_pose_id())
	main.player_pose_override_timer = 0.0
	main.player_is_moving = false
	_record("idle fallback pose available", main.sprite_assets.yunseo_pose_textures.get("idle") != null, "")
	main.player_is_moving = true
	var direction: String = main._player_walk_direction_id()
	var probe := GameplayDrawProbe.new()
	probe.sprite_assets = main.sprite_assets
	probe.direction = direction
	root.add_child(probe)
	await process_frame
	probe.queue_redraw()
	await process_frame
	_record("gameplay default draw function returns true", probe.drawn, direction)
	root.remove_child(probe)
	probe.free()

func _write_proof_images() -> void:
	var proof := _make_base_image()
	_blit_direction_row(proof, "down", 74)
	_blit_direction_row(proof, "up", 128)
	_blit_direction_row(proof, "left", 182)
	_blit_direction_row(proof, "right", 236)
	var proof_error := proof.save_png(PROOF_PATH)
	_record("480x270 default proof saved", proof_error == OK, ProjectSettings.globalize_path(PROOF_PATH))
	var contact := _make_base_image()
	_blit_contact_grid(contact)
	var contact_error := contact.save_png(CONTACT_PATH)
	_record("480x270 contact sheet saved", contact_error == OK, ProjectSettings.globalize_path(CONTACT_PATH))

func _make_base_image() -> Image:
	var image := Image.create(480, 270, false, Image.FORMAT_RGBA8)
	image.fill(Color(0.12, 0.14, 0.125, 1.0))
	for x in range(0, 480, 48):
		for y in range(270):
			image.set_pixel(x, y, Color(0.25, 0.28, 0.25, 1.0))
	for y in range(0, 270, 48):
		for x in range(480):
			image.set_pixel(x, y, Color(0.25, 0.28, 0.25, 1.0))
	return image

func _blit_direction_row(target: Image, direction: String, y: int) -> void:
	var frames: Array = sprite_assets.yunseo_walk_textures.get(direction, [])
	for frame in range(frames.size()):
		var source := _texture_to_image(frames[frame])
		if source == null:
			continue
		source.resize(88, 72, Image.INTERPOLATE_LANCZOS)
		target.blend_rect(source, Rect2i(0, 0, source.get_width(), source.get_height()), Vector2i(49 + frame * 86, y - 62))

func _blit_contact_grid(target: Image) -> void:
	var directions := ["down", "up", "left", "right"]
	for row in range(directions.size()):
		var direction := String(directions[row])
		var frames: Array = sprite_assets.yunseo_walk_textures.get(direction, [])
		for frame in range(frames.size()):
			var source := _texture_to_image(frames[frame])
			if source == null:
				continue
			source.resize(64, 53, Image.INTERPOLATE_LANCZOS)
			target.blend_rect(source, Rect2i(0, 0, source.get_width(), source.get_height()), Vector2i(80 + frame * 80, 28 + row * 58))

func _texture_to_image(texture: Texture2D) -> Image:
	if texture == null:
		return null
	var image := texture.get_image()
	if image == null:
		return null
	return image

func _texture_size(texture: Texture2D) -> String:
	if texture == null:
		return "null"
	return "%dx%d" % [texture.get_width(), texture.get_height()]

func _write_results() -> void:
	var result := {
		"verdict": "PASS" if failures.is_empty() else "HOLD",
		"default_walk_on": MainScript.PLAYER_USE_YUNSEO_WALK_FRAMES,
		"failed_frame_debug": MainScript.PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG,
		"pseudo_socket_debug": MainScript.PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG,
		"proof": ProjectSettings.globalize_path(PROOF_PATH),
		"contact_sheet": ProjectSettings.globalize_path(CONTACT_PATH),
		"failures": failures,
	}
	var file := FileAccess.open(RESULTS_PATH, FileAccess.WRITE)
	if file == null:
		_record("results write", false, RESULTS_PATH)
		return
	file.store_string(JSON.stringify(result, "\t"))
	file.close()
	print("YUNSEO_LAYERED_WALK_DEFAULT_RESULTS %s" % ProjectSettings.globalize_path(RESULTS_PATH))

func _cleanup() -> void:
	if main != null:
		root.remove_child(main)
		main.free()
		main = null

func _record(label: String, ok: bool, detail: String = "") -> void:
	print("%s: %s%s" % [label, "pass" if ok else "fail", "" if detail == "" else " - %s" % detail])
	if not ok:
		failures.append("%s%s" % [label, "" if detail == "" else " - %s" % detail])

class GameplayDrawProbe:
	extends Node2D

	var sprite_assets
	var direction := "down"
	var drawn := false

	func _draw() -> void:
		drawn = sprite_assets.draw_yunseo_walk(self, Vector2(240, 145), direction, 0)
