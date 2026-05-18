extends RefCounted

const C := preload("res://scripts/game_config.gd")
const UIFont := preload("res://scripts/ui_font.gd")
const OutpostLayoutBlockout := preload("res://scripts/outpost_layout_blockout.gd")

var hud: CanvasLayer
var hp_bar: ColorRect
var charge_bar: ColorRect
var charge_weapon_label: Label
var charge_button: Label
var prompt_label: Label
var stat_label: Label
var route_goal_label: Label
var boss_panel: Panel
var boss_name_label: Label
var boss_bar: ColorRect
var boss_status_label: Label
var card_panel: Panel
var card_buttons: Array[Button] = []
var card_chosen_callback := Callable()
var result_panel: Panel
var result_label: Label
var restart_button: Button
var restart_callback := Callable()
var supply_panel: Panel
var outpost_visual_layer: Control
var supply_label: Label
var supply_scroll_hint_label: Label
var supply_restart_button: Button
var supply_list_scroll: ScrollContainer
var supply_button_list: VBoxContainer
var supply_upgrade_buttons: Array[Button] = []
var supply_upgrade_callback := Callable()
var supply_feedback_label: Label
var supply_footer_divider: ColorRect
var debug_panel: Panel
var debug_label: Label
var outpost_blockout := OutpostLayoutBlockout.new()

const FONT_TINY := 9
const FONT_SMALL := 10
const FONT_BODY := 11
const FONT_TITLE := 13

func _panel_style(fill_color: Color = C.AD_PAPER, border_color: Color = C.COCOA, border_width: int = 2, corner_radius: int = 4) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill_color
	style.border_color = border_color
	style.set_border_width_all(border_width)
	style.set_corner_radius_all(corner_radius)
	style.content_margin_left = 8
	style.content_margin_right = 8
	style.content_margin_top = 8
	style.content_margin_bottom = 8
	return style

func _button_style(fill_color: Color, border_width: int = 2) -> StyleBoxFlat:
	return _panel_style(fill_color, C.COCOA, border_width, 3)

func _supply_applied_style() -> StyleBoxFlat:
	return _panel_style(Color("#e9ffd8"), C.TOXIC_GREEN, 2, 3)

func _supply_buyable_style() -> StyleBoxFlat:
	return _panel_style(Color("#fff0b8"), C.NEON_RED, 2, 3)

func _supply_disabled_style() -> StyleBoxFlat:
	return _panel_style(Color("#e1d4bc"), Color("#8a7962"), 1, 3)

func _supply_locked_style() -> StyleBoxFlat:
	return _panel_style(Color("#d1c6b1"), Color("#6b5b4a"), 1, 3)

func _apply_font(control: Control) -> void:
	control.add_theme_font_override("font", UIFont.get_font())

