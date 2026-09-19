# 17 E01 Common Graph Population Canonical V0.1

상태: E01 COMMON GRAPH PRODUCTION FILL
범위: LOCAL_VISIBILITY_PROGRESSION_GRAPH / LOCAL_PHYSICAL_TRAVEL_GRAPH / CAMPAIGN_DEPENDENCY_GRAPH
기준 브랜치: chatgpt-work
기준 HEAD: 0e968212a391a536b02caef4c5c7e78c982fbb7d
구현 상태: NOT UNREAL IMPLEMENTATION

## 0. Population result

- source 37 preservation: PASS
- Visibility / Progression rows: 37
- Visibility PRODUCTION_DEFINED: 2
- Visibility SOURCE_REFERENCED: 19
- Visibility TBD: 16
- Visibility REJECTED_AS_CURRENT: 0
- Physical Travel rows: 1
- Physical VALIDATED: 1
- Campaign Dependency rows: 0
- new source pair: 0

이 작업은 Graph Schema를 새로 만들지 않는다. 11_E01_GRAPH_ROLE_SCHEMA_V0_1.md에 정의된 세 Graph에 현재 권위와 실제 증거가 허용하는 Production Data만 채운다.

## 1. Graph roles

### LOCAL_VISIBILITY_PROGRESSION_GRAPH
Local이 언제 의미 있게 노출되는지, 후속 조사나 milestone이 어떻게 이어지는지, signal/source visibility가 무엇인지 표현한다. 이 graph 자체는 물리 이동을 뜻하지 않는다.

### LOCAL_PHYSICAL_TRAVEL_GRAPH
플레이어 또는 recovery/transport가 실제로 이동할 수 있다는 현재 map/runtime/production evidence가 있는 relation만 표현한다. Progression source를 자동 복사하지 않는다.

### CAMPAIGN_DEPENDENCY_GRAPH
실제 provider/consumer infrastructure와 resource/service causality가 검증된 Campaign 관계만 표현한다. 같은 Sector, source cross-campaign, rumor, 지도상 근접만으로 만들지 않는다.

## 2. Edge promotion contract

Production Graph relation은 아래 조건 중 하나를 만족해야 한다.

A. 기존 source 37 edge의 source-target pair이며 current authority가 해당 graph 의미를 지지한다.
B. Final Lock 또는 current Unreal이 독립 관계를 명시적으로 증명한다.

이번 fill에서는 A만 사용했다. source 37 밖의 새 source-target pair는 생성하지 않았다. 필요한 ingress가 보여도 GAP으로 기록한다.

VISIBILITY ≠ PHYSICAL TRAVEL ≠ CAMPAIGN DEPENDENCY.

같은 pair가 둘 이상의 graph에 존재하려면 각 graph에서 독립 evidence를 가져야 한다.

## 3. Evidence levels

- CURRENT_RUNTIME: 실제 current Unreal runtime, map, 정상 속도 이동, 저장/퀘스트 실행 등 현재 실행 증거.
- CURRENT_DESIGN: current Unreal design/production 문서가 직접 정의하지만 runtime 완료까지는 주장하지 않는 근거.
- CANONICAL_PM: Final Lock, PM canonical, Production Entry가 직접 잠근 의미.
- LEGACY_SOURCE_ONLY: 기존 37 source edge의 역사적 의미만 확인된 상태.
- INSUFFICIENT: source trace는 있으나 현재 Production 의미를 승격하기에 근거가 부족한 상태.

## 4. Legacy source trace

각 Visibility row의 legacy_source_edge_ref는 다음 형식을 사용한다.

row number | source→target | source type

이 값은 새 edge ID가 아니라 03_E01_37_CONNECTION_AUDIT_V0_1.md의 source row를 추적하기 위한 reference다. 기존 37개의 source, target, type, count는 수정하지 않는다.

## 5. Current population

### Visibility / Progression

37 source edge 전부를 audit row로 유지한다.

- PRODUCTION_DEFINED 2: source 03, source 04.
- SOURCE_REFERENCED 19: 현재 의미를 새로 잠그지 않고 source trace를 유지하는 관계.
- TBD 16: review-needed, future boss branch, current trigger 미정 등 현재 의미가 불충분한 관계.
- REJECTED_AS_CURRENT 0.

SOURCE_REFERENCED는 mandatory unlock 또는 physical path를 뜻하지 않는다.

### Physical Travel

Production row는 1개다.

