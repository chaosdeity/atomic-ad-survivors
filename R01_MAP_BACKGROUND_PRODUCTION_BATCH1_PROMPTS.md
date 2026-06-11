# R01 Map/Background Production Batch 1 Prompts

## Status
- Source audit: `R01_MAP_BACKGROUND_PRODUCTION_AUDIT.md`
- Fixture/interaction track: 90% PASS 유지
- Map/background production track: 20% -> 30% prompt design complete
- This document is prompt/design only. No image generation has been performed.

## Batch 1 Goal
Batch 1 reinforces the immediate background around the already-approved production fixture 7종. It must not replace the fixtures. The new assets should make the floor, lane, queue, shadow, wear, and access-zone context feel production-quality at 480x270 while keeping the fixture as the visual hero.

The environmental read should be: a bright residential advertisement space that quietly forces endless move-in procedures through floor flow, queue pressure, access pads, renewal passage marks, and repeated scuff patterns.

## Batch 1 Asset List
| Asset ID | Target Zone | Role | Recommended Format | Layer Intent |
|---|---|---|---|---|
| `r01_bg_checkin_station_ground_support_v01` | check-in station | ground pad, worn check-in queue context, fixture contact shadows | transparent PNG | under kiosk/panel/rail, above base ground |
| `r01_bg_checkin_queue_wear_marks_v01` | check-in station | subtle queue scuffs, sticker residue, lane pressure marks | transparent PNG | decal over ground, below player/fixture fronts |
| `r01_bg_room_meal_access_floor_support_v01` | room/meal access lane | access-zone floor surround, allocation flow pad, soft fixture shadows | transparent PNG | under access panel/floor pad/rail |
| `r01_bg_room_meal_access_support_marks_v01` | room/meal access lane | non-text meal/room allocation symbols, repeated access wear, small housing-ad residue | transparent PNG | decal over floor support |
| `r01_bg_renewal_gate_passage_support_v01` | renewal gate lane | renewal passage threshold, route pad surround, gate approach wear | transparent PNG | under renewal gate, route lane, floor pad |
| `r01_bg_renewal_gate_shadow_wear_v01` | renewal gate lane | gate foot shadows, repeated passage scuffs, subtle waiting pressure arcs | transparent PNG | decal/shadow pass under gate/front rail |
| `r01_bg_station_contact_shadow_set_v01` | all three station zones | reusable contact shadows and anchoring stains for fixtures | transparent PNG sprite sheet or separate transparent PNGs | under production fixtures only |

## Common Positive Prompt
Use this common positive prompt as the base for every Batch 1 image prompt:

```text
Top-down 2D game background support asset for a bright dystopian Korean residential advertising suburb, production-quality hand-painted digital art, transparent background, clean alpha edges, 480x270 gameplay readability, soft warm beige pavement, muted mint residential floor paint, coral ad-route residue, subtle golden procedure highlights, worn queue scuffs, repeated foot traffic marks, fixture contact shadows, housing procedure flow marks, small non-text paper residue, tape edges, floor grime, polished but unsettling model-home sales atmosphere, readable at tiny scale, no readable text, no pseudo text, no labels, no UI, no characters, no main fixture replacement, asset designed to sit under existing production fixtures
```

## Common Negative Prompt
Use this common negative prompt for every Batch 1 image prompt:

```text
no readable text, no letters, no numbers, no pseudo typography, no UI labels, no signs with words, no characters, no people, no workers, no factory, no service counter labor scene, no rent collection, no debt collection, no eviction notice, no ruined haunted house, no horror gore, no abandoned ruin, no dark haunted mansion, no realistic photograph, no 3D render, no glossy showroom cleanliness, no simple empty model-house brochure look, no replacement kiosk, no replacement panel, no replacement rail, no replacement gate, no giant props, no high contrast clutter, no object blocking the player, no heavy dark shadows, no black background
```

## Asset Prompts

### 1. `r01_bg_checkin_station_ground_support_v01`
Role: support the check-in kiosk/procedure panel/waiting rail cluster without replacing any fixture.

