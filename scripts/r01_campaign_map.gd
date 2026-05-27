extends Control

signal node_selected(node_id: String)
signal sortie_requested(node_id: String)
signal close_requested

const C := preload("res://scripts/game_config.gd")
const UIFont := preload("res://scripts/ui_font.gd")

const NODE_L01 := "R01-L01"
const NODE_L02 := "R01-L02"
const NODE_L03 := "R01-L03"
const NODE_L04 := "R01-L04"
const NODE_L05 := "R01-L05"

const STATE_LOCKED := "locked"
const STATE_AVAILABLE := "available"
const STATE_SELECTED := "selected"
const STATE_VISITED := "visited"
const STATE_CLEARED := "cleared"
const STATE_DANGER := "danger"
const STATE_BOSS_READY := "boss_ready"

const NODE_IDS := [NODE_L01, NODE_L02, NODE_L03, NODE_L04, NODE_L05]
const EDGES := [
	[NODE_L01, NODE_L02],
	[NODE_L02, NODE_L03],
	[NODE_L02, NODE_L04],
	[NODE_L02, NODE_L05],
]
const MAIN_ROUTE := [NODE_L01, NODE_L02, NODE_L03]

const NODE_DEFS := {
	NODE_L01: {
		"name": "침묵 가장자리",
		"description": "보급소의 회수선이 아직 닿는 외곽입니다.",
		"short_description": "회수선 외곽",
		"risk": "낮음",
		"enemy_hint": "낮은 광고 밀도 / 흩어진 쿠폰",
		"threat_hint": "흩어진 기본 광고체, 낮은 포위 압력",
		"modifier": "회수선 안정, 낮은 밀도",
		"modifier_short": "회수선 안정 / 낮은 밀도",
		"objective": "주택가 첫 광고 신호 확인",
		"recovery_line": "안정",
		"route_note": "보급소 회수선이 닿는 외곽입니다.",
		"zone_id": "silence_edge_start",
		"ui_pos": Vector2(58, 184),
		"start_offset": Vector2(32, -18),
		"entry_camera_offset": Vector2(84, -44),
		"spawn_bias": "wide_edge",
		"spawn_axis_label": "외곽 회수선 너머에서 느리게 접근",
		"operation_role": "외곽 진입 작전권",
		"tag_hint": "태그 없이 진입 가능 / 식량태그는 긴 체류 보험",
		"region_reaction": "침묵 가장자리의 회수선이 한 번 더 고정됩니다.",
		"blockout_variant": "first_visit",
		"blockout_phrase": "낮은 광고 밀도, 보급소 회수선의 가장자리",
		"combat_goal": "회수선이 닿는 외곽을 확보한다",
		"sortie_notice": "침묵 가장자리 진입: 회수선이 닿는 외곽을 확보합니다.",
	},
	NODE_L02: {
		"name": "분양 주택 루프",
		"description": "같은 집이 다른 입주 문구로 반복됩니다.",
		"short_description": "반복 주택 루프",
		"risk": "우편함/쿠폰 밀도 증가",
		"enemy_hint": "스피커, 빠른 쿠폰, 반복 현관",
		"threat_hint": "우편함/쿠폰 양쪽 발송, 빠른 전단 증가",
		"modifier": "우편함과 쿠폰이 양쪽에서 끼어듦",
		"modifier_short": "쿠폰/우편함 양쪽 발송",
		"objective": "오픈하우스 신호를 추적한다",
		"recovery_line": "흔들림",
		"route_note": "외곽을 지나 같은 집들이 입주 문구만 바꿔 반복됩니다.",
		"zone_id": "subdivision_loop_center",
		"ui_pos": Vector2(160, 138),
		"start_offset": Vector2(-210, 142),
		"entry_camera_offset": Vector2(120, -74),
		"spawn_bias": "mailbox_pincer",
		"spawn_axis_label": "우편함과 현관 양쪽에서 포위",
		"operation_role": "반복 주택가 안쪽 작전권",
		"tag_hint": "식량태그와 충전태그가 있으면 포위 진입이 안정됩니다.",
		"region_reaction": "우편함들이 같은 주소를 다시 인쇄합니다.",
		"blockout_variant": "broadcast_record_3",
		"blockout_phrase": "우편함, 입주 문구, 쿠폰 밀도가 올라가는 반복 주택가",
		"combat_goal": "반복되는 집 사이의 신호를 추적한다",
		"sortie_notice": "분양 주택 루프 진입: 반복되는 집 사이의 신호를 추적합니다.",
	},
	NODE_L03: {
		"name": "모델하우스 결절",
		"description": "가족 심사 절차가 이곳에서 시작됩니다.",
		"short_description": "심사 절차 접근",
		"risk": "심사 신호 / 가족 심사 절차",
		"enemy_hint": "신호체, 스피커, 모델하우스 축",
		"threat_hint": "신호체와 확성기 압박, 심사 절차 강화",
		"modifier": "심사 절차, 결절 신호 증가",
		"modifier_short": "심사 신호 증가",
		"objective": "가족 심사 절차의 입구를 찾는다",
		"recovery_line": "불안정",
		"route_note": "중심 루트 끝, 모델하우스 심사 절차가 열리는 결절입니다.",
		"zone_id": "model_house_node_anchor",
		"ui_pos": Vector2(276, 78),
		"start_offset": Vector2(-300, 170),
		"entry_camera_offset": Vector2(150, -112),
		"spawn_bias": "signal_converge",
		"spawn_axis_label": "모델하우스 축에서 심사 신호 수렴",
		"operation_role": "결절 접근 작전권",
		"tag_hint": "수신태그와 송출 기록이 심사 접근 판단에 중요합니다.",
		"region_reaction": "상담 부스가 윤서의 이름을 고객 명단에 올리려 합니다.",
		"blockout_variant": "destroy_node",
		"blockout_phrase": "모델하우스 방향의 결절 신호와 보스 심사 절차",
		"combat_goal": "가족 심사 절차의 입구를 찾는다",
		"sortie_notice": "모델하우스 결절 접근: 가족 심사 절차의 입구를 찾습니다.",
	},
	NODE_L04: {
		"name": "배수로 침묵 주머니",
		"description": "광고음이 잠깐 끊기는 낮은 통로입니다.",
		"short_description": "낮은 침묵 통로",
		"risk": "낮지만 흔적이 진함",
		"enemy_hint": "신호 흔적, 무거운 검수 로봇",
		"threat_hint": "광고음 감소, 무거운 흔적과 침묵 신호",
		"modifier": "광고음 감소, 흔적/침묵 강조",
		"modifier_short": "광고음 감소 / 흔적 강조",
		"objective": "광고음이 끊기는 낮은 통로를 조사한다",
		"recovery_line": "희미함",
		"route_note": "중심 루트에서 빠지는 곁길, 소음이 잠깐 낮아집니다.",
		"zone_id": "drain_pocket_anchor",
		"ui_pos": Vector2(244, 194),
		"start_offset": Vector2(-160, 48),
		"entry_camera_offset": Vector2(86, 18),
		"spawn_bias": "quiet_pocket",
		"spawn_axis_label": "낮은 배수로 흔적에서 느린 압박",
		"operation_role": "우회/저신호 작전권",
		"tag_hint": "식량태그가 부족하면 오래 버티기 어려운 우회로입니다.",
		"region_reaction": "배수구 아래에서 회수되지 않은 표식이 남았습니다.",
		"blockout_variant": "extract_memory",
		"blockout_phrase": "위험은 낮지만 흔적이 진하게 남는 배수로 곁길",
		"combat_goal": "광고음이 끊기는 낮은 통로를 조사한다",
		"sortie_notice": "배수로 침묵 주머니 진입: 광고음이 끊기는 낮은 통로를 조사합니다.",
	},
	NODE_L05: {
		"name": "가짜 귀환로",
		"description": "돌아가는 길처럼 보이지만, 회수선이 닿지 않습니다.",
		"short_description": "회수선 흉내",
		"risk": "혼동 / 귀환 신호 흉내",
		"enemy_hint": "빠른 쿠폰, 스피커, 잘못된 화살표",
		"threat_hint": "혼동 신호와 빠른 쿠폰, 회수선 흉내",
		"modifier": "회수선 불안정, 혼동 신호",
		"modifier_short": "혼동 신호 / 회수선 불안정",
		"objective": "접근하지 말고 신호 패턴만 확인",
		"recovery_line": "불안정",
		"route_note": "보급소 방향처럼 보이는 가지지만 실제 회수선이 아닙니다.",
		"zone_id": "fake_return_route_anchor",
		"ui_pos": Vector2(86, 82),
		"start_offset": Vector2(-110, 118),
		"entry_camera_offset": Vector2(108, -62),
		"spawn_bias": "false_return_pincer",
		"spawn_axis_label": "귀환처럼 보이는 화살표 뒤쪽에서 급습",
		"operation_role": "위험 귀환/재방문 작전권",
		"tag_hint": "수신태그가 부족하면 보급소가 회수선 출처를 의심합니다.",
		"region_reaction": "보급소가 해당 회수선의 출처를 인정하지 않습니다.",
		"blockout_variant": "broadcast_record_3",
		"blockout_phrase": "귀환 UI를 흉내 내는 산책로, 혼동과 광고 스피커 위험",
		"combat_goal": "귀환처럼 보이는 신호를 따라가지 않는다",
		"sortie_notice": "가짜 귀환로 진입: 귀환처럼 보이는 신호를 따라가지 않습니다.",
	},
}

