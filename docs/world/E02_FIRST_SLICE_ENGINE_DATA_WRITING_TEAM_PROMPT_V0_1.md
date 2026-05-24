# E02 First Slice Engine Data Writing Team Prompt v0.1

## 목적

이 프롬프트는 NPC/월드 구현 데이터팀 또는 엔진 데이터 변환팀에게 그대로 전달하는 작업 지시서다.

이번 작업은 검증이 끝난 E02 첫 외부 슬라이스 상태 반응/오브젝트 문구를 엔진이 읽을 수 있는 데이터 패키지로 옮기기 위한 것이다.
단, 실제 파일 생성 여부와 엔진 포맷 확정 범위는 분리한다.

핵심:

```text
새 NPC, 새 문구, 새 ID를 만들지 않는다.
검증된 9개 대상 / 36 application / 36 reaction / 18 object / 11 flag / 12 state key만 변환한다.
기본 출력은 Markdown 엔진 데이터 패키지 1개다.
실제 data/e02/*.json, CSV, Godot 리소스 파일은 별도 명시 지시가 있을 때만 만든다.
```

---

## 0. 현재 잠금 상태

직전 완료 산출물:

```text
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
```

직전 판정:

```text
변환 프롬프트 작성 가능
```

이번 프롬프트 기본 출력물:

```text
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
```

기본 작업 성격:

```text
엔진 데이터 패키지 Markdown 작성.
JSON 블록은 작성하되, 실제 JSON 파일은 만들지 않는다.
Godot 코드, GDScript, .tres, .res, CSV는 만들지 않는다.
```

별도 명시 지시가 있을 때만 허용되는 실제 파일 후보:

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

주의:

```text
이번 프롬프트를 받는 팀이 "실제 파일 생성까지 하라"는 별도 지시를 받지 않았다면,
위 data/e02 파일들은 만들지 않는다.
```

---

## 1. 반드시 먼저 읽을 문서

직접 기준:

```text
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
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
docs/world/E02_FIRST_SLICE_ENGINE_DATA_PRE_CONVERSION_VALIDATION_TEAM_PROMPT_V0_1.md
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

## 2. 작업 모드

### 2.1 기본 모드

별도 지시가 없으면 이 모드만 수행한다.

```text
출력:
story/03_regions/e02_first_slice_engine_data_package_v0_1.md

내용:
검증된 데이터를 Markdown 안의 parseable JSON 코드블록으로 작성한다.
실제 JSON 파일은 만들지 않는다.
```

### 2.2 실제 파일 생성 모드

아래 조건을 모두 만족할 때만 수행한다.

```text
유저 또는 엔진 책임자가 실제 파일 생성을 명시했다.
엔진 포맷이 JSON으로 확정되었다.
저장 경로가 data/e02/로 확정되었다.
Markdown 데이터 패키지의 검산이 먼저 통과했다.
```

실제 파일 생성 모드에서도 금지:

```text
GDScript 작성
Godot 리소스 파일 작성
CSV 병행 생성
새 ID 추가
문구 재작성
상태 키 추가
플래그 추가
```

---

## 3. 고정 수량

```text
대상:
9개

application_id:
e02_app_001~e02_app_036 / 36개

reaction_id:
e02_sr_001~e02_sr_036 / 36개

object_text_id:
e02_obj_001~e02_obj_018 / 18개

reaction-only:
8행

직접 대면:
2행

플래그:
11개

상태 키:
12개

플레이어블 보호 대상:
12개

