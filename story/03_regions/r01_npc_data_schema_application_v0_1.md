# R01 NPC 데이터 스키마 적용표 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
R01 NPC 데이터 스키마 초안을 Vertical Slice 구현 목록에 적용한 구현 전달용 표.
새 NPC 추가 아님.
실제 엔진 데이터 파일 아님.

기준 문서:
story/03_regions/r01_npc_data_schema_draft_v0_1.md
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md
story/03_regions/r01_npc_dialogue_bank_v0_1.md
story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md
story/03_regions/r01_npc_name_registry_v1_0.md
story/03_regions/r01_npc_name_reveal_matrix_v0_1.md

다음 작업 포인터:
E01 R02/R03/R04/R08 보조 NPC 최소안
```

---

## 0. 판정 요약

R01 NPC 12명은 데이터 스키마 적용 가능 상태다.

이번 문서에서 확정하는 것:

```text
1. 12명 전원의 npc_id를 잠근다.
2. npc_type과 Vertical Slice 노출 묶음을 연결한다.
3. 직접 구현할 플래그와 P1 보류 플래그를 분리한다.
4. 대사 참조는 r01_npc_dialogue_bank_v0_1.md의 조건 ID를 참조한다.
5. 이름/본명 노출은 r01_npc_name_registry_v1_0.md와 r01_npc_name_reveal_matrix_v0_1.md를 따른다.
```

핵심 결론:

```text
R01 데이터는 12명 전원을 구현 데이터로 등록하되,
Vertical Slice에서 실제 직접 등장시키는 NPC는 제한한다.

데이터 등록:
12명 전원

직접 대면 구현:
OPEN-HOST, ROOM-12, PORCH-LINE, DINING-4

오브젝트/잔향 구현:
MAIL-LOOP, NAME-PAINTER, VAC-0, FRAME-LEFT

