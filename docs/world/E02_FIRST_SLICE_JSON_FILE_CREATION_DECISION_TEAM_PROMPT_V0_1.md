# E02 첫 외부 슬라이스 실제 JSON 파일 생성 여부 결정 팀 프롬프트 v0.1

## 0. 목적

너는 E02 첫 외부 슬라이스 NPC 엔진 데이터 패키지를 검수하고, 실제 JSON 파일을 생성해도 되는지 결정하는 팀이다.

이번 작업은 실제 파일 생성 작업이 아니다. `data/e02/*.json`, CSV, Godot 리소스, GDScript, 로더 코드, 엔진 코드는 만들지 않는다. 오직 생성 가능 여부와 조건을 판정하는 문서만 작성한다.

## 1. 작성해야 할 산출물

다음 문서를 새로 작성한다.

```text
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
```

문서 제목은 다음으로 고정한다.

```text
# E02 첫 외부 슬라이스 실제 JSON 파일 생성 여부 결정 v0.1
```

## 2. 반드시 읽을 입력 문서

아래 문서를 먼저 확인한다.

```text
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
```

## 3. 현재 고정된 패키지 상태

입력 패키지의 현재 상태는 다음 전제를 기준으로 검토한다.

```text
대상 수: 9
applications: 36
object_texts: 18
reactions: 36
flags: 11
state_keys: 12
reaction-only: 8
direct encounter: 2
actual_files_created: false
```

`reaction-only` 8행은 모두 `object_text_id: null`이어야 한다. 직접 대면은 2행 제한을 유지해야 한다. 새 NPC, 새 application ID, 새 reaction ID, 새 object ID, 새 flag, 새 state key를 만들면 안 된다.

## 4. 판정 선택지

문서의 최종 판정은 아래 넷 중 하나만 사용한다.

```text
생성 가능
조건부 생성 가능
보류
금지
```

### 4.1 생성 가능

다음 조건이 모두 맞으면 `생성 가능`으로 판정한다.

```text
Markdown 패키지의 JSON 코드블록이 모두 파싱 가능하다.
수량 검산이 모두 기존 QA 범위와 일치한다.
후보 파일 경로와 파일명이 충돌하지 않는다.
JSON이 현재 엔진 전달용 중립 데이터 형식으로 받아들여질 수 있다.
실제 파일 생성은 다음 별도 작업으로 분리되어 있다.
```

### 4.2 조건부 생성 가능

다음 중 하나라도 남아 있으면 `조건부 생성 가능`으로 판정한다.

```text
data/e02/ 경로 생성 여부를 아직 확정하지 못했다.
엔진 로더가 JSON을 직접 받을지, 별도 변환층이 필요한지 확정되지 않았다.
파일명은 맞지만 엔진 측 네이밍 컨벤션 확인이 필요하다.
패키지 값은 맞으나 실제 파일 생성 전 자동 검증 스크립트가 필요하다.
```

### 4.3 보류

다음 중 하나라도 발견하면 `보류`로 판정한다.

```text
JSON 코드블록 파싱 실패가 있다.
수량 검산이 맞지 않는다.
reaction-only 8행 중 object_text_id가 null이 아닌 행이 있다.
직접 대면 2행 제한이 깨졌다.
패키지와 스키마 전달 문서 사이의 필드명이 다르다.
```

### 4.4 금지

다음 요구가 섞이면 `금지`로 판정한다.

```text
이번 단계에서 실제 JSON 파일을 만들라고 되어 있다.
CSV, Godot 리소스, GDScript, 로더 코드, 엔진 코드를 만들라고 되어 있다.
새 NPC나 새 ID를 추가하라고 되어 있다.
문구, 대사, 반응, 오브젝트 텍스트를 새로 쓰라고 되어 있다.
플레이어블 해금, 능력, HP 0, 엔딩 조건을 추가하라고 되어 있다.
```

## 5. 후보 실제 파일 목록

결정 문서에는 아래 후보 파일명을 그대로 적는다.

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

이번 작업에서는 위 파일을 만들지 않는다. 위 목록은 다음 단계에서 실제 파일 생성 여부를 결정하기 위한 후보 목록이다.

## 6. 결정 문서 필수 구조

새 문서는 아래 구조를 따른다.

