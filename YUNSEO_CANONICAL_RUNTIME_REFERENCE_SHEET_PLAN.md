# Yunseo Canonical Runtime Reference Sheet Plan

Date: 2026-06-17

Status: `PLAN ONLY`

Input:

- `YUNSEO_RUNTIME_CHARACTER_ASSET_FAMILY_RELOCK_PLAN.md`

Progress:

- `Yunseo character asset family relock 20% -> 30% reference sheet plan`
- `Yunseo walk-feel polish 75% HOLD 유지`

## Goal

Plan a canonical runtime reference sheet for the next Yunseo walk reference/edit pass.

The reference sheet will use the approved Yunseo v06 action pose 8 as the canonical master and current W1/W2 walk frames as the baseline to replace. It will not treat W3A or W3A-r2 as default references.

This step creates the plan only. No image generation, PNG edit/copy, import generation, code change, staging, commit, push, or PR work is allowed.

## Decision Basis

Relock verdict: `A + D`

- `A`: Keep approved Yunseo v06 action pose 8 as canonical master.
- `D`: Preserve W3A/W3A-r2 as variant-only research sources and keep them out of default active integration.

PMO recommendation for this step:

`Create a reference sheet plan that prepares for 16 walk frames to be remade together by reference/edit. Do not change the action 8.`

## Canonical Source List

### Canonical Master: Yunseo v06 Action Pose 8

Use as canonical identity lock and edit reference. Do not modify.

| Role | Exact path | Use |
|---|---|---|
| idle | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_01_hold_v02_cutout_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| scan low | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_02_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| cable hook | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_03_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| pull retrieval | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_04_hold_v02_cutout_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| stamp ready | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_05_hold_v02_cutout_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| reject stamp | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_06_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| hurt interrupted | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_07_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |
| retrieval escape | `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_08_hold_v02_cutout_normalized_draft_v02.png` | `CANONICAL / REFERENCE ONLY` |

Canonical support sheets:

- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_action_sheet_8poses_updated_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_action_sheet_updated_v02_scale_check_96_64_48.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_normalized_scale_check_96_64_48_draft_v02.png`

### Runtime Action Aliases

Use only to cross-check what runtime has been expected to draw. Do not use as the edit master when the normalized canonical source exists.

- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_idle.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_scan.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_hook.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_pull.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_stamp_ready.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_reject_stamp.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_hurt.png`
- `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_p0_v06_pose_escape.png`

### Current Runtime Walk 16: W1/W2 Selected Source Frames

Use as baseline to replace and reference/edit input for locomotion structure. These are not canonical identity masters.

| Direction | Frame | Exact path | Use |
|---|---:|---|---|
| walk down | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_01.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk down | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_02.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk down | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_03.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk down | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_04.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk right | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_01.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk right | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_02.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk right | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_03.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk right | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_04.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk up | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_01.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk up | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_02.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk up | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_03.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk up | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_04.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk left | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_01.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk left | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_02.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk left | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_03.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |
| walk left | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_04.png` | `CURRENT WALK BASELINE / REFERENCE ONLY` |

Runtime alias note:

- Previous runtime alias paths were expected under `C:\workspace\스팀펑크\assets\art_inbox\p0_commercial_runtime_v01\characters\yunseo_walk_*.png`.
- In this workspace snapshot, matching `.png.import` files exist but corresponding walk PNG files were not verified as present.
- Therefore the reference sheet source must use the preserved W1/W2 selected source frames above until a future active-runtime asset audit confirms alias PNG presence.

### W3A Variant-Only Sources

Use for negative comparison only. Do not use as default edit target.

| Direction | Frame | Exact path | Use |
|---|---:|---|---|
| W3A walk down | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_01.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk down | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_02.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk down | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_03.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk down | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_04.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk up | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_01.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk up | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_02.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk up | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_03.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |
| W3A walk up | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_04.png` | `VARIANT ONLY / NEGATIVE COMPARISON` |

### W3A-r2 Variant-Only Sources

Use for negative comparison only. Do not use as default edit target.

| Direction | Frame | Exact path | Use |
|---|---:|---|---|
| W3A-r2 walk down | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_01.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk down | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_02.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk down | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_03.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk down | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_04.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk up | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_01.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk up | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_02.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk up | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_03.png` | `VARIANT ONLY / REJECT COMPARISON` |
| W3A-r2 walk up | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_04.png` | `VARIANT ONLY / REJECT COMPARISON` |

## Use Separation

Allowed for canonical reference:

- v06 action pose 8 normalized source PNGs
- v06 action support sheets
- current W1/W2 selected walk source frames as baseline-to-replace

Allowed for negative comparison only:

