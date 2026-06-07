# R01 B Prop Size Stage/Commit Plan

Date: 2026-06-07

Decision: **PLAN ONLY / NO STAGE / NO COMMIT / NO PUSH**

The R01 B production fixture active import/replacement scope is already **100% LOCKED**. This document separates the files that should be considered for a future git stage/commit from files and folders that must remain excluded.

## 1. Current Lock State

| Scope | Status |
| --- | --- |
| visual-only R01 scale/helper | 100% LOCK |
| active import/replacement | 100% LOCK |
| import-only | PASS |
| helper replacement | PASS |
| active final visual QA | PASS |
| collision/navigation active rework | PASS |
| gameplay/runtime integration QA | PASS |
| cleanup/fallback removal | separate track, not included |

## 2. Include Candidates

These are the only R01 production fixture files that should be considered for the future stage command.

### Active production fixture alias assets

Include the active fixture alias folder, verified to contain exactly 7 PNG aliases and 7 alias `.png.import` files:

| File | Size |
| --- | ---: |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png` | 1,358,629 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png.import` | 1,024 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png` | 1,842,348 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png.import` | 1,030 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png` | 1,247,016 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png.import` | 1,030 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png` | 1,078,040 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png.import` | 1,021 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png` | 1,477,229 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png.import` | 1,051 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png` | 1,131,314 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png.import` | 1,035 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png` | 473,166 bytes |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png.import` | 1,021 bytes |

Total PNG payload: **8,607,742 bytes**.

### Active scripts

| File | Git state | Stage decision |
| --- | --- | --- |
| `scripts/r01_layout_blockout.gd` | tracked modified | include |
| `scripts/r01_production_fixture_visuals.gd` | untracked active file | include |
| `scripts/r01_station_fixture_collision_overrides.gd` | untracked active file | include |
| `scripts/r01_procedure_station_visuals.gd` | untracked active file | include, fallback helper preserved |

### `.godot/imported` cache

`git ls-files -- .godot/imported` returned no tracked cache files, and no fixture `.ctex` cache entries were tracked.

Stage decision: **do not stage `.godot/imported` cache** unless the project git policy is separately changed or a reviewer explicitly requests tracked Godot import cache. The 100% LOCK reports preserve required cache behavior, but current git evidence shows the cache is not a tracked commit target.

### Final lock / handoff / report documents

Core report files to include:

| File | Reason |
| --- | --- |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md` | final 100% LOCK handoff |
| `R01_B_PROP_SIZE_GAMEPLAY_RUNTIME_INTEGRATION_QA_REPORT.md` | runtime QA PASS evidence |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_ACTIVE_IMPLEMENTATION_REPORT.md` | collision/navigation active rework PASS evidence |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_95_PERCENT_HANDOFF.md` | 95% lock baseline |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_85_PERCENT_HANDOFF.md` | 85% lock baseline |
| `R01_B_PROP_SIZE_ACTIVE_FINAL_VISUAL_QA_REPORT.md` | final active visual QA evidence |
| `R01_B_PROP_SIZE_CLEANUP_FALLBACK_DECISION_PLAN.md` | cleanup/fallback decision boundary |
| `R01_B_PROP_SIZE_CLEANUP_EXACT_TARGET_LIST.md` | cleanup exact target boundary |
| `R01_B_PROP_SIZE_CLEANUP_DELETE_CANDIDATES_EXECUTION_REPORT.md` | approved cleanup execution result |
| `R01_B_PROP_SIZE_STAGE_COMMIT_PLAN.md` | this stage/commit plan |

Optional supporting plan/report files may be included if the commit is intended to preserve the full PMO audit trail:

| File | Reason |
| --- | --- |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_QA_PLAN.md` | collision/navigation QA plan |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_QA_EXECUTION_REPORT.md` | initial collision/navigation HOLD evidence |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_REWORK_PLAN.md` | rework plan from 12 mismatches |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_REWORK_COPY_QA_REPORT.md` | temp/copy rework PASS evidence |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_ACTIVE_IMPLEMENTATION_PLAN.md` | active implementation plan |
| `R01_B_PROP_SIZE_GAMEPLAY_RUNTIME_INTEGRATION_PLAN.md` | runtime QA plan |

## 3. Exclude Candidates

Do not stage the following:

| Path / category | Decision |
| --- | --- |
| `C:/workspace/_codex_r01*` external QA output folders | exclude from git |
| archive recommended output folders | exclude unless separately approved for archival import |
| needs review folders | exclude |
| source batch folders outside active project | exclude |
| temp/copy project remnants | exclude |
| external artifacts except active workspace cleanup execution report | exclude |
| `.godot/imported` cache | exclude under current git tracking policy |
| unrelated tracked modified world/story/design docs | exclude from this R01 fixture commit |
| unrelated untracked active files/assets/tools | exclude |
| fallback helper removal or cleanup changes | not part of this commit |

Observed remaining external `C:/workspace/_codex_r01*` folders should remain outside this commit scope, including active QA outputs, collision/navigation output archives, gameplay runtime QA output archives, helper replacement QA projects, production fixture batch folders, and final replacement QA folders.

## 4. Git Status Review

| Check | Finding | Stage implication |
| --- | --- | --- |
| tracked modified | `scripts/r01_layout_blockout.gd` is relevant; many unrelated tracked files are also modified | stage only exact relevant file |
| untracked active files | fixture asset folder and three R01 scripts are untracked | stage only exact include candidates |
| large asset files | 7 PNG alias files total 8,607,742 bytes | acceptable include candidate; review before stage |
| `.godot/imported` tracking | no `.godot/imported` files tracked by `git ls-files` | do not stage cache |
| external paths in git | `C:/workspace/_codex_r01*` folders are outside active repo | do not copy or stage external outputs |
| cached/staged state | no staged files at plan time | no stage performed |

## 5. Proposed Stage Scope

The future stage command should be exact and narrow. Do not use `git add .`, broad workspace adds, or wildcard cleanup/stage patterns.

Recommended exact stage scope:

```powershell
git add -- `
  assets/art_inbox/r01_production_fixtures_v01 `
  scripts/r01_layout_blockout.gd `
  scripts/r01_procedure_station_visuals.gd `
  scripts/r01_production_fixture_visuals.gd `
  scripts/r01_station_fixture_collision_overrides.gd `
  R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md `
  R01_B_PROP_SIZE_GAMEPLAY_RUNTIME_INTEGRATION_QA_REPORT.md `
  R01_B_PROP_SIZE_COLLISION_NAVIGATION_ACTIVE_IMPLEMENTATION_REPORT.md `
  R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_95_PERCENT_HANDOFF.md `
  R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_85_PERCENT_HANDOFF.md `
  R01_B_PROP_SIZE_ACTIVE_FINAL_VISUAL_QA_REPORT.md `
  R01_B_PROP_SIZE_CLEANUP_FALLBACK_DECISION_PLAN.md `
  R01_B_PROP_SIZE_CLEANUP_EXACT_TARGET_LIST.md `
  R01_B_PROP_SIZE_CLEANUP_DELETE_CANDIDATES_EXECUTION_REPORT.md `
  R01_B_PROP_SIZE_STAGE_COMMIT_PLAN.md
```

If the full PMO audit trail is desired, append the optional supporting plan/report files listed above after explicit approval.

## 6. Commit Candidate

Recommended commit title:

```text
R01 production fixtures and station collision overrides
```

Recommended commit body:

```text
- Add R01 production fixture alias textures and imports
- Add production fixture visual helper and station collision overrides
- Bridge fixture texture/collision paths through R01 layout blockout
- Preserve fallback procedure station helper
- Document visual, collision/navigation, runtime QA, cleanup boundaries, and 100% lock state
```

## 7. Forbidden For This Step

- No git stage.
- No commit.
- No push.
- No cleanup execution.
- No fallback helper removal.
- No broad file add.
- No `.godot/imported` cache staging under current policy.
- No source batch folder staging.
- No external QA output folder staging.

## 8. Next Approval Wording

Stage approval:

```text
승인: R01_B_PROP_SIZE_STAGE_COMMIT_PLAN.md의 recommended exact stage scope만 git stage 해라. git add . / broad file add / external output staging은 금지한다.
```

Commit approval:

```text
승인: 현재 staged 변경만 `R01 production fixtures and station collision overrides` 메시지로 commit 해라. 추가 stage는 하지 마라.
```

Push approval:

```text
승인: 방금 생성한 R01 production fixture commit을 현재 브랜치 remote로 push 해라. push 전 staged/commit 상태를 다시 확인해라.
```

Push approval is separate from stage and commit approval.

## 9. Evidence Used

| Evidence | Use |
| --- | --- |
| `git status --short` | identified relevant tracked/untracked files and unrelated dirty worktree entries |
| `git ls-files -- .godot/imported` | confirmed `.godot/imported` cache is not tracked |
| `git ls-files -- .godot/imported/*r01_fixture*.ctex` | confirmed fixture cache is not tracked |
| `git ls-files -- assets/art_inbox/r01_production_fixtures_v01 scripts/r01_production_fixture_visuals.gd scripts/r01_station_fixture_collision_overrides.gd scripts/r01_procedure_station_visuals.gd scripts/r01_layout_blockout.gd` | confirmed only `scripts/r01_layout_blockout.gd` is tracked among active implementation files |
| `Get-ChildItem assets/art_inbox/r01_production_fixtures_v01` | verified 7 PNG aliases, 7 `.png.import` files, and asset sizes |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md` | confirmed 100% LOCK and PASS state |
| `R01_B_PROP_SIZE_CLEANUP_EXACT_TARGET_LIST.md` | confirmed preserve/exclude boundaries |
| `R01_B_PROP_SIZE_CLEANUP_DELETE_CANDIDATES_EXECUTION_REPORT.md` | confirmed cleanup PASS, count gate unchanged, no stage/commit performed |

## 10. Final Plan Decision

PASS for stage/commit planning.

Active import/replacement remains **100% LOCKED**. This document authorizes no git action by itself; it only defines the future stage/commit scope for separate user approval.