func build(parent: Node) -> void:
	hud = CanvasLayer.new()
	hud.process_mode = Node.PROCESS_MODE_ALWAYS
	parent.add_child(hud)

	var root := Control.new()
	root.set_anchors_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_child(root)

	var hp_back := ColorRect.new()
	hp_back.color = C.COCOA
	hp_back.position = Vector2(10, 10)
	hp_back.size = Vector2(112, 9)
	root.add_child(hp_back)

	hp_bar = ColorRect.new()
	hp_bar.color = C.NEON_RED
	hp_bar.position = Vector2(11, 11)
	hp_bar.size = Vector2(110, 7)
	root.add_child(hp_bar)

	var charge_back := ColorRect.new()
	charge_back.color = C.COCOA
	charge_back.position = Vector2(10, 24)
	charge_back.size = Vector2(112, 8)
	root.add_child(charge_back)

	charge_bar = ColorRect.new()
	charge_bar.color = C.TOXIC_GREEN
	charge_bar.position = Vector2(11, 25)
	charge_bar.size = Vector2(0, 6)
	root.add_child(charge_bar)

	charge_weapon_label = Label.new()
	charge_weapon_label.position = Vector2(10, 35)
	charge_weapon_label.size = Vector2(112, 14)
	charge_weapon_label.clip_text = true
	charge_weapon_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	charge_weapon_label.add_theme_font_size_override("font_size", FONT_TINY)
	charge_weapon_label.add_theme_color_override("font_color", C.INK)
	charge_weapon_label.add_theme_color_override("font_shadow_color", C.AD_PAPER)
	charge_weapon_label.add_theme_constant_override("shadow_offset_x", 1)
	charge_weapon_label.add_theme_constant_override("shadow_offset_y", 1)
	_apply_font(charge_weapon_label)
	root.add_child(charge_weapon_label)

	charge_button = Label.new()
	charge_button.position = Vector2(362, 208)
	charge_button.size = Vector2(96, 44)
	charge_button.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	charge_button.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	charge_button.text = "차징\n대기중"
	charge_button.add_theme_font_size_override("font_size", FONT_SMALL)
	charge_button.add_theme_color_override("font_color", C.INK)
	_apply_font(charge_button)
	root.add_child(charge_button)

	stat_label = Label.new()
	stat_label.position = Vector2(130, 7)
	stat_label.size = Vector2(336, 13)
	stat_label.add_theme_font_size_override("font_size", FONT_SMALL)
	stat_label.add_theme_color_override("font_color", C.INK)
	stat_label.add_theme_color_override("font_shadow_color", C.AD_PAPER)
	stat_label.add_theme_constant_override("shadow_offset_x", 1)
	stat_label.add_theme_constant_override("shadow_offset_y", 1)
	_apply_font(stat_label)
	root.add_child(stat_label)

	route_goal_label = Label.new()
	route_goal_label.position = Vector2(128, 20)
	route_goal_label.size = Vector2(338, 24)
	route_goal_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	route_goal_label.clip_text = true
	route_goal_label.add_theme_font_size_override("font_size", FONT_TINY)
	route_goal_label.add_theme_color_override("font_color", Color("#433227"))
	route_goal_label.add_theme_color_override("font_shadow_color", C.AD_PAPER)
	route_goal_label.add_theme_constant_override("shadow_offset_x", 1)
	route_goal_label.add_theme_constant_override("shadow_offset_y", 1)
	route_goal_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	route_goal_label.visible = false
	_apply_font(route_goal_label)
	root.add_child(route_goal_label)

	boss_panel = Panel.new()
	boss_panel.position = Vector2(128, 22)
	boss_panel.size = Vector2(224, 29)
	boss_panel.add_theme_stylebox_override("panel", _panel_style(Color("#fff0cf"), C.COCOA, 2, 4))
	boss_panel.visible = false
	root.add_child(boss_panel)

	boss_name_label = Label.new()
	boss_name_label.position = Vector2(8, 2)
	boss_name_label.size = Vector2(100, 11)
	boss_name_label.text = "스마일 홈 시어머니"
	boss_name_label.add_theme_font_size_override("font_size", FONT_TINY)
	boss_name_label.add_theme_color_override("font_color", C.INK)
	_apply_font(boss_name_label)
	boss_panel.add_child(boss_name_label)

	var boss_back := ColorRect.new()
	boss_back.color = Color("#433227")
	boss_back.position = Vector2(8, 17)
	boss_back.size = Vector2(146, 6)
	boss_panel.add_child(boss_back)

	boss_bar = ColorRect.new()
	boss_bar.color = C.NEON_RED
	boss_bar.position = Vector2(9, 18)
	boss_bar.size = Vector2(144, 4)
	boss_panel.add_child(boss_bar)

	boss_status_label = Label.new()
	boss_status_label.position = Vector2(112, 2)
	boss_status_label.size = Vector2(104, 20)
	boss_status_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	boss_status_label.add_theme_font_size_override("font_size", FONT_TINY)
	boss_status_label.add_theme_color_override("font_color", C.INK)
	_apply_font(boss_status_label)
	boss_panel.add_child(boss_status_label)

	prompt_label = Label.new()
	prompt_label.position = Vector2(96, 230)
	prompt_label.size = Vector2(288, 16)
	prompt_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	prompt_label.add_theme_font_size_override("font_size", FONT_BODY)
	prompt_label.add_theme_color_override("font_color", C.INK)
	prompt_label.add_theme_color_override("font_shadow_color", C.AD_PAPER)
	prompt_label.add_theme_constant_override("shadow_offset_x", 1)
	prompt_label.add_theme_constant_override("shadow_offset_y", 1)
	prompt_label.visible = false
	_apply_font(prompt_label)
	root.add_child(prompt_label)

	card_panel = Panel.new()
	card_panel.position = Vector2(22, 45)
	card_panel.size = Vector2(436, 162)
	card_panel.add_theme_stylebox_override("panel", _panel_style(Color("#fff0cf")))
	card_panel.visible = false
	root.add_child(card_panel)

	var title := Label.new()
	title.position = Vector2(12, 8)
	title.size = Vector2(412, 18)
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.text = "레벨 업 보너스"
	title.add_theme_font_size_override("font_size", FONT_TITLE)
	title.add_theme_color_override("font_color", C.INK)
	_apply_font(title)
	card_panel.add_child(title)

	for i in range(3):
		var button := Button.new()
		button.position = Vector2(12 + i * 140, 32)
		button.size = Vector2(132, 118)
		button.clip_text = true
		button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.add_theme_font_size_override("font_size", FONT_SMALL)
		button.add_theme_color_override("font_color", C.INK)
		_apply_font(button)
		button.add_theme_stylebox_override("normal", _button_style(Color("#fff7df")))
		button.add_theme_stylebox_override("hover", _button_style(Color("#ffe7a8")))
		button.add_theme_stylebox_override("pressed", _button_style(C.LEMON_YELLOW, 3))
		button.add_theme_stylebox_override("focus", _button_style(Color(1, 1, 1, 0), 1))
		button.pressed.connect(_on_card_button_pressed.bind(i))
		card_panel.add_child(button)
		card_buttons.append(button)

	result_panel = Panel.new()
	result_panel.position = Vector2(90, 36)
	result_panel.size = Vector2(300, 198)
	result_panel.add_theme_stylebox_override("panel", _panel_style(Color("#fff0cf"), C.COCOA, 3, 5))
	result_panel.visible = false
	root.add_child(result_panel)

	result_label = Label.new()
	result_label.position = Vector2(16, 12)
	result_label.size = Vector2(268, 132)
	result_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	result_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	result_label.add_theme_font_size_override("font_size", FONT_BODY)
	result_label.add_theme_color_override("font_color", C.INK)
	_apply_font(result_label)
	result_panel.add_child(result_label)

	restart_button = Button.new()
	restart_button.position = Vector2(34, 154)
	restart_button.size = Vector2(232, 30)
	restart_button.text = "스페이스 / 클릭으로 다시 시작"
	restart_button.add_theme_font_size_override("font_size", FONT_BODY)
	restart_button.add_theme_color_override("font_color", C.INK)
	_apply_font(restart_button)
	restart_button.add_theme_stylebox_override("normal", _button_style(Color("#fff7df")))
	restart_button.add_theme_stylebox_override("hover", _button_style(Color("#ffe7a8")))
	restart_button.add_theme_stylebox_override("pressed", _button_style(C.LEMON_YELLOW, 3))
	restart_button.pressed.connect(_on_restart_button_pressed)
	result_panel.add_child(restart_button)

	supply_panel = Panel.new()
	supply_panel.position = Vector2(8, 10)
	supply_panel.size = Vector2(464, 246)
	supply_panel.add_theme_stylebox_override("panel", _panel_style(Color("#f5f0dc"), Color("#433227"), 3, 5))
	supply_panel.visible = false
	root.add_child(supply_panel)

	outpost_visual_layer = Control.new()
	outpost_visual_layer.position = Vector2.ZERO
	outpost_visual_layer.size = supply_panel.size
	outpost_visual_layer.mouse_filter = Control.MOUSE_FILTER_IGNORE
	supply_panel.add_child(outpost_visual_layer)
	outpost_blockout.build_preview_layer(outpost_visual_layer, {}, null, false)

	supply_label = Label.new()
	supply_label.position = Vector2(14, 8)
	supply_label.size = Vector2(436, 80)
	supply_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	supply_label.clip_text = true
	supply_label.add_theme_font_size_override("font_size", FONT_TINY)
	supply_label.add_theme_color_override("font_color", C.INK)
	_apply_font(supply_label)
	supply_panel.add_child(supply_label)

	supply_scroll_hint_label = Label.new()
	supply_scroll_hint_label.position = Vector2(14, 92)
	supply_scroll_hint_label.size = Vector2(436, 12)
	supply_scroll_hint_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	supply_scroll_hint_label.clip_text = true
	supply_scroll_hint_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	supply_scroll_hint_label.add_theme_font_size_override("font_size", FONT_TINY)
	supply_scroll_hint_label.add_theme_color_override("font_color", Color("#433227"))
	supply_scroll_hint_label.add_theme_color_override("font_shadow_color", C.AD_PAPER)
	supply_scroll_hint_label.add_theme_constant_override("shadow_offset_x", 1)
	supply_scroll_hint_label.add_theme_constant_override("shadow_offset_y", 1)
	_apply_font(supply_scroll_hint_label)
	supply_panel.add_child(supply_scroll_hint_label)

	supply_list_scroll = ScrollContainer.new()
	supply_list_scroll.position = Vector2(14, 106)
	supply_list_scroll.size = Vector2(436, 82)
	supply_list_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	supply_list_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	supply_list_scroll.follow_focus = true
	supply_panel.add_child(supply_list_scroll)

	supply_button_list = VBoxContainer.new()
	supply_button_list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	supply_button_list.add_theme_constant_override("separation", 3)
	supply_list_scroll.add_child(supply_button_list)

	supply_feedback_label = Label.new()
	supply_feedback_label.position = Vector2(16, 190)
	supply_feedback_label.size = Vector2(432, 18)
	supply_feedback_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	supply_feedback_label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	supply_feedback_label.add_theme_font_size_override("font_size", FONT_SMALL)
	supply_feedback_label.add_theme_color_override("font_color", C.NEON_RED)
	supply_feedback_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	supply_feedback_label.clip_text = true
	supply_feedback_label.visible = false
	_apply_font(supply_feedback_label)
	supply_panel.add_child(supply_feedback_label)

	supply_footer_divider = ColorRect.new()
	supply_footer_divider.position = Vector2(14, 215)
	supply_footer_divider.size = Vector2(436, 1)
	supply_footer_divider.color = Color("#8a7962")
	supply_panel.add_child(supply_footer_divider)

	supply_restart_button = Button.new()
	supply_restart_button.position = Vector2(98, 218)
	supply_restart_button.size = Vector2(268, 20)
	supply_restart_button.add_theme_font_size_override("font_size", FONT_SMALL)
	supply_restart_button.add_theme_color_override("font_color", C.INK)
	_apply_font(supply_restart_button)
	supply_restart_button.add_theme_stylebox_override("normal", _button_style(Color("#fff7df")))
	supply_restart_button.add_theme_stylebox_override("hover", _button_style(Color("#ffe7a8")))
	supply_restart_button.add_theme_stylebox_override("pressed", _button_style(C.LEMON_YELLOW, 3))
	supply_restart_button.pressed.connect(_on_restart_button_pressed)
	supply_panel.add_child(supply_restart_button)

	debug_panel = Panel.new()
	debug_panel.position = Vector2(8, 10)
	debug_panel.size = Vector2(464, 248)
	debug_panel.visible = false
	root.add_child(debug_panel)

	debug_label = Label.new()
	debug_label.position = Vector2(8, 6)
	debug_label.size = Vector2(448, 236)
	debug_label.add_theme_font_size_override("font_size", 7)
	debug_label.add_theme_color_override("font_color", C.INK)
	debug_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_apply_font(debug_label)
	debug_panel.add_child(debug_label)

