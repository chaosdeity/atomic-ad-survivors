extends RefCounted

const C := preload("res://scripts/game_config.gd")

const TIER1_SPRITE_KINDS := ["billboard", "appliance", "coupon"]
const DAMAGE_TYPE_AUTO := "auto"
const DAMAGE_TYPE_CHARGE := "charge"
const DAMAGE_TYPE_FOCUSED := "focused"
const DAMAGE_TYPE_BURST := "burst"
const DAMAGE_TYPE_PUDDLE := "puddle"
const DEFENSE_TYPE_NORMAL := "normal"
const DEFENSE_TYPE_ANTI_AUTO := "anti_auto"
const DEFENSE_TYPE_ANTI_CHARGE := "anti_charge"
const DEFENSE_TYPE_PLATED := "plated"
const DEFENSE_TYPE_EXPOSED_CORE := "exposed_core"
const ROLE_STATS := {
	"basic": {"hp": 1.0, "speed": 1.0, "radius": 8.0, "contact": 1.0, "sprite": "billboard", "defense": DEFENSE_TYPE_NORMAL},
	"fast": {"hp": 0.80, "speed": 1.55, "radius": 7.0, "contact": 0.82, "sprite": "coupon", "defense": DEFENSE_TYPE_ANTI_CHARGE},
	"tank": {"hp": 2.85, "speed": 0.62, "radius": 13.0, "contact": 1.35, "sprite": "appliance", "defense": DEFENSE_TYPE_ANTI_AUTO},
	"signal": {"hp": 1.65, "speed": 0.82, "radius": 11.0, "contact": 1.15, "sprite": "billboard", "defense": DEFENSE_TYPE_EXPOSED_CORE},
}
const ELITE_DEFENSE_TYPE := DEFENSE_TYPE_PLATED
const DEFENSE_MULTIPLIERS := {
	"normal": {"auto": 1.00, "charge": 1.00, "focused": 1.00, "burst": 1.00, "puddle": 1.00},
	"anti_auto": {"auto": 0.58, "charge": 1.00, "focused": 1.00, "burst": 1.08, "puddle": 1.08},
	"anti_charge": {"auto": 1.00, "charge": 0.62, "focused": 0.62, "burst": 1.00, "puddle": 1.00},
	"plated": {"auto": 0.76, "charge": 0.76, "focused": 0.76, "burst": 0.76, "puddle": 0.76},
	"exposed_core": {"auto": 0.82, "charge": 1.00, "focused": 1.35, "burst": 1.00, "puddle": 1.00},
}
const SIGNAL_AURA_RADIUS := 92.0
const SIGNAL_AURA_SPEED_MULT := 1.13
const PRESSURE_REPLACE_START := 150.0

var enemies: Array[Dictionary] = []
var spawn_timer := 0.0

func update_spawning(delta: float, elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator, wave_params: Dictionary) -> void:
	spawn_timer -= delta
	var spawn_rate := float(wave_params["spawn_pressure"])
	if spawn_timer > 0.0:
		return
	spawn_timer = maxf(0.07, 1.0 / spawn_rate)
	if enemies.size() >= C.ENEMY_CAP and elapsed < PRESSURE_REPLACE_START:
		return
	var count := rng.randi_range(int(wave_params["spawn_count_min"]), int(wave_params["spawn_count_max"]))
	var pressure_params := _pressure_spawn_params(wave_params, elapsed)
	var over_cap := enemies.size() + count - C.ENEMY_CAP
	if over_cap > 0:
		if elapsed < PRESSURE_REPLACE_START:
			count = mini(count, C.ENEMY_CAP - enemies.size())
		else:
			_make_room_for_pressure_spawns(over_cap, player_pos)
			count = mini(count, C.ENEMY_CAP - enemies.size())
	if count <= 0:
		return
	for i in range(count):
		spawn_enemy(elapsed, player_pos, rng, pressure_params)

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
	var role := "elite" if elite else _pick_role(rng, wave_params.get("role_weights", {"basic": 1.0}))
	var role_stats: Dictionary = ROLE_STATS.get(role, ROLE_STATS["basic"])
	var sprite_kind := "housewife"
	if not elite:
		sprite_kind = String(role_stats.get("sprite", TIER1_SPRITE_KINDS[rng.randi_range(0, TIER1_SPRITE_KINDS.size() - 1)]))
	var base_hp := C.ELITE_HP if elite else C.ENEMY_HP * float(role_stats.get("hp", 1.0))
	var base_speed := C.ELITE_SPEED if elite else C.ENEMY_SPEED * float(role_stats.get("speed", 1.0))
	enemies.append({
		"pos": pos,
		"hp": base_hp * hp_mult,
		"max_hp": base_hp * hp_mult,
		"radius": 15.0 if elite else float(role_stats.get("radius", 8.0)),
		"speed": base_speed * speed_mult,
		"contact_damage_mult": contact_damage_mult * (2.15 if elite else float(role_stats.get("contact", 1.0))),
		"elite": elite,
		"role": role,
		"defense_type": ELITE_DEFENSE_TYPE if elite else String(role_stats.get("defense", DEFENSE_TYPE_NORMAL)),
		"sprite_kind": sprite_kind,
		"age": 0.0,
		"hit_flash": 0.0,
		"hit_flash_duration": 0.12,
		"slow_timer": 0.0,
		"slow_mult": 1.0,
	})

