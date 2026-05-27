extends RefCounted

const OUTPOST_NPCS := [
	{
		"npc_id": "mina",
		"display_name": "미나",
		"facility": "settlement_counter",
		"role": "태그/정산/후보/보류",
		"pos": Vector2(282, 655),
		"color": Color(1.0, 0.60, 0.45, 0.70),
		"reaction_tags": ["first_recall", "settlement", "food_tag", "held_ticket"],
		"short_lines": {
			"first_recall": "첫 회수는 정산표 밖에 따로 둡니다.",
			"settlement": "정산 근거만 남기고 표는 늘리지 않습니다.",
			"food_tag": "식량태그는 누가 오늘 먹는지부터 봅니다.",
			"default": "정산표는 조용히 열려 있습니다.",
		},
		"field_remote_lines": {
			"unnamed_mail": "정산 근거가 생겼습니다. 너무 깊게 들어가진 마세요.",
		},
		"debug_note": "settlement face / no shop",
	},
	{
		"npc_id": "doyun",
		"display_name": "도윤",
		"facility": "maintenance_bench",
		"role": "장비/반품 도장/충전태그",
		"pos": Vector2(1112, 548),
		"color": Color(0.62, 1.0, 0.36, 0.66),
		"reaction_tags": ["emergency_retrieval", "power_tag", "sensor", "charge"],
		"short_lines": {
			"emergency_retrieval": "회수선이 끊긴 위치부터 다시 묶습니다.",
			"power_tag": "충전태그는 도장 접점 쪽으로 빼 둡니다.",
			"sensor": "현관 센서 주파수를 정비대에 기록했습니다.",
			"default": "정비대가 낮은 소리로 돌아갑니다.",
		},
		"field_remote_lines": {
			"door_voice_residue": "현관 센서가 장비 신호를 긁고 있어요.",
			"outpost_remote_echo": "그 회수음은 보급소 장비음이 아닙니다.",
		},
		"debug_note": "maintenance / return stamp tuning",
	},
	{
		"npc_id": "popsy",
		"display_name": "팝시",
		"facility": "trace_storage_room",
		"role": "오염 감지/이상 흔적",
		"pos": Vector2(250, 288),
		"color": Color(0.78, 0.58, 1.0, 0.68),
		"reaction_tags": ["contamination", "fake_return", "photo", "glitch"],
		"short_lines": {
			"contamination": "오염 표식은 귀엽지 않아요. 분리합니다.",
			"fake_return": "가짜 귀환음이 보급소 흉내를 냅니다.",
			"photo": "사진은 아직 사람 수를 세고 있어요.",
			"default": "흔적 보관실 감지등이 작게 깜박입니다.",
		},
		"field_remote_lines": {
			"family_photo_afterimage": "그 사진, 아직 사람을 세고 있어요.",
			"broken_life_broadcast": "생활 방송이 사람 목소리를 덮고 있어요.",
		},
		"debug_note": "trace/glitch readout / no reroll shop",
	},
	{
		"npc_id": "seven",
		"display_name": "세븐",
		"facility": "sortie_board",
		"role": "작전도/수신태그/송출 기록",
		"pos": Vector2(665, 250),
		"color": Color(0.35, 0.70, 0.95, 0.70),
		"reaction_tags": ["signal", "operation_board", "boss_signal", "fake_return"],
		"short_lines": {
			"signal": "수신태그를 출격 게시판에 고정합니다.",
			"boss_signal": "심사관 신호는 지우지 않고 대조합니다.",
			"fake_return": "해당 회수선은 보급소 인증이 아닙니다.",
			"default": "게시판은 같은 잡음을 두 번 읽습니다.",
		},
		"field_remote_lines": {
			"outpost_remote_echo": "그 회수선, 보급소 쪽 신호가 아닙니다.",
			"missing_person_register": "실종자 등록이 모델하우스 신호와 겹칩니다.",
		},
		"debug_note": "operation board / no quest UI",
	},
	{
		"npc_id": "bokhee",
		"display_name": "복희",
		"facility": "name_archive",
		"role": "회수 플랫폼/생활 보급/이름 보관",
		"pos": Vector2(1080, 358),
		"color": Color(0.96, 0.82, 0.54, 0.64),
		"reaction_tags": ["first_recall", "name_trace", "photo", "food_tag"],
		"short_lines": {
			"first_recall": "돌아왔으면 이름부터 안쪽에 놓자.",
			"name_trace": "이름 조각은 버리지 않고 접어 둡니다.",
			"photo": "얼굴보다 손잡은 모양을 먼저 보관합니다.",
			"default": "이름 보관함이 한 칸 비어 있습니다.",
		},
		"field_remote_lines": {
			"door_voice_residue": "너무 안쪽입니다. 돌아올 길부터 보세요.",
			"rescue_request_log": "젖은 종이는 말리면 이름이 남을 때가 있단다.",
		},
		"debug_note": "name archive / living supply memory",
	},
]

