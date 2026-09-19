# 43 E01 C06 Entitlement / Service Contract V0.1

상태: **E01_C06 ENTITLEMENT / SERVICE CONTRACT**
Campaign: E01_C06 멤버십 / 결제 / account / loyalty / entitlement
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence class: **STANDARD**
STRUCTURAL: **NOT LOCKED**
새 currency: **0**
정확한 resource quantity: **NOT LOCKED**

## 0. 목적

E01_C06의 membership, account, transaction/payment record, tier, review/reputation, benefit entitlement와 actual service availability 사이의 인과를 Production contract로 정의한다.

공통 법칙:
verified account/entitlement state
+ actual service availability
→ access / service / benefit 가능 여부
→ gameplay consequence

C01 household/residential 영역은 침범하지 않는다.

## 1. Account / entitlement state contract

### membership
membership record는 access 판단의 근거가 될 수 있으나 actual service를 생성하지 않는다. 현재 membership claim과 실제 사람/service 관계를 대조한다.

### account
account holder claim과 account-status record의 최신성을 확인한다. account record는 인간의 전체 정체성이 아니며 service capacity를 대체하지 않는다.

### transaction / payment record
transaction/payment record가 실제 access/benefit claim과 관련되는지 확인한다. record가 존재해도 actual service/benefit availability가 없으면 access가 자동 보장되지 않는다.

### tier
tier record와 주장된 benefit/access, actual limited entitlement/service capacity를 대조한다. tier는 entitlement state이며 무제한 benefit 생성기가 아니다.

### review / reputation
review/reputation record의 credibility와 actual merchant/service state를 대조한다. review/reputation은 actual service capacity를 자동 변경하지 않는다.

### benefit entitlement
benefit claimant, entitlement record, benefit availability, service/access capacity를 함께 확인한다. verified entitlement와 actual availability가 함께 있어야 consequence를 확정할 수 있다.

## 2. Service / resource categories

| category | availability/state | degradation meaning | recovery meaning | access/service consequence |
|---|---|---|---|---|
| service access capacity | 실제 제공 가능한 service/access 범위 | eligible record가 있어도 access 제한 | 실제 service availability 회복 | allow/deny/bypass 조건 변화 |
| benefit availability | 실제 제공 가능한 benefit | entitlement가 있어도 benefit 제공 불가/제한 | 실제 benefit availability 회복 | benefit access 변화 |
| verification capacity | account/transaction/tier/review를 검증할 actual service | stale/unverified claim 증가 | 실제 verification service 회복 | verify/contest 판단 변화 |
| merchant/service availability | 실제 merchant/service 작동 여부 | account/transaction이 있어도 service 이용 제한 | actual service recovery | access/service 결과 변화 |
| account verification service | account holder/status 검산 service | identity/claim 확인 보류 | verified account service 회복 | official access path 영향 |
| limited entitlement capacity | 제한된 benefit/access 처리 가능성 | tier/member claim을 모두 수용하지 못함 | actual entitlement capacity 회복 | accept/forgo/relinquish 판단 영향 |
| review/reputation information availability | reputation 신뢰도를 검산할 정보 | credibility 판단 약화 | verified information source 확보 | contest/accept 판단 영향 |

정확한 수치, 가격, 포인트 환산율, 최대치, 재생 주기는 잠그지 않는다.

## 3. Recognition / entitlement mismatch

주 recognition axes:
- member
- account holder
- tiered customer
- reviewer / reputation subject
- benefit claimant
- transaction participant

핵심 mismatch:
actual human-service relationship
≠
recorded membership/account/tier/reputation/benefit/transaction state

C01 household/resident/guardian relation과 분리한다.

## 4. Official access / contest consequence

### official record path
membership/account/transaction/tier/benefit record가 검증되면 공식 service/access/benefit path와 benefit claimant/account holder 관계를 검산할 수 있다.

하지만 record가 actual service availability를 자동 생성하지 않는다.

### contest / bypass / forgo path
stale 또는 모순된 record를 contest하거나 그대로 따르지 않으면 account/transaction/entitlement claim과 actual service availability를 추가 조사해야 한다.

bypass는 실제 service/access capacity가 있을 때만 허용한다.

forgo/relinquish는 해당 benefit/access claim을 사용하지 않는 선택일 수 있으나 새 currency나 현금 보상을 자동 생성하지 않는다.

## 5. Currency exclusion

허용:
- point/benefit/tier record를 entitlement/access state로 취급.
- transaction/payment record를 access claim의 증거 중 하나로 사용.

금지:
- 모든 문제를 해결하는 단일 point currency.
- 포인트를 전세계 범용 화폐로 승격.
- 돈을 많이 모으면 모든 service gate 해결.
- 새 환율/가격/수치 창작.

## 6. C01 exclusion

C06 allowed:
- membership
- account
- transaction/payment record
- tier
- review/reputation
- benefit entitlement
- service access

C01 excluded:
- household
- occupancy
- family role
- guardian/residential protection
- resident candidate

계정·거래·회원·혜택 접근권이면 C06, 생활공간 소속/보호 역할이면 C01이다.

## 7. Direct Memory / STANDARD persistence

STANDARD Direct Memory 후보:
- verified account state
- entitlement/tier investigation
- verified transaction/payment state
- review/reputation verification
- actual service/benefit availability
- important verify/contest/accept/bypass/forgo decision
- access/denial result
- revisit consequence

## 8. Rumor / Information boundary

Rumor candidates:
- merchant/service reputation
- review credibility
- benefit availability information
- account-status information

금지:
- rumor로 actual account entitlement 변경
- rumor로 inventory 변경
- rumor로 service capacity 변경
- rumor로 access gate 물리 상태 변경
- all-to-all commercial rumor

## 9. STRUCTURAL exclusion

STRUCTURAL physical persistence = **NOT LOCKED**

자동 포함 금지:
- 상권 영구 재편
- 건물/도로 영구 변화
- 장기 재고/인구 구조 변화
- access gate 영구 물리 변화
- merchant/service capacity 영구 구조 변화

## 10. Dependency boundary

cross_campaign_dependency = **NONE_LOCKED**

- Common Campaign Dependency Graph rows = 0.
- R06-L01 external ingress는 KNOWN GAP.
- known gap를 채우기 위한 fabricated source/dependency edge는 만들지 않는다.
- new dependency edge = 0.

## 11. Contract result

- membership: **DEFINED**
- account: **DEFINED**
- transaction/payment record: **DEFINED**
- tier: **DEFINED**
- review/reputation: **DEFINED**
- benefit entitlement: **DEFINED**
- actual service availability causality: **DEFINED**
- C01/C06 boundary: **DEFINED**
- single-currency reduction: **0**
- persistence: **STANDARD**
- STRUCTURAL: **NOT LOCKED**
- exact quantity invention: **0**
- Unreal implementation: **0**

판정: **E01_C06 ENTITLEMENT / SERVICE CONTRACT DEFINED**.
