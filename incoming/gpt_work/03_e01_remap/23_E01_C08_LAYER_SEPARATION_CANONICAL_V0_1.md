# 23 E01 C08 Layer Separation Canonical V0.1

상태: **E01_C08 LAYER SEPARATION CANONICAL**  
Campaign: **E01_C08 비상보급 / shelter / survival capacity**  
구현 상태: **NOT UNREAL IMPLEMENTATION**  
기준: Final Global World Structure Lock V0.2 / E01 Remap Canonical / Common Graph Production Ready

## 0. 목적

E01_C08의 historical emergency supply / shelter / evacuation campaign과 현재 R08 survivor-operated silence zone을 같은 운영 주체로 해석하지 않도록 Production Fill 경계를 잠근다.

핵심 문장:

> R08 survivor operation is not evidence that E01_C08 currently operates the settlement.

E01_C08의 과거 캠페인 규칙은 relief, shelter, evacuation, allocation, emergency infrastructure, legacy recognition / record / signal을 다룬다. 현재 R08은 생존자들이 과거 인프라를 수동 운영, 수리, 재사용, 정산, 보급, 생활하는 별도 층이다.

## 1. HISTORICAL_CAMPAIGN_LAYER

| 항목 | Canonical |
|---|---|
| operator | 과거 비상보급 / 대피 인프라를 운영하던 campaign-side emergency service logic 및 잔존 절차 |
| authority | historical emergency allocation / shelter / evacuation record와 그 서비스 판정 규칙 |
| recognition | evacuee, relief recipient, shelter occupant, rescue-waiting subject, allocation-priority subject |
| resource ownership | 당시 service가 참조하던 power, water, food/relief stock, shelter bed/occupancy capacity, recovery equipment, maintenance capacity, communications/signal support, evacuation/recovery capacity |
| service behavior | 실제 필요와 실제 capacity보다 등록 대상, 우선순위, 가용 capacity 기록, rescue/evacuation 상태를 우선할 경우 지원이 잘못 배분되거나 보류될 수 있음 |
| persistence ownership | inspected emergency record, verified service availability, allocation/support choice, recovery-support state, false rescue signal verification, revisit investigation state |
| allowed interaction | actual need/capacity 확인 → eligibility/emergency record 확인 → service/allocation 상태 대조 → 제한된 support 유지/우회/재배치 판단 → 실제 resource/service 조건 확인 → 결과 → revisit |
| forbidden interpretation | 현재 R08 주민의 사회적 역할을 campaign recognition으로 동일시, survivor manual operation을 campaign automation으로 해석, stale record만으로 실제 자원량을 변경 |

### 1.1 regional failure meaning

새 대사고를 창작하지 않는다.

비상보급 / 대피 인프라가 장기간 남아 있고 evacuee / relief / shelter / rescue-waiting 관련 기록과 capacity 판단이 실제 인구 이동과 현실 상황에서 벗어나면서, 실제 필요보다 등록된 대상, 우선순위, 가용 capacity 기록, 구조/대피 상태를 우선해 service를 잘못 배분하거나 보류하는 2차 붕괴를 C08 historical layer의 중심 인과로 사용한다.

false rescue signal과 stale emergency record는 이 구조 안의 정보/판정 문제로만 사용한다.

## 2. CURRENT_SURVIVOR_OPERATION_LAYER

| 항목 | Canonical |
|---|---|
| operator | 현재 R08 생존자 집단 |
| authority | 생존자가 직접 확인하고 운영하는 현재 생활/정산/보급/수리 판단 |
| recognition | 현재 주민, 작업자, 귀환자, 정산/생활 참여자 등 survivor-side 역할. historical campaign recognition과 분리 |
| resource ownership | 생존자가 확보·소비·수리·재사용하는 실제 현재 전력, 물, 식량/물자, 침상, 장비, 유지 capacity |
| service behavior | 수동 운영, 수리, 재사용, 정산, 보급, 생활. 자동 campaign service라고 부르지 않음 |
| persistence ownership | current survivor operation state는 historical campaign memory와 별도 저장 범주. 이번 Production Entry에서 STRUCTURAL로 자동 잠그지 않음 |
| allowed interaction | current hub framing, settlement 생활, 수동 정산, 수동 보급, 휴식, 현재 장비/시설 확인 |
| forbidden interpretation | survivor operation을 E01_C08 current campaign operation으로 승격, 현재 보급소 후보를 production visual/gameplay PASS로 승격, survivor repair를 campaign recognition rule로 해석 |

