# Yunseo Walk-Feel S2 Constrained Rig/Edit Plan

Date: 2026-06-18

## Final Planning Verdict

S2 constrained rig/edit 방식으로 전환한다.

- Refedit walk16: identity PASS, walk-feel HOLD
- S0 bob/shadow: technically works, but root walk-feel failure remains
- W3A/W3A-r2: identity drift, default 불가
- S1 96px sprite-first: runtime-scale foot plant/rhythm 미달
- Conclusion: text/reference image generation 중심 방식만으로는 default Yunseo walk cycle 품질이 안정적으로 나오지 않음

Yunseo walk-feel polish는 85% HOLD를 유지한다. S2 constrained rig/edit planning은 0% -> 20%로 진행한다.

## Why Previous Passes Failed

### Refedit Walk16

- Canonical Yunseo identity는 유지했지만, down/up lower-body delta가 480x270에서 거의 읽히지 않음.
- Side stride는 커 보이지만 자연스러운 weight transfer가 부족함.
- Full illustration을 `scale 0.11`로 줄이는 구조에서 작은 다리 변화가 runtime에 묻힘.

### S0 Bob/Shadow

- 1px bob, contact shadow, stop-settle은 보조 효과로는 작동함.
- 하지만 에셋 자체에 foot plant가 부족하면 bob은 흔들림으로 읽히고, contact shadow는 발을 먹는 시각 노이즈가 됨.
- S0 correction은 commit 금지 상태를 유지한다.

### W3A / W3A-r2

- 걷기감 일부는 좋아졌지만 long coat/trench/variant read가 발생함.
- 얼굴, 몸 비율, 의상, 장비, 그림체가 default Yunseo family에서 벗어남.
- Default active integration 금지.

### S1 96px Sprite-First

- 96px/64px/48px 판독을 우선한 방향은 맞았으나, 실제 후보는 refedit 기반 진단 후보에 가까웠음.
- Down/up foot plant와 64/48px rhythm이 PASS에 도달하지 못함.
- Runtime-scale first가 필요하다는 판단은 유지하되, 생성형 전면 재작업이 아니라 constrained edit로 전환해야 함.

## S2 Direction

S2는 4프레임 walk cycle을 새로 "그리거나 생성"하는 단계가 아니라, 기존 canonical Yunseo frame을 분해하고 제한된 영역만 cut/warp/edit하는 단계다.

Core rule:

- Face, hair, torso, outfit upper mass, harness, scanner, cable, stamp case는 가능한 고정한다.
- Editable scope는 legs, boots, cuff/hem lower edge, 아주 작은 pelvis/shoulder shift로 제한한다.
- 96px preview에서 foot plant를 먼저 통과한 뒤 796x658 canvas/origin `(320,560)`으로 재정렬한다.
- Whole-character generation 금지.
- Text-only 신규 Yunseo 생성 금지.

## Canonical Base

### Primary Direction Bases

Use PR #10 refedit walk frames as the S2 editable base because they are already identity-approved in runtime.

- Down base frame: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_down_refedit_v01_01.png`
- Up base frame: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_up_refedit_v01_01.png`
- Left base frame: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_left_refedit_v01_01.png`
- Right base frame: `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06_walk_refedit_v01\yunseo_v06_walk_right_refedit_v01_01.png`

Use the remaining refedit frames as pose material and failure comparison, not as locked mechanics:

- `yunseo_v06_walk_down_refedit_v01_02.png` through `04`
- `yunseo_v06_walk_up_refedit_v01_02.png` through `04`
- `yunseo_v06_walk_left_refedit_v01_02.png` through `04`
- `yunseo_v06_walk_right_refedit_v01_02.png` through `04`

### Identity References Only

Approved action pose 8 remains canonical identity reference only. Do not modify these files.

- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_01_idle.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_02_scan_low.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_03_cable_hook.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_04_pull_retrieval.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_05_stamp_ready.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_06_reject_stamp.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_07_hurt_interrupted.png`
- `C:\workspace\_codex_yunseo_walk_feel_live_s0\assets\art_inbox\yunseo_runtime_v06\yunseo_v06_pose_08_retrieval_escape.png`

### Reference Sheets

Use existing canonical sheets for lock and QA:

- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_canonical_action_8pose_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_identity_crop_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_equipment_crop_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_current_walk_16_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_96_64_48_scale_reference_sheet.png`
- `C:\workspace\_codex_yunseo_canonical_reference_sheet\yunseo_r01_480x270_reference_preview_sheet.png`

## Edit Layer Separation

### Locked Layers

These regions should be copied from the selected canonical base and protected by mask/pixel-delta QA.

- Head lock: face, hairline, bangs, head silhouette
- Torso lock: upper coat/jacket body, collar, chest shape, main outfit palette
- Harness lock: straps, belt read, compact rig silhouette
- Equipment lock: scanner, cable attachment, stamp case, compact side gear
- Arm/hand lock: unless the lower body edit creates unavoidable overlap

### Editable Layers

Only these regions may change meaningfully.

- Legs editable: thigh/knee/lower-leg silhouette, leg spacing, visible overlap
- Boots editable: toe/heel position, planted foot width, contact shape
- Cuff/hem micro-shift editable: bottom edge of garment around legs only
- Pelvis micro-shift editable: 1-2px at 96px reference scale, only when needed for weight transfer
- Shoulder micro-shift editable: optional 1px counter-balance at 96px scale, only if head/torso identity remains stable

### Mostly Locked With Local Cleanup

- Cable: must not become weapon-like; small anti-overlap cleanup only
- Stamp case: must not become map/tablet/document board; preserve compact case read
- Scanner: must not become gun/rifle silhouette; preserve compact scanner read

## Four-Frame Mechanics

Each direction keeps the same 4-frame loop:

1. Contact
2. Passing
3. Opposite contact
4. Recovery

### Down

- Contact: one boot visibly planted lower/wider; opposite leg slightly back.
- Passing: legs closer, one knee/boot passes centerline without merging into a single column.
- Opposite contact: mirror contact with clear left/right weight transfer.
- Recovery: lifted boot and hem/cuff shift visible at 96px.
- Foot offset should be larger than current refedit, but head/torso should remain stable.

### Up

- Contact: rear-facing boot/heel spacing must read even with reduced face detail.
- Passing: lower legs must not merge into one dark mass.
- Opposite contact: clear alternation from frame 1.
- Recovery: cuff/hem movement should show leg direction without changing coat length into a variant read.
- Rear gear must remain compact and not grow into a backpack block.

### Left

- Reduce exaggerated stride length from refedit.
- Make front/rear leg overlap clear through boot angle and knee spacing.
- Add slight pelvis/shoulder counter-shift only inside lock tolerance.
- Preserve side identity and gear silhouette.

### Right

- Mirror left mechanics where possible, but do not introduce asymmetrical gear drift.
- Keep stride compact and grounded.
- Use boot contact shape rather than long leg reach to create walking rhythm.
- Preserve scanner/cable/stamp case read.

## Tool / Method Options

### A. Manual Pixel/Paint Edit

Pros:

- Highest control over lower-body silhouette.
- Best for tiny 96px readability decisions.

Cons:

- Slow.
- Easy to introduce inconsistent frame polish without strong QA.

Use when:

- A small number of frames need final lower-leg cleanup after mask/warp.

### B. Image Edit With Mask Only On Legs/Boots

Pros:

- Preserves identity regions if mask discipline is strict.
- Allows controlled redraw of foot plant and leg spacing.

Cons:

- Mask bleed can still alter hem, gear, or body proportions.
- Needs locked-region delta audit.

Use when:

- Down/up foot plant needs stronger visual redesign than warp can provide.

### C. Simple 2D Rig/Warp Script

Pros:

- Repeatable anchor and origin handling.
- Can preserve head/torso/equipment pixels exactly.
- Useful for systematic contact/passing/opposite/recovery probes.

Cons:

- Warping may create artifacts around hem/cuff/boots.
- Cannot invent missing occluded leg detail by itself.

Use when:

- Establishing base frame geometry, boot offsets, and anchor consistency before paint cleanup.

### D. Current Walk + Animation Code Polish Only

Pros:

- Lowest asset churn.

Cons:

- S0 already proved code-only polish is insufficient.
- Does not solve down/up foot plant.

Use when:

- Not recommended except as a temporary fallback after S2 asset HOLD.

## PMO Recommendation

Recommend **B + C combined**.

Execution preference:

1. Use a simple 2D rig/warp script to create constrained lower-body contact/passing/opposite/recovery candidates.
2. Keep head, hair, torso, harness, equipment, scanner, cable, and stamp case locked by mask.
3. Use image edit only inside legs/boots/cuff masks to repair artifacts and strengthen foot plant.
4. Use manual pixel/paint cleanup only after 96px/64px rhythm is already promising.
5. Automate QA for anchor consistency, locked-region pixel delta, and contact shadow/no-shadow comparison.

Why this wins:

- It attacks the actual failure surface: lower-body rhythm at runtime scale.
- It prevents W3A/W3A-r2 style variant drift.
- It avoids whole-character generation that changes identity.
- It gives measurable PASS/HOLD gates before active integration.

## Proposed S2 Production Flow

1. Preflight canonical bases and masks.
2. Build per-direction lock masks:
   - head/hair
   - torso/outfit
   - harness/equipment
   - scanner/cable/stamp case
3. Build editable lower-body masks:
   - legs
   - boots
   - cuff/hem lower edge
4. Generate rig/warp probes for 4 frames per direction.
5. Render 96px contact sheet before any 796 packaging.
6. Run locked-region pixel-delta check.
7. If lower-body read is promising, perform masked leg/boot edit pass.
8. Produce 64px and 48px rhythm sheets.
9. Produce R01 480x270 movement sheet.
10. Re-align passing candidates into 796x658 canvas with origin `(320,560)`.
11. Produce self QA report.
12. Only after PASS, write import/integration plan.

## Mask And Delta QA

### Mask Boundary Check

- Editable masks must not touch face/hair.
- Editable masks must not include scanner, cable, stamp case, or upper torso.
- Hem/cuff mask can include only the lower garment edge around the legs.
- Any frame with mask bleed into identity/equipment region is HOLD.

### Locked Area Pixel-Delta Check

For each generated frame, compare locked regions against the direction base.

Recommended thresholds:

- Head/hair: near-zero delta required
- Torso/outfit: near-zero delta except tiny anti-aliasing at lower hem boundary
- Equipment: near-zero delta required
- Scanner/cable/stamp case: near-zero delta required
- Shoulder/pelvis micro-shift: allowed only when intentionally flagged and visible identity remains stable

### Anchor Consistency Check

- 796 canvas remains `796x658`.
- Transparent background remains.
- Origin remains `(320,560)`.
- Bottom planted boot must not drift enough to cause runtime sliding.
- 96px preview anchor must be consistent before 796 embed.

## QA Criteria

Required QA outputs:

- `s2_mask_boundary_check_sheet.png`
- `s2_locked_region_pixel_delta_sheet.png`
- `s2_96px_contact_sheet.png`
- `s2_64_48_rhythm_sheet.png`
- `s2_r01_480x270_movement_sheet.png`
- `s2_direction_transition_sheet.png`
- `s2_action_priority_return_sheet.png`
- `s2_equipment_read_sheet.png`
- `s2_contact_shadow_minimal_vs_none_sheet.png`
- `results.json`
- `YUNSEO_WALK_FEEL_S2_CONSTRAINED_RIG_EDIT_SELF_QA_REPORT.md`

Visual QA:

- 96px down/up foot plant must be visible without bob.
- 64px rhythm must remain legible.
- 48px must retain minimum walk rhythm.
- R01 480x270 must read better than refedit, S0, and S1.
- Direction transitions must not show outfit/gear changes.
- Action priority return must preserve pose 05 stamp_ready watch.

Technical QA:

- PNG magic PASS.
- Alpha PASS.
- 796x658 frame size PASS.
- Origin `(320,560)` PASS.
- Locked-region delta PASS.
- Mask bleed 0.
- `.png.import` 0 in source/output stage.
- Active project modification 0.
- Staged diff 0 unless explicitly approved later.

## PASS / HOLD / REJECT Criteria

### PASS

- Locked regions are nearly unchanged.
- Lower-body rhythm clearly improves over refedit/S0/S1.
- Down/up foot plant reads at 96px and remains acceptable at 64px.
- 48px keeps minimum walking rhythm.
- R01 480x270 read is visibly improved.
- Equipment does not read as weapon/map/tablet/oversized pack.
- 796 canvas/origin packaging remains stable.
- Active integration candidate possible.

### HOLD

- Any identity locked region changes beyond tolerance.
- Equipment read becomes ambiguous.
- Down/up foot plant still fails.
- Side stride remains weightless or becomes too exaggerated.
- 64px/48px lower body still merges.
- Mask boundary leaks into face, torso, or equipment.
- 796 realignment creates anchor/scale drift.

### REJECT

- New face, new body proportion, or variant read.
- New outfit, long coat, trench, cloak, robe, or skirt-like hem.
- Oversized backpack or large rear gear block.
- Scanner reads as gun/rifle/weapon.
- Stamp case reads as map/tablet/document board.
- Cable reads as weapon.
- Whole-character generation drift.

## Prohibitions For This Planning Step

- No image generation.
- No PNG edit/copy.
- No `.png.import` creation.
- No code edit.
- No Godot active root run.
- No `git add`.
- No commit/push/PR.
- No active integration.
- No W3A/W3A-r2 default inclusion.
- No S0 correction commit.

## Approval Text For Next Step

Approved S2 constrained rig/edit preflight:

Use PR #10 refedit walk frames as identity-stable direction bases, keep approved v06 action pose 8 as identity reference only, create lock/edit masks for head/torso/equipment versus legs/boots/cuff, and prepare a constrained lower-body rig/edit pipeline. Do not generate full-character frames, do not touch active runtime assets, and stop after mask/preflight QA.

## Current Status

- Yunseo walk-feel polish: 85% HOLD 유지
- S2 constrained rig/edit planning: 0% -> 20%
