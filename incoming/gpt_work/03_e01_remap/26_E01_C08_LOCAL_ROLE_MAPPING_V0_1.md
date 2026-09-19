# 26 E01 C08 Local Role Mapping V0.1

상태: **E01_C08 LOCAL ROLE MAPPING**  
대상: R08-L01~R08-L05  
구현 상태: **NOT UNREAL IMPLEMENTATION**

## 0. 원칙

5 Local을 모두 E01_C08 Production Entry에 연결하되, historical campaign role과 current survivor role을 분리한다.

현재 Unreal 증거가 없는 역할을 CURRENT로 승격하지 않는다.

## 1. Mapping

| Local | historical_campaign_role | current_survivor_role | production_status | resource_role | recognition_role | information_role | persistence_candidate | travel_role | implementation_status |
|---|---|---|---|---|---|---|---|---|---|
| R08-L01 침묵 보급소 | old relief/shelter/supply infrastructure trace; emergency service record 대조 anchor | survivor settlement / manual supply operation / settlement framing | **CURRENT_SUPPORTING** | current manual power, supply, bed/living support의 공간 근거. historical service와 별도 | historical evacuee/relief/shelter record를 확인할 수 있으나 current resident role과 동일시 금지 | current observation이 stale historical record를 검증하는 기준이 될 수 있음 | inspected record / verified availability / choice / revisit. survivor operation state는 별도 | SURVIVOR_SETTLEMENT_HUB = CANONICAL_ROLE; first-play mandatory = NOT LOCKED; Relay/Beacon 자동 assignment 없음 | Unreal candidate space 존재. production visual/gameplay PASS = NO |
| R08-L02 역송출 주유소 | emergency recovery / signal-support infrastructure trace | optional survivor support / recovery-support candidate | **CURRENT_SUPPORTING** | recovery equipment, maintenance, power/support 후보 | rescue-waiting / recovery-support record와 actual availability 대조 | recovery/beacon record 또는 signal-support 검증 후보 | recovery-support availability known by player | RECOVERY_SUPPORT = CANDIDATE_LOCK; LOCAL_BEACON_SUPPORT = CANDIDATE; SECTOR_RELAY = NOT_ASSIGNED; RECOVERY_LINE_ENDPOINT = NOT_ASSIGNED; mandatory first-play prerequisite = NO | planned/current support evidence only. exact device/endpoint/gameplay 미확정 |
| R08-L03 폐역 무음 플랫폼 | silence network / information / signal infrastructure candidate | current survivor operation role **NOT LOCKED** | **FUTURE_PRODUCTION_FILL** | communications / signal support candidate | rescue/evacuation 상태 검증을 지원할 수 있으나 exact rule 미확정 | source 07/08 branch trace, source 28 remote_signal visibility/information candidate | signal credibility / investigation state candidate | source 28 physical travel = NO; dependency = NO; Relay assignment 없음 | current Unreal/gameplay implementation evidence 없음 |
| R08-L04 민방위 저장고 | shelter / storage / water / relief capacity anchor candidate | current survivor operation role **NOT LOCKED** | **FUTURE_PRODUCTION_FILL** | shelter bed/occupancy, water, relief stock capacity candidate | shelter occupant / relief recipient / allocation-priority record 후보 | shelter/relief availability information candidate | verified service availability / allocation choice / revisit candidate | source 08/37 historical progression trace only; new physical edge 없음 | current Unreal/gameplay implementation evidence 없음 |
| R08-L05 가짜 구조 신호탑 | false rescue signal / internal crisis / information integrity anchor candidate | current survivor operation role **NOT LOCKED** | **FUTURE_PRODUCTION_FILL** | communications / signal-support degradation candidate | rescue-waiting subject status가 false/stale signal로 오염될 수 있음 | rescue signal credibility 핵심 후보 | false rescue signal verification / investigation state | source 37 historical internal-crisis trace only; travel assignment 없음 | current Unreal/gameplay implementation evidence 없음 |

## 2. R08-L01 boundary

R08-L01은 현재 survivor settlement framing의 canonical role을 가진다.

그러나 다음은 잠그지 않는다.
- current RPG34/35 safe hub와 runtime 1:1 동일성.
- first-play mandatory gate.
- Sector Relay.
- Local Beacon actual assignment.
- E01_C08 campaign이 settlement를 현재 자동 운영한다는 해석.

현재 후보 맵의 정산/귀환/발전기 태그는 공간 의미이며 기능/UI/정상 속도 플레이 구현 완료를 뜻하지 않는다.

## 3. R08-L02 role separation

R08-L02의 네 role은 합치지 않는다.

- RECOVERY_SUPPORT = **CANDIDATE_LOCK**
- LOCAL_BEACON_SUPPORT = **CANDIDATE**
- SECTOR_RELAY = **NOT_ASSIGNED**
- RECOVERY_LINE_ENDPOINT = **NOT_ASSIGNED**

old signal/recovery 의미만으로 Sector Relay host를 지정하지 않는다.

## 4. R08-L03 remote signal boundary

기존 source:
`R08-L03 → R05-L01 / P2 remote_signal`

현재 의미:
- visibility/information candidate only.
- physical travel implied = **NO**.
- Campaign Dependency = **NO**.
- Sector Relay = **NO**.

## 5. R08-L04 capacity boundary

R08-L04는 shelter / storage / water / relief capacity를 구체화하기 좋은 anchor지만 현재 Production implementation evidence는 없다.

따라서:
- exact stock = NOT LOCKED.
- exact bed count = NOT LOCKED.
- water quantity = NOT LOCKED.
- permanent facility change = NOT LOCKED.
- STRUCTURAL persistence = NOT LOCKED.

## 6. R08-L05 false-rescue boundary

false rescue signal은 정보 무결성/검증 문제다.

허용:
- signal credibility investigation.
- rescue-waiting record와 actual status 대조.
- stale/false information의 revisit memory.

금지:
- false signal 자체가 실제 stock 생성.
- rumor만으로 route open.
- rumor만으로 rescue equipment 생성.
- source 37을 physical route로 승격.

## 7. First-play boundary

R08-L01:
- framing / settlement hub.
- first-play mandatory = **NOT LOCKED**.

R08-L02:
- optional/support.
- mandatory first-play prerequisite = **NO**.

`R08-L01 → R08-L02 → R01-L01` 강제 tutorial chain = **FORBIDDEN**.

## 8. Graph preservation

C08 source refs는 참고만 한다.
- 01 R08-L01 → R08-L02
- 07 R08-L02 → R08-L03
- 08 R08-L03 → R08-L04
- 28 R08-L03 → R05-L01
- 37 R08-L04 → R08-L05

변경:
- source pair added = **0**
- physical edge added = **0**
- dependency edge added = **0**

## 9. Result

- R08-L01: CURRENT_SUPPORTING / survivor settlement boundary defined.
- R08-L02: CURRENT_SUPPORTING / recovery-support separation defined.
- R08-L03: FUTURE_PRODUCTION_FILL.
- R08-L04: FUTURE_PRODUCTION_FILL.
- R08-L05: FUTURE_PRODUCTION_FILL.
- current Unreal evidence 없는 role의 CURRENT 승격: **0**.

판정: **E01_C08 LOCAL ROLE MAPPING DEFINED**.
