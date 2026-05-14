extends RefCounted

const C := preload("res://scripts/game_config.gd")
const UI_FONT := preload("res://assets/fonts/NotoSansKR-VF.ttf")

const MAX_DAMAGE_NUMBERS := 100

var shots: Array[Dictionary] = []
var bursts: Array[Dictionary] = []
var particles: Array[Dictionary] = []
var floaters: Array[Dictionary] = []
var damage_numbers: Array[Dictionary] = []
var warning_rings: Array[Dictionary] = []
var miss_rings: Array[Dictionary] = []
var status_rings: Array[Dictionary] = []
var impact_lines: Array[Dictionary] = []
var slashes: Array[Dictionary] = []
var combat_banner: Dictionary = {}
var screen_flash := 0.0
var screen_flash_duration := 0.0
var screen_flash_color := Color(1.0, 0.91, 0.25, 1.0)
var shake_left := 0.0
var shake_power := 0.0

func update(delta: float) -> void:
	screen_flash = maxf(0.0, screen_flash - delta)
	shake_left = maxf(0.0, shake_left - delta)
	for item in shots:
		item["life"] = float(item["life"]) - delta
	for item in bursts:
		item["life"] = float(item["life"]) - delta
	for item in particles:
		item["life"] = float(item["life"]) - delta
		item["vel"] = Vector2(item["vel"]) + C.PARTICLE_GRAVITY * delta
		item["pos"] = Vector2(item["pos"]) + Vector2(item["vel"]) * delta
	for item in floaters:
		item["life"] = float(item["life"]) - delta
		item["pos"] = Vector2(item["pos"]) + Vector2(0, -18) * delta
	for item in damage_numbers:
		item["life"] = float(item["life"]) - delta
		item["pos"] = Vector2(item["pos"]) + Vector2(item.get("drift", Vector2.ZERO)) * delta
	for item in warning_rings:
		item["life"] = float(item["life"]) - delta
	for item in miss_rings:
		item["life"] = float(item["life"]) - delta
	for item in status_rings:
		item["life"] = float(item["life"]) - delta
	for item in impact_lines:
		item["life"] = float(item["life"]) - delta
	for item in slashes:
		item["life"] = float(item["life"]) - delta
	if not combat_banner.is_empty():
		combat_banner["life"] = float(combat_banner["life"]) - delta
	shots = shots.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	bursts = bursts.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	particles = particles.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	floaters = floaters.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	damage_numbers = damage_numbers.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	warning_rings = warning_rings.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	miss_rings = miss_rings.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	status_rings = status_rings.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	impact_lines = impact_lines.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	slashes = slashes.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	if not combat_banner.is_empty() and float(combat_banner["life"]) <= 0.0:
		combat_banner.clear()

func add_auto_shot(from_pos: Vector2, to_pos: Vector2) -> void:
	shots.append({"from": from_pos, "to": to_pos, "life": 0.08, "duration": 0.08, "color": C.NEON_RED, "width": 2.8})
	add_slash(to_pos, (to_pos - from_pos).normalized(), C.NEON_RED, 18.0, 0.13)
	add_impact_shake(0.06, 1.5)

func add_alt_shot(from_pos: Vector2, to_pos: Vector2) -> void:
	shots.append({"from": from_pos, "to": to_pos, "life": 0.16, "duration": 0.16, "color": C.TOXIC_GREEN, "width": 4.0})
	add_slash(to_pos, (to_pos - from_pos).normalized(), C.TOXIC_GREEN, 22.0, 0.16)

func add_burst(pos: Vector2, dir: Vector2, life: float, directed: bool) -> void:
	bursts.append({"pos": pos, "dir": dir, "life": life, "directed": directed})

func add_small_burst(pos: Vector2) -> void:
	bursts.append({"pos": pos, "dir": Vector2.RIGHT, "life": 0.24, "directed": false, "radius": 70.0, "color": C.CORAL_PINK})

func add_floater(pos: Vector2, text: String, color: Color, size: int = 12) -> void:
	floaters.append({
		"pos": pos + Vector2(0, -22),
		"text": text,
		"life": 0.55,
		"color": color,
		"size": size,
	})