## 3. Layer interaction rule

두 층은 같은 physical infrastructure의 흔적을 공유할 수 있다. 그러나 shared infrastructure는 shared operator를 뜻하지 않는다.

허용:
- 생존자가 historical shelter / supply infrastructure를 재사용.
- 플레이어가 historical record와 current physical state를 대조.
- stale record 또는 false rescue signal의 신뢰도를 current observation으로 검증.
- current availability가 historical service 판정을 반박하는 상황.

금지:
- historical record가 current stock을 직접 생성/삭제.
- current survivor repair가 historical campaign authority를 복구.
- current resident role이 자동으로 evacuee/relief recipient가 됨.
- current R08 operation을 campaign이 계속 자동 운영한다고 기술.

## 4. Infrastructure boundary

### R08-L01 침묵 보급소
- layer: **CURRENT_SURVIVOR_OPERATION_LAYER 중심**
- production status: **CURRENT_SUPPORTING**
- canonical role: survivor settlement / manual supply operation
- Unreal evidence: candidate space 존재
- production visual/gameplay PASS: **NO**
- historical relation: 옛 emergency supply/shelter infrastructure의 흔적을 참조할 수 있으나 current operator는 survivor

### R08-L02 역송출 주유소
- layer: current survivor support + historical infrastructure trace
- production status: **CURRENT_SUPPORTING**
- RECOVERY_SUPPORT = **CANDIDATE_LOCK**
- LOCAL_BEACON_SUPPORT = **CANDIDATE**
- SECTOR_RELAY = **NOT_ASSIGNED**
- RECOVERY_LINE_ENDPOINT = **NOT_ASSIGNED**

### R08-L03 폐역 무음 플랫폼
- production status: **FUTURE_PRODUCTION_FILL**
- role candidate: silence network / information / signal infrastructure
- source 28 R08-L03 → R05-L01 remote_signal은 visibility/information reference만 유지
- physical travel / dependency 승격: **NO**

### R08-L04 민방위 저장고
- production status: **FUTURE_PRODUCTION_FILL**
- role candidate: shelter / storage / water / relief capacity

### R08-L05 가짜 구조 신호탑
- production status: **FUTURE_PRODUCTION_FILL**
- role candidate: false rescue signal / internal crisis / information integrity

## 5. First-play boundary

R08-L01:
- framing / settlement hub
- first-play mandatory = **NOT LOCKED**

R08-L02:
- optional/support
- mandatory first-play prerequisite = **NO**

다음 chain은 부활시키지 않는다.

`R08-L01 → R08-L02 → R01-L01`

기존 source relation은 production priority / historical progression reference이며 mandatory tutorial unlock 또는 physical gate가 아니다.

## 6. Graph boundary

이번 문서는 Common Graph를 수정하지 않는다.

C08 관련 기존 source refs:
- 01 R08-L01 → R08-L02
- 07 R08-L02 → R08-L03
- 08 R08-L03 → R08-L04
- 28 R08-L03 → R05-L01
- 37 R08-L04 → R08-L05

판정:
- new source edge = **0**
- new physical edge = **0**
- new Campaign Dependency edge = **0**
- R08-L03 → R05-L01 remote_signal physical/dependency promotion = **0**

## 7. Persistence ownership boundary

historical campaign Direct Memory 후보:
- inspected emergency record
- verified service availability
- important allocation/support choice
- recovery-support state known by player
- false rescue signal verification
- revisit investigation state

current survivor operation state:
- 별도 survivor layer
- 이번 C08 historical persistence에 자동 병합하지 않음
- 발전기 수리, 시설 파손, 침상 수, 장기 stock 변화, 건물/route 영구 변화, 주민 이동을 STRUCTURAL로 자동 잠그지 않음

## 8. Canonical result

- HISTORICAL_CAMPAIGN_LAYER: **DEFINED**
- CURRENT_SURVIVOR_OPERATION_LAYER: **DEFINED**
- operator separation: **PASS**
- authority separation: **PASS**
- recognition separation: **PASS**
- persistence ownership separation: **PASS**
- survivor operation ≠ campaign operation: **PASS**
- Unreal implementation: **0**
- Common Graph mutation: **0**

판정: **E01_C08 LAYER SEPARATION DEFINED**.
