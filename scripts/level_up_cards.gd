extends RefCounted

const CARDS := [
	{
		"id": "auto_damage",
		"name": "광고 문구 강화",
		"description": "자동 사격 피해와 추적 보정이 증가합니다.",
		"effect_text": "자동 사격 피해 +25% / 사거리 +8",
		"effect": "auto_damage_mult",
		"value": 0.25,
		"build_tags": ["auto"],
		"build_label": "자동",
	},
	{
		"id": "auto_range",
		"name": "방송 범위 확장",
		"description": "자동 사격이 더 멀리 있는 적을 찾습니다.",
		"effect_text": "자동 사격 사거리 +20",
		"effect": "auto_range_bonus",
		"value": 20.0,
		"build_tags": ["auto", "utility"],
		"build_label": "자동",
	},
	{
		"id": "charge_damage",
		"name": "원자력 충전",
		"description": "차징 공격의 폭발력이 증가합니다.",
		"effect_text": "차징 피해 +20%",
		"effect": "charge_damage_mult",
		"value": 0.20,
		"build_tags": ["charge"],
		"build_label": "차징",
	},
	{
		"id": "charge_targets",
		"name": "군중 설득",
		"description": "차징 공격이 더 많은 적에게 닿습니다.",
		"effect_text": "차징 타겟 수 +3",
		"effect": "charge_target_bonus",
		"value": 3,
		"build_tags": ["charge", "area"],
		"build_label": "차징",
	},
	{
		"id": "charge_cooldown",
		"name": "고속 예열 코일",
		"description": "차징 윈도우가 더 자주 열립니다.",
		"effect_text": "차징 쿨다운 -0.4초",
		"effect": "charge_period_bonus",
		"value": -0.4,
		"build_tags": ["charge", "utility"],
		"build_label": "차징",
	},
	{
		"id": "move_speed",
		"name": "가벼운 안전화",
		"description": "플레이어 이동 속도가 빨라집니다.",
		"effect_text": "이동 속도 +8%",
		"effect": "move_speed_mult",
		"value": 0.08,
		"build_tags": ["utility", "survival"],
		"build_label": "보조",
	},
	{
		"id": "max_hp",
		"name": "튼튼한 도시락",
		"description": "최대 HP와 현재 HP가 함께 증가합니다.",
		"effect_text": "최대 HP +20 / 현재 HP +20",
		"effect": "max_hp_bonus",
		"value": 20.0,
		"build_tags": ["survival"],
		"build_label": "생존",
	},
	{
		"id": "heal_now",
		"name": "즉석 영양제",
		"description": "현재 HP를 즉시 회복합니다.",
		"effect_text": "즉시 HP +25 회복",
		"effect": "heal",
		"value": 25.0,
		"build_tags": ["survival"],
		"build_label": "생존",
	},
	{
		"id": "xp_gain",
		"name": "학습용 전단지",
		"description": "처치 XP가 늘고 즉시 학습 진도가 찹니다.",
		"effect_text": "XP 획득량 +20% / 즉시 XP",
		"effect": "xp_gain_mult",
		"value": 0.20,
		"build_tags": ["utility"],
		"build_label": "보조",
	},
	{
		"id": "split_ad_round",
		"name": "분열 광고탄",
		"description": "자동 사격이 주기적으로 다른 적에게 튑니다.",
		"effect_text": "보조 사격 해금/강화",
		"effect": "split_shot_level",
		"value": 1,
		"build_tags": ["auto", "area"],
		"build_label": "자동",
	},
	{
		"id": "coupon_chain_pop",
		"name": "쿠폰 연쇄 폭죽",
		"description": "처치 시 주변 적에게 폭죽 피해를 줍니다.",
		"effect_text": "처치 폭발 확률 +25%",
		"effect": "kill_burst_level",
		"value": 1,
		"build_tags": ["area"],
		"build_label": "광역",
	},
	{
		"id": "toxic_ad_puddle",
		"name": "잔류 광고잉크",
		"description": "차징 후 짧게 남는 피해 장판을 깝니다.",
		"effect_text": "차징 장판 해금/강화",
		"effect": "charge_puddle_level",
		"value": 1,
		"build_tags": ["area", "charge"],
		"build_label": "광역",
	},
	{
		"id": "perfect_airtime",
		"name": "황금 송출각",
		"description": "차징이 열리자마자 쏘면 더 강합니다.",
		"effect_text": "완벽 차징 보너스 강화",
		"effect": "perfect_charge_level",
		"value": 1,
		"build_tags": ["charge"],
		"build_label": "차징",
	},
	{
		"id": "emergency_rebroadcast",
		"name": "긴급 역송출",
		"description": "낮은 HP에서 차징이 더 자주, 더 아픕니다.",
		"effect_text": "위기 차징 강화",
		"effect": "emergency_charge_level",
		"value": 1,
		"build_tags": ["survival", "charge"],
		"build_label": "생존",
	},
	{
		"id": "resync_error",
		"name": "재동기화 오류",
		"description": "차징에 맞은 적이 잠깐 느려집니다.",
		"effect_text": "차징 감속 강화",
		"effect": "charge_slow_level",
		"value": 1,
		"build_tags": ["charge", "utility"],
		"build_label": "차징",
	},
	{
		"id": "restorative_ad",
		"name": "회복성 광고",
		"description": "차징으로 많이 맞히면 HP를 회복합니다.",
		"effect_text": "다중 명중 회복 강화",
		"effect": "charge_heal_level",
		"value": 1,
		"build_tags": ["survival", "charge"],
		"build_label": "생존",
	},
	{
		"id": "recall_knockback",
		"name": "리콜 강제반품",
		"description": "차징에 맞은 적을 뒤로 밀어냅니다.",
		"effect_text": "차징 넉백 강화",
		"effect": "charge_knockback_level",
		"value": 1,
		"build_tags": ["charge", "survival"],
		"build_label": "차징",
	},
]

