extends RefCounted

const FONT_PATH := "res://assets/fonts/NotoSansKR-VF.ttf"

static var cached_font

static func get_font():
	if cached_font != null:
		return cached_font
	if ResourceLoader.exists(FONT_PATH, "FontFile"):
		var loaded_font := ResourceLoader.load(FONT_PATH, "FontFile")
		if loaded_font != null and loaded_font is Font:
			cached_font = loaded_font
			return cached_font
	var font := FontFile.new()
	var error := font.load_dynamic_font(FONT_PATH)
	if error == OK:
		cached_font = font
	else:
		push_warning("UI font could not be loaded: %s" % FONT_PATH)
		cached_font = ThemeDB.get_fallback_font()
	return cached_font
