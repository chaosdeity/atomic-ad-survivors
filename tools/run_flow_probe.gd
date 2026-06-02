extends SceneTree

const MainScene := preload("res://scenes/main.tscn")
const R01CampaignMap := preload("res://scripts/r01_campaign_map.gd")
const R01SourceState := preload("res://scripts/r01_source_state.gd")
const R01MicroLocations := preload("res://scripts/r01_micro_locations.gd")
const RoutePhraseResolver := preload("res://scripts/route_phrase_resolver.gd")
const NPCPresence := preload("res://scripts/npc_presence.gd")

const R01_FORBIDDEN_PHRASES := [
	"보상" + " 획득",
	"파밍" + " 결과",
	"전리" + "품",
	"획득" + " 골드",
	"사망" + " 보상",
	"부" + "활",
	"리" + "스폰",
	"게임" + "오버",
	"R01" + " 클리어",
	"스마일홈" + " 종료",
	"보스" + " 처치",
	"보스" + " 격파",
	"수장 AI" + " 파괴",
]

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
	await _probe_tag_settlement_and_recall_quality()
	await _probe_outpost_place_surfaces()
	await _probe_r01_campaign_map_flow()
	await _probe_r01_micro_locations()
	await _probe_r01_field_interactions()
	await _probe_npc_presence_layer()
	await _probe_manual_combat_input()
	await _probe_r01_source_state_handling()
	await _probe_ten_minute_loop_readability()
	await _probe_r01_0_2_integrated_auto_qa()

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

func _state(main) -> String:
	return String(main.state_machine.get_state())

func _player_pos(main) -> Vector2:
	return main.player.pos

func _set_player_pos(main, pos: Vector2) -> void:
	main.player.pos = pos
	main.r01_map.update(0.0, main.elapsed, false, main.r01_blockout.nearest_zone_id(main.player.pos))

func _result_text(main) -> String:
	return String(main.hud.result_label.text) + "\n" + "\n".join(Array(main.last_run_result.get("reward_lines", [])))

func _visible_flow_text(main) -> String:
	var parts: Array[String] = [
		String(main._active_notice_text()),
		String(main._route_stage_label()),
		String(main._combat_goal_label()),
		String(main.hud.result_label.text),
		String(main.hud.supply_visible_text()),
		String(main.hud.campaign_map_visible_text()),
		_result_text(main),
	]
	return "\n".join(parts)

func _forbidden_hit(text: String) -> String:
	for phrase in R01_FORBIDDEN_PHRASES:
		if text.find(String(phrase)) != -1:
			return String(phrase)
	return ""

func _record(label: String, ok: bool, detail: String = "") -> void:
	var status := "pass" if ok else "fail"
	print("%s: %s" % [label, status])
	if not ok:
		failures.append("%s failed%s" % [label, "" if detail == "" else " - %s" % detail])

func _probe_first_recall() -> void:
	var main = await _new_main()
	main._finish_match("recalled")
	var result_ok: bool = _state(main) == "recalled"
	main._handle_terminal_action()
	_record("first recall -> supply", result_ok and _state(main) == "supply" and main.first_recall_done)
	await _finish_main(main)

func _probe_post_recall_result(result_state: String, label: String) -> void:
	var main = await _new_main()
	main._finish_match("recalled")
	main._handle_terminal_action()
	main._restart()
	var sortie_before := int(main.sortie_index)
	main._finish_match(result_state)
	var result_ok: bool = _state(main) == result_state
	main._handle_terminal_action()
	_record(label, result_ok and _state(main) == "supply" and int(main.sortie_index) == sortie_before)
	await _finish_main(main)

func _probe_boss_recall() -> void:
	var main = await _new_main()
	main.first_sortie = false
	main.first_recall_done = true
	main.boss_result_reason = "boss_recall"
	main._finish_match("recalled")
	var result_ok: bool = _state(main) == "recalled"
	main._handle_terminal_action()
	_record("boss recall -> supply", result_ok and _state(main) == "supply")
	await _finish_main(main)

func _probe_boss_victory() -> void:
	var main = await _new_main()
	main.first_sortie = false
	main.first_recall_done = true
	main._finish_match("boss_victory")
	var result_ok: bool = _state(main) == "boss_victory"
	main._handle_terminal_action()
	_record("boss victory -> supply", result_ok and _state(main) == "supply")
	await _finish_main(main)

func _probe_terminal_action_parity() -> void:
	var button_main = await _new_main()
	button_main.first_sortie = false
	button_main.first_recall_done = true
	button_main._finish_match("game_over")
	var callback_method := str(button_main.hud.restart_callback.get_method())
	button_main.hud._on_restart_button_pressed()
	var button_ok: bool = _state(button_main) == "supply"
	await _finish_main(button_main)

	var space_main = await _new_main()
	space_main.first_sortie = false
	space_main.first_recall_done = true
	space_main._finish_match("game_over")
	space_main._handle_terminal_action()
	var space_ok: bool = _state(space_main) == "supply"
	await _finish_main(space_main)

	_record(
		"space terminal action == button terminal action",
		callback_method == "_handle_terminal_action" and button_ok and space_ok,
		"button callback was %s" % callback_method
	)

func _probe_tag_settlement_and_recall_quality() -> void:
	var fast_main = await _new_main()
	fast_main.first_sortie = false
	fast_main.first_recall_done = true
	fast_main.elapsed = 20.0
	fast_main._finish_match("game_over")
	var fast_settlement: Dictionary = fast_main.last_run_result.get("ration_ticket_settlement", {})
	var fast_candidates: Dictionary = fast_settlement.get("candidates", {})
	var fast_confirmed: Dictionary = fast_settlement.get("confirmed", {})
	var fast_no_tags := int(fast_candidates.get("food", 0)) == 0 and int(fast_candidates.get("power", 0)) == 0 and int(fast_candidates.get("signal", 0)) == 0 and int(fast_confirmed.get("food", 0)) == 0
	var fast_ui_text := String(fast_main.hud.result_label.text)
	var fast_ui_ok := fast_ui_text.find("정산 근거 없음") != -1 and fast_ui_text.find("승인/보류 판정 잠김") != -1 and fast_ui_text.find("45초 미만") != -1
	var fast_quality_ok := String(fast_main.last_run_result.get("recall_quality", "")) == "unstable_recall"
	fast_main._handle_terminal_action()
	var fast_loop_ok: bool = _state(fast_main) == "supply"
	_record("45s under fast failure grants no tag settlement", fast_no_tags)
	_record("45s under fast failure explains no settlement", fast_ui_ok)
	_record("45s under fast failure has unstable recall quality", fast_quality_ok)
	_record("post-recall fast failure still returns to supply", fast_loop_ok)
	await _finish_main(fast_main)

	var story_main = await _new_main()
	story_main.elapsed = 20.0
	story_main._finish_match("recalled")
	var story_ok: bool = String(story_main.last_run_result.get("recall_quality", "")) == "story_recall" and story_main.meta_progression.trace_count("torn_ad_flyer") > 0
	_record("first forced recall keeps story reward separate", story_ok)
	await _finish_main(story_main)

	var tier_main = await _new_main()
	tier_main.first_sortie = false
	tier_main.first_recall_done = true
	tier_main.elapsed = 90.0
	tier_main._finish_match("victory")
	var ninety_settlement: Dictionary = tier_main.last_run_result.get("ration_ticket_settlement", {})
	var ninety_confirmed: Dictionary = ninety_settlement.get("confirmed", {})
	var ninety_ok := int(ninety_confirmed.get("food", 0)) >= 1
	await _finish_main(tier_main)

	var signal_main = await _new_main()
	signal_main.first_sortie = false
	signal_main.first_recall_done = true
	signal_main.elapsed = 120.0
	signal_main.open_house_signal_stage = 1
	signal_main._finish_match("victory")
	var signal_settlement: Dictionary = signal_main.last_run_result.get("ration_ticket_settlement", {})
	var signal_candidates: Dictionary = signal_settlement.get("candidates", {})
	var signal_ok := int(signal_candidates.get("signal", 0)) >= 1 and Array(signal_main.last_run_result.get("signal_clue_candidates", [])).has("faint_signal")
	await _finish_main(signal_main)

	var deep_main = await _new_main()
	deep_main.first_sortie = false
	deep_main.first_recall_done = true
	deep_main.elapsed = 240.0
	deep_main.open_house_signal_stage = 3
	deep_main._finish_match("victory")
	var deep_ok := Array(deep_main.last_run_result.get("signal_clue_candidates", [])).has("near_signal")
	_record("90s run confirms food tag survival right", ninety_ok)
	_record("120s run can produce signal access candidate", signal_ok)
	_record("240s run can produce boss-route signal clue candidate", deep_ok)
	await _finish_main(deep_main)

