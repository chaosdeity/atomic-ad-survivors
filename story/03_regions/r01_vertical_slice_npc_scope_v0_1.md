# R01 Vertical Slice NPC 구현 범위 재정리 v0.1

## 문서 상태

```text
상태:
v0.1 범위 설계 문서

용도:
R01 Vertical Slice에서 실제 구현할 NPC, 흔적, 대사, 선택 플래그의 최소 범위를 확정한다.

후속 구현 목록:
`story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md`

전제:
이번 문서는 실제 게임 코드가 아니다.
R01 NPC 12명을 전부 직접 등장시키지 않는다.
구현자는 이 문서를 보고 어떤 NPC를 직접 만들고, 어떤 NPC를 흔적으로만 선노출할지 판단한다.
```

---

## 0. 판정 요약

Vertical Slice의 핵심 판정은 아래와 같다.

| 범위 | NPC | 판정 |
|---|---|---|
| 필수 직접 체감 축 | OPEN-HOST, ROOM-12, PORCH-LINE | 직접 대면 또는 그에 준하는 짧은 장면으로 구현한다 |
| 필수 비인간/잔향 축 | MAIL-LOOP | 사람 NPC로 만들지 않고 음성/우편함/주소 로그로 구현한다 |
| 축소 구현 | DINING-4 | 첫 보스 전 압박 장면에 짧게 넣는다 |
| 선택 선노출 | NAME-PAINTER, VAC-0 | 오브젝트 흔적 또는 1줄 반응까지만 둔다 |
| 보스 후 잔향 | FRAME-LEFT | 보스 직후 짧은 기억 추출/프로필 잔향으로만 둔다 |
| P1 이후 보류 | DRAIN-MARK, SIGN-BACK, KEY-RING, WELCOME-DESK | 직접 구현하지 않고 흔적/닫힌 경로/상담표로만 예고한다 |

가장 중요한 결론:

```text
Vertical Slice는 NPC 12명을 소개하는 구간이 아니다.
R01의 질문을 플레이어가 처음 몸으로 느끼는 구간이다.

따라서 직접 대면은 줄이고,
주소, 순번, 배급, 빈자리, 안내, 사진 잔향이 서로 물리는 느낌을 우선 구현한다.
```

다음 작업 포인터:

```text
R01 Vertical Slice NPC 구현 목록

이유:
Vertical Slice 범위와 보스 연결은 정리되었으므로,
이제 각 NPC를 실제 씬/오브젝트/대사 수/플래그 단위로 자른 구현 목록을 둔다.
```

---

## 1. Vertical Slice 범위 기준

이번 범위 설계의 기준은 아래 여섯 단위다.

| 구현 단위 | 의미 | Vertical Slice 기준 |
|---|---|---|
| 직접 대면 | NPC 모델/상호작용/짧은 대사 필요 | 최대 4명 중심, 보스 후 FRAME-LEFT는 짧은 예외 |
| 음성/잔향 | 사람 모델 없이 음성, 로그, 반복 장치로 노출 | MAIL-LOOP, OPEN-HOST 초기 목소리, FRAME-LEFT 잔향 |
| 오브젝트 흔적 | 문패, 순번표, 우편함, 식탁, 프레임, 청소 흔적 | P1 NPC 선노출의 기본 방식 |
| 대사 1~3줄 | 첫 만남/선택 직후/보스 전후 반응 | 설명문이 아니라 조건 대사만 사용 |
| 선택 플래그만 | 아직 전체 퀘스트 없이 결과 상태만 기록 | 후속 문서와 구현 데이터 연결용 |
| 후속 보류 | 이름 해금, P1 재방문, 확장 선택을 다음 단계로 넘김 | DRAIN-MARK, SIGN-BACK, KEY-RING, WELCOME-DESK 중심 |

Vertical Slice에서 바로 구현할 상태값은 전체 11개가 아니라 아래 묶음으로 줄인다.

