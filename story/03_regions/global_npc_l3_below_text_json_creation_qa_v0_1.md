# 전역 NPC L3 이하 240개 실제 JSON 생성 QA v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
data/global_npc/l3_below_text/ 아래에 생성된 전역 NPC L3 이하 240개 JSON 7개 파일의 생성 결과를 검수한 QA 문서.
새 JSON 생성 아님.
CSV 생성 아님.
Godot 리소스 생성 아님.
GDScript/로더 코드 작성 아님.
새 NPC 생성 아님.
새 이름 생성 아님.
직접 대면 이벤트 생성 아님.
L5/L4 승격 아님.
1,856개 전체 문구 작성 아님.

최종 판정:
통과
```

---

## 1. 최종 판정

| 판정 항목 | 결과 | 근거 |
|---|---|---|
| 최종 판정 | 통과 | 허용 파일 7개, JSON parse, 수량, 1:1 연결, 캠페인 분배, 필수 필드, 금지선 모두 통과 |
| 조건부 통과 여부 | 해당 없음 | 보정 필요한 문서 포인터 없음 |
| 반려 여부 | 해당 없음 | 허용 외 파일, 수량 불일치, 새 NPC/이름/직접 대면/L5-L4 증가 없음 |
| 다음 작업 | 전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 적용 분배 | 실제 JSON 생성 QA 통과 후 적용 분배 단계로 이동 |

판정문:

```text
data/global_npc/l3_below_text/ 아래 실제 JSON 7개 파일은 조건 해소 문서와 엔진 데이터 패키지 기준을 충족한다.
다음 작업은 전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 적용 분배다.
```

---

## 2. 검수 대상 파일 목록

| 파일 | 존재 여부 | JSON parse | 판정 |
|---|---|---|---|
| `data/global_npc/l3_below_text/text_samples.json` | 존재 | 가능 | 통과 |
| `data/global_npc/l3_below_text/application_tickets.json` | 존재 | 가능 | 통과 |
| `data/global_npc/l3_below_text/placement_hints.json` | 존재 | 가능 | 통과 |
| `data/global_npc/l3_below_text/state_keys.json` | 존재 | 가능 | 통과 |
| `data/global_npc/l3_below_text/flags.json` | 존재 | 가능 | 통과 |
| `data/global_npc/l3_below_text/qa_guards.json` | 존재 | 가능 | 통과 |
| `data/global_npc/l3_below_text/validation_summary.json` | 존재 | 가능 | 통과 |

허용 파일 세트:

```text
text_samples.json
application_tickets.json
placement_hints.json
state_keys.json
flags.json
qa_guards.json
validation_summary.json
```

---

## 3. JSON parse 결과

| 항목 | 기대값 | 실제값 | 판정 | 비고 |
|---|---:|---:|---|---|
| 생성 파일 수 | 7 | 7 | 통과 | 허용 파일만 존재 |
| JSON parse 가능 파일 | 7 | 7 | 통과 | 전부 parse 가능 |
| JSON parse 실패 파일 | 0 | 0 | 통과 | 없음 |
| 허용 외 파일 | 0 | 0 | 통과 | CSV/Godot/GDScript/README/임시 파일 없음 |
| `validation_summary.created_file_count` | 7 | 7 | 통과 | 생성 파일 수와 일치 |
| `validation_summary.created_files` | 허용 7개 | 허용 7개 | 통과 | 배열 정확히 일치 |

---

## 4. 수량 검산표

| 항목 | 기대값 | 실제값 | 판정 | 비고 |
|---|---:|---:|---|---|
| `text_samples.json` 레코드 | 240 | 240 | 통과 | 샘플 문구 원문 |
| `application_tickets.json` 레코드 | 240 | 240 | 통과 | 적용 티켓 |
| `placement_hints.json` 레코드 | 240 | 240 | 통과 | 실제 좌표 아님 |
| 고유 `sample_id` | 240 | 240 | 통과 | 중복 없음 |
| ticket/sample 연결 누락 | 0 | 0 | 통과 | 모든 티켓 sample_id가 text_samples에 존재 |
| 필수 필드 누락 행 | 0 | 0 | 통과 | 15개 필드 유지 |
| 원 은행 전체 작성 | 0 | 0 | 통과 | 1,856개 전체 작성 없음 |
| L5/L4 증가 | 0 | 0 | 통과 | 192개 침범 없음 |

---

## 5. ticket/sample 1:1 검산표

| 항목 | 기대값 | 실제값 | 판정 |
|---|---:|---:|---|
| ticket 총수 | 240 | 240 | 통과 |
| ticket 내 sample_id 총수 | 240 | 240 | 통과 |
| ticket 내 고유 sample_id | 240 | 240 | 통과 |
| text_samples 내 sample_id 총수 | 240 | 240 | 통과 |
| ticket sample_id 미연결 | 0 | 0 | 통과 |
| 중복 연결 | 0 | 0 | 통과 |

판정:

```text
ticket_id 240개와 sample_id 240개는 1:1 연결을 유지한다.
```

---

## 6. 캠페인 분배 검산표

| 캠페인 | 기대값 | 실제값 | 판정 |
|---|---:|---:|---|
| E01 | 16 | 16 | 통과 |
| E02 | 32 | 32 | 통과 |
| E03 | 18 | 18 | 통과 |
| E04 | 18 | 18 | 통과 |
| E05 | 18 | 18 | 통과 |
| E06 | 18 | 18 | 통과 |
| E07 | 18 | 18 | 통과 |
| E08 | 18 | 18 | 통과 |
| E09 | 18 | 18 | 통과 |
| E10 | 18 | 18 | 통과 |
| E11 | 18 | 18 | 통과 |
| E12 | 18 | 18 | 통과 |
| cross_region | 12 | 12 | 통과 |
| 합계 | 240 | 240 | 통과 |

---

## 7. 필수 필드 검산표

| field | 기대 상태 | 실제 상태 | 판정 |
|---|---|---|---|
| `ticket_id` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `sample_id` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `source_slot_id` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `campaign` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `region_band` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `layer` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `expression_type` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `text` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `placement_hint` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `state_key` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `flag` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `owning_team` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `application_mode` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `forbidden_overlap` | 240개 티켓 전체 존재 | 존재 | 통과 |
| `qa_guard` | 240개 티켓 전체 존재 | 존재 | 통과 |

판정:

```text
필수 필드 15개는 application_tickets.json 전체 240개 레코드에서 유지된다.
```

---

## 8. 금지선 확인표

| 금지선 | 기대값 | 실제값 | 판정 |
|---|---|---|---|
| `validation_summary.actual_files_created` | `true` | `true` | 통과 |
| `validation_summary.json_files_created` | `true` | `true` | 통과 |
| `validation_summary.csv_files_created` | `false` | `false` | 통과 |
| `validation_summary.godot_resources_created` | `false` | `false` | 통과 |
| `validation_summary.gdscript_created` | `false` | `false` | 통과 |
| `validation_summary.loader_code_created` | `false` | `false` | 통과 |
| `validation_summary.new_npc_created` | `false` | `false` | 통과 |
| `validation_summary.new_name_created` | `false` | `false` | 통과 |
| `validation_summary.direct_encounter_created` | `false` | `false` | 통과 |
| `validation_summary.l5_l4_increased` | `false` | `false` | 통과 |
| `validation_summary.full_1856_written` | `false` | `false` | 통과 |
| `validation_summary.playable_unlock_conditions_written` | `false` | `false` | 통과 |
| `validation_summary.e02_plus_korean_default_names_used` | `false` | `false` | 통과 |
| CSV 파일 | 0 | 0 | 통과 |
| Godot 리소스 | 0 | 0 | 통과 |
| GDScript 파일 | 0 | 0 | 통과 |
| 로더 코드 | 0 | 0 | 통과 |
| README/임시 파일 | 0 | 0 | 통과 |

---

## 9. 문제 파일/문제 항목 표

| 파일 | 문제 유형 | 현재 상태 | 권장 처리 | 판정 |
|---|---|---|---|---|
| 해당 없음 | 해당 없음 | 문제 파일 없음 | 처리 불필요 | 통과 |

문제 유형 검산:

```text
허용 외 파일 없음.
수량 불일치 없음.
JSON parse 실패 없음.
필수 필드 누락 없음.
새 NPC 생성 없음.
새 이름 생성 없음.
직접 대면 이벤트 생성 없음.
L5/L4 증가 없음.
1,856개 전체 문구 작성 없음.
플레이어블 해금 조건 없음.
E02 이후 한국어 이름 기본값 없음.
```

---

## 10. 다음 작업 포인터

전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 적용 분배

다음 작업 제한:

```text
다음 작업은 실제 JSON 생성 QA를 통과한 240개 데이터를 레벨/UI/오디오 적용 분배 기준으로 넘기는 단계다.
새 NPC, 새 이름, 직접 대면 이벤트, L5/L4 승격, 1,856개 전체 작성으로 확장하지 않는다.
```

최종 판정:

```text
통과.
data/global_npc/l3_below_text/ 아래 허용 JSON 7개는 조건 해소 문서와 엔진 데이터 패키지 기준을 충족한다.
다음 작업은 전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 적용 분배다.
```
