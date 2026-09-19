# GLOBAL WORLD STRUCTURE LOCK V0.2

상태: **FINAL GLOBAL WORLD STRUCTURE LOCK V0.2**  
**PM APPROVED**

기준 문서:
- 21_LATEST_AUDIT_PRELOCK_RECONCILIATION_V0_1.md
- 22_RECOVERY_CANONICAL_ROLE_MAP_V0_1.md
- 23_CAMPAIGN_FAMILY_BOUNDARY_CANONICAL_V0_1.md
- 24_CAMPAIGN_SERVICE_DEPENDENCY_CONTRACT_V0_1.md
- 25_DIFFERENTIATION_CANONICAL_GATE_V0_1.md
- 26_GLOBAL_WORLD_PRELOCK_CANONICAL_V0_1.md
- 27_CANONICAL_PRELOCK_PM_SUMMARY_V0_1.md
- 07_GLOBAL_CAMPAIGN_SYSTEM_SCHEMA_V0_1.md
- 08_GLOBAL_96_CAMPAIGN_REGISTRY_DRAFT.csv

승인/승격 기준:
- 28_GLOBAL_WORLD_STRUCTURE_LOCK_V0_2_CANDIDATE.md
- 29_GLOBAL_WORLD_LOCK_PM_FINAL_APPROVAL_V0_1.md
- 30_GLOBAL_WORLD_LOCK_CANDIDATE_AUDIT_V0_1.md

Registry 검증: **96 rows / 96 unique / missing 0 / unexpected 0**.

## 0. Lock Scope

본 Final Lock이 잠그는 범위:
- GLOBAL → SECTOR → CAMPAIGN → LOCAL 계층
- E01~E12 × C01~C08의 96 Campaign ID 구조
- ID와 Display Name의 분리 및 alias/history 정책
- Global Visibility 5단계
- E01 40 local의 global compression 원칙
- Campaign Differentiation 6필드
- family boundary와 C05 anti-repeat 계약
- resource ecology, service dependency, persistence semantics
- Direct Memory와 Rumor/Information의 경계
- physical causality boundary
- Relay / Beacon / Recovery 역할
- E02~E12 season slice 확장 방식
- 이전 candidate differentiation 위험군의 유지
- production entry 최소 질문과 금지 해석

본 Final Lock이 잠그지 않는 범위는 18절의 **PRODUCTION FILL**이다. 96 campaign의 개별 세부값, 실제 link graph, 좌표, local 제작, Unreal 구현, RECOVER 실행은 최종 상위 구조와 구분한다.

## 1. Global Hierarchy

세계 계층은 다음 하나로 유지한다.

```text
GLOBAL
→ SECTOR E01~E12
→ CAMPAIGN E##_C01~C08
→ LOCAL NODE
```

SECTOR와 CAMPAIGN은 global navigation과 world structure의 기준 단위다. LOCAL NODE는 campaign 내부 제작 단위이며 global campaign ID를 대체하지 않는다.

## 2. 96 Campaign ID Lock

Campaign ID는 **E01~E12 × C01~C08 = 96개**로 고정한다.

- ID 추가: 금지
- ID 삭제: 금지
- sector 이동: 금지
- C01~C08 family 재배열: 금지
- 새 campaign ID 생성: 금지
- production 편의를 위한 번호 재사용: 금지

Registry 검증 결과는 96/96이며 missing 0, unexpected 0이다.

## 3. Display Name / Alias Policy

`campaign_id`는 영구 식별자이고 `display_name`과 독립한다.

- 현재 Display Name은 본 Final Lock에서 변경하지 않는다.
- production entry 전까지 제한적 수정은 가능하다.
- 이름을 변경할 경우 같은 ID의 `display_name_history.aliases`와 변경 이유를 남긴다.
- 표시명 변경으로 ID, sector, family를 바꾸지 않는다.
- 본 Final Lock의 Display Name 변경 수는 **0**이다.

## 4. Global Visibility

Global Visibility는 다음 5단계를 유지한다.

1. 미관측
2. 원격 감지
3. 부분 복원
4. 출격 가능
5. 진실 복원

Schema 대응:
`unobserved → remote_detected → partially_restored → sortie_available → truth_restored`

이는 단순 HUD 연출이 아니라 정보 접근과 출격 가능성의 world contract다.

## 5. E01 Global Compression