P1 보류:
DRAIN-MARK, SIGN-BACK, KEY-RING, WELCOME-DESK
```

---

## 1. ID / 타입 / 구현 묶음 잠금

| 번호 | npc_id | 코드명 | npc_type | 구현 묶음 | VS 우선순위 | 이름 정책 |
|---:|---|---|---|---|---|---|
| 1 | `open_host` | OPEN-HOST | `human_internal` | 직접 대면 | 필수 | 조각 후 본명 |
| 2 | `room_12` | ROOM-12 | `human_resident` | 직접 대면 | 필수 | 조각 후 본명 |
| 3 | `porch_line` | PORCH-LINE | `human_resident` | 직접 대면 | 필수 | 조각 후 본명 |
| 4 | `name_painter` | NAME-PAINTER | `human_resident` | 오브젝트 흔적 | 축소 | 조각 후 본명 |
| 5 | `mail_loop` | MAIL-LOOP | `system_residue` | 음성 잔향 | 필수 | 사람 이름 없음 |
| 6 | `vac_0` | VAC-0 | `robot_device` | 오브젝트 흔적 | 축소 | 사람 이름 없음 |
| 7 | `drain_mark` | DRAIN-MARK | `human_resident` | P1 보류 | 예고 | P1에서 조각 |
| 8 | `sign_back` | SIGN-BACK | `human_resident` | P1 보류 | 예고 | P1에서 조각 |
| 9 | `key_ring` | KEY-RING | `human_resident` | P1 보류 | 예고 | P1에서 조각 |
| 10 | `dining_4` | DINING-4 | `human_resident` | 직접 대면 | 필수 | 조각 후 본명 |
| 11 | `welcome_desk` | WELCOME-DESK | `human_resident` | P1 보류 | 예고 | P1에서 조각 |
| 12 | `frame_left` | FRAME-LEFT | `profile_residue` | 보스 후 잔향 | 필수 | 이름 조각 우선 |

---

## 2. Vertical Slice 데이터 적용 요약

| npc_id | 첫 노출 | 필요한 구현 | 최소 대사 참조 | 핵심 플래그 | P1 처리 |
|---|---|---|---|---|---|
| `open_host` | 모델하우스 접근 전 | 간단 초상/대화, 안내선, 경로 검증 | first_meet, boss_before, boss_after | `open_host_route_verified` | 전환 후보만 보류 |
| `room_12` | 12번 방/식탁 좌석 | 간단 초상/대화, 자리 보류 선택 | first_meet, choice_success, choice_fail | `room12_bypass_ration` | 재방문 대사 |
| `porch_line` | 침묵 가장자리 현관 줄 | 간단 초상/대화, 순번표 | first_meet, choice_success, choice_hold | `porch_line_flexible_ticket` | ROOM-12와 재방문 |
| `name_painter` | 문패 골목 | 덧칠 문패, 번진 이름, 보류 표시 | object_reaction | `name_painter_seen` | 본격 대면 보류 |
| `mail_loop` | 웃는 우편함 | 우편함 오브젝트, 반복 음성, 주소 로그 | first_call, call_hold, call_active | `mail_loop_call_hold` | P1 주소 검증 |
| `vac_0` | 빈 집 내부 | 먼지통, 청소 흔적, 제외 목록 후보 | object_reaction | `vac0_exclusion_list` | P1 재방문 가능 |
| `drain_mark` | 배수로 입구 | 젖은 표식, 약한 비콘음 | none | `drain_mark_hint_seen` | P1 개방 |
| `sign_back` | 가짜 귀환로 | 돌아간 표지판, 가짜 귀환 안내문 | none | `sign_back_hint_seen` | P1 개방 |
| `key_ring` | 낡은 관리실 | 잠긴 문, 보조키 홈, 열쇠 소리 | none | `key_ring_hint_seen` | P1 개방 |
| `dining_4` | 모델하우스 식탁 | 직접 장면, 네 번째 의자, 자리 보류 | first_meet, boss_before, boss_after | `dining4_fourth_seat_hold` | FRAME-LEFT 안정 조건 |
| `welcome_desk` | 상담 데스크 | 상담표, 보류 도장, 순번표 흔적 | object_reaction | `welcome_desk_ticket_hint` | P1 개방 |
| `frame_left` | 보스 후 가족사진 프레임 | 프레임 잔향, 이름 조각, 분석 연결 | first_meet, boss_after, name_unlock | `frame_left_arin_fragment` | 후반 보존 분기 |

---

## 3. 상태값 적용표

| npc_id | primary state | secondary state | Vertical Slice에서 실제 사용 | P1 또는 후속 |
|---|---|---|---|---|
| `open_host` | `campaign_density`, `passage_tag`, `residence_tag` | `trace_preservation`, `human_stability` | `campaign_density`, `passage_tag` | `residence_tag` |
| `room_12` | `human_stability`, `ration_tag`, `residence_tag` | `supply_pressure`, `trace_preservation` | `human_stability`, `ration_tag` | `residence_tag` |
| `porch_line` | `human_stability`, `campaign_density` | `trace_preservation`, `supply_pressure` | `human_stability`, `campaign_density` | `trace_preservation` |
| `name_painter` | `trace_preservation`, `campaign_density` | `residence_tag`, `human_stability` | `trace_preservation` | `campaign_density` |
| `mail_loop` | `signal_tag`, `campaign_density` | `trace_preservation`, `residence_tag` | `signal_tag`, `campaign_density` | `trace_preservation` |
| `vac_0` | `robot_autonomy`, `charge_tag`, `trace_preservation` | `campaign_density` | `trace_preservation` | `robot_autonomy`, `charge_tag` |
| `drain_mark` | `passage_tag`, `campaign_density`, `extraction_stability` | `human_stability` | none | all |
| `sign_back` | `signal_tag`, `campaign_density`, `extraction_stability` | `human_stability` | none | all |
| `key_ring` | `passage_tag`, `residence_tag`, `trace_preservation` | `campaign_density` | none | all |
| `dining_4` | `residence_tag`, `ration_tag`, `campaign_density` | `trace_preservation` | `residence_tag`, `campaign_density` | `ration_tag` |
| `welcome_desk` | `campaign_density`, `human_stability`, `residence_tag` | `trace_preservation` | `campaign_density` hint only | all |
| `frame_left` | `trace_preservation`, `signal_tag`, `campaign_density` | `residence_tag`, `human_stability` | `trace_preservation`, `signal_tag` | `residence_tag` |

---

## 4. 최소 데이터 seed block

아래 블록은 엔진 파일이 아니라 적용표다.
필드는 `r01_npc_data_schema_draft_v0_1.md`의 공통 스키마를 따른다.

```yaml
- npc_id: open_host
  code_name: OPEN-HOST
  display_role_name: 전직 오픈하우스 안내인
  npc_type: human_internal
  implementation_group: direct_meet
  vs_priority: required
  first_location: r01_model_house_approach
  exposure_phase: [p0_trace, pre_boss, post_boss]
  required_assets: [portrait_simple, route_marker, dialogue_panel]
  state_keys: [campaign_density, passage_tag, trace_preservation]
  choice_flags: [open_host_trace_seen, open_host_voice_warned, open_host_route_verified]
  dialogue_refs_min: [first_meet, open_host_route_verified, boss_before, boss_after]
  name_policy: fragment_then_unlocked
  boss_link: boss_entry_route_verification
  p1_link: playable_conversion_candidate_only
  forbidden: [tutorial_guide, safe_guide, immediate_playable]

