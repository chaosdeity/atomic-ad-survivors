extends RefCounted

const CARD_TYPE_TOOL := "tool"
const CARD_TYPE_EARN := "earn"
const CARD_TYPE_TERMS := "terms"

const CARD_TYPE_LABELS := {
	CARD_TYPE_TOOL: "도구",
	CARD_TYPE_EARN: "밥벌이",
	CARD_TYPE_TERMS: "약관",
}

const CARDS := [
	{
		"id": "tool_return_label",
		"name": "반품 라벨",
		"description": "반품 도장이 표식을 붙이고 표식 처치가 처리량을 더 만듭니다.",
		"effect_text": "차징 표식 강화 / 표식 처치 처리량 +",
		"combo_text": "전단 폭죽, 반품 불가",
		"risk_text": "",
		"synergy_ids": ["tool_flyer_pop", "terms_no_return_agreement", "earn_overtime_sheet"],
		"effect": "return_label_level",
		"value": 1,
		"card_type": CARD_TYPE_TOOL,
		"build_tags": ["charge", "return", "processing"],
		"build_label": "도구",
	},
	{
		"id": "tool_flyer_pop",
		"name": "전단 폭죽",
		"description": "처치가 전단 폭발로 이어지고 연쇄 처리가 쉬워집니다.",
		"effect_text": "처치 폭발 해금 / 폭발 처리량 +",
		"combo_text": "반품 라벨, 오픈하우스",
		"risk_text": "",
		"synergy_ids": ["tool_return_label", "earn_open_house_checkin", "tool_broadcast_residue"],
		"effect": "flyer_pop_level",
		"value": 1,
		"card_type": CARD_TYPE_TOOL,
		"build_tags": ["area", "flyer", "processing"],
		"build_label": "도구",
	},
	{
		"id": "tool_broadcast_residue",
		"name": "송출 잔류",
		"description": "차징 후 남는 잔류 장판이 구역 장악과 신호 정산에 관여합니다.",
		"effect_text": "차징 장판 해금 / 오픈하우스 처리량 +",
		"combo_text": "오픈하우스, 가족 할인",
		"risk_text": "",
		"synergy_ids": ["earn_open_house_checkin", "terms_family_discount", "tool_flyer_pop"],
		"effect": "broadcast_residue_level",
		"value": 1,
		"card_type": CARD_TYPE_TOOL,
		"build_tags": ["charge", "area", "signal"],
		"build_label": "도구",
	},
	{
		"id": "tool_robot_command_flip",
		"name": "로봇 명령 뒤집기",
		"description": "차징에 맞은 로봇형 적이 느려지고 충전태그 판정에 관여합니다.",
		"effect_text": "차징 오류 강화 / 로봇 처치 처리량 +",
		"combo_text": "배터리 영수증, 정상 고객",
		"risk_text": "",
		"synergy_ids": ["earn_battery_receipt", "terms_normal_customer_sticker", "earn_low_hp_allowance"],
		"effect": "robot_command_flip_level",
		"value": 1,
		"card_type": CARD_TYPE_TOOL,
		"build_tags": ["robot", "charge", "power"],
		"build_label": "도구",
	},
	{
		"id": "earn_overtime_sheet",
		"name": "야근 정산표",
		"description": "오래 버틸수록 식량태그 후보와 감사 처리량이 안정됩니다.",
		"effect_text": "90초 이후 식량태그 후보 / 감사 기준 -",
		"combo_text": "저체력 수당, 반품 라벨",
		"risk_text": "",
		"synergy_ids": ["earn_low_hp_allowance", "tool_return_label", "terms_normal_customer_sticker"],
		"effect": "overtime_sheet_level",
		"value": 1,
		"card_type": CARD_TYPE_EARN,
		"build_tags": ["rice", "survival", "settlement"],
		"build_label": "밥벌이",
	},
	{
		"id": "earn_battery_receipt",
		"name": "배터리 절약 영수증",
		"description": "로봇형 적 처리가 충전태그 후보와 처리량으로 더 크게 잡힙니다.",
		"effect_text": "로봇 처치 충전태그 후보 / 처리량 +",
		"combo_text": "로봇 명령 뒤집기",
		"risk_text": "",
		"synergy_ids": ["tool_robot_command_flip", "terms_auto_renewal", "earn_low_hp_allowance"],
		"effect": "battery_receipt_level",
		"value": 1,
		"card_type": CARD_TYPE_EARN,
		"build_tags": ["power", "robot", "settlement"],
		"build_label": "밥벌이",
	},
	{
		"id": "earn_open_house_checkin",
		"name": "오픈하우스 방문 확인",
		"description": "오픈하우스 체류가 수신태그 후보와 처리량 승수로 커집니다.",
		"effect_text": "오픈하우스 수신태그 후보 / 처리량 x",
		"combo_text": "송출 잔류, 전단 폭죽",
		"risk_text": "위험 구역 체류 필요",
		"synergy_ids": ["tool_broadcast_residue", "tool_flyer_pop", "terms_family_discount"],
		"effect": "open_house_checkin_level",
		"value": 1,
		"card_type": CARD_TYPE_EARN,
		"build_tags": ["signal", "open_house", "settlement"],
		"build_label": "밥벌이",
	},
	{
		"id": "earn_low_hp_allowance",
		"name": "저체력 근무수당",
		"description": "낮은 체력으로 버티는 시간이 처리량과 태그 후보로 바뀝니다.",
		"effect_text": "저체력 처리량 x / 위기 후보 +",
		"combo_text": "야근 정산표, 반품 불가",
		"risk_text": "낮은 체력 유지 필요",
		"synergy_ids": ["earn_overtime_sheet", "terms_no_return_agreement", "earn_battery_receipt"],
		"effect": "low_hp_allowance_level",
		"value": 1,
		"card_type": CARD_TYPE_EARN,
		"build_tags": ["survival", "rice", "power"],
		"build_label": "밥벌이",
	},
	{
		"id": "terms_normal_customer_sticker",
		"name": "정상 고객 스티커",
		"description": "감사 기준을 낮추지만 만료 뒤 검수 압력이 올라갑니다.",
		"effect_text": "감사 기준 -8% / 캠페인 압력 +",
		"combo_text": "로봇 명령 뒤집기",
		"risk_text": "감사 압력 +1",
		"synergy_ids": ["tool_robot_command_flip", "terms_auto_renewal", "earn_overtime_sheet"],
		"effect": "normal_customer_sticker_level",
		"value": 1,
		"card_type": CARD_TYPE_TERMS,
		"build_tags": ["terms", "audit", "survival"],
		"build_label": "약관",
	},
	{
		"id": "terms_family_discount",
		"name": "가족 할인 약관",
		"description": "오픈하우스와 모델하우스 쪽 처리량이 커지지만 감사 압력이 붙습니다.",
		"effect_text": "위험 구역 처리량 + / 압력 +",
		"combo_text": "오픈하우스, 송출 잔류",
		"risk_text": "감사 압력 +1",
		"synergy_ids": ["earn_open_house_checkin", "tool_broadcast_residue", "terms_auto_renewal"],
		"effect": "family_discount_level",
		"value": 1,
		"card_type": CARD_TYPE_TERMS,
		"build_tags": ["terms", "open_house", "damage"],
		"build_label": "약관",
	},
	{
		"id": "terms_no_return_agreement",
		"name": "반품 불가 동의서",
		"description": "차징 처리량과 피해가 크게 오르지만 실패 정산 위험이 커집니다.",
		"effect_text": "차징 피해 +40% / 실패 위험 +",
		"combo_text": "반품 라벨, 저체력 수당",
		"risk_text": "실패 정산 위험 +",
		"synergy_ids": ["tool_return_label", "earn_low_hp_allowance", "terms_auto_renewal"],
		"effect": "no_return_agreement_level",
		"value": 1,
		"card_type": CARD_TYPE_TERMS,
		"build_tags": ["terms", "charge", "risk"],
		"build_label": "약관",
	},
	{
		"id": "terms_auto_renewal",
		"name": "약관 자동 갱신",
		"description": "약관 효과와 처리량 승수가 커지지만 감사 압력이 더 빨리 쌓입니다.",
		"effect_text": "약관 승수 강화 / 압력 +",
		"combo_text": "모든 약관 카드",
		"risk_text": "감사 압력 +1",
		"synergy_ids": ["terms_normal_customer_sticker", "terms_family_discount", "terms_no_return_agreement"],
		"effect": "terms_auto_renewal_level",
		"value": 1,
		"card_type": CARD_TYPE_TERMS,
		"build_tags": ["terms", "mult", "risk"],
		"build_label": "약관",
	},
]

