# 68 E01 Implementation PM Decision Sheet V0.1

상태: PM DECISION SHEET
목적: 구현 시작 전에 PM이 실제로 결정해야 하는 항목만 남김
구현 상태: NOT AUTHORIZED

## 0. Already decided by authority — 다시 묻지 않을 것

다음은 문서 근거로 이미 잠겨 있다.

- 첫 implementation handoff는 E01 전체가 아니라 C01 current R01 slice.
- first scope는 R01-L01 + R01-L02.
- R01-L03 boss / R01-L04 / R01-L05는 first scope 제외.
- R08-L01/L02는 C01 first runtime handoff의 필수 범위가 아님.
- 새 Local / 새 graph edge를 first handoff에서 만들지 않음.
- Final Lock 변경 없음.
- Production Entry 변경 없음.
- fixed-time 70/88/108/240 legacy behavior를 current RPG progression으로 복구하지 않음.
- actual Unreal implementation은 이번 audit에서 0.
- main 변경 금지.

## 1. Decision 01 — C01 R01-L01/L02 alignment를 시작할지

PM 선택:
- APPROVE START
- HOLD

승인 대상은 65_E01_FIRST_IMPLEMENTATION_HANDOFF_PACKAGE_V0_1.md의 bounded scope다.

## 2. Decision 02 — exact implementation file/code scope

PM이 허용할 파일 범위를 명시해야 한다.

현재 Unreal authority가 실제 경로로 기록한 후보:
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Private/AASPlaytestRuntimeClasses.cpp
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestRuntimeClasses.h
- unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestProgressSaveGame.h
- unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg34.py
- unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg35.py
- unreal/AtomicAdSurvivorsUE/Run-R01RPG34.ps1
- unreal/AtomicAdSurvivorsUE/Run-R01RPG35.ps1

주의:
- rpg35 authority는 당시 runtime source들이 Git repository에서 untracked였다고 기록한다.
- 따라서 실제 worker 시작 전에 선택한 base runtime의 현재 working-tree 존재/상태를 로컬에서 확인해야 한다.
- PM 허용 범위 밖의 world/graph/Production Entry/Final Lock 파일은 수정하지 않는다.

PM 기록:
- ALLOWED FILES:
- ALLOWED MAP/ASSET RANGE:
- ALLOWED QA/DOC RANGE:
- FORBIDDEN OUTSIDE RANGE:

## 3. Decision 03 — base runtime

선택:
- RPG34
- RPG35

현재 evidence:
- RPG34: R01-L01 첫 의뢰의 current RPG foundation.
- RPG35: RPG34 첫 의뢰를 유지하면서 R01-L02 후속 의뢰와 28/28 follow-up gate, 37/37 first-quest regression을 기록.

이 문서는 PM 대신 선택하지 않는다.

## 4. Decision 04 — alignment strategy

선택:
- PRESERVE EXISTING + NEW ALIGNMENT MODE
- CANONICALIZE CURRENT MODE

고려할 차이:
- Preserve 전략은 현재 verified RPG34/RPG35 비교 근거를 직접 보존하기 쉽다.
- Canonicalize 전략은 mode duplication을 줄일 수 있지만 rollback과 save/runtime 회귀 gate가 더 엄격해야 한다.

어느 쪽이든:
- save wipe 금지.
- legacy timer behavior를 current progression으로 복구 금지.
- rollback boundary 유지.

## 5. Decision 05 — R01-L03 expansion

first alignment QA가 통과한 뒤 별도 결정:

- APPROVE R01-L03 SPEC / IMPLEMENTATION PREP
- HOLD R01-L03

현재 미확정:
- exact quest number.
- current boss implementation.
- canonical boss runtime behavior.

따라서 R01-L03는 first implementation scope에 포함하지 않는다.

## 6. Gate effect

Decision 01~04에 PM의 명시 승인과 exact scope가 없으면:

GATE D = NOT AUTHORIZED

Decision 05는 first handoff 완료 뒤 다음 확장 gate다.

## 7. PM-only concise record

1. C01 L01/L02 alignment start: [APPROVE / HOLD]
2. Exact allowed files/range: [PM INPUT]
3. Base runtime: [RPG34 / RPG35]
4. Strategy: [PRESERVE+NEW MODE / CANONICALIZE CURRENT]
5. R01-L03 after QA: [APPROVE NEXT / HOLD]

최종 현재 상태:
PM DECISION REQUIRED FOR GATE D ONLY.
