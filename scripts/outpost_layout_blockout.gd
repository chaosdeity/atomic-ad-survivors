extends RefCounted

const C := preload("res://scripts/game_config.gd")
const UIFont := preload("res://scripts/ui_font.gd")

const WORLD_BOUNDS := Rect2(Vector2(0, 0), Vector2(1440, 810))
const EXPANSION_BOUNDS_NOTE := "0.2 preview uses 1440x810; later hub scenes can expand to 1920x1080+."

const COLLISION_HARD := "hard_blocker"
const COLLISION_SOFT := "soft_blocker"
const COLLISION_INTERACTION := "interaction_anchor"
const COLLISION_DECORATIVE := "decorative"
const COLLISION_EXIT := "exit_trigger"

const STATE_DORMANT := "dormant"
const STATE_FIRST_RECALL := "first_recall"
const STATE_BROADCAST_RECORD_1 := "broadcast_record_1"
const STATE_BROADCAST_RECORD_2 := "broadcast_record_2"
const STATE_BROADCAST_RECORD_3 := "broadcast_record_3"
const STATE_BOSS_ANALYSIS_1 := "boss_analysis_1"
const STATE_BOSS_ANALYSIS_2 := "boss_analysis_2"
const STATE_BOSS_ANALYSIS_3 := "boss_analysis_3"
const STATE_BOSS_CLEARED := "boss_cleared"
const STATE_DESTROY_NODE := "destroy_node"
const STATE_EXTRACT_MEMORY := "extract_memory"
const NORMAL_ALPHA_SCALE := 0.42
const NORMAL_LINE_ALPHA_SCALE := 0.34
const NORMAL_LABEL_ALPHA_SCALE := 0.18

const FACILITIES := [
	{
		"id": "recovery_platform",
		"display_name": "회수 플랫폼",
		"bounds": Rect2(Vector2(570, 330), Vector2(300, 165)),
		"interaction_anchor": Vector2(720, 500),
		"body_collision": COLLISION_DECORATIVE,
		"role": "return point / central clear path",
	},
	{
		"id": "settlement_counter",
		"display_name": "정산 카운터",
		"bounds": Rect2(Vector2(120, 520), Vector2(300, 120)),
		"interaction_anchor": Vector2(280, 670),
		"body_collision": COLLISION_HARD,
		"role": "result settlement / flyer and core tray",
	},
	{
		"id": "maintenance_bench",
		"display_name": "정비대",
		"bounds": Rect2(Vector2(970, 415), Vector2(280, 115)),
		"interaction_anchor": Vector2(1090, 555),
		"body_collision": COLLISION_HARD,
		"role": "scanner and basic upgrade anchor",
	},
	{
		"id": "name_archive",
		"display_name": "이름 보관함",
		"bounds": Rect2(Vector2(960, 150), Vector2(250, 190)),
		"interaction_anchor": Vector2(1085, 370),
		"body_collision": COLLISION_HARD,
		"role": "trace slots / boss analysis memory wall",
	},
	{
		"id": "sortie_board",
		"display_name": "출격 게시판",
		"bounds": Rect2(Vector2(455, 75), Vector2(430, 155)),
		"interaction_anchor": Vector2(670, 260),
		"body_collision": COLLISION_HARD,
		"role": "next objective / broadcast records",
	},
	{
		"id": "charging_tuner",
		"display_name": "차징 조율대",
		"bounds": Rect2(Vector2(920, 615), Vector2(270, 105)),
		"interaction_anchor": Vector2(1045, 748),
		"body_collision": COLLISION_HARD,
		"role": "charge timing / boss core waveform",
	},
	{
		"id": "trace_storage_room",
		"display_name": "흔적 보관실",
		"bounds": Rect2(Vector2(100, 205), Vector2(230, 145)),
		"interaction_anchor": Vector2(330, 295),
		"body_collision": COLLISION_SOFT,
		"role": "locked long-term trace room preview",
	},
	{
		"id": "closed_corridor",
		"display_name": "닫힌 통로",
		"bounds": Rect2(Vector2(1240, 105), Vector2(145, 285)),
		"interaction_anchor": Vector2(1235, 250),
		"body_collision": COLLISION_HARD,
		"role": "future hub expansion blocker",
	},
	{
		"id": "sortie_gate",
		"display_name": "출격 게이트",
		"bounds": Rect2(Vector2(585, 660), Vector2(270, 95)),
		"interaction_anchor": Vector2(720, 735),
		"body_collision": COLLISION_EXIT,
		"role": "redeploy trigger preview",
	},
]

