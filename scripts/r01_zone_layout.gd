extends RefCounted

const ZONE_SILENT_EDGE := "silent_edge"
const ZONE_HOUSING_LOOP := "housing_loop"
const ZONE_MODEL_HOUSE_NEXUS := "model_house_nexus"
const ZONE_BLOCKOUT_SILENCE_EDGE := "silence_edge_start"
const ZONE_BLOCKOUT_OUTER_RECOVERY := "outer_recovery_lane_anchor"
const ZONE_BLOCKOUT_HOUSING_LOOP := "subdivision_loop_center"
const ZONE_BLOCKOUT_OPEN_HOUSE := "open_house_street_anchor"
const ZONE_BLOCKOUT_MODEL_HOUSE := "model_house_node_anchor"
const ZONE_BLOCKOUT_DRAIN_POCKET := "drain_pocket_anchor"
const ZONE_BLOCKOUT_FAKE_RETURN := "fake_return_route_anchor"

const ZONE_SILENT_EDGE_END := 90.0
const ZONE_HOUSING_LOOP_END := 210.0

const ZONES := {
	ZONE_SILENT_EDGE: {
		"name": "침묵 가장자리",
		"entry_phrase": "침묵 가장자리 - 공공 대피 안내 응답 없음. 가족 복구 운용 14차, 방문 기록 재해석 중.",
		"debug_label": "R01 zone: 침묵 가장자리",
	},
	ZONE_BLOCKOUT_SILENCE_EDGE: {
		"name": "침묵 가장자리",
		"entry_phrase": "침묵 가장자리 - 시민 안내는 꺼졌고, 입주 보정만 남았습니다. 가족 구성 보정 14차.",
		"debug_label": "R01 zone: 침묵 가장자리 / world anchor",
	},
	ZONE_BLOCKOUT_OUTER_RECOVERY: {
		"name": "외곽 회수 차선",
		"entry_phrase": "외곽 회수 차선 - 권리 안내: 응답 없음. 가족 구성 보정: 활성. 등록 임계 전 보급소 회수선이 윤서를 붙잡고 있습니다.",
		"debug_label": "R01 zone: 외곽 회수 차선 / world anchor",
	},
	ZONE_HOUSING_LOOP: {
		"name": "분양 주택 루프",
		"entry_phrase": "분양 주택 루프 - 주소는 둘인데 수령인은 비어 있습니다.",
		"debug_label": "R01 zone: 분양 주택 루프",
	},
	ZONE_BLOCKOUT_HOUSING_LOOP: {
		"name": "분양 주택 루프",
		"entry_phrase": "분양 주택 루프 - 문패와 우편함과 현관이 생활 장치이자 판정 기관으로 켜집니다.",
		"debug_label": "R01 zone: 분양 주택 루프 / world anchor",
	},
	ZONE_BLOCKOUT_OPEN_HOUSE: {
		"name": "오픈하우스 거리",
		"entry_phrase": "오픈하우스 거리 - 가족대표 1, 수령인 0, 보호자 후보 1. 재상담을 권합니다.",
		"debug_label": "R01 zone: 오픈하우스 거리 / world anchor",
	},
	ZONE_MODEL_HOUSE_NEXUS: {
		"name": "모델하우스 결절",
		"entry_phrase": "모델하우스 결절 - 윤서: 고객 보류. 가족 칸 배정 실패.",
		"debug_label": "R01 zone: 모델하우스 결절",
	},
	ZONE_BLOCKOUT_MODEL_HOUSE: {
		"name": "모델하우스 접근로",
		"entry_phrase": "모델하우스 접근로 - 윤서: 고객 보류. 가족 칸 배정 실패.",
		"debug_label": "R01 zone: 모델하우스 접근로 / world anchor",
	},
	ZONE_BLOCKOUT_DRAIN_POCKET: {
		"name": "배수로 침묵 주머니",
		"entry_phrase": "배수로 침묵 주머니 - 낮은 신호가 캠페인을 줄이지만 인양도 불안해집니다.",
		"debug_label": "R01 zone: 배수로 침묵 주머니 / world anchor",
	},
	ZONE_BLOCKOUT_FAKE_RETURN: {
		"name": "끊긴 광고 산책로",
		"entry_phrase": "끊긴 광고 산책로 - 회수선처럼 떨리지만 보급소 쪽 침묵이 빠져 있습니다.",
		"debug_label": "R01 zone: 끊긴 광고 산책로 / world anchor",
	},
}

