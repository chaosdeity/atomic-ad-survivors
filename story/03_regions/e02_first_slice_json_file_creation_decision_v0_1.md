# E02 첫 외부 슬라이스 실제 JSON 파일 생성 여부 결정 v0.1

## 0. 문서 상태

```text
문서 상태: v0.1
작업 성격: 실제 JSON 파일 생성 전 결정 문서
실제 파일 생성 여부: false
실제 JSON/CSV/Godot 리소스 생성: 금지
새 NPC/새 ID/새 문구 생성: 금지
최종 판정: 조건부 생성 가능
```

이번 문서는 `story/03_regions/e02_first_slice_engine_data_package_v0_1.md`의 Markdown 내부 JSON 패키지를 검산하고, 다음 단계에서 실제 `data/e02/*.json` 파일을 만들어도 되는지 판단한다.

판정 요약:

```text
패키지 데이터 자체는 생성 가능 수준이다.
다만 data/e02/ 경로 생성 승인, 엔진 로더/변환층 확정, 실제 파일 생성용 자동 검증 절차가 아직 별도 문서로 잠겨 있지 않으므로 조건부 생성 가능으로 둔다.
```

---

## 1. 입력 패키지 검산 요약

| 항목 | 기대값 | 판정 |
|---|---:|---|
| 대상 수 | 9 | 통과 |
| applications | 36 | 통과 |
| object_texts | 18 | 통과 |
| reactions | 36 | 통과 |
| flags | 11 | 통과 |
| state_keys | 12 | 통과 |
| reaction-only | 8 | 통과 |
| 직접 대면 | 2 | 통과 |
| actual_files_created | false | 통과 |

추가 검산:

| 검산 | 결과 | 판정 |
|---|---|---|
| Markdown JSON 코드블록 파싱 | 7개 파싱 성공 | 통과 |
| reaction-only `object_text_id` | 8행 모두 `null` | 통과 |
| 직접 대면 application | `e02_app_003`, `e02_app_011` | 통과 |
| 초과 ID | `e02_app_037`, `e02_sr_037`, `e02_obj_019` 없음 | 통과 |
| 실제 `data/e02` 파일 생성 | 생성하지 않음 | 통과 |

입력 문서:

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

---

## 2. JSON 포맷 확정성 검토

| 검토 항목 | 현재 상태 | 판정 |
|---|---|---|
| JSON 파싱 가능성 | 패키지 내 JSON 코드블록 7개 파싱 성공 | 생성 가능 |
| 데이터 분리 단위 | manifest, applications, object_texts, reactions, flags, state_keys, validation으로 분리 가능 | 생성 가능 |
| 중립 데이터 형식 | Godot 리소스나 GDScript가 아니라 순수 JSON 객체/배열 | 생성 가능 |
| 값 원본성 | 기존 상태 반응/오브젝트 문구/스키마 전달 문서 값을 재구조화 | 생성 가능 |
| 엔진 로더 수용 방식 | JSON 직접 로딩 또는 변환층 여부 미확정 | 조건 필요 |
| 자동 검증 방식 | 수동 PowerShell 파싱 검산은 통과, 실제 파일 생성 전 전용 검증 스크립트 필요 | 조건 필요 |

판정:

```text
JSON 포맷 자체는 생성 가능하다.
다만 엔진 로더가 JSON을 직접 읽을지, Godot 리소스 변환 전 중간 데이터로 둘지 아직 확정되지 않았다.
```

---

## 3. 저장 경로와 파일명 검토

후보 저장 경로:

```text
data/e02/
```

현재 경로 상태:

```text
data/e02/는 현재 생성하지 않았다.
이번 문서에서도 생성하지 않는다.
```

후보 파일명:

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

파일명 판정:

| 검토 항목 | 판정 | 이유 |
|---|---|---|
| 파일명 충돌 | 통과 | 현재 실제 후보 파일이 생성되어 있지 않다 |
| 경로 충돌 | 조건 필요 | `data/e02/` 경로 자체가 아직 생성 승인되지 않았다 |
| 이름 규칙 | 조건부 통과 | snake_case이며 패키지 섹션명과 일치하지만 엔진 측 네이밍 컨벤션 확인 필요 |
| 범위 분리 | 통과 | applications/object_texts/reactions/flags/state_keys/validation으로 분리 가능 |

---

## 4. 파일별 생성 가능성

| 후보 파일 | 입력 소스 | 생성 가능성 | 조건 |
|---|---|---|---|
| `data/e02/first_slice_applications.json` | applications JSON 블록 | 조건부 생성 가능 | 36행 검증 스크립트와 `reaction-only` null 검산 필요 |
| `data/e02/first_slice_object_texts.json` | object_texts JSON 블록 | 조건부 생성 가능 | 18행 검증과 원문 문구 변형 없음 확인 필요 |
| `data/e02/first_slice_reactions.json` | reactions JSON 블록 | 조건부 생성 가능 | 36행 검증과 `line_or_change` 원문 보존 확인 필요 |
| `data/e02/first_slice_flags.json` | flags JSON 블록 | 조건부 생성 가능 | 11개 read/set 그래프 검증 필요 |
| `data/e02/first_slice_state_keys.json` | state_keys JSON 블록 | 조건부 생성 가능 | 12개 상태 키와 허용/금지 효과 검증 필요 |
| `data/e02/first_slice_validation.json` | validation JSON 블록 | 조건부 생성 가능 | 실제 파일 생성 후 산출 파일 기준 재검산 필요 |