const STATUS_LABELS := {
	STATE_LOCKED: "잠김",
	STATE_AVAILABLE: "열림",
	STATE_SELECTED: "선택",
	STATE_VISITED: "확인",
	STATE_CLEARED: "완료",
	STATE_DANGER: "위험",
	STATE_BOSS_READY: "심사 접근",
}

var _built := false
var _raw_states := {}
var _display_states := {}
var _selected_node_id := NODE_L01
var _current_node_id := NODE_L01
var _last_completed_node_id := ""
var _opened_node_ids: Array[String] = []
var _change_banner := ""
var _recommendation_line := ""
var _recommendation_reason := ""
var _tag_context := {}
var _node_memory := {}
var _node_buttons := {}
var _title_label: Label
var _hint_label: Label
var _change_label: Label
var _brief_title_label: Label
var _status_label: Label
var _objective_label: Label
var _legend_label: Label
var _description_label: Label
var _sortie_button: Button
var _close_button: Button

static func initial_states() -> Dictionary:
	return {
		NODE_L01: STATE_AVAILABLE,
		NODE_L02: STATE_LOCKED,
		NODE_L03: STATE_LOCKED,
		NODE_L04: STATE_LOCKED,
		NODE_L05: STATE_LOCKED,
	}

static func node_ids() -> Array:
	return NODE_IDS.duplicate()

static func node_def(node_id: String) -> Dictionary:
	var definition: Dictionary = NODE_DEFS.get(node_id, NODE_DEFS[NODE_L01])
	return definition.duplicate(true)

static func node_name(node_id: String) -> String:
	return String(node_def(node_id).get("name", "작전 노드"))

static func node_zone_id(node_id: String) -> String:
	return String(node_def(node_id).get("zone_id", "silence_edge_start"))

static func node_start_offset(node_id: String) -> Vector2:
	return Vector2(node_def(node_id).get("start_offset", Vector2.ZERO))

static func node_entry_camera_offset(node_id: String) -> Vector2:
	return Vector2(node_def(node_id).get("entry_camera_offset", Vector2.ZERO))

static func node_combat_goal(node_id: String) -> String:
	return String(node_def(node_id).get("combat_goal", "작전 지점을 확인하세요"))

static func node_operation_role(node_id: String) -> String:
	return String(node_def(node_id).get("operation_role", "작전권"))

static func node_tag_hint(node_id: String, tag_context: Dictionary = {}) -> String:
	var base := String(node_def(node_id).get("tag_hint", "태그 힌트 없음"))
	var food := int(tag_context.get("food", 0))
	var power := int(tag_context.get("power", 0))
	var signal_tags := int(tag_context.get("signal", 0))
	var clues := int(tag_context.get("signal_clues", 0))
	match node_id:
		NODE_L01:
			return base
		NODE_L02:
			if food > 0 or power > 0:
				return "식량/충전 권리 보유: 반복 주택 진입 안정"
			return base
		NODE_L03:
			if signal_tags > 0 or clues >= 3:
				return "수신 권리/송출 기록 확인: 심사 접근 준비"
			return base
		NODE_L04:
			if food <= 0:
				return "식량태그 없음: 긴 우회 체류 주의"
			return "식량 권리 보유: 배수로 체류 여유"
		NODE_L05:
			if signal_tags <= 0:
				return "수신태그 부족: 회수선 출처 불인정 위험"
			return "수신 권리 보유: 가짜 귀환 신호 대조 가능"
		_:
			return base

static func all_tag_hint_summary(tag_context: Dictionary = {}) -> String:
	var parts: Array[String] = []
	for node_id in NODE_IDS:
		parts.append("%s:%s" % [String(node_id), node_tag_hint(String(node_id), tag_context)])
	return " | ".join(parts)

static func node_region_reaction(node_id: String) -> String:
	return String(node_def(node_id).get("region_reaction", "R01 지역 반응이 작전도에 남습니다."))

static func node_spawn_bias(node_id: String) -> String:
	return String(node_def(node_id).get("spawn_bias", "wide_edge"))

static func node_spawn_axis_label(node_id: String) -> String:
	return String(node_def(node_id).get("spawn_axis_label", "주변 광고 장치에서 접근"))

static func node_risk(node_id: String) -> String:
	return String(node_def(node_id).get("risk", "미확인"))

static func node_enemy_hint(node_id: String) -> String:
	return String(node_def(node_id).get("enemy_hint", "광고 신호 미확인"))

static func node_threat_hint(node_id: String) -> String:
	return String(node_def(node_id).get("threat_hint", node_enemy_hint(node_id)))