func state_from_progress(progress: Dictionary, meta_progression) -> Dictionary:
	var signal_count := int(progress.get("signal_clue_count", 0))
	var boss_analysis := int(progress.get("boss_analysis_level", 0))
	var boss_clears := int(progress.get("boss_clear_count", 0))
	var outcome := String(progress.get("smile_home_boss_outcome", ""))
	var first_recall_seen := bool(progress.get("first_recall_done", false)) or int(progress.get("sortie_index", 1)) > 1
	if meta_progression != null:
		boss_analysis = int(meta_progression.boss_analysis_level)
		boss_clears = int(meta_progression.boss_clear_count)
		outcome = String(meta_progression.smile_home_boss_outcome)
		signal_count = int(meta_progression.signal_clue_count())
	var variant := STATE_DORMANT
	if outcome == STATE_DESTROY_NODE:
		variant = STATE_DESTROY_NODE
	elif outcome == STATE_EXTRACT_MEMORY:
		variant = STATE_EXTRACT_MEMORY
	elif boss_clears > 0:
		variant = STATE_BOSS_CLEARED
	elif boss_analysis >= 3:
		variant = STATE_BOSS_ANALYSIS_3
	elif boss_analysis == 2:
		variant = STATE_BOSS_ANALYSIS_2
	elif boss_analysis == 1:
		variant = STATE_BOSS_ANALYSIS_1
	elif signal_count >= 3:
		variant = STATE_BROADCAST_RECORD_3
	elif signal_count == 2:
		variant = STATE_BROADCAST_RECORD_2
	elif signal_count == 1:
		variant = STATE_BROADCAST_RECORD_1
	elif first_recall_seen:
		variant = STATE_FIRST_RECALL
	return {
		"variant": variant,
		"signal_record_count": clampi(signal_count, 0, 3),
		"boss_analysis_level": clampi(boss_analysis, 0, 3),
		"boss_clear_count": boss_clears,
		"outcome": outcome,
		"first_recall_seen": first_recall_seen,
	}

func build_preview_layer(parent: Control, progress: Dictionary, meta_progression, show_debug_labels: bool = false) -> Dictionary:
	for child in parent.get_children():
		parent.remove_child(child)
		child.free()
	parent.mouse_filter = Control.MOUSE_FILTER_IGNORE
	var state := state_from_progress(progress, meta_progression)
	var preview_size := parent.size
	var scale := minf(preview_size.x / WORLD_BOUNDS.size.x, preview_size.y / WORLD_BOUNDS.size.y)
	var world_px := WORLD_BOUNDS.size * scale
	var offset := (preview_size - world_px) * 0.5
	_draw_preview_ground(parent, offset, scale, state)
	_draw_corridors(parent, offset, scale, show_debug_labels)
	for facility in FACILITIES:
		_draw_facility(parent, facility, offset, scale, state, show_debug_labels)
	return state

func facility_count() -> int:
	return FACILITIES.size()

func active_collision_records(state: Dictionary = {}) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	for facility in FACILITIES:
		var facility_id := String(facility["id"])
		var bounds: Rect2 = facility["bounds"]
		records.append({
			"facility_id": facility_id,
			"display_name": String(facility["display_name"]),
			"collision_class": String(facility["body_collision"]),
			"interaction_anchor": Vector2(facility["interaction_anchor"]),
			"state_variant": facility_variant(facility_id, state),
			"world_bounds": bounds,
			"role": String(facility["role"]),
		})
		records.append({
			"facility_id": "%s.interaction" % facility_id,
			"display_name": "%s 앞" % String(facility["display_name"]),
			"collision_class": COLLISION_INTERACTION,
			"interaction_anchor": Vector2(facility["interaction_anchor"]),
			"state_variant": facility_variant(facility_id, state),
			"world_bounds": Rect2(Vector2(facility["interaction_anchor"]) - Vector2(24, 18), Vector2(48, 36)),
			"role": "interaction anchor preview",
		})
	return records