const FIELD_TRACE_BY_OBJECT := {
	"r01_story_l01_mailbox": {
		"trace_id": "unnamed_mail",
		"display_name": "이름표가 빠진 우편물",
		"source_object_type": "mailbox",
		"prompt": "빠진 이름표 확인",
		"first_line": "우편물에는 주소만 있고 사람 이름이 뜯겨 있습니다.",
		"repeat_line": "주소는 남았지만 이름 칸은 이미 비었습니다.",
		"node_memory_phrase": "이름표 없는 우편물",
		"outpost_reaction": "미나가 주소 중복과 빠진 이름표를 같은 정산 칸에 두지 않습니다.",
		"outpost_reaction_tag": "settlement",
		"remote_comment_tag": "unnamed_mail",
		"remote_npc_id": "mina",
		"facility_id": "settlement_counter",
	},
	"r01_story_l02_mailbox": {
		"trace_id": "unnamed_mail",
		"display_name": "이름표가 빠진 우편물",
		"source_object_type": "mailbox",
		"prompt": "빠진 이름표 확인",
		"first_line": "수령인 칸은 비어 있고 배급 시간만 반복됩니다.",
		"repeat_line": "비어 있는 이름 칸은 더 채워지지 않습니다.",
		"node_memory_phrase": "이름표 없는 수령인 칸",
		"outpost_reaction": "미나가 배급 기록을 사람 이름으로 정산하지 않게 표시합니다.",
		"outpost_reaction_tag": "settlement",
		"remote_comment_tag": "unnamed_mail",
		"remote_npc_id": "mina",
		"facility_id": "settlement_counter",
	},
	"r01_story_l02_closed_door": {
		"trace_id": "door_voice_residue",
		"display_name": "문틈 음성 잔향",
		"source_object_type": "closed_door",
		"prompt": "문틈 음성 확인",
		"first_line": "문틈에서 오늘 저녁 숫자만 세는 목소리가 새어 나옵니다.",
		"repeat_line": "문틈 목소리는 같은 숫자에서 다시 끊깁니다.",
		"node_memory_phrase": "문틈 음성 잔향",
		"outpost_reaction": "복희가 문틈 목소리를 이름 보관함의 생활 보급 칸에 접어 둡니다.",
		"outpost_reaction_tag": "name_trace",
		"remote_comment_tag": "door_voice_residue",
		"remote_npc_id": "bokhee",
		"facility_id": "name_archive",
	},
	"r01_story_l02_family_window": {
		"trace_id": "family_photo_afterimage",
		"display_name": "가족사진 잔상",
		"source_object_type": "photo_window",
		"prompt": "가족사진 잔상 확인",
		"first_line": "사진 속 얼굴은 광고 모델로 바뀌었지만 손잡은 자세는 남았습니다.",
		"repeat_line": "사진은 같은 웃는 얼굴만 다시 정렬합니다.",
		"node_memory_phrase": "가족사진 잔상",
		"outpost_reaction": "팝시가 사진 잔향을 흔적 보관실 감지등 아래에 띄웁니다.",
		"outpost_reaction_tag": "photo",
		"remote_comment_tag": "family_photo_afterimage",
		"remote_npc_id": "popsy",
		"facility_id": "trace_storage_room",
	},
	"r01_story_l03_name_register": {
		"trace_id": "closed_window_movement",
		"display_name": "닫힌 창문 뒤 움직임",
		"source_object_type": "name_register",
		"prompt": "창문 뒤 움직임 확인",
		"first_line": "등록 장치 뒤 닫힌 유리에서 사람 그림자가 한 칸 밀립니다.",
		"repeat_line": "유리 뒤 그림자는 다시 광고 모델 자세로 멈춥니다.",
		"node_memory_phrase": "닫힌 창문 뒤 움직임",
		"outpost_reaction": "복희가 닫힌 창문 뒤 움직임을 이름표 없이 보관합니다.",
		"outpost_reaction_tag": "name_trace",
		"remote_comment_tag": "door_voice_residue",
		"remote_npc_id": "doyun",
		"facility_id": "name_archive",
	},
	"r01_story_l03_speaker_pillar": {
		"trace_id": "broken_life_broadcast",
		"display_name": "끊긴 생활 방송",
		"source_object_type": "speaker",
		"prompt": "생활 방송 잔향 확인",
		"first_line": "생활 방송은 저녁 메뉴를 말하다가 심사 예약음으로 끊깁니다.",
		"repeat_line": "방송은 같은 메뉴와 같은 예약음 사이에서만 튑니다.",
		"node_memory_phrase": "끊긴 생활 방송",
		"outpost_reaction": "세븐이 생활 방송 끊김을 송출 기록 후보 옆에 붙입니다.",
		"outpost_reaction_tag": "signal",
		"remote_comment_tag": "broken_life_broadcast",
		"remote_npc_id": "popsy",
		"facility_id": "sortie_board",
	},
	"r01_story_l04_drain_trace": {
		"trace_id": "rescue_request_log",
		"display_name": "구조 요청 로그",
		"source_object_type": "drain",
		"prompt": "구조 요청 조각 확인",
		"first_line": "배수구 아래 젖은 로그가 구조 요청의 앞부분만 남깁니다.",
		"repeat_line": "젖은 로그는 같은 앞부분만 다시 번집니다.",
		"node_memory_phrase": "구조 요청 로그 조각",
		"outpost_reaction": "팝시가 구조 요청 조각의 오염음을 흔적 보관실에서 분리합니다.",
		"outpost_reaction_tag": "contamination",
		"remote_comment_tag": "rescue_request_log",
		"remote_npc_id": "bokhee",
		"facility_id": "trace_storage_room",
	},
	"r01_story_l05_fake_return_sign": {
		"trace_id": "outpost_remote_echo",
		"display_name": "보급소 원격 호출 잔향",
		"source_object_type": "fake_return_sign",
		"prompt": "원격 호출 출처 확인",
		"first_line": "보급소 호출처럼 들리지만 침묵 보급소의 빈 주파수가 없습니다.",
		"repeat_line": "가짜 호출은 이미 보급소 인증 아님으로 접혔습니다.",
		"node_memory_phrase": "가짜 회수선 잔향",
		"outpost_reaction": "세븐이 가짜 회수선 잔향에 보급소 인증 아님 표식을 붙입니다.",
		"outpost_reaction_tag": "fake_return",
		"remote_comment_tag": "outpost_remote_echo",
		"remote_npc_id": "seven",
		"facility_id": "sortie_board",
	},
	"r01_story_l03_model_entry": {
		"trace_id": "missing_person_register",
		"display_name": "실종자 등록 기록",
		"source_object_type": "model_house_entry",
		"prompt": "실종자 등록 기록 확인",
		"first_line": "모델하우스 입구의 등록표가 가족 칸보다 실종 칸을 먼저 채웁니다.",
		"repeat_line": "등록표의 실종 칸은 이미 출격 게시판에 복사됐습니다.",
		"node_memory_phrase": "실종자 등록 기록",
		"outpost_reaction": "세븐과 팝시가 실종자 등록을 모델하우스 신호와 나란히 둡니다.",
		"outpost_reaction_tag": "boss_signal",
		"remote_comment_tag": "missing_person_register",
		"remote_npc_id": "seven",
		"facility_id": "sortie_board",
	},
}