func _probe_r01_campaign_map_flow() -> void:
	var main = await _new_main()
	main._show_supply_depot()
	main._open_r01_campaign_map()
	var open_ok: bool = _state(main) == "supply" and main.r01_campaign_map_open and main.hud.is_campaign_map_visible()
	var initial_ui_text: String = main.hud.campaign_map_visible_text()
	var initial_ui_clean: bool = initial_ui_text.find("R01-L") == -1
	var readability_text_ok: bool = initial_ui_text.find("범례: 초록 접근 가능") != -1 and initial_ui_text.find("핀 선택 후 출격") != -1 and initial_ui_text.find("작전권:") != -1 and initial_ui_text.find("얇은 선은 곁길") != -1
	var initial_tag_hint_ok: bool = initial_ui_text.find("태그") != -1 and initial_ui_text.find("진입 가능") != -1

	main._select_r01_campaign_node("R01-L01")
	var l01_selected_text: String = main.hud.campaign_map_visible_text()
	var l01_highlight_ok: bool = l01_selected_text.find("선택 중: 침묵 가장자리") != -1 and l01_selected_text.find("회수선: 안정") != -1 and l01_selected_text.find("목표") != -1 and l01_selected_text.find("오래된 공공 안내판") != -1 and l01_selected_text.find("외곽 진입 작전권") != -1
	main._sortie_selected_r01_campaign_node()
	var sortie_ok: bool = _state(main) == "playing" and main.current_r01_node_id == "R01-L01" and not main.r01_campaign_map_open
	var l01_entry_notice_text: String = main._active_notice_text()
	var l01_entry_notice_ok: bool = (l01_entry_notice_text.find("침묵 가장자리") != -1 or l01_entry_notice_text.find("외곽 회수 차선") != -1) and (l01_entry_notice_text.find("14차") != -1 or l01_entry_notice_text.find("등록 임계") != -1)
	var l01_start_pos: Vector2 = _player_pos(main)
	main._finish_match("recalled")
	var l01_result_text: String = _result_text(main)
	var l01_result_memory_ok: bool = l01_result_text.find("작전권: 침묵 가장자리") != -1 and (l01_result_text.find("구역 사건") != -1 or l01_result_text.find("회수선") != -1)
	main._handle_terminal_action()
	var post_run_supply_ok: bool = _state(main) == "supply"
	var l02_available: bool = String(main.r01_campaign_node_states.get("R01-L02", "")) == "available"
	var l03_locked_before_l02: bool = String(main.r01_campaign_node_states.get("R01-L03", "")) == "locked"

	main._open_r01_campaign_map()
	var post_l01_text: String = main.hud.campaign_map_visible_text()
	var l02_opened_pulse_ok: bool = post_l01_text.find("새 신호: 분양 주택 루프 접근 가능") != -1 and main.r01_campaign_new_signal_node_ids.has("R01-L02")
	main._select_r01_campaign_node("R01-L02")
	main._sortie_selected_r01_campaign_node()
	var l02_entry_ok: bool = _state(main) == "playing" and main.current_r01_node_id == "R01-L02" and l01_start_pos.distance_to(_player_pos(main)) > 500.0 and main._combat_goal_label().find("분양 주택 루프") != -1 and main._active_notice_text().find("우편함") != -1
	main._finish_match("victory")
	var l02_result_text: String = _result_text(main)
	var l02_result_context_ok: bool = l02_result_text.find("작전권: 분양 주택 루프") != -1 and l02_result_text.find("우편함") != -1 and l02_result_text.find("다음 작전도 변화") != -1
	main._handle_terminal_action()
	var l02_supply_text: String = main.hud.supply_visible_text()
	var l02_outpost_reaction_ok: bool = l02_supply_text.find("우편함 주소") != -1 or l02_supply_text.find("현관 센서") != -1
	var l03_unlocked_after_l02: bool = String(main.r01_campaign_node_states.get("R01-L03", "")) == "boss_ready"
	main._open_r01_campaign_map()
	var post_l02_text: String = main.hud.campaign_map_visible_text()
	var l03_opened_text_ok: bool = post_l02_text.find("새 신호: 모델하우스 결절 심사 접근 가능") != -1
	var post_l02_memory_ok: bool = post_l02_text.find("흔적:") != -1 and post_l02_text.find("분양 주택 루프") != -1

	main._debug_r01_campaign_unlock_all()
	var unlock_all_ok: bool = true
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		unlock_all_ok = unlock_all_ok and String(main.r01_campaign_node_states.get(node_id, "")) == "available"
	main._open_r01_campaign_map()
	main._select_r01_campaign_node("R01-L05")
	var l05_text: String = main.hud.campaign_map_visible_text()
	var l05_false_route_ok: bool = l05_text.find("가짜 귀환로") != -1 and l05_text.find("회수선: 불안정") != -1 and l05_text.find("실제 회수선") != -1 and l05_text.find("보급소로 돌아가기") == -1
	var l05_tag_hint_ok: bool = l05_text.find("수신태그") != -1 and l05_text.find("회수선 출처") != -1
	var final_ui_clean: bool = l05_text.find("R01-L") == -1
	main.debug_tools.detail_visible = true
	var debug_text: String = main._debug_overlay_text()
	var debug_hud_ids_ok: bool = debug_text.find("campaign current=R01-L02") != -1 and debug_text.find("selected=R01-L05") != -1 and debug_text.find("bias=mailbox_pincer") != -1
	var debug_source_ok: bool = debug_text.find("r01 sources zone=") != -1 and debug_text.find("r01 hazard sources") != -1
	var debug_tag_ok: bool = debug_text.find("recall quality") != -1 and debug_text.find("tag ledger") != -1 and debug_text.find("tag access current=") != -1
	var debug_node_memory_ok: bool = debug_text.find("campaign node memory") != -1 and debug_text.find("R01-L02{") != -1

	_record("campaign map opens from supply", open_ok)
	_record("campaign map has readable legend and instruction", readability_text_ok)
	_record("campaign map shows selected node tag hint", initial_tag_hint_ok)
	_record("L01 selected highlight exists", l01_highlight_ok)
	_record("campaign UI hides internal ids", initial_ui_clean and final_ui_clean)
	_record("L01 select -> sortie starts", sortie_ok)
	_record("L01 entry notice follows selected operation", l01_entry_notice_ok)
	_record("L01 result records selected operation", l01_result_memory_ok)
	_record("post-run returns to supply", post_run_supply_ok)
	_record("L02 available after L01 visit", l02_available)
	_record("L01 complete -> L02 pulse/opened state", l02_opened_pulse_ok)
	_record("L02 sortie changes combat entry", l02_entry_ok)
	_record("L02 result explains local operation incident", l02_result_context_ok)
	_record("L02 outpost reacts to mailbox/front-door residue", l02_outpost_reaction_ok)
	_record("L03 locked until L02 condition", l03_locked_before_l02 and l03_unlocked_after_l02 and l03_opened_text_ok)
	_record("post-result campaign map shows node memory marker text", post_l02_memory_ok)
	_record("L05 displayed as false route", l05_false_route_ok, l05_text)
	_record("L05 shows signal tag false-return warning", l05_tag_hint_ok)
	_record("debug unlock all campaign nodes", unlock_all_ok)
	_record("debug HUD exposes campaign ids", debug_hud_ids_ok)
	_record("debug HUD exposes source summaries", debug_source_ok)
	_record("debug HUD exposes tag ledger and recall quality", debug_tag_ok)
	_record("debug HUD exposes R01 node memory", debug_node_memory_ok)
	await _probe_r01_campaign_result_bridge_variants()
	_probe_r01_campaign_node_entry_profiles(main)
	main._close_r01_campaign_map()
	await _finish_main(main)

	var preview_main = await _new_main()
	preview_main._debug_preview_r01_campaign_node(2)
	var debug_preview_unlock_ok: bool = _state(preview_main) == "supply" and preview_main.r01_campaign_map_open and preview_main.selected_r01_node_id == "R01-L03" and String(preview_main.r01_campaign_node_states.get("R01-L03", "")) == "available"
	preview_main._sortie_selected_r01_campaign_node()
	var debug_preview_sortie_ok: bool = _state(preview_main) == "playing" and preview_main.current_r01_node_id == "R01-L03"
	_record("Ctrl+1-5 debug preview unlocks sortie", debug_preview_unlock_ok and debug_preview_sortie_ok)
	await _finish_main(preview_main)