static func node_modifier(node_id: String) -> String:
	return String(node_def(node_id).get("modifier", "지역 변조 미확인"))

static func node_modifier_short(node_id: String) -> String:
	return String(node_def(node_id).get("modifier_short", node_modifier(node_id)))

static func node_objective(node_id: String) -> String:
	return String(node_def(node_id).get("objective", node_combat_goal(node_id)))

static func node_recovery_line(node_id: String) -> String:
	return String(node_def(node_id).get("recovery_line", "미확인"))

static func node_route_note(node_id: String) -> String:
	return String(node_def(node_id).get("route_note", node_def(node_id).get("description", "작전 지점")))

static func node_sortie_notice(node_id: String) -> String:
	return String(node_def(node_id).get("sortie_notice", "R01 주택가 진입"))

static func node_entry_notice(node_id: String) -> String:
	match node_id:
		NODE_L01:
			return "외곽 회수 차선 진입: 낮은 광고음과 회수선 확보를 확인합니다."
		NODE_L02:
			return "분양 주택 루프 진입: 우편함과 현관 센서가 좌우 포위를 예고합니다."
		NODE_L03:
			return "모델하우스 축 진입: 상담 부스 송출선과 심사 압력이 모입니다."
		NODE_L04:
			return "배수로 침묵 주머니 진입: 낮은 신호와 젖은 흔적 후보를 추적합니다."
		NODE_L05:
			return "끊긴 광고 산책로 진입: 귀환로처럼 보이지만 회수선이 불안정합니다."
		_:
			return node_sortie_notice(node_id)

static func node_blockout_phrase(node_id: String) -> String:
	return String(node_def(node_id).get("blockout_phrase", "R01 주택가 작전 지점"))

static func node_blockout_variant(node_id: String) -> String:
	return String(node_def(node_id).get("blockout_variant", "first_visit"))

static func state_label(state: String) -> String:
	return String(STATUS_LABELS.get(state, state))

static func state_brief(state: String) -> String:
	match state:
		STATE_LOCKED:
			return "신호 미확정"
		STATE_AVAILABLE:
			return "접근 가능"
		STATE_SELECTED:
			return "선택 중"
		STATE_VISITED:
			return "방문 흔적 있음"
		STATE_CLEARED:
			return "회수선 고정"
		STATE_DANGER:
			return "위험 신호"
		STATE_BOSS_READY:
			return "심사 접근 가능"
		_:
			return state_label(state)

static func opened_signal_line(node_id: String, state: String = STATE_AVAILABLE) -> String:
	var label := state_brief(state)
	if state == STATE_BOSS_READY:
		label = "심사 접근 가능"
	elif state == STATE_DANGER:
		label = "위험 신호 감지"
	elif state == STATE_AVAILABLE:
		label = "접근 가능"
	return "새 신호: %s %s" % [node_name(node_id), label]

static func is_state_selectable(state: String) -> bool:
	return state == STATE_AVAILABLE or state == STATE_SELECTED or state == STATE_VISITED or state == STATE_CLEARED or state == STATE_DANGER or state == STATE_BOSS_READY

static func is_node_selectable(node_id: String, states: Dictionary) -> bool:
	return is_state_selectable(String(states.get(node_id, STATE_LOCKED)))

static func first_selectable_node_id(states: Dictionary, fallback: String = NODE_L01) -> String:
	for node_id in NODE_IDS:
		if is_node_selectable(String(node_id), states):
			return String(node_id)
	return fallback

static func state_summary(states: Dictionary) -> String:
	var parts: Array[String] = []
	for node_id in NODE_IDS:
		parts.append("%s=%s" % [String(node_id), String(states.get(node_id, STATE_LOCKED))])
	return " ".join(parts)

static func node_result_line(node_id: String, recall_quality: String = "") -> String:
	var prefix := "작전권: %s" % node_name(node_id)
	match recall_quality:
		"unstable_recall":
			return "%s - 회수선이 흔들려 구역 흔적이 보류 표식으로 남았습니다." % prefix
		"emergency_retrieval":
			return "%s - 긴급 인양 중에도 구역 source 반응이 정산대에 남았습니다." % prefix
		"boss_interrupted":
			return "%s - 심사 절차 일부가 이름 보관함에 걸렸습니다." % prefix
		"story_recall":
			return "%s - 첫 등록 직전 회수 플랫폼이 외곽 기록만 붙잡았습니다." % prefix
		_:
			return "%s - 이번 출격 기록이 다음 작전도에 고정됩니다." % prefix

static func node_incident_line(node_id: String, recall_quality: String = "") -> String:
	if recall_quality == "unstable_recall" and node_id == NODE_L05:
		return "구역 사건: 가짜 회수선이 뒤쪽 포위를 부르며 보급소의 출처 확인을 실패시켰습니다."
	if recall_quality == "unstable_recall":
		match node_id:
			NODE_L02:
				return "구역 사건: 우편함 주소 중복과 현관 센서 노이즈가 남았지만 정산 근거는 희미합니다."
			NODE_L03:
				return "구역 사건: 모델하우스 심사 신호가 잡혔지만 회수선이 흔들려 보류 표식이 남았습니다."
			NODE_L04:
				return "구역 사건: 배수로 낮은 신호와 젖은 전단 흔적이 보류 표식으로 남았습니다."
			_:
				return "구역 사건: 짧거나 흔들린 체류 때문에 정산 근거가 희미하게 남았습니다."
	match node_id:
		NODE_L01:
			return "구역 사건: 낮은 광고음 사이에서 회수 차선의 기준점이 다시 켜졌습니다."
		NODE_L02:
			return "구역 사건: 우편함들이 같은 주소를 반복 인쇄하고 현관 센서 노이즈가 남았습니다."
		NODE_L03:
			return "구역 사건: 모델하우스 안내판과 상담 부스가 심사 신호를 게시판에 고정했습니다."
		NODE_L04:
			return "구역 사건: 배수구 아래 젖은 전단과 낮은 신호 흔적이 보관실로 들어왔습니다."
		NODE_L05:
			return "구역 사건: 귀환로처럼 보인 화살표가 광고 산책로 경고로 다시 분류됐습니다."
		_:
			return "구역 사건: R01 작전권 반응이 보급소 기록으로 남았습니다."

static func node_outpost_reaction(node_id: String, recall_quality: String = "") -> String:
	if node_id == NODE_L05:
		if recall_quality == "stable_recall":
			return "출격 게시판이 가짜 귀환로를 회수선이 아닌 광고 산책로로 다시 표시합니다."
		return "회수 플랫폼이 해당 회수선의 출처를 인정하지 않고 경고등을 남깁니다."
	if recall_quality == "unstable_recall":
		match node_id:
			NODE_L02:
				return "정산 카운터가 우편함 주소 중복 기록을 보류 표식으로 묶습니다."
			NODE_L03:
				return "이름 보관함이 흔들린 모델하우스 심사관 이름을 추적합니다."
			NODE_L04:
				return "흔적 보관실이 젖은 전단과 배수로 표식을 보류 칸에 둡니다."
			_:
				return "%s 기록이 보류 표식으로 정산 카운터에 남았습니다." % node_name(node_id)
	match node_id:
		NODE_L01:
			return "회수 플랫폼이 침묵 가장자리 기준선을 다시 잡습니다."
		NODE_L02:
			return "정산 카운터가 우편함 주소 중복 기록을 묶고 정비대가 현관 센서 노이즈를 털어냅니다."
		NODE_L03:
			return "출격 게시판이 모델하우스 신호를 고정하고 이름 보관함이 심사관 이름을 추적합니다."
		NODE_L04:
			return "흔적 보관실이 젖은 전단과 배수로 표식을 낮은 신호 칸에 둡니다."
		_:
			return node_region_reaction(node_id)