금지 해금:
16개
```

대상 9개:

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

reaction-only 고정:

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

직접 대면 고정:

```text
e02_app_003 / g_E02_C03_g5_001 / 마지막 보관함 수취인
e02_app_011 / g_E02_C07_g5_001 / 막차 환승 보류관
```

---

## 4. 데이터 작성 원칙

### 4.1 JSON 작성 규칙

Markdown 안의 JSON 코드블록은 실제 파서가 읽을 수 있어야 한다.

```text
JSON 주석 금지.
trailing comma 금지.
문자열은 큰따옴표 사용.
ID는 문자열로 유지.
배열 순서는 기존 ID 순서를 유지.
누락값은 빈 문자열보다 null을 우선한다.
reaction-only application의 object_text_id는 null로 둔다.
reaction-only application에는 "is_reaction_only": true를 둔다.
object_texts 배열에는 e02_obj_001~018만 넣고 reaction-only 항목은 넣지 않는다.
```

### 4.2 문구 보존 규칙

```text
object text의 default_text, changed_text는 object text bank에서 가져온다.
reaction의 line_or_change는 state reaction matrix에서 가져온다.
문구를 더 예쁘게 고치지 않는다.
새 대사나 새 로그를 추가하지 않는다.
한국어 문구를 영어로 번역하지 않는다.
실제 역명, 실제 회사명, 실제 도시명은 넣지 않는다.
```

### 4.3 필드명 규칙

```text
필드는 snake_case를 사용한다.
문서별 필드명이 다를 때는 engine_schema_handoff의 필드 사전을 우선한다.
엔진 미확정 필드는 note 또는 qa_guard에 남기고 새 시스템 필드로 만들지 않는다.
```

---

## 5. 패키지 스키마

최상위 manifest 후보:

```json
{
  "schema_version": "e02_first_slice_engine_data_v0_1",
  "source_package": "E02 first external slice",
  "data_status": "engine_data_package_markdown_only",
  "actual_files_created": false,
  "counts": {
    "targets": 9,
    "applications": 36,
    "reactions": 36,
    "object_texts": 18,
    "flags": 11,
    "state_keys": 12,
    "reaction_only_applications": 8,
    "direct_encounters": 2
  }
}
```

application record 필수 필드:

```text
application_id
reaction_id
object_text_id
is_reaction_only
application_type
target_seed
campaign
trigger_state
trigger_flag
condition_expression
display_surface
text_source
state_result
flag_result
implementation_phase
protected_playable
qa_guard
```

object text record 필수 필드:

```text
object_text_id
object_group
campaign
placement_node
form
first_seen
trigger_condition
default_text
changed_text
implied_mystery
linked_seed
linked_reactions
reads_states
reads_flags
visibility_rule
replay_rule
protected_playable
qa_guard
```

reaction record 필수 필드:

```text
reaction_id
target_seed
campaign
trigger_state
trigger_flag
threshold_or_condition
reaction_form
line_or_change
consequence
display_surface
implementation_phase
protected_playable
forbidden_overlap
```

flag record 필수 필드:

```text
flag
set_by_application
read_by_applications
player_facing_surface
downstream_effect
forbidden_unlock
```

state key record 필수 필드:

```text
state_key
used_by_applications
read_only_or_mutating
allowed_effect
forbidden_effect
```

validation record 필수 필드:

```text
check_id
expected
actual
result
evidence
```

---

## 6. 절대 금지

```text
새 NPC 추가
새 v1.0 프로필 작성
새 상태 반응 작성
새 오브젝트 문구 작성
새 application_id 작성
새 reaction_id 작성
새 object_text_id 작성
새 flag 작성
새 state_key 작성
E02 전체 48개 씨앗 상세화
스토리 본문 작성
퀘스트 본문 작성
GDScript 작성
Godot 리소스 작성
CSV 작성
엔진 로더 코드 작성
편의점 상점 NPC
지하철 빠른 이동
무료 재통과
방송 장악 또는 정답 송출
미세부품 수리/강화 UI
로봇 동료 추가
무음 대피소 안전지대/회복지
보급 상점
가족 정기권 구출 퀘스트
플레이어블 해금 대체
실제 역명, 실제 회사명, 실제 도시명 노출
```

---

## 7. 복붙용 작업 지시

아래 지시를 그대로 수행하라.

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 엔진 데이터 패키지 v0.1을 작성한다.

이번 작성 문서:
story/03_regions/e02_first_slice_engine_data_package_v0_1.md

목표:
E02 첫 외부 슬라이스의 검증 완료 데이터를 엔진 데이터 패키지로 변환한다.
기본 출력은 Markdown 문서 1개이며, 그 안에 parseable JSON 코드블록을 포함한다.
실제 data/e02/*.json 파일은 만들지 않는다.

판정 기준:
직전 검증 문서의 판정은 "변환 프롬프트 작성 가능"이다.
따라서 새 내용 제작이 아니라 검증 완료 데이터의 구조화가 목표다.

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
2. story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
3. story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
4. story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
5. story/03_regions/e02_first_slice_object_text_bank_v0_1.md
6. story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
7. story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md

출력 문서 구조:

# E02 첫 외부 슬라이스 엔진 데이터 패키지 v0.1

## 0. 문서 상태

상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 실제 엔진 데이터 변환용 Markdown 패키지.
실제 엔진 코드 작성 아님.
실제 JSON 파일 작성 아님.
실제 CSV/Godot 리소스 작성 아님.

판정:
엔진 데이터 패키지 작성 완료 / 조건부 보완 / 보류 중 하나

실제 파일 생성:
false

## 1. 소스 잠금

읽은 문서와 기준 수량을 정리한다.

## 2. 패키지 manifest

parseable JSON 코드블록으로 작성한다.
schema_version, source_package, actual_files_created, counts, source_documents를 포함한다.

## 3. applications JSON

parseable JSON 코드블록으로 작성한다.
36개 application record를 e02_app_001~e02_app_036 순서로 모두 작성한다.

규칙:
object_text_id가 없는 8행은 null로 둔다.
reaction-only 8행에는 "is_reaction_only": true를 둔다.
나머지는 "is_reaction_only": false를 둔다.

## 4. object_texts JSON

parseable JSON 코드블록으로 작성한다.
18개 object_text record를 e02_obj_001~e02_obj_018 순서로 모두 작성한다.
reaction-only 항목은 넣지 않는다.

## 5. reactions JSON

parseable JSON 코드블록으로 작성한다.
36개 reaction record를 e02_sr_001~e02_sr_036 순서로 모두 작성한다.

## 6. flags JSON

parseable JSON 코드블록으로 작성한다.
11개 flag record를 작성한다.

## 7. state_keys JSON

parseable JSON 코드블록으로 작성한다.
12개 state key record를 작성한다.

## 8. validation_manifest JSON

parseable JSON 코드블록으로 작성한다.
아래 검산을 모두 포함한다.
- targets_count
- applications_count
- reactions_count
- object_texts_count
- reaction_only_count
- direct_encounter_count
- flags_count
- state_keys_count
- protected_playable_count
- forbidden_unlock_count
- no_overflow_ids
- no_actual_files_created

## 9. 실제 파일 생성 게이트

이번 문서에서는 실제 파일을 만들지 않았다고 명시한다.
실제 파일 생성이 필요하면 별도 작업으로 아래 후보만 제안한다.
- data/e02/first_slice_applications.json
- data/e02/first_slice_object_texts.json
- data/e02/first_slice_reactions.json
- data/e02/first_slice_flags.json
- data/e02/first_slice_state_keys.json
- data/e02/first_slice_validation.json

## 10. 최종 검산

체크리스트를 작성한다.

## 11. 최종 판정

판정:
엔진 데이터 패키지 작성 완료 / 조건부 보완 / 보류 중 하나

다음 작업:
패키지 검산 통과 시 실제 JSON 파일 생성 여부 결정.
실제 파일 생성은 별도 명시 지시가 있을 때만 진행.

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
새 문구.
새 플래그.
새 상태 키.
빠른 이동.
상점/교환 기능.
방송 장악.
정답 공개.
수리/강화 UI.
안전지대/회복소.
가족 구출 퀘스트.
플레이어블 해금 대체.
실명 지리/회사 노출.
실제 data/e02/*.json 파일 생성.
CSV/Godot 리소스/GDScript 생성.

검수:
작성 후 코드펜스 균형을 확인한다.
trailing whitespace가 없게 한다.
JSON 코드블록이 parseable JSON인지 확인한다.
applications 36개, object_texts 18개, reactions 36개, flags 11개, state_keys 12개를 검산한다.
reaction-only 8행의 object_text_id가 null인지 확인한다.
직접 대면이 2행을 넘지 않는지 확인한다.
actual_files_created가 false인지 확인한다.
실제 JSON/CSV/Godot 리소스 파일을 만들지 않았는지 확인한다.
커밋/푸시는 별도 지시가 있을 때만 한다.
```

