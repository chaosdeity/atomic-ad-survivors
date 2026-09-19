# 34 E01 C03 Custody / Resource Contract V0.1

상태: **E01_C03 CUSTODY / RESOURCE CONTRACT**
Campaign: E01_C03 반품 / custody / 회수
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence class: **STANDARD**
STRUCTURAL: **NOT LOCKED**
정확한 resource quantity: **NOT LOCKED**

## 0. 목적

E01_C03의 custody state, claim, receipt, return, hold, release, recovery와 이를 제한하는 storage/handling/sorting/transport capacity를 Production contract로 정의한다.

공통 법칙:
availability/state
→ flow/service 가능 여부
→ hold / redirect / release / recovery consequence

C04 validity/repair/charging 영역은 침범하지 않는다.

## 1. Custody state contract

### custody state

확인 대상:
- 누가 현재 보관/관리하고 있는가.
- 실제 위치와 기록상 위치가 일치하는가.
- hold/release/return/recovery 중 어떤 상태인가.
- current destination이 무엇인가.

결과:
verified custody state가 flow decision의 출발점이 된다.

### claim

확인 대상:
- 누가 authorized claimant인가.
- sender/recipient/custodian claim이 현재 state와 일치하는가.

결과:
검증되지 않은 claim은 release/recovery 권한을 자동 생성하지 않는다.

### receipt

확인 대상:
- 실제 receipt/handoff가 있었는가.
- record와 current possession이 일치하는가.

결과:
receipt mismatch는 additional investigation 또는 hold를 만들 수 있다.

### return

확인 대상:
- return destination과 actual destination이 일치하는가.
- 실제 processing capacity가 있는가.

결과:
capacity가 없거나 destination이 불명확하면 return이 보류/redirect될 수 있다.

### hold

hold는 오류 상태만이 아니다.
claim, destination, receipt 또는 capacity가 검증되지 않았을 때 bounded custody state로 사용할 수 있다.

### release

release는 verified claimant/destination과 실제 processing condition이 있을 때 가능하다.

### recovery

recovery는 실제 pickup/recovery/transport availability가 있을 때만 성립한다.
record상 recovery 대상이라는 이유만으로 실제 회수 unit을 생성하지 않는다.

## 2. Resource / service categories

| category | availability/state | degradation meaning | recovery meaning | flow/service consequence |
|---|---|---|---|---|
| storage capacity | 실제 보관 가능한 유한 공간/slot | 추가 hold/return 대상을 수용하기 어려움 | 실제 공간/slot availability 회복 근거 필요 | hold 또는 redirect 조건 변화 |
| handling capacity | 실제 접수·이동·인계 처리 가능성 | custody handoff/processing이 제한 | 실제 service/handling availability 회복 | receipt/return/release 처리 제한 |
| sorting throughput | 실제 분류 처리 가능 범위 | destination/return flow가 병목 | 실제 sorting service 회복 근거 필요 | hold/redirect 증가 가능 |
| pickup / recovery capacity | 실제 회수 실행 가능성 | recovery 대상이 있어도 회수 불가/제한 | 실제 pickup/recovery support 근거 필요 | recovery 가능 여부 |
| transport availability | 실제 목적지 이동 가능성 | verified destination이 있어도 이동 제한 | 실제 transport availability 회복 | redirect/hold/return consequence |
| custody slot | 실제 custody를 안전하게 유지할 수 있는 처리 단위 | slot 부족 시 추가 대상 hold가 어려움 | 실제 slot availability 회복 | hold/release 우선 판단 필요 |
| verified label / record availability | receipt/claim/destination을 검증할 수 있는 정보 availability | stale/unverified state 증가 | verified record source 확보 | investigation과 공식 flow access에 영향 |
| release / return processing capacity | release/return을 실제 확정 처리할 수 있는 service capacity | 검증 완료 후에도 processing 제한 | 실제 processing service 회복 | release/return 지연 또는 redirect |

label/record는 currency가 아니다.

