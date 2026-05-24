# R01 NPC 데이터 스키마 초안 v0.1

## 문서 상태

상태:
작성 완료.

목적:
R01 NPC 12명을 구현 데이터로 옮기기 위한 공통 스키마를 정의한다.

범위:
```text
이 문서는 실제 게임 코드 파일이 아니다.
문학 문서에 흩어진 NPC 정보, 상태값, 선택 플래그, 이름 해금, 대사 참조를
구현자가 읽을 수 있는 필드 구조로 접는 설계 문서다.
```

---

## 0. 판정 요약

R01 NPC 데이터는 단순 프로필 테이블만으로는 부족하다.

각 NPC는 아래 네 가지를 동시에 가져야 한다.

```text
1. 처음에는 코드명/역할명으로 노출된다.
2. 선택 플래그가 상태값, 대사, 이름 해금에 영향을 준다.
3. 보스 전후와 P1 재방문 시점에 다른 반응을 가진다.
4. 금지 방향과 드라마 핵심을 잃으면 구현상 편의 NPC로 무너진다.
```

따라서 본 스키마는 DB 테이블처럼 납작하게 만들지 않고,
구현 키와 드라마 잠금 필드를 함께 가진다.

---

## 1. 공통 스키마

### 1.1 최상위 필드

| 필드 | 타입 후보 | 필수 | 설명 |
|---|---|---:|---|
| `npc_id` | string | O | 구현용 고유 ID. snake_case. |
| `code_name` | string | O | 첫 노출 코드명. 예: `ROOM-12`. |
| `display_role_name` | string | O | UI/대화 로그에 쓰는 역할명. |
| `unlocked_name` | string/null | O | 조건 만족 뒤 병기 가능한 본명/원본 이름. 초기 노출 금지. |
| `name_fragment` | string/null | O | 본명 전 단계 이름 조각. FRAME-LEFT는 이 값을 우선한다. |
| `npc_type` | enum | O | 사람/장치/잔향 분리. |
| `region` | string | O | `R01`. |
| `first_location` | string | O | 첫 직접 또는 흔적 노출 위치. |
| `exposure_phase` | list enum | O | P0/P1/보스 전후 노출 단계. |
| `first_appearance_condition` | list string | O | 첫 등장 또는 첫 직접 대면 조건. |
| `state_reactions` | object | O | 주/보조 상태값과 조건 키. |
| `choice_flags` | object | O | 입력/출력 선택 플래그와 권장 플래그. |
| `dialogue_refs` | object | O | 대사 은행 조건 참조. 실제 대사는 별도 문서에 둔다. |
| `name_reveal_condition` | object | O | 이름 조각/본명 해금 조건과 금지 조건. |
| `related_npcs` | list string | O | 직접 반응하거나 조건을 공유하는 R01 NPC. |
| `hub_links` | list string | O | 복희/세븐/PATCH/미나 등 보급소 연결. |
| `boss_phase_links` | object | O | T0/T1/T2/T3 시점 연결. |
| `p1_branch_links` | object | O | P1 루트 개방/후폭풍 연결. |
| `forbidden_directions` | list string | O | 구현/연출에서 피해야 할 방향. |

### 1.2 npc_type enum

| 값 | 사용 NPC | 설명 |
|---|---|---|
| `human_internal` | OPEN-HOST | R01 내부자. NPC 선등장 후 플레이어블 전환 후보. |
| `human_resident` | ROOM-12, PORCH-LINE, NAME-PAINTER, DRAIN-MARK, SIGN-BACK, KEY-RING, DINING-4, WELCOME-DESK | R01에 남은 사람. 역할에 묶였지만 사람 이름 조각을 가질 수 있다. |
| `system_residue` | MAIL-LOOP | 주소/배송/수신 기록 잔향. 사람 본명 없음. |
| `robot_device` | VAC-0 | 홈케어 장치. 사람 이름 없음. 로봇 자율성 상태값에 반응. |
| `profile_residue` | FRAME-LEFT | 가족사진 프레임에 남은 프로필 잔향. 완전 본명보다 이름 조각 우선. |

### 1.3 exposure_phase enum

| 값 | 의미 |
|---|---|
| `p0_trace` | 흔적/오브젝트/목소리로 먼저 노출 |
| `p0_first_30` | 첫 30분 안에 직접 또는 준직접 노출 |
| `pre_boss` | 첫 보스 전/보스 직전 압박에 연결 |
| `post_boss` | 보스 직후 후폭풍과 복희/세븐 연결 |
| `p1_revisit` | P1 재방문에서 선택 루트로 개방 |

### 1.4 dialogue_refs 구조

대사 은행의 표는 `NPC / 조건 / 대사 / 용도` 구조다.
스키마에는 실제 대사를 중복 저장하지 않고, 참조 키만 둔다.

