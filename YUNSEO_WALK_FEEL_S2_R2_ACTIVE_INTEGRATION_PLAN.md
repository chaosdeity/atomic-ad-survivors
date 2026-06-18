# Yunseo Walk-Feel S2-r2 Active Integration Plan

Date: 2026-06-18

## Final Planning Verdict

Proceed with an active integration plan for S2-r2, but do not integrate yet.

S2-r2 self QA is `PASS_WITH_WATCH` and can move to import/code/runtime QA planning.

Current evidence:

- S2-r2 self QA: PASS_WITH_WATCH
- Active integration candidate: YES
- Locked region delta max: `0.0%`
- Identity drift: none
- Equipment damage: none
- 96px rhythm: PASS
- 64px rhythm: PASS_WITH_WATCH
- 48px rhythm: PASS_WITH_WATCH
- R01 480x270 mock: PASS_WITH_WATCH

Remaining watch:

- Down/up hem seam
- Down/up cleanup delta size
- 48px live runtime rhythm
- Runtime timing and bob/shadow interaction

Progress:

- Yunseo walk-feel polish: 93% -> 95% S2-r2 integration plan
- S2 constrained rig/edit: 80% -> 85% integration plan

## 1. Target Strategy

### Recommendation

Use a new active alias folder.

Recommended target:

`assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/`

Do not overwrite existing walk folders.

### Rationale

- Preserves rollback to PR #10 refedit walk.
- Preserves legacy walk fallback.
- Allows side-by-side import/code/runtime QA.
- Avoids mixing S2-r2 frames with older generated/refedit frames.
- Keeps S2-r2 watch items isolated until runtime QA is complete.

### Fallback Order

Runtime walk source should prefer:

1. S2-r2 walk folder: `assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/`
2. PR #10 refedit folder: `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`
3. Legacy walk folder: `assets/art_inbox/yunseo_runtime_v06_walk/`
4. Existing 48x48 atlas fallback

### Explicitly Forbidden

- Overwrite `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`
- Overwrite `assets/art_inbox/yunseo_runtime_v06_walk/`
- Modify approved action pose 8
- Copy S2-r2 frames directly over old filenames
- Active integration without import-only approval

## 2. Import Plan

### Source

Use S2-r2 cleaned 796 frames:

`C:\workspace\_codex_yunseo_walk_cycle_assets\s2_r2_manual_cleanup_v01\frames_796\`

Expected source frames:

- `yunseo_v06_walk_down_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_up_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_left_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_right_s2_r2_v01_01.png` through `04`

### Target

Target folder:

`C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_s2_r2_v01\`

Target filenames should match source:

- `yunseo_v06_walk_down_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_up_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_left_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_right_s2_r2_v01_01.png` through `04`

### Expected Delta

- Target PNG delta: `+16`
- Target `.png.import` delta: `+16`
- `.godot/imported` committed delta: `0`
- Source output folder `.png.import`: `0`
- Existing refedit folder delta: `0`
- Existing legacy walk folder delta: `0`
- Approved action pose folder delta: `0`

### Import Rules

- Prepare exact alias `.png.import` for the new folder only.
- Do not run broad Godot import.
- Do not run Godot in active root.
- Do not create `.godot/imported` committed files.
- `.png.import` may be ignored by `.gitignore`; stage later with exact `git add -f` only after explicit stage approval.

### Import-Only Validation

Before any code change:

- Source PNG 16 exist.
- Source PNG magic PASS.
- Source size `796x658` PASS.
- Source alpha PASS.
- Target PNG 16 created.
- Target `.png.import` 16 created.
- Source hash equals target hash.
- Existing refedit/legacy/action folders unchanged.
- `.godot/imported` unchanged.
- Staged diff remains 0.

## 3. Code Plan

### `scripts/sprite_assets.gd`

Primary code change candidate.

Required behavior:

- Load S2-r2 walk folder first.
- Fall back to PR #10 refedit walk folder.
- Fall back to legacy walk folder.
- Preserve existing 48x48 atlas fallback.
- Preserve action pose 8 paths.
- Preserve current runtime texture lookup contracts.

Suggested path priority:

1. `assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/yunseo_v06_walk_<direction>_s2_r2_v01_<frame>.png`
2. `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_<direction>_refedit_v01_<frame>.png`
3. `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_<direction>_<frame>.png`
4. Existing atlas fallback

Do not modify:

- Action pose source paths
- Hurt/escape/action priority lookup
- R01 background/fixture assets
- Movement/collision/navigation/reward/cooldown/processing systems

### `scripts/main.gd`

Review only if needed.

Current S0 experimental code exists in this worktree and must be judged separately before committing.

Recommended default for S2-r2:

- Keep walk FPS at `6fps` unless runtime QA proves otherwise.
- Do not rely on bob/shadow to make S2-r2 walk readable.
- Contact shadow should be default OFF or extremely small optional.
- If bob exists, keep it minimal and verify it does not amplify hem seam.
- If contact shadow exists, disable by default for S2-r2 runtime QA or use very small optional comparison only.

Do not change:

- Movement speed
- Collision
- Navigation
- Reward
- Cooldown
- Processing
- Action/transient/hurt/escape priority
- Prompt/toast/floater/status ring logic

### S0 Bob / Contact Shadow Decision

Recommendation:

- Do not include S0 live correction in the same commit unless explicitly approved.
- For runtime QA, compare:
  - S2-r2 walk with bob/shadow OFF
  - S2-r2 walk with minimal bob only
  - S2-r2 walk with very small shadow only if needed
- Default should remain OFF or minimal until live QA passes.

Reason:

- Earlier S0 shadow could eat the feet.
- S2-r2 asset itself now carries the walk read better than S0/refedit.
- Runtime polish should support, not mask, foot rhythm.

## 4. Runtime QA Plan

### QA Method

Use temp/copy Godot QA only.

- Do not run Godot in active root.
- Do not create active `.godot` state.
- Do not create active import delta.
- Mirror/copy only what is needed into a temp QA project.

### Required Runtime Checks

Texture load:

- S2-r2 walk 16 texture load error `0`
- Fallback does not reverse to refedit/legacy unless S2-r2 missing
- Old `player_survivor_48x48_4dir_walk.png` does not become default player

Walk loop:

- `walk_down` 4-frame loop
- `walk_up` 4-frame loop
- `walk_left` 4-frame loop
- `walk_right` 4-frame loop
- Frame index `% 4` correct
- 6fps maintained unless explicitly tested otherwise

Live rhythm:

- Down/up foot plant visible in live movement
- Down/up no sliding read compared with refedit
- Left/right stride remains natural
- 48px-equivalent runtime read remains PASS_WITH_WATCH or better
- Down/up hem seam does not flicker

Priority / interactions:

- Action/transient priority preserved
- Interaction after walk returns correctly
- Pose 05 stamp_ready watch preserved
- Prompt/toast/floater/status ring no regression

S0 interaction:

- Bob OFF baseline
- Minimal bob comparison
- Shadow OFF baseline
- Very small shadow comparison only if needed
- HOLD if shadow eats boots or hides foot rhythm

### Required QA Outputs

Suggested temp QA output folder:

`C:\workspace\_codex_yunseo_runtime_qa\s2_r2_walk_runtime_v01\`

Required sheets:

- `s2_r2_runtime_480x270_live_sequence_sheet.png`
- `s2_r2_down_up_live_rhythm_sheet.png`
- `s2_r2_left_right_stride_sheet.png`
- `s2_r2_direction_transition_sheet.png`
- `s2_r2_action_priority_return_sheet.png`
- `s2_r2_prompt_overlay_regression_sheet.png`
- `s2_r2_bob_shadow_off_on_sheet.png`
- `s2_r2_refedit_vs_runtime_comparison_sheet.png`
- `results.json`
- `YUNSEO_WALK_FEEL_S2_R2_RUNTIME_QA_REPORT.md`

## 5. PASS / HOLD / REJECT Criteria

### PASS

- S2-r2 is used as default runtime walk source.
- Texture load errors `0`.
- Fallback does not reverse.
- Identity remains default Yunseo.
- Equipment remains safe.
- Walk-feel improves over PR #10 refedit in live runtime.
- Down/up foot plant is visible.
- Left/right stride remains controlled.
- 48px-equivalent read remains PASS_WITH_WATCH or better.
- Bob/shadow OFF baseline works, or minimal optional polish does not hide feet.
- Action/interaction priority has no regression.

### HOLD

- 48px/runtime rhythm remains weak.
- Down/up hem seam flickers.
- Cleanup delta creates visual roughness in live movement.
- Bob/shadow conflicts with foot readability.
- S2-r2 improves static sheets but not live runtime.
- One direction needs additional lower-body cleanup.

### REJECT

- Identity damage.
- Equipment/scanner/cable/stamp damage.
- Runtime fallback reverses to refedit/legacy unexpectedly.
- Texture load/import error.
- New outfit or variant read.
- Foot plant fails in down/up.
- Prompt/toast/floater/status ring regression.
- Movement/collision/navigation/reward/cooldown/processing accidentally changed.

## 6. Approval Texts

### Import-Only Approval

Approved S2-r2 import-only:

Copy the 16 S2-r2 `frames_796` PNGs from `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_r2_manual_cleanup_v01\frames_796\` into `assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/`, create exact `.png.import` files for those 16 aliases only, preserve existing refedit/legacy/action folders, do not run broad Godot import, and stop before code changes.

### Code Integration Approval

Approved S2-r2 code integration:

Update `scripts/sprite_assets.gd` so S2-r2 walk paths are preferred, refedit and legacy walk folders remain fallback, and existing 48x48 atlas fallback is preserved. Do not change action pose paths, movement/collision/navigation/reward/cooldown/processing, or action/transient priority. Review `scripts/main.gd` only for S0 bob/shadow handling and keep default shadow OFF or minimal.

### Runtime QA Approval

Approved S2-r2 temp/copy runtime QA:

Run Godot only in a temp/copy QA project, verify S2-r2 16-frame walk loading, live 480x270 rhythm, direction transitions, action priority return, prompt/toast/floater/status ring regression, and bob/shadow OFF/ON comparisons. Do not run Godot in the active root and do not create active import/code/git changes.

### Stage / Commit Approval

Approved S2-r2 stage/commit only after PASS runtime QA:

Stage exact approved scope only: S2-r2 PNG 16, S2-r2 `.png.import` 16 with exact force-add if needed, approved code files, and approved reports. Do not use `git add .`. Commit/push/PR require separate explicit approval.

## 7. Forbidden Work In This Planning Step

This planning step must not perform and did not perform:

- PNG copy/modification
- `.png.import` creation
- Code modification
- Godot execution
- Broad import
- `git add`
- commit/push/PR
- Active runtime integration

## Next Step

Next recommended step:

S2-r2 import-only preflight, then import-only execution if approved.
