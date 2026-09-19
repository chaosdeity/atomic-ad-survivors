# 65 E01 First Implementation Handoff Package V0.1

상태: FIRST IMPLEMENTATION HANDOFF DESIGN
대상: E01_C01 CURRENT R01 SLICE
구현 대상 범위: R01-L01 + R01-L02
구현 승인 상태: NOT AUTHORIZED
이번 문서 자체의 구현 변경: 0

## 0. Scope

첫 Unreal handoff는 E01 전체가 아니다.

포함:
- R01-L01 침묵 가장자리
- R01-L02 분양 주택 루프
- 이미 current runtime에 존재하는 quest
- safe hub
- time-unlimited exploration
- finite place-bound combat
- investigation / record comparison
- choice
- voluntary return
- incomplete-progress persistence
- report / one-time growth
- revisit / follow-up
- current L01→L02 physical relation

제외:
- R01-L03 boss
- R01-L04
- R01-L05
- R08-L01/L02를 C01 필수 runtime chain으로 묶기
- C02~C08 구현
- 새 Local / 새 edge
- Relay / Beacon / Recovery actual assignment
- STRUCTURAL persistence
- Final Lock / Production Entry 변경

## 1. Authoritative docs

World / Campaign:
- incoming/gpt_work/01_global_world_lock/GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md
- incoming/gpt_work/03_e01_remap/10_E01_REMAP_CANONICAL_V0_1.md
- incoming/gpt_work/03_e01_remap/13_E01_C01_PRODUCTION_ENTRY_V0_1.md
- incoming/gpt_work/03_e01_remap/17_E01_COMMON_GRAPH_POPULATION_CANONICAL_V0_1.md
- incoming/gpt_work/03_e01_remap/18_E01_LOCAL_VISIBILITY_PROGRESSION_GRAPH_V0_1.csv
- incoming/gpt_work/03_e01_remap/19_E01_LOCAL_PHYSICAL_TRAVEL_GRAPH_V0_1.csv

Current Unreal:
- docs/unreal/r01_rpg34_20260916.md
- docs/unreal/r01_rpg35_20260918.md
- docs/unreal/main_subgame_combat_contract_20260914.md
- docs/unreal/R01_L01_UNREAL_HERO_SHOT_GATE_V0_1.md

## 2. Existing runtime evidence

### ALREADY IMPLEMENTED

RPG34 authority documents current evidence for:
- safe hub + quest accept
- time-unlimited local exploration
- finite place-bound combat
- residential records investigation
- MAIL-LOOP hold/keep-waiting choice boundary
- voluntary return at any time
- incomplete return and cold-reload persistence
- report and one-time growth
- revisit
- save-failure rollback behavior
- main attack damage/growth behavior
- 37/37 narrow state gate

RPG35 authority adds:
- first report 뒤 R01-L02 follow-up quest
- three independent housing-record checkpoints
- optional cleaning clue
- three finite local enemy sources
- voluntary return / incomplete progress preservation
- one-time follow-up growth
- first-quest regression 37/37
- follow-up state gates 28/28
- R01-L01 → R01-L02 normal-speed swept movement evidence

Physical Graph:
- PHY-E01-001 R01-L01 → R01-L02 = VALIDATED

## 3. Target canonical behavior

Current runtime를 E01_C01 Production Entry에 맞춰 다음 의미로 정렬한다.

- 주된 문제는 residential role / household mismatch다.
- registered household/occupancy/recipient/guardian state는 진실이 아니라 검증해야 할 claim이다.
- player는 현장 상태와 record를 비교한다.
- 중요 선택은 local service/access/receipt/protection consequence와 연결된다.
- MAIL-LOOP choice를 “가족 배정 승인”으로 확대하지 않는다.
- investigation → choice → voluntary return → report/growth → revisit가 current backbone이다.
- fixed-time survival run으로 회귀하지 않는다.

## 4. Data / state requirements

최소 state 의미:
- current quest / follow-up stage
- investigation checkpoint
- inspected record state
- important local choice
- normal return state
- incomplete progress state
- report completion
- one-time growth processed state
- revisit / follow-up state

NEEDS ALIGNMENT:
- 위 state가 C01의 household/occupancy/receipt/guardian claim과 어떤 semantic relation인지 명시한다.
- RPG35의 세 record가 C01 residential-record comparison으로 읽히는지 확인한다.
- Direct Memory와 단순 UI 표시를 분리한다.
- 저장 실패 시 이전 메모리/디스크 상태 유지 계약을 보존한다.

새 save schema/migration은 이 handoff package의 자동 승인 범위가 아니다.

## 5. UI requirements

NEEDS ALIGNMENT:
- 현재 등록 claim과 player가 직접 검증한 state를 혼동하지 않게 표시.
- quest / investigation / return / report / revisit의 다음 행동이 읽혀야 함.
- timer pressure, forced extraction countdown, survival-wave completion을 main progression UI로 복구하지 않음.
- report/growth의 one-time 처리와 revisit 상태가 식별 가능해야 함.
- 1920×1080에서 기록/선택/보고/재방문 UI 가독성을 다시 증명.

최종 아트 PASS는 이 패키지의 완료조건이 아니다.

## 6. Save / persistence requirements

반드시 보존:
- incomplete voluntary return 후 진행 이어가기
- cold reload 후 미완료 진행 보존
- inspected record/checkpoint 보존
- important choice 보존
- report/growth 중복 지급 금지
- save failure 시 이전 valid memory/disk state 보존