```yaml
dialogue_refs:
  first_meet:
    - condition_id: first_meet
      usage: first_meet
  states:
    - condition_id: human_stability_low
      usage: state_low
  choices:
    - condition_id: porch_line_flexible_ticket
      usage: choice_success
  phases:
    - condition_id: boss_before
      usage: boss_before
  names:
    - condition_id: porch_line_name_fragment
      usage: name_unlock
  combos:
    - condition_id: human_low_queue_broken
      usage: combo_reaction
```

참조 해석:

| 필드 | 규칙 |
|---|---|
| `condition_id` | `r01_npc_dialogue_bank_v0_1.md`의 조건 값과 일치해야 한다. |
| `usage` | 출력 우선순위와 반복 제한 그룹을 결정한다. |
| `fallback` | 조건 대사가 없을 때 쓸 기본 용도. 기본값은 `first_meet`. |

### 1.5 이름 필드 규칙

```text
code_name은 항상 초기 노출값이다.
display_role_name은 코드명만으로 부족할 때 붙는 역할명이다.
name_fragment는 중간 해금값이다.
unlocked_name은 조건부 병기값이다.
```

예외:

| NPC | 규칙 |
|---|---|
| MAIL-LOOP | `unlocked_name: null`, `name_fragment: null`, `name_reveal_condition.mode: no_person_name` |
| VAC-0 | `unlocked_name: null`, `name_fragment: null`, `name_reveal_condition.mode: no_person_name` |
| FRAME-LEFT | `name_fragment: 아린` 우선. `unlocked_name: 채아린`은 후반 최종 선택 전까지 UI 기본값으로 쓰지 않는다. |

---

## 2. 상태값/선택/대사 연결 규칙

### 2.1 state_reactions 구조

```yaml
state_reactions:
  primary:
    - human_stability
    - campaign_density
  secondary:
    - trace_preservation
  conditions:
    low:
      - human_stability_low
    mid:
      - human_stability_mid
    high:
      - human_stability_high
  combo_conditions:
    - human_low_queue_broken
```

상태값 원본 키:

| 문서 표기 | 구현 키 |
|---|---|
| 인간 안정도 | `human_stability` |
| 캠페인 농도 | `campaign_density` |
| 흔적 보존 | `trace_preservation` |
| 로봇 자율성 | `robot_autonomy` |
| 보급 압력 | `supply_pressure` |
| 수신태그 | `signal_tag` |
| 통행태그 | `passage_tag` |
| 거주태그 | `residence_tag` |
| 식량태그 | `ration_tag` |
| 충전태그 | `charge_tag` |
| 인양 안정도 | `extraction_stability` |

### 2.2 choice_flags 구조

```yaml
choice_flags:
  recommended:
    - room12_bypass_ration
  risky:
    - room12_forced_removed
    - room12_role_transferred
  hold:
    - room12_left_in_place
  unlocks:
    name_fragment:
      - room12_name_fragment
    p1_branch:
      - r01_revisit_room12_name_fragment_ready
```

플래그는 네 방향으로 연결된다.

| 연결 | 예 |
|---|---|
| 상태값 변화 | `room12_bypass_ration` -> `human_stability +`, `ration_tag +`, `trace_preservation +` |
| 대사 출력 | `room12_bypass_ration` -> `dialogue_refs.choices` |
| 이름 해금 | `room12_bypass_ration` + 복희 연결 -> `room12_name_fragment` |
| 후속 분기 | `room12_bypass_ration` + `porch_line_flexible_ticket` -> PORCH-LINE/ROOM-12 재방문 |

### 2.3 핵심 플래그 연결표

| 플래그 | 상태값 연결 | 대사 참조 | 이름/후속 연결 |
|---|---|---|---|
| `open_host_route_verified` | 통행태그 +, 흔적 보존 + | OPEN-HOST `choice_success` | `open_host_name_fragment` 가능 |
| `room12_bypass_ration` | 인간 안정도 +, 식량태그 +, 흔적 보존 + | ROOM-12 `choice_success` | `room12_name_fragment`, PORCH-LINE 재방문 |
| `porch_line_flexible_ticket` | 인간 안정도 +, 흔적 보존 + | PORCH-LINE `choice_success` | `porch_line_name_fragment`, WELCOME-DESK 질문 보류 호환 |
| `name_painter_names_to_bokhee` | 흔적 보존 ++, 캠페인 농도 보류 | NAME-PAINTER `choice_success` | `name_painter_name_fragment`, 복희 보관함 |
| `mail_loop_call_hold` | 수신태그 +, 캠페인 농도 보류 | MAIL-LOOP `choice_success` | 세븐 분석, SIGN-BACK/KEY-RING 검증 |
| `vac0_exclusion_list` | 로봇 자율성 +, 흔적 보존 + | VAC-0 `choice_success` | FRAME-LEFT/상담표 조각 보존 |
| `drain_mark_partial_extraction_point` | 인양 안정도 +, 인간 안정도 + | DRAIN-MARK `choice_success` | `drain_mark_name_fragment`, SIGN-BACK 검증 |
| `sign_back_fake_beacon_blocked` | 인양 안정도 +, 수신태그 + | SIGN-BACK `choice_success` | `sign_back_name_fragment`, KEY-RING 진입 기준 |
| `key_ring_pending_board` | 캠페인 농도 보류, 흔적 보존 + | KEY-RING `choice_hold` | `key_ring_name_fragment`, 복희 보관 |
| `dining4_fourth_seat_hold` | 인간 안정도 +, 거주태그 + | DINING-4 `choice_success` | `dining4_name_fragment`, FRAME-LEFT 안정 |
| `welcome_desk_question_hold` | 흔적 보존 +, 인간 안정도 + | WELCOME-DESK `choice_success` | `welcome_desk_name_fragment`, 상담표 보류 |
| `frame_left_name_to_bokhee` | 흔적 보존 ++, 인간 안정도 + | FRAME-LEFT `choice_success` | `frame_left_arin_fragment`, 복희 보관 |

