# 69 E01 Implementation Gate D PM Approval V0.1

상태: **PM APPROVED / BOUNDED IMPLEMENTATION AUTHORIZATION**

대상: E01_C01 current R01 slice alignment
기준 브랜치: `chatgpt-work`
기준 Production Design HEAD: `81b06fc310e8dac32dfed8eced38e7555bda1f86`

## 0. PM Verdict

Gate D를 **제한적으로 승인**한다.

승인 대상은 `65_E01_FIRST_IMPLEMENTATION_HANDOFF_PACKAGE_V0_1.md`의 bounded scope인:

- R01-L01
- R01-L02
- current quest / exploration / finite combat / investigation / choice / voluntary return / report-growth / revisit
- current persistence behavior
- validated R01-L01 → R01-L02 relation

뿐이다.

E01 전체 구현 승인이 아니다.

## 1. Decision 01 — Start

**APPROVE START**

C01 R01-L01/L02 canonical alignment 구현을 시작한다.

구현 목표는 신규 콘텐츠 확장이 아니라 현재 RPG34/RPG35 runtime을 E01_C01 Production Entry의 residential-role semantics에 정렬하는 것이다.

## 2. Decision 02 — Exact Write Scope

### WRITE ALLOWED

실제 로컬 preflight에서 존재를 확인한 뒤 다음 범위만 수정 가능하다.

1. `unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Private/AASPlaytestRuntimeClasses.cpp`
2. `unreal/AtomicAdSurvivorsUE/Plugins/AASPlaytestRuntime/Source/AASPlaytestRuntime/Public/AASPlaytestRuntimeClasses.h`
3. `unreal/AtomicAdSurvivorsUE/Content/Python/build_r01_rpg35.py`
4. `unreal/AtomicAdSurvivorsUE/Run-R01RPG35.ps1`
5. 신규 구현 기록 문서 1개: `docs/unreal/r01_c01_canonical_alignment_20260919.md`
6. 실패가 실제 발생한 경우에 한해 `docs/failure-ledger.md` append-only

### READ-ONLY / PM REAPPROVAL REQUIRED

- `AASPlaytestProgressSaveGame.h`

현재 저장 필드로 canonical alignment가 불가능하고 save field 추가/변경 또는 migration이 필요하면 구현을 멈추고 **SAVE_SCHEMA_REAPPROVAL_REQUIRED**로 보고한다.

### ALLOWED MAP / ASSET RANGE

기본값: **NO MAP / ASSET MODIFICATION**

RPG35 existing map/package, asset, geometry, material, camera, imported content는 이번 alignment 범위에서 수정하지 않는다.

canonical alignment가 map/asset 변경 없이는 불가능하다고 판단되면 구현을 확대하지 말고 HOLD 보고한다.

### ALLOWED QA OUTPUT

- 기존 RPG34/RPG35 probe/capture 방식의 좁은 재검증
- 고유한 테스트/캡처 슬롯
- `Saved/`, `Saved/Logs/`, 기존 AssetPipeline의 alignment evidence 폴더 등 비정사 QA 출력
- 1920×1080 실제 렌더 evidence

### FORBIDDEN OUTSIDE RANGE

- Final Lock / Production Entry / Common Graph 수정
- R01-L03/L04/L05
- R08 mandatory integration
- C02~C08 구현
- 새 Local / 새 graph edge
- Relay / Beacon / Recovery assignment
- map/asset topology 수정
- save wipe
- save schema/migration
- main write/merge/push
- 외부 구매/다운로드
- legacy 70/88/108/240 timer behavior 복구
- main auto-fire 복구

## 3. Decision 03 — Base Runtime

**RPG35**

이유:

- RPG35는 RPG34 첫 의뢰를 유지한다.
- R01-L02 후속 의뢰가 이미 존재한다.
- first-quest regression 37/37이 기록되어 있다.
- follow-up gate 28/28이 기록되어 있다.
- R01-L01 → R01-L02 정상 속도 이동 증거가 있다.

RPG34는 삭제/수정 대상이 아니라 **회귀 및 rollback reference**로 보존한다.

## 4. Decision 04 — Alignment Strategy

**CANONICALIZE CURRENT RPG35 MODE**

새 RPG36 / 별도 alignment mode를 만들지 않는다.

이유:

- 신규 mode proliferation을 막는다.
- RPG35가 이미 L01+L02 current slice를 포함한다.
- canonicalization의 목적은 콘텐츠 복제가 아니라 semantic/runtime alignment다.

단 rollback을 위해 작업 전 허용 파일의 현재 hash와 상태를 기록하고, RPG34/RPG35 기존 evidence를 보존한다.

기존 RPG34 mode는 수정하지 않는다.

## 5. Required Alignment

구현은 최소 다음을 명시적으로 맞춘다.

- registered household/occupancy/recipient/guardian claim과 verified reality를 구분
- RPG34/RPG35의 현재 record/checkpoint/choice state를 E01_C01 canonical meaning에 연결
- Direct Memory와 단순 UI/등록 claim을 혼동하지 않음
- L01 first quest → return/report/growth → L02 follow-up 의미 유지
- incomplete voluntary return persistence 유지
- report/growth one-time 유지
- fixed-time survival behavior 재유입 금지
- combat이 investigation/progression을 대체하지 않음

## 6. QA Gate

최소 PASS:

1. build success
2. 300초 이후 forced extraction 없음
3. safe hub combat 없음
4. finite place-bound combat
5. LMB hold/release attack contract
6. incomplete voluntary return persistence
7. cold reload persistence
8. record/checkpoint/choice 독립 보존
9. report/growth one-time
10. save-failure rollback
11. R01-L01 → R01-L02 normal-speed swept movement
12. R01-L02 three records + optional clue persistence
13. 1920×1080 quest/investigation/report/revisit UI readability
14. RPG34 regression reference 보존
15. legacy timer / main auto-fire canonical mode 재유입 0

자동 QA는 재미/최종 아트 승인이 아니다.

## 7. Decision 05 — R01-L03

**HOLD IMPLEMENTATION**

첫 alignment QA가 PASS해도 R01-L03 구현을 자동 시작하지 않는다.

R01-L03는 다음 조건 뒤 별도 PM gate로 둔다.

- L01/L02 canonical alignment QA PASS
- 정상 속도 current slice 검토 가능
- exact quest placement / boss runtime contract 별도 spec

다음 단계에서는 필요 시 **R01-L03 SPEC/PREP**만 승인할 수 있으며, boss 구현은 별도 승인이다.

## 8. Source Control Boundary

현재 authority는 일부 Unreal runtime source가 과거 Git 저장소에서 untracked였다고 기록한다.

따라서 이번 구현 작업자는:

- 작업 시작 전 각 허용 파일의 존재 / tracked 여부 / hash를 기록
- untracked 파일을 임의로 Git add하지 않음
- main commit/push 금지
- 구현 완료를 Git diff만으로 증명하지 않음
- 실제 파일 diff/hash + 빌드/런타임 evidence로 보고

한다.

## 9. Gate D Result

Gate A: PASS
Gate B: PARTIAL
Gate C: PARTIAL
Gate D: **AUTHORIZED_BOUNDED**

최종 상태:

**C01 R01-L01/L02 CANONICAL ALIGNMENT IMPLEMENTATION AUTHORIZED**

범위 밖 작업은 승인되지 않았다.
