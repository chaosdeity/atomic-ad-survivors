extends RefCounted

const STATE_NORMAL := "normal"
const STATE_ACTIVE := STATE_NORMAL
const STATE_REVEALED := "revealed"
const STATE_STAMPED := "stamped"
const STATE_SUPPRESSED := "suppressed"
const STATE_OVERLOADED := "overloaded"
const STATE_SPENT := "spent"

const SUPPRESSION_DURATION := 6.5
const OVERLOAD_DURATION := 4.2

const P0_NAMEPLATE := "nameplate"
const P0_FAMILY_PHOTO_WINDOW := "family_photo_window"
const P0_MAILBOX := "mailbox"
const P0_FRONT_SENSOR := "front_sensor"
const P0_DRAIN_SILENCE_POCKET := "drain_silence_pocket"
const P0_FAKE_RECALL_MARKER := "fake_recall_marker"

static func default_state(object: Dictionary = {}) -> Dictionary:
	return {
		"source_id": String(object.get("id", "")),
		"display_name": String(object.get("display_name", object.get("id", "source"))),
		"source_role": String(object.get("source_role", "environmental_readability")),
		"p0_source_key": p0_source_key(object),
		"zone_id": String(object.get("zone_id", "")),
		"pos": Vector2(object.get("pos", Vector2.ZERO)),
		"revealed": false,
		"stamped": false,
		"spent": false,
		"suppression_remaining": 0.0,
		"overload_remaining": 0.0,
		"last_action": "",
		"last_phrase": "",
		"action_count": 0,
	}

static func ensure_state(states: Dictionary, object: Dictionary) -> Dictionary:
	var source_id := String(object.get("id", ""))
	if source_id == "":
		return {}
	var state := Dictionary(states.get(source_id, {})).duplicate(true)
	if state.is_empty():
		state = default_state(object)
	else:
		state["source_id"] = source_id
		state["display_name"] = String(state.get("display_name", object.get("display_name", source_id)))
		state["source_role"] = String(state.get("source_role", object.get("source_role", "environmental_readability")))
		state["p0_source_key"] = String(state.get("p0_source_key", p0_source_key(object)))
		state["zone_id"] = String(state.get("zone_id", object.get("zone_id", "")))
		state["pos"] = Vector2(state.get("pos", object.get("pos", Vector2.ZERO)))
	states[source_id] = state
	return state

static func tick(states: Dictionary, delta: float) -> void:
	for source_id in states.keys():
		var state := Dictionary(states[source_id]).duplicate(true)
		state["suppression_remaining"] = maxf(0.0, float(state.get("suppression_remaining", 0.0)) - delta)
		state["overload_remaining"] = maxf(0.0, float(state.get("overload_remaining", 0.0)) - delta)
		states[source_id] = state

static func reveal(states: Dictionary, object: Dictionary, action: String = "reveal", phrase: String = "") -> Dictionary:
	var state := ensure_state(states, object)
	if state.is_empty():
		return {"applied": false, "repeat": false, "state": STATE_ACTIVE}
	var was_revealed := bool(state.get("revealed", false))
	state["revealed"] = true
	state["last_action"] = action
	state["last_phrase"] = phrase
	states[String(state["source_id"])] = state
	return {
		"applied": not was_revealed,
		"repeat": was_revealed,
		"state": current_state(state),
	}

static func suppress(states: Dictionary, object: Dictionary, phrase: String = "") -> Dictionary:
	var state := ensure_state(states, object)
	if state.is_empty():
		return {"applied": false, "repeat": false, "state": STATE_ACTIVE}
	if bool(state.get("spent", false)):
		return {"applied": false, "repeat": true, "state": current_state(state)}
	state["revealed"] = true
	state["stamped"] = true
	state["spent"] = true
	state["suppression_remaining"] = maxf(float(state.get("suppression_remaining", 0.0)), SUPPRESSION_DURATION)
	state["last_action"] = STATE_SUPPRESSED
	state["last_phrase"] = phrase
	state["action_count"] = int(state.get("action_count", 0)) + 1
	states[String(state["source_id"])] = state
	return {"applied": true, "repeat": false, "state": current_state(state)}

