# R01 P1 NPC 선택 분기 맵 v0.1

## 문서 상태

```text
상태:
스토리팀/시스템팀 연결용 v0.1

용도:
R01 첫 보스 이후 P1 재방문에서
DRAIN-MARK / SIGN-BACK / KEY-RING / VAC-0 / WELCOME-DESK / FRAME-LEFT가
어떤 순서와 상태값 조건으로 열리는지 정리한다.

판정:
필요

주의:
이 문서는 새 NPC를 추가하지 않는다.
P1 NPC를 단순 확장 퀘스트로 열지 않는다.
모든 P1 선택은 R01 보스 후폭풍과 상태값 변화로 돌아와야 한다.
```

---

## 0. 판정 요약

R01 P1 NPC 선택 분기는 지금 단계에서 작성해야 한다.

이유:

```text
R01 보스 전후 시간축은 고정되었다.
PORCH-LINE / ROOM-12 재방문 분기로 줄과 자리의 후폭풍도 고정되었다.

이제 P1 재방문에서
배수로, 가짜 귀환로, 낡은 관리실, 빈 집 내부, 상담 데스크, 가족사진 프레임이
어떤 순서와 조건으로 열리는지 한 장의 실행 맵으로 묶어야 한다.
```

핵심 결론:

```text
P1은 새 지역 확장이 아니다.
보스가 끝난 뒤에도 R01이 아직 사람을 역할/주소/문/사진/귀환로로 다시 읽고 있음을 보여주는 재방문이다.

따라서 P1의 순서는 "더 깊은 곳으로 간다"가 아니라
"보스 후 남은 후폭풍을 더 위험한 형태부터 검증한다"로 잡는다.
```

권장 개방 순서:

```text
1. DRAIN-MARK / 침묵권
2. SIGN-BACK / 가짜 귀환로
3. KEY-RING / 낡은 관리실
4. VAC-0 / 빈 집 내부
5. WELCOME-DESK / 상담 데스크
6. FRAME-LEFT / 가족사진 프레임
```

이 순서의 의미:

```text
DRAIN-MARK:
숨으면 캠페인은 덜 듣지만 보급소도 덜 닿는다.

SIGN-BACK:
돌아가는 길처럼 보이는 길이 진짜 귀환이 아닐 수 있다.

KEY-RING:
문이 열려도 들어가도 되는 것은 아니다.

VAC-0:
집이 깨끗해질수록 사람의 흔적도 사라질 수 있다.

WELCOME-DESK:
절차는 아직 질문을 만들고, 질문은 역할을 만든다.

FRAME-LEFT:
사진은 보존이면서 역할 고정이다.
```

---

## 1. 선노출과 선택 개방 분리

P1 NPC는 모두 P1에서 갑자기 처음 생기는 존재가 아니다.

```text
WELCOME-DESK:
보스 직전 상담 압박으로 이미 기능이 보인다.
P1에서는 상담 절차를 다시 켜는 것이 아니라, 질문 보류 선택으로 돌아온다.

FRAME-LEFT:
보스 직후 가족사진 프레임 잔향으로 이미 열린다.
P1에서는 사진 속 역할과 사람의 이름/기록을 다시 분리하는 선택으로 돌아온다.

VAC-0:
보스 전후에 흔적 삭제 위험으로 암시될 수 있다.
P1에서는 청소 제외 목록과 첫 질문으로 본격 선택된다.

DRAIN-MARK / SIGN-BACK / KEY-RING:
보스 전에는 흔적/소리/닫힌 문으로만 보인다.
P1에서 침묵권, 가짜 귀환로, 낡은 관리실 루트로 본격 개방된다.
```

따라서 본 문서에서 "개방 순서"는 첫 암시 순서가 아니라, P1 선택지로 실제 열리는 순서다.

---

## 2. P1 기본 진입 조건

P1 재방문은 아래 조건 이후를 기준으로 한다.

```text
R01 첫 보스 클리어.
FRAME-LEFT 잔향 확인.
PORCH-LINE / ROOM-12 재방문 분기 확인 또는 최소한 줄/자리 후폭풍 인지.
MAIL-LOOP 주소/호출 보류 여부 확인.
WELCOME-DESK 질문 보류 여부 확인.
```

권장 선행 플래그:

```text
room12_bypass_ration 또는 room12_left_in_place
porch_line_flexible_ticket 또는 porch_line_exact_queue
mail_loop_call_hold
welcome_desk_question_hold
frame_left_empty_slot_hold
```

선행 플래그가 부족할 때:

```text
P1 루트 자체는 열릴 수 있다.
하지만 안전한 선택지가 줄고, 일부 루트는 위험 경고/실패 확인 장면으로만 열린다.
```

P1의 기본 질문:

```text
1. 숨어 있는 길은 자유인가, 인양 실패인가?
2. 돌아가는 길처럼 보이는 길은 진짜 귀환인가?
3. 열쇠와 태그와 주소가 서로 다른 사람을 가리킬 때 문은 열어도 되는가?
4. 청소는 보호인가, 사람 흔적 삭제인가?
5. 상담 질문을 보류하는 것은 절차를 멈추는 일인가, 절차를 오래 살리는 일인가?
6. 사진 속에 남은 것은 사람인가, 가족 역할인가?
```

---

## 3. 개방 순서 맵

### 3.1 전체 루트

| 순서 | 구역 | NPC | 개방 조건 | 담당 질문 | 막혔을 때 |
|---|---|---|---|---|---|
| P1-1 | 침묵권 / 배수로 | DRAIN-MARK | 보스 후 인양 불안정, 통행태그 우회 필요 | 숨으면 사는가? | 배수로는 열리지만 긴급 인양 실패 위험만 보인다 |
| P1-2 | 가짜 귀환로 | SIGN-BACK | DRAIN-MARK 표식 확인 또는 수신태그 잡음 | 돌아가는 길처럼 보이는 길은 귀환인가? | 표지판이 보급소 방향을 흉내 낸다 |
| P1-3 | 낡은 관리실 | KEY-RING | SIGN-BACK 검증 후 안전한 진입 판단 필요 | 열쇠가 있으면 들어가도 되는가? | 문은 열리지만 잘못된 집/가족 상담으로 연결된다 |
| P1-4 | 빈 집 내부 | VAC-0 | KEY-RING 진입 후 흔적/위험물 분류 필요 | 청소는 보호인가 삭제인가? | 단서가 정리되고 집이 입주 가능 상태로 돌아간다 |
| P1-5 | 상담 데스크 | WELCOME-DESK | 순번표/열쇠/청소 흔적이 상담표로 돌아옴 | 질문을 보류할 수 있는가? | A-창구 직행과 가족 구성 질문이 복구된다 |
| P1-6 | 가족사진 프레임 | FRAME-LEFT | 상담표/이름/사진 기록 재결합 위험 | 사진에 남으면 사람인가 역할인가? | 사진 속 빈칸이 새 얼굴을 자동 보정한다 |

### 3.2 왜 이 순서인가

```text
침묵권을 먼저 여는 이유:
보스 후 가장 먼저 드러나는 위험은 "나갈 길"이 아니라 "회수될 수 없는 길"이다.

가짜 귀환로를 두 번째로 여는 이유:
침묵권을 본 뒤에야, 친절한 귀환 안내가 왜 더 위험한지 체감된다.

낡은 관리실을 세 번째로 여는 이유:
길과 신호를 검증한 뒤에야 문과 열쇠의 권한 문제를 다룰 수 있다.

빈 집 내부를 네 번째로 여는 이유:
문을 연 다음에는 그 안의 흔적을 보존할지 정리할지 결정해야 한다.

상담 데스크를 다섯 번째로 여는 이유:
표식, 신호, 열쇠, 흔적이 모이면 캠페인은 그것을 다시 상담 질문으로 읽는다.

가족사진 프레임을 마지막으로 여는 이유:
P1의 모든 선택은 결국 "사람을 어떤 역할로 남길 것인가"라는 사진 프레임 문제로 돌아온다.
```

### 3.3 보스 후폭풍 연결

| P1 구역 | 보스 후폭풍 |
|---|---|
| 침묵권 | 보스 클리어 후에도 보급소 회수선이 R01 안쪽을 완전히 잡지 못한다 |
| 가짜 귀환로 | 캠페인이 보급소 귀환 표식을 흉내 내기 시작한다 |
| 낡은 관리실 | 빈 집/주소/거주태그가 사람 없이도 서로 결합한다 |
| 빈 집 내부 | 흔적이 정리되면 집이 다시 입주 가능 상태가 된다 |
| 상담 데스크 | 질문이 다시 켜지고, 빈칸이 답을 요구한다 |
| 가족사진 프레임 | 가족 역할이 사진 속에서 계속 보정된다 |

---

## 4. NPC별 선택 분기

### 4.1 DRAIN-MARK / 침묵권

역할 잠금:

```text
DRAIN-MARK는 멋있는 은신자가 아니다.
안전하지 않은 자유의 얼굴이다.
```

개방:

