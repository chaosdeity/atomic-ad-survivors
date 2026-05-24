# E02 First Slice Engine Schema Handoff Team Prompt v0.1

## 목적

이 프롬프트는 NPC/월드 구현 데이터팀 또는 엔진 데이터 스키마화팀에게 그대로 전달하는 작업 지시서다.

이번 작업은 새 NPC 제작, 새 문구 제작, 새 상태 반응 제작, 실제 엔진 코드 작성이 아니다. QA 통과가 끝난 E02 첫 외부 슬라이스의 9개 대상, 상태 반응 36개, 데이터 적용행 36개, 오브젝트 문구 18개를 엔진 데이터로 옮길 수 있게 필드 사전과 전달 스키마를 정리한다.

핵심:

```text
이미 통과한 E02 첫 외부 슬라이스 범위를 유지한다.
새 NPC를 만들지 않는다.
새 application_id, reaction_id, object_text_id를 만들지 않는다.
실제 JSON/CSV/엔진 리소스 파일을 작성하지 않는다.
이번 출력은 Markdown 스키마 전달 문서 1개다.
```

---

## 0. 현재 잠금 상태

완료된 산출물:

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
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
```

이번 작업의 출력물은 아래 1개 문서만 허용한다.

```text
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
```

현재 수량 잠금:

```text
대상: 기존 9개
상태 반응: e02_sr_001~e02_sr_036 36개
데이터 적용행: e02_app_001~e02_app_036 36개
오브젝트 문구: e02_obj_001~e02_obj_018 18개
reaction-only: 8행
직접 대면: e02_app_003, e02_app_011 2행
플래그: 11개
상태 키: 12개
판정: QA 통과
```

---

## 1. 반드시 먼저 읽을 문서

직접 기준:

```text
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
docs/world/E02_FIRST_SLICE_STATE_OBJECT_EXPANSION_TEAM_PROMPT_V0_1.md
docs/world/E02_FIRST_SLICE_STATE_OBJECT_DATA_APPLICATION_TEAM_PROMPT_V0_1.md
docs/world/E02_FIRST_SLICE_NPC_QA_CHECKLIST_TEAM_PROMPT_V0_1.md
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

스키마화팀은 아래를 작성한다.

1. E02 첫 외부 슬라이스의 구현 데이터 묶음을 엔진팀이 읽을 수 있는 필드 단위로 정리한다.
2. `e02_app_001~036`, `e02_sr_001~036`, `e02_obj_001~018`의 관계를 새 ID 없이 전달한다.
3. `reaction-only` 8행이 실제 오브젝트 문구 ID로 잘못 승격되지 않도록 스키마 규칙을 만든다.
4. 직접 대면 2행이 엔진 이벤트에서 반복 대면이나 해금 장면으로 확장되지 않도록 제한한다.
5. 플래그 11개와 상태 키 12개를 read/set/mutating 후보로 구분한다.
6. display surface, implementation phase, application type, protected playable, forbidden unlock을 enum처럼 정리한다.
7. 실제 엔진 파일 작성 전 검증할 체크리스트를 만든다.

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

## 4. 스키마화 잠금

### 4.1 대상 9개

반드시 아래 9개 target만 사용한다.

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

아래 8행은 object_text_id를 만들지 않는다.

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

직접 대면은 아래만 허용한다.

```text
e02_app_003 / 마지막 보관함 수취인
e02_app_011 / 막차 환승 보류관
```

금지:

```text
방재 문구 승인자 직접 대면
편의점 회수 카운터 잔류자 직접 대면
반복 안내 편집자 직접 대면
정기권 판독자 직접 대면
미세부품 검수자 직접 대면
지하 대피실 관리자 직접 대면
가족 정기권 보류자 직접 대면
반복 대면
구출 컷신
플레이어블 해금 장면
```

---

## 5. 필드 사전으로 반드시 정리할 것

### 5.1 application record 필드

필수 필드:

```text
application_id
reaction_id
object_text_id
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

규칙:

```text
application_id는 e02_app_001~036만 허용한다.
reaction_id는 e02_sr_001~036만 허용한다.
object_text_id는 e02_obj_001~018 또는 reaction-only만 허용한다.
reaction-only는 별도 object text record를 만들지 않는다.
display_surface는 허용 enum 중 하나만 쓴다.
protected_playable은 기능 침범 방지용 필드이며 해금 필드가 아니다.
qa_guard는 실제 효과가 아니라 금지 해금 방지 설명이다.
```

### 5.2 object text record 필드

필수 필드:

```text
object_text_id
object_group
campaign
placement_node
default_state
changed_state
reads_states
reads_flags
linked_reactions
visibility_rule
replay_rule
protected_playable
qa_guard
```

규칙:

```text
object_text_id는 e02_obj_001~018만 허용한다.
object text record는 정확히 18행이어야 한다.
같은 object_text_id가 여러 reaction_id와 연결될 수 있지만 object_text_id 자체는 새로 늘리지 않는다.
placement_node는 캠페인식 장소명만 사용한다.
실제 역명/회사명/도시명을 쓰지 않는다.
```

### 5.3 reaction record 필드

필수 필드:

```text
reaction_id
target_seed
campaign
reaction_type
state_key
flag_dependency
line_or_change_ref
display_surface
implementation_phase
protected_playable
forbidden_unlock
```

규칙:

```text
reaction_id는 e02_sr_001~036만 허용한다.
실제 대사 본문은 기존 상태 반응표와 대사/잔향 은행을 참조한다.
이 문서에서 새 대사를 만들지 않는다.
```

### 5.4 flag record 필드

필수 필드:

```text
flag
set_by_application
read_by_applications
player_facing_surface
downstream_effect
forbidden_unlock
```

반드시 포함할 플래그:

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

### 5.5 state key record 필드

필수 필드:

```text
state_key
used_by_applications
read_only_or_mutating
allowed_effect
forbidden_effect
```

반드시 포함할 상태 키:

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

---

## 6. enum 후보

### 6.1 application_type

```text
object_text
direct_encounter
hub_reaction_candidate
device_voice
ambient_log
reaction_only
```

### 6.2 display_surface

```text
locker_ui
collection_room_light
direct_encounter
hub_reaction
billboard
caption
studio_log
gate_log
pass_reader
platform_list
receipt
locker_log
inspection_sheet
shelter_speaker
commuter_pass_log
```

### 6.3 implementation_phase

```text
first_seen
pre_boss
post_boss
optional_trace
revisit
hub_after_return
```

### 6.4 protected_playable

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

### 6.5 forbidden_unlock

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

---

## 7. 출력 문서 구조

출력 문서 제목:

```text
# E02 첫 외부 슬라이스 구현 데이터 전달/엔진 스키마화 v0.1
```

### 0. 문서 상태

아래 내용을 명시한다.

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
스키마 전달 가능 / 조건부 전달 / 보류 중 하나
```

### 1. 입력 산출물 잠금

아래 표를 작성한다.

| 항목 | 기준 | 이번 문서 처리 | 판정 |
|---|---:|---|---|
| 대상 수 | 9개 | 9개 유지 | 통과/실패 |
| application_id | 36개 | `e02_app_001~036` 유지 | 통과/실패 |
| reaction_id | 36개 | `e02_sr_001~036` 유지 | 통과/실패 |
| object_text_id | 18개 | `e02_obj_001~018` 유지 | 통과/실패 |
| reaction-only | 8행 | 새 object_text_id 없음 | 통과/실패 |
| 직접 대면 | 2행 | `e02_app_003`, `e02_app_011`만 | 통과/실패 |
| 플래그 | 11개 | read/set 그래프 유지 | 통과/실패 |
| 상태 키 | 12개 | read/mutating 후보 유지 | 통과/실패 |

### 2. 전달 패키지 요약

아래 표를 작성한다.