func update(player_hp: float, max_hp: float, charge_window_left: float, charge_timer: float, charge_period: float, charge_window_duration: float, charge_state: String, elapsed: float, match_duration: float, level: int, kills: int, enemy_count: int, paused_for_card: bool, game_over: bool, notice_text: String, route_stage_text: String = "", route_goal_text: String = "", charge_weapon_name: String = "") -> void:
	hp_bar.size.x = 110.0 * clampf(player_hp / max_hp, 0.0, 1.0)
	var charge_ratio := charge_window_left / charge_window_duration if charge_window_left > 0.0 else charge_timer / charge_period
	charge_bar.size.x = clampf(charge_ratio, 0.0, 1.0) * 110.0
	match charge_state:
		"open":
			charge_bar.color = C.VITAMIN_YELLOW
		"warning":
			charge_bar.color = C.NEON_RED
		"missed":
			charge_bar.color = Color(0.35, 0.70, 0.95)
		_:
			charge_bar.color = C.TOXIC_GREEN
	charge_button.modulate = Color.WHITE
	match charge_state:
		"open":
			charge_button.text = "지금!\n클릭/스페이스"
			charge_button.add_theme_color_override("font_color", C.NEON_RED)
			charge_button.modulate = Color(1.0, 0.96, 0.72, 1.0)
		"warning":
			charge_button.text = "곧 열림\n%.1f초" % maxf(0.0, charge_period - charge_timer)
			charge_button.add_theme_color_override("font_color", C.NEON_RED)
			charge_button.modulate = Color(1.0, 0.9, 0.82, 1.0)
		"missed":
			charge_button.text = "놓침\n재충전"
			charge_button.add_theme_color_override("font_color", Color(0.2, 0.42, 0.72))
		_:
			charge_button.text = "차징\n%.1f초" % maxf(0.0, charge_period - charge_timer)
			charge_button.add_theme_color_override("font_color", C.INK)
	charge_weapon_label.text = "무기 %s" % charge_weapon_name
	charge_weapon_label.visible = charge_weapon_name != "" and not _blocking_panel_visible()
	stat_label.text = "%03d/%03d  Lv%d  K%d  E%d" % [int(elapsed), int(match_duration), level, kills, enemy_count]
	var route_text := route_stage_text
	if route_goal_text != "":
		route_text = route_goal_text
	route_goal_label.visible = route_text != "" and not paused_for_card and not game_over and not _blocking_panel_visible()
	route_goal_label.text = route_text
	if notice_text != "" and not paused_for_card and not game_over and not _blocking_panel_visible():
		prompt_label.visible = true
		prompt_label.text = notice_text
	elif charge_state == "open" and not paused_for_card and not _blocking_panel_visible():
		prompt_label.visible = true
		prompt_label.text = "차징 윈도우: 포인터로 조준하고 클릭/탭"
	elif charge_state == "warning" and not paused_for_card and not _blocking_panel_visible():
		prompt_label.visible = true
		prompt_label.text = "차징 준비: 곧 누를 타이밍"
	elif charge_state == "missed" and not paused_for_card and not _blocking_panel_visible():
		prompt_label.visible = true
		prompt_label.text = "차징 만료"
	elif not game_over and not paused_for_card and not _blocking_panel_visible():
		prompt_label.visible = false

