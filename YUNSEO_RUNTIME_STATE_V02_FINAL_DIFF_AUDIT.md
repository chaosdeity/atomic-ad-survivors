# Yunseo Runtime/State + Walk Cycle Final Diff Audit

Date: 2026-06-16

Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`

Branch: `codex/yunseo-runtime-state-v02`

## Goal

Lock the exact commit-ready scope for Yunseo runtime/state v02 plus Yunseo v06 walk cycle integration.

Progress:

`Yunseo movement animation 97% -> 98% commit-ready audit`

## Basis

- `YUNSEO_RUNTIME_STATE_V02_INTEGRATION_REPORT.md`
- `YUNSEO_V06_WALK_CYCLE_IMPORT_ONLY_REPORT.md`
- `YUNSEO_V06_WALK_CYCLE_CODE_INTEGRATION_REPORT.md`
- `YUNSEO_V06_WALK_CYCLE_RUNTIME_QA_REPORT.md`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md`

## Current Git Status

Tracked modified:

- `scripts/main.gd`
- `scripts/sprite_assets.gd`

Untracked relevant runtime assets/reports:

- `assets/art_inbox/yunseo_runtime_v06/`
- `assets/art_inbox/yunseo_runtime_v06_walk/`
- Yunseo runtime/state and walk-cycle reports listed below

Untracked local manifests:

- `yunseo_v06_runtime_source_manifest.json`
- `yunseo_v06_walk_import_only_manifest.json`

Staged files:

- `0`

## Commit Include Candidate

Recommended include count: `61`

### Code

Include:

- `scripts/main.gd`
- `scripts/sprite_assets.gd`

Scope:

- Yunseo v06 action pose runtime resolver
- Yunseo v06 walk cycle runtime draw path
- action/transient/prompt > walk > idle priority
- S0 removal of procedure-specific global combat banner

### Yunseo Action Pose PNGs

Include 8 PNG files:

- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_01_idle.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_02_scan_low.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_03_cable_hook.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_04_pull_retrieval.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_05_stamp_ready.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_06_reject_stamp.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_07_hurt_interrupted.png`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_08_retrieval_escape.png`

### Yunseo Action Pose Import Metadata

Include 8 `.png.import` files using forced add because `*.import` is ignored:

- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_01_idle.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_02_scan_low.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_03_cable_hook.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_04_pull_retrieval.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_05_stamp_ready.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_06_reject_stamp.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_07_hurt_interrupted.png.import`
- `assets/art_inbox/yunseo_runtime_v06/yunseo_v06_pose_08_retrieval_escape.png.import`

### Yunseo Walk Cycle PNGs

Include 16 PNG files:

- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_04.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_04.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_04.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_04.png`

### Yunseo Walk Cycle Import Metadata

Include 16 `.png.import` files using forced add because `*.import` is ignored:

- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_04.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_04.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_04.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_04.png.import`

### Core Reports

Include 11 report/planning files:

- `YUNSEO_RUNTIME_STATE_V02_INTEGRATION_REPORT.md`
- `YUNSEO_MOVEMENT_ANIMATION_STATE_MACHINE_AUDIT.md`
- `YUNSEO_V06_WALK_CYCLE_ASSET_PLAN.md`
- `YUNSEO_V06_WALK_CYCLE_GENERATION_PROMPTS.md`
- `YUNSEO_V06_WALK_CYCLE_RUNTIME_INTEGRATION_PLAN.md`
- `YUNSEO_V06_WALK_CYCLE_IMPORT_ONLY_REPORT.md`
- `YUNSEO_V06_WALK_CYCLE_CODE_INTEGRATION_REPORT.md`
- `YUNSEO_V06_WALK_CYCLE_RUNTIME_QA_REPORT.md`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md`

## Commit Exclude Candidate

Exclude:

- `yunseo_v06_runtime_source_manifest.json`
- `yunseo_v06_walk_import_only_manifest.json`
- external QA output folders:
  - `C:\workspace\_codex_yunseo_runtime_state_v02_qa_output`
  - `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output`
  - `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output`
- external generation/source folders:
  - `C:\workspace\_codex_yunseo_walk_cycle_assets\w1`
  - `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework`
  - `C:\workspace\_codex_yunseo_walk_cycle_assets\w2`
  - `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet`
- old worktree artifacts
- rejected/raw/temp logs/contact sheets
- existing unrelated docs such as `YUNSEO_RETURN_STAMP_POLISH_NOTES.md`

Reason:

Runtime commit only needs active alias assets, import metadata, code integration, and core reports. The manifests and external QA/source folders are local provenance/output material and are not required for runtime load.

## Out-of-Scope Audit

R01 background/fixture PNG changes:

- `0`

Collision/navigation/gameplay balance changes:

- `0` intentional changes.
- Spot checks unchanged:
  - `PLAYER_SPEED := 118.0`
  - `PLAYER_RADIUS := 10.0`
  - `_move_speed()` formula unchanged
  - `resolve_player_position(...)` still used
  - `clamp_player_position(...)` still used
  - `procedure_interaction_feedback_timer = 0.45` unchanged
  - `procedure_interaction_feedback_timer = 0.32` unchanged
  - `interaction_processing` lookup unchanged
  - `processing *= 0.55` unchanged
  - walk timing remains `int(player_walk_anim_time * 6.0) % 4`

Godot local/import/export:

- Active `.godot`: absent
- `.godot` status delta: `0`
- `generated_assets` status delta: `0`
- `exports` status delta: `0`
- active broad import not run in this audit

Tracked code diff:

- `scripts/main.gd`: Yunseo runtime/action/walk integration plus S0 procedure banner removal
- `scripts/sprite_assets.gd`: Yunseo action and walk texture path/load/draw helpers

## Diff Check

`git diff --check`: `PASS`

Notes:

- Git reports LF -> CRLF warnings for `scripts/main.gd` and `scripts/sprite_assets.gd`.
- No whitespace errors were reported.
- Staged diff remains `0`.

## .png.import Handling

`.gitignore` ignores `*.import`, so all 24 `.png.import` files must be staged with exact forced adds.

Required:

`git add -f -- <each .png.import path>`

Do not use:

- `git add .`
- broad import/cache staging
- `.godot` staging

## Watch Items For PR

Carry these notes into the PR body:

- `pose 05 stamp_ready`: `PASS_WITH_WATCH`; open case/device silhouette should continue to be watched so it does not read as a map/document/tablet at 480x270.
- right/left walk stride: `PASS_WITH_WATCH`; readable now, but watch for exaggerated stride during continuous play.
- 48px tool density: `PASS_WITH_WATCH`; rose sleeve/reel/tool silhouette survives, but details are dense at small scale.
- smaller feedback readability: `PASS_WITH_WATCH`; central banner occlusion is fixed, and target floater/status ring remain, but completion feedback should be rechecked in dense combat.

## Commit Message Candidate

`Add Yunseo runtime poses and walk cycle`

## Stage Approval Phrase

Recommended next stage-only prompt:

`Stage only the 61 files listed in YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md: Yunseo action pose PNG/import files, Yunseo walk PNG/import files, scripts/main.gd, scripts/sprite_assets.gd, and the 11 core reports. Use exact paths and git add -f only for the .png.import files. Do not stage manifests, QA output folders, generation source folders, .godot, generated_assets, exports, or unrelated docs.`

## Final Judgment

Commit-ready audit: `PASS`

The exact commit scope is locked. No stage, commit, push, PR, file cleanup, Godot run, or import generation was performed by this audit.