| package | source_document | handoff_role | must_not_do |
|---|---|---|---|
| targets | 기존 후보/구현 컷 | 9개 대상 ID 유지 | 새 NPC 추가 |
| applications | 데이터 적용표 | 36행 매핑 | 새 application_id |
| reactions | 상태 반응표 | 36개 반응 참조 | 새 reaction_id |
| object_texts | 오브젝트 문구 은행 | 18개 문구 참조 | 새 object_text_id |
| flags | 적용표/QA | 11개 read/set 그래프 | 해금 플래그화 |
| state_keys | 적용표/QA | 12개 상태 키 | 새 상태 키 |
| validation | QA 체크리스트 | 금지 해금 검산 | 통과 기준 완화 |

### 3. 공통 필드 사전

아래 스키마 블록을 작성한다.

```yaml
E02ApplicationRecord:
  application_id:
  reaction_id:
  object_text_id:
  application_type:
  target_seed:
  campaign:
  trigger_state:
  trigger_flag:
  condition_expression:
  display_surface:
  text_source:
  state_result:
  flag_result:
  implementation_phase:
  protected_playable:
  qa_guard:

E02ObjectTextRecord:
  object_text_id:
  object_group:
  campaign:
  placement_node:
  default_state:
  changed_state:
  reads_states:
  reads_flags:
  linked_reactions:
  visibility_rule:
  replay_rule:
  protected_playable:
  qa_guard:

E02ReactionRecord:
  reaction_id:
  target_seed:
  campaign:
  reaction_type:
  state_key:
  flag_dependency:
  line_or_change_ref:
  display_surface:
  implementation_phase:
  protected_playable:
  forbidden_unlock:

E02FlagRecord:
  flag:
  set_by_application:
  read_by_applications:
  player_facing_surface:
  downstream_effect:
  forbidden_unlock:

E02StateKeyRecord:
  state_key:
  used_by_applications:
  read_only_or_mutating:
  allowed_effect:
  forbidden_effect:
```

### 4. enum 사전

아래 항목을 표로 작성한다.

| enum | allowed_values | forbidden_values | note |
|---|---|---|---|
| application_type | 허용값 | 금지값 | 처리 규칙 |
| display_surface | 허용값 | 금지값 | 노출 표면 |
| implementation_phase | 허용값 | 금지값 | 표시 시점 |
| protected_playable | 허용값 | 금지값 | 기능 보호 |
| forbidden_unlock | 금지 해금 목록 | 없음 | 발생 시 실패 |

### 5. application 매핑 전달표

수량:

```text
36행.
e02_app_001~e02_app_036을 정확히 1회씩 포함한다.
```

권장 표 구조:

| application_id | reaction_id | object_text_id | application_type | target_seed | campaign | trigger_state | trigger_flag | display_surface | implementation_phase | protected_playable | handoff_note |
|---|---|---|---|---|---|---|---|---|---|---|---|

규칙:

```text
기존 데이터 적용표의 값을 옮긴다.
새 행을 만들지 않는다.
새 ID를 만들지 않는다.
handoff_note에는 엔진 구현 시 주의할 금지 해금만 짧게 적는다.
```

### 6. object text 매핑 전달표

수량:

```text
18행.
e02_obj_001~e02_obj_018을 정확히 1회씩 포함한다.
```

권장 표 구조:

| object_text_id | object_group | campaign | placement_node | linked_reactions | visibility_rule | replay_rule | protected_playable | handoff_note |
|---|---|---|---|---|---|---|---|---|

규칙:

```text
오브젝트 문구 본문은 기존 오브젝트 문구 은행을 참조한다.
이 문서에서 새 문구를 쓰지 않는다.
```

### 7. reaction-only 전달 규칙

수량:

```text
8행.
```

권장 표 구조:

| application_id | reaction_id | display_surface | reason_for_reaction_only | engine_handling | must_not_create |
|---|---|---|---|---|---|

반드시 포함:

