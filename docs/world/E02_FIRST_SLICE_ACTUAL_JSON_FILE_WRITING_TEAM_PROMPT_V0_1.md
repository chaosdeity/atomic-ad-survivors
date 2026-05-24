# E02 첫 외부 슬라이스 실제 JSON 파일 생성 팀 프롬프트 v0.1

이 문서는 NPC/엔진 데이터 제작팀에게 `NPC-7.13 E02 실제 JSON 파일 생성`을 맡기기 위한 복붙용 프롬프트다.

이 프롬프트는 실제 생성 작업 지시서다.
단, 실제 생성 범위는 `data/e02/` 디렉터리와 아래 6개 JSON 파일로만 제한한다.

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

CSV, Godot 리소스, GDScript, 로더 코드, 엔진 코드는 만들지 않는다.
새 NPC, 새 ID, 새 문구, 새 상태값을 만들지 않는다.

---

## 0. 현재 상태

```text
완료 문서:
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md

현재 판정:
조건 해소

이번 작업:
data/e02/ 디렉터리 생성
data/e02/*.json 6개 파일 생성

JSON 역할:
엔진/데이터 변환 전 중립 소스 데이터

금지:
런타임 직접 로딩 계약 확정 금지
Godot 리소스 변환 금지
GDScript 로더 코드 작성 금지
CSV 병행 생성 금지
```

이번 작업은 `story/03_regions/e02_first_slice_engine_data_package_v0_1.md`의 Markdown 내부 JSON 코드블록을 실제 파일로 분리 저장하는 작업이다.
값을 새로 창작하지 않는다.

---

## 1. 반드시 읽을 입력 문서

아래 문서를 먼저 확인한다.

```text
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
```

조건 해소 문서에서 고정한 원칙:

```text
data/e02/는 이번 actual JSON writing 작업에서만 생성 허용.
E02 JSON은 런타임 직접 로딩 계약이 아니라 엔진/데이터 변환 전 중립 소스 데이터.
생성 후 PowerShell 기반 parse/count/reference 검산 필수.
```

---

## 2. 실제 생성 허용 범위

이번 작업에서 생성할 것:

```text
data/e02/
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

이번 작업에서 생성하지 않을 것:

```text
data/e02/manifest.json
data/e02/*.csv
data/e02/*.tres
data/e02/*.res
data/e02/*.gd
data/e02/*.tscn
data/e02/*.import
Godot 리소스 파일
GDScript 로더 코드
엔진 런타임 코드
새 스키마 파일
새 NPC 문서
새 story 문서
```

---

## 3. 소스 JSON 블록 매핑

`story/03_regions/e02_first_slice_engine_data_package_v0_1.md`에서 아래 JSON 코드블록을 추출해 파일로 저장한다.

| 패키지 섹션 | 실제 파일 |
|---|---|
| `## 3. applications JSON` | `data/e02/first_slice_applications.json` |
| `## 4. object_texts JSON` | `data/e02/first_slice_object_texts.json` |
| `## 5. reactions JSON` | `data/e02/first_slice_reactions.json` |
| `## 6. flags JSON` | `data/e02/first_slice_flags.json` |
| `## 7. state_keys JSON` | `data/e02/first_slice_state_keys.json` |
| `## 8. validation_manifest JSON` | `data/e02/first_slice_validation.json` |

주의:

```text
`## 2. 패키지 manifest` JSON은 별도 파일로 만들지 않는다.
`validation_manifest JSON`은 실제 산출 파일 기준으로 `actual_files_created`를 true로 갱신한다.
나머지 JSON 값은 소스 패키지와 동등해야 한다.
```

---

## 4. 고정 검산 값

실제 파일 생성 후 아래 값을 유지해야 한다.

```text
applications: 36
object_texts: 18
reactions: 36
flags: 11
state_keys: 12
reaction-only applications: 8
direct encounter applications: 2
direct encounter IDs: e02_app_003, e02_app_011
```

금지 ID:

```text
e02_app_037 이상
e02_sr_037 이상
e02_obj_019 이상
새 flag
새 state_key
```

`reaction-only` 검산:

```text
is_reaction_only == true인 application은 8개여야 한다.
그 8개는 모두 object_text_id == null이어야 한다.
```

참조 무결성:

```text
모든 application.reaction_id는 reactions.reaction_id에 존재해야 한다.
object_text_id가 null이 아닌 모든 application.object_text_id는 object_texts.object_text_id에 존재해야 한다.
```

---

## 5. validation 파일 갱신 규칙

`data/e02/first_slice_validation.json`은 패키지의 `validation_manifest JSON`을 기반으로 하되, 실제 파일 생성 기준으로 아래를 갱신한다.

```text
actual_files_created: true
```

`checks` 안의 `no_actual_files_created`는 그대로 쓰지 않는다.
실제 생성 후에는 아래 성격의 체크로 바꾼다.

```json
{
  "check_id": "actual_files_created",
  "expected": true,
  "actual": true,
  "result": "pass",
  "evidence": "data/e02 JSON files created as neutral source data"
}
```

기존 검산 항목은 유지한다.

```text
targets_count
applications_count
reactions_count
object_texts_count
reaction_only_count
direct_encounter_count
flags_count
state_keys_count
protected_playable_count
forbidden_unlock_count
no_overflow_ids
```

필요하면 실제 파일 검증 결과를 반영해 evidence 문장만 갱신한다.
새 검산 항목을 많이 늘리지 않는다.

---

## 6. 금지선

```text
새 NPC를 만들지 않는다.
새 application_id를 만들지 않는다.
새 reaction_id를 만들지 않는다.
새 object_text_id를 만들지 않는다.
새 flag를 만들지 않는다.
새 state_key를 만들지 않는다.
문구를 새로 쓰지 않는다.
번역/현지화 문구를 추가하지 않는다.
CSV를 만들지 않는다.
Godot .tres/.res 리소스를 만들지 않는다.
GDScript 로더 코드를 만들지 않는다.
엔진 런타임 계약을 확정하지 않는다.
플레이어블 해금/능력/엔딩/HP 0 조건을 추가하지 않는다.
```

---

## 7. 권장 작성 절차

권장 절차:

```text
1. data/e02/ 디렉터리가 없으면 생성한다.
2. 패키지 문서에서 applications/object_texts/reactions/flags/state_keys/validation_manifest JSON 코드블록을 확인한다.
3. 각 코드블록을 대응하는 JSON 파일로 저장한다.
4. validation 파일만 actual_files_created 기준으로 갱신한다.
5. PowerShell 검증을 실행한다.
6. git diff --check를 실행한다.
7. data/e02/ 안에 허용된 6개 JSON만 있는지 확인한다.
```

중요:

```text
파일 생성 방식은 팀의 작업 환경에 맞춰 선택해도 된다.
단, 값은 Markdown 패키지에서 온 JSON과 동등해야 한다.
```

---

## 8. 필수 PowerShell 검증

실제 파일 생성 후 아래 성격의 검증을 반드시 실행한다.

```powershell
$base = 'data/e02'
$apps = Get-Content -LiteralPath "$base/first_slice_applications.json" -Raw | ConvertFrom-Json
$objects = Get-Content -LiteralPath "$base/first_slice_object_texts.json" -Raw | ConvertFrom-Json
$reactions = Get-Content -LiteralPath "$base/first_slice_reactions.json" -Raw | ConvertFrom-Json
$flags = Get-Content -LiteralPath "$base/first_slice_flags.json" -Raw | ConvertFrom-Json
$states = Get-Content -LiteralPath "$base/first_slice_state_keys.json" -Raw | ConvertFrom-Json
$validation = Get-Content -LiteralPath "$base/first_slice_validation.json" -Raw | ConvertFrom-Json

if ($apps.Count -ne 36) { throw "applications count mismatch: $($apps.Count)" }
if ($objects.Count -ne 18) { throw "object_texts count mismatch: $($objects.Count)" }
if ($reactions.Count -ne 36) { throw "reactions count mismatch: $($reactions.Count)" }
if ($flags.Count -ne 11) { throw "flags count mismatch: $($flags.Count)" }
if ($states.Count -ne 12) { throw "state_keys count mismatch: $($states.Count)" }
if ($validation.actual_files_created -ne $true) { throw "validation.actual_files_created must be true" }

$reactionOnly = @($apps | Where-Object { $_.is_reaction_only -eq $true })
if ($reactionOnly.Count -ne 8) { throw "reaction-only count mismatch: $($reactionOnly.Count)" }
if (@($reactionOnly | Where-Object { $null -ne $_.object_text_id }).Count -ne 0) { throw "reaction-only object_text_id must be null" }

$direct = @($apps | Where-Object { $_.application_type -eq 'direct_encounter' })
$directIds = @($direct | ForEach-Object { $_.application_id } | Sort-Object)
if (($directIds -join ',') -ne 'e02_app_003,e02_app_011') { throw "direct encounter mismatch: $($directIds -join ',')" }

$reactionIds = @($reactions | ForEach-Object { $_.reaction_id })
$missingReactions = @($apps | Where-Object { $_.reaction_id -notin $reactionIds })
if ($missingReactions.Count -ne 0) { throw "missing reaction refs: $($missingReactions.application_id -join ',')" }

$objectIds = @($objects | ForEach-Object { $_.object_text_id })
$missingObjects = @($apps | Where-Object { $null -ne $_.object_text_id -and $_.object_text_id -notin $objectIds })
if ($missingObjects.Count -ne 0) { throw "missing object refs: $($missingObjects.application_id -join ',')" }

$overflow = @($apps | Where-Object { $_.application_id -match '^e02_app_0(3[7-9]|[4-9][0-9])' })
if ($overflow.Count -ne 0) { throw "overflow application ids found" }

$allowed = @(
  'first_slice_applications.json',
  'first_slice_object_texts.json',
  'first_slice_reactions.json',
  'first_slice_flags.json',
  'first_slice_state_keys.json',
  'first_slice_validation.json'
)
$extra = @(Get-ChildItem -LiteralPath $base -File | Where-Object { $_.Name -notin $allowed })
if ($extra.Count -ne 0) { throw "unexpected files in data/e02: $($extra.Name -join ',')" }

'E02 JSON validation OK'
```

추가 검증:

```powershell
git diff --check -- data/e02
```

CSV/Godot/GDScript 금지 검증:

```powershell
$forbidden = @(Get-ChildItem -LiteralPath 'data/e02' -Recurse -File | Where-Object { $_.Extension -in '.csv','.tres','.res','.gd','.tscn','.import' })
if ($forbidden.Count -ne 0) { throw "forbidden generated files: $($forbidden.FullName -join ',')" }
'forbidden file check OK'
```

---

## 9. 완료 보고 형식

작업 완료 후 보고에는 아래를 포함한다.

```text
생성한 디렉터리:
data/e02/

생성한 파일:
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json

검증:
6개 JSON parse OK
applications 36
object_texts 18
reactions 36
flags 11
state_keys 12
reaction-only 8 and object_text_id null
direct encounter e02_app_003/e02_app_011 only
reference integrity OK
validation.actual_files_created true
no CSV/Godot/GDScript/loader code
git diff --check OK
```

커밋/푸시는 별도 지시가 있을 때만 한다.

---

## 10. 복붙용 마스터 프롬프트

```text
Atomic Ad Survivors의 E02 첫 외부 슬라이스 실제 JSON 파일을 생성한다.

이번 작업은 실제 파일 생성 작업이다.
단, 생성 범위는 data/e02/ 디렉터리와 아래 6개 JSON 파일로만 제한한다.

생성할 파일:
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json

반드시 읽을 문서:
1. story/03_regions/e02_first_slice_engine_data_package_v0_1.md
2. story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
3. story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
4. story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
5. story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
6. story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
7. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md

소스:
story/03_regions/e02_first_slice_engine_data_package_v0_1.md의 JSON 코드블록.

매핑:
applications JSON -> data/e02/first_slice_applications.json
object_texts JSON -> data/e02/first_slice_object_texts.json
reactions JSON -> data/e02/first_slice_reactions.json
flags JSON -> data/e02/first_slice_flags.json
state_keys JSON -> data/e02/first_slice_state_keys.json
validation_manifest JSON -> data/e02/first_slice_validation.json

중요:
E02 JSON의 역할은 엔진/데이터 변환 전 중립 소스 데이터다.
런타임 직접 로딩 계약을 확정하지 않는다.
Godot 리소스 변환을 하지 않는다.
GDScript 로더 코드를 작성하지 않는다.
CSV를 만들지 않는다.
새 NPC, 새 ID, 새 문구, 새 상태값을 만들지 않는다.

validation 파일:
패키지의 validation_manifest를 기반으로 만들되 actual_files_created를 true로 갱신한다.
no_actual_files_created 체크는 actual_files_created 체크로 바꾼다.

고정 검산:
applications 36
object_texts 18
reactions 36
flags 11
state_keys 12
reaction-only 8
direct encounter 2
direct encounter IDs e02_app_003, e02_app_011
모든 application.reaction_id는 reactions에 존재
null이 아닌 application.object_text_id는 object_texts에 존재
data/e02/ 안에는 허용된 6개 JSON만 존재

검증:
PowerShell에서 6개 JSON을 ConvertFrom-Json으로 파싱한다.
count/reference/reaction-only/direct encounter 검산을 통과한다.
CSV/Godot/GDScript/로더 코드가 생기지 않았는지 확인한다.
git diff --check -- data/e02 를 통과한다.

완료 보고:
생성 파일 6개와 검증 결과를 요약한다.
커밋/푸시는 별도 지시가 있을 때만 한다.
```

---

## 11. 다음 작업

이 프롬프트를 사용해 실제 `data/e02/*.json` 파일을 생성한다.
실제 파일 생성 후 다음 후보 작업은 엔진 변환/로더 계약 검토 또는 E02 데이터 적용 QA다.