```text
P1-1.
배수로 침묵 주머니 또는 지하 배수로 입구.
보스 후 인양 안정도가 낮거나, 공식 통행태그가 막힌 구간이 있을 때 가장 먼저 열린다.
```

선택:

| 선택 플래그 | 루트 변화 | 상태값 변화 | 대가 |
|---|---|---|---|
| `drain_mark_full_share` | 표식 전체를 보급소에 공유 | 인양 안정도 ++ / 캠페인 농도 + | 캠페인도 길을 따라온다 |
| `drain_mark_hidden` | 표식을 숨긴다 | 캠페인 농도 - / 인양 안정도 -- | 다른 생존자가 길을 모른다 |
| `drain_mark_partial_extraction_point` | 인양 가능한 구간만 공유 | 인양 안정도 + / 인간 안정도 + | 깊은 침묵 주머니는 계속 위험하다 |
| `drain_mark_dual_marks` | 사람용 표식과 회수선용 표식을 분리 | 흔적 보존 + / 인양 안정도 + | 가짜 표식 혼입 관리가 필요하다 |

권장:

```text
drain_mark_partial_extraction_point
drain_mark_dual_marks
```

대사 기준:

```text
"숨는 표식과 찾는 표식은 달라야겠네요."
```

다음 루트 영향:

```text
인양 안정도 중간 이상:
SIGN-BACK이 실제 회수선 신호와 가짜 귀환로를 비교할 수 있다.

인양 안정도 낮음:
SIGN-BACK은 표지판 고집으로 돌아가고, 가짜 귀환로 유혹이 강해진다.

표식 전체 공유:
SIGN-BACK 구역에 캠페인 표식 모방이 빨리 생긴다.
```

이름 조각:

```text
drain_mark_partial_extraction_point 또는 drain_mark_dual_marks 이후
"채율" 이름 조각 가능.
완전한 문채율 해금은 회수선 기준점이 실제로 작동한 뒤로 보류한다.
```

### 4.2 SIGN-BACK / 가짜 귀환로

역할 잠금:

```text
SIGN-BACK은 표지판 수리공이 아니다.
가짜 귀환과 진짜 인양을 구분하게 하는 사람이다.
```

개방:

```text
P1-2.
가짜 귀환로 / 끊긴 광고 산책로.
DRAIN-MARK 표식이나 MAIL-LOOP 수신 로그가 회수선 방향과 어긋날 때 열린다.
```

선택:

| 선택 플래그 | 루트 변화 | 상태값 변화 | 대가 |
|---|---|---|---|
| `sign_back_sign_rotated` | 표지판만 돌려놓는다 | 인간 안정도 + / 캠페인 농도 0 | 캠페인이 다시 고친다 |
| `sign_back_sign_destroyed` | 표지판을 파괴한다 | 캠페인 농도 - / 인간 안정도 - | 사람들도 경고를 잃는다 |
| `sign_back_fake_beacon_blocked` | 가짜 비콘음을 차단한다 | 인양 안정도 + / 수신 안정도 + | 캠페인이 더 정교한 모방을 시도한다 |
| `sign_back_signal_criteria` | 회수선 검증 기준을 붙인다 | 흔적 보존 + / 인간 안정도 + | 글자를 읽지 못하는 사람은 여전히 위험하다 |

권장:

```text
sign_back_fake_beacon_blocked
sign_back_signal_criteria
```

대사 기준:

```text
"표지판만 고치면 된다고 생각했습니다.
오늘은 표지판을 돌리지 않았습니다."
```

다음 루트 영향:

```text
sign_back_signal_criteria가 있으면:
KEY-RING의 낡은 관리실 진입 전, 문/주소/태그 대조 기준이 열린다.

sign_back_sign_destroyed만 있으면:
KEY-RING은 길 경고를 잃고 열쇠만 믿으려 한다.

sign_back_fake_beacon_blocked가 없으면:
낡은 관리실 뒤쪽 귀환 안내가 보급소 호출처럼 들릴 수 있다.
```

이름 조각:

```text
sign_back_fake_beacon_blocked 이후 "태오" 이름 조각 가능.
권태오 완전 해금은 실제 회수선 검증 성공 뒤로 보류한다.
```

### 4.3 KEY-RING / 낡은 관리실

역할 잠금:

```text
KEY-RING은 열쇠 상인이 아니다.
열어도 되는지 확인하는 사람이다.
```

개방:

```text
P1-3.
낡은 주택 관리실 / 폐편의점 뒤 창고.
SIGN-BACK의 귀환 검증 이후, 닫힌 문과 오래된 열쇠가 서로 다른 권한을 가리킬 때 열린다.
```