func collision_summary(state: Dictionary = {}) -> Dictionary:
	var summary := {
		COLLISION_HARD: 0,
		COLLISION_SOFT: 0,
		COLLISION_INTERACTION: 0,
		COLLISION_DECORATIVE: 0,
		COLLISION_EXIT: 0,
	}
	for record in active_collision_records(state):
		var collision_class := String(record.get("collision_class", COLLISION_DECORATIVE))
		summary[collision_class] = int(summary.get(collision_class, 0)) + 1
	return summary

func debug_lines(state: Dictionary = {}) -> Array[String]:
	var summary := collision_summary(state)
	var lines: Array[String] = [
		"outpost: variant=%s facilities=%d world=%.0fx%.0f" % [String(state.get("variant", STATE_DORMANT)), facility_count(), WORLD_BOUNDS.size.x, WORLD_BOUNDS.size.y],
		"outpost collision: hard=%d soft=%d interact=%d decor=%d exit=%d" % [
			int(summary.get(COLLISION_HARD, 0)),
			int(summary.get(COLLISION_SOFT, 0)),
			int(summary.get(COLLISION_INTERACTION, 0)),
			int(summary.get(COLLISION_DECORATIVE, 0)),
			int(summary.get(COLLISION_EXIT, 0)),
		],
		"outpost bounds: %s" % EXPANSION_BOUNDS_NOTE,
	]
	for facility in FACILITIES:
		var bounds: Rect2 = facility["bounds"]
		lines.append("%s %s %s anchor=(%.0f,%.0f) bounds=(%.0f,%.0f %.0fx%.0f)" % [
			String(facility["id"]),
			String(facility["body_collision"]),
			facility_variant(String(facility["id"]), state),
			Vector2(facility["interaction_anchor"]).x,
			Vector2(facility["interaction_anchor"]).y,
			bounds.position.x,
			bounds.position.y,
			bounds.size.x,
			bounds.size.y,
		])
	return lines

func natural_summary_lines(state: Dictionary = {}) -> Array[String]:
	var variant := String(state.get("variant", STATE_DORMANT))
	var records := int(state.get("signal_record_count", 0))
	var analysis := int(state.get("boss_analysis_level", 0))
	var line := "시설: 회수 플랫폼, 정산 카운터, 정비대, 이름 보관함, 출격 게시판, 차징 조율대"
	var state_line := "보급소 상태: 회수선과 출격 게이트만 낮게 켜져 있습니다."
	if variant == STATE_DESTROY_NODE:
		state_line = "보급소 상태: 낮아진 광고음 사이로 끊긴 동선 표시가 남았습니다."
	elif variant == STATE_EXTRACT_MEMORY:
		state_line = "보급소 상태: 사진과 영수증 잔향이 보관함 뒤에서 흔들립니다."
	elif variant == STATE_BOSS_CLEARED:
		state_line = "보급소 상태: 코어 파편 쟁반과 후속 송출관 잔향이 보입니다."
	elif analysis > 0:
		state_line = "보급소 상태: 보스 분석 %d단계가 이름 보관함과 조율대에 남았습니다." % analysis
	elif records > 0:
		state_line = "보급소 상태: 송출 기록 %d장이 출격 게시판에 고정되었습니다." % records
	elif variant == STATE_FIRST_RECALL:
		state_line = "보급소 상태: 첫 영수증과 전단 묶음이 정산 카운터에 남았습니다."
	return [line, state_line]

