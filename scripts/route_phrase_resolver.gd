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
	if bool(state.get("r01_followup_ready", false)) and outcome != "":
		return _pick([
			"스마일 홈 결절 처리 기록을 바탕으로 상위 송출 잔향을 추적한다.",
			"외곽 주택가는 조용해졌지만, 상위 송출 신호는 아직 끊기지 않았다.",
		], visit_index)
	if outcome == OUTCOME_DESTROY_NODE:
		return _pick([
			"스마일 홈의 낮아진 광고음 사이로 남은 결절 잔향을 확인한다.",
			"또렷해진 문패들을 따라 모델하우스 잔해를 재조사한다.",
		], visit_index)
	if outcome == OUTCOME_EXTRACT_MEMORY:
		return _pick([
			"가족사진 뒤편의 상위 송출 잔향을 대조한다.",
			"윤서의 이름을 부르는 광고 문구의 출처를 확인한다.",
		], visit_index)
	if int(state.get("r01_contamination_total", 0)) > 0:
		return _contamination_goal_phrase(state, visit_index)
	match records:
		0:
			return _pick([
				"외곽 주택가의 신호 이벤트를 추적한다.",
				"모델하우스 방향 광고가 반복되는 지점을 확인한다.",
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
	if bool(state.get("r01_followup_ready", false)) and outcome != "":
		return _pick([
			"상위 송출 잔향 추적",
			"남은 송출 신호 확인",
		], visit_index)
	if outcome == OUTCOME_DESTROY_NODE:
		return _pick([
			"낮아진 광고음의 잔향 확인",
			"모델하우스 잔해 재조사",
		], visit_index)
	if outcome == OUTCOME_EXTRACT_MEMORY:
		return _pick([
			"상위 송출 잔향 대조",
			"윤서를 부르는 광고 출처 확인",
		], visit_index)
	if int(state.get("r01_contamination_total", 0)) > 0:
		return _contamination_goal_short_phrase(state, visit_index)
	match records:
		0:
			return _pick([
				"외곽 주택가 신호 추적",
				"반복 광고 지점 확인",
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
	match outcome:
		OUTCOME_DESTROY_NODE:
			return "스마일 홈의 광고음이 한 겹 낮아졌다. 정비대 위 전단들이 덜 떨린다."
		OUTCOME_EXTRACT_MEMORY:
			return "이름 보관함 뒤편에서 낡은 가족사진 냄새가 난다. 출격 게시판에 상위 송출 잔향이 더 선명해졌다."
		_:
			if int(state.get("r01_contamination_total", 0)) > 0:
				return _contamination_outpost_phrase(state)
			return "외곽 주택가 신호는 아직 가족 광고의 외피를 유지 중이다. 출격 게시판이 모델하우스 방향을 제대로 붙잡지 못한다."

static func r01_finale_recovery_description(state: Dictionary) -> String:
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	var visit_index := maxi(0, int(state.get("r01_revisit_count", 0)) - 1)
	match records:
		0:
			return _pick([
				"침묵 보급소가 외곽 주택가의 회수선을 고정했습니다. 주택가의 광고음은 아직 윤서의 이름을 정확히 발음하지 못합니다.",
				"같은 울타리를 세 번 지나친 뒤에야 보급소 신호가 돌아왔습니다. 기록판은 아직 빈칸을 남겨 둡니다.",
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
			return "다음 출격: 첫 신호 이벤트 추적"
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

static func _pick(phrases: Array[String], index: int) -> String:
	return phrases[abs(index) % phrases.size()]