선택:

| 선택 플래그 | 루트 변화 | 상태값 변화 | 대가 |
|---|---|---|---|
| `key_ring_opened_by_key` | 열쇠만 믿고 연다 | 통행 안정도 + / 캠페인 농도 + | 잘못된 집에 들어갈 수 있다 |
| `key_ring_opened_by_tag` | 거주태그만 믿고 연다 | 거주 안정도 + / 흔적 보존 - | 과거 주인 흔적이 지워질 수 있다 |
| `key_ring_cross_checked` | 열쇠/문패/주소/태그를 대조한다 | 흔적 보존 + / 거주 안정도 + | 시간이 걸리고 일부 문은 끝내 못 연다 |
| `key_ring_pending_board` | 열지 않고 확인 대기로 묶는다 | 캠페인 농도 보류 / 흔적 보존 + | 보상 지연, KEY-RING 불안 유지 |

권장:

```text
key_ring_cross_checked
key_ring_pending_board
```

대사 기준:

```text
"열지 않는 열쇠도 보관할 수 있군요."
```

다음 루트 영향:

```text
key_ring_cross_checked가 있으면:
빈 집 내부에서 VAC-0가 치우면 안 되는 흔적 후보를 구분할 근거가 생긴다.

key_ring_opened_by_key만 있으면:
VAC-0가 그 집을 "입주 가능 상태"로 정리하려 한다.

key_ring_opened_by_tag만 있으면:
거주태그는 안정되지만 과거 사람의 흔적이 약해져 FRAME-LEFT 이름 조각이 늦어진다.
```

이름 조각:

```text
key_ring_pending_board 이후 "기준" 이름 조각 가능.
노기준 완전 해금은 확인 대기 열쇠판이 만들어진 뒤로 보류한다.
```

### 4.4 VAC-0 / 빈 집 내부

역할 잠금:

```text
VAC-0는 귀여운 청소 로봇이 아니다.
흔적과 위험물 구분을 배우는 장치다.
```

개방:

```text
P1-4.
빈 집 내부.
KEY-RING으로 문과 권한을 확인한 뒤, 집 안의 흔적이 청소 대상으로 분류될 때 열린다.
```

선택:

| 선택 플래그 | 루트 변화 | 상태값 변화 | 대가 |
|---|---|---|---|
| `vac0_disabled` | VAC-0를 끈다 | 흔적 보존 + / 로봇 자율성 - | 위험물과 오염물도 남는다 |
| `vac0_unrestricted` | 그대로 둔다 | 통행/거주 안정도 + / 흔적 보존 -- | 중요한 단서가 사라진다 |
| `vac0_exclusion_list` | 청소 제외 목록을 만든다 | 로봇 자율성 + / 흔적 보존 + | 충전태그/분류 관리 필요 |
| `vac0_patch_classifier` | PATCH 임시 분류 패치를 적용한다 | 로봇 자율성 ++ / 충전태그 소모 | 과부하 시 효율 청소 모드 재발 |

권장:

```text
vac0_exclusion_list
vac0_patch_classifier
vac0_first_question
```

대사 기준:

```text
"흔적 후보 감지.
이것도 치워야 합니까?"
```

다음 루트 영향:

```text
vac0_exclusion_list가 있으면:
WELCOME-DESK의 상담표 조각과 FRAME-LEFT 사진 뒤 손글씨가 보존된다.

vac0_unrestricted가 있으면:
상담표/문패/우편/좌석 흔적이 사라져 WELCOME-DESK가 질문 보류 근거를 잃는다.

vac0_disabled만 있으면:
흔적은 남지만 위험물도 남아 빈 집 내부 통행 안정도가 떨어진다.
```

이름 영향:

```text
VAC-0에는 사람 이름을 붙이지 않는다.
로봇 자율성 상승은 이름 해금이 아니라 "첫 질문"으로 표현한다.
```

### 4.5 WELCOME-DESK / 상담 데스크

역할 잠금:

```text
WELCOME-DESK는 OPEN-HOST 복제가 아니다.
상담 절차 내부의 질문 보류 담당이다.
```

개방:

```text
P1-5.
오픈하우스 상담 데스크.
DRAIN-MARK 표식, SIGN-BACK 신호, KEY-RING 열쇠, VAC-0 흔적이
상담표/순번표/가족 구성 질문으로 다시 결합하려 할 때 열린다.
```

선택:

| 선택 플래그 | 루트 변화 | 상태값 변화 | 대가 |
|---|---|---|---|
| `welcome_desk_fast_track` | A-창구 직행을 막지 않는다 | 캠페인 농도 ++ / 인간 안정도 - | 가족 구성 질문 즉시 시작 |
| `welcome_desk_c_window` | 덜 위험한 C-창구로 돌린다 | 인간 안정도 + / 캠페인 농도 0 | 여전히 상담 절차 안에 있음 |
| `welcome_desk_question_hold` | 상담표 질문을 보류한다 | 흔적 보존 + / 인간 안정도 + | 대기열 부담, PORCH-LINE 압박 |
| `welcome_desk_ticket_evidence` | 순번표를 증거로 보관한다 | 흔적 보존 + / 캠페인 농도 보류 | 상담 단말기 자동 복구 시도 |

권장:

```text
welcome_desk_question_hold
welcome_desk_ticket_evidence
```

대사 기준:

```text
"이제는 창구를 추천하지 않겠습니다.
질문을 보류하는 법을 남기겠습니다."
```

다음 루트 영향:

```text
welcome_desk_question_hold가 있으면:
FRAME-LEFT의 사진 빈칸을 "가족 구성 질문"으로 바로 채우지 않는다.

welcome_desk_fast_track이 있으면:
FRAME-LEFT가 광고 가족사진 말투로 빠르게 굳는다.

welcome_desk_ticket_evidence가 있으면:
세븐 분석과 복희 이름 보관이 동시에 가능해진다.
```

이름 조각:

```text
welcome_desk_question_hold 이후 "해원" 이름 조각 가능.
정해원 완전 해금은 데스크를 비워도 다른 상담원이 바로 앉지 않는 장면 이후로 보류한다.
```

### 4.6 FRAME-LEFT / 가족사진 프레임

역할 잠금:

```text
FRAME-LEFT는 사진 속 유령이 아니다.
가족사진 프레임의 프로필 잔향이다.
```

개방:

```text
P1-6.
모델하우스 결절 / 가족사진 프레임.
P1의 표식, 신호, 열쇠, 흔적, 상담표가 모두 가족 구성 기록으로 다시 묶이려 할 때 열린다.
```

선택:

| 선택 플래그 | 루트 변화 | 상태값 변화 | 대가 |
|---|---|---|---|
| `frame_left_full_extract` | 사진 전체를 추출한다 | 수신 안정도 + / 캠페인 오염 + | 역할 오염도 같이 가져온다 |
| `frame_left_frame_destroyed` | 프레임을 파괴한다 | 캠페인 농도 - / 흔적 보존 -- | 보스 후 증거가 사라진다 |
| `frame_left_name_to_bokhee` | 이름 조각을 복희에게 맡긴다 | 흔적 보존 ++ / 인간 안정도 + | 사진 속 잔향은 남는다 |
| `frame_left_empty_slot_hold` | 빈 가족 칸을 보류한다 | 캠페인 농도 보류 / 수신 안정도 + | 프레임은 계속 불편하게 남는다 |

권장:

```text
frame_left_name_to_bokhee
frame_left_empty_slot_hold
```

대사 기준:

```text
"사진 밖에 이름이 있어도,
제가 없어지는 건 아니군요."
```

루트 종료 영향:

```text
frame_left_name_to_bokhee + frame_left_empty_slot_hold:
P1 루트는 승리가 아니라 역할/이름/사진의 분리로 닫힌다.

frame_left_full_extract만 있음:
세븐 분석량은 늘지만 캠페인 오염도 같이 들어온다.

frame_left_frame_destroyed:
역할 고정 일부는 줄지만 복희 이름 보관과 수신 분석 근거가 사라진다.
```

이름 조각:

```text
frame_left_name_to_bokhee 이후 "아린" 이름 조각 가능.
"채아린" 완전 표기는 후반 최종 선택 이후로 보류한다.
```

---

## 5. 상태값별 루트 개폐

### 5.1 통행태그

| 상태 | 루트 변화 |
|---|---|
| 낮음 | 공식 길이 막히고 DRAIN-MARK 침묵권이 유혹처럼 열린다. 긴급 인양은 불안하다. |
| 중간 | DRAIN-MARK 일부 표식, KEY-RING 낡은 관리실, SIGN-BACK 검증 기준이 함께 열린다. |
| 높음 | 공식 동선과 숨은 길을 비교할 수 있지만, 캠페인이 통행 기록을 더 정확히 읽는다. |

상태값 출력:

```text
drain_mark_partial_extraction_point:
통행 안정도 + / 인양 안정도 +

key_ring_opened_by_key:
통행 안정도 + / 캠페인 농도 +

key_ring_cross_checked:
통행 안정도 보류 / 거주 안정도 +
```