func add_damage_number(pos: Vector2, amount: float, kind: String, effectiveness: String = "normal") -> void:
	var style := _damage_number_style(kind, effectiveness)
	damage_numbers.append({
		"pos": pos + Vector2(float(style["x_offset"]), float(style["y_offset"])),
		"text": _damage_text(amount, kind),
		"life": float(style["life"]),
		"duration": float(style["life"]),
		"color": style["color"],
		"size": int(style["size"]),
		"drift": style["drift"],
	})
	_trim_damage_numbers()

func add_status_ring(pos: Vector2, color: Color, radius: float = 15.0, life: float = 0.34) -> void:
	status_rings.append({"pos": pos, "color": color, "radius": radius, "life": life, "duration": life})

func add_impact_line(from_pos: Vector2, to_pos: Vector2, color: Color) -> void:
	impact_lines.append({"from": from_pos, "to": to_pos, "color": color, "life": 0.18, "duration": 0.18})

func add_slash(pos: Vector2, dir: Vector2, color: Color, radius: float = 20.0, life: float = 0.16) -> void:
	var safe_dir := dir.normalized() if dir.length_squared() > 0.0 else Vector2.RIGHT
	slashes.append({"pos": pos, "dir": safe_dir, "color": color, "radius": radius, "life": life, "duration": life})

func add_impact_shake(duration: float, power: float) -> void:
	shake_left = maxf(shake_left, duration)
	shake_power = maxf(shake_power, power)

func show_combat_banner(text: String, color: Color = C.NEON_RED) -> void:
	combat_banner = {"text": text, "color": color, "life": 1.05, "duration": 1.05}
	add_impact_shake(0.22, 5.0)

func add_charge_warning_ring(pos: Vector2) -> void:
	warning_rings.append({"pos": pos, "life": C.CHARGE_WARNING_TIME, "duration": C.CHARGE_WARNING_TIME})

func add_charge_floater(pos: Vector2, directed: bool) -> void:
	floaters.append({
		"pos": pos + Vector2(0, -24),
		"text": "집중!" if directed else "차징!",
		"life": 0.65,
		"color": C.TOXIC_GREEN if directed else C.VITAMIN_YELLOW,
		"size": 13,
	})

func show_charge_ready() -> void:
	_set_screen_flash(C.CHARGE_READY_FLASH, Color(1.0, 0.91, 0.25, 1.0))

func show_charge_missed(pos: Vector2) -> void:
	_set_screen_flash(C.CHARGE_MISS_FLASH, Color(0.35, 0.70, 0.95, 1.0))
	miss_rings.append({"pos": pos, "life": 0.34, "duration": 0.34})
	floaters.append({
		"pos": pos + Vector2(0, -22),
		"text": "놓침",
		"life": 0.45,
		"color": Color(0.35, 0.70, 0.95, 0.95),
		"size": 12,
	})

func fire_feedback(directed: bool) -> void:
	_set_screen_flash(0.28 if directed else 0.20, Color(0.62, 1.0, 0.36, 1.0) if directed else Color(1.0, 0.91, 0.25, 1.0))
	add_impact_shake(0.25 if directed else 0.15, C.CHARGE_FOCUS_SHAKE if directed else C.CHARGE_NORMAL_SHAKE)

func shake_offset(rng: RandomNumberGenerator) -> Vector2:
	if shake_left <= 0.0:
		return Vector2.ZERO
	return Vector2(rng.randf_range(-shake_power, shake_power), rng.randf_range(-shake_power, shake_power))

func spawn_charge_particles(origin: Vector2, dir: Vector2, directed: bool, rng: RandomNumberGenerator) -> void:
	var count := 54 if directed else 30
	for i in range(count):
		var spread := rng.randf_range(-0.55, 0.55) if directed else rng.randf_range(-PI, PI)
		var out_dir := dir.rotated(spread) if directed else Vector2.RIGHT.rotated(spread)
		var speed := rng.randf_range(95.0, 285.0 if directed else 175.0)
		particles.append({
			"pos": origin + out_dir * rng.randf_range(6.0, 26.0),
			"vel": out_dir * speed,
			"life": rng.randf_range(0.24, 0.64 if directed else 0.48),
			"color": [C.TOXIC_GREEN, C.NEON_RED, C.VITAMIN_YELLOW][rng.randi_range(0, 2)],
			"size": rng.randf_range(2.0, 6.0 if directed else 4.5),
			"shape": "line" if directed and rng.randf() < 0.42 else ("star" if rng.randf() < 0.55 else "dot"),
		})
	_trim_particles()