static func npc_profile(npc_id: String) -> Dictionary:
	for npc in OUTPOST_NPCS:
		if String(npc.get("npc_id", "")) == npc_id:
			return Dictionary(npc).duplicate(true)
	return {}

static func npc_display_name(npc_id: String) -> String:
	var profile := npc_profile(npc_id)
	return String(profile.get("display_name", npc_id))

static func outpost_npc_markers(state: Dictionary) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var focus_npc := String(state.get("last_outpost_npc_id", ""))
	for raw in OUTPOST_NPCS:
		var marker := Dictionary(raw).duplicate(true)
		var npc_id := String(marker.get("npc_id", ""))
		var focused := focus_npc == npc_id
		marker["focused"] = focused
		marker["active"] = focused or _npc_active(npc_id, state)
		marker["reaction_line"] = outpost_reaction_line(npc_id, state)
		result.append(marker)
	return result

static func active_reaction_markers(state: Dictionary, max_lines: int = 2) -> Array[Dictionary]:
	var markers := outpost_npc_markers(state)
	var result: Array[Dictionary] = []
	for marker in markers:
		if bool(marker.get("focused", false)) and String(marker.get("reaction_line", "")) != "":
			result.append(marker)
	for marker in markers:
		if result.size() >= max_lines:
			return result
		if bool(marker.get("focused", false)):
			continue
		if bool(marker.get("active", false)) and String(marker.get("reaction_line", "")) != "":
			result.append(marker)
	return result