금지:
- 매 방문 모든 상태 초기화
- rumor가 Direct Memory 자동 overwrite
- evidence 없이 STRUCTURAL facility/geometry state 추가
- PM 승인 없는 save schema migration

## 7. Combat contract

Current main-game contract:
- 좌클릭을 누르는 동안 반복 기본 공격
- 좌클릭 해제 시 중지
- 적 대상 aim assist 가능
- NPC/world object 자동 공격 대상 아님
- 장소 귀속 finite combat
- infinite global wave 금지
- main-game auto-fire 복구 금지

Combat은 investigation/quest progression을 대체하지 않는다.

## 8. Return / report / revisit contract

Return:
- designated return interaction에서 player가 선택해 귀환
- incomplete return도 정상 상태
- fixed timer 강제 회수 아님

Report:
- 충분한 objective 완료 뒤 safe hub report
- important choice/result 확정
- one-time growth
- repeated report reward duplication 금지

Revisit:
- saved investigation/choice/progress를 이어받음
- completed state와 follow-up state를 구별
- 새로운 verified state가 있으면 오래된 정보 갱신 가능

## 9. Legacy behavior to remove / avoid

current canonical mode에서 금지:
- 70초 timer pressure
- 88초 signal collapse
- 108초 forced extraction
- 108초 completion → L02 unlock
- fixed-time survival run
- main-game auto-fire
- 240초 boss gate

과거 비교 모드를 삭제할 필요는 없다.
current canonical progression으로 복구하지 않는 것이 요구사항이다.

## 10. Authority-documented runtime references

Current Unreal authority가 실제 존재한다고 명시한 reference만 사용한다.

Authority-documented source paths:
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Private/AASPlaytestRuntimeClasses.cpp
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestRuntimeClasses.h
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestProgressSaveGame.h
- unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg34.py
- unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg35.py
- unreal/AtomicAdSurvivorsUE/Run-R01RPG34.ps1
- unreal/AtomicAdSurvivorsUE/Run-R01RPG35.ps1

Authority-documented map/package reference:
- /Game/Playtest/R01RPG34/R01_RPG34

RPG35는 authority document의 실행 로그에서 map name R01_RPG35가 확인되지만 이 handoff 문서가 package path를 추정해 잠그지 않는다.

주의:
rpg35 authority는 해당 runtime 파일들이 당시 repository에서 untracked였다고 기록한다.
따라서 위 경로를 authority-documented runtime path로만 참조하며 현재 GitHub tracking state를 이 문서가 주장하지 않는다.

## 11. ALREADY IMPLEMENTED / NEEDS ALIGNMENT / NOT YET IMPLEMENT

### ALREADY IMPLEMENTED
- R01-L01 first quest functional slice
- R01-L02 follow-up functional slice
- finite combat
- record investigation
- choice
- voluntary return
- incomplete persistence
- report / one-time growth
- revisit
- L01→L02 current physical relation

### NEEDS ALIGNMENT
- runtime state를 C01 residential-role canonical semantics와 직접 매핑
- registered claim vs verified reality 표현
- RPG35 L02 records와 canonical housing-record investigation 의미 정렬
- Direct Memory / report / revisit state 계약을 구현 spec에 명시
- legacy timer behavior가 canonical mode에 재유입되지 않는지 회귀 확인
- UI가 canonical semantic distinction을 보여주는지 확인

### NOT YET IMPLEMENT
- R01-L03 boss
- R01-L04
- R01-L05
- C01 campaign 전체
- R08 mandatory chain
- Relay/Beacon/Recovery actual assignment
- cross-Campaign dependency
- STRUCTURAL physical persistence
- final character/environment art approval

## 12. QA evidence required

최소:
1. build succeeds.
2. 300초 이후 자동회수/forced extraction 없음.
3. safe hub 전투 없음.
4. finite place-bound combat 확인.
5. LMB hold/release attack contract 확인.
6. incomplete voluntary return 후 동일 진행 보존.
7. cold reload 후 progress 보존.
8. record/checkpoint/choice 독립 저장.
9. report growth one-time.
10. save-failure injection 시 이전 valid state 보존.
11. R01-L01 → R01-L02 정상 속도 연속 swept movement 재확인.
12. R01-L02 세 record + optional clue persistence 확인.
13. 1920×1080 quest/investigation/report/revisit UI 가독성 evidence.
14. 기존 비교 모드가 보존되는 경우 current canonical mode와 섞이지 않는지 회귀 확인.

자동 QA는 재미 승인이나 최종 아트 승인을 대신하지 않는다.

## 13. Rollback boundary

- RPG34/RPG35 current evidence를 삭제하지 않는다.
- PM이 base runtime과 canonicalization strategy를 결정하기 전 existing mode를 보존한다.
- save wipe 금지.
- 승인 없는 schema migration 금지.
- implementation branch에서 좁은 범위로 작업하고 current evidence 재현 가능성을 유지한다.
- alignment 실패 시 기존 verified runtime으로 되돌릴 수 있어야 한다.

## 14. Final

First Handoff Package status:
HANDOFF_PACKAGE_READY

Implementation execution:
NOT AUTHORIZED

PM 승인 후에만 실제 Blueprint/C++/Python/asset/runtime 변경을 시작한다.
