extends RefCounted

const OUTCOME_DESTROY_NODE := "destroy_node"
const OUTCOME_EXTRACT_MEMORY := "extract_memory"

static func r01_sortie_goal_phrase(state: Dictionary) -> String:
	var outcome := String(state.get("r01_boss_outcome", ""))
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	var visit_index := maxi(0, int(state.get("r01_revisit_count", 0)) - 1)
	if bool(state.get("r01_followup_ready", false)) and outcome != "":
		return _pick([
			"스마일 홈 결절 처리 기록을 바탕으로 캠페인 송출관의 후속 신호를 추적한다.",
			"외곽 주택가는 조용해졌지만, 송출관 쪽 신호는 아직 끊기지 않았다.",
		], visit_index)
	if outcome == OUTCOME_DESTROY_NODE:
		return _pick([
			"스마일 홈의 낮아진 광고음 사이로 남은 결절 잔향을 확인한다.",
			"또렷해진 문패들을 따라 모델하우스 잔해를 재조사한다.",
		], visit_index)
	if outcome == OUTCOME_EXTRACT_MEMORY:
		return _pick([
			"가족사진 뒤편의 송출관 접근 절차를 대조한다.",
			"윤서의 이름을 부르는 광고 문구의 출처를 확인한다.",
		], visit_index)
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
				"개장 전 점검표가 송출관 접근 절차를 확정했다. 중심 결절을 노출시킨다.",
				"외곽 주택가 중앙의 모델하우스 결절에 접근할 수 있다.",
			], visit_index)

static func r01_sortie_goal_short_phrase(state: Dictionary) -> String:
	var outcome := String(state.get("r01_boss_outcome", ""))
	var records := clampi(int(state.get("r01_signal_records_found", 0)), 0, 3)
	var visit_index := maxi(0, int(state.get("r01_revisit_count", 0)) - 1)
	if bool(state.get("r01_followup_ready", false)) and outcome != "":
		return _pick([
			"후속 송출관 신호 추적",
			"남은 송출관 신호 확인",
		], visit_index)
	if outcome == OUTCOME_DESTROY_NODE:
		return _pick([
			"낮아진 광고음의 잔향 확인",
			"모델하우스 잔해 재조사",
		], visit_index)
	if outcome == OUTCOME_EXTRACT_MEMORY:
		return _pick([
			"송출관 접근 절차 대조",
			"윤서를 부르는 광고 출처 확인",
		], visit_index)
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
			return "이름 보관함 뒤편에서 낡은 가족사진 냄새가 난다. 출격 게시판에 송출관 접근 절차가 더 선명해졌다."
		_:
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
				"송출관 접근 절차가 끊기지 않고 보급소까지 넘어왔습니다. 스마일 홈 시어머니의 검증 신호가 가까워졌습니다.",
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

static func _pick(phrases: Array[String], index: int) -> String:
	return phrases[abs(index) % phrases.size()]
