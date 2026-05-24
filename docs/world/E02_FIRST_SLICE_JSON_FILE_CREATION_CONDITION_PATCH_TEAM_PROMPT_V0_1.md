# E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건 해소 팀 프롬프트 v0.1

이 문서는 NPC/엔진 데이터 제작팀에게 `NPC-7.12 E02 실제 JSON 파일 생성 조건 해소`를 맡기기 위한 복붙용 프롬프트다.

목표는 실제 JSON 파일을 만드는 것이 아니다.
목표는 `조건부 생성 가능` 판정을 받은 E02 첫 외부 슬라이스 엔진 데이터 패키지가 실제 파일 생성 단계로 넘어가도 되는지, 남은 조건을 문서로 해소하는 것이다.

핵심:

```text
이번 작업은 조건 해소 문서 작성이다.
data/e02/ 디렉터리를 만들지 않는다.
data/e02/*.json 파일을 만들지 않는다.
CSV, Godot 리소스, GDScript, 로더 코드, 엔진 코드를 만들지 않는다.
새 NPC, 새 ID, 새 문구, 새 상태값을 추가하지 않는다.
```

---

## 0. 현재 상태

```text
완료 문서:
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md

현재 판정:
조건부 생성 가능

다음 작성 문서:
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md

작성 목표:
실제 JSON 파일 생성 전 조건 해소

조건 해소 후 후보 작업:
docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
data/e02/*.json
```

현재 패키지 데이터 자체는 생성 가능 수준으로 검산되었다.
다만 실제 파일 생성 전 아래 3개 조건을 문서로 잠가야 한다.

```text
1. data/e02/ 경로 생성 승인
2. 엔진 로더/변환층에서 JSON이 맡을 역할 확정
3. 실제 파일 생성 후 자동 검증 절차 확정
```

---

## 1. 작성해야 할 산출물

다음 문서를 새로 작성한다.

```text
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
```

문서 제목은 다음으로 고정한다.

```text
# E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건 해소 v0.1
```

이번 작업에서 실제 생성하면 안 되는 후보 파일:

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

---

## 2. 반드시 읽을 입력 문서

아래 문서를 먼저 확인한다.

```text
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/E02_FIRST_SLICE_JSON_FILE_CREATION_DECISION_TEAM_PROMPT_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
```

필요하면 엔진 프로젝트의 현재 데이터 관례를 확인하기 위해 아래를 읽을 수 있다.

```text
project.godot
```

단, 이번 작업에서 엔진 코드나 리소스 파일은 작성하지 않는다.

---

## 3. 현재 검산 기준

결정 문서에서 통과한 값은 유지한다.

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

`reaction-only` 8행은 모두 `object_text_id: null`이어야 한다.
직접 대면 application은 `e02_app_003`, `e02_app_011`만 허용한다.
새 application, reaction, object, flag, state key ID를 만들면 안 된다.

---

## 4. 조건 해소 대상

### 4.1 data/e02/ 경로 생성 승인

조건 해소 문서에서 판정할 것:

```text
data/e02/ 경로를 다음 실제 파일 생성 단계의 후보 경로로 승인할 수 있는가.
경로가 E02 전용 데이터라는 의미를 충분히 가진다.
기존 파일/디렉터리와 충돌하지 않는다.
이번 조건 해소 문서에서는 경로를 만들지 않는다.
```

권장 판정:

```text
경로 생성 승인 가능.
단, 실제 디렉터리 생성은 다음 actual JSON writing 작업에서만 허용.
```

보류 판정 조건:

```text
기존 프로젝트에 다른 데이터 루트 규칙이 있고 data/e02/가 충돌한다.
E02 데이터가 story 문서 내부에만 남아야 한다는 별도 지시가 있다.
data/e02/가 엔진 빌드/리소스 로딩 규칙과 충돌한다.
```

### 4.2 엔진 로더/변환층 역할 확정

조건 해소 문서에서 JSON의 역할을 확정한다.

