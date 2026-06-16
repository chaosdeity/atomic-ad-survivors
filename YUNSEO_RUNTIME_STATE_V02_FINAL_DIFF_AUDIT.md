# Yunseo Runtime/State v02 Final Diff Audit

Date: 2026-06-16

Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`

Branch: `codex/yunseo-runtime-state-v02`

## Final Verdict

PASS / commit-ready audit.

Progress:

`Yunseo movement animation 97% -> 98% commit-ready audit`

This audit is based on the latest S0 overlay occlusion runtime QA rerun.

## Important Scope Note

PR #8 already merged the Yunseo runtime/state and walk-cycle baseline scope:

- Yunseo action pose PNG 8
- Yunseo action pose `.png.import` 8
- Yunseo walk PNG 16
- Yunseo walk `.png.import` 16
- `scripts/main.gd`
- `scripts/sprite_assets.gd`
- core reports/plans

The current worktree delta is therefore the follow-up S0 overlay completion scope, not a replay of all 61 PR #8 files.

Current commit-ready delta after this audit:

1. `scripts/main.gd`
2. `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md`
3. `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md`
4. `YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md`

Exact current commit file count: `4`.

## Verified Baseline Scope

Tracked baseline assets/code from the merged Yunseo runtime/walk work:

- action pose PNG: `8`
- action pose `.png.import`: `8`
- walk PNG: `16`
- walk `.png.import`: `16`
- code files: `scripts/main.gd`, `scripts/sprite_assets.gd`

Tracked report/plan baseline includes:

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

## Current Git State

Tracked diff before rewriting this audit:

- `scripts/main.gd`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md`

Tracked diff after this audit should be:

- `scripts/main.gd`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md`
- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md`

Staged diff: `0`.

Active `.godot`: absent.

## Recommended Include Scope

Stage exactly these 4 current-delta files:

```text
scripts/main.gd
YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md
YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md
YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md
```

Do not stage the previously merged PNG/import files again unless rebuilding the full PR #8 scope from an older base.

## Force-Add Requirement

Current follow-up commit:

- `.png.import` files changed: `0`
- `.png.import` force-add needed: `0`

Full PR #8 baseline replay only:

- `.png.import` files: `24`
- because `.png.import` is ignored, those would require exact `git add -f -- <path>` if they were not already tracked.

## Exclude Scope

Exclude:

- `YUNSEO_RUNTIME_STATE_V02_COMMIT_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_MERGE_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_PR_FINAL_PMO_REVIEW_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_PR_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_PUSH_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_STAGE_REPORT.md`
- `YUNSEO_RUNTIME_STATE_V02_STAGE_WHITESPACE_FIX_REPORT.md`
- `yunseo_v06_runtime_source_manifest.json`
- `yunseo_v06_walk_import_only_manifest.json`
- `C:\workspace\_codex_yunseo_runtime_state_v02_qa_output`
- `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output`
- `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output`
- `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output`
- `C:\workspace\_codex_yunseo_walk_cycle_assets`
- any temp/copy project folders
- rejected/raw/temp logs outside the report set

## Out-of-Scope Check

Current diff out-of-scope counts:

- `.godot`: `0`
- `generated_assets`: `0`
- `exports`: `0`
- R01 background/fixture PNG: `0`
- external QA output folders: `0`
- W1/W2 source folders: `0`
- manifests: `0`
- unrelated story/world docs: `0`

Out-of-scope verdict: `0 / PASS`.

## Diff Check

`git diff --check`: PASS.

Line-ending warnings may appear for the modified files on Windows, but no whitespace error was reported.

## QA Evidence Summary

Yunseo runtime/state v02:

- runtime/state QA: `PASS_WITH_WATCH`
- Yunseo v06 action poses visible in 480x270 runtime
- existing 48x48 survivor remains fallback only
- texture load error: `0`
- Godot fatal/error: `0`

Walk cycle runtime:

- initial walk runtime QA: functional pass but HOLD due centered banner occlusion
- walk down/right/up/left loop: verified
- action/transient priority: verified
- idle/walk return: verified

S0 overlay occlusion runtime QA rerun:

- final status: `PASS_WITH_WATCH`
- Godot import exit code: `0`
- overlay probe exit code: `0`
- safe toast probe exit code: `0`
- Godot fatal/error: `0`
- texture load error: `0`
- screenshots: `22`
- all screenshots: `480x270`
- central combat banner occlusion: resolved
- `_show_safe_combat_notice()` safe toast: lower-left safe HUD area
- prompt toast retained
- target floater retained
- status ring retained
- walk/action priority retained

Latest QA output:

- `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\results.json`
- `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\yunseo_walk_overlay_s0_runtime_interaction_priority_sheet.png`
- `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\yunseo_walk_overlay_s0_runtime_final_integrated_sheet.png`

## Watch Items

Keep these in PR/merge notes:

- pose 05 `stamp_ready` read
- right/left stride
- 48px tool density
- smaller safe toast feedback readability

## Rollback Criteria

Rollback or HOLD if any of the following appear in stage/QA:

- centered combat banner returns over Yunseo in R01 procedure completion
- safe toast becomes unreadable or blocks Yunseo/fixture centers
- prompt toast conflicts with safe toast
- target floater/status ring disappears
- walk/action priority regresses
- survivor fallback becomes the default player
- texture load error or Godot fatal/error appears
- `.godot`, generated import cache, external QA output, W1/W2 source, manifests, generated assets, exports, R01 background/fixture PNG, or unrelated docs enter the staged set

## Stage Approval Text

Approved for stage-only:

```text
Stage exactly the 4 current-delta files listed in YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md:
scripts/main.gd,
YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md,
YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_QA_REPORT.md,
YUNSEO_RUNTIME_STATE_V02_FINAL_DIFF_AUDIT.md.

Do not stage PNG files, .png.import files, manifests, external QA outputs, temp/copy projects, W1/W2 source folders, .godot, generated_assets, exports, R01 background/fixture PNG, or unrelated story/world docs.
Use exact git add paths only. Do not use git add .
```

## Next Step

Stage-only.
