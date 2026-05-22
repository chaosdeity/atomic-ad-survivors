extends RefCounted

const COLLISION_HARD := "hard_blocker"
const COLLISION_SOFT := "soft_blocker"
const COLLISION_HAZARD := "passable_hazard"
const COLLISION_TRIGGER := "trigger"
const COLLISION_NONE := "no_collision"
const NAV_BLOCK := "block"
const NAV_SOFT_AVOID := "soft_avoid"
const NAV_IGNORE := "ignore"

const LAYER_GROUND_PATCH := "ground_patch"
const LAYER_GROUND_DECAL := "ground_decal"
const LAYER_TRAVEL_CORRIDOR := "travel_corridor"
const LAYER_HAZARD_DECAL := "hazard_decal"
const LAYER_BLOCKER_BACK := "blocker_back"
const LAYER_PROP_MID := "prop_mid"
const LAYER_ACTOR := "actor"
const LAYER_BLOCKER_FRONT := "blocker_front"
const LAYER_FOREGROUND_HINT := "foreground_hint"
const LAYER_DEBUG_OVERLAY := "debug_overlay"
const LAYERS := [
	LAYER_GROUND_PATCH,
	LAYER_GROUND_DECAL,
	LAYER_TRAVEL_CORRIDOR,
	LAYER_HAZARD_DECAL,
	LAYER_BLOCKER_BACK,
	LAYER_PROP_MID,
	LAYER_ACTOR,
	LAYER_BLOCKER_FRONT,
	LAYER_FOREGROUND_HINT,
	LAYER_DEBUG_OVERLAY,
]

const STATE_ALL := "all"
const STATE_BROADCAST_RECORD_3 := "broadcast_record_3"
const STATE_DESTROY_NODE := "destroy_node"
const STATE_EXTRACT_MEMORY := "extract_memory"

const ART_INBOX_PATHS := {
	"r01_tiles": "assets/art_inbox/r01_tiles/",
	"r01_ground_patches": "assets/art_inbox/r01_ground_patches/",
	"r01_props": "assets/art_inbox/r01_props/",
	"r01_decals": "assets/art_inbox/r01_decals/",
	"r01_hazards": "assets/art_inbox/r01_hazards/",
	"r01_map_markers": "assets/art_inbox/r01_map_markers/",
	"characters": "assets/art_inbox/characters/",
	"enemies": "assets/art_inbox/enemies/",
	"bosses": "assets/art_inbox/bosses/",
	"outpost": "assets/art_inbox/outpost/",
	"ui": "assets/art_inbox/ui/",
	"vfx": "assets/art_inbox/vfx/",
}

const ZONE_ANCHORS := {
	"silence_edge_start": Vector2(-2380, 1260),
	"outer_recovery_lane_anchor": Vector2(-1540, 1110),
	"subdivision_loop_center": Vector2(-640, 365),
	"open_house_street_anchor": Vector2(800, -210),
	"model_house_node_anchor": Vector2(2320, -1220),
	"drain_pocket_anchor": Vector2(180, 1280),
	"fake_return_route_anchor": Vector2(-1680, -520),
}

