extends RefCounted

const C := preload("res://scripts/game_config.gd")
const UIFont := preload("res://scripts/ui_font.gd")
const R01MapAssembly := preload("res://scripts/r01_map_assembly.gd")
const R01ProcedureStationVisuals := preload("res://scripts/r01_procedure_station_visuals.gd")
const R01ProductionFixtureVisuals := preload("res://scripts/r01_production_fixture_visuals.gd")
const R01StationFixtureCollisionOverrides := preload("res://scripts/r01_station_fixture_collision_overrides.gd")

const ENABLED := true
const USE_PRODUCTION_FIXTURE_TEXTURES := true
const WORLD_BOUNDS := Rect2(Vector2(-2640, -1485), Vector2(5280, 2970))
const PLAYER_MARGIN := 28.0
const STATE_FIRST_VISIT := "first_visit"
const STATE_BROADCAST_RECORD_3 := "broadcast_record_3"
const STATE_DESTROY_NODE := "destroy_node"
const STATE_EXTRACT_MEMORY := "extract_memory"
const COLLISION_HARD := "hard_blocker"
const COLLISION_SOFT := "soft_blocker"
const COLLISION_HAZARD := "passable_hazard"
const COLLISION_TRIGGER := "trigger"
const COLLISION_NONE := "no_collision"
const NAV_BLOCK := "block"
const NAV_SOFT_AVOID := "soft_avoid"
const NAV_IGNORE := "ignore"
const MODEL_HOUSE_CLEAR_RADIUS := 180.0
const STATE_VARIANTS := [
	STATE_FIRST_VISIT,
	STATE_BROADCAST_RECORD_3,
	STATE_DESTROY_NODE,
	STATE_EXTRACT_MEMORY,
]

const ZONES := {
	"silence_edge_start": {
		"display_name": "침묵 가장자리",
		"role": "low density entry / supply edge",
		"pos": Vector2(-2380, 1260),
		"color": Color(0.64, 0.78, 0.90, 0.34),
		"marker": Color(0.72, 0.84, 0.92, 0.92),
		"radius": 220.0,
	},
	"outer_recovery_lane_anchor": {
		"display_name": "외곽 회수 차선",
		"role": "wide recovery lane / early return judgment",
		"pos": Vector2(-1540, 1110),
		"color": Color(0.58, 0.78, 0.70, 0.26),
		"marker": Color(0.68, 0.92, 0.76, 0.92),
		"radius": 260.0,
	},
	"subdivision_loop_center": {
		"display_name": "분양 주택 루프",
		"role": "primary combat loop / repeated houses",
		"pos": Vector2(-640, 365),
		"color": Color(1.0, 0.75, 0.63, 0.28),
		"marker": Color(1.0, 0.83, 0.66, 0.95),
		"radius": 340.0,
	},
	"open_house_street_anchor": {
		"display_name": "오픈하우스 거리",
		"role": "risk reward street / signal ticket pressure",
		"pos": Vector2(800, -210),
		"color": Color(1.0, 0.62, 0.48, 0.26),
		"marker": Color(1.0, 0.54, 0.46, 0.94),
		"radius": 300.0,
	},
	"model_house_node_anchor": {
		"display_name": "모델하우스 결절",
		"role": "broadcast record / node approach",
		"pos": Vector2(2320, -1220),
		"color": Color(1.0, 0.86, 0.42, 0.30),
		"marker": Color(1.0, 0.82, 0.42, 0.96),
		"radius": 280.0,
	},
	"drain_pocket_anchor": {
		"display_name": "배수로 침묵 주머니",
		"role": "side pocket / trace candidate",
		"pos": Vector2(180, 1280),
		"color": Color(0.18, 0.38, 0.27, 0.28),
		"marker": Color(0.25, 0.52, 0.34, 0.94),
		"radius": 250.0,
	},
	"fake_return_route_anchor": {
		"display_name": "끊긴 광고 산책로",
		"role": "false recovery mimic / route risk",
		"pos": Vector2(-1680, -520),
		"color": Color(0.96, 0.68, 0.96, 0.25),
		"marker": Color(0.98, 0.72, 1.0, 0.92),
		"radius": 250.0,
	},
}

const ADJACENCY := [
	["silence_edge_start", "outer_recovery_lane_anchor"],
	["outer_recovery_lane_anchor", "subdivision_loop_center"],
	["subdivision_loop_center", "open_house_street_anchor"],
	["open_house_street_anchor", "model_house_node_anchor"],
	["subdivision_loop_center", "drain_pocket_anchor"],
	["subdivision_loop_center", "fake_return_route_anchor"],
]

