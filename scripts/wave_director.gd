extends RefCounted

const MID_EVENT_TIME := 180.0

const WAVES := [
	{
		"name": "튜토리얼",
		"start": 0.0,
		"end": 30.0,
		"spawn_pressure": 2.4,
		"spawn_count_min": 1,
		"spawn_count_max": 1,
		"elite_chance": 0.0,
		"speed_mult": 0.88,
		"hp_mult": 0.90,
		"contact_damage_mult": 0.90,
		"role_weights": {"basic": 1.0, "fast": 0.0, "tank": 0.0, "signal": 0.0},
	},
	{
		"name": "빠른 판촉 전단",
		"start": 30.0,
		"end": 90.0,
		"spawn_pressure": 4.0,
		"spawn_count_min": 1,
		"spawn_count_max": 2,
		"elite_chance": 0.03,
		"speed_mult": 1.04,
		"hp_mult": 1.0,
		"contact_damage_mult": 1.0,
		"role_weights": {"basic": 0.84, "fast": 0.16, "tank": 0.0, "signal": 0.0},
	},
	{
		"name": "저가 광고 압착",
		"start": 90.0,
		"end": 150.0,
		"spawn_pressure": 5.5,
		"spawn_count_min": 2,
		"spawn_count_max": 3,
		"elite_chance": 0.08,
		"speed_mult": 1.10,
		"hp_mult": 1.14,
		"contact_damage_mult": 1.04,
		"role_weights": {"basic": 0.72, "fast": 0.18, "tank": 0.10, "signal": 0.0},
	},
	{
		"name": "송출기 혼선",
		"start": 150.0,
		"end": 210.0,
		"spawn_pressure": 7.6,
		"spawn_count_min": 3,
		"spawn_count_max": 4,
		"elite_chance": 0.20,
		"speed_mult": 1.20,
		"hp_mult": 1.32,
		"contact_damage_mult": 1.12,
		"role_weights": {"basic": 0.52, "fast": 0.20, "tank": 0.18, "signal": 0.10},
	},
	{
		"name": "브랜드 낙진",
		"start": 210.0,
		"end": 270.0,
		"spawn_pressure": 9.4,
		"spawn_count_min": 3,
		"spawn_count_max": 5,
		"elite_chance": 0.30,
		"speed_mult": 1.30,
		"hp_mult": 1.52,
		"contact_damage_mult": 1.18,
		"role_weights": {"basic": 0.42, "fast": 0.23, "tank": 0.22, "signal": 0.13},
	},
	{
		"name": "피날레",
		"start": 270.0,
		"end": 300.0,
		"spawn_pressure": 12.4,
		"spawn_count_min": 5,
		"spawn_count_max": 7,
		"elite_chance": 0.42,
		"speed_mult": 1.40,
		"hp_mult": 1.72,
		"contact_damage_mult": 1.26,
		"role_weights": {"basic": 0.32, "fast": 0.26, "tank": 0.24, "signal": 0.18},
	},
]

static func params_for_time(elapsed: float) -> Dictionary:
	for wave in WAVES:
		if elapsed >= float(wave["start"]) and elapsed < float(wave["end"]):
			return wave.duplicate(true)
	return WAVES[WAVES.size() - 1].duplicate(true)

static func is_finale(elapsed: float) -> bool:
	return elapsed >= 270.0