func facility_variant(facility_id: String, state: Dictionary = {}) -> String:
	var variant := String(state.get("variant", STATE_DORMANT))
	var records := int(state.get("signal_record_count", 0))
	var analysis := int(state.get("boss_analysis_level", 0))
	match facility_id:
		"recovery_platform":
			if variant == STATE_DORMANT:
				return "quiet_pad"
			if variant == STATE_BROADCAST_RECORD_3 or variant == STATE_BOSS_CLEARED:
				return "gate_warning_lit"
			return "recovery_line_lit"
		"settlement_counter":
			if variant == STATE_DESTROY_NODE:
				return "low_signal_meter"
			if variant == STATE_BOSS_CLEARED:
				return "core_fragment_tray"
			if records > 0:
				return "record_cards_%d" % records
			return "first_receipt" if bool(state.get("first_recall_seen", false)) else "empty_receipt_slot"
		"maintenance_bench":
			return "bench_lit" if bool(state.get("first_recall_seen", false)) else "bench_dark"
		"name_archive":
			if variant == STATE_DESTROY_NODE:
				return "quiet_nameplate_slot"
			if variant == STATE_EXTRACT_MEMORY:
				return "photo_afterimage_slot"
			if variant == STATE_BOSS_CLEARED:
				return "boss_resolution_slot"
			if analysis > 0:
				return "analysis_slots_%d" % analysis
			return "empty_name_slots"
		"sortie_board":
			if variant == STATE_DESTROY_NODE:
				return "broken_route_line"
			if variant == STATE_EXTRACT_MEMORY:
				return "memory_route_note"
			if variant == STATE_BOSS_CLEARED:
				return "followup_signal_pin"
			return "broadcast_cards_%d" % records
		"charging_tuner":
			if analysis > 0:
				return "signal_wave_%d" % analysis
			if records >= 2:
				return "interference_meter"
			return "timing_ring_idle"
		"trace_storage_room":
			return "photo_afterimage_locked" if variant == STATE_EXTRACT_MEMORY else "locked_shelves"
		"closed_corridor":
			return "future_wing_closed"
		"sortie_gate":
			return "redeploy_ready" if bool(state.get("first_recall_seen", false)) else "gate_dim"
		_:
			return variant

func _draw_preview_ground(parent: Control, offset: Vector2, scale: float, state: Dictionary) -> void:
	_add_rect(parent, offset, WORLD_BOUNDS.size * scale, Color(0.15, 0.14, 0.12, 0.025))
	for i in range(1, 3):
		_add_rect(parent, offset + Vector2(0, WORLD_BOUNDS.size.y * scale * float(i) / 3.0), Vector2(WORLD_BOUNDS.size.x * scale, 1), Color(0.18, 0.14, 0.11, 0.025))
	for i in range(1, 3):
		_add_rect(parent, offset + Vector2(WORLD_BOUNDS.size.x * scale * float(i) / 3.0, 0), Vector2(1, WORLD_BOUNDS.size.y * scale), Color(0.18, 0.14, 0.11, 0.022))
	var variant := String(state.get("variant", STATE_DORMANT))
	var signal_alpha := 0.022
	if variant == STATE_DESTROY_NODE:
		signal_alpha = 0.012
	elif variant == STATE_EXTRACT_MEMORY:
		signal_alpha = 0.035
	_add_rect(parent, offset + Vector2(0, 0), WORLD_BOUNDS.size * scale, Color(0.35, 0.70, 0.95, signal_alpha))

func _draw_corridors(parent: Control, offset: Vector2, scale: float, show_debug_labels: bool) -> void:
	var center := _to_preview(Vector2(720, 445), offset, scale)
	var anchors := [Vector2(280, 670), Vector2(1090, 555), Vector2(670, 260), Vector2(720, 735), Vector2(1085, 370)]
	var color := Color(0.36, 0.30, 0.24, 0.11 if not show_debug_labels else 0.18)
	for anchor in anchors:
		_add_line(parent, center, _to_preview(anchor, offset, scale), color, 2.0 if not show_debug_labels else 3.0)

