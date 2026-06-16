# Yunseo Walk 16 Reference/Edit Generation Prompts

Date: 2026-06-17

Status: `PROMPT LOCK / NO GENERATION`

Progress:

- `Yunseo character asset family relock 45% -> 55% reference/edit prompt lock`
- `Yunseo walk-feel polish 75% HOLD 유지`

## Goal

Define the reference/edit prompt package for remaking Yunseo default walk 16 frames while preserving the approved Yunseo v06 runtime identity.

This document does not authorize image generation, PNG edits/copies, `.png.import` generation, code changes, Godot execution, staging, commit, push, or PR work.

The next generation step must be reference/edit only. Text-only new Yunseo generation is forbidden.

## Identity Priority

Hard rule:

`identity lock beats walk-feel`

If a frame walks better but reads as a different Yunseo, different outfit, different face/body, different gear set, W3A-like variant, or W3A-r2-like style drift, it is not a default candidate.

Action pose 8 remain locked and must not be edited.

## Canonical Reference Inputs

Use these reference sheets as required visual inputs for every direction pass:

- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_canonical_action_8pose_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_action_walk_family_comparison_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_identity_crop_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_equipment_crop_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_origin_scale_guide_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_96_64_48_scale_reference_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_r01_480x270_reference_preview_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\YUNSEO_CANONICAL_RUNTIME_REFERENCE_SHEET_AUDIT.md`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\results.json`

Canonical action source paths:

- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_01_hold_v02_cutout_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_02_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_03_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_04_hold_v02_cutout_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_05_hold_v02_cutout_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_06_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_07_normalized_draft_v02.png`
- `C:\workspace\스팀펑크\assets\yunseo_p0_v06_runtime_action_sheet\yunseo_p0_v06_runtime_pose_08_hold_v02_cutout_normalized_draft_v02.png`

Canonical role:

- Action pose 8 are identity master.
- Do not repaint, regenerate, resize, reinterpret, or replace them.
- Use them to lock face, hair, outfit length, harness, scanner, cable, stamp case, body proportions, palette, silhouette family, and scale.

## Current Walk Edit Targets

Each direction pass must use the current walk frames for that direction as the edit target. The target frame count and order must be preserved.

walk_down edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_04.png`

walk_up edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_04.png`

walk_left edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_04.png`

walk_right edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_04.png`

Current walk role:

- Treat as locomotion pose structure and baseline-to-replace.
- Preserve frame order and direction.
- Improve only the gait readability and consistency issues.
- Do not use current walk as permission to drift away from canonical action identity.

## Negative / Variant References

W3A and W3A-r2 are not default candidates. They are negative references showing what must not happen.

W3A variant-only paths:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_down_w3a_04.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\frames\yunseo_v06_walk_up_w3a_04.png`

W3A-r2 reject paths:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_down_w3a_r2_04.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\frames\yunseo_v06_walk_up_w3a_r2_04.png`

Negative reference interpretation:

- W3A shows improved gait but fails default outfit continuity by reading as long coat/trench/variant.
- W3A-r2 reduces some long-coat read but still fails original Yunseo face/body/style identity.
- Any W4 output resembling these failures is HOLD or REJECT.

## Required Output Format For Future Generation

Generate four separate 4-frame strips by direction:

- `walk_down`: 4 frames
- `walk_up`: 4 frames
- `walk_left`: 4 frames
- `walk_right`: 4 frames

Each frame must preserve:

- transparent background
- `796x658` canvas per frame
- origin visually around `(320,560)`
- runtime scale compatibility at `0.11`
- same apparent character size and foot baseline as canonical references
- no text, labels, UI, marker icons, or pseudo text inside the image

Preferred strip handling:

- Direction strip may be delivered as 4 equal frame slots, but each frame must be extractable back to `796x658`.
- If the tool supports editing individual frames more reliably than strips, edit 4 individual frames per direction and assemble the strip only after QA.
- Do not pack all directions into one atlas during generation unless frame boundary/origin can be proven.

## Common Positive Prompt

Use this positive prompt for every direction, with the direction-specific section appended.

```text
Reference/edit the provided current Yunseo walk frames. Preserve the exact approved Yunseo v06 runtime identity from the canonical action 8 reference sheet and identity crop sheet. Keep the same adult Yunseo face, hair silhouette, body proportions, fitted utility outfit, dusty ash rose replacement sleeve, harness, trousers, boots, compact scanner, cable loops, recovery-line reel, and stamp work case.

