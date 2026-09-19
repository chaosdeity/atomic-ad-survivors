# 11 E01 Graph Role Schema V0.1

상태: E01 COMMON GRAPH SCHEMA
범위: E01 Production Fill
구현 상태: NOT UNREAL IMPLEMENTATION
source edge 변경: 0
new physical edge: 0

## 0. 목적

기존 37 source connection에 섞여 있는 progression, visibility, signal, branch, blockade 의미를 실제 물리 이동과 Campaign service dependency에서 분리한다.

이 schema는 세 graph를 정의하지만 이번 작업에서 새 Production edge를 발명하지 않는다.

## 1. LOCAL_VISIBILITY_PROGRESSION_GRAPH

### purpose
Local이 언제 보이거나 조사/후속 목표로 의미 있게 노출되는지, 그리고 Local 간 진행 단서/가시성 관계를 표현한다.

### node type
- E01 Local ID: R01-L01~R08-L05.
- 필요 시 Campaign context를 reference로 가진다.

### edge meaning
- objective/progression reveal.
- follow-up investigation availability.
- signal/source visibility.
- branch/boss/internal-crisis의 진행 관계.

물리적으로 걸어갈 수 있다는 뜻은 아니다.

### state
- `SOURCE_REFERENCED`: 기존 37 source connection에서 역사적 관계만 확인.
- `PRODUCTION_DEFINED`: current authority와 Production Fill 근거로 visibility/progression 의미가 확정.
- `TBD`: source 관계는 있으나 현재 의미가 미확정.

이번 작업의 graph population 상태: **SCHEMA DEFINED / EDGE FILL PARTIAL**.

### source authority
- `03_E01_37_CONNECTION_AUDIT_V0_1.md`.
- `06_E01_40_LOCAL_37_CONNECTION_REMAP_DRAFT_V0_1.md`.
- current R01 RPG34/RPG35 authority.
- Final Lock Global Visibility.

### allowed use
- quest/follow-up visibility.
- campaign/local progression planning.
- remote source discovery.
- UI/navigation reveal planning.

### forbidden interpretation
- physical road/door/vehicle path로 자동 해석.
- Sector Relay로 자동 승격.
- Recovery Line으로 자동 승격.
- `remote_signal`을 travel edge로 간주.
- source P0/P1/P2를 first-play strict order로 간주.

## 2. LOCAL_PHYSICAL_TRAVEL_GRAPH

### purpose
플레이어 또는 recovery/transport가 실제로 이동할 수 있는 Local 간 물리 경로만 표현한다.

### node type
- Local entry/exit.
- validated physical access anchor.
- production-defined transfer point.

### edge meaning
실제 지도/동선/교통/통로 근거가 있는 물리 이동 가능성이다.

### state
- `CANDIDATE`: 물리 관계 후보지만 evidence 미완료.
- `VALIDATED`: map/production evidence로 실제 이동 관계가 확인.
- `BLOCKED/UNAVAILABLE`: 물리 경로가 현재 사용 불가하다는 별도 상태.

이번 작업의 graph population 상태: **SCHEMA DEFINED / NEW EDGE 0**.

### source authority
- current Unreal map/level evidence.
- approved Production Fill.
- validated travel/recovery evidence.
- Final Lock physical causality boundary.

### allowed use
- 실제 Local entry/exit 설계.
- route availability.
- recovery/transport path가 실제 geometry와 연결되는 경우의 참조.

### forbidden interpretation
- 37 source connection 전체를 복사해 travel graph로 만드는 것.
- progression unlock을 물리 도로로 간주.
- remote_signal을 물리 route로 간주.
- R06-L01/R07-L01 ingress 공백을 근거 없이 보충.
- 무료 순간이동.

## 3. CAMPAIGN_DEPENDENCY_GRAPH

### purpose
Campaign 또는 Campaign infrastructure 사이의 실제 service/resource dependency를 표현한다.

### node type
- E01_C01~E01_C08.
- 필요 시 provider/consumer infrastructure reference.

### edge meaning
한 Campaign의 실제 resource/service failure 또는 recovery가 검증된 dependency를 통해 다른 Campaign의 상태에 bounded consequence를 만드는 관계다.

필수 dependency 내용:
- provider.
- consumer.
- resource_or_service.
- dependency_strength.
- failure_effect.
- recovery_condition.
- propagation_channel.

### state
- `CANDIDATE`: 인프라 관계 후보.
- `VALIDATED`: 실제 infrastructure/service 근거가 확인.
- `NONE_JUSTIFIED`: 현재 Production Entry에서 dependency를 만들 근거가 없음.

이번 작업의 graph population 상태: **SCHEMA DEFINED / NEW DEPENDENCY EDGE 0**.

### source authority
- Final Lock §8~13.
- campaign Production Entry.
- 실제 전력/물류/의료/연료/통신/행정/service 연결 근거.

### allowed use
- bounded downstream degradation.
- 실제 support/recovery dependency.
- service failure/recovery의 causal propagation.