### 5.2 수신태그

| 상태 | 루트 변화 |
|---|---|
| 낮음 | SIGN-BACK은 표지판을 더 거칠게 훼손하고, FRAME-LEFT 데이터는 잡음처럼 끊긴다. |
| 중간 | 가짜 비콘음과 실제 회수선 신호를 비교할 수 있다. 세븐 분석이 일부 가능하다. |
| 높음 | 수신 로그가 많아지지만 가짜 귀환로와 가족사진 보정도 더 정교해진다. |

상태값 출력:

```text
sign_back_fake_beacon_blocked:
수신 안정도 + / 인양 안정도 +

sign_back_signal_criteria:
수신 안정도 보류 / 흔적 보존 +

frame_left_full_extract:
수신 안정도 + / 캠페인 오염 +

frame_left_empty_slot_hold:
수신 안정도 + / 캠페인 농도 보류
```

### 5.3 거주태그

| 상태 | 루트 변화 |
|---|---|
| 낮음 | KEY-RING 열쇠가 맞아도 스마트 도어가 거부한다. WELCOME-DESK 질문 압박이 빨라진다. |
| 중간 | 열쇠/문패/주소/태그 대조가 가능하다. 일부 문은 끝내 열지 않는 선택이 열린다. |
| 높음 | 문은 잘 열리지만 가족 구성/입주 심사가 더 빨리 따라붙는다. |

상태값 출력:

```text
key_ring_opened_by_tag:
거주 안정도 + / 흔적 보존 -

key_ring_cross_checked:
거주 안정도 + / 흔적 보존 +

welcome_desk_question_hold:
거주태그 확정 보류 / 인간 안정도 +
```

### 5.4 인양 안정도

| 상태 | 루트 변화 |
|---|---|
| 낮음 | 침묵권은 자유처럼 보이지만 쓰러졌을 때 아무도 늦게 온다. SIGN-BACK 가짜 귀환로 유혹이 강해진다. |
| 중간 | DRAIN-MARK 회수선 기준점과 SIGN-BACK 가짜 비콘음 차단이 함께 작동한다. |
| 높음 | 보급소가 길 전체를 점유하지 않고도 중간 기준점까지 닿을 수 있다. 단, 표식 전체 공유는 추적 위험을 낳는다. |

상태값 출력:

```text
drain_mark_hidden:
캠페인 농도 - / 인양 안정도 --

drain_mark_full_share:
인양 안정도 ++ / 캠페인 농도 +

drain_mark_dual_marks:
인양 안정도 + / 흔적 보존 +

sign_back_fake_beacon_blocked:
인양 안정도 + / 수신 안정도 +
```

### 5.5 로봇 자율성

| 상태 | 루트 변화 |
|---|---|
| 낮음 | VAC-0는 청소만 반복하고 사람 흔적도 위험물처럼 처리한다. |
| 중간 | 청소 제외 목록을 적용하고 PATCH가 분류 기준을 제안한다. |
| 높음 | VAC-0가 "이것도 치워야 합니까?"라고 묻는다. |

상태값 출력:

```text
vac0_disabled:
흔적 보존 + / 로봇 자율성 -

vac0_unrestricted:
통행/거주 안정도 + / 흔적 보존 --

vac0_exclusion_list:
로봇 자율성 + / 흔적 보존 +

vac0_patch_classifier:
로봇 자율성 ++ / 충전태그 소모
```

### 5.6 흔적 보존

| 상태 | 루트 변화 |
|---|---|
| 낮음 | KEY-RING의 열쇠 대조, VAC-0 제외 목록, FRAME-LEFT 이름 조각이 늦어진다. |
| 중간 | 이름/주소/열쇠/사진을 서로 대조할 수 있다. P1 루트가 정상 선택지로 열린다. |
| 높음 | 복희 이름 보관함과 세븐 기록 분석이 강해진다. 하지만 캠페인도 흔적을 더 정확히 읽을 수 있다. |

상태값 출력:

```text
key_ring_pending_board:
흔적 보존 + / 캠페인 농도 보류

vac0_exclusion_list:
흔적 보존 + / 로봇 자율성 +

welcome_desk_ticket_evidence:
흔적 보존 + / 캠페인 농도 보류

frame_left_name_to_bokhee:
흔적 보존 ++ / 인간 안정도 +
```

---

## 6. 조합별 P1 루트 결과

### 6.1 권장 루트

필요 플래그:

```text
drain_mark_partial_extraction_point
drain_mark_dual_marks
sign_back_fake_beacon_blocked
sign_back_signal_criteria
key_ring_cross_checked
key_ring_pending_board
vac0_exclusion_list
vac0_patch_classifier
welcome_desk_question_hold
welcome_desk_ticket_evidence
frame_left_name_to_bokhee
frame_left_empty_slot_hold
```

결과:

```text
침묵권은 완전 공개되지 않는다.
가짜 귀환로는 표지판이 아니라 신호 기준으로 검증된다.
낡은 관리실의 열쇠는 즉시 사용되지 않고 대조된다.
VAC-0는 위험물과 흔적을 구분하기 시작한다.
WELCOME-DESK는 창구 추천이 아니라 질문 보류를 남긴다.
FRAME-LEFT는 사진에서 구출되지 않고 이름/역할/빈칸이 분리된다.
```

상태값:

```text
통행 안정도 +
수신 안정도 +
거주 안정도 +
인양 안정도 +
로봇 자율성 +
흔적 보존 ++
캠페인 농도 보류
```

대가:

```text
느리다.
문이 바로 열리지 않는다.
표식과 순번표와 사진이 불편하게 남는다.
캠페인은 보류된 자료를 다시 결합하려 한다.
```

### 6.2 빠른 해결 루트

주요 플래그:

```text
drain_mark_full_share
sign_back_sign_rotated
key_ring_opened_by_key
vac0_unrestricted
welcome_desk_c_window 또는 welcome_desk_fast_track
frame_left_full_extract
```

결과:

```text
길은 빨리 열린다.
문도 빨리 열린다.
청소도 빨리 끝난다.
상담도 빨리 진행된다.
사진 기록도 많이 확보된다.
```

문제:

```text
캠페인이 길, 열쇠, 청소 완료, 상담표, 가족사진 기록을 빠르게 결합한다.
P1이 "해결"처럼 보이지만 실제로는 R01 절차가 더 읽기 쉬워진다.
```

상태값:

```text
통행 안정도 +
수신 안정도 +
거주 안정도 +
인양 안정도 +
흔적 보존 -
로봇 자율성 -
캠페인 농도 ++
```

### 6.3 차단/파괴 루트

주요 플래그:

```text
drain_mark_hidden
sign_back_sign_destroyed
vac0_disabled
frame_left_frame_destroyed
```

결과:

```text
캠페인 일부 작동은 느려진다.
하지만 표식, 경고, 기록, 이름 조각도 같이 사라진다.
```

문제:

```text
숨은 사람은 더 찾기 어려워진다.
표지판이 사라져 경고도 사라진다.
위험물은 남는다.
사진 증거와 이름 조각이 사라진다.
```

상태값:

```text
캠페인 농도 -
인양 안정도 --
수신 안정도 -
흔적 보존 --
로봇 자율성 -
인간 안정도 -
```

---

## 7. 이름 조각과 해금 영향

| NPC | 이름 조각 | 권장 조건 | 위험 |
|---|---|---|---|
| DRAIN-MARK | 채율 | 회수선 기준점 일부 공유 또는 표식 분리 | 이름 표식이 캠페인 추적점이 될 수 있음 |
| SIGN-BACK | 태오 | 가짜 비콘음 차단, 실제 회수선 검증 | 본명이 표지판 경고문에 붙으면 추적 위험 |
| KEY-RING | 기준 | 확인 대기 열쇠판, 문패/주소/태그 대조 | 열쇠 이름표가 잘못된 귀속 자료가 될 수 있음 |
| VAC-0 | 없음 | 이름 없음 유지 | 별명 부여 시 마스코트화 위험 |
| WELCOME-DESK | 해원 | 질문 보류 도장, 순번표 증거 보관 | 상담표에 본명이 남으면 절차가 재개될 수 있음 |
| FRAME-LEFT | 아린 | 이름 조각 복희 보관, 빈칸 보류 | 사진 속 정답처럼 굳으면 실패 |

이름 해금 원칙:

```text
이름 조각은 보상만이 아니다.
사람으로 부를 수 있는 틈이지만, 캠페인이 호출할 수 있는 표식이기도 하다.

P1에서는 완전 본명보다 이름 조각과 보류 상태를 우선한다.
```

---

## 8. 구현 플래그

### 8.1 입력 플래그

```text
room12_bypass_ration
room12_left_in_place
porch_line_flexible_ticket
porch_line_exact_queue
mail_loop_call_hold
mail_loop_logs_split
name_painter_names_to_bokhee
welcome_desk_question_hold
welcome_desk_ticket_evidence
dining4_fourth_seat_hold
frame_left_empty_slot_hold
vac0_exclusion_list
```