const KIND_DEFAULTS := {
	"floor": {"asset_key": "r01_ground_silence_edge_patch", "layer": LAYER_GROUND_PATCH, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "ground_readability", "shape": "rect", "size": Vector2(116, 56), "pivot": Vector2(58, 28), "tags": ["ground", "patch"]},
	"subdivision_road": {"asset_key": "r01_ground_subdivision_loop_road", "layer": LAYER_GROUND_PATCH, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "road_readability", "shape": "rect", "size": Vector2(840, 476), "pivot": Vector2(420, 238), "tags": ["ground", "road", "loop"]},
	"open_house_street": {"asset_key": "r01_ground_open_house_street", "layer": LAYER_GROUND_PATCH, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "risk_reward_street_readability", "shape": "rect", "size": Vector2(980, 360), "pivot": Vector2(490, 180), "tags": ["ground", "road", "open_house"]},
	"model_axis": {"asset_key": "r01_ground_model_house_axis", "layer": LAYER_TRAVEL_CORRIDOR, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "route_axis_readability", "shape": "rect", "size": Vector2(720, 90), "pivot": Vector2(360, 45), "tags": ["ground", "route", "model_house"]},
	"drain_ground": {"asset_key": "r01_ground_drain_pocket_dark_patch", "layer": LAYER_GROUND_PATCH, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "side_pocket_readability", "shape": "rect", "size": Vector2(600, 208), "pivot": Vector2(300, 104), "tags": ["ground", "drain", "side_pocket"]},
	"fake_ad_walkway": {"asset_key": "r01_decal_fake_return_broken_ad_path", "layer": LAYER_TRAVEL_CORRIDOR, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "false_route_visual_only", "shape": "rect", "size": Vector2(360, 118), "pivot": Vector2(180, 59), "tags": ["decal", "fake_return", "not_recovery_ui"]},
	"travel_path": {"asset_key": "r01_ground_travel_corridor", "layer": LAYER_TRAVEL_CORRIDOR, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "travel_corridor", "shape": "rect", "size": Vector2(96, 40), "pivot": Vector2(48, 20), "tags": ["ground", "route", "corridor"]},
	"house": {"asset_key": "r01_prop_house_front_repeat", "layer": LAYER_BLOCKER_BACK, "collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "hard_structure", "shape": "rect", "size": Vector2(106, 74), "pivot": Vector2(53, 58), "tags": ["house", "model_home", "blocker"]},
	"model_house": {"asset_key": "r01_prop_model_house_mass", "layer": LAYER_BLOCKER_BACK, "collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "large_objective_structure", "shape": "rect", "size": Vector2(154, 104), "pivot": Vector2(77, 84), "tags": ["house", "model_home", "objective", "blocker"]},
	"ad_device": {"asset_key": "r01_prop_large_ad_device", "layer": LAYER_BLOCKER_BACK, "collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "large_ad_device", "shape": "circle", "radius": 38.0, "size": Vector2(76, 88), "pivot": Vector2(38, 62), "tags": ["ad", "device", "blocker"]},
	"road_barrier": {"asset_key": "r01_prop_road_barrier_soft", "layer": LAYER_PROP_MID, "collision_class": COLLISION_SOFT, "nav_behavior": NAV_SOFT_AVOID, "risk_role": "lane_soft_blocker", "shape": "rect", "size": Vector2(74, 24), "pivot": Vector2(37, 24), "tags": ["barrier", "soft_blocker"]},
	"mailbox": {"asset_key": "r01_prop_mailbox_speaker", "layer": LAYER_PROP_MID, "collision_class": COLLISION_SOFT, "nav_behavior": NAV_SOFT_AVOID, "risk_role": "enemy_source", "shape": "circle", "radius": 18.0, "size": Vector2(38, 50), "pivot": Vector2(19, 40), "tags": ["mailbox", "speaker", "soft_blocker"]},
	"flyer": {"asset_key": "r01_hazard_flyer_pile", "layer": LAYER_HAZARD_DECAL, "collision_class": COLLISION_HAZARD, "nav_behavior": NAV_IGNORE, "risk_role": "flyer_drop_source", "shape": "circle", "radius": 32.0, "size": Vector2(64, 48), "pivot": Vector2(32, 24), "tags": ["hazard", "flyer", "passable"]},
	"scraps": {"asset_key": "r01_decal_paper_scraps", "layer": LAYER_GROUND_DECAL, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "density_only", "shape": "circle", "radius": 26.0, "size": Vector2(52, 40), "pivot": Vector2(26, 20), "tags": ["decal", "paper"]},
	"route": {"asset_key": "r01_decal_ad_path_arrow", "layer": LAYER_GROUND_DECAL, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "route_hint", "shape": "rect", "size": Vector2(96, 40), "pivot": Vector2(48, 20), "tags": ["decal", "route"]},
	"tag": {"asset_key": "r01_decal_customer_tag", "layer": LAYER_GROUND_DECAL, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "trace_decal", "shape": "rect", "size": Vector2(44, 24), "pivot": Vector2(22, 12), "tags": ["decal", "trace"]},
	"photo": {"asset_key": "r01_map_marker_photo_memory", "layer": LAYER_PROP_MID, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "photo_flash_or_memory", "shape": "circle", "radius": 24.0, "size": Vector2(42, 38), "pivot": Vector2(21, 24), "tags": ["trigger", "memory", "photo"]},
	"node": {"asset_key": "r01_prop_model_house_node", "layer": LAYER_BLOCKER_BACK, "collision_class": COLLISION_HARD, "nav_behavior": NAV_BLOCK, "risk_role": "objective_anchor", "shape": "circle", "radius": 48.0, "size": Vector2(96, 76), "pivot": Vector2(48, 42), "tags": ["objective", "node", "blocker"]},
	"kiosk": {"asset_key": "r01_prop_consultation_kiosk", "layer": LAYER_PROP_MID, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "elite_or_event_source", "shape": "rect", "size": Vector2(58, 54), "pivot": Vector2(29, 40), "tags": ["trigger", "kiosk", "event"]},
	"projector": {"asset_key": "r01_prop_doorbell_projector", "layer": LAYER_PROP_MID, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "photo_flash_source", "shape": "circle", "radius": 30.0, "size": Vector2(60, 42), "pivot": Vector2(30, 24), "tags": ["trigger", "projector"]},
	"floor_plan": {"asset_key": "r01_hazard_floor_plan_warning", "layer": LAYER_HAZARD_DECAL, "collision_class": COLLISION_HAZARD, "nav_behavior": NAV_IGNORE, "risk_role": "floor_plan_warning", "shape": "rect", "size": Vector2(96, 62), "pivot": Vector2(48, 31), "tags": ["hazard", "floor_plan", "passable"]},
	"sign": {"asset_key": "r01_prop_open_house_sign", "layer": LAYER_PROP_MID, "collision_class": COLLISION_SOFT, "nav_behavior": NAV_SOFT_AVOID, "risk_role": "route_funnel", "shape": "rect", "size": Vector2(68, 42), "pivot": Vector2(34, 36), "tags": ["sign", "soft_blocker"]},
	"drain": {"asset_key": "r01_hazard_drain_pocket", "layer": LAYER_HAZARD_DECAL, "collision_class": COLLISION_HAZARD, "nav_behavior": NAV_IGNORE, "risk_role": "slime_or_trace_pocket", "shape": "circle", "radius": 34.0, "size": Vector2(68, 58), "pivot": Vector2(34, 32), "tags": ["hazard", "drain", "passable"]},
	"crack": {"asset_key": "r01_decal_ground_crack", "layer": LAYER_GROUND_DECAL, "collision_class": COLLISION_NONE, "nav_behavior": NAV_IGNORE, "risk_role": "ground_trace", "shape": "rect", "size": Vector2(74, 28), "pivot": Vector2(37, 14), "tags": ["decal", "crack"]},
	"trace": {"asset_key": "r01_map_marker_trace_candidate", "layer": LAYER_PROP_MID, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "trace_anchor", "shape": "circle", "radius": 22.0, "size": Vector2(44, 44), "pivot": Vector2(22, 22), "tags": ["trigger", "trace"]},
	"speaker": {"asset_key": "r01_prop_streetlight_speaker", "layer": LAYER_PROP_MID, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "signal_event_source", "shape": "circle", "radius": 32.0, "size": Vector2(48, 78), "pivot": Vector2(24, 64), "tags": ["trigger", "speaker", "signal"]},
	"fake_recovery": {"asset_key": "r01_decal_fake_return_broken_ad_path", "layer": LAYER_GROUND_DECAL, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "false_route_signal_not_recovery_ui", "shape": "rect", "size": Vector2(66, 46), "pivot": Vector2(33, 23), "tags": ["trigger", "fake_return", "not_recovery_ui"]},
	"residue": {"asset_key": "r01_map_marker_transmitter_residue", "layer": LAYER_PROP_MID, "collision_class": COLLISION_TRIGGER, "nav_behavior": NAV_IGNORE, "risk_role": "transmitter_residue", "shape": "circle", "radius": 36.0, "size": Vector2(72, 72), "pivot": Vector2(36, 36), "tags": ["trigger", "residue", "signal"]},
}

const OBJECT_PLACEMENTS := [
	{"id": "silence_edge_ground_band", "asset_key": "r01_ground_silence_edge_wide_patch", "zone_id": "silence_edge_start", "offset": Vector2(90, -40), "kind": "floor", "size": Vector2(760, 620), "pivot": Vector2(380, 310), "state": STATE_ALL, "tags": ["silence_edge", "wide_patch"]},
	{"id": "outer_recovery_lane_ground", "asset_key": "r01_ground_outer_recovery_lane", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(0, 0), "kind": "floor", "size": Vector2(780, 360), "pivot": Vector2(390, 180), "state": STATE_ALL, "tags": ["outer_recovery", "wide_lane"]},
	{"id": "subdivision_loop_road_patch", "zone_id": "subdivision_loop_center", "offset": Vector2(0, 0), "kind": "subdivision_road", "state": STATE_ALL},
	{"id": "open_house_street_ground", "zone_id": "open_house_street_anchor", "offset": Vector2(0, 0), "kind": "open_house_street", "state": STATE_ALL},
	{"id": "model_house_visual_axis", "zone_id": "open_house_street_anchor", "offset": Vector2(620, -380), "kind": "model_axis", "state": STATE_ALL},
	{"id": "drain_pocket_dark_ground", "zone_id": "drain_pocket_anchor", "offset": Vector2(122, 12), "kind": "drain_ground", "state": STATE_ALL},
	{"id": "fake_return_ad_walkway_ground", "zone_id": "fake_return_route_anchor", "offset": Vector2(-40, -54), "kind": "fake_ad_walkway", "state": STATE_ALL},
	{"id": "corridor_silence_to_outer", "asset_key": "r01_ground_corridor_silence_to_outer", "zone_id": "silence_edge_start", "offset": Vector2(420, -76), "kind": "travel_path", "size": Vector2(760, 120), "pivot": Vector2(380, 60), "state": STATE_ALL, "tags": ["silence_edge", "outer_recovery"]},
	{"id": "corridor_outer_to_loop", "asset_key": "r01_ground_corridor_outer_to_loop", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(450, -372), "kind": "travel_path", "size": Vector2(980, 120), "pivot": Vector2(490, 60), "state": STATE_ALL, "tags": ["outer_recovery", "subdivision_loop"]},
	{"id": "corridor_loop_to_open_house", "asset_key": "r01_ground_corridor_loop_to_open_house", "zone_id": "subdivision_loop_center", "offset": Vector2(720, -288), "kind": "travel_path", "size": Vector2(1240, 120), "pivot": Vector2(620, 60), "state": STATE_ALL, "tags": ["subdivision_loop", "open_house"]},
	{"id": "corridor_open_house_to_model_house", "asset_key": "r01_ground_corridor_open_house_to_model_house", "zone_id": "open_house_street_anchor", "offset": Vector2(760, -505), "kind": "travel_path", "size": Vector2(1480, 120), "pivot": Vector2(740, 60), "state": STATE_ALL, "tags": ["open_house", "model_house"]},
	{"id": "corridor_loop_to_drain", "asset_key": "r01_ground_corridor_loop_to_drain", "zone_id": "subdivision_loop_center", "offset": Vector2(410, 458), "kind": "travel_path", "size": Vector2(760, 112), "pivot": Vector2(380, 56), "state": STATE_ALL, "tags": ["subdivision_loop", "drain"]},
	{"id": "corridor_loop_to_fake_return", "asset_key": "r01_decal_fake_return_corridor_hint", "zone_id": "subdivision_loop_center", "offset": Vector2(-520, -442), "kind": "travel_path", "size": Vector2(860, 112), "pivot": Vector2(430, 56), "state": STATE_ALL, "tags": ["subdivision_loop", "fake_return", "not_recovery_ui"]},
	{"id": "low_concentration_floor", "asset_key": "r01_ground_silence_edge_patch", "zone_id": "silence_edge_start", "offset": Vector2(-70, 30), "kind": "floor", "state": STATE_ALL, "tags": ["silence_edge"]},
	{"id": "sparse_flyer_scraps", "zone_id": "silence_edge_start", "offset": Vector2(18, -42), "kind": "scraps", "state": STATE_ALL},
	{"id": "weak_route_hint", "asset_key": "r01_decal_silence_edge_weak_route", "zone_id": "silence_edge_start", "offset": Vector2(96, 28), "kind": "route", "state": STATE_ALL},
	{"id": "distant_mailbox_hint", "zone_id": "silence_edge_start", "offset": Vector2(132, -72), "kind": "mailbox", "state": STATE_ALL},
	{"id": "quiet_service_van_shell", "asset_key": "r01_prop_quiet_service_van_barrier", "zone_id": "silence_edge_start", "offset": Vector2(-164, 82), "kind": "road_barrier", "state": STATE_ALL},
	{"id": "quiet_nameplate_marker", "asset_key": "r01_decal_quiet_nameplate_marker", "zone_id": "silence_edge_start", "offset": Vector2(-114, -48), "kind": "tag", "state": STATE_DESTROY_NODE},
	{"id": "blank_customer_photo_hint", "zone_id": "silence_edge_start", "offset": Vector2(-28, -104), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	{"id": "quiet_lane_marker", "asset_key": "r01_decal_outer_lane_marker", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(-130, -60), "kind": "route", "state": STATE_ALL, "tags": ["outer_recovery"]},
	{"id": "outpost_signal_scraps", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(122, 54), "kind": "scraps", "state": STATE_ALL, "tags": ["outer_recovery"]},
	{"id": "wide_return_barrier", "asset_key": "r01_prop_wide_lane_soft_barrier", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(220, -86), "kind": "road_barrier", "state": STATE_ALL, "tags": ["outer_recovery"]},
	{"id": "quiet_lane_mailbox", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(-240, 86), "kind": "mailbox", "state": STATE_ALL, "tags": ["outer_recovery", "mailbox"]},
	{"id": "house_front_placeholder", "asset_key": "r01_prop_house_front_01", "zone_id": "subdivision_loop_center", "offset": Vector2(-166, -116), "kind": "house", "state": STATE_ALL},
	{"id": "mirror_house_left", "asset_key": "r01_prop_house_front_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(-322, 132), "kind": "house", "state": STATE_ALL},
	{"id": "mirror_house_right", "asset_key": "r01_prop_house_front_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(282, -124), "kind": "house", "state": STATE_ALL},
	{"id": "sales_speaker_tower", "zone_id": "subdivision_loop_center", "offset": Vector2(248, 136), "kind": "ad_device", "state": STATE_ALL},
	{"id": "cul_de_sac_barrier", "zone_id": "subdivision_loop_center", "offset": Vector2(-22, -178), "kind": "road_barrier", "state": STATE_ALL},
	{"id": "mailbox_device_placeholder", "zone_id": "subdivision_loop_center", "offset": Vector2(-92, 118), "kind": "mailbox", "state": STATE_ALL},
	{"id": "flyer_pile_placeholder", "zone_id": "subdivision_loop_center", "offset": Vector2(42, 74), "kind": "flyer", "state": STATE_ALL},
	{"id": "price_customer_tag_placeholder", "zone_id": "subdivision_loop_center", "offset": Vector2(-118, -42), "kind": "tag", "state": STATE_ALL},
	{"id": "recommended_route_decal_placeholder", "asset_key": "r01_decal_subdivision_loop_recommended_route", "zone_id": "subdivision_loop_center", "offset": Vector2(154, -20), "kind": "route", "state": STATE_ALL},
	{"id": "same_house_repeat_marker", "zone_id": "subdivision_loop_center", "offset": Vector2(136, -146), "kind": "house", "state": STATE_BROADCAST_RECORD_3},
	{"id": "exposed_nameplate_marker", "zone_id": "subdivision_loop_center", "offset": Vector2(78, 112), "kind": "tag", "state": STATE_DESTROY_NODE},
	{"id": "family_window_photo_marker", "zone_id": "subdivision_loop_center", "offset": Vector2(-18, -132), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	{"id": "open_house_street_banner", "asset_key": "r01_prop_open_house_banner", "zone_id": "open_house_street_anchor", "offset": Vector2(-210, -82), "kind": "sign", "state": STATE_ALL, "tags": ["open_house", "signal_ticket"]},
	{"id": "open_house_checkin_kiosk", "zone_id": "open_house_street_anchor", "offset": Vector2(48, -36), "kind": "kiosk", "state": STATE_ALL, "tags": ["open_house", "checkin"]},
	{"id": "family_discount_projector", "zone_id": "open_house_street_anchor", "offset": Vector2(226, 70), "kind": "projector", "state": STATE_ALL, "tags": ["open_house", "family_ad"]},
	{"id": "guided_visit_floor_plan", "zone_id": "open_house_street_anchor", "offset": Vector2(-44, 130), "kind": "floor_plan", "state": STATE_ALL, "tags": ["open_house", "hazard"]},
	{"id": "open_house_flyer_spill", "zone_id": "open_house_street_anchor", "offset": Vector2(-260, 110), "kind": "flyer", "state": STATE_ALL, "tags": ["open_house", "flyer"]},
	{"id": "signal_residue_preview", "zone_id": "open_house_street_anchor", "offset": Vector2(280, -98), "kind": "residue", "state": STATE_BROADCAST_RECORD_3, "tags": ["open_house", "signal"]},
	{"id": "smile_home_photo_loop", "zone_id": "open_house_street_anchor", "offset": Vector2(116, -144), "kind": "photo", "state": STATE_EXTRACT_MEMORY, "tags": ["open_house", "memory"]},
	{"id": "model_house_mass_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(208, -118), "kind": "model_house", "state": STATE_ALL},
	{"id": "model_house_node_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(0, 18), "kind": "node", "state": STATE_ALL},
	{"id": "parking_demo_car", "asset_key": "r01_prop_parking_demo_car_barrier", "zone_id": "model_house_node_anchor", "offset": Vector2(-178, 132), "kind": "road_barrier", "state": STATE_ALL},
	{"id": "family_plan_terminal", "asset_key": "r01_prop_family_plan_ad_terminal", "zone_id": "model_house_node_anchor", "offset": Vector2(204, 126), "kind": "ad_device", "state": STATE_ALL},
	{"id": "consultation_kiosk_socket_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(-92, 62), "kind": "kiosk", "state": STATE_ALL},
	{"id": "family_window_loop_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(106, -70), "kind": "photo", "state": STATE_ALL},
	{"id": "doorbell_projector_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(96, 66), "kind": "projector", "state": STATE_ALL},
	{"id": "floor_plan_line_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(-38, 98), "kind": "floor_plan", "state": STATE_ALL},
	{"id": "open_house_direction_stack", "zone_id": "model_house_node_anchor", "offset": Vector2(-150, -38), "kind": "sign", "state": STATE_BROADCAST_RECORD_3},
	{"id": "dimmed_node_shell", "zone_id": "model_house_node_anchor", "offset": Vector2(36, -118), "kind": "tag", "state": STATE_DESTROY_NODE},
	{"id": "memory_afterimage_window", "zone_id": "model_house_node_anchor", "offset": Vector2(144, 4), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
	{"id": "toxic_ad_drain_placeholder", "zone_id": "drain_pocket_anchor", "offset": Vector2(-34, 2), "kind": "drain", "state": STATE_ALL},
	{"id": "muted_floor_crack", "zone_id": "drain_pocket_anchor", "offset": Vector2(58, -44), "kind": "crack", "state": STATE_ALL},
	{"id": "tiny_paper_fragments", "zone_id": "drain_pocket_anchor", "offset": Vector2(-86, 76), "kind": "scraps", "state": STATE_ALL},
	{"id": "trace_candidate_marker", "zone_id": "drain_pocket_anchor", "offset": Vector2(74, 72), "kind": "trace", "state": STATE_ALL},
	{"id": "quiet_drain_material_marker", "zone_id": "drain_pocket_anchor", "offset": Vector2(-98, -54), "kind": "trace", "state": STATE_DESTROY_NODE},
	{"id": "receipt_fragment_marker", "zone_id": "drain_pocket_anchor", "offset": Vector2(118, 10), "kind": "tag", "state": STATE_EXTRACT_MEMORY},
	{"id": "recommended_route_decal_placeholder_fake", "asset_key": "r01_decal_fake_return_broken_ad_path", "zone_id": "fake_return_route_anchor", "offset": Vector2(-74, 24), "kind": "route", "state": STATE_ALL, "tags": ["fake_return"]},
	{"id": "streetlight_speaker_placeholder", "zone_id": "fake_return_route_anchor", "offset": Vector2(48, -72), "kind": "speaker", "state": STATE_ALL},
	{"id": "closed_return_lane_barrier", "zone_id": "fake_return_route_anchor", "offset": Vector2(-164, 66), "kind": "road_barrier", "state": STATE_ALL, "tags": ["fake_return"]},
	{"id": "fake_recovery_marker", "zone_id": "fake_return_route_anchor", "offset": Vector2(62, 48), "kind": "fake_recovery", "state": STATE_ALL},
	{"id": "transmitter_residue_hint_placeholder", "zone_id": "fake_return_route_anchor", "offset": Vector2(-12, -118), "kind": "residue", "state": STATE_ALL},
	{"id": "broken_return_arrow", "asset_key": "r01_decal_fake_return_broken_arrow", "zone_id": "fake_return_route_anchor", "offset": Vector2(-128, -32), "kind": "route", "state": STATE_DESTROY_NODE, "tags": ["fake_return"]},
	{"id": "family_voice_risk_marker", "zone_id": "fake_return_route_anchor", "offset": Vector2(128, 10), "kind": "photo", "state": STATE_EXTRACT_MEMORY},
]

var _object_cache_variant := ""
var _object_cache: Array[Dictionary] = []

func reset_cache() -> void:
	_object_cache_variant = ""
	_object_cache.clear()

func object_field_names() -> Array[String]:
	return ["id", "asset_key", "kind", "zone_id", "pos", "offset", "size", "pivot", "layer", "collision_class", "nav_behavior", "state", "placement", "tags"]

func art_inbox_paths() -> Dictionary:
	return ART_INBOX_PATHS.duplicate(true)

func object_count(variant: String = STATE_ALL) -> int:
	return objects_for_state(variant).size()

func objects_for_state(variant: String = STATE_ALL) -> Array[Dictionary]:
	if _object_cache_variant == variant:
		return _object_cache.duplicate(true)
	var objects: Array[Dictionary] = []
	for placement in OBJECT_PLACEMENTS:
		if not object_visible_for_variant(placement, variant):
			continue
		objects.append(_build_object(placement))
	_object_cache_variant = variant
	_object_cache = objects
	return objects.duplicate(true)

func objects_for_layer(layer: String, variant: String = STATE_ALL) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for object in objects_for_state(variant):
		if String(object.get("layer", "")) == layer:
			result.append(object)
	return result

func collision_records(variant: String = STATE_ALL) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for object in objects_for_state(variant):
		records.append(collision_record_from_object(object))
	return records

func collision_record_from_object(object: Dictionary) -> Dictionary:
	return {
		"asset_id": String(object.get("id", "")),
		"asset_key": String(object.get("asset_key", "")),
		"zone_id": String(object.get("zone_id", "")),
		"kind": String(object.get("kind", "")),
		"pos": Vector2(object.get("pos", Vector2.ZERO)),
		"shape": String(object.get("shape", "circle")),
		"size": Vector2(object.get("size", Vector2(24, 24))),
		"radius": float(object.get("radius", 12.0)),
		"collision_class": String(object.get("collision_class", COLLISION_NONE)),
		"nav_behavior": String(object.get("nav_behavior", NAV_IGNORE)),
		"risk_role": String(object.get("risk_role", "unknown")),
		"layer": String(object.get("layer", LAYER_PROP_MID)),
		"tags": Array(object.get("tags", [])),
		"debug_label": "%s/%s/%s" % [String(object.get("layer", "")), String(object.get("zone_id", "")), String(object.get("id", ""))],
	}

func prop_counts_for_state(variant: String = STATE_ALL) -> Dictionary:
	var counts := {}
	for zone_id in ZONE_ANCHORS.keys():
		counts[zone_id] = 0
	for object in objects_for_state(variant):
		var zone_id := String(object.get("zone_id", ""))
		counts[zone_id] = int(counts.get(zone_id, 0)) + 1
	return counts

func layer_summary(variant: String = STATE_ALL) -> Dictionary:
	var summary := {}
	for layer in LAYERS:
		summary[layer] = 0
	for object in objects_for_state(variant):
		var layer := String(object.get("layer", LAYER_PROP_MID))
		summary[layer] = int(summary.get(layer, 0)) + 1
	return summary

func asset_key_sample(variant: String = STATE_ALL, limit: int = 6) -> Array[String]:
	var sample: Array[String] = []
	for object in objects_for_state(variant):
		var key := String(object.get("asset_key", ""))
		if key == "" or sample.has(key):
			continue
		sample.append(key)
		if sample.size() >= limit:
			break
	return sample

func collision_summary(variant: String = STATE_ALL) -> Dictionary:
	var summary := {
		COLLISION_HARD: 0,
		COLLISION_SOFT: 0,
		COLLISION_HAZARD: 0,
		COLLISION_TRIGGER: 0,
		COLLISION_NONE: 0,
	}
	for object in objects_for_state(variant):
		var collision_class := String(object.get("collision_class", COLLISION_NONE))
		summary[collision_class] = int(summary.get(collision_class, 0)) + 1
	return summary

func collision_meta_for_kind(kind: String) -> Dictionary:
	return KIND_DEFAULTS.get(kind, {
		"collision_class": COLLISION_NONE,
		"nav_behavior": NAV_IGNORE,
		"risk_role": "unknown",
		"shape": "circle",
		"radius": 12.0,
		"size": Vector2(24, 24),
		"pivot": Vector2(12, 12),
		"layer": LAYER_PROP_MID,
		"asset_key": "r01_unknown_placeholder",
		"tags": [],
	}).duplicate(true)

func object_visible_for_variant(object: Dictionary, variant: String) -> bool:
	var state := String(object.get("state", STATE_ALL))
	return state == STATE_ALL or state == variant

func layer_rank(layer: String) -> int:
	var rank := LAYERS.find(layer)
	return rank if rank >= 0 else LAYERS.size()

func _build_object(placement: Dictionary) -> Dictionary:
	var kind := String(placement.get("kind", ""))
	var defaults := collision_meta_for_kind(kind)
	var object := defaults.duplicate(true)
	var zone_id := String(placement.get("zone_id", ""))
	var offset := Vector2(placement.get("offset", Vector2.ZERO))
	object.merge(placement, true)
	object["id"] = String(placement.get("id", kind))
	object["kind"] = kind
	object["zone_id"] = zone_id
	object["offset"] = offset
	object["pos"] = Vector2(placement.get("pos", ZONE_ANCHORS.get(zone_id, Vector2.ZERO) + offset))
	object["asset_key"] = String(placement.get("asset_key", defaults.get("asset_key", "r01_unknown_placeholder")))
	object["layer"] = String(placement.get("layer", defaults.get("layer", LAYER_PROP_MID)))
	object["collision_class"] = String(placement.get("collision_class", defaults.get("collision_class", COLLISION_NONE)))
	object["nav_behavior"] = String(placement.get("nav_behavior", defaults.get("nav_behavior", NAV_IGNORE)))
	object["state"] = String(placement.get("state", STATE_ALL))
	object["placement"] = String(placement.get("placement", "world"))
	object["size"] = Vector2(placement.get("size", defaults.get("size", Vector2(24, 24))))
	object["pivot"] = Vector2(placement.get("pivot", defaults.get("pivot", object["size"] * 0.5)))
	var tags: Array = Array(defaults.get("tags", [])).duplicate()
	for tag in Array(placement.get("tags", [])):
		if not tags.has(tag):
			tags.append(tag)
	object["tags"] = tags
	return object
