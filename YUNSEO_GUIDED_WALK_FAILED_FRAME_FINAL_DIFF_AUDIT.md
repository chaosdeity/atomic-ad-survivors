# Yunseo Guided Walk Failed-Frame Final Diff Audit

Date: 2026-06-28

Verdict: HOLD

Progress: Yunseo default walk replacement candidate `75% -> 85% packaging audit`.

Reason for HOLD: the root worktree is not clean enough for exact staging. `scripts/main.gd` and `scripts/sprite_assets.gd` contain the failed-frame edit work, but they also contain previous/unrelated pseudo-socket and S3/S4 reward-memory hunks relative to the current local index. A clean PR should be packaged from an `origin/main` clean worktree and reapply only the failed-frame edit scope.

No git add, commit, push, PR, cleanup, or code edit was performed during this audit.

## Current Git Status Summary

Tracked modified/deleted:

- `AGENTS.md`
- deleted `CORE_LOOP_ONBOARDING_HUD_COMPRESSION_FINAL_DIFF_AUDIT.md`
- deleted `CORE_LOOP_ONBOARDING_HUD_COMPRESSION_IMPLEMENTATION_REPORT.md`
- deleted `CORE_LOOP_ONBOARDING_HUD_COMPRESSION_QA_REPORT.md`
- `scripts/hud_controller.gd`
- `scripts/main.gd`
- `scripts/sprite_assets.gd`

Relevant untracked include candidates:

- `YUNSEO_GUIDED_WALK_FAILED_FRAME_ACTIVE_INTEGRATION_PREFLIGHT.md`
- `YUNSEO_GUIDED_WALK_FAILED_FRAME_IMPORT_ONLY_REPORT.md`
- `YUNSEO_GUIDED_WALK_FAILED_FRAME_CODE_INTEGRATION_REPORT.md`
- `YUNSEO_GUIDED_WALK_FAILED_FRAME_RUNTIME_QA_REPORT.md`
- `assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/`

Out-of-scope clutter exists and must not be staged:

- root cleanup reports
- previous pseudo-socket reports
- unrelated root reports
- unrelated `assets/art_inbox` folders
- `art/`
- `assets/yunseo*`
- `data/yunseo/`
- `docs/archive/`
- `docs/world/`
- unrelated `tools/`
- root cleanup tracked deleted files
- `scripts/hud_controller.gd`

Staged diff: `0`.

## Validation

| Gate | Result | Evidence |
| --- | --- | --- |
| `git diff --check` | PASS | No whitespace errors; line-ending warnings only. |
| Target PNG 16 exists | PASS | `assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01` has 16 PNG files. |
| Target `.png.import` 16 exists | PASS | Target folder has 16 `.png.import` files. |
| Active root `.godot` delta | PASS | No active `.godot` git status delta. |
| `generated_assets` / `exports` delta | PASS | No git status delta. |
| Default walk still OFF | PASS | `PLAYER_USE_YUNSEO_WALK_FRAMES := false` present. |
| Debug flag false | PASS | `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false` present. |
| Controlled runtime only | PASS | Failed-frame draw path is gated by `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG`. |
| `.png.import` add behavior | NEEDS FORCE ADD | `.gitignore:4:*.import` ignores sidecars, so exact `git add -f` is required for 16 `.png.import` files. |

## Diff Scope Finding

Expected failed-frame hunks:

- `scripts/sprite_assets.gd`
  - `YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS`
  - `yunseo_failed_frame_walk_textures`
  - failed-frame load call
  - `draw_yunseo_failed_frame_walk()`
  - `_draw_yunseo_walk_frames()` helper
- `scripts/main.gd`
  - `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`
  - walk frame calculation includes the failed-frame debug flag
  - moving draw branch calls `draw_yunseo_failed_frame_walk()` only when the failed-frame debug flag is true

Out-of-scope hunks currently mixed into the same diff:

- `scripts/main.gd`
  - `YunseoPseudoSocketManifest` preload
  - `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false`
  - `yunseo_pseudo_socket` instance/load path
  - pseudo-socket debug draw branch
  - S3/S4 choice-memory state and HUD/result hooks
- `scripts/sprite_assets.gd`
  - pseudo-socket debug overlay helpers

Because these hunks are mixed with the failed-frame work, exact staging from the current root is risky.

## Expected Include Scope For Clean Packaging

Use a clean `origin/main` worktree and include only:

- 16 PNG:
  - `assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/*.png`
