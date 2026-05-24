# E02 첫 외부 슬라이스 엔진 데이터 변환 전 검증 v0.1

## 0. 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 엔진 데이터 작성 전 검증 문서.
새 NPC 제작 아님.
새 문구 제작 아님.
실제 엔진 코드 작성 아님.
실제 JSON/CSV 작성 아님.

판정:
변환 프롬프트 작성 가능
```

---

## 1. 입력 산출물 잠금 확인

| 항목 | 기준 | 확인 결과 | 판정 |
|---|---:|---:|---|
| 대상 수 | 9개 | 9개 | 통과 |
| application_id | 36개 | 36개 | 통과 |
| reaction_id | 36개 | 36개 | 통과 |
| object_text_id | 18개 | 18개 | 통과 |
| reaction-only | 8행 | 8행 | 통과 |
| 직접 대면 | 2행 | 2행 | 통과 |
| 플래그 | 11개 | 11개 | 통과 |
| 상태 키 | 12개 | 12개 | 통과 |
| 플레이어블 보호 대상 | 12개 | 12개 | 통과 |

검증 범위:

```text
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md 기준.
실제 엔진 데이터 작성 전 마지막 Markdown 검산이다.
이번 문서에서 실제 엔진 코드, JSON, CSV, Godot 리소스 파일은 만들지 않는다.
```

---

## 2. 소스 일치성 검증

| source_pair | must_match | mismatch_check | result | fix_instruction |
|---|---|---|---|---|
| schema handoff vs QA checklist | 수량/금지 해금 | 누락/초과 ID 없음 | pass | 없음 |
| schema handoff vs data application | 36 application mapping | 필드 값 차이 없음 | pass | 없음 |
| schema handoff vs state reaction matrix | 36 reaction_id | 반응 ID 누락 없음 | pass | 없음 |
| schema handoff vs object text bank | 18 object_text_id | 문구 ID 누락 없음 | pass | 없음 |
| schema handoff vs implementation scope | 직접 대면/보류 범위 | 직접 대면 초과 없음 | pass | 없음 |

---

## 3. ID 범위 검증

| id_type | required_range | actual_range | missing | duplicate | overflow | result |
|---|---|---|---|---|---|---|
| application_id | `e02_app_001~036` | `e02_app_001~036` | 없음 | 없음 | 없음 | pass |
| reaction_id | `e02_sr_001~036` | `e02_sr_001~036` | 없음 | 없음 | 없음 | pass |
| object_text_id | `e02_obj_001~018` | `e02_obj_001~018` | 없음 | 없음 | 없음 | pass |

판정:

```text
missing, duplicate, overflow 없음.
reaction-only는 object_text_id 범위에 포함하지 않는다.
```

---

## 4. application 필드 검증

| application_id | reaction_id | object_text_id | application_type_check | target_seed_check | display_surface_check | phase_check | guard_check | result |
|---|---|---|---|---|---|---|---|---|
| `e02_app_001` | `e02_sr_001` | `e02_obj_001` | pass | pass | locker_ui pass | first_seen pass | RETURN-05/보상 상자 금지 | pass |
| `e02_app_002` | `e02_sr_002` | `e02_obj_005` | pass | pass | collection_room_light pass | pre_boss pass | GATE-09/빠른 이동 금지 | pass |
| `e02_app_003` | `e02_sr_003` | reaction-only | pass | pass | direct_encounter pass | first_seen pass | RETURN-05/직접 대면 1회 | pass |
| `e02_app_004` | `e02_sr_004` | `e02_obj_002` | pass | pass | locker_ui pass | post_boss pass | RETURN-05/반품 상점 금지 | pass |
| `e02_app_005` | `e02_sr_005` | `e02_obj_004` | pass | pass | hub_reaction pass | hub_after_return pass | 미나, 복희/이름 해금 금지 | pass |
| `e02_app_006` | `e02_sr_006` | `e02_obj_006` | pass | pass | billboard pass | first_seen pass | BROAD-10/방송 장악 금지 | pass |
| `e02_app_007` | `e02_sr_007` | `e02_obj_009` | pass | pass | caption pass | post_boss pass | BROAD-10/세계 진실 설명 금지 | pass |
| `e02_app_008` | `e02_sr_008` | `e02_obj_007` | pass | pass | billboard pass | optional_trace pass | QUIET-07, BROAD-10/튜토리얼 금지 | pass |
| `e02_app_009` | `e02_sr_009` | `e02_obj_008` | pass | pass | caption pass | optional_trace pass | 세븐, 복희/도감 정답 금지 | pass |
| `e02_app_010` | `e02_sr_010` | `e02_obj_010` | pass | pass | studio_log pass | pre_boss pass | BROAD-10/수신태그 보상 금지 | pass |
| `e02_app_011` | `e02_sr_011` | reaction-only | pass | pass | direct_encounter pass | first_seen pass | GATE-09/빠른 이동 금지 | pass |
| `e02_app_012` | `e02_sr_012` | `e02_obj_011` | pass | pass | gate_log pass | pre_boss pass | GATE-09/해금 판정 대체 금지 | pass |
| `e02_app_013` | `e02_sr_013` | `e02_obj_014` | pass | pass | pass_reader pass | revisit pass | GATE-09/플랫폼 구출 금지 | pass |
| `e02_app_014` | `e02_sr_014` | `e02_obj_013` | pass | pass | platform_list pass | post_boss pass | GATE-09/HP 0 처리 대체 금지 | pass |
| `e02_app_015` | `e02_sr_015` | reaction-only | pass | pass | billboard pass | optional_trace pass | GATE-09/인양 안정 보상 금지 | pass |
| `e02_app_016` | `e02_sr_016` | `e02_obj_015` | pass | pass | receipt pass | revisit pass | RETURN-05/판매 교환 금지 | pass |
| `e02_app_017` | `e02_sr_017` | `e02_obj_004` | pass | pass | locker_log pass | revisit pass | RETURN-05/미수령품 보상 금지 | pass |
| `e02_app_018` | `e02_sr_018` | `e02_obj_005` | pass | pass | collection_room_light pass | optional_trace pass | RETURN-05/점원 NPC화 금지 | pass |
| `e02_app_019` | `e02_sr_019` | reaction-only | pass | pass | receipt pass | revisit pass | RETURN-05/상점 개방 금지 | pass |
| `e02_app_020` | `e02_sr_020` | `e02_obj_008` | pass | pass | caption pass | optional_trace pass | BROAD-10/정답 송출 금지 | pass |
| `e02_app_021` | `e02_sr_021` | `e02_obj_007` | pass | pass | billboard pass | optional_trace pass | BROAD-10/방송 해킹 금지 | pass |
| `e02_app_022` | `e02_sr_022` | `e02_obj_009` | pass | pass | caption pass | revisit pass | BROAD-10/공식 안내 버프 금지 | pass |
| `e02_app_023` | `e02_sr_023` | reaction-only | pass | pass | studio_log pass | optional_trace pass | BROAD-10/노라 기능 선점 금지 | pass |
| `e02_app_024` | `e02_sr_024` | `e02_obj_014` | pass | pass | pass_reader pass | revisit pass | GATE-09/무료 재통과 금지 | pass |
| `e02_app_025` | `e02_sr_025` | `e02_obj_012` | pass | pass | pass_reader pass | revisit pass | GATE-09/개찰 튜토리얼 금지 | pass |
| `e02_app_026` | `e02_sr_026` | `e02_obj_013` | pass | pass | platform_list pass | post_boss pass | GATE-09/해금 장면 대체 금지 | pass |
| `e02_app_027` | `e02_sr_027` | reaction-only | pass | pass | billboard pass | optional_trace pass | GATE-09/빠른 이동 안내 금지 | pass |
| `e02_app_028` | `e02_sr_028` | `e02_obj_016` | pass | pass | inspection_sheet pass | optional_trace pass | PATCH, RIO/로봇 동료 금지 | pass |
| `e02_app_029` | `e02_sr_029` | `e02_obj_016` | pass | pass | inspection_sheet pass | optional_trace pass | METER, PATCH/강화 UI 금지 | pass |
| `e02_app_030` | `e02_sr_030` | `e02_obj_016` | pass | pass | inspection_sheet pass | optional_trace pass | PATCH, RIO/정품 복구 금지 | pass |
| `e02_app_031` | `e02_sr_031` | `e02_obj_017` | pass | pass | shelter_speaker pass | optional_trace pass | QUIET-07, BROAD-10/안전지대 금지 | pass |
| `e02_app_032` | `e02_sr_032` | reaction-only | pass | pass | shelter_speaker pass | optional_trace pass | RATION-16, 복희/회복소 금지 | pass |
| `e02_app_033` | `e02_sr_033` | `e02_obj_017` | pass | pass | shelter_speaker pass | optional_trace pass | QUIET-07/인양 안정화 금지 | pass |
| `e02_app_034` | `e02_sr_034` | `e02_obj_018` | pass | pass | commuter_pass_log pass | optional_trace pass | OPEN-HOST/R01 가족칸 반복 금지 | pass |
| `e02_app_035` | `e02_sr_035` | `e02_obj_018` | pass | pass | commuter_pass_log pass | optional_trace pass | GATE-09, OPEN-HOST/가족 구출 금지 | pass |
| `e02_app_036` | `e02_sr_036` | reaction-only | pass | pass | commuter_pass_log pass | optional_trace pass | OPEN-HOST/주거 튜토리얼 금지 | pass |

---

## 5. object text 필드 검증

| object_text_id | placement_node_check | linked_reactions_check | visibility_rule_check | replay_rule_check | forbidden_function_check | result |
|---|---|---|---|---|---|---|
| `e02_obj_001` | 캠페인식 장소명 pass | `e02_sr_001` pass | 보관함 최초 확인 pass | 변경 문구 유지 pass | 보상 상자 금지 pass | pass |
| `e02_obj_002` | 캠페인식 장소명 pass | `e02_sr_004` pass | 보관 연장 거부 후 pass | 거부 상태 유지 pass | 이름 해금 금지 pass | pass |
| `e02_obj_003` | 캠페인식 장소명 pass | `e02_sr_001`, `e02_sr_016` pass | 점검 패널 조사 pass | 누적형 pass | 반송 전투 대체 금지 pass | pass |
| `e02_obj_004` | 캠페인식 장소명 pass | `e02_sr_005`, `e02_sr_017` pass | 재방문 표시 pass | 보급소 반응 후보 유지 pass | 정답 분석 UI 금지 pass | pass |
| `e02_obj_005` | 캠페인식 장소명 pass | `e02_sr_002`, `e02_sr_018` pass | 회수실 진입 pass | 조명 패턴 유지 pass | 편의점 점원/빠른 이동 금지 pass | pass |
| `e02_obj_006` | 캠페인식 장소명 pass | `e02_sr_006` pass | 승인 지연 확인 pass | 프리보스 반복 pass | 정답 안내 금지 pass | pass |
| `e02_obj_007` | 캠페인식 장소명 pass | `e02_sr_008`, `e02_sr_021` pass | 반복 안내 차단 후 pass | 변경 문구 유지 pass | 방송 해킹 금지 pass | pass |
| `e02_obj_008` | 캠페인식 장소명 pass | `e02_sr_009`, `e02_sr_020` pass | 자막 조각 회수 전후 pass | 변경 문구 고정 pass | 세계 진실 공개 금지 pass | pass |
| `e02_obj_009` | 캠페인식 장소명 pass | `e02_sr_007`, `e02_sr_022` pass | 늦은 승인 후 pass | 포스트보스 유지 pass | 공식 안내 버프 금지 pass | pass |
| `e02_obj_010` | 캠페인식 장소명 pass | `e02_sr_010`, `e02_sr_023` pass | 로그 조사 pass | 누적형 pass | 아나운서 NPC 금지 pass | pass |
| `e02_obj_011` | 캠페인식 장소명 pass | `e02_sr_012`, `e02_sr_027` pass | 개찰 로그 확인 pass | 보류 상태 유지 pass | 해금 판정/빠른 이동 금지 pass | pass |
| `e02_obj_012` | 캠페인식 장소명 pass | `e02_sr_024`, `e02_sr_025` pass | 판독 실패 후 pass | 무료 통과 없음 pass | 무료 재통과 금지 pass | pass |
| `e02_obj_013` | 캠페인식 장소명 pass | `e02_sr_014`, `e02_sr_026` pass | 잔류 흔적 보존 후 pass | 포스트보스 선명화 pass | HP 0 처리 대체 금지 pass | pass |
| `e02_obj_014` | 캠페인식 장소명 pass | `e02_sr_013`, `e02_sr_024` pass | 대면/로그 후 pass | 통과 해금 없음 pass | 개찰 튜토리얼 금지 pass | pass |
| `e02_obj_015` | 캠페인식 장소명 pass | `e02_sr_016`, `e02_sr_019` pass | 연장 거부 후 pass | 재확인 가능 pass | 상점/교환 기능 금지 pass | pass |
| `e02_obj_016` | 캠페인식 장소명 pass | `e02_sr_028`, `e02_sr_029`, `e02_sr_030` pass | 검사표 조사 pass | 후속 반응 후보만 pass | 수리/강화 UI 금지 pass | pass |
| `e02_obj_017` | 캠페인식 장소명 pass | `e02_sr_031`, `e02_sr_032`, `e02_sr_033` pass | 대피실 접근 pass | 반복 보상 없음 pass | 회복소/안전지대 금지 pass | pass |
| `e02_obj_018` | 캠페인식 장소명 pass | `e02_sr_034`, `e02_sr_035`, `e02_sr_036` pass | 가족권 로그 조사 pass | 주거/통근 압력 유지 pass | 가족 구출 퀘스트 금지 pass | pass |

---

## 6. reaction-only 검증

| application_id | reaction_id | display_surface | expected_handling | object_text_id_check | result |
|---|---|---|---|---|---|
| `e02_app_003` | `e02_sr_003` | direct_encounter | reaction.line_or_change | reaction-only 유지 | pass |
| `e02_app_011` | `e02_sr_011` | direct_encounter | reaction.line_or_change | reaction-only 유지 | pass |
| `e02_app_015` | `e02_sr_015` | billboard | system_state_change_only | reaction-only 유지 | pass |
| `e02_app_019` | `e02_sr_019` | receipt | system_state_change_only | reaction-only 유지 | pass |
| `e02_app_023` | `e02_sr_023` | studio_log | reaction.line_or_change | reaction-only 유지 | pass |
| `e02_app_027` | `e02_sr_027` | billboard | system_state_change_only | reaction-only 유지 | pass |
| `e02_app_032` | `e02_sr_032` | shelter_speaker | system_state_change_only | reaction-only 유지 | pass |
| `e02_app_036` | `e02_sr_036` | commuter_pass_log | system_state_change_only | reaction-only 유지 | pass |

---

## 7. 직접 대면 제한 검증

| direct_encounter_application | target_seed | one_time_rule | repeat_block | forbidden_expansion_check | result |
|---|---|---|---|---|---|
| `e02_app_003` | `g_E02_C03_g5_001` | 보관함 앞 1회 | 반복 대면 차단 | 구출 컷신, 퀘스트 NPC화, 이름 확정 보상 없음 | pass |
| `e02_app_011` | `g_E02_C07_g5_001` | 막차 심사 플랫폼 1회 | 반복 대면 차단 | 빠른 이동, GATE-09 해금 대체 없음 | pass |

---

## 8. 플래그 read/set 검증

| flag | setter_check | readers_check | downstream_effect_check | forbidden_unlock_check | result |
|---|---|---|---|---|---|
| `e02_locker_expiry_seen` | `e02_app_001` pass | `e02_app_005`, `e02_app_017`, `e02_app_019` pass | 회수/보급소 반응 후보만 | 배송 전투, 이름 해금 없음 | pass |
| `e02_last_train_missed` | `e02_app_002` 또는 E02_C07 입장 트리거 pass | `e02_app_011`, `e02_app_015`, `e02_app_018`, `e02_app_027`, `e02_app_036` pass | 막차 후 압력만 | 빠른 이동, 무료 환승 없음 | pass |
| `e02_locker_recipient_spoken` | `e02_app_003` pass | 없음 pass | 제한 대면 완료만 | 반복 대면, 구출 장면 없음 | pass |
| `e02_locker_extension_refused` | `e02_app_004` pass | `e02_app_016` pass | 호출 로그 약화 | 반품 상점, 즉시 보상 없음 | pass |
| `e02_disaster_phrase_delayed` | `e02_app_006` pass | `e02_app_010`, `e02_app_023` pass | 승인 지연/수신 압력 | 방송 장악, 정답 송출 없음 | pass |
| `e02_caption_cut_recovered` | `e02_app_009` pass | `e02_app_020` pass | 자막 보존/편집자 반응 | 세계 진실 공개 없음 | pass |
| `e02_guidance_loop_muted` | `e02_app_008` pass | `e02_app_021`, `e02_app_031` pass | 반복 안내 차단 후 압력 | 낮은 수신 튜토리얼, 안전지대 없음 | pass |
| `e02_phrase_approved_too_late` | `e02_app_007` pass | `e02_app_022` pass | 늦은 승인 후폭풍 | 공식 안내 버프 없음 | pass |
| `e02_gate_unpassed_log_seen` | `e02_app_012` pass | `e02_app_024`, `e02_app_035` pass | 정기권/가족권 판독으로 번짐 | 해금 대체, 빠른 이동 없음 | pass |
| `e02_transfer_hold_spoken` | `e02_app_011` pass | `e02_app_013`, `e02_app_025` pass | 판독기 반응 변화 | 플랫폼 구출, 개찰 튜토리얼 없음 | pass |
| `e02_platform_residue_preserved` | `e02_app_014` pass | `e02_app_026` pass | 잔류 명단 보존 | HP 0 처리 대체 없음 | pass |

---

## 9. 상태 키 검증

| state_key | usage_check | read_or_mutating_check | allowed_effect_check | forbidden_effect_check | result |
|---|---|---|---|---|---|
| `delivery_state` | 3개 application pass | mutating candidate pass | 보관/연장/회수 기록 변화만 | 배송 전투, 상점 보상 없음 | pass |
| `passage_tag` | 5개 application pass | read mostly pass | 막차/개찰/가족권 판정 지연만 | 빠른 이동, 무료 통과 없음 | pass |
| `signal_tag` | 6개 application pass | read mostly pass | 비콘/신호 어긋남만 | 수신태그 보상, 정답 공개 없음 | pass |
| `signal_stability` | 3개 application pass | read mostly pass | 전광판/자막/대피소 안내 변화만 | 방송 장악, 안전지대 없음 | pass |
| `campaign_density` | 5개 application pass | mutating candidate pass | 캠페인 압력/잔향 선명화만 | 보스 해금, 정답 설명 없음 | pass |
| `human_stability` | 5개 application pass | read mostly pass | 불안정 문구와 후폭풍만 | 회복소, 안정도 보상 없음 | pass |
| `trace_preservation` | 4개 application pass | mutating candidate pass | 흔적 보존만 | 본명 해금, 구출 확정 없음 | pass |
| `robot_autonomy` | 1개 application pass | read mostly pass | 리콜 사유 표시만 | 로봇 동료 추가, PATCH 대체 없음 | pass |
| `charge_tag` | 1개 application pass | read only pass | 검수 압력만 | 충전/강화 UI 없음 | pass |
| `extraction_stability` | 1개 application pass | read mostly pass | 인양 단서 약화만 | 긴급 인양 안정화 없음 | pass |
| `residence_tag` | 1개 application pass | read mostly pass | 세대 갱신/가족권 재판독만 | OPEN-HOST 주거 안내 대체 없음 | pass |
| `supply_pressure` | 1개 application pass | read mostly pass | 보급 압력과 상태 지연만 | 보급 상점, 회복소 없음 | pass |

---

## 10. enum 검증

| enum | allowed_values_source | observed_values | invalid_values | result |
|---|---|---|---|---|
| application_type | schema handoff | object_text, direct_encounter, hub_reaction_candidate, device_voice, ambient_log, reaction_only | 없음 | pass |
| display_surface | schema handoff | locker_ui, collection_room_light, direct_encounter, hub_reaction, billboard, caption, studio_log, gate_log, pass_reader, platform_list, receipt, locker_log, inspection_sheet, shelter_speaker, commuter_pass_log | 없음 | pass |
| implementation_phase | schema handoff | first_seen, pre_boss, post_boss, optional_trace, revisit, hub_after_return | 없음 | pass |
| protected_playable | schema handoff | GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO, 미나, 복희, 세븐, RATION-16 | 없음 | pass |
| forbidden_unlock | schema handoff | 새 NPC, 빠른 이동, 무료 재통과, 상점/교환 기능, 배송 전투, 방송 장악, 정답 공개, 공식 안내 버프, 수리/강화 UI, 로봇 동료 추가, 안전지대/회복소, 보급 상점, 가족 구출 퀘스트, 주거 튜토리얼, 플레이어블 해금 대체, 실명 지리/회사 노출 | 없음 | pass |

---

## 11. 플레이어블 보호 검증

| protected_playable | protected_function | related_applications_check | fail_condition_check | result |
|---|---|---|---|---|
| GATE-09 | 막차, 개찰, 환승, 플랫폼 잔류 | 관련 application 유지 | 빠른 이동/무료 재통과/해금 장면 없음 | pass |
| BROAD-10 | 방재 문구, 전광판, 정정 자막 | 관련 application 유지 | 방송 장악/정답 송출/공식 안내 버프 없음 | pass |
| RETURN-05 | 보관 만료, 회수 카운터, 미수령품 | 관련 application 유지 | 배송 전투/반품 상점/보상 상자 없음 | pass |
| QUIET-07 | 낮은 수신, 무음 대피소, 약한 인양 | 관련 application 유지 | 안전지대/회복소/낮은 수신 튜토리얼 없음 | pass |
| OPEN-HOST | 가족/주거 안내와 동선 기능 | 관련 application 유지 | 주거 튜토리얼/가족 구출 퀘스트 없음 | pass |
| PATCH | 보급소 수리 로봇, 자기부품화 | 관련 application 유지 | 수리 NPC/로봇 동료 추가 없음 | pass |
| METER | 충전/계량/차단 전투 | 관련 application 유지 | 충전/강화 UI 없음 | pass |
| RIO | 정품 판정, 로봇 체류 압력 | 관련 application 유지 | 정품 복구/객실 판정 설명 없음 | pass |
| 미나 | 보급소 상태 반응과 귀환 후 정리 | 관련 application 유지 | 정답 안내/안전 귀환 보장 없음 | pass |
| 복희 | 이름/흔적 감정과 기억 보존 | 관련 application 유지 | 이름 해금/회복소/정답 해설 없음 | pass |
| 세븐 | 지역 정보, 도감, 회수 목표 추천 | 관련 application 유지 | 도감 정답 판정/목표 자동 추천 없음 | pass |
| RATION-16 | 보급권/대피소 보급 압력 후속 | 관련 application 유지 | 보급 상점/식량 회복소 없음 | pass |

---

## 12. 후속 엔진 파일 후보 게이트

| future_engine_file_candidate | source_section | create_now_check | result |
|---|---|---|---|
| `data/e02/first_slice_applications.*` | application 매핑 전달표 | no | pass |
| `data/e02/first_slice_object_texts.*` | object text 매핑 전달표 | no | pass |
| `data/e02/first_slice_reactions.*` | reaction record 후보 | no | pass |
| `data/e02/first_slice_flags.*` | flag record 후보 | no | pass |
| `data/e02/first_slice_state_keys.*` | state key record 후보 | no | pass |
| `data/e02/first_slice_validation.*` | 변환 전 검증 후보 | no | pass |

판정:

```text
후속 엔진 파일 후보는 전부 create_now no다.
이번 문서에서 실제 파일을 만들지 않는다.
```

---

## 13. 금지 해금 회귀 검증

| forbidden_unlock | evidence_to_check | related_applications | result | fix_instruction |
|---|---|---|---|---|
| 새 NPC | target_seed 9개 외 추가 없음 | 전체 | pass | 없음 |
| 빠른 이동 | passage_tag는 판정 지연으로만 사용 | `e02_app_002`, `e02_app_011`, `e02_app_012`, `e02_app_027`, `e02_app_035` | pass | 없음 |
| 무료 재통과 | pass_reader는 재판독/압력만 표시 | `e02_app_024`, `e02_app_025` | pass | 없음 |
| 상점/교환 기능 | receipt는 닫힌 카운터 기록만 표시 | `e02_app_016`, `e02_app_019` | pass | 없음 |
| 배송 전투 | delivery_state는 보관/회수 기록 변화만 표시 | `e02_app_001`, `e02_app_004`, `e02_app_016` | pass | 없음 |
| 방송 장악 | billboard/caption/studio_log는 지연/잔향만 표시 | `e02_app_006`~`e02_app_010`, `e02_app_020`~`e02_app_023` | pass | 없음 |
| 정답 공개 | 자막은 잘림/정정 지연만 표시 | `e02_app_007`, `e02_app_009`, `e02_app_020`, `e02_app_022` | pass | 없음 |
| 공식 안내 버프 | 승인 문구는 후폭풍만 남김 | `e02_app_022` | pass | 없음 |
| 수리/강화 UI | inspection_sheet는 리콜 흔적만 표시 | `e02_app_028`~`e02_app_030` | pass | 없음 |
| 로봇 동료 추가 | robot_autonomy는 리콜 사유로만 표시 | `e02_app_028` | pass | 없음 |
| 안전지대/회복소 | shelter_speaker는 불안정 안내만 표시 | `e02_app_031`~`e02_app_033` | pass | 없음 |
| 보급 상점 | supply_pressure는 보급 압력만 표시 | `e02_app_032` | pass | 없음 |
| 가족 구출 퀘스트 | commuter_pass_log는 가족권 압력만 표시 | `e02_app_034`~`e02_app_036` | pass | 없음 |
| 주거 튜토리얼 | residence_tag는 세대 갱신 압력만 표시 | `e02_app_034`, `e02_app_036` | pass | 없음 |
| 플레이어블 해금 대체 | protected_playable은 보호 필드로만 사용 | 전체 | pass | 없음 |
| 실명 지리/회사 노출 | placement_node가 캠페인식 장소명만 사용 | 전체 | pass | 없음 |

---

## 14. 변환 차단 이슈 목록

| issue_id | severity | source | blocking_reason | required_fix | owner_track |
|---|---|---|---|---|---|
| 없음 | 없음 | 없음 | 차단 이슈 없음 | 없음 | 없음 |

---

## 15. 구현 전 최종 체크리스트

```text
[x] e02_app_001~036이 모두 정확히 1회 있다.
[x] e02_sr_001~036이 모두 정확히 1회 있다.
[x] e02_obj_001~018이 모두 정확히 1회 있다.
[x] e02_app_037, e02_sr_037, e02_obj_019 이상이 없다.
[x] reaction-only 8행에 object_text_id가 생기지 않았다.
[x] 직접 대면은 e02_app_003, e02_app_011뿐이다.
[x] 플래그 11개가 기존 read/set 그래프를 유지한다.
[x] 상태 키 12개가 기존 허용 효과만 가진다.
[x] enum invalid value가 없다.
[x] 플레이어블 보호 대상 12개가 빠지지 않았다.
[x] 금지 해금이 하나도 없다.
[x] 후속 엔진 파일 후보는 create_now no로만 남았다.
[x] 실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성하지 않았다.
```

---

## 16. 최종 판정

```text
엔진 데이터 패키지 작성 완료:
스키마 전달 문서와 변환 전 검증 기준을 Markdown 내부 parseable JSON 패키지로 이전했다.
새 ID, 누락/중복, reaction-only 승격, 직접 대면 초과, 금지 해금, 실제 엔진 파일 생성은 발견되지 않았다.
```

---

## 17. 다음 작업 포인터

완료된 후속 문서:
`docs/world/E02_FIRST_SLICE_ENGINE_DATA_WRITING_TEAM_PROMPT_V0_1.md`
`story/03_regions/e02_first_slice_engine_data_package_v0_1.md`
`story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md`

| 판정 | 다음 작업 |
|---|---|
| 변환 프롬프트 작성 가능 | 완료. E02 첫 외부 슬라이스 엔진 데이터 패키지 |
| 조건부 보완 | `story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_patch_v0_1.md` |
| 보류 | `story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md` 또는 `story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md` 수정 지시 |

권장 다음 작업:

```text
E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건을 해소한다.
조건 해소 전 실제 data/e02/*.json 파일 생성은 금지한다.
```
