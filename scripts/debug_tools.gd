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
		"F12 also shows R01 collision/nav overlay",
	])

func detail_text(info: Dictionary) -> String:
	if not C.DEBUG_TOOLS_ENABLED or not detail_visible:
		return ""
	return "\n".join([
		"DEBUG HUD",
		"state: %s" % str(info.get("match_state", "")),
		"time: %.1f / %.0f" % [float(info.get("elapsed", 0.0)), float(info.get("match_duration", 0.0))],
		"wave: %s" % str(info.get("wave_name", "")),
		str(info.get("r01_zone_debug_label", "R01 zone:")),
		"blockout: %s %s %.1f screens nearest=%s" % [str(info.get("r01_blockout_variant", "")), str(info.get("r01_blockout_world", "")), float(info.get("r01_blockout_screens", 0.0)), str(info.get("r01_blockout_nearest", ""))],
		"r01 collision: hard=%d soft=%d hazard=%d trigger=%d none=%d" % [
			int(info.get("r01_collision_hard", 0)),
			int(info.get("r01_collision_soft", 0)),
			int(info.get("r01_collision_hazard", 0)),
			int(info.get("r01_collision_trigger", 0)),
			int(info.get("r01_collision_none", 0)),
		],
		"r01 pathing: %s" % str(info.get("r01_pathing_probe", "")),
		"roles: %s" % str(info.get("enemy_role_summary", "")),
		"threats: %d last=%s" % [int(info.get("threat_count", 0)), str(info.get("last_threat_label", ""))],
		"enemies: %d / %d" % [int(info.get("enemy_count", 0)), int(info.get("enemy_cap", 0))],
		"hp: %.0f / %.0f" % [float(info.get("player_hp", 0.0)), float(info.get("max_hp", 0.0))],
		"level/xp: %d / %.1f" % [int(info.get("level", 0)), float(info.get("xp", 0.0))],
		"charge: %s" % str(info.get("charge_state", "")),
		"charge timer: %.1f / %.1f" % [float(info.get("charge_timer", 0.0)), float(info.get("charge_period", 0.0))],
		"charge window: %.1f" % float(info.get("charge_window_left", 0.0)),
		"cards: %d" % int(info.get("selected_card_count", 0)),
		"mid event: %s" % str(info.get("mid_event_triggered", false)),
		"sortie/session: %d / %d" % [int(info.get("sortie_index", 1)), int(info.get("session_depth", 1))],
		"preboss: %s" % str(info.get("preboss_stage", "")),
		"route: %s" % str(info.get("route_stage_label", "")),
		"goal: %s" % str(info.get("next_goal_label", "")),
		"boss route ready: %s" % str(info.get("boss_route_ready", false)),
		"boss signal: %s unlocked=%s" % [str(info.get("boss_signal_state", "none")), str(info.get("boss_signal_unlocked", false))],
		"boss: %s p%d %s %.0f/%.0f %s" % [str(info.get("boss_active", false)), int(info.get("boss_phase", 0)), str(info.get("boss_state", "")), float(info.get("boss_hp", 0.0)), float(info.get("boss_max_hp", 0.0)), str(info.get("boss_defense", ""))],
		"first sortie: %s" % str(info.get("first_sortie", false)),
		"recall done: %s" % str(info.get("first_recall_done", false)),
		"recall stage: %d" % int(info.get("recall_stage", 0)),
		"traces: flyer=%d core=%d" % [int(info.get("trace_torn_ad_flyer", 0)), int(info.get("trace_campaign_core_fragment", 0))],
		"signal clues: %d/%d" % [int(info.get("signal_clue_count", 0)), int(info.get("signal_clue_required", 3))],
		"boss analysis: %d/3" % int(info.get("boss_analysis_level", 0)),
		"boss clears: %d" % int(info.get("boss_clear_count", 0)),
		"boss outcome: %s" % str(info.get("smile_home_boss_outcome", "")),
		"r01: visits=%d records=%d outcome=%s pressure=%d traces=%d/%d/%d" % [
			int(info.get("r01_revisit_count", 0)),
			int(info.get("r01_signal_records_found", 0)),
			str(info.get("r01_boss_outcome", "")),
			int(info.get("r01_campaign_pressure", 0)),
			int(info.get("r01_trace_preserved_count", 0)),
			int(info.get("r01_trace_consumed_count", 0)),
			int(info.get("r01_campaign_used_count", 0)),
		],
		"r01 goal: %s" % str(info.get("r01_sortie_goal_phrase", "")),
		"r01 outpost: %s" % str(info.get("r01_outpost_phrase", "")),
		"meta upgrades: %s" % str(info.get("meta_summary", "")),
		"fps: %d" % int(info.get("fps", 0)),
	])

func blockout_debug_labels_visible() -> bool:
	return C.DEBUG_TOOLS_ENABLED and (help_visible or detail_visible)