```text
# E02 첫 외부 슬라이스 실제 JSON 파일 생성 여부 결정 v0.1

## 0. 문서 상태
## 1. 입력 패키지 검산 요약
## 2. JSON 포맷 확정성 검토
## 3. 저장 경로와 파일명 검토
## 4. 파일별 생성 가능성
## 5. 생성 금지선
## 6. 실제 생성 프롬프트 전 조건
## 7. 검증 기준
## 8. 최종 판정
## 9. 다음 작업 포인터
```

## 7. 문서 상태 필수 문구

`## 0. 문서 상태`에는 아래 항목을 반드시 포함한다.

```text
문서 상태: v0.1
작업 성격: 실제 JSON 파일 생성 전 결정 문서
실제 파일 생성 여부: false
실제 JSON/CSV/Godot 리소스 생성: 금지
새 NPC/새 ID/새 문구 생성: 금지
최종 판정: 생성 가능 / 조건부 생성 가능 / 보류 / 금지 중 하나
```

## 8. 검산 항목

`## 1. 입력 패키지 검산 요약`에는 다음 표를 넣는다.

```text
| 항목 | 기대값 | 판정 |
|---|---:|---|
| 대상 수 | 9 |  |
| applications | 36 |  |
| object_texts | 18 |  |
| reactions | 36 |  |
| flags | 11 |  |
| state_keys | 12 |  |
| reaction-only | 8 |  |
| 직접 대면 | 2 |  |
| actual_files_created | false |  |
```

## 9. 파일별 생성 가능성 표

`## 4. 파일별 생성 가능성`에는 다음 표를 넣는다.

```text
| 후보 파일 | 입력 소스 | 생성 가능성 | 조건 |
|---|---|---|---|
| data/e02/first_slice_applications.json | applications JSON 블록 |  |  |
| data/e02/first_slice_object_texts.json | object_texts JSON 블록 |  |  |
| data/e02/first_slice_reactions.json | reactions JSON 블록 |  |  |
| data/e02/first_slice_flags.json | flags JSON 블록 |  |  |
| data/e02/first_slice_state_keys.json | state_keys JSON 블록 |  |  |
| data/e02/first_slice_validation.json | validation JSON 블록 |  |  |
```

## 10. 금지선

결정 문서에는 다음 금지선을 그대로 포함한다.

```text
이번 문서는 실제 JSON 파일을 만들지 않는다.
이번 문서는 CSV를 만들지 않는다.
이번 문서는 Godot 리소스 파일을 만들지 않는다.
이번 문서는 GDScript나 로더 코드를 만들지 않는다.
이번 문서는 새 NPC, 새 ID, 새 문구, 새 조건을 추가하지 않는다.
이번 문서는 플레이어블 해금/능력/엔딩/HP 0 조건을 만들지 않는다.
```

## 11. 다음 작업 포인터 규칙

최종 판정에 따라 `## 9. 다음 작업 포인터`를 다르게 쓴다.

### 생성 가능일 때

```text
다음 작업: E02 실제 JSON 파일 생성 프롬프트 작성
후보 프롬프트: docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
후보 산출물: data/e02/*.json
주의: 실제 파일 생성은 다음 프롬프트와 별도 명시 지시가 있을 때만 진행
```

### 조건부 생성 가능일 때

```text
다음 작업: E02 실제 JSON 파일 생성 조건 해소
후보 산출물: story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
주의: 조건 해소 전 실제 data/e02/*.json 생성 금지
```

### 보류일 때

```text
다음 작업: E02 엔진 데이터 패키지 보정 또는 재검산
후보 산출물: story/03_regions/e02_first_slice_engine_data_package_patch_v0_1.md
주의: 보류 사유 해소 전 실제 data/e02/*.json 생성 금지
```

### 금지일 때

```text
다음 작업: 요청 범위 재정의
주의: 실제 JSON/CSV/Godot/GDScript/엔진 코드 생성 금지
```

## 12. 검증

작업 후 최소한 아래를 확인한다.

```text
새 문서 코드펜스 균형
새 문서 trailing whitespace 없음
새 문서에 실제 data/e02/*.json 파일 생성 흔적 없음
새 문서에 새 NPC/새 ID/새 문구 생성 없음
git diff --check
```

가능하면 패키지 문서의 JSON 코드블록을 다시 파싱해서 검산한다. 단, 이번 작업의 산출물은 결정 문서뿐이다.
