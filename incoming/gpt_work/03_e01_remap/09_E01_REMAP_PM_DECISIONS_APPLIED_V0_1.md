# 09 E01 Remap PM Decisions Applied V0.1

상태: PM DECISIONS CANONICALIZED
범위: E01 Remap Production Fill
구현 상태: NOT UNREAL IMPLEMENTATION
기준 브랜치: chatgpt-work
Authority sync commit: 73c1fd68859ea5a49755c7b33709f1304e0eed62

## 0. 적용 원칙

이 문서는 `08_E01_REMAP_PM_DECISION_SHEET_V0_1.md`의 PM-01~07에 대해 승인된 결정을 canonicalize한다. Final Global World Structure Lock V0.2, 기존 40 Local / 37 source connection, 최신 R01 RPG34/RPG35 및 R08 Unreal 권위를 수정하지 않는다.

공통 불변:
- Final Lock 변경 0.
- Local ID/name 변경 0.
- source 37 edge 변경 0.
- main branch 변경 0.
- Unreal Blueprint/C++ 구현 0.

## PM-01 R08 First Play

### decision
- R08-L01은 framing / survivor settlement hub 역할을 유지한다.
- R08-L02는 optional/support infrastructure로 둔다.
- `R08-L01 → R08-L02 → R01-L01`을 강제 튜토리얼 체인으로 사용하지 않는다.
- current RPG safe hub와 R08-L01을 runtime 1:1 동일 공간으로 확정하지 않는다.

### reason
최신 R01 RPG는 별도 safe hub에서 의뢰를 수락한 뒤 주거 지역으로 진입하는 구조이며, 현재 자료에는 그 safe hub와 R08-L01을 동일 공간으로 잠글 근거가 없다. R08-L01은 survivor-operated outpost의 공간 후보이고 R08-L02는 recovery 관련 지원 인프라 후보이므로 첫 플레이 필수 선형 관문으로 만들 필요가 없다.

### source basis
- `docs/unreal/r01_rpg34_20260916.md`
- `docs/unreal/r01_rpg35_20260918.md`
- `docs/unreal/world_structure_execution_20260912.md`
- `docs/unreal/r08_supply_execution_20260912.md`
- `07_E01_P0_CURRENT_GAMEPLAY_REVALIDATION_V0_1.md`
- `08_E01_REMAP_PM_DECISION_SHEET_V0_1.md`

### what changes
P0 metadata를 first-play strict order가 아니라 production priority로 재해석한다. R08-L01/L02의 첫 플레이 노출은 contextual/optional로 분리한다.

### what does not change
R08-L01, R08-L02의 Local ID/name과 기존 historical connection은 유지한다.

## PM-02 R01-L03 Boss

### decision
R01-L03은 first 15 minutes boss가 아니다. 최소 진행은 다음 순서를 요구한다.

```text
R01-L01 first quest
→ voluntary return
→ report/growth
→ R01-L02 follow-up investigation/revisit
→ additional C01 progression
→ R01-L03 boss milestone
```

exact quest number는 TBD다. 기존 P0 metadata는 FIRST-PLAY PRIORITY가 아니라 EARLY PRODUCTION PRIORITY로 해석한다.

### reason
RPG34와 RPG35는 boss/P1을 현재 playable slice에 앞당기지 않았고, 현재 main contract는 timer 기반 unlock이 아니라 quest/report/revisit 기반 진행이다.

### source basis
- `docs/unreal/r01_rpg34_20260916.md`
- `docs/unreal/r01_rpg35_20260918.md`
- `docs/unreal/main_subgame_combat_contract_20260914.md`
- `07_E01_P0_CURRENT_GAMEPLAY_REVALIDATION_V0_1.md`

### what changes
R01-L03의 production 위치를 early-season C01 milestone로 재해석하고 first-15-min 해석을 제거한다.

### what does not change
R01-L03 ID/name과 boss milestone role 자체는 보존한다. 새 timer와 exact quest number는 만들지 않는다.

## PM-03 Legacy Godot Anchors

### decision
선택 B를 적용한다. 아래 old identifiers는 문서 alias/reference로만 보존한다.

- `silence_edge_start`
- `outer_recovery_lane_anchor`
- `subdivision_loop_center`
- `open_house_street_anchor`
- `model_house_node_anchor`
- `drain_pocket_anchor`
- `fake_return_route_anchor`

Unreal runtime에서는 새 semantic tag/runtime identifier를 사용한다.

### reason
최신 Unreal은 자체 map manifest/runtime 위치를 사용하며 old Godot exact identifier를 current runtime authority로 사용하는 근거가 없다. semantic continuity는 보존할 수 있으나 identifier authority 부활은 불필요하다.

### source basis
- `08_E01_REMAP_PM_DECISION_SHEET_V0_1.md`
- latest Unreal R01 authority set

### what changes
Production 문서에서 legacy alias와 current semantic identifier를 명시적으로 분리한다.

### what does not change
old identifier의 역사적 추적 가능성은 유지한다. 기존 Godot 자산이나 문서를 수정하지 않는다.