func spawn_hit_spark(pos: Vector2, directed: bool, rng: RandomNumberGenerator) -> void:
	for i in range(5 if directed else 3):
		var dir := Vector2.RIGHT.rotated(rng.randf_range(-PI, PI))
		particles.append({
			"pos": pos,
			"vel": dir * rng.randf_range(45.0, 115.0),
			"life": rng.randf_range(0.16, 0.32),
			"color": C.TOXIC_GREEN if directed else C.VITAMIN_YELLOW,
			"size": rng.randf_range(1.5, 3.5),
			"shape": "star",
		})
	_trim_particles()

func spawn_pop_particles(pos: Vector2, rng: RandomNumberGenerator) -> void:
	for i in range(8):
		var dir := Vector2.RIGHT.rotated(rng.randf_range(-PI, PI))
		particles.append({
			"pos": pos,
			"vel": dir * rng.randf_range(30.0, 95.0),
			"life": rng.randf_range(0.18, 0.38),
			"color": [C.CORAL_PINK, C.TOXIC_GREEN, C.LEMON_YELLOW][rng.randi_range(0, 2)],
			"size": rng.randf_range(1.5, 3.0),
			"shape": "dot",
		})
	_trim_particles()

func draw_behind(canvas: CanvasItem) -> void:
	for ring in warning_rings:
		var progress := 1.0 - float(ring["life"]) / float(ring["duration"])
		var pos: Vector2 = ring["pos"]
		var alpha := (1.0 - progress) * 0.52
		canvas.draw_circle(pos, 42.0 + progress * 28.0, Color(1.0, 0.91, 0.25, alpha * 0.22))
		canvas.draw_arc(pos, 34.0 + progress * 36.0, 0.0, TAU, 48, Color(1.0, 0.3, 0.36, alpha), 2.0)
	for ring in miss_rings:
		var progress := 1.0 - float(ring["life"]) / float(ring["duration"])
		var pos: Vector2 = ring["pos"]
		var alpha := (1.0 - progress) * 0.42
		canvas.draw_arc(pos, 24.0 + progress * 30.0, -PI * 0.86, PI * 0.86, 32, Color(0.35, 0.70, 0.95, alpha), 2.0)
	for ring in status_rings:
		var progress := 1.0 - float(ring["life"]) / float(ring["duration"])
		var pos: Vector2 = ring["pos"]
		var color: Color = ring["color"]
		color.a = (1.0 - progress) * 0.72
		var radius := float(ring["radius"]) + progress * 16.0
		canvas.draw_arc(pos, radius, 0.0, TAU, 28, color, 2.5)
		color.a *= 0.22
		canvas.draw_circle(pos, radius * 0.72, color)
	for burst in bursts:
		var pos: Vector2 = burst["pos"]
		var life := float(burst["life"])
		var total := 0.36 if burst["directed"] else 0.24
		var target_radius := float(burst.get("radius", 78.0 if burst["directed"] else 54.0))
		var r := (1.0 - life / total) * target_radius
		var color: Color = burst.get("color", C.TOXIC_GREEN if burst["directed"] else C.VITAMIN_YELLOW)
		color.a = clampf(life * 3.0, 0.0, 0.75)
		canvas.draw_circle(pos, r, color)
		canvas.draw_arc(pos, r + 12.0, 0.0, TAU, 40, Color(1.0, 0.3, 0.36, color.a), 3.0)