정확한 수치, 처리량, 최대치, 재생 주기는 잠그지 않는다.

## 3. Recognition / custody mismatch

주 recognition axes:
- sender.
- recipient.
- custodian.
- authorized claimant.
- return agent / pickup subject.

핵심 mismatch:
actual custody / actual claimant / actual destination
≠
recorded sender / recipient / custodian / return / claim state

인간은 상품 자체가 아니라 custody/claim 관계의 주체로 읽힌다.

## 4. Registration / refusal consequence

### official record path

receipt/return/claim record가 검증되면:
- hold/release/return/recovery의 공식 path를 확인할 수 있다.
- destination과 authorized claimant를 검산할 수 있다.

하지만 record가 실제 custody를 자동 변경하지 않는다.

### bypass / refusal path

stale 또는 모순된 record를 그대로 따르지 않으면:
- 공식 processing path가 잠시 보류될 수 있다.
- actual claimant, possession, destination, service capacity를 추가 조사해야 한다.
- alternate path는 실제 handling/transport/recovery availability가 있을 때만 허용한다.

무료 transport, 무료 storage, 무료 recovery를 생성하지 않는다.

## 5. C03 / C04 exclusion

C03 allowed:
- custody state.
- receipt.
- claim.
- return.
- hold.
- release.
- recovery.
- destination.
- storage/handling/sorting/transport capacity.

C04 excluded:
- authenticity/validity.
- charging.
- firmware.
- diagnosis.
- repairability.
- repair.
- operability.

특히 R03-L03:
보증이라는 단어가 있어도 C03에서는 warranty item의 custody / hold / release / destination만 다룬다.

device가 진짜인지, 고칠 수 있는지, 충전 가능한지는 C04 Production Fill 대상이다.

## 6. Direct Memory / STANDARD persistence

STANDARD Direct Memory 후보:
- verified custody state.
- inspected receipt/claim/return record.
- verified claimant/destination.
- verified processing/transport/storage availability.
- hold/redirect/recover/release decision.
- revisit consequence.

재방문 시:
- 이미 검증한 receipt/claim을 처음부터 미확인으로 되돌리지 않는다.
- 이전 custody decision과 processing result를 참조할 수 있다.
- 더 최신의 verified state가 있으면 오래된 record를 갱신할 수 있다.

## 7. Rumor / Information boundary

Rumor candidates:
- claimant information.
- pickup/recovery availability.
- destination/return information.
- custody/hold status.
- release/return processing status.

허용 causal channels:
- logistics.
- communications.
- administrative/processing record.
- actual person/item movement.

금지:
- rumor로 actual custody 변경.
- rumor로 warehouse capacity 증가.
- rumor로 transport 생성.
- rumor로 item location 이동.
- rumor로 release 완료 처리.
- all-to-all logistics rumor.

## 8. STRUCTURAL exclusion

STRUCTURAL physical persistence = **NOT LOCKED**

자동 포함 금지:
- 물류창고 영구 구조 변경.
- transport route 영구 변경.
- 대규모 item/person movement의 영구 구조화.
- 재고 무기한 변화.
- facility repair/damage 장기 고정.

## 9. Dependency boundary

cross_campaign_dependency = **NONE_LOCKED**

- Common Campaign Dependency Graph rows = 0.
- R01-L05 → R03-L01은 progression source.
- R03-L03 → R04-L01은 progression source.
- source pair는 dependency evidence가 아니다.
- new dependency edge = 0.

## 10. Contract result

- custody state: **DEFINED**
- claim: **DEFINED**
- receipt: **DEFINED**
- return: **DEFINED**
- hold: **DEFINED**
- release: **DEFINED**
- recovery: **DEFINED**
- storage/handling/sorting/transport capacity: **DEFINED**
- C03/C04 boundary: **DEFINED**
- persistence: **STANDARD**
- STRUCTURAL: **NOT LOCKED**
- exact quantity invention: **0**
- Unreal implementation: **0**

판정: **E01_C03 CUSTODY / RESOURCE CONTRACT DEFINED**.
