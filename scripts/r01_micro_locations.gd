extends RefCounted

const LOCATION_DEFS := [
	{
		"location_id": "l01_public_anchor",
		"display_name": "오래된 공공 안내판",
		"zone_id": "silence_edge_start",
		"entry_object_id": "r01_story_l01_outer_sign",
		"visual_style": "public_anchor",
		"camera_offset": Vector2(18, -12),
		"overlay_offset": Vector2(2, -8),
		"overlay_size": Vector2(188, 116),
		"visual_markers": ["dead_public_notice", "smilehome_revision_label", "right_notice_off"],
		"entry_prompt": "공공 안내판 확인",
		"entry_phrase": "오래된 공공 안내판 앞입니다. 시민 안내는 꺼졌고, 그 위로 입주 보정 라벨만 갱신됩니다.",
		"exit_phrase": "공공 안내판에서 물러났습니다. 권리 안내는 꺼졌고 가족 구성 보정만 남았습니다.",
		"risk_level": 0,
		"noncombat_anchor": true,
		"npc_trace_tag": "old_public_notice",
		"outpost_reaction_tag": "public_anchor",
		"campaign_memory_tag": "public_anchor_checked",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"inspection_points": [
			{
				"point_id": "public_notice",
				"display_name": "공공 대피 안내",
				"prompt": "공공 대피 안내 확인",
				"first_phrase": "공공 대피 안내는 오래전에 멈췄습니다. 그 위로 스마일홈 라벨만 갱신됩니다.",
				"repeat_phrase": "공공 안내는 응답하지 않고 스마일홈 라벨만 다시 깜박입니다.",
				"interaction_type": "확인",
				"risk_hint": "권리 안내: 응답 없음. 가족 구성 보정: 활성.",
				"tag_hint": "태그 없음. R01이 더 오래된 생활권 위에 덧씌워졌다는 기준점.",
				"noncombat_anchor": true,
				"source_object_id": "r01_story_l01_outer_sign",
				"overlay_pos": Vector2(-42, -8),
			},
			{
				"point_id": "revision_label_14",
				"display_name": "14차 갱신 라벨",
				"prompt": "14차 갱신 라벨 확인",
				"first_phrase": "스마일홈 가족 복구 운용 14차. 빈 세대 재배정 기준을 다시 수정합니다.",
				"repeat_phrase": "14차 라벨은 연도 표식이 아니라 가족 복구 운용 회차로 남아 있습니다.",
				"interaction_type": "대조",
				"risk_hint": "14년은 대사고 후 시간이 아니라 R01 가족 구성 보정 운용 기간입니다.",
				"tag_hint": "태그 없음. 가족 복구 운용 14차 기준.",
				"noncombat_anchor": true,
				"source_object_id": "r01_story_l01_revision_label",
				"overlay_pos": Vector2(42, -18),
			},
			{
				"point_id": "rights_vs_family",
				"display_name": "권리/입주 층",
				"prompt": "겹친 안내층 대조",
				"first_phrase": "권리 안내: 응답 없음. 가족 구성 보정: 활성. R01은 폐허가 아니라 오래된 생활 자동화 위에 덧씌워진 캠페인입니다.",
				"repeat_phrase": "꺼진 권리 안내와 켜진 입주 보정이 같은 판 위에서 겹칩니다.",
				"interaction_type": "대조",
				"risk_hint": "시민 안내는 꺼졌고, 입주 보정만 남았습니다.",
				"tag_hint": "태그 없음. 첫 30분 세계 기준 앵커.",
				"noncombat_anchor": true,
				"source_object_id": "r01_story_l01_outer_sign",
				"overlay_pos": Vector2(0, 28),
			},
		],
	},
	{
		"location_id": "l02_porch_gap",
		"display_name": "현관 앞",
		"zone_id": "subdivision_loop_center",
		"entry_object_id": "r01_story_l02_closed_door",
		"visual_style": "porch",
		"camera_offset": Vector2(22, -16),
		"overlay_offset": Vector2(4, -10),
		"overlay_size": Vector2(178, 124),
		"visual_markers": ["door_frame", "door_gap_light", "sensor_line", "address_sticker", "warning_lamp"],
		"entry_prompt": "현관 앞 확인",
		"entry_phrase": "문은 열리지 않습니다. 문패와 현관 센서가 방문자를 가족/입주 판정 기관처럼 읽습니다.",
		"exit_phrase": "현관 앞에서 한 걸음 물러났습니다. 판정은 확정되지 않았습니다.",
		"risk_level": 2,
		"npc_trace_tag": "door_voice_residue",
		"outpost_reaction_tag": "sensor",
		"campaign_memory_tag": "porch_gap_checked",
		"facility_id": "maintenance_bench",
		"npc_id": "doyun",
		"inspection_points": [
			{
				"point_id": "door_voice",
				"display_name": "문패 음성",
				"prompt": "문패 음성 확인",
				"first_phrase": "문패 아래에서 방문 기록 없음, 가족 구성 보류라는 목소리가 새어 나옵니다.",
				"repeat_phrase": "문패 목소리는 가족 구성 보류에서 다시 끊깁니다.",
				"interaction_type": "조사",
				"risk_hint": "반복 현관의 경고선이 윤서를 방문객 후보로 다시 읽습니다.",
				"tag_hint": "이름/생활 보급 흔적",
				"source_effect_hint": "nameplate",
				"source_object_id": "r01_story_l02_closed_door",
				"overlay_pos": Vector2(-36, -4),
			},
			{
				"point_id": "front_sensor",
				"display_name": "현관 센서",
				"prompt": "센서 주파수 대조",
				"first_phrase": "현관 센서가 윤서의 장비 신호를 방문 심사 ping으로 긁습니다.",
				"repeat_phrase": "센서 주파수는 이미 정비대의 보류 기록으로 접혔습니다.",
				"interaction_type": "검증",
				"risk_hint": "charger/speaker source가 잠깐 표시됩니다.",
				"tag_hint": "충전태그 후보가 아니라 센서 주파수 근거",
				"source_effect_hint": "doorbell",
				"source_object_id": "r01_story_l02_front_sensor",
				"overlay_pos": Vector2(42, -28),
			},
			{
				"point_id": "address_sticker",
				"display_name": "주소 등록 스티커",
				"prompt": "주소 등록 스티커 확인",
				"first_phrase": "주소는 둘인데 수령인은 비어 있습니다. 같은 집이 다른 가족을 기다립니다.",
				"repeat_phrase": "주소 스티커는 같은 빈칸만 다시 보여줍니다.",
				"interaction_type": "조사",
				"risk_hint": "우편함 전단 source가 더 잘 보입니다.",
				"tag_hint": "식량태그가 아니라 주소 중복 근거",
				"source_effect_hint": "mailbox",
				"source_object_id": "r01_story_l02_mailbox",
				"overlay_pos": Vector2(38, 34),
			},
		],
	},
	{
		"location_id": "l02_family_window",
		"display_name": "가족사진 창문 앞",
		"zone_id": "subdivision_loop_center",
		"entry_object_id": "r01_story_l02_family_window",
		"visual_style": "window",
		"camera_offset": Vector2(-8, -30),
		"overlay_offset": Vector2(0, -18),
		"overlay_size": Vector2(188, 118),
		"visual_markers": ["window_frame", "photo_afterimage", "inside_shadow", "smile_review_check"],
		"entry_prompt": "창문 가까이 보기",
		"entry_phrase": "유리 안쪽의 가족사진이 웃는 얼굴을 다시 맞춥니다. 회수할 것은 보상이 아니라 증거입니다.",
		"exit_phrase": "창문 앞 잔향에서 물러났습니다. 사진 판정은 보류됐습니다.",
		"risk_level": 2,
		"npc_trace_tag": "family_photo_afterimage",
		"outpost_reaction_tag": "photo",
		"campaign_memory_tag": "family_window_checked",
		"facility_id": "trace_storage_room",
		"npc_id": "popsy",
		"inspection_points": [
			{
				"point_id": "photo_afterimage",
				"display_name": "가족사진 잔상",
				"prompt": "사진 잔상 확인",
				"first_phrase": "얼굴은 광고 모델로 바뀌었지만 손잡은 자세는 남았습니다.",
				"repeat_phrase": "사진은 같은 웃는 얼굴만 다시 정렬합니다.",
				"interaction_type": "조사",
				"risk_hint": "가족 심사 신호가 얇게 켜집니다.",
				"tag_hint": "이름 보관함으로 갈 기억 증거",
				"source_effect_hint": "family_photo",
				"source_object_id": "r01_story_l02_family_window",
				"overlay_pos": Vector2(-48, 0),
			},
			{
				"point_id": "smile_review_mark",
				"display_name": "미소 검수 표시",
				"prompt": "미소 검수 표시 확인",
				"first_phrase": "웃음 각도 옆에 합격 도장이 아니라 재촬영 대기표가 붙어 있습니다.",
				"repeat_phrase": "검수 표시는 같은 재촬영 번호만 반복합니다.",
				"interaction_type": "검증",
				"risk_hint": "현관 센서와 심사선이 잠깐 이어집니다.",
				"tag_hint": "스마일 홈 심사관 전조",
				"source_effect_hint": "doorbell",
				"source_object_id": "r01_story_l02_front_sensor",
				"overlay_pos": Vector2(34, -24),
			},
			{
				"point_id": "inside_movement",
				"display_name": "안쪽 움직임",
				"prompt": "안쪽 그림자 확인",
				"first_phrase": "사진 뒤편에서 사람 그림자가 한 칸 밀렸다가 광고 자세로 멈춥니다.",
				"repeat_phrase": "그림자는 이미 같은 자세로 고정됐습니다.",
				"interaction_type": "조사",
				"risk_hint": "signal source가 짧게 표시됩니다.",
				"tag_hint": "모델하우스 로비 쪽 잔향",
				"source_effect_hint": "family_photo",
				"source_object_id": "r01_story_l02_family_window",
				"overlay_pos": Vector2(50, 28),
			},
		],
	},
	{
		"location_id": "l03_model_lobby",
		"display_name": "모델하우스 로비 앞",
		"zone_id": "model_house_node_anchor",
		"entry_object_id": "r01_story_l03_model_entry",
		"visual_style": "model_lobby",
		"camera_offset": Vector2(34, -28),
		"overlay_offset": Vector2(8, -22),
		"overlay_size": Vector2(204, 126),
		"visual_markers": ["lobby_threshold", "reception_silhouette", "family_form_panel", "name_device", "consultation_light"],
		"entry_prompt": "로비 앞 조사",
		"entry_phrase": "모델하우스 로비는 입장을 허락하지 않고 윤서를 고객 보류 칸으로 밀어 넣습니다.",
		"exit_phrase": "로비 심사선 밖으로 빠져나왔습니다. 가족 칸 배정은 실패했습니다.",
		"risk_level": 3,
		"npc_trace_tag": "missing_person_register",
		"outpost_reaction_tag": "boss_signal",
		"campaign_memory_tag": "model_lobby_checked",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"inspection_points": [
			{
				"point_id": "reception_desk",
				"display_name": "접수대",
				"prompt": "접수대 기록 확인",
				"first_phrase": "접수대는 방문자보다 실종 칸을 먼저 채웁니다. 14차 가족 구성 보정 로그가 남아 있습니다.",
				"repeat_phrase": "접수대의 실종 칸은 이미 출격 게시판에 복사됐습니다.",
				"interaction_type": "조사",
				"risk_hint": "모델하우스 pressure source가 드러납니다.",
				"tag_hint": "수신태그 후보가 아니라 심사 접근 근거",
				"source_effect_hint": "model_house",
				"source_object_id": "r01_story_l03_model_entry",
				"overlay_pos": Vector2(-54, 20),
			},
			{
				"point_id": "family_form",
				"display_name": "가족 구성표",
				"prompt": "가족 구성표 대조",
				"first_phrase": "가족대표 1, 수령인 0, 보호자 후보 1. 재상담을 권합니다.",
				"repeat_phrase": "구성표의 빈칸은 이미 심사 경고로 남았습니다.",
				"interaction_type": "검증",
				"risk_hint": "상담/스피커 source가 짧게 표시됩니다.",
				"tag_hint": "팝시/세븐 반응 후보",
				"source_effect_hint": "model_house",
				"source_object_id": "r01_story_l03_consultation_booth",
				"overlay_pos": Vector2(8, -28),
			},
			{
				"point_id": "name_device",
				"display_name": "이름 등록 장치",
				"prompt": "이름 등록 장치 확인",
				"first_phrase": "등록 장치는 윤서의 이름을 가족 칸이 아니라 고객 보류 칸에 넣으려 합니다.",
				"repeat_phrase": "등록 장치는 이미 반려 흔적으로 막혀 있습니다.",
				"interaction_type": "도장",
				"risk_hint": "charger/signal source가 표시됩니다.",
				"tag_hint": "송출 기록 후보",
				"source_effect_hint": "model_house",
				"source_object_id": "r01_story_l03_name_register",
				"overlay_pos": Vector2(58, 16),
			},
		],
	},
	{
		"location_id": "l04_drain_entrance",
		"display_name": "배수로 입구",
		"zone_id": "drain_pocket_anchor",
		"entry_object_id": "r01_story_l04_drain_trace",
		"visual_style": "drain",
		"camera_offset": Vector2(0, 34),
		"overlay_offset": Vector2(0, 16),
		"overlay_size": Vector2(190, 112),
		"visual_markers": ["drain_frame", "water_lines", "wet_flyer", "broken_request", "low_signal_ripple"],
		"entry_prompt": "배수로 입구 확인",
		"entry_phrase": "배수로 안쪽에서 광고음이 낮아집니다. 낮은 신호는 캠페인을 줄이지만 인양도 불안하게 만듭니다.",
		"exit_phrase": "배수로 입구의 낮은 신호에서 물러났습니다. 회수선 박자는 따로 보관됩니다.",
		"risk_level": 2,
		"npc_trace_tag": "rescue_request_log",
		"outpost_reaction_tag": "contamination",
		"campaign_memory_tag": "drain_entrance_checked",
		"facility_id": "trace_storage_room",
		"npc_id": "bokhee",
		"inspection_points": [
			{
				"point_id": "wet_flyer",
				"display_name": "젖은 전단",
				"prompt": "젖은 전단 회수",
				"first_phrase": "전단은 젖어 있어서 쿠폰이 아니라 구조 기록처럼 남았습니다.",
				"repeat_phrase": "젖은 전단은 더 회수되지 않습니다.",
				"interaction_type": "회수",
				"risk_hint": "낮은 신호 hazard가 표시됩니다.",
				"tag_hint": "직접 보상 없음. 흔적 보관실 증거 후보",
				"source_effect_hint": "drain",
				"source_object_id": "r01_story_l04_wet_flyer",
				"overlay_pos": Vector2(-52, 12),
			},
			{
				"point_id": "rescue_request",
				"display_name": "끊긴 구조 요청",
				"prompt": "구조 요청 조각 확인",
				"first_phrase": "배수구 아래 젖은 로그가 구조 요청의 앞부분만 남깁니다.",
				"repeat_phrase": "젖은 로그는 같은 앞부분만 다시 번집니다.",
				"interaction_type": "조사",
				"risk_hint": "오염 hazard가 짧게 드러납니다.",
				"tag_hint": "복희/팝시 반응 후보",
				"source_effect_hint": "drain",
				"source_object_id": "r01_story_l04_drain_trace",
				"overlay_pos": Vector2(2, -18),
			},
			{
				"point_id": "low_signal_wave",
				"display_name": "낮은 신호 물결",
				"prompt": "낮은 신호 확인",
				"first_phrase": "낮은 신호 물결은 가짜 귀환음과 다른 박자로 흔들립니다.",
				"repeat_phrase": "낮은 신호 박자는 이미 출격 게시판에 남았습니다.",
				"interaction_type": "신호 확인",
				"risk_hint": "low_signal source가 표시됩니다.",
				"tag_hint": "수신태그가 아니라 회수선 안정 단서",
				"source_effect_hint": "drain",
				"source_object_id": "r01_story_l04_low_signal",
				"overlay_pos": Vector2(56, 18),
			},
		],
	},
	{
		"location_id": "l05_fake_shelter",
		"display_name": "가짜 표지 뒤 쉼터",
		"zone_id": "fake_return_route_anchor",
		"entry_object_id": "r01_story_l05_fake_return_sign",
		"visual_style": "fake_shelter",
		"camera_offset": Vector2(-30, -18),
		"overlay_offset": Vector2(-4, -8),
		"overlay_size": Vector2(196, 122),
		"visual_markers": ["outpost_like_mark", "wrong_recovery_line", "rear_ad_pillar", "broken_guide", "unstable_flicker"],
		"entry_prompt": "표지 뒤쪽 확인",
		"entry_phrase": "가짜 회수 표식 뒤쪽은 쉼터처럼 보이지만 보급소 침묵이 없습니다.",
		"exit_phrase": "가짜 쉼터 뒤쪽에서 빠져나왔습니다. 귀환 판정은 보류됩니다.",
		"risk_level": 3,
		"npc_trace_tag": "outpost_remote_echo",
		"outpost_reaction_tag": "fake_return",
		"campaign_memory_tag": "fake_shelter_checked",
		"facility_id": "sortie_board",
		"npc_id": "seven",
		"inspection_points": [
			{
				"point_id": "outpost_like_mark",
				"display_name": "가짜 회수 표식",
				"prompt": "가짜 회수 표식 검증",
				"first_phrase": "표식은 보급소 색을 흉내 내지만 빈 주파수는 없습니다.",
				"repeat_phrase": "닮은 표식은 이미 보급소 인증 아님, 캠페인 모방 흔적으로 접혔습니다.",
				"interaction_type": "검증",
				"risk_hint": "가짜 귀환 trigger가 드러납니다.",
				"tag_hint": "가짜 귀환 오염 경고",
				"source_effect_hint": "fake_return",
				"source_object_id": "r01_story_l05_fake_return_sign",
				"overlay_pos": Vector2(-52, -20),
			},
			{
				"point_id": "wrong_recovery_line",
				"display_name": "잘못된 회수선",
				"prompt": "회수선 출처 대조",
				"first_phrase": "회수선처럼 떨리지만 보급소 쪽 침묵이 빠져 있습니다.",
				"repeat_phrase": "잘못된 회수선은 이미 제외됐습니다.",
				"interaction_type": "신호 확인",
				"risk_hint": "뒤쪽 포위 source가 표시됩니다.",
				"tag_hint": "수신태그 없이 따르면 출처 불인정",
				"source_effect_hint": "fake_return",
				"source_object_id": "r01_story_l05_unstable_line",
				"overlay_pos": Vector2(8, 24),
			},
			{
				"point_id": "rear_ad_pillar",
				"display_name": "뒤쪽 광고 기둥",
				"prompt": "광고 기둥 확인",
				"first_phrase": "기둥은 돌아가라는 말보다 돌아온 척하라는 말을 반복합니다.",
				"repeat_phrase": "뒤쪽 기둥의 반복 문구는 이미 경고로 남았습니다.",
				"interaction_type": "조사",
				"risk_hint": "speaker/fast source가 표시됩니다.",
				"tag_hint": "세븐/복희 경고 후보",
				"source_effect_hint": "speaker",
				"source_object_id": "r01_story_l05_rear_ad_pillar",
				"overlay_pos": Vector2(58, -18),
			},
		],
	},
]