가장 안전한 기본 판정:

```text
E02 첫 외부 슬라이스 JSON은 런타임 로더 계약이 아니라,
엔진/데이터 변환 전 중립 소스 데이터로 생성한다.
Godot 리소스 변환, GDScript 로더, 런타임 직접 로딩은 별도 엔진 작업으로 분리한다.
```

직접 로딩 판정은 현재 프로젝트에 JSON 직접 로딩 규칙이 명확할 때만 허용한다.
확인되지 않으면 직접 로딩으로 쓰지 않는다.

금지:

```text
이번 조건 해소 문서에서 로더 코드를 작성한다.
이번 조건 해소 문서에서 Godot 리소스 파일을 작성한다.
이번 조건 해소 문서에서 data/e02/*.json을 런타임 필수 파일로 확정한다.
이번 조건 해소 문서에서 CSV나 .tres/.res 변환물을 만든다.
```

### 4.3 자동 검증 절차 확정

조건 해소 문서에는 실제 JSON 파일 생성 후 실행할 검증 절차를 확정한다.

필수 검증:

```text
6개 JSON 파일이 모두 parse 가능하다.
applications는 36행이다.
object_texts는 18행이다.
reactions는 36행이다.
flags는 11행이다.
state_keys는 12행이다.
reaction-only는 8행이며 모두 object_text_id가 null이다.
직접 대면 application은 e02_app_003, e02_app_011뿐이다.
새 application/reaction/object/flag/state_key ID가 없다.
모든 application의 reaction_id가 reactions에 존재한다.
object_text_id가 null이 아닌 application은 object_texts에 존재하는 ID만 참조한다.
validation 파일은 실제 산출 파일 기준으로 갱신된다.
CSV/Godot/GDScript/로더 코드가 생성되지 않았다.
```

검증 방식은 아래 둘 중 하나로 고정한다.

```text
1. 실제 생성 프롬프트에 PowerShell 검산 명령을 포함한다.
2. 실제 생성 프롬프트에서 별도 검증 스크립트 작성 여부를 다시 결정한다.
```

권장 판정:

```text
이번 조건 해소 문서에서는 검증 스크립트를 만들지 않는다.
다음 실제 JSON 파일 생성 프롬프트에 PowerShell 기반 parse/count/reference 검산 명령을 필수로 포함한다.
```

---

## 5. 출력 문서 필수 구조

새 문서는 아래 구조를 따른다.

```text
# E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건 해소 v0.1

## 0. 문서 상태
## 1. 이전 판정 요약
## 2. 조건 해소 대상 목록
## 3. data/e02/ 경로 생성 승인 판정
## 4. JSON의 엔진 역할 판정
## 5. 자동 검증 절차 판정
## 6. 실제 생성 허용 파일 목록
## 7. 실제 생성 금지선
## 8. 다음 actual JSON writing 프롬프트 요구사항
## 9. 최종 판정
## 10. 다음 작업 포인터
```

`## 0. 문서 상태`에는 아래를 반드시 포함한다.

```text
문서 상태: v0.1
작업 성격: 실제 JSON 파일 생성 전 조건 해소 문서
실제 파일 생성 여부: false
data/e02/ 디렉터리 생성 여부: false
실제 JSON/CSV/Godot 리소스 생성: 금지
새 NPC/새 ID/새 문구 생성: 금지
이전 판정: 조건부 생성 가능
이번 판정: 조건 해소 / 조건부 유지 / 보류 / 금지 중 하나
```

---

## 6. 조건 해소 대상 표

`## 2. 조건 해소 대상 목록`에는 다음 표를 넣는다.

```text
| 조건 | 이전 상태 | 이번 판정 | 후속 처리 |
|---|---|---|---|
| data/e02/ 경로 생성 승인 | 미확정 |  |  |
| 엔진 로더/변환층 역할 | 미확정 |  |  |
| 자동 검증 절차 | 미확정 |  |  |
```

