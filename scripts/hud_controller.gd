extends RefCounted

const C := preload("res://scripts/game_config.gd")

var hud: CanvasLayer
var hp_bar: ColorRect
var charge_bar: ColorRect
var charge_button: Label
var prompt_label: Label
var stat_label: Label
var card_panel: Panel
var card_buttons: Array[Button] = []
var card_chosen_callback := Callable()

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

	charge_button = Label.new()
	charge_button.position = Vector2(362, 208)
	charge_button.size = Vector2(96, 44)
	charge_button.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	charge_button.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	charge_button.text = "차징\n대기중"
	charge_button.add_theme_color_override("font_color", C.INK)
	root.add_child(charge_button)

	stat_label = Label.new()
	stat_label.position = Vector2(132, 7)
	stat_label.add_theme_color_override("font_color", C.INK)
	root.add_child(stat_label)

	prompt_label = Label.new()
	prompt_label.position = Vector2(118, 226)
	prompt_label.add_theme_color_override("font_color", C.INK)
	prompt_label.add_theme_color_override("font_shadow_color", C.AD_PAPER)
	prompt_label.add_theme_constant_override("shadow_offset_x", 1)
	prompt_label.add_theme_constant_override("shadow_offset_y", 1)
	prompt_label.visible = false
	root.add_child(prompt_label)

	card_panel = Panel.new()
	card_panel.position = Vector2(34, 54)
	card_panel.size = Vector2(412, 150)
	card_panel.visible = false
	root.add_child(card_panel)

	var title := Label.new()
	title.position = Vector2(12, 8)
	title.size = Vector2(388, 18)
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.text = "레벨 업 보너스"
	title.add_theme_color_override("font_color", C.INK)
	card_panel.add_child(title)

	for i in range(3):
		var button := Button.new()
		button.position = Vector2(12 + i * 132, 32)
		button.size = Vector2(124, 106)
		button.clip_text = true
		button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		button.alignment = HORIZONTAL_ALIGNMENT_CENTER
		button.add_theme_color_override("font_color", C.INK)
		button.pressed.connect(_on_card_button_pressed.bind(i))
		card_panel.add_child(button)
		card_buttons.append(button)

func update(player_hp: float, max_hp: float, charge_window_left: float, charge_timer: float, charge_period: float, charge_state: String, elapsed: float, level: int, kills: int, enemy_count: int, paused_for_card: bool, game_over: bool) -> void:
	hp_bar.size.x = 110.0 * clampf(player_hp / max_hp, 0.0, 1.0)
	var charge_ratio := charge_window_left / C.CHARGE_WINDOW if charge_window_left > 0.0 else charge_timer / charge_period
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
	stat_label.text = "시간 %03d   레벨 %d   처치 %d   적 %d" % [int(elapsed), level, kills, enemy_count]
	if charge_state == "open" and not paused_for_card:
		prompt_label.visible = true
		prompt_label.text = "차징 윈도우: 포인터로 조준하고 클릭/탭"
	elif charge_state == "warning" and not paused_for_card:
		prompt_label.visible = true
		prompt_label.text = "차징 준비: 곧 누를 타이밍"
	elif charge_state == "missed" and not paused_for_card:
		prompt_label.visible = true
		prompt_label.text = "차징 만료"
	elif not game_over and not paused_for_card:
		prompt_label.visible = false

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
			button.text = "%d\n%s\n\n%s\n%s" % [i + 1, card["name"], card["description"], card["effect_text"]]
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

func _on_card_button_pressed(index: int) -> void:
	if card_chosen_callback.is_valid():
		card_chosen_callback.call(index)

func reset() -> void:
	prompt_label.visible = false
	card_panel.visible = false
	card_chosen_callback = Callable()
