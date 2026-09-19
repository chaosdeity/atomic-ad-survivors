# 25 E01 C08 Resource Ecology Contract V0.1

상태: **E01_C08 RESOURCE ECOLOGY CONTRACT**  
Campaign: E01_C08 비상보급 / shelter / survival capacity  
구현 상태: **NOT UNREAL IMPLEMENTATION**  
정확한 resource quantity: **NOT LOCKED**

## 0. 목적

E01_C08의 survival allocation / relief / shelter / evacuation capacity를 실제 resource/service 제약과 연결한다.

공통 법칙:

`availability → service 가능 여부 → gameplay consequence`

resource 또는 service가 무한하다고 가정하지 않는다.

## 1. Resource / Service contract

| category | capacity meaning | degradation meaning | recovery meaning | registration/refusal consequence | current survivor-layer boundary |
|---|---|---|---|---|---|
| power | emergency service 또는 support equipment가 작동할 수 있는 실제 전력 가용성 | power-dependent service가 제한되거나 검증/지원 절차가 일부 중단 | 실제 전력 source/repair/operation 근거가 확보될 때 복구 | historical eligibility가 있어도 전력이 없으면 service 불가 | 현재 R08의 수동 발전/전력 운영은 survivor operation이며 campaign automation이 아님 |
| water | shelter 생활·위생·기본 지원에 사용할 수 있는 급수 capacity | shelter support 및 장기 체류 가능성이 제한 | 실제 water source/repair/resupply 근거 필요 | record상 shelter 대상이어도 water capacity가 없으면 배정 제한 가능 | current survivor water management는 별도 운영 상태 |
| food / relief stock | 배분 가능한 실제 식량/relief inventory | 지원 대상 확대 또는 반복 지급이 제한 | 실제 resupply/recovery 근거 필요 | eligibility/priority가 있어도 stock 부족 시 allocation conflict 발생 | current stock을 historical record가 생성/삭제하지 않음 |
| shelter bed / occupancy capacity | 실제 수용 가능한 침상/점유 여유 | shelter placement/continued stay가 제한 | 실제 공간/침상 회복 근거 필요 | registered occupant와 actual occupancy mismatch가 핵심 판단 대상 | 현재 침상 수 변화를 STRUCTURAL로 자동 잠그지 않음 |
| recovery equipment | 실제 recovery/support를 수행할 수 있는 장비 availability | rescue/recovery support 범위 또는 신뢰도가 제한 | 장비 확보/수리/재가동 근거 필요 | rescue-waiting record만으로 recovery 실행 보장 안 됨 | R08-L02 RECOVERY_SUPPORT는 CANDIDATE_LOCK, exact endpoint는 미확정 |
| maintenance capacity | 시설/장비 상태를 유지할 수 있는 작업·부품·접근 capacity | degradation이 누적되고 service availability가 떨어질 수 있음 | 실제 maintenance action과 재료/접근 근거 필요 | registration만으로 maintenance bypass 불가 | survivor 수리 행위는 campaign recognition이 아님 |
| communications / signal support | 구조·대피·service 상태를 검증/전달할 수 있는 통신/신호 capacity | stale record, false rescue signal, unverifiable status 증가 | 실제 signal/support infrastructure와 verified record 필요 | signal credibility가 낮으면 rescue/evacuation 판단이 보류/우회될 수 있음 | R08-L03/R08-L05 역할은 FUTURE_PRODUCTION_FILL. current implementation claim 없음 |
| evacuation / recovery capacity | 제한된 대피/회수 실행 가능성 | 모든 대상을 동시에 처리할 수 없고 priority/allocation conflict가 발생 | 실제 transport/recovery/service evidence 필요 | evacuation/rescue-waiting record와 actual capacity를 대조 | Sector Relay / Recovery Line actual host를 자동 지정하지 않음 |

## 2. Scarcity rule

C08은 capacity family다. 따라서 “service exists”와 “service is available now”를 분리한다.

