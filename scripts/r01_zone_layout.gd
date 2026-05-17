extends RefCounted

const ZONE_SILENT_EDGE := "silent_edge"
const ZONE_HOUSING_LOOP := "housing_loop"
const ZONE_MODEL_HOUSE_NEXUS := "model_house_nexus"

const ZONE_SILENT_EDGE_END := 90.0
const ZONE_HOUSING_LOOP_END := 210.0

const ZONES := {
	ZONE_SILENT_EDGE: {
		"name": "침묵 가장자리",
		"entry_phrase": "침묵 가장자리 - 보급소 신호가 아직 닿는다.",
		"debug_label": "R01 zone: 침묵 가장자리",
	},
	ZONE_HOUSING_LOOP: {
		"name": "분양 주택 루프",
		"entry_phrase": "분양 주택 루프 - 같은 집들이 다시 줄을 맞춘다.",
		"debug_label": "R01 zone: 분양 주택 루프",
	},
	ZONE_MODEL_HOUSE_NEXUS: {
		"name": "모델하우스 결절",
		"entry_phrase": "모델하우스 결절 - 현관등이 윤서를 먼저 알아본다.",
		"debug_label": "R01 zone: 모델하우스 결절",
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
		ZONE_HOUSING_LOOP:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.01
			var loop_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			loop_weights["basic"] = maxf(0.0, float(loop_weights.get("basic", 0.0)) - 0.07)
			loop_weights["fast"] = float(loop_weights.get("fast", 0.0)) + 0.01
			loop_weights["tank"] = float(loop_weights.get("tank", 0.0)) + 0.01
			loop_weights["speaker"] = float(loop_weights.get("speaker", 0.0)) + 0.03
			loop_weights["charger"] = float(loop_weights.get("charger", 0.0)) + 0.03
			result["role_weights"] = loop_weights
		ZONE_MODEL_HOUSE_NEXUS:
			result["spawn_pressure"] = float(result.get("spawn_pressure", 1.0)) * 1.015
			result["elite_chance"] = minf(0.60, float(result.get("elite_chance", 0.0)) + 0.015)
			var nexus_weights: Dictionary = result.get("role_weights", {}).duplicate(true)
			nexus_weights["basic"] = maxf(0.0, float(nexus_weights.get("basic", 0.0)) - 0.08)
			nexus_weights["tank"] = float(nexus_weights.get("tank", 0.0)) + 0.01
			nexus_weights["signal"] = float(nexus_weights.get("signal", 0.0)) + 0.02
			nexus_weights["speaker"] = float(nexus_weights.get("speaker", 0.0)) + 0.04
			nexus_weights["charger"] = float(nexus_weights.get("charger", 0.0)) + 0.01
			result["role_weights"] = nexus_weights
	return result

static func _zone(zone_id: String) -> Dictionary:
	return ZONES.get(zone_id, ZONES[ZONE_SILENT_EDGE])