E01의 40 local node는 global node 40개가 아니다.

- E01도 global 수준에서는 8개의 campaign 구조를 따른다.
- 40 local은 E01 campaign 내부 제작 자산으로 유지한다.
- E01의 local 밀도를 세계 전체의 기본 밀도로 승격하지 않는다.
- E02~E12를 E01과 같은 40-node 구조로 자동 확장하지 않는다.

## 6. Campaign Differentiation Contract

모든 campaign은 production entry 전에 다음 6개 상위 차별화 필드에 답해야 한다.

1. `regional_secondary_collapse`
2. `infrastructure_anchor`
3. `gameplay_law`
4. `human_recognition_rule`
5. `resource_ecology`
6. `persistence_profile`

새 top-level field는 추가하지 않는다.

최신 감사의 질문은 기존 필드 내부에 흡수한다.

- service → `gameplay_law.service_contract` + `resource_ecology`
- registration cost → `gameplay_law.registration_cost` + `human_recognition_rule`
- refusal cost → `gameplay_law.refusal_cost` + `resource_ecology`
- dependency → `resource_ecology.dependency_contract`
- persistent world effect → `persistence_profile`

같은 family의 유사 campaign은 실제 infrastructure, primary verb, recognition role, service/resource bottleneck, direct persistence, rumor channel, revisit consequence 중 최소 4개 이상의 비교 질문에서 실질적 차이가 있어야 한다.

## 7. Campaign Family Boundaries

### C03 / C04

- C03: 물류, custody, flow, 수취, 반품, 회수, release
- C04: 정품, validity, charging, diagnose, repair, operability

C03의 주 행동은 물건의 custody/flow를 고치는 것이다.  
C04의 주 행동은 장치/서비스의 유효성과 작동 가능성을 고치는 것이다.

### C07 / C08

- C07: passage, quarantine, transfer
- C08: survival allocation, relief, shelter, evacuation capacity

C07의 성공은 통과/이송 조건 해결이다.  
C08의 성공은 제한된 생존 capacity의 배분과 유지다.

### C01 / C06

- C01: household, occupancy, family role, residential protection
- C06: membership, payment, account, loyalty entitlement

C01 recognition은 생활공간 소속에 귀속된다.  
C06 recognition은 거래와 혜택 접근권에 귀속된다.

### C05 anti-repeat

C05는 방송국, 수신탑, 추천 시스템의 미술과 지역만 바꾼 동일 loop 반복을 금지한다.

각 E##_C05는 production entry에서 최소 다음 축을 구분해야 한다.

- source
- authority
- recognition
- transformation rule
- refusal consequence
- resource ecology
- persistence + rumor

현재 C05 상위 anti-repeat contract는 충분하다. 12개 개별 gameplay law는 본 Final Lock에서 생성하지 않으며 **PRODUCTION FILL**로 남긴다.

## 8. Campaign Resource Ecology

`resource_ecology`는 campaign이 실제로 무엇을 소비하고, 누구에게 서비스하며, 고갈 시 무엇이 멈추는지를 정의한다.

최소 질문:
- 무엇을 실제로 소비하는가?
- 누구에게 서비스하는가?
- response를 실행할 때 무엇이 소모되는가?
- 고갈 시 어떤 service/route/NPC/system이 degraded 되는가?
- 실제 외부 지원 source가 있는가?
- 실제 support target이 있는가?

service, registration/refusal consequence는 무한한 추상 규칙이 아니라 자원과 capacity의 실제 제약으로 이어져야 한다.

service/resource 근거 없이 무한 증원, 무한 복구, 무한 지원을 허용하지 않는다.

## 9. Service Dependency

Service Dependency는 새 top-level field가 아니라 `resource_ecology.dependency_contract` 내부 계약이다.

필수 항목:
- provider
- consumer
- resource_or_service
- dependency_strength
- failure_effect
- recovery_condition
- propagation_channel

`dependency_strength`:
- supporting
- important
- critical

dependency는 실제 infrastructure 관계가 있을 때만 생성한다. 허용 근거는 실제 전력망, 물류·보급 노선, 의료 공급·이송, 연료와 convoy/extraction, 통신 relay, 공식 행정/서비스 연결 등이다.

같은 family, 같은 sector, 지도상 근접, 단순 rumor만으로 dependency를 만들지 않는다.

Failure propagation은 다음 범위로 한정한다.