func spawn_elite_group(count: int, elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator, wave_params: Dictionary) -> void:
	var params := wave_params.duplicate(true)
	params["elite_chance"] = 1.0
	params["hp_mult"] = float(params.get("hp_mult", 1.0)) * 1.55
	params["speed_mult"] = float(params.get("speed_mult", 1.0)) * 0.98
	params["contact_damage_mult"] = float(params.get("contact_damage_mult", 1.0)) * 1.15
	if enemies.size() + count > C.ENEMY_CAP:
		_make_room_for_pressure_spawns(enemies.size() + count - C.ENEMY_CAP, player_pos)
	for i in range(mini(count, C.ENEMY_CAP - enemies.size())):
		spawn_enemy(elapsed, player_pos, rng, params)

func _pressure_spawn_params(wave_params: Dictionary, elapsed: float) -> Dictionary:
	if elapsed < PRESSURE_REPLACE_START or enemies.size() < C.ENEMY_SOFT_CAP:
		return wave_params
	var params := wave_params.duplicate(true)
	params["elite_chance"] = minf(0.60, float(params.get("elite_chance", 0.0)) + 0.10)
	var weights: Dictionary = params.get("role_weights", {}).duplicate(true)
	weights["basic"] = maxf(0.18, float(weights.get("basic", 1.0)) - 0.16)
	weights["fast"] = float(weights.get("fast", 0.0)) + 0.05
	weights["tank"] = float(weights.get("tank", 0.0)) + 0.06
	weights["signal"] = float(weights.get("signal", 0.0)) + 0.05
	params["role_weights"] = weights
	return params

func _make_room_for_pressure_spawns(count: int, player_pos: Vector2) -> void:
	for n in range(count):
		var remove_idx := _pressure_replacement_index(player_pos)
		if remove_idx == -1:
			return
		enemies.remove_at(remove_idx)

func _pressure_replacement_index(player_pos: Vector2) -> int:
	var best_idx := -1
	var best_score := -INF
	for i in range(enemies.size()):
		var enemy := enemies[i]
		if bool(enemy.get("elite", false)) or String(enemy.get("role", "basic")) in ["tank", "signal"]:
			continue
		var dist_sq := player_pos.distance_squared_to(enemy["pos"])
		if dist_sq < 150.0 * 150.0:
			continue
		var score := dist_sq + (40000.0 if String(enemy.get("role", "basic")) == "basic" else 0.0)
		if score > best_score:
			best_score = score
			best_idx = i
	return best_idx

func update_enemies(delta: float, player_pos: Vector2) -> float:
	var contact_damage := 0.0
	var signal_positions := _signal_positions()
	for enemy in enemies:
		enemy["age"] = float(enemy.get("age", 0.0)) + delta
		enemy["hit_flash"] = maxf(0.0, float(enemy.get("hit_flash", 0.0)) - delta)
		enemy["slow_timer"] = maxf(0.0, float(enemy.get("slow_timer", 0.0)) - delta)
		var pos: Vector2 = enemy["pos"]
		var to_player := player_pos - pos
		var dist := maxf(1.0, to_player.length())
		var slow_mult := float(enemy.get("slow_mult", 1.0)) if float(enemy.get("slow_timer", 0.0)) > 0.0 else 1.0
		var aura_mult := _signal_aura_mult(enemy, signal_positions)
		enemy["aura_boosted"] = aura_mult > 1.0
		enemy["pos"] = pos + to_player / dist * float(enemy["speed"]) * slow_mult * aura_mult * delta
		if dist < C.PLAYER_RADIUS + float(enemy["radius"]):
			contact_damage += C.ENEMY_CONTACT_DPS * delta * float(enemy.get("contact_damage_mult", 1.0))
	return contact_damage

func _pick_role(rng: RandomNumberGenerator, role_weights: Variant) -> String:
	if not role_weights is Dictionary:
		return "basic"
	var weights: Dictionary = role_weights
	var total := 0.0
	for role in weights:
		total += maxf(0.0, float(weights[role]))
	if total <= 0.0:
		return "basic"
	var roll := rng.randf() * total
	var cursor := 0.0
	for role in weights:
		cursor += maxf(0.0, float(weights[role]))
		if roll <= cursor:
			return String(role)
	return "basic"

