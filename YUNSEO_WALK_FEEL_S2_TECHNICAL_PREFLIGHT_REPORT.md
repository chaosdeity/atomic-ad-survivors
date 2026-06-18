# Yunseo Walk-Feel S2 Technical Preflight Report

Date: 2026-06-18

## Final Verdict

PASS / S2 constrained rig/edit prototype is technically feasible.

This is not an asset-quality PASS. It means the source frames, alpha structure, mask split, pixel-delta QA, and rig/warp workflow are viable enough to proceed to an S2 prototype. The actual walk-feel remains 85% HOLD until a constrained lower-body prototype passes 96px, 64px, 48px, and R01 480x270 QA.

## Scope Confirmation

This preflight was read-only except for this report.

- PNG modification/save: NOT performed
- Image generation: NOT performed
- `.png.import` creation: NOT performed
- Code modification: NOT performed
- `git add`: NOT performed
- commit/push/PR: NOT performed
- Godot active root run: NOT performed

## Source Viability

### Selected Base Frame Candidates

Primary base source: PR #10 refedit walk frames.

Reason:

- Runtime identity was already accepted through PR #10.
- Frames are available in the active project tree.
- They are 796x658 transparent PNGs.
- Alpha bbox and lower-body regions are measurable and suitable for mask/rig preflight.
- Existing refedit walk-feel is HOLD, but identity is a better starting point than W3A/W3A-r2.

Selected primary bases:

- Down base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_01.png`
- Up base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_01.png`
- Left base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_01.png`
- Right base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_01.png`

### Base Metrics

Measured alpha bboxes:

- Down: bbox `(185,60)-(453,620)`, size `268x560`, lower split candidate `y=407`, foot width `80`
- Up: bbox `(197,60)-(439,620)`, size `242x560`, lower split candidate `y=407`, foot width `74`
- Left: bbox `(186,60)-(455,620)`, size `269x560`, lower split candidate `y=407`, foot width `269`
- Right: bbox `(195,60)-(445,620)`, size `250x560`, lower split candidate `y=407`, foot width `250`

Read:

- Down/up have a narrow foot/contact band, which explains weak runtime foot plant.
- Side directions have very wide lower/foot bands, which explains exaggerated stride and silhouette mass.
- All four directions can be masked because the character alpha is compact and separated from the transparent canvas.

### Identity References

Approved action pose 8 are viable as locked identity references only:

- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_01_idle.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_02_scan_low.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_03_cable_hook.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_04_pull_retrieval.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_05_stamp_ready.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_06_reject_stamp.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_07_hurt_interrupted.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_08_retrieval_escape.png`

### Rejected / Negative Sources

S1 rejected output is available for comparison only:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\s1_96px_sprite_first_v01\frames_796\`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s1_96px_sprite_first_v01\frames_96px\`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\s1_96px_sprite_first_v01\qa_sheets\`

W3A and W3A-r2 are available only as negative/variant references:

- W3A: `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\`
- W3A-r2: `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\`

These should not be used as default bases.

## Mask Feasibility

### Locked Region Definition

The following can be represented by coarse masks plus optional manual refinement:

- Head/hair: top identity region inside the alpha bbox
- Torso: upper body and jacket/shirt mass
- Harness: strap/belt area around torso
- Scanner: compact hand/side equipment shape
- Cable: mostly locked, local cleanup only
- Stamp case/equipment: mostly locked, local cleanup only

Recommended coarse locked region for automated prototype:

- For refedit bases with bbox top `y=60` and bottom `y=620`, treat `y=60..406` as locked by default.
- Treat `y=407..620` as editable/lower-body candidate, then subtract equipment/cable/stamp case from editable mask through manual or color/alpha-assisted mask refinement.

### Editable Region Definition

Editable candidate region:

- Legs
- Boots
- Lower cuff/hem edge around legs
- Tiny pelvis shift only if needed for weight transfer
- Tiny shoulder shift only if explicitly flagged and identity delta remains within threshold

Suggested first-pass bounds:

- Down/up editable: bbox x-range with lower split `y>=407`; focus on foot band `y>=519`.
- Left/right editable: lower split `y>=407`; reduce side lower silhouette width by moving leg/boot shapes inward, not by shrinking the whole character.

### Mask Boundary Feasibility

PASS_WITH_WATCH.

The alpha bbox is clean enough for a scripted coarse split, but equipment overlaps and hem/cuff areas require refinement. A purely rectangular lower-body mask is not safe enough because scanner/cable/stamp case can sit near the lower torso and side silhouette. The prototype should start with a coarse lower-body mask, then manually exclude equipment regions.

## Pixel-Delta QA Feasibility

### Delta Calculation

Pixel-delta QA is feasible with PIL/OpenCV:

- Compare generated frame against the selected direction base.
- Apply locked mask and editable mask separately.
- Measure changed pixels by alpha/RGB absolute delta.
- Produce summary score per region and per frame.

### Existing Refedit Delta Finding

Measured refedit frames 02-04 against frame 01 show high delta in upper locked regions:

- Down locked delta: roughly `45%` to `49%`
- Up locked delta: roughly `37%` to `46%`
- Left locked delta: roughly `38%` to `52%`
- Right locked delta: roughly `46%` to `52%`

Interpretation:

- Current refedit frames are not actually locked in the upper body.
- This supports the S2 approach: if locked pixels are held nearly constant while lower-body pixels move, identity stability should improve while walk rhythm is targeted directly.

### Threshold Candidates

Prototype thresholds:

- Head/hair locked delta: `<= 0.5%` changed pixels
- Torso/outfit locked delta: `<= 1.0%`, excluding hem boundary
- Harness/equipment locked delta: `<= 0.75%`
- Scanner/cable/stamp case locked delta: `<= 0.5%`
- Editable lower-body delta: must be meaningfully above locked delta and direction-specific
- Edit-to-lock ratio: target `>= 8:1` after mask refinement

Runtime-scale rhythm scoring candidates:

- 96px: foot contact x/y alternation score, lower silhouette width alternation, planted-foot stability
- 64px: binary lower-body separation score and frame-to-frame rhythm score
- 48px: minimum contact/recovery alternation score

## Rig/Warp Feasibility

### Candidate Method

Use a simple 2D constrained lower-body rig/warp:

- Keep full 796x658 canvas unchanged.
- Define per-direction base anchors:
  - origin `(320,560)`
  - foot contact band around measured lower bbox
  - pelvis pivot near lower split boundary
  - boot/toe/heel control points inside editable mask
- Apply limb-offset or piecewise affine transforms only inside editable mask.
- Composite warped lower-body region back under locked upper-body mask.

### Down/Up Feasibility

PASS_WITH_WATCH.

Down/up can receive larger foot offsets because their current foot width is narrow (`80` down, `74` up). The main risk is creating artificial legs from occluded information. Use rig/warp first for contact spacing, then mask-only edit or manual paint for missing boot/leg pixels.

### Side Feasibility

PASS.

Left/right side lower bands are too wide (`269` left, `250` right). A constrained edit can reduce apparent stride by moving leg/boot contact shapes inward and clarifying front/rear overlap. This is more feasible than down/up because the side frames already expose more leg mass.

### Origin Feasibility

PASS.

Since the full canvas is kept intact and edits are local composites, 796x658 and origin `(320,560)` can be preserved. Anchor QA should ensure planted-foot motion does not create new sliding.

## Tooling Recommendation

### Python PIL/OpenCV

Recommended for:

- PNG/header/alpha inspection
- bbox extraction
- coarse mask generation
- locked/editable region delta
- 96/64/48 preview generation
- contact/rhythm scoring
- QA sheet assembly

### Godot

Not required for first S2 technical prototype.

Use only later in a temp/copy QA project after asset prototype PASS:

- R01 480x270 live movement verification
- action priority return check
- overlay/prompt regression check

### Image Edit Tool

Useful after rig/warp probe:

- Restrict mask to legs/boots/cuff only.
- Do not use whole-character edit.
- Do not allow face/hair/torso/equipment redraw.

### Manual Paint

Expected final cleanup point:

- Boot contact pixels
- Knee/leg overlap clarity
- Hem/cuff seam repair
- 48px lower-body readability polish

## Risk Assessment

### Locked Region Damage

Risk: Medium.

Mitigation:

- Use mask and pixel-delta QA before visual approval.
- Abort any frame with face/hair/torso/equipment delta outside threshold.

### Equipment Misread

Risk: Medium.

Mitigation:

- Exclude scanner/cable/stamp case from editable mask.
- Run equipment read sheet after each edit pass.

### Foot Sliding Persists

Risk: Medium to High.

Mitigation:

- Score planted-foot stability at 96px before 796 packaging.
- Do not rely on S0 bob/contact shadow to hide sliding.

### Mask Seam / Broken Pixels

Risk: Medium.

Mitigation:

- Use feathered edit masks only along lower hem/cuff, not around equipment.
- Manual cleanup after rig/warp.

### 48px Lower-Body Merge

Risk: High.

Mitigation:

- Treat 48px as a HOLD gate, not a late afterthought.
- Increase boot silhouette contrast and separation at 96px before downscaling.

## PASS / HOLD Criteria For S2 Prototype

### PASS

- Base frames load and masks can be built.
- Locked region delta stays within threshold.
- Editable lower-body delta is meaningfully higher than locked delta.
- Down/up foot plant is visible at 96px and acceptable at 64px.
- Side stride becomes more compact and grounded.
- R01 480x270 movement read improves over refedit/S0/S1.
- No equipment misread.
- 796x658 canvas and origin `(320,560)` remain stable.

### HOLD

- Mask separation remains ambiguous around equipment/hem.
- Down/up foot plant still fails after constrained lower-body edit.
- 64px/48px lower body merges.
- Pixel-delta threshold cannot be met without freezing the walk.
- Manual paint requirement becomes too broad and starts to threaten identity consistency.

### REJECT

- Constrained edit cannot produce lower-body rhythm without changing face/torso/equipment.
- Any result reads as new outfit, new body, long coat/trench/variant, oversized gear, weapon, map/tablet, or W3A/W3A-r2-style drift.

## Next Step

Proceed to S2 constrained rig/edit prototype preflight:

1. Build read-only mask specification from the four selected base frames.
2. Define lock/edit masks for each direction.
3. Produce a prototype script plan for bbox, delta, contact score, and QA sheet generation.
4. Stop before PNG editing/saving until prototype execution is explicitly approved.

## Progress

- Yunseo walk-feel polish: 85% HOLD 유지
- S2 constrained rig/edit planning: 20% -> 35% technical preflight
