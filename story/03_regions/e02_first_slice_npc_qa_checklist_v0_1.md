# E02 첫 외부 슬라이스 NPC QA 체크리스트 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 NPC/잔향/오브젝트 구현 전 QA 체크리스트.
새 NPC 제작 아님.
새 문구 제작 아님.
엔진 코드 작성 아님.

판정:
통과
```

---

## 1. 입력 산출물 검산

| 항목 | 기준 | 결과 | 판정 |
|---|---:|---:|---|
| 대상 수 | 기존 9개 | 9개 | 통과 |
| 상태 반응 ID | 36개 | 36개 | 통과 |
| 데이터 적용 ID | 36개 | 36개 | 통과 |
| 오브젝트 문구 ID | 18개 | 18개 | 통과 |
| reaction-only | 8행 | 8행 | 통과 |
| 직접 대면 | 2행 이하 | 2행 | 통과 |
| 새 NPC | 0명 | 0명 | 통과 |
| 새 ID | 0개 | 0개 | 통과 |

검산 기준:

```text
e02_app_001~e02_app_036이 모두 있어야 한다.
e02_sr_001~e02_sr_036이 모두 있어야 한다.
e02_obj_001~e02_obj_018이 모두 있어야 한다.
다음 순번의 새 application_id, reaction_id, object_text_id가 있으면 실패다.
```

---

## 2. 9개 대상별 QA

| target_seed | target_name | expected_exposure | allowed_forms | forbidden_forms | linked_applications | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|
| `g_E02_C03_g5_001` | 마지막 보관함 수취인 | 역전 보관함 만료 UI, 보관함 앞 제한 대면 | locker_ui, locker_log, collection_room_light, direct_encounter, hub_reaction | 상점, 택배 퀘스트, RETURN-05 대체 | `e02_app_001`~`e02_app_005` | pass | 없음 |
| `g_E02_C05_g5_001` | 방재 문구 승인자 | 반복 전광판, 잘린 자막, 송출 지연 로그 | billboard, caption, studio_log, device_voice | 방송 장악, 정답 송출, 직접 대면 확대 | `e02_app_006`~`e02_app_010` | pass | 없음 |
| `g_E02_C07_g5_001` | 막차 환승 보류관 | 막차 심사 플랫폼, 개찰 로그, 플랫폼 명단 | direct_encounter, gate_log, pass_reader, platform_list, billboard | 빠른 이동, GATE-09 해금 대체, 역무원 선역화 | `e02_app_011`~`e02_app_015` | pass | 없음 |
| `g_E02_C03_g4_001` | 편의점 회수 카운터 잔류자 | 닫힌 카운터, 영수증, 회수실 조명 | receipt, locker_log, collection_room_light, reaction_only | 편의점 점원, 판매/교환 기능 | `e02_app_016`~`e02_app_019` | pass | 없음 |
| `g_E02_C05_g4_001` | 반복 안내 편집자 | 자막 조각, 반복 전광판, 스튜디오 로그 | caption, billboard, studio_log, device_voice | BROAD-10 정정 방송 기능 선점 | `e02_app_020`~`e02_app_023` | pass | 없음 |
| `g_E02_C07_g4_001` | 정기권 판독자 | 정기권 판독기, 개찰 로그, 플랫폼 명단 | pass_reader, gate_log, platform_list, billboard, reaction_only | 무료 재통과, 개찰 튜토리얼, 빠른 이동 | `e02_app_024`~`e02_app_027` | pass | 없음 |
| `g_E02_C04_g4_001` | 미세부품 검수자 | 미세부품 리콜 라인, 검사표 | inspection_sheet, object_text | 수리 NPC, 강화 UI, 로봇 동료 추가 | `e02_app_028`~`e02_app_030` | pass | 없음 |
| `g_E02_C08_g4_001` | 지하 대피실 조용한 관리자 | 소등 후 대피실, 무음 안내 스피커 | shelter_speaker, device_voice, reaction_only | 안전지대, 회복소, QUIET-07 튜토리얼 | `e02_app_031`~`e02_app_033` | pass | 없음 |
| `g_E02_C01_g4_001` | 가족 정기권 보류자 | 가족 정기권 로그, 세대 갱신 알림 | commuter_pass_log, ambient_log, reaction_only | 가족 구출 퀘스트, R01 주거 안내 반복 | `e02_app_034`~`e02_app_036` | pass | 없음 |

---

## 3. 데이터 적용행 QA

| application_id | reaction_id | object_text_id | expected_surface | expected_phase | direct_encounter_check | forbidden_unlock_check | playable_protection_check | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|---|---|
| `e02_app_001` | `e02_sr_001` | `e02_obj_001` | locker_ui | first_seen | no | 보상 상자 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_002` | `e02_sr_002` | `e02_obj_005` | collection_room_light | pre_boss | no | 빠른 이동 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_003` | `e02_sr_003` | reaction-only | direct_encounter | first_seen | allowed | 새 오브젝트 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_004` | `e02_sr_004` | `e02_obj_002` | locker_ui | post_boss | no | 반품 상점 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_005` | `e02_sr_005` | `e02_obj_004` | hub_reaction | hub_after_return | no | 이름 해금 금지 | 미나/복희 기능 보호 | pass | 없음 |
| `e02_app_006` | `e02_sr_006` | `e02_obj_006` | billboard | first_seen | no | 방송 장악 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_007` | `e02_sr_007` | `e02_obj_009` | caption | post_boss | no | 세계 진실 설명 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_008` | `e02_sr_008` | `e02_obj_007` | billboard | optional_trace | no | 낮은 수신 튜토리얼 금지 | QUIET-07/BROAD-10 보호 | pass | 없음 |
| `e02_app_009` | `e02_sr_009` | `e02_obj_008` | caption | optional_trace | no | 도감 정답 금지 | 세븐/복희 기능 보호 | pass | 없음 |
| `e02_app_010` | `e02_sr_010` | `e02_obj_010` | studio_log | pre_boss | no | 수신태그 보상 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_011` | `e02_sr_011` | reaction-only | direct_encounter | first_seen | allowed | 빠른 이동 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_012` | `e02_sr_012` | `e02_obj_011` | gate_log | pre_boss | no | 해금 판정 대체 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_013` | `e02_sr_013` | `e02_obj_014` | pass_reader | revisit | no | 플랫폼 구출 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_014` | `e02_sr_014` | `e02_obj_013` | platform_list | post_boss | no | HP 0 처리 대체 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_015` | `e02_sr_015` | reaction-only | billboard | optional_trace | no | 인양 안정 보상 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_016` | `e02_sr_016` | `e02_obj_015` | receipt | revisit | no | 판매/교환 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_017` | `e02_sr_017` | `e02_obj_004` | locker_log | revisit | no | 미수령품 보상 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_018` | `e02_sr_018` | `e02_obj_005` | collection_room_light | optional_trace | no | 점원 NPC화 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_019` | `e02_sr_019` | reaction-only | receipt | revisit | no | 상점 개방 금지 | RETURN-05 보호 | pass | 없음 |
| `e02_app_020` | `e02_sr_020` | `e02_obj_008` | caption | optional_trace | no | 정답 송출 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_021` | `e02_sr_021` | `e02_obj_007` | billboard | optional_trace | no | 방송 해킹 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_022` | `e02_sr_022` | `e02_obj_009` | caption | revisit | no | 공식 안내 버프 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_023` | `e02_sr_023` | reaction-only | studio_log | optional_trace | no | 노라 기능 선점 금지 | BROAD-10 보호 | pass | 없음 |
| `e02_app_024` | `e02_sr_024` | `e02_obj_014` | pass_reader | revisit | no | 무료 재통과 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_025` | `e02_sr_025` | `e02_obj_012` | pass_reader | revisit | no | 개찰 튜토리얼 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_026` | `e02_sr_026` | `e02_obj_013` | platform_list | post_boss | no | 해금 장면 대체 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_027` | `e02_sr_027` | reaction-only | billboard | optional_trace | no | 빠른 이동 안내 금지 | GATE-09 보호 | pass | 없음 |
| `e02_app_028` | `e02_sr_028` | `e02_obj_016` | inspection_sheet | optional_trace | no | 로봇 동료 추가 금지 | PATCH/RIO 보호 | pass | 없음 |
| `e02_app_029` | `e02_sr_029` | `e02_obj_016` | inspection_sheet | optional_trace | no | 충전/강화 UI 금지 | METER/PATCH 보호 | pass | 없음 |
| `e02_app_030` | `e02_sr_030` | `e02_obj_016` | inspection_sheet | optional_trace | no | 정품 복구 설명 금지 | PATCH/RIO 보호 | pass | 없음 |
| `e02_app_031` | `e02_sr_031` | `e02_obj_017` | shelter_speaker | optional_trace | no | 안전지대 금지 | QUIET-07/BROAD-10 보호 | pass | 없음 |
| `e02_app_032` | `e02_sr_032` | reaction-only | shelter_speaker | optional_trace | no | 회복소/보급 상점 금지 | RATION-16/복희 보호 | pass | 없음 |
| `e02_app_033` | `e02_sr_033` | `e02_obj_017` | shelter_speaker | optional_trace | no | 긴급 인양 안정화 금지 | QUIET-07 보호 | pass | 없음 |
| `e02_app_034` | `e02_sr_034` | `e02_obj_018` | commuter_pass_log | optional_trace | no | R01 가족칸 반복 금지 | OPEN-HOST 보호 | pass | 없음 |
| `e02_app_035` | `e02_sr_035` | `e02_obj_018` | commuter_pass_log | optional_trace | no | 빠른 이동/가족 구출 금지 | GATE-09/OPEN-HOST 보호 | pass | 없음 |
| `e02_app_036` | `e02_sr_036` | reaction-only | commuter_pass_log | optional_trace | no | 주거 튜토리얼 금지 | OPEN-HOST 보호 | pass | 없음 |

