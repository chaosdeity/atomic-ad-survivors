extends SceneTree

const MainScene := preload("res://scenes/main.tscn")
const R01CampaignMap := preload("res://scripts/r01_campaign_map.gd")

var failures: Array[String] = []

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	await _probe_first_recall()
	await _probe_post_recall_result("game_over", "post-recall game_over -> supply")
	await _probe_post_recall_result("victory", "post-recall victory -> supply")
	await _probe_boss_recall()
	await _probe_boss_victory()
	await _probe_terminal_action_parity()
	await _probe_r01_campaign_map_flow()

	if failures.is_empty():
		print("RUN_FLOW_PROBE PASS")
		quit(0)
	else:
		for failure in failures:
			push_error(failure)
		print("RUN_FLOW_PROBE FAIL %d" % failures.size())
		quit(1)

func _new_main():
	var main := MainScene.instantiate()
	root.add_child(main)
	await process_frame
	await process_frame
	return main

func _finish_main(main: Node) -> void:
	main.queue_free()
	await process_frame

func _record(label: String, ok: bool, detail: String = "") -> void:
	var status := "pass" if ok else "fail"
	print("%s: %s" % [label, status])
	if not ok:
		failures.append("%s failed%s" % [label, "" if detail == "" else " - %s" % detail])

func _probe_first_recall() -> void:
	var main = await _new_main()
	main._finish_match("recalled")
	var result_ok: bool = main.match_state == "recalled"
	main._handle_terminal_action()
	_record("first recall -> supply", result_ok and main.match_state == "supply" and main.first_recall_done)
	await _finish_main(main)

func _probe_post_recall_result(result_state: String, label: String) -> void:
	var main = await _new_main()
	main._finish_match("recalled")
	main._handle_terminal_action()
	main._restart()
	var sortie_before := int(main.sortie_index)
	main._finish_match(result_state)
	var result_ok: bool = main.match_state == result_state
	main._handle_terminal_action()
	_record(label, result_ok and main.match_state == "supply" and int(main.sortie_index) == sortie_before)
	await _finish_main(main)

func _probe_boss_recall() -> void:
	var main = await _new_main()
	main.first_sortie = false
	main.first_recall_done = true
	main.boss_result_reason = "boss_recall"
	main._finish_match("recalled")
	var result_ok: bool = main.match_state == "recalled"
	main._handle_terminal_action()
	_record("boss recall -> supply", result_ok and main.match_state == "supply")
	await _finish_main(main)

func _probe_boss_victory() -> void:
	var main = await _new_main()
	main.first_sortie = false
	main.first_recall_done = true
	main._finish_match("boss_victory")
	var result_ok: bool = main.match_state == "boss_victory"
	main._handle_terminal_action()
	_record("boss victory -> supply", result_ok and main.match_state == "supply")
	await _finish_main(main)

func _probe_terminal_action_parity() -> void:
	var button_main = await _new_main()
	button_main.first_sortie = false
	button_main.first_recall_done = true
	button_main._finish_match("game_over")
	var callback_method := str(button_main.hud.restart_callback.get_method())
	button_main.hud._on_restart_button_pressed()
	var button_ok: bool = button_main.match_state == "supply"
	await _finish_main(button_main)

	var space_main = await _new_main()
	space_main.first_sortie = false
	space_main.first_recall_done = true
	space_main._finish_match("game_over")
	space_main._handle_terminal_action()
	var space_ok: bool = space_main.match_state == "supply"
	await _finish_main(space_main)

	_record(
		"space terminal action == button terminal action",
		callback_method == "_handle_terminal_action" and button_ok and space_ok,
		"button callback was %s" % callback_method
	)