```text
PHYSICAL/SERVICE FAILURE
→ VALIDATED DEPENDENCY EDGE
→ BOUNDED DOWNSTREAM DEGRADATION
→ 실제 변화한 state의 persistence
→ optional information propagation
```

all-to-all global dependency는 금지한다.

## 10. Persistence Profile

Persistence class는 저장량 등급이 아니라 재방문 시 gameplay/physical state가 어느 수준까지 지속되는지의 semantic class다.

- NONE
- LIGHT
- STANDARD
- STRUCTURAL

의미:
- NONE: 장기 gameplay state 거의 없음
- LIGHT: 태도, 서비스, 간단한 지역 상태 중심
- STANDARD: NPC, 서비스, 경로, 중요한 선택이 재방문에 영향
- STRUCTURAL: 시설, 주민 이동, service capacity, route 등 물리 구조의 지속적 변화

96 campaign 전체의 class를 본 Final Lock에서 일괄 생성하지 않는다. 실제 production evidence가 있을 때 campaign별로 채운다. C08 전체를 일괄 STRUCTURAL로 두지 않는다.

## 11. Direct Memory

Direct Memory는 해당 campaign에서 실제 사건을 경험하거나 직접 검증한 결과의 기억이다.

Direct는 다음과 같은 실제 상태를 보존할 수 있다.
- facility change
- NPC outcome
- extraction result
- investigation result
- route use와 route consequence
- 실제 service/resource state 변화

기본 정보 우선순위는 다음과 같다.

```text
DIRECT OBSERVATION
> VERIFIED NETWORK RECORD
> TRUSTED RUMOR
> UNVERIFIED RUMOR
```

오래된 Direct가 더 최신의 검증된 기록으로 갱신될 수 있으나, Rumor가 Direct를 자동 덮어쓰지 않는다.

## 12. Rumor / Information Propagation

Rumor/Information은 별도 정보 객체이며 실제 causal channel이 필요하다.

허용 channel:
- resident movement
- communications
- logistics
- broadcast
- administrative record
- support dependency
- beacon/recovery record

정보는 fidelity, latency, bias를 가질 수 있다. Direct를 전 세계 NPC에게 그대로 복사하지 않는다.

모든 campaign all-to-all rumor는 금지한다. 플레이어 행동의 전지적 공유도 금지한다.

## 13. Physical Causality Boundary

Rumor-only physical mutation은 금지한다.

다른 campaign의 시설, route, resource, NPC, service capacity가 바뀌려면 별도 인과가 필요하다.

허용 인과 예:
- 사람의 실제 이동
- 물자/stock의 실제 이동
- service 제공 또는 중단
- 행정 승인과 실제 resource 확보
- 장치/시설의 작동, 파손, 복구
- validated dependency edge의 failure/recovery

정보가 먼저 도달해 준비, 태도, 검문, 협상 조건을 바꿀 수는 있지만 physical state는 별도 causal action이 있어야 한다.

## 14. Relay / Beacon / Recovery

Global Travel 역할은 다음과 같이 유지한다.

- Sector 이동 기반: **Relay**
- Local sortie 기반: **Beacon**
- Extraction: **Recovery Line + Beacon**

정보는 신체보다 먼저 이동할 수 있다.

`sortie_available`은 최소한 decoded signal, relay established, beacon fixed의 조건을 요구하는 구조를 유지한다. Extraction은 sortie와 별도 상태다.

무료 순간이동은 금지한다.

## 15. Season Slice Expansion

E02~E12의 기본 확장 방식은 **season slice**다.

- 처음부터 E01처럼 40 local을 만들지 않는다.
- season과 production 필요에 따라 campaign 내부 local을 선택적으로 제작한다.
- global structure를 채우기 위해 빈 local을 대량 생성하지 않는다.
- 본 Final Lock에서 E02~E12 신규 local 생성 수는 **0**이다.

## 16. Candidate Differentiation Locks

Previous Candidate의 차별화는 폐기하지 않는다.

### Medical
- E02: 시간, 예약, 번호표, 순번 질서
- E05: 병상, 처치, 약품, 이송의 다중 자원 병목

### Customs
- E03: 자동 대량분류
- E07: 문서와 철도/환승 chain
- E12: convoy, 연료, 하역, 항만-도로 병목