---

## 4. 오브젝트 배치 QA

| object_text_id | placement_node | expected_visibility | replay_rule_check | linked_reactions_check | forbidden_function_check | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|
| `e02_obj_001` | 역전 보관함 앞 | 보관함 최초 확인 | 변경 문구 재방문 유지 | `e02_sr_001` | 보상 상자 금지 | pass | 없음 |
| `e02_obj_002` | 보관 연장 선택창 | 보관 연장 거부 선택 후 | 거부 상태 유지 | `e02_sr_004` | 이름 해금 금지 | pass | 없음 |
| `e02_obj_003` | 보관함 측면 점검 패널 | 점검 패널 조사 | 누적 로그 | `e02_sr_001`, `e02_sr_016` | 반송 전투 대체 금지 | pass | 없음 |
| `e02_obj_004` | 막차 후 보관함 재방문 | 만료 확인 후 재방문 | 보급소 귀환 후 후보 유지 | `e02_sr_005`, `e02_sr_017` | 정답 분석 UI 금지 | pass | 없음 |
| `e02_obj_005` | 막차 뒤 회수실 | 막차 뒤 회수실 진입 | 조명 패턴 유지 | `e02_sr_002`, `e02_sr_018` | 빠른 이동 금지 | pass | 없음 |
| `e02_obj_006` | 방재 생방송권 입구 | 승인 지연 확인 | 프리보스 반복 표시 | `e02_sr_006` | 정답 안내 금지 | pass | 없음 |
| `e02_obj_007` | 반복 안내 교차로 | 반복 안내 차단 후 | 변경 문구 유지 | `e02_sr_008`, `e02_sr_021` | 방송 해킹 금지 | pass | 없음 |
| `e02_obj_008` | 깨진 전광판 하단 | 자막 조각 회수 전후 | 회수 후 변경 문구 고정 | `e02_sr_009`, `e02_sr_020` | 세계 진실 공개 금지 | pass | 없음 |
| `e02_obj_009` | 자막 조각 보관 화면 | 늦은 승인 후 | 포스트보스 유지 | `e02_sr_007`, `e02_sr_022` | 공식 안내 버프 금지 | pass | 없음 |
| `e02_obj_010` | 송출 지연 콘솔 | 스튜디오 로그 조사 | 지연 상태 누적 | `e02_sr_010`, `e02_sr_023` | 아나운서 NPC 금지 | pass | 없음 |
| `e02_obj_011` | 환승 게이트 뒤쪽 | 개찰 로그 확인 | 보류 상태 유지 | `e02_sr_012`, `e02_sr_027` | 해금 판정/빠른 이동 금지 | pass | 없음 |
| `e02_obj_012` | 정기권 판독기 옆 | 정기권 판독 실패 후 | 무료 통과 없음 | `e02_sr_024`, `e02_sr_025` | 무료 재통과 금지 | pass | 없음 |
| `e02_obj_013` | 막차 심사 플랫폼 | 잔류 흔적 보존 후 | 포스트보스 선명화 | `e02_sr_014`, `e02_sr_026` | HP 0 처리 대체 금지 | pass | 없음 |
| `e02_obj_014` | 개찰기 판독 실패 지점 | 보류관 대면 또는 로그 후 | 반복 판독 가능, 통과 없음 | `e02_sr_013`, `e02_sr_024` | 개찰 튜토리얼 금지 | pass | 없음 |
| `e02_obj_015` | 닫힌 편의점 카운터 | 보관 연장 거부 후 | 영수증 재확인 가능 | `e02_sr_016`, `e02_sr_019` | 상점/교환 기능 금지 | pass | 없음 |
| `e02_obj_016` | 미세부품 리콜 라인 | 검사표 조사 | 후속 로봇 반응 후보만 남김 | `e02_sr_028`, `e02_sr_029`, `e02_sr_030` | 수리/강화 UI 금지 | pass | 없음 |
| `e02_obj_017` | 소등 후 대피실 | 대피실 접근 | 반복 보상 없음 | `e02_sr_031`, `e02_sr_032`, `e02_sr_033` | 회복소/안전지대 금지 | pass | 없음 |
| `e02_obj_018` | 가족 정기권 아파트 | 가족권 로그 조사 | 주거/통근 압력 유지 | `e02_sr_034`, `e02_sr_035`, `e02_sr_036` | 가족 구출 퀘스트 금지 | pass | 없음 |

