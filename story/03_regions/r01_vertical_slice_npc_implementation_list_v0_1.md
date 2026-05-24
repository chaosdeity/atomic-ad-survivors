# R01 Vertical Slice NPC 구현 목록 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
R01 NPC 12명을 Vertical Slice 실제 구현 단위로 자르는 제작 목록.
새 NPC 추가 아님.
기존 R01 NPC 구현 범위 재정리 문서를 구현팀용 작업표로 접는 문서.

기준 문서:
story/03_regions/r01_vertical_slice_npc_scope_v0_1.md
story/03_regions/r01_npc_data_schema_draft_v0_1.md
story/03_regions/r01_npc_dialogue_bank_v0_1.md
story/03_regions/r01_boss_npc_links_v0_1.md
story/03_regions/r01_suburb.md

다음 작업 포인터:
R01 NPC 데이터 스키마 적용
```

---

## 0. 판정 요약

Vertical Slice에서 R01 NPC 12명은 아래처럼 구현한다.

| 구현 묶음 | NPC | 직접 모델/상호작용 | 판정 |
|---|---|---|---|
| 직접 대면 | OPEN-HOST, ROOM-12, PORCH-LINE, DINING-4 | 필요 | 필수 구현 |
| 음성 잔향 | MAIL-LOOP | 불필요 | 필수 구현 |
| 오브젝트 흔적 | NAME-PAINTER, VAC-0 | 불필요 | 축소 구현 |
| 보스 후 잔향 | FRAME-LEFT | 제한 | 보스 후 1회 구현 |
| P1 보류 | DRAIN-MARK, SIGN-BACK, KEY-RING, WELCOME-DESK | 불필요 | 흔적 예고만 |

핵심 결론:

```text
12명 전원 직접 대면 금지.
Vertical Slice 직접 대면 총량은 4명 + 보스 후 FRAME-LEFT 제한 노출까지만 허용한다.
MAIL-LOOP는 사람 NPC가 아니라 우편함/주소/수신 잔향으로 구현한다.
P1 NPC는 초반 서브퀘스트로 열지 않고, 흔적 플래그만 남긴다.
```

이 문서의 목적:

```text
구현팀이 각 NPC별로 필요한 에셋, 노출 장면, 대사 수, 저장 플래그를 바로 확인하게 한다.
스토리팀이 새 사연을 덧붙이지 않게 한다.
기획팀이 R01 첫 30분을 NPC 소개장이 아니라 지역 절차 체감 구간으로 유지하게 한다.
```

---

## 1. 구현 묶음 기준

| 묶음 | 구현 의미 | 허용 범위 | 금지 |
|---|---|---|---|
| 직접 대면 | 모델/초상/대화창/선택지 또는 그에 준하는 장면 | 첫 만남 1회, 선택 후 1~2회, 보스 전후 1회 | 장문 개인 퀘스트 |
| 음성 잔향 | 사람 없이 음성, 로그, 반복 장치로 노출 | 2~4줄 반복, 주소/수신 로그 | 본명 부여, 인간화 |
| 오브젝트 흔적 | 문패, 청소 흔적, 상담표, 열쇠, 표식처럼 상호작용 가능한 물건 | 조사 문구, 0~1줄 반응, 플래그 저장 | 직접 NPC화 |
| 보스 후 잔향 | 보스 직후 기억 추출/프로필 잔향 | 짧은 컷/로그/이름 조각 | 사진 속 유령 대화 |
| P1 보류 | P1에서 본격 등장할 축을 초반에 예고 | 닫힌 길, 표식, 보류 도장, 잠긴 문 | P0 직접 대면 |

Vertical Slice에서 우선 구현할 상태값:

```text
human_stability
campaign_density
trace_preservation
supply_pressure
signal_tag
passage_tag
residence_tag
ration_tag
```

VAC-0를 넣을 경우에만 최소 구현:

```text
robot_autonomy
charge_tag
```

---

## 2. 12명 구현 목록

| 번호 | NPC | NPC별 구현 등급/묶음 | 첫 노출 지점 | 필요한 씬/오브젝트 | 필요한 대사 수 | 상태값/플래그 | Vertical Slice 목적 |
|---:|---|---|---|---|---:|---|---|
| 1 | OPEN-HOST | 직접 대면 | 모델하우스 접근 전 안내 동선 | 간단 모델/초상, 안내선, 보스 진입 선택지 | 3~5줄 | `open_host_trace_seen`, `open_host_voice_warned`, `open_host_route_verified` | 친절한 길을 검증 대상으로 만든다 |
| 2 | ROOM-12 | 직접 대면 | 12번 방/식탁 좌석 압박 이후 | 간단 모델/초상, 자리 보류 선택지 | 3~5줄 | `room12_bypass_ration`, `room12_left_in_place`, `room12_forced_removed` | 구출보다 조건 만들기가 먼저임을 보여준다 |
| 3 | PORCH-LINE | 직접 대면 | 침묵 가장자리/현관 줄 | 간단 모델/초상, 순번표 오브젝트 | 3~4줄 | `porch_line_flexible_ticket`, `porch_line_exact_queue`, `porch_line_dispersed` | 줄이 폭력이면서 폭력을 늦추는 장치임을 보여준다 |
| 4 | NAME-PAINTER | 오브젝트 흔적 | 분양 주택 루프/문패 골목 | 덧칠 문패, 번진 이름, 보류 표시 | 0~1줄 | `name_painter_seen`, `name_painter_hold_marks` | 이름 오염을 예고하되 이름 보관 선택은 보류한다 |
| 5 | MAIL-LOOP | 음성 잔향 | 웃는 우편함/주소 로그 | 우편함 오브젝트, 반복 음성, 주소 UI 로그 | 3~4줄 | `mail_loop_seen`, `mail_loop_call_hold`, `mail_loop_family_call_active` | 주소와 사람이 다르다는 첫 공포를 만든다 |
| 6 | VAC-0 | 오브젝트 흔적 | 빈 집 내부/청소 경로 | 청소 흔적, 먼지통, 제외 목록 후보, 장치음 | 0~1줄 | `vac0_seen`, `vac0_exclusion_list` | 깨끗함과 흔적 삭제의 위험을 심는다 |
| 7 | DRAIN-MARK | P1 보류 | 배수로 침묵 주머니 입구 | 젖은 표식, 약한 비콘음, 닫힌 통로 | 0줄 | `drain_mark_hint_seen` | 침묵권은 P1에서 열기 위해 예고만 남긴다 |
| 8 | SIGN-BACK | P1 보류 | 가짜 귀환로/돌아간 표지판 | 방향이 바뀐 표지판, 가짜 귀환 안내문 | 0줄 | `sign_back_hint_seen` | 가짜 귀환과 진짜 인양 구분을 후속 과제로 남긴다 |
| 9 | KEY-RING | P1 보류 | 낡은 관리실/잠긴 문 | 잠긴 문, 보조키 홈, 낡은 열쇠 소리 | 0줄 | `key_ring_hint_seen` | 물리 열쇠와 태그 권한 검증을 P1로 넘긴다 |
| 10 | DINING-4 | 직접 대면 | 모델하우스 식탁/네 번째 자리 | 짧은 직접 장면, 식탁 의자, 자리 보류 선택지 | 2~3줄 | `dining4_hint_seen`, `dining4_fourth_seat_hold` | 빈 가족 칸이 자동으로 채워지는 압박을 만든다 |
| 11 | WELCOME-DESK | P1 보류 | 오픈하우스 상담 데스크 | 상담표, 질문 보류 도장, 순번표 흔적 | 0~1줄 | `welcome_desk_ticket_hint` | OPEN-HOST와 겹치지 않게 절차 흔적만 남긴다 |
| 12 | FRAME-LEFT | 보스 후 잔향 | 보스 직후 가족사진 프레임 | 프레임 잔향, 이름 조각, 세븐/복희 분석 연결 | 2~3줄 | `frame_left_hint_seen`, `frame_left_arin_fragment` | 보스 클리어가 구원 완료가 아님을 남긴다 |

---

## 3. 직접 대면 구현

직접 대면은 네 명만 우선한다.

```text
OPEN-HOST
ROOM-12
PORCH-LINE
DINING-4
```

### 3.1 OPEN-HOST

| 항목 | 구현 |
|---|---|
| 첫 노출 | 안내 음성/표지 흔적 후 직접 대면 |
| 장면 | 모델하우스 접근 전, 보스 진입 동선 검증 |
| 상호작용 | 안내를 그대로 따르기 / 경로 검증 / 보류 |
| 출력 | 보스 진입 동선, 통행태그 압력, 후폭풍 대사 |
| 최소 대사 | 첫 대면 1줄, 경로 검증 1줄, 보스 전 1줄, 보스 후 1줄 |
| 금지 | R01 설명 NPC, 착한 내부자, 바로 플레이어블 전환 |

필수 플래그:

```text
open_host_trace_seen
open_host_voice_warned
open_host_route_verified
```

### 3.2 ROOM-12

| 항목 | 구현 |
|---|---|
| 첫 노출 | 배급/침상 압박을 본 뒤 직접 대면 |
| 장면 | 12번 방 또는 식탁 좌석 |
| 상호작용 | 우회 배급 만들기 / 자리에 남기기 / 강제 이동 |
| 출력 | 인간 안정도, 식량태그, 거주태그, 보스 전 가족 칸 압박 |
| 최소 대사 | 첫 대면 1줄, 선택 반응 2줄, 보스 후 1줄 |
| 금지 | 단순 구출 대상, 비극 피해자, 정답 선택 제공 |

필수 플래그:

```text
room12_bypass_ration
room12_left_in_place
room12_forced_removed
```

### 3.3 PORCH-LINE

| 항목 | 구현 |
|---|---|
| 첫 노출 | R01 입구 현관 줄 |
| 장면 | 첫 30분 안 짧은 직접 대면 |
| 상호작용 | 유연한 순번표 / 정확한 줄 유지 / 줄 해산 |
| 출력 | 인간 안정도, 보스 전 대기열, ROOM-12 후속 |
| 최소 대사 | 첫 대면 1줄, 선택 반응 2줄 |
| 금지 | 문지기, 꼰대, 줄 관리자 단순화 |

필수 플래그:

```text
porch_line_flexible_ticket
porch_line_exact_queue
porch_line_dispersed
```

### 3.4 DINING-4

| 항목 | 구현 |
|---|---|
| 첫 노출 | 보스 전 모델하우스 식탁 |
| 장면 | 네 번째 자리 자동 보정 압박 |
| 상호작용 | 자리 보류 / 그냥 지나감 |
| 출력 | 거주태그, 식량태그, FRAME-LEFT 보스 후 안정도 |
| 최소 대사 | 첫 대면 1줄, 보스 전 1줄, 보스 후 1줄 |
| 금지 | 일반 식당 NPC, 감성 주민, ROOM-12 반복 |

필수 플래그:

```text
dining4_hint_seen
dining4_fourth_seat_hold
```

---

## 4. 음성 잔향 구현

### MAIL-LOOP

MAIL-LOOP는 사람 모델을 만들지 않는다.

| 항목 | 구현 |
|---|---|
| 형태 | 우편함 목소리 잔향 |
| 첫 노출 | 웃는 우편함, 주소 로그, 반복 호출 |
| 상호작용 | 주소 확인 / 호출 보류 / 가족 수령 대기 로그 |
| 출력 | 수신태그, 주소 흔적, 보스 직전 가족 호출 압박 |
| 최소 대사 | 첫 호출 1줄, 보류 1줄, 활성 1줄, 보스 후 1줄 |
| 금지 | 사람 본명 부여, 말하는 우편함 마스코트화, 힌트 장치화 |

필수 플래그:

```text
mail_loop_seen
mail_loop_call_hold
mail_loop_family_call_active
```

구현 메모:

```text
MAIL-LOOP의 대사는 화면 중앙 대화창보다 우편함/주소 로그 UI로 출력하는 편이 좋다.
같은 문장을 반복하되, 플레이어 선택 뒤 단어 하나가 바뀌는 방식이 효과적이다.
```

---

## 5. 오브젝트 흔적 구현

### 5.1 NAME-PAINTER

| 항목 | 구현 |
|---|---|
| 형태 | 덧칠된 문패와 번진 이름 |
| 첫 노출 | 분양 주택 루프 문패 골목 |
| 상호작용 | 읽기 / 보류 표시 남기기 |
| 출력 | 흔적 보존, 복희 이름 보관함 후속 |
| 최소 대사 | 없음. 필요 시 윤서 반응 1줄 |
| 금지 | 직접 대면, 이름 수집가 퀘스트, 감성 낙서꾼 |

필수 플래그:

```text
name_painter_seen
name_painter_hold_marks
```

### 5.2 VAC-0

| 항목 | 구현 |
|---|---|
| 형태 | 청소 흔적, 먼지통, 제외 목록 후보 |
| 첫 노출 | 빈 집 내부 |
| 상호작용 | 청소 제외 목록 확인 / 흔적 보존 표시 |
| 출력 | 흔적 보존, 로봇 자율성 씨앗, PATCH/리오 대비 |
| 최소 대사 | 장치음 또는 짧은 자동 문구 0~1줄 |
| 금지 | 귀여운 보조 로봇, PATCH 하위 모델, 리오 축소판 |

필수 플래그:

```text
vac0_seen
vac0_exclusion_list
```

---

## 6. 보스 후 잔향 구현

### FRAME-LEFT

FRAME-LEFT는 보스 전 직접 대면 금지다.
보스 후 짧은 잔향으로만 등장한다.

| 항목 | 구현 |
|---|---|
| 형태 | 가족사진 프레임 프로필 잔향 |
| 첫 노출 | 보스 직후 |
| 상호작용 | 이름 조각 보류 / 복희에게 맡기기 / 세븐 분석 |
| 출력 | `아린` 조각, 흔적 보존, 보스 후 후폭풍 |
| 최소 대사 | 잔향 1줄, 복희/세븐 연결 1~2줄 |
| 금지 | 사진 속 유령, 장문 대화, 보스 보상 NPC |

필수 플래그:

```text
frame_left_hint_seen
frame_left_arin_fragment
frame_left_name_to_bokhee
```

구현 메모:

```text
FRAME-LEFT는 "채아린" 전체 이름보다 "아린" 조각을 먼저 쓴다.
이름 조각은 구원 완료가 아니라 보관해야 할 후폭풍이다.
```

---

## 7. P1 보류 구현

P1 보류 대상은 P0에서 직접 대면하지 않는다.
단, 나중에 갑자기 생긴 NPC처럼 보이지 않도록 흔적은 남긴다.

| NPC | P0 흔적 | 저장 플래그 | P1 본격 기능 | 금지 |
|---|---|---|---|---|
| DRAIN-MARK | 배수로 표식, 약한 비콘음, 젖은 지도 조각 | `drain_mark_hint_seen` | 침묵권, 인양 불안정, 안전하지 않은 자유 | 초반 은신자/정찰꾼 직접 대면 |
| SIGN-BACK | 돌아간 표지판, 친절해진 귀환로 문구 | `sign_back_hint_seen` | 가짜 귀환과 진짜 인양 검증 | 길 안내 NPC |
| KEY-RING | 잠긴 관리실, 보조키 홈, 낡은 열쇠 소리 | `key_ring_hint_seen` | 물리 열쇠와 태그 권한 검증 | 열쇠 상인 |
| WELCOME-DESK | 상담표, 질문 보류 도장, 닫힌 데스크 | `welcome_desk_ticket_hint` | 상담 절차 안의 질문 보류 | OPEN-HOST 상담 버전 |

P1 보류 공통 규칙:

```text
P0에서는 조사 문구와 플래그만 남긴다.
대사 출력은 0줄을 기본값으로 둔다.
WELCOME-DESK만 상담표 자동 문구 1줄까지 허용한다.
P1 직접 대면은 r01_p1_npc_branch_map_v0_1.md 기준으로 연다.
```

---

## 8. 장면/씬 순서 구현표

| 순서 | 구간 | 노출 NPC/흔적 | 구현 포인트 |
|---:|---|---|---|
| 1 | R01 진입 | PORCH-LINE, MAIL-LOOP | 현관 줄과 주소 호출을 먼저 보여준다 |
| 2 | 분양 주택 루프 | NAME-PAINTER, VAC-0 | 이름과 흔적 삭제 위험을 오브젝트로 보여준다 |
| 3 | 모델하우스 접근 | OPEN-HOST | 친절한 안내를 검증 대상으로 만든다 |
| 4 | 보스 전 압박 | ROOM-12, DINING-4, MAIL-LOOP | 자리/저녁/가족 호출이 한 번에 조인다 |
| 5 | 보스 직후 | FRAME-LEFT, OPEN-HOST, MAIL-LOOP | 끝난 것이 아니라 남은 조각이 생겼음을 보여준다 |
| 6 | P1 예고 | DRAIN-MARK, SIGN-BACK, KEY-RING, WELCOME-DESK | 직접 대면 없이 닫힌 루트와 흔적만 남긴다 |

장면 총량 제한:

```text
직접 대면은 한 구간에 두 명 이상 몰지 않는다.
보스 전에는 ROOM-12와 DINING-4를 길게 설명하지 않는다.
MAIL-LOOP는 장면 사이를 이어주는 반복 장치로 쓴다.
```

---

## 9. 최소 데이터 적용 목록

### 9.1 npc_id 권장값

| NPC | npc_id | npc_type | exposure_phase |
|---|---|---|---|
| OPEN-HOST | `r01_open_host` | `human_internal` | `p0_trace`, `pre_boss`, `post_boss` |
| ROOM-12 | `r01_room_12` | `human_resident` | `pre_boss`, `post_boss` |
| PORCH-LINE | `r01_porch_line` | `human_resident` | `p0_first_30`, `pre_boss` |
| NAME-PAINTER | `r01_name_painter` | `human_resident` | `p0_trace`, `p1_revisit` |
| MAIL-LOOP | `r01_mail_loop` | `system_residue` | `p0_first_30`, `pre_boss`, `post_boss` |
| VAC-0 | `r01_vac_0` | `robot_device` | `p0_trace`, `p1_revisit` |
| DRAIN-MARK | `r01_drain_mark` | `human_resident` | `p0_trace`, `p1_revisit` |
| SIGN-BACK | `r01_sign_back` | `human_resident` | `p0_trace`, `p1_revisit` |
| KEY-RING | `r01_key_ring` | `human_resident` | `p0_trace`, `p1_revisit` |
| DINING-4 | `r01_dining_4` | `human_resident` | `pre_boss`, `post_boss` |
| WELCOME-DESK | `r01_welcome_desk` | `human_resident` | `p0_trace`, `p1_revisit` |
| FRAME-LEFT | `r01_frame_left` | `profile_residue` | `post_boss`, `p1_revisit` |

### 9.2 필수 dialogue_refs

| NPC | 조건 |
|---|---|
| OPEN-HOST | `first_meet`, `open_host_route_verified`, `boss_before`, `boss_after` |
| ROOM-12 | `first_meet`, `room12_bypass_ration`, `room12_left_in_place`, `room12_forced_removed` |
| PORCH-LINE | `first_meet`, `porch_line_flexible_ticket`, `porch_line_exact_queue`, `porch_line_dispersed` |
| MAIL-LOOP | `first_meet`, `mail_loop_call_hold`, `mail_loop_family_call_active`, `boss_after` |
| DINING-4 | `first_meet`, `dining4_fourth_seat_hold`, `boss_before`, `boss_after` |
| FRAME-LEFT | `boss_after`, `frame_left_arin_fragment`, `frame_left_name_to_bokhee` |
| VAC-0 | `vac0_exclusion_list` |
| WELCOME-DESK | `welcome_desk_ticket_hint` |

### 9.3 필수 구현 플래그

```text
open_host_trace_seen
open_host_voice_warned
open_host_route_verified
room12_bypass_ration
room12_left_in_place
room12_forced_removed
porch_line_flexible_ticket
porch_line_exact_queue
porch_line_dispersed
mail_loop_seen
mail_loop_call_hold
mail_loop_family_call_active
dining4_hint_seen
dining4_fourth_seat_hold
frame_left_hint_seen
frame_left_arin_fragment
```

선택 선노출 플래그:

```text
name_painter_seen
name_painter_hold_marks
vac0_seen
vac0_exclusion_list
drain_mark_hint_seen
sign_back_hint_seen
key_ring_hint_seen
welcome_desk_ticket_hint
```

---

## 10. 에셋/연출 최소 목록

| 구현물 | 필수 에셋 | 우선도 |
|---|---|---:|
| PORCH-LINE 직접 대면 | NPC 스프라이트/초상, 순번표, 줄 오브젝트 | 1 |
| MAIL-LOOP 음성 잔향 | 우편함 오브젝트, 음성 로그 UI, 주소 로그 | 1 |
| OPEN-HOST 안내 검증 | NPC 스프라이트/초상, 안내선, 모델하우스 표지 | 1 |
| ROOM-12 자리 보류 | NPC 스프라이트/초상, 침상/식탁 좌석, 배급 표식 | 1 |
| DINING-4 네 번째 자리 | NPC 스프라이트/초상 또는 앉은 실루엣, 식탁, 빈 의자 | 1 |
| FRAME-LEFT 보스 후 잔향 | 가족사진 프레임, 이름 조각 UI, 짧은 잔향 효과 | 1 |
| NAME-PAINTER 흔적 | 덧칠 문패 2~3종, 보류 표시 | 2 |
| VAC-0 흔적 | 청소 경로, 먼지통, 제외 목록 쪽지 | 2 |
| P1 흔적 4종 | 배수로 표식, 돌아간 표지판, 잠긴 문, 상담표 | 2 |

---

## 11. Vertical Slice에서 만들지 않을 것 / 금지 방향

```text
NPC 12명을 모두 직접 대면으로 만든다.
P1 보류 NPC를 초반 서브퀘스트로 연다.
ROOM-12를 데려오면 끝나는 구출 대상으로 만든다.
OPEN-HOST를 친절한 튜토리얼 NPC로 만든다.
PORCH-LINE을 단순 문지기로 만든다.
MAIL-LOOP에 사람 이름을 붙인다.
VAC-0를 귀여운 동행 로봇으로 만든다.
FRAME-LEFT를 사진 속 유령처럼 길게 말하게 한다.
WELCOME-DESK를 OPEN-HOST의 상담 버전으로 만든다.
오브젝트 흔적을 전부 읽기 텍스트 장문으로 푼다.
```

---

## 12. 완료 기준

이 구현 목록이 통과하려면 아래가 지켜져야 한다.

| 기준 | 판정 |
|---|---|
| 12명 전원이 다섯 구현 묶음 중 하나로 잘렸는가? | 통과 |
| 직접 대면 수가 4명 + FRAME-LEFT 제한 노출로 제한되는가? | 통과 |
| MAIL-LOOP/VAC-0/FRAME-LEFT의 비인간/잔향 정체성이 보존되는가? | 통과 |
| P1 보류 NPC가 P0에서 흔적만 남기는가? | 통과 |
| 데이터 스키마 적용에 필요한 `npc_id`, `npc_type`, `exposure_phase`, 플래그가 보이는가? | 통과 |

최종 판정:

```text
통과.
R01 Vertical Slice NPC 구현 목록은 구현팀 전달용 기준으로 사용 가능하다.
다음 작업은 R01 NPC 데이터 스키마 적용이다.
```