const KIND_COLLISION_META := {
	"floor": {"collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "ground_readability", "shape": "rect", "size": Vector2(116, 56)},
	"house": {"collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "hard_structure", "shape": "rect", "size": Vector2(106, 74)},
	"model_house": {"collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "large_objective_structure", "shape": "rect", "size": Vector2(154, 104)},
	"ad_device": {"collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "large_ad_device", "shape": "circle", "radius": 38.0},
	"road_barrier": {"collision_class": COLLISION_SOFT, "nav_behavior": NAV_SOFT_AVOID, "risk_role": "lane_soft_blocker", "shape": "rect", "size": Vector2(74, 24)},
	"mailbox": {"collision_class": COLLISION_SOFT, "nav_behavior": NAV_SOFT_AVOID, "risk_role": "enemy_source", "shape": "circle", "radius": 18.0},
	"flyer": {"collision_class": COLLISION_HAZARD, "nav_behavior": NAV_IGNORE, "risk_role": "flyer_drop_source", "shape": "circle", "radius": 32.0},
	"scraps": {"collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "density_only", "shape": "circle", "radius": 26.0},
	"route": {"collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "route_hint", "shape": "rect", "size": Vector2(96, 40)},
	"tag": {"collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "trace_decal", "shape": "rect", "size": Vector2(44, 24)},
	"photo": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "photo_flash_or_memory", "shape": "circle", "radius": 24.0},
	"node": {"collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "objective_anchor", "shape": "circle", "radius": 48.0},
	"kiosk": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "elite_or_event_source", "shape": "rect", "size": Vector2(58, 54)},
	"projector": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "photo_flash_source", "shape": "circle", "radius": 30.0},
	"floor_plan": {"collision_class": COLLISION_HAZARD, "nav_behavior": NAV_IGNORE, "risk_role": "floor_plan_warning", "shape": "rect", "size": Vector2(96, 62)},
	"sign": {"collision_class": COLLISION_SOFT, "nav_behavior": NAV_SOFT_AVOID, "risk_role": "route_funnel", "shape": "rect", "size": Vector2(68, 42)},
	"drain": {"collision_class": COLLISION_HAZARD, "nav_behavior": NAV_IGNORE, "risk_role": "slime_or_trace_pocket", "shape": "circle", "radius": 34.0},
	"crack": {"collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "ground_trace", "shape": "rect", "size": Vector2(74, 28)},
	"trace": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "trace_anchor", "shape": "circle", "radius": 22.0},
	"speaker": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "signal_event_source", "shape": "circle", "radius": 32.0},
	"fake_recovery": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "false_route_signal_not_recovery_ui", "shape": "rect", "size": Vector2(66, 46)},
	"residue": {"collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "transmitter_residue", "shape": "circle", "radius": 36.0},
}

const NAV_RULES := {
	"basic": {"hard": "detour_or_stop", "soft": "slow_or_detour", "lane": "standard"},
	"fast": {"hard": "detour_or_stop", "soft": "can_slip", "lane": "narrow_ok"},
	"coupon": {"hard": "detour_or_stop", "soft": "can_slip", "lane": "narrow_ok"},
	"paper": {"hard": "detour_or_stop", "soft": "can_slip", "lane": "narrow_ok"},
	"robot": {"hard": "detour_or_stop", "soft": "follow_infrastructure", "lane": "road_pref"},
	"infrastructure": {"hard": "detour_or_stop", "soft": "follow_infrastructure", "lane": "road_pref"},
	"tank": {"hard": "detour_or_stop", "soft": "slow_or_detour", "lane": "wide_required"},
	"elite": {"hard": "detour_or_stop", "soft": "slow_or_detour", "lane": "wide_required"},
	"boss_objective": {"hard": "reserved_anchor", "soft": "clear_space", "lane": "wide_anchor_required"},
	"speaker": {"hard": "anchor_avoid", "soft": "anchor_ok", "lane": "edge_anchor"},
	"charger": {"hard": "detour_or_stop", "soft": "can_slip", "lane": "straight_warning"},
	"signal": {"hard": "anchor_avoid", "soft": "anchor_ok", "lane": "mid_anchor"},
}

const ZONE_PROPS := {
	"silence_edge_start": [
		{"id": "low_concentration_floor", "offset": Vector2(-70, 30), "kind": "floor", "state": "all"},
		{"id": "sparse_flyer_scraps", "offset": Vector2(18, -42), "kind": "scraps", "state": "all"},
		{"id": "weak_route_hint", "offset": Vector2(96, 28), "kind": "route", "state": "all"},
		{"id": "distant_mailbox_hint", "offset": Vector2(132, -72), "kind": "mailbox", "state": "all"},
		{"id": "quiet_service_van_shell", "offset": Vector2(-164, 82), "kind": "road_barrier", "state": "all"},
		{"id": "quiet_nameplate_marker", "offset": Vector2(-114, -48), "kind": "tag", "state": STATE_DESTROY_NODE},
		{"id": "blank_customer_photo_hint", "offset": Vector2(-28, -104), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	],
	"outer_recovery_lane_anchor": [
		{"id": "outer_recovery_lane_ground", "offset": Vector2(0, 0), "kind": "floor", "state": "all"},
		{"id": "quiet_lane_marker", "offset": Vector2(-130, -60), "kind": "route", "state": "all"},
		{"id": "outpost_signal_scraps", "offset": Vector2(122, 54), "kind": "scraps", "state": "all"},
		{"id": "wide_return_barrier", "offset": Vector2(220, -86), "kind": "road_barrier", "state": "all"},
	],
	"subdivision_loop_center": [
		{"id": "house_front_placeholder", "offset": Vector2(-166, -116), "kind": "house", "state": "all"},
		{"id": "mirror_house_left", "offset": Vector2(-322, 132), "kind": "house", "state": "all"},
		{"id": "mirror_house_right", "offset": Vector2(282, -124), "kind": "house", "state": "all"},
		{"id": "sales_speaker_tower", "offset": Vector2(248, 136), "kind": "ad_device", "state": "all"},
		{"id": "cul_de_sac_barrier", "offset": Vector2(-22, -178), "kind": "road_barrier", "state": "all"},
		{"id": "mailbox_device_placeholder", "offset": Vector2(-92, 118), "kind": "mailbox", "state": "all"},
		{"id": "flyer_pile_placeholder", "offset": Vector2(42, 74), "kind": "flyer", "state": "all"},
		{"id": "price_customer_tag_placeholder", "offset": Vector2(-118, -42), "kind": "tag", "state": "all"},
		{"id": "recommended_route_decal_placeholder", "offset": Vector2(154, -20), "kind": "route", "state": "all"},
		{"id": "same_house_repeat_marker", "offset": Vector2(136, -146), "kind": "house", "state": STATE_BROADCAST_RECORD_3},
		{"id": "exposed_nameplate_marker", "offset": Vector2(78, 112), "kind": "tag", "state": STATE_DESTROY_NODE},
		{"id": "family_window_photo_marker", "offset": Vector2(-18, -132), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	],
	"open_house_street_anchor": [
		{"id": "open_house_street_banner", "offset": Vector2(-210, -82), "kind": "sign", "state": "all"},
		{"id": "open_house_checkin_kiosk", "offset": Vector2(48, -36), "kind": "kiosk", "state": "all"},
		{"id": "family_discount_projector", "offset": Vector2(226, 70), "kind": "projector", "state": "all"},
		{"id": "guided_visit_floor_plan", "offset": Vector2(-44, 130), "kind": "floor_plan", "state": "all"},
		{"id": "open_house_flyer_spill", "offset": Vector2(-260, 110), "kind": "flyer", "state": "all"},
		{"id": "signal_residue_preview", "offset": Vector2(280, -98), "kind": "residue", "state": STATE_BROADCAST_RECORD_3},
		{"id": "smile_home_photo_loop", "offset": Vector2(116, -144), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	],
	"model_house_node_anchor": [
		{"id": "model_house_mass_placeholder", "offset": Vector2(208, -118), "kind": "model_house", "state": "all"},
		{"id": "model_house_node_placeholder", "offset": Vector2(0, 18), "kind": "node", "state": "all"},
		{"id": "parking_demo_car", "offset": Vector2(-178, 132), "kind": "road_barrier", "state": "all"},
		{"id": "family_plan_terminal", "offset": Vector2(204, 126), "kind": "ad_device", "state": "all"},
		{"id": "consultation_kiosk_socket_placeholder", "offset": Vector2(-92, 62), "kind": "kiosk", "state": "all"},
		{"id": "family_window_loop_placeholder", "offset": Vector2(106, -70), "kind": "photo", "state": "all"},
		{"id": "doorbell_projector_placeholder", "offset": Vector2(96, 66), "kind": "projector", "state": "all"},
		{"id": "floor_plan_line_placeholder", "offset": Vector2(-38, 98), "kind": "floor_plan", "state": "all"},
		{"id": "open_house_direction_stack", "offset": Vector2(-150, -38), "kind": "sign", "state": STATE_BROADCAST_RECORD_3},
		{"id": "dimmed_node_shell", "offset": Vector2(36, -118), "kind": "tag", "state": STATE_DESTROY_NODE},
		{"id": "memory_afterimage_window", "offset": Vector2(144, 4), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	],
	"drain_pocket_anchor": [
		{"id": "toxic_ad_drain_placeholder", "offset": Vector2(-34, 2), "kind": "drain", "state": "all"},
		{"id": "muted_floor_crack", "offset": Vector2(58, -44), "kind": "crack", "state": "all"},
		{"id": "tiny_paper_fragments", "offset": Vector2(-86, 76), "kind": "scraps", "state": "all"},
		{"id": "trace_candidate_marker", "offset": Vector2(74, 72), "kind": "trace", "state": "all"},
		{"id": "quiet_drain_material_marker", "offset": Vector2(-98, -54), "kind": "trace", "state": STATE_DESTROY_NODE},
		{"id": "receipt_fragment_marker", "offset": Vector2(118, 10), "kind": "tag", "state": STATE_EXTRACT_MEMORY},
	],
	"fake_return_route_anchor": [
		{"id": "recommended_route_decal_placeholder", "offset": Vector2(-74, 24), "kind": "route", "state": "all"},
		{"id": "streetlight_speaker_placeholder", "offset": Vector2(48, -72), "kind": "speaker", "state": "all"},
		{"id": "closed_return_lane_barrier", "offset": Vector2(-164, 66), "kind": "road_barrier", "state": "all"},
		{"id": "fake_recovery_marker", "offset": Vector2(62, 48), "kind": "fake_recovery", "state": "all"},
		{"id": "transmitter_residue_hint_placeholder", "offset": Vector2(-12, -118), "kind": "residue", "state": "all"},
		{"id": "broken_return_arrow", "offset": Vector2(-128, -32), "kind": "route", "state": STATE_DESTROY_NODE},
		{"id": "family_voice_risk_marker", "offset": Vector2(128, 10), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	],
}

var state_variant := STATE_FIRST_VISIT
var _collision_records_cache_variant := ""
var _collision_records_cache: Array[Dictionary] = []
var _pathing_probe_cache_variant := ""
var _pathing_probe_cache := {}
var map_assembly := R01MapAssembly.new()
var procedure_station_visuals = R01ProcedureStationVisuals.new()
var station_fixture_collision_overrides := R01StationFixtureCollisionOverrides.new()
var _last_draw_player_pos := Vector2.ZERO

func _init() -> void:
	if USE_PRODUCTION_FIXTURE_TEXTURES:
		procedure_station_visuals = R01ProductionFixtureVisuals.new()

func reset() -> void:
	state_variant = STATE_FIRST_VISIT
	_clear_collision_cache()
	map_assembly.reset_cache()

func set_state_variant(next_variant: String) -> bool:
	if not STATE_VARIANTS.has(next_variant):
		return false
	state_variant = next_variant
	_clear_collision_cache()
	return true

func next_state_variant() -> String:
	var index := STATE_VARIANTS.find(state_variant)
	state_variant = STATE_VARIANTS[(index + 1) % STATE_VARIANTS.size()]
	_clear_collision_cache()
	return state_variant

func player_bounds() -> Rect2:
	return WORLD_BOUNDS.grow(-PLAYER_MARGIN)

func clamp_player_position(pos: Vector2) -> Vector2:
	var bounds := player_bounds()
	return Vector2(
		clampf(pos.x, bounds.position.x, bounds.position.x + bounds.size.x),
		clampf(pos.y, bounds.position.y, bounds.position.y + bounds.size.y)
	)

func configure_camera(camera: Camera2D) -> void:
	camera.limit_left = int(WORLD_BOUNDS.position.x)
	camera.limit_top = int(WORLD_BOUNDS.position.y)
	camera.limit_right = int(WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x)
	camera.limit_bottom = int(WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y)

func enemy_spawn_position(player_pos: Vector2, rng: RandomNumberGenerator, radius: float, role: String, elapsed: float) -> Vector2:
	var view_half := C.VIEWPORT_SIZE * 0.5
	var near_rect := Rect2(player_pos - view_half - Vector2(42, 42), C.VIEWPORT_SIZE + Vector2(84, 84))
	var preferred_center := player_pos
	var nearest_anchor := nearest_zone_id(player_pos)
	if elapsed > 72.0 and rng.randf() < 0.28:
		preferred_center = anchor_position(nearest_anchor)
	if elapsed > 135.0 and player_pos.distance_to(anchor_position("open_house_street_anchor")) < 980.0 and rng.randf() < 0.28:
		preferred_center = anchor_position("open_house_street_anchor")
	if elapsed > 240.0 and player_pos.distance_to(anchor_position("model_house_node_anchor")) < 1180.0 and rng.randf() < 0.24:
		preferred_center = anchor_position("model_house_node_anchor")
	for i in range(28):
		var side := rng.randi_range(0, 3)
		var offset := Vector2.ZERO
		if side == 0:
			offset = Vector2(-view_half.x - rng.randf_range(76.0, 250.0), rng.randf_range(-view_half.y - 90.0, view_half.y + 90.0))
		elif side == 1:
			offset = Vector2(view_half.x + rng.randf_range(76.0, 250.0), rng.randf_range(-view_half.y - 90.0, view_half.y + 90.0))
		elif side == 2:
			offset = Vector2(rng.randf_range(-view_half.x - 150.0, view_half.x + 150.0), -view_half.y - rng.randf_range(72.0, 210.0))
		else:
			offset = Vector2(rng.randf_range(-view_half.x - 150.0, view_half.x + 150.0), view_half.y + rng.randf_range(72.0, 210.0))
		var candidate := _clamp_world_position(preferred_center + offset, radius)
		if not near_rect.has_point(candidate) and is_spawn_position_valid(candidate, radius, role):
			return candidate
	for i in range(36):
		var angle := fmod(float(i) * 2.399963 + rng.randf_range(-0.28, 0.28), TAU)
		var ring := rng.randf_range(320.0, 520.0)
		var candidate := _clamp_world_position(player_pos + Vector2(cos(angle), sin(angle)) * ring, radius)
		if is_spawn_position_valid(candidate, radius, role):
			return candidate
	return _nearest_open_position(_clamp_world_position(player_pos + Vector2(view_half.x + 140.0, 0.0), radius), radius, role)

func is_spawn_position_valid(pos: Vector2, radius: float, role: String = "basic") -> bool:
	if not WORLD_BOUNDS.grow(-radius).has_point(pos):
		return false
	for record in active_collision_records():
		var collision_class := String(record.get("collision_class", COLLISION_NONE))
		if collision_class == COLLISION_HARD and _point_overlaps_record(pos, record, radius + 3.0):
			return false
		if collision_class == COLLISION_SOFT and not _role_can_slip_soft(role) and _point_overlaps_record(pos, record, radius):
			return false
	return true

func anchor_position(zone_id: String) -> Vector2:
	return Vector2(ZONES.get(zone_id, ZONES["silence_edge_start"]).get("pos", Vector2.ZERO))

func nearest_zone_id(pos: Vector2) -> String:
	var best_id := "silence_edge_start"
	var best_distance := INF
	for zone_id in ZONES.keys():
		var distance := pos.distance_squared_to(anchor_position(zone_id))
		if distance < best_distance:
			best_distance = distance
			best_id = zone_id
	return best_id

func marker_debug_lines(player_pos: Vector2) -> Array[String]:
	var lines: Array[String] = [
		"R01 blockout: %s %.0fx%.0f world / %.1f screens" % [state_variant, WORLD_BOUNDS.size.x, WORLD_BOUNDS.size.y, world_screen_count()],
		"nearest anchor: %s" % nearest_zone_id(player_pos),
	]
	for zone_id in ZONES.keys():
		var zone: Dictionary = ZONES[zone_id]
		lines.append("%s %.0fm" % [zone_id, player_pos.distance_to(Vector2(zone["pos"]))])
	return lines

func world_screen_count() -> float:
	return (WORLD_BOUNDS.size.x / C.VIEWPORT_SIZE.x) * (WORLD_BOUNDS.size.y / C.VIEWPORT_SIZE.y)

func prop_counts_for_state(variant: String = state_variant) -> Dictionary:
	return map_assembly.prop_counts_for_state(variant)

func density_counts() -> Dictionary:
	return {
		"combat_readability": 30,
		"tier_hierarchy": 100,
		"tiny_lod_density_only": 300,
	}

func active_collision_records(variant: String = state_variant) -> Array[Dictionary]:
	if variant == state_variant and _collision_records_cache_variant == variant:
		return _collision_records_cache
	var records := map_assembly.collision_records(variant)
	if variant == state_variant:
		records = station_fixture_collision_overrides.apply(records, procedure_station_visuals.station_scenes(self))
	if variant == state_variant:
		_collision_records_cache_variant = variant
		_collision_records_cache = records
	return records

func _clear_collision_cache() -> void:
	_collision_records_cache_variant = ""
	_collision_records_cache.clear()
	_pathing_probe_cache_variant = ""
	_pathing_probe_cache.clear()
	map_assembly.reset_cache()

func collision_summary(variant: String = state_variant) -> Dictionary:
	return map_assembly.collision_summary(variant)

func layer_summary(variant: String = state_variant) -> Dictionary:
	return map_assembly.layer_summary(variant)

func asset_key_sample(variant: String = state_variant) -> Array[String]:
	return map_assembly.asset_key_sample(variant)

func object_count(variant: String = state_variant) -> int:
	return map_assembly.object_count(variant)

func nav_preview_rules() -> Dictionary:
	return NAV_RULES.duplicate(true)

func resolve_player_position(old_pos: Vector2, next_pos: Vector2, radius: float) -> Vector2:
	var clamped := clamp_player_position(next_pos)
	for record in active_collision_records():
		if String(record.get("collision_class", "")) != COLLISION_HARD:
			continue
		if _point_overlaps_record(clamped, record, radius):
			return _slide_or_stop(old_pos, clamped, record, radius, "basic")
	return clamped

func resolve_enemy_position(old_pos: Vector2, next_pos: Vector2, role: String, radius: float) -> Vector2:
	var clamped := Vector2(
		clampf(next_pos.x, WORLD_BOUNDS.position.x + radius, WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x - radius),
		clampf(next_pos.y, WORLD_BOUNDS.position.y + radius, WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y - radius)
	)
	for record in active_collision_records():
		var collision_class := String(record.get("collision_class", COLLISION_NONE))
		if collision_class == COLLISION_HARD and _point_overlaps_record(clamped, record, radius):
			return _slide_or_stop(old_pos, clamped, record, radius, role)
		if collision_class == COLLISION_SOFT and _point_overlaps_record(clamped, record, radius):
			if _role_can_slip_soft(role):
				return clamped
			return old_pos.lerp(clamped, 0.46 if role == "elite" or role == "tank" else 0.62)
	return clamped

func pathing_probe_results() -> Dictionary:
	if _pathing_probe_cache_variant == state_variant:
		return _pathing_probe_cache.duplicate(true)
	_pathing_probe_cache = {
		"30": _run_pathing_probe(30),
		"100": _run_pathing_probe(100),
		"300": _run_pathing_probe(300),
		"open_house_route": _anchor_distance_probe("subdivision_loop_center", "open_house_street_anchor", 900.0, 1700.0),
		"model_house_node": _model_house_anchor_probe(),
		"fake_return_route": _fake_return_route_probe(),
	}
	_pathing_probe_cache_variant = state_variant
	return _pathing_probe_cache.duplicate(true)

func pathing_probe_label() -> String:
	var results := pathing_probe_results()
	var parts: Array[String] = []
	for key in ["30", "100", "300"]:
		var result: Dictionary = results[key]
		parts.append("%s=%s stuck=%d" % [key, String(result["status"]), int(result["stuck_count"])])
	parts.append("node=%s" % String(results["model_house_node"].get("status", "")))
	parts.append("open=%s" % String(results["open_house_route"].get("status", "")))
	parts.append("fake=%s" % String(results["fake_return_route"].get("status", "")))
	return " ".join(parts)

func print_probe() -> void:
	print("R01_BLOCKOUT_PROBE world_bounds=", WORLD_BOUNDS, " viewport=", C.VIEWPORT_SIZE, " camera_screens=", world_screen_count())
	print("R01_MAP_ASSEMBLY object_count=", object_count(), " fields=", map_assembly.object_field_names())
	print("R01_MAP_ASSEMBLY_LAYER_SUMMARY ", layer_summary())
	print("R01_MAP_ASSEMBLY_ASSET_KEYS ", asset_key_sample())
	for zone_id in ZONES.keys():
		var zone: Dictionary = ZONES[zone_id]
		print("R01_BLOCKOUT_ANCHOR ", zone_id, " pos=", zone["pos"], " name=", zone["display_name"], " role=", zone["role"])
	for edge in ADJACENCY:
		print("R01_BLOCKOUT_ADJACENCY ", edge[0], " -> ", edge[1], " distance=", anchor_position(edge[0]).distance_to(anchor_position(edge[1])))
	for variant in STATE_VARIANTS:
		print("R01_BLOCKOUT_STATE ", variant, " prop_counts=", prop_counts_for_state(variant))
		print("R01_COLLISION_NAV_STATE ", variant, " collision_counts=", collision_summary(variant))
	print("R01_BLOCKOUT_DENSITY ", density_counts())
	print("R01_COLLISION_NAV_PREVIEW ", pathing_probe_results())

func _collision_meta_for_kind(kind: String) -> Dictionary:
	return map_assembly.collision_meta_for_kind(kind)

func _point_overlaps_record(point: Vector2, record: Dictionary, radius: float) -> bool:
	var shape := String(record.get("shape", "circle"))
	var pos: Vector2 = record.get("pos", Vector2.ZERO)
	if shape == "rect":
		var size: Vector2 = record.get("size", Vector2(24, 24))
		var rect := Rect2(pos - size * 0.5 - Vector2(radius, radius), size + Vector2(radius * 2.0, radius * 2.0))
		return rect.has_point(point)
	var check_radius := float(record.get("radius", 12.0)) + radius
	return point.distance_squared_to(pos) <= check_radius * check_radius

func _clamp_world_position(pos: Vector2, radius: float) -> Vector2:
	return Vector2(
		clampf(pos.x, WORLD_BOUNDS.position.x + radius, WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x - radius),
		clampf(pos.y, WORLD_BOUNDS.position.y + radius, WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y - radius)
	)

func _nearest_open_position(pos: Vector2, radius: float, role: String) -> Vector2:
	var clamped := _clamp_world_position(pos, radius)
	if is_spawn_position_valid(clamped, radius, role):
		return clamped
	for ring in [36.0, 72.0, 120.0, 180.0, 250.0]:
		for i in range(16):
			var angle := float(i) / 16.0 * TAU
			var candidate := _clamp_world_position(clamped + Vector2(cos(angle), sin(angle)) * ring, radius)
			if is_spawn_position_valid(candidate, radius, role):
				return candidate
	return clamped

func _slide_or_stop(old_pos: Vector2, blocked_pos: Vector2, record: Dictionary, radius: float, role: String) -> Vector2:
	var delta := blocked_pos - old_pos
	var length := delta.length()
	if length <= 0.01:
		return old_pos
	var dir := delta / length
	var perp := dir.rotated(PI * 0.5)
	var slip_scale := 0.95 if _role_can_slip_soft(role) else 0.72
	var candidates := [
		_push_out_of_record(blocked_pos, record, radius),
		old_pos + (dir + perp * slip_scale).normalized() * length,
		old_pos + (dir - perp * slip_scale).normalized() * length,
		old_pos + (dir + perp * slip_scale * 1.8).normalized() * length * 1.35,
		old_pos + (dir - perp * slip_scale * 1.8).normalized() * length * 1.35,
		old_pos + perp * length * 0.78,
		old_pos - perp * length * 0.78,
		old_pos + perp * length * 1.45,
		old_pos - perp * length * 1.45,
	]
	for candidate in candidates:
		var clamped := Vector2(
			clampf(candidate.x, WORLD_BOUNDS.position.x + radius, WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x - radius),
			clampf(candidate.y, WORLD_BOUNDS.position.y + radius, WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y - radius)
		)
		if not _point_overlaps_record(clamped, record, radius):
			return clamped
	return old_pos

func _push_out_of_record(point: Vector2, record: Dictionary, radius: float) -> Vector2:
	var pos: Vector2 = record.get("pos", Vector2.ZERO)
	var shape := String(record.get("shape", "circle"))
	if shape == "rect":
		var size: Vector2 = record.get("size", Vector2(24, 24))
		var half := size * 0.5 + Vector2(radius + 2.0, radius + 2.0)
		var delta := point - pos
		var overlap_x := half.x - absf(delta.x)
		var overlap_y := half.y - absf(delta.y)
		if overlap_x < overlap_y:
			return point + Vector2(signf(delta.x) if absf(delta.x) > 0.01 else 1.0, 0.0) * overlap_x
		return point + Vector2(0.0, signf(delta.y) if absf(delta.y) > 0.01 else 1.0) * overlap_y
	var away := point - pos
	if away.length_squared() <= 0.01:
		away = Vector2.RIGHT
	var target_radius := float(record.get("radius", 12.0)) + radius + 2.0
	return pos + away.normalized() * target_radius

func _role_can_slip_soft(role: String) -> bool:
	return role == "fast" or role == "charger" or role == "coupon" or role == "paper"

func _run_pathing_probe(count: int) -> Dictionary:
	var target := anchor_position("subdivision_loop_center")
	var stuck_count := 0
	var hard_hits := 0
	var soft_hits := 0
	var role_counts := {}
	for i in range(count):
		var role := _probe_role_for_index(i)
		role_counts[role] = int(role_counts.get(role, 0)) + 1
		var start := _probe_start_position(i, count)
		var pos := start
		var radius := _probe_radius_for_role(role)
		var moved_total := 0.0
		var local_hard_hits := 0
		var local_soft_hits := 0
		for step in range(72):
			var to_target := target - pos
			if to_target.length() < 18.0:
				break
			var old_pos := pos
			var desired := pos + to_target.normalized() * _probe_step_for_role(role)
			pos = resolve_enemy_position(pos, desired, role, radius)
			var moved := old_pos.distance_to(pos)
			moved_total += moved
			if moved < 0.6:
				local_hard_hits += 1
			elif moved < _probe_step_for_role(role) * 0.72:
				local_soft_hits += 1
		if moved_total < 42.0 or local_hard_hits > 18:
			stuck_count += 1
		hard_hits += local_hard_hits
		soft_hits += local_soft_hits
	var allowed_stuck := 0
	if count == 100:
		allowed_stuck = 4
	elif count == 300:
		allowed_stuck = 14
	var status := "pass"
	if stuck_count > allowed_stuck:
		status = "warning"
	if count == 300:
		status = "pass" if stuck_count <= allowed_stuck else "warning"
	return {
		"status": status,
		"count": count,
		"stuck_count": stuck_count,
		"hard_hits": hard_hits,
		"soft_hits": soft_hits,
		"roles": role_counts,
		"note": "300 is density/pathing preview, not final spawn count" if count == 300 else "runtime blockout probe",
	}

func _probe_role_for_index(index: int) -> String:
	var roles := ["basic", "fast", "basic", "tank", "speaker", "charger", "signal", "coupon", "robot", "elite"]
	return roles[index % roles.size()]

func _probe_radius_for_role(role: String) -> float:
	match role:
		"elite":
			return 15.0
		"tank":
			return 13.0
		"signal":
			return 11.0
		"speaker":
			return 10.0
		"charger":
			return 9.0
		"fast", "coupon", "paper":
			return 7.0
		_:
			return 8.0

func _probe_step_for_role(role: String) -> float:
	match role:
		"fast", "charger", "coupon", "paper":
			return 10.0
		"elite", "tank":
			return 6.5
		"speaker", "signal", "robot", "infrastructure":
			return 7.2
		_:
			return 8.0

func _probe_start_position(index: int, count: int) -> Vector2:
	var angle := fmod(float(index) * 2.399963, TAU)
	var ring := 320.0 + float(index % 5) * 34.0 + float(count % 7) * 3.0
	var center := anchor_position("subdivision_loop_center")
	var p := center + Vector2(cos(angle), sin(angle)) * ring
	return Vector2(
		clampf(p.x, WORLD_BOUNDS.position.x + 32.0, WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x - 32.0),
		clampf(p.y, WORLD_BOUNDS.position.y + 32.0, WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y - 32.0)
	)

func _anchor_distance_probe(from_id: String, to_id: String, min_distance: float, max_distance: float) -> Dictionary:
	var distance := anchor_position(from_id).distance_to(anchor_position(to_id))
	var status := "pass" if distance >= min_distance and distance <= max_distance else "warning"
	return {
		"status": status,
		"from": from_id,
		"to": to_id,
		"distance": distance,
		"min_distance": min_distance,
		"max_distance": max_distance,
		"note": "route distance supports wide-region pressure" if status == "pass" else "route distance outside target",
	}

func _model_house_anchor_probe() -> Dictionary:
	var anchor := anchor_position("model_house_node_anchor")
	var blocked_samples := 0
	var sample_radius := MODEL_HOUSE_CLEAR_RADIUS
	for i in range(16):
		var angle := float(i) / 16.0 * TAU
		var p := anchor + Vector2(cos(angle), sin(angle)) * sample_radius
		for record in active_collision_records():
			if String(record.get("collision_class", "")) == COLLISION_HARD and _point_overlaps_record(p, record, 15.0):
				blocked_samples += 1
				break
	var status := "pass" if blocked_samples <= 2 else "warning"
	return {
		"status": status,
		"blocked_samples": blocked_samples,
		"sample_radius": sample_radius,
		"note": "boss/elite/objective anchor remains open" if status == "pass" else "model node needs wider lane",
	}

func _fake_return_route_probe() -> Dictionary:
	var records := active_collision_records()
	var hard_count := 0
	var trigger_count := 0
	for record in records:
		if String(record.get("zone_id", "")) != "fake_return_route_anchor":
			continue
		var collision_class := String(record.get("collision_class", ""))
		if collision_class == COLLISION_HARD:
			hard_count += 1
		elif collision_class == COLLISION_TRIGGER:
			trigger_count += 1
	var status := "pass" if hard_count == 0 and trigger_count >= 2 else "warning"
	return {
		"status": status,
		"hard_count": hard_count,
		"trigger_count": trigger_count,
		"note": "fake_return_route is event/phrase driven, not recovery UI",
	}

func draw(canvas: CanvasItem, elapsed: float, player_pos: Vector2, show_debug_labels: bool = false) -> void:
	_last_draw_player_pos = player_pos
	_draw_ground(canvas, elapsed)
	_draw_zone_fields(canvas)
	_draw_travel_corridors(canvas)
	_draw_procedure_station_floor_layers(canvas)
	_draw_density_tests(canvas, elapsed, show_debug_labels)
	_draw_props(canvas, elapsed, show_debug_labels)
	_draw_procedure_station_back_layers(canvas, player_pos.y)
	_draw_collision_overlay(canvas, show_debug_labels)
	_draw_zone_markers(canvas, elapsed, player_pos, show_debug_labels)
	_draw_world_bounds(canvas, show_debug_labels)

func draw_foreground_hints(canvas: CanvasItem, _elapsed: float, show_debug_labels: bool = false) -> void:
	if show_debug_labels:
		return
	for record in active_collision_records():
		if _station_placeholder_visual_suppressed(record):
			continue
		var collision_class := String(record.get("collision_class", COLLISION_NONE))
		var kind := String(record.get("kind", ""))
		if collision_class == COLLISION_HARD:
			_draw_hard_blocker_foreground(canvas, record)
		elif collision_class == COLLISION_SOFT and (kind == "mailbox" or kind == "road_barrier" or kind == "sign"):
			_draw_soft_blocker_foreground(canvas, record)
	_draw_procedure_station_front_layers(canvas, _last_draw_player_pos.y)

func _draw_ground(canvas: CanvasItem, elapsed: float) -> void:
	canvas.draw_rect(WORLD_BOUNDS, Color("#e7d8b7"))
	_draw_rect_band(canvas, Rect2(Vector2(WORLD_BOUNDS.position.x, WORLD_BOUNDS.position.y), Vector2(880, WORLD_BOUNDS.size.y)), Color(0.56, 0.68, 0.70, 0.18), Color(0.34, 0.44, 0.46, 0.13))
	_draw_rect_band(canvas, Rect2(anchor_position("drain_pocket_anchor") + Vector2(-360, -122), Vector2(760, 260)), Color(0.15, 0.26, 0.22, 0.18), Color(0.08, 0.13, 0.11, 0.18))
	_draw_rect_band(canvas, Rect2(anchor_position("fake_return_route_anchor") + Vector2(-240, -104), Vector2(460, 160)), Color(0.96, 0.72, 0.88, 0.12), Color(0.42, 0.25, 0.38, 0.12))
	_draw_model_house_axis(canvas)
	var tile := 64
	for x in range(int(WORLD_BOUNDS.position.x), int(WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x) + tile, tile):
		var color := Color(0.77, 0.66, 0.52, 0.08) if int(x / tile) % 2 == 0 else Color(0.66, 0.78, 0.70, 0.06)
		canvas.draw_line(Vector2(x, WORLD_BOUNDS.position.y), Vector2(x, WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y), color, 1.0)
	for y in range(int(WORLD_BOUNDS.position.y), int(WORLD_BOUNDS.position.y + WORLD_BOUNDS.size.y) + tile, tile):
		var color := Color(0.75, 0.52, 0.48, 0.07) if int(y / tile) % 2 == 0 else Color(0.66, 0.78, 0.70, 0.06)
		canvas.draw_line(Vector2(WORLD_BOUNDS.position.x, y), Vector2(WORLD_BOUNDS.position.x + WORLD_BOUNDS.size.x, y), color, 1.0)
	var pulse := 0.03 + 0.02 * sin(elapsed * 0.7)
	canvas.draw_rect(Rect2(WORLD_BOUNDS.position + Vector2(0, WORLD_BOUNDS.size.y - 128), Vector2(WORLD_BOUNDS.size.x, 128)), Color(0.62, 0.78, 0.68, pulse))
	_draw_subdivision_loop(canvas)
	_draw_open_house_street(canvas, elapsed)
	_draw_drain_pocket(canvas, elapsed)
	_draw_fake_ad_walkway(canvas)

func _draw_rect_band(canvas: CanvasItem, rect: Rect2, fill: Color, border: Color) -> void:
	canvas.draw_rect(rect, fill)
	canvas.draw_rect(rect, border, false, 2.0)

func _draw_model_house_axis(canvas: CanvasItem) -> void:
	var a := anchor_position("subdivision_loop_center") + Vector2(110, -48)
	var b := anchor_position("open_house_street_anchor") + Vector2(20, -22)
	var c := anchor_position("model_house_node_anchor") + Vector2(80, -32)
	for segment in [[a, b], [b, c]]:
		var from_pos: Vector2 = segment[0]
		var to_pos: Vector2 = segment[1]
		canvas.draw_line(from_pos, to_pos, Color(0.60, 0.44, 0.34, 0.28), 64.0)
		canvas.draw_line(from_pos, to_pos, Color(0.86, 0.74, 0.58, 0.28), 48.0)
		canvas.draw_line(from_pos, to_pos, Color(0.28, 0.22, 0.19, 0.22), 4.0)
		var dir := (to_pos - from_pos).normalized()
		var side := dir.rotated(PI * 0.5)
		for i in range(7):
			var p := from_pos.lerp(to_pos, float(i) / 6.0)
			canvas.draw_line(p - side * 24.0, p - side * 16.0, Color(1.0, 0.90, 0.56, 0.26), 2.0)
			canvas.draw_line(p + side * 16.0, p + side * 24.0, Color(1.0, 0.90, 0.56, 0.26), 2.0)

func _draw_subdivision_loop(canvas: CanvasItem) -> void:
	var center := anchor_position("subdivision_loop_center")
	var outer := _ellipse_points(center, Vector2(520, 300), 48)
	var inner := _ellipse_points(center, Vector2(360, 190), 48)
	canvas.draw_polyline(outer, Color(0.48, 0.41, 0.34, 0.36), 54.0)
	canvas.draw_polyline(outer, Color(0.75, 0.67, 0.55, 0.42), 38.0)
	canvas.draw_polyline(inner, Color(0.70, 0.83, 0.66, 0.18), 48.0)
	canvas.draw_polyline(outer, Color(0.24, 0.20, 0.18, 0.18), 2.0)
	canvas.draw_polyline(inner, Color(0.24, 0.20, 0.18, 0.16), 2.0)
	for i in range(16):
		var p := center + Vector2(cos(float(i) / 16.0 * TAU) * 448.0, sin(float(i) / 16.0 * TAU) * 246.0)
		canvas.draw_rect(Rect2(p - Vector2(12, 1.5), Vector2(24, 3)), Color(1.0, 0.94, 0.62, 0.22))

func _draw_open_house_street(canvas: CanvasItem, elapsed: float) -> void:
	var anchor := anchor_position("open_house_street_anchor")
	var street := PackedVector2Array([
		anchor + Vector2(-520, 120),
		anchor + Vector2(-260, 18),
		anchor + Vector2(40, -18),
		anchor + Vector2(340, -96),
		anchor + Vector2(620, -184),
	])
	canvas.draw_polyline(street, Color(0.62, 0.36, 0.30, 0.34), 76.0)
	canvas.draw_polyline(street, Color(1.0, 0.76, 0.54, 0.30), 56.0)
	canvas.draw_polyline(street, Color(0.26, 0.18, 0.16, 0.26), 3.0)
	var pulse := 0.18 + 0.07 * sin(elapsed * 1.4)
	for i in range(8):
		var p := anchor + Vector2(-390 + i * 118, -70 + float((i * 61) % 210))
		canvas.draw_rect(Rect2(p - Vector2(38, 12), Vector2(76, 24)), Color(1.0, 0.91, 0.25, pulse))
		canvas.draw_rect(Rect2(p - Vector2(38, 12), Vector2(76, 24)), Color(0.44, 0.24, 0.18, 0.26), false, 1.2)

func _draw_drain_pocket(canvas: CanvasItem, elapsed: float) -> void:
	var anchor := anchor_position("drain_pocket_anchor")
	var trench := PackedVector2Array([
		anchor + Vector2(-250, 62),
		anchor + Vector2(-96, 18),
		anchor + Vector2(76, 52),
		anchor + Vector2(280, 20),
	])
	canvas.draw_polyline(trench, Color(0.07, 0.12, 0.10, 0.48), 42.0)
	canvas.draw_polyline(trench, Color(0.16, 0.34, 0.22, 0.42), 18.0)
	canvas.draw_polyline(trench, Color(0.62, 1.0, 0.36, 0.10 + 0.04 * sin(elapsed * 1.7)), 3.0)
	for i in range(6):
		var p := anchor + Vector2(-170 + i * 70, 42 + (i % 2) * 12)
		canvas.draw_line(p + Vector2(-16, -8), p + Vector2(16, 8), Color(0.04, 0.08, 0.06, 0.42), 3.0)

func _draw_fake_ad_walkway(canvas: CanvasItem) -> void:
	var anchor := anchor_position("fake_return_route_anchor")
	for i in range(5):
		var p := anchor + Vector2(-166 + i * 62, 42 - i * 18)
		var rect := Rect2(p - Vector2(24, 9), Vector2(48, 18))
		canvas.draw_rect(rect, Color(0.93, 0.60, 0.79, 0.12))
		canvas.draw_rect(rect, Color(0.42, 0.25, 0.36, 0.18), false, 1.2)
		canvas.draw_line(p + Vector2(-18, 6), p + Vector2(14, -5), Color(0.95, 0.54, 0.78, 0.20), 2.0)
	for i in range(3):
		var p := anchor + Vector2(12 + i * 44, -78 + i * 10)
		canvas.draw_line(p + Vector2(-18, -5), p + Vector2(16, 5), Color(0.23, 0.18, 0.18, 0.28), 3.0)

func _ellipse_points(center: Vector2, radius: Vector2, count: int) -> PackedVector2Array:
	var points := PackedVector2Array()
	for i in range(count + 1):
		var angle := float(i) / float(count) * TAU
		points.append(center + Vector2(cos(angle) * radius.x, sin(angle) * radius.y))
	return points

func _draw_travel_corridors(canvas: CanvasItem) -> void:
	for edge in ADJACENCY:
		var a := anchor_position(edge[0])
		var b := anchor_position(edge[1])
		var corridor_color := Color(0.96, 0.74, 0.44, 0.18)
		if edge[1] == "fake_return_route_anchor":
			corridor_color = Color(0.95, 0.54, 0.78, 0.08)
		elif edge[1] == "drain_pocket_anchor":
			corridor_color = Color(0.22, 0.36, 0.27, 0.20)
		elif edge[1] == "open_house_street_anchor" or edge[0] == "open_house_street_anchor":
			corridor_color = Color(1.0, 0.46, 0.34, 0.16)
		canvas.draw_line(a, b, corridor_color, 30.0)
		canvas.draw_line(a, b, Color(0.42, 0.31, 0.26, 0.26), 2.0)
		var dir := (b - a).normalized()
		var mid := a.lerp(b, 0.55)
		if edge[1] != "fake_return_route_anchor":
			canvas.draw_line(mid - dir.rotated(PI * 0.5) * 10.0, mid + dir * 38.0, Color(1.0, 0.92, 0.48, 0.36), 2.0)

func _draw_zone_fields(canvas: CanvasItem) -> void:
	for zone_id in ZONES.keys():
		var zone: Dictionary = ZONES[zone_id]
		var pos: Vector2 = zone["pos"]
		var radius := float(zone["radius"])
		var color: Color = zone["color"]
		canvas.draw_circle(pos, radius, Color(color.r, color.g, color.b, color.a * 0.62))
		canvas.draw_arc(pos, radius, 0.0, TAU, 64, Color(0.24, 0.18, 0.16, 0.12), 1.4)

func _draw_zone_markers(canvas: CanvasItem, elapsed: float, player_pos: Vector2, show_debug_labels: bool) -> void:
	for zone_id in ZONES.keys():
		var zone: Dictionary = ZONES[zone_id]
		var pos: Vector2 = zone["pos"]
		var marker: Color = zone["marker"]
		var pulse := 1.0 + 0.08 * sin(elapsed * 3.0 + pos.x * 0.01)
		canvas.draw_circle(pos, 13.0 * pulse, Color(marker.r, marker.g, marker.b, 0.32))
		canvas.draw_arc(pos, 22.0 * pulse, 0.0, TAU, 32, marker, 2.4)
		canvas.draw_line(pos + Vector2(-16, 0), pos + Vector2(16, 0), marker, 2.0)
		canvas.draw_line(pos + Vector2(0, -16), pos + Vector2(0, 16), marker, 2.0)
		_draw_marker_label(canvas, zone_id, zone, player_pos, show_debug_labels)

func _draw_marker_label(canvas: CanvasItem, zone_id: String, zone: Dictionary, player_pos: Vector2, show_debug_labels: bool) -> void:
	var pos: Vector2 = zone["pos"]
	var label_pos := pos + Vector2(-104, -70)
	if show_debug_labels:
		var distance := player_pos.distance_to(pos)
		canvas.draw_rect(Rect2(label_pos + Vector2(-4, -12), Vector2(212, 50)), Color(0.08, 0.06, 0.05, 0.58))
		canvas.draw_rect(Rect2(label_pos + Vector2(-4, -12), Vector2(212, 50)), Color(1.0, 0.96, 0.82, 0.38), false, 1.0)
		canvas.draw_string(UIFont.get_font(), label_pos, zone_id, HORIZONTAL_ALIGNMENT_LEFT, 206, 8, Color(1.0, 0.96, 0.82, 0.94))
		canvas.draw_string(UIFont.get_font(), label_pos + Vector2(0, 12), String(zone["display_name"]), HORIZONTAL_ALIGNMENT_LEFT, 206, 9, Color(1.0, 0.86, 0.52, 0.95))
		canvas.draw_string(UIFont.get_font(), label_pos + Vector2(0, 25), String(zone["role"]), HORIZONTAL_ALIGNMENT_LEFT, 206, 7, Color(0.76, 0.89, 0.95, 0.88))
		canvas.draw_string(UIFont.get_font(), label_pos + Vector2(0, 37), "distance %.0f" % distance, HORIZONTAL_ALIGNMENT_LEFT, 206, 7, Color(0.74, 1.0, 0.58, 0.88))
		return
	return

func _draw_props(canvas: CanvasItem, elapsed: float, show_debug_labels: bool) -> void:
	var objects := map_assembly.objects_for_state(state_variant)
	objects.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		var layer_a := map_assembly.layer_rank(String(a.get("layer", "")))
		var layer_b := map_assembly.layer_rank(String(b.get("layer", "")))
		if layer_a == layer_b:
			return Vector2(a.get("pos", Vector2.ZERO)).y < Vector2(b.get("pos", Vector2.ZERO)).y
		return layer_a < layer_b
	)
	for object in objects:
		if _object_drawn_by_ground_pass(object):
			continue
		if _station_placeholder_visual_suppressed(object):
			continue
		_draw_object_placeholder(canvas, object, elapsed, show_debug_labels)

func _draw_procedure_station_floor_layers(canvas: CanvasItem) -> void:
	for scene in procedure_station_visuals.station_scenes(self):
		procedure_station_visuals.draw_floor_layer(canvas, scene)

func _draw_procedure_station_back_layers(canvas: CanvasItem, player_y: float) -> void:
	for scene in procedure_station_visuals.station_scenes(self):
		procedure_station_visuals.draw_back_layer(canvas, scene, player_y)

func _draw_procedure_station_front_layers(canvas: CanvasItem, player_y: float) -> void:
	for scene in procedure_station_visuals.station_scenes(self):
		procedure_station_visuals.draw_front_layer(canvas, scene, player_y)

func _station_placeholder_visual_suppressed(object: Dictionary) -> bool:
	return procedure_station_visuals.suppresses_placeholder(object)

func _prop_visible_for_variant(prop: Dictionary, variant: String) -> bool:
	var state := String(prop.get("state", "all"))
	if state == "all":
		return true
	return state == variant

func _object_drawn_by_ground_pass(object: Dictionary) -> bool:
	var kind := String(object.get("kind", ""))
	var object_id := String(object.get("id", ""))
	return kind == "subdivision_road" or kind == "open_house_street" or kind == "model_axis" or kind == "drain_ground" or kind == "fake_ad_walkway" or kind == "travel_path" or object_id == "silence_edge_ground_band"

func _draw_object_placeholder(canvas: CanvasItem, object: Dictionary, elapsed: float, show_debug_labels: bool) -> void:
	var pos := Vector2(object.get("pos", Vector2.ZERO))
	var kind := String(object.get("kind", ""))
	var prop_id := String(object.get("id", kind))
	var asset_key := String(object.get("asset_key", prop_id))
	_draw_prop(canvas, pos, kind, prop_id, asset_key, elapsed, show_debug_labels)

func _draw_prop(canvas: CanvasItem, pos: Vector2, kind: String, prop_id: String, asset_key: String, elapsed: float, show_debug_labels: bool) -> void:
	match kind:
		"floor":
			canvas.draw_rect(Rect2(pos - Vector2(58, 28), Vector2(116, 56)), Color(0.74, 0.82, 0.78, 0.16))
		"house":
			_draw_house_placeholder(canvas, pos)
		"model_house":
			_draw_model_house_placeholder(canvas, pos)
		"ad_device":
			_draw_ad_device(canvas, pos, elapsed)
		"road_barrier":
			_draw_road_barrier(canvas, pos)
		"mailbox":
			_draw_mailbox(canvas, pos)
		"flyer", "scraps":
			for i in range(8):
				var p := pos + Vector2(float((i * 17) % 42) - 18.0, float((i * 11) % 30) - 14.0)
				canvas.draw_rect(Rect2(p, Vector2(9, 4)), Color(1.0, 0.88, 0.50, 0.38))
			if kind == "flyer":
				canvas.draw_arc(pos, 28.0, -0.4, 1.8, 20, Color(1.0, 0.30, 0.36, 0.28), 1.8)
		"route":
			_draw_route_decal(canvas, pos, prop_id.find("return") != -1 or asset_key.find("fake_return") != -1)
		"tag":
			canvas.draw_rect(Rect2(pos - Vector2(20, 9), Vector2(40, 18)), Color(1.0, 0.90, 0.56, 0.62))
			canvas.draw_rect(Rect2(pos - Vector2(20, 9), Vector2(40, 18)), Color(0.44, 0.25, 0.20, 0.62), false, 1.0)
		"photo":
			canvas.draw_rect(Rect2(pos - Vector2(18, 18), Vector2(36, 32)), Color(0.42, 0.58, 0.68, 0.44))
			canvas.draw_circle(pos + Vector2(-5, -4), 5.0, Color(1.0, 0.88, 0.62, 0.48))
			canvas.draw_circle(pos + Vector2(8, -2), 4.0, Color(1.0, 0.74, 0.82, 0.42))
		"node":
			var pulse := 1.0 + 0.06 * sin(elapsed * 2.8)
			canvas.draw_circle(pos + Vector2(3, 8), 40.0, Color(0.0, 0.0, 0.0, 0.14))
			canvas.draw_circle(pos, 38.0 * pulse, Color(1.0, 0.88, 0.28, 0.22))
			canvas.draw_arc(pos, 42.0 * pulse, 0.0, TAU, 48, Color(1.0, 0.35, 0.42, 0.78), 3.0)
			canvas.draw_rect(Rect2(pos - Vector2(24, 16), Vector2(48, 32)), Color(1.0, 0.93, 0.76, 0.66))
		"kiosk":
			canvas.draw_rect(Rect2(pos - Vector2(22, 24), Vector2(44, 42)), Color(0.70, 0.88, 0.82, 0.72))
			canvas.draw_rect(Rect2(pos - Vector2(13, -18), Vector2(26, 18)), Color(1.0, 0.88, 0.58, 0.54))
		"projector":
			canvas.draw_circle(pos, 16.0, Color(1.0, 0.62, 0.78, 0.24))
			canvas.draw_arc(pos, 24.0, -0.4, 1.9, 24, Color(1.0, 0.62, 0.78, 0.60), 2.0)
		"floor_plan":
			canvas.draw_rect(Rect2(pos - Vector2(42, 26), Vector2(84, 52)), Color(0.35, 0.70, 0.95, 0.08), false, 2.0)
			canvas.draw_line(pos + Vector2(-42, 0), pos + Vector2(42, 0), Color(0.35, 0.70, 0.95, 0.28), 2.0)
			canvas.draw_line(pos + Vector2(0, -26), pos + Vector2(0, 26), Color(0.35, 0.70, 0.95, 0.28), 2.0)
		"sign":
			_draw_sign(canvas, pos)
		"drain":
			canvas.draw_circle(pos, 28.0, Color(0.18, 0.40, 0.24, 0.48))
			canvas.draw_arc(pos, 30.0, 0.0, TAU, 32, Color(0.62, 1.0, 0.36, 0.64), 2.4)
			for i in range(4):
				canvas.draw_line(pos + Vector2(-20, -12 + i * 8), pos + Vector2(20, -12 + i * 8), Color(0.05, 0.10, 0.08, 0.42), 2.0)
		"crack":
			canvas.draw_line(pos + Vector2(-30, -4), pos + Vector2(-8, 6), Color(0.12, 0.12, 0.10, 0.36), 2.0)
			canvas.draw_line(pos + Vector2(-8, 6), pos + Vector2(18, -10), Color(0.12, 0.12, 0.10, 0.36), 2.0)
			canvas.draw_line(pos + Vector2(18, -10), pos + Vector2(34, 8), Color(0.12, 0.12, 0.10, 0.36), 2.0)
		"trace":
			canvas.draw_arc(pos, 18.0, 0.0, TAU, 28, Color(0.72, 1.0, 0.68, 0.72), 2.0)
			canvas.draw_rect(Rect2(pos - Vector2(7, 7), Vector2(14, 14)), Color(0.72, 1.0, 0.68, 0.22), false, 2.0)
		"speaker":
			canvas.draw_line(pos + Vector2(0, -32), pos + Vector2(0, 28), Color(0.34, 0.25, 0.22, 0.72), 3.0)
			canvas.draw_rect(Rect2(pos + Vector2(-14, -42), Vector2(28, 18)), Color(0.78, 0.86, 0.88, 0.70))
			canvas.draw_arc(pos + Vector2(12, -32), 20.0, -0.7, 0.7, 14, Color(1.0, 0.91, 0.25, 0.54), 2.0)
		"fake_recovery":
			_draw_broken_ad_panel(canvas, pos)
		"residue":
			canvas.draw_circle(pos, 24.0, Color(0.95, 0.72, 1.0, 0.17))
			canvas.draw_arc(pos, 34.0, -PI * 0.15, PI * 1.2, 34, Color(0.95, 0.72, 1.0, 0.54), 2.0)
		_:
			canvas.draw_circle(pos, 10.0, Color(1.0, 0.91, 0.25, 0.55))
	if show_debug_labels:
		_draw_prop_label(canvas, pos, "%s\n%s" % [prop_id, asset_key])

func _draw_house_placeholder(canvas: CanvasItem, pos: Vector2) -> void:
	_draw_blocker_shadow(canvas, pos, Vector2(126, 44))
	canvas.draw_rect(Rect2(pos - Vector2(54, 2), Vector2(108, 56)), Color(0.76, 0.54, 0.45, 0.76))
	canvas.draw_rect(Rect2(pos - Vector2(54, 2), Vector2(108, 56)), Color(0.24, 0.15, 0.13, 0.52), false, 2.0)
	canvas.draw_colored_polygon(PackedVector2Array([
		pos + Vector2(-68, 0),
		pos + Vector2(0, -50),
		pos + Vector2(68, 0),
	]), Color(0.92, 0.50, 0.42, 0.78))
	canvas.draw_polyline(PackedVector2Array([pos + Vector2(-68, 0), pos + Vector2(0, -50), pos + Vector2(68, 0)]), Color(0.24, 0.15, 0.13, 0.58), 2.0)
	canvas.draw_rect(Rect2(pos + Vector2(-36, 12), Vector2(22, 19)), Color(1.0, 0.91, 0.45, 0.46))
	canvas.draw_rect(Rect2(pos + Vector2(20, 9), Vector2(20, 45)), Color(0.28, 0.17, 0.15, 0.72))
	canvas.draw_line(pos + Vector2(-46, 58), pos + Vector2(48, 58), Color(0.20, 0.13, 0.11, 0.42), 4.0)

func _draw_model_house_placeholder(canvas: CanvasItem, pos: Vector2) -> void:
	_draw_blocker_shadow(canvas, pos, Vector2(184, 56))
	canvas.draw_rect(Rect2(pos - Vector2(78, -2), Vector2(156, 82)), Color(0.78, 0.55, 0.46, 0.82))
	canvas.draw_rect(Rect2(pos - Vector2(78, -2), Vector2(156, 82)), Color(0.22, 0.14, 0.12, 0.58), false, 2.4)
	canvas.draw_colored_polygon(PackedVector2Array([
		pos + Vector2(-96, 0),
		pos + Vector2(0, -68),
		pos + Vector2(96, 0),
	]), Color(0.96, 0.67, 0.48, 0.84))
	canvas.draw_polyline(PackedVector2Array([pos + Vector2(-96, 0), pos + Vector2(0, -68), pos + Vector2(96, 0)]), Color(0.22, 0.14, 0.12, 0.62), 2.6)
	canvas.draw_rect(Rect2(pos + Vector2(-50, 22), Vector2(32, 34)), Color(1.0, 0.91, 0.25, 0.40))
	canvas.draw_rect(Rect2(pos + Vector2(24, 14), Vector2(34, 66)), Color(0.28, 0.17, 0.15, 0.76))
	canvas.draw_arc(pos + Vector2(0, 0), 90.0, 0.1, PI - 0.1, 36, Color(1.0, 0.91, 0.25, 0.30), 3.0)
	canvas.draw_line(pos + Vector2(-72, 84), pos + Vector2(78, 84), Color(0.20, 0.13, 0.11, 0.44), 5.0)

func _draw_blocker_shadow(canvas: CanvasItem, pos: Vector2, size: Vector2) -> void:
	canvas.draw_rect(Rect2(pos + Vector2(-size.x * 0.5 + 8.0, size.y * 0.34), Vector2(size.x, 12.0)), Color(0.0, 0.0, 0.0, 0.13))

func _draw_ad_device(canvas: CanvasItem, pos: Vector2, elapsed: float) -> void:
	var pulse := 1.0 + 0.04 * sin(elapsed * 2.6)
	canvas.draw_rect(Rect2(pos + Vector2(-46, 40), Vector2(92, 10)), Color(0.0, 0.0, 0.0, 0.13))
	canvas.draw_line(pos + Vector2(-16, 20), pos + Vector2(-24, 52), Color(0.28, 0.19, 0.16, 0.76), 4.0)
	canvas.draw_line(pos + Vector2(16, 20), pos + Vector2(24, 52), Color(0.28, 0.19, 0.16, 0.76), 4.0)
	canvas.draw_rect(Rect2(pos - Vector2(34, 24), Vector2(68, 42)), Color(0.58, 0.38, 0.30, 0.82))
	canvas.draw_rect(Rect2(pos - Vector2(34, 24), Vector2(68, 42)), Color(0.16, 0.10, 0.09, 0.68), false, 2.2)
	canvas.draw_rect(Rect2(pos - Vector2(25, 14), Vector2(50, 20)), Color(1.0, 0.91, 0.25, 0.30))
	canvas.draw_circle(pos, 38.0 * pulse, Color(1.0, 0.91, 0.25, 0.12))
	canvas.draw_arc(pos, 43.0 * pulse, 0.0, TAU, 42, Color(1.0, 0.30, 0.36, 0.48), 3.0)

func _draw_road_barrier(canvas: CanvasItem, pos: Vector2) -> void:
	canvas.draw_rect(Rect2(pos + Vector2(-42, 20), Vector2(84, 8)), Color(0.0, 0.0, 0.0, 0.11))
	canvas.draw_rect(Rect2(pos - Vector2(38, 12), Vector2(76, 24)), Color(0.82, 0.66, 0.42, 0.76))
	canvas.draw_rect(Rect2(pos - Vector2(38, 12), Vector2(76, 24)), Color(0.24, 0.16, 0.13, 0.62), false, 2.0)
	for i in range(3):
		canvas.draw_line(pos + Vector2(-28 + i * 24, -8), pos + Vector2(-12 + i * 24, 8), Color(1.0, 0.91, 0.25, 0.62), 2.0)
	canvas.draw_line(pos + Vector2(-34, 15), pos + Vector2(-34, 28), Color(0.24, 0.16, 0.13, 0.62), 2.0)
	canvas.draw_line(pos + Vector2(34, 15), pos + Vector2(34, 28), Color(0.24, 0.16, 0.13, 0.62), 2.0)

func _draw_mailbox(canvas: CanvasItem, pos: Vector2) -> void:
	canvas.draw_rect(Rect2(pos + Vector2(-18, 25), Vector2(36, 6)), Color(0.0, 0.0, 0.0, 0.12))
	canvas.draw_line(pos + Vector2(0, 8), pos + Vector2(0, 30), Color(0.28, 0.18, 0.15, 0.84), 3.0)
	canvas.draw_rect(Rect2(pos + Vector2(-15, -18), Vector2(30, 28)), Color(0.78, 0.90, 0.84, 0.86))
	canvas.draw_circle(pos + Vector2(0, -18), 15.0, Color(0.93, 0.62, 0.54, 0.80))
	canvas.draw_rect(Rect2(pos + Vector2(-15, -18), Vector2(30, 28)), Color(0.20, 0.13, 0.11, 0.46), false, 1.6)
	canvas.draw_line(pos + Vector2(10, -12), pos + Vector2(20, -18), Color(1.0, 0.91, 0.25, 0.72), 2.0)

func _draw_route_decal(canvas: CanvasItem, pos: Vector2, broken: bool) -> void:
	if broken:
		for i in range(3):
			var p := pos + Vector2(-38 + i * 30, 12 - i * 8)
			canvas.draw_line(p + Vector2(-10, 4), p + Vector2(14, -4), Color(1.0, 0.58, 0.82, 0.18), 5.0)
			canvas.draw_rect(Rect2(p + Vector2(-8, -7), Vector2(16, 14)), Color(0.36, 0.20, 0.30, 0.10), false, 1.0)
		return
	canvas.draw_line(pos + Vector2(-42, 18), pos + Vector2(46, -12), Color(1.0, 0.58, 0.82, 0.26), 9.0)
	canvas.draw_line(pos + Vector2(28, -26), pos + Vector2(48, -12), Color(1.0, 0.58, 0.82, 0.38), 3.0)
	canvas.draw_line(pos + Vector2(28, 4), pos + Vector2(48, -12), Color(1.0, 0.58, 0.82, 0.38), 3.0)

func _draw_sign(canvas: CanvasItem, pos: Vector2) -> void:
	canvas.draw_rect(Rect2(pos + Vector2(-26, 25), Vector2(52, 6)), Color(0.0, 0.0, 0.0, 0.11))
	canvas.draw_line(pos + Vector2(0, 9), pos + Vector2(0, 30), Color(0.28, 0.18, 0.15, 0.76), 2.4)
	canvas.draw_rect(Rect2(pos - Vector2(30, 20), Vector2(60, 30)), Color(1.0, 0.88, 0.44, 0.82))
	canvas.draw_rect(Rect2(pos - Vector2(30, 20), Vector2(60, 30)), Color(0.24, 0.15, 0.13, 0.52), false, 1.8)
	canvas.draw_line(pos + Vector2(-18, -3), pos + Vector2(20, -3), Color(0.44, 0.25, 0.20, 0.70), 2.0)
	canvas.draw_line(pos + Vector2(8, -13), pos + Vector2(20, -3), Color(0.44, 0.25, 0.20, 0.70), 2.0)
	canvas.draw_line(pos + Vector2(8, 7), pos + Vector2(20, -3), Color(0.44, 0.25, 0.20, 0.70), 2.0)

func _draw_broken_ad_panel(canvas: CanvasItem, pos: Vector2) -> void:
	canvas.draw_rect(Rect2(pos - Vector2(30, 17), Vector2(58, 32)), Color(0.84, 0.66, 0.86, 0.10), false, 2.0)
	canvas.draw_line(pos + Vector2(-22, 11), pos + Vector2(24, -10), Color(1.0, 0.62, 0.88, 0.30), 3.0)
	canvas.draw_line(pos + Vector2(-22, -10), pos + Vector2(22, 10), Color(0.20, 0.13, 0.16, 0.30), 2.0)
	canvas.draw_line(pos + Vector2(-6, -16), pos + Vector2(9, 14), Color(0.20, 0.13, 0.16, 0.26), 2.0)

func _draw_hard_blocker_foreground(canvas: CanvasItem, record: Dictionary) -> void:
	var pos: Vector2 = record.get("pos", Vector2.ZERO)
	var shape := String(record.get("shape", "circle"))
	if shape == "rect":
		var size: Vector2 = record.get("size", Vector2(48, 36))
		var y := pos.y + size.y * 0.5 - 10.0
		canvas.draw_rect(Rect2(Vector2(pos.x - size.x * 0.48, y), Vector2(size.x * 0.96, 11.0)), Color(0.16, 0.09, 0.08, 0.24))
		canvas.draw_line(Vector2(pos.x - size.x * 0.44, y + 10.0), Vector2(pos.x + size.x * 0.44, y + 10.0), Color(1.0, 0.91, 0.25, 0.16), 2.0)
		return
	var radius := float(record.get("radius", 24.0))
	canvas.draw_arc(pos + Vector2(0, 8), radius * 0.82, 0.0, PI, 22, Color(0.12, 0.07, 0.06, 0.26), 4.0)

func _draw_soft_blocker_foreground(canvas: CanvasItem, record: Dictionary) -> void:
	var pos: Vector2 = record.get("pos", Vector2.ZERO)
	canvas.draw_circle(pos + Vector2(1, 6), 5.0, Color(0.10, 0.06, 0.05, 0.18))

func _draw_prop_label(canvas: CanvasItem, pos: Vector2, prop_id: String) -> void:
	canvas.draw_string(UIFont.get_font(), pos + Vector2(-54, 44), prop_id, HORIZONTAL_ALIGNMENT_CENTER, 108, 7, Color(0.20, 0.14, 0.12, 0.58))

func _draw_density_tests(canvas: CanvasItem, elapsed: float, show_debug_labels: bool) -> void:
	if not show_debug_labels:
		return
	_draw_density_group(canvas, anchor_position("subdivision_loop_center") + Vector2(180, -60), 30, 7.0, Color(1.0, 0.91, 0.25, 0.42), "30 density combat read")
	_draw_density_group(canvas, anchor_position("open_house_street_anchor") + Vector2(-80, 90), 100, 4.8, Color(1.0, 0.72, 0.50, 0.34), "100 open house pressure")
	_draw_density_group(canvas, anchor_position("model_house_node_anchor") + Vector2(-220, 140), 300, 2.2, Color(0.96, 0.84, 0.52, 0.22), "300 tiny LOD no AI")

func _draw_density_group(canvas: CanvasItem, center: Vector2, count: int, radius: float, color: Color, label: String) -> void:
	for i in range(count):
		var angle := fmod(float(i) * 2.399963, TAU)
		var ring := sqrt(float(i) / maxf(1.0, float(count))) * 80.0
		var p := center + Vector2(cos(angle), sin(angle)) * ring + Vector2(float(i % 7) - 3.0, float((i * 3) % 5) - 2.0)
		if radius <= 3.0:
			canvas.draw_rect(Rect2(p - Vector2(radius, radius), Vector2(radius * 2.0, radius * 2.0)), color)
		else:
			canvas.draw_circle(p, radius, color)
	canvas.draw_string(UIFont.get_font(), center + Vector2(-96, -94), label, HORIZONTAL_ALIGNMENT_CENTER, 192, 8, Color(0.30, 0.20, 0.16, 0.70))

func _draw_collision_overlay(canvas: CanvasItem, show_debug_labels: bool) -> void:
	if not show_debug_labels:
		return
	for record in active_collision_records():
		var collision_class := String(record.get("collision_class", COLLISION_NONE))
		if collision_class == COLLISION_NONE:
			continue
		var color := _collision_color(collision_class)
		var width := 4.0 if collision_class == COLLISION_HARD else 2.4
		var fill_alpha := 0.06
		if collision_class == COLLISION_HAZARD:
			fill_alpha = 0.18
		elif collision_class == COLLISION_TRIGGER:
			fill_alpha = 0.04
		_draw_collision_shape(canvas, record, Color(color.r, color.g, color.b, fill_alpha), 0.0, false)
		_draw_collision_shape(canvas, record, color, width, true)
		_draw_collision_label(canvas, record)

func _collision_color(collision_class: String) -> Color:
	match collision_class:
		COLLISION_HARD:
			return Color(0.13, 0.09, 0.07, 0.92)
		COLLISION_SOFT:
			return Color(0.35, 0.70, 0.95, 0.72)
		COLLISION_HAZARD:
			return Color(1.0, 0.30, 0.36, 0.70)
		COLLISION_TRIGGER:
			return Color(0.62, 1.0, 0.36, 0.72)
		_:
			return Color(0.38, 0.38, 0.38, 0.34)

func _draw_collision_shape(canvas: CanvasItem, record: Dictionary, color: Color, width: float, outline: bool) -> void:
	var pos: Vector2 = record.get("pos", Vector2.ZERO)
	var shape := String(record.get("shape", "circle"))
	if shape == "rect":
		var size: Vector2 = record.get("size", Vector2(24, 24))
		var rect := Rect2(pos - size * 0.5, size)
		canvas.draw_rect(rect, color, not outline, width)
		return
	var radius := float(record.get("radius", 12.0))
	if outline:
		canvas.draw_arc(pos, radius, 0.0, TAU, 36, color, width)
	else:
		canvas.draw_circle(pos, radius, color)

func _draw_collision_label(canvas: CanvasItem, record: Dictionary) -> void:
	var pos: Vector2 = record.get("pos", Vector2.ZERO)
	var collision_class := String(record.get("collision_class", COLLISION_NONE))
	var label := ""
	match collision_class:
		COLLISION_HARD:
			label = "HARD"
		COLLISION_SOFT:
			label = "SOFT"
		COLLISION_HAZARD:
			label = "HAZARD"
		COLLISION_TRIGGER:
			label = "TRIGGER"
		_:
			label = "NONE"
	var color := _collision_color(collision_class)
	canvas.draw_rect(Rect2(pos + Vector2(-30, -36), Vector2(60, 11)), Color(0.08, 0.06, 0.05, 0.58))
	canvas.draw_string(UIFont.get_font(), pos + Vector2(0, -28), label, HORIZONTAL_ALIGNMENT_CENTER, 60, 7, color)

func _draw_world_bounds(canvas: CanvasItem, show_debug_labels: bool) -> void:
	canvas.draw_rect(WORLD_BOUNDS, Color(0.34, 0.20, 0.16, 0.65), false, 4.0)
	if show_debug_labels:
		canvas.draw_string(UIFont.get_font(), WORLD_BOUNDS.position + Vector2(12, 20), "R01 blockout world %.0fx%.0f, viewport remains 480x270" % [WORLD_BOUNDS.size.x, WORLD_BOUNDS.size.y], HORIZONTAL_ALIGNMENT_LEFT, 520, 10, Color(0.24, 0.16, 0.13, 0.78))