static func zone_id_for_elapsed(elapsed: float) -> String:
	if elapsed >= ZONE_HOUSING_LOOP_END:
		return ZONE_MODEL_HOUSE_NEXUS
	if elapsed >= ZONE_SILENT_EDGE_END:
		return ZONE_HOUSING_LOOP
	return ZONE_SILENT_EDGE

static func zone_name(zone_id: String) -> String:
	return String(_zone(zone_id).get("name", "외곽 주택가"))

static func entry_phrase(zone_id: String) -> String:
	return String(_zone(zone_id).get("entry_phrase", zone_name(zone_id)))

static func debug_label(zone_id: String) -> String:
	return String(_zone(zone_id).get("debug_label", "R01 zone: %s" % zone_name(zone_id)))

static func apply_spawn_pressure(params: Dictionary, zone_id: String) -> Dictionary:
	var result := params.duplicate(true)
	match zone_id:
		ZONE_BLOCKOUT_OUTER_RECOVERY:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 0.96
		ZONE_HOUSING_LOOP, ZONE_BLOCKOUT_HOUSING_LOOP:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.01
			var loop_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			loop_weights["basic"] = maxf(0.0, float(loop_weights.get("basic", 0.0)) - 0.07)
			loop_weights["fast"] = float(loop_weights.get("fast", 0.0)) + 0.01
			loop_weights["tank"] = float(loop_weights.get("tank", 0.0)) + 0.01
			loop_weights["speaker"] = float(loop_weights.get("speaker", 0.0)) + 0.03
			loop_weights["charger"] = float(loop_weights.get("charger", 0.0)) + 0.03
			result["role_weights"] = loop_weights
		ZONE_BLOCKOUT_OPEN_HOUSE:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.18
			result["speed_mult"] = float(result.get("speed_mult", 1.0)) * 1.06
			result["elite_chance"] = minf(0.60, float(result.get("elite_chance", 0.0)) + 0.04)
			var open_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			open_weights["basic"] = maxf(0.0, float(open_weights.get("basic", 0.0)) - 0.15)
			open_weights["fast"] = float(open_weights.get("fast", 0.0)) + 0.06
			open_weights["signal"] = float(open_weights.get("signal", 0.0)) + 0.05
			open_weights["speaker"] = float(open_weights.get("speaker", 0.0)) + 0.04
			open_weights["charger"] = float(open_weights.get("charger", 0.0)) + 0.03
			result["role_weights"] = open_weights
		ZONE_MODEL_HOUSE_NEXUS, ZONE_BLOCKOUT_MODEL_HOUSE:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.015
			result["elite_chance"] = minf(0.60, float(result.get("elite_chance", 0.0)) + 0.015)
			var nexus_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			nexus_weights["basic"] = maxf(0.0, float(nexus_weights.get("basic", 0.0)) - 0.08)
			nexus_weights["tank"] = float(nexus_weights.get("tank", 0.0)) + 0.01
			nexus_weights["signal"] = float(nexus_weights.get("signal", 0.0)) + 0.02
			nexus_weights["speaker"] = float(nexus_weights.get("speaker", 0.0)) + 0.04
			nexus_weights["charger"] = float(nexus_weights.get("charger", 0.0)) + 0.01
			result["role_weights"] = nexus_weights
		ZONE_BLOCKOUT_DRAIN_POCKET:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.08
			var drain_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			drain_weights["tank"] = float(drain_weights.get("tank", 0.0)) + 0.04
			drain_weights["signal"] = float(drain_weights.get("signal", 0.0)) + 0.03
			result["role_weights"] = drain_weights
		ZONE_BLOCKOUT_FAKE_RETURN:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.12
			var fake_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			fake_weights["fast"] = float(fake_weights.get("fast", 0.0)) + 0.05
			fake_weights["speaker"] = float(fake_weights.get("speaker", 0.0)) + 0.05
			result["role_weights"] = fake_weights
	return result

static func is_open_house_zone(zone_id: String) -> bool:
	return zone_id == ZONE_BLOCKOUT_OPEN_HOUSE

static func is_model_house_zone(zone_id: String) -> bool:
	return zone_id == ZONE_MODEL_HOUSE_NEXUS or zone_id == ZONE_BLOCKOUT_MODEL_HOUSE

static func _zone(zone_id: String) -> Dictionary:
	return ZONES.get(zone_id, ZONES[ZONE_SILENT_EDGE])
