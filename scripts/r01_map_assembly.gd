extends RefCounted

const NPCPresence := preload("res://scripts/npc_presence.gd")

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
	{"id": "outer_lane_left_house_mass", "asset_key": "r01_prop_outer_lane_house_shadow", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(92, -188), "kind": "house", "state": STATE_ALL, "tags": ["outer_recovery", "hard_lane_edge"]},
	{"id": "outer_lane_right_house_mass", "asset_key": "r01_prop_outer_lane_house_shadow", "zone_id": "outer_recovery_lane_anchor", "offset": Vector2(386, 112), "kind": "house", "state": STATE_ALL, "tags": ["outer_recovery", "hard_lane_edge"]},
	{"id": "house_front_placeholder", "asset_key": "r01_prop_house_front_01", "zone_id": "subdivision_loop_center", "offset": Vector2(-166, -116), "kind": "house", "state": STATE_ALL},
	{"id": "mirror_house_left", "asset_key": "r01_prop_house_front_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(-322, 132), "kind": "house", "state": STATE_ALL},
	{"id": "mirror_house_right", "asset_key": "r01_prop_house_front_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(282, -124), "kind": "house", "state": STATE_ALL},
	{"id": "loop_north_house_wall_a", "asset_key": "r01_prop_loop_house_wall_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(-448, -220), "kind": "house", "state": STATE_ALL, "tags": ["subdivision_loop", "hard_lane_edge"]},
	{"id": "loop_north_house_wall_b", "asset_key": "r01_prop_loop_house_wall_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(424, -214), "kind": "house", "state": STATE_ALL, "tags": ["subdivision_loop", "hard_lane_edge"]},
	{"id": "loop_south_house_wall_a", "asset_key": "r01_prop_loop_house_wall_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(-420, 262), "kind": "house", "state": STATE_ALL, "tags": ["subdivision_loop", "hard_lane_edge"]},
	{"id": "loop_south_house_wall_b", "asset_key": "r01_prop_loop_house_wall_repeat", "zone_id": "subdivision_loop_center", "offset": Vector2(390, 252), "kind": "house", "state": STATE_ALL, "tags": ["subdivision_loop", "hard_lane_edge"]},
	{"id": "sales_speaker_tower", "zone_id": "subdivision_loop_center", "offset": Vector2(248, 136), "kind": "ad_device", "state": STATE_ALL},
	{"id": "cul_de_sac_barrier", "zone_id": "subdivision_loop_center", "offset": Vector2(-22, -178), "kind": "road_barrier", "state": STATE_ALL},
	{"id": "mailbox_device_placeholder", "zone_id": "subdivision_loop_center", "offset": Vector2(-92, 118), "kind": "mailbox", "state": STATE_ALL},
	{"id": "loop_side_mailbox_left", "asset_key": "r01_prop_mailbox_speaker", "zone_id": "subdivision_loop_center", "offset": Vector2(-276, -18), "kind": "mailbox", "state": STATE_ALL, "tags": ["subdivision_loop", "enemy_source"]},
	{"id": "loop_side_mailbox_right", "asset_key": "r01_prop_mailbox_speaker", "zone_id": "subdivision_loop_center", "offset": Vector2(310, 36), "kind": "mailbox", "state": STATE_ALL, "tags": ["subdivision_loop", "enemy_source"]},
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
	{"id": "open_house_queue_barrier_left", "asset_key": "r01_prop_open_house_queue_barrier", "zone_id": "open_house_street_anchor", "offset": Vector2(-352, -18), "kind": "road_barrier", "state": STATE_ALL, "tags": ["open_house", "soft_lane_edge"]},
	{"id": "open_house_queue_barrier_right", "asset_key": "r01_prop_open_house_queue_barrier", "zone_id": "open_house_street_anchor", "offset": Vector2(350, 18), "kind": "road_barrier", "state": STATE_ALL, "tags": ["open_house", "soft_lane_edge"]},
	{"id": "open_house_sprinkler_hazard", "asset_key": "r01_hazard_open_house_sprinkler_path", "zone_id": "open_house_street_anchor", "offset": Vector2(154, 132), "kind": "floor_plan", "state": STATE_ALL, "tags": ["open_house", "passable_hazard"]},
	{"id": "signal_residue_preview", "zone_id": "open_house_street_anchor", "offset": Vector2(280, -98), "kind": "residue", "state": STATE_BROADCAST_RECORD_3, "tags": ["open_house", "signal"]},
	{"id": "smile_home_photo_loop", "zone_id": "open_house_street_anchor", "offset": Vector2(116, -144), "kind": "photo", "state": STATE_EXTRACT_MEMORY, "tags": ["open_house", "memory"]},
	{"id": "model_house_mass_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(208, -118), "kind": "model_house", "state": STATE_ALL},
	{"id": "model_house_node_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(0, 18), "kind": "node", "state": STATE_ALL},
	{"id": "parking_demo_car", "asset_key": "r01_prop_parking_demo_car_barrier", "zone_id": "model_house_node_anchor", "offset": Vector2(-178, 132), "kind": "road_barrier", "state": STATE_ALL},
	{"id": "family_plan_terminal", "asset_key": "r01_prop_family_plan_ad_terminal", "zone_id": "model_house_node_anchor", "offset": Vector2(204, 126), "kind": "ad_device", "state": STATE_ALL},
	{"id": "consultation_kiosk_socket_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(-92, 62), "kind": "kiosk", "state": STATE_ALL},
	{"id": "family_window_loop_placeholder", "zone_id": "model_house_node_anchor", "offset": Vector2(106, -70), "kind": "photo", "state": STATE_ALL},
	{"id": "model_approach_left_house_mass", "asset_key": "r01_prop_model_approach_house_mass", "zone_id": "model_house_node_anchor", "offset": Vector2(-342, -118), "kind": "house", "state": STATE_ALL, "tags": ["model_house", "hard_lane_edge"]},
	{"id": "model_approach_right_house_mass", "asset_key": "r01_prop_model_approach_house_mass", "zone_id": "model_house_node_anchor", "offset": Vector2(358, 104), "kind": "house", "state": STATE_ALL, "tags": ["model_house", "hard_lane_edge"]},
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

const STORY_OBJECT_PLACEMENTS := [
	{
		"id": "r01_story_l01_mailbox",
		"display_name": "우편함",
		"zone_id": "silence_edge_start",
		"offset": Vector2(188, -108),
		"kind": "mailbox",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "조사",
		"interaction_prompt": "우편함 조사",
		"result_phrase": "주소가 반복됩니다. 사람은 확인되지 않았습니다.",
		"repeat_phrase": "같은 주소 안내만 다시 나옵니다.",
		"campaign_effect": "mailbox_address_duplicate",
		"tag_hint": "식량태그 후보가 아니라 주소 중복 근거입니다.",
		"signal_hint": "MAIL-LOOP 잔향: 주소와 사람 확인은 다릅니다.",
		"risk_hint": "쿠폰/전단 source 위치가 잠깐 선명해집니다.",
		"outpost_reaction": "정산 카운터가 주소 중복 기록을 태그가 아닌 근거 칸에 둡니다.",
		"facility_id": "settlement_counter",
		"npc_id": "mina",
		"node_memory_phrase": "우편함 주소 중복",
		"reveal_spawn_roles": ["coupon", "basic"],
		"reveal_hazard_roles": ["flyer_drop"],
	},
	{
		"id": "r01_story_l01_outer_sign",
		"display_name": "오래된 공공 안내판",
		"zone_id": "silence_edge_start",
		"offset": Vector2(76, 84),
		"kind": "sign",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "확인",
		"interaction_prompt": "공공 안내판 확인",
		"result_phrase": "공공 대피 안내는 오래전에 멈췄습니다. 그 위로 스마일홈 라벨만 갱신됩니다.",
		"repeat_phrase": "시민 안내는 꺼졌고, 입주 보정만 남았습니다.",
		"campaign_effect": "old_public_notice_checked",
		"tag_hint": "태그 없음. R01이 더 오래된 생활권 위에 덧씌워진 캠페인임을 고정합니다.",
		"signal_hint": "권리 안내: 응답 없음. 가족 구성 보정: 활성.",
		"risk_hint": "비전투 앵커입니다. source 처리가 아니라 세계 기준을 확인합니다.",
		"outpost_reaction": "출격 게시판이 오래된 공공 안내판을 첫 30분 기준 앵커로 고정합니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "공공 안내 정지 / 스마일홈 라벨 갱신",
		"noncombat_anchor": true,
	},
	{
		"id": "r01_story_l01_revision_label",
		"display_name": "14차 갱신 라벨",
		"zone_id": "silence_edge_start",
		"offset": Vector2(118, 42),
		"kind": "tag",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "대조",
		"interaction_prompt": "14차 갱신 라벨 확인",
		"result_phrase": "스마일홈 가족 구성 보정 14차. 14년은 대사고 후 시간이 아니라 가족 복구 운용 회차입니다.",
		"repeat_phrase": "14차 갱신 라벨은 연도 표식이 아니라 빈 세대 재배정 기준 수정으로 남아 있습니다.",
		"campaign_effect": "revision_label_14_checked",
		"tag_hint": "태그 없음. 가족 복구 운용 14차 기준.",
		"signal_hint": "가족 복구 운용 14차. 방문 기록 재해석 중.",
		"risk_hint": "비전투 앵커입니다. 라벨은 전투 source가 아니라 운용 회차 표식입니다.",
		"outpost_reaction": "출격 게시판이 14차 갱신을 대사고 후 연도가 아닌 가족 복구 운용 회차로 표시합니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "14차 가족 복구 운용 라벨 확인",
		"noncombat_anchor": true,
	},
	{
		"id": "r01_story_l01_recovery_trace",
		"display_name": "회수선 흔적",
		"zone_id": "outer_recovery_lane_anchor",
		"offset": Vector2(-86, 16),
		"kind": "trace",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "신호 확인",
		"interaction_prompt": "회수선 신호 확인",
		"result_phrase": "회수선은 살아 있지만 안쪽으로 갈수록 얇아집니다.",
		"repeat_phrase": "같은 회수선 떨림만 다시 느껴집니다.",
		"campaign_effect": "recovery_line_checked",
		"tag_hint": "충전태그가 아니라 인양 안정도 단서입니다.",
		"signal_hint": "보급소 회수선과 광고 표지의 결이 다릅니다.",
		"risk_hint": "외곽 기준에서 벗어난 source가 짧게 표시됩니다.",
		"outpost_reaction": "도윤이 회수선이 끊길 뻔한 위치를 정비대 지도에 표시합니다.",
		"facility_id": "maintenance_bench",
		"npc_id": "doyun",
		"node_memory_phrase": "회수선 안정 확인",
		"reveal_hazard_roles": ["warning_line"],
	},
	{
		"id": "r01_story_l02_mailbox",
		"display_name": "우편함",
		"zone_id": "subdivision_loop_center",
		"offset": Vector2(-152, 108),
		"kind": "mailbox",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "조사",
		"interaction_prompt": "우편함 조사",
		"result_phrase": "가족 수령 대기. 주소는 둘인데 수령인은 비어 있습니다.",
		"repeat_phrase": "비어 있는 수령인 칸만 다시 깜박입니다.",
		"campaign_effect": "mailbox_address_duplicate",
		"tag_hint": "식량태그 후보 힌트: 배급 기록은 사람 이름이 아닙니다.",
		"signal_hint": "우편함 잔향이 같은 주소를 반복합니다.",
		"risk_hint": "쿠폰/전단 source가 더 잘 보입니다.",
		"outpost_reaction": "정산 카운터가 우편함 주소 중복 기록에 보류 딱지를 붙입니다.",
		"facility_id": "settlement_counter",
		"npc_id": "mina",
		"node_memory_phrase": "우편함 주소 중복",
		"reveal_spawn_roles": ["coupon", "fast"],
		"reveal_hazard_roles": ["flyer_drop"],
	},
	{
		"id": "r01_story_l02_front_sensor",
		"display_name": "현관 센서",
		"zone_id": "subdivision_loop_center",
		"offset": Vector2(66, -126),
		"kind": "projector",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "검증",
		"interaction_prompt": "현관 센서 검증",
		"result_phrase": "방문 심사 ping. 윤서의 이름칸은 아직 비어 있습니다.",
		"repeat_phrase": "같은 방문 심사 ping만 반복됩니다.",
		"campaign_effect": "front_sensor_warning",
		"tag_hint": "충전태그 후보 힌트: 홈케어 장치가 재동기화를 시도합니다.",
		"signal_hint": "센서 신호가 speaker/charger source와 연결됩니다.",
		"risk_hint": "주변 charger/speaker source가 잠깐 드러납니다.",
		"outpost_reaction": "정비대가 현관 센서 노이즈를 충전태그가 아닌 검수 흔적으로 묶습니다.",
		"facility_id": "maintenance_bench",
		"npc_id": "doyun",
		"node_memory_phrase": "현관 센서 노이즈",
		"reveal_spawn_roles": ["charger", "speaker"],
		"reveal_hazard_roles": ["warning_line"],
	},
	{
		"id": "r01_story_l02_closed_door",
		"display_name": "문패",
		"zone_id": "subdivision_loop_center",
		"offset": Vector2(236, -112),
		"kind": "tag",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "도장 찍기",
		"interaction_prompt": "문패 도장 찍기",
		"result_phrase": "문패 아래 원래 이름 조각과 덮인 고객 라벨이 같이 드러납니다.",
		"repeat_phrase": "문패는 윤서 이름을 세대 칸에 넣지 못하고 고객 보류로 접힙니다.",
		"campaign_effect": "closed_door_stamp",
		"tag_hint": "거주권 보상이 아니라 입주 심사 거절 근거입니다.",
		"signal_hint": "문패 아래 이름 흔적이 작전도에 남습니다.",
		"risk_hint": "반복 현관의 경고선이 짧게 약해집니다.",
		"outpost_reaction": "이름 보관함이 닫힌 문 아래 문패 흔적을 임시 칸에 세웁니다.",
		"facility_id": "name_archive",
		"npc_id": "bokhee",
		"node_memory_phrase": "문패 이름 라벨 보류",
		"reveal_hazard_roles": ["warning_line"],
	},
	{
		"id": "r01_story_l02_family_window",
		"display_name": "가족사진 창문",
		"zone_id": "subdivision_loop_center",
		"offset": Vector2(-24, -156),
		"kind": "photo",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "조사",
		"interaction_prompt": "가족사진 창문 조사",
		"result_phrase": "손잡은 자세와 빈 얼굴 프레임이 광고 모델 얼굴 아래에 남았습니다.",
		"repeat_phrase": "가족사진 창문은 광고 가족에서 빈 얼굴로 다시 접힙니다.",
		"campaign_effect": "family_photo_memory",
		"tag_hint": "식량태그가 아니라 이름 보관함으로 갈 기억 후보입니다.",
		"signal_hint": "가족 슬롯 잔향이 모델하우스 심사와 이어집니다.",
		"risk_hint": "가족사진 source가 심사 신호를 예고합니다.",
		"outpost_reaction": "복희가 사진의 빈칸을 이름 대신 보류 표식으로 보관합니다.",
		"facility_id": "name_archive",
		"npc_id": "bokhee",
		"node_memory_phrase": "가족사진 빈칸",
		"reveal_spawn_roles": ["signal"],
		"reveal_hazard_roles": ["warning_line"],
	},
	{
		"id": "r01_story_l03_consultation_booth",
		"display_name": "상담 부스",
		"zone_id": "model_house_node_anchor",
		"offset": Vector2(-132, 58),
		"kind": "kiosk",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "검증",
		"interaction_prompt": "상담 부스 검증",
		"result_phrase": "질문지가 답을 기다리지 않고 가족 구성을 인쇄합니다.",
		"repeat_phrase": "질문지는 같은 빈칸을 다시 요구합니다.",
		"campaign_effect": "consultation_question_held",
		"tag_hint": "수신태그 후보 힌트: 질문 보류 기록이 생겼습니다.",
		"signal_hint": "상담선이 모델하우스 결절로 이어집니다.",
		"risk_hint": "상담/스피커 source가 짧게 표시됩니다.",
		"outpost_reaction": "출격 게시판이 상담 부스 질문 보류 기록을 심사 접근 경고로 붙입니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "상담 질문 보류",
		"reveal_spawn_roles": ["elite", "signal", "speaker"],
		"reveal_hazard_roles": ["pressure_ring"],
	},
	{
		"id": "r01_story_l03_model_entry",
		"display_name": "모델하우스 입구",
		"zone_id": "model_house_node_anchor",
		"offset": Vector2(196, -42),
		"kind": "model_house",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "조사",
		"interaction_prompt": "모델하우스 입구 조사",
		"result_phrase": "모델하우스 입구가 윤서를 가족 심사 대상이 아니라 반려 항목으로 읽습니다.",
		"repeat_phrase": "모델하우스 입구의 심사선은 이미 표시됐습니다.",
		"campaign_effect": "model_house_access_warning",
		"tag_hint": "대량 보상 없음. 결절 접근 근거만 작전도에 남습니다.",
		"signal_hint": "스마일 홈 심사관 접근 경고가 켜집니다.",
		"risk_hint": "L03 심사 신호 source가 잠깐 보입니다.",
		"outpost_reaction": "이름 보관함과 출격 게시판이 심사 접근 경고를 같은 줄에 겹쳐 둡니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "모델하우스 심사 접근",
		"reveal_spawn_roles": ["signal", "speaker", "elite"],
		"reveal_hazard_roles": ["pressure_ring", "warning_line"],
	},
	{
		"id": "r01_story_l03_name_register",
		"display_name": "이름 등록 장치",
		"zone_id": "model_house_node_anchor",
		"offset": Vector2(52, 116),
		"kind": "ad_device",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "도장 찍기",
		"interaction_prompt": "이름 등록 장치 도장",
		"result_phrase": "등록 칸이 반품 처리됐습니다. 이름은 아직 장치에 들어가지 않았습니다.",
		"repeat_phrase": "등록 칸은 이미 반품 도장으로 막혀 있습니다.",
		"campaign_effect": "name_register_rejected",
		"tag_hint": "태그 지급 없음. 이름 보존 기억만 갱신합니다.",
		"signal_hint": "이름 등록 실패 로그가 보급소로 넘어갑니다.",
		"risk_hint": "등록 장치 주변 charger/source가 표시됩니다.",
		"outpost_reaction": "복희가 이름 등록 실패 로그를 이름 보관함의 빈칸 옆에 놓습니다.",
		"facility_id": "name_archive",
		"npc_id": "bokhee",
		"node_memory_phrase": "이름 등록 반려",
		"reveal_spawn_roles": ["charger", "signal"],
		"reveal_hazard_roles": ["warning_line"],
	},
	{
		"id": "r01_story_l03_speaker_pillar",
		"display_name": "스피커/광고 기둥",
		"zone_id": "model_house_node_anchor",
		"offset": Vector2(-218, -28),
		"kind": "speaker",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "신호 확인",
		"interaction_prompt": "광고 기둥 신호 확인",
		"result_phrase": "광고 기둥이 귀환 안내 대신 심사 예약음을 냅니다.",
		"repeat_phrase": "심사 예약음은 이미 출격 게시판에 남았습니다.",
		"campaign_effect": "speaker_signal_checked",
		"tag_hint": "수신태그 후보 힌트: 안내와 심사 예약음을 구분했습니다.",
		"signal_hint": "스피커 잔향이 결절 접근로를 가리킵니다.",
		"risk_hint": "speaker/source 위치가 더 선명합니다.",
		"outpost_reaction": "세븐이 스피커 예약음을 송출 기록 후보로 보류합니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "스피커 심사 예약음",
		"reveal_spawn_roles": ["speaker", "signal"],
		"reveal_hazard_roles": ["pressure_ring"],
	},
	{
		"id": "r01_story_l04_drain_trace",
		"display_name": "배수구 흔적",
		"zone_id": "drain_pocket_anchor",
		"offset": Vector2(-42, -6),
		"kind": "drain",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "회수",
		"interaction_prompt": "배수구 흔적 회수",
		"result_phrase": "젖은 전단이 광고음을 먹먹하게 눌러 둡니다.",
		"repeat_phrase": "젖은 전단은 더 회수되지 않습니다.",
		"campaign_effect": "drain_low_signal_trace",
		"tag_hint": "충전태그/수신태그 후보 힌트: 낮은 신호 근거입니다.",
		"signal_hint": "배수로의 낮은 신호가 보급소 보관실로 넘어갑니다.",
		"risk_hint": "L04 hazard 위치가 짧게 표시됩니다.",
		"outpost_reaction": "흔적 보관실이 젖은 전단을 낮은 신호 칸에 둡니다.",
		"facility_id": "trace_storage_room",
		"npc_id": "bokhee",
		"node_memory_phrase": "젖은 전단 회수",
		"reveal_spawn_roles": ["signal", "tank"],
		"reveal_hazard_roles": ["low_signal", "silence_leak"],
	},
	{
		"id": "r01_story_l04_wet_flyer",
		"display_name": "젖은 전단",
		"zone_id": "drain_pocket_anchor",
		"offset": Vector2(-108, 86),
		"kind": "scraps",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "회수",
		"interaction_prompt": "젖은 전단 회수",
		"result_phrase": "전단은 젖어 있어서 쿠폰이 아니라 기록처럼 남았습니다.",
		"repeat_phrase": "남은 종이는 더 이상 읽히지 않습니다.",
		"campaign_effect": "wet_flyer_stored",
		"tag_hint": "전단 수치 지급 없음. 보류 흔적만 보관됩니다.",
		"signal_hint": "물 먹은 글자가 광고 반복을 흐립니다.",
		"risk_hint": "낮은 신호 hazard가 잠깐 표시됩니다.",
		"outpost_reaction": "흔적 보관실이 젖은 전단을 소모하지 않고 말립니다.",
		"facility_id": "trace_storage_room",
		"npc_id": "bokhee",
		"node_memory_phrase": "젖은 전단 보관",
		"reveal_hazard_roles": ["low_signal"],
	},
	{
		"id": "r01_story_l04_low_signal",
		"display_name": "낮은 신호 흔적",
		"zone_id": "drain_pocket_anchor",
		"offset": Vector2(106, 66),
		"kind": "trace",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "신호 확인",
		"interaction_prompt": "낮은 신호 확인",
		"result_phrase": "광고음이 잠깐 내려앉고 회수선 떨림만 남습니다.",
		"repeat_phrase": "낮은 신호는 이미 보급소 쪽으로 기록됐습니다.",
		"campaign_effect": "low_signal_checked",
		"tag_hint": "수신태그 후보가 아니라 회수선 안정도 단서입니다.",
		"signal_hint": "배수로 신호는 약하지만 가짜 귀환음과 다릅니다.",
		"risk_hint": "L04 저신호 source가 표시됩니다.",
		"outpost_reaction": "출격 게시판이 배수로 신호를 조용한 우회 후보로 표시합니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "낮은 신호 확인",
		"reveal_spawn_roles": ["signal"],
		"reveal_hazard_roles": ["low_signal", "silence_leak"],
	},
	{
		"id": "r01_story_l05_fake_return_sign",
		"display_name": "가짜 회수 표식",
		"zone_id": "fake_return_route_anchor",
		"offset": Vector2(64, 52),
		"kind": "fake_recovery",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "검증",
		"interaction_prompt": "가짜 회수 표식 검증",
		"result_phrase": "보급소 표식처럼 보이지만 회수선 출처가 맞지 않습니다.",
		"repeat_phrase": "가짜 회수 표식은 이미 보급소 침묵 없음으로 반려됐습니다.",
		"campaign_effect": "fake_return_verified",
		"tag_hint": "식량태그 후보처럼 보이지만 오염 위험이 먼저 표시됩니다.",
		"signal_hint": "수신태그 없이 따르면 출처 불인정 위험이 큽니다.",
		"risk_hint": "L05 위험 source가 드러납니다.",
		"outpost_reaction": "출격 게시판이 해당 회수선 출처를 인정하지 않음으로 표시합니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "가짜 회수 표식 반려",
		"reveal_spawn_roles": ["fast", "speaker", "charger"],
		"reveal_hazard_roles": ["fake_return", "rear_pincer", "warning_line"],
	},
	{
		"id": "r01_story_l05_unstable_line",
		"display_name": "불안정 회수선",
		"zone_id": "fake_return_route_anchor",
		"offset": Vector2(-42, -112),
		"kind": "residue",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "신호 확인",
		"interaction_prompt": "불안정 회수선 확인",
		"result_phrase": "회수선처럼 떨리지만 보급소 쪽 침묵이 없습니다.",
		"repeat_phrase": "불안정 떨림은 이미 가짜 경로로 분류됐습니다.",
		"campaign_effect": "unstable_recovery_line_marked",
		"tag_hint": "수신태그 후보 힌트: 출처 대조가 필요합니다.",
		"signal_hint": "가짜 귀환음과 진짜 인양음을 분리했습니다.",
		"risk_hint": "뒤쪽 포위 source가 잠깐 표시됩니다.",
		"outpost_reaction": "회수 플랫폼이 불안정 회수선을 인양 경로에서 제외합니다.",
		"facility_id": "recovery_platform",
		"npc_id": "doyun",
		"node_memory_phrase": "불안정 회수선 제외",
		"reveal_spawn_roles": ["fast", "speaker"],
		"reveal_hazard_roles": ["rear_pincer", "fake_return"],
	},
	{
		"id": "r01_story_l05_rear_ad_pillar",
		"display_name": "뒤쪽 광고 기둥",
		"zone_id": "fake_return_route_anchor",
		"offset": Vector2(116, -82),
		"kind": "speaker",
		"collision_class": COLLISION_TRIGGER,
		"nav_behavior": NAV_IGNORE,
		"interaction_type": "신호 확인",
		"interaction_prompt": "뒤쪽 광고 기둥 확인",
		"result_phrase": "광고 기둥은 돌아가라는 말보다 돌아온 척하라는 말을 반복합니다.",
		"repeat_phrase": "뒤쪽 기둥의 반복 문구는 이미 기록됐습니다.",
		"campaign_effect": "rear_ad_pillar_checked",
		"tag_hint": "수신태그 후보 힌트: 반복 문구 출처를 구분했습니다.",
		"signal_hint": "SIGN-BACK 잔향이 가짜 귀환로 뒤쪽에 남습니다.",
		"risk_hint": "스피커/빠른 쿠폰 source가 표시됩니다.",
		"outpost_reaction": "세븐이 뒤쪽 광고 기둥의 반복 문구를 가짜 귀환로 경고에 붙입니다.",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"node_memory_phrase": "뒤쪽 광고 기둥",
		"reveal_spawn_roles": ["speaker", "fast"],
		"reveal_hazard_roles": ["rear_pincer"],
	},
]

var _object_cache_variant := ""
var _object_cache: Array[Dictionary] = []
var _story_object_cache_variant := ""
var _story_object_cache: Array[Dictionary] = []

func reset_cache() -> void:
	_object_cache_variant = ""
	_object_cache.clear()
	_story_object_cache_variant = ""
	_story_object_cache.clear()

func object_field_names() -> Array[String]:
	return ["id", "asset_key", "kind", "zone_id", "pos", "offset", "size", "pivot", "layer", "collision_class", "nav_behavior", "state", "state_variant", "placement", "tags", "spawn_influence", "story_role", "source_role", "spawn_roles", "hazard_roles", "pressure_tags", "story_function", "display_name", "interaction_type", "interaction_prompt", "result_phrase", "repeat_phrase", "campaign_effect", "tag_hint", "signal_hint", "risk_hint", "field_trace_id", "human_trace_type"]

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
	for object in story_objects_for_state(variant):
		objects.append(object)
	_object_cache_variant = variant
	_object_cache = objects
	return objects.duplicate(true)

func story_objects_for_state(variant: String = STATE_ALL) -> Array[Dictionary]:
	if _story_object_cache_variant == variant:
		return _story_object_cache.duplicate(true)
	var objects: Array[Dictionary] = []
	for placement in STORY_OBJECT_PLACEMENTS:
		if not object_visible_for_variant(placement, variant):
			continue
		objects.append(_build_story_object(placement))
	_story_object_cache_variant = variant
	_story_object_cache = objects
	return objects.duplicate(true)

func story_object_by_id(object_id: String, variant: String = STATE_ALL) -> Dictionary:
	for object in story_objects_for_state(variant):
		if String(object.get("id", "")) == object_id:
			return object
	return {}

func nearest_story_object(pos: Vector2, radius: float, zone_id: String = "", variant: String = STATE_ALL) -> Dictionary:
	var best := {}
	var best_distance := radius * radius
	for object in story_objects_for_state(variant):
		if zone_id != "" and String(object.get("zone_id", "")) != zone_id:
			continue
		var object_pos := Vector2(object.get("pos", Vector2.ZERO))
		var distance := pos.distance_squared_to(object_pos)
		if distance <= best_distance:
			best_distance = distance
			best = object
	return best

func story_object_count(variant: String = STATE_ALL) -> int:
	return story_objects_for_state(variant).size()

func story_object_summary_line(variant: String = STATE_ALL) -> String:
	var by_zone := {}
	for object in story_objects_for_state(variant):
		var zone_id := String(object.get("zone_id", ""))
		by_zone[zone_id] = int(by_zone.get(zone_id, 0)) + 1
	return ", ".join(_source_summary_parts(by_zone))

func field_trace_count(variant: String = STATE_ALL) -> int:
	return NPCPresence.field_trace_count_for_objects(story_objects_for_state(variant))

func field_trace_summary_line(variant: String = STATE_ALL) -> String:
	return NPCPresence.field_trace_summary_for_objects(story_objects_for_state(variant))

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

func source_objects_for_spawn_role(spawn_role: String, zone_id: String = "", variant: String = STATE_ALL) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for object in objects_for_state(variant):
		if zone_id != "" and String(object.get("zone_id", "")) != zone_id:
			continue
		if Array(object.get("spawn_roles", [])).has(spawn_role):
			result.append(object)
	return result

func source_objects_for_hazard_role(hazard_role: String, zone_id: String = "", variant: String = STATE_ALL) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for object in objects_for_state(variant):
		if zone_id != "" and String(object.get("zone_id", "")) != zone_id:
			continue
		if Array(object.get("hazard_roles", [])).has(hazard_role):
			result.append(object)
	return result

func source_summary_by_zone(variant: String = STATE_ALL) -> Dictionary:
	var summary := {}
	for zone_id in ZONE_ANCHORS.keys():
		summary[zone_id] = {}
	for object in objects_for_state(variant):
		if not _is_pressure_source(object):
			continue
		var zone_id := String(object.get("zone_id", ""))
		var source_role := String(object.get("source_role", "environmental_readability"))
		var zone_summary: Dictionary = summary.get(zone_id, {})
		zone_summary[source_role] = int(zone_summary.get(source_role, 0)) + 1
		summary[zone_id] = zone_summary
	return summary

func active_source_count(variant: String = STATE_ALL) -> int:
	var count := 0
	for object in objects_for_state(variant):
		if _is_pressure_source(object):
			count += 1
	return count

func source_summary_line(zone_id: String = "", variant: String = STATE_ALL) -> String:
	var summary := source_summary_by_zone(variant)
	var parts: Array[String] = []
	if zone_id != "":
		parts = _source_summary_parts(summary.get(zone_id, {}))
		return "%s{%s}" % [zone_id, ", ".join(parts)]
	for key in summary.keys():
		parts.append("%s{%s}" % [String(key), ", ".join(_source_summary_parts(summary[key]))])
	return " ".join(parts)

func hazard_summary_line(zone_id: String = "", variant: String = STATE_ALL) -> String:
	var counts := {}
	for object in objects_for_state(variant):
		if zone_id != "" and String(object.get("zone_id", "")) != zone_id:
			continue
		for hazard_role in Array(object.get("hazard_roles", [])):
			counts[String(hazard_role)] = int(counts.get(String(hazard_role), 0)) + 1
	return ", ".join(_source_summary_parts(counts))

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
		"spawn_influence": String(object.get("spawn_influence", "neutral")),
		"story_role": String(object.get("story_role", "surface")),
		"source_role": String(object.get("source_role", "ambient")),
		"spawn_roles": Array(object.get("spawn_roles", [])),
		"hazard_roles": Array(object.get("hazard_roles", [])),
		"pressure_tags": Array(object.get("pressure_tags", [])),
		"story_function": String(object.get("story_function", "")),
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
	object["state_variant"] = String(placement.get("state_variant", object["state"]))
	object["placement"] = String(placement.get("placement", "world"))
	object["size"] = Vector2(placement.get("size", defaults.get("size", Vector2(24, 24))))
	object["pivot"] = Vector2(placement.get("pivot", defaults.get("pivot", object["size"] * 0.5)))
	object["spawn_influence"] = String(placement.get("spawn_influence", defaults.get("spawn_influence", _spawn_influence_for_kind(kind))))
	object["story_role"] = String(placement.get("story_role", defaults.get("story_role", _story_role_for_zone(zone_id))))
	object["source_role"] = String(placement.get("source_role", defaults.get("source_role", _source_role_for_kind(kind))))
	object["spawn_roles"] = Array(placement.get("spawn_roles", defaults.get("spawn_roles", _spawn_roles_for_kind(kind, String(object["source_role"]))))).duplicate()
	object["hazard_roles"] = Array(placement.get("hazard_roles", defaults.get("hazard_roles", _hazard_roles_for_kind(kind, String(object["source_role"]))))).duplicate()
	object["pressure_tags"] = Array(placement.get("pressure_tags", defaults.get("pressure_tags", _pressure_tags_for_kind(kind, String(object["source_role"]))))).duplicate()
	object["story_function"] = String(placement.get("story_function", defaults.get("story_function", _story_function_for_source_role(String(object["source_role"]), zone_id))))
	var tags: Array = Array(defaults.get("tags", [])).duplicate()
	for tag in Array(placement.get("tags", [])):
		if not tags.has(tag):
			tags.append(tag)
	object["tags"] = tags
	return object

func _build_story_object(placement: Dictionary) -> Dictionary:
	var object := _build_object(placement)
	object["story_object"] = true
	object["display_name"] = String(placement.get("display_name", object.get("id", "")))
	object["interaction_type"] = String(placement.get("interaction_type", "조사"))
	object["interaction_prompt"] = String(placement.get("interaction_prompt", "%s %s" % [object["interaction_type"], object["display_name"]]))
	object["result_phrase"] = String(placement.get("result_phrase", "흔적이 작전도에 남았습니다."))
	object["repeat_phrase"] = String(placement.get("repeat_phrase", "이미 확인한 흔적입니다."))
	object["campaign_effect"] = String(placement.get("campaign_effect", "story_object_memory"))
	object["tag_hint"] = String(placement.get("tag_hint", "태그 후보 힌트 없음"))
	object["signal_hint"] = String(placement.get("signal_hint", "신호 힌트 없음"))
	object["risk_hint"] = String(placement.get("risk_hint", "위험 힌트 없음"))
	object["outpost_reaction"] = String(placement.get("outpost_reaction", "보급소가 R01 흔적을 짧게 기록합니다."))
	object["facility_id"] = String(placement.get("facility_id", "sortie_board"))
	object["npc_id"] = String(placement.get("npc_id", "seven"))
	object["node_memory_phrase"] = String(placement.get("node_memory_phrase", object["display_name"]))
	object["reveal_spawn_roles"] = Array(placement.get("reveal_spawn_roles", [])).duplicate()
	object["reveal_hazard_roles"] = Array(placement.get("reveal_hazard_roles", [])).duplicate()
	var field_trace := NPCPresence.field_trace_for_object(object)
	if not field_trace.is_empty():
		object["field_trace_id"] = String(field_trace.get("trace_id", ""))
		object["human_trace_type"] = String(field_trace.get("display_name", ""))
		object["human_trace_prompt"] = String(field_trace.get("prompt", ""))
		object["human_trace_first_line"] = String(field_trace.get("first_line", ""))
		object["human_trace_repeat_line"] = String(field_trace.get("repeat_line", ""))
		object["human_trace_node_memory_phrase"] = String(field_trace.get("node_memory_phrase", ""))
		object["human_trace_outpost_reaction"] = String(field_trace.get("outpost_reaction", ""))
		object["human_trace_outpost_tag"] = String(field_trace.get("outpost_reaction_tag", ""))
		object["human_trace_remote_tag"] = String(field_trace.get("remote_comment_tag", ""))
		object["human_trace_remote_npc_id"] = String(field_trace.get("remote_npc_id", ""))
		object["human_trace_facility_id"] = String(field_trace.get("facility_id", object.get("facility_id", "sortie_board")))
		object["human_trace_source_object_type"] = String(field_trace.get("source_object_type", object.get("kind", "")))
	var tags: Array = Array(object.get("tags", [])).duplicate()
	if not tags.has("story_object"):
		tags.append("story_object")
	if String(object.get("field_trace_id", "")) != "" and not tags.has("field_npc_trace"):
		tags.append("field_npc_trace")
	object["tags"] = tags
	return object

func _spawn_influence_for_kind(kind: String) -> String:
	match kind:
		"mailbox", "speaker":
			return "enemy_source_angle"
		"ad_device", "kiosk", "projector", "node", "residue":
			return "elite_or_signal_source"
		"floor_plan", "drain", "flyer", "fake_recovery":
			return "hazard_or_trigger_origin"
		"house", "model_house":
			return "hard_path_funnel"
		"road_barrier", "sign":
			return "soft_path_funnel"
		_:
			return "density_or_readability"

func _story_role_for_zone(zone_id: String) -> String:
	match zone_id:
		"silence_edge_start":
			return "outer_recovery_edge"
		"outer_recovery_lane_anchor":
			return "recovery_lane_transition"
		"subdivision_loop_center":
			return "repeated_house_pressure"
		"open_house_street_anchor":
			return "risk_reward_signal_street"
		"model_house_node_anchor":
			return "boss_signal_node_approach"
		"drain_pocket_anchor":
			return "side_route_trace_pocket"
		"fake_return_route_anchor":
			return "false_recovery_mimic"
		_:
			return "r01_surface"

func _source_role_for_kind(kind: String) -> String:
	match kind:
		"mailbox":
			return "mailbox_coupon"
		"speaker":
			return "street_speaker"
		"sign":
			return "model_sign"
		"ad_device":
			return "homecare_robot"
		"kiosk":
			return "consultation_kiosk"
		"projector", "photo":
			return "doorbell_sensor"
		"flyer", "scraps":
			return "mailbox_coupon"
		"floor_plan":
			return "sprinkler_ink"
		"drain":
			return "drain_silence"
		"trace":
			return "drain_silence"
		"fake_recovery":
			return "fake_return_sign"
		"node", "model_house":
			return "model_house_contract_node"
		"house":
			return "repeated_house_front"
		"road_barrier":
			return "homecare_robot"
		"residue":
			return "model_sign"
		_:
			return "environmental_readability"

func _spawn_roles_for_kind(kind: String, source_role: String) -> Array[String]:
	match source_role:
		"mailbox_coupon":
			return ["basic", "coupon", "fast"]
		"doorbell_sensor":
			return ["charger", "signal"]
		"sprinkler_ink":
			return ["basic", "charger"]
		"drain_silence":
			return ["basic", "tank", "signal"]
		"model_sign", "street_speaker":
			return ["speaker", "signal", "charger"]
		"fake_return_sign":
			return ["fast", "charger", "speaker"]
		"homecare_robot":
			return ["robot", "tank", "basic"]
		"consultation_kiosk", "model_house_contract_node":
			return ["elite", "signal", "speaker"]
		"repeated_house_front":
			return ["basic", "charger"]
		_:
			if kind == "trace":
				return ["signal", "basic"]
			return []

func _hazard_roles_for_kind(kind: String, source_role: String) -> Array[String]:
	match source_role:
		"mailbox_coupon":
			return ["flyer_drop"]
		"doorbell_sensor":
			return ["warning_line"]
		"sprinkler_ink":
			return ["sprinkler_ink", "flyer_drop"]
		"drain_silence":
			return ["low_signal", "silence_leak"]
		"model_sign", "street_speaker", "consultation_kiosk", "model_house_contract_node":
			return ["pressure_ring", "warning_line"]
		"fake_return_sign":
			return ["fake_return", "rear_pincer", "warning_line"]
		"homecare_robot":
			return ["soft_blocker_route"]
		"repeated_house_front":
			return ["warning_line"]
		_:
			if kind == "trace":
				return ["low_signal"]
			return []

func _pressure_tags_for_kind(kind: String, source_role: String) -> Array[String]:
	match source_role:
		"mailbox_coupon":
			return ["coupon_print", "side_pincer", "paper_noise"]
		"doorbell_sensor":
			return ["review_ping", "short_warning_line"]
		"sprinkler_ink":
			return ["ink_slow", "passable_hazard"]
		"drain_silence":
			return ["low_signal", "side_route", "trace_candidate"]
		"model_sign":
			return ["broadcast_line", "signal_amplifier"]
		"street_speaker":
			return ["speaker_pulse", "signal_amplifier"]
		"fake_return_sign":
			return ["false_recovery", "rear_pincer", "unstable_arrow"]
		"homecare_robot":
			return ["infrastructure_robot", "road_pref"]
		"consultation_kiosk":
			return ["review_line", "elite_review"]
		"model_house_contract_node":
			return ["boss_signal", "contract_review"]
		"repeated_house_front":
			return ["doorbell_ping", "repeated_address"]
		_:
			return []

func _story_function_for_source_role(source_role: String, zone_id: String) -> String:
	match source_role:
		"mailbox_coupon":
			return "우편함이 쿠폰과 소형 광고체를 재발송합니다."
		"doorbell_sensor":
			return "현관 센서가 윤서를 방문 심사 대상으로 등록합니다."
		"sprinkler_ink":
			return "스프링클러가 광고 잉크와 경고 바닥을 흩뿌립니다."
		"drain_silence":
			return "배수구가 낮은 신호와 회수되지 않은 흔적을 새깁니다."
		"model_sign":
			return "모델하우스 안내 신호가 스피커와 심사선을 증폭합니다."
		"street_speaker":
			return "가로등 스피커가 혼동 신호를 다시 송출합니다."
		"fake_return_sign":
			return "가짜 귀환 표지가 회수선처럼 보이는 잘못된 경로를 켭니다."
		"homecare_robot":
			return "홈케어 장치가 생활 인프라 로봇의 진입로를 엽니다."
		"consultation_kiosk":
			return "상담 부스가 윤서를 고객 명단에 올리려 합니다."
		"model_house_contract_node":
			return "모델하우스 결절이 보스 심사 절차와 연결됩니다."
		"repeated_house_front":
			return "반복 주택 현관이 같은 주소의 방문 심사를 다시 울립니다."
		_:
			return "%s의 배경 가독성을 보강합니다." % zone_id

func _is_pressure_source(object: Dictionary) -> bool:
	return not Array(object.get("spawn_roles", [])).is_empty() or not Array(object.get("hazard_roles", [])).is_empty() or not Array(object.get("pressure_tags", [])).is_empty()

func _source_summary_parts(counts: Dictionary) -> Array[String]:
	var keys := counts.keys()
	keys.sort()
	var parts: Array[String] = []
	for key in keys:
		parts.append("%s:%d" % [String(key), int(counts[key])])
	return parts