func _probe_ten_minute_loop_readability() -> void:
	var main = await _new_main()
	main._show_supply_depot()
	var initial_supply_text: String = main.hud.supply_visible_text()
	var initial_recommend_ok: bool = initial_supply_text.find("추천:") != -1 and initial_supply_text.find("이유:") != -1 and initial_supply_text.find("침묵 가장자리") != -1
	main._open_r01_campaign_map()
	var map_text: String = main.hud.campaign_map_visible_text()
	var map_recommend_ok: bool = map_text.find("다음 추천:") != -1 and map_text.find("추천") != -1 and map_text.find("R01-L") == -1
	main._select_r01_campaign_node("R01-L01")
	main._sortie_selected_r01_campaign_node()
	var l01_combat_goal_text := String(main.hud.route_goal_label.text)
	var combat_goal_ok: bool = l01_combat_goal_text.find("침묵 가장자리") != -1 and (l01_combat_goal_text.find("60초") != -1 or l01_combat_goal_text.find("108초") != -1)
	main._finish_match("recalled")
	var l01_result_text: String = _result_text(main)
	var result_recommend_ok: bool = l01_result_text.find("정산 카운터") != -1 and l01_result_text.find("침묵 가장자리") != -1
	main._handle_terminal_action()
	var post_l01_supply_text: String = main.hud.supply_visible_text()
	var post_supply_recommend_ok: bool = post_l01_supply_text.find("추천:") != -1 and post_l01_supply_text.find("분양 주택 루프") != -1
	main._open_r01_campaign_map()
	main._select_r01_campaign_node("R01-L02")
	main._sortie_selected_r01_campaign_node()
	main.elapsed = 120.0
	main.open_house_signal_stage = 1
	main.ration_candidate_notice_total = 0
	main._update_ration_candidate_feedback()
	var candidate_feedback_ok: bool = main.ration_candidate_notice_total > 0 and main._active_notice_text().find("수신태그 후보") != -1
	main._finish_match("victory")
	var l02_result_text: String = String(main.hud.result_label.text)
	var compact_result_ok: bool = l02_result_text.find("정산 카운터") != -1 and l02_result_text.find("정산 기록") != -1 and l02_result_text.split("\n").size() <= 13
	main._handle_terminal_action()
	var post_l02_supply_text: String = main.hud.supply_visible_text()
	var l03_recommend_ok: bool = post_l02_supply_text.find("모델하우스 결절") != -1 and post_l02_supply_text.find("120초") != -1
	main._open_r01_campaign_map()
	var post_l02_map_text: String = main.hud.campaign_map_visible_text()
	var next_map_state_ok: bool = post_l02_map_text.find("모델하우스 결절") != -1 and post_l02_map_text.find("다음 추천:") != -1 and post_l02_map_text.find("R01-L") == -1
	main.debug_tools.detail_visible = true
	var debug_ok: bool = main._debug_overlay_text().find("campaign loop recommendation") != -1 and main._debug_overlay_text().find("campaign node memory") != -1
	_record("10min supply shows one recommended operation", initial_recommend_ok, initial_supply_text)
	_record("10min campaign map shows recommendation without ids", map_recommend_ok, map_text)
	_record("10min combat HUD keeps current objective", combat_goal_ok, l01_combat_goal_text)
	_record("10min L01 result points to next operation", result_recommend_ok, l01_result_text)
	_record("10min outpost return keeps next choice reason", post_supply_recommend_ok, post_l01_supply_text)
	_record("10min first tag/signal candidate feedback appears once", candidate_feedback_ok, main._active_notice_text())
	_record("10min result summary remains compact", compact_result_ok, l02_result_text)
	_record("10min L02 return recommends L03", l03_recommend_ok, post_l02_supply_text)
	_record("10min next campaign map carries result state", next_map_state_ok, post_l02_map_text)
	_record("F12 keeps loop recommendation debug state", debug_ok)
	await _finish_main(main)

func _probe_r01_0_2_integrated_auto_qa() -> void:
	var map_main = await _new_main()
	map_main._show_supply_depot()
	map_main._open_r01_campaign_map()
	var first_map_text: String = map_main.hud.campaign_map_visible_text()
	var first_anchor_ok := first_map_text.find("오래된 공공 안내판") != -1 and first_map_text.find("14차") != -1 and first_map_text.find("가족 복구 운용") != -1
	await _finish_main(map_main)

	var main = await _new_main()
	var first_entry_text := "%s\n%s\n%s" % [main._active_notice_text(), main._route_stage_label(), main._combat_goal_label()]
	var first_entry_ok := first_entry_text.find("침묵 가장자리") != -1 and first_entry_text.find("14차") != -1
	main.elapsed = 108.0
	main._finish_match("recalled")
	var first_recall_text := _result_text(main)
	var first_recall_ok := first_recall_text.find("가족 슬롯 배정 직전") != -1 and first_recall_text.find("끌어왔습니다") != -1
	var first_settlement_ok := first_recall_text.find("정산 카운터") != -1 and first_recall_text.find("캠페인 승인") != -1 and first_recall_text.find("보급소 보류") != -1 and first_recall_text.find("오염 꼬리표") != -1
	var first_archive_ok := first_recall_text.find("이름 보관함") != -1 and first_recall_text.find("가족 칸에 확정하지 않고 보류") != -1
	main._handle_terminal_action()

	main._restart()
	var revisit_one_count := int(main.meta_progression.r01_state_summary().get("r01_revisit_count", 0))
	var mailbox := _move_to_story_object(main, "r01_story_l02_mailbox")
	var source_one_interacted: bool = not mailbox.is_empty() and bool(main._try_field_interaction())
	var source_one_state := R01SourceState.current_state(Dictionary(main.r01_source_states.get("r01_story_l02_mailbox", {})))
	var source_one_text := "%s\n%s" % [main._active_notice_text(), R01SourceState.p0_state_phrase(mailbox, source_one_state, main.meta_progression.r01_state_summary())]
	main.elapsed = 90.0
	main._finish_match("victory")
	var revisit_one_result := _result_text(main)
	var revisit_one_ok: bool = revisit_one_count >= 2 and source_one_interacted and source_one_text.find("우편함") != -1 and revisit_one_result.find("R01 학습") != -1 and revisit_one_result.find("반복 출격 source 변화") != -1
	main._handle_terminal_action()

	main._restart()
	var revisit_two_count := int(main.meta_progression.r01_state_summary().get("r01_revisit_count", 0))
	var fake_marker := _move_to_story_object(main, "r01_story_l05_fake_return_sign")
	var source_two_interacted: bool = not fake_marker.is_empty() and bool(main._try_field_interaction())
	var source_two_state := R01SourceState.current_state(Dictionary(main.r01_source_states.get("r01_story_l05_fake_return_sign", {})))
	var source_two_text := "%s\n%s" % [main._active_notice_text(), R01SourceState.p0_state_phrase(fake_marker, source_two_state, main.meta_progression.r01_state_summary())]
	main.elapsed = 70.0
	main._finish_match("game_over")
	var revisit_two_result := _result_text(main)
	var revisit_two_ok: bool = revisit_two_count >= 3 and source_two_interacted and source_two_text.find("가짜") != -1 and (revisit_two_result.find("가짜 회수") != -1 or revisit_two_result.find("오염 꼬리표") != -1)
	main._handle_terminal_action()

	main._restart()
	main.current_r01_node_id = R01CampaignMap.NODE_L03
	main.selected_r01_node_id = R01CampaignMap.NODE_L03
	main.elapsed = 240.0
	main._finish_match("boss_victory")
	var boss_text := _result_text(main)
	var boss_ok := boss_text.find("모델하우스 결절 심사 반려") != -1 and boss_text.find("결절 일부 침묵") != -1 and boss_text.find("상위 송출 잔향 남음") != -1 and boss_text.find("고객 보류") != -1 and boss_text.find("이름 보관함") != -1
	var boss_state: Dictionary = main.meta_progression.r01_state_summary()
	var boss_state_ok := int(boss_state.get("r01_boss_residue", 0)) > 0 and String(boss_state.get("r01_yunseo_role_guess", "")).find("고객 보류") != -1
	main._handle_terminal_action()
	var post_boss_supply_text: String = main.hud.supply_visible_text()
	main._open_r01_campaign_map()
	var post_boss_board_text := "%s\n%s" % [post_boss_supply_text, main.hud.campaign_map_visible_text()]
	main._close_r01_campaign_map()
	main._restart()
	var post_boss_entry_text := "%s\n%s\n%s" % [main._route_stage_label(), main._active_notice_text(), RoutePhraseResolver.r01_outpost_phrase(main._r01_phrase_state())]
	var family_window := _move_to_story_object(main, "r01_story_l02_family_window")
	var family_window_state := R01SourceState.current_state(Dictionary(main.r01_source_states.get("r01_story_l02_family_window", {})))
	var post_boss_source_text: String = R01SourceState.p0_state_phrase(family_window, family_window_state, main.meta_progression.r01_state_summary())
	main.elapsed = 55.0
	main._finish_match("game_over")
	var post_boss_result := _result_text(main)
	var post_boss_ok: bool = (post_boss_board_text.find("상위 송출 잔향") != -1 or post_boss_entry_text.find("상위 송출 잔향") != -1) and post_boss_entry_text.find("상위 송출 잔향") != -1 and (post_boss_source_text.find("심사 반려") != -1 or post_boss_result.find("재심사 잔향") != -1)
	var forbidden_text := "%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s" % [
		first_map_text,
		first_entry_text,
		first_recall_text,
		revisit_one_result,
		revisit_two_result,
		boss_text,
		post_boss_board_text,
		post_boss_entry_text,
		post_boss_result,
	]
	var forbidden := _forbidden_hit(forbidden_text)

	_record("R01 0.2 first sortie anchors visible", first_anchor_ok, first_map_text)
	_record("R01 0.2 first sortie entry says 14th family operation", first_entry_ok, first_entry_text)
	_record("R01 0.2 108s recall is pre-registration extraction", first_recall_ok, first_recall_text)
	_record("R01 0.2 settlement has approval/hold/contamination split", first_settlement_ok, first_recall_text)
	_record("R01 0.2 name archive is held judgment", first_archive_ok, first_recall_text)
	_record("R01 0.2 revisit 1 source variation appears", revisit_one_ok, "%s\n%s" % [source_one_text, revisit_one_result])
	_record("R01 0.2 revisit 2 fake recall variation appears", revisit_two_ok, "%s\n%s" % [source_two_text, revisit_two_result])
	_record("R01 0.2 boss result is rejection/residue", boss_ok and boss_state_ok, boss_text)
	_record("R01 0.2 post-boss revisit keeps broadcast residue", post_boss_ok, "%s\n%s\n%s" % [post_boss_board_text, post_boss_entry_text, post_boss_result])
	_record("R01 0.2 integrated probe has no forbidden phrases", forbidden == "", forbidden)
	await _finish_main(main)