This is not a new character design. This is a corrective edit of the current default Yunseo walk cycle to improve walk readability while keeping the same person, same clothing length, same gear size, same silhouette family, same palette, and same illustration style as the canonical action poses.

Preserve transparent background. Preserve 796x658 canvas per frame. Preserve visual origin around x=320 y=560 and stable ground contact. Preserve runtime scale compatibility at 0.11. Preserve frame order 01-04. Improve walking through leg spacing, boot placement, cuff shifts, subtle hip and shoulder weight transfer, compact strap sway, and clearer contact/passing rhythm.

Keep scanner, cable, recovery-line reel, and stamp case as compact procedural work tools, not weapons and not documents. Maintain one coherent asset family across all directions and canonical action poses.
```

## Common Negative Prompt

Use this negative prompt for every direction.

```text
No text-only redesign. No new outfit. No alternate skin. No variant costume. No long coat. No trench coat. No cloak. No robe. No skirt-like hem. No apron-like long panel. No oversized backpack. No large rear equipment block. No changed face. No changed hairstyle. No changed body proportions. No younger or mascot read. No different illustration style. No W3A-like variant read. No W3A-r2-like identity drift.

No map, tablet, document board, clipboard, UI panel, pseudo text, labels, icons, marker symbols, or readable text. No gun, rifle, pistol grip, weapon silhouette, long barrel, laser, whip, spear, taut cable weapon, or attack beam. No tactical soldier gear. No service worker or delivery worker read.

No frame scale drift. No origin drift. No canvas crop. No foot baseline pop. No sliding-only pose swap. No exaggerated run stride. No cartoon bounce. No loss of 48px readability. No equipment size change. No sleeve side/color drift. No direction-to-direction outfit swap.
```

## Frame Consistency Rules

Apply these rules across all 16 frames:

- The face/hair family must match canonical action pose 01/02/07.
- The torso/outfit must match action pose 01/04/05.
- Harness and equipment must match action pose 03/04/05/06.
- Legs and boots may move more clearly, but trousers and boot design must remain the same.
- Scanner/cable/stamp case may shift only as physically plausible small walking motion.
- Gear size must remain compact; do not enlarge reel, case, or rear equipment mass.
- Sleeve identity must not swap randomly between frames or directions.
- Frame 01 and frame 03 should read as opposite contact beats.
- Frame 02 and frame 04 should read as passing/recovery beats.
- Contact feet must stay near the `(320,560)` origin baseline.
- Body height may change only subtly; avoid bob baked into art beyond normal walking weight.
- All four directions must look like one simultaneous production pass.

## Direction Prompt: walk_down 4-Frame Strip

Edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_04.png`

Direction-specific prompt:

```text
Create a corrected walk_down 4-frame reference/edit strip from the current walk_down frames. Keep Yunseo facing down/front. Preserve the exact canonical Yunseo v06 face, hair, fitted utility outfit, dusty ash rose sleeve, compact harness, scanner, cable loops, recovery-line reel, stamp case, trousers, and boots.

Improve front-facing walk readability by strengthening alternating foot plant, left/right weight transfer, knee and boot spacing, cuff movement, subtle hip/shoulder counter-shift, and a clear contact/passing rhythm. The body should feel grounded, not floating. The lower body must become more readable without adding a long coat, skirt-like hem, apron, cloak, trench, or new outfit volume.

Keep equipment close to the body so it does not hide the foot motion. Keep the stamp case as a compact work case and scanner as a compact inspection tool. Do not make the scanner look like a gun or the case look like a document/tablet/map.
```

Frame notes:

- Frame 01: clear planted foot and centered mass, no idle duplicate.
- Frame 02: passing beat, visible knee/cuff shift, body mass subtly transfers.
- Frame 03: opposite planted foot, visibly different from frame 01.
- Frame 04: recovery/passing beat leading back to frame 01.