### 8.2 P1 개방 플래그

```text
r01_p1_revisit_started
r01_p1_drain_mark_unlocked
r01_p1_sign_back_unlocked
r01_p1_key_ring_unlocked
r01_p1_vac0_unlocked
r01_p1_welcome_desk_reopened
r01_p1_frame_left_revisited
```

### 8.3 선택 플래그

```text
drain_mark_full_share
drain_mark_hidden
drain_mark_partial_extraction_point
drain_mark_dual_marks
drain_mark_name_fragment

sign_back_sign_rotated
sign_back_sign_destroyed
sign_back_fake_beacon_blocked
sign_back_signal_criteria
sign_back_name_fragment

key_ring_opened_by_key
key_ring_opened_by_tag
key_ring_cross_checked
key_ring_pending_board
key_ring_name_fragment

vac0_disabled
vac0_unrestricted
vac0_exclusion_list
vac0_patch_classifier
vac0_first_question

welcome_desk_fast_track
welcome_desk_c_window
welcome_desk_question_hold
welcome_desk_ticket_evidence
welcome_desk_name_fragment

frame_left_full_extract
frame_left_frame_destroyed
frame_left_name_to_bokhee
frame_left_empty_slot_hold
frame_left_arin_fragment
```

### 8.4 통합 매트릭스 전달용 상태값 출력

```text
p1_route_passage_tag_delta
p1_route_signal_tag_delta
p1_route_residence_tag_delta
p1_route_extraction_stability_delta
p1_route_robot_autonomy_delta
p1_route_trace_preservation_delta
p1_route_campaign_density_delta
```

---

## 9. 결재 포인트

스토리팀/시스템팀은 다음을 확인하면 된다.

```text
1. P1 NPC가 단순 새 서브퀘스트가 아니라 보스 후 R01 후폭풍으로 열리는가?
2. DRAIN-MARK가 멋있는 은신자가 아니라 안전하지 않은 자유의 얼굴인가?
3. SIGN-BACK이 표지판 수리공이 아니라 가짜 귀환과 진짜 인양을 구분하게 하는 사람인가?
4. KEY-RING이 열쇠 상인이 아니라 열어도 되는지 확인하는 사람인가?
5. VAC-0가 귀여운 청소 로봇이 아니라 흔적과 위험물 구분을 배우는 장치인가?
6. WELCOME-DESK가 OPEN-HOST 복제가 아니라 상담 절차 내부의 질문 보류 담당인가?
7. FRAME-LEFT가 사진 속 유령이 아니라 가족사진 프레임의 프로필 잔향인가?
8. 통행태그, 수신태그, 거주태그, 인양 안정도, 로봇 자율성, 흔적 보존 상태값이 루트 개폐에 실제로 영향을 주는가?
9. 각 선택 결과가 다음 문서인 R01 상태값 통합 매트릭스로 넘어갈 수 있을 만큼 명확한 상태값 변화를 남기는가?
```

---

## 10. 다음 작업

바로 다음 산출물:

```text
R01_STATE_VALUE_NPC_REACTION_MATRIX_V0_1.md
```

목표:

```text
인간 안정도, 캠페인 농도, 흔적 보존, 로봇 자율성, 보급 압력,
수신태그, 통행태그, 거주태그, 인양 안정도가
R01 NPC 12명과 P1 루트에 어떤 반응을 만드는지 한 표로 모은다.
```

이유:

```text
P1 NPC 선택 분기로 각 루트의 개방 조건과 선택 플래그는 고정되었다.
다음에는 이 플래그들이 R01 전체 상태값에 어떤 누적 효과를 만드는지 통합해야 한다.
```

---

## 11. 최종 요약

R01 P1 NPC 선택 분기의 핵심은 새 장소를 많이 여는 것이 아니다.

```text
숨은 길은 인양 실패를 부른다.
친절한 귀환로는 가짜일 수 있다.
열쇠는 허가가 아니다.
청소는 흔적 삭제일 수 있다.
질문은 역할을 만든다.
사진은 사람보다 가족 칸을 먼저 보존할 수 있다.
```

따라서 P1의 좋은 선택은 빠른 개방이 아니다.

```text
표식은 일부만 공유한다.
비콘은 검증한다.
열쇠는 대조한다.
흔적은 보류한다.
질문은 멈춘다.
이름은 사진 밖에 맡긴다.
```

이 분기의 감정은 확장이 아니라 재검증이다.

```text
보스는 끝났지만,
R01은 아직 사람을 읽고 있다.
P1은 그 읽기를 하나씩 덜 위험하게 만드는 재방문이다.
```
