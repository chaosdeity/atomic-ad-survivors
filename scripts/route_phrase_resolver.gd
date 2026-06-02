extends RefCounted

const OUTCOME_DESTROY_NODE := "destroy_node"
const OUTCOME_EXTRACT_MEMORY := "extract_memory"
const TICKET_FOOD := "food"
const TICKET_POWER := "power"
const TICKET_SIGNAL := "signal"

static func r01_sortie_goal_phrase(state: Dictionary) -> String:
	var outcome := String(state.get("r01_boss_outcome", ""))
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	var visit_index := maxi(0, int(state.get("r01_revisit_count", 0)) - 1)
	var learning_phrase := _learning_goal_phrase(state, visit_index)
	if bool(state.get("r01_followup_ready", false)) and outcome != "":
		return _pick([
			"모델하우스 결절 심사 반려 기록을 바탕으로 상위 송출 잔향을 추적한다.",
			"외곽 주택가는 조용해졌지만, 상위 송출 신호는 아직 끊기지 않았다.",
		], visit_index)
	if outcome == OUTCOME_DESTROY_NODE:
		return _pick([
			"결절 일부 침묵 뒤 낮아진 광고음 사이로 남은 송출 잔향을 확인한다.",
			"또렷해진 문패들을 따라 모델하우스 반려 기록을 재조사한다.",
		], visit_index)
	if outcome == OUTCOME_EXTRACT_MEMORY:
		return _pick([
			"가족사진 뒤편의 상위 송출 잔향을 대조한다.",
			"윤서의 이름을 부르는 광고 문구의 출처를 확인한다.",
		], visit_index)
	if int(state.get("r01_contamination_total", 0)) > 0:
		return _contamination_goal_phrase(state, visit_index)
	if learning_phrase != "":
		return learning_phrase
	match records:
		0:
			return _pick([
				"공공 대피 안내가 멈춘 오래된 공공 안내판과 14차 가족 복구 운용 라벨을 확인한다.",
				"방문 기록 없음, 가족 구성 보류로 남은 외곽 source를 추적한다.",
			], visit_index)
		1:
			return _pick([
				"첫 잡음 영수증을 보급소 기록판에 고정했다. 다음 신호는 더 긴 광고 뒤에 숨어 있다.",
				"영수증 잡음이 모델하우스 방향을 한 번 가리켰다.",
			], visit_index)
		2:
			return _pick([
				"길 잃은 카탈로그가 주택가 루프의 방향을 맞추기 시작했다.",
				"같은 집들이 같은 순서로 반복되지 않는다. 모델하우스 접근이 가까워졌다.",
			], visit_index)
		_:
			return _pick([
				"개장 전 점검표가 스마일 홈 심사관 접근 절차를 확정했다. 중심 결절을 노출시킨다.",
				"외곽 주택가 중앙의 모델하우스 결절에 접근할 수 있다.",
			], visit_index)

static func r01_sortie_goal_short_phrase(state: Dictionary) -> String:
	var outcome := String(state.get("r01_boss_outcome", ""))
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	var visit_index := maxi(0, int(state.get("r01_revisit_count", 0)) - 1)
	var learning_short := _learning_goal_short_phrase(state, visit_index)
	if bool(state.get("r01_followup_ready", false)) and outcome != "":
		return _pick([
			"상위 송출 잔향 추적",
			"남은 송출 신호 확인",
		], visit_index)
	if outcome == OUTCOME_DESTROY_NODE:
		return _pick([
			"결절 일부 침묵 확인",
			"모델하우스 반려 기록 확인",
		], visit_index)
	if outcome == OUTCOME_EXTRACT_MEMORY:
		return _pick([
			"상위 송출 잔향 대조",
			"윤서를 부르는 광고 출처 확인",
		], visit_index)
	if int(state.get("r01_contamination_total", 0)) > 0:
		return _contamination_goal_short_phrase(state, visit_index)
	if learning_short != "":
		return learning_short
	match records:
		0:
			return _pick([
				"공공 안내/14차 라벨 확인",
				"가족 구성 보류 추적",
			], visit_index)
		1:
			return _pick([
				"두 번째 신호 기록 찾기",
				"모델하우스 방향 확인",
			], visit_index)
		2:
			return _pick([
				"주택가 루프 방향 맞추기",
				"모델하우스 접근 신호 확인",
			], visit_index)
		_:
			return _pick([
				"중심 결절 노출 준비",
				"모델하우스 결절 접근",
			], visit_index)

