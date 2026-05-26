extends RefCounted

const MIN_GENERAL_REWARD_SECONDS := 45.0

const TIER_NONE := "none"
const TIER_WARMUP := "warmup_45"
const TIER_SURVIVED_60 := "survived_60"
const TIER_STABLE_90 := "stable_90"
const TIER_SIGNAL_120 := "signal_120"
const TIER_DEEP_180 := "deep_180"
const TIER_BOSS_ROUTE_240 := "boss_route_240"

const TIER_LABELS := {
	TIER_NONE: "정산 근거 없음",
	TIER_WARMUP: "45초 회수 후보",
	TIER_SURVIVED_60: "60초 회수 근거",
	TIER_STABLE_90: "90초 안정",
	TIER_SIGNAL_120: "120초 신호",
	TIER_DEEP_180: "180초 심층",
	TIER_BOSS_ROUTE_240: "240초 심사 접근 절차",
}
const TICKET_FOOD := "food"
const TICKET_POWER := "power"
const TICKET_SIGNAL := "signal"
const TICKET_LABELS := {
	TICKET_FOOD: "식량태그",
	TICKET_POWER: "충전태그",
	TICKET_SIGNAL: "수신태그",
}

static func evaluate_run_result(result_data: Dictionary) -> Dictionary:
	var elapsed := float(result_data.get("elapsed", 0.0))
	var match_state := String(result_data.get("match_state", "game_over"))
	var kills := int(result_data.get("kills", 0))
	var level := int(result_data.get("level", 1))
	var peak_enemy_count := int(result_data.get("peak_enemy_count", 0))
	var boss_hp_ratio := clampf(float(result_data.get("boss_hp_ratio", 1.0)), 0.0, 1.0)
	var boss_result_reason := String(result_data.get("boss_result_reason", ""))
	var first_sortie := bool(result_data.get("first_sortie", false))
	var card_counts: Dictionary = result_data.get("card_counts", {})
	var card_contributions: Array = Array(result_data.get("card_contributions", []))
	var terms_failure_risk := int(result_data.get("terms_failure_risk", 0))
	var r01_zone_times: Dictionary = result_data.get("r01_zone_times", {})
	var open_house_time := float(result_data.get("open_house_time", 0.0))
	var open_house_signal_stage := int(result_data.get("open_house_signal_stage", 0))
	var drain_pocket_time := float(r01_zone_times.get("drain_pocket_anchor", 0.0))
	var fake_return_time := float(r01_zone_times.get("fake_return_route_anchor", 0.0))
	var audit_pass_count := int(result_data.get("audit_pass_count", 0))
	var audit_fail_count := int(result_data.get("audit_fail_count", 0))
	var audit_pressure_level := int(result_data.get("audit_pressure_level", 0))
	var audit_total_processing := float(result_data.get("audit_total_processing", 0.0))
	var audit_last_result := String(result_data.get("audit_last_result", ""))
	var playtest_metrics: Dictionary = result_data.get("playtest_metrics", {})
	var open_house_processing_mult := _open_house_processing_mult(open_house_time)
	var effective_kills := int(round(float(kills) * open_house_processing_mult))
	var reward_tier := _reward_tier(elapsed)
	var general_reward_allowed := elapsed >= MIN_GENERAL_REWARD_SECONDS
	var special_reward_allowed := match_state == "boss_victory" or boss_result_reason == "boss_recall" or (match_state == "recalled" and first_sortie)
	var anti_farm_reason := ""
	if not general_reward_allowed:
		anti_farm_reason = "%.0f초 미만 런은 일반 정산 후보가 열리지 않습니다." % MIN_GENERAL_REWARD_SECONDS

	var torn_ad_flyer_reward := _torn_ad_flyer_reward(reward_tier, effective_kills, level, peak_enemy_count) if general_reward_allowed else 0
	var campaign_core_fragment_reward := _campaign_core_fragment_reward(match_state, boss_result_reason, boss_hp_ratio)
	var signal_clue_candidates := _signal_clue_candidates(elapsed, boss_result_reason, boss_hp_ratio, open_house_time, open_house_signal_stage)
	var ration_settlement := _ration_ticket_settlement(
		elapsed,
		match_state,
		kills,
		level,
		effective_kills,
		open_house_time,
		open_house_signal_stage,
		drain_pocket_time,
		fake_return_time,
		audit_pass_count,
		audit_fail_count,
		audit_pressure_level,
		audit_total_processing,
		card_counts,
		terms_failure_risk,
		general_reward_allowed
	)
	var reward_lines := _reward_lines(
		reward_tier,
		general_reward_allowed,
		torn_ad_flyer_reward,
		campaign_core_fragment_reward,
		signal_clue_candidates,
		ration_settlement,
		card_contributions,
		card_counts,
		terms_failure_risk,
		open_house_time,
		open_house_signal_stage,
		drain_pocket_time,
		fake_return_time,
		open_house_processing_mult,
		kills,
		effective_kills,
		audit_pass_count,
		audit_fail_count,
		audit_pressure_level,
		audit_total_processing,
		audit_last_result,
		anti_farm_reason,
		boss_result_reason,
		boss_hp_ratio
	)
	for line in _playtest_metric_lines(playtest_metrics):
		reward_lines.append(line)

	return {
		"reward_allowed": general_reward_allowed or special_reward_allowed,
		"reward_tier": reward_tier,
		"torn_ad_flyer_reward": torn_ad_flyer_reward,
		"campaign_core_fragment_reward": campaign_core_fragment_reward,
		"signal_clue_candidates": signal_clue_candidates,
		"ration_ticket_settlement": ration_settlement,
		"reward_lines": reward_lines,
		"anti_farm_reason": anti_farm_reason,
		"card_contributions": card_contributions,
		"open_house_time": open_house_time,
		"open_house_signal_stage": open_house_signal_stage,
		"drain_pocket_time": drain_pocket_time,
		"fake_return_time": fake_return_time,
		"open_house_processing_mult": open_house_processing_mult,
		"effective_kills": effective_kills,
		"audit_pass_count": audit_pass_count,
		"audit_fail_count": audit_fail_count,
		"audit_pressure_level": audit_pressure_level,
		"audit_total_processing": audit_total_processing,
		"playtest_metrics": playtest_metrics,
		"playtest_score": int(playtest_metrics.get("first_5_score", 0)),
		"playtest_target_count": int(playtest_metrics.get("first_5_target_count", 7)),
	}