static func locations() -> Array:
	return LOCATION_DEFS.duplicate(true)

static func location_count() -> int:
	return LOCATION_DEFS.size()

static func location_by_id(location_id: String) -> Dictionary:
	for location in LOCATION_DEFS:
		if String(location.get("location_id", "")) == location_id:
			return Dictionary(location).duplicate(true)
	return {}

static func location_for_entry_object(entry_object_id: String) -> Dictionary:
	for location in LOCATION_DEFS:
		if String(location.get("entry_object_id", "")) == entry_object_id:
			return Dictionary(location).duplicate(true)
	return {}

static func inspection_points(location: Dictionary) -> Array:
	return Array(location.get("inspection_points", [])).duplicate(true)

static func inspection_point_count(location: Dictionary) -> int:
	return inspection_points(location).size()

static func point_by_id(location: Dictionary, point_id: String) -> Dictionary:
	for point in inspection_points(location):
		if String(point.get("point_id", "")) == point_id:
			return Dictionary(point).duplicate(true)
	return {}

static func point_key(location_id: String, point_id: String) -> String:
	return "%s/%s" % [location_id, point_id]

static func completed_count(location_id: String, completed_points: Dictionary) -> int:
	var count := 0
	for key in completed_points.keys():
		if bool(completed_points[key]) and String(key).begins_with("%s/" % location_id):
			count += 1
	return count

