extends RefCounted

const TRACE_TORN_AD_FLYER := "torn_ad_flyer"

const UPGRADES := [
	{
		"id": "decode_ad_afterimage",
		"name": "광고 잔상 해독",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "일반공격 피해 +1",
		"auto_damage_bonus": 1.0,
		"charge_damage_bonus": 0.0,
		"max_hp_bonus": 0.0,
	},
	{
		"id": "manual_broadcast_stabilizer",
		"name": "수동 송출 안정화",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "차징 피해 +2",
		"auto_damage_bonus": 0.0,
		"charge_damage_bonus": 2.0,
		"max_hp_bonus": 0.0,
	},
	{
		"id": "depot_first_aid",
		"name": "보급소 응급처치",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "최대 HP +5",
		"auto_damage_bonus": 0.0,
		"charge_damage_bonus": 0.0,
		"max_hp_bonus": 5.0,
	},
]

var traces := {
	TRACE_TORN_AD_FLYER: 0,
}
var upgrades := {}
var awarded_flags := {}

func grant_first_recall_trace() -> bool:
	if bool(awarded_flags.get("first_recall", false)):
		return false
	awarded_flags["first_recall"] = true
	traces[TRACE_TORN_AD_FLYER] = int(traces.get(TRACE_TORN_AD_FLYER, 0)) + 1
	return true

func upgrade_defs() -> Array:
	return UPGRADES

func can_buy(upgrade_id: String) -> bool:
	var upgrade := upgrade_by_id(upgrade_id)
	if upgrade.is_empty():
		return false
	var trace_id := String(upgrade.get("trace", TRACE_TORN_AD_FLYER))
	var cost := int(upgrade.get("cost", 1))
	return int(traces.get(trace_id, 0)) >= cost

func buy(upgrade_id: String) -> bool:
	if not can_buy(upgrade_id):
		return false
	var upgrade := upgrade_by_id(upgrade_id)
	var trace_id := String(upgrade.get("trace", TRACE_TORN_AD_FLYER))
	var cost := int(upgrade.get("cost", 1))
	traces[trace_id] = int(traces.get(trace_id, 0)) - cost
	upgrades[upgrade_id] = int(upgrades.get(upgrade_id, 0)) + 1
	return true

func upgrade_by_id(upgrade_id: String) -> Dictionary:
	for upgrade in UPGRADES:
		if String(upgrade["id"]) == upgrade_id:
			return upgrade
	return {}

func bonuses() -> Dictionary:
	var result := {
		"auto_damage_bonus": 0.0,
		"charge_damage_bonus": 0.0,
		"max_hp_bonus": 0.0,
	}
	for upgrade in UPGRADES:
		var level := int(upgrades.get(String(upgrade["id"]), 0))
		if level <= 0:
			continue
		result["auto_damage_bonus"] = float(result["auto_damage_bonus"]) + float(upgrade.get("auto_damage_bonus", 0.0)) * level
		result["charge_damage_bonus"] = float(result["charge_damage_bonus"]) + float(upgrade.get("charge_damage_bonus", 0.0)) * level
		result["max_hp_bonus"] = float(result["max_hp_bonus"]) + float(upgrade.get("max_hp_bonus", 0.0)) * level
	return result

func trace_count(trace_id: String = TRACE_TORN_AD_FLYER) -> int:
	return int(traces.get(trace_id, 0))

func trace_label() -> String:
	return "찢어진 광고 전단 %d개" % trace_count()

func upgrade_summary() -> String:
	var bonus := bonuses()
	return "auto+%s / charge+%s / hp+%s" % [
		_fmt_bonus(float(bonus["auto_damage_bonus"])),
		_fmt_bonus(float(bonus["charge_damage_bonus"])),
		_fmt_bonus(float(bonus["max_hp_bonus"])),
	]

func _fmt_bonus(value: float) -> String:
	if absf(value - roundf(value)) < 0.001:
		return str(int(roundf(value)))
	return "%.1f" % value