---

## 3. NPC별 샘플 데이터 블록

아래 블록은 구현 파일이 아니라 설계 샘플이다.
필드명과 값의 방향은 유지하되, 실제 데이터 포맷은 엔진/툴 체계에 맞춰 변환한다.

### 3.1 OPEN-HOST

```yaml
npc_id: open_host
code_name: OPEN-HOST
display_role_name: 전직 오픈하우스 안내인
unlocked_name: 서이겸
name_fragment: 이겸
npc_type: human_internal
region: R01
first_location: 오픈하우스 거리 / 상담 부스 / 모델하우스 접근로
exposure_phase: [p0_trace, pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - open_host_trace_seen
  - open_host_voice_warned
state_reactions:
  primary: [campaign_density, passage_tag, residence_tag]
  secondary: [trace_preservation, human_stability]
  conditions: [campaign_density_low, campaign_density_mid, campaign_density_high]
  combo_conditions: [passage_low_supply_high]
choice_flags:
  recommended: [open_host_route_verified]
  hold: [open_host_route_rejected]
  risky: [open_host_route_published]
  unlocks: [open_host_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [campaign_density_low, campaign_density_mid, campaign_density_high]
  choices: [open_host_route_verified, open_host_route_rejected, open_host_route_published]
  phases: [boss_before, boss_after, p1_revisit]
  names: [open_host_name_fragment]
  combos: [passage_low_supply_high]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: open_host_name_fragment
  unlocked_after: 플레이어블 전환 검토 또는 후반 신뢰도 조건
related_npcs: [WELCOME-DESK, ROOM-12, SIGN-BACK, DRAIN-MARK, FRAME-LEFT]
hub_links: [세븐, PATCH]
boss_phase_links:
  t0: open_host_trace_seen
  t1: open_host_route_verified
  t2: open_host_guidance_aftershock
  t3: open_host_choice_routes
p1_branch_links:
  opens: []
  affects: [p1_route_validation]
forbidden_directions:
  - 착한 길 안내 NPC로 확정하지 않는다.
  - OPEN-HOST의 안내를 무검증 정답으로 만들지 않는다.
```

### 3.2 ROOM-12

```yaml
npc_id: room_12
code_name: ROOM-12
display_role_name: 12번 방의 가족대표
unlocked_name: 강연우
name_fragment: 연우
npc_type: human_resident
region: R01
first_location: 분양 주택 루프 / 식탁 좌석 / 임시 거주방
exposure_phase: [pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - room12_seen
  - room12_family_representative_call
state_reactions:
  primary: [ration_tag, residence_tag, supply_pressure]
  secondary: [human_stability, trace_preservation, campaign_density]
  conditions: [ration_tag_low, residence_tag_high, supply_pressure_high]
  combo_conditions: [residence_high_ration_high]
choice_flags:
  recommended: [room12_bypass_ration]
  hold: [room12_left_in_place]
  risky: [room12_forced_removed, room12_role_transferred]
  unlocks: [room12_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [ration_tag_low, ration_tag_mid, ration_tag_high]
  choices: [room12_bypass_ration, room12_left_in_place, room12_forced_removed]
  phases: [boss_before, boss_after, p1_revisit]
  names: [room12_name_fragment]
  combos: [residence_high_ration_high]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: room12_name_fragment
  required_flags: [room12_bypass_ration]
  hub_required: [복희]
related_npcs: [PORCH-LINE, DINING-4, NAME-PAINTER, WELCOME-DESK, FRAME-LEFT]
hub_links: [복희, 미나]
boss_phase_links:
  t0: room12_left_in_place
  t1: room12_bypass_affects_dining4
  t2: room12_family_role_echo
  t3: room12_revisit_ready
p1_branch_links:
  opens: [r01_revisit_room12_short_step]
  requires: [room12_bypass_ration]
forbidden_directions:
  - 단순 구출 대상처럼 처리하지 않는다.
  - 방에서 데려오면 식량/거주 문제가 해결된 것처럼 만들지 않는다.
```

### 3.3 PORCH-LINE

