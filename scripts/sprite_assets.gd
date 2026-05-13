extends RefCounted

const C := preload("res://scripts/game_config.gd")

const PLAYER_PATH := "res://assets/characters/player/player_survivor_48x48_4dir_walk.png"
const TIER1_PATHS := {
	"billboard": "res://assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png",
	"appliance": "res://assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png",
	"coupon": "res://assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png",
}
const ELITE_PATH := "res://assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png"
const LARGE_ELITE_PATH := "res://assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png"

var player_texture: Texture2D
var enemy_textures := {}
var elite_texture: Texture2D
var large_elite_texture: Texture2D

func load_all() -> void:
	player_texture = _load_texture(PLAYER_PATH)
	for kind in TIER1_PATHS:
		enemy_textures[kind] = _load_texture(TIER1_PATHS[kind])
	elite_texture = _load_texture(ELITE_PATH)
	large_elite_texture = _load_texture(LARGE_ELITE_PATH)

func draw_player(canvas: CanvasItem, pos: Vector2, row: int, frame: int) -> bool:
	if player_texture == null:
		return false
	var cell := Vector2(48, 48)
	var pivot := Vector2(24, 43)
	var src := Rect2(Vector2(frame * cell.x, row * cell.y), cell)
	canvas.draw_texture_rect_region(player_texture, Rect2((pos - pivot).round(), cell), src)
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
