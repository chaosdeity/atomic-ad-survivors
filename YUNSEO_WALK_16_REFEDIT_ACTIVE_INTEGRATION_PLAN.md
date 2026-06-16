# Yunseo Walk16 Reference/Edit Active Integration Plan

Date: 2026-06-17
Worktree: `C:\workspace\스팀펑크`
Status: `PLAN ONLY / NO ACTIVE INTEGRATION`

## Goal

Plan the active runtime integration path for `walk16_reference_edit_v01`, which received `PASS_WITH_WATCH` in self QA.

This document does not authorize PNG copy/modification, `.png.import` generation, code edits, Godot execution, staging, commit, push, or PR work.

Progress:

- Yunseo character asset family relock: `75% -> 80% integration plan`
- Yunseo walk-feel polish: `82% 유지`

## Inputs

- `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\YUNSEO_WALK_16_REFERENCE_EDIT_SELF_QA_REPORT.md`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\results.json`
- `C:\workspace\스팀펑크\YUNSEO_WALK_16_REFERENCE_EDIT_PREFLIGHT_REPORT.md`
- `C:\workspace\스팀펑크\YUNSEO_WALK_16_REFERENCE_EDIT_GENERATION_PROMPTS.md`

## Current Decision State

Self QA verdict: `PASS_WITH_WATCH`

- Identity lock: PASS
- Direction consistency: PASS
- W3A/W3A-r2 variant drift recurrence: PASS / not observed
- Scanner gun-read: PASS / not observed
- Stamp case document/map/tablet read: PASS / not observed
- Cable weapon-read: PASS / not observed
- Active integration candidate: YES_WITH_WATCH

Remaining watch:

- Side stride at live gameplay speed
- 48px rhythm in motion
- Live timing with S0 bob/contact shadow
- Pose 05 `stamp_ready` relationship to return-to-walk

Action pose 8 remain locked and must not be changed.

## Target Strategy Options

### Option 1 - Overwrite Existing Active Walk Targets

Replace the currently active walk PNG targets in place.

Pros:

- Smaller code delta if paths already match active expectations.
- Runtime selection ambiguity is low.

Cons:

- Weak rollback story if PR #8/current walk needs comparison.
- Harder side-by-side QA.
- Higher risk of accidental partial replacement.
- Existing `.png.import` metadata could mask path or cache mistakes.

Decision: not recommended for this pass.

### Option 2 - New Versioned Walk Folder

Copy approved generated frames into a new active-candidate folder, then add exact imports and code/path switch separately.

Recommended folder:

`res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`

Pros:

- Preserves existing PR #8/current walk rollback path.
- Allows side-by-side runtime QA against old walk.
- Makes review diff explicit: +16 PNG and +16 `.png.import`.
- Avoids destructive overwrite of known runtime assets.
- Keeps W3A/W3A-r2 excluded from default path.

Cons:

- Expected `.png.import` delta +16.
- Code must explicitly choose the new folder/path set.
- Potential temporary duplication until final cleanup.

Decision: PMO recommends Option 2.

## PMO Recommendation

Use a new folder first:

`assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`

Do not overwrite existing active walk assets in the first integration pass.

Rationale:

- `walk16_reference_edit_v01` is `PASS_WITH_WATCH`, not unconditional PASS.
- The remaining watch items require side-by-side runtime QA.
- Existing current walk and PR #8 state should remain rollback-safe.
- Integration can be split into import-only, code switch, runtime QA, and commit approval gates.

## Source To Active Alias Mapping

Generated source folder:

`C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\`

Planned active alias folder:

`C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\`

### walk_down

| Source | Planned active alias |
| --- | --- |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_down_refedit_v01_01.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_01.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_down_refedit_v01_02.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_02.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_down_refedit_v01_03.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_03.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_down_refedit_v01_04.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_04.png` |

### walk_up

| Source | Planned active alias |
| --- | --- |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_up_refedit_v01_01.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_01.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_up_refedit_v01_02.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_02.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_up_refedit_v01_03.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_03.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_up_refedit_v01_04.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_04.png` |

### walk_left

| Source | Planned active alias |
| --- | --- |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_left_refedit_v01_01.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_01.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_left_refedit_v01_02.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_02.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_left_refedit_v01_03.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_03.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_left_refedit_v01_04.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_04.png` |

### walk_right

