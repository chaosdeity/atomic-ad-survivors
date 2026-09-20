# E01 FIRST UNREAL STORY IMPLEMENTATION PACKAGE V0.1

상태: PLANNING PACKAGE ONLY
실제 Unreal 수정: 0
대상 Slice: M01 EVIDENCE-FIRST RESIDENTIAL LOOP
기준 runtime: RPG35 current mode
전략: current mode canonical alignment, 신규 mode 생성 금지

## 0. 결론

첫 Unreal 작업 패키지는 M01 core만 다룬다.

목표는 새 시스템을 만드는 것이 아니라 RPG35가 이미 가진 R01-L01 first quest를 final E01 story의 의미에 맞게 정렬하는 것이다.

핵심은:

- registered claim ≠ verified reality.
- 윤서는 직접 본 것만 말한다.
- combat은 investigation을 대체하지 않는다.
- MAIL-LOOP choice는 bounded.
- player가 스스로 돌아와 Mina에게 보고한다.

M01의 reader text를 전부 컷신으로 옮기는 작업이 아니다.

## 1. Preflight가 먼저인 이유

Gate D authority는 과거 Unreal runtime source가 Git에서 untracked였을 수 있다고 명시했다.

이번 story HEAD의 Git tree에서 다음 Gate D writable candidate는 tracked file로 확인되지 않았다.

- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Private/AASPlaytestRuntimeClasses.cpp
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestRuntimeClasses.h
- unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg35.py
- unreal/AtomicAdSurvivorsUE/Run-R01RPG35.ps1

Workspace readonly snapshot에도 unreal/AtomicAdSurvivorsUE 경로가 존재하지 않았다.

따라서 실제 worker는 문서에서 소스를 재구성하지 않는다.

첫 행동은 local authoring workspace에서 exact path의 존재, tracked 여부, hash, external mirror 존재 여부를 기록하는 것이다.

존재하지 않거나 authority와 다른 base라면 STOP한다.

## 2. Exact Writable Files 후보

아래는 69_E01_IMPLEMENTATION_GATE_D_PM_APPROVAL_V0_1.md가 허용한 범위 안에서 다시 좁힌 후보 목록이다.

### Primary candidate

1. unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Private/AASPlaytestRuntimeClasses.cpp
2. unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestRuntimeClasses.h

M01 semantic alignment가 기존 state/UI label/interaction routing으로 가능할 때만 수정한다.

### Conditional candidate

3. unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg35.py
   - map/package/asset/geometry를 바꾸기 위한 용도로 사용 금지.
   - existing test/capture fixture 또는 이미 존재하는 interaction wiring의 semantic metadata가 이 파일에 있고 이를 고쳐야 할 때만.

4. unreal/AtomicAdSurvivorsUE/Run-R01RPG35.ps1
   - 고유 test/capture slot 또는 current mode 실행 인자 정렬이 필요할 때만.

5. docs/unreal/r01_c01_canonical_alignment_20260919.md
   - Gate D가 허용한 신규 구현 기록 문서.
   - 실제 구현을 시작한 경우에만 생성.

6. docs/failure-ledger.md
   - 실제 실패가 발생한 경우 append-only.

7. C:/UnrealWork/ElectricDreamsEnv/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/ 아래 1~2번의 exact corresponding execution mirror
   - local preflight에서 실제 존재할 때만.
   - authoritative source가 아님.
   - 수정 후 source와 hash 일치 필수.

이 패키지는 위 후보를 지금 수정하지 않는다.

## 3. Read-only Files

다음은 worker가 읽을 수 있으나 이번 package에서 수정하지 않는다.

### Save / schema

- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestProgressSaveGame.h

새 field, field 의미 변경으로 migration이 필요하거나 현재 state만으로 M01 semantic alignment가 불가능하면:

**SAVE_SCHEMA_REAPPROVAL_REQUIRED**

로 STOP한다.

### Story authority

- story/05_progression/cold_reader_pack_v0_2/01_M01_READER.md
- story/05_progression/E01_FINAL_READER_SPINE_V0_1.md
- story/05_progression/E01_CHOICE_IMPLEMENTATION_MAP_V0_1.md
- story/05_progression/E01_COLD_READER_RESPONSE_AUDIT_V0_1.md

### Runtime / implementation authority

- docs/unreal/r01_rpg34_20260916.md
- docs/unreal/r01_rpg35_20260918.md
- docs/unreal/main_subgame_combat_contract_20260914.md
- docs/unreal/R01_L01_UNREAL_HERO_SHOT_GATE_V0_1.md
- incoming/gpt_work/03_e01_remap/64_E01_IMPLEMENTATION_READINESS_MATRIX_V0_1.md
- incoming/gpt_work/03_e01_remap/65_E01_FIRST_IMPLEMENTATION_HANDOFF_PACKAGE_V0_1.md
- incoming/gpt_work/03_e01_remap/69_E01_IMPLEMENTATION_GATE_D_PM_APPROVAL_V0_1.md
- incoming/gpt_work/03_e01_remap/70_E01_L01_L02_PHYSICAL_TRANSITION_PM_CLARIFICATION_V0_1.md

### Map / asset

모든 existing RPG35 map/package, geometry, material, camera, imported asset는 READ-ONLY다.

