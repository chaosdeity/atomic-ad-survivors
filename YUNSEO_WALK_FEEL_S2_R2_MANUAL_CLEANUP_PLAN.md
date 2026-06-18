# Yunseo Walk-Feel S2-r2 Manual Lower-Body Cleanup Plan

Date: 2026-06-18

## Final Planning Verdict

S2-r2 manual lower-body cleanup is required and recommended.

S2 v01 proved the core method:

- S2 method: VALID
- Identity / locked region delta: PASS, `0.0%`
- Editable lower-body delta: numeric PASS
- 96px rhythm: PASS_WITH_WATCH
- 64/48 rhythm: HOLD
- R01 480x270: PASS_WITH_WATCH
- Active integration: NO

The blocker is no longer identity drift. The blocker is lower-body readability and cleanup quality: script warp clipped or thinned boots/legs in down/up, and 48px rhythm is still too weak.

Progress:

- Yunseo walk-feel polish: 85% HOLD 유지
- S2 constrained rig/edit: 55% -> 65% r2 cleanup plan

## S2-r2 Goal

Use S2 v01 as the constrained edit scaffold, then manually repair only the lower-body regions.

Goals:

- Preserve head/hair/face/torso/equipment exactly.
- Keep S2 v01 lock/mask discipline.
- Repair cut boots, foot tips, lower-leg gaps, and hem seams.
- Strengthen silhouette so 48px still shows minimum foot rhythm.
- Keep contact shadow OFF by default.
- Avoid new outfit, variant read, or equipment damage.

Non-goals:

- No whole-character redraw.
- No image generation.
- No text-prompt new Yunseo.
- No active runtime integration in this step.

## 1. r2 Source / Base Priority

### Priority 1: S2 v01 Frames

Use S2 v01 `frames_796` as the immediate cleanup base:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\frames_796\yunseo_v06_walk_down_s2_v01_01.png` through `04`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\frames_796\yunseo_v06_walk_up_s2_v01_01.png` through `04`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\frames_796\yunseo_v06_walk_left_s2_v01_01.png` through `04`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\frames_796\yunseo_v06_walk_right_s2_v01_01.png` through `04`

Reason:

- Locked regions already pass at `0.0%`.
- Lower-body movement exists and can be cleaned rather than restarted.
- Output canvas/origin discipline is already aligned.

### Priority 2: S2 v01 Masks

Use S2 v01 masks to keep r2 edits constrained:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_down_lock_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_down_edit_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_up_lock_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_up_edit_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_left_lock_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_left_edit_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_right_lock_mask.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\masks\yunseo_s2_right_edit_mask.png`

Reason:

- Masks are already proven to preserve locked regions.
- r2 must not expand edit scope unless a revised mask is explicitly approved.

### Priority 3: Canonical Refedit Base

Use PR #10 refedit frames only as recovery material for missing lower-body pixels:

- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\`

Allowed uses:

- Recover missing boot/foot pixels.
- Restore natural cuff/hem continuity.
- Compare original foot/leg shape.

Forbidden uses:

- Reintroduce full refedit frame upper-body drift.
- Replace S2 v01 locked upper regions.
- Restore old side stride wholesale.

### Priority 4: Canonical Action / Reference Sheets

Use only as identity/equipment reference:

- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_canonical_action_8pose_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_identity_crop_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_equipment_crop_sheet.png`

## 2. Frame-by-Frame Issue Classification

### Down

| Frame | Current issue | r2 cleanup target |
| --- | --- | --- |
| down 01 | Foot rhythm visible, but contact shape still narrow and lower-body cut edge needs smoothing | Preserve contact, fill boot/toe pixels, smooth hem seam |
| down 02 | Passing pose has thin/fragile leg read at 48px | Add lower-leg thickness, keep foot separation, avoid one-column silhouette |
| down 03 | Most problematic: foot width `37`, reads one-legged/cut at 96px and worse at 48px | Restore opposite contact boot, widen planted foot, repair missing shin/boot edge |
| down 04 | Recovery has weak foot read and seam risk | Add foot tip/heel pixels, clarify lifted vs planted leg |

### Up

| Frame | Current issue | r2 cleanup target |
| --- | --- | --- |
| up 01 | Base contact readable, but rear heel/boot silhouette is small | Preserve, slightly strengthen boot bottom and heel pixels |
| up 02 | Passing frame survives but needs clearer lower-leg separation | Keep stance, separate legs at 48px, smooth hem |
| up 03 | Most problematic: foot width `36`, thin/one-leg read | Rebuild rear/alternate boot silhouette using refedit recovery pixels |
| up 04 | Recovery foot width `59`, acceptable but still weak at 48px | Fill foot contact pixels and clarify cuff/hem edge |

