extends RefCounted

const DEFAULT_PATH := "res://data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json"
const EXPECTED_FRAME_COUNT := 40

var frames_by_key := {}
var loaded := false
var load_error := ""

func load_manifest(path: String = DEFAULT_PATH) -> bool:
	frames_by_key.clear()
	loaded = false
	load_error = ""
	if not FileAccess.file_exists(path):
		load_error = "Pseudo-socket manifest missing: %s" % path
		return false
	var text := FileAccess.get_file_as_string(path)
	var json := JSON.new()
	var error := json.parse(text)
	if error != OK:
		load_error = "Pseudo-socket manifest parse failed: %s" % json.get_error_message()
		return false
	var parsed = json.data
	if typeof(parsed) != TYPE_DICTIONARY:
		load_error = "Pseudo-socket manifest is not a dictionary."
		return false
	var frames: Array = parsed.get("frames", [])
	if frames.size() != EXPECTED_FRAME_COUNT:
		load_error = "Pseudo-socket manifest frame count %d != %d." % [frames.size(), EXPECTED_FRAME_COUNT]
		return false
	for item in frames:
		if typeof(item) != TYPE_DICTIONARY:
			continue
		var frame: Dictionary = item
		var family := String(frame.get("source_family", ""))
		var direction := String(frame.get("direction", ""))
		var frame_index := int(frame.get("frame_index", 0))
		if family == "" or direction == "" or frame_index <= 0:
			continue
		frames_by_key[_key(family, direction, frame_index - 1)] = frame
	loaded = not frames_by_key.is_empty()
	if not loaded:
		load_error = "Pseudo-socket manifest had no usable frames."
	return loaded

func is_ready() -> bool:
	return loaded

func get_frame(source_family: String, direction: String, frame: int) -> Dictionary:
	if not loaded:
		return {}
	return frames_by_key.get(_key(source_family, direction, frame), {})

func contact_phase(source_family: String, direction: String, frame: int, side: String) -> String:
	var data := get_frame(source_family, direction, frame)
	if data.is_empty():
		return ""
	var contact_key := "leg_contact_l" if side == "left" else "leg_contact_r"
	var contact: Dictionary = data.get(contact_key, {})
	return String(contact.get("phase", ""))

func _key(source_family: String, direction: String, frame: int) -> String:
	return "%s:%s:%d" % [source_family, direction, posmod(frame, 4)]
