# 전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 분배 QA v0.1

## 문서 상태

| 항목 | 값 |
|---|---|
| 상태 | 작성 완료 v0.1 |
| 작업 성격 | 레벨/UI/오디오 핸드오프 분배 문서의 수량, 분배, status, 금지선 준수 검수 |
| 실제 구현 여부 | 실제 레벨 배치, UI 파일, 오디오 파일, Godot 리소스, GDScript/로더 코드 생성 없음 |

---

## 1. 최종 판정

| 판정 항목 | 결과 | 근거 |
|---|---|---|
| 최종 판정 | 통과 | 분배표 240행, ticket/sample 1:1, 캠페인 분배, 허용 handoff_status, 금지선 모두 충족 |
| 조건부 통과 여부 | 해당 없음 | 문구 보정 필요 항목 없음 |
| 반려 여부 | 해당 없음 | 수량/분배 불일치, 허용 외 status, 실제 구현 지시, 새 NPC/이름/대면/L5-L4 증가 없음 |
| 다음 작업 | NPC/월드 선행 구조 최종 잠금 | 분배 QA 통과 후 최종 잠금 단계로 이동 가능 |

판정문: `global_npc_l3_below_text_level_ui_audio_handoff_distribution_v0_1.md`는 실제 JSON QA 결과와 핸드오프 기준을 충족하며, 240개 샘플을 레벨/UI/오디오 검토 대상으로만 분배한다.

---

## 2. 검수 대상 문서

| 문서 | 존재 여부 | 검수 범위 | 판정 |
|---|---|---|---|
| `story/03_regions/global_npc_l3_below_text_level_ui_audio_handoff_distribution_v0_1.md` | 존재 | 240개 분배표, 역할 정의, status, 금지선 | 통과 |

---

## 3. 참조 파일/문서 목록

| 구분 | 경로 | 확인 내용 | 판정 |
|---|---|---|---|
| JSON | `data/global_npc/l3_below_text/text_samples.json` | parse 가능, 240개 샘플 | 통과 |
| JSON | `data/global_npc/l3_below_text/application_tickets.json` | parse 가능, 240개 티켓 | 통과 |
| JSON | `data/global_npc/l3_below_text/placement_hints.json` | parse 가능, 240개 힌트 | 통과 |
| JSON | `data/global_npc/l3_below_text/state_keys.json` | parse 가능, 12개 상태 키 | 통과 |
| JSON | `data/global_npc/l3_below_text/flags.json` | parse 가능, 5개 플래그 | 통과 |
| JSON | `data/global_npc/l3_below_text/qa_guards.json` | parse 가능, 10개 QA 가드 | 통과 |
| JSON | `data/global_npc/l3_below_text/validation_summary.json` | parse 가능, 검산 기준 확인 | 통과 |
| 문서 | `story/03_regions/global_npc_l3_below_text_json_creation_qa_v0_1.md` | 최종 판정 `통과` 확인 | 통과 |
| 문서 | `story/03_regions/global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md` | 팀 전달 기준과 금지선 확인 | 통과 |
| 문서 | `story/03_regions/global_npc_l3_below_text_application_tickets_v0_1.md` | 240개 티켓 기준 확인 | 통과 |

---

## 4. 수량 검산표

| 항목 | 기대값 | 실제값 | 판정 | 비고 |
|---|---:|---:|---|---|
| 분배표 행 | 240 | 240 | 통과 | 대상 문서 6장 표 파싱 |
| ticket_id 총수 | 240 | 240 | 통과 | 전체 행 존재 |
| 고유 ticket_id | 240 | 240 | 통과 | 중복 없음 |
| sample_id 총수 | 240 | 240 | 통과 | 전체 행 존재 |
| 고유 sample_id | 240 | 240 | 통과 | 중복 없음 |
| ticket/sample 1:1 | 240 | 240 | 통과 | `application_tickets.json`과 pair 누락/초과 0 |
| 원본 pair 누락 | 0 | 0 | 통과 | 누락 없음 |
| 원본 외 pair 추가 | 0 | 0 | 통과 | 추가 없음 |
| text_samples JSON | 240 | 240 | 통과 | parse 확인 |
| application_tickets JSON | 240 | 240 | 통과 | parse 확인 |
| placement_hints JSON | 240 | 240 | 통과 | parse 확인 |

판정: 분배표는 원본 ticket_id/sample_id 240개를 빠짐없이 유지한다.

---

## 5. 캠페인별 분배 검산표

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

판정: `validation_summary.json`의 캠페인 분배와 대상 문서의 분배표가 일치한다.

---

## 6. handoff_status 검산표

