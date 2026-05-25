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

const NODE_DEFS := {
	NODE_L01: {
		"name": "침묵 가장자리",
		"description": "보급소의 회수선이 아직 닿는 외곽입니다.",
		"short_description": "회수선 외곽",
		"zone_id": "silence_edge_start",
		"ui_pos": Vector2(70, 190),
		"start_offset": Vector2(32, -18),
		"blockout_variant": "first_visit",
		"blockout_phrase": "낮은 광고 밀도, 보급소 회수선의 가장자리",
		"combat_goal": "회수선 바깥의 조용한 표식을 확인하세요",
		"sortie_notice": "침묵 가장자리 진입: 아직 보급소 신호가 등에 닿습니다.",
	},
	NODE_L02: {
		"name": "분양 주택 루프",
		"description": "같은 집이 다른 가격표로 반복됩니다.",
		"short_description": "반복 주택 루프",
		"zone_id": "subdivision_loop_center",
		"ui_pos": Vector2(190, 136),
		"start_offset": Vector2(-210, 142),
		"blockout_variant": "broadcast_record_3",
		"blockout_phrase": "우편함, 가격표, 쿠폰 밀도가 올라가는 반복 주택가",
		"combat_goal": "반복 주택 사이의 방송 좌표 흔적을 찾으세요",
		"sortie_notice": "분양 주택 루프 진입: 같은 현관이 다른 가격으로 다시 나타납니다.",
	},
	NODE_L03: {
		"name": "모델하우스 결절",
		"description": "가족 심사 절차가 이곳에서 시작됩니다.",
		"short_description": "심사 절차 접근",
		"zone_id": "model_house_node_anchor",
		"ui_pos": Vector2(356, 68),
		"start_offset": Vector2(-300, 170),
		"blockout_variant": "destroy_node",
		"blockout_phrase": "모델하우스 방향의 결절 신호와 보스 심사 절차",
		"combat_goal": "모델하우스 심사 신호를 따라 결절 접근로를 여세요",
		"sortie_notice": "모델하우스 결절 접근: 심사 절차가 현관등 뒤에서 돌아갑니다.",
	},
	NODE_L04: {
		"name": "배수로 침묵 주머니",
		"description": "광고음이 잠깐 끊기는 낮은 통로입니다.",
		"short_description": "낮은 침묵 통로",
		"zone_id": "drain_pocket_anchor",
		"ui_pos": Vector2(268, 214),
		"start_offset": Vector2(-160, 48),
		"blockout_variant": "extract_memory",
		"blockout_phrase": "위험은 낮지만 흔적이 진하게 남는 배수로 곁길",
		"combat_goal": "끊긴 광고음 아래의 낮은 흔적을 회수하세요",
		"sortie_notice": "배수로 침묵 주머니 진입: 광고음이 낮아지고 발밑이 젖습니다.",
	},
	NODE_L05: {
		"name": "가짜 귀환로",
		"description": "돌아가는 길처럼 보이지만, 회수선이 닿지 않습니다.",
		"short_description": "회수선 흉내",
		"zone_id": "fake_return_route_anchor",
		"ui_pos": Vector2(110, 76),
		"start_offset": Vector2(-110, 118),
		"blockout_variant": "broadcast_record_3",
		"blockout_phrase": "귀환 UI를 흉내 내는 산책로, 혼동과 광고 스피커 위험",
		"combat_goal": "보급소가 아닌 화살표를 따라가지 말고 끊긴 표식을 확인하세요",
		"sortie_notice": "가짜 귀환로 진입: 친절한 화살표가 보급소 목소리를 흉내 냅니다.",
	},
}

const STATUS_LABELS := {
	STATE_LOCKED: "잠김",
	STATE_AVAILABLE: "열림",
	STATE_SELECTED: "선택",
	STATE_VISITED: "확인",
	STATE_CLEARED: "완료",
	STATE_DANGER: "위험",
	STATE_BOSS_READY: "보스 접근",
}