func draw_front(canvas: CanvasItem) -> void:
	for shot in shots:
		var color: Color = shot["color"]
		color.a = clampf(float(shot["life"]) / maxf(0.001, float(shot.get("duration", 0.08))), 0.0, 1.0)
		canvas.draw_line(shot["from"], shot["to"], color, float(shot.get("width", 2.0)))
	for line in impact_lines:
		var color: Color = line["color"]
		color.a = clampf(float(line["life"]) / maxf(0.001, float(line["duration"])), 0.0, 1.0)
		canvas.draw_line(line["from"], line["to"], color, 3.0)
	for slash in slashes:
		var ratio := float(slash["life"]) / maxf(0.001, float(slash["duration"]))
		var color: Color = slash["color"]
		color.a = clampf(ratio * 1.15, 0.0, 1.0)
		var pos: Vector2 = slash["pos"]
		var dir: Vector2 = slash["dir"]
		var radius := float(slash["radius"]) * (1.0 + (1.0 - ratio) * 0.35)
		var angle := dir.angle()
		canvas.draw_arc(pos, radius, angle - 1.85, angle + 1.85, 18, color, 4.0)
		canvas.draw_line(pos - dir.rotated(PI * 0.5) * radius * 0.45, pos + dir.rotated(PI * 0.5) * radius * 0.45, Color(1.0, 0.96, 0.72, color.a * 0.65), 2.0)
	for burst in bursts:
		var pos: Vector2 = burst["pos"]
		var directed: bool = burst["directed"]
		if directed:
			var dir: Vector2 = burst["dir"]
			var length := 150.0
			var left := dir.rotated(-0.55) * length
			var right := dir.rotated(0.55) * length
			canvas.draw_colored_polygon(PackedVector2Array([pos, pos + left, pos + right]), Color(0.62, 1.0, 0.36, 0.24))
			canvas.draw_line(pos, pos + dir * (length + 28.0), Color(1.0, 0.3, 0.36, 0.78), 4.0)
	for particle in particles:
		var color: Color = particle["color"]
		color.a = clampf(float(particle["life"]) * 4.0, 0.0, 1.0)
		var pos: Vector2 = particle["pos"]
		var size := float(particle["size"])
		if particle["shape"] == "line":
			var vel_dir := Vector2(particle["vel"]).normalized()
			canvas.draw_line(pos - vel_dir * size, pos + vel_dir * size * 3.2, color, 2.0)
		elif particle["shape"] == "star":
			_draw_star(canvas, pos, size, color)
		else:
			canvas.draw_circle(pos, size, color)
	for floater in floaters:
		canvas.draw_string(UI_FONT, floater["pos"], floater["text"], HORIZONTAL_ALIGNMENT_CENTER, -1.0, int(floater.get("size", 12)), floater["color"])
	for number in damage_numbers:
		var ratio := float(number["life"]) / maxf(0.001, float(number["duration"]))
		var color: Color = number["color"]
		color.a = clampf(ratio * 1.25, 0.0, 1.0)
		var shadow := Color(0.08, 0.06, 0.05, color.a * 0.75)
		var pos: Vector2 = number["pos"]
		var text: String = number["text"]
		var size := int(number.get("size", 12))
		canvas.draw_string(UI_FONT, pos + Vector2(1, 1), text, HORIZONTAL_ALIGNMENT_CENTER, -1.0, size, shadow)
		canvas.draw_string(UI_FONT, pos, text, HORIZONTAL_ALIGNMENT_CENTER, -1.0, size, color)

func draw_screen_flash(canvas: CanvasItem, camera_pos: Vector2) -> void:
	if screen_flash > 0.0:
		var ratio := screen_flash / maxf(0.001, screen_flash_duration)
		var color := screen_flash_color
		color.a = clampf(ratio * 0.36, 0.0, 0.38)
		canvas.draw_rect(Rect2(camera_pos - C.VIEWPORT_SIZE * 0.5, C.VIEWPORT_SIZE), color)
	if combat_banner.is_empty():
		return
	var banner_ratio := float(combat_banner["life"]) / maxf(0.001, float(combat_banner["duration"]))
	var center := camera_pos + Vector2(0, -24)
	var width := C.VIEWPORT_SIZE.x * (0.72 + (1.0 - banner_ratio) * 0.08)
	var height := 34.0
	var banner_color: Color = combat_banner["color"]
	banner_color.a = clampf(banner_ratio * 0.72, 0.0, 0.72)
	canvas.draw_rect(Rect2(center - Vector2(width * 0.5, height * 0.5), Vector2(width, height)), Color(0.32, 0.04, 0.04, banner_color.a * 0.84))
	canvas.draw_line(center + Vector2(-width * 0.5, -height * 0.5), center + Vector2(width * 0.5, -height * 0.5), banner_color, 3.0)
	canvas.draw_line(center + Vector2(-width * 0.5, height * 0.5), center + Vector2(width * 0.5, height * 0.5), banner_color, 3.0)
	var text_color := Color(1.0, 0.93, 0.58, clampf(banner_ratio * 1.25, 0.0, 1.0))
	canvas.draw_string(UI_FONT, center + Vector2(2, 9), String(combat_banner["text"]), HORIZONTAL_ALIGNMENT_CENTER, width, 24, Color(0.05, 0.02, 0.02, text_color.a))
	canvas.draw_string(UI_FONT, center + Vector2(0, 7), String(combat_banner["text"]), HORIZONTAL_ALIGNMENT_CENTER, width, 24, text_color)

