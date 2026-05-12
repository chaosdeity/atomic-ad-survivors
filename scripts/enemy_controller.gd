extends RefCounted

const C := preload("res://scripts/game_config.gd")

var enemies: Array[Dictionary] = []
var spawn_timer := 0.0

func update_spawning(delta: float, elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator) -> void:
	spawn_timer -= delta
	var spawn_rate := 3.4 + elapsed * 0.018
	if spawn_timer <= 0.0 and enemies.size() < C.ENEMY_CAP:
		spawn_timer = maxf(0.08, 1.0 / spawn_rate)
		var count := 1
		if elapsed > 15.0 and rng.randf() < 0.35:
			count += 1
		if elapsed > 55.0 and rng.randf() < 0.20:
			count += 1
		for i in range(count):
			spawn_enemy(elapsed, player_pos, rng)

func spawn_enemy(elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator) -> void:
	var side := rng.randi_range(0, 3)
	var pos := Vector2.ZERO
	if side == 0:
		pos = player_pos + Vector2(-270, rng.randf_range(-160, 160))
	elif side == 1:
		pos = player_pos + Vector2(270, rng.randf_range(-160, 160))
	elif side == 2:
		pos = player_pos + Vector2(rng.randf_range(-260, 260), -165)
	else:
		pos = player_pos + Vector2(rng.randf_range(-260, 260), 165)
	pos.x = clampf(pos.x, -C.ARENA_HALF.x, C.ARENA_HALF.x)
	pos.y = clampf(pos.y, -C.ARENA_HALF.y, C.ARENA_HALF.y)
	var elite := elapsed > 45.0 and rng.randf() < 0.14
	enemies.append({
		"pos": pos,
		"hp": C.ELITE_HP if elite else C.ENEMY_HP,
		"max_hp": C.ELITE_HP if elite else C.ENEMY_HP,
		"radius": 12.0 if elite else 8.0,
		"speed": C.ELITE_SPEED if elite else C.ENEMY_SPEED,
		"elite": elite,
	})

func update_enemies(delta: float, player_pos: Vector2) -> float:
	var contact_damage := 0.0
	for enemy in enemies:
		var pos: Vector2 = enemy["pos"]
		var to_player := player_pos - pos
		var dist := maxf(1.0, to_player.length())
		enemy["pos"] = pos + to_player / dist * float(enemy["speed"]) * delta
		if dist < C.PLAYER_RADIUS + float(enemy["radius"]):
			contact_damage += C.ENEMY_CONTACT_DPS * delta * (1.7 if enemy["elite"] else 1.0)
	return contact_damage

func nearest_enemy(player_pos: Vector2, max_range: float) -> int:
	var best := -1
	var best_dist := max_range * max_range
	for i in range(enemies.size()):
		var dist := player_pos.distance_squared_to(enemies[i]["pos"])
		if dist < best_dist:
			best_dist = dist
			best = i
	return best

func damage_enemy(index: int, damage: float) -> Array[Vector2]:
	if index < 0 or index >= enemies.size():
		var dead_positions: Array[Vector2] = []
		return dead_positions
	enemies[index]["hp"] = float(enemies[index]["hp"]) - damage
	return cleanup_dead()

func cleanup_dead() -> Array[Vector2]:
	var dead_positions: Array[Vector2] = []
	for i in range(enemies.size() - 1, -1, -1):
		if float(enemies[i]["hp"]) <= 0.0:
			dead_positions.append(Vector2(enemies[i]["pos"]))
			enemies.remove_at(i)
	return dead_positions

func clear() -> void:
	enemies.clear()
	spawn_timer = 0.0