## 4. Story Scenes Included

### Included

- hub에서 Mina에게 first quest를 받는 framing.
- R01-L01에서 registration/receipt/household claim과 현장 관찰을 구분하는 investigation.
- place-bound finite combat.
- MAIL-LOOP bounded choice.
- voluntary return.
- Mina report.
- incomplete return/persistence와 one-time report/growth의 existing contract.

### Included only if already present in current runtime

- 자동 도움/응급 kit와 같은 생활 interaction.
- existing world object를 통한 짧은 diegetic beat.

없으면 만들지 않는다.

## 5. Story Scenes Explicitly Excluded

- Doyun bandage/hand-care scene.
- physical bandage inventory or injury item-use.
- VAC-0 actor.
- M02 full record comparison.
- M03 role replacement.
- M04 onward.
- final character art.
- new voice cast.
- new cinematic system.
- new NPC roster.
- new map/asset.
- R01-L03.
- R08 integration.

## 6. Runtime Acceptance Criteria

1. RPG35 current mode가 base다.
2. build succeeds.
3. safe hub combat = 0.
4. 300초 이후 forced extraction = 0.
5. main attack은 LMB hold 동안 반복, release 시 중지.
6. NPC/world object auto-target = 0.
7. R01-L01 combat은 finite/place-bound.
8. first quest가 timer survival로 변하지 않음.
9. UI/interaction에서 registered claim과 player-verified observation이 구분됨.
10. MAIL-LOOP 선택이 household truth/family assignment로 확대되지 않음.
11. incomplete voluntary return 뒤 progress 보존.
12. cold reload 뒤 progress 보존.
13. report/growth one-time.
14. save failure 시 이전 valid memory/disk state 유지.
15. Mina report에서 player가 “본 것 / 못 본 것”을 구분할 수 있음.
16. RPG35 follow-up R01-L02가 여전히 정상 unlock.
17. L01 north gate → explicit location-bound interaction → bounded L02 transition 계약 회귀 없음.
18. arbitrary/free teleport path 없음.
19. L02 three records + optional clue persistence 회귀 없음.
20. 1920×1080에서 quest/investigation/report/revisit UI가 읽힘.
21. map/asset/save/schema diff = 0.
22. story source diff = 0.

## 7. 5-minute Player Experience

### 0:00–0:45
Mina에게 first quest를 받는다.
Player가 “등록된 정보 확인”과 “실제 현장 확인”이 다르다는 목적을 안다.

### 0:45–2:00
R01-L01에 정상 이동한다.
첫 service/record interaction에서 시스템은 완료/유효를 말하지만 사람의 현재 상태는 확인되지 않았음을 본다.

### 2:00–3:20
finite combat을 처리한다.
combat 후 investigation이 계속된다.

### 3:20–4:10
MAIL-LOOP bounded choice.
player는 반복 안내를 다루지만 사람의 정체나 가족 상태를 대신 확정하지 않는다.

### 4:10–5:00
자율 귀환 후 Mina report.
UI는 registered claim / verified observation / unresolved를 분리한다.
다음 행동이 읽힌다.

실제 정상 속도 플레이가 5분을 크게 벗어나면 story text를 자르는 것이 아니라 interaction spacing과 UI pacing을 먼저 조사한다.

## 8. Regression Gates

- RPG34 first-quest regression reference 보존.
- RPG35 first quest 37/37 narrow gate 기준 유지.
- RPG35 follow-up 28/28 narrow gate 기준 유지.
- legacy 70/88/108/240 timer behavior current mode 재유입 0.
- main auto-fire 재유입 0.
- R01-L02 unlock/transition regression 0.
- report reward duplication 0.
- save rollback regression 0.

전체 QA를 돌리라는 뜻이 아니다. 실제 implementation 시 해당 narrow gates만 재검증한다.

## 9. STOP Conditions

아래 중 하나라도 발생하면 scope를 넓히지 않고 중단한다.

1. Gate D writable source가 local authoring workspace에 존재하지 않음.
2. local file hash/state가 authority가 설명한 RPG35 base와 일치한다고 판단할 수 없음.
3. AASPlaytestProgressSaveGame.h 수정이 필요함.
4. 새 save field/schema/migration이 필요함.
5. map/package/geometry/material/camera/imported asset 수정이 필요함.
6. 새 NPC actor/roster가 필수임.
7. Doyun/Popsy/Seven 등을 current capability로 가정해야만 목표가 성립함.
8. 새 Local 또는 새 travel edge가 필요함.
9. R01-L03를 열어야 함.
10. C02~C08 구현이 필요함.
11. current safe hub를 R08-L01이라고 새로 잠가야 함.
12. legacy timer/auto-fire를 복구해야 함.
13. story canon을 새로 써야 함.
14. current L01→L02 gate가 QA-PHY-C01-01~05를 만족하지 않고, 수정에 map/asset/new edge가 필요함.
15. regression failure를 숨기기 위해 test criterion을 낮춰야 함.

STOP 시 필요한 별도 approval 종류를 정확히 적고 종료한다.

## 10. Package Final

**FIRST PACKAGE = M01 CURRENT-AUTHORITY STORY ALIGNMENT**

현재 planning은 완료됐다.
실제 실행 전 local preflight가 필수다.