- npc_id: room_12
  code_name: ROOM-12
  display_role_name: 12번 방의 가족대표
  npc_type: human_resident
  implementation_group: direct_meet
  vs_priority: required
  first_location: r01_room_12_table_seat
  exposure_phase: [p0_first_30, pre_boss, post_boss, p1_revisit]
  required_assets: [portrait_simple, chair_marker, ration_note]
  state_keys: [human_stability, ration_tag, residence_tag, supply_pressure]
  choice_flags: [room12_bypass_ration, room12_left_in_place, room12_forced_removed]
  dialogue_refs_min: [first_meet, room12_bypass_ration, room12_forced_removed, boss_after]
  name_policy: fragment_then_unlocked
  boss_link: ration_family_role_pressure
  p1_link: porch_line_room12_revisit
  forbidden: [simple_rescue_target, tragic_victim_only, correct_answer_choice]

- npc_id: porch_line
  code_name: PORCH-LINE
  display_role_name: 현관 줄 관리자
  npc_type: human_resident
  implementation_group: direct_meet
  vs_priority: required
  first_location: r01_silence_edge_queue
  exposure_phase: [p0_first_30, pre_boss, post_boss, p1_revisit]
  required_assets: [portrait_simple, queue_ticket, porch_line_marker]
  state_keys: [human_stability, campaign_density, trace_preservation]
  choice_flags: [porch_line_flexible_ticket, porch_line_exact_queue, porch_line_dispersed]
  dialogue_refs_min: [first_meet, porch_line_flexible_ticket, porch_line_exact_queue, boss_after]
  name_policy: fragment_then_unlocked
  boss_link: pre_boss_queue_pressure
  p1_link: room12_revisit_queue_shift
  forbidden: [gatekeeper, queue_tutorial, comic_line_manager]

- npc_id: name_painter
  code_name: NAME-PAINTER
  display_role_name: 문패 덧칠꾼
  npc_type: human_resident
  implementation_group: object_trace
  vs_priority: reduced
  first_location: r01_nameplate_alley
  exposure_phase: [p0_trace, post_boss, p1_revisit]
  required_assets: [painted_nameplate, smeared_name, hold_mark]
  state_keys: [trace_preservation, campaign_density]
  choice_flags: [name_painter_seen, name_painter_hold_marks]
  dialogue_refs_min: [object_reaction]
  name_policy: fragment_later
  boss_link: name_slot_pressure_hint
  p1_link: names_to_bokhee_branch
  forbidden: [direct_meet_in_vs, name_collect_quest, sentimental_graffiti]

