# E02 First Slice Engine Data Pre-Conversion Validation Team Prompt v0.1

## 목적

이 프롬프트는 NPC/월드 구현 데이터 QA팀 또는 엔진 데이터 변환 전 검증팀에게 그대로 전달하는 작업 지시서다.

이번 작업은 실제 엔진 데이터 작성이 아니다. `E02 첫 외부 슬라이스 구현 데이터 전달/엔진 스키마화` 문서가 실제 엔진 데이터 작성 프롬프트로 넘어가도 되는지, ID/수량/enum/플래그/상태 키/금지 해금이 흔들리지 않았는지만 검증한다.

핵심:

```text
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 만들지 않는다.
새 NPC, 새 application_id, 새 reaction_id, 새 object_text_id를 만들지 않는다.
이번 출력은 Markdown 검증 문서 1개다.
```

---

## 0. 현재 잠금 상태

완료된 직전 산출물:

```text
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
```

직전 판정:

```text
스키마 전달 가능
```

이번 작업의 출력물은 아래 1개 문서만 허용한다.

```text
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
```

현재 수량 잠금:

```text
대상: 기존 9개
application_id: e02_app_001~e02_app_036 36개
reaction_id: e02_sr_001~e02_sr_036 36개
object_text_id: e02_obj_001~e02_obj_018 18개
reaction-only: 8행
직접 대면: e02_app_003, e02_app_011 2행
플래그: 11개
상태 키: 12개
플레이어블 보호 대상: 12개
```

---

## 1. 반드시 먼저 읽을 문서

직접 기준:

```text
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
```

보조 기준:

```text
story/03_regions/e02_npc_promotion_candidates_v0_1.md
story/03_regions/e02_locker_recipient_profile_v0_1.md
story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md
story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md
story/03_regions/e02_first_slice_dialogue_bank_v0_1.md
story/03_regions/e02_trace_object_bank_v0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/E02_FIRST_SLICE_ENGINE_SCHEMA_HANDOFF_TEAM_PROMPT_V0_1.md
```

플레이어블 보호 기준:

```text
story/06_characters/gate_09_profile_v1_0.md
story/06_characters/broad_10_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/open_host_profile_v1_0.md
story/06_characters/patch_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
```

---

## 2. 작업 목표

검증팀은 아래를 확인한다.

1. 스키마 전달 문서가 QA 통과 범위를 그대로 유지하는가.
2. `e02_app_001~036`, `e02_sr_001~036`, `e02_obj_001~018`에 누락/중복/초과가 없는가.
3. `reaction-only` 8행이 실제 object_text_id로 승격되지 않았는가.
4. 직접 대면 2행이 반복 대면, 구출 컷신, 플레이어블 해금 대체로 확장될 여지가 없는가.
5. 플래그 11개가 read/set 그래프를 유지하는가.
6. 상태 키 12개가 허용 효과만 가진 상태로 유지되는가.
7. application_type, display_surface, implementation_phase, protected_playable, forbidden_unlock enum이 허용값만 쓰는가.
8. 플레이어블 보호 대상 12개가 빠지지 않았는가.
9. 후속 엔진 파일 후보는 제안만 되어 있고 실제 파일 생성은 모두 `no`로 남아 있는가.
10. 실제 엔진 데이터 작성 프롬프트로 넘어가기 전 차단 이슈가 있는가.

---

## 3. 절대 금지

```text
새 NPC 추가
새 v1.0 프로필 작성
새 상태 반응 작성
새 오브젝트 문구 작성
새 application_id 작성
새 reaction_id 작성
새 object_text_id 작성
E02 전체 48개 씨앗 상세화
스토리 본문 작성
퀘스트 본문 작성
실제 엔진 코드 작성
JSON 파일 작성
CSV 파일 작성
Godot 리소스 파일 작성
엔진 데이터 샘플 파일 작성
편의점 상점 NPC
지하철 빠른 이동
방송 장악 또는 정답 송출
미세부품 수리/강화 UI
무음 대피소 안전지대/회복지
가족 정기권 구출 퀘스트
플레이어블 해금 대체
실제 역명, 실제 회사명, 실제 도시명 노출
```

---

## 4. 고정 검산 목록

### 4.1 대상 9개

