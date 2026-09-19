# 48 E01 C05 Production Entry V0.1

상태: **E01_C05 PRODUCTION ENTRY**
Campaign verdict: **DEFINED**
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence_profile.class: **STANDARD**
STRUCTURAL physical persistence: **NOT LOCKED**

## 0. 범위

E01_C05 방송 / source / authority Campaign의 Final Lock 6 fields를 Production Entry 수준으로 정의한다.

E01_C05의 고유 정체성은 다음 두 축이다.

- **SOURCE PROVENANCE**
- **AUTHORITY TRANSFORMATION CHAIN**

단순 방송탑 복구, 단순 신호 세기 퍼즐, 범용 rumor machine으로 축약하지 않는다.

R05-L01~R05-L05의 canonical ID/name을 그대로 사용한다. 현재 C05 Unreal 구현은 없으며 5 Local 모두 **FUTURE_PRODUCTION_FILL**이다.

기준 권위:
- GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md
- 10_E01_REMAP_CANONICAL_V0_1.md
- 11_E01_GRAPH_ROLE_SCHEMA_V0_1.md
- 17~22 E01 Common Graph
- docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md

## 1. regional_secondary_collapse

상태: **DEFINED**

새 재난을 창작하지 않는다.

E01_C05의 2차 붕괴는 장기간 남은 방송 / 데이터 / 추천 infrastructure와 source / archive / editorial / recommendation / audience / broadcast authority record가 실제 현재 상황 및 원래 source context와 어긋난 상태에서 반복, 편집, 추천된 정보가 원본보다 높은 authority를 획득하는 구조다.

인과:
1. source / received signal / archive가 남는다.
2. editorial transformation이 원래 context를 줄이거나 반복 framing을 만든다.
3. recommendation / ranking transformation이 일부 정보를 더 높은 우선순위로 재배치한다.
4. public presentation / amplification이 노출과 인지 authority를 키운다.
5. final anchor transmission이 변형된 메시지를 현재 사실처럼 취급할 수 있다.
6. player는 provenance chain을 역추적한다.
7. source / transformation / authority claim을 current reality와 대조한다.
8. trust / withhold / expose / redirect information 중 근거가 있는 판단을 한다.
9. information state와 revisit consequence가 STANDARD persistence에 남을 수 있다.

금지:
- 새 방송 재난 창작.
- 방송탑 전원 복구만으로 campaign 해결.
- 신호 세기만 맞추는 퍼즐로 축약.
- record나 rumor만으로 physical facility를 작동시키기.
- 세계 전체 진실을 자동 공개.
- exact resource quantity 창작.

## 2. infrastructure_anchor

상태: **DEFINED**

| Local | production_status | Production anchor |
|---|---|---|
| R05-L01 수신탑 외곽 | **FUTURE_PRODUCTION_FILL** | received signal / source acquisition / coverage boundary를 확인하는 시작 anchor |
| R05-L02 반복 뉴스 스튜디오 | **FUTURE_PRODUCTION_FILL** | editorial transformation / repetition / stale framing을 원본 source와 대조하는 anchor |
| R05-L03 추천 서버실 | **FUTURE_PRODUCTION_FILL** | ranking / recommendation transformation과 입력 source의 차이를 검증하는 anchor. 기존 추천 시스템/로그 수준만 사용하며 새 AI 설정을 만들지 않음 |
| R05-L04 빈 관객석 공개홀 | **FUTURE_PRODUCTION_FILL** | public presentation / amplification / audience-role interpretation을 확인하는 anchor |
| R05-L05 마지막 앵커 송출실 | **FUTURE_PRODUCTION_FILL** | final authority claim / outgoing broadcast를 provenance chain 전체와 대조하는 최종 anchor |

현재 Unreal 구현: **NONE / FUTURE PRODUCTION FILL**.

## 3. gameplay_law

상태: **DEFINED**

### Campaign primary law

received information 확인  
→ original source / archive 추적  
→ editorial transformation 확인  
→ recommendation / ranking transformation 확인  
→ public amplification 확인  
→ authority claim 검증  
→ current reality와 대조  
→ trust / withhold / expose / redirect information 판단  
→ information consequence  
→ revisit / rumor propagation

redirect information은 물리 route 변경이 아니다.

### primary verbs

- inspect received information.
- trace original source / archive.
- compare transformed output with upstream source.
- verify editorial and ranking transformation.
- verify who or what claims authority.
- compare broadcast claim with current reality.
- trust, withhold, expose, or redirect information where evidence permits.
- revisit with verified provenance and prior information choices remembered.

### service contract

source / archive availability
+ verification capacity
+ processing / recommendation capacity
+ broadcast channel availability
→ verify / transform / transmit 가능 여부
→ information authority consequence

### registration / recognition consequence

receiver, audience member, broadcast subject, authorized contributor, source witness / submitter, public participant라는 기록은 해당 사람이 정보를 받는 대상인지, 말할 자격이 있다고 기록됐는지, source인지, broadcast subject인지 판단하는 데 사용한다.

membership / payment entitlement가 핵심이면 C06이다.

### refusal consequence

authority claim을 그대로 수용하지 않거나 송출을 보류하면 추가 source verification이 필요하고, 정보의 확산 또는 공식 presentation이 지연될 수 있다. 반대로 근거 없는 authority를 수용하면 stale / transformed information이 현재 사실처럼 남을 수 있다.

