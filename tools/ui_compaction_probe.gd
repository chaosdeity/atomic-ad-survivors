extends SceneTree

const MainScene := preload("res://scenes/main.tscn")

var failures: Array[String] = []

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	var main = await _new_main()
	await _probe_result_panel(main)
	await _probe_supply_panel(main)
	await _finish_main(main)

	if failures.is_empty():
		print("UI_COMPACTION_PROBE PASS")
		quit(0)
	else:
		for failure in failures:
			push_error(failure)
		print("UI_COMPACTION_PROBE FAIL %d" % failures.size())
		quit(1)

func _new_main():
	var main := MainScene.instantiate()
	root.add_child(main)
	await process_frame
	await process_frame
	return main

func _finish_main(main: Node) -> void:
	if main.has_method("_cleanup_audio_players"):
		main._cleanup_audio_players()
	root.remove_child(main)
	main.free()
	await process_frame
	await process_frame

func _record(label: String, ok: bool, detail: String = "") -> void:
	var status := "pass" if ok else "fail"
	print("%s: %s%s" % [label, status, "" if detail == "" else " - %s" % detail])
	if not ok:
		failures.append("%s failed%s" % [label, "" if detail == "" else " - %s" % detail])

func _probe_result_panel(main) -> void:
	var progress_lines := [
		"플레이테스트 계측: 핵심 7/7 | 차징 100%(12/12) | 카드 36s | 후보 95s | 위험 26s | 감사 4회 통과",
		"확정 태그: 식량태그 1장, 충전태그 1장, 수신태그 1장",
		"태그 후보: 식량태그 후보 3장, 충전태그 후보 2장, 수신태그 후보 2장",
		"후보 정산: 수신태그 후보 2장 중 1장 승인, 식량태그 후보 3장 중 2장 승인",
		"보급소 보관: 식량태그 3 / 충전태그 2 / 수신태그 2",
		"지역 오염 기록: 오픈하우스 체류와 약관 카드 사용으로 광고 농도 상승",
		"다음 출격 변화: 오픈하우스와 모델하우스 신호 감사가 더 민감해집니다",
		"신호 단서 판정: 뒤틀린 방송 지도 승인",
		"신호 추적 진행도: 모델하우스 결절 노출도 2/3",
		"정산 사유: 오픈하우스 거리에서 오래 버티고 차징 성공을 연속 달성",
		"카드 기여: 반품 라벨, 전단 폭죽, 오픈하우스 방문 확인",
		"광고 감사 결과: 정상 고객 예비 감사와 가족 적합성 감사 통과",
	]
	await _show_and_record_result_panel(main, {
		"result": "신호 과부하 긴급 인양",
		"survival_time": 287,
		"level": 12,
		"kills": 582,
		"card_count": 9,
		"peak_enemy_count": 88,
		"final_enemy_count": 74,
		"description": "광고 시스템이 윤서의 이름을 끝까지 읽기 전에 침묵 보급소가 회수선을 당겼습니다.",
		"trace": "이름 없는 영수증과 뒤틀린 방송 지도",
		"progress_lines": progress_lines,
		"prompt": "스페이스 / 클릭으로 보급소 이동",
		"button_text": "보급소로 돌아가기",
	}, "result panel")

	var r03_progress_lines := [
		"플레이테스트 계측: R03 라벨 9회 | 레일 우회 4회 | 보관함 남김 2회 | 드론 오유도 5회",
		"확정 태그: 보급태그 1장",
		"태그 후보: 보급태그 후보 2장, 통행태그 후보 1장, 진료태그 후보 1장",
		"후보 정산: 통행태그 후보 1장 보류, 보급태그 후보 2장 중 1장 승인",
		"정산 사유: 미수령 보관함 회수",
		"정산 사유: 분류 경로 우회",
		"정산 사유: 처방 봉투 오배송 기록 보관",
		"다음 출격 변화: 같은 반송 드론 유도 방식이 재검사됩니다",
		"RETURN-05 씨앗: 수취인 확인 실패 로그 보관 중",
		"R02 씨앗: 진료태그 접근 보류 기록 발견",
	]
	await _show_and_record_result_panel(main, {
		"result": "목적지 판정 보류 귀환",
		"survival_time": 263,
		"level": 11,
		"kills": 507,
		"card_count": 8,
		"peak_enemy_count": 82,
		"final_enemy_count": 65,
		"description": "반송 드론이 윤서의 표식을 끝까지 읽기 전에 보류 스탬프가 판정을 늦췄습니다.",
		"trace": "목적지 누락 로그와 수취인 확인 실패 기록",
		"progress_lines": r03_progress_lines,
		"prompt": "스페이스 / 클릭으로 보급소 이동",
		"button_text": "보급소로 돌아가기",
	}, "r03 result panel")

