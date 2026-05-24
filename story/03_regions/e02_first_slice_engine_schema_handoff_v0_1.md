# E02 첫 외부 슬라이스 구현 데이터 전달/엔진 스키마화 v0.1

## 0. 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 QA 통과 산출물을 엔진 데이터로 옮기기 위한 스키마/전달 문서.
새 NPC 제작 아님.
새 문구 제작 아님.
실제 엔진 코드 작성 아님.
실제 JSON/CSV 작성 아님.

판정:
스키마 전달 가능
```

---

## 1. 입력 산출물 잠금

| 항목 | 기준 | 이번 문서 처리 | 판정 |
|---|---:|---|---|
| 대상 수 | 9개 | 9개 유지 | 통과 |
| application_id | 36개 | `e02_app_001~036` 유지 | 통과 |
| reaction_id | 36개 | `e02_sr_001~036` 유지 | 통과 |
| object_text_id | 18개 | `e02_obj_001~018` 유지 | 통과 |
| reaction-only | 8행 | 새 object_text_id 없음 | 통과 |
| 직접 대면 | 2행 | `e02_app_003`, `e02_app_011`만 | 통과 |
| 플래그 | 11개 | read/set 그래프 유지 | 통과 |
| 상태 키 | 12개 | read/mutating 후보 유지 | 통과 |

고정 원칙:

```text
이 문서는 QA 통과 범위를 엔진팀 전달용으로 정리한다.
실제 엔진 리소스, 코드, JSON, CSV는 만들지 않는다.
허용 범위 밖 ID, 임시 ID, 엔진팀 편의용 새 ID는 만들지 않는다.
```

---

## 2. 전달 패키지 요약

| package | source_document | handoff_role | must_not_do |
|---|---|---|---|
| targets | 기존 후보/구현 컷 | 9개 대상 ID 유지 | 새 NPC 추가 |
| applications | 데이터 적용표 | 36행 매핑 | 새 application_id |
| reactions | 상태 반응표 | 36개 반응 참조 | 새 reaction_id |
| object_texts | 오브젝트 문구 은행 | 18개 문구 참조 | 새 object_text_id |
| flags | 적용표/QA | 11개 read/set 그래프 | 해금 플래그화 |
| state_keys | 적용표/QA | 12개 상태 키 | 새 상태 키 |
| validation | QA 체크리스트 | 금지 해금 검산 | 통과 기준 완화 |

---

## 3. 공통 필드 사전

```yaml
E02ApplicationRecord:
  application_id: e02_app_001~036만 허용
  reaction_id: e02_sr_001~036만 허용
  object_text_id: e02_obj_001~018 또는 reaction-only
  application_type: 허용 enum 중 하나
  target_seed: 9개 기존 target_seed 중 하나
  campaign: E02_C01, E02_C03, E02_C04, E02_C05, E02_C07, E02_C08 중 하나
  trigger_state: 기존 상태 키 12개 중 하나
  trigger_flag: 기존 플래그 11개 또는 없음
  condition_expression: 구현팀 표시 조건
  display_surface: 허용 enum 중 하나
  text_source: 기존 반응/오브젝트 문구 참조
  state_result: 세계 반응 또는 흔적 변화 설명
  flag_result: read, set, set/read, no flag 중 하나
  implementation_phase: 허용 enum 중 하나
  protected_playable: 기능 보호 대상
  qa_guard: 금지 해금 방지 설명

E02ObjectTextRecord:
  object_text_id: e02_obj_001~018만 허용
  object_group: 기존 오브젝트 그룹
  campaign: 기존 캠페인
  placement_node: 캠페인식 장소명
  default_state: 기존 오브젝트 문구 은행 참조
  changed_state: 기존 오브젝트 문구 은행 참조
  reads_states: 기존 상태 키
  reads_flags: 기존 플래그 또는 없음
  linked_reactions: 연결 reaction_id
  visibility_rule: 표시 조건
  replay_rule: 재방문 처리
  protected_playable: 기능 보호 대상
  qa_guard: 금지 기능 방지 설명

E02ReactionRecord:
  reaction_id: e02_sr_001~036만 허용
  target_seed: 9개 기존 target_seed 중 하나
  campaign: 기존 캠페인
  reaction_type: object_text, direct_encounter, device_voice, ambient_log, reaction_only 중 하나
  state_key: 기존 상태 키
  flag_dependency: 기존 플래그 또는 없음
  line_or_change_ref: 기존 상태 반응표 또는 대사/잔향 은행 참조
  display_surface: 허용 enum 중 하나
  implementation_phase: 허용 enum 중 하나
  protected_playable: 기능 보호 대상
  forbidden_unlock: 금지 해금 목록 중 관련 항목

