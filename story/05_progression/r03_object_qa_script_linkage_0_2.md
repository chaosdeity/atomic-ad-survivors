# R03 오브젝트 QA/스크립트 연결 v0.2

## 문서 상태

```text
상태:
초안 v0.2

판정:
R03 0.3 슬라이스 문서군의 금지선과 핵심 티켓 ID를 정적 QA 스크립트에 연결한다.

용도:
문서가 늘어날수록 R03-L05 선공개, RETURN-05 U5 오해, 라벨 태그화, 레거시 용어 재유입을 빠르게 잡는다.

실제 연결:
tools/r03_story_doc_check.py
tools/qa_check.ps1
```

---

## 0. QA 목적

R03 문서군은 이제 단일 기획서가 아니라 여러 제작 기준으로 쪼개졌다.

검산 대상:

```text
R03 0.3 슬라이스 상세
R03 런 오브젝트 6종 프로토타입 티켓
R03 윤서 반응/정산 문구 은행
RETURN-05 U0~U2 씨앗 티켓
R03 안의 R02 보조 씨앗 패치
R03 정산 UI 압축 샘플
R03 엔진 데이터 스키마 핸드오프
R03-L01/L02 레벨 블록아웃 티켓
R03 오브젝트 데이터 패키지 초안
R03 정산/보급소 UI 실제 문구 테이블
R03 구현 플레이테스트 수락 기준
R02 0.4 초안
R02 0.4 PMO 게이트 결정
스토리 PMO 인수인계 프롬프트
제작팀 이관 프롬프트
R02 0.4 PMO 판정 프롬프트
Godot UI compaction probe
```

QA 목표:

1. 필요한 문서가 빠지지 않았는지 확인한다.
2. 금지/레거시 용어가 새 문서에 들어오지 않았는지 확인한다.
3. R03-L01/L02 중심, R03-L04/L05 잠금이 유지되는지 확인한다.
4. R03-OBJ, R03-RET05, R03-R02-SEED ID가 누락되지 않았는지 확인한다.
5. UI compaction probe가 R03 샘플을 실제로 포함하는지 확인한다.

---

## 1. 정적 QA 스크립트

스크립트:

```text
tools/r03_story_doc_check.py
```

실행:

```text
python tools/r03_story_doc_check.py
```

`tools/qa_check.ps1`에도 연결한다.

```text
Invoke-QAStep "R03 story document check" "python" @("tools\r03_story_doc_check.py")
```

---

## 2. 필수 파일

| 키 | 파일 |
|---|---|
| slice | `story/05_progression/r03_0_3_slice_detail_0_2.md` |
| objects | `story/05_progression/r03_run_object_prototype_tickets_0_2.md` |
| yunseo | `story/05_progression/r03_yunseo_reaction_settlement_phrase_bank_0_2.md` |
| return05 | `story/05_progression/r03_return05_u0_u2_seed_tickets_0_2.md` |
| r02_seed | `story/05_progression/r03_r02_support_seed_patch_0_2.md` |
| ui_samples | `story/05_progression/r03_settlement_ui_compaction_samples_0_2.md` |
| qa_linkage | `story/05_progression/r03_object_qa_script_linkage_0_2.md` |
| engine_schema | `story/05_progression/r03_engine_data_schema_handoff_0_3.md` |
| level_blockout | `story/05_progression/r03_l01_l02_level_blockout_tickets_0_3.md` |
| object_data | `story/05_progression/r03_object_data_package_draft_0_3.md` |
| ui_phrase_table | `story/05_progression/r03_settlement_supply_ui_phrase_table_0_3.md` |
| playtest_acceptance | `story/05_progression/r03_implementation_playtest_acceptance_0_3.md` |
| r02_04_draft | `story/05_progression/r02_0_4_draft_0_1.md` |
| r02_gate | `story/05_progression/r02_0_4_pmo_gate_decision_0_1.md` |
| pmo_prompt | `docs/world/R03_0_3_STORY_PMO_HANDOFF_PROMPT_V0_1.md` |
| production_prompt | `docs/world/R03_0_3_PRODUCTION_HANDOFF_PROMPT_V0_1.md` |
| r02_pmo_prompt | `docs/world/R02_0_4_PMO_DECISION_PROMPT_V0_1.md` |
| ui_probe | `tools/ui_compaction_probe.gd` |

---

## 3. 검산 항목

| 항목 | 통과 기준 |
|---|---|
| 필수 파일 | 모두 존재 |
| 금지 용어 | 레거시 자원명/잘못된 태그명 미검출 |
| R03 범위 | R03-L01/L02 중심, R03-L04/L05 0.3 직접 오픈 금지 |
| 오브젝트 ID | R03-OBJ-01~06 모두 존재 |
| RETURN-05 ID | R03-RET05-00~04 모두 존재 |
| R02 씨앗 ID | R03-R02-SEED-01~05 모두 존재 |
| 제작 핸드오프 ID | R03-DATA-OBJ, R03-L01/L02-BLOCKOUT, R02-OBJ 핵심 ID 존재 |
| 플레이테스트 ID | R03-PT-01~08 모두 존재 |
| 제작 이관 ID | R03-PROD-01~08 모두 존재 |
| R02 게이트 ID | R02-GATE-01~04, R02-GATE-CHECK-01~05 모두 존재 |
| UI 샘플 | `r03 result panel`, `r03 supply panel` 검산 라벨 존재 |
| PMO 프롬프트 | 완료 범위, 요청 사항, 출력 형식 존재 |

---

## 4. 금지 용어

정적 검산 금지어는 `tools/r03_story_doc_check.py`의 `FORBIDDEN_TERMS`를 기준으로 한다.

문서 본문에는 금지어 원문을 다시 적지 않는다.
검산 문서가 금지어를 예시로 품고 있다가 스스로 실패하는 일을 막기 위해서다.

주의:

```text
문서 안의 금지 예시로도 레거시 자원명 원문을 쓰지 않는다.
필요하면 "레거시 자원명", "속도 배송 밈", "직업형 배송 캐릭터"처럼 풀어서 쓴다.
```

---

## 5. QA 실패 시 처리

| 실패 | 처리 |
|---|---|
| 필수 파일 없음 | 해당 문서 작성 후 재검산 |
| 금지 용어 검출 | 기준 태그명 또는 설명형 표현으로 교체 |
| ID 누락 | 티켓 문서에 ID 추가 또는 스크립트 기준 재검토 |
| UI 샘플 누락 | `tools/ui_compaction_probe.gd`에 R03 샘플 추가 |
| PMO 프롬프트 누락 | docs/world 프롬프트 문서 작성 |

---

## 6. 최종 잠금

R03 문서 QA는 게임 밸런스 QA가 아니다.

이 QA는 아래를 막는 문서 안전장치다.

```text
R03이 창고 스킨으로 납작해지는 것.
RETURN-05가 너무 빨리 정식 해금처럼 보이는 것.
R02 씨앗이 R03 초점을 흐리는 것.
라벨이 태그 자원처럼 오해되는 것.
R03-L05 보스권이 0.3에서 소비되는 것.
라벨/레일/드론이 방해물로만 구현되는 것.
```

추천 다음 작업:

```text
1. R03 엔진 데이터 스키마를 실제 엔진 테이블 후보와 대조
2. R03-L01/L02 블록아웃 티켓을 회색 박스 배치로 전환
3. R03 구현 피드백 1회 후 R02 0.4 PMO 판정 진행
```
