# Yunseo Walk-Feel S1 Runtime-Scale Redesign Plan

Date: 2026-06-18

## Final Planning Verdict

S1 runtime-scale redesign required.

- Refedit identity: PASS
- Runtime texture load: PASS
- S0 bob/shadow implementation: technically works
- Walk-feel: HOLD / NOT SHIPPABLE
- S0 correction: do not commit
- Yunseo walk-feel polish: 85% HOLD 유지
- S1 redesign planning: 0% -> 20%

The previous S0 `PASS_WITH_WATCH` read is superseded by direct review. S0 proves the runtime can add bob/contact/settle behavior, but it does not solve the root walk-readability problem.

## S0 Rejection

### Down/Up Failure

- Down/up frames still read as pose swaps at 480x270.
- Lower-body change is too small after scaling the 796x658 illustration to `0.11`.
- Foot plant, heel lift, knee spacing, and boot separation do not create enough rhythm at gameplay scale.
- The 1px bob helps timing but cannot invent readable leg mechanics.

### Side Stride Failure

- Left/right frames have large visible stride, but the motion lacks believable weight transfer.
- The legs move, but hips/torso/boots do not read as load-bearing contact and recovery.
- The weak `0.985x` runtime side scale probe reduces width slightly but cannot fix the underlying gait.
- Side walk still risks reading as a looping illustration slide rather than a grounded walk cycle.

### Contact Shadow Failure

- The S0 contact shadow is too visually heavy relative to the small character read.
- The shadow competes with and partially eats the boots/feet, especially in down/up.
- Contact shadow can support an already-good walk, but here it becomes a visual patch over missing foot mechanics.
- S1 should test minimal shadow and no-shadow comparisons before committing any shadow pulse.

### R01 Full-Map Read Failure

- In R01 480x270 context, the character identity holds, but walk rhythm remains weak.
- The map-scale read emphasizes silhouette and foot timing; high-detail clothing/equipment noise compresses into the lower body.
- The current full-illustration-to-runtime scale path is unfavorable for walk readability.

## S1 Direction

S1 should redesign the walk cycle from runtime scale first.

Principles:

- Keep the 796x658 canvas, transparent background, origin `(320,560)`, and scale `0.11`.
- Design and approve the walk at 96px, 64px, and 48px preview scale before judging the large source frame.
- Make 480x270 gameplay readability the primary acceptance target.
- Preserve canonical Yunseo identity from the approved v06 action pose family.
- Preserve face/hair/outfit/harness/equipment identity, but reduce frame-to-frame equipment noise in walk frames.
- Exaggerate legs, boots, hem/cuff shifts, pelvis/hip weight transfer, and planted-foot spacing more than the current refedit set.
- Keep compact scanner/cable/stamp case read, but prevent gear from dominating the moving silhouette.
- Avoid solving walk-feel through bob/shadow alone.

## Asset Strategy Options

### A. Replace Current Refedit 16 With Runtime-Scale Walk 16

Recreate all 16 walk frames around runtime readability.

Pros:

- Solves the actual failing surface.
- Avoids down/up and side mismatch.
- Keeps default runtime coherent if generated as one family.

Cons:

- More asset work.
- Requires strict identity/reference control.
- Must avoid repeating W3A/W3A-r2 variant drift.

### B. Recreate Down/Up Only, Keep Side With Runtime Code

Rework the weakest down/up directions and keep current side frames with small runtime compensation.

Pros:

- Smaller scope.
- Targets the most invisible directions.

Cons:

- Direction-family mismatch risk remains high.
- Side stride still lacks weight transfer.
- Partial replacement repeats the core identity/feel drift risk.

### C. 96px Readable Sprite-First Pass, Then Re-Embed Into 796 Canvas

Create a walk cycle that first reads at runtime size, then align it into the required 796x658 canvas/origin convention.

Pros:

- Optimizes the real gameplay read first.
- Forces silhouette, foot plant, and rhythm to work before high-resolution detail is added.
- Best chance to preserve identity while improving walk-feel.
- Separates runtime readability from full-illustration polish.

Cons:

- Requires careful upscale/embed discipline.
- Needs strong canonical reference control to avoid identity simplification.
- May require a new review sheet flow.

### D. Keep Old/Refedit Walk And Defer Walk Polish

Ship current refedit walk and defer the issue.

Pros:

- No immediate asset churn.
- Identity remains stable.

Cons:

- Walk-feel remains not shippable.
- Runtime polish debt stays visible in every movement moment.
- S0 already showed code-only patching is insufficient.

## PMO Recommendation

Recommend **C: 96px readable sprite-first pass, then re-embed into 796 canvas**.

Rationale:

- The player sees Yunseo at runtime scale, not as a full illustration.
- Current refedit frames preserve identity but fail the movement read.
- A sprite-first pass can prioritize foot plant, weight transfer, lower-body silhouette, and rhythm before detail.
- After the 96px/64px read passes, the final deliverable can still be packaged as 796x658 transparent PNGs with origin `(320,560)` and scale `0.11`.

Non-negotiables:

- No text-only generation.
- Use canonical Yunseo references from the approved v06 action pose family.
- Use current refedit walk only as negative/diagnostic reference for what failed at runtime scale.
- Do not use W3A/W3A-r2 as default candidates.

## S1 Reference Inputs

Use:

- Approved Yunseo v06 action pose 8 as identity canonical.
- Canonical identity crop sheet.
- Equipment crop sheet.
- Current refedit 16 as failure/diagnostic comparison.
- R01 480x270 preview sheets as runtime readability target.

Do not use:

- W3A/W3A-r2 as default generation target.
- Text-only prompt generation.
- S0 bob/shadow sheet as proof of shippable walk-feel.

## S1 Production Flow

1. Build a 96px readable walk concept strip for 4 directions.
2. Review only silhouettes and rhythm first:
   - down/up foot plant
   - side contact/recovery
   - pelvis/torso weight shift
   - boot spacing
   - hem/cuff motion
3. Produce 64px and 48px rhythm strips.
4. Run R01 480x270 movement sequence mock.
5. Only after runtime-scale PASS, re-embed approved frames into 796x658 canvas.
6. Verify origin `(320,560)` and scale `0.11`.
7. Produce final 16 PNG candidate set.
8. Generate import/code plan only after asset PASS.

## QA Criteria

Required QA sheets:

- 96px live sequence first
- 64px rhythm check
- 48px rhythm check
- R01 480x270 actual movement sheet
- Contact shadow minimal vs no-shadow comparison
- Side stride naturalness check
- Down/up foot plant check
- Identity sheet against canonical v06 action poses
- Equipment read sheet for scanner/cable/stamp case

Runtime acceptance checks:

- Down/up lower-body change reads without relying on bob.
- Side stride has weight transfer, not just long step spacing.
- 48px rhythm remains readable.
- Contact shadow is either minimal or removed.
- R01 full-map read improves over PR #10 refedit.
- Identity remains canonical Yunseo.

## PASS Criteria

- 16 walk frames read as canonical Yunseo.
- 96px sequence reads as walking before any bob/shadow.
- 64px and 48px previews retain rhythm.
- R01 480x270 movement sheet reads better than refedit/S0.
- Down/up foot plant is visible.
- Left/right stride feels grounded with believable weight transfer.
- Equipment does not read as weapon/map/tablet/oversized pack.
- No W3A/W3A-r2 variant drift.

## HOLD Criteria

- Walk still reads as sliding or pose swapping.
- Down/up lower-body change remains invisible.
- Side stride remains long but weightless.
- Identity simplifies away from canonical Yunseo.
- Gear dominates the moving silhouette.
- Contact shadow is required to make the walk readable.
- 48px read fails.
- R01 480x270 read fails.

## Prohibitions

- Do not commit S0 correction.
- Do not integrate S0 correction as active runtime default.
- Do not generate text-only new Yunseo.
- Do not edit or regenerate PNGs in this planning step.
- Do not create `.png.import` files.
- Do not modify code in this planning step.
- Do not run active integration.
- Do not create a broad PR.
- Do not add W3A/W3A-r2 to default runtime.

## Approval Text For Next Step

Approved S1 runtime-scale redesign preflight:

Use canonical Yunseo v06 references, treat PR #10 refedit/S0 as failed walk-feel diagnostic input, create a 96px readable sprite-first walk redesign plan and prompt set, and stop before image generation or active integration.

## Current Status

- Yunseo identity path: locked through PR #10.
- Yunseo walk-feel polish: 85% HOLD.
- S1 redesign planning: 20%.
- Next step: S1 runtime-scale reference/prompt preflight.