```yaml
npc_id: porch_line
code_name: PORCH-LINE
display_role_name: 현관 줄 관리자
unlocked_name: 백지호
name_fragment: 지호
npc_type: human_resident
region: R01
first_location: 침묵 가장자리 / 주택가 입구 / 현관 앞 줄
exposure_phase: [p0_first_30, pre_boss, p1_revisit]
first_appearance_condition:
  - porch_line_seen
  - porch_line_queue_active
state_reactions:
  primary: [human_stability, campaign_density]
  secondary: [residence_tag, ration_tag]
  conditions: [human_stability_low, human_stability_mid, human_stability_high]
  combo_conditions: [human_low_queue_broken]
choice_flags:
  recommended: [porch_line_flexible_ticket]
  hold: [porch_line_exact_queue]
  risky: [porch_line_dispersed, porch_line_removed]
  unlocks: [porch_line_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [human_stability_low, human_stability_mid, human_stability_high]
  choices: [porch_line_flexible_ticket, porch_line_exact_queue, porch_line_dispersed]
  phases: [boss_before, boss_after, p1_revisit]
  names: [porch_line_name_fragment]
  combos: [human_low_queue_broken]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: porch_line_name_fragment
  required_flags: [porch_line_flexible_ticket]
  required_state: human_stability_mid_or_high
related_npcs: [ROOM-12, WELCOME-DESK, OPEN-HOST, DRAIN-MARK]
hub_links: [미나, 복희]
boss_phase_links:
  t0: porch_line_seen
  t1: porch_line_ticket_linked_to_desk
  t2: porch_line_after_boss_hold
  t3: porch_line_room12_revisit_branch
p1_branch_links:
  opens: [r01_revisit_porch_line_name_fragment_ready]
  requires: [porch_line_flexible_ticket, room12_bypass_ration]
forbidden_directions:
  - 줄 폐기를 정답으로 만들지 않는다.
  - 단순 질서 찬양 NPC로 만들지 않는다.
```

### 3.4 NAME-PAINTER

```yaml
npc_id: name_painter
code_name: NAME-PAINTER
display_role_name: 문패 덧칠꾼
unlocked_name: 임하온
name_fragment: 하온
npc_type: human_resident
region: R01
first_location: 분양 주택 루프 / 문패 골목
exposure_phase: [p0_trace, p0_first_30, pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - name_painter_seen
  - name_painter_paint_layers_seen
state_reactions:
  primary: [trace_preservation, campaign_density]
  secondary: [residence_tag, ration_tag]
  conditions: [trace_preservation_low, trace_preservation_mid, trace_preservation_high]
  combo_conditions: [campaign_high_trace_high, robot_low_trace_low]
choice_flags:
  recommended: [name_painter_names_to_bokhee, name_painter_hold_marks]
  hold: [name_painter_names_kept]
  risky: [name_painter_names_erased]
  unlocks: [name_painter_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [trace_preservation_low, trace_preservation_mid, trace_preservation_high]
  choices: [name_painter_names_to_bokhee, name_painter_names_kept, name_painter_names_erased]
  phases: [boss_before, boss_after, p1_revisit]
  names: [name_painter_name_fragment]
  combos: [campaign_high_trace_high, robot_low_trace_low]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: name_painter_name_fragment
  required_flags: [name_painter_names_to_bokhee]
  hub_required: [복희]
related_npcs: [ROOM-12, MAIL-LOOP, KEY-RING, FRAME-LEFT, VAC-0]
hub_links: [복희]
boss_phase_links:
  t0: name_painter_seen
  t1: name_painter_name_role_risk
  t2: name_painter_frame_left_link
  t3: name_painter_revisit_hold_marks
p1_branch_links:
  opens: []
  affects: [trace_preservation_routes]
forbidden_directions:
  - 이름 수집가로 만들지 않는다.
  - 틀린 이름도 무조건 좋다는 메시지로 만들지 않는다.
```

### 3.5 MAIL-LOOP

```yaml
npc_id: mail_loop
code_name: MAIL-LOOP
display_role_name: 우편함 목소리 잔향
unlocked_name: null
name_fragment: null
npc_type: system_residue
region: R01
first_location: 침묵 가장자리 / 웃는 우편함
exposure_phase: [p0_first_30, pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - mail_loop_seen
  - mail_loop_address_ping
state_reactions:
  primary: [signal_tag, campaign_density]
  secondary: [trace_preservation, ration_tag]
  conditions: [signal_tag_low, signal_tag_mid, signal_tag_high]
  combo_conditions: [signal_high_campaign_high, campaign_high_trace_high]
choice_flags:
  recommended: [mail_loop_call_hold, mail_loop_logs_split]
  hold: [mail_loop_active]
  risky: [mail_loop_shutdown]
  unlocks: [mail_loop_no_person_name]
dialogue_refs:
  first_meet: [first_meet]
  states: [signal_tag_low, signal_tag_mid, signal_tag_high]
  choices: [mail_loop_call_hold, mail_loop_active, mail_loop_shutdown, mail_loop_logs_split]
  phases: [boss_before, boss_after, p1_revisit]
  names: [mail_loop_no_person_name]
  combos: [signal_high_campaign_high, campaign_high_trace_high]
name_reveal_condition:
  mode: no_person_name
  forbidden_name_assignment: true
  replacement_identity: 주소/배송/수신 기록 잔향
related_npcs: [NAME-PAINTER, ROOM-12, SIGN-BACK, KEY-RING, FRAME-LEFT]
hub_links: [세븐, 복희]
boss_phase_links:
  t0: mail_loop_seen
  t1: mail_loop_family_call_active
  t2: mail_loop_frame_log_split
  t3: mail_loop_p1_signal_reference
p1_branch_links:
  opens: [sign_back_signal_reference, key_ring_address_crosscheck]
  requires: [mail_loop_call_hold]
forbidden_directions:
  - 사람 본명을 붙이지 않는다.
  - 단순 힌트 장치로 축소하지 않는다.
```