## Direction Prompt: walk_up 4-Frame Strip

Edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_04.png`

Direction-specific prompt:

```text
Create a corrected walk_up 4-frame reference/edit strip from the current walk_up frames. Keep Yunseo facing up/back. Preserve the same canonical Yunseo v06 head/back silhouette, compact hair shape, fitted utility outfit, harness, trousers, boots, dusty ash rose sleeve visibility where plausible, compact recovery-line reel, compact scanner, cable loops, and stamp case.

Improve rear-facing walk readability through clearer heel and boot placement, rear leg spacing, calf/cuff alternation, subtle hip/shoulder counter-shift, and a grounded contact/passing rhythm. Rear gear must remain compact and attached to the established outfit. Do not create a large backpack, rear equipment block, long coat panel, cloak, trench, robe, or new rear garment silhouette.

The back view must still read as the same Yunseo from the action poses, not a faceless dark figure and not W3A-style long-coat Yunseo.
```

Frame notes:

- Frame 01: compact back silhouette with one foot clearly planted.
- Frame 02: passing beat with heel/boot offset visible.
- Frame 03: opposite foot plant, different from frame 01.
- Frame 04: recovery beat with stable origin and no rear gear pop.

## Direction Prompt: walk_left 4-Frame Strip

Edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_04.png`

Direction-specific prompt:

```text
Create a corrected walk_left 4-frame reference/edit strip from the current walk_left frames. Keep Yunseo in left-facing side profile. Preserve the exact canonical Yunseo v06 face/hair profile, fitted utility outfit, dusty ash rose sleeve logic, compact harness, scanner, cable loops, recovery-line reel, stamp case, trousers, and boots.

Maintain the current side identity, but reduce exaggerated stride and strengthen believable weight transfer. Improve side walk readability with controlled boot contact, knee bend, cuff shifts, small hip/shoulder counter-motion, and compact strap sway. The stride should read as grounded walking, not running or posing.

Do not change gear placement into a weapon silhouette. Scanner must angle down or across the body, not forward as a pistol. Cable must remain slack/looped/bundled, not a taut attack line.
```

Frame notes:

- Frame 01: neutral side contact pose, compact gear.
- Frame 02: forward/back leg separation, reduced overstride.
- Frame 03: opposite contact beat with same body scale.
- Frame 04: recovery beat, no anchor pop or equipment swing exaggeration.

## Direction Prompt: walk_right 4-Frame Strip

Edit target:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_04.png`

Direction-specific prompt:

```text
Create a corrected walk_right 4-frame reference/edit strip from the current walk_right frames. Keep Yunseo in right-facing side profile. Preserve the exact canonical Yunseo v06 face/hair profile, fitted utility outfit, dusty ash rose sleeve logic, compact harness, scanner, cable loops, recovery-line reel, stamp case, trousers, and boots.

Maintain the current side identity, but reduce exaggerated stride and make the rhythm match the left/down/up family. Improve side walk readability with grounded boot contact, controlled knee bend, cuff shifts, subtle hip/shoulder counter-motion, and compact strap sway. The right-facing frames must not look like a cleaner/newer/different style than left or down/up.