| handoff_status | 허용 여부 | 실제 사용 수 | 판정 |
|---|---|---:|---|
| `level_review_ready` | 허용 | 62 | 통과 |
| `ui_review_ready` | 허용 | 121 | 통과 |
| `audio_review_ready` | 허용 | 45 | 통과 |
| `multi_team_review_ready` | 허용 | 0 | 통과 |
| `hold_for_context` | 허용 | 12 | 통과 |
| 허용 외 status | 금지 | 0 | 통과 |
| 합계 | 해당 없음 | 240 | 통과 |

판정: 분배표에는 허용된 handoff_status만 사용되며, cross_region 12개는 `hold_for_context`로 유지된다.

---

## 7. 팀별 역할 오독 위험 검토

| 검토 항목 | 확인 결과 | 위험도 | 판정 |
|---|---|---|---|
| 레벨팀 역할 | 배치 후보/공간 맥락 검토로 명시 | 낮음 | 통과 |
| UI팀 역할 | 표시 방식/목록/단말/알림 노출 검토로 명시 | 낮음 | 통과 |
| 오디오팀 역할 | 방송/잔향/소리 기반 표현 가능성 검토로 명시 | 낮음 | 통과 |
| owning_team 범위 | 레벨팀/UI팀/오디오팀만 사용 | 낮음 | 통과 |
| secondary_team 범위 | 레벨팀/UI팀/오디오팀만 사용 | 낮음 | 통과 |
| 실제 구현 오독 방지 | 실제 좌표, 씬 파일, UI 파일, 오디오 파일명, 리소스, 코드 확정 없음으로 명시 | 낮음 | 통과 |
| application_mode의 `배치` 표현 | 원본 티켓의 적용 모드 전달이며 실제 좌표/씬 확정과 함께 쓰이지 않음 | 낮음 | 통과 |

판정: 팀별 역할은 구현 지시가 아니라 검토/핸드오프 수준으로 유지된다.

---

## 8. 금지선 확인표

| 금지선 | 기대값 | 실제값 | 판정 |
|---|---|---|---|
| 새 NPC 생성 금지 | 생성 없음 | 생성 없음 | 통과 |
| 새 이름 생성 금지 | 생성 없음 | 생성 없음 | 통과 |
| 새 대면 이벤트 생성 금지 | 생성 없음 | 생성 없음 | 통과 |
| L5/L4 증가 금지 | 증가 없음 | 증가 없음 | 통과 |
| 1,856개 전체 문구 작성 금지 | 240개만 유지 | 240개만 유지 | 통과 |
| 실제 레벨 배치 금지 | 배치 힌트만 전달 | 배치 힌트만 전달 | 통과 |
| 실제 좌표 확정 금지 | 좌표 없음 | 좌표 없음 | 통과 |
| 실제 씬 파일 없음 | 씬 파일 없음 | `.tscn` 0건 | 통과 |
| 실제 UI 파일 생성 금지 | UI 파일 없음 | UI 파일 없음 | 통과 |
| 실제 오디오 파일 생성 금지 | 오디오 파일 없음 | `.ogg`/`.wav`/`.mp3` 0건 | 통과 |
| Godot 리소스 없음 | 리소스 없음 | `res://`, `.tres` 0건 | 통과 |
| GDScript/로더 코드 없음 | 코드 없음 | `.gd` 0건 | 통과 |
| 플레이어블 해금 조건 작성 금지 | 해금 조건 없음 | 해금 조건 없음 | 통과 |
| E02 이후 한국어 이름 기본값 금지 | 금지 유지 | guard_note에 금지 유지 | 통과 |

판정: 금지선 위반 항목은 발견되지 않았다.

---

## 9. 문제 항목 표

| 문제 ID | 문제 유형 | 대상 | 상태 | 권장 처리 |
|---|---|---|---|---|
| 해당 없음 | 해당 없음 | 해당 없음 | 문제 없음 | 처리 불필요 |

문제 유형 검산:

| 문제 유형 | 발견 수 | 판정 |
|---|---:|---|
| 분배표 행 누락/초과 | 0 | 통과 |
| ticket_id 중복/누락 | 0 | 통과 |
| sample_id 중복/누락 | 0 | 통과 |
| ticket/sample pair 불일치 | 0 | 통과 |
| 캠페인 분배 불일치 | 0 | 통과 |
| 허용 외 handoff_status | 0 | 통과 |
| 실제 구현 지시 | 0 | 통과 |
| 금지선 위반 | 0 | 통과 |

---

## 10. 다음 작업 포인터

`NPC/월드 선행 구조 최종 잠금`

다음 작업 제한:

| 제한 | 내용 |
|---|---|
| 분배 유지 | 240개 ticket_id/sample_id와 캠페인 분배를 유지한다. |
| 구현 금지 | 실제 좌표, 씬, UI 파일, 오디오 파일, Godot 리소스, GDScript/로더 코드를 만들지 않는다. |
| 확장 금지 | 새 NPC, 새 이름, 새 대면 이벤트, L5/L4 증가, 1,856개 전체 작성으로 확장하지 않는다. |

최종 판정: 통과.