static func overload(states: Dictionary, object: Dictionary, phrase: String = "") -> Dictionary:
	var state := ensure_state(states, object)
	if state.is_empty():
		return {"applied": false, "repeat": false, "state": STATE_ACTIVE}
	if bool(state.get("spent", false)):
		return {"applied": false, "repeat": true, "state": current_state(state)}
	state["revealed"] = true
	state["stamped"] = true
	state["spent"] = true
	state["suppression_remaining"] = maxf(float(state.get("suppression_remaining", 0.0)), SUPPRESSION_DURATION * 0.65)
	state["overload_remaining"] = maxf(float(state.get("overload_remaining", 0.0)), OVERLOAD_DURATION)
	state["last_action"] = STATE_OVERLOADED
	state["last_phrase"] = phrase
	state["action_count"] = int(state.get("action_count", 0)) + 1
	states[String(state["source_id"])] = state
	return {"applied": true, "repeat": false, "state": current_state(state)}

static func current_state(state: Dictionary) -> String:
	if float(state.get("overload_remaining", 0.0)) > 0.0:
		return STATE_OVERLOADED
	if float(state.get("suppression_remaining", 0.0)) > 0.0:
		return STATE_SUPPRESSED
	if bool(state.get("spent", false)):
		return STATE_SPENT
	if bool(state.get("stamped", false)):
		return STATE_STAMPED
	if bool(state.get("revealed", false)):
		return STATE_REVEALED
	return STATE_NORMAL

static func state_for_source(states: Dictionary, source_id: String) -> Dictionary:
	return Dictionary(states.get(source_id, {})).duplicate(true)

static func source_weight(states: Dictionary, source: Dictionary) -> float:
	var state := state_for_source(states, String(source.get("id", "")))
	if state.is_empty():
		return 1.0
	if float(state.get("overload_remaining", 0.0)) > 0.0:
		return 0.34
	if float(state.get("suppression_remaining", 0.0)) > 0.0:
		return 0.58
	return 1.0

static func source_list_chance_multiplier(states: Dictionary, sources: Array) -> float:
	if states.is_empty() or sources.is_empty():
		return 1.0
	var total := 0.0
	for source in sources:
		if source is Dictionary:
			total += source_weight(states, source)
	var average := total / maxf(1.0, float(sources.size()))
	return clampf(average, 0.36, 1.0)

static func pick_weighted_source(states: Dictionary, sources: Array, rng: RandomNumberGenerator) -> Dictionary:
	if sources.is_empty():
		return {}
	var total := 0.0
	for source in sources:
		if source is Dictionary:
			total += maxf(0.05, source_weight(states, source))
	if total <= 0.0:
		return Dictionary(sources[rng.randi_range(0, sources.size() - 1)])
	var roll := rng.randf() * total
	var cursor := 0.0
	for source in sources:
		if not (source is Dictionary):
			continue
		cursor += maxf(0.05, source_weight(states, source))
		if roll <= cursor:
			return Dictionary(source)
	return Dictionary(sources[sources.size() - 1])

static func counts(states: Dictionary) -> Dictionary:
	var result := {
		STATE_NORMAL: 0,
		STATE_REVEALED: 0,
		STATE_STAMPED: 0,
		STATE_SUPPRESSED: 0,
		STATE_OVERLOADED: 0,
		STATE_SPENT: 0,
	}
	for raw_state in states.values():
		var state := Dictionary(raw_state)
		var state_id := current_state(state)
		result[state_id] = int(result.get(state_id, 0)) + 1
	return result