---

## 7. 실제 생성 허용 파일 목록

조건이 해소될 경우, 실제 생성 단계에서 허용할 파일은 아래 6개뿐이다.

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

이 목록은 조건 해소 문서에 후보 목록으로만 적는다.
이번 작업에서는 파일을 만들지 않는다.

---

## 8. 실제 생성 금지선

조건 해소 문서에는 다음 금지선을 그대로 포함한다.

```text
이번 문서는 data/e02/ 디렉터리를 만들지 않는다.
이번 문서는 실제 JSON 파일을 만들지 않는다.
이번 문서는 CSV를 만들지 않는다.
이번 문서는 Godot 리소스 파일을 만들지 않는다.
이번 문서는 GDScript나 로더 코드를 만들지 않는다.
이번 문서는 새 NPC, 새 ID, 새 문구, 새 조건을 추가하지 않는다.
이번 문서는 플레이어블 해금/능력/엔딩/HP 0 조건을 만들지 않는다.
```

---

## 9. 최종 판정 기준

최종 판정은 아래 넷 중 하나만 사용한다.

```text
조건 해소
조건부 유지
보류
금지
```

### 9.1 조건 해소

아래가 모두 성립하면 `조건 해소`로 판정한다.

```text
data/e02/ 경로를 다음 작업에서 생성해도 되는 후보 경로로 승인했다.
JSON의 역할을 중립 소스 데이터 또는 직접 로딩 데이터 중 하나로 명확히 정했다.
직접 로딩이 확정되지 않으면 중립 소스 데이터로 제한했다.
실제 생성 후 검증 절차를 확정했다.
허용 파일이 6개 JSON으로 제한되어 있다.
CSV/Godot/GDScript/로더 코드 생성 금지선이 유지된다.
```

### 9.2 조건부 유지

아래 중 하나라도 남으면 `조건부 유지`로 판정한다.

```text
data/e02/ 경로는 좋아 보이지만 프로젝트 데이터 루트 확인이 더 필요하다.
JSON을 중립 소스 데이터로 둘지 런타임 직접 로딩 데이터로 둘지 아직 선택하지 못했다.
검증 절차가 체크리스트 수준이고 실제 명령/스크립트 방식이 불충분하다.
```

### 9.3 보류

아래 중 하나라도 발견하면 `보류`로 판정한다.

```text
패키지 데이터 검산이 이전 결정 문서와 달라졌다.
6개 파일 외의 산출물이 필요해졌다.
data/e02/ 경로가 프로젝트 구조와 충돌한다.
JSON 형식으로 생성하기 전에 스키마 재검토가 필요하다.
```

### 9.4 금지

아래 요구가 섞이면 `금지`로 판정한다.

```text
이번 단계에서 실제 JSON 파일을 만들라고 되어 있다.
이번 단계에서 data/e02/ 디렉터리를 만들라고 되어 있다.
CSV, Godot 리소스, GDScript, 로더 코드, 엔진 코드를 만들라고 되어 있다.
새 NPC나 새 ID를 추가하라고 되어 있다.
문구, 대사, 반응, 오브젝트 텍스트를 새로 쓰라고 되어 있다.
```

---

## 10. 다음 작업 포인터 규칙

최종 판정에 따라 `## 10. 다음 작업 포인터`를 다르게 쓴다.

### 조건 해소일 때

```text
다음 작업: E02 실제 JSON 파일 생성 프롬프트 작성
후보 프롬프트: docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
후보 산출물: data/e02/*.json
주의: 실제 파일 생성은 다음 프롬프트와 별도 명시 지시가 있을 때만 진행
```

### 조건부 유지일 때

```text
다음 작업: E02 실제 JSON 파일 생성 조건 추가 보완
후보 산출물: story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_2.md
주의: 조건 해소 전 실제 data/e02/*.json 생성 금지
```

### 보류일 때