func update_boss(active: bool, boss_name: String, hp_ratio: float, status_text: String, defense_type: String) -> void:
	boss_panel.visible = active
	if active:
		route_goal_label.visible = false
	if not active:
		return
	boss_name_label.text = boss_name
	boss_bar.size.x = 144.0 * clampf(hp_ratio, 0.0, 1.0)
	match defense_type:
		"anti_auto":
			boss_bar.color = Color("#8a5a3f")
		"anti_charge":
			boss_bar.color = Color(0.35, 0.70, 0.95)
		"exposed_core":
			boss_bar.color = C.TOXIC_GREEN
		_:
			boss_bar.color = C.NEON_RED if hp_ratio > 0.25 else C.VITAMIN_YELLOW
	boss_status_label.text = "%d%%\n%s" % [int(round(hp_ratio * 100.0)), status_text]

func show_game_over() -> void:
	prompt_label.text = "게임 오버  -  스페이스 / 클릭으로 다시 시작"
	prompt_label.visible = true

func show_level_cards(cards: Array[Dictionary], chosen_callback: Callable) -> void:
	card_chosen_callback = chosen_callback
	for i in range(card_buttons.size()):
		var button := card_buttons[i]
		if i < cards.size():
			var card := cards[i]
			button.visible = true
			button.disabled = false
			var weapon_hint := String(card.get("weapon_hint", ""))
			button.add_theme_font_size_override("font_size", FONT_TINY if weapon_hint != "" else FONT_SMALL)
			var effect_text := String(card["effect_text"])
			if weapon_hint != "":
				effect_text = "%s\n%s" % [effect_text, weapon_hint]
			button.text = "%d\n%s\n%s" % [i + 1, card["name"], effect_text]
		else:
			button.visible = false
			button.disabled = true
	card_panel.visible = true
	prompt_label.visible = true
	prompt_label.text = "레벨 업  -  1/2/3 또는 카드 클릭"