### Left

| Frame | Current issue | r2 cleanup target |
| --- | --- | --- |
| left 01 | Side stride reduced, but boot contact can still read long/flat | Tighten toe/heel contact, preserve side equipment |
| left 02 | Front/rear leg overlap improved but 48px flicker risk remains | Add separation pixels at knees/boots, avoid equipment edits |
| left 03 | Rear leg/boot shape needs clearer contact/recovery read | Strengthen boot angle, avoid overlong stride |
| left 04 | Lowest side foot width in S2 left (`214`), acceptable but needs consistency | Normalize lower silhouette width and repair cuff/hem seam |

### Right

| Frame | Current issue | r2 cleanup target |
| --- | --- | --- |
| right 01 | Side stride constrained, but foot rhythm still subtle at 48px | Add toe/heel contrast and contact pixels |
| right 02 | Center shift can flicker at small scale | Stabilize planted boot, clarify passing leg |
| right 03 | Foot read acceptable but needs natural overlap | Smooth front/rear leg overlap, protect scanner/cable |
| right 04 | Similar to right 01; rhythm could read repetitive | Add recovery distinction without widening stride |

## 3. Manual Cleanup Scope

Allowed cleanup regions:

- Boots
- Foot tips
- Heels
- Lower legs
- Knees
- Cuffs
- Lower hem around legs
- Foot contact pixels
- Tiny local anti-aliasing at lower-body seam

Optional preview-only region:

- Small soft shadow ellipse only for QA comparison, not baked into default frames unless later approved.

Forbidden cleanup regions:

- Face
- Hair
- Head silhouette
- Torso
- Jacket/shirt upper body
- Harness
- Scanner
- Cable
- Stamp/equipment case
- Whole-character scale/origin
- Pelvis/torso redraw

## 4. Cleanup Method

### Step 1: Lock Mask Reapply

- Load S2 v01 frame.
- Load matching S2 lock/edit masks.
- Restore locked pixels from S2 v01 or original selected direction base before any save.
- Any cleanup operation must be clipped to the edit mask.

### Step 2: Missing Boot / Foot Pixel Repair

- Use S2 v01 as primary source.
- Pull lower-body pixels from canonical refedit frame only when the S2 v01 warp created missing boot/foot shapes.
- Reconstruct toe/heel contact with 2-8px local pixel additions at 796 scale.
- Preserve transparent background.

### Step 3: Foot Contact Silhouette Strengthening

- Contact frames should have the clearest planted boot.
- Opposite contact should mirror or clearly alternate foot plant.
- Passing/recovery should keep enough separation to avoid one-column read.
- Do not lengthen garment or create skirt-like hem.

### Step 4: 48px-First Preview Loop

For every manual cleanup batch:

1. Generate 96px preview.
2. Generate 64px preview.
3. Generate 48px preview.
4. Check contact/opposite contact alternation.
5. Only then accept the 796 cleanup.

### Step 5: Shadow Handling

- Default frames remain shadow OFF.
- Optional small ellipse may be generated in QA sheet only.
- Do not use shadow to hide missing foot pixels.
- If shadow eats boots, mark FAIL.

## 5. QA Thresholds

### Locked Region Delta

Must retain S2 thresholds:

- Face: `<= 0.25%`
- Head/hair: `<= 0.5%`
- Torso/jacket/shirt: `<= 1.0%`
- Harness/equipment/scanner/cable/stamp: `<= 0.5%`
- Full locked region aggregate: `<= 1.0%`

Preferred r2 target:

- Locked aggregate remains `0.0%` whenever possible.

### Editable Region Delta

r2 should reduce destructive script-warp artifacts while preserving visible motion.

Expected range:

- Down/up cleanup delta against S2 v01: `2%..12%` inside editable mask
- Left/right cleanup delta against S2 v01: `1%..8%` inside editable mask
- Against original refedit, lower-body delta can remain high because S2 rhythm differs intentionally.

HOLD if:

- Cleanup delta is so low that cut feet remain.
- Cleanup delta is so high that lower body becomes a new drawing style.

### 96px PASS

PASS requires:

- Down/up no longer look cut or one-legged.
- Contact/opposite contact alternate clearly.
- Side stride remains constrained.
- No visible lock/mask seam.

### 64px PASS

PASS requires:

- Direction read stays stable.
- Foot rhythm remains visible.
- Down/up do not collapse into a static pose.
- Side stride does not flicker.