func _probe_r01_field_interactions() -> void:
	var main = await _new_main()
	_start_r01_story_probe(main, R01CampaignMap.NODE_L01)
	var l01_mailbox := _move_to_story_object(main, "r01_story_l01_mailbox")
	main.wave_notice_timer = 0.0
	main.field_interaction_notice_timer = 0.0
	var prompt_text: String = main._active_notice_text()
	var prompt_ok: bool = prompt_text.find("E 조사: 우편함") != -1 and prompt_text.find("r01_story") == -1
	var interaction_checks := {
		"r01_story_l01_mailbox": {"node": R01CampaignMap.NODE_L01, "expect": "주소", "memory": "우편함"},
		"r01_story_l02_front_sensor": {"node": R01CampaignMap.NODE_L02, "expect": "방문 심사", "memory": "현관 센서"},
		"r01_story_l03_model_entry": {"node": R01CampaignMap.NODE_L03, "expect": "모델하우스", "memory": "모델하우스"},
		"r01_story_l04_drain_trace": {"node": R01CampaignMap.NODE_L04, "expect": "젖은 전단", "memory": "젖은 전단"},
		"r01_story_l05_fake_return_sign": {"node": R01CampaignMap.NODE_L05, "expect": "회수선 출처", "memory": "가짜"},
	}
	var zone_memory_ok := not l01_mailbox.is_empty()
	var reveal_before := int(main.field_interaction_reveals.size())
	for object_id in interaction_checks.keys():
		var expected: Dictionary = interaction_checks[object_id]
		var object := _move_to_story_object(main, String(object_id))
		var interacted: bool = main._try_field_interaction()
		var notice: String = main._active_notice_text()
		var memory: Dictionary = main._r01_campaign_node_memory(String(expected["node"]))
		zone_memory_ok = zone_memory_ok and interacted
		zone_memory_ok = zone_memory_ok and notice.find(String(expected["expect"])) != -1
		zone_memory_ok = zone_memory_ok and int(memory.get("node_story_object_count", 0)) > 0
		zone_memory_ok = zone_memory_ok and String(memory.get("node_last_story_object_phrase", "")).find(String(expected["memory"])) != -1
		zone_memory_ok = zone_memory_ok and String(object.get("id", "")) == String(object_id)
	var reveal_ok: bool = int(main.field_interaction_reveals.size()) > reveal_before
	var l01_memory_before: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L01)
	var l01_story_count_before := int(l01_memory_before.get("node_story_object_count", 0))
	_move_to_story_object(main, "r01_story_l01_mailbox")
	var repeat_ok: bool = main._try_field_interaction()
	var repeat_text: String = main._active_notice_text()
	var l01_memory_after: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L01)
	repeat_ok = repeat_ok and repeat_text.find("같은 주소") != -1 and int(l01_memory_after.get("node_story_object_count", 0)) == l01_story_count_before
	_record("R01 field interaction prompt hides ids", prompt_ok, prompt_text)
	_record("R01 L01-L05 story interactions update memory", zone_memory_ok)
	_record("R01 repeated story interaction uses repeat phrase", repeat_ok, repeat_text)
	_record("R01 field interactions reveal combat source hints", reveal_ok)
	await _finish_main(main)

	var bridge_main = await _new_main()
	_start_r01_story_probe(bridge_main, R01CampaignMap.NODE_L01)
	_move_to_story_object(bridge_main, "r01_story_l01_mailbox")
	var bridge_interact_ok: bool = bridge_main._try_field_interaction()
	bridge_main.elapsed = 90.0
	bridge_main._finish_match("victory")
	bridge_main._handle_terminal_action()
	var supply_text: String = bridge_main.hud.supply_visible_text()
	var supply_ok: bool = bridge_interact_ok and _state(bridge_main) == "supply" and supply_text.find("주소 중복") != -1 and supply_text.find("r01_story") == -1
	bridge_main._open_r01_campaign_map()
	var map_text: String = bridge_main.hud.campaign_map_visible_text()
	var map_ok: bool = map_text.find("흔적:") != -1 and map_text.find("우편함") != -1 and map_text.find("r01_story") == -1
	bridge_main.debug_tools.detail_visible = true
	var debug_text: String = bridge_main._debug_overlay_text()
	var debug_ok: bool = debug_text.find("r01 field interactions") != -1 and debug_text.find("r01_story_l01_mailbox") != -1 and debug_text.find("r01 interacted count") != -1 and debug_text.find("campaign node memory") != -1
	_record("R01 field interactions bridge to outpost", supply_ok, supply_text)
	_record("R01 field interactions bridge to campaign map without ids", map_ok, map_text)
	_record("F12 exposes R01 interaction ids/counts", debug_ok, debug_text)
	await _finish_main(bridge_main)

