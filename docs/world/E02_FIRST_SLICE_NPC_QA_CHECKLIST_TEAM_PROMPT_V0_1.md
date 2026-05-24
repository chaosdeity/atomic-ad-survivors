# E02 First Slice NPC QA Checklist Team Prompt v0.1

## 목적

이 프롬프트는 NPC/월드 QA팀에게 그대로 전달하는 작업 지시서다.

이번 작업은 새 NPC 제작, 새 오브젝트 문구 제작, 새 상태 반응 제작, 엔진 코드 작성이 아니다. E02 첫 외부 슬라이스의 기존 산출물이 실제 구현 단계로 넘어가도 아래 잠금이 깨지지 않는지 검산하는 QA 체크리스트를 작성한다.

핵심 검산:

```text
E02 첫 외부 슬라이스는 기존 9개 대상만 사용한다.
상태 반응은 e02_sr_001~036 36개다.
데이터 적용행은 e02_app_001~036 36개다.
오브젝트 문구는 e02_obj_001~018 18개다.
reaction-only는 8행이다.
직접 대면은 2행 이하로 유지한다.
새 NPC, 새 reaction_id, 새 object_text_id를 만들지 않는다.
금지 해금과 플레이어블 기능 침범이 없어야 한다.
```

## 현재 잠금 상태

완료된 E02 NPC 산출물:

```text
story/03_regions/e02_npc_promotion_candidates_v0_1.md
story/03_regions/e02_locker_recipient_profile_v0_1.md
story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md
story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md
story/03_regions/e02_first_slice_dialogue_bank_v0_1.md
story/03_regions/e02_trace_object_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
```

이번 작업의 출력물은 아래 1개 문서만 허용한다.

```text
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
```

## 반드시 먼저 읽을 문서

직접 기준:

```text
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
story/03_regions/e02_npc_promotion_candidates_v0_1.md
```

보조 기준:

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/E02_FIRST_SLICE_STATE_OBJECT_EXPANSION_TEAM_PROMPT_V0_1.md
docs/world/E02_FIRST_SLICE_STATE_OBJECT_DATA_APPLICATION_TEAM_PROMPT_V0_1.md
story/03_regions/e02_locker_recipient_profile_v0_1.md
story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md
story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md
story/03_regions/e02_first_slice_dialogue_bank_v0_1.md
story/03_regions/e02_trace_object_bank_v0_1.md
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

## 작업 목표

QA팀은 아래를 검산한다.

1. E02 첫 슬라이스가 기존 9개 대상만 쓰는가.
2. 직접 대면 반응이 마지막 보관함 수취인과 막차 환승 보류관 2행을 넘지 않는가.
3. `e02_app_001~036`이 모두 정확히 1회씩 검산되는가.
4. `e02_sr_001~036`이 모두 정확히 1회씩 검산되는가.
5. `e02_obj_001~018`이 모두 정확히 1회씩 배치 QA에 들어가는가.
6. `reaction-only` 8행이 새 오브젝트 문구로 확장되지 않았는가.
7. 플래그 11개와 상태 키 12개가 새 ID 없이 read/set 기준으로만 연결되는가.
8. GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO 기능을 대체하지 않는가.
9. 금지 해금이 열리지 않는가.
10. 실패 항목은 새 설정을 만들지 않고 수정 지시만 남기는가.

## 절대 금지

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
엔진 코드 작성
JSON/CSV 작성
편의점 상점 NPC
지하철 빠른 이동
방송 장악 또는 정답 송출
미세부품 수리/강화 UI
무음 대피소 안전지대/회복지
가족 정기권 구출 퀘스트
실제 역명, 실제 회사명, 실제 도시명 노출
```

## 출력 문서 구조

출력 문서 제목:

```text
# E02 첫 외부 슬라이스 NPC QA 체크리스트 v0.1
```

### 0. 문서 상태

아래 내용을 명시한다.

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 NPC/잔향/오브젝트 구현 전 QA 체크리스트.
새 NPC 제작 아님.
새 문구 제작 아님.
엔진 코드 작성 아님.

판정:
통과 / 조건부 통과 / 보류 중 하나
```

### 1. 입력 산출물 검산

아래 표를 작성한다.

| 항목 | 기준 | 결과 | 판정 |
|---|---:|---:|---|
| 대상 수 | 기존 9개 | 실제 개수 | 통과/실패 |
| 상태 반응 ID | 36개 | 실제 개수 | 통과/실패 |
| 데이터 적용 ID | 36개 | 실제 개수 | 통과/실패 |
| 오브젝트 문구 ID | 18개 | 실제 개수 | 통과/실패 |
| reaction-only | 8행 | 실제 개수 | 통과/실패 |
| 직접 대면 | 2행 이하 | 실제 개수 | 통과/실패 |
| 새 NPC | 0명 | 실제 개수 | 통과/실패 |
| 새 ID | 0개 | 실제 개수 | 통과/실패 |