### 3.6 VAC-0

```yaml
npc_id: vac_0
code_name: VAC-0
display_role_name: 작은 홈케어 청소기
unlocked_name: null
name_fragment: null
npc_type: robot_device
region: R01
first_location: 분양 주택 루프 / 빈 집 내부
exposure_phase: [p0_trace, pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - vac0_seen
  - vac0_cleaning_route_seen
state_reactions:
  primary: [robot_autonomy, charge_tag, trace_preservation]
  secondary: [campaign_density, residence_tag]
  conditions: [robot_autonomy_low, robot_autonomy_mid, robot_autonomy_high]
  combo_conditions: [charge_high_robot_low, robot_low_trace_low]
choice_flags:
  recommended: [vac0_exclusion_list, vac0_patch_classifier]
  hold: [vac0_disabled]
  risky: [vac0_unrestricted]
  unlocks: [vac0_first_question, vac0_no_person_name]
dialogue_refs:
  first_meet: [first_meet]
  states: [robot_autonomy_low, robot_autonomy_mid, robot_autonomy_high]
  choices: [vac0_exclusion_list, vac0_disabled, vac0_unrestricted]
  phases: [boss_before, boss_after, p1_revisit]
  names: [vac0_no_person_name]
  combos: [charge_high_robot_low, robot_low_trace_low]
name_reveal_condition:
  mode: no_person_name
  forbidden_name_assignment: true
  replacement_identity: 모델명 유지
related_npcs: [PATCH, NAME-PAINTER, MAIL-LOOP, ROOM-12, FRAME-LEFT, WELCOME-DESK]
hub_links: [PATCH, 세븐]
boss_phase_links:
  t0: vac0_seen
  t1: vac0_cleaned_evidence
  t2: vac0_frame_evidence_hold
  t3: vac0_first_question
p1_branch_links:
  opens: [p1_empty_house_internal]
  requires: [key_ring_cross_checked]
forbidden_directions:
  - 귀여운 청소 로봇으로 마스코트화하지 않는다.
  - 성장을 청소 중단으로만 처리하지 않는다.
```

### 3.7 DRAIN-MARK

```yaml
npc_id: drain_mark
code_name: DRAIN-MARK
display_role_name: 배수로 표식꾼
unlocked_name: 문채율
name_fragment: 채율
npc_type: human_resident
region: R01
first_location: 배수로 침묵 주머니
exposure_phase: [post_boss, p1_revisit]
first_appearance_condition:
  - drain_mark_hint_seen
  - p1_silent_route_open
state_reactions:
  primary: [passage_tag, extraction_stability]
  secondary: [campaign_density, human_stability]
  conditions: [passage_tag_low, extraction_stability_low, extraction_stability_mid]
  combo_conditions: [extraction_low_silent_route, passage_low_supply_high]
choice_flags:
  recommended: [drain_mark_partial_extraction_point, drain_mark_dual_marks]
  hold: [drain_mark_hidden]
  risky: [drain_mark_full_share]
  unlocks: [drain_mark_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [extraction_stability_low, extraction_stability_mid, extraction_stability_high]
  choices: [drain_mark_partial_extraction_point, drain_mark_hidden, drain_mark_full_share]
  phases: [boss_before, boss_after, p1_revisit]
  names: [drain_mark_name_fragment]
  combos: [extraction_low_silent_route, passage_low_supply_high]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: drain_mark_name_fragment
  required_flags: [drain_mark_partial_extraction_point]
  required_state: extraction_stability_mid_or_high
related_npcs: [SIGN-BACK, KEY-RING, PORCH-LINE, OPEN-HOST, VAC-0]
hub_links: [세븐]
boss_phase_links:
  t0: drain_mark_hint_seen
  t1: drain_mark_route_teased
  t2: drain_mark_p1_unlock_hint
  t3: drain_mark_partial_extraction_point
p1_branch_links:
  opens: [p1_silent_route, sign_back_fake_return_route]
  requires: [post_boss_frame_left_seen]
forbidden_directions:
  - 멋있는 은신자로 만들지 않는다.
  - 보급소 이주가 최종 성장처럼 보이면 안 된다.
```

