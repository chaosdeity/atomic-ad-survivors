# 53 E01 C07 Local / Persistence / Rumor Mapping V0.1

상태: **E01_C07 LOCAL PERSISTENCE RUMOR MAPPING**
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence_profile.class: **STANDARD**

## 0. 공통 원칙

R07-L01~R07-L05의 passage / quarantine / transfer 역할을 STANDARD persistence와 Rumor / Information에 매핑한다.

현재 Unreal 구현은 5 Local 모두 없다.

implementation_status:
**FUTURE_PRODUCTION_FILL**

R07-L01 external ingress는 **KNOWN GAP**으로 유지한다.

## 1. Local mapping

| Local | passage role | recognition role | resource / capacity role | investigation role | persistence candidate | rumor candidate | C08 boundary risk | C03 boundary risk | implementation_status |
|---|---|---|---|---|---|---|---|---|---|
| R07-L01 검역 게이트 | inspection / quarantine / clearance | passenger / traveler, quarantine subject, cleared / held subject | inspection capacity, quarantine processing, verification service | actual subject state와 inspection / quarantine record 대조 | inspection result, quarantine / clearance state, important clear/hold choice | inspection intensity, quarantine information | shelter / relief / bed allocation으로 변환 금지 | custody / ownership 판단을 primary로 만들지 않음 | **FUTURE_PRODUCTION_FILL** |
| R07-L02 냉동 컨테이너 야드 | transfer condition / cold-transfer support | transfer subject, authorized operator / escort | handling capacity, transfer slot, transport availability, cold-transfer support | actual transfer condition과 support / transfer record 대조 | transfer stage, verified cold-transfer condition, reroute / hold choice | route / transfer support availability | relief stock 배분으로 변환 금지 | container ownership / custody dispute를 primary로 만들지 않음 | **FUTURE_PRODUCTION_FILL** |
| R07-L03 수하물 오분류 터미널 | passenger ↔ baggage association / transfer misclassification | passenger / traveler, transfer subject | handling capacity, manifest / verification service | actual passenger-item association과 manifest / transfer assignment 대조 | verified manifest, corrected association, boarding / quarantine consequence | misclassification, manifest credibility, transfer information | survival allocation으로 변환 금지 | **HIGH**: ownership claim / return / release가 중심이 되면 C03으로 이탈 | **FUTURE_PRODUCTION_FILL** |
| R07-L04 밀수 통행로 | unofficial passage / bypass candidate / route credibility | traveler, authorized escort / operator 또는 확인되지 않은 passage participant | actual route availability, transport availability, bounded passage support | rumor와 actual physical passage evidence를 분리 검증 | verified / unverified passage state, bypass choice, revisit consequence | route safety, unofficial passage information | evacuee priority / survival-seat allocation으로 변환 금지 | smuggled item ownership / custody가 primary가 되지 않게 제한 | **FUTURE_PRODUCTION_FILL** |
| R07-L05 마지막 출항 관리탑 | final departure / transfer authority / passage condition verification | passenger / traveler, cleared / held subject, authorized operator | departure-control, transport, route, manifest verification capacity | manifest + clearance + actual route/transport를 최종 대조 | verified departure status, important passage choice, revisit state | departure availability, blockade / route interpretation | limited survival capacity 배분 게임으로 자동 전환 금지 | baggage / cargo custody 해결을 final law로 만들지 않음 | **FUTURE_PRODUCTION_FILL** |

## 2. Direct Memory contract

STANDARD Direct Memory 후보:
- inspection result.
- quarantine / clearance state.
- transfer stage.
- verified manifest.
- verified departure status.
- actual route / transport availability observation.
- important passage / bypass choice.
- revisit consequence.

## 3. Rumor / Information contract

Rumor 후보:
- route safety.
- inspection intensity.
- departure availability.
- quarantine information.
- unofficial passage information.

Rumor가 영향을 줄 수 있는 것:
- 태도.
- 준비.
- 질문.
- 검사 강도 기대.
- 추가 verification 우선순위.

Rumor만으로 바꿀 수 없는 것:
- physical route open.
- quarantine release.
- transport creation.
- gate physical state.
- transfer slot creation.

## 4. R07-L01 ingress

R07-L01 external ingress:
**KNOWN GAP**

유지 사항:
- fabricated source edge = **0**
- fabricated physical edge = **0**
- fabricated visibility edge = **0**
- fabricated dependency edge = **0**

R07-L04 unofficial passage 역시 이 gap을 자동으로 메우지 않는다.

## 5. STRUCTURAL boundary

persistence_profile.class = **STANDARD**  
STRUCTURAL physical persistence = **NOT LOCKED**

자동 확정 금지:
- 항만 / 공항 영구 폐쇄.
- 도로 / 탑승교 영구 변경.
- 대규모 인구 이동.
- 물리 route 영구 개방.
- transfer capacity의 영구 구조 변경.

## 6. Graph protection

historical source refs:
- 33 R07-L01 → R07-L02.
- 34 R07-L02 → R07-L03.
- 35 R07-L03 → R07-L04.
- 36 R07-L04 → R07-L05.

이 mapping은 source edge 또는 Common Graph를 수정하지 않는다.

new source edge = **0**  
new visibility edge = **0**  
new physical edge = **0**  
new dependency edge = **0**

판정: **E01_C07 LOCAL / PERSISTENCE / RUMOR MAPPING PASS**.