- npc_id: mail_loop
  code_name: MAIL-LOOP
  display_role_name: 우편함 목소리 잔향
  npc_type: system_residue
  implementation_group: voice_residue
  vs_priority: required
  first_location: r01_smiling_mailbox
  exposure_phase: [p0_trace, p0_first_30, pre_boss, post_boss]
  required_assets: [mailbox_object, address_log_ui, voice_line]
  state_keys: [signal_tag, campaign_density, trace_preservation]
  choice_flags: [mail_loop_seen, mail_loop_call_hold, mail_loop_family_call_active]
  dialogue_refs_min: [mail_loop_first_call, mail_loop_call_hold, mail_loop_family_call_active, boss_after]
  name_policy: no_person_name
  boss_link: address_family_assignment_pressure
  p1_link: sign_back_key_ring_address_verification
  forbidden: [human_name, cute_mailbox, hint_machine_only]

- npc_id: vac_0
  code_name: VAC-0
  display_role_name: 작은 홈케어 청소기
  npc_type: robot_device
  implementation_group: object_trace
  vs_priority: reduced
  first_location: r01_empty_house_interior
  exposure_phase: [p0_trace, post_boss, p1_revisit]
  required_assets: [dustbin_object, cleaned_floor_marks, exclusion_sticker]
  state_keys: [trace_preservation, robot_autonomy, charge_tag]
  choice_flags: [vac0_seen, vac0_exclusion_list]
  dialogue_refs_min: [object_reaction]
  name_policy: no_person_name
  boss_link: trace_deletion_warning
  p1_link: welcome_desk_frame_left_trace_preservation
  forbidden: [cute_pet_robot, combat_drone, patch_sub_robot]

- npc_id: drain_mark
  code_name: DRAIN-MARK
  display_role_name: 배수로 표식꾼
  npc_type: human_resident
  implementation_group: p1_hold
  vs_priority: hint_only
  first_location: r01_drain_silence_pocket_entrance
  exposure_phase: [p0_trace, p1_revisit]
  required_assets: [wet_metal_mark, weak_beacon_noise, blocked_drain_path]
  state_keys: [passage_tag, campaign_density, extraction_stability]
  choice_flags: [drain_mark_hint_seen]
  dialogue_refs_min: []
  name_policy: p1_fragment_later
  boss_link: none
  p1_link: drain_route_open
  forbidden: [p0_direct_meet, cool_scout, safe_freedom_route]

- npc_id: sign_back
  code_name: SIGN-BACK
  display_role_name: 가짜 귀환로 감시자
  npc_type: human_resident
  implementation_group: p1_hold
  vs_priority: hint_only
  first_location: r01_fake_return_path_sign
  exposure_phase: [p0_trace, p1_revisit]
  required_assets: [rotated_sign, fake_return_notice, beacon_noise_hint]
  state_keys: [signal_tag, campaign_density, extraction_stability]
  choice_flags: [sign_back_hint_seen]
  dialogue_refs_min: []
  name_policy: p1_fragment_later
  boss_link: fake_return_warning
  p1_link: fake_beacon_block_branch
  forbidden: [p0_direct_meet, sign_repair_tutorial, open_host_blame_npc]

- npc_id: key_ring
  code_name: KEY-RING
  display_role_name: 물리 열쇠 보관자
  npc_type: human_resident
  implementation_group: p1_hold
  vs_priority: hint_only
  first_location: r01_old_management_office
  exposure_phase: [p0_trace, p1_revisit]
  required_assets: [locked_door, backup_key_slot, key_jingle_audio]
  state_keys: [passage_tag, residence_tag, trace_preservation]
  choice_flags: [key_ring_hint_seen]
  dialogue_refs_min: []
  name_policy: p1_fragment_later
  boss_link: door_permission_warning
  p1_link: pending_key_board_branch
  forbidden: [key_shop, reward_room_npc, old_world_praise]