const TACTICAL_CARD_IDS := [
	"tool_return_label",
	"tool_flyer_pop",
	"tool_broadcast_residue",
	"tool_robot_command_flip",
	"terms_no_return_agreement",
]

static func pick_three(rng: RandomNumberGenerator, player_stats: Dictionary = {}) -> Array[Dictionary]:
	var pool: Array[Dictionary] = []
	for card in CARDS:
		pool.append(card.duplicate(true))

	var picked: Array[Dictionary] = []
	if int(player_stats.get("selected_card_count", 0)) == 0:
		for card_type in [CARD_TYPE_TOOL, CARD_TYPE_EARN, CARD_TYPE_TERMS]:
			var card := _weighted_take_by_type(pool, picked, player_stats, rng, card_type)
			if not card.is_empty():
				picked.append(card)
	else:
		for i in range(mini(3, pool.size())):
			var card := _weighted_take(pool, picked, player_stats, rng)
			if not card.is_empty():
				picked.append(card)
	if not _has_tactical_card(picked):
		_replace_last_with(pool, picked, player_stats, rng, func(card: Dictionary) -> bool: return TACTICAL_CARD_IDS.has(String(card["id"])))
	if _primary_tag_count(picked).size() < 2:
		var current_tag := _primary_tag(picked[0]) if picked.size() > 0 else ""
		_replace_last_with(pool, picked, player_stats, rng, func(card: Dictionary) -> bool: return _primary_tag(card) != current_tag)
	if int(player_stats.get("selected_card_count", 0)) > 0 and not _has_current_synergy_card(picked, player_stats):
		_replace_last_with(pool, picked, player_stats, rng, func(card: Dictionary) -> bool: return _is_current_synergy_card(card, player_stats))
	for card in picked:
		_apply_display_label(card)
	return picked

