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
	"speaker": {"hp": 1.35, "speed": 0.72, "radius": 10.0, "contact": 0.92, "sprite": "billboard", "defense": DEFENSE_TYPE_NORMAL},
	"charger": {"hp": 1.12, "speed": 1.05, "radius": 9.0, "contact": 0.95, "sprite": "coupon", "defense": DEFENSE_TYPE_ANTI_CHARGE},
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
const SIGNAL_AURA_SPEED_MULT := 1.15
const SPEAKER_PULSE_RADIUS := 124.0
const SPEAKER_PULSE_SPEED_MULT := 1.18
const SPEAKER_PULSE_DURATION := 1.05
const SPEAKER_PULSE_COOLDOWN := 4.1
const CHARGER_TRIGGER_MIN := 62.0
const CHARGER_TRIGGER_MAX := 235.0
const CHARGER_WINDUP_DURATION := 0.58
const CHARGER_DASH_DURATION := 0.38
const CHARGER_RECOVER_DURATION := 0.68
const CHARGER_DASH_SPEED_MULT := 4.25
const CHARGER_DASH_CONTACT_MULT := 1.24
const CHARGER_COOLDOWN := 4.2
const PRESSURE_REPLACE_START := 150.0
const SEPARATION_CELL_SIZE := 30.0
const SEPARATION_PADDING := 3.5
const SEPARATION_MAX_DISTANCE := 27.0
const SEPARATION_PUSH_SPEED := 66.0
const SEPARATION_MAX_STEP := 3.25

var enemies: Array[Dictionary] = []
var spawn_timer := 0.0
var last_contact_hint := ""
var movement_bounds := Rect2(-C.ARENA_HALF, C.ARENA_HALF * 2.0)
var spawn_position_provider := Callable()
var spawn_serial := 0

func configure_world(bounds: Rect2, provider: Callable = Callable()) -> void:
	movement_bounds = bounds
	spawn_position_provider = provider

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
	var elite_chance := float(wave_params.get("elite_chance", 0.14 if elapsed > 45.0 else 0.0))
	var hp_mult := float(wave_params.get("hp_mult", 1.0))
	var speed_mult := float(wave_params.get("speed_mult", 1.0))
	var contact_damage_mult := float(wave_params.get("contact_damage_mult", 1.0))
	var elite := rng.randf() < elite_chance
	var role := "elite" if elite else _pick_role(rng, wave_params.get("role_weights", {"basic": 1.0}))
	var role_stats: Dictionary = ROLE_STATS.get(role, ROLE_STATS["basic"])
	var radius := 15.0 if elite else float(role_stats.get("radius", 8.0))
	var pos := _spawn_position(elapsed, player_pos, rng, radius, role, wave_params)
	var sprite_kind := "housewife"
	if not elite:
		sprite_kind = String(role_stats.get("sprite", TIER1_SPRITE_KINDS[rng.randi_range(0, TIER1_SPRITE_KINDS.size() - 1)]))
	var base_hp := C.ELITE_HP if elite else C.ENEMY_HP * float(role_stats.get("hp", 1.0))
	var base_speed := C.ELITE_SPEED if elite else C.ENEMY_SPEED * float(role_stats.get("speed", 1.0))
	spawn_serial += 1
	enemies.append({
		"pos": pos,
		"hp": base_hp * hp_mult,
		"max_hp": base_hp * hp_mult,
		"radius": radius,
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
		"action_state": "idle",
		"action_timer": 0.0,
		"action_cooldown": rng.randf_range(0.9, 3.6),
		"dash_dir": Vector2.ZERO,
		"speaker_pulse": 0.0,
		"speaker_cooldown": rng.randf_range(1.0, 3.8),
		"separation_seed": rng.randf_range(0.0, TAU),
		"spawn_serial": spawn_serial,
	})

func _spawn_position(elapsed: float, player_pos: Vector2, rng: RandomNumberGenerator, radius: float, role: String, wave_params: Dictionary = {}) -> Vector2:
	if spawn_position_provider.is_valid():
		var provided: Vector2 = spawn_position_provider.call(player_pos, rng, radius, role, elapsed, wave_params)
		return _clamp_to_movement_bounds(provided, radius)
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
	return _clamp_to_movement_bounds(pos, radius)

