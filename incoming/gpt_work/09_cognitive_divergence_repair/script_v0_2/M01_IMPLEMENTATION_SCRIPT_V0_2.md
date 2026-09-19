# M01 IMPLEMENTATION SCRIPT V0.2 — SCRIPT DELTA

상태: CANDIDATE / 대사·행동 편집용. 새 gameplay 구현 없음.
기준 SCRIPT: ../../08_voice_gate_and_clean_manuscript/script/M01_IMPLEMENTATION_SCRIPT_V0_1.md
기준 commit: a105ec26aba7926280f8a3ae2318b3913600dfe7
기준 SCRIPT blob: af8c40192f5f40046aba90f55f480245ed641e95
대사·행동 원문: ../clean_v0_2/M01_THE_DOOR_OPENED_FIRST_CLEAN_V0_2.md

## 적용 계약

V0.2는 고정된 V0.1 SCRIPT의 SCENE / LOCATION / UI / STATE_DEPENDENCY / 기존 보상·진행·구현 제약을 상속하는 델타다. 수정 BEAT의 DIALOGUE / ACTION / INTERIORITY_OPTIONAL / MACHINE 중 아래에 나타나는 부분만 새 CLEAN으로 교체한다. 축약된 V0.1 대사 목록에 새 대사를 덧붙여 두 번 재생하지 않는다. 실제 대사 순서·행동은 V0.2 CLEAN이 기준이고, 사실 RECORD 블록은 기존과 동일하다.

각 D항목은 실패 지도 01의 BEFORE를 유일한 연속 앵커로 삼는다. 아래 REPLACEMENT BLOCK은 지문·내면·대사를 섞어 새 대사로 읽으라는 뜻이 아니다. 따옴표는 DIALOGUE, > 따옴표는 MACHINE, 나머지는 ACTION 또는 기존 위치의 윤서 내면이다. 이름 없는 상대의 발화는 직전 동작과 아래 화자 지침으로 바인딩한다. 새 저장 키·선택지·타이머를 생성하지 않는다.

MECHANICS PRESERVED: 기존 수동 유지 공격·이동, 유한 위협, 자율/부분 귀환, 키트의 실제 도움을 유지한다. 봉투 둘·상처는 원고 연출이며 신규 드롭/강제 HP 조건이 아니다. 안내 멈추기/대기 유지 어느 쪽도 우편 보관·사람 생사를 바꾸지 않는다. 기존 보상 중복 금지.

## BEAT 01 — 빈 것을 놓는 자리

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D01 / 주된 화자·행동 주체: 장도윤 / CLEAN L4

COGNITIVE INTENT: 자신의 손이 시험 결과를 가리는 변수를 제거한다.

REPLACEMENT BLOCK:

도윤은 그것을 공구 밑으로 밀어 넣고 윤서의 스캐너를 돌려 보았다. 손잡이 아래를 받치던 손가락 하나를 뺐다.

“내가 받치고 있으면 안 흔들려. 이번엔 네 손만 대 봐.”

### D02 / 주된 화자·행동 주체: 미나 / CLEAN L23

COGNITIVE INTENT: 늦은 보고 때문에 바뀐 오늘의 노동 순서를 짚는다.

REPLACEMENT BLOCK:

“아침에 알았으면 다른 일보다 이것부터 구했지. 지금은 둘 다 나가야 하잖아.”

### D03 / 주된 화자·행동 주체: 미나 / CLEAN L39

COGNITIVE INTENT: 없는 답을 받아 다른 손을 배치할 시간을 확보한다.

REPLACEMENT BLOCK:

“없으면 바로 돌아와. 다른 걸 찾으러 갈 손까지 다 빠지면 안 돼.”

### D04 / 주된 화자·행동 주체: 장도윤 / CLEAN L63

COGNITIVE INTENT: 시험을 더 잘하려고 오히려 추가 수리를 멈춘다.

REPLACEMENT BLOCK:

도윤은 끈을 놓았다. 다친 손으로 공구를 집으려다가 반대 손으로 밀어 놓았다.

“다음에 걸리면 그 각도 그대로 보여 줘. 더 갈면 멀쩡한 쪽까지 깎아.”

미나는 빈 포장을 치우지 않았다.

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 02 — 대답보다 먼저 열린 문

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 03 — 끝났다고 적힌 일

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 04 — 가방을 열지 않는 동안

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 05 — 놓았다가 다시 잡기

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 06 — 편지는 남겨 두고

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 07 — 오늘 본 데까지

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 08 — 하나는 여기, 하나는 팔에

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D05 / 주된 화자·행동 주체: 윤서 / CLEAN L253

COGNITIVE INTENT: 왜 자신이 그 확인을 놓쳤는지 자기 변명과 현장 비용을 드러낸다.

REPLACEMENT BLOCK:

“하나 썼다고 말할 생각만 했어. 남은 건 다시 안 봤어.”

### D06 / 주된 화자·행동 주체: 미나 / CLEAN L255

COGNITIVE INTENT: 자기 오늘 식사·보급 배분을 실제로 바꾼다.

REPLACEMENT BLOCK:

“그 집은 오늘 보급에서 빼자. 사람을 만났으면 먹을 것도 따로 덜어야 해.”

### D07 / 주된 화자·행동 주체: 윤서 / CLEAN L269

COGNITIVE INTENT: 누구 대신 수령 완료를 만들 권한이 없는지 자신의 행동을 제한한다.

REPLACEMENT BLOCK:

“벨은 내가 껐어. 편지까지 치우면 내가 대신 받은 셈이라 손 안 댔고.”

### D08 / 주된 화자·행동 주체: 장도윤 / CLEAN L296

COGNITIVE INTENT: 손의 위치와 실패 동작을 함께 고치며 자신도 같은 실수를 했다고 인정한다.

REPLACEMENT BLOCK:

“그걸 잘했다고 하진 말자.”

도윤은 잡고 있던 봉투 끝을 내려다봤다.

“입구를 벌려서 잡아야 했네. 끝만 당기니까 더 닫히잖아.”

미나가 숟가락을 들었다.

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 09 — 다른 집의 제목

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D09 / 주된 화자·행동 주체: 미나 / 윤서 / CLEAN L318

COGNITIVE INTENT: 미나는 자신의 추가 노동 시간을 회수하고 윤서는 자기가 이름 붙인 사람 수의 후속 책임을 남에게 넘기지 않는다.

REPLACEMENT BLOCK:

“돌아와서 읽어 줄 시간도 남겨. 네가 놓고 나가면 그 일까지 내가 해.”

“같이 읽고 갈게. 내 말 때문에 사람 수가 바뀌면 내가 고쳐야지.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## 검증

기준 blob이 다르면 자동 적용을 멈추고 diff를 다시 맞춘다. 각 REPLACEMENT BLOCK이 새 CLEAN에 정확히 한 번 있는지 대조한다. 수정 대사가 기록·기계 재생·인간 대사 층을 넘지 않는지 확인한다. 변경 없는 BEAT의 진행 조건과 새 CLEAN의 모든 사실 기록을 비교한다. M05 이후 신규 장면, 성격 저장·분기·광고 사건을 생성하지 않는다.

문서 동기화 검사는 수행할 수 있으나 실제 엔진 바인딩·게임 입력·E2E 테스트는 이번 작업 범위 밖이며 NOT RUN이다. 보이스 적합성은 독립 외부 테스트 전까지 미확인이다.