static func node_map_memory_line(node_id: String, memory: Dictionary = {}) -> String:
	if memory.is_empty():
		return node_route_note(node_id)
	var visit_count := int(memory.get("node_visit_count", 0))
	if visit_count <= 0:
		return node_route_note(node_id)
	var recall_quality := String(memory.get("node_recall_quality", ""))
	var tag_summary := String(memory.get("node_last_tag_summary", ""))
	var contamination_hint := String(memory.get("node_contamination_hint", ""))
	var story_count := int(memory.get("node_story_object_count", 0))
	var story_phrase := String(memory.get("node_last_story_object_phrase", ""))
	var npc_trace_count := int(memory.get("node_npc_trace_count", 0))
	var npc_trace_phrase := String(memory.get("node_last_npc_trace_phrase", ""))
	var manual_count := int(memory.get("node_manual_stamp_count", 0))
	var manual_phrase := String(memory.get("node_last_manual_stamp_phrase", ""))
	var source_count := int(memory.get("node_source_action_count", 0))
	var source_phrase := String(memory.get("node_last_source_action_phrase", ""))
	if npc_trace_count > 0 and npc_trace_phrase != "":
		if story_count > 0 and story_phrase != "" and source_count > 0 and source_phrase != "":
			return "흔적: %s / %s / %s / 사람 흔적 %d개" % [story_phrase, npc_trace_phrase, source_phrase, npc_trace_count]
		if story_count > 0 and story_phrase != "":
			return "흔적: %s / %s / 사람 흔적 %d개" % [story_phrase, npc_trace_phrase, npc_trace_count]
		if source_count > 0 and source_phrase != "":
			return "흔적: %s / %s / 사람 흔적 %d개" % [npc_trace_phrase, source_phrase, npc_trace_count]
		return "흔적: %s / 사람 흔적 %d개" % [npc_trace_phrase, npc_trace_count]
	if source_count > 0 and source_phrase != "" and story_count > 0 and story_phrase != "":
		return "흔적: %s / %s / 현장 처리 %d개" % [story_phrase, source_phrase, story_count + manual_count + source_count]
	if source_count > 0 and source_phrase != "":
		return "흔적: %s / 현장 처리 %d개" % [source_phrase, source_count]
	if story_count > 0 and story_phrase != "" and manual_count > 0 and manual_phrase != "":
		return "흔적: %s / %s / 현장 확인 %d개" % [story_phrase, manual_phrase, story_count + manual_count]
	if story_count > 0 and story_phrase != "":
		return "흔적: %s / 현장 확인 %d개" % [story_phrase, story_count]
	if manual_count > 0 and manual_phrase != "":
		return "흔적: %s / 도장 확인 %d개" % [manual_phrase, manual_count]
	if node_id == NODE_L05 and recall_quality == "unstable_recall":
		return "흔적: 가짜 귀환 경고 강화 / 회수선 출처 의심"
	if contamination_hint != "":
		return "흔적: %s / 방문 %d회" % [contamination_hint, visit_count]
	if recall_quality == "stable_recall":
		return "흔적: 신호 안정 / %s" % tag_summary
	if recall_quality == "emergency_retrieval":
		return "흔적: 긴급 인양 표식 / 방문 %d회" % visit_count
	if recall_quality == "boss_interrupted":
		return "흔적: 심사 중단 기록 / 이름 보관함 연동"
	if recall_quality == "story_recall":
		return "흔적: 첫 강제 회수 기준점 / 방문 %d회" % visit_count
	return "흔적: 방문 %d회 / %s" % [visit_count, tag_summary]

static func node_memory_debug_summary(memories: Dictionary) -> String:
	var parts: Array[String] = []
	for node_id in NODE_IDS:
		var memory := Dictionary(memories.get(node_id, {}))
		if memory.is_empty():
			parts.append("%s=none" % String(node_id))
			continue
		parts.append("%s{visits=%d,result=%s,recall=%s,signal=%d,story=%d,npc_trace=%d,manual=%d,source=%d,last_story=%s,last_npc_trace=%s,last_manual=%s,last_source=%s,contam=%s,unlock=%s,tags=%s}" % [
			String(node_id),
			int(memory.get("node_visit_count", 0)),
			String(memory.get("last_node_result", "")),
			String(memory.get("node_recall_quality", "")),
			int(memory.get("node_signal_level", 0)),
			int(memory.get("node_story_object_count", 0)),
			int(memory.get("node_npc_trace_count", 0)),
			int(memory.get("node_manual_stamp_count", 0)),
			int(memory.get("node_source_action_count", 0)),
			String(memory.get("node_last_story_object_phrase", "")),
			String(memory.get("node_last_npc_trace_phrase", "")),
			String(memory.get("node_last_manual_stamp_phrase", "")),
			String(memory.get("node_last_source_action_phrase", "")),
			String(memory.get("node_contamination_hint", "")),
			String(memory.get("node_unlocked_by", "")),
			String(memory.get("node_last_tag_summary", "")),
		])
	return " | ".join(parts)