```text
engine_handling은 reaction.line_or_change 또는 system_state_change_only로 제한한다.
must_not_create는 새 object_text_id로 고정한다.
```

### 8. 직접 대면 제한 규칙

아래 표를 작성한다.

| direct_encounter_application | target_seed | allowed_once | repeat_rule | forbidden_expansion |
|---|---|---|---|---|

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

### 9. 플래그 read/set 그래프

수량:

```text
11행.
```

권장 표 구조:

| flag | set_by_application | read_by_applications | player_facing_surface | downstream_effect | forbidden_unlock |
|---|---|---|---|---|---|

규칙:

```text
기존 QA 체크리스트의 플래그 QA를 따른다.
플래그를 보상, 해금, 빠른 이동, 상점 개방으로 쓰지 않는다.
```

### 10. 상태 키 read/mutating 규칙

수량:

```text
12행.
```

권장 표 구조:

| state_key | used_by_applications | read_only_or_mutating | allowed_effect | forbidden_effect |
|---|---|---|---|---|

규칙:

```text
기존 QA 체크리스트의 상태 키 QA를 따른다.
상태 키는 세계 반응과 흔적 변화만 담당한다.
상태 키가 플레이어블 기능, 상점, 빠른 이동, 회복소, 정답 공개를 열면 실패다.
```

### 11. 플레이어블 보호 매트릭스

아래 표를 작성한다.

| protected_playable | protected_function | related_applications | schema_guard | fail_condition |
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

### 12. 엔진팀 전달 후보 파일명

이 섹션은 실제 파일을 만들지 않는다.
후속 엔진팀이 만들 수 있는 파일 후보명만 적는다.

권장 표 구조:

| future_engine_file_candidate | source_section | note | create_now |
|---|---|---|---|

`create_now`는 전부 `no`로 쓴다.

예시 후보:

```text
data/e02/first_slice_applications.*
data/e02/first_slice_object_texts.*
data/e02/first_slice_reactions.*
data/e02/first_slice_flags.*
data/e02/first_slice_state_keys.*
```

주의:

```text
확장자와 실제 저장 위치는 엔진팀이 별도 결정한다.
이번 문서에서 실제 파일을 만들지 않는다.
```

### 13. 구현 전 검증 체크리스트

아래 체크리스트를 작성한다.

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

### 14. 최종 판정

아래 중 하나로 판정한다.

```text
스키마 전달 가능:
QA 통과 산출물을 새 ID 없이 엔진팀 전달 문서로 정리했다.

조건부 전달:
새 ID는 없지만 일부 필드명, enum, 플래그 read/set 설명 보강이 필요하다.

보류:
새 ID, 금지 해금, 직접 대면 초과, 플레이어블 기능 침범 중 하나가 발견되었다.
```

### 15. 다음 작업 포인터

판정별로 다음 작업을 적는다.

```text
스키마 전달 가능:
E02 첫 외부 슬라이스 엔진 데이터 변환 전 검증 또는 실제 엔진 데이터 작성 프롬프트.

조건부 전달:
story/03_regions/e02_first_slice_engine_schema_handoff_patch_v0_1.md

보류:
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md 또는
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md 수정 지시.
```

---

## 8. 복붙용 작업 지시

아래 지시를 그대로 수행하라.

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 구현 데이터 전달/엔진 스키마화 문서를 작성한다.

이번 작성 문서:
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md

목표:
QA 통과가 끝난 E02 첫 외부 슬라이스의 9개 대상, 상태 반응 36개, 데이터 적용행 36개, 오브젝트 문구 18개를
실제 엔진 데이터로 옮기기 전에 필요한 필드 사전, enum, 매핑 전달표, 검증 체크리스트로 정리한다.

