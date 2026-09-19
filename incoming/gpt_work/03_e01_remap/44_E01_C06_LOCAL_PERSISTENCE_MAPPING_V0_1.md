# 44 E01 C06 Local / Persistence Mapping V0.1

상태: **E01_C06 LOCAL / PERSISTENCE MAPPING**
대상: R06-L01~R06-L05
구현 상태: **NOT UNREAL IMPLEMENTATION**

## 0. 원칙

5 Local의 ID/name은 canonical을 그대로 사용한다.

현재 R06 Unreal 구현 근거가 없으므로 CURRENT로 승격하지 않는다.

각 Local은 membership / account / transaction / tier / review / benefit entitlement / service access family 안에서만 해석한다. C01 household/residential gameplay는 분리한다.

기존 “포인트” 표현을 단일 전세계 currency로 승격하지 않는다.

## 1. Mapping

| Local | recognition role | entitlement role | service/resource role | investigation role | persistence candidate | C01 boundary risk | production_status | implementation_status |
|---|---|---|---|---|---|---|---|---|
| R06-L01 회원 게이트 거리 | member / account holder / benefit claimant | membership/account access claim | service access capacity, account verification service | member/account claim과 actual service access 비교 | verified account/member state, access choice, revisit | LOW: household/occupancy 판정으로 확장하지 않음 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R06-L02 포인트 거래 골목 | transaction participant / account holder / benefit claimant | point/benefit/transaction record를 entitlement/access state로 검산 | merchant/service availability, verification capacity, benefit availability | transaction/benefit claim과 actual merchant/service availability 비교 | verified transaction/benefit state, contest/accept decision, revisit | LOW: resident/household relation이 아님 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R06-L03 리뷰 키오스크 광장 | reviewer / reputation subject / member | review/reputation state와 service claim | review/reputation information availability, verification capacity, merchant/service availability | review credibility와 actual service/merchant state 교차검증 | verified reputation/review state, important choice, revisit | LOW: residential reputation/입주 심사로 변형하지 않음 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R06-L04 VIP 라운지 | tiered customer / member / benefit claimant | tier/benefit entitlement / limited access claim | limited entitlement capacity, benefit availability, service access capacity | tier record와 actual limited service/benefit availability 비교 | verified tier/entitlement, access result, revisit | MEDIUM: residential protection privilege로 변형 금지 | **FUTURE_PRODUCTION_FILL** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R06-L05 블랙프라이데이 홀 | member / transaction participant / benefit claimant | membership/tier/transaction/benefit claim 종합 검산 | merchant/service availability, benefit availability, verification/service capacity | record와 actual event/service availability 비교 | verified access/service result, important choice, revisit consequence | MEDIUM: 생활공간 보호/입주 판정으로 변형 금지 | **FUTURE_PRODUCTION_FILL** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |

## 2. Local boundary

### R06-L01
회원 gate는 account/membership/service access를 다룬다.
household/occupancy/residential protection gate로 바꾸지 않는다.

external ingress:
- **KNOWN GAP**
- fabricated edge = **0**

### R06-L02
포인트는 entitlement/access state의 기록 후보일 수 있으나 범용 화폐가 아니다.
돈 또는 포인트 축적만으로 모든 service/access를 해결하지 않는다.

### R06-L03
review/reputation은 actual service availability와 분리해 검증한다.
평판 정보만으로 actual service capacity를 변경하지 않는다.

### R06-L04
VIP/tier record는 제한된 benefit/access claim이다.
tier가 높다는 이유만으로 무한 service/benefit을 생성하지 않는다.

### R06-L05
membership/tier/transaction/benefit record와 actual service availability를 함께 본다.
단순 구매/판매 게임 또는 돈 모으기 결말로 축약하지 않는다.

## 3. Local persistence

STANDARD 후보:
- verified account/member state
- entitlement/tier investigation
- verified transaction/payment state
- review/reputation verification
- actual service/benefit availability observation
- important access/service choice
- revisit consequence

STRUCTURAL은 자동 잠그지 않는다.

특히 다음은 별도 evidence 전까지 persistent structural change가 아니다.
- 상권 영구 재편
- access gate 영구 물리 변화
- 장기 inventory/service capacity 변화
- 대규모 인구 이동
- 건물/도로 영구 변화

## 4. Information boundary

허용:
- merchant/service reputation
- review credibility
- benefit availability information
- account-status information

금지:
- rumor만으로 actual account entitlement 변경
- rumor만으로 inventory 변경
- rumor만으로 service capacity 변경
- rumor만으로 access gate 물리 상태 변경

## 5. Single-currency boundary

R06-L02 이름과 historical point 표현은 유지하지만:
- new global currency = **0**
- universal point solution = **0**
- exact exchange rate / point quantity = **0**

point / benefit / tier record는 access/entitlement state로만 사용할 수 있다.

## 6. Graph preservation

기존 C06 source refs:
- 18 R06-L01 → R06-L02
- 19 R06-L02 → R06-L03
- 26 R06-L03 → R06-L04
- 27 R06-L04 → R06-L05

R06-L01 external ingress:
- **KNOWN GAP**
- new ingress edge = **0**

이번 mapping:
- new source pair = **0**
- new visibility edge = **0**
- new physical edge = **0**
- new dependency edge = **0**

## 7. Result

- R06-L01: CANONICAL_SUPPORTING / external ingress KNOWN GAP.
- R06-L02: CANONICAL_SUPPORTING / single-currency reduction 0.
- R06-L03: CANONICAL_SUPPORTING.
- R06-L04: FUTURE_PRODUCTION_FILL.
- R06-L05: FUTURE_PRODUCTION_FILL.
- CURRENT Unreal implementation claim: **0**.
- C01 gameplay absorption: **0**.
- new currency: **0**.

판정: **E01_C06 LOCAL / PERSISTENCE MAPPING DEFINED**.