### 3.8 SIGN-BACK

```yaml
npc_id: sign_back
code_name: SIGN-BACK
display_role_name: 가짜 귀환로 감시자
unlocked_name: 권태오
name_fragment: 태오
npc_type: human_resident
region: R01
first_location: 가짜 귀환로 / 끊긴 광고 산책로
exposure_phase: [post_boss, p1_revisit]
first_appearance_condition:
  - sign_back_hint_seen
  - p1_fake_return_route_open
state_reactions:
  primary: [signal_tag, extraction_stability]
  secondary: [human_stability, campaign_density]
  conditions: [signal_tag_low, signal_tag_mid, signal_tag_high]
  combo_conditions: [extraction_low_silent_route, signal_high_campaign_high]
choice_flags:
  recommended: [sign_back_fake_beacon_blocked, sign_back_signal_criteria]
  hold: [sign_back_sign_rotated]
  risky: [sign_back_sign_destroyed]
  unlocks: [sign_back_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [signal_tag_low, signal_tag_mid, signal_tag_high]
  choices: [sign_back_fake_beacon_blocked, sign_back_sign_rotated, sign_back_sign_destroyed]
  phases: [boss_before, boss_after, p1_revisit]
  names: [sign_back_name_fragment]
  combos: [extraction_low_silent_route, signal_high_campaign_high]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: sign_back_name_fragment
  required_flags: [sign_back_fake_beacon_blocked]
  required_state: extraction_stability_mid_or_high
related_npcs: [DRAIN-MARK, OPEN-HOST, MAIL-LOOP, KEY-RING, WELCOME-DESK]
hub_links: [세븐]
boss_phase_links:
  t0: sign_back_hint_seen
  t1: sign_back_fake_return_teased
  t2: sign_back_p1_unlock_hint
  t3: sign_back_fake_beacon_blocked
p1_branch_links:
  opens: [key_ring_old_office]
  requires: [drain_mark_partial_extraction_point]
forbidden_directions:
  - 표지판 수리공으로 축소하지 않는다.
  - OPEN-HOST 비난용 피해자로만 쓰지 않는다.
```

### 3.9 KEY-RING

```yaml
npc_id: key_ring
code_name: KEY-RING
display_role_name: 물리 열쇠 보관자
unlocked_name: 노기준
name_fragment: 기준
npc_type: human_resident
region: R01
first_location: 낡은 주택 관리실 / 폐편의점 뒤
exposure_phase: [post_boss, p1_revisit]
first_appearance_condition:
  - key_ring_hint_seen
  - p1_old_office_access
state_reactions:
  primary: [passage_tag, residence_tag, trace_preservation]
  secondary: [campaign_density, ration_tag]
  conditions: [passage_tag_low, passage_tag_mid, passage_tag_high]
  combo_conditions: [passage_low_supply_high]
choice_flags:
  recommended: [key_ring_cross_checked, key_ring_pending_board]
  hold: [key_ring_opened_by_tag]
  risky: [key_ring_opened_by_key]
  unlocks: [key_ring_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [passage_tag_low, passage_tag_mid, passage_tag_high]
  choices: [key_ring_pending_board, key_ring_cross_checked, key_ring_opened_by_key]
  phases: [boss_before, boss_after, p1_revisit]
  names: [key_ring_name_fragment]
  combos: [passage_low_supply_high]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: key_ring_name_fragment
  required_flags: [key_ring_pending_board]
  hub_required: [복희]
related_npcs: [SIGN-BACK, MAIL-LOOP, NAME-PAINTER, ROOM-12, VAC-0, FRAME-LEFT]
hub_links: [복희, 세븐]
boss_phase_links:
  t0: key_ring_hint_seen
  t1: key_ring_preboss_door_risk
  t2: key_ring_post_boss_crosscheck_needed
  t3: key_ring_pending_board
p1_branch_links:
  opens: [vac0_empty_house_internal]
  requires: [sign_back_fake_beacon_blocked]
forbidden_directions:
  - 열쇠 상인이나 보상방 열기 NPC로 축소하지 않는다.
  - 문이 열리면 들어가도 된다는 구조로 만들지 않는다.
```

### 3.10 DINING-4

