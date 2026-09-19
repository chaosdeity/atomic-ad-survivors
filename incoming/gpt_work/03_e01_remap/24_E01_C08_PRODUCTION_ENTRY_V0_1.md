# 24 E01 C08 Production Entry V0.1

상태: **E01_C08 PRODUCTION ENTRY**  
Campaign verdict: **DEFINED**  
구현 상태: **NOT UNREAL IMPLEMENTATION**  
persistence_profile.class: **STANDARD**  
STRUCTURAL physical persistence: **NOT LOCKED**

## 0. 범위

E01_C08 비상보급 / shelter / survival capacity의 Final Lock 6-field Production Entry를 정의한다.

이 문서는 historical campaign layer를 정의하며, 현재 R08 survivor-operated silence zone의 생활/정산/수동 운영 자체를 E01_C08 current campaign operation으로 취급하지 않는다.

상세 layer boundary는 `23_E01_C08_LAYER_SEPARATION_CANONICAL_V0_1.md`를 따른다.

## 1. regional_secondary_collapse

상태: **DEFINED**

### 정의

E01_C08의 지역 2차 붕괴는 새로운 대사고가 아니라, 장기간 남은 비상보급 / 대피 infrastructure와 emergency record가 실제 인구 이동·현실 상황·실제 capacity와 어긋난 상태에서 서비스 판정이 계속되는 구조다.

인과:

1. relief / shelter / evacuation infrastructure와 record가 남는다.
2. evacuee / relief recipient / shelter occupant / rescue-waiting subject / allocation-priority subject가 기록된다.
3. 시간이 지나 실제 필요와 실제 이용 가능 capacity가 바뀐다.
4. stale eligibility, priority, capacity, rescue/evacuation status가 현실보다 우선된다.
5. 제한된 service가 필요한 사람에게 가지 않거나, 이미 의미가 사라진 대상에게 예약되거나, 보류된다.
6. player는 record와 actual need/capacity를 대조해야 한다.
7. false rescue signal과 stale emergency record는 이 인과 안에서 신뢰도 문제를 만든다.

금지:
- 새 광역 재난 창작.
- 기록 오류만으로 실제 stock 물리 변경.
- current survivor hub의 부족을 historical campaign 자동운영의 결과라고 단정.

## 2. infrastructure_anchor

상태: **DEFINED**

E01_C08의 anchor는 5개 R08 Local의 historical infrastructure role과 current survivor reuse를 분리해 사용한다.

| Local | Production status | Historical campaign anchor | Current survivor boundary |
|---|---|---|---|
| R08-L01 침묵 보급소 | CURRENT_SUPPORTING | old relief/shelter/supply infrastructure trace | survivor settlement / manual supply operation. candidate Unreal space, production visual/gameplay PASS 아님 |
| R08-L02 역송출 주유소 | CURRENT_SUPPORTING | emergency recovery / signal-support infrastructure trace | RECOVERY_SUPPORT CANDIDATE_LOCK, LOCAL_BEACON_SUPPORT CANDIDATE, SECTOR_RELAY NOT_ASSIGNED |
| R08-L03 폐역 무음 플랫폼 | FUTURE_PRODUCTION_FILL | silence network / information / signal infrastructure candidate | current implemented role로 승격하지 않음 |
| R08-L04 민방위 저장고 | FUTURE_PRODUCTION_FILL | shelter / storage / water / relief capacity candidate | current implementation claim 없음 |
| R08-L05 가짜 구조 신호탑 | FUTURE_PRODUCTION_FILL | false rescue signal / information-integrity crisis candidate | current implementation claim 없음 |

Infrastructure anchor가 의미하지 않는 것:
- 5 Local 모두 현재 구현 완료.
- R08-L02 Sector Relay assignment.
- source 28 remote_signal의 physical travel/dependency 승격.
- mandatory first-play chain.

## 3. gameplay_law

상태: **DEFINED**

### Campaign primary law

`actual need / capacity 확인`
→ `eligibility / emergency record 확인`
→ `service / allocation 상태 대조`
→ `제한된 support를 유지 / 우회 / 재배치할지 판단`
→ `실제 resource/service 조건 충족 여부 확인`
→ `결과 발생`
→ `persistence / revisit`

### player verbs

- inspect actual need.
- inspect actual available capacity.
- inspect eligibility / allocation / shelter / evacuation / rescue-waiting record.
- compare record with present reality.
- verify signal credibility.
- maintain, bypass, or reallocate limited support where production evidence permits.
- accept degraded service when capacity is unavailable.
- revisit with prior verified state remembered.

### service contract

서비스는 추상적인 “구조 가능” 플래그가 아니다.

반드시:
`availability → service 가능 여부 → gameplay consequence`

를 따른다.

예:
- usable power가 없으면 전력 의존 service가 degraded.
- water availability가 없으면 shelter support가 제한.
- relief stock이 부족하면 allocation 선택이 제한.
- bed/occupancy capacity가 없으면 shelter placement가 제한.
- recovery equipment/maintenance capacity가 없으면 recovery support가 제한.
- communications/signal support가 degraded되면 rescue/evacuation 정보의 검증 가능성이 낮아질 수 있음.

정확한 수치는 이 문서에서 잠그지 않는다.

### registration cost

historical registration/recognition을 따를 경우 player는 service access를 얻을 수 있으나, stale record 또는 잘못된 priority가 actual need와 충돌할 수 있다. 등록 자체를 current survivor citizenship이나 주민 역할로 확대하지 않는다.

### refusal cost

