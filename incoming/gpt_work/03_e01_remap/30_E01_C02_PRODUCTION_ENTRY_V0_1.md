# 30 E01 C02 Production Entry V0.1

상태: **E01_C02 PRODUCTION ENTRY**
Campaign verdict: **DEFINED**
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence_profile.class: **STANDARD**
STRUCTURAL physical persistence: **NOT LOCKED**

## 0. 범위

E01_C02 의료 / 환자 / 진료 Campaign의 Final Lock 6 fields를 Production Entry 수준으로 정의한다.

이 문서는 R02-L01~R02-L05의 canonical Local과 Final Lock family boundary를 이용해 Production contract를 정의한다. 현재 R02 Unreal 구현이 존재한다고 주장하지 않는다.

Recovered research/proof는 다음 방법론만 참고한다.
- facility/resource availability가 service consequence로 이어지는 causality.
- conflicting record와 actual state를 대조하는 investigation pattern.
- 중요한 상태와 선택이 revisit에 남는 persistence test pattern.

proof의 사건, 수치, 등장인물, 치료 결말은 E01_C02 canon으로 승격하지 않는다.

## 1. regional_secondary_collapse

상태: **DEFINED**

E01_C02의 2차 붕괴는 새 재난이 아니라, 장기간 남은 의료/환자 관리 infrastructure와 patient/treatment/isolation/discharge record가 실제 환자 상태 및 현재 care need와 어긋난 상태에서 서비스 판정이 계속되는 구조다.

인과:
1. 의료 시설과 환자 관리 절차가 남는다.
2. patient / care eligibility / isolation / discharge 관련 record가 누적·잔존한다.
3. 실제 환자 상태, 실제 치료 필요, 실제 가용 capacity가 변한다.
4. 오래된 등록 상태나 절차가 현재 상태보다 우선될 수 있다.
5. 치료, 격리, 약품, 퇴원 또는 transfer service가 잘못 배정되거나 보류된다.
6. player는 actual condition / medical record / eligibility / capacity를 대조한다.
7. 판단과 service consequence가 STANDARD persistence와 revisit에 남을 수 있다.

금지:
- 새 광역 의료 재난 창작.
- E02의 시간, 예약, 번호표, 순번 질서를 C02의 주 gameplay로 복사.
- proof의 특정 치료 사건이나 결말 정사화.
- 실제 상태 확인 없이 등록 record만으로 성공/실패를 확정.

## 2. infrastructure_anchor

상태: **DEFINED**

| Local | production_status | Production anchor | implementation boundary |
|---|---|---|---|
| R02-L01 응급 접수 홀 | **CANONICAL_SUPPORTING** | patient/care-recipient 등록 상태, 응급 접수, 현재 care need와 service eligibility를 대조하는 intake anchor | current Unreal implementation claim 없음 |
| R02-L02 장기 입원동 | **CANONICAL_SUPPORTING** | long-term care subject, 실제 환자 상태, bed/treatment capacity, 장기 관리 record의 불일치 조사 anchor | proof 치료 사건/결말 승격 금지 |
| R02-L03 보험 심사 약국 | **CANONICAL_SUPPORTING** | insured/eligible care subject, medicine/medical supply availability와 care eligibility를 대조하는 service anchor | exact stock/quantity 및 현재 Unreal 구현 미확정 |
| R02-L04 격리문 복도 | **FUTURE_PRODUCTION_FILL** | isolation subject, isolation capacity, 실제 격리 필요와 등록 isolation status를 대조하는 anchor | 현재 Unreal 구현 근거 없음 |
| R02-L05 퇴원 불가 병동 | **FUTURE_PRODUCTION_FILL** | discharge-eligible subject, discharge record, care/transfer support와 실제 상태를 대조하는 anchor | 현재 Unreal 구현 근거 없음 |

CANONICAL_SUPPORTING은 Local ID/name과 source role이 Production contract를 지지한다는 뜻이며 CURRENT Unreal implementation을 뜻하지 않는다.

## 3. gameplay_law

상태: **DEFINED**

### Campaign primary law

actual patient/service state 확인
→ medical record / care eligibility 확인
→ actual capacity 확인
→ record와 reality 대조
→ service를 유지 / 우회 / 재배치 / 보류할지 판단
→ 실제 service 조건에 따른 결과
→ STANDARD persistence / revisit

### primary verbs

- inspect actual patient condition and current care need.
- verify patient / eligibility / isolation / discharge record.
- verify finite service capacity.
- reconcile record with present reality.
- maintain, bypass, reallocate, or hold a service path where evidence permits.
- revisit with verified state and prior decisions remembered.

### service contract

service는 등록 플래그만으로 생성되지 않는다.

공통 규칙:
availability
→ care/service 가능 여부
→ gameplay consequence

등록상 eligible이어도 필요한 bed, medicine, staff/service, isolation, diagnostic/registration, transfer support가 없으면 service가 제한될 수 있다.

### registration consequence