static func _weighted_take_by_type(pool: Array[Dictionary], picked: Array[Dictionary], player_stats: Dictionary, rng: RandomNumberGenerator, card_type: String) -> Dictionary:
	var typed_pool: Array[Dictionary] = []
	for card in pool:
		if String(card.get("card_type", "")) == card_type:
			typed_pool.append(card)
	if typed_pool.size() == 0:
		return {}
	var chosen := _weighted_take(typed_pool, picked, player_stats, rng)
	if chosen.is_empty():
		return {}
	for i in range(pool.size()):
		if String(pool[i].get("id", "")) == String(chosen.get("id", "")):
			pool.remove_at(i)
			break
	return chosen

static func _has_tactical_card(cards: Array[Dictionary]) -> bool:
	for card in cards:
		if TACTICAL_CARD_IDS.has(String(card["id"])):
			return true
	return false

static func _has_current_synergy_card(cards: Array[Dictionary], player_stats: Dictionary) -> bool:
	for card in cards:
		if _is_current_synergy_card(card, player_stats):
			return true
	return false

static func _is_current_synergy_card(card: Dictionary, player_stats: Dictionary) -> bool:
	var synergy_ids := _current_synergy_ids(player_stats)
	return synergy_ids.has(String(card.get("id", "")))

static func _current_synergy_ids(player_stats: Dictionary) -> Array[String]:
	var result: Array[String] = []
	var card_counts: Dictionary = player_stats.get("card_counts", {})
	for source in CARDS:
		var source_id := String(source.get("id", ""))
		if int(card_counts.get(source_id, 0)) <= 0:
			continue
		for synergy_id_value in Array(source.get("synergy_ids", [])):
			var synergy_id := String(synergy_id_value)
			if int(card_counts.get(synergy_id, 0)) > 0:
				continue
			if not result.has(synergy_id):
				result.append(synergy_id)
	return result

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
	var card_type := String(card.get("card_type", ""))
	var label := String(CARD_TYPE_LABELS.get(card_type, card.get("build_label", "보조")))
	var name := String(card["name"])
	if not name.begins_with("["):
		card["name"] = "[%s] %s" % [label, name]