static func remaining_summary(states: Dictionary) -> String:
	var suppressed := 0.0
	var overloaded := 0.0
	for raw_state in states.values():
		var state := Dictionary(raw_state)
		suppressed = maxf(suppressed, float(state.get("suppression_remaining", 0.0)))
		overloaded = maxf(overloaded, float(state.get("overload_remaining", 0.0)))
	return "supp %.1fs / overload %.1fs" % [suppressed, overloaded]

static func count_summary(states: Dictionary) -> String:
	var c := counts(states)
	return "normal=%d revealed=%d stamped=%d suppressed=%d overloaded=%d spent=%d" % [
		int(c.get(STATE_NORMAL, 0)),
		int(c.get(STATE_REVEALED, 0)),
		int(c.get(STATE_STAMPED, 0)),
		int(c.get(STATE_SUPPRESSED, 0)),
		int(c.get(STATE_OVERLOADED, 0)),
		int(c.get(STATE_SPENT, 0)),
	]

static func compact_debug(states: Dictionary) -> String:
	var parts: Array[String] = []
	for source_id in states.keys():
		var state := Dictionary(states[source_id])
		var state_id := current_state(state)
		parts.append("%s=%s(%.1f/%.1f)" % [
			String(source_id),
			state_id,
			float(state.get("suppression_remaining", 0.0)),
			float(state.get("overload_remaining", 0.0)),
		])
		if parts.size() >= 5:
			break
	if parts.is_empty():
		return "none"
	return ", ".join(parts)

static func p0_source_key(object: Dictionary) -> String:
	var existing := String(object.get("p0_source_key", ""))
	if existing != "":
		return existing
	var effect := String(object.get("campaign_effect", ""))
	var source_role := String(object.get("source_role", ""))
	var source_id := String(object.get("id", ""))
	var display_name := String(object.get("display_name", ""))
	if effect == "closed_door_stamp" or source_id.find("closed_door") != -1 or display_name.find("문패") != -1:
		return P0_NAMEPLATE
	if effect == "family_photo_memory" or display_name.find("가족사진") != -1:
		return P0_FAMILY_PHOTO_WINDOW
	if effect.find("mailbox") != -1 or source_role == "mailbox_coupon" or display_name.find("우편함") != -1:
		return P0_MAILBOX
	if effect == "front_sensor_warning" or source_role == "doorbell_sensor" or display_name.find("현관 센서") != -1:
		return P0_FRONT_SENSOR
	if effect == "drain_low_signal_trace" or effect == "wet_flyer_stored" or effect == "low_signal_checked" or source_role == "drain_silence" or display_name.find("배수로") != -1:
		return P0_DRAIN_SILENCE_POCKET
	if effect == "fake_return_verified" or effect == "unstable_recovery_line_marked" or source_role == "fake_return_sign" or display_name.find("가짜 회수") != -1 or display_name.find("가짜 귀환") != -1:
		return P0_FAKE_RECALL_MARKER
	return ""

static func p0_source_label(source_key: String) -> String:
	match source_key:
		P0_NAMEPLATE:
			return "문패"
		P0_FAMILY_PHOTO_WINDOW:
			return "가족사진 창문"
		P0_MAILBOX:
			return "우편함"
		P0_FRONT_SENSOR:
			return "현관 센서"
		P0_DRAIN_SILENCE_POCKET:
			return "배수로 침묵 주머니"
		P0_FAKE_RECALL_MARKER:
			return "가짜 회수 표식"
		_:
			return ""