func _clamp_to_movement_bounds(pos: Vector2, radius: float) -> Vector2:
	return Vector2(
		clampf(pos.x, movement_bounds.position.x + radius, movement_bounds.position.x + movement_bounds.size.x - radius),
		clampf(pos.y, movement_bounds.position.y + radius, movement_bounds.position.y + movement_bounds.size.y - radius)
	)

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
		if bool(enemy.get("elite", false)) or String(enemy.get("role", "basic")) in ["tank", "signal", "speaker", "charger"]:
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
	last_contact_hint = ""
	for enemy in enemies:
		_update_special_action(enemy, delta, player_pos)
	var signal_positions := _signal_positions()
	var speaker_positions := _active_speaker_positions()
	for enemy in enemies:
		enemy["age"] = float(enemy.get("age", 0.0)) + delta
		enemy["hit_flash"] = maxf(0.0, float(enemy.get("hit_flash", 0.0)) - delta)
		enemy["slow_timer"] = maxf(0.0, float(enemy.get("slow_timer", 0.0)) - delta)
		var pos: Vector2 = enemy["pos"]
		var to_player := player_pos - pos
		var dist := maxf(1.0, to_player.length())
		var slow_mult := float(enemy.get("slow_mult", 1.0)) if float(enemy.get("slow_timer", 0.0)) > 0.0 else 1.0
		var aura_mult := _signal_aura_mult(enemy, signal_positions)
		var speaker_mult := _speaker_pulse_mult(enemy, speaker_positions)
		enemy["aura_boosted"] = aura_mult > 1.0 or speaker_mult > 1.0
		enemy["speaker_boosted"] = speaker_mult > 1.0
		enemy["pos"] = _next_enemy_pos(enemy, pos, to_player, dist, slow_mult, aura_mult * speaker_mult, delta)
		if dist < C.PLAYER_RADIUS + float(enemy["radius"]):
			var contact_mult := float(enemy.get("contact_damage_mult", 1.0))
			if String(enemy.get("role", "basic")) == "charger" and String(enemy.get("action_state", "idle")) == "dash":
				contact_mult *= CHARGER_DASH_CONTACT_MULT
			contact_damage += C.ENEMY_CONTACT_DPS * delta * contact_mult
			_set_contact_hint(enemy)
	return contact_damage

func apply_separation(delta: float, position_resolver: Callable = Callable()) -> void:
	var count := enemies.size()
	if count < 2:
		return
	var grid := _build_separation_grid()
	var pushes: Array[Vector2] = []
	for i in range(count):
		pushes.append(Vector2.ZERO)
	for i in range(count):
		var enemy := enemies[i]
		var pos: Vector2 = enemy["pos"]
		var cell := _separation_cell(pos)
		for ox in range(-1, 2):
			for oy in range(-1, 2):
				var neighbor_cell := Vector2i(cell.x + ox, cell.y + oy)
				if not grid.has(neighbor_cell):
					continue
				var bucket: Array = grid[neighbor_cell]
				for raw_j in bucket:
					var j := int(raw_j)
					if j <= i or j >= count:
						continue
					_apply_pair_separation(i, j, pushes)
	for i in range(count):
		var push := pushes[i]
		if push.length_squared() <= 0.0001:
			continue
		var enemy := enemies[i]
		var old_pos: Vector2 = enemy["pos"]
		var step := minf(SEPARATION_MAX_STEP, push.length() * SEPARATION_PUSH_SPEED * delta)
		if step <= 0.0:
			continue
		var proposed := _clamp_to_movement_bounds(old_pos + push.normalized() * step, float(enemy.get("radius", 8.0)))
		if position_resolver.is_valid():
			var resolved: Vector2 = position_resolver.call(old_pos, proposed, enemy)
			enemy["pos"] = _clamp_to_movement_bounds(resolved, float(enemy.get("radius", 8.0)))
		else:
			enemy["pos"] = proposed