| 최소 상태값 | 이유 |
|---|---|
| 인간 안정도 | PORCH-LINE 줄, ROOM-12 이동 보류, 보스 후 해산 압박을 지배한다 |
| 캠페인 농도 | OPEN-HOST 안내, MAIL-LOOP 호출, FRAME-LEFT 보정 위험을 보여준다 |
| 흔적 보존 | NAME-PAINTER, VAC-0, FRAME-LEFT, MAIL-LOOP의 공통 축이다 |
| 보급 압력 | ROOM-12와 DINING-4가 바로 구출 대상처럼 보이지 않게 만든다 |
| 수신태그 | MAIL-LOOP와 보스 후 세븐 분석, SIGN-BACK 예고를 연결한다 |
| 통행태그 | OPEN-HOST 안내가 구조가 아니라 검증 대상임을 만든다 |
| 거주태그/식량태그 | ROOM-12와 DINING-4의 자리/저녁/가족대표 압박을 만든다 |

로봇 자율성과 충전태그는 VAC-0를 넣을 경우에만 최소값으로 둔다.

---

## 2. 기존 추천 재검토

| NPC | 기존 추천 | Vertical Slice 판정 | 구현 단위 | 핵심 플래그 | 대사 범위 | 이유 |
|---|---|---|---|---|---|---|
| OPEN-HOST | 필수 | 필수 유지 | 직접 대면, 초기 음성/흔적 | `open_host_trace_seen`, `open_host_voice_warned`, `open_host_route_verified` | 3줄 | R01 길과 안내를 검증 대상으로 만든다 |
| ROOM-12 | 필수 | 필수 유지 | 직접 대면, 선택 플래그 | `room12_bypass_ration`, `room12_left_in_place`, `room12_forced_removed` | 3줄 | 감정 핵심이지만 구출 완료처럼 보이면 안 된다 |
| MAIL-LOOP | 필수 | 필수 유지 | 음성/우편함/주소 로그 | `mail_loop_seen`, `mail_loop_call_hold`, `mail_loop_family_call_active` | 2~3줄 | 초반부터 주소와 가족 호출 공포를 체감시킨다 |
| PORCH-LINE | 필수 | 필수 유지 | 직접 대면, 순번표 | `porch_line_flexible_ticket`, `porch_line_exact_queue`, `porch_line_dispersed` | 2~3줄 | 줄이 질서이면서 위험이라는 R01 생활 압력을 보여준다 |
| NAME-PAINTER | 있으면 좋음 | 축소 선노출 | 문패/칠 흔적, 선택적 1줄 | `name_painter_seen`, `name_painter_hold_marks` | 0~1줄 | 이름 오염을 보여주되, 전체 이름 보관 선택은 보류한다 |
| DINING-4 | 있으면 좋음 | 보스 전 필수 압박으로 승격 | 짧은 직접 장면, 식탁/의자 | `dining4_hint_seen`, `dining4_fourth_seat_hold` | 1~2줄 | 첫 보스 전 빈 가족 칸 압박을 만들려면 필요하다 |
| VAC-0 | 있으면 좋음 | 선택 선노출 | 청소 흔적, 장치음 | `vac0_seen`, `vac0_exclusion_list` | 0~1줄 | 흔적 삭제 위험을 심되 P1 로봇 분기는 보류한다 |
| DRAIN-MARK | P1 이후 | 직접 보류 | 배수로 표식/끊긴 비콘 | `drain_mark_hint_seen` | 없음 | 안전하지 않은 자유는 P1에서 열어야 한다 |
| SIGN-BACK | P1 이후 | 직접 보류 | 돌아간 표지판/가짜 귀환로 암시 | `sign_back_hint_seen` | 없음 | 가짜 귀환과 진짜 인양 구분은 보스 후 과제다 |
| KEY-RING | P1 이후 | 직접 보류 | 잠긴 문/낡은 열쇠 소리 | `key_ring_hint_seen` | 없음 | 열쇠/권한 검증은 P1 관리실 루트로 넘긴다 |
| WELCOME-DESK | P1 이후 | 직접 보류, 절차 흔적만 | 상담표/순번표/질문 문구 | `welcome_desk_ticket_hint` | 0~1줄 | OPEN-HOST와 겹치지 않게 질문 압박만 남긴다 |
| FRAME-LEFT | P1 이후 | 보스 후 짧은 잔향 | 가족사진 프레임, 기억 추출 | `frame_left_hint_seen`, `frame_left_arin_fragment` | 1~2줄 | 보스 클리어가 구원 완료가 아님을 가장 짧게 보여준다 |

재검토 결과:

```text
필수 4명 기준은 유지한다.
단, DINING-4는 "있으면 좋음"에서 보스 전 압박용 최소 구현으로 올린다.
FRAME-LEFT는 P1 본격 구현이 아니라 보스 후 잔향 1회로만 앞당긴다.
WELCOME-DESK는 직접 NPC가 아니라 상담표/질문 압박으로 남긴다.
```

---

## 3. P0 첫 30분 노출 범위

P0 첫 30분은 "누가 사연을 설명하는가"보다 "R01에서 사람이 어떻게 역할로 읽히는가"를 먼저 보여준다.

### 3.1 직접 보여줄 것

| 노출 | 구현 방식 | 의도 |
|---|---|---|
| PORCH-LINE의 현관 줄 | 짧은 직접 대면, 순번표, 밀림 반응 | 줄이 폭력이 아니라 폭력을 늦추는 장치임을 보여준다 |
| MAIL-LOOP 우편함 | 반복 음성, 주소 로그, 호출 대기 | 주소가 남는 것과 사람이 확인되는 것이 다름을 보여준다 |
| OPEN-HOST 안내 흔적 | 음성/안내판/동선 표시, 후반 직접 대면 예고 | 친절한 길이 검증 대상임을 심는다 |
| NAME-PAINTER 흔적 | 덧칠된 문패, 보류 표시, 이름 번짐 | 이름을 지우거나 남기는 일이 모두 위험하다는 예고 |
| VAC-0 청소 흔적 | 흡입 자국, 정리된 식탁, 치워진 메모 후보 | 깨끗함이 안전이 아닐 수 있음을 예고 |

### 3.2 직접 대면하지 않을 것

| 보류 대상 | 보류 이유 |
|---|---|
| ROOM-12 | 너무 빨리 만나면 단순 구출 대상으로 읽힌다. 첫 보스 전 배급/자리 압박이 보인 뒤 직접 만난다 |
| DINING-4 | 초반 일반 주민이 아니라 보스 전 빈 가족 칸 압박으로 써야 한다 |
| FRAME-LEFT | 보스 전 직접 등장 금지. 사진 속 유령처럼 보일 위험이 크다 |
| DRAIN-MARK, SIGN-BACK, KEY-RING | P1 이후 루트의 주제다. 배수로, 표지판, 열쇠 흔적만 둘 수 있다 |
| WELCOME-DESK | OPEN-HOST 복제처럼 보일 수 있으므로 상담표/질문 문구만 선노출한다 |

P0 첫 30분의 최소 대사:

| NPC/장치 | 조건 | 대사 | 용도 |
|---|---|---|---|
| PORCH-LINE | `first_meet` | 줄이 좋은 건 아닙니다. 줄이 없으면 주먹이 순서가 됩니다. | `first_meet` |
| MAIL-LOOP | `first_meet` | 주소가 남아 있습니다. 사람은 확인되지 않았습니다. | `first_meet` |
| OPEN-HOST | `open_host_voice_warned` | 안전한 길이 아니라, 안전해 보이는 길입니다. | `boss_before_hint` |

---

## 4. 첫 보스 전 필수 NPC

첫 보스 전에는 아래 다섯 축만 확정한다.

| 축 | NPC/장치 | 구현 범위 | 이유 |
|---|---|---|---|
| 길 | OPEN-HOST | 직접 대면, 검증 동선 선택 | 보스 진입이 친절한 안내가 아니라 검증이 되게 한다 |
| 자리/배급 | ROOM-12 | 직접 대면, 우회 배급 또는 보류 | 감정 핵심을 만들되 즉시 구출하지 않는다 |
| 줄/순번 | PORCH-LINE | P0 직접 대면의 후속 상태 반응 | 보스 전에도 사람들이 왜 흩어질 수 없는지 유지한다 |
| 주소/호출 | MAIL-LOOP | 호출 보류 또는 가족 수령 대기 | 보스 직전 가족 호출 압박을 만든다 |
| 빈 가족 칸 | DINING-4 | 짧은 직접 장면, 네 번째 자리 보류 | 보스가 가족 칸을 채우는 절차의 얼굴임을 드러낸다 |

WELCOME-DESK는 이 단계에서 직접 대면하지 않는다.
대신 상담표, 질문 문구, A-창구 직행 안내 같은 오브젝트로만 보스 절차 압박을 보인다.