var _built := false
var _raw_states := {}
var _display_states := {}
var _selected_node_id := NODE_L01
var _current_node_id := NODE_L01
var _last_completed_node_id := ""
var _node_buttons := {}
var _title_label: Label
var _hint_label: Label
var _status_label: Label
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

static func node_combat_goal(node_id: String) -> String:
	return String(node_def(node_id).get("combat_goal", "작전 지점을 확인하세요"))

static func node_sortie_notice(node_id: String) -> String:
	return String(node_def(node_id).get("sortie_notice", "R01 주택가 진입"))

static func node_blockout_phrase(node_id: String) -> String:
	return String(node_def(node_id).get("blockout_phrase", "R01 주택가 작전 지점"))

static func node_blockout_variant(node_id: String) -> String:
	return String(node_def(node_id).get("blockout_variant", "first_visit"))

static func state_label(state: String) -> String:
	return String(STATUS_LABELS.get(state, state))

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

func build() -> void:
	if _built:
		return
	_built = true
	set_anchors_preset(Control.PRESET_FULL_RECT)
	mouse_filter = Control.MOUSE_FILTER_STOP
	visible = false

	_title_label = _make_label(Vector2(20, 12), Vector2(300, 18), 13, C.INK)
	_title_label.text = "광고화된 주택가 작전도"
	add_child(_title_label)

	_hint_label = _make_label(Vector2(20, 30), Vector2(276, 24), 9, Color("#433227"))
	_hint_label.text = "보급소 게시판에서 다음 진입 지점을 고릅니다. 1-5 선택, Enter 출격, Esc 복귀"
	_hint_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_hint_label)

	_status_label = _make_label(Vector2(318, 20), Vector2(134, 94), 9, C.INK)
	_status_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_status_label)

	_description_label = _make_label(Vector2(20, 220), Vector2(292, 32), 10, C.INK)
	_description_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(_description_label)

	for i in range(NODE_IDS.size()):
		var node_id := String(NODE_IDS[i])
		var button := Button.new()
		var pos: Vector2 = node_def(node_id).get("ui_pos", Vector2.ZERO)
		button.position = pos - Vector2(48, 16)
		button.size = Vector2(96, 32)
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
	_sortie_button.position = Vector2(322, 224)
	_sortie_button.size = Vector2(72, 24)
	_sortie_button.text = "출격"
	_sortie_button.add_theme_font_size_override("font_size", 10)
	_sortie_button.add_theme_color_override("font_color", C.INK)
	_sortie_button.pressed.connect(_on_sortie_button_pressed)
	_apply_font(_sortie_button)
	add_child(_sortie_button)

	_close_button = Button.new()
	_close_button.position = Vector2(400, 224)
	_close_button.size = Vector2(52, 24)
	_close_button.text = "복귀"
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
	_refresh_controls()
	queue_redraw()

func hide_map() -> void:
	visible = false

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
		button.text = "%d %s\n%s" % [i + 1, String(definition["name"]), state_label(display_state)]
		button.tooltip_text = "%s: %s" % [String(definition["name"]), String(definition["description"])]
		_apply_button_state_style(button, display_state, selectable)

	var selected_def := node_def(_selected_node_id)
	var selected_raw_state := String(_raw_states.get(_selected_node_id, STATE_LOCKED))
	var can_sortie := is_state_selectable(selected_raw_state)
	_description_label.text = "%s: %s" % [String(selected_def["name"]), String(selected_def["description"])]
	_sortie_button.disabled = not can_sortie
	_sortie_button.text = "출격" if can_sortie else "잠김"
	_apply_button_state_style(_sortie_button, STATE_SELECTED if can_sortie else STATE_LOCKED, can_sortie)
	_apply_button_state_style(_close_button, STATE_AVAILABLE, true)

	var current_name := node_name(_current_node_id)
	var selected_name := node_name(_selected_node_id)
	var completed_name := "없음" if _last_completed_node_id == "" else node_name(_last_completed_node_id)
	_status_label.text = "현재 진입: %s\n선택 지점: %s\n최근 완료: %s\n상태: %s" % [
		current_name,
		selected_name,
		completed_name,
		state_label(selected_raw_state),
	]