## PM-04 Relay / Beacon / Recovery

### decision
- E01 Sector Relay actual location: TBD / PRODUCTION FILL.
- R08-L02 `RECOVERY_SUPPORT = CANDIDATE_LOCK`.
- R08-L02 `LOCAL_BEACON_SUPPORT = CANDIDATE`.
- R08-L02 `SECTOR_RELAY = NOT_ASSIGNED`.
- 한 physical place에 여러 장치가 존재할 수 있어도 data role은 각각 분리한다.

### reason
Final Lock은 Relay, Beacon, Recovery를 서로 다른 travel 역할로 고정한다. old R08-L02 문서에는 인양/출격/신호 역할이 섞여 있어 실제 assignment를 분리하지 않으면 잘못된 all-purpose node가 된다.

### source basis
- `GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md` §14
- `03_E01_37_CONNECTION_AUDIT_V0_1.md`
- `docs/unreal/world_structure_execution_20260912.md`

### what changes
Travel-role schema에서 role type, support state, actual assignment를 분리한다.

### what does not change
R08-L02의 Local identity와 recovery-support 후보 의미는 유지한다. Sector Relay actual location은 확정하지 않는다.

## PM-05 37 Connection

### decision
기존 37개 connection은 `HISTORICAL PROGRESSION / VISIBILITY MAPPING SOURCE`로 보존한다. 새 Production data는 아래 3개 graph로 분리한다.

1. `LOCAL_VISIBILITY_PROGRESSION_GRAPH`
2. `LOCAL_PHYSICAL_TRAVEL_GRAPH`
3. `CAMPAIGN_DEPENDENCY_GRAPH`

`remote_signal`을 physical travel로 자동 해석하지 않는다. R06-L01 / R07-L01 ingress 부족을 새 edge로 덮지 않는다.

### reason
source 37에는 main/branch/boss_branch/remote_signal/blockade/internal_crisis 의미가 혼재하고 physical travel completeness를 증명하지 못한다.

### source basis
- `03_E01_37_CONNECTION_AUDIT_V0_1.md`
- `06_E01_40_LOCAL_37_CONNECTION_REMAP_DRAFT_V0_1.md`
- `GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md`의 travel/dependency 분리

### what changes
37개 source edge는 trace reference로만 사용하고 actual visibility, physical travel, campaign dependency는 별도 Production schema에서 관리한다.

### what does not change
source 37 edge의 source/target/type/count는 변경하지 않는다. 이번 작업의 신규 physical edge 수는 0이다.

## PM-06 Persistence

### decision
첫 Production Fill 대상은 E01_C01이다. `persistence_profile.class = STANDARD`로 확정한다.

STANDARD Direct Memory scope:
- quest/checkpoint
- investigation
- important choice
- normal return
- incomplete progress
- report/growth
- revisit state

`STRUCTURAL physical persistence = NOT LOCKED`.

### reason
RPG34/RPG35에는 미완료 정상 귀환, 조사 checkpoint, 선택, 보고 보상 중복 방지, 재방문 상태가 실제 저장 근거로 존재한다. 반면 시설/지형의 영구 물리 변경을 Campaign 계약으로 승격할 production evidence는 없다.

### source basis
- `docs/unreal/r01_rpg34_20260916.md`
- `docs/unreal/r01_rpg35_20260918.md`
- `05_E01_RESOURCE_PERSISTENCE_APPLICATION_V0_1.md`
- `GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md` §10~13

### what changes
E01_C01의 persistence class가 PARTIAL/TBD에서 STANDARD로 승격된다.

### what does not change
STRUCTURAL은 잠그지 않는다. rumor가 physical mutation을 만들 수 없다는 Final Lock은 그대로 유지한다.

## PM-07 Production Fill 순서

### decision
Production Design 작업 순서는 다음과 같다.

1. E01_C01
2. E01 common Travel/Graph Schema
3. E01_C08
4. E01_C02 / E01_C03
5. E01_C04 / E01_C06
6. E01_C05 / E01_C07

### reason
C01은 current gameplay 근거가 가장 많고, C08은 current spatial/infrastructure 근거가 있다. 나머지는 current Unreal 근거 밀도와 schema 선행 필요성을 기준으로 뒤에 둔다.

### source basis
- `04_E01_CAMPAIGN_PRODUCTION_ENTRY_AUDIT_V0_1.md`
- `08_E01_REMAP_PM_DECISION_SHEET_V0_1.md`

### what changes
후속 Production Fill의 작업 순서를 고정한다.

### what does not change
이 순서는 gameplay unlock order가 아니다. Campaign ID/family/Local 구조를 재정렬하지 않는다.

## 8. Canonicalization result

- PM-01: APPLIED
- PM-02: APPLIED
- PM-03: APPLIED
- PM-04: APPLIED
- PM-05: APPLIED
- PM-06: APPLIED
- PM-07: APPLIED

판정: PM DECISIONS APPLIED / READY FOR E01_C01 PRODUCTION ENTRY.
