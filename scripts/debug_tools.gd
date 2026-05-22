extends RefCounted

const C := preload("res://scripts/game_config.gd")

var help_visible := false
var detail_visible := false

func handle_input(event: InputEvent, main) -> bool:
	if not C.DEBUG_TOOLS_ENABLED:
		help_visible = false
		detail_visible = false
		return false
	if not event is InputEventKey or not event.pressed or event.echo:
		return false
	if event.ctrl_pressed:
		match event.keycode:
			KEY_1, KEY_KP_1:
				main._debug_r01_blockout_variant("first_visit")
				return true
			KEY_2, KEY_KP_2:
				main._debug_r01_blockout_variant("broadcast_record_3")
				return true
			KEY_3, KEY_KP_3:
				main._debug_r01_blockout_variant("destroy_node")
				return true
			KEY_4, KEY_KP_4:
				main._debug_r01_blockout_variant("extract_memory")
				return true

	match event.keycode:
		KEY_F1:
			help_visible = not help_visible
			return true
		KEY_F2:
			main._debug_force_level_up()
			return true
		KEY_F3:
			main._debug_open_charge()
			return true
		KEY_F4:
			if event.shift_pressed:
				main._debug_boss_safety_demo()
				return true
			main._debug_drop_hp()
			return true
		KEY_F5:
			if event.shift_pressed:
				main._debug_jump_preboss_signal(2, 115.0)
				return true
			main._debug_jump_time(175.0)
			return true
		KEY_F6:
			if event.shift_pressed:
				main._debug_jump_preboss_signal(3, 175.0)
				return true
			main._debug_jump_time(270.0)
			return true
		KEY_F7:
			if event.shift_pressed:
				main._debug_jump_preboss_signal(4, 235.0)
				return true
			main._debug_jump_time(299.0)
			return true
		KEY_F8:
			if event.ctrl_pressed:
				main._debug_boss_recall_reward()
				return true
			if event.shift_pressed:
				main._debug_start_boss()
				return true
			main._debug_force_victory()
			return true
		KEY_F9:
			if event.ctrl_pressed:
				main._debug_boss_enrage_preview()
				return true
			if event.shift_pressed:
				main._debug_boss_phase_preview()
				return true
			main._debug_force_game_over()
			return true
		KEY_F10:
			if event.ctrl_pressed:
				main._debug_set_smile_home_boss_outcome("destroy_node")
				return true
			if event.shift_pressed:
				main._debug_defeat_boss()
				return true
			main._debug_clear_enemies()
			return true
		KEY_F11:
			if event.ctrl_pressed:
				main._debug_set_smile_home_boss_outcome("extract_memory")
				return true
			if event.shift_pressed:
				main._debug_boss_distortion()
				return true
			main._debug_spawn_swarm()
			return true
		KEY_F12:
			detail_visible = not detail_visible
			return true
		_:
			return false

func help_text() -> String:
	if not C.DEBUG_TOOLS_ENABLED or not help_visible:
		return ""
	return "\n".join([
		"DEBUG KEYS",
		"F1 Help  F12 HUD",
		"F2 Cards  F3 Charge",
		"F4 HP=20",
		"F5 175s  F6 270s  F7 299s",
		"Shift+F5/6/7 Preboss signal checks",
		"F8 Win  F9 Game Over",
		"F10 Clear  F11 Swarm",
		"Shift+F8 Boss  Shift+F9 Core",
		"Ctrl+F9 Boss Enrage",
		"Shift+F10 Defeat Boss",
		"Shift+F11 Happiness Reset",
		"Shift+F4 Home Inspection",
		"Ctrl+F8 Boss Recall Reward",
		"Ctrl+F10 Destroy Node",
		"Ctrl+F11 Extract Memory",
		"Ctrl+1/2/3/4 R01 Blockout State",
		"F12 R01/outpost debug overlay",
	])