func _draw() -> void:
	if not visible:
		return
	var rect := Rect2(Vector2(8, 8), Vector2(464, 254))
	draw_rect(rect, Color("#f5f0dc"))
	draw_rect(rect, Color("#433227"), false, 3.0)
	draw_rect(Rect2(Vector2(16, 58), Vector2(284, 154)), Color(0.72, 0.84, 0.78, 0.16))
	draw_rect(Rect2(Vector2(312, 16), Vector2(146, 106)), Color(1.0, 0.97, 0.86, 0.84))
	draw_rect(Rect2(Vector2(16, 216), Vector2(442, 40)), Color(1.0, 0.97, 0.86, 0.88))
	_draw_suburb_texture()
	_draw_edges()
	_draw_node_marks()
	_draw_selected_route()

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
		color.a = 0.24 if state == STATE_LOCKED else 0.50
		var width := 7.0 if state != STATE_LOCKED else 4.0
		if to_id == NODE_L05:
			color = Color(0.95, 0.54, 0.78, 0.28 if state != STATE_LOCKED else 0.12)
		draw_line(a, b, color, width)
		draw_line(a, b, Color(0.28, 0.20, 0.17, 0.32), 1.4)
		var dir := (b - a).normalized()
		var mid := a.lerp(b, 0.54)
		draw_line(mid - dir.rotated(PI * 0.5) * 7.0, mid + dir * 16.0, Color(1.0, 0.92, 0.48, 0.38), 1.8)

func _draw_node_marks() -> void:
	for node_id in NODE_IDS:
		var id := String(node_id)
		var pos: Vector2 = node_def(id).get("ui_pos", Vector2.ZERO)
		var state := String(_display_states.get(id, STATE_LOCKED))
		var color := _state_color(state)
		var pulse := 1.0
		if state == STATE_SELECTED or state == STATE_BOSS_READY or state == STATE_DANGER:
			pulse += 0.08 * sin(float(Time.get_ticks_msec()) * 0.006)
		draw_circle(pos, 22.0 * pulse, Color(color.r, color.g, color.b, 0.18))
		draw_arc(pos, 24.0 * pulse, 0.0, TAU, 36, Color(color.r, color.g, color.b, 0.86), 2.0)
		draw_circle(pos, 5.0, Color(color.r, color.g, color.b, 0.92))
		var short_line := String(node_def(id).get("short_description", "작전 지점"))
		draw_string(UIFont.get_font(), pos + Vector2(-44, 31), short_line, HORIZONTAL_ALIGNMENT_CENTER, 88, 7, Color("#433227"))

func _draw_selected_route() -> void:
	if _selected_node_id == "":
		return
	var pos: Vector2 = node_def(_selected_node_id).get("ui_pos", Vector2.ZERO)
	draw_arc(pos, 33.0, -PI * 0.2, PI * 1.25, 40, C.NEON_RED, 2.4)

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
	var fill := Color("#e4d9c3")
	var border := Color("#6b5b4a")
	if selectable:
		var state_color := _state_color(state)
		fill = Color(state_color.r, state_color.g, state_color.b, 0.34)
		border = Color(state_color.r, state_color.g, state_color.b, 0.90)
	button.add_theme_stylebox_override("normal", _button_style(fill, border, 2 if selectable else 1))
	button.add_theme_stylebox_override("hover", _button_style(Color("#fff7df"), border, 2))
	button.add_theme_stylebox_override("pressed", _button_style(C.LEMON_YELLOW, C.NEON_RED, 2))
	button.add_theme_stylebox_override("disabled", _button_style(Color("#ddd2bf"), Color("#746653"), 1))

func _button_style(fill_color: Color, border_color: Color, border_width: int) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill_color
	style.border_color = border_color
	style.set_border_width_all(border_width)
	style.set_corner_radius_all(3)
	style.content_margin_left = 4
	style.content_margin_right = 4
	style.content_margin_top = 3
	style.content_margin_bottom = 3
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