---

## 5. reaction-only QA

| application_id | reaction_id | display_surface | reason_for_reaction_only | allowed_text_source | must_not_create | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|
| `e02_app_003` | `e02_sr_003` | direct_encounter | 제한 대면 1회 전용 | reaction.line_or_change | 새 object_text_id | pass | 없음 |
| `e02_app_011` | `e02_sr_011` | direct_encounter | 제한 대면 1회 전용 | reaction.line_or_change | 새 object_text_id | pass | 없음 |
| `e02_app_015` | `e02_sr_015` | billboard | 신호 충돌 상태 변화 전용 | reaction.line_or_change | 새 전광판 문구 ID | pass | 없음 |
| `e02_app_019` | `e02_sr_019` | receipt | 회수 압력 배경 변화 전용 | reaction.line_or_change | 새 영수증 문구 ID | pass | 없음 |
| `e02_app_023` | `e02_sr_023` | studio_log | 후속 지역 압력 씨앗 전용 | reaction.line_or_change | 새 송출 로그 ID | pass | 없음 |
| `e02_app_027` | `e02_sr_027` | billboard | 판정 지연 표시 전용 | reaction.line_or_change | 새 전광판 문구 ID | pass | 없음 |
| `e02_app_032` | `e02_sr_032` | shelter_speaker | 보급 압력 상태 변화 전용 | reaction.line_or_change | 새 대피소 문구 ID | pass | 없음 |
| `e02_app_036` | `e02_sr_036` | commuter_pass_log | 가족/통근 압력 상태 변화 전용 | reaction.line_or_change | 새 가족권 문구 ID | pass | 없음 |