func _draw_facility(parent: Control, facility: Dictionary, offset: Vector2, scale: float, state: Dictionary, show_debug_labels: bool) -> void:
	var bounds: Rect2 = facility["bounds"]
	var rect := Rect2(_to_preview(bounds.position, offset, scale), bounds.size * scale)
	var facility_id := String(facility["id"])
	var collision := String(facility["body_collision"])
	var fill := _facility_fill(facility_id, state)
	var border := _collision_color(collision)
	if not show_debug_labels:
		fill = _scaled_alpha(fill, NORMAL_ALPHA_SCALE)
		border = _scaled_alpha(border, NORMAL_LINE_ALPHA_SCALE)
	_add_panel(parent, rect.position, rect.size, fill, Color(border.r, border.g, border.b, border.a * (0.42 if show_debug_labels else 0.22)))
	if show_debug_labels:
		_add_label(parent, String(facility["display_name"]), rect.position + Vector2(3, 3), Vector2(rect.size.x - 6, 11), Color(0.20, 0.16, 0.13, 0.56), 8)
	elif _normal_label_visible(facility_id):
		_add_label(parent, String(facility["display_name"]), rect.position + Vector2(3, 3), Vector2(rect.size.x - 6, 11), Color(0.20, 0.16, 0.13, 0.44 * NORMAL_LABEL_ALPHA_SCALE), 8)
	_draw_facility_marks(parent, facility_id, rect, state)
	var anchor := _to_preview(Vector2(facility["interaction_anchor"]), offset, scale)
	_add_rect(parent, anchor - Vector2(4, 4), Vector2(8, 8), Color(0.62, 1.0, 0.36, 0.12 if not show_debug_labels else 0.18))
	if show_debug_labels:
		_add_label(parent, "%s\n%s\n%s" % [facility_id, collision, facility_variant(facility_id, state)], rect.position + Vector2(2, rect.size.y + 2), Vector2(122, 26), Color(0.08, 0.05, 0.04, 0.68), 7, HORIZONTAL_ALIGNMENT_LEFT)

func _draw_facility_marks(parent: Control, facility_id: String, rect: Rect2, state: Dictionary) -> void:
	var variant := facility_variant(facility_id, state)
	match facility_id:
		"recovery_platform":
			_add_rect(parent, rect.position + rect.size * 0.5 - Vector2(38, 1), Vector2(76, 2), Color(0.36, 0.54, 0.58, 0.075))
			_add_rect(parent, rect.position + rect.size * 0.5 - Vector2(1, 24), Vector2(2, 48), Color(0.36, 0.54, 0.58, 0.055))
		"settlement_counter":
			var cards := maxi(1, int(state.get("signal_record_count", 0)))
			for i in range(cards):
				_add_rect(parent, rect.position + Vector2(14 + i * 18, 26), Vector2(15, 10), Color(0.96, 0.82, 0.54, 0.085))
			if variant == "core_fragment_tray":
				_add_rect(parent, rect.position + Vector2(rect.size.x - 52, 27), Vector2(36, 8), Color(0.62, 1.0, 0.36, 0.085))
		"name_archive":
			var slots := maxi(1, int(state.get("boss_analysis_level", 0)))
			for i in range(6):
				var alpha := 0.095 if i < slots else 0.035
				if variant == "photo_afterimage_slot":
					alpha = 0.11 if i % 2 == 0 else 0.05
				_add_rect(parent, rect.position + Vector2(16 + (i % 2) * 38, 25 + int(i / 2) * 18), Vector2(27, 11), Color(0.96, 0.82, 0.56, alpha))
		"sortie_board":
			var records := int(state.get("signal_record_count", 0))
			for i in range(3):
				var alpha := 0.095 if i < records else 0.03
				_add_rect(parent, rect.position + Vector2(24 + i * 44, 26), Vector2(32, 18), Color(0.96, 0.79, 0.48, alpha))
			if variant == "broken_route_line":
				_add_rect(parent, rect.position + Vector2(30, 58), Vector2(140, 2), Color(0.25, 0.22, 0.18, 0.07), -8.0)
			elif variant == "memory_route_note":
				_add_rect(parent, rect.position + Vector2(120, 50), Vector2(80, 2), Color(0.95, 0.52, 0.62, 0.09), 10.0)
		"charging_tuner":
			var waves := maxi(1, int(state.get("boss_analysis_level", 0)))
			for i in range(waves):
				_add_rect(parent, rect.position + Vector2(24 + i * 21, 36 - (i % 2) * 5), Vector2(18, 3), Color(0.35, 0.70, 0.95, 0.09))
		"sortie_gate":
			_add_rect(parent, rect.position + Vector2(28, rect.size.y * 0.5), Vector2(rect.size.x - 56, 3), Color(0.62, 1.0, 0.36, 0.05))