```text
g_E02_C03_g5_001 / 마지막 보관함 수취인
g_E02_C05_g5_001 / 방재 문구 승인자
g_E02_C07_g5_001 / 막차 환승 보류관
g_E02_C03_g4_001 / 편의점 회수 카운터 잔류자
g_E02_C05_g4_001 / 반복 안내 편집자
g_E02_C07_g4_001 / 정기권 판독자
g_E02_C04_g4_001 / 미세부품 검수자
g_E02_C08_g4_001 / 지하 대피실 조용한 관리자
g_E02_C01_g4_001 / 가족 정기권 보류자
```

### 4.2 허용 ID 범위

```text
application_id:
e02_app_001~e02_app_036

reaction_id:
e02_sr_001~e02_sr_036

object_text_id:
e02_obj_001~e02_obj_018
또는 reaction-only
```

금지:

```text
e02_app_037 이상
e02_sr_037 이상
e02_obj_019 이상
임시 ID
placeholder ID
엔진팀 편의용 새 ID
```

### 4.3 reaction-only 8행

```text
e02_app_003 / e02_sr_003 / direct_encounter
e02_app_011 / e02_sr_011 / direct_encounter
e02_app_015 / e02_sr_015 / billboard
e02_app_019 / e02_sr_019 / receipt
e02_app_023 / e02_sr_023 / studio_log
e02_app_027 / e02_sr_027 / billboard
e02_app_032 / e02_sr_032 / shelter_speaker
e02_app_036 / e02_sr_036 / commuter_pass_log
```

### 4.4 직접 대면 2행

```text
e02_app_003 / 마지막 보관함 수취인
e02_app_011 / 막차 환승 보류관
```

---

## 5. 출력 문서 구조

출력 문서 제목:

```text
# E02 첫 외부 슬라이스 엔진 데이터 변환 전 검증 v0.1
```

### 0. 문서 상태