func _show_and_record_result_panel(main, result_data: Dictionary, label_prefix: String) -> void:
	main.hud.show_result_screen(result_data, Callable())
	await process_frame

	var text := String(main.hud.result_label.text)
	_record("%s visible" % label_prefix, main.hud.result_panel.visible)
	_record("%s compact line count" % label_prefix, _line_count(text) <= 12, "%d lines\n%s" % [_line_count(text), text])
	_record("%s compact text length" % label_prefix, text.length() <= 520, "%d chars" % text.length())

func _probe_supply_panel(main) -> void:
	main.meta_progression.grant_first_recall_trace()
	main.meta_progression.grant_signal_clue_candidates(["faint_signal", "detected_signal"])
	main.meta_progression.grant_ration_ticket_settlement({
		"confirmed": {"food": 2, "power": 1, "signal": 1},
		"approved": {"food": 1, "power": 1, "signal": 1},
		"contaminated": {"signal": 1},
	})

	var long_change := "인간 구역 지원으로 최대 HP 증가 / 정비대 전원 복구로 차징 단축 / 수신태그 고정으로 오픈하우스 기준 완화"
	var session_progress := {
		"next_run_change_summary": long_change,
		"route_stage_label": "출격 기록 12회, 오픈하우스 거리와 모델하우스 접근로가 동시에 흔들리는 상태",
		"boss_signal_label": "근접",
		"signal_board_guidance": "게시판: 오픈하우스 신호 위치와 모델하우스 결절 방향을 동시에 표시합니다",
		"regional_clause_preview": "오픈하우스 방문 확인 약관이 길게 늘어나며 고객님의 가족 구성을 현장에서 보정합니다",
		"regional_clause_short": "오픈하우스 방문 약관 강화와 가족 적합성 검수",
		"allocation_summary": "식량태그는 인간 구역, 충전태그는 정비대, 수신태그는 출격 게시판에 임시 배분됨",
		"allocation_reaction_summary": "보급소 정비대가 수신태그를 보고 차징 조율표를 다시 붙였습니다",
		"next_objective_short": "오픈하우스 거리에서 수신태그 후보를 고정하고 모델하우스 접근로를 확인",
		"outpost_event_log": [
			"세븐: 수신태그는 승인됐지만 광고 시스템은 아직 이 실수를 모릅니다.",
			"미나: 오늘 밥은 있습니다. 내일이 있다는 뜻은 아니지만요.",
		],
		"r01_outpost_phrase": "보급소 기록 대기",
		"boss_route_ready": true,
	}
	var actions: Array[Dictionary] = []
	for i in range(8):
		actions.append({
			"kind": "allocation" if i < 3 else "upgrade",
			"name": "아주 긴 보급소 배분 항목 %d" % (i + 1),
			"state": "배분 가능" if i < 3 else "흔적 부족",
			"level": i,
			"max_level": 9,
			"effect_text": "다음 출격에서 차징, 정산, 오픈하우스 기준을 동시에 조금씩 바꿉니다.",
			"cost_text": "식량태그 1 / 충전태그 1 / 수신태그 1 / 보유량 확인",
			"input_hint": "키%d/클릭" % (i + 1),
			"can_use": i < 3,
			"locked": false,
			"applied": false,
			"prefix": "배분" if i < 3 else "정비",
			"extra": "해금 조건과 NPC 반응 문구가 길어져도 버튼 한 줄 안에서 잘립니다.",
		})

	main.hud.show_supply_depot(main.meta_progression, Callable(), Callable(), "수신태그 긴급 배분", session_progress, actions)
	await process_frame

	var supply_text := String(main.hud.supply_label.text)
	var event_text := String(main.hud.supply_event_log_label.text)
	var hint_text := String(main.hud.supply_scroll_hint_label.text)
	var visible_text: String = main.hud.supply_visible_text()
	_record("supply panel visible", main.hud.supply_panel.visible)
	_record("supply summary compact lines", _line_count(supply_text) <= 9, "%d lines\n%s" % [_line_count(supply_text), supply_text])
	_record("supply event log compact", event_text.length() <= 58 and _line_count(event_text) <= 1, "%d chars - %s" % [event_text.length(), event_text])
	_record("supply hint compact", hint_text.length() <= 65 and _line_count(hint_text) <= 1, "%d chars - %s" % [hint_text.length(), hint_text])
	_record("supply place anchors visible", visible_text.find("시설:") != -1 and visible_text.find("출격 게시판") != -1 and visible_text.find("출격 게이트") != -1)
	_record("supply general UI hides internal outpost ids", visible_text.find("recovery_platform") == -1 and visible_text.find("hard_blocker") == -1 and visible_text.find("anchor=(") == -1)

	var visible_buttons := 0
	var button_ok := true
	var max_button_length := 0
	for button in main.hud.supply_upgrade_buttons:
		if not button.visible:
			continue
		visible_buttons += 1
		var button_text := String(button.text)
		max_button_length = maxi(max_button_length, button_text.length())
		if button_text.contains("\n") or button_text.length() > 86 or button.custom_minimum_size.y > 20.0:
			button_ok = false
	_record("supply actions stay one-line compact", button_ok and visible_buttons == actions.size(), "%d buttons, max %d chars" % [visible_buttons, max_button_length])

	await _probe_r03_supply_panel(main)