func _facility_fill(facility_id: String, state: Dictionary) -> Color:
	var variant := facility_variant(facility_id, state)
	match facility_id:
		"recovery_platform":
			return Color(0.36, 0.47, 0.48, 0.13 if variant == "quiet_pad" else 0.20)
		"settlement_counter":
			return Color(0.48, 0.34, 0.24, 0.17)
		"maintenance_bench":
			return Color(0.36, 0.50, 0.42, 0.16 if variant == "bench_lit" else 0.10)
		"name_archive":
			return Color(0.31, 0.28, 0.24, 0.17)
		"sortie_board":
			return Color(0.56, 0.38, 0.23, 0.16)
		"charging_tuner":
			return Color(0.28, 0.44, 0.52, 0.15)
		"sortie_gate":
			return Color(0.22, 0.34, 0.32, 0.14)
		_:
			return Color(0.30, 0.26, 0.22, 0.11)

func _collision_color(collision_class: String) -> Color:
	match collision_class:
		COLLISION_HARD:
			return Color(0.18, 0.12, 0.10, 0.76)
		COLLISION_SOFT:
			return Color(0.35, 0.70, 0.95, 0.56)
		COLLISION_INTERACTION:
			return Color(0.62, 1.0, 0.36, 0.62)
		COLLISION_EXIT:
			return Color(1.0, 0.91, 0.25, 0.64)
		_:
			return Color(0.44, 0.34, 0.28, 0.38)

func _normal_label_visible(facility_id: String) -> bool:
	return facility_id == "recovery_platform" or facility_id == "sortie_board" or facility_id == "sortie_gate"

func _scaled_alpha(color: Color, scale: float) -> Color:
	return Color(color.r, color.g, color.b, color.a * scale)

func _to_preview(world_pos: Vector2, offset: Vector2, scale: float) -> Vector2:
	return offset + (world_pos - WORLD_BOUNDS.position) * scale

func _add_panel(parent: Control, position: Vector2, size: Vector2, fill_color: Color, border_color: Color) -> Panel:
	var panel := Panel.new()
	panel.position = position
	panel.size = size
	panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	panel.add_theme_stylebox_override("panel", _style(fill_color, border_color))
	parent.add_child(panel)
	return panel

func _add_rect(parent: Control, position: Vector2, size: Vector2, color: Color, rotation_degrees: float = 0.0) -> ColorRect:
	var rect := ColorRect.new()
	rect.position = position
	rect.size = size
	rect.color = color
	rect.rotation = deg_to_rad(rotation_degrees)
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(rect)
	return rect

func _add_line(parent: Control, start: Vector2, end: Vector2, color: Color, width: float) -> void:
	var length := start.distance_to(end)
	if length <= 0.01:
		return
	var line := _add_rect(parent, start, Vector2(length, width), color)
	line.pivot_offset = Vector2(0, width * 0.5)
	line.rotation = (end - start).angle()

func _add_label(parent: Control, text: String, position: Vector2, size: Vector2, color: Color, font_size: int, align: HorizontalAlignment = HORIZONTAL_ALIGNMENT_CENTER) -> Label:
	var label := Label.new()
	label.position = position
	label.size = size
	label.text = text
	label.clip_text = true
	label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	label.horizontal_alignment = align
	label.add_theme_font_size_override("font_size", font_size)
	label.add_theme_color_override("font_color", color)
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	label.add_theme_font_override("font", UIFont.get_font())
	parent.add_child(label)
	return label

func _style(fill_color: Color, border_color: Color) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = fill_color
	style.border_color = border_color
	style.set_border_width_all(1)
	style.set_corner_radius_all(3)
	style.content_margin_left = 2
	style.content_margin_right = 2
	style.content_margin_top = 2
	style.content_margin_bottom = 2
	return style
