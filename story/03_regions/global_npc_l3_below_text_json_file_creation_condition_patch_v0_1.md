# 전역 NPC L3 이하 240개 JSON 파일 생성 조건 해소 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
전역 NPC L3 이하 240개 엔진 데이터 패키지를 실제 JSON 파일로 분리 생성하기 전에 필요한 조건을 해소하는 문서.
이번 문서는 조건 해소 문서이며 실제 JSON 파일 생성 문서가 아니다.
data/ 디렉터리 생성 아님.
.json 파일 생성 아님.
CSV 생성 아님.
Godot 리소스 생성 아님.
GDScript/로더 코드 작성 아님.

최종 판정:
조건 해소
```

---

## 1. 최종 판정

| 판정 항목 | 결과 | 근거 |
|---|---|---|
| 최종 판정 | 조건 해소 | 생성 후보 경로, JSON 역할, 허용 파일 목록, 생성 후 검증 절차, 금지선을 문서로 확정 |
| 실제 생성 여부 | 아직 생성 안 함 | 이번 단계에서는 `data/` 디렉터리와 `.json` 파일을 만들지 않음 |
| 생성 후보 경로 | 승인 후보 확정 | `data/global_npc/l3_below_text/` |
| 허용 파일 수 | 7 | 지정된 7개 JSON 파일만 다음 단계에서 생성 가능 |
| 데이터 역할 | 중립 소스 데이터 | 런타임 직결, NPC 생성, 플레이어블 해금, L5/L4 승격 데이터가 아님 |

판정문:

```text
global_npc_l3_below_text_json_file_creation_decision_v0_1.md의 조건부 생성 가능 판정에 필요한 조건을 해소했다.
다만 이번 문서는 실제 파일 생성 단계가 아니므로 data/global_npc/l3_below_text/ 경로와 JSON 파일 7개를 생성하지 않는다.
다음 작업에서만 실제 JSON 파일 생성을 진행할 수 있다.
```

---

## 2. 참조 문서 목록

| 문서 | 역할 | 판정 |
|---|---|---|
| `story/03_regions/global_npc_l3_below_text_json_file_creation_decision_v0_1.md` | 조건부 생성 가능 판정 | 통과 |
| `story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md` | Markdown 내부 JSON 패키지 원본 | 통과 |
| `story/03_regions/global_npc_l3_below_text_engine_level_pre_conversion_validation_v0_1.md` | 변환 전 검증 | 통과 |
| `story/03_regions/global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md` | 엔진/레벨 핸드오프 기준 | 통과 |

---

## 3. 생성 후보 경로

생성 후보 경로:

```text
data/global_npc/l3_below_text/
```

경로 판정:

| 항목 | 값 | 판정 |
|---|---|---|
| 후보 경로 | `data/global_npc/l3_below_text/` | 승인 후보 확정 |
| 현재 생성 여부 | 생성하지 않음 | 통과 |
| 이번 문서에서 디렉터리 생성 | 금지 | 통과 |
| 이번 문서에서 JSON 파일 생성 | 금지 | 통과 |
| 다음 단계 허용 여부 | 실제 JSON 파일 생성 단계에서만 허용 | 조건부 |

경로 잠금:

```text
이번 문서에서는 경로만 승인 후보로 확정한다.
data/global_npc/l3_below_text/ 디렉터리는 이번 단계에서 만들지 않는다.
다음 작업인 전역 NPC L3 이하 240개 실제 JSON 파일 생성에서만 생성할 수 있다.
```

---

## 4. JSON 역할 잠금

| 역할 항목 | 판정 | 설명 |
|---|---|---|
| 런타임 직결 데이터 | 아님 | 게임 런타임이 직접 읽는 최종 데이터로 쓰지 않음 |
| 엔진/레벨 변환 전 중립 소스 데이터 | 맞음 | 엔진/레벨/UI/오디오 팀이 변환 전에 검수하는 중립 데이터 |
| NPC 생성 데이터 | 아님 | 새 NPC를 만들거나 승격하지 않음 |
| 플레이어블 해금 데이터 | 아님 | 플레이어블 해금 조건을 설명하거나 생성하지 않음 |
| L5/L4 승격 데이터 | 아님 | L5/L4 192개를 늘리거나 수정하지 않음 |
| 직접 대면 이벤트 데이터 | 아님 | 대면 NPC 이벤트를 만들지 않음 |
| 1,856개 전체 문구 데이터 | 아님 | 240개 샘플만 다룸 |

역할 잠금:

```text
생성될 JSON 파일은 엔진/레벨 변환 전 중립 소스 데이터다.
런타임 직결 데이터가 아니다.
NPC 생성 데이터가 아니다.
플레이어블 해금 데이터가 아니다.
L5/L4 승격 데이터가 아니다.
직접 대면 이벤트 데이터가 아니다.
```

---

## 5. 생성 허용 파일 목록

다음 단계에서 생성 가능한 파일은 아래 7개뿐이다.

| 파일명 | 원본 JSON key | 역할 | 수량 잠금 | 판정 |
|---|---|---|---|---|
| `text_samples.json` | `text_samples` | 240개 샘플 문구 원문 | 240 | 허용 |
| `application_tickets.json` | `application_tickets` | 240개 ticket/sample 1:1 연결 | 240 | 허용 |
| `placement_hints.json` | `placement_hints` | 실제 좌표가 아닌 배치 힌트 | 240 | 허용 |
| `state_keys.json` | `state_keys` | 상태 참조 키 목록 | 입력 패키지 기준 | 허용 |
| `flags.json` | `flags` | 표시/노출 제어 플래그 목록 | 입력 패키지 기준 | 허용 |
| `qa_guards.json` | `qa_guards` | 금지선과 검산 조건 | 입력 패키지 기준 | 허용 |
| `validation_summary.json` | `validation_summary` | 수량/금지 플래그 요약 | 1 | 허용 |

허용 파일 잠금:

```text
허용 파일은 7개뿐이다.
text_samples.json
application_tickets.json
placement_hints.json
state_keys.json
flags.json
qa_guards.json
validation_summary.json