func _probe_r01_micro_locations() -> void:
	var main = await _new_main()
	_start_r01_story_probe(main, R01CampaignMap.NODE_L02)
	_move_to_story_object(main, "r01_story_l02_closed_door")
	main.wave_notice_timer = 0.0
	main.micro_location_notice_timer = 0.0
	var entry_prompt: String = main._active_notice_text()
	var prompt_ok := entry_prompt.find("E 진입: 현관 앞") != -1 and entry_prompt.find("l02_") == -1 and entry_prompt.find("r01_story") == -1
	var enter_ok: bool = main._handle_micro_location_input(_key_event(KEY_E))
	enter_ok = enter_ok and main.micro_location_active and main.current_micro_location_id == "l02_porch_gap" and main.micro_location_entry_object_id == "r01_story_l02_closed_door"
	var debug_before_exit := ""
	main.debug_tools.detail_visible = true
	debug_before_exit = main._debug_overlay_text()
	var debug_ok := debug_before_exit.find("r01 micro location current=l02_porch_gap") != -1 and debug_before_exit.find("entry=r01_story_l02_closed_door") != -1 and debug_before_exit.find("points=3") != -1
	debug_ok = debug_ok and debug_before_exit.find("r01 micro visual style=porch") != -1 and debug_before_exit.find("focus=") != -1 and debug_before_exit.find("alpha=") != -1
	main.debug_tools.detail_visible = false
	var overlay_rect: Rect2 = main._micro_location_overlay_rect(main._current_micro_location())
	var visual_info: Dictionary = main._debug_info()
	var overlay_visible_ok: bool = main.micro_location_overlay_alpha > 0.5 and overlay_rect.size.x >= 150.0 and overlay_rect.size.y >= 100.0
	overlay_visible_ok = overlay_visible_ok and String(visual_info.get("r01_micro_visual_style", "")) == "porch"
	overlay_visible_ok = overlay_visible_ok and String(visual_info.get("r01_micro_camera_focus_offset", "")) != "0,0"
	var visual_catalog_ok := _micro_visual_catalog_ok()

	main.current_micro_point_id = "door_voice"
	var inspect_ok: bool = main._handle_micro_location_input(_key_event(KEY_E))
	var l02_memory: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L02)
	inspect_ok = inspect_ok and int(l02_memory.get("node_micro_point_count", 0)) == 1 and String(l02_memory.get("node_last_micro_phrase", "")) != ""
	var completed_point_marker_ok: bool = main._micro_location_point_completed("l02_porch_gap", "door_voice")
	var door_point := R01MicroLocations.point_by_id(main._current_micro_location(), "door_voice")
	completed_point_marker_ok = completed_point_marker_ok and main._micro_location_point_position(main._current_micro_location(), door_point).distance_squared_to(overlay_rect.get_center()) > 4.0
	var count_before := int(l02_memory.get("node_micro_point_count", 0))
	main.current_micro_point_id = "door_voice"
	var repeat_ok: bool = main._handle_micro_location_input(_key_event(KEY_E))
	var repeat_memory: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L02)
	repeat_ok = repeat_ok and int(repeat_memory.get("node_micro_point_count", 0)) == count_before

	main.current_micro_point_id = "front_sensor"
	var stamp_ok: bool = main._handle_micro_location_input(_key_event(KEY_J))
	var sensor_state: Dictionary = main.r01_source_states.get("r01_story_l02_front_sensor", {})
	stamp_ok = stamp_ok and R01SourceState.current_state(sensor_state) == R01SourceState.STATE_SUPPRESSED and String(main._active_notice_text()).find("현장 도장") != -1
	main.current_micro_point_id = "address_sticker"
	var charge_ok: bool = main._handle_micro_location_input(_key_event(KEY_SPACE))
	var mailbox_state: Dictionary = main.r01_source_states.get("r01_story_l02_mailbox", {})
	charge_ok = charge_ok and R01SourceState.current_state(mailbox_state) == R01SourceState.STATE_OVERLOADED and String(main._active_notice_text()).find("강한 도장") != -1
	var all_done_ok: bool = main._handle_micro_location_input(_key_event(KEY_E)) and not main.micro_location_active

	var location_checks := {
		"r01_story_l02_family_window": {"location": "가족사진 창문 앞", "node": R01CampaignMap.NODE_L02, "memory": "가족사진"},
		"r01_story_l03_model_entry": {"location": "모델하우스 로비 앞", "node": R01CampaignMap.NODE_L03, "memory": "모델하우스"},
		"r01_story_l04_drain_trace": {"location": "배수로 입구", "node": R01CampaignMap.NODE_L04, "memory": "배수로"},
		"r01_story_l05_fake_return_sign": {"location": "가짜 표지 뒤 쉼터", "node": R01CampaignMap.NODE_L05, "memory": "가짜"},
	}
	var location_flow_ok := true
	for object_id in location_checks.keys():
		var expected: Dictionary = location_checks[object_id]
		_move_to_story_object(main, String(object_id))
		main.micro_location_notice_timer = 0.0
		var enter_location_ok: bool = main._active_notice_text().find(String(expected["location"])) != -1
		enter_location_ok = enter_location_ok and main._handle_micro_location_input(_key_event(KEY_E))
		enter_location_ok = enter_location_ok and main.micro_location_active
		var inspect_location_ok: bool = main._handle_micro_location_input(_key_event(KEY_E))
		var memory: Dictionary = main._r01_campaign_node_memory(String(expected["node"]))
		inspect_location_ok = inspect_location_ok and int(memory.get("node_micro_point_count", 0)) > 0
		inspect_location_ok = inspect_location_ok and String(memory.get("node_last_micro_phrase", "")).find(String(expected["memory"])) != -1
		location_flow_ok = location_flow_ok and enter_location_ok and inspect_location_ok
		main._handle_micro_location_input(_key_event(KEY_ESCAPE))

	_move_to_story_object(main, "r01_story_l05_fake_return_sign")
	main._handle_micro_location_input(_key_event(KEY_E))
	main.micro_location_risk_timer = 0.0
	var active_threats_before: int = main.active_threats.size()
	main._update_micro_location_runtime(0.2)
	var risk_ok: bool = main.micro_location_active and (main.active_threats.size() > active_threats_before or String(main.last_threat_label).find("마이크로 장소") != -1)
	var risk_debug_ok: bool = bool(main._debug_info().get("r01_micro_risk_pulse_active", false))
	main._handle_micro_location_input(_key_event(KEY_ESCAPE))

	main._finish_match("victory")
	main._handle_terminal_action()
	var supply_text: String = main.hud.supply_visible_text()
	var supply_ok: bool = _state(main) == "supply" and (supply_text.find("모델하우스") != -1 or supply_text.find("가짜") != -1 or supply_text.find("배수로") != -1)
	supply_ok = supply_ok and supply_text.find("l02_") == -1 and supply_text.find("r01_story") == -1
	main._open_r01_campaign_map()
	main._select_r01_campaign_node(R01CampaignMap.NODE_L05)
	var map_text: String = main.hud.campaign_map_visible_text()
	var map_ok := map_text.find("흔적:") != -1 and map_text.find("가짜") != -1 and map_text.find("l05_") == -1 and map_text.find("r01_story") == -1
	main.debug_tools.detail_visible = true
	var debug_after: String = main._debug_overlay_text()
	var debug_memory_ok := debug_after.find("r01 micro memory") != -1 and debug_after.find("l05_fake_shelter") != -1
	debug_memory_ok = debug_memory_ok and debug_after.find("r01 micro visual") != -1

	_record("R01 micro location entry prompt hides ids", prompt_ok, entry_prompt)
	_record("L02 porch micro location enters with E", enter_ok)
	_record("micro location overlay visual state is present", overlay_visible_ok, JSON.stringify(visual_info))
	_record("micro location visual catalog has distinct markers", visual_catalog_ok)
	_record("L02 porch micro point inspect records node memory", inspect_ok)
	_record("micro completed point marker has placed state", completed_point_marker_ok)
	_record("micro point repeat does not farm node memory", repeat_ok)
	_record("micro J stamp suppresses linked source", stamp_ok)
	_record("micro SPACE charge overloads linked source", charge_ok)
	_record("micro location exits after completed points", all_done_ok)
	_record("L02/L03/L04/L05 micro locations inspect points", location_flow_ok)
	_record("micro location dwell keeps source risk active", risk_ok and risk_debug_ok)
	_record("micro location bridges to outpost without ids", supply_ok, supply_text)
	_record("micro location bridges to campaign map without ids", map_ok, map_text)
	_record("F12 exposes micro location debug state", debug_ok and debug_memory_ok, "%s\n%s" % [debug_before_exit, debug_after])
	await _finish_main(main)

func _micro_visual_catalog_ok() -> bool:
	var expected := {
		"l01_public_anchor": ["dead_public_notice", "smilehome_revision_label", "right_notice_off"],
		"l02_porch_gap": ["door_frame", "door_gap_light", "sensor_line", "address_sticker", "warning_lamp"],
		"l02_family_window": ["window_frame", "photo_afterimage", "inside_shadow", "smile_review_check"],
		"l03_model_lobby": ["lobby_threshold", "reception_silhouette", "family_form_panel", "name_device", "consultation_light"],
		"l04_drain_entrance": ["drain_frame", "water_lines", "wet_flyer", "broken_request", "low_signal_ripple"],
		"l05_fake_shelter": ["outpost_like_mark", "wrong_recovery_line", "rear_ad_pillar", "broken_guide", "unstable_flicker"],
	}
	var seen_styles := {}
	for location in R01MicroLocations.locations():
		var location_id := String(location.get("location_id", ""))
		var style := String(location.get("visual_style", ""))
		if location_id == "" or style == "":
			return false
		seen_styles[style] = true
		var markers := Array(location.get("visual_markers", []))
		for marker in Array(expected.get(location_id, [])):
			if not markers.has(marker):
				return false
		if Vector2(location.get("overlay_size", Vector2.ZERO)).length() <= 0.0:
			return false
		for point in R01MicroLocations.inspection_points(location):
			if not point.has("overlay_pos"):
				return false
	return seen_styles.size() >= 5