| Source | Planned active alias |
| --- | --- |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_right_refedit_v01_01.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_01.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_right_refedit_v01_02.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_02.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_right_refedit_v01_03.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_03.png` |
| `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\yunseo_v06_walk_right_refedit_v01_04.png` | `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_04.png` |

## Import Plan

Expected file delta after import-only approval:

- PNG delta: +16
- `.png.import` delta: +16
- `.godot/imported` committed delta: 0
- Source output folder `.import`: remain 0

Import constraints:

- Do not run broad Godot import.
- Do not commit `.godot/imported` cache files.
- Prepare import metadata only for exact alias paths.
- Preserve original frame size `796x658`, transparent alpha, origin `(320,560)`, and scale `0.11` assumptions.
- Do not import W3A/W3A-r2 into default runtime path.

Import-only QA:

- Confirm 16 active alias PNG exist.
- Confirm 16 alias `.png.import` exist only after import approval.
- Confirm no `.png.import` appears in `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\`.
- Confirm no `.godot/imported` files are staged.

## Code Plan

Current observed state:

- `scripts/sprite_assets.gd` currently loads `PLAYER_PATH := "res://assets/characters/player/player_survivor_48x48_4dir_walk.png"`.
- `draw_player()` currently assumes a `48x48` atlas with 4 directional rows and frame columns.
- `scripts/main.gd` computes `player_frame := int(elapsed * 6.0) % 2 if player_is_moving else 0`.
- `_player_sprite_row()` maps rows as down `0`, left `1`, right `2`, up `3`.

Candidate code approaches:

### Code Option A - Path Switch To New Atlas

Create an assembled runtime atlas from the 16 alias frames and switch `PLAYER_PATH` to that atlas.

Pros:

- Minimal runtime code churn.
- Existing `draw_player()` contract stays stable.

Cons:

- Requires a separate atlas-generation decision because source frames are `796x658`, while current runtime expects `48x48`.
- May lose the exact 796x658 origin/scale model unless atlas assembly is carefully documented.

### Code Option B - Folder Toggle For 16 Full-Size Frames

Add a player walk source toggle in `scripts/sprite_assets.gd` and load 16 frame textures by direction.

Pros:

- Preserves full generated frame files and exact alias mapping.
- Easier frame-by-frame QA.
- Cleaner rollback between current atlas and refedit v01.

Cons:

- Larger code delta than a simple path switch.
- `draw_player()` must support full-size frame draw with pivot `(320,560)` and scale `0.11`.

PMO recommendation for code: Option B for QA branch, then optionally collapse to an atlas after runtime approval.

Required code guardrails:

- Keep S0 timing/bob/contact shadow/stop-settle candidates unchanged.
- Do not change action/transient priority.
- Do not change attack pose, hurt feedback, charge preview, return stamp behavior, cooldowns, movement speed, collision, navigation, rewards, wave processing, or enemy processing.
- Keep action pose 8 locked.
- Keep `pose_05 stamp_ready` watch active.

## S0 Timing / Bob / Contact Shadow

Maintain the current S0 runtime behavior while testing refedit v01.

- Existing draw contact shadow remains.
- Current moving frame timing is not changed in the integration plan.
- Contact shadow/bob/stop-settle candidates are preserved for separate tuning.
- If visual motion needs timing changes, that must be a separate approval from asset import.

## QA Plan

### QA 1 - Import-Only Verification

- 16 alias PNG exist in `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`.
- 16 alias `.png.import` exist after import approval.
- No `.godot/imported` committed/staged.
- Source output folder still has `.png.import` count 0.
- No active code path points at the new assets yet.

### QA 2 - Temp/Copy Godot Runtime QA

Run only after code integration approval.

- Use a temporary branch/path switch or explicit toggle.
- Load refedit v01 without overwriting existing current walk.
- Capture runtime walk in R01 full-map context.
- Confirm no texture loading warnings.

### QA 3 - 480x270 Full-Map Walk Sheet

- Down/up/left/right, 4 frames each.
- Runtime scale `0.11`.
- Origin `(320,560)`.
- Confirm identity at real map size.

### QA 4 - Direction Transition Sheet

- Down -> left -> up -> right transitions.
- Left/right side stride watch.
- Confirm no outfit/equipment pop.

### QA 5 - Action Priority Return-To-Walk Sheet

- Idle/action/transient state returns to walk.
- Action pose 8 remains canonical.
- Pose 05 `stamp_ready` watch remains.
- No action priority changes allowed in this pass.

### QA 6 - S0 Bob / Shadow ON/OFF Sheet

- Compare contact shadow ON/OFF.
- Compare bob/timing ON/OFF if a toggle exists.
- Confirm generated frames are not relying on bob to hide weak pose art.

### QA 7 - 48px Rhythm Watch

- Export or capture 48px-equivalent sheet.
- Check if contact/passing/opposite/recovery remains readable.
- HOLD if 48px read collapses.

## PASS Criteria

PASS if all are true:

- All 16 integrated frames read as default Yunseo.
- Identity, outfit, harness, scanner, cable, stamp case, and body proportions remain stable.
- W3A/W3A-r2 variant read does not reappear.
- Down/up walk feel improves over current baseline.
- Side stride is acceptable at live movement speed.
- 48px rhythm is `PASS_WITH_WATCH` or better.
- R01 480x270 full-map read is `PASS`.
- No texture/import/runtime loading errors.
- S0 timing/contact shadow remains compatible.

## HOLD Criteria

HOLD if any are true:

- Any frame reads as identity drift, alternate outfit, alternate body, or alternate gear.
- Any frame reads as W3A/W3A-r2 variant.
- Side stride remains overlarge in live timing.
- Down/up still read as sliding.
- 48px rhythm fails.
- Scanner/cable/stamp case reads as weapon, document, map, tablet, or UI board.
- Runtime texture loading fails or falls back.
- Import metadata creates broad or unwanted `.godot/imported` churn.

## Rollback Plan

Preferred rollback with new-folder strategy:

- Revert only the code path/toggle that selects `yunseo_runtime_v06_walk_refedit_v01`.
- Leave existing current runtime walk untouched.
- Remove or ignore new folder assets only if explicitly requested.
- No action pose 8 rollback needed because they remain unchanged.

If overwrite strategy is ever approved later:

- Require backup manifest of all overwritten files.
- Require exact checksum capture before replacement.
- Require one-command restoration plan before copy.

## Approval Gates

### 1. Import-Only Approval

Use this when ready to copy PNGs into the active candidate folder and prepare exact import metadata only.

```text
Yunseo walk16 refedit v01 import-only를 실행해라.
새 폴더 `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`에 generated 16 PNG를 exact alias로 복사하고, alias용 `.png.import`만 준비하라.
code 수정, Godot broad import, `.godot/imported` staged delta, active runtime switch, git add/commit/push/PR은 금지한다.
```

### 2. Code Integration Approval

Use this only after import-only output is reviewed.

```text
Yunseo walk16 refedit v01 code integration을 실행해라.
`scripts/sprite_assets.gd`에 refedit v01 walk source toggle/path switch를 추가하고, full-size frame pivot `(320,560)` + scale `0.11` 또는 승인된 atlas path로만 연결하라.
S0 timing/bob/contact shadow, action/transient priority, movement speed, collision, navigation, reward, cooldown, processing은 변경하지 마라.
git add/commit/push/PR은 금지한다.
```

### 3. Runtime QA Approval

Use this after code integration is complete.

```text
Yunseo walk16 refedit v01 runtime QA를 실행해라.
R01 480x270 full-map, direction transition, action priority return-to-walk, S0 bob/shadow ON/OFF, 48px rhythm, side stride watch를 캡처하고 PASS/HOLD를 판정하라.
active asset 추가 수정, unrelated code 수정, git add/commit/push/PR은 금지한다.
```

### 4. Commit / Stage Approval

Use this only after runtime QA passes.

```text
Yunseo walk16 refedit v01 integration changes를 stage/commit 준비해라.
포함 범위는 승인된 16 PNG, 16 `.png.import`, 필요한 최소 code delta, runtime QA report로 제한하라.
`.godot/imported` cache, source output folder, W3A/W3A-r2, unrelated files는 제외하라.
commit/push/PR은 별도 승인 전까지 하지 마라.
```

## Forbidden Work Confirmation

This planning step did not perform:

- PNG copy
- PNG modification
- `.png.import` generation
- Godot execution
- Code modification
- Active runtime switch
- `git add`
- Commit
- Push
- PR creation

## Final PMO Decision

Recommended path:

1. New folder import-only.
2. Exact alias import metadata only.
3. `scripts/sprite_assets.gd` toggle/path switch in a separate approval.
4. Runtime QA with side stride and 48px rhythm watch.
5. Stage/commit only after PASS or accepted PASS_WITH_WATCH.

Do not overwrite existing active walk assets in the first integration pass.