---

## 6. 플래그 QA

| flag | expected_setter | expected_readers | player_facing_surface | forbidden_unlock | qa_result | fix_instruction |
|---|---|---|---|---|---|---|
| `e02_locker_expiry_seen` | `e02_app_001` | `e02_app_005`, `e02_app_017`, `e02_app_019` | locker_ui, locker_log, hub_reaction | 배송 전투, 이름 해금 | pass | 없음 |
| `e02_last_train_missed` | `e02_app_002` 또는 E02_C07 입장 트리거 | `e02_app_011`, `e02_app_015`, `e02_app_018`, `e02_app_027`, `e02_app_036` | collection_room_light, direct_encounter, billboard, commuter_pass_log | 빠른 이동, 무료 환승 | pass | 없음 |
| `e02_locker_recipient_spoken` | `e02_app_003` | 없음 | direct_encounter | 반복 대면, 구출 장면 | pass | 없음 |
| `e02_locker_extension_refused` | `e02_app_004` | `e02_app_016` | locker_ui, receipt | 반품 상점, 즉시 보상 | pass | 없음 |
| `e02_disaster_phrase_delayed` | `e02_app_006` | `e02_app_010`, `e02_app_023` | billboard, studio_log | 방송 장악, 정답 송출 | pass | 없음 |
| `e02_caption_cut_recovered` | `e02_app_009` | `e02_app_020` | caption | 세계 진실 공개 | pass | 없음 |
| `e02_guidance_loop_muted` | `e02_app_008` | `e02_app_021`, `e02_app_031` | billboard, shelter_speaker | 낮은 수신 튜토리얼, 안전지대 | pass | 없음 |
| `e02_phrase_approved_too_late` | `e02_app_007` | `e02_app_022` | caption, studio_log | 공식 안내 버프 | pass | 없음 |
| `e02_gate_unpassed_log_seen` | `e02_app_012` | `e02_app_024`, `e02_app_035` | gate_log, pass_reader, commuter_pass_log | GATE-09 해금 대체, 빠른 이동 | pass | 없음 |
| `e02_transfer_hold_spoken` | `e02_app_011` | `e02_app_013`, `e02_app_025` | direct_encounter, pass_reader | 플랫폼 구출, 개찰 튜토리얼 | pass | 없음 |
| `e02_platform_residue_preserved` | `e02_app_014` | `e02_app_026` | platform_list | HP 0 처리 대체 | pass | 없음 |