공통 조건:

```text
실제 파일 생성 전 data/e02/ 경로 생성 승인.
엔진이 JSON을 직접 읽을지, 중간 변환 데이터로 둘지 결정.
실제 파일 생성 프롬프트 별도 작성.
생성 후 자동 검증 스크립트 또는 동등한 검산 명령 실행.
```

---

## 5. 생성 금지선

```text
이번 문서는 실제 JSON 파일을 만들지 않는다.
이번 문서는 CSV를 만들지 않는다.
이번 문서는 Godot 리소스 파일을 만들지 않는다.
이번 문서는 GDScript나 로더 코드를 만들지 않는다.
이번 문서는 새 NPC, 새 ID, 새 문구, 새 조건을 추가하지 않는다.
이번 문서는 플레이어블 해금/능력/엔딩/HP 0 조건을 만들지 않는다.
```

금지선 검산:

| 금지선 | 이번 문서 처리 | 판정 |
|---|---|---|
| 실제 JSON 파일 생성 | 하지 않음 | 통과 |
| CSV/Godot/GDScript 생성 | 하지 않음 | 통과 |
| 새 NPC/새 ID/새 문구 | 추가하지 않음 | 통과 |
| 플레이어블 해금/능력/엔딩/HP 0 | 추가하지 않음 | 통과 |

---

## 6. 실제 생성 프롬프트 전 조건

실제 JSON 파일 생성 프롬프트로 넘어가기 전 필요한 조건:

1. `data/e02/` 경로 생성 여부를 확정한다.
2. 엔진 로더가 JSON을 직접 읽는지, Godot 리소스로 변환할 중간 데이터인지 확정한다.
3. 실제 생성 프롬프트에서 허용 파일을 6개 후보로 제한한다.
4. 실제 생성 프롬프트에서 CSV, `.tres`, `.res`, GDScript, 로더 코드 생성을 금지한다.
5. 생성 후 applications 36 / object_texts 18 / reactions 36 / flags 11 / state_keys 12 검산을 다시 실행한다.
6. reaction-only 8행의 `object_text_id: null`과 직접 대면 2행 제한을 다시 확인한다.
7. 실제 생성 후 `story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md`를 소스 결정 문서로 링크한다.

---

## 7. 검증 기준

실제 파일 생성 단계의 최소 검증 기준:

```text
[ ] `data/e02/first_slice_applications.json`이 JSON parse 가능하다.
[ ] `data/e02/first_slice_object_texts.json`이 JSON parse 가능하다.
[ ] `data/e02/first_slice_reactions.json`이 JSON parse 가능하다.
[ ] `data/e02/first_slice_flags.json`이 JSON parse 가능하다.
[ ] `data/e02/first_slice_state_keys.json`이 JSON parse 가능하다.
[ ] `data/e02/first_slice_validation.json`이 JSON parse 가능하다.
[ ] applications는 36행이다.
[ ] object_texts는 18행이다.
[ ] reactions는 36행이다.
[ ] flags는 11행이다.
[ ] state_keys는 12행이다.
[ ] reaction-only는 8행이며 모두 object_text_id가 null이다.
[ ] 직접 대면은 e02_app_003, e02_app_011뿐이다.
[ ] actual_files_created는 실제 생성 후 validation 파일에서만 true 여부를 별도로 판단한다.
[ ] 새 application/reaction/object/flag/state_key ID가 없다.
```

이번 결정 문서 검증 기준:

```text
[x] 새 문서 코드펜스 균형 확인 대상.
[x] 새 문서 trailing whitespace 확인 대상.
[x] 실제 data/e02/*.json 파일 생성 없음.
[x] 새 NPC/새 ID/새 문구 생성 없음.
```

---

## 8. 최종 판정

```text
최종 판정:
조건부 생성 가능

이유:
입력 패키지의 JSON 코드블록은 파싱 가능하고, 수량/ID/reaction-only/직접 대면/actual_files_created 검산이 통과했다.
후보 파일명은 충돌하지 않으며, 데이터는 엔진 전달용 중립 JSON으로 분리할 수 있다.
다만 data/e02/ 경로 생성 승인, 엔진 로더/변환층 확정, 실제 파일 생성 후 자동 검증 절차가 아직 잠기지 않았다.
따라서 조건 해소 전 실제 data/e02/*.json 파일을 만들지 않는다.
```

---

## 9. 다음 작업 포인터

```text
다음 작업: E02 실제 JSON 파일 생성 조건 해소
후보 산출물: story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
주의: 조건 해소 전 실제 data/e02/*.json 생성 금지
```

조건 해소 후 후보 작업:

```text
후보 프롬프트: docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
후보 산출물: data/e02/*.json
주의: 실제 파일 생성은 별도 명시 지시가 있을 때만 진행한다.
```