record/eligibility 절차를 거부하거나 신뢰하지 않는 선택은 일부 historical service access 또는 verified allocation path를 포기하게 만들 수 있다. 다만 survivor current 생활권에서 자동 추방, 즉사, 무한 resource loss 같은 새 페널티는 만들지 않는다.

### first-play

- R08-L01 first-play mandatory = **NOT LOCKED**
- R08-L02 mandatory first-play prerequisite = **NO**
- R08-L01 → R08-L02 → R01-L01 forced tutorial chain = **FORBIDDEN**

## 4. human_recognition_rule

상태: **DEFINED**

Historical campaign recognition axes:
- evacuee
- relief recipient
- shelter occupant
- rescue-waiting subject
- allocation-priority subject

Recognition은 현재 사람의 실제 사회적 역할을 진실하게 이해하는 인간 분류가 아니라, emergency service가 어떤 기록/자격/우선순위 대상으로 취급하는지를 나타낸다.

### mismatch rule

다음 mismatch가 핵심이다.
- actual need가 높지만 record priority가 낮음.
- record상 대상이지만 실제로는 이동/이탈/상황 변경.
- shelter occupancy record와 실제 occupancy/capacity가 다름.
- rescue-waiting status가 stale.
- false rescue signal이 rescue state 판단을 오염.

### boundary

현재 R08 survivor 주민은 historical recognition field 때문에 존재하는 것이 아니다.

금지:
- survivor resident = evacuee 자동 동일시.
- manual supply worker = relief allocation authority 자동 동일시.
- current settlement membership = campaign eligibility 자동 동일시.

## 5. resource_ecology

상태: **DEFINED**

### resource/service categories

- power
- water
- food / relief stock
- shelter bed / occupancy capacity
- recovery equipment
- maintenance capacity
- communications / signal support
- evacuation / recovery capacity

### causal rule

모든 category는:
`availability → service availability → gameplay consequence`

로 연결한다.

무한 자원/서비스를 허용하지 않는다.
- infinite relief = **NO**
- infinite rescue = **NO**
- infinite bed = **NO**
- infinite power = **NO**

### dependency_contract

Final Lock 형식:
- provider
- consumer
- resource_or_service
- dependency_strength
- failure_effect
- recovery_condition
- propagation_channel

현재 cross-Campaign 근거 판정:

`cross_campaign_dependency = NONE_LOCKED`

이유:
- Common Campaign Dependency Graph rows = 0.
- provider / consumer / resource / failure / recovery의 검증된 cross-Campaign evidence가 없음.
- source edge, family proximity, remote_signal은 dependency 근거가 아님.

C08 내부 Local service dependency는 future Production Fill에서 실제 infrastructure evidence가 확보되면 별도 검토한다. 이번 작업에서 새 graph edge는 생성하지 않는다.

## 6. persistence_profile

상태: **DEFINED**  
class: **STANDARD**

### STANDARD Direct Memory scope

저장 후보:
- relief / shelter service state
- investigation state
- eligibility / allocation record state
- recovery-support availability state
- false-rescue-signal investigation state
- important choice
- revisit consequence
- inspected emergency record
- verified service availability
- important allocation/support choice
- recovery-support state known by player
- false rescue signal verification
- revisit investigation state

### rumor / information scope

허용 후보:
- rescue signal credibility
- route safety information
- shelter availability information
- relief availability information
- evacuation status information

허용 channel:
- resident movement
- communications
- administrative/emergency record
- recovery/beacon record

정보는 physical mutation이 아니다.

금지:
- rumor로 actual stock 변경.
- rumor로 발전기 수리.
- rumor로 침상 증가.
- rumor로 route open.
- rumor로 facility repair/damage.

### CURRENT_SURVIVOR_OPERATION_LAYER boundary

current survivor operation state는 historical campaign Direct Memory와 분리한다.

다음은 STANDARD에 자동 포함하거나 STRUCTURAL로 자동 승격하지 않는다.
- 발전기 수리.
- 시설 파손.
- 침상 수 변화.
- 물자 저장량의 장기 구조 변경.
- 건물/route 영구 변화.
- 주민 이동.

### STRUCTURAL

`STRUCTURAL physical persistence = NOT LOCKED`

실제 gameplay / production evidence 확보 후 별도 승격 검토한다.

## 7. Graph / travel boundary

기존 Common Graph 결과를 유지한다.

- new source edge = **0**
- new physical edge = **0**
- new Campaign Dependency edge = **0**
- R08-L03 → R05-L01 remote_signal physical promotion = **0**
- R08-L03 → R05-L01 dependency promotion = **0**
- R08-L02 SECTOR_RELAY assignment = **0**

## 8. Final Lock 6-field result

| field | status |
|---|---|
| regional_secondary_collapse | DEFINED |
| infrastructure_anchor | DEFINED |
| gameplay_law | DEFINED |
| human_recognition_rule | DEFINED |
| resource_ecology | DEFINED |
| persistence_profile | DEFINED / STANDARD |

Campaign verdict: **DEFINED**.

## 9. Non-implementation boundary

이 문서는 다음을 구현하지 않는다.
- Unreal Blueprint/C++.
- map change.
- current R08 gameplay completion.
- exact resource quantities.
- Sector Relay assignment.
- Local Beacon actual assignment.
- Recovery Line exact geometry.
- STRUCTURAL persistence.
- Common Graph edit.
- C01 edit.
- Final Lock edit.

판정: **E01_C08 PRODUCTION ENTRY DEFINED**.