func detail_text(info: Dictionary) -> String:
	if not C.DEBUG_TOOLS_ENABLED or not detail_visible:
		return ""
	var lines: Array[String] = [
		"DEBUG HUD",
		"state %s  time %.1f/%.0f  fps %d" % [
			str(info.get("match_state", "")),
			float(info.get("elapsed", 0.0)),
			float(info.get("match_duration", 0.0)),
			int(info.get("fps", 0)),
		],
		"route %s" % str(info.get("route_stage_label", "")),
		"goal %s" % str(info.get("next_goal_label", "")),
		"r01 %s nearest=%s" % [str(info.get("r01_zone_debug_label", "R01 zone:")), str(info.get("r01_blockout_nearest", ""))],
		"r01 collision: hard=%d soft=%d hazard=%d trigger=%d" % [
			int(info.get("r01_collision_hard", 0)),
			int(info.get("r01_collision_soft", 0)),
			int(info.get("r01_collision_hazard", 0)),
			int(info.get("r01_collision_trigger", 0)),
		],
		"r01 assembly: objects=%d ground=%d decal=%d travel=%d hazard=%d blocker=%d prop=%d" % [
			int(info.get("r01_object_count", 0)),
			int(info.get("r01_layer_ground_patch", 0)),
			int(info.get("r01_layer_ground_decal", 0)),
			int(info.get("r01_layer_travel_corridor", 0)),
			int(info.get("r01_layer_hazard_decal", 0)),
			int(info.get("r01_layer_blocker_back", 0)),
			int(info.get("r01_layer_prop_mid", 0)),
		],
		"r01 asset keys: %s" % str(info.get("r01_asset_key_sample", "")),
		"outpost: %s %s facilities=%d" % [
			str(info.get("outpost_variant", "")),
			str(info.get("outpost_world_bounds", "")),
			int(info.get("outpost_facility_count", 0)),
		],
		"outpost collision: hard=%d soft=%d interact=%d decor=%d exit=%d" % [
			int(info.get("outpost_collision_hard", 0)),
			int(info.get("outpost_collision_soft", 0)),
			int(info.get("outpost_collision_interaction", 0)),
			int(info.get("outpost_collision_decorative", 0)),
			int(info.get("outpost_collision_exit", 0)),
		],
		"hp %.0f/%.0f  enemies %d/%d  charge %s" % [
			float(info.get("player_hp", 0.0)),
			float(info.get("max_hp", 0.0)),
			int(info.get("enemy_count", 0)),
			int(info.get("enemy_cap", 0)),
			str(info.get("charge_state", "")),
		],
		"audit %.0f ratio=%.2f pass=%d fail=%d pressure=%d" % [
			float(info.get("audit_processing", 0.0)),
			float(info.get("audit_progress_ratio", 0.0)),
			int(info.get("audit_pass_count", 0)),
			int(info.get("audit_fail_count", 0)),
			int(info.get("audit_pressure_level", 0)),
		],
		"playtest %s" % str(info.get("playtest_live_summary", "")),
		"sortie %d  recall=%s stage=%d" % [
			int(info.get("sortie_index", 1)),
			str(info.get("first_recall_done", false)),
			int(info.get("recall_stage", 0)),
		],
		"traces: flyer=%d core=%d" % [int(info.get("trace_torn_ad_flyer", 0)), int(info.get("trace_campaign_core_fragment", 0))],
		"signal clues: %d/%d" % [int(info.get("signal_clue_count", 0)), int(info.get("signal_clue_required", 3))],
		"boss analysis %d/3 clears=%d outcome=%s" % [
			int(info.get("boss_analysis_level", 0)),
			int(info.get("boss_clear_count", 0)),
			str(info.get("smile_home_boss_outcome", "")),
		],
	]
	var outpost_debug := Array(info.get("outpost_debug_lines", []))
	var max_outpost_lines := mini(outpost_debug.size(), 5)
	for i in range(max_outpost_lines):
		lines.append(str(outpost_debug[i]))
	return "\n".join(lines)

func blockout_debug_labels_visible() -> bool:
	return C.DEBUG_TOOLS_ENABLED and detail_visible

func detail_debug_visible() -> bool:
	return C.DEBUG_TOOLS_ENABLED and detail_visible
