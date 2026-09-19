# M04 IMPLEMENTATION SCRIPT V0.2 — SCRIPT DELTA

상태: CANDIDATE / 대사·행동 편집용. 새 gameplay 구현 없음.
기준 SCRIPT: ../../08_voice_gate_and_clean_manuscript/script/M04_IMPLEMENTATION_SCRIPT_V0_1.md
기준 commit: a105ec26aba7926280f8a3ae2318b3913600dfe7
기준 SCRIPT blob: 5a1796a5882ffc24c807a1044d63e7ba0b2d95c9
대사·행동 원문: ../clean_v0_2/M04_THE_NIGHT_AFTER_DISCHARGE_CLEAN_V0_2.md

## 적용 계약

V0.2는 고정된 V0.1 SCRIPT의 SCENE / LOCATION / UI / STATE_DEPENDENCY / 기존 보상·진행·구현 제약을 상속하는 델타다. 수정 BEAT의 DIALOGUE / ACTION / INTERIORITY_OPTIONAL / MACHINE 중 아래에 나타나는 부분만 새 CLEAN으로 교체한다. 축약된 V0.1 대사 목록에 새 대사를 덧붙여 두 번 재생하지 않는다. 실제 대사 순서·행동은 V0.2 CLEAN이 기준이고, 사실 RECORD 블록은 기존과 동일하다.

각 D항목은 실패 지도 01의 BEFORE를 유일한 연속 앵커로 삼는다. 아래 REPLACEMENT BLOCK은 지문·내면·대사를 섞어 새 대사로 읽으라는 뜻이 아니다. 따옴표는 DIALOGUE, > 따옴표는 MACHINE, 나머지는 ACTION 또는 기존 위치의 윤서 내면이다. 이름 없는 상대의 발화는 직전 동작과 아래 화자 지침으로 바인딩한다. 새 저장 키·선택지·타이머를 생성하지 않는다.

MECHANICS PRESERVED: 창가 실제 왕복·병동 도움 유지, 전면 퇴원과 보급소 이주 없음. 병동 환자와 보급소 거주자는 별개다. 의료 절차·진단·수치·자격을 만들지 않는다. 인간 대리에 HP/보스전 UI 없음. 야간 노동을 강제 새 미니게임/성격점수/쿨다운으로 만들지 않는다. 아침 인계와 출격 지연은 서사이며 지속 돌봄 가능 증거가 아니다.

## BEAT 01 — 축하가 끝나는 데까지

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D34 / 주된 화자·행동 주체: 병실 환자 / CLEAN L29

COGNITIVE INTENT: 축하를 접어 버리고 자기 문서의 위치·읽을 면·소지권을 직접 정한다. 창가 요청의 공개 시점은 앞당기지 않는다.

REPLACEMENT BLOCK:

“읽어 봐요. 박수는 듣지 말고.”

환자는 종이 위의 축하 문구를 접어 뒤로 넘겼다. 나머지는 자기 무릎 위에 펼쳐 놓았다. 윤서 쪽으로 돌리되 손은 놓지 않았다.

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 02 — 침대 밑에 있던 컵

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D35 / 주된 화자·행동 주체: 병실 환자 / 돌봄 담당자 / CLEAN L75

COGNITIVE INTENT: 환자는 자기 몸의 선택 주체를, 담당자는 지원 가능 시간과 재확인 동작을 먼저 말한다.

REPLACEMENT BLOCK:

환자는 컵을 자기 무릎 쪽으로 당겼다.

“이걸 옮긴다고 내가 옮겨지는 건 아니잖아요. 내 몸은 나한테 먼저 물어요.”

윤서는 뻗었던 손을 내렸다. 담당자는 바구니를 내려놓고 통로를 살폈다.

“제가 식사를 돕는 동안은 여기 계셔야 해요. 돌아오면 지금도 가고 싶은지 다시 여쭐게요.”

담당자가 환자의 뜻을 다시 물었다.

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 03 — 밤에는 누가 있습니까

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D36 / 주된 화자·행동 주체: 퇴원 심사 대리 / CLEAN L109

