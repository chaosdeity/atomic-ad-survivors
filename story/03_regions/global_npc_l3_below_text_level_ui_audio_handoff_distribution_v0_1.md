# 전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 적용 분배 v0.1

## 문서 상태

| 항목 | 값 |
|---|---|
| 상태 | 작성 완료 v0.1 |
| 작업 성격 | QA 통과 240개 JSON 샘플을 레벨/UI/오디오 검토 대상으로 분배하는 문서 |
| 최종 판정 | 분배 기준 확정 |
| 실제 구현 여부 | 실제 레벨 배치, UI 파일, 오디오 파일, Godot 리소스, GDScript/로더 코드 생성 없음 |

---

## 1. 최종 판정: 분배 기준 확정

| 판정 항목 | 결과 | 근거 |
|---|---|---|
| 최종 판정 | 분배 기준 확정 | `global_npc_l3_below_text_json_creation_qa_v0_1.md`의 최종 판정 `통과`를 기준으로 함 |
| 대상 수량 | 240개 유지 | `validation_summary.json`의 ticket/sample/text/hint 수량과 일치 |
| 분배 방식 | 레벨팀/UI팀/오디오팀 검토 분배 | 원본 샘플과 티켓을 새로 만들지 않고 핸드오프 대상만 지정 |
| 구현 범위 | 문서 작성만 허용 | 실제 좌표, 씬 파일, UI 파일, 오디오 파일명, 리소스, 코드 확정 없음 |

판정문: QA 통과 240개 샘플은 레벨/UI/오디오 검토 대상으로 넘길 수 있으며, 이번 문서는 배치 힌트와 적용 모드만 전달한다.

---

## 2. 참조 파일/문서 목록

| 구분 | 경로 | 역할 |
|---|---|---|
| JSON | `data/global_npc/l3_below_text/text_samples.json` | 240개 샘플 원본 확인 |
| JSON | `data/global_npc/l3_below_text/application_tickets.json` | ticket_id/sample_id/표현 타입/적용 모드 기준 |
| JSON | `data/global_npc/l3_below_text/placement_hints.json` | 좌표 없는 배치 힌트 확인 |
| JSON | `data/global_npc/l3_below_text/state_keys.json` | 상태 키 참조 범위 확인 |
| JSON | `data/global_npc/l3_below_text/flags.json` | 표시/보류 플래그 참조 범위 확인 |
| JSON | `data/global_npc/l3_below_text/qa_guards.json` | QA 금지선 확인 |
| JSON | `data/global_npc/l3_below_text/validation_summary.json` | 전체 수량과 금지선 검산 |
| 문서 | `story/03_regions/global_npc_l3_below_text_json_creation_qa_v0_1.md` | 통과 판정 기준 |
| 문서 | `story/03_regions/global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md` | 팀별 전달 기준과 금지선 |
| 문서 | `story/03_regions/global_npc_l3_below_text_application_tickets_v0_1.md` | 240개 티켓 기준 문서 |

---

## 3. 전체 수량 검산

| 항목 | 기대값 | 실제값 | 판정 |
|---|---:|---:|---|
| text_samples | 240 | 240 | 통과 |
| application_tickets | 240 | 240 | 통과 |
| placement_hints | 240 | 240 | 통과 |
| ticket_id | 240 | 240 | 통과 |
| sample_id | 240 | 240 | 통과 |
| 고유 sample_id | 240 | 240 | 통과 |
| 이번 문서 분배표 행 | 240 | 240 | 통과 |
| 실제 구현 산출물 | 0 | 0 | 통과 |

---

## 4. 캠페인별 분배 유지표

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

## 5. 팀별 역할 정의

| 팀 | 1차 역할 | 전달 범위 | 확정하지 않는 것 |
|---|---|---|---|
| 레벨팀 | 배치 후보/공간 맥락 검토 | 표지, 오브젝트, 영수증, 잔향 트리거의 장소성 검토 | 실제 좌표, 실제 씬 파일, 실제 상호작용 노드 |
| UI팀 | 표시 방식/목록/단말/알림 노출 검토 | 조건 반응 패널, 호출번호, 목록, 로그, 대기열 기록, 자막 표면 검토 | 실제 UI 파일, 위젯명, 화면 구현 |
| 오디오팀 | 방송/잔향/소리 기반 표현 가능성 검토 | 자동 음성, 잔향, 호출번호 방송 가능성 검토 | 실제 오디오 파일명, 녹음/믹싱 지시, 재생 트리거 구현 |

표현 타입별 1차 소유 기준:

| expression_type | owning_team | secondary_team | 기본 handoff_status |
|---|---|---|---|
| 대사 은행 | UI팀 | 레벨팀 | ui_review_ready |
| 로그 | UI팀 | 레벨팀 | ui_review_ready |
| 목록 | UI팀 | 레벨팀 | ui_review_ready |
| 호출번호 | UI팀 | 오디오팀 | ui_review_ready |
| 대기열 기록 | UI팀 | 레벨팀 | ui_review_ready |
| 오브젝트 | 레벨팀 | UI팀 | level_review_ready |
| 영수증 | 레벨팀 | UI팀 | level_review_ready |
| 표지 | 레벨팀 | UI팀 | level_review_ready |
| 잔향 | 오디오팀 | 레벨팀 | audio_review_ready |
| 자동 음성 | 오디오팀 | UI팀 | audio_review_ready |
| cross_region 전체 | 표현 타입 기준 소유팀 유지 | 표현 타입 기준 보조팀 유지 | hold_for_context |

---

## 6. 240개 적용 분배표

| ticket_id | sample_id | campaign | expression_type | placement_hint | owning_team | secondary_team | application_mode | handoff_status | guard_note |
|---|---|---|---|---|---|---|---|---|---|
| `e01_l3txt_001` | `l3s_001` | E01 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_002` | `l3s_002` | E01 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_003` | `l3s_003` | E01 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_004` | `l3s_004` | E01 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_001` | `l3s_005` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_002` | `l3s_006` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_003` | `l3s_007` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_004` | `l3s_008` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_005` | `l3s_009` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_006` | `l3s_010` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_007` | `l3s_011` | E02 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_001` | `l3s_012` | E03 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_002` | `l3s_013` | E03 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_003` | `l3s_014` | E03 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_004` | `l3s_015` | E03 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_001` | `l3s_016` | E04 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_002` | `l3s_017` | E04 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_003` | `l3s_018` | E04 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_004` | `l3s_019` | E04 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_001` | `l3s_020` | E05 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_002` | `l3s_021` | E05 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_003` | `l3s_022` | E05 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_004` | `l3s_023` | E05 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_001` | `l3s_024` | E06 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_002` | `l3s_025` | E06 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_003` | `l3s_026` | E06 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_004` | `l3s_027` | E06 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_001` | `l3s_028` | E07 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_002` | `l3s_029` | E07 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_003` | `l3s_030` | E07 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_004` | `l3s_031` | E07 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_001` | `l3s_032` | E08 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_002` | `l3s_033` | E08 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_003` | `l3s_034` | E08 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_004` | `l3s_035` | E08 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_001` | `l3s_036` | E09 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_002` | `l3s_037` | E09 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_003` | `l3s_038` | E09 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_004` | `l3s_039` | E09 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_001` | `l3s_040` | E10 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_002` | `l3s_041` | E10 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_003` | `l3s_042` | E10 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_004` | `l3s_043` | E10 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_001` | `l3s_044` | E11 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_002` | `l3s_045` | E11 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_003` | `l3s_046` | E11 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_004` | `l3s_047` | E11 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_001` | `l3s_048` | E12 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_002` | `l3s_049` | E12 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_003` | `l3s_050` | E12 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_004` | `l3s_051` | E12 | 대사 은행 | 조건 반응 패널 | UI팀 | 레벨팀 | 상태 반응 은행 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_001` | `l3s_052` | cross_region | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_005` | `l2s_001` | E01 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_006` | `l2s_002` | E01 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_007` | `l2s_003` | E01 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_008` | `l2s_004` | E01 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_009` | `l2s_005` | E01 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_010` | `l2s_006` | E01 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_008` | `l2s_007` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_009` | `l2s_008` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_010` | `l2s_009` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_011` | `l2s_010` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_012` | `l2s_011` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_013` | `l2s_012` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_014` | `l2s_013` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_015` | `l2s_014` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_016` | `l2s_015` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_017` | `l2s_016` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_018` | `l2s_017` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_019` | `l2s_018` | E02 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_005` | `l2s_019` | E03 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_006` | `l2s_020` | E03 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_007` | `l2s_021` | E03 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_008` | `l2s_022` | E03 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_009` | `l2s_023` | E03 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_010` | `l2s_024` | E03 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_005` | `l2s_025` | E04 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_006` | `l2s_026` | E04 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_007` | `l2s_027` | E04 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_008` | `l2s_028` | E04 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_009` | `l2s_029` | E04 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_010` | `l2s_030` | E04 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_005` | `l2s_031` | E05 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_006` | `l2s_032` | E05 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_007` | `l2s_033` | E05 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_008` | `l2s_034` | E05 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_009` | `l2s_035` | E05 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_010` | `l2s_036` | E05 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_005` | `l2s_037` | E06 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_006` | `l2s_038` | E06 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_007` | `l2s_039` | E06 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_008` | `l2s_040` | E06 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_009` | `l2s_041` | E06 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_010` | `l2s_042` | E06 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_005` | `l2s_043` | E07 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_006` | `l2s_044` | E07 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_007` | `l2s_045` | E07 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_008` | `l2s_046` | E07 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_009` | `l2s_047` | E07 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_010` | `l2s_048` | E07 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_005` | `l2s_049` | E08 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_006` | `l2s_050` | E08 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_007` | `l2s_051` | E08 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_008` | `l2s_052` | E08 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_009` | `l2s_053` | E08 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_010` | `l2s_054` | E08 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_005` | `l2s_055` | E09 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_006` | `l2s_056` | E09 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_007` | `l2s_057` | E09 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_008` | `l2s_058` | E09 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_009` | `l2s_059` | E09 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_010` | `l2s_060` | E09 | 영수증 | 영수증 오브젝트 | 레벨팀 | UI팀 | 읽기 가능한 소형 오브젝트 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_005` | `l2s_061` | E10 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_006` | `l2s_062` | E10 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_007` | `l2s_063` | E10 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_008` | `l2s_064` | E10 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_009` | `l2s_065` | E10 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_010` | `l2s_066` | E10 | 오브젝트 | 흔적 오브젝트 | 레벨팀 | UI팀 | 오브젝트 텍스트 슬롯 연결 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_005` | `l2s_067` | E11 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_006` | `l2s_068` | E11 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_007` | `l2s_069` | E11 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_008` | `l2s_070` | E11 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_009` | `l2s_071` | E11 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_010` | `l2s_072` | E11 | 로그 | 단말 로그 | UI팀 | 레벨팀 | 짧은 로그 엔트리 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_005` | `l2s_073` | E12 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_006` | `l2s_074` | E12 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_007` | `l2s_075` | E12 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_008` | `l2s_076` | E12 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_009` | `l2s_077` | E12 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_010` | `l2s_078` | E12 | 잔향 | 환경 잔향 트리거 | 오디오팀 | 레벨팀 | 짧은 음성/환경음 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_002` | `l2s_079` | cross_region | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_003` | `l2s_080` | cross_region | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_004` | `l2s_081` | cross_region | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_005` | `l2s_082` | cross_region | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_011` | `l1s_001` | E01 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_012` | `l1s_002` | E01 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_013` | `l1s_003` | E01 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_014` | `l1s_004` | E01 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_020` | `l1s_005` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_021` | `l1s_006` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_022` | `l1s_007` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_023` | `l1s_008` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_024` | `l1s_009` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_025` | `l1s_010` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_026` | `l1s_011` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_027` | `l1s_012` | E02 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_011` | `l1s_013` | E03 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_012` | `l1s_014` | E03 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_013` | `l1s_015` | E03 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_014` | `l1s_016` | E03 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_011` | `l1s_017` | E04 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_012` | `l1s_018` | E04 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_013` | `l1s_019` | E04 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_014` | `l1s_020` | E04 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_011` | `l1s_021` | E05 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_012` | `l1s_022` | E05 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_013` | `l1s_023` | E05 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_014` | `l1s_024` | E05 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_011` | `l1s_025` | E06 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_012` | `l1s_026` | E06 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_013` | `l1s_027` | E06 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_014` | `l1s_028` | E06 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_011` | `l1s_029` | E07 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_012` | `l1s_030` | E07 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_013` | `l1s_031` | E07 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_014` | `l1s_032` | E07 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_011` | `l1s_033` | E08 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_012` | `l1s_034` | E08 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_013` | `l1s_035` | E08 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_014` | `l1s_036` | E08 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_011` | `l1s_037` | E09 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_012` | `l1s_038` | E09 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_013` | `l1s_039` | E09 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_014` | `l1s_040` | E09 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_011` | `l1s_041` | E10 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_012` | `l1s_042` | E10 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_013` | `l1s_043` | E10 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_014` | `l1s_044` | E10 | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_011` | `l1s_045` | E11 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_012` | `l1s_046` | E11 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_013` | `l1s_047` | E11 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_014` | `l1s_048` | E11 | 목록 | 목록 UI | UI팀 | 레벨팀 | 목록 행 텍스트 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_011` | `l1s_049` | E12 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_012` | `l1s_050` | E12 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_013` | `l1s_051` | E12 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_014` | `l1s_052` | E12 | 대기열 기록 | 대기열 기록 UI | UI팀 | 레벨팀 | 큐 기록 UI 연결 | `ui_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_006` | `l1s_053` | cross_region | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_007` | `l1s_054` | cross_region | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_008` | `l1s_055` | cross_region | 호출번호 | 호출번호 UI | UI팀 | 오디오팀 | 번호표/게이트 화면 연결 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_015` | `l0s_001` | E01 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e01_l3txt_016` | `l0s_002` | E01 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_028` | `l0s_003` | E02 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_029` | `l0s_004` | E02 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_030` | `l0s_005` | E02 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_031` | `l0s_006` | E02 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e02_l3txt_032` | `l0s_007` | E02 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_015` | `l0s_008` | E03 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_016` | `l0s_009` | E03 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_017` | `l0s_010` | E03 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e03_l3txt_018` | `l0s_011` | E03 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_015` | `l0s_012` | E04 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_016` | `l0s_013` | E04 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_017` | `l0s_014` | E04 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e04_l3txt_018` | `l0s_015` | E04 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_015` | `l0s_016` | E05 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_016` | `l0s_017` | E05 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_017` | `l0s_018` | E05 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e05_l3txt_018` | `l0s_019` | E05 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_015` | `l0s_020` | E06 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_016` | `l0s_021` | E06 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_017` | `l0s_022` | E06 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e06_l3txt_018` | `l0s_023` | E06 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_015` | `l0s_024` | E07 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_016` | `l0s_025` | E07 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_017` | `l0s_026` | E07 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e07_l3txt_018` | `l0s_027` | E07 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_015` | `l0s_028` | E08 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_016` | `l0s_029` | E08 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_017` | `l0s_030` | E08 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e08_l3txt_018` | `l0s_031` | E08 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_015` | `l0s_032` | E09 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_016` | `l0s_033` | E09 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_017` | `l0s_034` | E09 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e09_l3txt_018` | `l0s_035` | E09 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_015` | `l0s_036` | E10 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_016` | `l0s_037` | E10 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_017` | `l0s_038` | E10 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e10_l3txt_018` | `l0s_039` | E10 | 자동 음성 | 자동 안내 음성 | 오디오팀 | UI팀 | 반복 음성/자막 트리거 연결 | `audio_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_015` | `l0s_040` | E11 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_016` | `l0s_041` | E11 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_017` | `l0s_042` | E11 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e11_l3txt_018` | `l0s_043` | E11 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_015` | `l0s_044` | E12 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_016` | `l0s_045` | E12 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_017` | `l0s_046` | E12 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `e12_l3txt_018` | `l0s_047` | E12 | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `level_review_ready` | hints_only; no_E02plus_Korean_default_name; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_009` | `l0s_048` | cross_region | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_010` | `l0s_049` | cross_region | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_011` | `l0s_050` | cross_region | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |
| `cross_l3txt_012` | `l0s_051` | cross_region | 표지 | 레벨 표지/라벨 | 레벨팀 | UI팀 | 배경 표지 텍스트 배치 | `hold_for_context` | hold_context; no_early_truth; no_new_NPC_name_encounter_L5L4 |

---

## 7. 금지선 확인표

| 금지선 | 이번 문서 판정 | 확인 메모 |
|---|---|---|
| 새 NPC 생성 금지 | 준수 | 기존 ticket_id/sample_id 분배만 수행 |
| 새 이름 생성 금지 | 준수 | 문구 원문과 이름 추가 없음 |
| 새 대면 이벤트 생성 금지 | 준수 | 팀 검토 대상만 지정 |
| L5/L4 증가 금지 | 준수 | L3 이하 240개 샘플 범위 유지 |
| 1,856개 전체 문구 작성 금지 | 준수 | 240개 샘플만 유지 |
| 실제 레벨 배치 금지 | 준수 | placement_hint만 전달 |
| 실제 좌표 확정 금지 | 준수 | 좌표/씬/노드명 없음 |
| UI 파일 생성 금지 | 준수 | UI팀 검토 표면만 지정 |
| 오디오 파일 생성 금지 | 준수 | 오디오팀 검토 가능성만 지정 |
| Godot 리소스 생성 금지 | 준수 | 리소스 경로/파일 없음 |
| GDScript/로더 코드 생성 금지 | 준수 | 코드/로더 지시 없음 |
| 플레이어블 해금 조건 작성 금지 | 준수 | 해금 조건 없음 |
| E02 이후 한국어 이름 기본값 금지 | 준수 | E02~E12 guard_note에 이름 기본값 금지 유지 |
| 실제 UI/오디오/레벨 파일명 확정 금지 | 준수 | 파일명 후보 없음 |

---

## 8. 다음 작업 포인터

`전역 NPC L3 이하 240개 레벨/UI/오디오 핸드오프 분배 QA`

다음 QA에서 확인할 항목:

| 항목 | 기대값 |
|---|---:|
| JSON parse 가능 파일 | 7 |
| 분배표 행 | 240 |
| ticket_id | 240 |
| sample_id | 240 |
| 캠페인 분배 | E01 16 / E02 32 / E03~E12 각 18 / cross_region 12 |
| 허용 handoff_status | level_review_ready / ui_review_ready / audio_review_ready / multi_team_review_ready / hold_for_context |
| 금지선 | 실제 구현 산출물 0 |

최종 판정: 분배 기준 확정.