static func p0_state_phrase(object: Dictionary, state_id: String, learning_state: Dictionary = {}) -> String:
	var key := p0_source_key(object)
	if key == "":
		return ""
	var label := p0_source_label(key)
	var role_guess := String(learning_state.get("r01_yunseo_role_guess", "외부인"))
	var name_pressure := int(learning_state.get("r01_name_pressure", 0))
	var fake_accuracy := int(learning_state.get("r01_fake_recall_accuracy", 0))
	var tag_contamination := int(learning_state.get("r01_tag_contamination", 0))
	var boss_residue := int(learning_state.get("r01_boss_residue", 0))
	var visit_count := int(learning_state.get("r01_revisit_count", 0))
	var outpost_trace_leak := int(learning_state.get("r01_outpost_trace_leak", 0))
	match key:
		P0_NAMEPLATE:
			match state_id:
				STATE_REVEALED:
					if boss_residue > 0:
						return "%s revealed: 결절 일부 침묵 뒤에도 윤서 이름 일부를 더 정확히 부릅니다." % label
					if name_pressure >= 3:
						return "%s revealed: 윤서 이름 오기입이 보호자 후보 라벨로 가까워집니다. 이름 압력 %d." % [label, name_pressure]
					if name_pressure > 0:
						return "%s revealed: 윤서 이름 일부와 고객 보류 라벨이 함께 노출됩니다." % label
					return "%s revealed: 원래 이름 조각과 덮인 고객 라벨이 같이 노출됩니다." % label
				STATE_SUPPRESSED, STATE_STAMPED:
					return "%s suppressed: 이름 라벨 덮어쓰기가 지연됩니다. 이름 압력 %d." % [label, name_pressure]
				STATE_OVERLOADED:
					return "%s overloaded: 가족 칸/보호자 후보 문구가 과잉 출력됩니다." % label
				STATE_SPENT:
					return "%s spent: 윤서 이름은 아직 세대 칸으로 확정되지 않았습니다." % label
		P0_FAMILY_PHOTO_WINDOW:
			match state_id:
				STATE_REVEALED:
					if boss_residue > 0:
						return "%s revealed: 보스전의 빈칸 구도를 잔상으로 반복합니다." % label
					if role_guess == "가족 슬롯" or role_guess == "보호자 후보":
						return "%s revealed: 빈 얼굴 프레임이 윤서 방향으로 돌아섭니다. 현재 판정 %s." % [label, role_guess]
					if visit_count >= 2:
						return "%s revealed: 광고 가족 얼굴이 빠지고 빈 얼굴 프레임이 더 먼저 보입니다." % label
					return "%s revealed: 손잡은 자세와 빈 얼굴 프레임이 광고 얼굴 아래에서 보입니다." % label
				STATE_SUPPRESSED, STATE_STAMPED:
					return "%s suppressed: 광고 모델 보정선이 약해집니다. 현재 판정 %s." % [label, role_guess]
				STATE_OVERLOADED:
					return "%s overloaded: 가족 슬롯 flash가 윤서 방향으로 강해집니다." % label
				STATE_SPENT:
					return "%s spent: 사진 잔상은 이름 보관함으로 보류됩니다." % label
		P0_MAILBOX:
			match state_id:
				STATE_REVEALED:
					if boss_residue > 0:
						return "%s revealed: 미수령 대신 재심사 안내를 발송합니다." % label
					if tag_contamination > 0:
						return "%s revealed: 윤서 수령 안내에 오염 꼬리표 %d개가 붙습니다." % [label, tag_contamination]
					if visit_count >= 2:
						return "%s revealed: 미수령 전단이 윤서 수령 안내로 바뀝니다." % label
					return "%s revealed: 미수령 전단과 주소 불일치 전단이 노출됩니다." % label
				STATE_SUPPRESSED, STATE_STAMPED:
					return "%s suppressed: 전단 발송 source가 지연됩니다." % label
				STATE_OVERLOADED:
					return "%s overloaded: 수령인 후보 문구가 과잉 출력됩니다. 오염 압력 %d." % [label, tag_contamination]
				STATE_SPENT:
					return "%s spent: 미수령 전단은 보급소 보류 근거로 남습니다." % label
		P0_FRONT_SENSOR:
			match state_id:
				STATE_REVEALED:
					if boss_residue > 0:
						return "%s revealed: 심사 반려 뒤에도 방문 ping이 윤서 이름 일부를 붙여 재심사를 시도합니다." % label
					if name_pressure >= 2:
						return "%s revealed: 방문 심사 ping이 윤서 이름 일부와 %s 판정을 함께 붙입니다." % [label, role_guess]
					if role_guess == "보호자 후보" or role_guess == "수령인 후보" or role_guess == "가족 슬롯":
						return "%s revealed: 방문객 ping이 %s 판정으로 올라갑니다." % [label, role_guess]
					return "%s revealed: 방문 심사 ping과 센서 로그가 노출됩니다." % label
				STATE_SUPPRESSED, STATE_STAMPED:
					return "%s suppressed: 방문객 판정이 지연됩니다. 현재 판정 %s." % [label, role_guess]
				STATE_OVERLOADED:
					return "%s overloaded: 보호자 후보/입주 후보 판정이 과잉 출력됩니다. 현재 판정 %s." % [label, role_guess]
				STATE_SPENT:
					return "%s spent: 센서 로그는 충전태그가 아니라 판정 근거로 보류됩니다." % label
		P0_DRAIN_SILENCE_POCKET:
			match state_id:
				STATE_REVEALED:
					if boss_residue > 0:
						return "%s revealed: 낮아진 노이즈가 흘러나가지만 회수선 박자도 약해집니다." % label
					if outpost_trace_leak >= 2 or tag_contamination > 0:
						return "%s revealed: 젖은 기록이 늘고 회수선 불안 문구가 같이 증가합니다." % label
					if outpost_trace_leak > 0:
						return "%s revealed: 낮은 신호 속 젖은 기록이 보급소 흔적 누출로 남습니다." % label
					return "%s revealed: 젖은 전단과 끊긴 구조 요청이 드러납니다." % label
				STATE_SUPPRESSED, STATE_STAMPED:
					return "%s suppressed: 낮은 신호 hazard가 일부 완화되지만 인양 박자도 약해집니다." % label
				STATE_OVERLOADED:
					return "%s overloaded: 인양 신호 흔들림과 오염 문구가 늘어납니다." % label
				STATE_SPENT:
					return "%s spent: 젖은 기록만 남고 회수선 안정 단서로 보관됩니다." % label
		P0_FAKE_RECALL_MARKER:
			match state_id:
				STATE_REVEALED:
					if boss_residue > 0:
						return "%s revealed: 보급소 표식을 더 정확히 흉내 내지만 침묵은 비어 있습니다." % label
					if fake_accuracy >= 2:
						return "%s revealed: 실제 귀환로 근처에 나타날 만큼 모방 정확도가 올라갑니다." % label
					if fake_accuracy > 0:
						return "%s revealed: 보급소 색 모방이 더 정확해졌지만 침묵은 빠져 있습니다." % label
					return "%s revealed: 보급소 침묵이 빠진 모방 표식이 노출됩니다." % label
				STATE_SUPPRESSED, STATE_STAMPED:
					return "%s suppressed: 가짜 경로가 반려됩니다. 모방 정확도 %d." % [label, fake_accuracy]
				STATE_OVERLOADED:
					return "%s overloaded: 실제 귀환 문구에 더 가까운 문장을 흉내 냅니다." % label
				STATE_SPENT:
					return "%s spent: 회수선 출처 의심만 남습니다." % label
	return "%s %s: 판정 대기" % [label, state_id]