static func r01_outpost_phrase(state: Dictionary) -> String:
	var outcome := String(state.get("r01_boss_outcome", ""))
	var learning_outpost := _learning_outpost_phrase(state)
	match outcome:
		OUTCOME_DESTROY_NODE:
			return "결절 일부 침묵 뒤 광고음이 한 겹 낮아졌다. 상위 송출 잔향은 출격 게시판에 남아 있습니다."
		OUTCOME_EXTRACT_MEMORY:
			return "이름 보관함 이관 기록 뒤편에서 낡은 가족사진 냄새가 난다. 출격 게시판에 상위 송출 잔향이 더 선명해졌다."
		_:
			if int(state.get("r01_contamination_total", 0)) > 0:
				var contamination_phrase := _contamination_outpost_phrase(state)
				return "%s / %s" % [contamination_phrase, learning_outpost] if learning_outpost != "" else contamination_phrase
			if learning_outpost != "":
				return learning_outpost
			return "인양 완료. 정산 카운터가 승인/보류/오염을 분리하고, 이름 보관함은 스마일홈 이름 판정을 확정하지 않습니다."

static func r01_finale_recovery_description(state: Dictionary) -> String:
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	var visit_index := maxi(0, int(state.get("r01_revisit_count", 0)) - 1)
	match records:
		0:
			return _pick([
				"침묵 보급소가 등록 임계 직전 회수선을 고정했습니다. 14차 가족 구성 보정 라벨은 아직 윤서의 이름을 확정하지 못합니다.",
				"같은 울타리를 세 번 지나친 뒤에야 보급소 신호가 돌아왔습니다. 정산 카운터는 승인과 보류를 분리합니다.",
			], visit_index)
		1:
			return _pick([
				"첫 잡음 영수증이 끊기기 전에 회수됐습니다. 다음 광고는 더 긴 문장 뒤에 숨어 있습니다.",
				"보급소 기록판에 얇은 영수증 잡음이 붙었습니다. 주택가는 다음 루프를 이미 준비하고 있습니다.",
			], visit_index)
		2:
			return _pick([
				"길 잃은 카탈로그가 모델하우스 쪽으로 접혔습니다. 아직 마지막 절차가 빠져 있습니다.",
				"같은 집들의 순서가 어긋나기 시작했습니다. 보급소가 세 번째 신호 자리를 비워 둡니다.",
			], visit_index)
		_:
			return _pick([
				"개장 전 점검표가 완성됐습니다. 외곽 주택가 중앙의 모델하우스 결절이 다음 출격을 기다립니다.",
				"상위 송출 잔향이 끊기지 않고 보급소까지 넘어왔습니다. 스마일 홈 심사관의 검증 신호가 가까워졌습니다.",
			], visit_index)

static func r01_finale_recovery_progress_phrase(state: Dictionary) -> String:
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	match records:
		0:
			return "다음 출격: 오래된 공공 안내판과 14차 갱신 라벨 확인"
		1:
			return "다음 출격: 두 번째 신호 기록 추적"
		2:
			return "다음 출격: 모델하우스 접근 신호 확인"
		_:
			return "다음 출격: 모델하우스 결절 접근 준비"

