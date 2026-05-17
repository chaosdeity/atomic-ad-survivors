extends RefCounted

const TRACE_TORN_AD_FLYER := "torn_ad_flyer"
const TRACE_CAMPAIGN_CORE_FRAGMENT := "campaign_core_fragment"
const UPGRADE_CORE_SIGNAL_READING := "core_signal_reading"
const SIGNAL_CLUE_FAINT_BROADCAST_RECORD := "faint_broadcast_record"
const SIGNAL_CLUE_WARPED_BROADCAST_MAP := "warped_broadcast_map"
const SIGNAL_CLUE_BROADCAST_COORDINATE_TRACE := "broadcast_coordinate_trace"

const SIGNAL_CLUES := [
	SIGNAL_CLUE_FAINT_BROADCAST_RECORD,
	SIGNAL_CLUE_WARPED_BROADCAST_MAP,
	SIGNAL_CLUE_BROADCAST_COORDINATE_TRACE,
]

const SIGNAL_CLUE_LABELS := {
	SIGNAL_CLUE_FAINT_BROADCAST_RECORD: "미약한 방송 기록",
	SIGNAL_CLUE_WARPED_BROADCAST_MAP: "뒤틀린 방송 지도",
	SIGNAL_CLUE_BROADCAST_COORDINATE_TRACE: "방송 좌표 흔적",
}

const SIGNAL_CLUE_CANDIDATE_MAP := {
	"faint_signal": SIGNAL_CLUE_FAINT_BROADCAST_RECORD,
	"detected_signal": SIGNAL_CLUE_WARPED_BROADCAST_MAP,
	"near_signal": SIGNAL_CLUE_BROADCAST_COORDINATE_TRACE,
}

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
var signal_clues := {}
var upgrades := {}
var awarded_flags := {}
var boss_analysis_level := 0
var boss_clear_count := 0

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

func record_boss_victory() -> Dictionary:
	var first_clear := boss_clear_count <= 0
	var fragments := 2 if first_clear else 1
	boss_clear_count += 1
	traces[TRACE_CAMPAIGN_CORE_FRAGMENT] = int(traces.get(TRACE_CAMPAIGN_CORE_FRAGMENT, 0)) + fragments
	var before := boss_analysis_level
	boss_analysis_level = maxi(boss_analysis_level, 3)
	awarded_flags["first_boss_victory"] = true
	return {
		"first_clear": first_clear,
		"fragments_awarded": fragments,
		"analysis_before": before,
		"analysis_after": boss_analysis_level,
		"clear_count": boss_clear_count,
	}

func grant_signal_clue_candidates(candidates: Array) -> Dictionary:
	var gained: Array[String] = []
	var duplicates: Array[String] = []
	for candidate in candidates:
		var clue_id := String(SIGNAL_CLUE_CANDIDATE_MAP.get(str(candidate), ""))
		if clue_id == "":
			continue
		if bool(signal_clues.get(clue_id, false)):
			duplicates.append(clue_id)
			continue
		signal_clues[clue_id] = true
		gained.append(clue_id)
	if duplicates.size() > 0:
		traces[TRACE_TORN_AD_FLYER] = int(traces.get(TRACE_TORN_AD_FLYER, 0)) + duplicates.size()
	return {
		"gained": gained,
		"duplicates": duplicates,
		"duplicate_flyers_awarded": duplicates.size(),
		"count": signal_clue_count(),
		"required": SIGNAL_CLUES.size(),
	}

func signal_clue_count() -> int:
	var count := 0
	for clue_id in SIGNAL_CLUES:
		if bool(signal_clues.get(String(clue_id), false)):
			count += 1
	return count

func has_signal_clue(clue_id: String) -> bool:
	return bool(signal_clues.get(clue_id, false))

func has_all_signal_clues() -> bool:
	return signal_clue_count() >= SIGNAL_CLUES.size()

func signal_clue_labels(clue_ids: Array = []) -> Array[String]:
	var ids := clue_ids
	if ids.is_empty():
		ids = SIGNAL_CLUES
	var labels: Array[String] = []
	for clue_id in ids:
		labels.append(String(SIGNAL_CLUE_LABELS.get(str(clue_id), str(clue_id))))
	return labels

func signal_clue_summary() -> String:
	return "신호 단서: %d/%d" % [signal_clue_count(), SIGNAL_CLUES.size()]

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
	return "보유 흔적: 찢어진 광고 전단 %d개   캠페인 코어 파편 %d개   %s" % [
		trace_count(),
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
		signal_clue_summary(),
	]

func upgrade_level(upgrade_id: String) -> int:
	return int(upgrades.get(upgrade_id, 0))

func has_any_upgrade() -> bool:
	for upgrade_id in upgrades.keys():
		if int(upgrades.get(upgrade_id, 0)) > 0:
			return true
	return false

func boss_analysis_summary() -> String:
	return "보스 분석: %d/3   침묵 횟수: %d   캠페인 코어 파편: %d   %s" % [
		boss_analysis_level,
		boss_clear_count,
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
		signal_clue_summary(),
	]

func boss_hint() -> String:
	if boss_clear_count > 0:
		return "다음 조우 힌트: 침묵시킨 송출 신호를 외곽 추적에 씁니다"
	if has_all_signal_clues():
		return "다음 조우 힌트: 세 단서가 겹쳤습니다. 240초 이후 송출관을 포착할 수 있습니다"
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