static func _reward_tier(elapsed: float) -> String:
	if elapsed >= 240.0:
		return TIER_BOSS_ROUTE_240
	if elapsed >= 180.0:
		return TIER_DEEP_180
	if elapsed >= 120.0:
		return TIER_SIGNAL_120
	if elapsed >= 90.0:
		return TIER_STABLE_90
	if elapsed >= 60.0:
		return TIER_SURVIVED_60
	if elapsed >= MIN_GENERAL_REWARD_SECONDS:
		return TIER_WARMUP
	return TIER_NONE

static func _torn_ad_flyer_reward(reward_tier: String, kills: int, level: int, peak_enemy_count: int) -> int:
	var reward := 0
	match reward_tier:
		TIER_SURVIVED_60:
			reward = 1
		TIER_STABLE_90:
			reward = 1
		TIER_SIGNAL_120:
			reward = 2
		TIER_DEEP_180:
			reward = 2
		TIER_BOSS_ROUTE_240:
			reward = 3
	if kills >= 80:
		reward += 1
	if level >= 6:
		reward += 1
	if peak_enemy_count >= 90:
		reward += 1
	return reward

static func _campaign_core_fragment_reward(match_state: String, boss_result_reason: String, boss_hp_ratio: float) -> int:
	if match_state == "boss_victory":
		return 2
	var reward := 0
	if boss_result_reason == "boss_recall" and boss_hp_ratio <= 0.65:
		reward += 1
	if boss_result_reason == "boss_recall" and boss_hp_ratio <= 0.25:
		reward += 1
	return reward