```text
다음 작업: E02 엔진 데이터 패키지/스키마 재검토
후보 산출물: story/03_regions/e02_first_slice_engine_data_package_patch_v0_1.md
주의: 보류 사유 해소 전 실제 data/e02/*.json 생성 금지
```

### 금지일 때

```text
다음 작업: 요청 범위 재정의
주의: 실제 JSON/CSV/Godot/GDScript/엔진 코드 생성 금지
```

---

## 11. 복붙용 마스터 프롬프트

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건 해소 문서를 작성한다.

이번 작성 문서:
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md

현재 판정:
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md에서 조건부 생성 가능.

목표:
실제 data/e02/*.json 파일 생성 전에 남은 조건을 해소한다.
남은 조건은 data/e02/ 경로 생성 승인, 엔진 로더/변환층에서 JSON이 맡을 역할 확정, 실제 파일 생성 후 자동 검증 절차 확정이다.

중요:
이번 작업은 조건 해소 문서 작성이다.
data/e02/ 디렉터리를 만들지 않는다.
data/e02/*.json 파일을 만들지 않는다.
CSV, Godot 리소스, GDScript, 로더 코드, 엔진 코드를 만들지 않는다.
새 NPC, 새 ID, 새 문구, 새 상태값을 추가하지 않는다.

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
2. story/03_regions/e02_first_slice_engine_data_package_v0_1.md
3. story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
4. story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
5. story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
6. story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
7. story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
8. story/03_regions/e02_first_slice_object_text_bank_v0_1.md
9. story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
10. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
11. docs/world/E02_FIRST_SLICE_JSON_FILE_CREATION_DECISION_TEAM_PROMPT_V0_1.md

반드시 유지할 검산:
대상 수 9
applications 36
object_texts 18
reactions 36
flags 11
state_keys 12
reaction-only 8
direct encounter 2
actual_files_created false

반드시 해소할 조건:
1. data/e02/ 경로를 다음 실제 파일 생성 단계의 후보 경로로 승인할 수 있는지 판정한다.
2. JSON의 역할을 중립 소스 데이터 또는 직접 로딩 데이터 중 하나로 정한다.
3. 직접 로딩이 확정되지 않으면 중립 소스 데이터로 제한한다.
4. 실제 생성 후 자동 검증 절차를 확정한다.
5. 허용 파일을 아래 6개로 제한한다.

허용 후보 파일:
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json

출력 문서 구조:
# E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건 해소 v0.1

## 0. 문서 상태
## 1. 이전 판정 요약
## 2. 조건 해소 대상 목록
## 3. data/e02/ 경로 생성 승인 판정
## 4. JSON의 엔진 역할 판정
## 5. 자동 검증 절차 판정
## 6. 실제 생성 허용 파일 목록
## 7. 실제 생성 금지선
## 8. 다음 actual JSON writing 프롬프트 요구사항
## 9. 최종 판정
## 10. 다음 작업 포인터

최종 판정은 아래 넷 중 하나만 쓴다.
1. 조건 해소
2. 조건부 유지
3. 보류
4. 금지

완료 기준:
1. 코드펜스 균형을 맞춘다.
2. trailing whitespace가 없게 한다.
3. 실제 data/e02/ 디렉터리를 만들지 않는다.
4. 실제 data/e02/*.json 파일을 만들지 않는다.
5. CSV/Godot/GDScript/로더 코드 생성 금지선을 유지한다.
6. 새 NPC, 새 ID, 새 문구, 새 상태값을 만들지 않는다.
7. 다음 작업 포인터를 명확히 적는다.
```

---

## 12. 검증

작업 후 최소한 아래를 확인한다.

```text
새 문서 코드펜스 균형
새 문서 trailing whitespace 없음
새 문서에 실제 data/e02/*.json 파일 생성 흔적 없음
새 문서 작성 후에도 data/e02/ 디렉터리 없음
새 NPC/새 ID/새 문구 생성 없음
git diff --check
```
