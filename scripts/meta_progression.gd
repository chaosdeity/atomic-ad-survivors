extends RefCounted

const LocalResponseState := preload("res://scripts/local_response_state.gd")

const TRACE_TORN_AD_FLYER := "torn_ad_flyer"
const TRACE_CAMPAIGN_CORE_FRAGMENT := "campaign_core_fragment"
const TICKET_FOOD := "food"
const TICKET_POWER := "power"
const TICKET_SIGNAL := "signal"
const TICKET_IDS := [TICKET_FOOD, TICKET_POWER, TICKET_SIGNAL]
const TICKET_LABELS := {
	TICKET_FOOD: "식량태그",
	TICKET_POWER: "충전태그",
	TICKET_SIGNAL: "수신태그",
}
const ALLOCATION_HUMAN_ZONE := "human_zone"
const ALLOCATION_ROBOT_MAINTENANCE := "robot_maintenance"
const ALLOCATION_SIGNAL_BOARD := "signal_board"
const UPGRADE_CORE_SIGNAL_READING := "core_signal_reading"
const NPC_MINA := "mina"
const NPC_DOYUN := "doyun"
const NPC_POPSY := "popsy"
const NPC_SEVEN := "seven"
const NPC_BOKHEE := "bokhee"
const NPC_LABELS := {
	NPC_MINA: "미나",
	NPC_DOYUN: "도윤",
	NPC_POPSY: "팝시",
	NPC_SEVEN: "세븐",
	NPC_BOKHEE: "복희",
}
const SMILE_HOME_OUTCOME_NONE := ""
const SMILE_HOME_OUTCOME_DESTROY_NODE := "destroy_node"
const SMILE_HOME_OUTCOME_EXTRACT_MEMORY := "extract_memory"
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
		"effect_text": "처리 XP +8%",
		"category": "성장/XP",
		"max_level": 2,
		"xp_gain_mult": 0.08,
	},
	{
		"id": "recall_growth_routine",
		"name": "회수 후 복기 루틴",
		"cost": 1,
		"trace": TRACE_TORN_AD_FLYER,
		"effect_text": "첫 회수 이후 처리 XP +10%",
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
		"effect_text": "일반 전단 정산 후보가 있으면 전단 +1",
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
var ration_tickets := {
	TICKET_FOOD: 0,
	TICKET_POWER: 0,
	TICKET_SIGNAL: 0,
}
var ticket_allocations := {
	ALLOCATION_HUMAN_ZONE: 0,
	ALLOCATION_ROBOT_MAINTENANCE: 0,
	ALLOCATION_SIGNAL_BOARD: 0,
}
var signal_clues := {}
var upgrades := {}
var awarded_flags := {}
var boss_analysis_level := 0
var boss_clear_count := 0
var smile_home_boss_outcome := SMILE_HOME_OUTCOME_NONE
var last_allocation_id := ""
var outpost_event_log: Array[Dictionary] = []
var outpost_event_serial := 0
var last_outpost_npc_id := ""
var local_response_state := LocalResponseState.new()

func grant_first_recall_trace() -> bool:
	if bool(awarded_flags.get("first_recall", false)):
		return false
	awarded_flags["first_recall"] = true
	traces[TRACE_TORN_AD_FLYER] = int(traces.get(TRACE_TORN_AD_FLYER, 0)) + 1
	_record_outpost_event(NPC_MINA, "first_recall", "네 이름, 아직 멀쩡하지? 그럼 오늘은 충분히 이긴 거야.", "recovery_platform")
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
	if boss_analysis_level > before:
		_record_outpost_event(NPC_DOYUN, "boss_recall", "스마일 홈 심사관 절차가 한 겹 벗겨졌어. 다음엔 더 정확히 찌를 수 있다.", "charging_tuner")
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
	_record_outpost_event(NPC_SEVEN, "boss_victory", "스마일 홈 결절 처리 기록을 고정했습니다. 삭제하지 않습니다.", "sortie_board")
	return {
		"first_clear": first_clear,
		"fragments_awarded": fragments,
		"analysis_before": before,
		"analysis_after": boss_analysis_level,
		"clear_count": boss_clear_count,
	}

func set_smile_home_boss_outcome(outcome: String) -> bool:
	if not _is_valid_smile_home_boss_outcome(outcome):
		return false
	if smile_home_boss_outcome == outcome:
		return true
	smile_home_boss_outcome = outcome
	local_response_state.set_r01_boss_outcome(outcome)
	match outcome:
		SMILE_HOME_OUTCOME_DESTROY_NODE:
			_record_outpost_event(NPC_DOYUN, "boss_outcome", "결절음이 줄었습니다. 좋은 소식인데, 좋은 소리인지는 따로 봐야 합니다.", "charging_tuner")
		SMILE_HOME_OUTCOME_EXTRACT_MEMORY:
			_record_outpost_event(NPC_BOKHEE, "boss_outcome", "사진 뒤쪽에서 이름이 아니라 길이 나왔구나. 이상해도 버리지 말자.", "name_archive")
	return true

func has_smile_home_boss_outcome() -> bool:
	return smile_home_boss_outcome != SMILE_HOME_OUTCOME_NONE

func smile_home_boss_outcome_label() -> String:
	match smile_home_boss_outcome:
		SMILE_HOME_OUTCOME_DESTROY_NODE:
			return "결절 파열: 스마일 홈 심사 절차를 끊어냈습니다."
		SMILE_HOME_OUTCOME_EXTRACT_MEMORY:
			return "기억 추출: 가족사진 뒤편의 기억을 보급소로 가져왔습니다."
		_:
			return "스마일 홈 결절 처리 방식 선택 대기"

func _is_valid_smile_home_boss_outcome(outcome: String) -> bool:
	return outcome == SMILE_HOME_OUTCOME_NONE or outcome == SMILE_HOME_OUTCOME_DESTROY_NODE or outcome == SMILE_HOME_OUTCOME_EXTRACT_MEMORY

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
	set_r01_signal_records_found(signal_clue_count())
	if not gained.is_empty():
		_record_outpost_event(NPC_SEVEN, "signal_clue", _signal_clue_event_line(), "sortie_board")
	elif not duplicates.is_empty():
		_record_outpost_event(NPC_SEVEN, "signal_duplicate", "중복 신호는 버리지 않습니다. 같은 광고가 반복될 때는 대개 이유가 있습니다.", "sortie_board")
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

func grant_ration_ticket_settlement(settlement: Dictionary) -> Dictionary:
	var confirmed: Dictionary = settlement.get("confirmed", {})
	var approved: Dictionary = settlement.get("approved", {})
	var contaminated: Dictionary = settlement.get("contaminated", {})
	var gained := _empty_ticket_counts()
	for ticket_id in TICKET_IDS:
		var amount := int(confirmed.get(ticket_id, 0)) + int(approved.get(ticket_id, 0))
		if amount <= 0:
			continue
		ration_tickets[ticket_id] = int(ration_tickets.get(ticket_id, 0)) + amount
		gained[ticket_id] = amount
	var contamination_report := local_response_state.record_r01_contamination(contaminated)
	var gained_summary := _ticket_counts_text(gained)
	if gained_summary != "":
		_record_outpost_event(NPC_MINA, "settlement", "정산표 접었어. %s은 보급소 이름으로 보관한다." % gained_summary, "settlement_counter")
	if bool(contamination_report.get("changed", false)):
		_record_outpost_event(_contamination_npc_id(str(contamination_report.get("last_ticket", ""))), "contamination", _contamination_event_line(contamination_report), "settlement_counter")
	return {
		"gained": gained,
		"summary": gained_summary,
		"contamination_report": contamination_report,
	}

func can_allocate_ticket(allocation_id: String) -> bool:
	return ticket_count(_allocation_ticket_id(allocation_id)) > 0

func allocate_ticket(allocation_id: String) -> bool:
	var ticket_id := _allocation_ticket_id(allocation_id)
	if ticket_id == "" or ticket_count(ticket_id) <= 0:
		return false
	ration_tickets[ticket_id] = ticket_count(ticket_id) - 1
	ticket_allocations[allocation_id] = int(ticket_allocations.get(allocation_id, 0)) + 1
	last_allocation_id = allocation_id
	_record_outpost_event(_allocation_npc_id(allocation_id), "allocation", _allocation_reaction_line(allocation_id, allocation_count(allocation_id), true), _allocation_facility_id(allocation_id))
	return true

func ticket_count(ticket_id: String) -> int:
	return int(ration_tickets.get(ticket_id, 0))

func allocation_count(allocation_id: String) -> int:
	return int(ticket_allocations.get(allocation_id, 0))

func ration_ticket_summary() -> String:
	return "태그 식량%d 충전%d 수신%d" % [
		ticket_count(TICKET_FOOD),
		ticket_count(TICKET_POWER),
		ticket_count(TICKET_SIGNAL),
	]

func allocation_summary_short() -> String:
	return "배분 인간%d 정비%d 게시%d" % [
		allocation_count(ALLOCATION_HUMAN_ZONE),
		allocation_count(ALLOCATION_ROBOT_MAINTENANCE),
		allocation_count(ALLOCATION_SIGNAL_BOARD),
	]

func next_run_change_summary() -> String:
	var changes: Array[String] = []
	if allocation_count(ALLOCATION_HUMAN_ZONE) > 0:
		changes.append("인간 구역 지원으로 최대 HP +%d" % int(_allocation_max_hp_bonus()))
	if allocation_count(ALLOCATION_ROBOT_MAINTENANCE) > 0:
		changes.append("정비대 전원으로 차징 %.2f초 단축" % absf(_allocation_charge_period_bonus()))
	if allocation_count(ALLOCATION_SIGNAL_BOARD) > 0:
		changes.append("수신태그 고정으로 오픈하우스 기준 %.0f초 완화" % _allocation_signal_threshold_reduction())
	if changes.is_empty():
		return "배분 효과 없음"
	return " / ".join(changes)

func signal_board_level() -> int:
	return allocation_count(ALLOCATION_SIGNAL_BOARD)

func signal_board_guidance_line() -> String:
	var level := signal_board_level()
	if level >= 3:
		return "게시판: 모델하우스 결절 핀이 먼저 깜박입니다."
	if level >= 2:
		return "게시판: 오픈하우스에서 모델하우스로 이어지는 경로선이 표시됩니다."
	if level >= 1:
		return "게시판: 오픈하우스 거리 방향 핀이 표시됩니다."
	return "게시판: 모델하우스 방향을 아직 붙잡지 못합니다."

func allocation_preview_line(allocation_id: String) -> String:
	match allocation_id:
		ALLOCATION_HUMAN_ZONE:
			return "반응: 인간 구역의 조명이 조금 늦게 꺼집니다."
		ALLOCATION_ROBOT_MAINTENANCE:
			return "반응: 정비대의 꺼진 팔 하나가 다시 움직입니다."
		ALLOCATION_SIGNAL_BOARD:
			return "반응: 출격 게시판에 새 핀이 꽂힙니다."
		_:
			return ""

func last_allocation_reaction() -> String:
	if last_allocation_id == "":
		return ""
	return _allocation_reaction_line(last_allocation_id, allocation_count(last_allocation_id), true)

func allocation_reaction_summary() -> String:
	var lines := allocation_reaction_lines(2)
	if lines.is_empty():
		return "보급소는 아직 표를 기다리고 있습니다."
	return " / ".join(lines)

func allocation_reaction_lines(max_lines: int = 3) -> Array[String]:
	var lines: Array[String] = []
	if allocation_count(ALLOCATION_HUMAN_ZONE) > 0:
		lines.append(_allocation_reaction_line(ALLOCATION_HUMAN_ZONE, allocation_count(ALLOCATION_HUMAN_ZONE), false))
	if allocation_count(ALLOCATION_ROBOT_MAINTENANCE) > 0:
		lines.append(_allocation_reaction_line(ALLOCATION_ROBOT_MAINTENANCE, allocation_count(ALLOCATION_ROBOT_MAINTENANCE), false))
	if allocation_count(ALLOCATION_SIGNAL_BOARD) > 0:
		lines.append(_allocation_reaction_line(ALLOCATION_SIGNAL_BOARD, allocation_count(ALLOCATION_SIGNAL_BOARD), false))
	if lines.size() > max_lines:
		return lines.slice(0, max_lines)
	return lines

func _allocation_reaction_line(allocation_id: String, count: int, immediate: bool) -> String:
	match allocation_id:
		ALLOCATION_HUMAN_ZONE:
			if immediate:
				return "인간 구역에서 누군가 빈 그릇을 내려놓았습니다."
			if count >= 3:
				return "인간 구역은 밤새 불을 끄지 않아도 됩니다."
			if count >= 2:
				return "미나가 오늘 명단 옆에 작은 동그라미를 그립니다."
			return "인간 구역의 조명이 조금 늦게 꺼집니다."
		ALLOCATION_ROBOT_MAINTENANCE:
			if immediate:
				return "정비대의 한쪽 팔이 낮은 소리로 돌아갑니다."
			if count >= 3:
				return "정비대가 윤서의 도장 접점을 먼저 예열합니다."
			if count >= 2:
				return "팝시가 꺼지지 않고 다음 출격 시간을 묻습니다."
			return "정비대의 한쪽 팔이 다시 움직입니다."
		ALLOCATION_SIGNAL_BOARD:
			if immediate:
				return "세븐이 수신태그를 게시판 가장자리부터 고정합니다."
			if count >= 3:
				return "출격 게시판은 오픈하우스 방향을 먼저 보여줍니다."
			if count >= 2:
				return "세븐이 같은 신호를 두 번 읽고도 지우지 않습니다."
			return "출격 게시판에 새 핀이 꽂혔습니다."
		_:
			return ""

func _allocation_npc_id(allocation_id: String) -> String:
	match allocation_id:
		ALLOCATION_HUMAN_ZONE:
			return NPC_MINA
		ALLOCATION_ROBOT_MAINTENANCE:
			return NPC_POPSY
		ALLOCATION_SIGNAL_BOARD:
			return NPC_SEVEN
		_:
			return NPC_MINA

func _allocation_facility_id(allocation_id: String) -> String:
	match allocation_id:
		ALLOCATION_HUMAN_ZONE:
			return "settlement_counter"
		ALLOCATION_ROBOT_MAINTENANCE:
			return "maintenance_bench"
		ALLOCATION_SIGNAL_BOARD:
			return "sortie_board"
		_:
			return ""

func _signal_clue_event_line() -> String:
	var count := signal_clue_count()
	if count >= SIGNAL_CLUES.size():
		return "스마일 홈 심사관 접근 절차가 완성됐습니다. 삭제 권고는 보류합니다."
	if count >= 2:
		return "두 번째 신호가 첫 번째 신호와 같은 방향을 가리킵니다. 우연 판정은 취소합니다."
	return "첫 신호 기록을 게시판에 고정합니다. 버리면 안 되는 잡음입니다."

func _contamination_npc_id(ticket_id: String) -> String:
	match ticket_id:
		TICKET_SIGNAL:
			return NPC_SEVEN
		TICKET_POWER:
			return NPC_POPSY
		TICKET_FOOD:
			return NPC_MINA
		_:
			return NPC_BOKHEE

func _contamination_event_line(contamination_report: Dictionary) -> String:
	match str(contamination_report.get("last_ticket", "")):
		TICKET_SIGNAL:
			return "오염 신호는 지우지 않습니다. 다음 출격 기준으로 둡니다."
		TICKET_POWER:
			return "충전태그에 검수음이 남아 있어요. 제가 들을 수 있어요."
		TICKET_FOOD:
			return "먹을 수는 있어. 문제는 누가 이 표를 같이 읽었는지야."
		_:
			return "표 모서리에 작은 약관 번호가 남았습니다. 작아도 이름은 이름이야."

func _record_outpost_event(npc_id: String, kind: String, line: String, facility_id: String = "") -> void:
	if line == "":
		return
	outpost_event_serial += 1
	last_outpost_npc_id = npc_id
	outpost_event_log.append({
		"id": outpost_event_serial,
		"npc_id": npc_id,
		"npc_name": String(NPC_LABELS.get(npc_id, "보급소")),
		"kind": kind,
		"line": line,
		"facility_id": facility_id,
	})
	while outpost_event_log.size() > 10:
		outpost_event_log.pop_front()

func _format_outpost_event(event: Dictionary) -> String:
	var npc_name := str(event.get("npc_name", "보급소"))
	var line := str(event.get("line", ""))
	if line == "":
		return npc_name
	return "%s: %s" % [npc_name, line]

func r01_contamination_summary() -> String:
	return local_response_state.r01_contamination_summary()

func outpost_event_log_lines(max_lines: int = 3) -> Array[String]:
	var lines: Array[String] = []
	var count := mini(max_lines, outpost_event_log.size())
	for i in range(count):
		var event := outpost_event_log[outpost_event_log.size() - 1 - i]
		lines.append(_format_outpost_event(event))
	return lines

func outpost_event_log_summary(max_lines: int = 2) -> String:
	var lines := outpost_event_log_lines(max_lines)
	if lines.is_empty():
		return "최근 기록 없음"
	return " / ".join(lines)

func last_outpost_event_line() -> String:
	if outpost_event_log.is_empty():
		return ""
	return _format_outpost_event(outpost_event_log[outpost_event_log.size() - 1])

func last_outpost_focus_npc_id() -> String:
	return last_outpost_npc_id

func last_outpost_facility_id() -> String:
	if outpost_event_log.is_empty():
		return ""
	return String(outpost_event_log[outpost_event_log.size() - 1].get("facility_id", ""))

func record_outpost_event(npc_id: String, kind: String, line: String, facility_id: String = "") -> void:
	_record_outpost_event(npc_id, kind, line, facility_id)

func _duplicate_signal_flyer_value() -> int:
	return 1 + int(bonuses().get("duplicate_signal_flyer_bonus", 0))

func signal_clue_count() -> int:
	var count := 0
	for clue_id in SIGNAL_CLUES:
		if bool(signal_clues.get(String(clue_id), false)):
			count += 1
	return count

func record_r01_visit() -> void:
	local_response_state.record_r01_visit()

func set_r01_signal_records_found(count: int) -> void:
	local_response_state.set_r01_signal_records_found(count)

func set_r01_boss_outcome(outcome: String) -> bool:
	return set_smile_home_boss_outcome(outcome)

func record_r01_trace_choice(choice: String) -> bool:
	return local_response_state.record_r01_trace_choice(choice)

func r01_state_summary() -> Dictionary:
	local_response_state.set_r01_signal_records_found(signal_clue_count())
	local_response_state.set_r01_boss_outcome(smile_home_boss_outcome)
	return local_response_state.r01_state_summary()

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
	var facility_id := _upgrade_facility_id(upgrade)
	_record_outpost_event(NPC_DOYUN, "upgrade", "%s가 %s 항목을 출격 전 점검표에 올렸습니다." % [_facility_label(facility_id), String(upgrade.get("name", "강화"))], facility_id)
	return true

func upgrade_by_id(upgrade_id: String) -> Dictionary:
	for upgrade in UPGRADES:
		if String(upgrade["id"]) == upgrade_id:
			return upgrade
	return {}

func _upgrade_facility_id(upgrade: Dictionary) -> String:
	var category := String(upgrade.get("category", ""))
	var upgrade_name := String(upgrade.get("name", ""))
	var trace_label := String(upgrade.get("trace_label", ""))
	if trace_label == "파편" or category == "보스 대응":
		return "name_archive"
	if category == "차징" or upgrade_name.find("차징") != -1 or upgrade_name.find("코일") != -1:
		return "charging_tuner"
	if category == "신호 분석" or upgrade_name.find("신호") != -1 or upgrade_name.find("좌표") != -1:
		return "sortie_board"
	if category == "성장/XP" or upgrade_name.find("복기") != -1 or upgrade_name.find("학습") != -1:
		return "trace_storage_room"
	return "maintenance_bench"

func _facility_label(facility_id: String) -> String:
	match facility_id:
		"settlement_counter":
			return "정산 카운터"
		"maintenance_bench":
			return "정비대"
		"charging_tuner":
			return "차징 조율대"
		"name_archive":
			return "이름 보관함"
		"sortie_board":
			return "출격 게시판"
		"trace_storage_room":
			return "흔적 보관실"
		_:
			return "보급소"

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
			return "결절 분석 1/3"
		"boss_analysis_2":
			return "결절 분석 2/3"
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
		"open_house_signal_threshold_reduction": 0.0,
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
	result["max_hp_bonus"] = float(result["max_hp_bonus"]) + _allocation_max_hp_bonus()
	result["charge_damage_bonus"] = float(result["charge_damage_bonus"]) + _allocation_charge_damage_bonus()
	result["charge_period_bonus"] = float(result["charge_period_bonus"]) + _allocation_charge_period_bonus()
	result["charge_window_bonus"] = float(result["charge_window_bonus"]) + _allocation_charge_window_bonus()
	result["open_house_signal_threshold_reduction"] = _allocation_signal_threshold_reduction()
	return result

func core_expose_bonus() -> float:
	return float(bonuses().get("core_expose_bonus", 0.0))

func trace_count(trace_id: String = TRACE_TORN_AD_FLYER) -> int:
	return int(traces.get(trace_id, 0))

func trace_label() -> String:
	return "찢어진 광고 전단 %d개" % trace_count()

func held_trace_label() -> String:
	return "보유 흔적: 찢어진 광고 전단 %d개   캠페인 코어 파편 %d개   %s   %s" % [
		trace_count(),
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
		signal_clue_summary(),
		ration_ticket_summary(),
	]

func upgrade_level(upgrade_id: String) -> int:
	return int(upgrades.get(upgrade_id, 0))

func has_any_upgrade() -> bool:
	for upgrade_id in upgrades.keys():
		if int(upgrades.get(upgrade_id, 0)) > 0:
			return true
	return false

func boss_analysis_summary() -> String:
	return "결절 분석: %d/3   처리 횟수: %d   캠페인 코어 파편: %d   %s" % [
		boss_analysis_level,
		boss_clear_count,
		trace_count(TRACE_CAMPAIGN_CORE_FRAGMENT),
		signal_clue_summary(),
	]

func boss_hint() -> String:
	if boss_clear_count > 0:
		return "다음 조우 힌트: 스마일 홈 심사관 뒤편의 상위 송출 잔향을 추적하세요"
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
	return "auto+%s range+%s / charge+%s cd%s win+%ss / hp+%s xp+%s%% / core+%ss / sig-%ss" % [
		_fmt_bonus(float(bonus["auto_damage_bonus"])),
		_fmt_bonus(float(bonus["auto_range_bonus"])),
		_fmt_bonus(float(bonus["charge_damage_bonus"])),
		_fmt_bonus(float(bonus["charge_period_bonus"])),
		_fmt_bonus(float(bonus["charge_window_bonus"])),
		_fmt_bonus(float(bonus["max_hp_bonus"])),
		_fmt_bonus(float(bonus["xp_gain_mult"]) * 100.0),
		_fmt_bonus(float(bonus["core_expose_bonus"])),
		_fmt_bonus(float(bonus["open_house_signal_threshold_reduction"])),
	]

func _fmt_bonus(value: float) -> String:
	if absf(value - roundf(value)) < 0.001:
		return str(int(roundf(value)))
	return "%.1f" % value

func _empty_ticket_counts() -> Dictionary:
	return {
		TICKET_FOOD: 0,
		TICKET_POWER: 0,
		TICKET_SIGNAL: 0,
	}

func _ticket_counts_text(counts: Dictionary) -> String:
	var parts: Array[String] = []
	for ticket_id in TICKET_IDS:
		var count := int(counts.get(ticket_id, 0))
		if count > 0:
			parts.append("%s +%d" % [String(TICKET_LABELS[ticket_id]), count])
	return ", ".join(parts)

func _allocation_ticket_id(allocation_id: String) -> String:
	match allocation_id:
		ALLOCATION_HUMAN_ZONE:
			return TICKET_FOOD
		ALLOCATION_ROBOT_MAINTENANCE:
			return TICKET_POWER
		ALLOCATION_SIGNAL_BOARD:
			return TICKET_SIGNAL
		_:
			return ""

func _allocation_max_hp_bonus() -> float:
	return minf(24.0, float(allocation_count(ALLOCATION_HUMAN_ZONE)) * 8.0)

func _allocation_charge_damage_bonus() -> float:
	return minf(8.0, float(allocation_count(ALLOCATION_ROBOT_MAINTENANCE)) * 1.0)

func _allocation_charge_period_bonus() -> float:
	return -minf(0.90, float(allocation_count(ALLOCATION_ROBOT_MAINTENANCE)) * 0.15)

func _allocation_charge_window_bonus() -> float:
	return minf(0.24, float(allocation_count(ALLOCATION_ROBOT_MAINTENANCE)) * 0.04)

func _allocation_signal_threshold_reduction() -> float:
	return minf(18.0, float(allocation_count(ALLOCATION_SIGNAL_BOARD)) * 5.0)