첫 보스 전 필수 플래그:

| 플래그 | 사용처 |
|---|---|
| `open_host_route_verified` | 보스 진입 동선 검증, OPEN-HOST 후폭풍 대사 |
| `room12_bypass_ration` | ROOM-12가 바로 나오지 않아도 배급 압력이 낮아진 상태 |
| `room12_left_in_place` | 해결하지 않았지만 강제 이동도 하지 않은 보류 상태 |
| `mail_loop_call_hold` | 주소는 남기되 가족 호출을 폭주시킬지 막을지 결정 |
| `porch_line_flexible_ticket` | 정확한 줄보다 덜 위험한 순번표를 남기는 선택 |
| `dining4_fourth_seat_hold` | 네 번째 가족 칸 자동 보정을 늦추는 선택 |

---

## 5. 보스 직후 잔향/기억 추출 범위

보스 직후의 목적은 "끝났다"가 아니라 "무엇이 남았는가"다.

| 잔향 | 구현 범위 | 연결 |
|---|---|---|
| FRAME-LEFT | 가족사진 프레임 잔향 1회, 이름 조각 또는 빈칸 보류 | 복희 이름 보관함, 세븐 분석, DINING-4 네 번째 자리 |
| OPEN-HOST | 후폭풍 대사 1줄 | 안내가 덜 나쁜 길이었는지 다시 검증 |
| ROOM-12 | 자리/대표 역할 후속 대사 1줄 | 우회 배급이 있었어도 구원 완료가 아님 |
| MAIL-LOOP | 주소/촬영 기록 수신 로그 | 사진 속 얼굴과 주소가 일치하지 않음 |
| DINING-4 | 의자를 조금 민 상태 또는 강제 기립 후폭풍 | FRAME-LEFT 빈칸 안정도에 반영 |

FRAME-LEFT 구현 금지선:

```text
사진 속 유령처럼 말하지 않는다.
완전한 사람 NPC처럼 길게 대화하지 않는다.
본명 전체보다 "아린" 조각과 빈칸 보류를 먼저 쓴다.
보스 후 기억 추출은 구출이 아니라 역할/사진/이름을 분리하는 장면이다.
```

보스 직후 최소 대사:

| NPC/잔향 | 조건 | 대사 | 용도 |
|---|---|---|---|
| FRAME-LEFT | `frame_left_arin_fragment` | 아린은 사진 안의 정답이 아니라, 밖에 맡길 조각입니다. | `name_unlock` |
| OPEN-HOST | `boss_after` | 그때는 그 길이 살리는 길이라고 믿었습니다. 아직 사과로는 부족하죠. | `boss_after` |
| MAIL-LOOP | `boss_after` | 촬영 기록 수신. 주소와 얼굴은 아직 일치하지 않습니다. | `boss_after` |

---

## 6. P1 재방문 NPC 처리

P1 재방문 NPC는 대부분 Vertical Slice에서 직접 구현하지 않는다.
다만 "나중에 갑자기 생긴 NPC"처럼 보이지 않도록 흔적은 먼저 둔다.

| NPC | Vertical Slice 처리 | P1 본격 기능 |
|---|---|---|
| DRAIN-MARK | 배수로 표식, 끊긴 회수선 잡음 | 침묵권과 안전하지 않은 자유 |
| SIGN-BACK | 돌아간 표지판, 가짜 귀환로 방향 암시 | 가짜 귀환과 진짜 인양 검증 |
| KEY-RING | 잠긴 문, 낡은 보조키 홈, 열쇠 소리 | 열어도 되는지 확인하는 관리실 루트 |
| WELCOME-DESK | 상담표, 질문 보류 도장, 순번표 흔적 | 상담 절차 안에서 질문을 보류하는 선택 |
| FRAME-LEFT | 보스 후 짧은 잔향까지만 | P1에서는 사진/역할/이름 조각 분리의 본격 선택 |
| VAC-0 | 청소 흔적과 제외 목록 후보 | 빈 집 내부에서 위험물과 흔적을 구분하는 첫 질문 |

P1 선노출 플래그는 저장해도 좋지만, Vertical Slice 목표 달성 조건으로 쓰지 않는다.