static func p0_settlement_line(object: Dictionary, state_id: String, action: String = "") -> String:
	var key := p0_source_key(object)
	match key:
		P0_NAMEPLATE:
			return "보급소 보류: 문패 조각. 이름은 세대 칸에 넣지 않음."
		P0_FAMILY_PHOTO_WINDOW:
			return "보급소 보류: 가족사진 잔상. 웃는 얼굴보다 손잡은 자세를 보관."
		P0_MAILBOX:
			if state_id == STATE_OVERLOADED:
				return "오염 꼬리표: 우편함 수령인 후보 과잉 출력."
			return "캠페인 승인: 우편함 미수령 전단은 수령인 결원 근거로 승인."
		P0_FRONT_SENSOR:
			return "보급소 보류: 현관 센서 ping. 방문객 판정을 확정하지 않음."
		P0_DRAIN_SILENCE_POCKET:
			if state_id == STATE_OVERLOADED:
				return "오염 꼬리표: 배수로 낮은 신호가 인양 박자까지 흔듦."
			return "보급소 보류: 배수로 젖은 기록. 낮은 신호를 회수선 안정 단서로 보관."
		P0_FAKE_RECALL_MARKER:
			return "오염 꼬리표: 가짜 회수 표식. 식량태그 후보에 출처 의심 부착."
		_:
			return ""