func hide_level_card() -> void:
	card_panel.visible = false
	prompt_label.visible = false
	card_chosen_callback = Callable()

func show_result_screen(result_data: Dictionary, chosen_callback: Callable) -> void:
	restart_callback = chosen_callback
	card_panel.visible = false
	card_chosen_callback = Callable()
	supply_panel.visible = false
	_set_supply_buttons_visible(false)
	supply_feedback_label.visible = false
	supply_upgrade_callback = Callable()
	result_panel.position = Vector2(58, 28)
	result_panel.size = Vector2(364, 214)
	result_panel.add_theme_stylebox_override("panel", _panel_style(Color("#fff0cf"), C.COCOA, 3, 5))
	result_label.position = Vector2(16, 12)
	result_label.size = Vector2(332, 150)
	restart_button.position = Vector2(50, 172)
	restart_button.size = Vector2(264, 28)
	result_panel.visible = true
	prompt_label.visible = false
	var description := str(result_data.get("description", ""))
	var trace := str(result_data.get("trace", ""))
	var extra_lines := ""
	if description != "":
		extra_lines += "\n%s" % description
	if trace != "":
		extra_lines += "\n획득한 흔적  %s" % trace
	for line in Array(result_data.get("progress_lines", [])):
		extra_lines += "\n%s" % str(line)
	prompt_label.text = str(result_data.get("prompt", "스페이스 / 클릭으로 다시 시작"))
	restart_button.text = str(result_data.get("button_text", "스페이스 / 클릭으로 다시 시작"))
	var result_title := str(result_data.get("result", ""))
	result_label.add_theme_font_size_override("font_size", FONT_SMALL if result_title == "긴급 회수" or result_title == "신호 과부하 회수" or result_title == "신호 과부하 강제 회수" else FONT_BODY)
	result_label.text = "%s\n생존 시간  %03d / %03d\n레벨  %d\n처치  %d\n선택 카드  %d\n최고 적 수  %d\n최종 적 수  %d%s" % [
		result_data["result"],
		int(result_data["survival_time"]),
		int(C.MATCH_DURATION),
		int(result_data["level"]),
		int(result_data["kills"]),
		int(result_data["card_count"]),
		int(result_data["peak_enemy_count"]),
		int(result_data["final_enemy_count"]),
		extra_lines,
	]