| 선노출 플래그 | 설명 |
|---|---|
| `drain_mark_hint_seen` | 배수로 침묵권 예고 |
| `sign_back_hint_seen` | 돌아간 표지판/가짜 귀환로 예고 |
| `key_ring_hint_seen` | 낡은 관리실/열쇠 검증 예고 |
| `welcome_desk_ticket_hint` | 상담표와 질문 보류 예고 |
| `vac0_seen` | 청소 자동화와 흔적 삭제 예고 |
| `frame_left_hint_seen` | 보스 전 사진 프레임 흔들림 예고 |

---

## 7. NPC별 구현 단위 표

| NPC | 직접 대면 | 음성/잔향 | 오브젝트 흔적 | 대사 1~3줄 | 선택 플래그만 | 후속 보류 |
|---|---|---|---|---|---|---|
| OPEN-HOST | 예 | 예 | 예 | 예 | 아니오 | 플레이어블 전환 가능성 |
| ROOM-12 | 예 | 제한 | 예 | 예 | 아니오 | 이름 조각 전체 해금 |
| PORCH-LINE | 예 | 아니오 | 예 | 예 | 아니오 | P1 재방문 줄 변화 |
| MAIL-LOOP | 아니오 | 예 | 예 | 예 | 아니오 | SIGN-BACK/KEY-RING 검증 |
| NAME-PAINTER | 제한 | 아니오 | 예 | 제한 | 예 | 이름 보관 선택 전체 |
| DINING-4 | 예, 짧게 | 제한 | 예 | 예 | 아니오 | P1 의자 이동 |
| VAC-0 | 아니오 | 제한 | 예 | 제한 | 예 | 첫 질문과 PATCH 분류 |
| DRAIN-MARK | 아니오 | 아니오 | 예 | 아니오 | 예 | P1 침묵권 |
| SIGN-BACK | 아니오 | 제한 | 예 | 아니오 | 예 | P1 가짜 귀환로 |
| KEY-RING | 아니오 | 제한 | 예 | 아니오 | 예 | P1 관리실 |
| WELCOME-DESK | 아니오 | 제한 | 예 | 제한 | 예 | P1 질문 보류 |
| FRAME-LEFT | 보스 후 제한 | 예 | 예 | 예 | 아니오 | P1 사진/이름 분리 |

직접 대면 총량:

```text
주요 직접 대면:
OPEN-HOST
ROOM-12
PORCH-LINE
DINING-4

예외적 짧은 직접/잔향:
FRAME-LEFT

비직접 필수:
MAIL-LOOP
```

이 이상 직접 대면을 늘리면 Vertical Slice가 NPC 소개장으로 흐를 위험이 크다.

---

## 8. 최소 구현 데이터 묶음

Vertical Slice에서 구현 데이터로 먼저 넘길 플래그 묶음은 아래 정도면 충분하다.

### 8.1 필수 입력/출력 플래그

| 플래그 | 목적 |
|---|---|
| `open_host_trace_seen` | OPEN-HOST를 직접 만나기 전 안내 흔적을 봤는지 |
| `open_host_voice_warned` | 친절한 길이 검증 대상임을 들었는지 |
| `open_host_route_verified` | 보스 진입 동선을 검증했는지 |
| `room12_bypass_ration` | ROOM-12의 식량/침상 공백을 우회했는지 |
| `room12_left_in_place` | 강제 이동 없이 보류했는지 |
| `room12_forced_removed` | 빠른 구출 선택으로 자리를 비웠는지 |
| `mail_loop_call_hold` | 주소 호출을 보류했는지 |
| `porch_line_flexible_ticket` | 유연한 순번표를 남겼는지 |
| `porch_line_exact_queue` | 정확한 줄을 유지했는지 |
| `porch_line_dispersed` | 줄을 해산했는지 |
| `dining4_fourth_seat_hold` | 네 번째 자리 보류를 만들었는지 |
| `frame_left_arin_fragment` | 보스 후 FRAME-LEFT 이름 조각을 분리했는지 |

### 8.2 선택 선노출 플래그