아래 내용을 명시한다.

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
변환 프롬프트 작성 가능 / 조건부 보완 / 보류 중 하나
```

### 1. 입력 산출물 잠금 확인

아래 표를 작성한다.

| 항목 | 기준 | 확인 결과 | 판정 |
|---|---:|---:|---|
| 대상 수 | 9개 | 실제 | 통과/실패 |
| application_id | 36개 | 실제 | 통과/실패 |
| reaction_id | 36개 | 실제 | 통과/실패 |
| object_text_id | 18개 | 실제 | 통과/실패 |
| reaction-only | 8행 | 실제 | 통과/실패 |
| 직접 대면 | 2행 | 실제 | 통과/실패 |
| 플래그 | 11개 | 실제 | 통과/실패 |
| 상태 키 | 12개 | 실제 | 통과/실패 |
| 플레이어블 보호 대상 | 12개 | 실제 | 통과/실패 |

### 2. 소스 일치성 검증

아래 표를 작성한다.

| source_pair | must_match | mismatch_check | result | fix_instruction |
|---|---|---|---|---|
| schema handoff vs QA checklist | 수량/금지 해금 | 누락/초과 ID | pass/conditional/fail | 수정 지시 |
| schema handoff vs data application | 36 application mapping | 필드 값 차이 | pass/conditional/fail | 수정 지시 |
| schema handoff vs state reaction matrix | 36 reaction_id | 반응 ID 누락 | pass/conditional/fail | 수정 지시 |
| schema handoff vs object text bank | 18 object_text_id | 문구 ID 누락 | pass/conditional/fail | 수정 지시 |
| schema handoff vs implementation scope | 직접 대면/보류 범위 | 직접 대면 초과 | pass/conditional/fail | 수정 지시 |

### 3. ID 범위 검증

아래 표를 작성한다.

| id_type | required_range | actual_range | missing | duplicate | overflow | result |
|---|---|---|---|---|---|---|
| application_id | `e02_app_001~036` | 실제 | 목록 | 목록 | 목록 | pass/fail |
| reaction_id | `e02_sr_001~036` | 실제 | 목록 | 목록 | 목록 | pass/fail |
| object_text_id | `e02_obj_001~018` | 실제 | 목록 | 목록 | 목록 | pass/fail |

검산 규칙:

```text
missing, duplicate, overflow가 하나라도 있으면 변환 프롬프트 작성 보류다.
reaction-only는 object_text_id 범위에 포함하지 않는다.
```

### 4. application 필드 검증

수량:

```text
36행.
e02_app_001~e02_app_036을 정확히 1회씩 포함한다.
```

권장 표 구조:

| application_id | reaction_id | object_text_id | application_type_check | target_seed_check | display_surface_check | phase_check | guard_check | result |
|---|---|---|---|---|---|---|---|---|

판정 기준:

```text
application_type은 허용 enum만 사용한다.
target_seed는 기존 9개 중 하나다.
display_surface와 implementation_phase는 허용 enum만 사용한다.
guard_check는 protected_playable과 forbidden_unlock이 같이 읽히는지 확인한다.
```

### 5. object text 필드 검증

수량:

```text
18행.
e02_obj_001~e02_obj_018을 정확히 1회씩 포함한다.
```

권장 표 구조:

| object_text_id | placement_node_check | linked_reactions_check | visibility_rule_check | replay_rule_check | forbidden_function_check | result |
|---|---|---|---|---|---|---|

판정 기준:

```text
placement_node는 캠페인식 장소명만 사용한다.
실제 역명/회사명/도시명은 실패다.
오브젝트 문구가 상점, 강화, 빠른 이동, 회복소, 정답 공개처럼 보이면 실패다.
```

### 6. reaction-only 검증

수량:

```text
8행.
```

권장 표 구조:

| application_id | reaction_id | display_surface | expected_handling | object_text_id_check | result |
|---|---|---|---|---|---|

반드시 검증:

```text
object_text_id_check는 모두 reaction-only여야 한다.
새 object_text_id가 붙으면 실패다.
```

### 7. 직접 대면 제한 검증

아래 표를 작성한다.

| direct_encounter_application | target_seed | one_time_rule | repeat_block | forbidden_expansion_check | result |
|---|---|---|---|---|---|

반드시 포함:

```text
e02_app_003 / g_E02_C03_g5_001
e02_app_011 / g_E02_C07_g5_001
```

금지:

```text
반복 대면
구출 컷신
퀘스트 NPC화
플레이어블 해금 대체
이름 확정 보상
```

### 8. 플래그 read/set 검증

수량:

```text
11행.
```

권장 표 구조:

| flag | setter_check | readers_check | downstream_effect_check | forbidden_unlock_check | result |
|---|---|---|---|---|---|

반드시 포함:

```text
e02_locker_expiry_seen
e02_last_train_missed
e02_locker_recipient_spoken
e02_locker_extension_refused
e02_disaster_phrase_delayed
e02_caption_cut_recovered
e02_guidance_loop_muted
e02_phrase_approved_too_late
e02_gate_unpassed_log_seen
e02_transfer_hold_spoken
e02_platform_residue_preserved
```

### 9. 상태 키 검증

수량:

```text
12행.
```

권장 표 구조:

| state_key | usage_check | read_or_mutating_check | allowed_effect_check | forbidden_effect_check | result |
|---|---|---|---|---|---|

반드시 포함:

```text
delivery_state
passage_tag
signal_tag
signal_stability
campaign_density
human_stability
trace_preservation
robot_autonomy
charge_tag
extraction_stability
residence_tag
supply_pressure
```

### 10. enum 검증

아래 표를 작성한다.

| enum | allowed_values_source | observed_values | invalid_values | result |
|---|---|---|---|---|
| application_type | schema handoff | 실제 | 목록 | pass/fail |
| display_surface | schema handoff | 실제 | 목록 | pass/fail |
| implementation_phase | schema handoff | 실제 | 목록 | pass/fail |
| protected_playable | schema handoff | 실제 | 목록 | pass/fail |
| forbidden_unlock | schema handoff | 실제 | 목록 | pass/fail |

### 11. 플레이어블 보호 검증

수량:

```text
12행.
```

권장 표 구조:

| protected_playable | protected_function | related_applications_check | fail_condition_check | result |
|---|---|---|---|---|

반드시 포함:

```text
GATE-09
BROAD-10
RETURN-05
QUIET-07
OPEN-HOST
PATCH
METER
RIO
미나
복희
세븐
RATION-16
```

### 12. 후속 엔진 파일 후보 게이트

이 섹션은 실제 파일을 만들지 않는다.

권장 표 구조:

| future_engine_file_candidate | source_section | create_now_check | result |
|---|---|---|---|

판정 기준:

```text
create_now_check는 모두 no여야 한다.
하나라도 yes가 있으면 보류다.
```

### 13. 금지 해금 회귀 검증

아래 표를 작성한다.

| forbidden_unlock | evidence_to_check | related_applications | result | fix_instruction |
|---|---|---|---|---|

반드시 포함:

```text
새 NPC
빠른 이동
무료 재통과
상점/교환 기능
배송 전투
방송 장악
정답 공개
공식 안내 버프
수리/강화 UI
로봇 동료 추가
안전지대/회복소
보급 상점
가족 구출 퀘스트
주거 튜토리얼
플레이어블 해금 대체
실명 지리/회사 노출
```

### 14. 변환 차단 이슈 목록

아래 표를 작성한다.

| issue_id | severity | source | blocking_reason | required_fix | owner_track |
|---|---|---|---|---|---|

규칙:

```text
차단 이슈가 없으면 "없음"으로 쓴다.
차단 이슈가 있으면 실제 엔진 데이터 작성 프롬프트로 넘어가지 않는다.
수정은 기존 문서의 행/필드 수정 지시로만 제안한다.
```

### 15. 구현 전 최종 체크리스트

아래 체크리스트를 작성한다.

```text
[ ] e02_app_001~036이 모두 정확히 1회 있다.
[ ] e02_sr_001~036이 모두 정확히 1회 있다.
[ ] e02_obj_001~018이 모두 정확히 1회 있다.
[ ] e02_app_037, e02_sr_037, e02_obj_019 이상이 없다.
[ ] reaction-only 8행에 object_text_id가 생기지 않았다.
[ ] 직접 대면은 e02_app_003, e02_app_011뿐이다.
[ ] 플래그 11개가 기존 read/set 그래프를 유지한다.
[ ] 상태 키 12개가 기존 허용 효과만 가진다.
[ ] enum invalid value가 없다.
[ ] 플레이어블 보호 대상 12개가 빠지지 않았다.
[ ] 금지 해금이 하나도 없다.
[ ] 후속 엔진 파일 후보는 create_now no로만 남았다.
[ ] 실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성하지 않았다.
```

### 16. 최종 판정

아래 중 하나로 판정한다.

```text
변환 프롬프트 작성 가능:
스키마 전달 문서가 실제 엔진 데이터 작성 프롬프트로 넘어갈 수 있다.

