# E02 첫 외부 슬라이스 실제 JSON 파일 생성 조건 해소 v0.1

## 0. 문서 상태

```text
문서 상태: v0.1
작업 성격: 실제 JSON 파일 생성 전 조건 해소 문서
실제 파일 생성 여부: false
data/e02/ 디렉터리 생성 여부: false
실제 JSON/CSV/Godot 리소스 생성: 금지
새 NPC/새 ID/새 문구 생성: 금지
이전 판정: 조건부 생성 가능
이번 판정: 조건 해소
```

이번 문서는 `story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md`에서 남긴 조건 3개를 실제 파일 생성 없이 해소한다.

해소 원칙:

```text
data/e02/는 다음 실제 JSON 파일 생성 단계의 후보 경로로 승인한다.
E02 JSON은 런타임 직접 로딩 계약이 아니라 엔진/데이터 변환 전 중립 소스 데이터로 확정한다.
실제 파일 생성 후 검증은 PowerShell 기반 parse/count/reference 검산 명령을 필수로 포함한다.
```

---

## 1. 이전 판정 요약

이전 결정 문서:

```text
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
```

이전 판정:

```text
조건부 생성 가능
```

조건부 사유:

| 조건 | 이전 상태 |
|---|---|
| `data/e02/` 경로 생성 승인 | 미확정 |
| 엔진 로더/변환층에서 JSON이 맡을 역할 | 미확정 |
| 실제 파일 생성 후 자동 검증 절차 | 미확정 |

유지되는 검산:

| 항목 | 값 | 판정 |
|---|---:|---|
| 대상 수 | 9 | 유지 |
| applications | 36 | 유지 |
| object_texts | 18 | 유지 |
| reactions | 36 | 유지 |
| flags | 11 | 유지 |
| state_keys | 12 | 유지 |
| reaction-only | 8 | 유지 |
| direct encounter | 2 | 유지 |
| actual_files_created | false | 유지 |

---

## 2. 조건 해소 대상 목록

| 조건 | 이전 상태 | 이번 판정 | 후속 처리 |
|---|---|---|---|
| `data/e02/` 경로 생성 승인 | 미확정 | 승인 | 다음 actual JSON writing 작업에서만 디렉터리 생성 허용 |
| 엔진 로더/변환층 역할 | 미확정 | 중립 소스 데이터로 확정 | 런타임 직접 로딩, Godot 리소스 변환, 로더 코드는 별도 엔진 작업으로 분리 |
| 자동 검증 절차 | 미확정 | PowerShell 검산 명령 필수 포함으로 확정 | 다음 actual JSON writing 프롬프트에 parse/count/reference 검산 명령 포함 |

---

## 3. data/e02/ 경로 생성 승인 판정

판정:

```text
data/e02/ 경로 생성 승인 가능.
단, 이번 문서에서는 data/e02/ 디렉터리를 만들지 않는다.
실제 디렉터리 생성은 다음 actual JSON writing 작업에서만 허용한다.
```

근거:

| 근거 | 확인 |
|---|---|
| 프로젝트에 `data/` 루트가 존재한다 | 확인 |
| 기존 데이터 경로로 `data/world/e01_world_map_nodes_v0_1.json`이 있다 | 확인 |
| E02 전용 데이터는 `data/e02/`로 분리해도 의미가 명확하다 | 확인 |
| 현재 `data/e02/`는 존재하지 않아 기존 파일과 충돌하지 않는다 | 확인 |
| 이번 조건 해소 문서에서 실제 경로를 만들지 않는다 | 확인 |

경로 의미:

```text
data/e02/는 E02 첫 외부 슬라이스 NPC/상태/오브젝트 변환용 중립 데이터 후보 경로다.
이 경로는 story 문서 원본을 대체하지 않는다.
이 경로는 Godot 리소스 경로 또는 런타임 로더 계약을 자동으로 의미하지 않는다.
```

---

## 4. JSON의 엔진 역할 판정

판정:

```text
E02 첫 외부 슬라이스 JSON은 엔진/데이터 변환 전 중립 소스 데이터로 확정한다.
런타임 직접 로딩 데이터로 확정하지 않는다.
Godot 리소스 변환물로 확정하지 않는다.
```

이유:

| 검토 항목 | 판정 |
|---|---|
| `project.godot`에 E02 JSON 직접 로더 계약이 있는가 | 없음 |
| 기존 `data/world` JSON은 제작/툴 기준 데이터로 사용 가능하다 | 예 |
| E02 NPC 데이터는 우선 스토리/엔진 전달용 구조화 데이터다 | 예 |
| 런타임 직접 로딩은 별도 엔진 작업이 필요하다 | 예 |

역할 잠금:

```text
중립 소스 데이터:
허용.

런타임 직접 로딩 계약:
이번 단계에서 확정하지 않음.

Godot .tres/.res 변환:
이번 단계에서 확정하지 않음.

GDScript 로더 코드:
이번 단계에서 작성하지 않음.
```

---

## 5. 자동 검증 절차 판정

판정:

```text
다음 actual JSON writing 프롬프트에 PowerShell 기반 parse/count/reference 검산 명령을 필수로 포함한다.
이번 조건 해소 문서에서는 검증 스크립트를 만들지 않는다.
```

실제 파일 생성 후 필수 검증:

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

다음 프롬프트에 포함할 검증 명령 요구:

```text
PowerShell에서 6개 JSON 파일을 ConvertFrom-Json으로 파싱한다.
applications/object_texts/reactions/flags/state_keys 배열 길이를 검산한다.
reaction-only 8행의 object_text_id null을 검산한다.
direct_encounter application이 e02_app_003, e02_app_011뿐인지 검산한다.
application.reaction_id가 reactions.reaction_id에 모두 존재하는지 검산한다.
null이 아닌 application.object_text_id가 object_texts.object_text_id에 모두 존재하는지 검산한다.
data/e02/ 밖에 추가 파일이 생기지 않았는지 검산한다.
CSV, .tres, .res, .gd 파일이 새로 생성되지 않았는지 검산한다.
```

---

## 6. 실제 생성 허용 파일 목록

조건 해소 후 실제 생성 단계에서 허용할 파일은 아래 6개뿐이다.

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

이번 문서에서 위 파일을 만들지 않는다.

---

## 7. 실제 생성 금지선

```text
이번 문서는 data/e02/ 디렉터리를 만들지 않는다.
이번 문서는 실제 JSON 파일을 만들지 않는다.
이번 문서는 CSV를 만들지 않는다.
이번 문서는 Godot 리소스 파일을 만들지 않는다.
이번 문서는 GDScript나 로더 코드를 만들지 않는다.
이번 문서는 새 NPC, 새 ID, 새 문구, 새 조건을 추가하지 않는다.
이번 문서는 플레이어블 해금/능력/엔딩/HP 0 조건을 만들지 않는다.
```

금지선 검산:

| 금지선 | 판정 |
|---|---|
| `data/e02/` 디렉터리 생성 | 하지 않음 |
| 실제 JSON 파일 생성 | 하지 않음 |
| CSV/Godot/GDScript/로더 코드 생성 | 하지 않음 |
| 새 NPC/새 ID/새 문구/새 상태값 생성 | 하지 않음 |

---

## 8. 다음 actual JSON writing 프롬프트 요구사항

다음 프롬프트 후보:

```text
docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
```

다음 프롬프트 필수 조건:

1. 실제 생성 파일을 6개 JSON으로 제한한다.
2. `data/e02/` 디렉터리 생성은 해당 프롬프트 안에서만 허용한다.
3. `story/03_regions/e02_first_slice_engine_data_package_v0_1.md`의 JSON 코드블록만 소스로 사용한다.
4. `story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md`를 조건 해소 근거로 링크한다.
5. JSON의 역할을 중립 소스 데이터로 유지한다.
6. CSV, Godot 리소스, GDScript, 로더 코드 생성을 금지한다.
7. 생성 후 PowerShell parse/count/reference 검산 명령을 반드시 실행한다.
8. 검증 결과를 `data/e02/first_slice_validation.json`에 실제 산출 기준으로 반영한다.

다음 프롬프트 금지:

```text
런타임 로더 코드 작성.
Godot 리소스 변환.
CSV 병행 생성.
새 NPC, 새 ID, 새 문구 생성.
플레이어블 해금/능력/엔딩/HP 0 조건 추가.
```

---

## 9. 최종 판정

```text
최종 판정:
조건 해소

이유:
data/e02/ 경로는 기존 data 루트 관례와 충돌하지 않으며 다음 실제 생성 단계의 후보 경로로 승인 가능하다.
E02 JSON의 역할은 런타임 직접 로딩 계약이 아니라 엔진/데이터 변환 전 중립 소스 데이터로 확정했다.
실제 파일 생성 후 검증은 PowerShell 기반 parse/count/reference 검산 명령을 필수로 포함하도록 확정했다.
허용 파일은 6개 JSON으로 제한하고, CSV/Godot/GDScript/로더 코드 생성 금지선을 유지한다.
```

---

## 10. 다음 작업 포인터

```text
다음 작업: E02 실제 JSON 파일 생성 프롬프트 작성
후보 프롬프트: docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
후보 산출물: data/e02/*.json
주의: 실제 파일 생성은 다음 프롬프트와 별도 명시 지시가 있을 때만 진행
```

현재 금지:

```text
이 문서 작성 시점에서는 data/e02/ 디렉터리와 실제 JSON 파일을 만들지 않았다.
```
