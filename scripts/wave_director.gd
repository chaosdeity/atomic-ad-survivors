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
	},
	{
		"name": "기본 웨이브",
		"start": 30.0,
		"end": 90.0,
		"spawn_pressure": 3.6,
		"spawn_count_min": 1,
		"spawn_count_max": 2,
		"elite_chance": 0.04,
		"speed_mult": 1.0,
		"hp_mult": 1.0,
		"contact_damage_mult": 1.0,
	},
	{
		"name": "저가 광고 공세",
		"start": 90.0,
		"end": 150.0,
		"spawn_pressure": 4.8,
		"spawn_count_min": 1,
		"spawn_count_max": 3,
		"elite_chance": 0.10,
		"speed_mult": 1.08,
		"hp_mult": 1.10,
		"contact_damage_mult": 1.0,
	},
	{
		"name": "압박 구간",
		"start": 150.0,
		"end": 210.0,
		"spawn_pressure": 6.1,
		"spawn_count_min": 2,
		"spawn_count_max": 3,
		"elite_chance": 0.14,
		"speed_mult": 1.12,
		"hp_mult": 1.20,
		"contact_damage_mult": 1.05,
	},
	{
		"name": "위험 구간",
		"start": 210.0,
		"end": 270.0,
		"spawn_pressure": 7.4,
		"spawn_count_min": 2,
		"spawn_count_max": 4,
		"elite_chance": 0.22,
		"speed_mult": 1.18,
		"hp_mult": 1.35,
		"contact_damage_mult": 1.08,
	},
	{
		"name": "피날레",
		"start": 270.0,
		"end": 300.0,
		"spawn_pressure": 9.2,
		"spawn_count_min": 3,
		"spawn_count_max": 5,
		"elite_chance": 0.30,
		"speed_mult": 1.24,
		"hp_mult": 1.45,
		"contact_damage_mult": 1.10,
	},
]

static func params_for_time(elapsed: float) -> Dictionary:
	for wave in WAVES:
		if elapsed >= float(wave["start"]) and elapsed < float(wave["end"]):
			return wave.duplicate(true)
	return WAVES[WAVES.size() - 1].duplicate(true)

static func is_finale(elapsed: float) -> bool:
	return elapsed >= 270.0