조건부 보완:
새 ID나 금지 해금은 없지만 일부 필드명, enum, 보호 문구 보강이 필요하다.

보류:
새 ID, 누락/중복, reaction-only 승격, 직접 대면 초과, 금지 해금, 실제 엔진 파일 생성 중 하나가 발견되었다.
```

### 17. 다음 작업 포인터

판정별로 다음 작업을 적는다.

```text
변환 프롬프트 작성 가능:
E02 첫 외부 슬라이스 실제 엔진 데이터 작성 프롬프트.

조건부 보완:
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_patch_v0_1.md

보류:
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
또는
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md 수정 지시.
```

---

## 6. 복붙용 작업 지시

아래 지시를 그대로 수행하라.

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 엔진 데이터 변환 전 검증 문서를 작성한다.

이번 작성 문서:
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md

목표:
E02 첫 외부 슬라이스 구현 데이터 전달/엔진 스키마화 문서가 실제 엔진 데이터 작성 프롬프트로 넘어가도 되는지 검증한다.
검증 범위는 ID/수량/enum/플래그/상태 키/플레이어블 보호/금지 해금/후속 파일 생성 금지다.

중요:
새 NPC를 만들지 않는다.
새 상태 반응을 만들지 않는다.
새 오브젝트 문구를 만들지 않는다.
새 application_id, reaction_id, object_text_id를 만들지 않는다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성하지 않는다.
이번 출력은 Markdown 문서 1개다.

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
2. story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
3. story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
4. story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
5. story/03_regions/e02_first_slice_object_text_bank_v0_1.md
6. story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
7. story/06_characters/gate_09_profile_v1_0.md
8. story/06_characters/broad_10_profile_v1_0.md
9. story/06_characters/return_recipient_profile_v1_0.md
10. story/06_characters/quiet_07_profile_v1_0.md
11. story/06_characters/open_host_profile_v1_0.md
12. story/06_characters/patch_profile_v1_0.md
13. story/06_characters/meter_06_profile_v1_0.md
14. story/06_characters/rio_08_profile_v1_0.md

반드시 포함:
1. 입력 산출물 잠금 확인
2. 소스 일치성 검증
3. ID 범위 검증
4. 36행 application 필드 검증
5. 18행 object text 필드 검증
6. 8행 reaction-only 검증
7. 직접 대면 제한 검증
8. 11개 플래그 read/set 검증
9. 12개 상태 키 검증
10. enum 검증
11. 12개 플레이어블 보호 검증
12. 후속 엔진 파일 후보 게이트
13. 금지 해금 회귀 검증
14. 변환 차단 이슈 목록
15. 구현 전 최종 체크리스트
16. 최종 판정
17. 다음 작업 포인터

고정 수량:
대상 9개.
e02_app_001~e02_app_036 36행.
e02_sr_001~e02_sr_036 36개.
e02_obj_001~e02_obj_018 18개.
reaction-only 8행.
직접 대면 2행.
플래그 11개.
상태 키 12개.
플레이어블 보호 대상 12개.

reaction-only 고정:
e02_app_003 / e02_sr_003
e02_app_011 / e02_sr_011
e02_app_015 / e02_sr_015
e02_app_019 / e02_sr_019
e02_app_023 / e02_sr_023
e02_app_027 / e02_sr_027
e02_app_032 / e02_sr_032
e02_app_036 / e02_sr_036

직접 대면 고정:
e02_app_003 / 마지막 보관함 수취인
e02_app_011 / 막차 환승 보류관

금지:
e02_app_037 이상.
e02_sr_037 이상.
e02_obj_019 이상.
새 NPC.
빠른 이동.
상점/교환 기능.
방송 장악.
정답 공개.
수리/강화 UI.
안전지대/회복소.
가족 구출 퀘스트.
플레이어블 해금 대체.
실명 지리/회사 노출.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일 생성.

검수:
작성 후 코드펜스 균형을 확인한다.
trailing whitespace가 없게 한다.
표 수량을 확인한다.
e02_app_001~036, e02_sr_001~036, e02_obj_001~018 누락/중복/초과를 확인한다.
reaction-only 8행이 새 object_text_id로 바뀌지 않았는지 확인한다.
직접 대면이 2행을 넘지 않는지 확인한다.
후속 엔진 파일 후보가 create_now no로만 남았는지 확인한다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 만들지 않았는지 확인한다.
커밋/푸시는 별도 지시가 있을 때만 한다.
```