static func _ration_ticket_settlement(
	elapsed: float,
	match_state: String,
	kills: int,
	level: int,
	effective_kills: int,
	open_house_time: float,
	open_house_signal_stage: int,
	drain_pocket_time: float,
	fake_return_time: float,
	audit_pass_count: int,
	audit_fail_count: int,
	audit_pressure_level: int,
	audit_total_processing: float,
	card_counts: Dictionary,
	terms_failure_risk: int,
	general_reward_allowed: bool
) -> Dictionary:
	var confirmed := _empty_ticket_counts()
	var candidates := _empty_ticket_counts()
	var reasons: Array[String] = []
	if elapsed >= 90.0:
		confirmed[TICKET_FOOD] += 1
		reasons.append("90초 이상 체류: 식량태그 1장 확정")
	if not general_reward_allowed:
		return {
			"confirmed": confirmed,
			"candidates": candidates,
			"approved": _empty_ticket_counts(),
			"held": _empty_ticket_counts(),
			"contaminated": _empty_ticket_counts(),
			"downgraded": _empty_ticket_counts(),
			"approval_scores": {},
			"reason_lines": reasons,
			"contamination_lines": [],
		}

	if elapsed >= 120.0 or int(card_counts.get("earn_overtime_sheet", 0)) > 0:
		candidates[TICKET_FOOD] += 1
		reasons.append("체류/야근 정산: 식량태그 후보 +1")
	if int(card_counts.get("earn_overtime_sheet", 0)) > 0 and audit_pass_count >= 2:
		candidates[TICKET_FOOD] += 1
		reasons.append("야근 정산표 + 감사 통과: 식량태그 후보 +1")
	if int(card_counts.get("earn_low_hp_allowance", 0)) > 0 and (audit_fail_count > 0 or audit_total_processing >= 900.0):
		candidates[TICKET_FOOD] += 1
		reasons.append("저체력 근무수당: 식량태그 후보 +1")
	if fake_return_time >= 20.0:
		candidates[TICKET_FOOD] += 1
		reasons.append("끊긴 광고 산책로 체류: 식량태그 후보 +1")

	if effective_kills >= 55 or int(card_counts.get("earn_battery_receipt", 0)) > 0:
		candidates[TICKET_POWER] += 1
		reasons.append("광고 로봇 처리 정산: 충전태그 후보 +1")
	if int(card_counts.get("earn_battery_receipt", 0)) > 0 and effective_kills >= 90:
		candidates[TICKET_POWER] += 1
		reasons.append("배터리 절약 영수증: 충전태그 후보 +1")
	if int(card_counts.get("tool_robot_command_flip", 0)) > 0 and audit_pass_count >= 2:
		candidates[TICKET_POWER] += 1
		reasons.append("로봇 명령 뒤집기: 충전태그 후보 +1")

	if open_house_signal_stage >= 1 or open_house_time >= 25.0:
		candidates[TICKET_SIGNAL] += 1
		reasons.append("오픈하우스 신호 1단계: 수신태그 후보 +1")
	if open_house_signal_stage >= 2 or open_house_time >= 50.0:
		candidates[TICKET_SIGNAL] += 1
		reasons.append("오픈하우스 신호 2단계: 수신태그 후보 +1")
	if int(card_counts.get("earn_open_house_checkin", 0)) > 0 and (open_house_signal_stage >= 1 or open_house_time >= 25.0):
		candidates[TICKET_SIGNAL] += 1
		reasons.append("오픈하우스 방문 확인: 수신태그 후보 +1")
	if level >= 6 and audit_pass_count >= 3:
		candidates[TICKET_SIGNAL] += 1
		reasons.append("감사 통과 누적: 수신태그 후보 +1")
	if drain_pocket_time >= 20.0:
		candidates[TICKET_SIGNAL] += 1
		reasons.append("배수로 침묵 주머니 체류: 수신태그 후보 +1")

	var downgraded := _empty_ticket_counts()
	var failed_with_terms := (match_state == "game_over" or match_state == "recalled") and terms_failure_risk > 0
	if failed_with_terms and int(confirmed[TICKET_FOOD]) > 0:
		confirmed[TICKET_FOOD] -= 1
		candidates[TICKET_FOOD] += 1
		downgraded[TICKET_FOOD] += 1
		reasons.append("반품 불가 약관: 확정 식량태그 1장이 후보로 내려감")

	var approval_scores := {
		TICKET_FOOD: _ticket_approval_score(TICKET_FOOD, audit_pass_count, audit_fail_count, audit_pressure_level, card_counts, open_house_time, open_house_signal_stage, drain_pocket_time, fake_return_time, terms_failure_risk),
		TICKET_POWER: _ticket_approval_score(TICKET_POWER, audit_pass_count, audit_fail_count, audit_pressure_level, card_counts, open_house_time, open_house_signal_stage, drain_pocket_time, fake_return_time, terms_failure_risk),
		TICKET_SIGNAL: _ticket_approval_score(TICKET_SIGNAL, audit_pass_count, audit_fail_count, audit_pressure_level, card_counts, open_house_time, open_house_signal_stage, drain_pocket_time, fake_return_time, terms_failure_risk),
	}
	var approved := _empty_ticket_counts()
	var held := _empty_ticket_counts()
	var contaminated := _empty_ticket_counts()
	var contamination_lines: Array[String] = []
	for ticket_id in [TICKET_FOOD, TICKET_POWER, TICKET_SIGNAL]:
		var count := int(candidates[ticket_id])
		if count <= 0:
			continue
		var score := float(approval_scores[ticket_id])
		var approved_count := int(floor(float(count) * score + 0.20))
		if score >= 0.86:
			approved_count = count
		if score < 0.45 and terms_failure_risk > 0:
			approved_count = maxi(0, approved_count - 1)
		approved_count = clampi(approved_count, 0, count)
		approved[ticket_id] = approved_count
		held[ticket_id] = count - approved_count
		if approved_count > 0:
			var pressure_contamination: bool = audit_pressure_level >= 3 and score < 0.78
			var terms_contamination: bool = terms_failure_risk >= 2 and score < 0.82
			var signal_contamination: bool = ticket_id == TICKET_SIGNAL and (open_house_signal_stage >= 3 or open_house_time >= 75.0) and audit_pressure_level >= 1
			var fake_return_contamination: bool = ticket_id == TICKET_FOOD and fake_return_time >= 20.0 and audit_pressure_level >= 1
			if pressure_contamination or terms_contamination or signal_contamination or fake_return_contamination:
				contaminated[ticket_id] = 1
				contamination_lines.append("%s 승인에 광고 오염 꼬리표가 붙었습니다." % String(TICKET_LABELS[ticket_id]))

	return {
		"confirmed": confirmed,
		"candidates": candidates,
		"approved": approved,
		"held": held,
		"contaminated": contaminated,
		"downgraded": downgraded,
		"approval_scores": approval_scores,
		"reason_lines": reasons,
		"contamination_lines": contamination_lines,
	}