### Port Recovery
- E03: 자동 분류와 classification chain
- E08: custody, 보관, release
- E11: 비공식 소유권과 시장의 claim
- E12: 생존 resource dependency와 allocation

### Broadcast
- E02: 재난 명령과 반복 갱신
- E07: 검증된 공영정보와 갱신 지연
- E12: 이동형 저전력, coverage, 정보 왜곡

### Residential
- E01: 가족, 세대, 보호자 역할
- E09: 소유, 보험, 커뮤니티 자격

### C08
12개 campaign은 서로 다른 resource physics, shelter topology, communication constraint, eligibility/depletion consequence, persistence/rumor 구조를 가져야 한다.

C08을 단순 "안전지대" family로 축약하지 않는다.

## 17. Production Entry Requirements

개별 campaign 제작 시작 전에 최소 다음 6필드를 채운다.

- `regional_secondary_collapse`
- `infrastructure_anchor`
- `gameplay_law`
- `human_recognition_rule`
- `resource_ecology`
- `persistence_profile`

그리고 내부적으로 다음 질문에 답한다.

**Service**  
무엇을 제공하는가?

**Registration**  
무엇으로 사람을 등록하거나 인식하는가?

**Registration Cost**  
등록/순응 대가는 무엇인가?

**Refusal Cost**  
거부하면 gameplay상 무엇을 잃는가?

**Dependency**  
누구에게 의존하며 누가 자신에게 의존하는가? 실제 dependency가 없다면 `none justified` 근거를 남긴다.

**Persistence**  
무엇이 다음 방문까지 남는가?

**Rumor**  
무엇이 어떤 causal channel로 다른 campaign에 알려지는가?

이 질문은 새 top-level schema field가 아니다.

## 18. Explicitly Open Items

아래는 **UNDECIDED WORLD STRUCTURE가 아니라 PRODUCTION FILL**이다.

- 96 campaign 개별 service 상세값
- 96 campaign 개별 persistence class
- C05 12개 개별 gameplay law
- 실제 rumor link graph
- 실제 service dependency graph
- 실제 relay/beacon 좌표
- E01 40 local 상세 재연결
- E02~E12 local 제작
- Unreal implementation
- actual RECOVER execution

RECOVER 자산 역할:
- World System: campaign-logic / map-evolution-proof / mystery-proof
- Tech Pipeline: motion-proof

motion-proof는 world design contract에 섞지 않는다. 실제 binary/file RECOVER는 이번 단계에서 실행하지 않는다.

## 19. Prohibited Interpretations

다음 해석과 구현을 금지한다.

- 96 campaign을 global 화면에 처음부터 전부 노출
- E01 40 local을 세계 노드 40개로 취급
- E02~E12를 자동 40-node화
- 모든 campaign에 동일 response table 적용
- 모든 campaign에 동일 persistence 적용
- 모든 campaign all-to-all dependency
- 모든 campaign all-to-all rumor
- rumor로 physical mutation
- 플레이어 행동의 전지적 공유
- 무료 순간이동
- service/resource 없는 무한 증원
- campaign 이름/미술만 바꾼 반복
- C08을 단순 안전지대 family로 축약
- 96 campaign 세부값의 일괄 자동 생성
- PM 최종 승인 전 실제 FINAL GLOBAL WORLD LOCK 문서 생성

## 20. Final Lock Validation

Canonical PRELOCK:
- PASS: **19**
- PARTIAL: **1**
- HOLD: **0**
- READY: **YES**
- PARTIAL 항목: **C05 campaign-specific production fill**
- C05 판정: **NON-BLOCKING**

Registry:
- rows: **96**
- unique: **96**
- missing: **0**
- unexpected: **0**

Final Lock structural checks:
- 새 ID: 0
- Display Name 변경: 0
- E02~E12 신규 local: 0
- main 변경 의도: 0
- 실제 RECOVER 실행: 0
- Unreal 구현: 0

**최종 판정: FINAL GLOBAL WORLD STRUCTURE LOCK V0.2 / PM APPROVED**

이 문서는 PM 최종 승인에 따라 Candidate 28을 승격한 **FINAL GLOBAL WORLD STRUCTURE LOCK V0.2**다. Production Fill은 상위 구조 미확정이 아니라 후속 제작 입력으로 유지하며, 실제 RECOVER/Unreal/local 제작은 별도 PM 지시 없이 수행하지 않는다.