### 48px PASS_WITH_WATCH

Minimum acceptance:

- Contact/opposite contact alternation is visible.
- No cut-foot read.
- Boots do not merge into one unreadable lower blob in every frame.
- Down/up retains some foot rhythm without bob/shadow.

48px full PASS target:

- At least two frames per direction have clearly distinct planted-foot silhouettes.
- Side frames do not read as sliding.

### R01 480x270 PASS

PASS requires:

- Better movement read than S2 v01.
- Better movement read than PR #10 refedit.
- Down/up no longer read as sliding.
- Identity remains default Yunseo.
- Equipment remains compact.

## 6. Output Structure

Output root:

`C:\workspace\_codex_yunseo_walk_cycle_assets\s2_r2_manual_cleanup_v01\`

Required folders:

- `frames_796\`
- `frames_96\`
- `frames_64_48\`
- `masks\`
- `qa_sheets\`
- `results.json`
- `YUNSEO_WALK_FEEL_S2_R2_MANUAL_CLEANUP_SELF_QA_REPORT.md`

### frames_796 Naming

- `yunseo_v06_walk_down_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_up_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_left_s2_r2_v01_01.png` through `04`
- `yunseo_v06_walk_right_s2_r2_v01_01.png` through `04`

### frames_96 Naming

Use matching names under `frames_96\`.

### frames_64_48 Naming

- `64_yunseo_v06_walk_<direction>_s2_r2_v01_<frame>.png`
- `48_yunseo_v06_walk_<direction>_s2_r2_v01_<frame>.png`

### masks

Copy or regenerate lock/edit masks from S2 v01:

- `yunseo_s2_r2_down_lock_mask.png`
- `yunseo_s2_r2_down_edit_mask.png`
- `yunseo_s2_r2_up_lock_mask.png`
- `yunseo_s2_r2_up_edit_mask.png`
- `yunseo_s2_r2_left_lock_mask.png`
- `yunseo_s2_r2_left_edit_mask.png`
- `yunseo_s2_r2_right_lock_mask.png`
- `yunseo_s2_r2_right_edit_mask.png`

## 7. Required QA Sheets

- `s2_r2_contact_sheet_796.png`
- `s2_r2_96px_rhythm_sheet.png`
- `s2_r2_64_48_rhythm_sheet.png`
- `s2_r2_locked_region_delta_sheet.png`
- `s2_r2_editable_delta_sheet.png`
- `s2_r2_mask_boundary_sheet.png`
- `s2_r2_r01_480x270_movement_sheet.png`
- `s2_v01_vs_s2_r2_comparison_sheet.png`
- `s2_r2_refedit_vs_r2_comparison_sheet.png`
- `s2_r2_shadow_off_on_comparison_sheet.png`

## 8. PASS / HOLD / REJECT

### PASS

- Locked region delta PASS.
- No cut foot/boot in 96px.
- 64px rhythm PASS.
- 48px rhythm PASS_WITH_WATCH or better.
- Down/up foot plant improved over S2 v01.
- Side stride remains reduced and naturalized.
- Equipment read safe.
- R01 480x270 improves over S2 v01 and refedit.
- Active integration candidate possible after separate integration plan.

### HOLD

- 48px rhythm still weak.
- Some cuff/hem seam remains.
- One or two frames require additional cleanup.
- Shadow comparison helps but default shadow OFF still weak.
- R01 480x270 is better than S2 v01 but not ship-clear.

### REJECT

- Identity region delta exceeds threshold.
- Equipment/scanner/cable/stamp damage.
- New outfit or variant read.
- Long coat/trench/skirt-like hem read.
- Foot plant still fails in down/up.
- Manual cleanup changes style or body proportions.

## 9. Approval Text

### Manual Cleanup Execution Approval

Approved S2-r2 manual lower-body cleanup execution:

Use S2 v01 frames and masks as the scaffold, keep locked regions unchanged, manually repair only boots/lower legs/cuffs/hem/foot contact pixels, generate 16 cleaned frames and QA sheets under `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_r2_manual_cleanup_v01\`, and stop before active project copy/import/code/git work.

### Active Integration Approval

Not approved in this plan.

Active integration requires a later PASS self QA report, import-only plan, code integration plan, and runtime QA approval.

## 10. Forbidden Work Confirmation

This planning step must not perform and did not perform:

- PNG modification/save
- Image generation
- `.png.import` creation
- Code modification
- Godot active root execution
- `git add`
- commit/push/PR
- Active runtime integration
