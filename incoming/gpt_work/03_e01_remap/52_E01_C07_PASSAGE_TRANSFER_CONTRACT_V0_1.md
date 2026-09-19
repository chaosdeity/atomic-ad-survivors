# 52 E01 C07 Passage / Transfer Contract V0.1

상태: **E01_C07 PASSAGE TRANSFER CONTRACT**
구현 상태: **NOT UNREAL IMPLEMENTATION**
Campaign: **E01_C07 passage / quarantine / transfer**

## 0. 목적

E01_C07의 passage / quarantine / transfer 조건을 Production contract 수준으로 정의한다.

이 문서의 state 표현은 gameplay semantic이며 Unreal enum 또는 DB schema를 확정하지 않는다.
정확한 resource 수량은 만들지 않는다.
새 physical route 또는 ingress edge를 만들지 않는다.

## 1. Contract matrix

| item | state | capacity | verification | failure consequence | recovery / retry condition |
|---|---|---|---|---|---|
| inspection | pending / verified / failed / stale 등 현재 검사 상태를 구분 | inspection capacity | actual subject와 inspection record를 대조 | 잘못 hold 또는 clear, 추가 passage 판단 오류 | subject와 검사 service가 실제로 이용 가능할 때 재검사 |
| quarantine | held / cleared / stale 또는 미확인 상태를 구분 | quarantine processing capacity | actual condition과 quarantine record를 대조 | stale quarantine 또는 잘못된 clearance가 passage를 왜곡 | 재검사 / 재검증과 실제 processing availability가 있을 때 재판정 |
| clearance | unverified / cleared / denied / held 등 passage 판정 상태를 구분 | verification / control capacity | inspection, quarantine, subject identity/role, route 조건을 함께 확인 | 실제 통행 가능성과 다른 허용 / 거부 | 필요한 verification과 실제 route/service 조건이 다시 충족될 때 재판정 |
| transfer | unassigned / assigned / held / in-transfer / completed 등 이송 진행 상태를 구분 | transfer slot / handling / transport availability | actual person/item, assignment, route, handling state 대조 | 잘못된 hold / reroute / transfer 또는 이송 실패 | handling / transport / route availability가 확보되고 assignment를 다시 검증할 때 재시도 |
| manifest | unverified / verified / stale / conflicting 등 record 신뢰 상태를 구분 | manifest / verification service availability | actual person/item association과 manifest를 직접 대조 | 잘못된 passenger-item association, boarding / quarantine consequence | source record와 actual association을 재검증할 때 회복 |
| route availability | unknown / available / blocked / unverified 등 실제 물리 조건을 구분 | physical route / transport availability | 실제 route / map / service evidence로 확인 | record 또는 rumor만 믿고 통행 가능하다고 오판 | 물리 조건을 다시 확인하고 실제 passage evidence가 있을 때 재시도 |
| departure | pending / cleared / held / denied / departed 등 departure 진행 상태를 구분 | departure-control / transport capacity | manifest, clearance, route, transport availability를 함께 확인 | 잘못된 출항 허용 / 거부 또는 false departure availability | prerequisite와 actual transport가 다시 확인될 때 재판정 |
| unofficial passage | rumor-only / candidate / physically verified / unavailable 등 신뢰 수준을 구분 | 실제 route / operator / transport가 존재할 경우의 bounded capacity | rumor와 실제 physical passage evidence를 분리 검증 | rumor만으로 bypass를 시도하거나 존재하지 않는 route를 사실로 취급 | 실제 physical evidence와 필요한 passage support가 확인될 때만 재시도 |

## 2. Core causality

actual person / item state
+ inspection / quarantine / manifest / departure record
+ actual route / service / capacity
→ compare record vs reality
→ clear / hold / reroute / transfer / bypass judgment
→ passage consequence

record가 물리 route를 생성하지 않는다.
rumor가 quarantine을 해제하지 않는다.
clearance record가 transport를 생성하지 않는다.

## 3. C07 / C08 hard boundary

C07 primary:
- passage.
- quarantine.
- clearance.
- transfer.
- manifest.
- route availability.
- departure.
- unofficial passage verification.

C08 primary:
- shelter allocation.
- relief distribution.
- bed capacity.
- limited survival capacity allocation.
- evacuation capacity allocation as survival resource.

C07에서 C08 survival-allocation을 primary gameplay로 만들지 않는다.

R07-L02의 cold-transfer support는 이송 조건이며 relief stock 배분이 아니다.
R07-L05의 departure control은 통과 / 출항 조건이며 생존 좌석 배분 게임으로 자동 변환하지 않는다.

판정: **C07 / C08 BOUNDARY PASS**.

## 4. C07 / C03 secondary boundary

C07 허용:
- passenger ↔ baggage association.
- transfer assignment.
- boarding / quarantine consequence.
- passage / transfer chain 안의 misclassification.

C03 primary:
- ownership claim.
- custody ownership dispute.
- return.
- release.
- destination logistics 자체.

R07-L03에서 수하물 문제를 ownership / return / custody 해결 게임으로 바꾸지 않는다.

판정: **C07 / C03 BOUNDARY PASS**.

## 5. R07 ingress protection

R07-L01 external ingress:
**KNOWN GAP**

이 문서는:
- ingress를 발명하지 않는다.
- source edge를 추가하지 않는다.
- physical edge를 추가하지 않는다.
- visibility edge를 추가하지 않는다.
- dependency edge를 추가하지 않는다.

unofficial passage 역시 새 physical ingress edge를 의미하지 않는다.

## 6. Capacity law

다음 capacity는 유한하다.

- inspection.
- quarantine processing.
- transfer slot / handling.
- transport.
- route availability.
- cold-transfer support.
- manifest verification.
- departure control.

금지:
- infinite passage.
- infinite quarantine capacity.
- infinite transport.
- infinite transfer slot.
- exact quantity invention.

## 7. Result

inspection: **DEFINED**  
quarantine: **DEFINED**  
clearance: **DEFINED**  
transfer: **DEFINED**  
manifest: **DEFINED**  
route availability: **DEFINED**  
departure: **DEFINED**  
unofficial passage: **DEFINED**

C07/C08 boundary: **PASS**  
C07/C03 boundary: **PASS**  
R07 external ingress: **KNOWN GAP / PRESERVED**

판정: **E01_C07 PASSAGE / TRANSFER CONTRACT PASS**.
