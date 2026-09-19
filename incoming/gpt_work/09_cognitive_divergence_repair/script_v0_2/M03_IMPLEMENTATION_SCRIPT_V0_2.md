# M03 IMPLEMENTATION SCRIPT V0.2 — SCRIPT DELTA

상태: CANDIDATE / 대사·행동 편집용. 새 gameplay 구현 없음.
기준 SCRIPT: ../../08_voice_gate_and_clean_manuscript/script/M03_IMPLEMENTATION_SCRIPT_V0_1.md
기준 commit: a105ec26aba7926280f8a3ae2318b3913600dfe7
기준 SCRIPT blob: 4914524914009bc883d3c5ccd7c6ecd30a2fa887
대사·행동 원문: ../clean_v0_2/M03_HOW_TO_RISE_FROM_THE_TABLE_CLEAN_V0_2.md

## 적용 계약

V0.2는 고정된 V0.1 SCRIPT의 SCENE / LOCATION / UI / STATE_DEPENDENCY / 기존 보상·진행·구현 제약을 상속하는 델타다. 수정 BEAT의 DIALOGUE / ACTION / INTERIORITY_OPTIONAL / MACHINE 중 아래에 나타나는 부분만 새 CLEAN으로 교체한다. 축약된 V0.1 대사 목록에 새 대사를 덧붙여 두 번 재생하지 않는다. 실제 대사 순서·행동은 V0.2 CLEAN이 기준이고, 사실 RECORD 블록은 기존과 동일하다.

각 D항목은 실패 지도 01의 BEFORE를 유일한 연속 앵커로 삼는다. 아래 REPLACEMENT BLOCK은 지문·내면·대사를 섞어 새 대사로 읽으라는 뜻이 아니다. 따옴표는 DIALOGUE, > 따옴표는 MACHINE, 나머지는 ACTION 또는 기존 위치의 윤서 내면이다. 이름 없는 상대의 발화는 직전 동작과 아래 화자 지침으로 바인딩한다. 새 저장 키·선택지·타이머를 생성하지 않는다.

MECHANICS PRESERVED: 검사 장치만 국지 OFF, 배식 ON, ROOM-12 당일 잔류를 보존한다. 본명·성별·혈연·영구 이주 미확정. 현재 부상은 눈앞 관찰이지 원격 기억이 아니다. 기계 출력과 인간 대사를 분리한다. M06 보호 정보·구체 후속 부탁을 앞당기지 않는다. 기존 수동 전투와 상태 유지 외 새 기믹 없음.

## BEAT 01 — 안쪽에서 부르는 사람

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D20 / 주된 화자·행동 주체: ROOM-12 / CLEAN L27

COGNITIVE INTENT: 자기 한마디가 다른 사람의 식사 동선을 지연하는 연쇄를 먼저 처리한다.

REPLACEMENT BLOCK:

그 사람은 윤서를 봤다. 대답하려 입을 벌리자 배식구 안에서 받침이 움직였다. 빈손으로 그릇을 받아 식탁 끝에 놓고, 빈 그릇 하나를 자기 쪽으로 남겼다.

“이게 나가야 저쪽 사람이 자기 자리로 돌아가요. 그다음에 말할게요.”

### D21 / 주된 화자·행동 주체: 윤서 / CLEAN L25

COGNITIVE INTENT: 역할 호명 오류를 고치려는 자기 욕구 때문에 현재 식사를 다시 뒤로 미루는 결함을 남긴다.

REPLACEMENT BLOCK:

“계속 맡고 싶은 건지 먼저 듣고 싶어요. 제가 가족대표라고만 적어 왔거든요.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 02 — 손을 떼어 보는 동안

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D22 / 주된 화자·행동 주체: ROOM-12 / CLEAN L55

COGNITIVE INTENT: 기계 가동과 이어지는 배식 노동을 자기 몸의 연속으로 보여 준다.

REPLACEMENT BLOCK:

“손만 바꾸면 밥은 나와요. 그런데 그 밥을 받을 사람은 계속 저예요.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 03 — 앉을 곳은 준비되어 있습니다

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D23 / 주된 화자·행동 주체: 가족심사 관리자 / CLEAN L78

COGNITIVE INTENT: 실제 안락함과 대표 역할 수락을 끊김 없는 하나의 서비스로 묶는 기계.

REPLACEMENT BLOCK:

“이쪽에 앉아 팔을 쉬어 주세요. 쉬시는 동안 대표 확인도 함께 도와드리겠습니다.”

### D24 / 주된 화자·행동 주체: 윤서 / CLEAN L81

COGNITIVE INTENT: 도우러 왔다는 자기 목적과 자기 이름의 역할 대체를 충돌시킨다.

REPLACEMENT BLOCK:

“저분을 일으키려고 온 건데, 제 이름을 여기 붙이면 되는 거예요?”

### D25 / 주된 화자·행동 주체: ROOM-12 / CLEAN L91

COGNITIVE INTENT: 자신이 이어 온 실제 그릇 인계에서 다음 노동으로 연결한다.

REPLACEMENT BLOCK:

“이번 그릇은 제가 넘기면 돼요. 다음 밥 받을 손은 누가 가져와요?”

### D26 / 주된 화자·행동 주체: ROOM-12 / CLEAN L103

COGNITIVE INTENT: 임시 대체 뒤 자신에게 돌아오는 노동과 남은 사람들을 함께 짚는다.

REPLACEMENT BLOCK:

“그쪽이 가면 다시 제 손을 대야 해요. 다음 밥 기다리는 사람들은 그대로니까.”

### D27 / 주된 화자·행동 주체: 윤서 / CLEAN L113

COGNITIVE INTENT: 자기 안락함을 인정하면서 역할 수락은 하지 않는다. 남을 구한다는 명분만으로 거절하지 않는다.

REPLACEMENT BLOCK:

“쉴 자리는 필요해요. 그래도 저분 대신 대표가 되겠다는 말은 안 했어요.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 04 — 누구를 보고 싸우는가

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D28 / 주된 화자·행동 주체: ROOM-12 / CLEAN L123

COGNITIVE INTENT: 배식구 이후의 실제 인수와 대체 급식 부재를 자기 노동으로 계산한다.

REPLACEMENT BLOCK:

“그 밑에는 쏘지 마세요. 그릇 나오는 데예요.”

그 사람은 막 나온 그릇을 자기 앞에 당기고 빈손을 다시 배식구 쪽으로 폈다.

“문만 비우면 받아 갈 수 있어요. 그릇까지 끊어 버리면 제가 다시 줄 것도 없고요.”

### D29 / 주된 화자·행동 주체: 윤서 / CLEAN L153

COGNITIVE INTENT: 자신의 잘못된 보호를 인정하고 상대 몸에서 손을 거둔 뒤 수행할 행동을 바꾼다.

REPLACEMENT BLOCK:

“제가 나가자고 해 놓고 팔부터 잡았네요. 손은 뗄게요. 문 막는 저것만 멈추고요.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 05 — 비워 두는 의자

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 06 — 손이 아직 거기에 있다

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D30 / 주된 화자·행동 주체: ROOM-12 / CLEAN L213

COGNITIVE INTENT: 타인의 그릇을 이어 온 뒤 자기 오늘 식사를 원하는 주체로 돌아온다. 후속 외출 부탁은 추가하지 않는다.

REPLACEMENT BLOCK:

“저녁 그릇은 다 내보내고요. 제 것도 받아 놨어요. 오늘은 이걸 식기 전에 먹고 싶어요.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 07 — 다시 온다는 말

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D31 / 주된 화자·행동 주체: ROOM-12 / CLEAN L247

COGNITIVE INTENT: 다른 사람에게 넘기는 반복 동작에서 자기 식사만은 빼내는 행동.

REPLACEMENT BLOCK:

“그건 제 거예요. 다른 그릇 끝에 놓지 말고 제 앞에 둬요.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 08 — 펴지 않은 침구

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D32 / 주된 화자·행동 주체: 팝시 / CLEAN L261

COGNITIVE INTENT: 환영 출력을 자신의 차례가 충족됐다는 뜻으로 보지 않도록 자기 필요를 요구한다.

REPLACEMENT BLOCK:

“인사는 나왔는데 저는 아직 충전을 못 했어요. 가방 밑의 선부터 빼 주세요.”

### D33 / 주된 화자·행동 주체: 미나 / CLEAN L293

COGNITIVE INTENT: 불확실한 장래 준비 대신 오늘 남은 일을 실제 나눈다.

REPLACEMENT BLOCK:

“재방문하고 돌아올 시간까지 비워 두진 못해. 오늘 그릇 닦는 건 네가 좀 받아.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 09 — 밤에 남는 사람

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## 검증

기준 blob이 다르면 자동 적용을 멈추고 diff를 다시 맞춘다. 각 REPLACEMENT BLOCK이 새 CLEAN에 정확히 한 번 있는지 대조한다. 수정 대사가 기록·기계 재생·인간 대사 층을 넘지 않는지 확인한다. 변경 없는 BEAT의 진행 조건과 새 CLEAN의 모든 사실 기록을 비교한다. M05 이후 신규 장면, 성격 저장·분기·광고 사건을 생성하지 않는다.

문서 동기화 검사는 수행할 수 있으나 실제 엔진 바인딩·게임 입력·E2E 테스트는 이번 작업 범위 밖이며 NOT RUN이다. 보이스 적합성은 독립 외부 테스트 전까지 미확인이다.
