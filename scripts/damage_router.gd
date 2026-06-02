class_name DamageRouter
extends RefCounted

const TARGET_PLAYER = "player"
const TARGET_ENEMY = "enemy"
const TARGET_BOSS = "boss"

const DAMAGE_TYPE_AUTO = "auto"
const DAMAGE_TYPE_MANUAL = "manual"
const DAMAGE_TYPE_CHARGE = "charge"
const DAMAGE_TYPE_FOCUSED = "focused"
const DAMAGE_TYPE_BURST = "burst"
const DAMAGE_TYPE_PUDDLE = "puddle"
const DAMAGE_TYPE_CONTACT = "contact"
const DAMAGE_TYPE_THREAT = "threat"

const DEFENSE_TYPE_NORMAL = "normal"
const DEFENSE_TYPE_ANTI_AUTO = "anti_auto"
const DEFENSE_TYPE_ANTI_CHARGE = "anti_charge"
const DEFENSE_TYPE_PLATED = "plated"
const DEFENSE_TYPE_EXPOSED_CORE = "exposed_core"

const DEFENSE_MULTIPLIERS = {
	"normal": {"auto": 1.00, "manual": 1.00, "charge": 1.00, "focused": 1.00, "burst": 1.00, "puddle": 1.00, "contact": 1.00, "threat": 1.00},
	"anti_auto": {"auto": 0.58, "manual": 1.00, "charge": 1.00, "focused": 1.00, "burst": 1.08, "puddle": 1.08, "contact": 1.00, "threat": 1.00},
	"anti_charge": {"auto": 1.00, "manual": 0.78, "charge": 0.62, "focused": 0.62, "burst": 1.00, "puddle": 1.00, "contact": 1.00, "threat": 1.00},
	"plated": {"auto": 0.76, "manual": 0.76, "charge": 0.76, "focused": 0.76, "burst": 0.76, "puddle": 0.76, "contact": 1.00, "threat": 1.00},
	"exposed_core": {"auto": 0.82, "manual": 1.15, "charge": 1.00, "focused": 1.35, "burst": 1.00, "puddle": 1.00, "contact": 1.00, "threat": 1.00},
}

static func calculate_damage(request: Dictionary) -> Dictionary:
	var target_type := String(request.get("target_type", TARGET_ENEMY))
	var base_damage := float(request.get("base_damage", 0.0))
	var damage_type := String(request.get("damage_type", DAMAGE_TYPE_AUTO))
	var player_stats: Dictionary = request.get("player_stats", {})

	if target_type == TARGET_PLAYER:
		return _calc_player_damage(base_damage, damage_type, request.get("player_hp", 0.0), player_stats)
	elif target_type == TARGET_ENEMY:
		return _calc_enemy_damage(base_damage, damage_type, request.get("defender", {}), player_stats)
	elif target_type == TARGET_BOSS:
		return _calc_boss_damage(base_damage, damage_type, String(request.get("boss_state", "")), String(request.get("defense_type", DEFENSE_TYPE_NORMAL)), player_stats)

	return {"final_damage": base_damage, "multiplier": 1.0, "effectiveness": "normal"}

static func _calc_player_damage(base_amount: float, damage_type: String, player_hp: float, player_stats: Dictionary) -> Dictionary:
	var reduction := 0.0
	if player_hp <= float(player_stats.get("max_hp", 100.0)) * 0.35:
		reduction = float(player_stats.get("low_hp_damage_reduction", 0.0))
	var final_damage := base_amount * maxf(0.65, 1.0 - reduction)
	return {
		"final_damage": final_damage,
		"multiplier": maxf(0.65, 1.0 - reduction),
		"effectiveness": "reduced" if reduction > 0 else "normal",
	}

static func _calc_enemy_damage(base_damage: float, damage_type: String, enemy: Dictionary, player_stats: Dictionary) -> Dictionary:
	var defense_type := String(enemy.get("defense_type", DEFENSE_TYPE_NORMAL))
	var multiplier := damage_multiplier(defense_type, damage_type)

	# Apply meta progression bonuses (player stats vs specific enemies)
	if bool(enemy.get("elite", false)):
		multiplier *= (1.0 + float(player_stats.get("elite_damage_mult", 0.0)))

	var final_damage := base_damage * multiplier
	return {
		"final_damage": final_damage,
		"multiplier": multiplier,
		"effectiveness": damage_effectiveness(multiplier),
	}

static func _calc_boss_damage(base_damage: float, damage_type: String, boss_state: String, defense_type: String, player_stats: Dictionary) -> Dictionary:
	var multiplier := damage_multiplier(defense_type, damage_type)

	# Apply meta progression bonuses
	if boss_state == "shield":
		multiplier *= (1.0 + float(player_stats.get("boss_shield_damage_mult", 0.0)))
	elif boss_state == "core_exposed":
		multiplier *= (1.0 + float(player_stats.get("boss_core_damage_mult", 0.0)))

	var final_damage := base_damage * multiplier
	return {
		"final_damage": final_damage,
		"multiplier": multiplier,
		"effectiveness": damage_effectiveness(multiplier),
	}

static func damage_multiplier(defense_type: String, damage_type: String) -> float:
	var defense: Dictionary = DEFENSE_MULTIPLIERS.get(defense_type, DEFENSE_MULTIPLIERS[DEFENSE_TYPE_NORMAL])
	return float(defense.get(damage_type, 1.0))

static func damage_effectiveness(multiplier: float) -> String:
	if multiplier <= 0.90:
		return "reduced"
	if multiplier >= 1.10:
		return "weak"
	return "normal"
