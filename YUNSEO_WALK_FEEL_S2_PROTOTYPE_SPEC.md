# Yunseo Walk-Feel S2 Prototype Spec

Date: 2026-06-18

## Final Prototype Recommendation

Proceed with an S2 constrained rig/edit prototype, using PR #10 refedit walk frames as identity-stable direction bases and modifying only the lower-body editable regions.

This spec locks the prototype rules before any PNG edit/save step. It does not approve active integration.

Current status:

- Yunseo walk-feel polish: 85% HOLD 유지
- S2 constrained rig/edit planning: 35% -> 45% prototype spec

## 1. Base Frame Selection

Primary source family:

`C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\`

Selected bases:

- Down base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_01.png`
- Up base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_01.png`
- Left base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_01.png`
- Right base: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_01.png`

Base selection reasons:

- These frames are already part of the PR #10 identity-accepted runtime walk family.
- All are 796x658 transparent PNGs.
- Alpha bboxes are compact and measurable.
- They preserve default Yunseo better than W3A/W3A-r2.
- Their walk-feel failure is lower-body rhythm, which is exactly the S2 editable target.

Measured base metrics:

| Direction | Alpha bbox | Bbox size | Lower split | Foot/contact width |
| --- | --- | --- | --- | --- |
| down | `(185,60)-(453,620)` | `268x560` | `y=407` | `80` |
| up | `(197,60)-(439,620)` | `242x560` | `y=407` | `74` |
| left | `(186,60)-(455,620)` | `269x560` | `y=407` | `269` |
| right | `(195,60)-(445,620)` | `250x560` | `y=407` | `250` |

Reference-only sources:

- Approved action pose 8: identity reference only, no edits.
- Current legacy walk folder: fallback/diagnostic only.
- S1 output: rejected comparison only.
- W3A/W3A-r2: negative/variant-only comparison.

## 2. Canvas / Origin / Scale

Locked canvas rule:

- Canvas: `796x658`
- Background: transparent
- Runtime scale: `0.11`
- Origin: `(320,560)`
- Origin pivot shift: 기본 금지

Allowed:

- Local lower-body pixels can move inside the full 796 canvas.
- Planted-foot contact can be adjusted visually inside editable mask.
- Micro pelvis/shoulder visual shifts are allowed only as pixel edits inside the character image, not as runtime origin/pivot changes.

Forbidden:

- Changing canvas size.
- Moving the whole character layer.
- Changing runtime scale.
- Changing origin metadata/path assumptions.
- Solving foot sliding by origin drift.

## 3. Locked Region

### Locked Region Categories

The following regions must remain effectively unchanged from the selected direction base:

- Head/hair
- Face
- Torso
- Jacket/shirt upper mass
- Harness
- Scanner
- Cable
- Stamp/equipment case
- Main upper silhouette

### Coarse Locked Region Bounds

For the first scripted prototype, use this coarse split:

- Character bbox top: `y=60`
- Character bbox bottom: `y=620`
- Locked upper region: `y=60..406`
- Editable lower candidate region: `y=407..620`

Per-direction x bounds should use the selected base bbox:

- Down locked x range: `185..453`
- Up locked x range: `197..439`
- Left locked x range: `186..455`
- Right locked x range: `195..445`

### Locked Pixel Delta Thresholds

Pixel delta should be measured inside explicit locked masks against the direction base.

Recommended changed-pixel thresholds:

- Head/hair: `<= 0.5%`
- Face: `<= 0.25%`
- Torso/jacket/shirt: `<= 1.0%`
- Harness: `<= 0.75%`
- Scanner: `<= 0.5%`
- Cable: `<= 0.5%`
- Stamp/equipment case: `<= 0.5%`
- Full locked region aggregate: `<= 1.0%`

Delta measurement proposal:

- Compare RGBA absolute channel delta.
- Count a pixel as changed when summed RGBA delta is `> 24`.
- Ignore fully transparent pixels outside the base alpha bbox.
- Exclude a 2px feather band around the lower hem/cuff boundary from locked aggregate, but report it separately.

Hard fail:

- Any visible face/hair change.
- Scanner/cable/stamp case silhouette change that affects read.
- Any upper outfit change that creates new costume read.

## 4. Editable Region

### Editable Categories

Allowed editable regions:

- Thighs
- Knees
- Lower legs
- Boots
- Cuff/hem lower edge around legs
- Limited pelvis visual shift
- Limited shoulder counter-shift

### Editable Bounds

Default editable lower region:

- `y=407..620` inside base bbox

Foot/contact band:

- `y=519..620`

Pelvis micro-shift band:

- `y=360..430`
- Allowed only when needed to make weight transfer read.
- Must not alter face, hair, scanner, cable, or stamp case.

Shoulder micro-shift band:

- `y=250..360`
- Default disabled.
- Enable only after lower-body-only prototype fails due weightless side read.
- Max visual shift: `1px at 96px preview scale`, implemented as no more than `6px` at 796 source scale.

### Editable Expected Delta

Expected changed-pixel ranges inside editable mask:

- Down/up contact frames: `8%..22%`
- Down/up passing/recovery frames: `5%..16%`
- Left/right contact frames: `10%..28%`
- Left/right passing/recovery frames: `6%..20%`

Edit-to-lock ratio:

- Target: `>= 8:1`
- Minimum watch threshold: `>= 5:1`
- HOLD below `5:1`, unless visual 96px rhythm clearly passes and locked regions are pristine.

## 5. Direction 4-Frame Edit Targets

All directions keep the same frame semantics:

1. `01_contact`
2. `02_passing`
3. `03_opposite_contact`
4. `04_recovery`

Final frame naming uses numeric suffixes only for compatibility:

- `_01.png` = contact
- `_02.png` = passing
- `_03.png` = opposite contact
- `_04.png` = recovery

## 6. Down / Up Edit Design

### Down

Goals:

- Make left/right foot plant visible at 96px.
- Increase boot separation without widening the whole outfit.
- Show knee/hem alternation.
- Keep head/torso stable.
- Prevent garment from becoming longer, coat-like, or skirt-like.

Numeric targets at 796 source scale:

- Contact foot lateral offset: `18..34px` between dominant boot centers.
- Contact planted boot y stability: max `4px` variation between contact and opposite contact.
- Passing frame foot separation: at least `10px`, so legs do not merge.
- Hem/cuff motion: `4..12px` local shift, lower edge only.
- Torso sway: default `0px`; max `4px` visual pixel shift only if required.

### Up

Goals:

- Make rear boot/heel spacing visible despite reduced face detail.
- Keep rear equipment compact.
- Avoid backpack/long coat read.
- Preserve upper silhouette exactly.

Numeric targets at 796 source scale:

- Contact heel/boot spacing: `16..30px`.
- Opposite contact should mirror or clearly alternate frame 01.
- Passing frame lower-leg overlap must keep at least `8px` visible separation.
- Rear gear bbox may not grow by more than `2px` in any direction.

## 7. Left / Right Edit Design

### Shared Side Goals

- Reduce stride from current refedit side read.
- Clarify front/rear leg overlap.
- Stabilize boot contact.
- Keep side equipment locked.
- Avoid shrinking whole character width as a substitute for leg editing.

Numeric targets at 796 source scale:

- Side lower silhouette width reduction target: `8%..16%` relative to base lower band.
- Max reduction watch threshold: `20%`; above that risks body/scale drift.
- Front/rear boot center spacing: `28..52px`.
- Planted boot y variation between contact frames: max `4px`.
- Head/torso x drift: `0px` preferred, max `3px` visual shift if pelvis counter-shift is enabled.

Direction-specific notes:

- Left: front/rear leg overlap must stay readable against side equipment.
- Right: mirror left rhythm, but scanner/cable/stamp case must not become asymmetrical or weapon-like.

## 8. Contact Shadow Rule

Default S2 asset prototype should be evaluated without contact shadow first.

Allowed optional shadow probe:

- Shape: small soft ellipse
- Width: `22..34px` at 96px preview scale
- Height: `4..7px` at 96px preview scale
- Opacity: `12%..22%`
- Color: neutral dark, no saturated hue
- Offset: centered under planted boot, not under entire character mass

Forbidden:

- Large S0-style shadow that covers or eats boots.
- Shadow required to understand the walk.
- Shadow connected to scanner/cable/equipment.
- Shadow that reads as floor object or UI marker.

FAIL if:

- Shadow obscures foot/boot contact.
- Down/up only read as walking with shadow enabled.
- 48px read gets worse with shadow.

## 9. QA Thresholds

### Locked Region Delta

PASS:

- Face/head/hair: `<= 0.5%`
- Full locked aggregate: `<= 1.0%`
- Equipment locked aggregate: `<= 0.5%`

PASS_WITH_WATCH:

- Full locked aggregate: `1.0%..1.5%`
- Only allowed if all visible changes are boundary anti-aliasing or lower hem edge.

HOLD:

- Full locked aggregate `> 1.5%`
- Any visible face/hair/equipment drift.

### Editable Region Delta

PASS:

- Editable region delta meets direction expected range.
- Edit-to-lock ratio `>= 8:1`.

PASS_WITH_WATCH:

- Edit-to-lock ratio `5:1..8:1` and visual rhythm is clearly improved.

HOLD:

- Editable delta too low to change rhythm.
- Editable delta too high and creates silhouette damage.

### 96px Rhythm PASS

96px PASS requires:

- Contact/opposite contact alternate visibly.
- Down/up foot plant is readable without bob or shadow.
- Passing/recovery are distinct but not noisy.
- Side stride is grounded and not overlong.
- Lower-body rhythm is visible in one static contact sheet and in sequence sheet.

### 64px / 48px Watch Criteria

64px PASS_WITH_WATCH minimum:

- Direction and walk rhythm remain visible.
- Boots do not fully merge into one mass across all frames.

48px PASS_WITH_WATCH minimum:

- At least contact/opposite contact alternation remains visible.
- Side stride does not flicker.
- Down/up does not collapse into a static standing icon.

HOLD:

- 64px or 48px lower body merges completely.
- Rhythm requires runtime bob to be understood.

### R01 480x270 PASS

PASS requires:

- Movement reads better than PR #10 refedit.
- Down/up no longer looks like pure sliding.
- Side no longer reads as overlong stride loop.
- Identity remains default Yunseo.
- Equipment read remains compact.
- Prompt/action/interaction priority is not evaluated in this asset-only prototype, but must be listed for later runtime QA.

### Identity Drift Reject

REJECT if any of these appear:

- New face
- New hair silhouette
- New outfit or changed outfit length
- Long coat/trench/cloak/robe/skirt-like hem
- Oversized backpack or large rear gear
- Scanner reads as gun/rifle
- Stamp case reads as map/tablet/document
- Cable reads as weapon
- W3A/W3A-r2 variant read

## 10. Prototype Output

Output root:

`C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\`

Required structure:

- `frames_796\`
- `frames_96\`
- `masks\`
- `qa_sheets\`
- `results.json`
- `YUNSEO_WALK_FEEL_S2_CONSTRAINED_RIG_EDIT_SELF_QA_REPORT.md`

### frames_796 Naming

- `yunseo_v06_walk_down_s2_rigedit_v01_01.png`
- `yunseo_v06_walk_down_s2_rigedit_v01_02.png`
- `yunseo_v06_walk_down_s2_rigedit_v01_03.png`
- `yunseo_v06_walk_down_s2_rigedit_v01_04.png`
- `yunseo_v06_walk_up_s2_rigedit_v01_01.png`
- `yunseo_v06_walk_up_s2_rigedit_v01_02.png`
- `yunseo_v06_walk_up_s2_rigedit_v01_03.png`
- `yunseo_v06_walk_up_s2_rigedit_v01_04.png`
- `yunseo_v06_walk_left_s2_rigedit_v01_01.png`
- `yunseo_v06_walk_left_s2_rigedit_v01_02.png`
- `yunseo_v06_walk_left_s2_rigedit_v01_03.png`
- `yunseo_v06_walk_left_s2_rigedit_v01_04.png`
- `yunseo_v06_walk_right_s2_rigedit_v01_01.png`
- `yunseo_v06_walk_right_s2_rigedit_v01_02.png`
- `yunseo_v06_walk_right_s2_rigedit_v01_03.png`
- `yunseo_v06_walk_right_s2_rigedit_v01_04.png`

### frames_96 Naming

Use matching names under `frames_96\`.

### masks Naming

Required mask outputs if prototype generation is approved:

- `yunseo_s2_down_lock_mask.png`
- `yunseo_s2_down_edit_mask.png`
- `yunseo_s2_up_lock_mask.png`
- `yunseo_s2_up_edit_mask.png`
- `yunseo_s2_left_lock_mask.png`
- `yunseo_s2_left_edit_mask.png`
- `yunseo_s2_right_lock_mask.png`
- `yunseo_s2_right_edit_mask.png`

Optional debug masks:

- `yunseo_s2_down_equipment_exclusion_mask.png`
- `yunseo_s2_up_equipment_exclusion_mask.png`
- `yunseo_s2_left_equipment_exclusion_mask.png`
- `yunseo_s2_right_equipment_exclusion_mask.png`

### QA Sheets

Required:

- `s2_mask_boundary_check_sheet.png`
- `s2_locked_region_pixel_delta_sheet.png`
- `s2_96px_contact_sheet.png`
- `s2_64_48_rhythm_sheet.png`
- `s2_r01_480x270_movement_sheet.png`
- `s2_direction_transition_sheet.png`
- `s2_equipment_read_sheet.png`
- `s2_contact_shadow_minimal_vs_none_sheet.png`
- `s2_refedit_s0_s1_s2_comparison_sheet.png`

Later runtime QA only, not this prototype:

- `s2_action_priority_return_sheet.png`
- `s2_runtime_prompt_overlay_regression_sheet.png`

## 11. PASS / HOLD / REJECT

### PASS

- Locked region preserved within thresholds.
- Editable lower-body delta meets expected range.
- 96px rhythm PASS.
- 64px rhythm PASS_WITH_WATCH or better.
- 48px rhythm PASS_WITH_WATCH or better.
- R01 480x270 movement read improves over refedit/S0/S1.
- Equipment read remains safe.
- 796x658/origin packaging remains stable.
- Active integration candidate possible, pending separate import/code/runtime QA plan.

### HOLD

- Rhythm improves but not enough at 64px/48px.
- One direction has weak foot plant but identity remains safe.
- Minor mask seam remains around cuff/hem.
- Contact shadow helps but is not required.
- Manual paint cleanup is needed but still limited to lower body.

### REJECT

- Identity drift.
- Locked region damage.
- Equipment damage or misread.
- Foot plant failure across down/up.
- Side stride remains overlong or becomes distorted.
- Mask seam breaks the silhouette.
- Whole-character variant read.

## QA Checklist

Before accepting prototype:

- Source PNGs exist and load.
- Generated 16 frames exist in `frames_796`.
- Generated 16 frames exist in `frames_96`.
- 796 frames are `796x658`.
- Alpha exists.
- Lock/edit masks exist for 4 directions.
- Locked delta report exists.
- Editable delta report exists.
- 96px contact sheet exists.
- 64/48 rhythm sheet exists.
- R01 480x270 movement sheet exists.
- Refedit/S0/S1/S2 comparison sheet exists.
- Equipment read sheet exists.
- No `.png.import` files in output.
- No active project files modified.
- Staged diff remains 0 unless later explicitly approved.

## Approval Text For Next Step

Approved S2 constrained rig/edit prototype execution:

Use the four PR #10 refedit direction base frames, preserve 796x658 canvas and origin `(320,560)`, build lock/edit masks, edit only legs/boots/cuff with optional tiny pelvis/shoulder micro-shift, generate 16 prototype frames plus QA sheets under `C:\workspace\_codex_yunseo_walk_cycle_assets\s2_constrained_rig_edit_v01\`, and stop before active integration/import/code/git work.

## Forbidden Work Confirmation

This spec step did not perform:

- PNG modification/save
- Image generation
- `.png.import` creation
- Code modification
- `git add`
- commit/push/PR
- Godot active root execution