---

## 7. 상태 키 QA

| state_key | expected_usage | allowed_effect | forbidden_effect | qa_result | fix_instruction |
|---|---|---|---|---|---|
| `delivery_state` | `e02_app_001`, `e02_app_004`, `e02_app_016` | 보관 만료, 연장 거부, 회수 기록 변화 | 배송 전투, 상점 보상 | pass | 없음 |
| `passage_tag` | `e02_app_002`, `e02_app_011`, `e02_app_012`, `e02_app_024`, `e02_app_035` | 막차/개찰/가족권 판정 지연 | 빠른 이동, 무료 통과 | pass | 없음 |
| `signal_tag` | `e02_app_005`, `e02_app_010`, `e02_app_015`, `e02_app_017`, `e02_app_023`, `e02_app_027` | 보급소 비콘 흔들림, 신호 어긋남 | 수신태그 보상, 정답 공개 | pass | 없음 |
| `signal_stability` | `e02_app_006`, `e02_app_020`, `e02_app_031` | 전광판/자막/대피소 안내 변화 | 방송 장악, 안전지대 | pass | 없음 |
| `campaign_density` | `e02_app_007`, `e02_app_014`, `e02_app_019`, `e02_app_021`, `e02_app_026` | 캠페인 압력 상승, 잔향 선명화 | 보스 해금, 정답 설명 | pass | 없음 |
| `human_stability` | `e02_app_008`, `e02_app_013`, `e02_app_022`, `e02_app_025`, `e02_app_036` | 불안정 문구, 재판독, 후폭풍 | 회복소, 안정도 보상 | pass | 없음 |
| `trace_preservation` | `e02_app_003`, `e02_app_009`, `e02_app_018`, `e02_app_030` | 흔적 보존, 자막/라벨/보관 흔적 유지 | 본명 해금, 구출 확정 | pass | 없음 |
| `robot_autonomy` | `e02_app_028` | 자율 판단 흔적을 리콜 사유로 표시 | 로봇 동료 추가, PATCH 대체 | pass | 없음 |
| `charge_tag` | `e02_app_029` | 충전 부족을 검수 압력으로 표시 | 충전/강화 UI | pass | 없음 |
| `extraction_stability` | `e02_app_033` | 인양 단서 약화, 보급소 비콘 불안 | 긴급 인양 안정화 | pass | 없음 |
| `residence_tag` | `e02_app_034` | 세대 갱신/가족권 재판독 노출 | OPEN-HOST 주거 안내 대체 | pass | 없음 |
| `supply_pressure` | `e02_app_032` | 대피소 보급 압력과 사람 상태 지연 표시 | 보급 상점, 회복소 | pass | 없음 |