func show_supply_depot(meta_progression, upgrade_callback: Callable, sortie_callback: Callable, applied_upgrade_name: String = "", session_progress: Dictionary = {}) -> void:
	restart_callback = sortie_callback
	supply_upgrade_callback = upgrade_callback
	card_panel.visible = false
	card_chosen_callback = Callable()
	result_panel.visible = false
	supply_panel.visible = true
	var outpost_state := outpost_blockout.build_preview_layer(outpost_visual_layer, session_progress, meta_progression, false)
	prompt_label.visible = false
	prompt_label.text = "스페이스 / 클릭으로 다시 출격"
	supply_restart_button.text = "재출격 - 강화 적용 후 출격" if meta_progression.has_any_upgrade() else "재출격 - 선택 없이 출격"
	var board_text := "%s / 보스 신호 %s" % [
		str(session_progress.get("route_stage_label", "출격 기록: %d회" % int(session_progress.get("sortie_index", 1)))),
		str(session_progress.get("boss_signal_label", "없음")),
	]
	var route_ready_text := "스마일 홈 중심 결절 노출\n송출관 접근 절차가 열리고 있습니다" if bool(session_progress.get("boss_route_ready", false)) else ""
	var boss_hint: String = meta_progression.boss_hint()
	if route_ready_text != "":
		boss_hint = route_ready_text
	var outpost_lines := outpost_blockout.natural_summary_lines(outpost_state)
	supply_label.text = "침묵 보급소\n%s\n지역 반응: %s\n게시판: %s\n다음 목표: %s\n%s\n구매: 1/2/3/4키 또는 버튼 클릭" % [
		_supply_currency_text(meta_progression),
		str(session_progress.get("r01_outpost_phrase", meta_progression.smile_home_boss_outcome_label())),
		board_text,
		str(session_progress.get("next_objective_short", session_progress.get("next_objective", "재출격"))),
		str(outpost_lines[1]),
	]
	var upgrades: Array = meta_progression.upgrade_defs()
	supply_scroll_hint_label.text = "강화 목록 %d개 - 휠/드래그로 아래 항목 보기 - %s" % [upgrades.size(), boss_hint]
	supply_feedback_label.visible = true
	if applied_upgrade_name != "":
		supply_feedback_label.add_theme_color_override("font_color", C.TOXIC_GREEN)
		supply_feedback_label.text = "강화 적용: %s" % applied_upgrade_name
	elif meta_progression.trace_count() > 0 or meta_progression.trace_count("campaign_core_fragment") > 0:
		supply_feedback_label.add_theme_color_override("font_color", C.INK)
		supply_feedback_label.text = "[선택 가능] 항목을 구매하거나 아래 재출격 버튼을 누르세요."
	else:
		supply_feedback_label.add_theme_color_override("font_color", Color("#6b5b4a"))
		supply_feedback_label.text = "남은 흔적이 없습니다. 아래 재출격 버튼으로 다시 나갑니다."
	_ensure_supply_button_count(upgrades.size())
	for i in range(supply_upgrade_buttons.size()):
		var button := supply_upgrade_buttons[i]
		if i >= upgrades.size():
			button.visible = false
			continue
		var upgrade: Dictionary = upgrades[i]
		var can_buy: bool = meta_progression.can_buy(String(upgrade["id"]))
		var unlocked: bool = meta_progression.is_unlocked(String(upgrade["id"]))
		var level: int = meta_progression.upgrade_level(String(upgrade["id"]))
		var max_level := int(upgrade.get("max_level", 1))
		button.visible = true
		button.disabled = not can_buy
		button.custom_minimum_size = Vector2(416, 42)
		button.add_theme_font_size_override("font_size", FONT_TINY)
		button.add_theme_color_override("font_color", C.INK if can_buy else Color("#6b5b4a"))
		var normal_style := _button_style(Color("#fff7df"))
		var hover_style := _button_style(Color("#ffe7a8"))
		var disabled_style := _supply_disabled_style()
		if can_buy:
			normal_style = _supply_buyable_style()
			hover_style = _button_style(C.LEMON_YELLOW, 3)
		elif level >= max_level:
			normal_style = _supply_applied_style()
			disabled_style = _supply_applied_style()
		elif not unlocked:
			disabled_style = _supply_locked_style()
		button.add_theme_stylebox_override("normal", normal_style)
		button.add_theme_stylebox_override("hover", hover_style)
		button.add_theme_stylebox_override("disabled", disabled_style)
		var state_text := "최대" if level >= max_level else ("선택 가능" if can_buy else ("잠김" if not unlocked else "흔적 부족"))
		var applied_text := " 적용됨" if level > 0 else ""
		var unlock_text := ""
		if not unlocked:
			unlock_text = " | 해금: %s" % meta_progression.unlock_condition_label(str(upgrade.get("unlock_condition", "")))
		var trace_label := str(upgrade.get("trace_label", "전단"))
		var input_hint := "키%d/클릭" % [i + 1] if i < 4 else "클릭"
		var buy_marker := ">> " if can_buy else ""
		button.text = "%s%s. %s  [%s] Lv%d/%d%s\n%s  비용 %d %s  %s%s" % [
			buy_marker,
			i + 1,
			upgrade["name"],
			state_text,
			level,
			max_level,
			applied_text,
			input_hint,
			int(upgrade["cost"]),
			trace_label,
			upgrade["effect_text"],
			unlock_text,
		]