func _probe_npc_presence_layer() -> void:
	var main = await _new_main()
	main.meta_progression.grant_first_recall_trace()
	main._show_supply_depot()
	var outpost_state: Dictionary = main.outpost_blockout.state_from_progress(main._session_progress_data(), main.meta_progression)
	var markers := NPCPresence.outpost_npc_markers(outpost_state)
	var marker_names := {}
	var marker_facilities := {}
	for marker in markers:
		marker_names[String(marker.get("display_name", ""))] = true
		marker_facilities[String(marker.get("npc_id", ""))] = String(marker.get("facility", ""))
	var marker_ok := markers.size() == 5 and marker_names.has("미나") and marker_names.has("도윤") and marker_names.has("팝시") and marker_names.has("세븐") and marker_names.has("복희")
	var facility_ok: bool = marker_facilities.get("mina", "") == "settlement_counter" and marker_facilities.get("doyun", "") == "maintenance_bench" and marker_facilities.get("popsy", "") == "trace_storage_room" and marker_facilities.get("seven", "") == "sortie_board" and marker_facilities.get("bokhee", "") == "name_archive"
	var active_reactions := NPCPresence.active_reaction_markers(outpost_state, 2)
	var sparse_reaction_ok := active_reactions.size() <= 2
	var first_recall_lines: String = main.meta_progression.outpost_event_log_summary(3)
	var first_recall_ok: bool = first_recall_lines.find("미나") != -1 and first_recall_lines.find("복희") != -1

	_start_r01_story_probe(main, R01CampaignMap.NODE_L01)
	var trace_catalog_ok: bool = main.r01_blockout.field_trace_count() >= 7
	var trace_summary: String = main.r01_blockout.field_trace_summary_line()
	trace_catalog_ok = trace_catalog_ok and trace_summary.find("unnamed_mail") != -1 and trace_summary.find("door_voice_residue") != -1 and trace_summary.find("missing_person_register") != -1 and trace_summary.find("outpost_remote_echo") != -1

	var trace_checks := {
		"r01_story_l01_mailbox": {"node": R01CampaignMap.NODE_L01, "expect": "우편물", "memory": "우편물"},
		"r01_story_l02_closed_door": {"node": R01CampaignMap.NODE_L02, "expect": "문틈", "memory": "문틈"},
		"r01_story_l03_model_entry": {"node": R01CampaignMap.NODE_L03, "expect": "실종", "memory": "실종자"},
		"r01_story_l04_drain_trace": {"node": R01CampaignMap.NODE_L04, "expect": "구조 요청", "memory": "구조 요청"},
		"r01_story_l05_fake_return_sign": {"node": R01CampaignMap.NODE_L05, "expect": "보급소 호출", "memory": "가짜 회수선"},
	}
	var trace_interaction_ok := true
	for object_id in trace_checks.keys():
		var expected: Dictionary = trace_checks[object_id]
		_move_to_story_object(main, String(object_id))
		trace_interaction_ok = trace_interaction_ok and main._try_field_interaction()
		trace_interaction_ok = trace_interaction_ok and String(main._active_notice_text()).find(String(expected["expect"])) != -1
		var memory: Dictionary = main._r01_campaign_node_memory(String(expected["node"]))
		trace_interaction_ok = trace_interaction_ok and int(memory.get("node_npc_trace_count", 0)) > 0
		trace_interaction_ok = trace_interaction_ok and String(memory.get("node_last_npc_trace_phrase", "")).find(String(expected["memory"])) != -1

	var remote_count_before: int = main.field_remote_comment_seen.size()
	_move_to_story_object(main, "r01_story_l05_fake_return_sign")
	var repeat_ok: bool = main._try_field_interaction()
	repeat_ok = repeat_ok and main.field_remote_comment_seen.size() == remote_count_before
	var repeat_notice := String(main._active_notice_text())
	repeat_ok = repeat_ok and (repeat_notice.find("이미") != -1 or repeat_notice.find("인증 아님") != -1)

	main._finish_match("recalled")
	main._handle_terminal_action()
	var supply_text: String = main.hud.supply_visible_text()
	var supply_bridge_ok := supply_text.find("세븐") != -1 or supply_text.find("팝시") != -1 or supply_text.find("복희") != -1
	supply_bridge_ok = supply_bridge_ok and supply_text.find("field_trace_id") == -1 and supply_text.find("r01_story") == -1
	main._open_r01_campaign_map()
	main._select_r01_campaign_node(R01CampaignMap.NODE_L05)
	var map_text: String = main.hud.campaign_map_visible_text()
	var map_trace_ok := map_text.find("흔적:") != -1 and map_text.find("field_trace_id") == -1 and map_text.find("r01_story") == -1
	main.debug_tools.detail_visible = true
	var debug_text: String = main._debug_overlay_text()
	var debug_ok := debug_text.find("outpost npc active") != -1 and debug_text.find("outpost npc assignments") != -1 and debug_text.find("r01 npc traces catalog") != -1 and debug_text.find("r01 npc trace seen") != -1

	_record("outpost NPC five markers and assigned facilities exist", marker_ok and facility_ok, JSON.stringify(marker_facilities))
	_record("outpost NPC reactions stay sparse", sparse_reaction_ok, str(active_reactions))
	_record("first recall records Mina and Bokhee presence", first_recall_ok, first_recall_lines)
	_record("R01 field has seven-plus NPC trace types", trace_catalog_ok, trace_summary)
	_record("R01 NPC traces interact through E and node memory", trace_interaction_ok)
	_record("field remote comments are one-time per tag", repeat_ok)
	_record("NPC trace bridges back to outpost without ids", supply_bridge_ok, supply_text)
	_record("campaign map carries NPC trace memory without ids", map_trace_ok, map_text)
	_record("F12 exposes NPC/trace debug state", debug_ok, debug_text)
	await _finish_main(main)

func _probe_manual_combat_input() -> void:
	var main = await _new_main()
	_start_r01_story_probe(main, R01CampaignMap.NODE_L02)
	_set_player_pos(main, main.r01_blockout.anchor_position("subdivision_loop_center"))
	var enemy_rng := RandomNumberGenerator.new()
	enemy_rng.seed = 20260602
	main.enemies.spawn_enemy(main.elapsed, _player_pos(main), enemy_rng, {"elite_chance": 0.0, "role_weights": {"basic": 1.0}})
	main.enemies.enemies[0]["pos"] = _player_pos(main) + Vector2(44, 0)
	main.enemies.enemies[0]["hp"] = 45.0
	main.enemies.enemies[0]["max_hp"] = 45.0
	var manual_hit_ok: bool = main._try_manual_stamp_with_aim(Vector2.RIGHT)
	var metrics: Dictionary = main._playtest_metrics_snapshot()
	var enemy_stamp_ok := manual_hit_ok and int(metrics.get("manual_stamp_uses", 0)) == 1 and int(metrics.get("manual_stamp_hits", 0)) == 1 and float(main.enemies.enemies[0].get("return_stamp_timer", 0.0)) > 0.0
	var auto_damage_before := float(main.enemies.enemies[0].get("hp", 0.0))
	main.player.auto_timer = 0.0
	main._update_auto_fire(1.0)
	var auto_priority_ok := float(main.enemies.enemies[0].get("hp", 0.0)) < auto_damage_before

	main.manual_stamp_timer = 0.0
	main.enemies.clear()
	var source_object := _move_to_story_object(main, "r01_story_l02_front_sensor")
	var source_ok: bool = main._try_manual_stamp_with_aim(Vector2.RIGHT)
	var source_metrics: Dictionary = main._playtest_metrics_snapshot()
	var source_memory: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L02)
	var source_reaction_ok := source_ok and int(source_metrics.get("manual_stamp_source_hits", 0)) == 1 and String(source_memory.get("node_last_manual_stamp_phrase", "")).find("현관 센서") != -1 and String(main._active_notice_text()).find("현관 센서") != -1
	main.manual_stamp_timer = 0.0
	var repeat_memory_count := int(source_memory.get("node_manual_stamp_count", 0))
	var repeat_ok: bool = main._try_manual_stamp_with_aim(Vector2.RIGHT)
	var repeat_memory: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L02)
	repeat_ok = repeat_ok and String(main._active_notice_text()).find("이미") != -1 and int(repeat_memory.get("node_manual_stamp_count", 0)) == repeat_memory_count

	var input_map_ok := InputMap.has_action("manual_stamp") and InputMap.has_action("charge")
	var left_mouse := InputEventMouseButton.new()
	left_mouse.button_index = MOUSE_BUTTON_LEFT
	var right_mouse := InputEventMouseButton.new()
	right_mouse.button_index = MOUSE_BUTTON_RIGHT
	input_map_ok = input_map_ok and InputMap.action_has_event("manual_stamp", left_mouse)
	input_map_ok = input_map_ok and InputMap.action_has_event("charge", right_mouse)
	input_map_ok = input_map_ok and not InputMap.action_has_event("charge", left_mouse)
	var hud_text_ok := String(main.hud.manual_stamp_label.text).find("현장 도장") != -1 or String(main._sortie_start_notice()).find("현장 도장") != -1
	main.debug_tools.detail_visible = true
	var debug_text: String = main._debug_overlay_text()
	var debug_ok := debug_text.find("r01 manual stamp count") != -1 and debug_text.find("r01_story_l02_front_sensor") != -1
	var ui_clean_ok := String(main._active_notice_text()).find("r01_story") == -1 and String(source_object.get("id", "")).find("r01_story") != -1

	_record("manual stamp hits enemy and marks auto priority", enemy_stamp_ok)
	_record("auto assist damages marked target", auto_priority_ok)
	_record("manual stamp source reaction updates memory", source_reaction_ok)
	_record("manual stamp repeat does not farm node memory", repeat_ok)
	_record("manual/charge input map separated", input_map_ok)
	_record("manual stamp HUD/tutorial text exists", hud_text_ok)
	_record("manual stamp general UI hides ids", ui_clean_ok)
	_record("F12 exposes manual stamp ids/counts", debug_ok, debug_text)
	await _finish_main(main)