| 플래그 | 목적 |
|---|---|
| `name_painter_seen` | 이름 오염 흔적을 봤는지 |
| `name_painter_hold_marks` | 문패 보류 표시를 남겼는지 |
| `vac0_seen` | VAC-0 흔적을 봤는지 |
| `vac0_exclusion_list` | 청소 제외 목록 후보를 만들었는지 |
| `welcome_desk_ticket_hint` | 상담표/질문 보류 흔적을 봤는지 |
| `drain_mark_hint_seen` | 배수로 표식을 봤는지 |
| `sign_back_hint_seen` | 가짜 귀환로 표지판을 봤는지 |
| `key_ring_hint_seen` | 낡은 열쇠 흔적을 봤는지 |

### 8.3 최소 dialogue_refs

| NPC | 우선 참조할 대사 조건 |
|---|---|
| OPEN-HOST | `first_meet`, `open_host_route_verified`, `boss_before`, `boss_after` |
| ROOM-12 | `first_meet`, `room12_bypass_ration`, `room12_left_in_place`, `room12_forced_removed` |
| PORCH-LINE | `first_meet`, `porch_line_flexible_ticket`, `porch_line_exact_queue`, `porch_line_dispersed` |
| MAIL-LOOP | `first_meet`, `mail_loop_call_hold`, `mail_loop_active`, `boss_after` |
| DINING-4 | `first_meet`, `dining4_fourth_seat_hold`, `boss_before`, `boss_after` |
| FRAME-LEFT | `boss_after`, `frame_left_arin_fragment` |
| VAC-0 | `first_meet`, `vac0_exclusion_list`, `vac0_unrestricted` |

---

## 9. 최소 구현으로 살아야 하는 R01 핵심 질문

Vertical Slice는 아래 질문이 살아 있으면 성공이다.

| 질문 | 최소 구현에서 담당하는 축 |
|---|---|
| 친절한 길은 구조인가, 유도인가? | OPEN-HOST, 통행태그 |
| 줄은 폭력인가, 폭력을 늦추는 장치인가? | PORCH-LINE, 인간 안정도 |
| 주소가 남으면 사람도 돌아오는가? | MAIL-LOOP, 수신태그 |
| 자리를 비우는 것은 구출인가, 다른 사람의 저녁을 끊는 일인가? | ROOM-12, 식량태그/보급 압력 |
| 빈 가족 칸은 그냥 빈자리인가, 자동으로 채워지는 절차인가? | DINING-4, 거주태그 |
| 깨끗하게 치우면 안전해지는가, 사람 흔적도 사라지는가? | VAC-0, 흔적 보존 |
| 사진 속에 남은 것은 사람인가, 역할인가? | FRAME-LEFT, 보스 후 잔향 |

성공 기준:

```text
플레이어가 "NPC를 몇 명 구했나"보다
"왜 이 사람들을 바로 데려오면 안 되는가"를 먼저 이해한다.

보스 전에는 줄, 주소, 자리, 안내가 서로 얽힌다.
보스 후에는 사진, 이름 조각, 주소 로그가 아직 정리되지 않은 채 남는다.
```

실패 기준:

```text
NPC 12명을 모두 직접 등장시킨다.
ROOM-12를 단순 구출 대상으로 만든다.
PORCH-LINE을 줄 관리자나 문지기로만 만든다.
MAIL-LOOP에 사람 본명을 붙인다.
VAC-0를 귀여운 보조 로봇처럼 만든다.
FRAME-LEFT를 사진 속 유령처럼 만든다.
WELCOME-DESK를 OPEN-HOST의 상담 버전으로 만든다.
P1 NPC를 초반 서브퀘스트로 많이 연다.
```

---

## 10. 다음 작업 포인터

Vertical Slice NPC 범위 재정리는 완료 판정으로 둔다.

후속 구현 목록은 작성 완료 기준으로 둔다.

```text
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md
```

그 다음 작업은 아래가 먼저다.

```text
R01 NPC 데이터 스키마 적용
```

권장 산출물:

```text
story/03_regions/r01_npc_data_schema_application_v0_1.md
```

다음 작업에서 확인할 항목:

```text
1. 구현 목록의 씬 ID 후보를 데이터 스키마 필드로 옮긴다.
2. 필수/선택 플래그를 choice_flags와 dialogue_refs에 연결한다.
3. 직접 대면 NPC와 잔향형 NPC의 npc_type을 다시 확인한다.
4. P1 보류 NPC가 Vertical Slice 완료 조건에 섞이지 않게 한다.
```