func _probe_r03_supply_panel(main) -> void:
	var r03_session_progress := {
		"next_run_change_summary": "반송 드론 재검사 / 미수령 보관함 잔향 / R02 진료태그 보류 신호",
		"route_stage_label": "R03-L02 자동 분류장 경로 심사 후 R03-L03 보증 창고 입구는 신호만 감지",
		"boss_signal_label": "보스권 잠김",
		"signal_board_guidance": "게시판: 미확인 반송 기록과 처방 봉투 오배송 기록을 분리 보관합니다",
		"regional_clause_preview": "수취인 확인 실패 로그와 반송 드론 재검사 약관이 목적지 기록을 다시 조회합니다",
		"regional_clause_short": "수취/반송 판정 보류와 보관 기한 재검사",
		"allocation_summary": "보급태그는 물자 칸, 통행태그는 레일 우회 기록, 진료태그 기록은 보류함",
		"allocation_reaction_summary": "미나가 물자와 목적지 기록을 따로 묶었습니다",
		"next_objective_short": "R03-L02에서 드론 재검사 회피",
		"outpost_event_log": [
			"윤서: 이름이랑 주소는 따로 둬.",
			"세븐: 반송 드론이 실수를 학습했습니다.",
			"미나: 물자는 들어왔고 기록은 따로 줄 섰어.",
		],
		"r01_outpost_phrase": "R03 기록 분리 대기",
		"boss_route_ready": false,
	}
	var r03_actions: Array[Dictionary] = [
		{
			"kind": "allocation",
			"name": "보급태그 임시 배분",
			"state": "배분 가능",
			"level": 1,
			"max_level": 3,
			"effect_text": "물자 칸을 안정화하고 목적지 기록을 분리합니다.",
			"cost_text": "보급태그 1",
			"input_hint": "키1/클릭",
			"can_use": true,
			"locked": false,
			"applied": false,
			"prefix": "배분",
			"extra": "보관함 회수 후폭풍 완화",
		},
		{
			"kind": "allocation",
			"name": "통행태그 후보 보류",
			"state": "배분 가능",
			"level": 0,
			"max_level": 3,
			"effect_text": "분류 레일 우회 기록을 다음 출격까지 보존합니다.",
			"cost_text": "통행태그 후보 1",
			"input_hint": "키2/클릭",
			"can_use": true,
			"locked": false,
			"applied": false,
			"prefix": "보류",
			"extra": "레일 경로 재검사 주의",
		},
		{
			"kind": "allocation",
			"name": "수신태그 기록 분리",
			"state": "배분 가능",
			"level": 0,
			"max_level": 3,
			"effect_text": "RETURN-05 신호를 캐릭터 해금처럼 보이지 않게 보관합니다.",
			"cost_text": "수신태그 1",
			"input_hint": "키3/클릭",
			"can_use": true,
			"locked": false,
			"applied": false,
			"prefix": "분리",
			"extra": "U2 이후 과노출 차단",
		},
		{
			"kind": "allocation",
			"name": "진료태그 기록 보관",
			"state": "흔적 보관",
			"level": 0,
			"max_level": 3,
			"effect_text": "R02 처방 봉투 오배송 기록을 보급소 게시판에만 남깁니다.",
			"cost_text": "진료태그 기록",
			"input_hint": "키4/클릭",
			"can_use": false,
			"locked": false,
			"applied": false,
			"prefix": "보관",
			"extra": "R02 직접 오픈 아님",
		},
		{
			"kind": "upgrade",
			"name": "보관함 잔향 라벨링",
			"state": "흔적 부족",
			"level": 0,
			"max_level": 2,
			"effect_text": "다음 런에서 같은 번호 보관함을 추적합니다.",
			"cost_text": "목적지 로그 1",
			"input_hint": "키5/클릭",
			"can_use": false,
			"locked": false,
			"applied": false,
			"prefix": "정리",
			"extra": "상자 보상 아님",
		},
	]

	main.hud.show_supply_depot(main.meta_progression, Callable(), Callable(), "R03 기록 분리", r03_session_progress, r03_actions)
	await process_frame

	var supply_text := String(main.hud.supply_label.text)
	var event_text := String(main.hud.supply_event_log_label.text)
	var hint_text := String(main.hud.supply_scroll_hint_label.text)
	var visible_text: String = main.hud.supply_visible_text()
	_record("r03 supply panel visible", main.hud.supply_panel.visible)
	_record("r03 supply summary compact lines", _line_count(supply_text) <= 9, "%d lines\n%s" % [_line_count(supply_text), supply_text])
	_record("r03 supply event log compact", event_text.length() <= 58 and _line_count(event_text) <= 1, "%d chars - %s" % [event_text.length(), event_text])
	_record("r03 supply hint compact", hint_text.length() <= 65 and _line_count(hint_text) <= 1, "%d chars - %s" % [hint_text.length(), hint_text])
	_record("r03 supply place anchors visible", visible_text.find("시설:") != -1 and visible_text.find("출격 게시판") != -1 and visible_text.find("출격 게이트") != -1)

	var visible_buttons := 0
	var button_ok := true
	var max_button_length := 0
	for button in main.hud.supply_upgrade_buttons:
		if not button.visible:
			continue
		visible_buttons += 1
		var button_text := String(button.text)
		max_button_length = maxi(max_button_length, button_text.length())
		if button_text.contains("\n") or button_text.length() > 86 or button.custom_minimum_size.y > 20.0:
			button_ok = false
	_record("r03 supply actions stay one-line compact", button_ok and visible_buttons == r03_actions.size(), "%d buttons, max %d chars" % [visible_buttons, max_button_length])

func _line_count(text: String) -> int:
	if text == "":
		return 0
	return text.split("\n").size()
