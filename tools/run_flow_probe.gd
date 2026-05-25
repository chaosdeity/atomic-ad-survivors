extends SceneTree

const MainScene := preload("res://scenes/main.tscn")

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

	main._select_r01_campaign_node("R01-L01")
	main._sortie_selected_r01_campaign_node()
	var sortie_ok: bool = main.match_state == "playing" and main.current_r01_node_id == "R01-L01" and not main.r01_campaign_map_open
	main._finish_match("recalled")
	main._handle_terminal_action()
	var post_run_supply_ok: bool = main.match_state == "supply"
	var l02_available: bool = String(main.r01_campaign_node_states.get("R01-L02", "")) == "available"
	var l03_locked_before_l02: bool = String(main.r01_campaign_node_states.get("R01-L03", "")) == "locked"

	main._open_r01_campaign_map()
	main._select_r01_campaign_node("R01-L02")
	main._sortie_selected_r01_campaign_node()
	main._finish_match("victory")
	main._handle_terminal_action()
	var l03_unlocked_after_l02: bool = String(main.r01_campaign_node_states.get("R01-L03", "")) == "boss_ready"

	main._debug_r01_campaign_unlock_all()
	var unlock_all_ok: bool = true
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		unlock_all_ok = unlock_all_ok and String(main.r01_campaign_node_states.get(node_id, "")) == "available"
	main._open_r01_campaign_map()
	var final_ui_clean: bool = main.hud.campaign_map_visible_text().find("R01-L") == -1

	_record("campaign map opens from supply", open_ok)
	_record("campaign UI hides internal ids", initial_ui_clean and final_ui_clean)
	_record("L01 select -> sortie starts", sortie_ok)
	_record("post-run returns to supply", post_run_supply_ok)
	_record("L02 available after L01 visit", l02_available)
	_record("L03 locked until L02 condition", l03_locked_before_l02 and l03_unlocked_after_l02)
	_record("debug unlock all campaign nodes", unlock_all_ok)
	main._close_r01_campaign_map()
	await _finish_main(main)