static func p0_name_archive_line(object: Dictionary, state_id: String, learning_state: Dictionary = {}) -> String:
	var key := p0_source_key(object)
	var role_guess := String(learning_state.get("r01_yunseo_role_guess", "외부인"))
	var name_pressure := int(learning_state.get("r01_name_pressure", 0))
	var fake_accuracy := int(learning_state.get("r01_fake_recall_accuracy", 0))
	match key:
		P0_NAMEPLATE:
			if name_pressure >= 3:
				return "이름 보관함: 문패 조각을 세대 칸에 넣지 않고 보류합니다. 다음 출격에서 윤서 이름을 더 정확히 부를 수 있습니다."
			return "이름 보관함: 문패 조각을 세대 칸에 넣지 않고 보류합니다."
		P0_FAMILY_PHOTO_WINDOW:
			return "이름 보관함: 손잡은 자세와 빈 얼굴 프레임을 고객명 라벨과 분리했습니다."
		P0_MAILBOX:
			return "이름 보관함: 수령인 후보 라벨을 배급 태그와 따로 격리합니다."
		P0_FRONT_SENSOR:
			return "이름 보관함: 방문 심사 ping을 이름 확정 근거에서 분리했습니다. 현재 윤서 판정은 %s입니다." % role_guess
		P0_DRAIN_SILENCE_POCKET:
			return "이름 보관함: 젖은 구조 요청을 가족 칸 밖 흔적으로 보관합니다."
		P0_FAKE_RECALL_MARKER:
			if fake_accuracy >= 2:
				return "이름 보관함: 잘못된 회수선 기록을 귀환 이름표와 분리했습니다. 모방 정확도가 상승했습니다."
			return "이름 보관함: 잘못된 회수선 기록을 귀환 이름표와 분리했습니다."
		_:
			return ""