static func outpost_reaction_line(npc_id: String, state: Dictionary) -> String:
	var profile := npc_profile(npc_id)
	var lines := Dictionary(profile.get("short_lines", {}))
	var recall_quality := String(state.get("recall_quality", ""))
	var outcome := String(state.get("outcome", ""))
	match npc_id:
		"mina":
			if recall_quality == "story_recall":
				return String(lines.get("first_recall", ""))
			if String(state.get("tag_ledger_summary", "")).find("보류") != -1:
				return String(lines.get("settlement", ""))
			if int(state.get("allocation_human_count", 0)) > 0:
				return String(lines.get("food_tag", ""))
		"doyun":
			if recall_quality == "emergency_retrieval":
				return String(lines.get("emergency_retrieval", ""))
			if int(state.get("allocation_robot_count", 0)) > 0:
				return String(lines.get("power_tag", ""))
			if String(state.get("campaign_outpost_reaction", "")).find("현관 센서") != -1:
				return String(lines.get("sensor", ""))
		"popsy":
			if int(state.get("r01_contamination_total", 0)) > 0:
				return String(lines.get("contamination", ""))
			if String(state.get("campaign_outpost_reaction", "")).find("가짜") != -1:
				return String(lines.get("fake_return", ""))
			if outcome == "extract_memory":
				return String(lines.get("photo", ""))
		"seven":
			if String(state.get("campaign_outpost_reaction", "")).find("가짜") != -1:
				return String(lines.get("fake_return", ""))
			if int(state.get("boss_analysis_level", 0)) > 0 or outcome == "destroy_node":
				return String(lines.get("boss_signal", ""))
			if int(state.get("signal_record_count", 0)) > 0 or int(state.get("allocation_signal_count", 0)) > 0:
				return String(lines.get("signal", ""))
		"bokhee":
			if recall_quality == "story_recall":
				return String(lines.get("first_recall", ""))
			if int(state.get("boss_analysis_level", 0)) > 0:
				return String(lines.get("name_trace", ""))
			if outcome == "extract_memory":
				return String(lines.get("photo", ""))
	return String(lines.get("default", ""))

static func outpost_npc_debug_line() -> String:
	var parts: Array[String] = []
	for npc in OUTPOST_NPCS:
		parts.append("%s@%s:%s" % [
			String(npc.get("npc_id", "")),
			String(npc.get("facility", "")),
			String(npc.get("debug_note", "")),
		])
	return " | ".join(parts)