```yaml
npc_id: dining_4
code_name: DINING-4
display_role_name: 네 번째 식탁 자리
unlocked_name: 류가람
name_fragment: 가람
npc_type: human_resident
region: R01
first_location: 모델하우스 접근로 / 식탁 세트
exposure_phase: [pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - dining4_hint_seen
  - dining4_table_seen
state_reactions:
  primary: [residence_tag, ration_tag, campaign_density]
  secondary: [trace_preservation, human_stability]
  conditions: [residence_tag_low, residence_tag_mid, residence_tag_high]
  combo_conditions: [residence_high_ration_high]
choice_flags:
  recommended: [dining4_frame_hold, dining4_fourth_seat_hold]
  hold: [dining4_left_seated]
  risky: [dining4_forced_stand]
  unlocks: [dining4_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [residence_tag_low, residence_tag_mid, residence_tag_high]
  choices: [dining4_fourth_seat_hold, dining4_left_seated, dining4_forced_stand]
  phases: [boss_before, boss_after, p1_revisit]
  names: [dining4_name_fragment]
  combos: [residence_high_ration_high]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: dining4_name_fragment
  required_flags: [dining4_fourth_seat_hold]
  hub_required: [복희]
related_npcs: [ROOM-12, FRAME-LEFT, WELCOME-DESK, NAME-PAINTER, VAC-0]
hub_links: [복희, 미나]
boss_phase_links:
  t0: dining4_hint_seen
  t1: dining4_fourth_seat_hold
  t2: dining4_frame_hold
  t3: dining4_revisit_chair_shifted
p1_branch_links:
  opens: []
  affects: [frame_left_empty_slot_hold, room12_revisit_ready]
forbidden_directions:
  - ROOM-12 반복 캐릭터로 만들지 않는다.
  - 보스 전 설명 NPC로만 쓰지 않는다.
```

### 3.11 WELCOME-DESK

```yaml
npc_id: welcome_desk
code_name: WELCOME-DESK
display_role_name: 상담 데스크 잔류자
unlocked_name: 정해원
name_fragment: 해원
npc_type: human_resident
region: R01
first_location: 오픈하우스 상담 데스크
exposure_phase: [pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - welcome_desk_ticket_hint
  - p1_consultation_desk_open
state_reactions:
  primary: [campaign_density, human_stability, residence_tag]
  secondary: [trace_preservation, signal_tag]
  conditions: [human_stability_low, human_stability_mid, human_stability_high]
  combo_conditions: [human_low_queue_broken]
choice_flags:
  recommended: [welcome_desk_question_hold, welcome_desk_ticket_evidence]
  hold: [welcome_desk_c_window]
  risky: [welcome_desk_fast_track]
  unlocks: [welcome_desk_name_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [human_stability_low, human_stability_mid, human_stability_high]
  choices: [welcome_desk_question_hold, welcome_desk_c_window, welcome_desk_fast_track]
  phases: [boss_before, boss_after, p1_revisit]
  names: [welcome_desk_name_fragment]
  combos: [human_low_queue_broken]
name_reveal_condition:
  mode: fragment_then_unlocked
  fragment_flag: welcome_desk_name_fragment
  required_flags: [welcome_desk_question_hold]
related_npcs: [OPEN-HOST, PORCH-LINE, ROOM-12, DINING-4, FRAME-LEFT, KEY-RING]
hub_links: [세븐, 복희]
boss_phase_links:
  t0: welcome_desk_ticket_hint
  t1: welcome_desk_question_hold
  t2: welcome_desk_ticket_evidence
  t3: welcome_desk_revisit_question_hold
p1_branch_links:
  opens: [frame_left_family_photo_frame]
  requires: [vac0_exclusion_list, key_ring_pending_board]
forbidden_directions:
  - OPEN-HOST 복제로 만들지 않는다.
  - 덜 위험한 창구 추천이 최종 성장처럼 보이면 안 된다.
```

### 3.12 FRAME-LEFT

```yaml
npc_id: frame_left
code_name: FRAME-LEFT
display_role_name: 가족사진 속 남은 사람
unlocked_name: 채아린
name_fragment: 아린
npc_type: profile_residue
region: R01
first_location: 모델하우스 결절 / 가족사진 프레임
exposure_phase: [pre_boss, post_boss, p1_revisit]
first_appearance_condition:
  - frame_left_hint_seen
  - post_boss_frame_left_seen
state_reactions:
  primary: [trace_preservation, signal_tag, campaign_density]
  secondary: [residence_tag, human_stability]
  conditions: [trace_preservation_low, trace_preservation_mid, trace_preservation_high]
  combo_conditions: [campaign_high_trace_high, signal_high_campaign_high]
choice_flags:
  recommended: [frame_left_name_to_bokhee, frame_left_empty_slot_hold]
  hold: [frame_left_full_extract]
  risky: [frame_left_frame_destroyed]
  unlocks: [frame_left_arin_fragment]
dialogue_refs:
  first_meet: [first_meet]
  states: [trace_preservation_low, trace_preservation_mid, trace_preservation_high]
  choices: [frame_left_name_to_bokhee, frame_left_empty_slot_hold, frame_left_frame_destroyed]
  phases: [boss_before, boss_after, p1_revisit]
  names: [frame_left_arin_fragment]
  combos: [campaign_high_trace_high, signal_high_campaign_high]
name_reveal_condition:
  mode: fragment_first
  fragment_flag: frame_left_arin_fragment
  required_flags: [frame_left_name_to_bokhee, frame_left_empty_slot_hold]
  unlocked_name_late_only: true
related_npcs: [DINING-4, ROOM-12, WELCOME-DESK, MAIL-LOOP, NAME-PAINTER, KEY-RING]
hub_links: [복희, 세븐]
boss_phase_links:
  t0: frame_left_hint_seen
  t1: frame_left_preboss_pressure
  t2: frame_left_post_boss_contact
  t3: frame_left_revisit_stable_fragment
p1_branch_links:
  opens: [p1_family_photo_frame_resolution]
  requires: [welcome_desk_question_hold]
forbidden_directions:
  - 사진 속 유령처럼 말하게 하지 않는다.
  - 사진에서 꺼내면 구원되는 구조로 만들지 않는다.
```