func clear() -> void:
	shots.clear()
	bursts.clear()
	particles.clear()
	floaters.clear()
	damage_numbers.clear()
	warning_rings.clear()
	miss_rings.clear()
	status_rings.clear()
	impact_lines.clear()
	slashes.clear()
	combat_banner.clear()
	screen_flash = 0.0
	screen_flash_duration = 0.0
	shake_left = 0.0
	shake_power = 0.0

func _set_screen_flash(duration: float, color: Color) -> void:
	screen_flash = duration
	screen_flash_duration = duration
	screen_flash_color = color

func _trim_particles() -> void:
	if particles.size() <= C.CHARGE_MAX_PARTICLES:
		return
	particles = particles.slice(particles.size() - C.CHARGE_MAX_PARTICLES)

func _trim_damage_numbers() -> void:
	if damage_numbers.size() <= MAX_DAMAGE_NUMBERS:
		return
	damage_numbers = damage_numbers.slice(damage_numbers.size() - MAX_DAMAGE_NUMBERS)

func _damage_text(amount: float, kind: String) -> String:
	var sign := "+" if kind == "heal" else ""
	if absf(amount - roundf(amount)) < 0.05:
		return sign + str(int(roundf(amount)))
	return sign + ("%.1f" % amount)

func _damage_number_style(kind: String, effectiveness: String = "normal") -> Dictionary:
	if effectiveness == "reduced":
		return {"color": Color(0.64, 0.67, 0.68, 0.86), "size": 9, "life": 0.38, "drift": Vector2(-2, -18), "x_offset": -3.0, "y_offset": -10.0}
	if effectiveness == "weak":
		match kind:
			"focused":
				return {"color": Color(0.78, 1.0, 0.44, 1.0), "size": 20, "life": 0.76, "drift": Vector2(7, -44), "x_offset": 5.0, "y_offset": -22.0}
			"burst":
				return {"color": Color(1.0, 0.62, 0.22, 1.0), "size": 17, "life": 0.66, "drift": Vector2(8, -38), "x_offset": 3.0, "y_offset": -20.0}
			"puddle":
				return {"color": Color(0.74, 1.0, 0.42, 0.98), "size": 13, "life": 0.50, "drift": Vector2(-2, -28), "x_offset": -3.0, "y_offset": -12.0}
			_:
				return {"color": Color(1.0, 0.98, 0.62, 1.0), "size": 15, "life": 0.62, "drift": Vector2(0, -34), "x_offset": 0.0, "y_offset": -17.0}
	match kind:
		"auto":
			return {"color": Color(1.0, 0.96, 0.72, 0.98), "size": 11, "life": 0.48, "drift": Vector2(-5, -28), "x_offset": -5.0, "y_offset": -14.0}
		"charge":
			return {"color": C.VITAMIN_YELLOW, "size": 14, "life": 0.62, "drift": Vector2(0, -34), "x_offset": 0.0, "y_offset": -18.0}
		"focused":
			return {"color": C.TOXIC_GREEN, "size": 17, "life": 0.68, "drift": Vector2(6, -38), "x_offset": 5.0, "y_offset": -20.0}
		"burst":
			return {"color": Color(1.0, 0.48, 0.16, 0.98), "size": 14, "life": 0.58, "drift": Vector2(8, -32), "x_offset": 3.0, "y_offset": -18.0}
		"puddle":
			return {"color": Color(0.78, 0.36, 1.0, 0.95), "size": 10, "life": 0.42, "drift": Vector2(-2, -22), "x_offset": -3.0, "y_offset": -10.0}
		"heal":
			return {"color": Color(0.38, 1.0, 0.48, 0.98), "size": 13, "life": 0.56, "drift": Vector2(0, -30), "x_offset": 0.0, "y_offset": -24.0}
		_:
			return {"color": Color.WHITE, "size": 12, "life": 0.5, "drift": Vector2(0, -26), "x_offset": 0.0, "y_offset": -14.0}

func _draw_star(canvas: CanvasItem, pos: Vector2, radius: float, color: Color) -> void:
	var points := PackedVector2Array()
	for i in range(10):
		var r := radius if i % 2 == 0 else radius * 0.45
		var a := -PI / 2.0 + TAU * float(i) / 10.0
		points.append(pos + Vector2(cos(a), sin(a)) * r)
	canvas.draw_colored_polygon(points, color)
