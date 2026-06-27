# Yunseo Pseudo-Socket Data Runtime Clean Packaging Audit

Date: 2026-06-27

## Verdict

HOLD.

Yunseo proper walk animator/rig: 85% -> 90% packaging audit.

The implementation itself is QA/debug-only and verified, but the current root worktree is not clean enough for a direct exact ship. `scripts/main.gd` contains pseudo-socket changes mixed with pre-existing S3/S4 reward-memory changes, so the safer ship path is Option B: recreate the pseudo-socket batch from `origin/main` or the intended ship base in a clean worktree/branch.

## Current Git Status Summary

Tracked modified/deleted:

- `D CORE_LOOP_ONBOARDING_HUD_COMPRESSION_FINAL_DIFF_AUDIT.md`
- `D CORE_LOOP_ONBOARDING_HUD_COMPRESSION_IMPLEMENTATION_REPORT.md`
- `D CORE_LOOP_ONBOARDING_HUD_COMPRESSION_QA_REPORT.md`
- `M scripts/hud_controller.gd`
- `M scripts/main.gd`
- `M scripts/sprite_assets.gd`

Relevant untracked pseudo-socket files:

- `data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json`
- `scripts/yunseo_pseudo_socket_manifest.gd`
- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_IMPLEMENTATION_REPORT.md`
- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_QA_REPORT.md`
- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_FINAL_DIFF_AUDIT.md`

There are many unrelated untracked reports, art/source folders, docs/archive files, and world docs in the root workspace. They must stay out of this PR.

## Expected Include Candidate

Clean PR should include only:

- `data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json`
- `scripts/yunseo_pseudo_socket_manifest.gd`
- `scripts/sprite_assets.gd` pseudo-socket debug overlay hunk
- `scripts/main.gd` pseudo-socket-only hunks
- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_IMPLEMENTATION_REPORT.md`
- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_QA_REPORT.md`
- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_FINAL_DIFF_AUDIT.md`
- this audit may be included only if the ship request explicitly asks for packaging audit evidence

## `scripts/main.gd` Mixing Assessment

HOLD risk.

Pseudo-socket hunks in `scripts/main.gd`:

- `YunseoPseudoSocketManifest` preload
- `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false`
- `yunseo_pseudo_socket := YunseoPseudoSocketManifest.new()`
- guarded manifest load in `_ready()`
- `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG` included in walk-frame calculation
- QA/debug-only branch in `_draw_player()`

Pre-existing unrelated hunks in the same file:

- `s3_choice_memory_id`
- `s3_choice_memory_line`
- `s3_choice_memory_hud_seen`
- `_s3_choice_memory_hud_prefix()`
- `_s3_choice_memory_notice()`
- `_apply_s3_choice_memory_result_note()`
- `_s4_choice_feedback_line()`
- supply/reward-choice feedback changes
- objective/HUD memory prefix changes

These are not part of the pseudo-socket runtime integration ship scope.

## `scripts/sprite_assets.gd` Assessment

PASS.

The current diff in `scripts/sprite_assets.gd` is pseudo-socket-only:

- `draw_yunseo_walk_socket_debug`
- `_draw_socket_debug_overlay`
- `_draw_socket_foot`
- `_socket_point`

This file can be included as-is if the clean base has no other local edits.

## Exact Stage Feasibility

Technically possible, but not recommended from this dirty root.

Possible:

- stage all new pseudo-socket files by exact path
- use interactive patch staging for only pseudo-socket hunks in `scripts/main.gd`
- stage `scripts/sprite_assets.gd`

Risk:

- interactive hunk staging in `scripts/main.gd` is error-prone because unrelated reward-memory hunks are adjacent in the same file history
- root has tracked deleted onboarding reports and modified `hud_controller.gd`
- broad untracked report/art/doc clutter increases PR contamination risk

## Recommended Option B Plan

Use a clean worktree/branch and reapply only the pseudo-socket runtime batch.

