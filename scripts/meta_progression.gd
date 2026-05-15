extends RefCounted

const TRACE_TORN_AD_FLYER := "torn_ad_flyer"
const TRACE_CAMPAIGN_CORE_FRAGMENT := "campaign_core_fragment"
const UPGRADE_CORE_SIGNAL_READING := "core_signal_reading"

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
	{
		"id": UPGRADE_CORE_SIGNAL_READING,
		"name": "코어 신호 판독",
		"cost": 1,
		"trace": TRACE_CAMPAIGN_CORE_FRAGMENT,
		"trace_label": "파편",
		"effect_text": "보스 코어 노출 +0.2초",
		"auto_damage_bonus": 0.0,
		"charge_damage_bonus": 0.0,
		"max_hp_bonus": 0.0,
		"core_expose_bonus": 0.2,
		"max_level": 1,
	},
]

var traces := {
	TRACE_TORN_AD_FLYER: 0,
	TRACE_CAMPAIGN_CORE_FRAGMENT: 0,
}
var upgrades := {}
var awarded_flags := {}
var boss_analysis_level := 0

func grant_first_recall_trace() -> bool:
	if bool(awarded_flags.get("first_recall", false)):
		return false
	awarded_flags["first_recall"] = true
	traces[TRACE_TORN_AD_FLYER] = int(traces.get(TRACE_TORN_AD_FLYER, 0)) + 1
	return true

func record_boss_recall(boss_hp_ratio: float) -> Dictionary:
	var fragment_awarded := false
	if not bool(awarded_flags.get("first_boss_recall", false)):
		awarded_flags["first_boss_recall"] = true
		traces[TRACE_CAMPAIGN_CORE_FRAGMENT] = int(traces.get(TRACE_CAMPAIGN_CORE_FRAGMENT, 0)) + 1
		fragment_awarded = true
	var target_level := 1
	if boss_hp_ratio <= 0.65:
		target_level = 2
	if boss_hp_ratio <= 0.25:
		target_level = 3
	var before := boss_analysis_level
	boss_analysis_level = maxi(boss_analysis_level, target_level)
	return {
		"fragment_awarded": fragment_awarded,
		"analysis_before": before,
		"analysis_after": boss_analysis_level,
		"analysis_gained": maxi(0, boss_analysis_level - before),
	}

func upgrade_defs() -> Array:
	return UPGRADES

func can_buy(upgrade_id: String) -> bool:
	var upgrade := upgrade_by_id(upgrade_id)
	if upgrade.is_empty():
		return false
	var max_level := int(upgrade.get("max_level", 999))
	if int(upgrades.get(upgrade_id, 0)) >= max_level:
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
		"core_expose_bonus": 0.0,
	}
	for upgrade in UPGRADES:
		var level := int(upgrades.get(String(upgrade["id"]), 0))
		if level <= 0:
			continue
		result["auto_damage_bonus"] = float(result["auto_damage_bonus"]) + float(upgrade.get("auto_damage_bonus", 0.0)) * level
		result["charge_damage_bonus"] = float(result["charge_damage_bonus"]) + float(upgrade.get("charge_damage_bonus", 0.0)) * level
		result["max_hp_bonus"] = float(result["max_hp_bonus"]) + float(upgrade.get("max_hp_bonus", 0.0)) * level
		result["core_expose_bonus"] = float(result["core_expose_bonus"]) + float(upgrade.get("core_expose_bonus", 0.0)) * level
	return result

func core_expose_bonus() -> float:
	return float(bonuses().get("core_expose_bonus", 0.0))

func trace_count(trace_id: String = TRACE_TORN_AD_FLYER) -> int:
	return int(traces.get(trace_id, 0))

func trace_label() -> String:
	return "찢어진 광고 전단 %d개" % trace_count()

func held_trace_label() -> String:
	return "보유 흔적: 찢어진 광고 전단 %d개   캠페인 코어 파편 %d개" % [
		trace_count(),
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
	]

func upgrade_level(upgrade_id: String) -> int:
	return int(upgrades.get(upgrade_id, 0))

func has_any_upgrade() -> bool:
	for upgrade_id in upgrades.keys():
		if int(upgrades.get(upgrade_id, 0)) > 0:
			return true
	return false

func boss_analysis_summary() -> String:
	return "보스 분석: %d/3   캠페인 코어 파편: %d" % [
		boss_analysis_level,
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
	]

func boss_hint() -> String:
	if boss_analysis_level <= 0:
		return "다음 조우 힌트: 보스 신호를 다시 추적하세요"
	if boss_analysis_level == 1:
		return "다음 조우 힌트: 코어 노출 중 방향집중 차징"
	if boss_analysis_level == 2:
		return "다음 조우 힌트: 방패/왜곡 상태를 구분하세요"
	return "다음 조우 힌트: 깊은 체력 구간의 패턴 연결을 보세요"

func boss_weakness_label() -> String:
	if boss_analysis_level >= 2:
		return "확인된 약점: 방패 파괴 후 코어 노출"
	return "확인된 약점: 코어 노출 중 방향집중 차징"

func upgrade_summary_lines() -> Array[String]:
	var bonus := bonuses()
	return [
		"일반공격 +%s" % _fmt_bonus(float(bonus["auto_damage_bonus"])),
		"차징 +%s" % _fmt_bonus(float(bonus["charge_damage_bonus"])),
		"최대 HP +%s" % _fmt_bonus(float(bonus["max_hp_bonus"])),
	]

func upgrade_summary() -> String:
	var bonus := bonuses()
	return "auto+%s / charge+%s / hp+%s / core+%ss" % [
		_fmt_bonus(float(bonus["auto_damage_bonus"])),
		_fmt_bonus(float(bonus["charge_damage_bonus"])),
		_fmt_bonus(float(bonus["max_hp_bonus"])),
		_fmt_bonus(float(bonus["core_expose_bonus"])),
	]

func _fmt_bonus(value: float) -> String:
	if absf(value - roundf(value)) < 0.001:
		return str(int(roundf(value)))
	return "%.1f" % value