static func _empty_ticket_counts() -> Dictionary:
	return {
		TICKET_FOOD: 0,
		TICKET_POWER: 0,
		TICKET_SIGNAL: 0,
	}

static func _ticket_approval_score(ticket_id: String, audit_pass_count: int, audit_fail_count: int, audit_pressure_level: int, card_counts: Dictionary, open_house_time: float, open_house_signal_stage: int, drain_pocket_time: float, fake_return_time: float, terms_failure_risk: int) -> float:
	var score := 0.58 + 0.06 * float(audit_pass_count) - 0.07 * float(audit_fail_count) - 0.05 * float(audit_pressure_level)
	match ticket_id:
		TICKET_FOOD:
			score += 0.08 * float(card_counts.get("earn_overtime_sheet", 0))
			score += 0.04 * float(card_counts.get("earn_low_hp_allowance", 0))
			if fake_return_time >= 20.0:
				score -= 0.06
		TICKET_POWER:
			score += 0.10 * float(card_counts.get("earn_battery_receipt", 0))
			score += 0.07 * float(card_counts.get("tool_robot_command_flip", 0))
		TICKET_SIGNAL:
			if open_house_signal_stage >= 2 or open_house_time >= 50.0:
				score += 0.12
			elif open_house_signal_stage >= 1 or open_house_time >= 25.0:
				score += 0.06
			score += 0.10 * float(card_counts.get("earn_open_house_checkin", 0))
			score += 0.06 * float(card_counts.get("tool_broadcast_residue", 0))
			if drain_pocket_time >= 20.0:
				score += 0.07
	score -= 0.08 * float(terms_failure_risk)
	return clampf(score, 0.10, 0.96)

