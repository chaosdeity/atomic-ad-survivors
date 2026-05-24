# E02 잔향/오브젝트 은행 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
E02 승격 후보 중 직접 대면을 금지하고 잔향/오브젝트로 내린 3개 후보 정리.
장문 프로필 작성 아님.

판정:
통과
```

---

## 0. 대상

| trace_id | source_seed | 캠페인 | form | where_seen | trigger_condition | text_or_audio | what_it_implies | forbidden |
|---|---|---|---|---|---|---|---|---|
| `e02_trace_c04_micro_part_check_01` | `g_E02_C04_g4_001` 미세부품 검수자 | E02_C04 정밀부품 리콜권 | document | 리콜 검사 라인, 미세부품 조립실 | 로봇 자율성 상승 또는 충전태그 부족 | "미세 균열은 정품 여부와 별도로 회수됩니다." | 정품 인증이 안전을 보장하지 않고, 작은 부품 하나가 자율성을 묶을 수 있다 | PATCH/METER-06/RIO-08 기능 대체 |
| `e02_trace_c08_silent_shelter_01` | `g_E02_C08_g4_001` 지하 대피실 조용한 관리자 | E02_C08 무음 대피소권 | system_voice | 지하 대피실 소등 후 안내 스피커 | 수신 안정도 하락 또는 보급 압력 상승 | "안내 없음은 정상 대피 상태입니다." | 낮은 수신은 안전과 구조 지연을 동시에 만든다 | QUIET-07 은신/낮은 수신 기능 대체 |
| `e02_trace_c01_commuter_family_pass_01` | `g_E02_C01_g4_001` 가족 정기권 보류자 | E02_C01 통근 가족주택권 | transaction_log | 가족 정기권 아파트, 환승 주택단지 | OPEN-HOST 관련 단서 후 또는 거주태그 흔들림 | "동반 가족 정기권은 세대 갱신 후 다시 판독됩니다." | 가족/통근/입주 절차가 한 사람의 이동을 가족칸에 묶는다 | R01 가족칸/OPEN-HOST 반복 |

---

## 1. 구현 원칙

```text
세 후보 모두 직접 대면하지 않는다.
리콜 검사표, 무음 대피실 음성, 가족 정기권 거래 로그로만 노출한다.
```

상태값 연결:

| 후보 | state_keys |
|---|---|
| 미세부품 검수자 | `robot_autonomy`, `charge_tag`, `trace_preservation` |
| 지하 대피실 조용한 관리자 | `signal_stability`, `supply_pressure`, `extraction_stability` |
| 가족 정기권 보류자 | `residence_tag`, `passage_tag`, `human_stability` |

---

## 2. 보급소/R01/플레이어블 충돌 검산

| 축 | 처리 |
|---|---|
| PATCH | 미세부품은 수리/강화 재료가 아니라 리콜 표식으로만 사용 |
| METER-06 | 충전량/계량 전투를 설명하지 않고 검사표로만 남김 |
| RIO-08 | 정품 복구 공포를 선공개하지 않음 |
| QUIET-07 | 무음 대피소는 낮은 수신 위험의 배경이지 여울 능력의 튜토리얼이 아님 |
| OPEN-HOST/R01 | 가족 정기권은 R01 가족칸 반복이 아니라 외부 통근권 변형으로 제한 |

---

## 3. 다음 작업

| 다음 산출물 | 목적 |
|---|---|
| `story/06_characters/clause_11_playable_decision_v0_1.md` | 플레이어블 11번 상세 결재 |
| `story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md` | E02 실제 Vertical Slice에서 직접 대면/오브젝트/잔향 수량 컷 |

최종 판정:

```text
통과.
E02 잔향/오브젝트 후보 3개는 사람 프로필로 승격하지 않는다.
```