각 category는 최소 다음 상태 질문을 가져야 한다.
1. 현재 실제 availability가 있는가.
2. 실제 service를 실행하는 데 필요한 다른 support가 있는가.
3. capacity가 degraded 되었는가.
4. player가 record와 actual state를 검증할 수 있는가.
5. support를 유지/우회/재배치할 근거가 있는가.
6. 결과가 STANDARD persistence에 남을 수 있는가.

정확한 숫자, 재생 주기, 최대치, 생산량은 후속 gameplay/production evidence 전까지 잠그지 않는다.

## 3. Infinite-service prohibition

다음은 모두 금지한다.
- 무한 보급.
- 무한 구조.
- 무한 침상.
- 무한 전력.
- stale emergency record만으로 service 자동 생성.
- false rescue signal만으로 실제 rescue unit 생성.
- rumor만으로 stock/route/facility mutation.

## 4. Recognition / allocation relation

historical recognition axes:
- evacuee
- relief recipient
- shelter occupant
- rescue-waiting subject
- allocation-priority subject

resource ecology는 recognition과 실제 capacity를 반드시 분리한다.

예:
- `eligible = true`라도 `available capacity = false`면 service는 제한될 수 있다.
- `priority = high`라도 실제 대상 위치/상태가 stale이면 재검증이 필요하다.
- `rescue_waiting = true`라도 recovery equipment/route/support가 없으면 즉시 회수되지 않는다.
- actual need가 높아도 stale eligibility가 낮게 평가하면 player가 mismatch를 발견하고 판단해야 한다.

## 5. Historical vs current ownership

### HISTORICAL_CAMPAIGN_LAYER
저장/판정 가능한 것:
- service availability state.
- eligibility/allocation record.
- rescue/evacuation status record.
- signal credibility verification.
- support choice and revisit consequence.

### CURRENT_SURVIVOR_OPERATION_LAYER
별도 운영 상태:
- 실제 survivor stock handling.
- manual generation/power operation.
- current bed use.
- current repair.
- daily settlement supply/living.

이 current state를 historical campaign service state와 자동 합치지 않는다.

## 6. dependency_contract

Final Lock schema:
- provider
- consumer
- resource_or_service
- dependency_strength
- failure_effect
- recovery_condition
- propagation_channel

### Cross-Campaign

`cross_campaign_dependency = NONE_LOCKED`

현재 근거:
- Common Campaign Dependency Graph rows = 0.
- 검증된 provider/consumer infrastructure relation 없음.
- source edge는 dependency가 아님.
- remote_signal은 dependency가 아님.
- 지도상 근접 또는 same sector는 dependency가 아님.

### C08 internal Local service dependency

상태: **TBD / FUTURE_PRODUCTION_FILL**

가능한 검토 대상:
- shelter support와 water/power.
- recovery support와 equipment/maintenance.
- signal verification과 communications support.
- allocation과 actual relief/occupancy capacity.

그러나 이번 문서에서 새 graph edge를 만들지 않는다.

## 7. Local anchor application

- R08-L01: current survivor manual supply/living evidence는 존재하지만 campaign current automation evidence는 없음.
- R08-L02: recovery-support infrastructure 의미만 CANDIDATE_LOCK. Sector Relay는 NOT_ASSIGNED.
- R08-L03: signal/information role future fill.
- R08-L04: shelter/storage/water/relief capacity future fill.
- R08-L05: false rescue signal/information integrity future fill.

## 8. Contract result

- resource/service categories: **DEFINED**
- capacity meaning: **DEFINED**
- degradation meaning: **DEFINED**
- recovery meaning: **DEFINED WITHOUT EXACT QUANTITY**
- registration/refusal consequence: **DEFINED**
- survivor-layer boundary: **DEFINED**
- cross-Campaign dependency: **NONE_LOCKED**
- new dependency edge: **0**
- exact resource quantity invention: **0**
- Unreal implementation: **0**

판정: **E01_C08 RESOURCE ECOLOGY CONTRACT DEFINED**.