static func _contamination_goal_phrase(state: Dictionary, visit_index: int) -> String:
	match String(state.get("r01_last_contamination_ticket", "")):
		TICKET_SIGNAL:
			return _pick([
				"오염된 수신태그 꼬리표가 오픈하우스 광고판에 남았다. 같은 신호를 더 조심스럽게 추적한다.",
				"출격 게시판의 핀이 흔들린다. 오염된 신호가 모델하우스 방향을 과하게 밝힌다.",
			], visit_index)
		TICKET_POWER:
			return _pick([
				"오염된 충전태그 때문에 로봇 검수가 예민해졌다. 정비대가 광고 로봇 명령 흔적을 확인한다.",
				"충전태그 꼬리표가 장갑 광고를 불렀다. 로봇 명령권의 틈을 다시 찾는다.",
			], visit_index)
		TICKET_FOOD:
			return _pick([
				"오염된 식량태그 꼬리표가 끊긴 광고 산책로에 남았다. 배급 약관의 뒤끝을 확인한다.",
				"식량태그가 승인됐지만 냄새가 남았다. 산책로의 친절한 화살표를 다시 의심한다.",
			], visit_index)
		_:
			return "오염 꼬리표가 R01 약관에 남았다. 다음 출격에서 감사 압력을 확인한다."

static func _contamination_goal_short_phrase(state: Dictionary, visit_index: int) -> String:
	match String(state.get("r01_last_contamination_ticket", "")):
		TICKET_SIGNAL:
			return _pick(["오염 수신태그 추적", "흔들리는 게시판 핀 확인"], visit_index)
		TICKET_POWER:
			return _pick(["오염 충전태그 검수", "로봇 명령 흔적 확인"], visit_index)
		TICKET_FOOD:
			return _pick(["오염 식량태그 꼬리표 확인", "끊긴 산책로 재확인"], visit_index)
		_:
			return "오염 꼬리표 확인"

static func _contamination_outpost_phrase(state: Dictionary) -> String:
	var summary := String(state.get("r01_contamination_summary", "오염 꼬리표"))
	match String(state.get("r01_last_contamination_ticket", "")):
		TICKET_SIGNAL:
			return "%s. 세븐이 게시판 핀을 한 번 더 누르지만, 핀 끝이 광고음에 떨린다." % summary
		TICKET_POWER:
			return "%s. 정비대가 충전태그 접점을 닦아도 검수음이 낮게 남는다." % summary
		TICKET_FOOD:
			return "%s. 인간 구역은 먹었지만, 배급표 모서리에 작은 약관 번호가 남았다." % summary
		_:
			return "%s. 보급소 기록판이 같은 표를 두 번 확인한다." % summary

static func _learning_goal_phrase(state: Dictionary, visit_index: int) -> String:
	var name_pressure := int(state.get("r01_name_pressure", 0))
	var fake_accuracy := int(state.get("r01_fake_recall_accuracy", 0))
	var tag_contamination := int(state.get("r01_tag_contamination", 0))
	var boss_residue := int(state.get("r01_boss_residue", 0))
	var outpost_trace_leak := int(state.get("r01_outpost_trace_leak", 0))
	var role_guess := String(state.get("r01_yunseo_role_guess", "외부인"))
	if boss_residue > 0:
		return _pick([
			"문패가 덜 공격적이지만 윤서 이름 일부를 더 정확히 부른다. 상위 송출 잔향을 대조한다.",
			"우편함이 미수령 대신 재심사 안내를 발송한다. 모델하우스 결절은 일부만 침묵했다.",
		], visit_index)
	if fake_accuracy > 0:
		return _pick([
			"가짜 회수 표식의 모방 정확도가 올랐다. 보급소 침묵이 빠진 지점을 다시 대조한다.",
			"지난 출격의 귀환선 패턴을 R01이 배웠다. 가짜 회수 표식을 먼저 반려한다.",
		], visit_index)
	if name_pressure > 0:
		return _pick([
			"문패와 현관 센서가 윤서를 %s로 읽기 시작했다. 이름 라벨 덮어쓰기를 억제한다." % role_guess,
			"윤서 이름 압력이 문패 골목에 남았다. 고객 보류 라벨을 보급소 보류로 분리한다.",
		], visit_index)
	if role_guess == "보호자 후보" or role_guess == "수령인 후보" or role_guess == "가족 슬롯":
		return _pick([
			"가족사진 창문과 현관 센서가 윤서를 %s로 다시 읽는다. 가족 칸 배정 전 보류 근거를 찾는다." % role_guess,
			"빈 얼굴 프레임이 윤서 방향으로 돌아본다. 역할 판정을 확정하지 않을 흔적을 먼저 회수한다.",
		], visit_index)
	if tag_contamination > 0:
		return _pick([
			"우편함과 배수로 흔적에 오염 꼬리표가 붙었다. 승인 태그와 광고 약관을 분리한다.",
			"태그 오염 압력이 남아 있다. 정산 전 source 판정을 다시 확인한다.",
		], visit_index)
	if outpost_trace_leak > 0:
		return _pick([
			"배수로 침묵 주머니의 젖은 기록이 늘었다. 낮은 신호와 회수선 불안을 따로 확인한다.",
			"보급소 흔적 누출이 배수로에 남았다. 인양 박자가 약해지기 전에 source를 반려한다.",
		], visit_index)
	return ""

