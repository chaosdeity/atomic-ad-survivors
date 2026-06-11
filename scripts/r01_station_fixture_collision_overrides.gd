extends RefCounted

const COLLISION_NONE := "no_collision"
const COLLISION_SOFT := "soft_blocker"
const COLLISION_TRIGGER := "trigger"
const NAV_IGNORE := "ignore"
const NAV_SOFT_AVOID := "soft_avoid"

const ROLE_META := {
	"floor_pad": {
		"collision_class": COLLISION_NONE,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "station_floor_pad_readability",
		"shape": "rect",
		"size": Vector2.ZERO,
		"expected_role": "no_collision",
	},
	"route_lane": {
		"collision_class": COLLISION_NONE,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "station_route_lane_readability",
		"shape": "rect",
		"size": Vector2.ZERO,
		"expected_role": "no_collision",
	},
	"kiosk": {
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "station_kiosk_event_source",
		"shape": "rect",
		"size": Vector2(58, 54),
		"expected_role": "trigger_event_source",
		"interaction_kind": "checkin",
		"interaction_label": "체크인",
		"interaction_prompt": "방문 확인",
		"interaction_result": "출석 확인",
		"interaction_processing": 84.0,
	},
	"procedure_panel": {
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "station_procedure_panel_event_source",
		"shape": "rect",
		"size": Vector2(60, 42),
		"wide_size": Vector2(72, 48),
		"expected_role": "trigger_event_source",
		"interaction_kind": "procedure_panel",
		"interaction_label": "절차 패널",
		"interaction_prompt": "상담 확인",
		"interaction_result": "절차 보정",
		"interaction_processing": 72.0,
	},
	"room_meal_access_panel": {
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "station_room_meal_access_event_source",
		"shape": "rect",
		"size": Vector2(56, 42),
		"expected_role": "trigger_event_source",
		"interaction_kind": "room_meal_access",
		"interaction_label": "밥/방 접근",
		"interaction_prompt": "접근 확인",
		"interaction_result": "밥/방 슬롯 확인",
		"interaction_processing": 78.0,
	},
	"waiting_rail": {
		"collision_class": COLLISION_SOFT,
		"nav_behavior": NAV_SOFT_AVOID,
		"risk_role": "station_waiting_rail_soft_boundary",
		"shape": "rect",
		"size": Vector2(120, 22),
		"expected_role": "soft_boundary",
	},
	"renewal_gate": {
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "station_renewal_gate_passage_trigger",
		"shape": "rect",
		"size": Vector2(96, 34),
		"expected_role": "passage_trigger",
		"interaction_kind": "renewal_gate",
		"interaction_label": "갱신 게이트",
		"interaction_prompt": "갱신 통과",
		"interaction_result": "거주태그 갱신",
		"interaction_processing": 96.0,
	},
}

const RENEWAL_GATE_MASK_IDS := {
	"model_house_node_placeholder": true,
	"model_house_mass_placeholder": true,
	"family_plan_terminal": true,
	"floor_plan_line_placeholder": true,
}

const RENEWAL_GATE_MASK_RECT := Rect2(Vector2(2190, -1360), Vector2(440, 330))

func apply(records: Array, scenes: Array) -> Array[Dictionary]:
	var filtered: Array[Dictionary] = []
	for record in records:
		if _is_masked_renewal_gate_record(record):
			continue
		var record_copy: Dictionary = record.duplicate(true)
		filtered.append(record_copy)
	for scene in scenes:
		for fixture_record in _fixture_records_for_scene(scene):
			filtered.append(fixture_record)
	return filtered

func _is_masked_renewal_gate_record(record: Dictionary) -> bool:
	var asset_id := String(record.get("asset_id", ""))
	if not RENEWAL_GATE_MASK_IDS.has(asset_id):
		return false
	var pos := Vector2(record.get("pos", Vector2.ZERO))
	return RENEWAL_GATE_MASK_RECT.has_point(pos)

func _fixture_records_for_scene(scene: Dictionary) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var scene_id := String(scene.get("id", ""))
	for object in scene.get("objects", []):
		var role := String(object.get("role", ""))
		if not ROLE_META.has(role):
			continue
		var meta: Dictionary = ROLE_META[role]
		var size := _size_for_object(role, object, meta)
		if size == Vector2.ZERO:
			continue
		result.append({
			"asset_id": "station_fixture_%s_%s" % [scene_id, role],
			"asset_key": "station_fixture_collision_override",
			"zone_id": scene_id,
			"kind": "station_fixture_%s" % role,
			"pos": Vector2(object.get("pos", Vector2.ZERO)),
			"shape": String(meta.get("shape", "rect")),
			"size": size,
			"radius": 0.0,
			"collision_class": String(meta.get("collision_class", COLLISION_NONE)),
			"nav_behavior": String(meta.get("nav_behavior", NAV_IGNORE)),
			"risk_role": String(meta.get("risk_role", "station_fixture")),
			"spawn_influence": "neutral",
			"story_role": "station_fixture",
			"source_role": "station_fixture",
			"spawn_roles": [],
			"hazard_roles": [],
			"pressure_tags": ["r01_b_prop_size_active_rework", "station_fixture_collision"],
			"story_function": String(meta.get("expected_role", "")),
			"interaction_kind": String(meta.get("interaction_kind", "")),
			"interaction_label": String(meta.get("interaction_label", "")),
			"interaction_prompt": String(meta.get("interaction_prompt", "")),
			"interaction_result": String(meta.get("interaction_result", "")),
			"interaction_processing": float(meta.get("interaction_processing", 0.0)),
			"layer": String(object.get("layer", "")),
			"tags": ["active_rework", role, scene_id],
			"debug_label": "station_fixture/%s/%s" % [scene_id, role],
		})
	return result

func _size_for_object(role: String, object: Dictionary, meta: Dictionary) -> Vector2:
	if role == "procedure_panel" and String(object.get("variant", "")) == "wide":
		return Vector2(meta.get("wide_size", meta.get("size", Vector2.ZERO)))
	return Vector2(meta.get("size", Vector2.ZERO))
