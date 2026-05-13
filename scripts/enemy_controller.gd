extends RefCounted

const C := preload("res://scripts/game_config.gd")

const TIER1_SPRITE_KINDS := ["billboard", "appliance", "coupon"]

var enemies: Array[Dictionary] = []
var spawn_timer := 0.0

func update_spawning(delta: float, elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator, wave_params: Dictionary) -> void:
	spawn_timer -= delta
	var spawn_rate := float(wave_params["spawn_pressure"])
	if spawn_timer <= 0.0 and enemies.size() < C.ENEMY_CAP:
		spawn_timer = maxf(0.08, 1.0 / spawn_rate)
		var count := rng.randi_range(int(wave_params["spawn_count_min"]), int(wave_params["spawn_count_max"]))
		count = mini(count, C.ENEMY_CAP - enemies.size())
		for i in range(count):
			spawn_enemy(elapsed, player_pos, rng, wave_params)

func spawn_enemy(elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator, wave_params: Dictionary = {}) -> void:
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
	var elite_chance := float(wave_params.get("elite_chance", 0.14 if elapsed > 45.0 else 0.0))
	var hp_mult := float(wave_params.get("hp_mult", 1.0))
	var speed_mult := float(wave_params.get("speed_mult", 1.0))
	var contact_damage_mult := float(wave_params.get("contact_damage_mult", 1.0))
	var elite := rng.randf() < elite_chance
	var sprite_kind := "housewife"
	if not elite:
		sprite_kind = TIER1_SPRITE_KINDS[rng.randi_range(0, TIER1_SPRITE_KINDS.size() - 1)]
	enemies.append({
		"pos": pos,
		"hp": (C.ELITE_HP if elite else C.ENEMY_HP) * hp_mult,
		"max_hp": (C.ELITE_HP if elite else C.ENEMY_HP) * hp_mult,
		"radius": 12.0 if elite else 8.0,
		"speed": (C.ELITE_SPEED if elite else C.ENEMY_SPEED) * speed_mult,
		"contact_damage_mult": contact_damage_mult,
		"elite": elite,
		"sprite_kind": sprite_kind,
		"age": 0.0,
	})

func spawn_elite_group(count: int, elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator, wave_params: Dictionary) -> void:
	var params := wave_params.duplicate(true)
	params["elite_chance"] = 1.0
	params["hp_mult"] = float(params.get("hp_mult", 1.0)) * 1.35
	params["speed_mult"] = float(params.get("speed_mult", 1.0)) * 0.92
	for i in range(mini(count, C.ENEMY_CAP - enemies.size())):
		spawn_enemy(elapsed, player_pos, rng, params)

func update_enemies(delta: float, player_pos: Vector2) -> float:
	var contact_damage := 0.0
	for enemy in enemies:
		enemy["age"] = float(enemy.get("age", 0.0)) + delta
		var pos: Vector2 = enemy["pos"]
		var to_player := player_pos - pos
		var dist := maxf(1.0, to_player.length())
		enemy["pos"] = pos + to_player / dist * float(enemy["speed"]) * delta
		if dist < C.PLAYER_RADIUS + float(enemy["radius"]):
			contact_damage += C.ENEMY_CONTACT_DPS * delta * float(enemy.get("contact_damage_mult", 1.0)) * (1.7 if enemy["elite"] else 1.0)
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