### forbidden interpretation
- 같은 family라서 dependency 생성.
- 같은 Sector라서 dependency 생성.
- 지도상 가깝다는 이유만으로 dependency 생성.
- rumor만으로 physical/service state mutation.
- all-to-all dependency.

## 4. 37 source connection trace contract

기존 37개는 graph edge로 재작성하지 않고 다음 동등 reference로 추적한다.

`legacy_source_edge_ref = 03_E01_37_CONNECTION_AUDIT_V0_1.md의 row number + source + target + source type`.

| ref | source → target | source type | 기본 graph 해석 |
|---:|---|---|---|
| 01 | R08-L01 → R08-L02 | P0/main | visibility/progression source only |
| 02 | R08-L02 → R01-L01 | P0/main | visibility/progression source only |
| 03 | R01-L01 → R01-L02 | P0/main | current progression candidate |
| 04 | R01-L02 → R01-L03 | P0/main | remapped milestone progression |
| 05 | R01-L02 → R01-L04 | P1/branch | visibility/progression source only |
| 06 | R01-L03 → R01-L05 | P1/branch | visibility/progression source only |
| 07 | R08-L02 → R08-L03 | P1/branch | visibility/progression source only |
| 08 | R08-L03 → R08-L04 | P1/branch | visibility/progression source only |
| 09 | R01-L05 → R03-L01 | P1/branch | cross-campaign source only |
| 10 | R03-L01 → R03-L02 | P1/branch | progression source only |
| 11 | R03-L02 → R03-L03 | P1/branch | progression source only |
| 12 | R01-L03 → R02-L01 | P1/branch | cross-campaign source only |
| 13 | R02-L01 → R02-L02 | P1/branch | progression source only |
| 14 | R02-L02 → R02-L03 | P1/branch | progression source only |
| 15 | R03-L03 → R04-L01 | P1/branch | cross-campaign source only |
| 16 | R04-L01 → R04-L02 | P1/branch | progression source only |
| 17 | R04-L02 → R04-L03 | P1/branch | progression source only |
| 18 | R06-L01 → R06-L02 | P1/branch | progression source only |
| 19 | R06-L02 → R06-L03 | P1/branch | progression source only |
| 20 | R03-L03 → R03-L04 | P2/boss_branch | progression source only |
| 21 | R03-L04 → R03-L05 | P2/boss_branch | progression source only |
| 22 | R02-L03 → R02-L04 | P2/boss_branch | progression source only |
| 23 | R02-L04 → R02-L05 | P2/boss_branch | progression source only |
| 24 | R04-L03 → R04-L04 | P2/boss_branch | progression source only |
| 25 | R04-L04 → R04-L05 | P2/boss_branch | progression source only |
| 26 | R06-L03 → R06-L04 | P2/boss_branch | progression source only |
| 27 | R06-L04 → R06-L05 | P2/boss_branch | progression source only |
| 28 | R08-L03 → R05-L01 | P2/remote_signal | visibility only by default |
| 29 | R05-L01 → R05-L02 | P2/remote_signal | visibility/source progression |
| 30 | R05-L02 → R05-L03 | P2/remote_signal | visibility/source progression |
| 31 | R05-L03 → R05-L04 | P2/remote_signal | visibility/source progression |
| 32 | R05-L04 → R05-L05 | P2/remote_signal | visibility/source progression |
| 33 | R07-L01 → R07-L02 | P2/blockade | progression/source only until travel evidence |
| 34 | R07-L02 → R07-L03 | P2/blockade | progression/source only until travel evidence |
| 35 | R07-L03 → R07-L04 | P2/blockade | progression/source only until travel evidence |
| 36 | R07-L04 → R07-L05 | P2/blockade | progression/source only until travel evidence |
| 37 | R08-L04 → R08-L05 | P2/internal_crisis | progression/source only |

이 reference는 source edge의 새 ID가 아니라 감사 row를 가리키는 추적 키다.

## 5. Graph 간 금지된 자동 변환

다음을 자동으로 수행하지 않는다.

```text
VISIBILITY/PROGRESSION EDGE
≠ PHYSICAL TRAVEL EDGE
≠ CAMPAIGN DEPENDENCY EDGE
```

한 관계가 두 graph 이상에서 필요하면 각 graph의 독립 근거를 갖춰 별도 Production Fill한다.

## 6. R06/R07 ingress

- R06-L01: source 37에 외부 ingress 없음.
- R07-L01: source 37에 외부 ingress 없음.
- 현재 판정: **KNOWN SOURCE GAP / NOT A NEW EDGE REQUEST**.
- 이번 작업 신규 edge: 0.

## 7. Schema result

- LOCAL_VISIBILITY_PROGRESSION_GRAPH: PASS.
- LOCAL_PHYSICAL_TRAVEL_GRAPH: PASS, new edge 0.
- CAMPAIGN_DEPENDENCY_GRAPH: PASS, new dependency edge 0.
- 37 source references traceable: PASS.
- remote_signal physical interpretation: 0.
- source edge modification: 0.

판정: **E01 GRAPH ROLE SCHEMA / PASS**.
