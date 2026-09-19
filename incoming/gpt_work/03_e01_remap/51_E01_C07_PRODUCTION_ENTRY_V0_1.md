# 51 E01 C07 Production Entry V0.1

상태: **E01_C07 PRODUCTION ENTRY**
Campaign verdict: **DEFINED**
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence_profile.class: **STANDARD**
STRUCTURAL physical persistence: **NOT LOCKED**

## 0. 범위

E01_C07 passage / quarantine / transfer Campaign의 Final Lock 6 fields를 Production Entry 수준으로 정의한다.

핵심 성공 조건:
**PASSAGE / TRANSFER CONDITION RESOLVED**

C07:
누가 / 무엇이 어디를 통과하거나 이송될 수 있는가.

C08:
제한된 생존 capacity를 누구에게 배분하는가.

C03:
custody / ownership claim / return / release / destination logistics가 핵심인가.

현재 C07 Unreal 구현은 없으며 R07-L01~R07-L05 모두 **FUTURE_PRODUCTION_FILL**이다.

## 1. regional_secondary_collapse

상태: **DEFINED**

새 봉쇄 재난을 창작하지 않는다.

E01_C07의 2차 붕괴는 장기간 남은 passage / quarantine / transfer / departure / manifest / inspection infrastructure와 passenger / quarantine / transfer / departure record가 실제 사람 / 물건 / route 상태 변화와 어긋난 상태에서 stale inspection / transfer status가 실제 통행 가능성보다 우선하는 구조다.

인과:
1. passage / quarantine / transfer / departure / manifest infrastructure가 남는다.
2. inspection, quarantine, clearance, transfer, departure record가 남는다.
3. 실제 person / item / route / transport 상태가 변한다.
4. stale status가 실제 상태보다 우선할 수 있다.
5. 잘못 hold / quarantine / reroute / deny / clear될 수 있다.
6. player는 actual subject / route / transfer state와 record를 대조한다.
7. clear / hold / reroute / transfer / bypass 여부를 판단한다.
8. 실제 route / service / capacity 조건에 따라 결과가 발생한다.
9. verified state와 중요한 선택이 STANDARD persistence / revisit에 남을 수 있다.

금지:
- 새 광역 봉쇄 재난 창작.
- 탈출 성공을 Campaign 즉시 종료로 취급.
- 바깥 세계 전체 진실 조기 공개.
- 정보만으로 physical route open.
- exact resource quantity 창작.

## 2. infrastructure_anchor

상태: **DEFINED**

| Local | production_status | Production anchor | boundary |
|---|---|---|---|
| R07-L01 검역 게이트 | **FUTURE_PRODUCTION_FILL** | inspection / quarantine / clearance | external ingress는 **KNOWN GAP**. 새 ingress edge를 만들지 않음 |
| R07-L02 냉동 컨테이너 야드 | **FUTURE_PRODUCTION_FILL** | transfer condition / cold-transfer support | C08 relief stock 배분 아님. C03 custody ownership이 primary 아님 |
| R07-L03 수하물 오분류 터미널 | **FUTURE_PRODUCTION_FILL** | passenger ↔ baggage association / transfer misclassification | ownership claim / return / release가 중심이 되면 C03으로 이탈 |
| R07-L04 밀수 통행로 | **FUTURE_PRODUCTION_FILL** | unofficial passage / route credibility / rumor-sensitive bypass candidate | 새 physical ingress edge 생성 금지 |
| R07-L05 마지막 출항 관리탑 | **FUTURE_PRODUCTION_FILL** | final departure / transfer authority / passage condition verification | 바깥 세계 전체 진실 공개로 확대 금지 |

## 3. gameplay_law

상태: **DEFINED**

### Campaign primary law

actual person / item transfer state 확인  
→ inspection / quarantine / manifest / departure record 확인  
→ physical route / transfer capacity 확인  
→ record와 reality 대조  
→ clear / hold / reroute / transfer / bypass 판단  
→ 실제 passage condition에 따른 결과  
→ STANDARD persistence / revisit

### primary verbs

- inspect actual person / item transfer state.
- verify inspection / quarantine / manifest / departure record.
- verify actual physical route and transfer capacity.
- compare current reality with registered passage state.
- clear, hold, reroute, transfer, or bypass where actual conditions permit.
- revisit with verified passage state and prior choices remembered.

### service contract

route / service / capacity availability
→ inspection / clearance / transfer / departure 가능 여부
→ passage consequence

### registration consequence

inspection / quarantine / manifest / departure record를 사용하면 공식 passage path를 확인할 수 있다. stale record가 actual subject / route / transfer state와 충돌하면 잘못된 hold / clear / reroute / deny를 만들 수 있다.

### refusal / bypass consequence

record를 그대로 따르지 않거나 unofficial passage를 선택하려면 실제 physical route, transport, verification, handling 조건을 추가로 확인해야 한다. rumor만으로 bypass route를 만들지 않는다.

### C07 / C08 hard boundary