static func p0_repeat_change_line(source_key: String, learning_state: Dictionary = {}) -> String:
	var visit_count := int(learning_state.get("r01_revisit_count", 0))
	var boss_residue := int(learning_state.get("r01_boss_residue", 0))
	var role_guess := String(learning_state.get("r01_yunseo_role_guess", "외부인"))
	var name_pressure := int(learning_state.get("r01_name_pressure", 0))
	var fake_accuracy := int(learning_state.get("r01_fake_recall_accuracy", 0))
	var tag_contamination := int(learning_state.get("r01_tag_contamination", 0))
	var outpost_trace_leak := int(learning_state.get("r01_outpost_trace_leak", 0))
	match source_key:
		P0_NAMEPLATE:
			if boss_residue > 0:
				return "문패 반복 변화: 덜 공격적이지만 윤서 이름 일부를 더 정확히 부릅니다."
			if name_pressure >= 3:
				return "문패 반복 변화: 윤서 이름 오기입이 보호자 후보 라벨로 바뀝니다."
			if name_pressure > 0:
				return "문패 반복 변화: 윤서 이름 오기입이 고객 보류 라벨로 정리됩니다."
			if visit_count >= 3:
				return "문패 반복 변화: 윤서 이름 오기입이 보호자 후보 라벨로 바뀝니다."
			if visit_count >= 2:
				return "문패 반복 변화: 윤서 이름 오기입이 고객 보류 라벨로 정리됩니다."
			return "문패 반복 변화: 원래 이름 조각 위로 윤서 이름이 틀리게 덮입니다."
		P0_FAMILY_PHOTO_WINDOW:
			if boss_residue > 0:
				return "가족사진 창문 반복 변화: 보스전의 빈칸 구도를 잔상으로 반복합니다."
			if role_guess == "가족 슬롯" or role_guess == "보호자 후보":
				return "가족사진 창문 반복 변화: 빈 얼굴 잔상이 윤서 방향으로 돌아봅니다."
			if visit_count >= 3:
				return "가족사진 창문 반복 변화: 빈 얼굴 잔상이 윤서 방향으로 돌아봅니다."
			if visit_count >= 2:
				return "가족사진 창문 반복 변화: 광고 가족 얼굴이 빈 얼굴 프레임으로 빠집니다."
			return "가족사진 창문 반복 변화: 광고 가족 보정선이 먼저 보입니다."
		P0_MAILBOX:
			if boss_residue > 0:
				return "우편함 반복 변화: 미수령 대신 재심사 안내를 발송합니다."
			if tag_contamination > 0:
				return "우편함 반복 변화: 윤서 수령 안내에 오염 꼬리표가 붙습니다."
			if visit_count >= 3:
				return "우편함 반복 변화: 보급소 시간대에 맞춘 발송 문구가 붙습니다."
			if visit_count >= 2:
				return "우편함 반복 변화: 윤서 수령 안내가 출력됩니다."
			return "우편함 반복 변화: 미수령 전단이 주소 불일치로 남습니다."
		P0_FRONT_SENSOR:
			if boss_residue > 0:
				return "현관 센서 반복 변화: 심사 반려 뒤에도 윤서 이름 일부를 붙여 재심사를 시도합니다."
			if name_pressure >= 2:
				return "현관 센서 반복 변화: 방문 ping이 윤서 이름 일부와 %s 판정을 같이 붙입니다." % role_guess
			if role_guess == "보호자 후보" or role_guess == "수령인 후보" or role_guess == "가족 슬롯":
				return "현관 센서 반복 변화: %s 판정이 깜박입니다." % role_guess
			if visit_count >= 3:
				return "현관 센서 반복 변화: 보호자 후보 판정이 깜박입니다."
			if visit_count >= 2:
				return "현관 센서 반복 변화: 입주 후보 ping이 섞입니다."
			return "현관 센서 반복 변화: 방문객 ping만 반복됩니다."
		P0_DRAIN_SILENCE_POCKET:
			if boss_residue > 0:
				return "배수로 침묵 주머니 반복 변화: 낮아진 노이즈를 흘려보내지만 회수선도 약해집니다."
			if outpost_trace_leak >= 2 or tag_contamination > 0:
				return "배수로 침묵 주머니 반복 변화: 젖은 기록과 회수선 불안 문구가 같이 늘어납니다."
			if visit_count >= 3:
				return "배수로 침묵 주머니 반복 변화: 인양 신호도 약해집니다."
			if visit_count >= 2:
				return "배수로 침묵 주머니 반복 변화: 젖은 기록이 늘어납니다."
			return "배수로 침묵 주머니 반복 변화: 낮은 신호가 유지됩니다."
		P0_FAKE_RECALL_MARKER:
			if boss_residue > 0:
				return "가짜 회수 표식 반복 변화: 보급소 표식을 더 정확히 흉내 내지만 침묵은 비어 있습니다."
			if fake_accuracy >= 2:
				return "가짜 회수 표식 반복 변화: 실제 귀환로 근처에서 출현하려 합니다."
			if fake_accuracy > 0:
				return "가짜 회수 표식 반복 변화: 보급소 색 모방이 더 정확해집니다."
			if visit_count >= 3:
				return "가짜 회수 표식 반복 변화: 실제 귀환로 근처에서 출현하려 합니다."
			if visit_count >= 2:
				return "가짜 회수 표식 반복 변화: 보급소 색 모방이 더 정확해집니다."
			return "가짜 회수 표식 반복 변화: 어설픈 회수선 흉내만 남습니다."
		_:
			return ""