위 7개 외의 JSON 파일은 만들지 않는다.
CSV, Godot 리소스, GDScript, 로더 코드는 만들지 않는다.
```

---

## 6. 생성 후 검증 절차

실제 JSON 파일 생성 후에는 아래 절차를 모두 통과해야 한다.

| 검증 항목 | 기대값 | 실패 처리 |
|---|---:|---|
| JSON parse | 7개 모두 parse 가능 | 생성 반려 |
| 생성 파일 수 | 7 | 초과/누락 시 반려 |
| `text_samples.json` 수량 | 240 | 보정 필요 |
| `application_tickets.json` 수량 | 240 | 보정 필요 |
| 고유 sample_id | 240 | 보정 필요 |
| ticket/sample 1:1 | 240 | 보정 필요 |
| E01 | 16 | 보정 필요 |
| E02 | 32 | 보정 필요 |
| E03 | 18 | 보정 필요 |
| E04 | 18 | 보정 필요 |
| E05 | 18 | 보정 필요 |
| E06 | 18 | 보정 필요 |
| E07 | 18 | 보정 필요 |
| E08 | 18 | 보정 필요 |
| E09 | 18 | 보정 필요 |
| E10 | 18 | 보정 필요 |
| E11 | 18 | 보정 필요 |
| E12 | 18 | 보정 필요 |
| cross_region | 12 | 보정 필요 |
| 필수 필드 | 15 | 누락 시 보정 필요 |
| 금지 플래그 | 전부 false | 하나라도 true면 반려 |
| CSV 파일 | 0 | 반려 |
| Godot 리소스 | 0 | 반려 |
| GDScript/로더 코드 | 0 | 반려 |
| 새 NPC/새 이름/직접 대면 | 0 | 반려 |
| L5/L4 증가 | 0 | 반려 |
| 1,856개 전체 작성 | 0 | 반려 |

필수 필드 15개:

```text
ticket_id
sample_id
source_slot_id
campaign
region_band
layer
expression_type
text
placement_hint
state_key
flag
owning_team
application_mode
forbidden_overlap
qa_guard
```

금지 플래그:

```text
actual_files_created: false
json_files_created: false
csv_files_created: false
godot_resources_created: false
gdscript_created: false
loader_code_created: false
new_npc_created: false
new_name_created: false
direct_encounter_created: false
l5_l4_increased: false
full_1856_written: false
```

주의:

```text
validation_summary.json은 원본 Markdown 내부 JSON 패키지의 provenance 값을 유지한다.
실제 생성 파일 7개 존재 여부는 validation_summary의 금지 플래그를 true로 바꾸지 않고 별도 파일 수 검증으로 확인한다.
actual_files_created, json_files_created, csv_files_created, godot_resources_created, gdscript_created, loader_code_created, new_npc_created, new_name_created, direct_encounter_created, l5_l4_increased, full_1856_written은 모두 false여야 한다.
```

---

## 7. 금지선 확인

| 금지선 | 이번 문서 판정 | 다음 단계 판정 |
|---|---|---|
| 새 NPC 생성 금지 | 유지 | 유지 |
| 새 이름 생성 금지 | 유지 | 유지 |
| 직접 대면 이벤트 생성 금지 | 유지 | 유지 |
| L5/L4 승격 금지 | 유지 | 유지 |
| 1,856개 전체 문구 작성 금지 | 유지 | 유지 |
| 플레이어블 해금 조건 작성 금지 | 유지 | 유지 |
| E02 이후 한국어 이름 기본값 금지 | 유지 | 유지 |
| CSV 생성 금지 | 유지 | 유지 |
| Godot 리소스 생성 금지 | 유지 | 유지 |
| GDScript/로더 코드 생성 금지 | 유지 | 유지 |

이번 단계 금지:

```text
실제 data/ 디렉터리 생성 금지.
실제 .json 파일 생성 금지.
CSV 생성 금지.
Godot 리소스 생성 금지.
GDScript/로더 코드 생성 금지.
새 NPC 생성 금지.
새 이름 생성 금지.
새 직접 대면 이벤트 생성 금지.
L5/L4 승격 금지.
1,856개 전체 문구 작성 금지.
플레이어블 해금 조건 작성 금지.
E02 이후 한국어 이름 기본값 금지.
```

---

## 8. 다음 작업 포인터

전역 NPC L3 이하 240개 실제 JSON 파일 생성

다음 작업 제한:

```text
다음 작업에서만 data/global_npc/l3_below_text/ 디렉터리와 허용 JSON 파일 7개를 만들 수 있다.
허용 파일 7개 외에는 만들지 않는다.
CSV, Godot 리소스, GDScript, 로더 코드는 만들지 않는다.
생성될 JSON은 런타임 직결 데이터가 아니라 엔진/레벨 변환 전 중립 소스 데이터다.
```

최종 판정:

```text
조건 해소.
생성 후보 경로, JSON 역할, 허용 파일 7개, 생성 후 검증 절차, 금지선을 확정했다.
이번 단계에서는 실제 data/ 디렉터리와 JSON 파일을 만들지 않았다.
다음 작업은 전역 NPC L3 이하 240개 실제 JSON 파일 생성이다.
```