func build() -> void:
	if _built:
		return
	_built = true
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	visible = false
	set_process(true)

	_title_label = _make_label(Vector2(18, 12), Vector2(282, 18), 13, C.INK)
	_title_label.text = "R01 작전도"
	add_child(_title_label)

	_hint_label = _make_label(Vector2(18, 30), Vector2(282, 22), 9, Color("#433227"))
	_hint_label.text = "작전권: 외곽 회수선 -> 분양 주택 루프 -> 모델하우스 결절 / 핀 선택 후 출격"
	_hint_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_hint_label)

	_change_label = _make_label(Vector2(312, 18), Vector2(142, 28), 9, C.NEON_RED)
	_change_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_change_label)

	_brief_title_label = _make_label(Vector2(312, 52), Vector2(142, 18), 12, C.INK)
	_brief_title_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	add_child(_brief_title_label)

	_status_label = _make_label(Vector2(312, 72), Vector2(142, 56), 9, C.INK)
	_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_status_label)

	_objective_label = _make_label(Vector2(312, 132), Vector2(142, 56), 9, C.INK)
	_objective_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_objective_label)

	_legend_label = _make_label(Vector2(18, 217), Vector2(282, 36), 8, Color("#433227"))
	_legend_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_legend_label.text = "범례: 초록 접근 가능 / 노랑 출격 지점 / 빨강 위험 / 주황 심사 / 회색 미개방 신호 / 얇은 선은 곁길"
	add_child(_legend_label)

	_description_label = _make_label(Vector2(312, 188), Vector2(142, 28), 8, Color("#433227"))
	_description_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_description_label)

	for i in range(NODE_IDS.size()):
		var node_id := String(NODE_IDS[i])
		var button := Button.new()
		var pos: Vector2 = node_def(node_id).get("ui_pos", Vector2.ZERO)
		button.position = pos - Vector2(10, 10)
		button.size = Vector2(20, 20)
		button.clip_text = true
		button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.add_theme_font_size_override("font_size", 8)
		button.add_theme_color_override("font_color", C.INK)
		button.add_theme_color_override("font_disabled_color", Color("#4f4135"))
		button.pressed.connect(_on_node_button_pressed.bind(node_id))
		_apply_font(button)
		add_child(button)
		_node_buttons[node_id] = button

	_sortie_button = Button.new()
	_sortie_button.position = Vector2(316, 224)
	_sortie_button.size = Vector2(88, 24)
	_sortie_button.text = "Enter 출격"
	_sortie_button.add_theme_font_size_override("font_size", 10)
	_sortie_button.add_theme_color_override("font_color", C.INK)
	_sortie_button.pressed.connect(_on_sortie_button_pressed)
	_apply_font(_sortie_button)
	add_child(_sortie_button)

	_close_button = Button.new()
	_close_button.position = Vector2(410, 224)
	_close_button.size = Vector2(42, 24)
	_close_button.text = "Esc"
	_close_button.add_theme_font_size_override("font_size", 10)
	_close_button.add_theme_color_override("font_color", C.INK)
	_close_button.pressed.connect(_on_close_button_pressed)
	_apply_font(_close_button)
	add_child(_close_button)

func show_map(data: Dictionary) -> void:
	build()
	visible = true
	update_map(data)

func update_map(data: Dictionary) -> void:
	_raw_states = Dictionary(data.get("raw_states", data.get("states", initial_states()))).duplicate(true)
	_display_states = Dictionary(data.get("display_states", _raw_states)).duplicate(true)
	_selected_node_id = String(data.get("selected_node_id", first_selectable_node_id(_raw_states)))
	_current_node_id = String(data.get("current_node_id", _selected_node_id))
	_last_completed_node_id = String(data.get("last_completed_node_id", ""))
	_change_banner = String(data.get("change_banner", ""))
	_recommendation_line = String(data.get("recommendation_line", ""))
	_recommendation_reason = String(data.get("recommendation_reason", ""))
	_tag_context = Dictionary(data.get("tag_context", {})).duplicate(true)
	_node_memory = Dictionary(data.get("node_memory", {})).duplicate(true)
	_opened_node_ids.clear()
	for node_id in Array(data.get("opened_node_ids", [])):
		_opened_node_ids.append(String(node_id))
	_refresh_controls()
	queue_redraw()

func hide_map() -> void:
	visible = false

func _process(_delta: float) -> void:
	if visible:
		queue_redraw()

func selected_node_id() -> String:
	return _selected_node_id

func visible_ui_text() -> String:
	var parts: Array[String] = []
	_collect_visible_text(self, parts)
	return "\n".join(parts)

func _refresh_controls() -> void:
	for i in range(NODE_IDS.size()):
		var node_id := String(NODE_IDS[i])
		var button: Button = _node_buttons[node_id]
		var raw_state := String(_raw_states.get(node_id, STATE_LOCKED))
		var display_state := String(_display_states.get(node_id, raw_state))
		var selectable := is_state_selectable(raw_state)
		var definition := node_def(node_id)
		button.disabled = not selectable
		button.text = "•" if selectable else ""
		button.tooltip_text = "%s: %s" % [String(definition["name"]), String(definition["description"])]
		_apply_button_state_style(button, display_state, selectable)

	var selected_def := node_def(_selected_node_id)
	var selected_raw_state := String(_raw_states.get(_selected_node_id, STATE_LOCKED))
	var selected_display_state := String(_display_states.get(_selected_node_id, selected_raw_state))
	var can_sortie := is_state_selectable(selected_raw_state)
	_change_label.text = _current_change_banner()
	_description_label.text = _bottom_map_line()
	_sortie_button.disabled = not can_sortie
	_sortie_button.text = "Enter 출격" if can_sortie else "잠김"
	_apply_button_state_style(_sortie_button, STATE_SELECTED if can_sortie else STATE_LOCKED, can_sortie)
	_apply_button_state_style(_close_button, STATE_AVAILABLE, true)

	_brief_title_label.text = "선택 중: %s" % String(selected_def["name"])
	_status_label.text = "역할: %s\n상태: %s\n위험: %s\n회수선: %s" % [
		node_operation_role(_selected_node_id),
		state_brief(selected_display_state),
		String(selected_def["risk"]),
		String(selected_def["recovery_line"]),
	]
	_objective_label.text = "목표 %s\n태그 %s\n추천 %s\n스폰 %s" % [
		String(selected_def["objective"]),
		node_tag_hint(_selected_node_id, _tag_context),
		_recommendation_reason if _recommendation_reason != "" else "현재 작전권 확인",
		node_spawn_axis_label(_selected_node_id),
	]

func _compact_state_label(state: String) -> String:
	match state:
		STATE_LOCKED:
			return "잠김"
		STATE_SELECTED:
			return "선택"
		STATE_VISITED:
			return "방문"
		STATE_CLEARED:
			return "고정"
		STATE_DANGER:
			return "위험"
		STATE_BOSS_READY:
			return "심사"
		_:
			return "열림"

func _draw() -> void:
	if not visible:
		return
	var rect := Rect2(Vector2(8, 8), Vector2(464, 254))
	draw_rect(rect, Color("#f5f0dc"))
	draw_rect(rect, Color("#433227"), false, 3.0)
	draw_rect(Rect2(Vector2(16, 58), Vector2(284, 154)), Color(0.72, 0.84, 0.78, 0.16))
	draw_rect(Rect2(Vector2(308, 16), Vector2(150, 196)), Color(1.0, 0.97, 0.86, 0.88))
	draw_rect(Rect2(Vector2(308, 16), Vector2(150, 196)), Color("#6b5b4a"), false, 1.5)
	draw_rect(Rect2(Vector2(312, 48), Vector2(142, 2)), Color(1.0, 0.3, 0.36, 0.32))
	draw_rect(Rect2(Vector2(16, 216), Vector2(442, 40)), Color(1.0, 0.97, 0.86, 0.88))
	_draw_operation_district()
	_draw_suburb_texture()
	_draw_edges()
	_draw_selected_route()
	_draw_node_marks()
	_draw_map_labels()
	_draw_node_nameplates()

func _current_change_banner() -> String:
	if _change_banner != "":
		return _change_banner
	if _recommendation_line != "":
		return _recommendation_line
	if _last_completed_node_id != "":
		return "%s 회수선 고정" % node_name(_last_completed_node_id)
	return "작전도: 외곽 회수선 기준 설정"