func _probe_r01_source_state_handling() -> void:
	var main = await _new_main()
	_start_r01_story_probe(main, R01CampaignMap.NODE_L02)
	var mailbox := _move_to_story_object(main, "r01_story_l02_mailbox")
	var before_params: Dictionary = main._wave_params_for_elapsed(90.0)
	var reveal_ok: bool = main._try_field_interaction()
	var reveal_state: Dictionary = main.r01_source_states.get("r01_story_l02_mailbox", {})
	reveal_ok = reveal_ok and R01SourceState.current_state(reveal_state) == R01SourceState.STATE_REVEALED and String(main._active_notice_text()).find("r01_story") == -1

	main.manual_stamp_timer = 0.0
	var suppress_ok: bool = main._try_manual_stamp_with_aim(Vector2.RIGHT)
	var suppress_state: Dictionary = main.r01_source_states.get("r01_story_l02_mailbox", {})
	var after_params: Dictionary = main._wave_params_for_elapsed(90.0)
	suppress_ok = suppress_ok and R01SourceState.current_state(suppress_state) == R01SourceState.STATE_SUPPRESSED
	suppress_ok = suppress_ok and float(after_params.get("source_spawn_chance", 1.0)) < float(before_params.get("source_spawn_chance", 1.0))
	suppress_ok = suppress_ok and String(after_params.get("source_affected_summary", "")).find("suppressed=1") != -1
	suppress_ok = suppress_ok and main._source_hazard_interval_mult("flyer_drop") > 1.0

	var memory_before: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L02)
	var count_before := int(memory_before.get("node_manual_stamp_count", 0))
	main.manual_stamp_timer = 0.0
	var repeat_ok: bool = main._try_manual_stamp_with_aim(Vector2.RIGHT)
	var memory_after: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L02)
	repeat_ok = repeat_ok and String(main._active_notice_text()).find("이미") != -1 and int(memory_after.get("node_manual_stamp_count", 0)) == count_before

	_move_to_story_object(main, "r01_story_l03_model_entry")
	main.player.charge_window_left = main._charge_window()
	main.player.charge_timer = main._charge_period()
	main._fire_charge()
	var overload_state: Dictionary = main.r01_source_states.get("r01_story_l03_model_entry", {})
	var overload_memory: Dictionary = main._r01_campaign_node_memory(R01CampaignMap.NODE_L03)
	var overload_ok := R01SourceState.current_state(overload_state) == R01SourceState.STATE_OVERLOADED and int(overload_memory.get("node_source_action_count", 0)) > 0 and String(main._active_notice_text()).find("overloaded") == -1

	var expected_source_types := {
		"r01_story_l02_mailbox": "mailbox",
		"r01_story_l02_front_sensor": "doorbell",
		"r01_story_l03_speaker_pillar": "speaker",
		"r01_story_l04_drain_trace": "drain",
		"r01_story_l05_fake_return_sign": "fake_return",
		"r01_story_l03_model_entry": "model_house",
	}
	var source_types_ok := true
	var source_type_summary := {}
	for object_id in expected_source_types.keys():
		var object: Dictionary = main.r01_blockout.story_object_by_id(String(object_id))
		var key: String = main._source_effect_key(object)
		source_type_summary[object_id] = key
		source_types_ok = source_types_ok and key == String(expected_source_types[object_id])

	main.debug_tools.detail_visible = true
	var debug_text: String = main._debug_overlay_text()
	var debug_ok := debug_text.find("r01 source states count") != -1 and debug_text.find("r01 source action") != -1 and debug_text.find("r01 source spawn/hazard affected") != -1
	var ui_clean_ok := String(main._active_notice_text()).find("r01_story") == -1 and String(main._active_notice_text()).find("suppressed") == -1

	_record("R01 source E reveal creates revealed session state", reveal_ok, JSON.stringify(reveal_state))
	_record("R01 source J suppress affects spawn/hazard bias", suppress_ok, "before_chance=%.2f after_chance=%.2f summary=%s" % [float(before_params.get("source_spawn_chance", 0.0)), float(after_params.get("source_spawn_chance", 0.0)), String(after_params.get("source_affected_summary", ""))])
	_record("R01 repeated source processing does not farm memory", repeat_ok)
	_record("R01 SPACE charge overloads source safely", overload_ok, JSON.stringify(overload_state))
	_record("R01 six source kinds have distinct handling", source_types_ok, JSON.stringify(source_type_summary))
	_record("R01 source general UI hides internal ids/states", ui_clean_ok, main._active_notice_text())
	_record("F12 exposes source state and affected spawn/hazard summary", debug_ok, debug_text)
	await _finish_main(main)

func _start_r01_story_probe(main, node_id: String) -> void:
	main.first_sortie = false
	main.first_recall_done = true
	main.meta_progression.grant_first_recall_trace()
	main._show_supply_depot()
	main._debug_r01_campaign_unlock_all()
	main._select_r01_campaign_node(node_id)
	main._sortie_selected_r01_campaign_node()

func _move_to_story_object(main, object_id: String) -> Dictionary:
	var object: Dictionary = main.r01_blockout.story_object_by_id(object_id)
	if object.is_empty():
		return {}
	main.current_r01_node_id = _story_object_node_id(object)
	main.selected_r01_node_id = main.current_r01_node_id
	_set_player_pos(main, Vector2(object.get("pos", _player_pos(main))))
	return object

func _story_object_node_id(object: Dictionary) -> String:
	match String(object.get("zone_id", "")):
		"silence_edge_start", "outer_recovery_lane_anchor":
			return R01CampaignMap.NODE_L01
		"subdivision_loop_center":
			return R01CampaignMap.NODE_L02
		"open_house_street_anchor", "model_house_node_anchor":
			return R01CampaignMap.NODE_L03
		"drain_pocket_anchor":
			return R01CampaignMap.NODE_L04
		"fake_return_route_anchor":
			return R01CampaignMap.NODE_L05
		_:
			return R01CampaignMap.NODE_L01

func _key_event(keycode: int) -> InputEventKey:
	var event := InputEventKey.new()
	event.keycode = keycode
	event.physical_keycode = keycode
	event.pressed = true
	return event