func _probe_r01_campaign_map_flow() -> void:
	var main = await _new_main()
	main._show_supply_depot()
	main._open_r01_campaign_map()
	var open_ok: bool = main.match_state == "supply" and main.r01_campaign_map_open and main.hud.is_campaign_map_visible()
	var initial_ui_text: String = main.hud.campaign_map_visible_text()
	var initial_ui_clean: bool = initial_ui_text.find("R01-L") == -1
	var readability_text_ok: bool = initial_ui_text.find("범례: 초록 접근 가능") != -1 and initial_ui_text.find("핀 선택 후 출격") != -1 and initial_ui_text.find("작전권:") != -1 and initial_ui_text.find("얇은 선은 곁길") != -1

	main._select_r01_campaign_node("R01-L01")
	var l01_selected_text: String = main.hud.campaign_map_visible_text()
	var l01_highlight_ok: bool = l01_selected_text.find("선택 중: 침묵 가장자리") != -1 and l01_selected_text.find("회수선: 안정") != -1 and l01_selected_text.find("목표") != -1 and l01_selected_text.find("주택가 첫 광고 신호 확인") != -1 and l01_selected_text.find("외곽 진입 작전권") != -1
	main._sortie_selected_r01_campaign_node()
	var sortie_ok: bool = main.match_state == "playing" and main.current_r01_node_id == "R01-L01" and not main.r01_campaign_map_open
	var l01_start_pos: Vector2 = main.player_pos
	main._finish_match("recalled")
	main._handle_terminal_action()
	var post_run_supply_ok: bool = main.match_state == "supply"
	var l02_available: bool = String(main.r01_campaign_node_states.get("R01-L02", "")) == "available"
	var l03_locked_before_l02: bool = String(main.r01_campaign_node_states.get("R01-L03", "")) == "locked"

	main._open_r01_campaign_map()
	var post_l01_text: String = main.hud.campaign_map_visible_text()
	var l02_opened_pulse_ok: bool = post_l01_text.find("새 신호: 분양 주택 루프 접근 가능") != -1 and main.r01_campaign_new_signal_node_ids.has("R01-L02")
	main._select_r01_campaign_node("R01-L02")
	main._sortie_selected_r01_campaign_node()
	var l02_entry_ok: bool = main.match_state == "playing" and main.current_r01_node_id == "R01-L02" and l01_start_pos.distance_to(main.player_pos) > 500.0 and main._combat_goal_label().find("분양 주택 루프") != -1
	main._finish_match("victory")
	main._handle_terminal_action()
	var l03_unlocked_after_l02: bool = String(main.r01_campaign_node_states.get("R01-L03", "")) == "boss_ready"
	main._open_r01_campaign_map()
	var post_l02_text: String = main.hud.campaign_map_visible_text()
	var l03_opened_text_ok: bool = post_l02_text.find("새 신호: 모델하우스 결절 심사 접근 가능") != -1

	main._debug_r01_campaign_unlock_all()
	var unlock_all_ok: bool = true
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		unlock_all_ok = unlock_all_ok and String(main.r01_campaign_node_states.get(node_id, "")) == "available"
	main._open_r01_campaign_map()
	main._select_r01_campaign_node("R01-L05")
	var l05_text: String = main.hud.campaign_map_visible_text()
	var l05_false_route_ok: bool = l05_text.find("가짜 귀환로") != -1 and l05_text.find("회수선: 불안정") != -1 and l05_text.find("실제 회수선이 아닙니다") != -1 and l05_text.find("보급소로 돌아가기") == -1
	var final_ui_clean: bool = l05_text.find("R01-L") == -1
	main.debug_tools.detail_visible = true
	var debug_text: String = main._debug_overlay_text()
	var debug_hud_ids_ok: bool = debug_text.find("campaign current=R01-L02") != -1 and debug_text.find("selected=R01-L05") != -1 and debug_text.find("bias=mailbox_pincer") != -1

	_record("campaign map opens from supply", open_ok)
	_record("campaign map has readable legend and instruction", readability_text_ok)
	_record("L01 selected highlight exists", l01_highlight_ok)
	_record("campaign UI hides internal ids", initial_ui_clean and final_ui_clean)
	_record("L01 select -> sortie starts", sortie_ok)
	_record("post-run returns to supply", post_run_supply_ok)
	_record("L02 available after L01 visit", l02_available)
	_record("L01 complete -> L02 pulse/opened state", l02_opened_pulse_ok)
	_record("L02 sortie changes combat entry", l02_entry_ok)
	_record("L03 locked until L02 condition", l03_locked_before_l02 and l03_unlocked_after_l02 and l03_opened_text_ok)
	_record("L05 displayed as false route", l05_false_route_ok)
	_record("debug unlock all campaign nodes", unlock_all_ok)
	_record("debug HUD exposes campaign ids", debug_hud_ids_ok)
	_probe_r01_campaign_node_entry_profiles(main)
	main._close_r01_campaign_map()
	await _finish_main(main)

	var preview_main = await _new_main()
	preview_main._debug_preview_r01_campaign_node(2)
	var debug_preview_unlock_ok: bool = preview_main.match_state == "supply" and preview_main.r01_campaign_map_open and preview_main.selected_r01_node_id == "R01-L03" and String(preview_main.r01_campaign_node_states.get("R01-L03", "")) == "available"
	preview_main._sortie_selected_r01_campaign_node()
	var debug_preview_sortie_ok: bool = preview_main.match_state == "playing" and preview_main.current_r01_node_id == "R01-L03"
	_record("Ctrl+1-5 debug preview unlocks sortie", debug_preview_unlock_ok and debug_preview_sortie_ok)
	await _finish_main(preview_main)