검산 기준:

```text
e02_app_001~e02_app_036이 모두 있어야 한다.
e02_sr_001~e02_sr_036이 모두 있어야 한다.
e02_obj_001~e02_obj_018이 모두 있어야 한다.
e02_app_037, e02_sr_037, e02_obj_019 같은 새 ID가 있으면 실패다.
```

### 2. 9개 대상별 QA

수량:

```text
9행.
기존 E02 첫 슬라이스 9개 대상만 포함한다.
```

권장 표 구조:

| target_seed | target_name | expected_exposure | allowed_forms | forbidden_forms | linked_applications | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|

반드시 포함할 대상:

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

### 3. 데이터 적용행 QA

수량:

```text
36행.
e02_app_001~e02_app_036을 정확히 1회씩 포함한다.
```

권장 표 구조:

| application_id | reaction_id | object_text_id | expected_surface | expected_phase | direct_encounter_check | forbidden_unlock_check | playable_protection_check | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|---|---|

작성 규칙:

- `qa_result`는 `pass`, `conditional`, `fail` 중 하나로 쓴다.
- 실패해도 새 반응이나 새 문구를 만들지 않는다.
- `fix_instruction`은 기존 행의 표시 조건, 보호 대상, 노출 표면을 어떻게 수정해야 하는지만 적는다.
- 직접 대면 행은 `e02_app_003`, `e02_app_011`만 허용한다.

### 4. 오브젝트 배치 QA

수량:

```text
18행.
e02_obj_001~e02_obj_018을 정확히 1회씩 포함한다.
```

권장 표 구조:

| object_text_id | placement_node | expected_visibility | replay_rule_check | linked_reactions_check | forbidden_function_check | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|

검산 기준:

```text
오브젝트 문구가 상점, 강화, 빠른 이동, 회복소, 정답 공개처럼 보이면 실패다.
오브젝트가 실제 역명/회사명/도시명을 노출하면 실패다.
오브젝트가 플레이어블 해금 기능을 대신하면 실패다.
```

### 5. reaction-only QA

수량:

```text
8행.
기존 reaction-only 항목만 포함한다.
```

권장 표 구조:

| application_id | reaction_id | display_surface | reason_for_reaction_only | allowed_text_source | must_not_create | qa_result | fix_instruction |
|---|---|---|---|---|---|---|---|

반드시 검산:

```text
reaction-only 항목이 새 object_text_id로 승격되지 않았는가.
직접 대면이나 상태 변화만 필요한 항목을 오브젝트 문구로 억지 확장하지 않았는가.
reaction.line_or_change 또는 system_state_change_only만 사용했는가.
```

### 6. 플래그 QA

수량:

```text
11행.
E02 플래그 11개를 모두 포함한다.
```

권장 표 구조:

| flag | expected_setter | expected_readers | player_facing_surface | forbidden_unlock | qa_result | fix_instruction |
|---|---|---|---|---|---|---|

반드시 검토할 플래그:

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

### 7. 상태 키 QA

수량:

```text
12행.
상태 키 12개를 모두 포함한다.
```

권장 표 구조:

| state_key | expected_usage | allowed_effect | forbidden_effect | qa_result | fix_instruction |
|---|---|---|---|---|---|

반드시 검토할 상태 키:

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

### 8. 직접 대면 제한 QA

아래 표를 작성한다.

| check | expected | actual | qa_result | fix_instruction |
|---|---|---|---|---|
| 직접 대면 대상 | 마지막 보관함 수취인, 막차 환승 보류관 | 실제 대상 | pass/conditional/fail | 수정 지시 |
| 직접 대면 행 | `e02_app_003`, `e02_app_011` | 실제 행 | pass/conditional/fail | 수정 지시 |
| 방재 문구 승인자 | 화면/음성/자막만 | 실제 형태 | pass/conditional/fail | 수정 지시 |
| 나머지 6개 대상 | 조건 대사/로그/장치/잔향만 | 실제 형태 | pass/conditional/fail | 수정 지시 |

### 9. 플레이어블 보호 QA

아래 표를 작성한다.

