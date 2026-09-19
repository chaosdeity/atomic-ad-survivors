# 35 E01 C03 Local / Persistence Mapping V0.1

상태: **E01_C03 LOCAL / PERSISTENCE MAPPING**
대상: R03-L01~R03-L05
구현 상태: **NOT UNREAL IMPLEMENTATION**

## 0. 원칙

5 Local의 ID/name은 canonical을 그대로 사용한다.

현재 R03 Unreal 구현 근거가 없으므로 CURRENT로 승격하지 않는다.

각 Local은 C03의 custody/flow/return/recovery family 안에서만 해석한다. C04 validity/repair/charging gameplay는 분리한다.

## 1. Mapping

| Local | custody role | recognition role | resource role | investigation role | persistence candidate | C04 boundary risk | production_status | implementation_status |
|---|---|---|---|---|---|---|---|---|
| R03-L01 반품 접수 야드 | initial return intake / custody handoff / receipt 확인 | sender / recipient / return agent | handling capacity, storage/custody slot | actual possession과 receipt/return record 대조 | verified receipt/custody, intake decision, revisit | LOW: authenticity 판정으로 확장하지 않음 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R03-L02 자동 분류장 | custody flow / destination sorting / redirect | custodian / recipient | sorting throughput, handling capacity, verified label/record availability | actual destination과 recorded destination 비교 | verified destination, redirect/hold decision, revisit | MEDIUM: device 상태 진단이 아니라 flow 분류만 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R03-L03 보증 심사 창고 | warranty item custody / hold / release / destination | custodian / authorized claimant | storage capacity, custody slot, release/return processing capacity | actual claimant/custody/destination과 hold record 대조 | verified hold/release state, claimant/destination, revisit | **HIGH: validity / repairability / charging 침범 금지** | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R03-L04 파쇄 전 대기라인 | disposition 전 hold / recovery / release 검토 | custodian / authorized claimant / pickup subject | storage, handling, pickup/recovery capacity | disposal candidate의 actual claim/custody를 재검증 | hold/recovery/release decision, revisit | MEDIUM: repair로 disposition을 해결하는 loop 금지 | **FUTURE_PRODUCTION_FILL** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R03-L05 최종 반품 심사실 | final return/release/recovery/redirect custody decision | sender / recipient / custodian / authorized claimant | release/return processing, transport availability | receipt/claim/destination 최종 교차검증 | final custody decision, verified destination, revisit consequence | HIGH: authenticity/operability 최종 심사로 변형 금지 | **FUTURE_PRODUCTION_FILL** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |

## 2. R03-L03 hard boundary

C03 의미:
- custody.
- hold.
- release.
- destination.
- claimant.
- processing availability.

C04 금지 의미:
- validity.
- authenticate.
- repairability.
- repair.
- charging.
- firmware.
- operability.

보증 심사 창고라는 이름은 C03에서 device validity를 판정할 권한이 아니다.

## 3. Local persistence

STANDARD 후보:
- inspected custody/claim/receipt record.
- verified claimant/destination.
- verified storage/handling/transport availability.
- hold/redirect/recover/release decision.
- revisit consequence.

STRUCTURAL은 자동 잠그지 않는다.

특히 다음은 별도 evidence 전까지 persistent structural change가 아니다.
- warehouse 구조 변경.
- 장기 stock level.
- transport route 변경.
- 대규모 물자 이동.
- 파쇄/폐기 설비의 영구 상태.

## 4. Information boundary

Local에서 얻은 정보는 actual custody를 자동 변경하지 않는다.

허용:
- claimant information.
- pickup/recovery availability.
- destination/return information.
- custody/hold status.
- processing status.

금지:
- claim rumor만으로 release 완료.
- destination rumor만으로 item 이동.
- transport rumor만으로 physical route 생성.

## 5. Graph preservation

기존 C03 source refs:
- 09 R01-L05 → R03-L01
- 10 R03-L01 → R03-L02
- 11 R03-L02 → R03-L03
- 15 R03-L03 → R04-L01
- 20 R03-L03 → R03-L04
- 21 R03-L04 → R03-L05

이번 mapping:
- new source pair = **0**
- new visibility edge = **0**
- new physical edge = **0**
- new dependency edge = **0**

## 6. Result

- R03-L01: CANONICAL_SUPPORTING.
- R03-L02: CANONICAL_SUPPORTING.
- R03-L03: CANONICAL_SUPPORTING / C04 HIGH-RISK boundary locked.
- R03-L04: FUTURE_PRODUCTION_FILL.
- R03-L05: FUTURE_PRODUCTION_FILL.
- CURRENT Unreal implementation claim: **0**.
- C04 gameplay absorption: **0**.

판정: **E01_C03 LOCAL / PERSISTENCE MAPPING DEFINED**.