static func first_incomplete_point(location: Dictionary, completed_points: Dictionary) -> Dictionary:
	var location_id := String(location.get("location_id", ""))
	for point in inspection_points(location):
		var point_id := String(point.get("point_id", ""))
		if not bool(completed_points.get(point_key(location_id, point_id), false)):
			return Dictionary(point).duplicate(true)
	var points := inspection_points(location)
	return Dictionary(points[0]).duplicate(true) if not points.is_empty() else {}

static func all_points_completed(location: Dictionary, completed_points: Dictionary) -> bool:
	var location_id := String(location.get("location_id", ""))
	var points := inspection_points(location)
	if points.is_empty():
		return false
	return completed_count(location_id, completed_points) >= points.size()

static func memory_debug_summary(memories: Dictionary) -> String:
	if memories.is_empty():
		return "none"
	var parts: Array[String] = []
	var keys := memories.keys()
	keys.sort()
	for key in keys:
		var memory := Dictionary(memories[key])
		parts.append("%s{done=%d/%d,last=%s,risk=%s,entry=%s}" % [
			String(key),
			int(memory.get("completed_count", 0)),
			int(memory.get("point_count", 0)),
			String(memory.get("last_point_name", "")),
			String(memory.get("risk_state", "")),
			String(memory.get("entry_object_id", "")),
		])
	return " | ".join(parts)