static func _open_house_processing_mult(open_house_time: float) -> float:
	if open_house_time >= 75.0:
		return 1.25
	if open_house_time >= 50.0:
		return 1.16
	if open_house_time >= 25.0:
		return 1.08
	return 1.0

static func _signal_clue_candidates(elapsed: float, boss_result_reason: String, boss_hp_ratio: float, open_house_time: float, open_house_signal_stage: int) -> Array[String]:
	var candidates: Array[String] = []
	if elapsed >= 120.0:
		_append_unique(candidates, "faint_signal")
	if elapsed >= 180.0:
		_append_unique(candidates, "detected_signal")
	if elapsed >= 240.0:
		_append_unique(candidates, "near_signal")
	if open_house_signal_stage >= 1 or open_house_time >= 25.0:
		_append_unique(candidates, "faint_signal")
	if open_house_signal_stage >= 2 or open_house_time >= 50.0:
		_append_unique(candidates, "detected_signal")
	if open_house_signal_stage >= 3 or open_house_time >= 75.0:
		_append_unique(candidates, "near_signal")
	if boss_result_reason == "boss_recall":
		_append_unique(candidates, "boss_hp_%d_percent" % int(round(boss_hp_ratio * 100.0)))
	if boss_hp_ratio <= 0.25:
		_append_unique(candidates, "deep_boss_analysis")
	return candidates

static func _append_unique(items: Array[String], item: String) -> void:
	if items.has(item):
		return
	items.append(item)

static func _reward_lines(
	reward_tier: String,
	general_reward_allowed: bool,
	torn_ad_flyer_reward: int,
	campaign_core_fragment_reward: int,
	signal_clue_candidates: Array[String],
	ration_settlement: Dictionary,
	card_contributions: Array,
	card_counts: Dictionary,
	terms_failure_risk: int,
	open_house_time: float,
	open_house_signal_stage: int,
	drain_pocket_time: float,
	fake_return_time: float,
	open_house_processing_mult: float,
	kills: int,
	effective_kills: int,
	audit_pass_count: int,
	audit_fail_count: int,
	audit_pressure_level: int,
	audit_total_processing: float,
	audit_last_result: String,
	anti_farm_reason: String,
	boss_result_reason: String,
	boss_hp_ratio: float
) -> Array[String]:
	var lines: Array[String] = []
	lines.append("런 정산 기준: %s" % String(TIER_LABELS.get(reward_tier, reward_tier)))
	if anti_farm_reason != "":
		lines.append("일반 정산 잠김: %s" % anti_farm_reason)
	elif general_reward_allowed:
		lines.append("일반 정산 후보(미반영): 찢어진 광고 전단 +%d" % torn_ad_flyer_reward)
	if campaign_core_fragment_reward > 0:
		lines.append("결절 성과 후보(미반영): 캠페인 코어 파편 +%d" % campaign_core_fragment_reward)
	for line in _ration_ticket_lines(ration_settlement):
		lines.append(line)
	if boss_result_reason == "boss_recall":
		lines.append("스마일 홈 HP 성과: 잔여 %d%%" % int(round(boss_hp_ratio * 100.0)))
	if audit_pass_count > 0 or audit_fail_count > 0:
		lines.append("광고 감사 결과: 통과 %d / 미달 %d / 총 처리량 %.0f" % [audit_pass_count, audit_fail_count, audit_total_processing])
	if audit_pressure_level > 0:
		lines.append("감사 압력 잔여: +%d단계" % audit_pressure_level)
	if audit_last_result != "" and audit_last_result != "대기":
		lines.append("마지막 감사: %s" % audit_last_result)
	for line in _card_contribution_lines(card_contributions, card_counts, ration_settlement, open_house_time, audit_pass_count, terms_failure_risk):
		lines.append(line)
	if open_house_processing_mult > 1.0:
		lines.append("오픈하우스 처리량 보정: x%.2f (처리 %d -> %d 판정)" % [open_house_processing_mult, kills, effective_kills])
	if open_house_signal_stage >= 3 or open_house_time >= 75.0:
		lines.append("오픈하우스 체류 정산: %.0f초 - 모델하우스 신호가 선명해졌습니다." % open_house_time)
	elif open_house_signal_stage >= 2 or open_house_time >= 50.0:
		lines.append("오픈하우스 체류 정산: %.0f초 - 수신태그 승인 보정이 붙었습니다." % open_house_time)
	elif open_house_signal_stage >= 1 or open_house_time >= 25.0:
		lines.append("오픈하우스 체류 정산: %.0f초 - 수신태그 후보가 올라왔습니다." % open_house_time)
	if drain_pocket_time >= 20.0:
		lines.append("지역 약관: 배수로 침묵 주머니 %.0f초 - 수신태그 후보가 조용히 올라왔습니다." % drain_pocket_time)
	if fake_return_time >= 20.0:
		lines.append("지역 약관: 끊긴 광고 산책로 %.0f초 - 식량태그 후보와 오염 위험이 함께 생겼습니다." % fake_return_time)
	if not signal_clue_candidates.is_empty():
		lines.append("신호 단서 판정: %s" % ", ".join(signal_clue_candidates))
	return lines