refusal consequence는 물리 route, facility, stock을 자동 변경하지 않는다.

### forbidden

- 단순 방송 repair campaign.
- signal strength puzzle only.
- generic rumor machine.
- information을 currency로 만들기.
- infinite broadcast / verification / archive access / transmission capacity.
- rumor-only physical mutation.
- exact resource quantity invention.

## 4. human_recognition_rule

상태: **DEFINED**

주 recognition axes:
- receiver
- audience member
- broadcast subject
- authorized contributor
- source witness / source submitter
- public participant

핵심 misrecognition:
실제 사람이 source / subject / receiver / contributor로 갖는 현재 관계
≠
방송 또는 archive가 기록한 역할과 authority

C06과의 hard distinction:
- membership / payment / account / loyalty entitlement가 핵심이면 C06.
- 정보를 받는 대상, 말할 자격, source, broadcast subject 여부가 핵심이면 C05.

## 5. resource_ecology

상태: **DEFINED**

resource/service categories:
- power availability
- receiver / transmission capacity
- archive / source availability
- verification capacity
- processing / recommendation capacity
- broadcast channel availability
- record integrity / provenance availability

공통 인과:
source / infrastructure availability
→ verify / transform / transmit 가능 여부
→ information authority consequence

information 자체는 currency가 아니다.

금지:
- infinite broadcast.
- infinite verification.
- infinite archive access.
- infinite transmission capacity.
- exact resource quantity invention.

cross_campaign_dependency = **NONE_LOCKED**

이유:
- Common Campaign Dependency Graph rows = 0.
- R08-L03 → R05-L01 remote_signal은 visibility/information source 후보이며 C08→C05 dependency가 아니다.
- 검증된 provider / consumer / resource_or_service / failure / recovery relation이 없다.
- 이번 Entry new dependency edge = 0.

## 6. persistence_profile

상태: **DEFINED**
class: **STANDARD**

### Direct Memory scope

저장 후보:
- 직접 확보한 original source.
- 직접 검증한 archive.
- 확인한 editorial / ranking / amplification transformation.
- 직접 확인한 authority state.
- source credibility investigation.
- important trust / withhold / expose / redirect-information choice.
- verified vs unverified state.
- report / revisit consequence.

### Rumor / Information candidates

- 송출 내용.
- 재전달 정보.
- source credibility 정보.
- 외부에서 들은 broadcast interpretation.

허용 channel:
- communications.
- broadcast.
- administrative record.
- resident movement.
- recovery / beacon record.
- 실제 source delivery channel.

Direct Memory와 Rumor / Information은 분리한다. Rumor가 Direct를 자동 덮어쓰지 않는다.

rumor만으로 다음을 바꾸지 않는다.
- facility repair.
- 송신탑 작동.
- physical route open.
- resource stock.
- actual transmission capacity.

### STRUCTURAL

STRUCTURAL physical persistence = **NOT LOCKED**

자동 확정하지 않는 것:
- 방송망 영구 재건.
- 송신탑 영구 파괴.
- 항만/공항 영구 폐쇄.
- 도로/탑승교 영구 변경.
- 대규모 인구 이동.
- 물리 route 영구 개방.

실제 Production evidence 뒤 별도 검토한다.

## 7. C05 anti-repeat contract

| axis | E01_C05 production definition |
|---|---|
| source | received signal, original source, archive, source witness / submitter의 provenance를 역추적 |
| authority | editorial, ranking, public presentation, final anchor transmission이 authority를 어떻게 부여하는지 검증 |
| recognition | receiver / audience / broadcast subject / authorized contributor / source witness 관계를 검증 |
| transformation_rule | source → editorial → recommendation/ranking → public amplification → final broadcast authority |
| refusal_consequence | authority 수용 보류 시 추가 검증과 송출 지연, 근거 없는 수용 시 stale/transformed information의 authority 상승 |
| resource_ecology | source/archive, verification, processing, channel, record integrity, transmission capacity가 유한함 |
| persistence_rumor | verified provenance와 중요한 정보 선택은 Direct Memory, 송출/재전달/해석은 Rumor/Information으로 분리 |

판정: **C05 ANTI-REPEAT PASS**.

## 8. Graph boundary

기존 Common Graph를 참조만 한다.

C05 historical source refs:
- 28 R08-L03 → R05-L01: remote_signal / visibility only by default.
- 29 R05-L01 → R05-L02: source progression reference.
- 30 R05-L02 → R05-L03: source progression reference.
- 31 R05-L03 → R05-L04: source progression reference.
- 32 R05-L04 → R05-L05: source progression reference.

이번 Entry:
- new source edge = **0**
- new physical edge = **0**
- new visibility edge = **0**
- new Campaign Dependency edge = **0**
- Common Graph edit = **0**

## 9. Final Lock 6-field result

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

## 10. Non-implementation boundary

이 문서로 수행하지 않은 것:
- Unreal Blueprint/C++ 구현.
- map 수정.
- Common Graph 수정.
- 기존 C01/C02/C03/C04/C06/C08 Production Entry 수정.
- Final Lock 수정.
- new graph edge 생성.
- information currency 생성.
- exact resource quantity 확정.
- STRUCTURAL persistence 승격.
- main 변경.

판정: **E01_C05 PRODUCTION ENTRY DEFINED**.