static func _learning_goal_short_phrase(state: Dictionary, visit_index: int) -> String:
	if int(state.get("r01_boss_residue", 0)) > 0:
		return _pick(["재심사 잔향 확인", "상위 송출 잔향 대조"], visit_index)
	if int(state.get("r01_fake_recall_accuracy", 0)) > 0:
		return _pick(["가짜 회수 표식 반려", "귀환선 모방 대조"], visit_index)
	if int(state.get("r01_name_pressure", 0)) > 0:
		return _pick(["문패 이름 압력 억제", "고객 보류 라벨 분리"], visit_index)
	var role_guess := String(state.get("r01_yunseo_role_guess", "외부인"))
	if role_guess == "보호자 후보" or role_guess == "수령인 후보" or role_guess == "가족 슬롯":
		return _pick(["역할 판정 보류", "빈칸 구도 대조"], visit_index)
	if int(state.get("r01_tag_contamination", 0)) > 0:
		return _pick(["태그 오염 분리", "source 정산 재검"], visit_index)
	if int(state.get("r01_outpost_trace_leak", 0)) > 0:
		return _pick(["배수로 낮은 신호 확인", "회수선 불안 분리"], visit_index)
	return ""

static func _learning_outpost_phrase(state: Dictionary) -> String:
	var role_guess := String(state.get("r01_yunseo_role_guess", "외부인"))
	var name_pressure := int(state.get("r01_name_pressure", 0))
	var fake_accuracy := int(state.get("r01_fake_recall_accuracy", 0))
	var tag_contamination := int(state.get("r01_tag_contamination", 0))
	var route_memory := int(state.get("r01_route_memory", 0))
	var boss_residue := int(state.get("r01_boss_residue", 0))
	var outpost_trace_leak := int(state.get("r01_outpost_trace_leak", 0))
	if name_pressure <= 0 and fake_accuracy <= 0 and tag_contamination <= 0 and route_memory <= 0 and boss_residue <= 0 and outpost_trace_leak <= 0:
		return ""
	if boss_residue > 0:
		return "출격 게시판: 모델하우스 결절 심사 반려. 결절 일부 침묵, 상위 송출 잔향 남음. 이름 보관함은 윤서=고객 보류를 유지합니다."
	if name_pressure > 0:
		return "이름 보관함: 윤서 이름 옆에 %s 흔적을 붙이고 세대 칸 확정은 보류합니다. 이름 압력 %d / 오염 %d / 가짜 회수 %d" % [
			role_guess,
			name_pressure,
			tag_contamination,
			fake_accuracy,
		]
	if outpost_trace_leak > 0:
		return "출격 게시판: 배수로 젖은 기록 %d. 낮은 신호와 회수선 불안을 분리해 재출격 경로에 표시합니다." % outpost_trace_leak
	return "R01 학습값: 윤서=%s / 이름 압력 %d / 가짜 회수 정확도 %d / 태그 오염 %d / 보스 잔향 %d" % [
		role_guess,
		name_pressure,
		fake_accuracy,
		tag_contamination,
		boss_residue,
	]

static func _pick(phrases: Array[String], index: int) -> String:
	return phrases[abs(index) % phrases.size()]