---

## 7. 빠른 판정 기준

### 7.1 변환 프롬프트 작성 가능

```text
9개 대상이 유지되었다.
36개 application_id가 유지되었다.
36개 reaction_id가 유지되었다.
18개 object_text_id가 유지되었다.
reaction-only 8행이 유지되었다.
직접 대면 2행 제한이 유지되었다.
플래그 11개와 상태 키 12개가 기존 QA와 일치한다.
enum invalid value가 없다.
플레이어블 보호 대상 12개가 유지되었다.
후속 엔진 파일 후보는 create_now no로만 남았다.
금지 해금과 플레이어블 기능 침범이 없다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 만들지 않았다.
```

### 7.2 조건부 보완

```text
ID와 수량은 유지되었지만 일부 필드명 또는 enum 설명이 실제 변환 프롬프트로 쓰기에는 애매하다.
플래그 read/set 그래프가 일부 행에서 더 명확해야 한다.
state_key의 read_only_or_mutating 구분이 일부 부족하다.
protected_playable과 forbidden_unlock 설명이 QA 문서보다 약하다.
```

### 7.3 보류

```text
새 ID가 생겼다.
누락/중복/초과 ID가 있다.
reaction-only가 object_text_id로 승격되었다.
직접 대면이 2행을 넘었다.
상점, 빠른 이동, 방송 장악, 수리/강화 UI, 안전지대/회복소 중 하나가 열렸다.
후속 엔진 파일 후보의 create_now가 yes다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성했다.
```

---

## 8. 다음 작업

```text
이 프롬프트를 사용해 story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md를 작성한다.
작성 후 판정이 변환 프롬프트 작성 가능이면 실제 엔진 데이터 작성 프롬프트를 만든다.
조건부 보완이면 필드/enum/검증 조건만 보완하는 패치 프롬프트를 만든다.
보류면 스키마 전달 문서 또는 QA 체크리스트 수정 지시로 되돌린다.
```
