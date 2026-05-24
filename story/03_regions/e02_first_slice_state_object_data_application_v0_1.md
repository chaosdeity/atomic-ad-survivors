# E02 첫 외부 슬라이스 상태/오브젝트 데이터 적용표 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 상태 반응과 오브젝트 문구의 구현 데이터 적용표.
새 NPC 제작 아님.
새 오브젝트 문구 제작 아님.
엔진 코드 작성 아님.

판정:
통과
```

---

## 1. 입력 산출물 검산

| 항목 | 기준 | 결과 |
|---|---:|---:|
| 상태 반응 ID | 36개 | 36개 |
| 오브젝트 문구 ID | 18개 | 18개 |
| 새 NPC | 0명 | 0명 |
| 새 오브젝트 ID | 0개 | 0개 |
| 직접 대면 반응 | 최대 2행 | 2행 |
| reaction-only 항목 | 허용 | 8행 |

검산 기준:

```text
상태 반응은 e02_sr_001부터 e02_sr_036까지 모두 포함한다.
오브젝트 문구는 e02_obj_001부터 e02_obj_018까지 모두 포함한다.
다음 순번의 새 상태 반응 ID나 새 오브젝트 문구 ID를 만들지 않는다.
오브젝트 문구가 없는 직접 대면/반응 전용 항목은 reaction-only로 둔다.
```

---

## 2. 데이터 적용 메인 테이블

| application_id | reaction_id | object_text_id | application_type | target_seed | campaign | trigger_state | trigger_flag | condition_expression | display_surface | text_source | state_result | flag_result | implementation_phase | protected_playable | qa_guard |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `e02_app_001` | `e02_sr_001` | `e02_obj_001` | object_text | `g_E02_C03_g5_001` | E02_C03 | `delivery_state` | `e02_locker_expiry_seen` | 보관 만료 UI 최초 확인 | locker_ui | object.changed_text | 보관함은 닫힌 채 수신태그 부담을 올린다 | read `e02_locker_expiry_seen` | first_seen | RETURN-05 | 보상 상자나 택배 퀘스트로 변환 금지 |
| `e02_app_002` | `e02_sr_002` | `e02_obj_005` | object_text | `g_E02_C03_g5_001` | E02_C03 | `passage_tag` | `e02_last_train_missed` | 막차 뒤 회수실 진입 | collection_room_light | object.changed_text | 물건 칸 점등으로 통행 기록 우선 보존 | read `e02_last_train_missed` | pre_boss | GATE-09 | 빠른 이동, 환승 해금 금지 |
| `e02_app_003` | `e02_sr_003` | reaction-only | direct_encounter | `g_E02_C03_g5_001` | E02_C03 | `trace_preservation` | `e02_locker_recipient_spoken` | 보관함 앞 제한 대면 1회 | direct_encounter | reaction.line_or_change | 이름 공개 없이 보관 흔적만 보존 | set `e02_locker_recipient_spoken` | first_seen | RETURN-05 | 새 오브젝트 문구 추가 금지. 직접 대면 1회 이하 |
| `e02_app_004` | `e02_sr_004` | `e02_obj_002` | object_text | `g_E02_C03_g5_001` | E02_C03 | `delivery_state` | `e02_locker_extension_refused` | 보관 연장 거부 | locker_ui | object.changed_text | 수취인 호출 로그가 약화된다 | set/read `e02_locker_extension_refused` | post_boss | RETURN-05 | 반품 상점, 즉시 구원 금지 |
| `e02_app_005` | `e02_sr_005` | `e02_obj_004` | hub_reaction_candidate | `g_E02_C03_g5_001` | E02_C03 | `signal_tag` | `e02_locker_expiry_seen` | 보급소 수신태그 낮음 | hub_reaction | reaction.line_or_change | 보급소 반응 후보만 열고 구조는 열지 않는다 | read `e02_locker_expiry_seen` | hub_after_return | 미나, 복희 | 정답 안내, 이름 해금 금지 |
| `e02_app_006` | `e02_sr_006` | `e02_obj_006` | object_text | `g_E02_C05_g5_001` | E02_C05 | `signal_stability` | `e02_disaster_phrase_delayed` | 승인 지연 최초 확인 | billboard | object.changed_text | 방송 지연과 등록 압력을 동시에 늦춘다 | set/read `e02_disaster_phrase_delayed` | first_seen | BROAD-10 | 방송 장악, 아나운서 NPC 금지 |
| `e02_app_007` | `e02_sr_007` | `e02_obj_009` | object_text | `g_E02_C05_g5_001` | E02_C05 | `campaign_density` | `e02_phrase_approved_too_late` | 캠페인 농도 상승 | caption | object.changed_text | 늦은 승인 문구를 잔향으로 보존한다 | set/read `e02_phrase_approved_too_late` | post_boss | BROAD-10 | 세계 진실 설명 금지 |
| `e02_app_008` | `e02_sr_008` | `e02_obj_007` | device_voice | `g_E02_C05_g5_001` | E02_C05 | `human_stability` | `e02_guidance_loop_muted` | 인간 안정도 낮음, 반복 안내 차단 | billboard | object.changed_text | 반복 차단 후 불안정한 침묵을 남긴다 | set/read `e02_guidance_loop_muted` | optional_trace | QUIET-07, BROAD-10 | 낮은 수신 튜토리얼 금지 |
| `e02_app_009` | `e02_sr_009` | `e02_obj_008` | object_text | `g_E02_C05_g5_001` | E02_C05 | `trace_preservation` | `e02_caption_cut_recovered` | 잘린 자막 조각 회수 | caption | object.changed_text | 정정 자막을 보존하고 보급소 반응 후보를 연다 | set/read `e02_caption_cut_recovered` | optional_trace | 세븐, 복희 | 도감 정답 판정 금지 |
| `e02_app_010` | `e02_sr_010` | `e02_obj_010` | object_text | `g_E02_C05_g5_001` | E02_C05 | `signal_tag` | `e02_disaster_phrase_delayed` | 수신태그 부족 | studio_log | object.default_text | 안내가 줄고 보급소 비콘이 흔들린다 | read `e02_disaster_phrase_delayed` | pre_boss | BROAD-10 | 수신태그 보상 금지 |
| `e02_app_011` | `e02_sr_011` | reaction-only | direct_encounter | `g_E02_C07_g5_001` | E02_C07 | `passage_tag` | `e02_last_train_missed` | 막차 종료 후 플랫폼 진입 | direct_encounter | reaction.line_or_change | GATE-09 전 압력을 올리되 이동 기능은 열지 않는다 | read `e02_last_train_missed`; may set `e02_transfer_hold_spoken` | first_seen | GATE-09 | 빠른 이동, 역무원 선역화 금지 |
| `e02_app_012` | `e02_sr_012` | `e02_obj_011` | ambient_log | `g_E02_C07_g5_001` | E02_C07 | `passage_tag` | `e02_gate_unpassed_log_seen` | 개찰 미통과 로그 확인 | gate_log | object.changed_text | 통행태그 압박을 보류 상태로 표시한다 | set/read `e02_gate_unpassed_log_seen` | pre_boss | GATE-09 | 해금 판정 대체 금지 |
| `e02_app_013` | `e02_sr_013` | `e02_obj_014` | device_voice | `g_E02_C07_g5_001` | E02_C07 | `human_stability` | `e02_transfer_hold_spoken` | 보류관 대면 후 인간 안정도 낮음 | pass_reader | reaction.line_or_change | 잔류 명단이 선명해지지만 안심은 주지 않는다 | read `e02_transfer_hold_spoken` | revisit | GATE-09 | 플랫폼 구출 장면 금지 |
| `e02_app_014` | `e02_sr_014` | `e02_obj_013` | object_text | `g_E02_C07_g5_001` | E02_C07 | `campaign_density` | `e02_platform_residue_preserved` | 잔류 흔적 보존 선택 | platform_list | object.default_text | 잔류표를 보존하고 캠페인 농도를 올린다 | set/read `e02_platform_residue_preserved` | post_boss | GATE-09 | HP 0 처리 대체 금지 |
| `e02_app_015` | `e02_sr_015` | reaction-only | reaction_only | `g_E02_C07_g5_001` | E02_C07 | `signal_tag` | `e02_last_train_missed` | 막차 안내 신호와 보급소 신호 충돌 | billboard | reaction.line_or_change | 보급소 인양 단서를 흔들리게 한다 | read `e02_last_train_missed` | optional_trace | GATE-09 | 인양 안정 보상 금지 |
| `e02_app_016` | `e02_sr_016` | `e02_obj_015` | object_text | `g_E02_C03_g4_001` | E02_C03 | `delivery_state` | `e02_locker_extension_refused` | 보관 연장 거부 후 카운터 접근 | receipt | object.default_text | 편의점은 상점이 아니라 회수 기록으로 남는다 | read `e02_locker_extension_refused` | revisit | RETURN-05 | 판매/교환 NPC 금지 |
| `e02_app_017` | `e02_sr_017` | `e02_obj_004` | device_voice | `g_E02_C03_g4_001` | E02_C03 | `signal_tag` | `e02_locker_expiry_seen` | 수신태그 낮음 | locker_log | reaction.line_or_change | 수취인 여부를 끝까지 확정하지 않는다 | read `e02_locker_expiry_seen` | revisit | RETURN-05 | 미수령품 보상 금지 |
| `e02_app_018` | `e02_sr_018` | `e02_obj_005` | ambient_log | `g_E02_C03_g4_001` | E02_C03 | `trace_preservation` | `e02_last_train_missed` | 막차 뒤 회수실 조명 확인 | collection_room_light | reaction.line_or_change | 물건 흔적만 남기고 인물 대면은 열지 않는다 | read `e02_last_train_missed` | optional_trace | RETURN-05 | 점원 NPC화 금지 |
| `e02_app_019` | `e02_sr_019` | reaction-only | reaction_only | `g_E02_C03_g4_001` | E02_C03 | `campaign_density` | `e02_locker_expiry_seen` | 캠페인 농도 상승 | receipt | reaction.line_or_change | 회수 압력을 배경으로 확산한다 | read `e02_locker_expiry_seen` | revisit | RETURN-05 | 상점 개방 금지 |
| `e02_app_020` | `e02_sr_020` | `e02_obj_008` | object_text | `g_E02_C05_g4_001` | E02_C05 | `signal_stability` | `e02_caption_cut_recovered` | 잘린 자막 조각 회수 | caption | reaction.line_or_change | 자막은 짧아지고 책임 문구가 길어진다 | read `e02_caption_cut_recovered` | optional_trace | BROAD-10 | 정답 송출 금지 |
| `e02_app_021` | `e02_sr_021` | `e02_obj_007` | object_text | `g_E02_C05_g4_001` | E02_C05 | `campaign_density` | `e02_guidance_loop_muted` | 반복 안내 일시 차단 | billboard | object.changed_text | 반복을 줄이되 남은 문구의 무게를 키운다 | read `e02_guidance_loop_muted` | optional_trace | BROAD-10 | 방송 해킹 금지 |
| `e02_app_022` | `e02_sr_022` | `e02_obj_009` | ambient_log | `g_E02_C05_g4_001` | E02_C05 | `human_stability` | `e02_phrase_approved_too_late` | 늦은 승인 후 인간 안정도 낮음 | caption | reaction.line_or_change | 안정도 회복 없이 정정 로그만 보존한다 | read `e02_phrase_approved_too_late` | revisit | BROAD-10 | 공식 안내 버프 금지 |
| `e02_app_023` | `e02_sr_023` | reaction-only | device_voice | `g_E02_C05_g4_001` | E02_C05 | `signal_tag` | `e02_disaster_phrase_delayed` | 수신태그 부족 | studio_log | reaction.line_or_change | 청취 확인 압력을 후속 지역 씨앗으로 남긴다 | read `e02_disaster_phrase_delayed` | optional_trace | BROAD-10 | 노라 기능 선점 금지 |
| `e02_app_024` | `e02_sr_024` | `e02_obj_014` | device_voice | `g_E02_C07_g4_001` | E02_C07 | `passage_tag` | `e02_gate_unpassed_log_seen` | 개찰 미통과 로그 후 판독기 접근 | pass_reader | reaction.line_or_change | 통행태그를 소모품이 아니라 판정 흔적으로 남긴다 | read `e02_gate_unpassed_log_seen` | revisit | GATE-09 | 무료 재통과 금지 |
| `e02_app_025` | `e02_sr_025` | `e02_obj_012` | device_voice | `g_E02_C07_g4_001` | E02_C07 | `human_stability` | `e02_transfer_hold_spoken` | 보류관 대면 후 인간 안정도 낮음 | pass_reader | reaction.line_or_change | 개찰 실패를 기록 압력으로 남긴다 | read `e02_transfer_hold_spoken` | revisit | GATE-09 | 개찰 튜토리얼 금지 |
| `e02_app_026` | `e02_sr_026` | `e02_obj_013` | ambient_log | `g_E02_C07_g4_001` | E02_C07 | `campaign_density` | `e02_platform_residue_preserved` | 잔류 명단 보존 | platform_list | reaction.line_or_change | 잔류표를 선명하게 하고 캠페인 농도를 올린다 | read `e02_platform_residue_preserved` | post_boss | GATE-09 | 해금 장면 대체 금지 |
| `e02_app_027` | `e02_sr_027` | reaction-only | reaction_only | `g_E02_C07_g4_001` | E02_C07 | `signal_tag` | `e02_last_train_missed` | 막차 안내 신호 약화 | billboard | reaction.line_or_change | 신호 약화를 길 안내가 아니라 판정 지연으로 표시한다 | read `e02_last_train_missed` | optional_trace | GATE-09 | 빠른 이동 안내 금지 |
| `e02_app_028` | `e02_sr_028` | `e02_obj_016` | object_text | `g_E02_C04_g4_001` | E02_C04 | `robot_autonomy` | 없음 | 로봇 자율성 상승 | inspection_sheet | object.changed_text | 자율성을 리콜 사유로 오독한다 | no flag | optional_trace | PATCH, RIO | 로봇 동료/수리 NPC 금지 |
| `e02_app_029` | `e02_sr_029` | `e02_obj_016` | object_text | `g_E02_C04_g4_001` | E02_C04 | `charge_tag` | 없음 | 충전태그 부족 | inspection_sheet | reaction.line_or_change | 차단/검수 압력만 남기고 강화는 열지 않는다 | no flag | optional_trace | METER, PATCH | 충전/강화 UI 금지 |
| `e02_app_030` | `e02_sr_030` | `e02_obj_016` | object_text | `g_E02_C04_g4_001` | E02_C04 | `trace_preservation` | 없음 | 리콜 라벨 조각 보존 | inspection_sheet | reaction.line_or_change | 사람 이름 없이 모델명 흔적만 남긴다 | no flag | optional_trace | PATCH, RIO | 정품 복구 설명 금지 |
| `e02_app_031` | `e02_sr_031` | `e02_obj_017` | device_voice | `g_E02_C08_g4_001` | E02_C08 | `signal_stability` | `e02_guidance_loop_muted` | 반복 차단 후 대피실 접근 | shelter_speaker | object.default_text | 낮은 수신을 안전과 구조 지연으로 동시에 읽힌다 | read `e02_guidance_loop_muted` | optional_trace | QUIET-07, BROAD-10 | 안전지대, 낮은 수신 튜토리얼 금지 |
| `e02_app_032` | `e02_sr_032` | reaction-only | reaction_only | `g_E02_C08_g4_001` | E02_C08 | `supply_pressure` | 없음 | 보급 압력 상승 | shelter_speaker | reaction.line_or_change | 보급품은 남지만 사람 상태 갱신은 늦어진다 | no flag | optional_trace | RATION-16, 복희 | 회복소/보급 상점 금지 |
| `e02_app_033` | `e02_sr_033` | `e02_obj_017` | device_voice | `g_E02_C08_g4_001` | E02_C08 | `extraction_stability` | 없음 | 인양 안정도 낮음 | shelter_speaker | object.changed_text | 보급소 인양 단서를 약하게 만든다 | no flag | optional_trace | QUIET-07 | 긴급 인양 안정화 금지 |
| `e02_app_034` | `e02_sr_034` | `e02_obj_018` | ambient_log | `g_E02_C01_g4_001` | E02_C01 | `residence_tag` | 없음 | 거주태그 흔들림 | commuter_pass_log | object.default_text | 가족권이 이동권보다 먼저 갱신된다 | no flag | optional_trace | OPEN-HOST | R01 가족칸 반복 금지 |
| `e02_app_035` | `e02_sr_035` | `e02_obj_018` | object_text | `g_E02_C01_g4_001` | E02_C01 | `passage_tag` | `e02_gate_unpassed_log_seen` | 개찰 미통과 로그 후 가족권 로그 접근 | commuter_pass_log | object.changed_text | 한 사람의 통행 실패를 가족 단위 기록으로 번지게 한다 | read `e02_gate_unpassed_log_seen` | optional_trace | GATE-09, OPEN-HOST | 빠른 이동, 가족 구출 금지 |
| `e02_app_036` | `e02_sr_036` | reaction-only | reaction_only | `g_E02_C01_g4_001` | E02_C01 | `human_stability` | `e02_last_train_missed` | 막차 종료 후 가족권 알림 확인 | commuter_pass_log | reaction.line_or_change | 안정도 회복 없이 가족/통근 압력만 남긴다 | read `e02_last_train_missed` | optional_trace | OPEN-HOST | 주거 튜토리얼, R01 재탕 금지 |

---

## 3. 오브젝트 배치 적용표

| object_text_id | object_group | campaign | placement_node | default_state | changed_state | reads_states | reads_flags | linked_reactions | visibility_rule | replay_rule | protected_playable | qa_guard |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| `e02_obj_001` | 역전 보관함 만료 UI | E02_C03 | 역전 보관함 앞 | 보관 만료 예정 | 수취인 상태 미확인, 물품 우선 보존 | `delivery_state` | `e02_locker_expiry_seen` | `e02_sr_001` | 보관함 최초 확인 시 표시 | 재방문 시 변경 문구 유지 | RETURN-05 | 보상 상자 금지 |
| `e02_obj_002` | 역전 보관함 만료 UI | E02_C03 | 보관 연장 선택창 | 연장 승인 전 | 연장 거부 기록, 호출 로그 접힘 | `delivery_state` | `e02_locker_extension_refused` | `e02_sr_004` | 보관 연장 거부 선택 후 표시 | 후속 방문에서 거부 상태 유지 | RETURN-05, 복희 | 이름 해금 금지 |
| `e02_obj_003` | 보관함 만료 로그 | E02_C03 | 보관함 측면 점검 패널 | 수령 가능 시간 초과 | 회수 지연, 재호출 실패 | `delivery_state` | 없음 | `e02_sr_001`, `e02_sr_016` | 점검 패널 조사 시 표시 | 상태가 바뀌어도 로그는 누적형 | RETURN-05 | 반송 전투 대체 금지 |
| `e02_obj_004` | 보관함 만료 로그 | E02_C03 | 막차 후 보관함 재방문 | 알림 송신 완료 | 보급소 비콘 혼입 | `signal_tag` | `e02_locker_expiry_seen` | `e02_sr_005`, `e02_sr_017` | 만료 확인 후 재방문 시 표시 | 보급소 귀환 후 반응 후보 유지 | 미나, 세븐, RETURN-05 | 정답 분석 UI 금지 |
| `e02_obj_005` | 막차 뒤 회수실 조명 | E02_C03 | 막차 뒤 회수실 | 선반 조명 점등 | 사람 감지 없음, 물품 칸만 점등 | `passage_tag`, `trace_preservation` | `e02_last_train_missed` | `e02_sr_002`, `e02_sr_018` | 막차 뒤 회수실 진입 시 표시 | 조명 패턴은 재방문마다 유지 | RETURN-05, GATE-09 | 편의점 점원/빠른 이동 금지 |
| `e02_obj_006` | 반복 전광판 | E02_C05 | 방재 생방송권 입구 | 승인 대기 | 대피 완료 표기 보류 | `signal_stability` | `e02_disaster_phrase_delayed` | `e02_sr_006` | 승인 지연 확인 시 표시 | 프리보스 구간에서 반복 표시 | BROAD-10 | 정답 안내 금지 |
| `e02_obj_007` | 반복 전광판 | E02_C05 | 반복 안내 교차로 | 같은 안내 반복 | 반복 일시 중지, 이전 안내 유지 | `campaign_density`, `human_stability` | `e02_guidance_loop_muted` | `e02_sr_008`, `e02_sr_021` | 반복 안내 차단 후 표시 | 반복은 줄되 변경 문구 유지 | BROAD-10, QUIET-07 | 방송 해킹, 낮은 수신 튜토리얼 금지 |
| `e02_obj_008` | 잘린 방재 자막 | E02_C05 | 깨진 전광판 하단 | 잘린 대피 자막 | 안전 문구 승인 전 | `trace_preservation`, `signal_stability` | `e02_caption_cut_recovered` | `e02_sr_009`, `e02_sr_020` | 자막 조각 회수 전후 표시 | 회수 후 변경 문구 고정 | BROAD-10 | 세계 진실 공개 금지 |
| `e02_obj_009` | 잘린 방재 자막 | E02_C05 | 자막 조각 보관 화면 | 정정 예정 | 정정 대상 제외 문구 | `campaign_density`, `human_stability` | `e02_phrase_approved_too_late` | `e02_sr_007`, `e02_sr_022` | 늦은 승인 후 표시 | 포스트보스 재방문 시 유지 | BROAD-10 | 공식 안내 버프 금지 |
| `e02_obj_010` | 방재 스튜디오 송출 로그 | E02_C05 | 송출 지연 콘솔 | 송출 전 승인 필요 | 승인 완료, 송출 가능 시간 초과 | `signal_tag` | `e02_disaster_phrase_delayed`, `e02_phrase_approved_too_late` | `e02_sr_010`, `e02_sr_023` | 스튜디오 로그 조사 시 표시 | 지연 상태는 누적형 | BROAD-10 | 아나운서 NPC 금지 |
| `e02_obj_011` | 개찰 미통과 로그 | E02_C07 | 환승 게이트 뒤쪽 | 미통과, 실패 처리 전 | 미통과 보존, 환승 판정 대기 | `passage_tag`, `signal_tag` | `e02_gate_unpassed_log_seen` | `e02_sr_012`, `e02_sr_027` | 개찰 로그 확인 시 표시 | 보류 상태는 재방문 시 유지 | GATE-09 | 해금 판정/빠른 이동 금지 |
| `e02_obj_012` | 개찰 미통과 로그 | E02_C07 | 정기권 판독기 옆 | 통행태그 부족 | 표 상태가 먼저 닫힘 | `passage_tag`, `human_stability` | `e02_gate_unpassed_log_seen`, `e02_transfer_hold_spoken` | `e02_sr_024`, `e02_sr_025` | 정기권 판독 실패 후 표시 | 재판독해도 무료 통과 없음 | GATE-09 | 무료 재통과 금지 |
| `e02_obj_013` | 플랫폼 잔류 명단 | E02_C07 | 막차 심사 플랫폼 | 잔류 명단 접힘 | 잔류 명단 보존, 캠페인 농도 상승 | `campaign_density` | `e02_platform_residue_preserved` | `e02_sr_014`, `e02_sr_026` | 잔류 흔적 보존 선택 후 표시 | 포스트보스에서 더 선명히 표시 | GATE-09 | HP 0 처리 대체 금지 |
| `e02_obj_014` | 정기권 판독기 | E02_C07 | 개찰기 판독 실패 지점 | 매일권 확인 | 오늘의 사람 재판독 필요 | `passage_tag`, `human_stability` | `e02_transfer_hold_spoken`, `e02_gate_unpassed_log_seen` | `e02_sr_013`, `e02_sr_024` | 보류관 대면 또는 미통과 로그 후 표시 | 반복 판독은 가능하나 통과 해금 없음 | GATE-09 | 개찰 튜토리얼 금지 |
| `e02_obj_015` | 편의점 카운터 영수증/닫힌 셔터 | E02_C03 | 닫힌 편의점 카운터 | 카운터 마감 | 호출 번호만 영수증에 남음 | `delivery_state`, `trace_preservation` | `e02_locker_extension_refused` | `e02_sr_016`, `e02_sr_019` | 보관 연장 거부 후 표시 | 영수증 재확인 가능 | RETURN-05 | 상점/교환 기능 금지 |
| `e02_obj_016` | 리콜 검사표/미세부품 검사표 | E02_C04 | 미세부품 리콜 라인 | 미세 균열 회수 | 자율 판단 흔적 분리 회수 | `robot_autonomy`, `charge_tag`, `trace_preservation` | 없음 | `e02_sr_028`, `e02_sr_029`, `e02_sr_030` | 리콜 검사표 조사 시 표시 | 후속 로봇 반응 후보만 남김 | PATCH, METER, RIO | 수리/강화 UI 금지 |
| `e02_obj_017` | 무음 대피소 안내 스피커 | E02_C08 | 소등 후 대피실 | 안내 없음 정상 | 구조 요청 낮은 음량 보존 | `signal_stability`, `supply_pressure`, `extraction_stability` | `e02_guidance_loop_muted` | `e02_sr_031`, `e02_sr_032`, `e02_sr_033` | 대피실 접근 시 표시 | 안전지대처럼 반복 보상 없음 | QUIET-07, BROAD-10 | 회복소/안전지대 금지 |
| `e02_obj_018` | 가족 정기권 거래 로그/세대 갱신 알림 | E02_C01 | 가족 정기권 아파트 | 세대 갱신 후 재판독 | 미통과 가족권 임시 귀속 | `residence_tag`, `passage_tag`, `human_stability` | `e02_gate_unpassed_log_seen`, `e02_last_train_missed` | `e02_sr_034`, `e02_sr_035`, `e02_sr_036` | 가족권 로그 조사 시 표시 | 주거/통근 압력만 유지 | OPEN-HOST, GATE-09 | 가족 구출 퀘스트 금지 |

---

## 4. 플래그 적용 그래프

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

## 5. 상태 키 적용 사전

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

## 6. 구현 제외 목록

```text
새 NPC
새 v1.0 프로필
새 reaction_id
새 object_text_id
E02 전체 48개 씨앗 상세화
편의점 상점 NPC
지하철 빠른 이동
방송 장악 또는 정답 송출
미세부품 수리/강화 UI
무음 대피소 안전지대/회복지
가족 정기권 구출 퀘스트
실제 역명, 실제 회사명, 실제 도시명 노출
엔진 코드 작성
JSON/CSV 파일 작성
```

---

## 7. 구현팀 전달 요약

```text
E02 첫 슬라이스는 9개 기존 대상만 사용한다.
상태 반응은 36개다.
오브젝트 문구 ID는 18개다.
직접 대면은 마지막 보관함 수취인과 막차 환승 보류관 2행뿐이다.
object_text_id가 없는 반응은 reaction-only로 남긴다.
새 NPC와 새 오브젝트 ID를 만들지 않는다.
GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO 기능을 대체하지 않는다.
이번 문서는 Markdown 적용표이며 엔진 코드나 JSON/CSV가 아니다.
```

---

## 8. 검수 결과

```text
출력 문서:
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md

상태 반응 적용 행:
36행 / e02_sr_001~e02_sr_036 포함

오브젝트 배치 행:
18행 / e02_obj_001~e02_obj_018 포함

새 NPC:
0명

새 reaction_id:
0개

새 object_text_id:
0개

직접 대면:
2행 이하

판정:
통과
```

후속 QA:
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md

후속 스키마 전달:
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md

다음 작업:
E02 엔진 데이터 변환 전 검증

최종 판정:

```text
통과.
E02 첫 외부 슬라이스의 상태 반응과 오브젝트 문구는 새 ID 없이 구현 데이터 적용표로 연결했고, QA 체크리스트와 엔진 스키마화 전달 문서에서 통과 판정을 유지한다.
```