func _probe_r01_campaign_node_entry_profiles(main) -> void:
	main._debug_r01_campaign_unlock_all()
	var starts := {}
	var spawn_bias := {}
	var objective_ok := true
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		main.selected_r01_node_id = node_id
		main.current_r01_node_id = node_id
		main.player_pos = main._r01_campaign_start_position(node_id)
		main.r01_map.update(0.0, main.elapsed, false, main.r01_blockout.nearest_zone_id(main.player_pos))
		var wave_params: Dictionary = main._wave_params_for_elapsed(90.0)
		starts[node_id] = main.player_pos
		spawn_bias[node_id] = String(wave_params.get("spawn_bias", ""))
		objective_ok = objective_ok and main._combat_goal_label().find(R01CampaignMap.node_name(node_id)) != -1
	var distinct_starts := true
	for a in starts.keys():
		for b in starts.keys():
			if String(a) >= String(b):
				continue
			distinct_starts = distinct_starts and Vector2(starts[a]).distance_to(Vector2(starts[b])) > 320.0
	var expected_bias := {
		"R01-L01": "wide_edge",
		"R01-L02": "mailbox_pincer",
		"R01-L03": "signal_converge",
		"R01-L04": "quiet_pocket",
		"R01-L05": "false_return_pincer",
	}
	var bias_ok := true
	for node_id in expected_bias.keys():
		bias_ok = bias_ok and String(spawn_bias[node_id]) == String(expected_bias[node_id])
	var pathing_label: String = main.r01_blockout.pathing_probe_label()
	var pathing_ok := pathing_label.find("30=pass") != -1 and pathing_label.find("100=") != -1 and pathing_label.find("300=") != -1 and pathing_label.find("node=pass") != -1 and pathing_label.find("fake=pass") != -1
	var start_summary := {}
	for node_id in starts.keys():
		var p := Vector2(starts[node_id])
		start_summary[node_id] = "%d,%d" % [int(round(p.x)), int(round(p.y))]
	_record("L01-L05 start positions are distinct world-space entries", distinct_starts, JSON.stringify(start_summary))
	_record("L01-L05 spawn bias profiles differ", bias_ok, JSON.stringify(spawn_bias))
	_record("L01-L05 objective phrase follows selected operation zone", objective_ok)
	_record("R01 pathing probe keeps 30/100/300 and route checks", pathing_ok, pathing_label)