func _build_separation_grid() -> Dictionary:
	var grid := {}
	for i in range(enemies.size()):
		var cell := _separation_cell(Vector2(enemies[i]["pos"]))
		if not grid.has(cell):
			grid[cell] = []
		var bucket: Array = grid[cell]
		bucket.append(i)
	return grid

func _separation_cell(pos: Vector2) -> Vector2i:
	return Vector2i(floori(pos.x / SEPARATION_CELL_SIZE), floori(pos.y / SEPARATION_CELL_SIZE))

func _apply_pair_separation(i: int, j: int, pushes: Array[Vector2]) -> void:
	var a := enemies[i]
	var b := enemies[j]
	var pos_a: Vector2 = a["pos"]
	var pos_b: Vector2 = b["pos"]
	var desired := _separation_distance(a, b)
	var delta_pos := pos_a - pos_b
	var dist_sq := delta_pos.length_squared()
	if dist_sq >= desired * desired:
		return
	var dist := sqrt(maxf(0.0001, dist_sq))
	var dir := delta_pos / dist
	if dist_sq <= 0.0004:
		var seed := float(a.get("separation_seed", 0.0)) + float(b.get("separation_seed", 0.0)) * 0.37
		dir = Vector2(cos(seed), sin(seed))
	var pressure := clampf((desired - dist) / desired, 0.0, 1.0)
	var mobility_a := _separation_mobility(a)
	var mobility_b := _separation_mobility(b)
	var mobility_total := maxf(0.001, mobility_a + mobility_b)
	pushes[i] += dir * pressure * (mobility_a / mobility_total)
	pushes[j] -= dir * pressure * (mobility_b / mobility_total)

func _separation_distance(a: Dictionary, b: Dictionary) -> float:
	var radius_sum := float(a.get("radius", 8.0)) + float(b.get("radius", 8.0)) + SEPARATION_PADDING
	return clampf(radius_sum, 14.0, SEPARATION_MAX_DISTANCE)

func _separation_mobility(enemy: Dictionary) -> float:
	if bool(enemy.get("elite", false)):
		return 0.42
	match String(enemy.get("role", "basic")):
		"tank":
			return 0.46
		"speaker", "signal":
			return 0.55
		"charger":
			if String(enemy.get("action_state", "idle")) == "dash":
				return 0.22
			return 0.74
		"fast":
			return 1.08
		_:
			return 1.0

func contact_hint() -> String:
	return last_contact_hint

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

func _active_speaker_positions() -> Array[Vector2]:
	var positions: Array[Vector2] = []
	for enemy in enemies:
		if String(enemy.get("role", "basic")) == "speaker" and float(enemy.get("speaker_pulse", 0.0)) > 0.0:
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

func _speaker_pulse_mult(enemy: Dictionary, speaker_positions: Array[Vector2]) -> float:
	if String(enemy.get("role", "basic")) == "speaker":
		return 1.0
	var pos: Vector2 = enemy["pos"]
	var radius_sq := SPEAKER_PULSE_RADIUS * SPEAKER_PULSE_RADIUS
	for speaker_pos in speaker_positions:
		if pos.distance_squared_to(speaker_pos) <= radius_sq:
			return SPEAKER_PULSE_SPEED_MULT
	return 1.0

func _update_special_action(enemy: Dictionary, delta: float, player_pos: Vector2) -> void:
	var role := String(enemy.get("role", "basic"))
	if role == "speaker":
		_update_speaker(enemy, delta, player_pos)
	elif role == "charger":
		_update_charger(enemy, delta, player_pos)

func _update_speaker(enemy: Dictionary, delta: float, player_pos: Vector2) -> void:
	enemy["speaker_pulse"] = maxf(0.0, float(enemy.get("speaker_pulse", 0.0)) - delta)
	enemy["speaker_cooldown"] = maxf(0.0, float(enemy.get("speaker_cooldown", 0.0)) - delta)
	if float(enemy.get("speaker_pulse", 0.0)) > 0.0:
		enemy["action_state"] = "broadcast"
		return
	enemy["action_state"] = "idle"
	if float(enemy.get("speaker_cooldown", 0.0)) > 0.0:
		return
	var pos: Vector2 = enemy["pos"]
	if pos.distance_squared_to(player_pos) > 330.0 * 330.0:
		return
	enemy["speaker_pulse"] = SPEAKER_PULSE_DURATION
	enemy["speaker_cooldown"] = SPEAKER_PULSE_COOLDOWN
	enemy["action_state"] = "broadcast"