1. Create a clean worktree from the intended ship base, preferably latest `origin/main`.
2. Create branch: `codex/yunseo-pseudo-socket-debug-runtime`.
3. Copy exact files from the current root or QA evidence:
   - `data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json`
   - `scripts/yunseo_pseudo_socket_manifest.gd`
   - reports listed above
4. Reapply pseudo-socket-only hunks to `scripts/main.gd`:
   - preload
   - debug flag default false
   - loader instance
   - guarded `_ready()` load
   - debug flag in walk-frame calculation
   - debug-only `_draw_player()` branch
5. Reapply pseudo-socket-only hunk to `scripts/sprite_assets.gd`.
6. Run static gates:
   - `rg "PLAYER_USE_YUNSEO_WALK_FRAMES := false|PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false" scripts/main.gd`
   - `git diff --check`
   - staged diff 0 before staging
7. Run temp/copy Godot QA from the clean worktree.
8. Stage exact include paths only.
9. Confirm out-of-scope 0 before commit/PR.

## Cherry-Pick / Patch Feasibility

Patch reapplication is feasible.

Recommended source of truth:

- `scripts/yunseo_pseudo_socket_manifest.gd` can be copied directly.
- `data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json` can be copied directly.
- `scripts/sprite_assets.gd` hunk can be reapplied directly after `draw_yunseo_walk`.
- `scripts/main.gd` hunks should be manually reapplied or extracted into a small patch that excludes all `s3_choice_memory` and supply/reward-memory changes.

Do not use a whole-file copy of `scripts/main.gd` from the dirty root.

## Out-Of-Scope Risks

- tracked deleted onboarding report files
- tracked modified `scripts/hud_controller.gd`
- pre-existing S3/S4 reward-memory hunks in `scripts/main.gd`
- root cleanup reports
- docs/archive changes
- art/source folders
- assets/art_inbox bulk files
- world/story docs
- tools and generated/runtime output folders

## PASS Ship Prompt After Option B

Use only after clean worktree reapplication and QA pass:

```text
Yunseo pseudo-socket QA/debug runtime ship batch를 실행해라.

작업 위치: <clean worktree path>

목표:
QA/debug-only pseudo-socket runtime integration을 exact scope로 stage/commit/push/PR까지 진행한다.

Expected include:
- data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json
- scripts/yunseo_pseudo_socket_manifest.gd
- scripts/main.gd
- scripts/sprite_assets.gd
- YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_IMPLEMENTATION_REPORT.md
- YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_QA_REPORT.md
- YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_FINAL_DIFF_AUDIT.md

Commit message:
Add Yunseo pseudo-socket debug runtime path

PR title:
Add Yunseo pseudo-socket debug runtime path

조건:
- git add . 금지
- exact path stage only
- PLAYER_USE_YUNSEO_WALK_FRAMES := false 유지
- PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false 유지
- PNG/.png.import 0
- movement/collision/navigation 변경 0
- default broken walk exposure 0
- staged diff 검증 후 commit/push/PR
```

## Actions Not Performed

- git add/commit/push/PR not performed.
- code modification not performed during this audit.
- asset/import modification not performed.
- Godot execution not performed.
- local main reset/rebase not performed.
- existing uncommitted changes were not reverted.

## Files Actually Read Or Queried

- `YUNSEO_PSEUDO_SOCKET_DATA_RUNTIME_FINAL_DIFF_AUDIT.md`
- `scripts/main.gd` diff
- `scripts/sprite_assets.gd` diff
- `data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json`
- `scripts/yunseo_pseudo_socket_manifest.gd`
- current git status and name-status output
- report file sizes for pseudo-socket implementation/QA/final diff audit

## Evidence Used

- `git status --short` shows unrelated tracked deleted/modified files and many unrelated untracked files.
- `git diff -- scripts/main.gd` shows pseudo-socket hunks mixed with unrelated S3/S4 reward-memory hunks.
- `git diff -- scripts/sprite_assets.gd` shows a pseudo-socket-only hunk.
- `git diff --numstat` shows `scripts/main.gd` is a large mixed diff: `85` insertions, `7` deletions.
- staged diff remains empty.