“문제의 핵심이 통과 / 이송 / 검역 조건인가?”
YES → C07.

“문제의 핵심이 식량 / 침상 / 피난 / 생존 capacity 배분인가?”
YES → C08.

C07에서 shelter allocation, relief distribution, bed capacity를 primary gameplay로 만들지 않는다.

### C07 / C03 secondary boundary

C07 허용:
- passenger ↔ baggage association.
- transfer assignment.
- boarding / quarantine consequence.
- passage / transfer chain 안의 misclassification.

C03으로 넘길 것:
- ownership claim.
- custody ownership dispute.
- return / release / destination logistics 자체.

### forbidden

- C08 survival allocation을 C07 primary gameplay로 만들기.
- C03 custody / return gameplay를 C07 primary gameplay로 만들기.
- infinite passage / inspection / transport / transfer slot.
- rumor-only route open.
- external ingress invention.
- exact resource quantity invention.

## 4. human_recognition_rule

상태: **DEFINED**

주 recognition axes:
- passenger / traveler
- quarantine subject
- cleared subject
- held subject
- transfer subject
- authorized escort / operator

핵심 misrecognition:
실제 person / item의 current passage / transfer relation
≠
inspection / quarantine / manifest / departure record가 부여한 상태

C06 account/member와 분리한다.
C08 evacuee / relief-recipient와 분리한다.
과도한 신규 신분제 설정을 만들지 않는다.

## 5. resource_ecology

상태: **DEFINED**

resource/service categories:
- inspection capacity
- quarantine processing capacity
- transfer slot / handling capacity
- transport availability
- route availability
- cold-transfer support
- manifest / verification service availability
- departure-control capacity

공통 인과:
route / service / capacity availability
→ passage / transfer 가능 여부
→ gameplay consequence

금지:
- infinite passage.
- infinite quarantine capacity.
- infinite transport.
- infinite transfer slot.
- exact resource quantity invention.

cross_campaign_dependency = **NONE_LOCKED**

이유:
- Common Campaign Dependency Graph rows = 0.
- source refs 33~36은 historical progression/source trace이며 physical travel 또는 dependency 근거가 아니다.
- R07-L01 external ingress는 KNOWN GAP이다.
- 이번 Entry new dependency edge = 0.

## 6. persistence_profile

상태: **DEFINED**
class: **STANDARD**

### Direct Memory scope

저장 후보:
- inspection result.
- quarantine / clearance state.
- transfer stage.
- verified manifest.
- verified departure status.
- actual route / transfer availability observation.
- important passage choice.
- revisit state.

### Rumor / Information candidates

- route safety.
- inspection intensity.
- departure availability.
- quarantine information.
- unofficial passage information.

Rumor는 태도, 준비, 질문, 검사 강도 기대 등 정보 반응에 영향을 줄 수 있다.

rumor만으로 다음을 바꾸지 않는다.
- physical route open.
- quarantine 해제.
- transport 생성.
- gate physical state.
- transfer slot 생성.

### STRUCTURAL

STRUCTURAL physical persistence = **NOT LOCKED**

자동 확정하지 않는 것:
- 항만 / 공항 영구 폐쇄.
- 도로 / 탑승교 영구 변경.
- 대규모 인구 이동.
- 물리 route 영구 개방.
- 장기 transfer capacity 구조 변경.

실제 Production evidence 뒤 별도 검토한다.

## 7. Graph boundary

기존 Common Graph를 참조만 한다.

C07 historical source refs:
- 33 R07-L01 → R07-L02.
- 34 R07-L02 → R07-L03.
- 35 R07-L03 → R07-L04.
- 36 R07-L04 → R07-L05.

모두 P2/blockade historical progression/source reference이며 physical travel implied = NO.

R07-L01 external ingress:
- **KNOWN GAP**
- fabricated edge = **0**

이번 Entry:
- new source edge = **0**
- new physical edge = **0**
- new visibility edge = **0**
- new Campaign Dependency edge = **0**
- Common Graph edit = **0**

## 8. Final Lock 6-field result

| field | status |
|---|---|
| regional_secondary_collapse | **DEFINED** |
| infrastructure_anchor | **DEFINED** |
| gameplay_law | **DEFINED** |
| human_recognition_rule | **DEFINED** |
| resource_ecology | **DEFINED** |
| persistence_profile | **DEFINED / STANDARD** |

Campaign verdict: **DEFINED**  
Persistence: **STANDARD**  
STRUCTURAL: **NOT LOCKED**

## 9. Non-implementation boundary

이 문서로 수행하지 않은 것:
- Unreal Blueprint/C++ 구현.
- map 수정.
- Common Graph 수정.
- 기존 C01/C02/C03/C04/C05/C06/C08 Production Entry 수정.
- Final Lock 수정.
- R07 ingress 생성.
- new graph edge 생성.
- exact resource quantity 확정.
- STRUCTURAL persistence 승격.
- main 변경.

판정: **E01_C07 PRODUCTION ENTRY DEFINED**.
