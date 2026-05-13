extends RefCounted

const CARDS := [
	{
		"id": "auto_damage",
		"name": "광고 문구 강화",
		"description": "자동 사격 피해량이 증가합니다.",
		"effect_text": "자동 사격 피해 +15%",
		"effect": "auto_damage_mult",
		"value": 0.15,
	},
	{
		"id": "auto_range",
		"name": "방송 범위 확장",
		"description": "자동 사격이 더 멀리 있는 적을 찾습니다.",
		"effect_text": "자동 사격 사거리 +20",
		"effect": "auto_range_bonus",
		"value": 20.0,
	},
	{
		"id": "charge_damage",
		"name": "원자력 충전",
		"description": "차징 공격의 폭발력이 증가합니다.",
		"effect_text": "차징 피해 +20%",
		"effect": "charge_damage_mult",
		"value": 0.20,
	},
	{
		"id": "charge_targets",
		"name": "군중 설득",
		"description": "차징 공격이 더 많은 적에게 닿습니다.",
		"effect_text": "차징 타겟 수 +3",
		"effect": "charge_target_bonus",
		"value": 3,
	},
	{
		"id": "charge_cooldown",
		"name": "고속 예열 코일",
		"description": "차징 윈도우가 더 자주 열립니다.",
		"effect_text": "차징 쿨다운 -0.4초",
		"effect": "charge_period_bonus",
		"value": -0.4,
	},
	{
		"id": "move_speed",
		"name": "가벼운 안전화",
		"description": "플레이어 이동 속도가 빨라집니다.",
		"effect_text": "이동 속도 +8%",
		"effect": "move_speed_mult",
		"value": 0.08,
	},
	{
		"id": "max_hp",
		"name": "튼튼한 도시락",
		"description": "최대 HP와 현재 HP가 함께 증가합니다.",
		"effect_text": "최대 HP +20 / 현재 HP +20",
		"effect": "max_hp_bonus",
		"value": 20.0,
	},
	{
		"id": "heal_now",
		"name": "즉석 영양제",
		"description": "현재 HP를 즉시 회복합니다.",
		"effect_text": "즉시 HP +25 회복",
		"effect": "heal",
		"value": 25.0,
	},
	{
		"id": "xp_gain",
		"name": "학습용 전단지",
		"description": "처치로 얻는 XP가 증가합니다.",
		"effect_text": "XP 획득량 +15%",
		"effect": "xp_gain_mult",
		"value": 0.15,
	},
]

static func pick_three(rng: RandomNumberGenerator) -> Array[Dictionary]:
	var pool: Array[Dictionary] = []
	for card in CARDS:
		pool.append(card.duplicate(true))

	for i in range(pool.size() - 1, 0, -1):
		var swap_idx := rng.randi_range(0, i)
		var temp := pool[i]
		pool[i] = pool[swap_idx]
		pool[swap_idx] = temp

	var picked: Array[Dictionary] = []
	for i in range(mini(3, pool.size())):
		picked.append(pool[i])
	return picked
