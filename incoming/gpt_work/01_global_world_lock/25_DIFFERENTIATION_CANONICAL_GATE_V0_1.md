# 25 DIFFERENTIATION CANONICAL GATE V0.1

상태: **CANONICAL PRELOCK GATE / FINAL LOCK 아님**

이번 gate는 두 층을 분리한다.

1. **CAMPAIGN-TO-CAMPAIGN DIFFERENTIATION**
2. **FAMILY-TO-FAMILY DIFFERENTIATION**

이 둘을 섞어 한쪽의 미완성을 다른 쪽의 실패로 판정하지 않는다.

## A. Campaign-to-Campaign Differentiation

Previous PRELOCK의 6개 위험군은 유지한다.

| 위험군 | 이전 PRELOCK | canonical 상태 | 핵심 경계 |
|---|---|---|---|
| Medical | DEFINED_CANDIDATE | 유지 | E02 시간/예약/순번 vs E05 다중 자원 병목 |
| Customs | DEFINED_CANDIDATE | 유지 | E03 대량 자동 분류 vs E07 문서/환승 chain vs E12 convoy/연료/항만-도로 |
| Port Recovery | DEFINED_CANDIDATE | 유지 | E03 자동분류 vs E08 custody/release vs E11 비공식 소유 claim vs E12 생존 resource dependency |
| Broadcast | DEFINED_CANDIDATE | 유지 | E02 재난명령 vs E07 검증 공영정보 vs E12 이동형 저전력 coverage |
| Residential | DEFINED_CANDIDATE | 유지 | E01 가족/세대 역할 vs E09 소유/보험/커뮤니티 자격 |
| C08 | DEFINED_CANDIDATE | 유지 | survival resource / shelter topology / communication / eligibility / depletion / persistence 분리 |

판정: **PASS at PRELOCK candidate level**

주의:
- 이는 96 campaign의 production 세부값이 모두 완성되었다는 뜻이 아니다.
- 13 문서의 candidate 값은 제작 시 검증·보강될 수 있다.
- ID, family, display name을 바꾸지 않는다.

## B. Family-to-Family Differentiation

| family boundary | 판정 | canonical rule |
|---|---|---|
| C03 ↔ C04 | **PASS** | custody/return/recovery vs authenticity/charge/repair/operability |
| C07 ↔ C08 | **PASS** | passage/quarantine/transfer vs survival allocation/shelter/evac capacity |
| C01 ↔ C06 | **PASS** | household/occupancy role vs account/membership/payment entitlement |
| C05 regional repetition | **PARTIAL** | anti-repeat contract는 정의됨. 12개 개별 law는 production entry에서 채움. |

## C. 공통 비교 축

모든 위험군/경계는 최소 다음에서 비교한다.

- service
- human recognition
- registration consequence
- refusal consequence
- resource ecology
- persistence
- rumor propagation

추가로 기존 6-field를 유지한다.

- regional_secondary_collapse
- infrastructure_anchor
- gameplay_law
- human_recognition_rule
- resource_ecology
- persistence_profile

## D. 판정 규칙

### Campaign-to-Campaign
같은 family 안에서 유사 campaign끼리 최소 4개 이상의 비교 질문이 실제로 달라야 한다.

- 실제로 만지는 infrastructure
- primary player verb / gameplay law
- recognition role
- service/resource bottleneck
- direct persistence
- rumor channel
- revisit consequence

4개 미만이면 `PARTIAL` 또는 `SYSTEM_OVERLAP`.

### Family-to-Family
family 핵심 질문과 primary player action이 다르면 PASS.

- C03/C04: flow/custody vs validity/repair
- C07/C08: pass/transfer vs survive/allocate
- C01/C06: live/belong vs transact/benefit

경계가 플레이 중 동일 gate/queue/registration loop로 수렴하면 `NEEDS_RULE_SPLIT`.

## E. C05 특별 Gate

C05는 동일 “방송국 skin + 수신 등록” loop 반복을 금지한다.

production entry 전에 각 E##_C05는:
- source/authority
- recognition
- transformation rule
- refusal consequence
- resource/bandwidth/power/verification
- persistence
- rumor channel

을 구분해야 한다.

현재 C05 family는 **PARTIAL**이지만, 이는 상위 구조 미확정이 아니라 campaign-specific production fill이다.

## F. Canonical PRELOCK 영향

- 기존 6개 위험군 폐기: 0
- 신규 family boundary 흡수: 완료
- family 재배열: 0
- campaign ID 변경: 0
- E02~E12 local 추가: 0

**HOLD 조건 없음.**
C05 PARTIAL은 production entry gate로 이월 가능하다.