- W3A frames
- W3A-r2 frames
- rejected walk candidates
- legacy pre-v06 silhouettes and palette tests

Forbidden as default reference/edit target:

- W3A / W3A-r2
- text-prompt-only new Yunseo
- `p0_2_playable_art_kit` old walk frames as final identity source
- any frame that reads as variant, long coat, trench, or alternate outfit

## Reference Sheet Composition

Planned sheet name for future approved generation:

`yunseo_canonical_runtime_reference_sheet_w4_plan.png`

No sheet is generated in this step.

### Section 1: Action Pose 8 Row

Purpose:

- Establish default Yunseo identity.
- Keep action 8 visually dominant as canonical master.

Layout:

- One row, 8 cells.
- Cell labels: `idle`, `scan`, `hook`, `pull`, `stamp_ready`, `reject`, `hurt`, `escape`.
- Each cell shows origin guide crosshair at `(320,560)`.
- Add compact role tag outside image bounds only; do not draw labels over Yunseo.

### Section 2: Current Walk 16 Row

Purpose:

- Show current W1/W2 baseline walk that needs replacement.
- Identify gait weakness without treating it as identity master.

Layout:

- Four rows or grouped row bands:
  - `walk_down 01-04`
  - `walk_up 01-04`
  - `walk_left 01-04`
  - `walk_right 01-04`
- Use same scale and origin guide as action row.
- Include small note: `baseline to replace`.

### Section 3: Identity Lock Swatches

Purpose:

- Lock the visual DNA before walk edits begin.

Swatches to include:

- face/skin key tones
- hair dark tone
- outfit neutral/dark tone
- dusty ash rose replacement sleeve
- harness/strap dark accent
- scanner/cable metal tone
- stamp/reel accent tone
- shadow/contact tone

Rules:

- Swatches are sampled from approved v06 action poses only.
- Do not sample W3A/W3A-r2 for default swatches.

### Section 4: Face / Hair Silhouette Crop

Purpose:

- Prevent W3A-r2 style/face drift.

Crop source:

- primarily pose 01 idle
- secondary pose 02 scan and pose 07 hurt for alternate angle stress

Gate:

- W4 walk face/head crop must match this family before gait is scored.

### Section 5: Torso / Outfit Crop

Purpose:

- Prevent long-coat/trench/new-outfit drift.

Crop source:

- pose 01 idle
- pose 04 pull retrieval
- pose 05 stamp ready

Gate:

- Fitted utility outfit, trousers, harness, and sleeve remain the same.
- No new outerwear silhouette.

### Section 6: Harness / Equipment Crop

Purpose:

- Lock compact procedural gear layout.

Crop source:

- pose 03 cable hook
- pose 04 pull retrieval
- pose 05 stamp ready
- pose 06 reject stamp

Gate:

- Harness cannot become tactical rig or backpack mass.
- Equipment cannot migrate into a new large frontal/rear block.

### Section 7: Legs / Boots Crop

Purpose:

- Define what may change during walk rework.

Crop source:

- action pose lower-body crops for identity
- current W1/W2 walk lower-body crops for movement problem reference

Allowed edit target:

- boot placement
- cuff/knee/hip shift
- subtle hem/strap sway
- contact/passing frame clarity

Forbidden:

- changing trousers into coat hem
- hiding legs under new garment volume
- creating run pose or mascot bounce

### Section 8: Scanner / Cable / Stamp Case Crop

Purpose:

- Prevent weapon/document/tablet misread.

Crop source:

- pose 02 scan
- pose 03 cable hook
- pose 05 stamp ready
- pose 06 reject stamp

Gate:

- Scanner: compact inspection tool, not firearm.
- Cable: slack/looped/bundled, not whip/laser/spear.
- Stamp case: work case/stamp kit, not tablet/map/document board.

### Section 9: Origin Guide `(320,560)`

Purpose:

- Keep action and walk aligned.

Guide:

- Frame canvas: `796x658`
- Origin: `Vector2(320, 560)`
- Runtime scale: `0.11`
- Foot contact baseline line through origin.
- Optional vertical center guide for body mass drift check.

Gate:

- W4 walk frames must retain stable ground contact and no anchor pop.

### Section 10: Scale Guide 96 / 64 / 48

Purpose:

- Prove identity and walk rhythm survive runtime scale reduction.

Layout:

- Action 8 mini row at 96, 64, 48.
- W4 candidate walk 16 mini rows at 96, 64, 48 in future QA.
- Current W1/W2 row included as baseline.

Gate:

- 48px still reads as default Yunseo.
- No gun/document/cable-weapon misread.

### Section 11: R01 480x270 Preview Block

Purpose:

- Check Yunseo against the actual R01 visual density.

Preview cases:

- walk_down in open-house street / procedure lane
- walk_up near model house threshold
- walk_left near fake return route
- walk_right in suburb corridor
- stationary action pose near prompt/fixture

Gate:

- Default Yunseo identity remains visible.
- Walk does not disappear into floor/background.
- Prompt/toast/fixture does not occlude critical character read.

## Walk Rework Target

Target set:

- `walk_down`: 4 frames
- `walk_up`: 4 frames
- `walk_left`: 4 frames
- `walk_right`: 4 frames

Decision:

`Remake all 16 walk frames in one reference/edit pass.`

Reason:

- Down/up are the most visibly weak, but fixing only down/up already produced W3A-style family drift.
- Side frames have their own stride/tool-density watch items.
- A down/up-only replacement risks side-to-front outfit swaps during direction changes.
- The action 8 are already canonical and must not be changed.

W4 target behavior:

- Better foot contact and body mass transfer.
- Stable origin and ground contact.
- Consistent face/body/outfit/equipment across all directions.
- Same Yunseo as action 8, not a new costume pass.

## PMO Recommendation

Recommended plan:

`Build the canonical reference sheet first, then use it to remake all 16 walk frames by reference/edit.`

Rules:

- Action pose 8 remain locked and unchanged.
- Walk 16 are remade as one family.
- W3A/W3A-r2 remain only as negative comparison/variant evidence.
- S0 bob/timing remains QA comparison only.

Why not down/up only:

- It would leave side frames in a different generation lineage.
- It risks repeating partial replacement drift.
- It may improve gait while damaging direction continuity.

## QA Criteria

### Identity Consistency Sheet

PASS:

- W4 walk 16 match the action 8 face/hair/body/outfit/equipment identity.
- W3A/W3A-r2 differences remain visibly outside default.

HOLD:

- Gait improves but W4 looks like a new costume or new face.

### Action / Walk Family Sheet

PASS:

- Action 8 and W4 walk 16 read as one runtime character family.
- Action-to-walk transition does not look like an outfit or prop swap.

HOLD:

- Any action state returns to a visually different walk identity.

### Direction Consistency Sheet

PASS:

- Down/up/left/right share one outfit, one body scale, one equipment layout.
- Side frames do not look cleaner/newer/older than down/up.

HOLD:

- Down/up pass alone but side frames clash.

### 96 / 64 / 48 Sheet

PASS:

- 96px confirms details.
- 64px confirms equipment and sleeve.
- 48px confirms default Yunseo silhouette and walk rhythm.

HOLD:

- 48px turns scanner into gun, stamp case into tablet/map, or cable into weapon line.

### R01 480x270 Full-Map Sheet

PASS:

- Yunseo reads as the player across representative R01 backgrounds.
- No old survivor/default fallback confusion.
- No fixture/prompt/toast occlusion.

HOLD:

- Character blends into floor/background or looks like a variant at gameplay scale.

### S0 Bob / Timing ON/OFF Sheet

PASS:

- S0 bob/timing improves groundedness without masking identity problems.
- No jitter, float, or puppet bounce.

HOLD:

- Bob is required to hide weak frames or makes identity harder to inspect.

## Forbidden Work

This plan does not authorize:

- text-prompt-only new Yunseo generation
- default Yunseo face/outfit/equipment changes
- W3A or W3A-r2 default integration
- active asset folder copy/overwrite
- `.png.import` creation or modification
- active project import
- `scripts/main.gd` modification
- `scripts/sprite_assets.gd` modification
- Godot active-root execution
- `git add`, commit, push, or PR

## Next Approval Text

Use this only when ready to create the sheet outside active integration:

```text
Yunseo canonical runtime reference sheet W4 준비 작업을 실행해라.

목표:
승인된 Yunseo v06 action pose 8개를 canonical master로 삼고, 현재 W1/W2 walk 16개를 baseline-to-replace로 배치한 reference sheet를 active root 밖에서 생성한다.

포함:
- action pose 8 row
- current walk 16 row
- identity lock swatches
- face/hair silhouette crop
- torso/outfit crop
- harness/equipment crop
- legs/boots crop
- scanner/cable/stamp case crop
- origin guide (320,560)
- scale guide 96/64/48
- R01 480x270 preview block

금지:
- 텍스트 프롬프트 only 신규 윤서 생성
- active asset 폴더 PNG 복사/수정
- .png.import 생성/수정
- code 수정
- W3A/W3A-r2 default 편입
- git add/commit/push/PR
```

## Final Decision

Reference sheet plan status: `PASS / READY FOR SHEET PREP APPROVAL`

Default rework target:

`Action pose 8 locked. Walk 16 전체를 같은 canonical reference/edit pass로 재제작.`