Do not turn scanner, cable, reel, or stamp case into weapons or document/map/tablet shapes. Keep gear compact and consistent with the canonical action poses.
```

Frame notes:

- Frame 01: neutral side contact pose, same scale as left.
- Frame 02: controlled stride, no run read.
- Frame 03: opposite contact beat with stable origin.
- Frame 04: recovery beat leading smoothly back to frame 01.

## Direction Delivery Order

Recommended generation order:

1. `walk_down` strip
2. `walk_up` strip
3. `walk_left` strip
4. `walk_right` strip

Reason:

- Down/up are the weakest current read and reveal identity drift quickly.
- Left/right then normalize stride and family consistency against the accepted down/up correction.

Do not approve any single strip as default in isolation. All 16 frames must pass together.

## QA Requirements

Required QA sheets after generation:

- generated walk 16 vs canonical action 8 identity sheet
- generated walk 16 vs current walk 16 comparison sheet
- generated walk 16 direction consistency sheet
- 96/64/48 scale sheet
- R01 480x270 full-map sheet
- S0 bob/timing ON/OFF sheet
- action priority return-to-walk sheet
- W3A/W3A-r2 negative comparison sheet

Required technical checks:

- PNG magic PASS
- all generated frames exist
- all generated frames are `796x658`
- alpha PASS
- stable alpha bbox and visible ground contact
- no active runtime PNG modification
- no `.png.import` generation
- no code modification
- no Godot active-root import
- staged diff 0 until explicit integration approval

## PASS Criteria

PASS only if all are true:

- All 16 frames read as canonical Yunseo v06.
- No direction change shows outfit, face, body, palette, or equipment swap.
- Down/up walk-feel improves through clearer foot plant and weight transfer.
- Left/right stride exaggeration is reduced without losing side identity.
- 48px scale keeps minimum walk rhythm and default Yunseo identity.
- R01 480x270 previews preserve identity and background separation.
- Scanner, cable, recovery-line reel, and stamp case have no gun/weapon/document/map/tablet misread.
- Origin, scale, canvas, and contact baseline remain stable.
- Action pose 8 are unchanged and still read as the same family.

## HOLD Criteria

HOLD if any of these occur:

- One or more frames are close but not fully identity-locked.
- Down/up improve but left/right clash with them.
- Left/right still overstride or read as running.
- 48px rhythm is too weak to judge.
- R01 preview shows background blend or equipment confusion.
- S0 bob/timing is required to hide weak frame art.
- Any generation output needs manual surgery before identity can be judged.

## REJECT Criteria

REJECT if any of these occur:

- Any frame reads as different clothes, different face, different body, or different gear.
- Any frame reads as W3A/W3A-r2-like variant.
- Long coat, trench, cloak, robe, apron, skirt-like hem, or new outerwear appears.
- Rear equipment becomes backpack-like or oversized.
- Scanner/cable/stamp case reads as weapon, document, map, tablet, or UI board.
- Frame scale drift, canvas crop, origin pop, or foot baseline drift appears.
- Text, labels, icons, pseudo text, or UI marks appear inside generated frames.
- Action pose 8 are modified or reinterpreted.

## Generation Approval Text

Use this exact approval only when ready to perform external reference/edit generation:

```text
Yunseo walk 16 W4 reference/edit generation을 실행해라.

목표:
승인된 Yunseo v06 action pose 8개를 canonical identity master로 고정하고, current walk 16 frames를 direction별 4-frame strip edit target으로 사용해 default walk 16을 reference/edit 재제작한다.

입력:
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_canonical_action_8pose_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_current_walk_16_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_action_walk_family_comparison_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_identity_crop_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_equipment_crop_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_origin_scale_guide_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_96_64_48_scale_reference_sheet.png
- C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_r01_480x270_reference_preview_sheet.png
- YUNSEO_WALK_16_REFERENCE_EDIT_GENERATION_PROMPTS.md

허용:
- active root 밖에서 direction별 walk_down/walk_up/walk_left/walk_right 4-frame strip 후보 생성
- current walk 해당 방향을 edit target으로 사용
- canonical action/identity/equipment sheet를 identity reference로 사용
- W3A/W3A-r2를 negative reference로만 사용
- QA sheet 생성

금지:
- 텍스트-only 신규 윤서 생성
- action pose 8 수정
- active runtime asset 수정/복사
- .png.import 생성
- code 수정
- Godot active-root import
- git add/commit/push/PR
- W3A/W3A-r2 default 편입

판정:
identity lock이 walk-feel보다 우선이다.
하나라도 다른 옷/얼굴/장비/variant처럼 보이면 HOLD 또는 REJECT.
16개 전체가 같은 canonical Yunseo family로 PASS해야 다음 active integration plan으로 넘어간다.
```

## Forbidden Work Confirmation

This prompt-lock step did not perform:

- image generation
- PNG edit/copy
- `.png.import` generation
- active project import
- code modification
- Godot execution
- `git add`
- commit
- push
- PR creation

## Final Decision

Prompt package status: `PASS / READY FOR EXTERNAL REFERENCE-EDIT GENERATION APPROVAL`

Default target remains:

`Action pose 8 locked. Walk 16 전체 reference/edit 재제작.`