record/eligibility 절차를 사용할 경우 기존 의료 service path에 접근할 수 있지만, stale patient/service status가 actual condition과 충돌하면 잘못된 치료·격리·약품·퇴원 판정을 만들 수 있다.

### refusal consequence

등록/eligibility 결과를 그대로 따르지 않는 경우 일부 institutional service path를 즉시 사용할 수 없고, actual condition과 capacity를 검증하거나 다른 service path를 찾아야 할 수 있다. 이를 예약 대기열이나 번호표 순번 gameplay로 변형하지 않는다.

### E02 hard distinction

E01_C02의 핵심 축:
- PATIENT STATUS
- CARE ELIGIBILITY
- ISOLATION
- DISCHARGE
- ACTUAL CARE CAPACITY

E02의 시간, 예약, 번호표, 순번 질서는 E01_C02의 primary law가 아니다.

### forbidden

- 단순 환자 구조 = 무조건 선/성공.
- 모든 환자를 자유롭게 만들면 자동 성공.
- proof의 특정 치료 결말 정사화.
- appointment/waiting-order 중심 loop.
- exact resource quantity 창작.

## 4. human_recognition_rule

상태: **DEFINED**

주 recognition axes:
- patient
- care recipient
- isolation subject
- insured / eligible care subject
- long-term care subject
- discharge-eligible subject

핵심 misrecognition:
실제 사람의 건강 상태와 현재 care need
≠
등록된 patient/service status

시스템은 등록된 역할을 service 판단에 사용할 수 있지만, 그 record를 인간의 현재 상태 자체로 취급하지 않는다. player는 actual condition, verified record, actual capacity를 대조한다.

새 top-level schema는 만들지 않는다.

## 5. resource_ecology

상태: **DEFINED**

resource/service categories:
- bed / treatment capacity
- medicine / medical supply
- care staff / service capacity
- isolation capacity
- diagnostic / registration service availability
- transport / transfer support

공통 인과:
availability
→ care/service 가능 여부
→ gameplay consequence

금지:
- infinite bed.
- infinite medicine.
- infinite treatment.
- infinite isolation capacity.
- exact quantity invention.

cross_campaign_dependency = **NONE_LOCKED**

이유:
- Common Campaign Dependency Graph rows = 0.
- R01-L03 → R02-L01은 historical progression source이며 dependency evidence가 아니다.
- 검증된 provider/consumer/resource/failure/recovery relation이 없다.

## 6. persistence_profile

상태: **DEFINED**
class: **STANDARD**

### Direct Memory scope

저장 후보:
- important investigation state.
- verified patient/service status.
- verified care eligibility.
- verified service/capacity availability.
- isolation/discharge verification state.
- important service decision.
- return/report state where applicable.
- revisit consequence.

STANDARD는 중요한 조사, 서비스 상태, 기록 확인, 선택, 진행, 귀환, 보고, 재방문 결과가 지속될 수 있음을 뜻한다.

### Rumor / Information candidates

- care availability.
- patient transfer information.
- isolation status.
- medicine availability.
- discharge status.

허용 channel은 실제 근거가 있는 communications, administrative/medical record, logistics/transfer, resident movement 등 Final Lock causal channel 범위 안에서만 사용한다.

Rumor는 Direct를 자동 덮어쓰지 않는다.

### forbidden rumor physical mutation

rumor만으로 다음을 바꾸지 않는다.
- actual bed capacity.
- medicine stock.
- patient physical condition.
- isolation facility state.
- transfer route.
- facility repair/damage.

### STRUCTURAL

STRUCTURAL physical persistence = **NOT LOCKED**

자동 확정하지 않는 것:
- 시설 영구 파괴.
- 병상 수 장기 구조 변경.
- 도로/transfer route 영구 변경.
- 주민/환자 대규모 이동.
- 재고 무기한 변화.

실제 Production/Gameplay evidence가 생긴 뒤 별도 검토한다.

## 7. Graph boundary

기존 Common Graph를 참조만 한다.

- new source edge = **0**
- new physical edge = **0**
- new visibility edge = **0**
- new Campaign Dependency edge = **0**
- Common Graph edit = **0**

C02 historical source refs 12, 13, 14, 22, 23은 이번 Entry에서 새 graph meaning으로 승격하지 않는다.

## 8. Final Lock 6-field result

| field | status |
|---|---|
| regional_secondary_collapse | DEFINED |
| infrastructure_anchor | DEFINED |
| gameplay_law | DEFINED |
| human_recognition_rule | DEFINED |
| resource_ecology | DEFINED |
| persistence_profile | DEFINED / STANDARD |

Campaign verdict: **DEFINED**
Persistence: **STANDARD**
STRUCTURAL: **NOT LOCKED**

## 9. Non-implementation boundary

이 문서로 수행하지 않은 것:
- Unreal Blueprint/C++ 구현.
- map 수정.
- Common Graph 수정.
- C01/C08 수정.
- Final Lock 수정.
- exact resource quantity 확정.
- STRUCTURAL persistence 승격.
- main 변경.

판정: **E01_C02 PRODUCTION ENTRY DEFINED**.