func _update_charger(enemy: Dictionary, delta: float, player_pos: Vector2) -> void:
	var state := String(enemy.get("action_state", "idle"))
	enemy["action_timer"] = maxf(0.0, float(enemy.get("action_timer", 0.0)) - delta)
	enemy["action_cooldown"] = maxf(0.0, float(enemy.get("action_cooldown", 0.0)) - delta)
	var pos: Vector2 = enemy["pos"]
	var to_player := player_pos - pos
	var dist := to_player.length()
	if state == "windup":
		if to_player.length_squared() > 0.01:
			enemy["dash_dir"] = to_player.normalized()
		if float(enemy.get("action_timer", 0.0)) <= 0.0:
			enemy["action_state"] = "dash"
			enemy["action_timer"] = CHARGER_DASH_DURATION
		return
	if state == "dash":
		if float(enemy.get("action_timer", 0.0)) <= 0.0:
			enemy["action_state"] = "recover"
			enemy["action_timer"] = CHARGER_RECOVER_DURATION
		return
	if state == "recover":
		if float(enemy.get("action_timer", 0.0)) <= 0.0:
			enemy["action_state"] = "idle"
			enemy["action_cooldown"] = CHARGER_COOLDOWN
		return
	if float(enemy.get("action_cooldown", 0.0)) > 0.0:
		return
	if dist >= CHARGER_TRIGGER_MIN and dist <= CHARGER_TRIGGER_MAX and to_player.length_squared() > 0.01:
		enemy["action_state"] = "windup"
		enemy["action_timer"] = CHARGER_WINDUP_DURATION
		enemy["dash_dir"] = to_player.normalized()

func _next_enemy_pos(enemy: Dictionary, pos: Vector2, to_player: Vector2, dist: float, slow_mult: float, aura_mult: float, delta: float) -> Vector2:
	var role := String(enemy.get("role", "basic"))
	var state := String(enemy.get("action_state", "idle"))
	var dir := to_player / dist
	var speed := float(enemy["speed"]) * slow_mult * aura_mult
	if role == "speaker" and state == "broadcast":
		speed *= 0.42
	elif role == "charger":
		if state == "windup":
			speed *= 0.12
		elif state == "dash":
			var stored_dash_dir: Vector2 = enemy.get("dash_dir", dir)
			dir = stored_dash_dir
			speed = float(enemy["speed"]) * slow_mult * CHARGER_DASH_SPEED_MULT
		elif state == "recover":
			speed *= 0.34
	var next_pos := pos + dir * speed * delta
	return _clamp_to_movement_bounds(next_pos, float(enemy.get("radius", 8.0)))

func _set_contact_hint(enemy: Dictionary) -> void:
	var role := String(enemy.get("role", "basic"))
	if role == "charger" and String(enemy.get("action_state", "idle")) == "dash":
		last_contact_hint = "돌진 충돌"
	elif last_contact_hint == "" and bool(enemy.get("speaker_boosted", false)):
		last_contact_hint = "확성기 압박"
	elif last_contact_hint == "" and bool(enemy.get("aura_boosted", false)):
		last_contact_hint = "신호 가속"

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
	enemies[index]["pos"] = _clamp_to_movement_bounds(pos, float(enemies[index].get("radius", 8.0)))

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
	last_contact_hint = ""
	spawn_serial = 0

func role_summary() -> String:
	var counts := {}
	for enemy in enemies:
		var role := "elite" if bool(enemy.get("elite", false)) else String(enemy.get("role", "basic"))
		counts[role] = int(counts.get(role, 0)) + 1
	var ordered := ["basic", "fast", "tank", "speaker", "charger", "signal", "elite"]
	var parts: Array[String] = []
	for role in ordered:
		var count := int(counts.get(role, 0))
		if count > 0:
			parts.append("%s=%d" % [role, count])
	return " ".join(parts)