E02FlagRecord:
  flag: 기존 플래그 11개 중 하나
  set_by_application: 플래그를 세우는 application_id
  read_by_applications: 플래그를 읽는 application_id 목록
  player_facing_surface: 플레이어에게 보이는 표면
  downstream_effect: 허용되는 후속 반응
  forbidden_unlock: 열리면 실패하는 기능

E02StateKeyRecord:
  state_key: 기존 상태 키 12개 중 하나
  used_by_applications: 참조 application_id 목록
  read_only_or_mutating: read only, read mostly, mutating candidate 중 하나
  allowed_effect: 허용되는 세계 반응
  forbidden_effect: 열리면 실패하는 기능
```

---

## 4. enum 사전

| enum | allowed_values | forbidden_values | note |
|---|---|---|---|
| application_type | object_text, direct_encounter, hub_reaction_candidate, device_voice, ambient_log, reaction_only | quest, shop, fast_travel, playable_unlock | reaction-only는 object_text record를 만들지 않는다 |
| display_surface | locker_ui, collection_room_light, direct_encounter, hub_reaction, billboard, caption, studio_log, gate_log, pass_reader, platform_list, receipt, locker_log, inspection_sheet, shelter_speaker, commuter_pass_log | shop_ui, upgrade_ui, fast_travel_ui, safe_zone_ui, rescue_cutscene | 실제 노출 표면만 지정한다 |
| implementation_phase | first_seen, pre_boss, post_boss, optional_trace, revisit, hub_after_return | unlock_reward, tutorial_gate, repeat_meeting_reward | 표시 시점이지 보상 단계가 아니다 |
| protected_playable | GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO, 미나, 복희, 세븐, RATION-16 | 신규 플레이어블, 신규 동료, 임시 해금 대상 | 기능 보호용 필드이며 해금 필드가 아니다 |
| forbidden_unlock | 새 NPC, 빠른 이동, 무료 재통과, 상점/교환 기능, 배송 전투, 방송 장악, 정답 공개, 공식 안내 버프, 수리/강화 UI, 로봇 동료 추가, 안전지대/회복소, 보급 상점, 가족 구출 퀘스트, 주거 튜토리얼, 플레이어블 해금 대체, 실명 지리/회사 노출 | 없음 | 발생 시 실패 |

---

## 5. application 매핑 전달표

| application_id | reaction_id | object_text_id | application_type | target_seed | campaign | trigger_state | trigger_flag | display_surface | implementation_phase | protected_playable | handoff_note |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `e02_app_001` | `e02_sr_001` | `e02_obj_001` | object_text | `g_E02_C03_g5_001` | E02_C03 | `delivery_state` | `e02_locker_expiry_seen` | locker_ui | first_seen | RETURN-05 | 보상 상자나 택배 퀘스트로 변환 금지 |
| `e02_app_002` | `e02_sr_002` | `e02_obj_005` | object_text | `g_E02_C03_g5_001` | E02_C03 | `passage_tag` | `e02_last_train_missed` | collection_room_light | pre_boss | GATE-09 | 빠른 이동, 환승 해금 금지 |
| `e02_app_003` | `e02_sr_003` | reaction-only | direct_encounter | `g_E02_C03_g5_001` | E02_C03 | `trace_preservation` | `e02_locker_recipient_spoken` | direct_encounter | first_seen | RETURN-05 | 직접 대면 1회 이하, 새 오브젝트 문구 금지 |
| `e02_app_004` | `e02_sr_004` | `e02_obj_002` | object_text | `g_E02_C03_g5_001` | E02_C03 | `delivery_state` | `e02_locker_extension_refused` | locker_ui | post_boss | RETURN-05 | 반품 상점, 즉시 구원 금지 |
| `e02_app_005` | `e02_sr_005` | `e02_obj_004` | hub_reaction_candidate | `g_E02_C03_g5_001` | E02_C03 | `signal_tag` | `e02_locker_expiry_seen` | hub_reaction | hub_after_return | 미나, 복희 | 정답 안내, 이름 해금 금지 |
| `e02_app_006` | `e02_sr_006` | `e02_obj_006` | object_text | `g_E02_C05_g5_001` | E02_C05 | `signal_stability` | `e02_disaster_phrase_delayed` | billboard | first_seen | BROAD-10 | 방송 장악, 아나운서 NPC 금지 |
| `e02_app_007` | `e02_sr_007` | `e02_obj_009` | object_text | `g_E02_C05_g5_001` | E02_C05 | `campaign_density` | `e02_phrase_approved_too_late` | caption | post_boss | BROAD-10 | 세계 진실 설명 금지 |
| `e02_app_008` | `e02_sr_008` | `e02_obj_007` | device_voice | `g_E02_C05_g5_001` | E02_C05 | `human_stability` | `e02_guidance_loop_muted` | billboard | optional_trace | QUIET-07, BROAD-10 | 낮은 수신 튜토리얼 금지 |
| `e02_app_009` | `e02_sr_009` | `e02_obj_008` | object_text | `g_E02_C05_g5_001` | E02_C05 | `trace_preservation` | `e02_caption_cut_recovered` | caption | optional_trace | 세븐, 복희 | 도감 정답 판정 금지 |
| `e02_app_010` | `e02_sr_010` | `e02_obj_010` | object_text | `g_E02_C05_g5_001` | E02_C05 | `signal_tag` | `e02_disaster_phrase_delayed` | studio_log | pre_boss | BROAD-10 | 수신태그 보상 금지 |
| `e02_app_011` | `e02_sr_011` | reaction-only | direct_encounter | `g_E02_C07_g5_001` | E02_C07 | `passage_tag` | `e02_last_train_missed` | direct_encounter | first_seen | GATE-09 | 빠른 이동, 역무원 선역화 금지 |
| `e02_app_012` | `e02_sr_012` | `e02_obj_011` | ambient_log | `g_E02_C07_g5_001` | E02_C07 | `passage_tag` | `e02_gate_unpassed_log_seen` | gate_log | pre_boss | GATE-09 | 해금 판정 대체 금지 |
| `e02_app_013` | `e02_sr_013` | `e02_obj_014` | device_voice | `g_E02_C07_g5_001` | E02_C07 | `human_stability` | `e02_transfer_hold_spoken` | pass_reader | revisit | GATE-09 | 플랫폼 구출 장면 금지 |
| `e02_app_014` | `e02_sr_014` | `e02_obj_013` | object_text | `g_E02_C07_g5_001` | E02_C07 | `campaign_density` | `e02_platform_residue_preserved` | platform_list | post_boss | GATE-09 | HP 0 처리 대체 금지 |
| `e02_app_015` | `e02_sr_015` | reaction-only | reaction_only | `g_E02_C07_g5_001` | E02_C07 | `signal_tag` | `e02_last_train_missed` | billboard | optional_trace | GATE-09 | 인양 안정 보상 금지 |
| `e02_app_016` | `e02_sr_016` | `e02_obj_015` | object_text | `g_E02_C03_g4_001` | E02_C03 | `delivery_state` | `e02_locker_extension_refused` | receipt | revisit | RETURN-05 | 판매/교환 NPC 금지 |
| `e02_app_017` | `e02_sr_017` | `e02_obj_004` | device_voice | `g_E02_C03_g4_001` | E02_C03 | `signal_tag` | `e02_locker_expiry_seen` | locker_log | revisit | RETURN-05 | 미수령품 보상 금지 |
| `e02_app_018` | `e02_sr_018` | `e02_obj_005` | ambient_log | `g_E02_C03_g4_001` | E02_C03 | `trace_preservation` | `e02_last_train_missed` | collection_room_light | optional_trace | RETURN-05 | 점원 NPC화 금지 |
| `e02_app_019` | `e02_sr_019` | reaction-only | reaction_only | `g_E02_C03_g4_001` | E02_C03 | `campaign_density` | `e02_locker_expiry_seen` | receipt | revisit | RETURN-05 | 상점 개방 금지 |
| `e02_app_020` | `e02_sr_020` | `e02_obj_008` | object_text | `g_E02_C05_g4_001` | E02_C05 | `signal_stability` | `e02_caption_cut_recovered` | caption | optional_trace | BROAD-10 | 정답 송출 금지 |
| `e02_app_021` | `e02_sr_021` | `e02_obj_007` | object_text | `g_E02_C05_g4_001` | E02_C05 | `campaign_density` | `e02_guidance_loop_muted` | billboard | optional_trace | BROAD-10 | 방송 해킹 금지 |
| `e02_app_022` | `e02_sr_022` | `e02_obj_009` | ambient_log | `g_E02_C05_g4_001` | E02_C05 | `human_stability` | `e02_phrase_approved_too_late` | caption | revisit | BROAD-10 | 공식 안내 버프 금지 |
| `e02_app_023` | `e02_sr_023` | reaction-only | device_voice | `g_E02_C05_g4_001` | E02_C05 | `signal_tag` | `e02_disaster_phrase_delayed` | studio_log | optional_trace | BROAD-10 | 노라 기능 선점 금지 |
| `e02_app_024` | `e02_sr_024` | `e02_obj_014` | device_voice | `g_E02_C07_g4_001` | E02_C07 | `passage_tag` | `e02_gate_unpassed_log_seen` | pass_reader | revisit | GATE-09 | 무료 재통과 금지 |
| `e02_app_025` | `e02_sr_025` | `e02_obj_012` | device_voice | `g_E02_C07_g4_001` | E02_C07 | `human_stability` | `e02_transfer_hold_spoken` | pass_reader | revisit | GATE-09 | 개찰 튜토리얼 금지 |
| `e02_app_026` | `e02_sr_026` | `e02_obj_013` | ambient_log | `g_E02_C07_g4_001` | E02_C07 | `campaign_density` | `e02_platform_residue_preserved` | platform_list | post_boss | GATE-09 | 해금 장면 대체 금지 |
| `e02_app_027` | `e02_sr_027` | reaction-only | reaction_only | `g_E02_C07_g4_001` | E02_C07 | `signal_tag` | `e02_last_train_missed` | billboard | optional_trace | GATE-09 | 빠른 이동 안내 금지 |
| `e02_app_028` | `e02_sr_028` | `e02_obj_016` | object_text | `g_E02_C04_g4_001` | E02_C04 | `robot_autonomy` | 없음 | inspection_sheet | optional_trace | PATCH, RIO | 로봇 동료/수리 NPC 금지 |
| `e02_app_029` | `e02_sr_029` | `e02_obj_016` | object_text | `g_E02_C04_g4_001` | E02_C04 | `charge_tag` | 없음 | inspection_sheet | optional_trace | METER, PATCH | 충전/강화 UI 금지 |
| `e02_app_030` | `e02_sr_030` | `e02_obj_016` | object_text | `g_E02_C04_g4_001` | E02_C04 | `trace_preservation` | 없음 | inspection_sheet | optional_trace | PATCH, RIO | 정품 복구 설명 금지 |
| `e02_app_031` | `e02_sr_031` | `e02_obj_017` | device_voice | `g_E02_C08_g4_001` | E02_C08 | `signal_stability` | `e02_guidance_loop_muted` | shelter_speaker | optional_trace | QUIET-07, BROAD-10 | 안전지대, 낮은 수신 튜토리얼 금지 |
| `e02_app_032` | `e02_sr_032` | reaction-only | reaction_only | `g_E02_C08_g4_001` | E02_C08 | `supply_pressure` | 없음 | shelter_speaker | optional_trace | RATION-16, 복희 | 회복소/보급 상점 금지 |
| `e02_app_033` | `e02_sr_033` | `e02_obj_017` | device_voice | `g_E02_C08_g4_001` | E02_C08 | `extraction_stability` | 없음 | shelter_speaker | optional_trace | QUIET-07 | 긴급 인양 안정화 금지 |
| `e02_app_034` | `e02_sr_034` | `e02_obj_018` | ambient_log | `g_E02_C01_g4_001` | E02_C01 | `residence_tag` | 없음 | commuter_pass_log | optional_trace | OPEN-HOST | R01 가족칸 반복 금지 |
| `e02_app_035` | `e02_sr_035` | `e02_obj_018` | object_text | `g_E02_C01_g4_001` | E02_C01 | `passage_tag` | `e02_gate_unpassed_log_seen` | commuter_pass_log | optional_trace | GATE-09, OPEN-HOST | 빠른 이동, 가족 구출 금지 |
| `e02_app_036` | `e02_sr_036` | reaction-only | reaction_only | `g_E02_C01_g4_001` | E02_C01 | `human_stability` | `e02_last_train_missed` | commuter_pass_log | optional_trace | OPEN-HOST | 주거 튜토리얼, R01 재탕 금지 |

---

## 6. object text 매핑 전달표

| object_text_id | object_group | campaign | placement_node | linked_reactions | visibility_rule | replay_rule | protected_playable | handoff_note |
|---|---|---|---|---|---|---|---|---|
| `e02_obj_001` | 역전 보관함 만료 UI | E02_C03 | 역전 보관함 앞 | `e02_sr_001` | 보관함 최초 확인 시 표시 | 재방문 시 변경 문구 유지 | RETURN-05 | 보상 상자 금지 |
| `e02_obj_002` | 역전 보관함 만료 UI | E02_C03 | 보관 연장 선택창 | `e02_sr_004` | 보관 연장 거부 선택 후 표시 | 후속 방문에서 거부 상태 유지 | RETURN-05, 복희 | 이름 해금 금지 |
| `e02_obj_003` | 보관함 만료 로그 | E02_C03 | 보관함 측면 점검 패널 | `e02_sr_001`, `e02_sr_016` | 점검 패널 조사 시 표시 | 상태가 바뀌어도 로그는 누적형 | RETURN-05 | 반송 전투 대체 금지 |
| `e02_obj_004` | 보관함 만료 로그 | E02_C03 | 막차 후 보관함 재방문 | `e02_sr_005`, `e02_sr_017` | 만료 확인 후 재방문 시 표시 | 보급소 귀환 후 반응 후보 유지 | 미나, 세븐, RETURN-05 | 정답 분석 UI 금지 |
| `e02_obj_005` | 막차 뒤 회수실 조명 | E02_C03 | 막차 뒤 회수실 | `e02_sr_002`, `e02_sr_018` | 막차 뒤 회수실 진입 시 표시 | 조명 패턴은 재방문마다 유지 | RETURN-05, GATE-09 | 편의점 점원/빠른 이동 금지 |
| `e02_obj_006` | 반복 전광판 | E02_C05 | 방재 생방송권 입구 | `e02_sr_006` | 승인 지연 확인 시 표시 | 프리보스 구간에서 반복 표시 | BROAD-10 | 정답 안내 금지 |
| `e02_obj_007` | 반복 전광판 | E02_C05 | 반복 안내 교차로 | `e02_sr_008`, `e02_sr_021` | 반복 안내 차단 후 표시 | 반복은 줄되 변경 문구 유지 | BROAD-10, QUIET-07 | 방송 해킹, 낮은 수신 튜토리얼 금지 |
| `e02_obj_008` | 잘린 방재 자막 | E02_C05 | 깨진 전광판 하단 | `e02_sr_009`, `e02_sr_020` | 자막 조각 회수 전후 표시 | 회수 후 변경 문구 고정 | BROAD-10 | 세계 진실 공개 금지 |
| `e02_obj_009` | 잘린 방재 자막 | E02_C05 | 자막 조각 보관 화면 | `e02_sr_007`, `e02_sr_022` | 늦은 승인 후 표시 | 포스트보스 재방문 시 유지 | BROAD-10 | 공식 안내 버프 금지 |
| `e02_obj_010` | 방재 스튜디오 송출 로그 | E02_C05 | 송출 지연 콘솔 | `e02_sr_010`, `e02_sr_023` | 스튜디오 로그 조사 시 표시 | 지연 상태는 누적형 | BROAD-10 | 아나운서 NPC 금지 |
| `e02_obj_011` | 개찰 미통과 로그 | E02_C07 | 환승 게이트 뒤쪽 | `e02_sr_012`, `e02_sr_027` | 개찰 로그 확인 시 표시 | 보류 상태는 재방문 시 유지 | GATE-09 | 해금 판정/빠른 이동 금지 |
| `e02_obj_012` | 개찰 미통과 로그 | E02_C07 | 정기권 판독기 옆 | `e02_sr_024`, `e02_sr_025` | 정기권 판독 실패 후 표시 | 재판독해도 무료 통과 없음 | GATE-09 | 무료 재통과 금지 |
| `e02_obj_013` | 플랫폼 잔류 명단 | E02_C07 | 막차 심사 플랫폼 | `e02_sr_014`, `e02_sr_026` | 잔류 흔적 보존 선택 후 표시 | 포스트보스에서 더 선명히 표시 | GATE-09 | HP 0 처리 대체 금지 |
| `e02_obj_014` | 정기권 판독기 | E02_C07 | 개찰기 판독 실패 지점 | `e02_sr_013`, `e02_sr_024` | 보류관 대면 또는 미통과 로그 후 표시 | 반복 판독은 가능하나 통과 해금 없음 | GATE-09 | 개찰 튜토리얼 금지 |
| `e02_obj_015` | 편의점 카운터 영수증/닫힌 셔터 | E02_C03 | 닫힌 편의점 카운터 | `e02_sr_016`, `e02_sr_019` | 보관 연장 거부 후 표시 | 영수증 재확인 가능 | RETURN-05 | 상점/교환 기능 금지 |
| `e02_obj_016` | 리콜 검사표/미세부품 검사표 | E02_C04 | 미세부품 리콜 라인 | `e02_sr_028`, `e02_sr_029`, `e02_sr_030` | 리콜 검사표 조사 시 표시 | 후속 로봇 반응 후보만 남김 | PATCH, METER, RIO | 수리/강화 UI 금지 |
| `e02_obj_017` | 무음 대피소 안내 스피커 | E02_C08 | 소등 후 대피실 | `e02_sr_031`, `e02_sr_032`, `e02_sr_033` | 대피실 접근 시 표시 | 안전지대처럼 반복 보상 없음 | QUIET-07, BROAD-10 | 회복소/안전지대 금지 |
| `e02_obj_018` | 가족 정기권 거래 로그/세대 갱신 알림 | E02_C01 | 가족 정기권 아파트 | `e02_sr_034`, `e02_sr_035`, `e02_sr_036` | 가족권 로그 조사 시 표시 | 주거/통근 압력만 유지 | OPEN-HOST, GATE-09 | 가족 구출 퀘스트 금지 |

---

## 7. reaction-only 전달 규칙

| application_id | reaction_id | display_surface | reason_for_reaction_only | engine_handling | must_not_create |
|---|---|---|---|---|---|
| `e02_app_003` | `e02_sr_003` | direct_encounter | 제한 대면 1회 전용 | reaction.line_or_change | 새 object_text_id |
| `e02_app_011` | `e02_sr_011` | direct_encounter | 제한 대면 1회 전용 | reaction.line_or_change | 새 object_text_id |
| `e02_app_015` | `e02_sr_015` | billboard | 신호 충돌 상태 변화 전용 | system_state_change_only | 새 object_text_id |
| `e02_app_019` | `e02_sr_019` | receipt | 회수 압력 배경 변화 전용 | system_state_change_only | 새 object_text_id |
| `e02_app_023` | `e02_sr_023` | studio_log | 후속 지역 압력 씨앗 전용 | reaction.line_or_change | 새 object_text_id |
| `e02_app_027` | `e02_sr_027` | billboard | 판정 지연 표시 전용 | system_state_change_only | 새 object_text_id |
| `e02_app_032` | `e02_sr_032` | shelter_speaker | 보급 압력 상태 변화 전용 | system_state_change_only | 새 object_text_id |
| `e02_app_036` | `e02_sr_036` | commuter_pass_log | 가족/통근 압력 상태 변화 전용 | system_state_change_only | 새 object_text_id |

---

## 8. 직접 대면 제한 규칙

| direct_encounter_application | target_seed | allowed_once | repeat_rule | forbidden_expansion |
|---|---|---|---|---|
| `e02_app_003` | `g_E02_C03_g5_001` | yes | 보관함 앞 제한 대면 1회 후 `e02_locker_recipient_spoken`만 기록 | 반복 대면, 구출 컷신, 퀘스트 NPC화, 이름 확정 보상 |
| `e02_app_011` | `g_E02_C07_g5_001` | yes | 막차 심사 플랫폼 제한 대면 1회 후 `e02_transfer_hold_spoken` 후보만 기록 | 반복 대면, 빠른 이동, GATE-09 해금 대체, 역무원 선역화 |

직접 대면 금지 대상:

```text
방재 문구 승인자
편의점 회수 카운터 잔류자
반복 안내 편집자
정기권 판독자
미세부품 검수자
지하 대피실 조용한 관리자
가족 정기권 보류자
```

---

## 9. 플래그 read/set 그래프

| flag | set_by_application | read_by_applications | player_facing_surface | downstream_effect | forbidden_unlock |
|---|---|---|---|---|---|
| `e02_locker_expiry_seen` | `e02_app_001` | `e02_app_005`, `e02_app_017`, `e02_app_019` | locker_ui, locker_log, hub_reaction | 보관 만료 확인 후 회수/보급소 반응 후보가 열린다 | 배송 전투, 이름 해금 |
| `e02_last_train_missed` | `e02_app_002` 또는 E02_C07 입장 트리거 | `e02_app_011`, `e02_app_015`, `e02_app_018`, `e02_app_027`, `e02_app_036` | collection_room_light, direct_encounter, billboard, commuter_pass_log | 막차 이후 회수실/플랫폼/가족권 압력이 열린다 | 빠른 이동, 무료 환승 |
| `e02_locker_recipient_spoken` | `e02_app_003` | 없음 | direct_encounter | 보관함 앞 제한 대면 완료만 기록한다 | 반복 대면, 구출 장면 |
| `e02_locker_extension_refused` | `e02_app_004` | `e02_app_016` | locker_ui, receipt | 호출 로그 약화와 닫힌 카운터 문구를 연다 | 반품 상점, 즉시 보상 |
| `e02_disaster_phrase_delayed` | `e02_app_006` | `e02_app_010`, `e02_app_023` | billboard, studio_log | 승인 지연과 수신태그 압력을 연결한다 | 방송 장악, 정답 송출 |
| `e02_caption_cut_recovered` | `e02_app_009` | `e02_app_020` | caption | 잘린 자막 보존과 편집자 반응을 연결한다 | 세계 진실 공개 |
| `e02_guidance_loop_muted` | `e02_app_008` | `e02_app_021`, `e02_app_031` | billboard, shelter_speaker | 반복 안내 차단 후 무음 대피소 압력을 연다 | 낮은 수신 튜토리얼, 안전지대 |
| `e02_phrase_approved_too_late` | `e02_app_007` | `e02_app_022` | caption, studio_log | 늦은 승인 문구와 인간 안정도 압력을 연결한다 | 공식 안내 버프 |
| `e02_gate_unpassed_log_seen` | `e02_app_012` | `e02_app_024`, `e02_app_035` | gate_log, pass_reader, commuter_pass_log | 개찰 미통과가 정기권/가족권 판독으로 번진다 | GATE-09 해금 대체, 빠른 이동 |
| `e02_transfer_hold_spoken` | `e02_app_011` | `e02_app_013`, `e02_app_025` | direct_encounter, pass_reader | 보류관 대면 후 판독기 반응을 바꾼다 | 플랫폼 구출, 개찰 튜토리얼 |
| `e02_platform_residue_preserved` | `e02_app_014` | `e02_app_026` | platform_list | 잔류 명단 보존과 캠페인 농도 상승을 연결한다 | HP 0 처리 대체 |

---

## 10. 상태 키 read/mutating 규칙

| state_key | used_by_applications | read_only_or_mutating | allowed_effect | forbidden_effect |
|---|---|---|---|---|
| `delivery_state` | `e02_app_001`, `e02_app_004`, `e02_app_016` | mutating candidate | 보관 만료, 연장 거부, 회수 기록 변화 | 배송 전투, 상점 보상 |
| `passage_tag` | `e02_app_002`, `e02_app_011`, `e02_app_012`, `e02_app_024`, `e02_app_035` | read mostly | 막차/개찰/가족권 판정 지연 | 빠른 이동, 무료 통과 |
| `signal_tag` | `e02_app_005`, `e02_app_010`, `e02_app_015`, `e02_app_017`, `e02_app_023`, `e02_app_027` | read mostly | 보급소 비콘 흔들림, 알림/방송 신호 어긋남 | 수신태그 보상, 정답 공개 |
| `signal_stability` | `e02_app_006`, `e02_app_020`, `e02_app_031` | read mostly | 전광판/자막/대피소 안내 변화 | 방송 장악, 안전지대 |
| `campaign_density` | `e02_app_007`, `e02_app_014`, `e02_app_019`, `e02_app_021`, `e02_app_026` | mutating candidate | 캠페인 압력 상승, 잔향 선명화 | 보스 해금, 정답 설명 |
| `human_stability` | `e02_app_008`, `e02_app_013`, `e02_app_022`, `e02_app_025`, `e02_app_036` | read mostly | 불안정 문구, 재판독, 안정도 회복 없는 후폭풍 | 회복소, 안정도 보상 |
| `trace_preservation` | `e02_app_003`, `e02_app_009`, `e02_app_018`, `e02_app_030` | mutating candidate | 흔적 보존, 자막/라벨/보관 흔적 유지 | 본명 해금, 구출 확정 |
| `robot_autonomy` | `e02_app_028` | read mostly | 자율 판단 흔적을 리콜 사유로 표시 | 로봇 동료 추가, PATCH 대체 |
| `charge_tag` | `e02_app_029` | read only | 충전 부족을 검수 압력으로 표시 | 충전/강화 UI |
| `extraction_stability` | `e02_app_033` | read mostly | 인양 단서 약화, 보급소 비콘 불안 | 긴급 인양 안정화 |
| `residence_tag` | `e02_app_034` | read mostly | 세대 갱신/가족권 재판독 노출 | OPEN-HOST 주거 안내 대체 |
| `supply_pressure` | `e02_app_032` | read mostly | 대피소 보급 압력과 사람 상태 지연 표시 | 보급 상점, 회복소 |

---

## 11. 플레이어블 보호 매트릭스

| protected_playable | protected_function | related_applications | schema_guard | fail_condition |
|---|---|---|---|---|
| GATE-09 | 막차, 개찰, 환승, 플랫폼 잔류 | `e02_app_002`, `e02_app_011`~`e02_app_015`, `e02_app_024`~`e02_app_027`, `e02_app_035` | passage_tag는 판정 지연과 잔류 압력만 표현 | 빠른 이동, 무료 재통과, 해금 장면 대체 |
| BROAD-10 | 방재 문구, 전광판, 정정 자막 | `e02_app_006`~`e02_app_010`, `e02_app_020`~`e02_app_023`, `e02_app_031` | billboard/caption/studio_log는 지연/잔향만 표현 | 방송 장악, 정답 송출, 공식 안내 버프 |
| RETURN-05 | 보관 만료, 회수 카운터, 미수령품 | `e02_app_001`~`e02_app_005`, `e02_app_016`~`e02_app_019` | delivery_state는 회수 기록과 후폭풍만 표현 | 배송 전투, 반품 상점, 보상 상자 |
| QUIET-07 | 낮은 수신, 무음 대피소, 약한 인양 | `e02_app_008`, `e02_app_031`~`e02_app_033` | shelter_speaker는 불안정 안내만 표현 | 안전지대, 회복소, 낮은 수신 튜토리얼 |
| OPEN-HOST | 가족/주거 안내와 동선 기능 | `e02_app_034`~`e02_app_036` | residence_tag는 가족권 압력만 표현 | 주거 튜토리얼, 가족 구출 퀘스트 |
| PATCH | 보급소 수리 로봇, 자기부품화 | `e02_app_028`~`e02_app_030` | inspection_sheet는 리콜 흔적만 표현 | 수리 NPC, 로봇 동료 추가 |
| METER | 충전/계량/차단 전투 | `e02_app_029` | charge_tag는 검수 압력만 표현 | 충전/강화 UI |
| RIO | 정품 판정, 로봇 체류 압력 | `e02_app_028`, `e02_app_030` | 정품 복구 설명 없이 리콜 흔적만 남김 | 정품 복구, 객실/체류 판정 설명 |
| 미나 | 보급소 상태 반응과 귀환 후 정리 | `e02_app_005` | hub_reaction_candidate는 후보만 열고 설명 NPC로 확장하지 않음 | 정답 안내, 안전 귀환 보장 |
| 복희 | 이름/흔적 감정과 기억 보존 | `e02_app_005`, `e02_app_009`, `e02_app_032` | trace/supply 반응은 감정 후보만 남김 | 이름 해금, 회복소, 정답 해설 |
| 세븐 | 지역 정보, 도감, 회수 목표 추천 | `e02_app_004`, `e02_app_009` | object/caption은 단서 조각만 남김 | 도감 정답 판정, 목표 자동 추천 |
| RATION-16 | 보급권/대피소 보급 압력 후속 | `e02_app_032` | supply_pressure는 보급 압력만 표현 | 보급 상점, 식량 회복소 |

---

## 12. 엔진팀 전달 후보 파일명

이 섹션은 실제 파일을 만들지 않는다.

| future_engine_file_candidate | source_section | note | create_now |
|---|---|---|---|
| `data/e02/first_slice_applications.*` | 5. application 매핑 전달표 | 36개 application record 후보 | no |
| `data/e02/first_slice_object_texts.*` | 6. object text 매핑 전달표 | 18개 object text record 후보 | no |
| `data/e02/first_slice_reactions.*` | 3. 공통 필드 사전, 상태 반응표 원본 | 36개 reaction record 후보 | no |
| `data/e02/first_slice_flags.*` | 9. 플래그 read/set 그래프 | 11개 flag record 후보 | no |
| `data/e02/first_slice_state_keys.*` | 10. 상태 키 read/mutating 규칙 | 12개 state key record 후보 | no |
| `data/e02/first_slice_validation.*` | 13. 구현 전 검증 체크리스트 | 엔진 데이터 변환 전 검증 후보 | no |

주의:

```text
확장자와 실제 저장 위치는 엔진팀이 별도 결정한다.
이번 문서에서 실제 파일을 만들지 않는다.
```

---

## 13. 구현 전 검증 체크리스트

```text
[ ] e02_app_001~036이 모두 정확히 1회 있다.
[ ] e02_sr_001~036이 모두 정확히 1회 있다.
[ ] e02_obj_001~018이 모두 정확히 1회 있다.
[ ] reaction-only 8행에 object_text_id가 생기지 않았다.
[ ] 직접 대면은 e02_app_003, e02_app_011뿐이다.
[ ] 플래그 11개가 기존 read/set 그래프를 유지한다.
[ ] 상태 키 12개가 기존 허용 효과만 가진다.
[ ] display_surface가 허용 enum만 사용한다.
[ ] implementation_phase가 허용 enum만 사용한다.
[ ] 금지 해금이 하나도 없다.
[ ] 실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성하지 않았다.
```

---

## 14. 최종 판정

```text
스키마 전달 가능:
QA 통과 산출물을 새 ID 없이 엔진팀 전달 문서로 정리했다.
9개 대상, 36개 application_id, 36개 reaction_id, 18개 object_text_id, reaction-only 8행, 직접 대면 2행 제한을 유지한다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일은 만들지 않았다.
```

---

## 15. 다음 작업 포인터

완료된 후속 문서:
`story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md`

| 판정 | 다음 작업 |
|---|---|
| 스키마 전달 가능 | E02 첫 외부 슬라이스 실제 엔진 데이터 작성 프롬프트 |
| 조건부 전달 | `story/03_regions/e02_first_slice_engine_schema_handoff_patch_v0_1.md` |
| 보류 | `story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md` 또는 `story/03_regions/e02_first_slice_state_object_data_application_v0_1.md` 수정 지시 |

권장 다음 작업:

```text
E02 첫 외부 슬라이스 실제 엔진 데이터 작성 프롬프트 작성.
실제 엔진 데이터 파일 생성은 별도 지시와 엔진 포맷 확정 후 진행한다.
```
