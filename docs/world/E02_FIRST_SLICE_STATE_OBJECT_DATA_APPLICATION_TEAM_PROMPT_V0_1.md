# E02 First Slice State/Object Data Application Team Prompt v0.1

## 목적

이 프롬프트는 NPC/월드 구현 데이터 제작팀에게 그대로 전달하는 작업 지시서다.

이번 작업은 새 NPC 제작, 새 오브젝트 문구 제작, 새 상태 반응 제작이 아니다. 이미 작성된 E02 첫 외부 슬라이스 상태 반응 36개와 오브젝트 문구 18개를 구현자가 바로 참조할 수 있도록 데이터 적용표로 연결한다.

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
```

이번 작업의 출력물은 아래 1개 문서만 허용한다.

```text
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
```

## 반드시 먼저 읽을 문서

직접 기준:

```text
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
story/03_regions/e02_npc_promotion_candidates_v0_1.md
```

보조 기준:

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/E02_FIRST_SLICE_STATE_OBJECT_EXPANSION_TEAM_PROMPT_V0_1.md
story/03_regions/e02_locker_recipient_profile_v0_1.md
story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md
story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md
story/03_regions/e02_first_slice_dialogue_bank_v0_1.md
story/03_regions/e02_trace_object_bank_v0_1.md
story/06_characters/gate_09_profile_v1_0.md
story/06_characters/broad_10_profile_v1_0.md
```

## 작업 목표

상태 반응 매트릭스와 오브젝트 문구 은행은 이미 작성되어 있다.

이번 작업은 두 문서를 아래처럼 연결한다.

1. `e02_sr_001`~`e02_sr_036` 반응이 어디에서 발동되는지 정리한다.
2. 각 반응이 참조하는 `e02_obj_001`~`e02_obj_018` 문구를 연결한다.
3. 오브젝트 문구가 없는 직접 대면/반응 전용 항목은 새 오브젝트를 만들지 않고 `reaction-only`로 표시한다.
4. 상태 키, 플래그, 노출 표면, 표시 조건, 후속 효과를 구현 데이터 항목으로 분리한다.
5. GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO 침범 방지 규칙을 행 단위로 남긴다.

## 출력 문서 구조

출력 문서 제목:

```text
# E02 첫 외부 슬라이스 상태/오브젝트 데이터 적용표 v0.1
```

### 0. 문서 상태

아래 내용을 명시한다.

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 상태 반응과 오브젝트 문구의 구현 데이터 적용표.
새 NPC 제작 아님.
새 오브젝트 문구 제작 아님.
엔진 코드 작성 아님.

판정:
통과 / 조건부 통과 / 보류 중 하나
```

### 1. 입력 산출물 검산

아래 표를 작성한다.

| 항목 | 기준 | 결과 |
|---|---:|---:|
| 상태 반응 ID | 36개 | 실제 개수 |
| 오브젝트 문구 ID | 18개 | 실제 개수 |
| 새 NPC | 0명 | 실제 개수 |
| 새 오브젝트 ID | 0개 | 실제 개수 |
| 직접 대면 반응 | 최대 2행 | 실제 개수 |
| reaction-only 항목 | 허용 | 실제 개수 |

검산 기준:

```text
상태 반응은 e02_sr_001부터 e02_sr_036까지 모두 포함해야 한다.
오브젝트 문구는 e02_obj_001부터 e02_obj_018까지 모두 포함해야 한다.
새로운 e02_sr_037, e02_obj_019 같은 ID를 만들지 않는다.
```

### 2. 데이터 적용 메인 테이블

이 문서의 핵심 표다.

수량:

```text
36행.
e02_sr_001~e02_sr_036을 정확히 1회씩 포함한다.
```

권장 표 구조:

| application_id | reaction_id | object_text_id | application_type | target_seed | campaign | trigger_state | trigger_flag | condition_expression | display_surface | text_source | state_result | flag_result | implementation_phase | protected_playable | qa_guard |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

작성 규칙:

- `application_id`는 `e02_app_001`~`e02_app_036` 형식으로 작성한다.
- `reaction_id`는 반드시 `e02_sr_001`~`e02_sr_036`만 사용한다.
- `object_text_id`는 연결 가능한 경우 `e02_obj_001`~`e02_obj_018`만 사용한다.
- 오브젝트 문구가 없는 직접 대면, 장치 반응, 전광판 반응은 `object_text_id`를 `reaction-only`로 적는다.
- `application_type`은 아래 중 하나로 제한한다.

```text
object_text
reaction_only
direct_encounter
device_voice
ambient_log
hub_reaction_candidate
```

- `display_surface`는 아래 중 하나로 제한한다.

```text
locker_ui
locker_log
collection_room_light
billboard
caption
studio_log
gate_log
platform_list
pass_reader
receipt
inspection_sheet
shelter_speaker
commuter_pass_log
direct_encounter
hub_reaction
```

- `text_source`에는 다음 중 하나를 적는다.

```text
object.default_text
object.changed_text
reaction.line_or_change
system_state_change_only
```

- `state_result`는 수치가 아니라 구현자가 이해할 수 있는 짧은 상태 변화 설명으로 쓴다.
- `flag_result`는 새 플래그를 만들지 말고 기존 플래그의 set/read 용도만 적는다.
- `implementation_phase`는 아래 중 하나로 제한한다.

```text
first_seen
pre_boss
post_boss
revisit
hub_after_return
optional_trace
```

### 3. 오브젝트 배치 적용표

수량:

```text
18행.
e02_obj_001~e02_obj_018을 정확히 1회씩 포함한다.
```

권장 표 구조:

| object_text_id | object_group | campaign | placement_node | default_state | changed_state | reads_states | reads_flags | linked_reactions | visibility_rule | replay_rule | protected_playable | qa_guard |
|---|---|---|---|---|---|---|---|---|---|---|---|---|

작성 규칙:

- `placement_node`는 실제 지명이 아니라 유저용 캠페인식 위치로 적는다.
- `reads_states`에는 상태 키만 적고 새 상태 키를 만들지 않는다.
- `reads_flags`에는 기존 E02 플래그만 적는다.
- `linked_reactions`에는 연결된 `e02_sr_*` 목록을 적는다.
- 한 오브젝트에 여러 반응이 연결되어도 된다.
- 직접 대면 반응은 여기에 억지 배치하지 않는다.

### 4. 플래그 적용 그래프

아래 플래그를 모두 검토한다.

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

권장 표 구조:

| flag | set_by_application | read_by_applications | player_facing_surface | downstream_effect | forbidden_unlock |
|---|---|---|---|---|---|

작성 규칙:

- 새 플래그를 만들지 않는다.
- `set_by_application`이 아직 확정 불가하면 `source unclear / needs implementation owner`로 표시한다.
- `forbidden_unlock`에는 빠른 이동, 방송 장악, 배송 전투, 안전지대 같은 금지 해금을 적는다.

### 5. 상태 키 적용 사전

아래 상태 키를 모두 검토한다.

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

권장 표 구조:

| state_key | used_by_applications | read_only_or_mutating | allowed_effect | forbidden_effect |
|---|---|---|---|---|

작성 규칙:

- 실제 수치 밸런스를 확정하지 않는다.
- `allowed_effect`는 판정 지연, 문구 변화, 잔향 노출, 보급소 반응 후보처럼 기능 단위로 쓴다.
- `forbidden_effect`는 이동 해금, 회복소, 상점, 강화, 정답 공개처럼 명확히 쓴다.

### 6. 구현 제외 목록

반드시 아래를 다시 잠근다.

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

### 7. 구현팀 전달 요약

엔진/콘텐츠 구현팀이 바로 읽을 수 있게 10줄 이내로 요약한다.

반드시 포함:

```text
E02 첫 슬라이스는 9개 기존 대상만 사용한다.
상태 반응은 36개다.
오브젝트 문구 ID는 18개다.
직접 대면은 2행 이하로 제한한다.
object_text_id가 없는 반응은 reaction-only로 남긴다.
새 NPC와 새 오브젝트 ID를 만들지 않는다.
```

### 8. 검수 결과

문서 말미에 아래 검수 결과를 남긴다.

```text
출력 문서:
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md