COGNITIVE INTENT: 편의 제공이 아니라 실제 밤의 사람과 노동을 검증하는 인간의 압박.

REPLACEMENT BLOCK:

“침구 말고요. 밤에 이분이 부르면 실제로 일어날 사람이 있습니까?”

### D37 / 주된 화자·행동 주체: 퇴원 심사 대리 / CLEAN L119

COGNITIVE INTENT: 자기가 승인할 문서의 책임을 피하면서 실제 합의를 요구한다.

REPLACEMENT BLOCK:

“그분은 아직 모르는데 제가 인계받을 사람으로 적을 순 없습니다. 먼저 답을 받아 오세요.”

### D38 / 주된 화자·행동 주체: 퇴원 심사 대리 / CLEAN L127

COGNITIVE INTENT: 자신의 업무 종결과 남겨진 노동을 두려워하는 방어를 드러낸다. 새 과거 사고는 만들지 않는다.

REPLACEMENT BLOCK:

대리는 병실 쪽 호출이 끝날 때까지 기다렸다가 펜 뚜껑을 눌렀다.

“제가 보내는 쪽만 끝냈다고 할 수는 없잖아요. 저 안에 남을 사람이 정해져야죠.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 04 — 내가 고른 자리라고 쓰지 마세요

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D39 / 주된 화자·행동 주체: 윤서 / CLEAN L169

COGNITIVE INTENT: 자신을 구출자로 기록하려는 해석을 거부하고 실제 작은 일은 맡는다.

REPLACEMENT BLOCK:

“제가 데려간 것처럼 쓰지 마세요. 문은 잡을게요. 몸을 옮기는 건 할 줄 몰라서요.”

### D40 / 주된 화자·행동 주체: 퇴원 심사 대리 / CLEAN L171

COGNITIVE INTENT: 전면 거절의 잘못된 적용을 실제 문서 항목과 사람의 시간으로 수정한다.

REPLACEMENT BLOCK:

“그럼 퇴원 항목은 쓰지 않겠습니다. 담당자가 돌아올 때까지 도울 수 있는지만 다시 듣죠.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 05 — 창이 보이는 동안

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 06 — 돌아갈 곳을 고르는 말

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 07 — 다른 사람의 이름을 쓰기 전에

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D41 / 주된 화자·행동 주체: 윤서 / CLEAN L293

COGNITIVE INTENT: 남의 이름을 임의로 쓴 잘못을 자기 밤의 실제 노동으로 돌린다.

REPLACEMENT BLOCK:

“네 이름을 먼저 빌렸어. 오늘 앞쪽은 내가 맡아 볼게. 못 하는 건 너를 불러야 하고.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 08 — 밤의 첫 번째 일

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 09 — 깨워야 하는 때

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D42 / 주된 화자·행동 주체: 미나 / CLEAN L377

COGNITIVE INTENT: 불명확한 호출을 자기 수면·두 사람의 즉시 재분담 비용으로 받는다.

REPLACEMENT BLOCK:

“너도 잤으면 나 다시 누우면 안 되지. 앞쪽은 같이 돌자. 남은 일부터 나누고.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 10 — 받은 사람이 쓰는 줄

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 11 — 인계가 끝나는 자리

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## 검증

기준 blob이 다르면 자동 적용을 멈추고 diff를 다시 맞춘다. 각 REPLACEMENT BLOCK이 새 CLEAN에 정확히 한 번 있는지 대조한다. 수정 대사가 기록·기계 재생·인간 대사 층을 넘지 않는지 확인한다. 변경 없는 BEAT의 진행 조건과 새 CLEAN의 모든 사실 기록을 비교한다. M05 이후 신규 장면, 성격 저장·분기·광고 사건을 생성하지 않는다.

문서 동기화 검사는 수행할 수 있으나 실제 엔진 바인딩·게임 입력·E2E 테스트는 이번 작업 범위 밖이며 NOT RUN이다. 보이스 적합성은 독립 외부 테스트 전까지 미확인이다.