```text
Create a transparent 2D top-down background support asset for the check-in station area of R01. The asset is a warm residential pavement pad with subtle mint floor paint and coral route residue, shaped to sit underneath an existing check-in kiosk, procedure panel, waiting rail, and floor pad. Include soft fixture contact shadows, queue-lane floor wear, faint foot scuffs, small tape corners, paper residue, and repeated waiting pressure marks. It should suggest residents are being processed through a housing check-in procedure without using any text or labels. Keep the center readable and low contrast so Yunseo at 0.11 scale and the production fixture sprites remain unobscured. Bright residential advertising mood, polished but coercive, not ruined, not factory-like, not a showroom brochure.
```

Pass intent:
- The kiosk and panel still dominate.
- The floor no longer looks like a flat vector rectangle.
- Queue pressure reads from scuffs/flow, not text.

### 2. `r01_bg_checkin_queue_wear_marks_v01`
Role: light decal layer that can be placed around the check-in station to show repeated waiting.

```text
Create a transparent top-down decal set for a housing check-in queue area. Include small repeated shoe scuffs, faint queue arcs, sticker adhesive residue, worn floor tape fragments, tiny folded ad-paper scraps, and soft warm shadows. Visual style must match production fixture density but remain low enough contrast for gameplay readability. No text, no symbols that look like letters, no UI arrows. The marks should imply endless residential procedure waiting, not a normal store queue, not a factory line, not debt collection.
```

Pass intent:
- Adds material density around check-in station.
- Does not become clutter or fake UI.

### 3. `r01_bg_room_meal_access_floor_support_v01`
Role: support room/meal access panel and floor pad while making "access allocation" environmental.

```text
Create a transparent 2D top-down floor support asset for the R01 room/meal access lane. It should look like a bright residential ad-space floor pad that has been used for repeated access allocation checks. Include soft beige and pale mint painted pavement, worn access-zone border shapes, small non-text tile icons, fixture contact shadows for an access panel and waiting rail, smudged floor pad edges, and subtle repeated foot traffic wear. It must support the existing room/meal access panel and floor pad without replacing them. No readable text, no food icons that look like menu signage, no room labels, no hotel/lodging UI. The mood is cheerful housing-ad bureaucracy, slightly coercive, clean enough for a model-home route but visibly overused.
```

Pass intent:
- Reads as access procedure space without MEAL/ROOM text.
- Does not turn into restaurant, hotel, or service-worker imagery.

### 4. `r01_bg_room_meal_access_support_marks_v01`
Role: decal layer that gives room/meal lane repeated-use pressure.

```text
Create transparent top-down support marks for a residential room/meal access lane. Include worn threshold marks, soft oval waiting scuffs, non-text allocation chips, pale yellow tape residue, tiny torn housing-ad paper scraps, and faint repeated route stains. Keep all marks abstract and non-readable. The marks should feel like a family housing access process that repeats too many times. Keep contrast gentle and avoid covering player, floor pad, access panel, or rail silhouettes.
```

Pass intent:
- Adds story pressure without text.
- Keeps floor pad/player readable.

### 5. `r01_bg_renewal_gate_passage_support_v01`
Role: production threshold around renewal gate lane and route pad.

```text
Create a transparent top-down background support asset for an R01 renewal gate passage. The asset should sit under an existing renewal gate sprite, route lane, floor pad, and waiting rail. Include a warm beige route pad surround, pale mint residential lane paint, worn renewal threshold scuffs, subtle gold/coral procedure glow residue, gate foot contact shadows, and repeated pass-through wear. It should read as a passable housing renewal passage, not a locked barrier. No readable text, no arrows with labels, no warning text, no industrial gate, no prison checkpoint, no haunted doorway. Bright residential ad aesthetic with quiet coercive bureaucracy.
```

Pass intent:
- Gate opening remains visually passable.
- Renewal lane gains production density and no longer floats on flat bands.

### 6. `r01_bg_renewal_gate_shadow_wear_v01`
Role: shadow/wear overlay for renewal gate and repeated passage.

```text
Create a transparent top-down shadow and wear decal for a residential renewal gate passage. Include soft contact shadows from two gate posts, repeated foot scuffs through the center opening, faint circular waiting pressure marks, pale tape residue, and small ad-paper fragments. The center must remain readable and not look blocked. No text, no hard barrier, no prison/security imagery, no ruined horror, no factory checkpoint. Production-quality painterly texture, gentle alpha, designed for 480x270 gameplay readability.
```

