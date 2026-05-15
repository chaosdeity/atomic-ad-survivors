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
			if event.shift_pressed:
				main._debug_start_boss()
				return true
			main._debug_force_victory()
			return true
		KEY_F9:
			if event.shift_pressed:
				main._debug_boss_phase_preview()
				return true
			main._debug_force_game_over()
			return true
		KEY_F10:
			if event.shift_pressed:
				main._debug_defeat_boss()
				return true
			main._debug_clear_enemies()
			return true
		KEY_F11:
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
		"Shift+F10 Defeat Boss",
	])

func detail_text(info: Dictionary) -> String:
	if not C.DEBUG_TOOLS_ENABLED or not detail_visible:
		return ""
	return "\n".join([
		"DEBUG HUD",
		"state: %s" % str(info.get("match_state", "")),
		"time: %.1f / %.0f" % [float(info.get("elapsed", 0.0)), float(info.get("match_duration", 0.0))],
		"wave: %s" % str(info.get("wave_name", "")),
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
		"boss signal: %s unlocked=%s" % [str(info.get("boss_signal_state", "none")), str(info.get("boss_signal_unlocked", false))],
		"boss: %s %s %.0f/%.0f %s" % [str(info.get("boss_active", false)), str(info.get("boss_state", "")), float(info.get("boss_hp", 0.0)), float(info.get("boss_max_hp", 0.0)), str(info.get("boss_defense", ""))],
		"first sortie: %s" % str(info.get("first_sortie", false)),
		"recall done: %s" % str(info.get("first_recall_done", false)),
		"recall stage: %d" % int(info.get("recall_stage", 0)),
		"traces: torn_ad_flyer=%d" % int(info.get("trace_torn_ad_flyer", 0)),
		"meta upgrades: %s" % str(info.get("meta_summary", "")),
		"fps: %d" % int(info.get("fps", 0)),
	])
