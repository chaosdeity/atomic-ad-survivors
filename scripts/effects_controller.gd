extends RefCounted

const C := preload("res://scripts/game_config.gd")

var shots: Array[Dictionary] = []
var bursts: Array[Dictionary] = []
var particles: Array[Dictionary] = []
var floaters: Array[Dictionary] = []
var screen_flash := 0.0
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
	shots = shots.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	bursts = bursts.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	particles = particles.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)
	floaters = floaters.filter(func(item: Dictionary) -> bool: return float(item["life"]) > 0.0)

func add_auto_shot(from_pos: Vector2, to_pos: Vector2) -> void:
	shots.append({"from": from_pos, "to": to_pos, "life": 0.08, "color": C.NEON_RED})

func add_burst(pos: Vector2, dir: Vector2, life: float, directed: bool) -> void:
	bursts.append({"pos": pos, "dir": dir, "life": life, "directed": directed})

func add_charge_floater(pos: Vector2, directed: bool) -> void:
	floaters.append({
		"pos": pos + Vector2(0, -24),
		"text": "집중!" if directed else "차징!",
		"life": 0.65,
		"color": C.TOXIC_GREEN if directed else C.VITAMIN_YELLOW,
	})

func show_charge_ready() -> void:
	screen_flash = 0.12

func fire_feedback(directed: bool) -> void:
	screen_flash = 0.24
	shake_left = 0.22 if directed else 0.15
	shake_power = 6.5 if directed else 4.0

func shake_offset(rng: RandomNumberGenerator) -> Vector2:
	if shake_left <= 0.0:
		return Vector2.ZERO
	return Vector2(rng.randf_range(-shake_power, shake_power), rng.randf_range(-shake_power, shake_power))

func spawn_charge_particles(origin: Vector2, dir: Vector2, directed: bool, rng: RandomNumberGenerator) -> void:
	var count := 42 if directed else 28
	for i in range(count):
		var spread := rng.randf_range(-0.8, 0.8) if directed else rng.randf_range(-PI, PI)
		var out_dir := dir.rotated(spread) if directed else Vector2.RIGHT.rotated(spread)
		var speed := rng.randf_range(80.0, 230.0 if directed else 170.0)
		particles.append({
			"pos": origin + out_dir * rng.randf_range(6.0, 26.0),
			"vel": out_dir * speed,
			"life": rng.randf_range(0.22, 0.55),
			"color": [C.TOXIC_GREEN, C.NEON_RED, C.VITAMIN_YELLOW][rng.randi_range(0, 2)],
			"size": rng.randf_range(2.0, 5.0),
			"shape": "star" if rng.randf() < 0.55 else "dot",
		})

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

func draw_behind(canvas: CanvasItem) -> void:
	for burst in bursts:
		var pos: Vector2 = burst["pos"]
		var life := float(burst["life"])
		var r := (1.0 - life / 0.28) * 54.0
		var color := C.TOXIC_GREEN if burst["directed"] else C.VITAMIN_YELLOW
		color.a = clampf(life * 3.0, 0.0, 0.75)
		canvas.draw_circle(pos, r, color)
		canvas.draw_arc(pos, r + 12.0, 0.0, TAU, 40, Color(1.0, 0.3, 0.36, color.a), 3.0)

func draw_front(canvas: CanvasItem) -> void:
	for shot in shots:
		var color: Color = shot["color"]
		color.a = clampf(float(shot["life"]) * 12.0, 0.0, 1.0)
		canvas.draw_line(shot["from"], shot["to"], color, 2.0)
	for burst in bursts:
		var pos: Vector2 = burst["pos"]
		var directed: bool = burst["directed"]
		if directed:
			var dir: Vector2 = burst["dir"]
			var left := dir.rotated(-0.55) * 90.0
			var right := dir.rotated(0.55) * 90.0
			canvas.draw_colored_polygon(PackedVector2Array([pos, pos + left, pos + right]), Color(0.62, 1.0, 0.36, 0.25))
	for particle in particles:
		var color: Color = particle["color"]
		color.a = clampf(float(particle["life"]) * 4.0, 0.0, 1.0)
		var pos: Vector2 = particle["pos"]
		var size := float(particle["size"])
		if particle["shape"] == "star":
			_draw_star(canvas, pos, size, color)
		else:
			canvas.draw_circle(pos, size, color)
	for floater in floaters:
		canvas.draw_string(ThemeDB.get_fallback_font(), floater["pos"], floater["text"], HORIZONTAL_ALIGNMENT_CENTER, -1.0, 12, floater["color"])

func draw_screen_flash(canvas: CanvasItem, camera_pos: Vector2) -> void:
	if screen_flash <= 0.0:
		return
	var alpha := clampf(screen_flash * 2.8, 0.0, 0.38)
	canvas.draw_rect(Rect2(camera_pos - C.VIEWPORT_SIZE * 0.5, C.VIEWPORT_SIZE), Color(1.0, 0.91, 0.25, alpha))

func clear() -> void:
	shots.clear()
	bursts.clear()
	particles.clear()
	floaters.clear()
	screen_flash = 0.0
	shake_left = 0.0
	shake_power = 0.0

func _draw_star(canvas: CanvasItem, pos: Vector2, radius: float, color: Color) -> void:
	var points := PackedVector2Array()
	for i in range(10):
		var r := radius if i % 2 == 0 else radius * 0.45
		var a := -PI / 2.0 + TAU * float(i) / 10.0
		points.append(pos + Vector2(cos(a), sin(a)) * r)
	canvas.draw_colored_polygon(points, color)