- npc_id: dining_4
  code_name: DINING-4
  display_role_name: 네 번째 식탁 자리
  npc_type: human_resident
  implementation_group: direct_meet
  vs_priority: required
  first_location: r01_model_house_dining_set
  exposure_phase: [pre_boss, post_boss]
  required_assets: [portrait_limited, fourth_chair, family_photo_frame_hint]
  state_keys: [residence_tag, ration_tag, campaign_density, trace_preservation]
  choice_flags: [dining4_hint_seen, dining4_fourth_seat_hold]
  dialogue_refs_min: [first_meet, dining4_fourth_seat_hold, boss_before, boss_after]
  name_policy: fragment_then_unlocked
  boss_link: fourth_family_slot_pressure
  p1_link: frame_left_empty_slot_stability
  forbidden: [room12_repeat, mannequin_horror, simple_rescue_target]

- npc_id: welcome_desk
  code_name: WELCOME-DESK
  display_role_name: 상담 데스크 잔류자
  npc_type: human_resident
  implementation_group: p1_hold
  vs_priority: hint_only
  first_location: r01_open_house_consultation_desk
  exposure_phase: [p0_trace, pre_boss, p1_revisit]
  required_assets: [torn_ticket, hold_stamp, consultation_form]
  state_keys: [campaign_density, human_stability, residence_tag, trace_preservation]
  choice_flags: [welcome_desk_ticket_hint]
  dialogue_refs_min: [object_reaction]
  name_policy: p1_fragment_later
  boss_link: consultation_question_pressure
  p1_link: question_hold_branch
  forbidden: [open_host_clone, friendly_receptionist, tutorial_clerk]

- npc_id: frame_left
  code_name: FRAME-LEFT
  display_role_name: 가족사진 속 남은 사람
  npc_type: profile_residue
  implementation_group: post_boss_residue
  vs_priority: required
  first_location: r01_family_photo_frame
  exposure_phase: [post_boss, p1_revisit]
  required_assets: [family_photo_frame, blurred_face, name_fragment_note]
  state_keys: [trace_preservation, signal_tag, campaign_density]
  choice_flags: [frame_left_hint_seen, frame_left_arin_fragment]
  dialogue_refs_min: [first_meet, boss_after, frame_left_arin_fragment]
  name_policy: fragment_first
  boss_link: post_boss_memory_extract
  p1_link: family_photo_empty_slot_hold
  forbidden: [photo_ghost, rescue_from_photo, sentimental_flashback]
```

---

## 5. Vertical Slice 필수 플래그 세트

Vertical Slice에서 실제 저장해야 하는 최소 플래그는 아래로 제한한다.

### 5.1 직접 대면 필수

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

dining4_hint_seen
dining4_fourth_seat_hold
```

### 5.2 잔향/오브젝트 필수

```text
mail_loop_seen
mail_loop_call_hold
mail_loop_family_call_active

name_painter_seen
name_painter_hold_marks

vac0_seen
vac0_exclusion_list

frame_left_hint_seen
frame_left_arin_fragment
```

### 5.3 P1 보류 예고

```text
drain_mark_hint_seen
sign_back_hint_seen
key_ring_hint_seen
welcome_desk_ticket_hint
```

---

## 6. 이름 노출 적용