func _bottom_map_line() -> String:
	var selected_note := node_route_note(_selected_node_id)
	var selected_memory := Dictionary(_node_memory.get(_selected_node_id, {}))
	if not selected_memory.is_empty():
		selected_note = node_map_memory_line(_selected_node_id, selected_memory)
	var completed_name := "최근 회수 없음" if _last_completed_node_id == "" else "%s 회수선 고정" % node_name(_last_completed_node_id)
	var recommendation := _recommendation_line if _recommendation_line != "" else "다음 추천: 현재 작전권 확인"
	return "%s / %s / %s" % [selected_note, completed_name, recommendation]

func _draw_operation_district() -> void:
	var area := Rect2(Vector2(18, 60), Vector2(280, 150))
	draw_rect(area, Color(0.93, 0.86, 0.64, 0.18))
	draw_rect(area, Color(0.28, 0.20, 0.17, 0.30), false, 1.0)
	draw_rect(Rect2(Vector2(20, 64), Vector2(72, 142)), Color(0.50, 0.76, 0.58, 0.12))
	draw_rect(Rect2(Vector2(94, 64), Vector2(96, 142)), Color(1.0, 0.91, 0.25, 0.10))
	draw_rect(Rect2(Vector2(192, 64), Vector2(104, 142)), Color(1.0, 0.30, 0.36, 0.08))

	var spine := [
		Vector2(28, 190),
		Vector2(72, 178),
		Vector2(118, 154),
		Vector2(162, 137),
		Vector2(214, 108),
		Vector2(290, 74),
	]
	for i in range(spine.size() - 1):
		draw_line(spine[i], spine[i + 1], Color(0.37, 0.29, 0.24, 0.24), 12.0)
		draw_line(spine[i], spine[i + 1], Color(1.0, 0.97, 0.86, 0.34), 2.0)

	draw_arc(Vector2(154, 136), 42.0, -PI * 0.10, PI * 1.80, 48, Color(0.37, 0.29, 0.24, 0.26), 7.0)
	draw_arc(Vector2(154, 136), 28.0, -PI * 0.10, PI * 1.80, 42, Color(1.0, 0.97, 0.86, 0.18), 2.0)
	draw_line(Vector2(166, 142), Vector2(250, 194), Color(0.25, 0.23, 0.19, 0.18), 5.0)
	draw_line(Vector2(152, 130), Vector2(86, 82), Color(0.78, 0.22, 0.45, 0.22), 5.0)
	_draw_dashed_line(Vector2(72, 74), Vector2(144, 104), Color(0.78, 0.22, 0.45, 0.30), 2.0, 7.0, 5.0)

	for x in range(42, 284, 32):
		draw_line(Vector2(x, 66), Vector2(x - 18, 206), Color(0.28, 0.20, 0.17, 0.08), 1.0)
	for y in range(84, 198, 24):
		draw_line(Vector2(26, y), Vector2(288, y - 10), Color(0.28, 0.20, 0.17, 0.07), 1.0)

	_draw_house_row(Vector2(34, 154), 4, Vector2(22, -9))
	_draw_house_row(Vector2(104, 106), 5, Vector2(20, 8))
	_draw_house_row(Vector2(114, 166), 5, Vector2(21, 6))
	_draw_house_row(Vector2(204, 86), 4, Vector2(22, -7))
	_draw_house_row(Vector2(202, 132), 4, Vector2(19, 10))

	draw_rect(Rect2(Vector2(248, 62), Vector2(36, 18)), Color(1.0, 0.72, 0.18, 0.18))
	draw_rect(Rect2(Vector2(248, 62), Vector2(36, 18)), Color(0.60, 0.24, 0.16, 0.28), false, 1.0)
	draw_line(Vector2(220, 200), Vector2(292, 184), Color(0.18, 0.35, 0.35, 0.34), 4.0)
	draw_line(Vector2(220, 204), Vector2(292, 188), Color(1.0, 0.97, 0.86, 0.18), 1.0)
	draw_rect(Rect2(Vector2(22, 184), Vector2(18, 14)), Color(0.50, 0.76, 0.58, 0.20))
	draw_string(UIFont.get_font(), Vector2(22, 181), "보급소", HORIZONTAL_ALIGNMENT_LEFT, 48, 7, Color("#433227"))

func _draw_house_row(start: Vector2, count: int, step: Vector2) -> void:
	for i in range(count):
		var p := start + step * float(i)
		draw_rect(Rect2(p, Vector2(13, 9)), Color(0.60, 0.42, 0.32, 0.13))
		draw_line(p + Vector2(-1, 1), p + Vector2(6, -4), Color(0.42, 0.28, 0.22, 0.15), 1.0)
		draw_line(p + Vector2(6, -4), p + Vector2(14, 1), Color(0.42, 0.28, 0.22, 0.15), 1.0)

func _draw_map_labels() -> void:
	draw_string(UIFont.get_font(), Vector2(46, 70), "외곽 회수선", HORIZONTAL_ALIGNMENT_LEFT, 86, 8, Color("#433227"))
	draw_string(UIFont.get_font(), Vector2(126, 104), "반복 주택 블록", HORIZONTAL_ALIGNMENT_LEFT, 104, 8, Color("#433227"))
	draw_string(UIFont.get_font(), Vector2(210, 62), "모델하우스 안쪽", HORIZONTAL_ALIGNMENT_LEFT, 98, 8, Color("#433227"))
	draw_string(UIFont.get_font(), Vector2(224, 203), "배수로 곁길", HORIZONTAL_ALIGNMENT_LEFT, 64, 8, Color("#433227"))
	draw_string(UIFont.get_font(), Vector2(52, 92), "가짜 귀환 신호", HORIZONTAL_ALIGNMENT_LEFT, 96, 8, Color(0.65, 0.16, 0.32, 0.82))

func _draw_suburb_texture() -> void:
	for i in range(9):
		var base := Vector2(38 + i * 26, 118 + (i % 3) * 18)
		draw_rect(Rect2(base, Vector2(18, 12)), Color(0.60, 0.42, 0.32, 0.13))
		draw_line(base + Vector2(-2, 2), base + Vector2(9, -6), Color(0.42, 0.28, 0.22, 0.18), 1.0)
		draw_line(base + Vector2(9, -6), base + Vector2(20, 2), Color(0.42, 0.28, 0.22, 0.18), 1.0)
	for i in range(5):
		var p := Vector2(74 + i * 34, 64 + (i % 2) * 12)
		draw_rect(Rect2(p, Vector2(32, 8)), Color(1.0, 0.91, 0.25, 0.16))
		draw_rect(Rect2(p, Vector2(32, 8)), Color(0.42, 0.25, 0.19, 0.18), false, 1.0)
	for i in range(4):
		var p := Vector2(236 + i * 22, 190 - i * 5)
		draw_line(p, p + Vector2(26, -7), Color(0.08, 0.13, 0.10, 0.25), 3.0)