---

## 4. dialogue_refs 변환 규칙

### 4.1 참조 ID 규칙

권장 참조 ID:

```text
{npc_id}.{condition_id}.{usage}
```

예:

| 원본 | 참조 ID |
|---|---|
| ROOM-12 / `room12_bypass_ration` / `choice_success` | `room_12.room12_bypass_ration.choice_success` |
| MAIL-LOOP / `mail_loop_no_person_name` / `name_blocked` | `mail_loop.mail_loop_no_person_name.name_blocked` |
| FRAME-LEFT / `frame_left_arin_fragment` / `name_unlock` | `frame_left.frame_left_arin_fragment.name_unlock` |

### 4.2 출력 우선순위

| 우선순위 | usage | 설명 |
|---:|---|---|
| 100 | `combo_reaction` | 조합 위험이 켜졌을 때 최우선 |
| 90 | `choice_fail` | 강제/파괴/빠른 해결 후폭풍 |
| 80 | `choice_success`, `choice_hold` | 선택 직후 |
| 70 | `boss_before`, `boss_after`, `p1_revisit` | 시점 반응 |
| 60 | `state_low`, `state_mid`, `state_high` | 상태값 반응 |
| 50 | `name_unlock`, `name_blocked` | 이름 조각/이름 부여 차단 |
| 40 | `first_meet` | 기본 첫 대면 |

### 4.3 반복 출력 제한

```yaml
cooldown_group:
  by_npc: true
  by_usage: true
  suppress_same_condition_until_phase_change: true
```

조건:

```text
같은 NPC가 같은 condition_id를 반복 출력하지 않는다.
보스 전후, P1 재방문처럼 phase가 바뀌면 다시 출력 가능하다.
name_unlock/name_blocked는 1회성으로 처리한다.
```

---

## 5. 구현 전환 체크리스트

1. `npc_id`는 저장/이벤트/대사 참조에서 같은 문자열을 쓴다.
2. `code_name`은 초기 UI 노출값이다.
3. `unlocked_name`은 첫 노출값이 아니다.
4. `name_fragment`는 복희/세븐/흔적 보존 조건에서 먼저 열린다.
5. `npc_type`으로 사람, 장치, 시스템 잔향, 프로필 잔향을 분리한다.
6. `choice_flags.recommended`만 정답이 아니다. 각 플래그는 대가와 위험을 가진다.
7. `dialogue_refs`는 대사 텍스트를 중복 저장하지 않고 대사 은행 조건을 참조한다.
8. `forbidden_directions`는 구현 간소화 중 캐릭터가 무너지는 것을 막는 잠금 필드다.
9. `boss_phase_links`와 `p1_branch_links`는 이벤트 완료가 아니라 상태 변화와 후속 반응을 연결한다.
10. MAIL-LOOP/VAC-0에는 사람 이름을 넣지 않는다.
11. FRAME-LEFT는 `name_fragment`가 `unlocked_name`보다 우선이다.

---

## 6. 다음 작업

바로 다음 작업:

```text
Vertical Slice 구현 우선순위 재정리.
```

목표:

```text
R01 NPC 12명 전체를 한 번에 구현하려 하지 않는다.
OPEN-HOST, ROOM-12, MAIL-LOOP, PORCH-LINE을 필수 축으로 두고,
NAME-PAINTER, DINING-4, VAC-0를 있으면 좋은 축으로 둔다.
P1 NPC는 보스 후 후폭풍 루트로 별도 우선순위를 잡는다.

이 스키마 문서를 기준으로
첫 구현에 필요한 npc_id, 선택 플래그, 상태값, 대사 참조, 이름 해금 조건을 추린다.
```

산출물 후보:

```text
story/03_regions/r01_vertical_slice_npc_implementation_priority_v0_1.md
```

---

## 7. 최종 요약

R01 NPC 데이터 스키마는 문학 설정을 버리는 문서가 아니다.

다만 이제부터 구현자가 필요한 것은 아래 질문에 대한 빠른 답이다.

```text
이 NPC의 ID는 무엇인가?
처음에는 무엇으로 보이는가?
어떤 상태값에 반응하는가?
어떤 선택 플래그를 낸다?
그 플래그는 어떤 대사와 이름 조건을 연다?
보스 전후와 P1 재방문에서 무엇이 달라지는가?
절대 하면 안 되는 구현 축약은 무엇인가?
```

이 문서는 그 질문들의 공통 답안지다.
다음 단계는 이 답안지에서 Vertical Slice에 실제로 넣을 NPC와 플래그를 고르는 것이다.