R01-L01 → R01-L02:
- state: VALIDATED
- legacy source: 03
- 근거: RPG35의 기존 field 북쪽 출입점 → 새 조사 구역 진입, route_geometry_check의 11개 조사 경로 구간, 정상 속도 연속 swept 이동 capture, 13/14의 L01/L02 current slice mapping.
- boundary: 현재 mapped slice 간 physical relation을 검증한 것이다. canonical Local의 최종 exact geometry boundary까지 잠그는 판정은 아니다.

그 외 source edge는 legacy source만으로 Physical Travel에 올리지 않는다.

### Campaign Dependency

Production dependency row는 0개다.

Final Lock은 dependency에 실제 provider, consumer, resource_or_service, failure_effect, recovery_condition, propagation_channel을 요구한다. 현재 E01 common 단계에서 이를 만족하는 cross-Campaign evidence가 없다. 따라서 빈 graph는 정상이며 실패가 아니다.

## 6. Special pair decisions

### source 03: R01-L01 → R01-L02

Visibility / Progression:
- PRODUCTION_DEFINED.
- 첫 의뢰를 마치고 보고/성장한 뒤 R01-L02의 후속 분양 주택 기록 대조가 열린다는 current progression이 존재한다.

Physical Travel:
- VALIDATED.
- RPG35에서 기존 field 북쪽 출입점에서 새 조사 구역으로 정상 속도 연속 swept 이동이 실제 검증되었다.

두 판정은 같은 source pair를 쓰지만 서로 독립 evidence로 성립한다.

### source 04: R01-L02 → R01-L03

Visibility / Progression:
- PRODUCTION_DEFINED.
- R01-L03은 R01-L02 이후 additional C01 progression을 거치는 early-season boss milestone이다.
- immediate unlock이 아니다.
- exact quest number는 TBD.

Physical Travel:
- TBD / no Production physical row.

Boss runtime:
- current RPG34/RPG35에는 구현 근거 없음.

### source 01 / 02

R08-L01 → R08-L02 → R01-L01을 mandatory first-play/tutorial chain으로 승격하지 않는다. P0는 production priority와 first-play priority가 분리되어 있으며 physical travel 또는 mandatory unlock을 자동 의미하지 않는다.

### source 28

R08-L03 → R05-L01 remote_signal은 visibility/information source 후보로만 보존한다. Physical Travel 또는 Campaign Dependency로 변환하지 않는다.

## 7. Known Graph Gaps

- R06-L01 external ingress: KNOWN GAP. 새 edge 0.
- R07-L01 external ingress: KNOWN GAP. 새 edge 0.
- E01 Sector Relay actual host: TBD / PRODUCTION FILL.
- Recovery Line exact geometry: TBD / PRODUCTION FILL.
- Local Beacon actual assignment: TBD / PRODUCTION FILL.

이 TBD와 빈 dependency graph는 이번 단계 실패가 아니다.

## 8. Travel role boundary

- E01 Sector Relay actual host: TBD / PRODUCTION FILL.
- R08-L02 RECOVERY_SUPPORT: CANDIDATE_LOCK.
- R08-L02 LOCAL_BEACON_SUPPORT: CANDIDATE.
- R08-L02 SECTOR_RELAY: NOT_ASSIGNED.
- R08-L02 RECOVERY_LINE_ENDPOINT: NOT_ASSIGNED.
- R08-L01 SURVIVOR_SETTLEMENT_HUB: CANONICAL_ROLE.
- R08-L01 CURRENT_RPG_SAFE_HUB_RUNTIME_HOST: TBD / NOT LOCKED.

R08-L01을 current RPG34/35 safe hub와 runtime 1:1로 동일시하지 않는다.

## 9. Non-implementation boundary

이번 작업에서 수행하지 않은 것:
- Final Lock 수정.
- 13_E01_C01_PRODUCTION_ENTRY_V0_1.md 수정.
- 기존 40 Local 수정.
- 기존 37 source edge 수정/삭제.
- source 37 밖 pair 생성.
- R06/R07 ingress 창작.
- Relay/Beacon/Recovery actual assignment 창작.
- Unreal Blueprint/C++ 구현.
- map 수정.
- E02~E12 Local 생성.
- main 변경.

판정: E01 COMMON GRAPH PRODUCTION READY.

READY는 Unreal 구현 시작 승인이 아니다. 다음 PM 단계는 E01_C08 Production Entry다.