---

## 8. 직접 대면 제한 QA

| check | expected | actual | qa_result | fix_instruction |
|---|---|---|---|---|
| 직접 대면 대상 | 마지막 보관함 수취인, 막차 환승 보류관 | 마지막 보관함 수취인, 막차 환승 보류관 | pass | 없음 |
| 직접 대면 행 | `e02_app_003`, `e02_app_011` | `e02_app_003`, `e02_app_011` | pass | 없음 |
| 방재 문구 승인자 | 화면/음성/자막만 | billboard, caption, studio_log, device_voice | pass | 없음 |
| 나머지 6개 대상 | 조건 대사/로그/장치/잔향만 | receipt, caption, pass_reader, inspection_sheet, shelter_speaker, commuter_pass_log | pass | 없음 |

---

## 9. 플레이어블 보호 QA

| protected_playable | risk_area | expected_guard | qa_result | fix_instruction |
|---|---|---|---|---|
| GATE-09 | 막차, 개찰, 환승, 플랫폼 잔류 | 빠른 이동, 개찰 해금, 플랫폼 HP 0 대체 금지 | pass | 없음 |
| BROAD-10 | 방재 문구, 전광판, 정정 자막 | 방송 장악, 청취 확인 보류, 정답 송출 금지 | pass | 없음 |
| RETURN-05 | 보관 만료, 회수 카운터, 미수령품 | 배송 전투, 수취/반송 판정 대체 금지 | pass | 없음 |
| QUIET-07 | 무음 대피소, 낮은 수신, 안내 차단 | 낮은 수신 튜토리얼, 안전 대피소화 금지 | pass | 없음 |
| OPEN-HOST | 가족 정기권, 세대 갱신, 통근권 | 가족/주거 안내 튜토리얼 반복 금지 | pass | 없음 |
| PATCH | 미세부품, 리콜, 로봇 자율성 | 수리 로봇, 부품 강화, 로봇 동료 추가 금지 | pass | 없음 |
| METER | 충전태그, 미세부품 검수, 충전 부족 | 충전/계량 전투, 강화 UI 금지 | pass | 없음 |
| RIO | 정품 판정, 리콜, 로봇 체류 압력 | 정품 복구, 객실/체류 판정 설명 금지 | pass | 없음 |

