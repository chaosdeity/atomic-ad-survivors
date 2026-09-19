# 27 E01 C08 Persistence / Rumor Profile V0.1

상태: **E01_C08 PERSISTENCE / RUMOR PROFILE**  
persistence class: **STANDARD**  
STRUCTURAL: **NOT LOCKED**  
구현 상태: **NOT UNREAL IMPLEMENTATION**

## 0. 목적

E01_C08에서 재방문 시 남아야 하는 Direct Memory와 causal channel을 통해 전달되는 Rumor/Information을 분리한다.

또한 historical campaign memory와 current survivor operation state를 분리한다.

정보 우선순위:
`DIRECT OBSERVATION > VERIFIED NETWORK RECORD > TRUSTED RUMOR > UNVERIFIED RUMOR`

Rumor는 Direct를 자동 덮어쓰지 않는다.

## 1. STANDARD persistence scope

STANDARD로 저장 가능한 범위:
- relief / shelter service state.
- investigation state.
- eligibility / allocation record state.
- recovery-support availability state.
- false-rescue-signal investigation state.
- important choice.
- revisit consequence.

## 2. Direct Memory candidates

- inspected emergency record.
- verified service availability.
- important allocation/support choice.
- recovery-support state known by player.
- false rescue signal verification.
- revisit investigation state.

### Direct Memory가 의미하지 않는 것

- 모든 물리 시설 상태가 영구 저장된다는 뜻 아님.
- survivor daily operation 전체가 historical campaign memory에 합쳐진다는 뜻 아님.
- 실제 stock/bed/power 수치의 장기 persistence를 자동 잠그는 것 아님.
- STRUCTURAL class 승격 아님.

## 3. Historical campaign memory ownership

historical layer에 저장:
- player가 어떤 emergency record를 확인했는가.
- 어떤 service availability를 직접 검증했는가.
- 어떤 eligibility/allocation mismatch를 확인했는가.
- 어떤 support choice를 했는가.
- 어떤 rescue signal을 false/credible로 검증했는가.
- 어떤 investigation state가 revisit에 이어지는가.

## 4. Current survivor operation ownership

current survivor layer에서 별도 취급:
- 현재 stock handling.
- 현재 발전기/전력 수동 운영.
- 현재 침상 사용.
- 현재 시설 수리.
- 현재 주민 생활/정산.
- current hub의 운영 상태.

이 항목은 historical campaign Direct Memory와 자동 병합하지 않는다.

## 5. Rumor / Information candidates

- rescue signal credibility.
- route safety information.
- shelter availability information.
- relief availability information.
- evacuation status information.

Rumor는 실제 service/resource state에 대한 주장일 수 있지만, claim 자체가 physical state를 바꾸지 않는다.

## 6. Allowed causal channels

- resident movement.
- communications.
- administrative/emergency record.
- recovery/beacon record.

필요하면 verified network record로 승격될 수 있으나, 실제 물리 변화는 별도 evidence가 필요하다.

## 7. Forbidden rumor effects

다음은 금지한다.
- rumor로 실제 stock 변경.
- rumor로 발전기 수리.
- rumor로 침상 증가.
- rumor로 route open.
- rumor로 facility repair.
- rumor로 facility damage.
- false rescue signal만으로 실제 recovery 실행.
- route safety rumor만으로 physical travel edge 생성.
- remote_signal만으로 Campaign Dependency 생성.

## 8. Revisit consequence

STANDARD revisit에서 허용되는 consequence:
- 이미 확인한 record를 다시 처음부터 미확인으로 취급하지 않음.
- verified service availability 또는 unavailability를 player knowledge로 보존.
- 중요 allocation/support choice의 후속 반응을 참조.
- false rescue signal investigation 진행도를 이어감.
- stale record가 최신 verified observation과 충돌한다는 사실을 기억.
- rumor credibility가 검증 결과에 따라 갱신될 수 있음.

실제 시설·route·인구 구조의 영구 변형은 별도 structural evidence가 없으면 저장하지 않는다.

## 9. STRUCTURAL boundary

`STRUCTURAL physical persistence = NOT LOCKED`

자동 승격 금지:
- 발전기 수리.
- 시설 파손.
- 침상 수 변화.
- 물자 저장량의 장기 구조 변경.
- 건물/route 영구 변화.
- 주민 이동.

후속 gameplay/production evidence가 확보되면 별도 PM Production Fill로 검토한다.

## 10. Cross-Campaign information boundary

Cross-Campaign rumor는 all-to-all이 아니다.

현재 C08 관련 source 28:
`R08-L03 → R05-L01 remote_signal`

은 visibility/information source reference다.

그 자체로:
- physical travel = NO.
- Campaign Dependency = NO.
- Sector Relay = NO.

이번 문서에서 새 rumor graph 또는 dependency edge를 생성하지 않는다.

## 11. Result

- persistence class = **STANDARD**
- Direct Memory scope = **DEFINED**
- Rumor candidates = **DEFINED**
- allowed channels = **DEFINED**
- historical/current ownership boundary = **DEFINED**
- STRUCTURAL = **NOT LOCKED**
- rumor physical mutation = **0**
- new graph edge = **0**
- Unreal implementation = **0**

판정: **E01_C08 PERSISTENCE / RUMOR PROFILE DEFINED**.