func _draw_edges() -> void:
	for edge in EDGES:
		var from_id := String(edge[0])
		var to_id := String(edge[1])
		var a: Vector2 = node_def(from_id).get("ui_pos", Vector2.ZERO)
		var b: Vector2 = node_def(to_id).get("ui_pos", Vector2.ZERO)
		var state := String(_display_states.get(to_id, STATE_LOCKED))
		var color := _state_color(state)
		var main_route := _edge_is_main_route(from_id, to_id)
		color.a = 0.18 if state == STATE_LOCKED else (0.62 if main_route else 0.40)
		var width := 5.2 if main_route else 3.4
		if state == STATE_LOCKED:
			width = 2.2
		if to_id == NODE_L05:
			color = Color(0.95, 0.54, 0.78, 0.24 if state != STATE_LOCKED else 0.10)
		if state == STATE_LOCKED:
			_draw_dashed_line(a, b, color, width, 11.0, 8.0)
		else:
			draw_line(a, b, color, width)
		draw_line(a, b, Color(0.28, 0.20, 0.17, 0.34), 1.1)
		if _last_completed_node_id == from_id or _opened_node_ids.has(to_id):
			draw_line(a, b, Color(1.0, 0.91, 0.25, 0.68), 2.0)
		var dir := (b - a).normalized()
		var mid := a.lerp(b, 0.54)
		draw_line(mid - dir.rotated(PI * 0.5) * 5.0, mid + dir * 13.0, Color(1.0, 0.92, 0.48, 0.34), 1.4)

func _edge_is_main_route(from_id: String, to_id: String) -> bool:
	for i in range(MAIN_ROUTE.size() - 1):
		if String(MAIN_ROUTE[i]) == from_id and String(MAIN_ROUTE[i + 1]) == to_id:
			return true
	return false

func _draw_dashed_line(a: Vector2, b: Vector2, color: Color, width: float, dash: float, gap: float) -> void:
	var delta := b - a
	var length := delta.length()
	if length <= 0.01:
		return
	var dir := delta / length
	var distance := 0.0
	while distance < length:
		var start := a + dir * distance
		var end := a + dir * minf(distance + dash, length)
		draw_line(start, end, color, width)
		distance += dash + gap

func _draw_node_marks() -> void:
	for node_id in NODE_IDS:
		var id := String(node_id)
		var pos: Vector2 = node_def(id).get("ui_pos", Vector2.ZERO)
		var state := String(_display_states.get(id, STATE_LOCKED))
		var color := _state_color(state)
		var pulse := 1.0 + 0.07 * sin(float(Time.get_ticks_msec()) * 0.006) if state == STATE_SELECTED or _opened_node_ids.has(id) else 1.0
		var radius := 8.0
		if state == STATE_LOCKED:
			radius = 5.5
		elif state == STATE_BOSS_READY:
			radius = 10.5
		elif state == STATE_DANGER:
			radius = 9.5
		elif state == STATE_SELECTED:
			radius = 11.0
		draw_circle(pos + Vector2(2, 3), radius + 2.0, Color(0.08, 0.06, 0.05, 0.16 if state != STATE_LOCKED else 0.06))
		draw_circle(pos, radius * pulse, Color(color.r, color.g, color.b, 0.07 if state == STATE_LOCKED else 0.18))
		if state == STATE_DANGER:
			_draw_ad_noise(pos, radius + 6.0)
		if state == STATE_BOSS_READY:
			draw_arc(pos, (radius + 5.0) * pulse, -PI * 0.18, PI * 1.18, 32, Color(1.0, 0.72, 0.18, 0.72), 2.2)
			draw_rect(Rect2(pos - Vector2(9, 6), Vector2(18, 12)), Color(1.0, 0.72, 0.18, 0.10), false, 1.0)
		if id == _last_completed_node_id:
			draw_arc(pos, radius + 7.0, 0.0, TAU, 32, Color(0.62, 1.0, 0.36, 0.70), 1.6)
			draw_line(pos + Vector2(-5, 0), pos + Vector2(-1, 4), Color(0.62, 1.0, 0.36, 0.90), 1.8)
			draw_line(pos + Vector2(-1, 4), pos + Vector2(7, -6), Color(0.62, 1.0, 0.36, 0.90), 1.8)
		var memory := Dictionary(_node_memory.get(id, {}))
		if not memory.is_empty():
			var recall_quality := String(memory.get("node_recall_quality", ""))
			var contamination_hint := String(memory.get("node_contamination_hint", ""))
			if recall_quality == "unstable_recall" or contamination_hint != "":
				_draw_ad_noise(pos, radius + 10.0)
			elif recall_quality == "stable_recall":
				draw_arc(pos, radius + 10.0, PI * 0.18, PI * 1.82, 30, Color(0.62, 1.0, 0.36, 0.42), 1.2)
			var visits := mini(3, int(memory.get("node_visit_count", 0)))
			for tick in range(visits):
				draw_circle(pos + Vector2(-5 + tick * 5, radius + 9.0), 1.4, Color(0.28, 0.20, 0.17, 0.62))
		if _opened_node_ids.has(id):
			var open_pulse := 1.0 + 0.16 * sin(float(Time.get_ticks_msec()) * 0.009)
			draw_arc(pos, (radius + 9.0) * open_pulse, -PI * 0.25, PI * 1.25, 36, C.VITAMIN_YELLOW, 1.8)
		draw_arc(pos, radius * pulse, 0.0, TAU, 28, Color(color.r, color.g, color.b, 0.88 if state != STATE_LOCKED else 0.34), 1.8 if state != STATE_LOCKED else 1.0)
		draw_circle(pos, 2.9 if state != STATE_LOCKED else 2.1, Color(color.r, color.g, color.b, 0.95 if state != STATE_LOCKED else 0.32))
		if state == STATE_VISITED:
			draw_line(pos + Vector2(-4, 6), pos + Vector2(6, 9), Color(0.1, 0.08, 0.06, 0.52), 1.2)
		elif state == STATE_CLEARED:
			draw_arc(pos, radius - 2.0, PI * 0.1, PI * 0.9, 18, Color(0.62, 1.0, 0.36, 0.70), 1.5)

func _draw_node_nameplates() -> void:
	for i in range(NODE_IDS.size()):
		var id := String(NODE_IDS[i])
		var definition := node_def(id)
		var pos: Vector2 = definition.get("ui_pos", Vector2.ZERO)
		var state := String(_display_states.get(id, STATE_LOCKED))
		var selected := id == _selected_node_id
		var name := String(definition["name"])
		var label_pos := _node_label_position(id, pos)
		var label_size := Vector2(92, 15)
		var fill := Color(1.0, 0.97, 0.86, 0.88) if selected else Color(1.0, 0.97, 0.86, 0.58)
		if state == STATE_LOCKED:
			fill = Color(0.80, 0.76, 0.68, 0.22)
		var line_color := _state_color(state)
		line_color.a = 0.72 if selected else (0.32 if state != STATE_LOCKED else 0.16)
		var anchor := label_pos + Vector2(0, label_size.y * 0.5)
		if label_pos.x < pos.x:
			anchor = label_pos + Vector2(label_size.x, label_size.y * 0.5)
		draw_line(pos, anchor, line_color, 1.0 if state != STATE_LOCKED else 0.7)
		draw_rect(Rect2(label_pos, label_size), fill)
		draw_rect(Rect2(label_pos, label_size), _state_color(state), false, 1.0 if selected else 0.6)
		draw_string(UIFont.get_font(), label_pos + Vector2(4, 10), name, HORIZONTAL_ALIGNMENT_LEFT, 84, 8, C.INK if state != STATE_LOCKED else Color("#5a4d3f"))