static func active_npc_summary_line(state: Dictionary) -> String:
	var parts: Array[String] = []
	for marker in outpost_npc_markers(state):
		if bool(marker.get("active", false)):
			parts.append("%s@%s" % [String(marker.get("npc_id", "")), String(marker.get("facility", ""))])
	return "none" if parts.is_empty() else ", ".join(parts)

static func field_trace_for_object(object: Dictionary) -> Dictionary:
	var object_id := String(object.get("id", ""))
	var raw := Dictionary(FIELD_TRACE_BY_OBJECT.get(object_id, {}))
	if raw.is_empty():
		return {}
	var trace := raw.duplicate(true)
	trace["zone_id"] = String(object.get("zone_id", trace.get("zone_id", "")))
	trace["source_object_type"] = String(trace.get("source_object_type", object.get("kind", "object")))
	return trace

static func field_trace_count_for_objects(objects: Array[Dictionary]) -> int:
	var seen := {}
	for object in objects:
		var trace := field_trace_for_object(object)
		var trace_id := String(trace.get("trace_id", ""))
		if trace_id != "":
			seen[trace_id] = true
	return seen.size()

static func field_trace_summary_for_objects(objects: Array[Dictionary]) -> String:
	var counts := {}
	for object in objects:
		var trace := field_trace_for_object(object)
		var trace_id := String(trace.get("trace_id", ""))
		if trace_id == "":
			continue
		counts[trace_id] = int(counts.get(trace_id, 0)) + 1
	var parts: Array[String] = []
	for trace_id in counts.keys():
		parts.append("%s=%d" % [String(trace_id), int(counts[trace_id])])
	parts.sort()
	return "none" if parts.is_empty() else ", ".join(parts)

static func field_trace_debug_line(counts: Dictionary, remote_seen: Dictionary) -> String:
	return "trace_counts=%s remote_seen=%s" % [_counts_line(counts), _counts_line(remote_seen)]

static func remote_comment_for_trace(trace: Dictionary) -> String:
	var npc_id := String(trace.get("remote_npc_id", ""))
	var tag := String(trace.get("remote_comment_tag", trace.get("trace_id", "")))
	var profile := npc_profile(npc_id)
	var lines := Dictionary(profile.get("field_remote_lines", {}))
	var line := String(lines.get(tag, ""))
	if line == "":
		return ""
	return "%s: %s" % [npc_display_name(npc_id), line]

static func _npc_active(npc_id: String, state: Dictionary) -> bool:
	var recall_quality := String(state.get("recall_quality", ""))
	var campaign_reaction := String(state.get("campaign_outpost_reaction", ""))
	match npc_id:
		"mina":
			return bool(state.get("first_recall_seen", false)) or int(state.get("allocation_human_count", 0)) > 0 or recall_quality == "stable_recall" or recall_quality == "story_recall"
		"doyun":
			return bool(state.get("first_recall_seen", false)) or int(state.get("allocation_robot_count", 0)) > 0 or recall_quality == "emergency_retrieval" or campaign_reaction.find("현관 센서") != -1
		"popsy":
			return int(state.get("r01_contamination_total", 0)) > 0 or campaign_reaction.find("가짜") != -1 or String(state.get("outcome", "")) == "extract_memory"
		"seven":
			return int(state.get("signal_record_count", 0)) > 0 or int(state.get("allocation_signal_count", 0)) > 0 or campaign_reaction.find("출격 게시판") != -1
		"bokhee":
			return recall_quality == "story_recall" or int(state.get("boss_analysis_level", 0)) > 0 or String(state.get("outcome", "")) == "extract_memory"
		_:
			return false

static func _counts_line(counts: Dictionary) -> String:
	if counts.is_empty():
		return "none"
	var parts: Array[String] = []
	for key in counts.keys():
		parts.append("%s=%s" % [String(key), str(counts[key])])
	parts.sort()
	return ",".join(parts)
