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
		"category": "기본 전투",
		"max_level": 3,
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
		"category": "차징",
		"max_level": 3,
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
		"category": "생존",
		"max_level": 3,
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
		"category": "보스 대응",
		"auto_damage_bonus": 0.0,
		"charge_damage_bonus": 0.0,
		"max_hp_bonus": 0.0,
		"core_expose_bonus": 0.2,
		"max_level": 1,
	},
	{
		"id": "extended_auto_sights",
		"name": "자동 조준 렌즈",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "자동공격 사거리 +10",
		"category": "기본 전투",
		"max_level": 2,
		"auto_range_bonus": 10.0,
	},
	{
		"id": "elite_ad_breaker",
		"name": "엘리트 광고 해체",
		"cost": 2,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "엘리트 직접 피해 +6%",
		"category": "기본 전투",
		"max_level": 2,
		"elite_damage_mult": 0.06,
		"unlock_condition": "first_recall",
	},
	{
		"id": "cooling_charge_coil",
		"name": "냉각 차징 코일",
		"cost": 2,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "차징 쿨다운 -0.25초",
		"category": "차징",
		"max_level": 2,
		"charge_period_bonus": -0.25,
	},
	{
		"id": "wide_charge_contact",
		"name": "확장 차징 접점",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "차징 입력 윈도우 +0.08초",
		"category": "차징",
		"max_level": 2,
		"charge_window_bonus": 0.08,
	},
	{
		"id": "field_learning_notes",
		"name": "현장 학습 기록",
		"cost": 2,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "처치 XP +8%",
		"category": "성장/XP",
		"max_level": 2,
		"xp_gain_mult": 0.08,
	},
	{
		"id": "recall_growth_routine",
		"name": "회수 후 복기 루틴",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "첫 회수 이후 처치 XP +10%",
		"category": "성장/XP",
		"max_level": 1,
		"xp_gain_mult": 0.10,
		"unlock_condition": "first_recall",
	},
	{
		"id": "duplicate_signal_sorter",
		"name": "중복 신호 분류기",
		"cost": 2,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "중복 신호 단서 전환 전단 +1",
		"category": "신호 분석",
		"max_level": 1,
		"duplicate_signal_flyer_bonus": 1,
		"unlock_condition": "signal_clue_1",
	},
	{
		"id": "flyer_salvage_route",
		"name": "전단 회수 동선",
		"cost": 2,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "일반 전단 보상 후보가 있으면 전단 +1",
		"category": "신호 분석",
		"max_level": 1,
		"run_flyer_bonus": 1,
		"unlock_condition": "signal_clue_2",
	},
	{
		"id": "reinforced_recall_anchor",
		"name": "회수 앵커 보강",
		"cost": 2,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "저체력 피격 피해 -8%",
		"category": "생존",
		"max_level": 2,
		"low_hp_damage_reduction": 0.08,
		"unlock_condition": "first_recall",
	},
	{
		"id": "core_signal_reading_ii",
		"name": "코어 신호 판독 II",
		"cost": 2,
		"trace": TRACE_CAMPAIGN_CORE_FRAGMENT,
		"trace_label": "파편",
		"effect_text": "보스 코어 노출 +0.15초",
		"category": "보스 대응",
		"max_level": 1,
		"core_expose_bonus": 0.15,
		"unlock_condition": "boss_analysis_2",
	},
	{
		"id": "shield_frequency_pick",
		"name": "방패 주파수 픽업",
		"cost": 1,
		"trace": TRACE_CAMPAIGN_CORE_FRAGMENT,
		"trace_label": "파편",
		"effect_text": "보스 방패 직접 피해 +8%",
		"category": "보스 대응",
		"max_level": 2,
		"boss_shield_damage_mult": 0.08,
		"unlock_condition": "boss_analysis_1",
	},
	{
		"id": "coordinate_interlock",
		"name": "좌표 연동 해석",
		"cost": 2,
		"trace": TRACE_CAMPAIGN_CORE_FRAGMENT,
		"trace_label": "파편",
		"effect_text": "보스 코어 노출 +0.1초, 자동공격 사거리 +6",
		"category": "신호 분석",
		"max_level": 1,
		"core_expose_bonus": 0.10,
		"auto_range_bonus": 6.0,
		"unlock_condition": "all_signal_clues",
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
	var fragments_awarded := 0
	var target_level := 1
	if boss_hp_ratio <= 0.65:
		target_level = 2
		if not bool(awarded_flags.get("boss_hp_65_fragment", false)):
			awarded_flags["boss_hp_65_fragment"] = true
			fragments_awarded += 1
	if boss_hp_ratio <= 0.25:
		target_level = 3
		if not bool(awarded_flags.get("boss_hp_25_fragment", false)):
			awarded_flags["boss_hp_25_fragment"] = true
			fragments_awarded += 1
	if fragments_awarded > 0:
		traces[TRACE_CAMPAIGN_CORE_FRAGMENT] = int(traces.get(TRACE_CAMPAIGN_CORE_FRAGMENT, 0)) + fragments_awarded
	var before := boss_analysis_level
	boss_analysis_level = maxi(boss_analysis_level, target_level)
	return {
		"fragments_awarded": fragments_awarded,
		"analysis_before": before,
		"analysis_after": boss_analysis_level,
		"analysis_gained": maxi(0, boss_analysis_level - before),
	}

func record_boss_victory() -> Dictionary:
	var first_clear := boss_clear_count <= 0
	var fragments := 2
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
		traces[TRACE_TORN_AD_FLYER] = int(traces.get(TRACE_TORN_AD_FLYER, 0)) + duplicates.size() * _duplicate_signal_flyer_value()
	return {
		"gained": gained,
		"duplicates": duplicates,
		"duplicate_flyers_awarded": duplicates.size() * _duplicate_signal_flyer_value(),
		"count": signal_clue_count(),
		"required": SIGNAL_CLUES.size(),
	}

func grant_run_flyer_bonus(base_reward: int) -> int:
	if base_reward <= 0:
		return 0
	var bonus := int(bonuses().get("run_flyer_bonus", 0))
	if bonus <= 0:
		return 0
	traces[TRACE_TORN_AD_FLYER] = int(traces.get(TRACE_TORN_AD_FLYER, 0)) + bonus
	return bonus

func _duplicate_signal_flyer_value() -> int:
	return 1 + int(bonuses().get("duplicate_signal_flyer_bonus", 0))

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
	if not is_unlocked(upgrade_id):
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

func is_unlocked(upgrade_id: String) -> bool:
	var upgrade := upgrade_by_id(upgrade_id)
	if upgrade.is_empty():
		return false
	return _unlock_condition_met(String(upgrade.get("unlock_condition", "")))

func unlock_condition_label(condition: String) -> String:
	match condition:
		"first_recall":
			return "첫 회수 이후"
		"signal_clue_1":
			return "신호 단서 1개"
		"signal_clue_2":
			return "신호 단서 2개"
		"all_signal_clues":
			return "신호 단서 3개"
		"boss_analysis_1":
			return "보스 분석 1/3"
		"boss_analysis_2":
			return "보스 분석 2/3"
		"boss_clear_1":
			return "결절 처리 1회"
		_:
			return ""

func _unlock_condition_met(condition: String) -> bool:
	match condition:
		"", "none":
			return true
		"first_recall":
			return bool(awarded_flags.get("first_recall", false))
		"signal_clue_1":
			return signal_clue_count() >= 1
		"signal_clue_2":
			return signal_clue_count() >= 2
		"all_signal_clues":
			return has_all_signal_clues()
		"boss_analysis_1":
			return boss_analysis_level >= 1
		"boss_analysis_2":
			return boss_analysis_level >= 2
		"boss_clear_1":
			return boss_clear_count >= 1
		_:
			return false

func bonuses() -> Dictionary:
	var result := {
		"auto_damage_bonus": 0.0,
		"auto_range_bonus": 0.0,
		"charge_damage_bonus": 0.0,
		"charge_period_bonus": 0.0,
		"charge_window_bonus": 0.0,
		"max_hp_bonus": 0.0,
		"xp_gain_mult": 0.0,
		"core_expose_bonus": 0.0,
		"duplicate_signal_flyer_bonus": 0,
		"run_flyer_bonus": 0,
		"low_hp_damage_reduction": 0.0,
		"boss_shield_damage_mult": 0.0,
		"elite_damage_mult": 0.0,
	}
	for upgrade in UPGRADES:
		var level := int(upgrades.get(String(upgrade["id"]), 0))
		if level <= 0:
			continue
		result["auto_damage_bonus"] = float(result["auto_damage_bonus"]) + float(upgrade.get("auto_damage_bonus", 0.0)) * level
		result["auto_range_bonus"] = float(result["auto_range_bonus"]) + float(upgrade.get("auto_range_bonus", 0.0)) * level
		result["charge_damage_bonus"] = float(result["charge_damage_bonus"]) + float(upgrade.get("charge_damage_bonus", 0.0)) * level
		result["charge_period_bonus"] = float(result["charge_period_bonus"]) + float(upgrade.get("charge_period_bonus", 0.0)) * level
		result["charge_window_bonus"] = float(result["charge_window_bonus"]) + float(upgrade.get("charge_window_bonus", 0.0)) * level
		result["max_hp_bonus"] = float(result["max_hp_bonus"]) + float(upgrade.get("max_hp_bonus", 0.0)) * level
		result["xp_gain_mult"] = float(result["xp_gain_mult"]) + float(upgrade.get("xp_gain_mult", 0.0)) * level
		result["core_expose_bonus"] = float(result["core_expose_bonus"]) + float(upgrade.get("core_expose_bonus", 0.0)) * level
		result["duplicate_signal_flyer_bonus"] = int(result["duplicate_signal_flyer_bonus"]) + int(upgrade.get("duplicate_signal_flyer_bonus", 0)) * level
		result["run_flyer_bonus"] = int(result["run_flyer_bonus"]) + int(upgrade.get("run_flyer_bonus", 0)) * level
		result["low_hp_damage_reduction"] = float(result["low_hp_damage_reduction"]) + float(upgrade.get("low_hp_damage_reduction", 0.0)) * level
		result["boss_shield_damage_mult"] = float(result["boss_shield_damage_mult"]) + float(upgrade.get("boss_shield_damage_mult", 0.0)) * level
		result["elite_damage_mult"] = float(result["elite_damage_mult"]) + float(upgrade.get("elite_damage_mult", 0.0)) * level
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
	return "보스 분석: %d/3   처리 횟수: %d   캠페인 코어 파편: %d   %s" % [
		boss_analysis_level,
		boss_clear_count,
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
		signal_clue_summary(),
	]

func boss_hint() -> String:
	if boss_clear_count > 0:
		return "다음 조우 힌트: 시어머니 뒤편의 송출관 신호를 추적하세요"
	if has_all_signal_clues():
		return "다음 조우 힌트: 세 단서가 겹쳤습니다. 240초 이후 스마일 홈 결절이 드러납니다"
	if boss_analysis_level <= 0:
		return "다음 조우 힌트: 스마일 홈의 검증 절차를 다시 추적하세요"
	if boss_analysis_level == 1:
		return "다음 조우 힌트: 앞치마 아래 결절 노출 중 방향집중 차징"
	if boss_analysis_level == 2:
		return "다음 조우 힌트: 앞치마 방패와 가족 할인 압박을 구분하세요"
	return "다음 조우 힌트: 가족사진 뒤편의 송출 흔적을 보세요"

func boss_weakness_label() -> String:
	if boss_analysis_level >= 2:
		return "확인된 약점: 앞치마 방패 파괴 후 결절 노출"
	return "확인된 약점: 결절 노출 중 방향집중 차징"

func upgrade_summary_lines() -> Array[String]:
	var bonus := bonuses()
	return [
		"일반공격 +%s" % _fmt_bonus(float(bonus["auto_damage_bonus"])),
		"차징 +%s" % _fmt_bonus(float(bonus["charge_damage_bonus"])),
		"최대 HP +%s" % _fmt_bonus(float(bonus["max_hp_bonus"])),
		"XP +%s%%" % _fmt_bonus(float(bonus["xp_gain_mult"]) * 100.0),
	]

func upgrade_summary() -> String:
	var bonus := bonuses()
	return "auto+%s range+%s / charge+%s cd%s win+%ss / hp+%s xp+%s%% / core+%ss" % [
		_fmt_bonus(float(bonus["auto_damage_bonus"])),
		_fmt_bonus(float(bonus["auto_range_bonus"])),
		_fmt_bonus(float(bonus["charge_damage_bonus"])),
		_fmt_bonus(float(bonus["charge_period_bonus"])),
		_fmt_bonus(float(bonus["charge_window_bonus"])),
		_fmt_bonus(float(bonus["max_hp_bonus"])),
		_fmt_bonus(float(bonus["xp_gain_mult"]) * 100.0),
		_fmt_bonus(float(bonus["core_expose_bonus"])),
	]

func _fmt_bonus(value: float) -> String:
	if absf(value - roundf(value)) < 0.001:
		return str(int(roundf(value)))
	return "%.1f" % value
