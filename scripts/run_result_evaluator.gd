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
	TIER_NONE: "보상 없음",
	TIER_WARMUP: "45초 회수 후보",
	TIER_SURVIVED_60: "60초 생존",
	TIER_STABLE_90: "90초 안정",
	TIER_SIGNAL_120: "120초 신호",
	TIER_DEEP_180: "180초 심층",
	TIER_BOSS_ROUTE_240: "240초 보스 경로",
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
	var reward_tier := _reward_tier(elapsed)
	var general_reward_allowed := elapsed >= MIN_GENERAL_REWARD_SECONDS
	var special_reward_allowed := match_state == "boss_victory" or boss_result_reason == "boss_recall" or (match_state == "recalled" and first_sortie)
	var anti_farm_reason := ""
	if not general_reward_allowed:
		anti_farm_reason = "%.0f초 미만 런은 일반 보상 후보가 열리지 않습니다." % MIN_GENERAL_REWARD_SECONDS

	var torn_ad_flyer_reward := _torn_ad_flyer_reward(reward_tier, kills, level, peak_enemy_count) if general_reward_allowed else 0
	var campaign_core_fragment_reward := _campaign_core_fragment_reward(match_state, boss_result_reason, boss_hp_ratio)
	var signal_clue_candidates := _signal_clue_candidates(elapsed, boss_result_reason, boss_hp_ratio)
	var reward_lines := _reward_lines(
		reward_tier,
		general_reward_allowed,
		torn_ad_flyer_reward,
		campaign_core_fragment_reward,
		signal_clue_candidates,
		anti_farm_reason,
		boss_result_reason,
		boss_hp_ratio
	)

	return {
		"reward_allowed": general_reward_allowed or special_reward_allowed,
		"reward_tier": reward_tier,
		"torn_ad_flyer_reward": torn_ad_flyer_reward,
		"campaign_core_fragment_reward": campaign_core_fragment_reward,
		"signal_clue_candidates": signal_clue_candidates,
		"reward_lines": reward_lines,
		"anti_farm_reason": anti_farm_reason,
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
		return 1
	if boss_result_reason == "boss_recall" and boss_hp_ratio <= 0.65:
		return 1
	return 0

static func _signal_clue_candidates(elapsed: float, boss_result_reason: String, boss_hp_ratio: float) -> Array[String]:
	var candidates: Array[String] = []
	if elapsed >= 120.0:
		candidates.append("faint_signal")
	if elapsed >= 180.0:
		candidates.append("detected_signal")
	if elapsed >= 240.0:
		candidates.append("near_signal")
	if boss_result_reason == "boss_recall":
		candidates.append("boss_hp_%d_percent" % int(round(boss_hp_ratio * 100.0)))
	if boss_hp_ratio <= 0.25:
		candidates.append("deep_boss_analysis")
	return candidates

static func _reward_lines(
	reward_tier: String,
	general_reward_allowed: bool,
	torn_ad_flyer_reward: int,
	campaign_core_fragment_reward: int,
	signal_clue_candidates: Array[String],
	anti_farm_reason: String,
	boss_result_reason: String,
	boss_hp_ratio: float
) -> Array[String]:
	var lines: Array[String] = []
	lines.append("런 정산 기준: %s" % String(TIER_LABELS.get(reward_tier, reward_tier)))
	if anti_farm_reason != "":
		lines.append("일반 보상 잠김: %s" % anti_farm_reason)
	elif general_reward_allowed:
		lines.append("일반 보상 후보(미지급): 찢어진 광고 전단 +%d" % torn_ad_flyer_reward)
	if campaign_core_fragment_reward > 0:
		lines.append("보스 성과 후보(미지급): 캠페인 코어 파편 +%d" % campaign_core_fragment_reward)
	if boss_result_reason == "boss_recall":
		lines.append("보스 HP 성과: 잔여 %d%%" % int(round(boss_hp_ratio * 100.0)))
	if not signal_clue_candidates.is_empty():
		lines.append("신호 단서 판정: %s" % ", ".join(signal_clue_candidates))
	return lines