func _probe_r01_campaign_result_bridge_variants() -> void:
	var checks := {
		"R01-L03": {"entry": "모델하우스 축", "result": "모델하우스", "supply": "이름 보관함", "state": "victory"},
		"R01-L04": {"entry": "배수로 침묵", "result": "배수로", "supply": "젖은 전단", "state": "game_over"},
		"R01-L05": {"entry": "끊긴 광고 산책로", "result": "가짜 회수선", "supply": "출처", "state": "game_over"},
	}
	for node_id in checks.keys():
		var expected: Dictionary = checks[node_id]
		var main = await _new_main()
		main.meta_progression.grant_first_recall_trace()
		main.first_recall_done = true
		main.first_sortie = false
		main._show_supply_depot()
		main._debug_r01_campaign_unlock_all()
		main._select_r01_campaign_node(String(node_id))
		main._sortie_selected_r01_campaign_node()
		var entry_ok: bool = main._active_notice_text().find(String(expected["entry"])) != -1
		main._finish_match(String(expected["state"]))
		var result_text: String = _result_text(main)
		var result_ok: bool = result_text.find(String(expected["result"])) != -1 and result_text.find("작전권:") != -1
		main._handle_terminal_action()
		var supply_text: String = main.hud.supply_visible_text()
		var supply_ok: bool = supply_text.find(String(expected["supply"])) != -1
		main._open_r01_campaign_map()
		var map_text: String = main.hud.campaign_map_visible_text()
		var map_ok: bool = map_text.find("흔적:") != -1 and map_text.find("R01-L") == -1
		main.debug_tools.detail_visible = true
		var debug_ok: bool = main._debug_overlay_text().find("campaign node memory") != -1 and main._debug_overlay_text().find(String(node_id)) != -1
		_record("%s entry/result/outpost/map bridge" % String(node_id), entry_ok and result_ok and supply_ok and map_ok and debug_ok, "entry=%s result=%s supply=%s map=%s debug=%s text=%s supply_text=%s map_text=%s" % [str(entry_ok), str(result_ok), str(supply_ok), str(map_ok), str(debug_ok), result_text, supply_text, map_text])
		await _finish_main(main)

func _probe_outpost_place_surfaces() -> void:
	var main = await _new_main()
	main.meta_progression.grant_first_recall_trace()
	main.meta_progression.grant_signal_clue_candidates(["faint_signal", "detected_signal", "near_signal"])
	main._show_supply_depot()
	var visible_text: String = main.hud.supply_visible_text()
	var facilities_visible := visible_text.find("침묵 보급소") != -1 and visible_text.find("시설:") != -1 and visible_text.find("회수") != -1 and visible_text.find("정산") != -1 and visible_text.find("정비") != -1 and visible_text.find("게시") != -1 and visible_text.find("게이트") != -1
	var buttons_are_places := visible_text.find("출격 게시판") != -1 and visible_text.find("출격 게이트") != -1
	var general_ui_clean := visible_text.find("recovery_platform") == -1 and visible_text.find("hard_blocker") == -1 and visible_text.find("anchor=(") == -1 and visible_text.find("collision") == -1
	main.debug_tools.detail_visible = true
	var debug_text: String = main._debug_overlay_text()
	var debug_outpost_ok := debug_text.find("outpost facility states") != -1 and debug_text.find("outpost tags") != -1 and debug_text.find("result=") != -1 and debug_text.find("surface=") != -1 and debug_text.find("outpost ui bounds") != -1 and debug_text.find("recovery_platform") != -1
	var facility_count_ok: bool = main.outpost_blockout.facility_count() == 9
	var state: Dictionary = main.outpost_blockout.state_from_progress(main._session_progress_data(), main.meta_progression)
	var state_ok: bool = String(state.get("variant", "")) == "broadcast_record_3" and main.outpost_blockout.facility_variant("sortie_board", state).find("broadcast_cards_3") != -1
	var actions_before: int = main.current_supply_actions.size()
	main.meta_progression.traces["torn_ad_flyer"] = 2
	main.current_supply_actions = main._build_supply_actions()
	main.hud.show_supply_depot(main.meta_progression, Callable(main, "_apply_supply_choice"), Callable(main, "_restart"), "", main._session_progress_data(), main.current_supply_actions, Callable(main, "_open_r01_campaign_map"))
	main._apply_supply_choice(4)
	var purchase_ok: bool = _state(main) == "supply" and main.hud.supply_panel.visible and main.hud.supply_visible_text().find("조율 완료") != -1 and main.last_supply_action_surface != ""
	_record("outpost compact place facilities visible", facilities_visible)
	_record("outpost sortie actions are tied to places", buttons_are_places)
	_record("outpost general UI hides internal ids", general_ui_clean)
	_record("F12 debug exposes outpost facility/source details", debug_outpost_ok)
	_record("outpost has exactly nine facility anchors", facility_count_ok)
	_record("outpost state reacts to signal records", state_ok)
	_record("upgrade purchase keeps outpost UI refreshed", purchase_ok, "actions before=%d surface=%s" % [actions_before, main.last_supply_action_surface])
	await _finish_main(main)

func _probe_r01_campaign_node_entry_profiles(main) -> void:
	main._debug_r01_campaign_unlock_all()
	var starts := {}
	var spawn_bias := {}
	var source_summary := {}
	var objective_ok := true
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		main.selected_r01_node_id = node_id
		main.current_r01_node_id = node_id
		_set_player_pos(main, main._r01_campaign_start_position(node_id))
		var wave_params: Dictionary = main._wave_params_for_elapsed(90.0)
		starts[node_id] = _player_pos(main)
		spawn_bias[node_id] = String(wave_params.get("spawn_bias", ""))
		source_summary[node_id] = main.r01_blockout.source_summary_line(R01CampaignMap.node_zone_id(node_id))
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
	_probe_r01_source_profiles(main, source_summary)

func _probe_r01_source_profiles(main, source_summary: Dictionary) -> void:
	var summary_ok := true
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		var line := String(source_summary.get(node_id, ""))
		summary_ok = summary_ok and line.find("{") != -1 and line.find(":") != -1
	var distinct_source_profiles := true
	for a in source_summary.keys():
		for b in source_summary.keys():
			if String(a) >= String(b):
				continue
			distinct_source_profiles = distinct_source_profiles and String(source_summary[a]) != String(source_summary[b])
	var roles_ok := true
	var role_checks := {
		"coupon": R01CampaignMap.NODE_L02,
		"basic": R01CampaignMap.NODE_L01,
		"speaker": R01CampaignMap.NODE_L03,
		"signal": R01CampaignMap.NODE_L03,
		"charger": R01CampaignMap.NODE_L05,
		"elite": R01CampaignMap.NODE_L03,
	}
	for role in role_checks.keys():
		var zone_id := R01CampaignMap.node_zone_id(String(role_checks[role]))
		roles_ok = roles_ok and not main.r01_blockout.source_objects_for_spawn_role(String(role), zone_id).is_empty()
	var rng := RandomNumberGenerator.new()
	rng.seed = 20260526
	var source_spawn_ok := true
	var source_spawn_debug := {}
	for node_id in ["R01-L01", "R01-L02", "R01-L03", "R01-L04", "R01-L05"]:
		main.current_r01_node_id = node_id
		var params: Dictionary = main._wave_params_for_elapsed(90.0)
		params["source_spawn_chance"] = 1.0
		var role := "basic"
		if node_id == R01CampaignMap.NODE_L02:
			role = "coupon"
		elif node_id == R01CampaignMap.NODE_L03:
			role = "elite"
		elif node_id == R01CampaignMap.NODE_L04:
			role = "signal"
		elif node_id == R01CampaignMap.NODE_L05:
			role = "charger"
		var pos: Vector2 = main.r01_blockout.enemy_spawn_position(main._r01_campaign_start_position(node_id), rng, 9.0, role, 90.0, params)
		var debug: Dictionary = main.r01_blockout.last_source_spawn_debug()
		source_spawn_debug[node_id] = "%s/%s" % [String(debug.get("source_role", "")), String(debug.get("source_id", ""))]
		source_spawn_ok = source_spawn_ok and bool(debug.get("used", false)) and main.r01_blockout.is_spawn_position_valid(pos, 9.0, role)
	var hazard_ok := true
	var hazard_checks := {
		"flyer_drop": R01CampaignMap.NODE_L02,
		"pressure_ring": R01CampaignMap.NODE_L03,
		"low_signal": R01CampaignMap.NODE_L04,
		"fake_return": R01CampaignMap.NODE_L05,
	}
	for hazard_role in hazard_checks.keys():
		var node_id := String(hazard_checks[hazard_role])
		var result: Dictionary = main.r01_blockout.hazard_source_position(String(hazard_role), main._r01_campaign_start_position(node_id), rng, main._r01_campaign_start_position(node_id), R01CampaignMap.node_zone_id(node_id))
		hazard_ok = hazard_ok and bool(result.get("used", false))
	_record("L01-L05 source summaries exist", summary_ok, JSON.stringify(source_summary))
	_record("L01-L05 source profiles differ", distinct_source_profiles, JSON.stringify(source_summary))
	_record("spawn roles have matching source objects", roles_ok)
	_record("source-biased enemy spawns are valid", source_spawn_ok, JSON.stringify(source_spawn_debug))
	_record("hazard roles resolve to source objects", hazard_ok)
