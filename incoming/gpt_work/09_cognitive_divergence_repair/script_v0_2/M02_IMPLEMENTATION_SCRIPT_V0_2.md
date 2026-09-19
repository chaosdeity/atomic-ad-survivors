# M02 IMPLEMENTATION SCRIPT V0.2 — SCRIPT DELTA

상태: CANDIDATE / 대사·행동 편집용. 새 gameplay 구현 없음.
기준 SCRIPT: ../../08_voice_gate_and_clean_manuscript/script/M02_IMPLEMENTATION_SCRIPT_V0_1.md
기준 commit: a105ec26aba7926280f8a3ae2318b3913600dfe7
기준 SCRIPT blob: 0836c44cf9671eebbd28a2037d72d077c5f3b827
대사·행동 원문: ../clean_v0_2/M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_CLEAN_V0_2.md

## 적용 계약

V0.2는 고정된 V0.1 SCRIPT의 SCENE / LOCATION / UI / STATE_DEPENDENCY / 기존 보상·진행·구현 제약을 상속하는 델타다. 수정 BEAT의 DIALOGUE / ACTION / INTERIORITY_OPTIONAL / MACHINE 중 아래에 나타나는 부분만 새 CLEAN으로 교체한다. 축약된 V0.1 대사 목록에 새 대사를 덧붙여 두 번 재생하지 않는다. 실제 대사 순서·행동은 V0.2 CLEAN이 기준이고, 사실 RECORD 블록은 기존과 동일하다.

각 D항목은 실패 지도 01의 BEFORE를 유일한 연속 앵커로 삼는다. 아래 REPLACEMENT BLOCK은 지문·내면·대사를 섞어 새 대사로 읽으라는 뜻이 아니다. 따옴표는 DIALOGUE, > 따옴표는 MACHINE, 나머지는 ACTION 또는 기존 위치의 윤서 내면이다. 이름 없는 상대의 발화는 직전 동작과 아래 화자 지침으로 바인딩한다. 새 저장 키·선택지·타이머를 생성하지 않는다.

MECHANICS PRESERVED: 세 조사 슬롯의 6가지 순서·미독 내용 비노출·부분 귀환·기완료 보상 중복 금지를 유지한다. 메모 소실은 진행 초기화나 네 번째 필수 증거가 아니다. VAC-0는 실제 청소 장치이며 감정/설득/전투 목표를 추가하지 않는다. 12번 방 참조를 읽기 전 후속 질문 노출 금지.

## BEAT 01 — 종이를 올리지 말 곳

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D10 / 주된 화자·행동 주체: 세븐 / CLEAN L21

COGNITIVE INTENT: 원문 복제와 독립 증언을 분리하는 구체 연산을 말한다.

REPLACEMENT BLOCK:

“같은 문장을 옮긴 것부터 빼겠습니다. 주소가 셋이어도 증언은 하나일 수 있습니다.”

### D11 / 주된 화자·행동 주체: 미나 / CLEAN L27

COGNITIVE INTENT: 현재 침구와 저녁 사이에서 자기 손을 배치한다.

REPLACEMENT BLOCK:

“사람 수 말고 내 손을 얼마나 비워 둘지 묻는 거야. 이것 붙들고 저녁은 못 해.”

### D12 / 주된 화자·행동 주체: 미나 / CLEAN L33

COGNITIVE INTENT: 다음 귀환의 작업 분담을 상대에게 맡긴다.

REPLACEMENT BLOCK:

“돌아오면 네가 읽고 나는 저녁을 할게. 중간에 놓고 또 나가지는 마.”

### D13 / 주된 화자·행동 주체: 세븐 / CLEAN L41

COGNITIVE INTENT: 재검증 경로를 보존하는 책임을 명시한다.

REPLACEMENT BLOCK:

“옮긴 줄은 그대로 두고, 네 말은 옆에 써 줘. 틀린 곳을 거슬러 올라갈 길이 필요해.”

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 02 — 먼저 지나간 바퀴

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 03 — 세 칸

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D14 / 주된 화자·행동 주체: 윤서 / CLEAN L95

COGNITIVE INTENT: 자기 명명이 사람의 자리를 배정하는 위험을 본다.

REPLACEMENT BLOCK:

같은 가족이라고 적으면 이 집 의자에도 그 사람들을 앉히는 셈이다. 의자는 네 개인데.

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 04 — 내 발밑의 메모

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 05 — 다시 읽는 쪽

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 06 — 아직 안 끝난 쪽

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 07 — 문 아래

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## BEAT 08 — 종이 셋과 사람 수

SCENE / LOCATION / UI / STATE_DEPENDENCY: 기준 SCRIPT 그대로.
RECORD: 해당 CLEAN의 사실 기록을 그대로 사용.

### D15 / 주된 화자·행동 주체: 세븐 / CLEAN L214

COGNITIVE INTENT: 자신의 잘못된 분류와 수정 경로를 남겨 다른 사람이 오류를 추적할 수 있게 한다.

REPLACEMENT BLOCK:

세븐은 쓰기 시작한 ‘원기록 손상’에 선을 그었다. 그 글자를 덮어 가리지는 않았다.

“제가 먼저 원기록이라고 적었습니다. 이 오기는 남겨 두고, 보조 메모로 고치겠습니다.”

### D16 / 주된 화자·행동 주체: 윤서 / CLEAN L234

COGNITIVE INTENT: 자료의 족보보다 자기가 붙일 관계가 당사자 질문을 막는 위험을 먼저 본다.

REPLACEMENT BLOCK:

“그 선은 못 잇겠어. 내가 같은 가족이라고 묶고 나면, 그 사람들한테 되묻기는 더 어려워져.”

### D17 / 주된 화자·행동 주체: 세븐 / CLEAN L236

COGNITIVE INTENT: 사람 관계가 아닌 복제 경로를 자신의 작업 대상으로 돌려받는다.

REPLACEMENT BLOCK:

“공통 원본인지는 따로 두겠습니다. 지금 묶을 것은 사람이 아니라 이 문장들이 거쳐 온 경로입니다.”

### D18 / 주된 화자·행동 주체: 윤서 / CLEAN L250

COGNITIVE INTENT: 다음 방문에서 자기 질문 방식을 바꾸겠다고 한다.

REPLACEMENT BLOCK:

“응. 이번엔 내가 붙인 가족 수 말고, 그 사람이 무슨 말을 하는지 듣고 올게.”

### D19 / 주된 화자·행동 주체: 복희 / 미나 / CLEAN L274

COGNITIVE INTENT: 복희는 반환 경로를 위해 자기 공간을 내고 미나는 반복 동선의 노동 비용을 요구한다.

REPLACEMENT BLOCK:

윤서가 묶음을 건넸다. 복희는 펼치지 않은 채 보관함 앞에 놓았다.

“찾으러 오면 이 끈부터 볼 거야. 안에 뭐가 있는지는 안 열어도 돼.”

미나가 침구를 든 채 발을 바꿔 디뎠다.

“거기 두면 내가 밤마다 돌아가. 안 풀고 옮길 테니 자리 하나만 비워 줘.”

복희는 자기 보관 자리를 좁혀 묶음을 밀었다.

“내 쪽으로 둘게. 찾으러 온 사람이 남의 침구부터 헤치게 하진 말자.”

미나가 침구를 내려놓을 공간이 생겼다.

IMPLEMENTATION_NOTE: 위 블록은 같은 BEAT의 대응 블록 교체다. 기존 대사 재생 뒤 추가 재생하지 않는다. 일반 기능 대사는 유지한다.

## BEAT 09 — 아직 답이 없는 질문

DELTA: NONE. 기존 모든 필드와 조건을 상속한다. CLEAN의 해당 장면과 동일한 사건 순서를 사용한다.

## 검증

기준 blob이 다르면 자동 적용을 멈추고 diff를 다시 맞춘다. 각 REPLACEMENT BLOCK이 새 CLEAN에 정확히 한 번 있는지 대조한다. 수정 대사가 기록·기계 재생·인간 대사 층을 넘지 않는지 확인한다. 변경 없는 BEAT의 진행 조건과 새 CLEAN의 모든 사실 기록을 비교한다. M05 이후 신규 장면, 성격 저장·분기·광고 사건을 생성하지 않는다.

문서 동기화 검사는 수행할 수 있으나 실제 엔진 바인딩·게임 입력·E2E 테스트는 이번 작업 범위 밖이며 NOT RUN이다. 보이스 적합성은 독립 외부 테스트 전까지 미확인이다.