| npc_id | 초기 노출 | 중간 노출 | 본명/원본 이름 | VS 본명 노출 |
|---|---|---|---|---|
| `open_host` | OPEN-HOST | 이겸 | 서이겸 | 금지 |
| `room_12` | ROOM-12 | 연우 | 강연우 | 금지 |
| `porch_line` | PORCH-LINE | 지호 | 백지호 | 금지 |
| `name_painter` | NAME-PAINTER | 하온 | 임하온 | 금지 |
| `mail_loop` | MAIL-LOOP | 없음 | 없음 | 해당 없음 |
| `vac_0` | VAC-0 | 없음 | 없음 | 해당 없음 |
| `drain_mark` | DRAIN-MARK | 채율 | 문채율 | 금지 |
| `sign_back` | SIGN-BACK | 태오 | 권태오 | 금지 |
| `key_ring` | KEY-RING | 기준 | 노기준 | 금지 |
| `dining_4` | DINING-4 | 가람 | 류가람 | 금지 |
| `welcome_desk` | WELCOME-DESK | 해원 | 정해원 | 금지 |
| `frame_left` | FRAME-LEFT | 아린 | 채아린 | 이름 조각만 허용 |

Vertical Slice 원칙:

```text
본명은 거의 열지 않는다.
FRAME-LEFT만 이름 조각 "아린"을 보스 후 흔적으로 허용한다.
나머지는 P1 또는 보급소 복희/세븐 연결 이후에 해금한다.
```

---

## 7. 출력 우선순위 적용

대사 출력 우선순위는 스키마 초안과 동일하게 유지한다.

```text
1. combo_reaction
2. choice_fail
3. choice_success / choice_hold
4. boss_before / boss_after / p1_revisit
5. state_low / state_mid / state_high
6. name_unlock / name_blocked
7. first_meet
```

Vertical Slice에서는 `p1_revisit` 대사를 실제 출력하지 않는다.
단, 관련 플래그는 저장할 수 있다.

```text
예:
drain_mark_hint_seen은 저장한다.
DRAIN-MARK 직접 대사는 출력하지 않는다.
```

---

## 8. 구현 제외 잠금

이번 Vertical Slice에서 만들지 않는다.

```text
1. DRAIN-MARK 직접 대면.
2. SIGN-BACK 직접 대면.
3. KEY-RING 직접 대면.
4. WELCOME-DESK 직접 대면.
5. NAME-PAINTER 정식 대화.
6. VAC-0 동행 기능.
7. MAIL-LOOP 인간 이름 해금.
8. FRAME-LEFT 사진 밖 구출.
9. OPEN-HOST 플레이어블 전환.
10. R01 NPC 12명 전원 대면 컷신.
```

---

## 9. 다음 작업

R01 NPC 데이터 스키마 적용은 여기서 완료로 본다.

완료된 다음 NPC 트랙 작업:

```text
E01 R02/R03/R04/R08 보조 NPC 최소안
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
```

다음 NPC 트랙 작업:

```text
E02 첫 외부 슬라이스 NPC 예산
```

목표:

```text
플레이어블 4~7번의 출신 지역과 충돌하지 않도록
각 지역에 필요한 보조 NPC를 2~4명 이하로만 후보화한다.

R02:
퇴원 보류 환자 / 강하람과 충돌하지 않는 의료·보험 보조 NPC

R03:
반송 수취인 / 한이루와 충돌하지 않는 물류·반품 보조 NPC

R04:
폐충전소 계량자 / 차유건과 PATCH를 침범하지 않는 충전·정품 보조 NPC

R08:
침묵권 피난자 / 백여울과 DRAIN-MARK를 침범하지 않는 침묵권 보조 NPC
```

---

## 10. 최종 요약

R01 NPC 데이터는 이제 구현팀에 넘길 수 있는 1차 적용표를 가진다.

```text
스키마 초안:
필드와 규칙의 사전

Vertical Slice 구현 목록:
무엇을 만들지 자르는 제작표

이 문서:
두 문서를 합쳐 실제 npc_id, 타입, 플래그, 대사 참조, 이름 정책을 적용한 전달표
```

R01은 여기서 새 NPC를 더 늘리지 않는다.

R01 바깥의 E01 지역들에 필요한 보조 NPC 최소안도 작성 완료되었다.
다음은 E02 첫 외부 슬라이스에서 필요한 NPC 예산을 먼저 자르는 작업이다.