func hide_result_screen() -> void:
	result_panel.add_theme_stylebox_override("panel", _panel_style(Color("#fff0cf"), C.COCOA, 3, 5))
	result_panel.visible = false
	supply_panel.visible = false
	restart_callback = Callable()
	supply_upgrade_callback = Callable()
	_set_supply_buttons_visible(false)
	supply_feedback_label.visible = false

func set_debug_text(text: String) -> void:
	if text == "":
		debug_panel.visible = false
		debug_label.text = ""
		return
	debug_label.text = text
	debug_panel.visible = true

func _on_card_button_pressed(index: int) -> void:
	if card_chosen_callback.is_valid():
		card_chosen_callback.call(index)

func _on_restart_button_pressed() -> void:
	if restart_callback.is_valid():
		restart_callback.call()

func _on_supply_upgrade_button_pressed(index: int) -> void:
	if supply_upgrade_callback.is_valid():
		supply_upgrade_callback.call(index)

func _ensure_supply_button_count(count: int) -> void:
	while supply_upgrade_buttons.size() < count:
		var index := supply_upgrade_buttons.size()
		var supply_button := Button.new()
		supply_button.clip_text = true
		supply_button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		supply_button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		supply_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		supply_button.custom_minimum_size = Vector2(416, 42)
		supply_button.add_theme_font_size_override("font_size", FONT_TINY)
		supply_button.add_theme_color_override("font_color", C.INK)
		_apply_font(supply_button)
		supply_button.add_theme_stylebox_override("normal", _button_style(Color("#fff7df")))
		supply_button.add_theme_stylebox_override("hover", _button_style(Color("#ffe7a8")))
		supply_button.add_theme_stylebox_override("pressed", _button_style(C.LEMON_YELLOW, 3))
		supply_button.add_theme_stylebox_override("disabled", _supply_disabled_style())
		supply_button.pressed.connect(_on_supply_upgrade_button_pressed.bind(index))
		supply_button.visible = false
		supply_button_list.add_child(supply_button)
		supply_upgrade_buttons.append(supply_button)

func _supply_currency_text(meta_progression) -> String:
	return "보유 흔적: 전단 %d개 | 코어 파편 %d개 | %s" % [
		meta_progression.trace_count(),
		meta_progression.trace_count("campaign_core_fragment"),
		meta_progression.signal_clue_summary(),
	]

func _set_supply_buttons_visible(visible: bool) -> void:
	for button in supply_upgrade_buttons:
		button.visible = visible
		if not visible:
			button.disabled = true

func _blocking_panel_visible() -> bool:
	return result_panel.visible or supply_panel.visible

func reset() -> void:
	prompt_label.visible = false
	boss_panel.visible = false
	card_panel.visible = false
	card_chosen_callback = Callable()
	hide_result_screen()
