# 70 E01 L01→L02 Physical Transition PM Clarification V0.1

상태: **PM CLARIFICATION / IMPLEMENTATION QA CRITERION CORRECTION**

대상:
- E01_C01 R01-L01 → R01-L02 current runtime transition
- `PHY-E01-001`
- C01 canonical alignment implementation gate

기준:
- `19_E01_LOCAL_PHYSICAL_TRAVEL_GRAPH_V0_1.csv`
- `65_E01_FIRST_IMPLEMENTATION_HANDOFF_PACKAGE_V0_1.md`
- `69_E01_IMPLEMENTATION_GATE_D_PM_APPROVAL_V0_1.md`
- `docs/unreal/r01_rpg35_20260918.md`

## 0. PM Decision

기존 QA 문구의 **"R01-L01 → R01-L02 전 구간 normal-speed continuous swept movement"** 해석은 과도했다.

Current authority가 요구하는 것은:

1. 플레이어가 정상 속도/정상 충돌 규칙으로 L01의 실제 북쪽 관문까지 이동하고,
2. 위치에 귀속된 명시적 관문 interaction을 수행하며,
3. 그 interaction이 L02 조사 구역으로 bounded transition을 만들고,
4. 임의 위치에서의 free teleport가 아니며,
5. transition 이후 L02 gameplay와 voluntary return/persistence가 정상 작동하는 것

이다.

Local 간 이동 표현이 반드시 하나의 연속 world-space 좌표에서 전 구간 swept movement여야 한다는 상위 Lock은 존재하지 않는다.

## 1. Why This Clarification Exists

`PHY-E01-001`은 current mapped R01-L01/R01-L02 slice 간 **physical relation**을 VALIDATED로 본다.

동시에 해당 문서는:

> Exact final canonical Local geometry boundary remains not locked.

라고 명시한다.

RPG35 authority 역시 후속 진입을:

> 기존 현장 북쪽 관문 E → 새 구역

으로 기록한다.

따라서 **관문까지의 실제 이동 + 위치 귀속 interaction + bounded area transition**은 physical relation을 표현할 수 있다.

기존 구현이 transition 순간에 actor location transfer를 사용한다는 사실만으로 곧바로 "무료 순간이동"으로 판정하지 않는다.

## 2. Acceptable Gate Transition

현재 L01→L02 전환은 다음을 모두 만족하면 ACCEPTABLE이다.

- gate trigger/interact 위치가 L01 physical world에 실제 존재
- player가 gate까지 정상 이동해야 함
- arbitrary remote activation 불가
- follow-up quest/entry condition 없이 임의 진입 불가
- transition destination이 L02 entry context로 bounded
- player에게 공간 전환의 원인이 gate interaction으로 읽힘
- timer가 자동 전송하지 않음
- combat/quest가 player를 강제로 순간 전송하지 않음
- save/revisit/return contract 유지
- transition이 Relay/Beacon/Recovery 역할을 사칭하지 않음

## 3. Unacceptable Free Teleport

다음이면 FAIL이다.

- 월드 어디서든 버튼 하나로 L02 이동
- timer 경과로 자동 전송
- 전투 종료만으로 자동 전송
- 실제 gate/entry interaction 없음
- 진입 조건 없이 remote teleport 가능
- Local graph 의미 없이 단순 좌표 점프
- player에게 공간적 원인이 전혀 제시되지 않음

## 4. QA Criterion Replacement

기존 QA:

`R01-L01 → R01-L02 normal-speed continuous swept movement PASS`

를 다음으로 교체한다.

### QA-PHY-C01-01
**Normal-speed swept movement to L01 north gate:** PASS required.

### QA-PHY-C01-02
**Explicit location-bound gate interaction:** PASS required.

### QA-PHY-C01-03
**Bounded transition from gate to L02 entry:** PASS required.

### QA-PHY-C01-04
**Arbitrary/free teleport path absent:** PASS required.

### QA-PHY-C01-05
**L02 entry → investigation → voluntary return/revisit remains valid:** PASS required.

전 구간 world-space continuous swept movement는 더 이상 PASS 조건이 아니다.

## 5. Implementation Scope Effect

이번 clarification 자체로:

- 이동 코드를 바꾸라고 지시하지 않는다.
- map/asset 변경을 승인하지 않는다.
- 새 graph edge를 만들지 않는다.
- `PHY-E01-001`을 수정하지 않는다.
- save schema 변경을 승인하지 않는다.
- R01-L03 범위를 열지 않는다.

기존 gate transition이 §2 조건을 이미 만족한다면
**transition rewrite는 필요 없다.**

## 6. Current Alignment HOLD Reclassification Rule

CPP semantic alignment의 나머지 검사가 전부 PASS이고,
현재 gate implementation이 §2와 QA-PHY-C01-01~05를 실제 runtime/log/capture로 만족하면:

기존 HOLD 원인이었던
"전 구간 continuous swept movement 미충족"은 blocker에서 제거한다.

그 경우 최종 구현 판정은:

**C01 R01-L01/L02 CANONICAL ALIGNMENT IMPLEMENTATION PASS**

로 승격 가능하다.

반대로 §2 조건 중 하나라도 실패하면 HOLD를 유지한다.

## 7. Protected Boundaries

- R01-L03: HOLD
- R01-L04/L05: out of scope
- R08 mandatory integration: 0
- new Local: 0
- new graph edge: 0
- Final Lock change: 0
- Production Entry change: 0
- main change: 0

## 8. PM Verdict

**DO NOT REWRITE THE L01→L02 TRANSITION SOLELY TO SATISFY CONTINUOUS-SWEEP WORDING.**

먼저 현재 gate transition이
**physical, location-bound, explicit, non-free**인지 좁게 재검증한다.

그 조건이 PASS하면 현재 semantic alignment 작업을 PASS로 닫는다.