중요:
새 NPC를 만들지 않는다.
새 상태 반응을 만들지 않는다.
새 오브젝트 문구를 만들지 않는다.
새 application_id, reaction_id, object_text_id를 만들지 않는다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성하지 않는다.
이번 출력은 Markdown 문서 1개다.

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
2. story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
3. story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
4. story/03_regions/e02_first_slice_object_text_bank_v0_1.md
5. story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
6. story/03_regions/e02_npc_promotion_candidates_v0_1.md
7. story/06_characters/gate_09_profile_v1_0.md
8. story/06_characters/broad_10_profile_v1_0.md
9. story/06_characters/return_recipient_profile_v1_0.md
10. story/06_characters/quiet_07_profile_v1_0.md
11. story/06_characters/open_host_profile_v1_0.md
12. story/06_characters/patch_profile_v1_0.md
13. story/06_characters/meter_06_profile_v1_0.md
14. story/06_characters/rio_08_profile_v1_0.md

반드시 포함:
1. 입력 산출물 잠금
2. 전달 패키지 요약
3. 공통 필드 사전
4. enum 사전
5. 36행 application 매핑 전달표
6. 18행 object text 매핑 전달표
7. 8행 reaction-only 전달 규칙
8. 직접 대면 제한 규칙
9. 11개 플래그 read/set 그래프
10. 12개 상태 키 read/mutating 규칙
11. 플레이어블 보호 매트릭스
12. 후속 엔진팀 파일 후보명. 단, 실제 파일 생성은 전부 no
13. 구현 전 검증 체크리스트
14. 최종 판정
15. 다음 작업 포인터

고정 수량:
대상 9개.
e02_app_001~e02_app_036 36행.
e02_sr_001~e02_sr_036 36개.
e02_obj_001~e02_obj_018 18개.
reaction-only 8행.
직접 대면 2행.
플래그 11개.
상태 키 12개.

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

검수:
작성 후 코드펜스 균형을 확인한다.
trailing whitespace가 없게 한다.
표 수량을 확인한다.
e02_app_001~036, e02_sr_001~036, e02_obj_001~018 누락/중복을 확인한다.
reaction-only 8행이 새 object_text_id로 바뀌지 않았는지 확인한다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 만들지 않았는지 확인한다.
커밋/푸시는 별도 지시가 있을 때만 한다.
```

---

## 9. 빠른 판정 기준

### 9.1 스키마 전달 가능

```text
9개 대상이 유지되었다.
36개 application_id가 유지되었다.
36개 reaction_id가 유지되었다.
18개 object_text_id가 유지되었다.
reaction-only 8행이 유지되었다.
직접 대면 2행 제한이 유지되었다.
플래그 11개와 상태 키 12개가 기존 QA와 일치한다.
field dictionary와 enum이 엔진팀 전달용으로 읽힌다.
후속 엔진 파일 후보는 제안만 했고 실제 파일은 만들지 않았다.
금지 해금과 플레이어블 기능 침범이 없다.
```

### 9.2 조건부 전달

```text
ID와 수량은 유지되었지만 필드명 또는 enum명이 엔진팀 전달용으로 아직 애매하다.
플래그 read/set 그래프가 일부 행에서 더 명확해야 한다.
state_key의 read_only_or_mutating 구분이 일부 부족하다.
protected_playable과 forbidden_unlock 설명이 QA 문서보다 약하다.
```

### 9.3 보류

```text
새 ID가 생겼다.
reaction-only가 object_text_id로 승격되었다.
직접 대면이 2행을 넘었다.
상점, 빠른 이동, 방송 장악, 수리/강화 UI, 안전지대/회복소 중 하나가 열렸다.
실제 엔진 코드, JSON, CSV, Godot 리소스 파일을 작성했다.
```

---

## 10. 다음 작업

```text
이 프롬프트를 사용해 story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md를 작성한다.
작성 후 판정이 스키마 전달 가능이면 실제 엔진 데이터 변환 전 검증 프롬프트를 만든다.
조건부 전달이면 남은 필드/enum/검증 조건만 보완하는 패치 프롬프트를 만든다.
보류면 QA 체크리스트 또는 데이터 적용표 수정 지시로 되돌린다.
```