상태 반응 적용 행:
36행 / e02_sr_001~e02_sr_036 포함 여부

오브젝트 배치 행:
18행 / e02_obj_001~e02_obj_018 포함 여부

새 NPC:
0명

새 reaction_id:
0개

새 object_text_id:
0개

직접 대면:
2행 이하

판정:
통과 / 조건부 통과 / 보류
```

## known gap 처리 규칙

기존 문서상 일부 반응은 오브젝트 문구 은행에 1:1 대응되는 `object_text_id`가 없다.

예:

```text
직접 대면 반응
보급소 반응 후보
전광판/장치 변화만 있고 별도 오브젝트 문구가 없는 반응
```

이 경우 새 오브젝트를 만들지 말고 아래처럼 처리한다.

```text
object_text_id:
reaction-only

text_source:
reaction.line_or_change

qa_guard:
새 오브젝트 문구 추가 금지. 기존 반응문을 표시하거나 상태 변화만 적용.
```

## 복붙용 작업 지시

아래 지시를 그대로 수행하라.

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 상태/오브젝트 데이터 적용표를 작성한다.

이번 작성 문서:
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md

목표:
이미 작성된 E02 상태 반응 36개와 오브젝트 문구 18개를 구현 데이터 적용표로 연결한다.

중요:
새 NPC를 만들지 않는다.
새 상태 반응을 만들지 않는다.
새 오브젝트 문구를 만들지 않는다.
새 reaction_id 또는 object_text_id를 만들지 않는다.
엔진 코드, JSON, CSV 파일을 작성하지 않는다.
이번 출력은 Markdown 문서 1개다.

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
2. story/03_regions/e02_first_slice_object_text_bank_v0_1.md
3. story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
4. story/03_regions/e02_npc_promotion_candidates_v0_1.md
5. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md

반드시 포함:
1. 입력 산출물 검산
2. 36행 데이터 적용 메인 테이블
3. 18행 오브젝트 배치 적용표
4. E02 플래그 적용 그래프
5. 상태 키 적용 사전
6. 구현 제외 목록
7. 구현팀 전달 요약
8. 검수 결과

검수:
e02_sr_001~e02_sr_036이 모두 정확히 1회씩 메인 테이블에 들어갔는지 확인한다.
e02_obj_001~e02_obj_018이 모두 정확히 1회씩 오브젝트 배치 적용표에 들어갔는지 확인한다.
직접 대면은 마지막 보관함 수취인과 막차 환승 보류관 범위를 넘기지 않는다.
GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO 기능을 대체하지 않는다.
작성 후 코드펜스 균형, trailing whitespace, 표 수량을 확인한다.
커밋/푸시는 별도 지시가 있을 때만 한다.
```