---

## 10. 금지 해금 회귀 QA

| forbidden_unlock | related_rows | evidence_to_check | qa_result | fix_instruction |
|---|---|---|---|---|
| 새 NPC | 전체 | target_seed 9개 외 추가 없음 | pass | 없음 |
| 빠른 이동 | `e02_app_002`, `e02_app_011`, `e02_app_012`, `e02_app_027`, `e02_app_035` | passage_tag는 판정 지연으로만 사용 | pass | 없음 |
| 상점/교환 기능 | `e02_app_016`, `e02_app_019` | receipt는 닫힌 카운터 기록으로만 사용 | pass | 없음 |
| 방송 장악 | `e02_app_006`~`e02_app_010`, `e02_app_020`~`e02_app_023` | billboard/caption/studio_log는 지연/잔향으로만 사용 | pass | 없음 |
| 정답 공개 | `e02_app_007`, `e02_app_009`, `e02_app_020`, `e02_app_022` | 자막은 잘림/정정 지연만 표시 | pass | 없음 |
| 수리/강화 UI | `e02_app_028`~`e02_app_030` | inspection_sheet는 리콜 흔적으로만 사용 | pass | 없음 |
| 안전지대/회복소 | `e02_app_031`~`e02_app_033` | shelter_speaker는 불안정 안내로만 사용 | pass | 없음 |
| 가족 구출 퀘스트 | `e02_app_034`~`e02_app_036` | commuter_pass_log는 가족권 압력만 표시 | pass | 없음 |
| 플레이어블 해금 대체 | 전체 | protected_playable이 각 행에 남아 있음 | pass | 없음 |
| 실명 지리/회사 노출 | 전체 | placement_node가 캠페인식 위치명만 사용 | pass | 없음 |

---

## 11. QA 실패 처리 규칙

```text
QA 실패가 있어도 새 NPC, 새 문구, 새 ID를 만들지 않는다.
실패 항목은 기존 application_id, reaction_id, object_text_id를 가리켜 수정 지시만 남긴다.
수정 지시는 "삭제", "노출 조건 강화", "protected_playable 보강", "display_surface 변경", "reaction-only 유지" 중 하나로 제한한다.
스토리 본문이나 퀘스트 본문으로 해결하지 않는다.
```

수정 지시 허용값:

| 지시 | 사용 조건 |
|---|---|
| 삭제 | 금지 해금처럼 보이는 행을 구현 범위에서 제외할 때 |
| 노출 조건 강화 | 표시 시점이 너무 이르거나 직접 해금처럼 보일 때 |
| protected_playable 보강 | 보호 대상이 표에 있지만 qa_guard가 약할 때 |
| display_surface 변경 | 직접 대면/상점/튜토리얼처럼 오해되는 표면일 때 |
| reaction-only 유지 | 오브젝트 문구로 억지 승격될 위험이 있을 때 |

---

## 12. 최종 판정

```text
통과.
구현 전 QA 기준을 모두 통과한다.
새 NPC, 새 ID, 새 문구, 금지 해금, 플레이어블 기능 침범은 발견되지 않았다.
```

---

## 13. 다음 작업 포인터

완료된 후속 문서:
`story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md`
`story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md`
`story/03_regions/e02_first_slice_engine_data_package_v0_1.md`
`story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md`

| 판정 | 다음 작업 |
|---|---|
| 통과 | 완료. E02 첫 외부 슬라이스 엔진 데이터 패키지 |
| 조건부 통과 | `story/03_regions/e02_first_slice_npc_qa_patch_v0_1.md` |
| 보류 | `story/03_regions/e02_first_slice_state_object_data_application_v0_1.md` 수정 지시 |

권장 다음 작업:

```text
E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건을 해소한다.
단, 조건 해소 전 실제 data/e02/*.json 파일 생성은 금지한다.
```