const TACTICAL_CARD_IDS := [
	"split_ad_round",
	"coupon_chain_pop",
	"toxic_ad_puddle",
	"perfect_airtime",
	"emergency_rebroadcast",
	"resync_error",
	"restorative_ad",
	"recall_knockback",
]

static func pick_three(rng: RandomNumberGenerator, player_stats: Dictionary = {}) -> Array[Dictionary]:
	var pool: Array[Dictionary] = []
	for card in CARDS:
		pool.append(card.duplicate(true))

	var picked: Array[Dictionary] = []
	for i in range(mini(3, pool.size())):
		var card := _weighted_take(pool, picked, player_stats, rng)
		if not card.is_empty():
			picked.append(card)
	if not _has_tactical_card(picked):
		_replace_last_with(pool, picked, player_stats, rng, func(card: Dictionary) -> bool: return TACTICAL_CARD_IDS.has(String(card["id"])))
	if _primary_tag_count(picked).size() < 2:
		var current_tag := _primary_tag(picked[0]) if picked.size() > 0 else ""
		_replace_last_with(pool, picked, player_stats, rng, func(card: Dictionary) -> bool: return _primary_tag(card) != current_tag)
	for card in picked:
		_apply_display_label(card)
	return picked

static func _has_tactical_card(cards: Array[Dictionary]) -> bool:
	for card in cards:
		if TACTICAL_CARD_IDS.has(String(card["id"])):
			return true
	return false

static func _replace_last_with(pool: Array[Dictionary], picked: Array[Dictionary], player_stats: Dictionary, rng: RandomNumberGenerator, predicate: Callable) -> void:
	if picked.size() == 0:
		return
	var replacement_pool: Array[Dictionary] = []
	for card in pool:
		if predicate.call(card) and not _has_card_id(picked, String(card["id"])):
			replacement_pool.append(card)
	if replacement_pool.size() == 0:
		return
	var previous_picks: Array[Dictionary] = []
	for i in range(picked.size() - 1):
		previous_picks.append(picked[i])
	picked[picked.size() - 1] = _weighted_take(replacement_pool, previous_picks, player_stats, rng)

static func _weighted_take(pool: Array[Dictionary], picked: Array[Dictionary], player_stats: Dictionary, rng: RandomNumberGenerator) -> Dictionary:
	if pool.size() == 0:
		return {}
	var weights: Array[float] = []
	var total := 0.0
	var tag_counts := _primary_tag_count(picked)
	for card in pool:
		var tag := _primary_tag(card)
		var weight := 1.0
		var chosen_count := _chosen_build_count(player_stats, tag)
		if chosen_count >= 2:
			weight += 0.35
		elif chosen_count == 1:
			weight += 0.12
		if int(tag_counts.get(tag, 0)) >= 2:
			weight *= 0.15
		weights.append(weight)
		total += weight
	var roll := rng.randf() * total
	for i in range(pool.size()):
		roll -= weights[i]
		if roll <= 0.0:
			return pool.pop_at(i).duplicate(true)
	return pool.pop_back().duplicate(true)

static func _chosen_build_count(player_stats: Dictionary, tag: String) -> int:
	if not player_stats.has("build_counts"):
		return 0
	var counts: Dictionary = player_stats["build_counts"]
	return int(counts.get(tag, 0))

static func _primary_tag(card: Dictionary) -> String:
	var tags: Array = card.get("build_tags", [])
	if tags.size() == 0:
		return "utility"
	return String(tags[0])

static func _primary_tag_count(cards: Array[Dictionary]) -> Dictionary:
	var counts := {}
	for card in cards:
		var tag := _primary_tag(card)
		counts[tag] = int(counts.get(tag, 0)) + 1
	return counts

static func _has_card_id(cards: Array[Dictionary], card_id: String) -> bool:
	for card in cards:
		if String(card["id"]) == card_id:
			return true
	return false

static func _apply_display_label(card: Dictionary) -> void:
	var label := String(card.get("build_label", "보조"))
	var name := String(card["name"])
	if not name.begins_with("["):
		card["name"] = "[%s] %s" % [label, name]