---

## 8. 빠른 판정 기준

### 8.1 엔진 데이터 패키지 작성 완료

```text
Markdown 패키지 1개가 작성되었다.
JSON 코드블록이 parseable JSON이다.
9개 대상이 유지되었다.
36개 application_id가 유지되었다.
36개 reaction_id가 유지되었다.
18개 object_text_id가 유지되었다.
reaction-only 8행이 object_text_id null로 유지되었다.
직접 대면 2행 제한이 유지되었다.
플래그 11개와 상태 키 12개가 유지되었다.
금지 해금이 열리지 않았다.
actual_files_created가 false다.
실제 JSON/CSV/Godot 리소스 파일을 만들지 않았다.
```

### 8.2 조건부 보완

```text
수량은 맞지만 일부 JSON 필드명이 스키마 전달 문서와 다르다.
일부 line_or_change나 default_text가 원문과 다르다.
protected_playable 또는 qa_guard가 일부 약하다.
validation_manifest가 수량만 검산하고 금지 해금 검산을 빠뜨렸다.
```

### 8.3 보류

```text
새 ID가 생겼다.
누락/중복/초과 ID가 있다.
reaction-only에 object_text_id가 붙었다.
직접 대면이 2행을 넘었다.
새 NPC나 새 문구가 생겼다.
상점, 빠른 이동, 방송 장악, 수리/강화 UI, 안전지대/회복소 중 하나가 열렸다.
실제 JSON/CSV/Godot 리소스 파일을 작성했다.
JSON 코드블록이 parseable JSON이 아니다.
```

---

## 9. 다음 작업

```text
이 프롬프트를 사용해 story/03_regions/e02_first_slice_engine_data_package_v0_1.md를 작성한다.
작성 후 패키지 검산이 통과하면 실제 JSON 파일 생성 여부를 별도로 결정한다.
실제 파일 생성이 승인되면 별도의 파일 생성 프롬프트를 만든다.
조건부 보완이면 e02_first_slice_engine_data_package_patch_v0_1.md로 보완한다.
보류면 pre-conversion validation 또는 schema handoff로 되돌린다.
```