func _node_label_position(node_id: String, pos: Vector2) -> Vector2:
	match node_id:
		NODE_L01:
			return pos + Vector2(-26, -32)
		NODE_L02:
			return pos + Vector2(-50, 24)
		NODE_L03:
			return pos + Vector2(-78, 22)
		NODE_L04:
			return pos + Vector2(-36, -36)
		NODE_L05:
			return pos + Vector2(22, -18)
		_:
			return pos + Vector2(-44, 24)

func _status_map_label(state: String) -> String:
	match state:
		STATE_LOCKED:
			return "잠김 - 아직 신호 없음"
		STATE_SELECTED:
			return "선택 중"
		STATE_VISITED:
			return "방문 흔적"
		STATE_CLEARED:
			return "회수선 고정"
		STATE_DANGER:
			return "위험 신호"
		STATE_BOSS_READY:
			return "심사 접근"
		_:
			return "접근 가능"

func _draw_selected_route() -> void:
	if _selected_node_id == "":
		return
	var path := _selected_path_node_ids()
	for i in range(path.size() - 1):
		var a: Vector2 = node_def(String(path[i])).get("ui_pos", Vector2.ZERO)
		var b: Vector2 = node_def(String(path[i + 1])).get("ui_pos", Vector2.ZERO)
		draw_line(a, b, Color(1.0, 0.91, 0.25, 0.56), 4.0)
		draw_line(a, b, C.NEON_RED, 1.3)
	var pos: Vector2 = node_def(_selected_node_id).get("ui_pos", Vector2.ZERO)
	var pulse := 1.0 + 0.12 * sin(float(Time.get_ticks_msec()) * 0.008)
	draw_circle(pos, 18.0 * pulse, Color(1.0, 0.91, 0.25, 0.07))
	draw_arc(pos, 17.0 * pulse, -PI * 0.2, PI * 1.25, 34, C.NEON_RED, 1.8)
	draw_arc(pos, 23.0 * pulse, PI * 0.05, PI * 1.05, 32, C.VITAMIN_YELLOW, 1.2)
	draw_line(pos + Vector2(-23, 0), pos + Vector2(-14, 0), C.NEON_RED, 1.2)
	draw_line(pos + Vector2(14, 0), pos + Vector2(23, 0), C.NEON_RED, 1.2)
	draw_line(pos + Vector2(0, -23), pos + Vector2(0, -14), C.NEON_RED, 1.2)
	draw_line(pos + Vector2(0, 14), pos + Vector2(0, 23), C.NEON_RED, 1.2)

func _draw_ad_noise(pos: Vector2, radius: float) -> void:
	for i in range(5):
		var t := float(i) / 5.0 * TAU + float(Time.get_ticks_msec()) * 0.002
		var a := pos + Vector2(cos(t), sin(t)) * (radius - 4.0)
		var b := pos + Vector2(cos(t + 0.45), sin(t + 0.45)) * (radius + 3.0)
		draw_line(a, b, Color(1.0, 0.3, 0.36, 0.42), 1.5)

func _selected_path_node_ids() -> Array[String]:
	match _selected_node_id:
		NODE_L03:
			return [NODE_L01, NODE_L02, NODE_L03]
		NODE_L04:
			return [NODE_L01, NODE_L02, NODE_L04]
		NODE_L05:
			return [NODE_L01, NODE_L02, NODE_L05]
		NODE_L02:
			return [NODE_L01, NODE_L02]
		_:
			return [NODE_L01]

func _state_color(state: String) -> Color:
	match state:
		STATE_AVAILABLE:
			return Color("#8fd7a7")
		STATE_SELECTED:
			return C.VITAMIN_YELLOW
		STATE_VISITED:
			return Color("#8fc6df")
		STATE_CLEARED:
			return C.TOXIC_GREEN
		STATE_DANGER:
			return C.NEON_RED
		STATE_BOSS_READY:
			return Color("#ffb84d")
		_:
			return Color("#8a7962")

func _apply_button_state_style(button: Button, state: String, selectable: bool) -> void:
	var fill := Color(0.88, 0.84, 0.76, 0.20)
	var border := Color(0.42, 0.36, 0.29, 0.28)
	if selectable:
		var state_color := _state_color(state)
		fill = Color(state_color.r, state_color.g, state_color.b, 0.22)
		border = Color(state_color.r, state_color.g, state_color.b, 0.90)
		if state == STATE_SELECTED:
			fill = Color(1.0, 0.91, 0.25, 0.42)
			border = C.NEON_RED
		elif state == STATE_DANGER:
			fill = Color(1.0, 0.3, 0.36, 0.20)
		elif state == STATE_BOSS_READY:
			fill = Color(1.0, 0.72, 0.18, 0.30)
	button.add_theme_stylebox_override("normal", _button_style(fill, border, 1 if selectable else 0))
	button.add_theme_stylebox_override("hover", _button_style(Color("#fff7df"), border, 2))
	button.add_theme_stylebox_override("pressed", _button_style(C.LEMON_YELLOW, C.NEON_RED, 2))
	button.add_theme_stylebox_override("disabled", _button_style(Color(0.78, 0.73, 0.65, 0.10), Color(0.42, 0.36, 0.29, 0.14), 0))

func _button_style(fill_color: Color, border_color: Color, border_width: int) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill_color
	style.border_color = border_color
	style.set_border_width_all(border_width)
	style.set_corner_radius_all(2)
	style.content_margin_left = 1
	style.content_margin_right = 1
	style.content_margin_top = 1
	style.content_margin_bottom = 1
	return style

func _make_label(position: Vector2, size: Vector2, font_size: int, color: Color) -> Label:
	var label := Label.new()
	label.position = position
	label.size = size
	label.clip_text = true
	label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", color)
	_apply_font(label)
	return label

func _apply_font(control: Control) -> void:
	control.add_theme_font_override("font", UIFont.get_font())

func _on_node_button_pressed(node_id: String) -> void:
	node_selected.emit(node_id)

func _on_sortie_button_pressed() -> void:
	sortie_requested.emit(_selected_node_id)

func _on_close_button_pressed() -> void:
	close_requested.emit()

func _collect_visible_text(node: Node, parts: Array[String]) -> void:
	if node is CanvasItem and not (node as CanvasItem).visible:
		return
	if node is Label:
		parts.append((node as Label).text)
	elif node is Button:
		parts.append((node as Button).text)
	for child in node.get_children():
		_collect_visible_text(child, parts)
