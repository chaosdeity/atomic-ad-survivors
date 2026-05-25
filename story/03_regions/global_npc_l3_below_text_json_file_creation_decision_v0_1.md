# 전역 NPC L3 이하 240개 JSON 파일 생성 여부 결정 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
전역 NPC L3 이하 240개 엔진 데이터 패키지를 실제 data/ 하위 JSON 파일로 분리 생성해도 되는지 검토한 결정 문서.
이번 문서는 결정 문서이며 실제 JSON 파일 생성 문서가 아니다.
data/ 디렉터리 생성 아님.
.json 파일 생성 아님.
CSV 생성 아님.
Godot 리소스 생성 아님.
GDScript/로더 코드 작성 아님.

최종 판정:
조건부 생성 가능
```

---

## 1. 최종 판정

| 판정 항목 | 결과 | 근거 |
|---|---|---|
| 최종 판정 | 조건부 생성 가능 | Markdown 내부 JSON 코드블록 parse, 수량, 1:1 매칭, 필수 필드, 금지 플래그 모두 통과 |
| 즉시 생성 여부 | 생성 보류 | 실제 파일 생성 경로와 엔진 역할은 아직 별도 승인 전 |
| 데이터 역할 | 중립 소스 데이터 | 런타임 직결 데이터가 아니라 엔진/레벨 변환 전 검수용 소스 패키지로만 허용 |
| 반려 여부 | 해당 없음 | 새 NPC, 새 이름, 직접 대면, L5/L4 증가, 1,856개 전체 작성 없음 |

판정문:

```text
global_npc_l3_below_text_engine_data_package_v0_1.md는 실제 JSON 파일 생성 전 단계로 넘길 수 있다.
단, 실제 JSON 파일은 즉시 만들지 않는다.
다음 단계에서 생성 경로, 파일 분리 단위, 중립 소스 데이터 역할, 생성 후 검증 절차를 별도 문서로 잠근 뒤에만 생성 가능하다.
```

---

## 2. 검토 대상 문서 목록

| 문서 | 역할 | 판정 |
|---|---|---|
| `story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md` | Markdown 내부 JSON 데이터 패키지 | 통과 |
| `docs/world/GLOBAL_NPC_L3_BELOW_TEXT_ENGINE_DATA_PACKAGE_WRITING_TEAM_PROMPT_V0_1.md` | 데이터 패키지 작성 프롬프트 | 통과 |
| `story/03_regions/global_npc_l3_below_text_engine_level_pre_conversion_validation_v0_1.md` | 변환 전 검증 | 통과 |
| `story/03_regions/global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md` | 엔진/레벨 핸드오프 기준 | 통과 |
| `story/03_regions/global_npc_l3_below_text_application_tickets_v0_1.md` | 240개 적용 티켓 원본 | 통과 |
| `story/03_regions/global_npc_l3_below_text_application_ticket_qa_v0_1.md` | 적용 티켓 QA | 통과 |

---

## 3. JSON 코드블록 검산표

| 항목 | 기대값 | 실제값 | 판정 | 비고 |
|---|---:|---:|---|---|
| Markdown 내부 JSON 코드블록 | 1 | 1 | 통과 | 실제 `.json` 파일 아님 |
| JSON parse | 가능 | 가능 | 통과 | 단일 JSON 객체로 parse 가능 |
| 최상위 `text_samples` | 존재 | 존재 | 통과 | 240개 샘플 원문 |
| 최상위 `application_tickets` | 존재 | 존재 | 통과 | 240개 티켓 |
| 최상위 `placement_hints` | 존재 | 존재 | 통과 | 실제 좌표 없음 |
| 최상위 `state_keys` | 존재 | 존재 | 통과 | 상태 참조 키만 |
| 최상위 `flags` | 존재 | 존재 | 통과 | 표시/노출 제어만 |
| 최상위 `qa_guards` | 존재 | 존재 | 통과 | 금지선과 검산 조건 |
| 최상위 `validation_summary` | 존재 | 존재 | 통과 | 수량과 금지 플래그 |
| `actual_files_created` | `false` | `false` | 통과 | 실제 파일 생성 없음 |

판정:

```text
Markdown 내부 JSON 코드블록은 실제 JSON 파일 생성 후보로 사용할 수 있을 만큼 parse 가능하다.
그러나 이번 단계에서는 파일로 분리하지 않는다.
```

---

## 4. 수량 검산표

| 항목 | 기대값 | 실제값 | 판정 | 비고 |
|---|---:|---:|---|---|
| `text_samples` | 240 | 240 | 통과 | 원문 샘플 수 유지 |
| `application_tickets` | 240 | 240 | 통과 | 적용 티켓 수 유지 |
| sample_id 총수 | 240 | 240 | 통과 | 티켓 기준 |
| 고유 sample_id | 240 | 240 | 통과 | 중복 없음 |
| ticket/sample 1:1 | 240 | 240 | 통과 | 미연결 sample 없음 |
| E01 | 16 | 16 | 통과 | E01 추가 생산 없음 |
| E02 | 32 | 32 | 통과 | 첫 외부권 확장 기준 유지 |
| E03 | 18 | 18 | 통과 | 분배 유지 |
| E04 | 18 | 18 | 통과 | 분배 유지 |
| E05 | 18 | 18 | 통과 | 분배 유지 |
| E06 | 18 | 18 | 통과 | 분배 유지 |
| E07 | 18 | 18 | 통과 | 분배 유지 |
| E08 | 18 | 18 | 통과 | 분배 유지 |
| E09 | 18 | 18 | 통과 | 분배 유지 |
| E10 | 18 | 18 | 통과 | 분배 유지 |
| E11 | 18 | 18 | 통과 | 분배 유지 |
| E12 | 18 | 18 | 통과 | 분배 유지 |
| cross_region | 12 | 12 | 통과 | 장기 보류/공통 잔향 |
| 원 은행 전체 작성 | 0 | 0 | 통과 | 1,856개 전체 작성 없음 |
| L5/L4 증가 | 0 | 0 | 통과 | 192개 변경 없음 |

판정:

```text
수량은 실제 JSON 파일 생성 조건 검토 기준을 충족한다.
```

---

## 5. 필수 필드 검산표

| field | 기대 상태 | 실제 상태 | 판정 | 비고 |
|---|---|---|---|---|
| `ticket_id` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 240개 |
| `sample_id` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 240개, 고유 |
| `source_slot_id` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 원 은행 슬롯 참조 |
| `campaign` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | E01~E12/cross_region |
| `region_band` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 현실권/언어권 |
| `layer` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | L3/L2/L1/L0 |
| `expression_type` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 은행형 표현 방식 |
| `text` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 기존 샘플 문구 |
| `placement_hint` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 실제 좌표 아님 |
| `state_key` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 상태 참조 키 |
| `flag` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 표시/노출 제어 |
| `owning_team` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 스토리/레벨/UI/오브젝트/오디오/QA |
| `application_mode` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 기존 적용 방식 |
| `forbidden_overlap` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 새 NPC/이름/대면/L5-L4 금지 |
| `qa_guard` | 모든 `application_tickets` 레코드에 존재 | 존재 | 통과 | 수량/금지선 검산 |

판정:

```text
필수 필드 15개는 JSON 파일 생성 조건 검토 기준을 충족한다.
```

---

## 6. 금지 플래그 확인표

| flag | 기대값 | 실제값 | 판정 |
|---|---|---|---|
| `actual_files_created` | `false` | `false` | 통과 |
| `json_files_created` | `false` | `false` | 통과 |
| `csv_files_created` | `false` | `false` | 통과 |
| `godot_resources_created` | `false` | `false` | 통과 |
| `gdscript_created` | `false` | `false` | 통과 |
| `loader_code_created` | `false` | `false` | 통과 |
| `new_npc_created` | `false` | `false` | 통과 |
| `new_name_created` | `false` | `false` | 통과 |
| `direct_encounter_created` | `false` | `false` | 통과 |
| `l5_l4_increased` | `false` | `false` | 통과 |
| `full_1856_written` | `false` | `false` | 통과 |
| `e02_plus_korean_default_names_used` | `false` | `false` | 통과 |
| `playable_unlock_conditions_written` | `false` | `false` | 통과 |

추가 금지선 확인:

| 항목 | 판정 | 비고 |
|---|---|---|
| 새 NPC/새 이름/직접 대면 | 통과 | 생성 없음 |
| L5/L4 192개 침범 | 통과 | 변경 없음 |
| 1,856개 전체 문구 작성 | 통과 | 작성 없음 |
| 플레이어블 해금 조건 | 통과 | 작성 없음 |
| E02 이후 한국어 이름 기본값 | 통과 | 사용 없음 |

---

## 7. 실제 파일 생성 조건

`조건부 생성 가능`은 아래 조건을 모두 해소한 뒤에만 실제 JSON 파일 생성을 허용한다.

| 조건 | 필요 결정 | 현재 상태 | 판정 |
|---|---|---|---|
| 생성 경로 승인 | 실제 `data/` 하위 경로 확정 | 미승인 | 조건 필요 |
| 파일 분리 단위 | 단일 파일/복수 파일/섹션별 파일 결정 | 미확정 | 조건 필요 |
| 데이터 역할 | 런타임 직결이 아니라 엔진/레벨 변환 전 중립 소스 데이터로 잠금 | 필요 | 조건 필요 |
| 로더 연결 여부 | 이번 JSON은 로더/런타임에 직접 연결하지 않음 | 필요 | 조건 필요 |
| 생성 후 검증 절차 | parse/count/reference/staged diff 검증 명령 확정 | 미확정 | 조건 필요 |
| 변경 범위 | `data/` 하위 JSON만 허용할지 여부 | 미확정 | 조건 필요 |

조건 잠금:

```text
실제 JSON 파일은 런타임 직결 데이터가 아니라 엔진/레벨 변환 전 중립 소스 데이터로만 사용한다.
실제 생성 경로는 다음 조건 해소 문서에서 별도 승인한다.
실제 JSON 파일 생성은 다음 조건 해소 문서 이후로 미룬다.
```

---

## 8. 생성 보류 조건

아래 중 하나라도 발생하면 실제 JSON 파일 생성은 보류한다.

| 보류 조건 | 처리 |
|---|---|
| `data/` 하위 경로가 승인되지 않음 | 생성 보류 |
| JSON 파일이 런타임 직결 데이터로 읽힘 | 생성 보류 |
| 로더 코드/GDScript/Godot 리소스 생성이 함께 요구됨 | 생성 보류 |
| 240개를 초과하거나 1,856개 전체 작성으로 확장됨 | 생성 보류 |
| L5/L4 192개를 수정하거나 승격 후보를 늘림 | 생성 보류 |
| 새 NPC/새 이름/직접 대면 이벤트를 포함함 | 생성 보류 |
| E02 이후 한국어 이름 기본값이 들어감 | 생성 보류 |
| 플레이어블 해금 조건처럼 읽히는 필드가 생김 | 생성 보류 |
| parse/count/reference 검증 절차가 없음 | 생성 보류 |

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
```

---

## 9. 다음 작업 포인터

전역 NPC L3 이하 240개 JSON 파일 생성 조건 해소

다음 작업 제한:

```text
다음 작업은 실제 JSON 파일 생성이 아니라 조건 해소 문서 작성이다.
생성 경로, 파일 분리 단위, 중립 소스 데이터 역할, 생성 후 검증 절차를 먼저 잠근다.
그 전에는 data/ 디렉터리와 .json 파일을 만들지 않는다.
```

최종 판정:

```text
조건부 생성 가능.
패키지 JSON은 parse 가능하고 수량, 필드, 금지 플래그가 기준을 통과했다.
다만 실제 파일 생성 경로와 엔진 역할이 아직 별도 승인 전이므로 생성은 보류한다.
다음 작업은 전역 NPC L3 이하 240개 JSON 파일 생성 조건 해소다.
```