- 16 forced `.png.import`:
  - `assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/*.png.import`
- `scripts/main.gd`
  - failed-frame debug flag and controlled draw branch only
- `scripts/sprite_assets.gd`
  - failed-frame path set/load/draw helper only
- Reports:
  - `YUNSEO_GUIDED_WALK_FAILED_FRAME_ACTIVE_INTEGRATION_PREFLIGHT.md`
  - `YUNSEO_GUIDED_WALK_FAILED_FRAME_IMPORT_ONLY_REPORT.md`
  - `YUNSEO_GUIDED_WALK_FAILED_FRAME_CODE_INTEGRATION_REPORT.md`
  - `YUNSEO_GUIDED_WALK_FAILED_FRAME_RUNTIME_QA_REPORT.md`
  - `YUNSEO_GUIDED_WALK_FAILED_FRAME_FINAL_DIFF_AUDIT.md`

Expected file count if shipped with this audit report:

- 16 PNG
- 16 `.png.import`
- 2 scripts
- 5 reports
- Total: 39 files

If the ship scope excludes this audit report, total becomes 38 files.

## Explicit Exclusions

Do not stage:

- `AGENTS.md`
- `scripts/hud_controller.gd`
- deleted onboarding HUD compression reports
- root cleanup reports
- pseudo-socket previous reports unless separately approved
- QA output folders:
  - `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_20260627`
  - `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627`
- `.godot`
- `generated_assets`
- `exports`
- unrelated `assets/art_inbox` folders
- unrelated `art`, `assets/yunseo*`, `docs/archive`, `docs/world`, `tools`

## Option B Clean Worktree Reapply Plan

Recommended branch:

`codex/yunseo-failed-frame-walk-controlled`

Recommended clean worktree:

`C:\workspace\_codex_yunseo_failed_frame_walk_controlled_clean_pr`

Base:

`origin/main`

Steps:

1. Create clean worktree from `origin/main`.
2. Copy the 16 PNG source files from:
   - `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_failed_frame_edit_v01\`
3. Copy the 16 `.png.import` sidecars into the same target folder.
4. Reapply only the failed-frame hunks to `scripts/sprite_assets.gd`:
   - add `YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS`
   - add `yunseo_failed_frame_walk_textures`
   - load failed-frame set in `load_all()`
   - add `draw_yunseo_failed_frame_walk()`
   - add `_draw_yunseo_walk_frames()` helper while preserving existing `draw_yunseo_walk()` behavior
5. Reapply only the failed-frame hunks to `scripts/main.gd`:
   - add `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`
   - include it in walk-frame calculation
   - branch to `draw_yunseo_failed_frame_walk()` only when the new flag is true
   - keep `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
6. Copy the 5 reports listed in the expected include scope.
7. Verify:
   - staged diff 0 before staging
   - target PNG 16
   - target `.png.import` 16
   - `git diff --check` PASS
   - default walk OFF
   - new debug flag false
   - no pseudo-socket/S3/S4/root cleanup/hud hunks
   - `.godot`, `generated_assets`, `exports` delta 0
8. Run temp/copy runtime QA again from the clean worktree if required before ship.
9. Only after approval, exact stage:
   - normal `git add` for PNG/script/report files
   - exact `git add -f` for the 16 `.png.import` files

## Files Actually Read

- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_ACTIVE_INTEGRATION_PREFLIGHT.md`
  - Evidence: approved target folder, expected delta, default-OFF policy.
- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_IMPORT_ONLY_REPORT.md`
  - Evidence: PNG/import counts and isolated folder.
- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_CODE_INTEGRATION_REPORT.md`
  - Evidence: intended controlled-code integration scope.
- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_RUNTIME_QA_REPORT.md`
  - Evidence: runtime QA PASS and output locations.
- `C:\workspace\스팀펑크\scripts\main.gd`
  - Evidence: current diff contains both failed-frame and unrelated hunks.
- `C:\workspace\스팀펑크\scripts\sprite_assets.gd`
  - Evidence: current diff contains failed-frame hunks plus pseudo-socket helper hunks.
- `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_failed_frame_edit_v01`
  - Evidence: target PNG/import counts.

## Final Recommendation

Do not ship from the current root worktree. Use Option B clean worktree reapply. The implementation and QA are valid, but packaging from the current root would risk staging unrelated root-cleanup, pseudo-socket, S3/S4 reward-memory, HUD, or archive clutter.