| protected_playable | risk_area | expected_guard | qa_result | fix_instruction |
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
```

검산 기준:

```text
GATE-09: 빠른 이동, 개찰 해금, 플랫폼 HP 0 대체 금지.
BROAD-10: 방송 장악, 청취 확인 보류, 정답 송출 금지.
RETURN-05: 배송 전투, 수취/반송 판정 대체 금지.
QUIET-07: 낮은 수신 튜토리얼, 안전 대피소화 금지.
OPEN-HOST: 가족/주거 안내 튜토리얼 반복 금지.
PATCH: 수리 로봇, 부품 강화, 로봇 동료 추가 금지.
METER: 충전/계량 전투, 강화 UI 금지.
RIO: 정품 복구, 객실/체류 판정 설명 금지.
```

### 10. 금지 해금 회귀 QA

아래 표를 작성한다.

| forbidden_unlock | related_rows | evidence_to_check | qa_result | fix_instruction |
|---|---|---|---|---|

반드시 포함:

```text
새 NPC
빠른 이동
상점/교환 기능
방송 장악
정답 공개
수리/강화 UI
안전지대/회복소
가족 구출 퀘스트
플레이어블 해금 대체
실명 지리/회사 노출
```

### 11. QA 실패 처리 규칙

문서에 아래 규칙을 명시한다.

```text
QA 실패가 있어도 새 NPC, 새 문구, 새 ID를 만들지 않는다.
실패 항목은 기존 application_id, reaction_id, object_text_id를 가리켜 수정 지시만 남긴다.
수정 지시는 "삭제", "노출 조건 강화", "protected_playable 보강", "display_surface 변경", "reaction-only 유지" 중 하나로 제한한다.
스토리 본문이나 퀘스트 본문으로 해결하지 않는다.
```

### 12. 최종 판정

아래 중 하나로 판정한다.

```text
통과:
구현 전 QA 기준을 모두 통과한다.

조건부 통과:
새 NPC/새 ID 문제는 없지만 일부 노출 조건 또는 보호 문구 보강이 필요하다.

보류:
직접 대면 수, 금지 해금, 플레이어블 침범 중 하나가 심각해 구현 전 수정이 필요하다.
```

### 13. 다음 작업 포인터

판정별로 다음 작업을 적는다.

```text
통과:
E02 첫 외부 슬라이스 구현 데이터 전달 또는 엔진 데이터 스키마화.

조건부 통과:
story/03_regions/e02_first_slice_npc_qa_patch_v0_1.md

보류:
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md 수정 지시.
```

## 복붙용 작업 지시

아래 지시를 그대로 수행하라.

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 NPC QA 체크리스트를 작성한다.

이번 작성 문서:
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md

목표:
E02 첫 외부 슬라이스의 9개 기존 대상, 상태 반응 36개, 데이터 적용행 36개, 오브젝트 문구 18개가
새 NPC/새 ID/금지 해금 없이 구현 단계로 넘어갈 수 있는지 QA 체크리스트로 검산한다.

중요:
새 NPC를 만들지 않는다.
새 상태 반응을 만들지 않는다.
새 오브젝트 문구를 만들지 않는다.
새 application_id, reaction_id, object_text_id를 만들지 않는다.
엔진 코드, JSON, CSV 파일을 작성하지 않는다.
이번 출력은 Markdown 문서 1개다.

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
2. story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
3. story/03_regions/e02_first_slice_object_text_bank_v0_1.md
4. story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
5. story/03_regions/e02_npc_promotion_candidates_v0_1.md
6. story/06_characters/gate_09_profile_v1_0.md
7. story/06_characters/broad_10_profile_v1_0.md
8. story/06_characters/return_recipient_profile_v1_0.md
9. story/06_characters/quiet_07_profile_v1_0.md
10. story/06_characters/open_host_profile_v1_0.md
11. story/06_characters/patch_profile_v1_0.md
12. story/06_characters/meter_06_profile_v1_0.md
13. story/06_characters/rio_08_profile_v1_0.md

반드시 포함:
1. 입력 산출물 검산
2. 9개 대상별 QA
3. 36행 데이터 적용행 QA
4. 18행 오브젝트 배치 QA
5. 8행 reaction-only QA
6. 11개 플래그 QA
7. 12개 상태 키 QA
8. 직접 대면 제한 QA
9. 플레이어블 보호 QA
10. 금지 해금 회귀 QA
11. QA 실패 처리 규칙
12. 최종 판정
13. 다음 작업 포인터

검수:
e02_app_001~e02_app_036이 모두 정확히 1회씩 QA되는지 확인한다.
e02_sr_001~e02_sr_036이 모두 정확히 1회씩 QA되는지 확인한다.
e02_obj_001~e02_obj_018이 모두 정확히 1회씩 QA되는지 확인한다.
reaction-only 8행이 새 오브젝트 문구로 바뀌지 않았는지 확인한다.
직접 대면은 e02_app_003, e02_app_011 범위를 넘지 않는지 확인한다.
GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO 기능을 대체하지 않는지 확인한다.
작성 후 코드펜스 균형, trailing whitespace, 표 수량을 확인한다.
커밋/푸시는 별도 지시가 있을 때만 한다.
```