static func _playtest_metric_lines(playtest_metrics: Dictionary) -> Array[String]:
	if playtest_metrics.is_empty():
		return []
	var summary := String(playtest_metrics.get("summary", ""))
	if summary == "":
		var score := int(playtest_metrics.get("first_5_score", 0))
		var target_count := int(playtest_metrics.get("first_5_target_count", 7))
		var hit_rate := float(playtest_metrics.get("charge_hit_rate", 0.0)) * 100.0
		summary = "핵심 %d/%d | 차징 %.0f%% | 카드 %d | 후보 %d" % [
			score,
			target_count,
			hit_rate,
			int(playtest_metrics.get("level_up_choices", 0)),
			int(playtest_metrics.get("ration_candidate_peak", 0)),
		]
	return ["플레이테스트 계측: %s" % summary]

static func _card_contribution_lines(card_contributions: Array, card_counts: Dictionary, ration_settlement: Dictionary, open_house_time: float, audit_pass_count: int, terms_failure_risk: int) -> Array[String]:
	var lines: Array[String] = []
	var items: Array = []
	for raw_item in card_contributions:
		var item: Dictionary = raw_item
		if float(item.get("processing", 0.0)) <= 0.0:
			continue
		items.append(item)
	items.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return float(a.get("processing", 0.0)) > float(b.get("processing", 0.0)))
	var used_ids: Array[String] = []
	for i in range(mini(2, items.size())):
		var item: Dictionary = items[i]
		var card_id := String(item.get("card_id", ""))
		used_ids.append(card_id)
		var notes := _compact_note_text(Array(item.get("notes", [])))
		var note_suffix := " (%s)" % notes if notes != "" else ""
		lines.append("카드 기여: %s 처리량 +%d%s" % [String(item.get("name", card_id)), int(round(float(item.get("processing", 0.0)))), note_suffix])
	if lines.size() < 3:
		for line in _settlement_card_contribution_lines(card_counts, ration_settlement, open_house_time, audit_pass_count, terms_failure_risk, used_ids):
			lines.append(line)
			if lines.size() >= 3:
				break
	return lines