Pass intent:
- Reinforces passage and scale without making an invisible blocker.
- Supports existing collision/navigation PASS.

### 7. `r01_bg_station_contact_shadow_set_v01`
Role: reusable asset set for anchoring fixtures into the ground.

```text
Create a transparent top-down contact shadow and anchoring stain set for small residential procedure fixtures. Include soft oval shadows, light dust halos, tiny screw/stand stains, worn tile marks, and subtle warm grime patches sized for kiosk, panel, rail, floor pad, access panel, and gate posts. No actual fixtures, no replacement objects, no text, no characters. The asset should be a reusable support set that makes existing production fixtures feel grounded on bright residential pavement at 480x270.
```

Pass intent:
- Can be reused across all three Batch 1 station scenes.
- No element should be mistaken for an interactable device.

## Composition Rules
- Transparent background unless explicitly producing a full station floor pad.
- Keep texture density under the production fixture density by roughly 30-45%.
- Keep all markings abstract and non-readable.
- Reserve strongest contrast for fixture contact areas and worn flow paths.
- Do not place dark details directly under Yunseo/player expected standing position.
- Do not add new gameplay blockers, fences, walls, machines, counters, or characters.
- No text, pseudo text, numbers, logos, labels, or signage.
- Use warm beige, pale mint, muted coral, soft gold, dusty brown, and low-alpha gray shadows.
- Avoid making the floor look dirty-ruined; it should feel polished but overprocessed.

## Pass/Reject Criteria
### PASS
- Production fixtures remain the hero objects.
- Floor/route/queue context feels production-quality beside the repaired fixtures.
- Yunseo 0.11 scale remains readable at 480x270.
- Check-in, room/meal access, and renewal gate areas feel like linked housing procedures.
- No text or pseudo text appears.
- No visual direction drifts into rent/debt, ruined horror, factory, service-worker scene, or ordinary showroom marketing.
- Gate opening and floor pad/lane remain visually passable.

### REJECT
- Asset replaces or competes with the 7 production fixtures.
- Any readable or fake-readable text appears.
- The asset looks like a haunted ruin, eviction/rent notice, debt collection, factory process, or service desk.
- The scene becomes too clean and reads as a normal model-house brochure.
- The floor markings look like UI arrows or gameplay icons.
- The asset obscures Yunseo, prompt, fixture silhouettes, or route readability.
- The renewal passage looks blocked.

## QA Plan
1. Generate Batch 1 assets only after separate approval.
2. Verify each PNG magic header and transparent alpha.
3. Build temp/copy QA project only; do not run Godot from active root.
4. Place assets behind existing production fixtures without deleting or replacing fixture PNGs.
5. Produce 480x270 station contact sheet:
   - check-in station
   - room/meal access lane
   - renewal gate lane
6. Confirm:
   - production fixture texture still renders
   - no fallback/proxy fixture reappears
   - no text/pseudo text
   - prompt does not overlap HUD/player/fixtures excessively
   - Yunseo 0.11 scale remains readable
   - renewal gate opening remains passable-looking
   - floor pad/lane remains no-blocker-looking
7. Compare against repaired fixture contact sheet:
   - `C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/screens/contact_sheet.png`
8. Write Batch 1 visual QA report before any active project integration.

## Progress Update Rules
- Prompt document complete: map/background production track 20% -> 30%.
- Asset generation only: maximum 40% until QA.
- Temp/copy visual QA PASS: 50-60% depending on mismatch count.
- Active integration plan PASS: 70%.
- Active integration + 480x270 QA PASS: 80-85%.
- Full R01 map/background production lock remains separate and should not be claimed from Batch 1 alone.

## Files Actually Read
- `C:/workspace/_codex_r01_procedure_interactions/R01_MAP_BACKGROUND_PRODUCTION_AUDIT.md`
- `C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/screens/contact_sheet.png` metadata only in this turn; visual evidence inherited from the audit.
- `git status --short` for current worktree state.

## Forbidden Work Compliance
- No image generation.
- No PNG modification/copy/delete.
- No Godot import.
- No code modification.
- No commit/push/PR.
- Active original dirty worktree not modified.