func _signal_positions() -> Array[Vector2]:
	var positions: Array[Vector2] = []
	for enemy in enemies:
		if String(enemy.get("role", "basic")) == "signal":
			positions.append(Vector2(enemy["pos"]))
	return positions

func _signal_aura_mult(enemy: Dictionary, signal_positions: Array[Vector2]) -> float:
	if String(enemy.get("role", "basic")) == "signal":
		return 1.0
	var pos: Vector2 = enemy["pos"]
	var radius_sq := SIGNAL_AURA_RADIUS * SIGNAL_AURA_RADIUS
	for signal_pos in signal_positions:
		if pos.distance_squared_to(signal_pos) <= radius_sq:
			return SIGNAL_AURA_SPEED_MULT
	return 1.0

func nearest_enemy(player_pos: Vector2, max_range: float) -> int:
	return nearest_enemy_excluding(player_pos, max_range, [])

func nearest_enemy_excluding(player_pos: Vector2, max_range: float, excluded: Array) -> int:
	var best := -1
	var best_dist := max_range * max_range
	for i in range(enemies.size()):
		if excluded.has(i):
			continue
		var dist := player_pos.distance_squared_to(enemies[i]["pos"])
		if dist < best_dist:
			best_dist = dist
			best = i
	return best

func damage_enemies_in_radius(center: Vector2, radius: float, damage: float, max_targets: int = -1, damage_type: String = DAMAGE_TYPE_BURST) -> int:
	return damage_enemies_in_radius_with_hits(center, radius, damage, max_targets, damage_type).size()

func damage_enemies_in_radius_with_hits(center: Vector2, radius: float, damage: float, max_targets: int = -1, damage_type: String = DAMAGE_TYPE_BURST) -> Array[Dictionary]:
	var hit_enemies: Array[Dictionary] = []
	var hits := 0
	var radius_sq := radius * radius
	for i in range(enemies.size()):
		if center.distance_squared_to(enemies[i]["pos"]) > radius_sq:
			continue
		var result := apply_damage(i, damage, damage_type)
		if result.is_empty():
			continue
		hit_enemies.append(result)
		hits += 1
		if max_targets > 0 and hits >= max_targets:
			break
	return hit_enemies

func mark_hit(index: int) -> void:
	if index < 0 or index >= enemies.size():
		return
	var enemy := enemies[index]
	var duration := 0.16 if bool(enemy.get("elite", false)) or String(enemy.get("role", "basic")) == "tank" else 0.11
	enemy["hit_flash"] = duration
	enemy["hit_flash_duration"] = duration

func apply_slow(index: int, duration: float, mult: float) -> void:
	if index < 0 or index >= enemies.size():
		return
	enemies[index]["slow_timer"] = maxf(float(enemies[index].get("slow_timer", 0.0)), duration)
	enemies[index]["slow_mult"] = minf(float(enemies[index].get("slow_mult", 1.0)), mult)

func knockback_enemy(index: int, dir: Vector2, distance: float) -> void:
	if index < 0 or index >= enemies.size() or dir.length_squared() <= 0.0:
		return
	var pos: Vector2 = enemies[index]["pos"] + dir.normalized() * distance
	pos.x = clampf(pos.x, -C.ARENA_HALF.x, C.ARENA_HALF.x)
	pos.y = clampf(pos.y, -C.ARENA_HALF.y, C.ARENA_HALF.y)
	enemies[index]["pos"] = pos

func apply_damage(index: int, base_damage: float, damage_type: String) -> Dictionary:
	if index < 0 or index >= enemies.size():
		return {}
	var enemy := enemies[index]
	var multiplier := damage_multiplier(String(enemy.get("defense_type", DEFENSE_TYPE_NORMAL)), damage_type)
	var final_damage := base_damage * multiplier
	enemy["hp"] = float(enemy["hp"]) - final_damage
	mark_hit(index)
	return {
		"index": index,
		"pos": Vector2(enemy["pos"]),
		"damage": final_damage,
		"base_damage": base_damage,
		"damage_type": damage_type,
		"defense_type": String(enemy.get("defense_type", DEFENSE_TYPE_NORMAL)),
		"multiplier": multiplier,
		"effectiveness": damage_effectiveness(multiplier),
	}

func damage_enemy(index: int, damage: float, damage_type: String = DAMAGE_TYPE_AUTO) -> Array[Vector2]:
	apply_damage(index, damage, damage_type)
	return cleanup_dead()

func damage_multiplier(defense_type: String, damage_type: String) -> float:
	var defense: Dictionary = DEFENSE_MULTIPLIERS.get(defense_type, DEFENSE_MULTIPLIERS[DEFENSE_TYPE_NORMAL])
	return float(defense.get(damage_type, 1.0))

func damage_effectiveness(multiplier: float) -> String:
	if multiplier <= 0.90:
		return "reduced"
	if multiplier >= 1.10:
		return "weak"
	return "normal"

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