static func _settlement_card_contribution_lines(card_counts: Dictionary, ration_settlement: Dictionary, open_house_time: float, audit_pass_count: int, terms_failure_risk: int, used_ids: Array[String]) -> Array[String]:
	var lines: Array[String] = []
	var candidates: Dictionary = ration_settlement.get("candidates", {})
	var approved: Dictionary = ration_settlement.get("approved", {})
	if int(card_counts.get("earn_overtime_sheet", 0)) > 0 and not used_ids.has("earn_overtime_sheet") and int(candidates.get(TICKET_FOOD, 0)) > 0:
		lines.append("카드 기여: 야근 정산표 - 식량태그 후보와 감사 기준 완화")
	if int(card_counts.get("earn_battery_receipt", 0)) > 0 and not used_ids.has("earn_battery_receipt") and int(candidates.get(TICKET_POWER, 0)) > 0:
		lines.append("카드 기여: 배터리 절약 영수증 - 충전태그 후보/승인 보정")
	if int(card_counts.get("earn_open_house_checkin", 0)) > 0 and not used_ids.has("earn_open_house_checkin") and open_house_time >= 25.0:
		lines.append("카드 기여: 오픈하우스 방문 확인 - 수신태그 후보와 위험 구역 처리량")
	if int(card_counts.get("tool_robot_command_flip", 0)) > 0 and not used_ids.has("tool_robot_command_flip") and int(candidates.get(TICKET_POWER, 0)) > 0:
		lines.append("카드 기여: 로봇 명령 뒤집기 - 충전태그 판정 사유")
	if int(card_counts.get("terms_no_return_agreement", 0)) > 0 and not used_ids.has("terms_no_return_agreement") and terms_failure_risk > 0:
		lines.append("카드 기여: 반품 불가 동의서 - 차징 처리량과 실패 정산 위험")
	if int(card_counts.get("tool_broadcast_residue", 0)) > 0 and not used_ids.has("tool_broadcast_residue") and int(approved.get(TICKET_SIGNAL, 0)) > 0:
		lines.append("카드 기여: 송출 잔류 - 수신태그 승인 보정")
	return lines

static func _compact_note_text(notes: Array) -> String:
	var parts: Array[String] = []
	for i in range(mini(2, notes.size())):
		parts.append(str(notes[i]))
	return ", ".join(parts)

static func _ration_ticket_lines(settlement: Dictionary) -> Array[String]:
	var lines: Array[String] = []
	var confirmed: Dictionary = settlement.get("confirmed", {})
	var candidates: Dictionary = settlement.get("candidates", {})
	var approved: Dictionary = settlement.get("approved", {})
	var held: Dictionary = settlement.get("held", {})
	var contaminated: Dictionary = settlement.get("contaminated", {})
	var downgraded: Dictionary = settlement.get("downgraded", {})
	var confirmed_text := _ticket_counts_text(confirmed)
	if confirmed_text != "":
		lines.append("확정 태그: %s" % confirmed_text)
	var candidate_text := _ticket_counts_text(candidates)
	if candidate_text != "":
		lines.append("태그 후보: %s" % candidate_text)
	var approved_text := _ticket_counts_text(approved)
	var held_text := _ticket_counts_text(held)
	if approved_text != "" or held_text != "":
		lines.append("후보 정산: 승인 %s / 보류 %s" % [approved_text if approved_text != "" else "없음", held_text if held_text != "" else "없음"])
	var contaminated_text := _ticket_counts_text(contaminated)
	if contaminated_text != "":
		lines.append("오염 정산: %s" % contaminated_text)
	var downgraded_text := _ticket_counts_text(downgraded)
	if downgraded_text != "":
		lines.append("약관 리스크: %s 후보화" % downgraded_text)
	var reasons: Array = Array(settlement.get("reason_lines", []))
	for i in range(mini(3, reasons.size())):
		lines.append("정산 사유: %s" % str(reasons[i]))
	var contamination_lines: Array = Array(settlement.get("contamination_lines", []))
	for i in range(mini(2, contamination_lines.size())):
		lines.append("오염 사유: %s" % str(contamination_lines[i]))
	return lines

static func _ticket_counts_text(counts: Dictionary) -> String:
	var parts: Array[String] = []
	for ticket_id in [TICKET_FOOD, TICKET_POWER, TICKET_SIGNAL]:
		var count := int(counts.get(ticket_id, 0))
		if count > 0:
			parts.append("%s %d" % [String(TICKET_LABELS[ticket_id]), count])
	return ", ".join(parts)
