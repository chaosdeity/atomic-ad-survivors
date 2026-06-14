# R01 Background Batch 2 Generation Prompt Lock

Status: PROMPT LOCK ONLY
Worktree: `C:\workspace\_codex_r01_background_batch2`
Branch: `codex/r01-background-batch2`
Basis: `R01_BACKGROUND_BATCH2_PLANNING_REPORT.md`
Progress: R01 background Batch 2 `20% -> 30% prompt lock`

## Goal

Lock production-quality image generation prompts for the first six Batch 2 R01 background assets.

This step does not generate images, copy or edit PNGs, run Godot, create imports, edit code, stage files, commit, push, or open a PR.

## Priority Generation Scope

The planning report listed eight candidates. The first generation scope is locked to the six P0/P1 assets below.

Deferred P2 candidates remain out of generation scope:

- `r01_bg_model_house_floorplan_shadow_replacement_v01`
- `r01_bg_streetlight_voice_route_residue_v01`

## Common Art Lock

All six assets must read as production-quality 2D game background or ground fixture support for R01. They support the existing production fixtures and story navigation; they must not replace fixtures, UI, collision objects, or gameplay telegraphs.

Required shared traits:

- Top-down or slightly top-down 2D game background/ground fixture asset.
- Transparent PNG intent unless a later integration step explicitly approves a full rectangular background patch.
- Clean alpha edges, soft contact shadows, and low visual noise.
- Readable at 480x270 without becoming UI, signage, or a gameplay marker.
- Bright dystopian Korean residential advertising suburb mood, controlled by Smilehome family-slot move-in procedure logic.
- Polished, coercive, procedural, residential, and non-horror.
- Abstract marks only. No readable or pseudo-readable text.
- Lower contrast and lower edge sharpness than player, fixtures, prompts, enemies, pickups, and route telegraphs.

Hard rejects:

- No readable text, pseudo text, letters, numbers, logos, labels, QR-like glyphs, brand marks, signboard copy, UI sticker text, or map marker text.
- No monthly rent, debt collection, debt collector, eviction office, loan office, unpaid bill, or debt-horror framing.
- No factory, conveyor, production line, industrial labor, service counter labor, cleaning-worker framing, uniformed staff crowd, or workplace exploitation read.
- No haunted house, horror mansion, gore, zombie, ruined house, abandoned ruin, black mold horror, or simple collapse/decay framing.
- No ordinary clean real-estate brochure, showroom marketing poster, literal sales office, or generic model-home advertising.
- No UI sticker, minimap marker, boardgame token, quest icon, danger arrow, recovery marker, or interaction prompt substitute.
- No hard blocker, wall, fence, machine, character, vehicle, weapon, or new collision silhouette.

## 480x270 QA Criteria

Each generated asset must pass a 480x270 inspection before integration planning:

- Primary role is identifiable within two seconds at 480x270.
- It supports a specific R01 location read: open house, model house, fake return, or suburb navigation.
- No text-like marks are legible or pseudo-legible when downscaled.
- No detail resembles a UI element, signboard, map marker, route objective, or recovery path.
- It does not overpower existing production fixtures.
- It leaves a calm playable center/route read and does not imply collision.
- It reads as an environmental trace or support surface, not as a standalone prop set.

## Yunseo 0.11 Scale Comparison Criteria

Use Yunseo at the established 0.11 scale as the readability guardrail:

- Strongest asset contrast must not sit directly under Yunseo's expected standing silhouette.
- Repeated marks should be thinner and quieter than Yunseo's visible outline at gameplay scale.
- Any threshold, scuff, pad, or facade detail must sit behind Yunseo without merging with her shoes, outline, or movement read.
- Avoid dark clusters under the lower body read area; reserve contrast for edges, thresholds, or side residue.
- Asset density should be about 30-45% quieter than production fixtures and clearly quieter than character silhouettes.

## Draw Order Criteria

Target layering from back to front:

1. Base map ground.
2. Batch 2 broad support pads and street patches.
3. Batch 2 low-opacity environmental-law decals.
4. Batch 2 contact residue, scuffs, and soft threshold shadows.
5. Existing Batch 1 background support.
6. Existing production fixtures.
7. Player, enemies, prompts, pickups, gameplay telegraphs, and interaction markers.
8. HUD.

Asset-specific constraints:

- Do not obscure production fixture silhouettes.
- Do not create fake interactable panels.
- Do not sharpen edges enough to compete with route telegraphs.
- Keep route-support shapes broad and environmental, never arrow-like or map-like.
- Keep facade/window details behind navigation and character reads.

## Generation Sequence

Batch 2A: P0 location anchors

- `r01_bg_open_house_guided_visit_street_pad_v01`
- `r01_bg_model_house_node_threshold_v01`
- `r01_bg_family_profile_window_loop_panel_v01`

Batch 2B: P1 route/navigation support

- `r01_bg_fake_return_broken_route_decal_set_v01`
- `r01_bg_suburb_navigation_house_axis_marks_v01`
- `r01_bg_open_house_queue_residue_decal_set_v01`

No Batch 2C generation is approved at this lock stage. P2 candidates remain deferred.

## Locked Asset Prompts

### 1. `r01_bg_open_house_guided_visit_street_pad_v01`

Priority: P0
Role: Ground support patch for the open-house approach, showing guided visit pressure without signage or UI.
Expected screen read: A polished residential street pad that suggests people were funneled through a home-tour route, with subtle wear and procedural control.

Positive prompt:

```text
Production-quality top-down 2D game background ground-support asset, transparent background, clean alpha edges, open-house guided visit street pad for a bright dystopian Korean residential suburb, warm off-white pavement slab with pale mint procedural lane residue, muted coral pressure scuffs, soft amber entrance-side glow, low-opacity gray contact wear, polished residential materials, subtle repeated family-slot path logic, coercive but clean Smilehome move-in procedure atmosphere, broad environmental shapes, non-readable abstract marks only, designed to sit beneath existing fixtures and gameplay actors, readable at 480x270, soft hand-painted digital game art, no characters, no standalone props.
```

Negative prompt:

```text
No readable text, no pseudo text, no letters, no numbers, no logos, no labels, no signage copy, no UI sticker, no map marker, no boardgame token, no arrows, no minimap icon, no quest marker, no sales banner, no brochure, no rent, no debt collection, no eviction, no factory, no service worker, no cleaning worker, no haunted house, no ruin, no gore, no zombie, no hard wall, no fence, no character, no vehicle, no high-contrast gameplay telegraph, no black background, no photo, no 3D render.
```

QA notes:

- Must not read as ordinary real-estate signage.
- Must stay flatter and quieter than the open-house fixture layer.
- Route implication should come from wear and pad geometry, not arrows.

### 2. `r01_bg_model_house_node_threshold_v01`

Priority: P0
Role: Threshold ground/floor support under and around the model-house node entrance.
Expected screen read: A family-slot judgment threshold, ceremonial but bureaucratic, not haunted or blocked.

Positive prompt:

```text
Production-quality top-down 2D game background threshold asset, transparent background, clean alpha edges, model-house node entrance ground support for R01, warm residential floor threshold with soft amber interior spill, pale mint registration-like edge traces, muted coral worn foot-pressure arcs, low-opacity gray contact shadow, subtle repeated household-slot geometry, clean coercive Smilehome model-house atmosphere, polished but uneasy residential material, abstract non-readable marks only, broad walkable center kept clear, designed below production fixtures and characters, readable at 480x270, hand-painted 2D game art.
```

Negative prompt:

```text
No haunted doorway, no horror house, no ruined mansion, no black void, no blocked entrance, no gate that implies collision, no readable text, no pseudo text, no letters, no numbers, no logo, no UI panel, no signboard, no sales office, no rent notice, no debt notice, no factory machine, no service counter, no cleaning labor, no character, no enemy, no blood, no gore, no arrow, no objective marker, no high-contrast warning decal, no photo, no 3D.
```

QA notes:

- Must read as a threshold support layer, not as an interactable door fixture.
- Strong contrast should hug threshold edges, not Yunseo's standing zone.
- No dark horror doorway framing.

### 3. `r01_bg_family_profile_window_loop_panel_v01`

Priority: P0
Role: Background facade/window panel that implies fake family-profile loops around the model-house node.
Expected screen read: Empty family slots are previewed and refilled by the environment, without portraits, text, or UI cards.

Positive prompt:

```text
Production-quality 2D game background facade panel asset, transparent background, clean alpha edges, family-profile window loop panel for a bright dystopian Korean model-house node, shallow residential facade strip with repeated empty window-like slots, frosted glass shapes, pale mint alignment seams, muted coral occupancy residue, soft amber interior glow behind abstract slot silhouettes, low-opacity gray mounting shadow, Smilehome family-slot procedure mood, polished residential advertising suburb but coercive and artificial, no readable symbols, no portraits, no characters, designed as background detail behind gameplay fixtures, readable at 480x270.
```

Negative prompt:

```text
No readable text, no pseudo text, no letters, no numbers, no icon labels, no portraits, no faces, no family photos, no character silhouettes, no UI card, no profile screen, no sticker, no map marker, no signboard, no logo, no ordinary real-estate poster, no rent, no debt, no eviction, no factory, no service worker, no haunted window, no broken ruin, no gore, no black horror lighting, no interactive panel, no collision object, no photo, no 3D render.
```

QA notes:

- Slot/window shapes must remain environmental, not UI.
- Avoid anything that looks like character portraits or selectable profile cards.
- It may sit behind a fixture, but cannot replace a fixture.

### 4. `r01_bg_fake_return_broken_route_decal_set_v01`

Priority: P1
Role: Decal set for false-return route residue, showing a broken promise of exit or recovery without becoming a route UI.
Expected screen read: Helpful-looking path traces have been interrupted by Smilehome procedure pressure.

Positive prompt:

```text
Production-quality top-down 2D game background decal set, transparent background, clean alpha edges, fake return broken route residue for R01 suburb navigation, fragmented warm off-white pavement decals, pale mint route fragments softened into abstract procedural traces, muted coral interruption scuffs, low-opacity gray erased contact shadows, subtle looped path residue that feels initially helpful but unreliable, Smilehome coercive move-in route logic, non-readable abstract marks only, no arrows, no UI, designed below gameplay telegraphs and existing fixtures, readable at 480x270, hand-painted 2D game art.
```

Negative prompt:

```text
No arrow, no exit icon, no recovery marker, no minimap path, no quest trail, no high-contrast navigation UI, no readable text, no pseudo text, no letters, no numbers, no labels, no signs, no road signage, no danger warning, no rent, no debt, no eviction, no factory, no service-worker scene, no haunted ruin, no blood, no gore, no character, no wall, no fence, no obstacle, no vehicle, no black background, no photo, no 3D.
```

QA notes:

- Must not be mistaken for a real player guidance or recovery UI.
- Broken route read should come from interrupted texture and residue, not explicit symbols.
- Contrast must be lower than any actual gameplay route marker.

### 5. `r01_bg_suburb_navigation_house_axis_marks_v01`

Priority: P1
Role: Low-opacity house-axis and repeated-address corridor decals for suburb navigation.
Expected screen read: Navigation is governed by repeated house/address logic and family-slot alignment, without map text.

Positive prompt:

```text
Production-quality top-down 2D game background decal asset, transparent background, clean alpha edges, suburb navigation house-axis marks for a bright dystopian Korean residential district, warm off-white ground with faint repeated house-axis alignment traces, pale mint corridor logic lines, muted coral offset registration marks, low-opacity gray contact wear, abstract address-like rhythm without readable text, repeated family-slot environmental law, polished Smilehome suburb control atmosphere, quiet background layer beneath fixtures and characters, readable at 480x270, hand-painted 2D game art.
```

Negative prompt:

```text
No readable address, no pseudo text, no letters, no numbers, no street names, no labels, no road signs, no map UI, no minimap marker, no boardgame tile, no token, no arrow, no route objective, no QR pattern, no logo, no rent, no debt collection, no eviction, no factory, no service counter, no cleaning labor, no haunted neighborhood, no ruin, no character, no vehicle, no hard obstacle, no high-contrast gameplay telegraph, no photo, no 3D render.
```

QA notes:

- Must imply address logic without actual numbers or letter-like glyphs.
- Keep marks low opacity enough to avoid clutter at 480x270.
- Do not become generic road paint; it must feel tied to Smilehome family-slot ecology.

### 6. `r01_bg_open_house_queue_residue_decal_set_v01`

Priority: P1
Role: Open-house waiting residue decal set: scuffs, brochure-like scraps without text, entry-loop wear, and social pressure traces.
Expected screen read: Guided-tour waiting pressure exists through environmental residue, distinct from Batch 1 check-in queue wear.

Positive prompt:

```text
Production-quality top-down 2D game background decal set, transparent background, clean alpha edges, open-house queue residue for R01 guided visit approach, soft warm off-white floor scuffs, pale mint waiting-loop residue, muted coral rubbed pressure marks, tiny blank folded-paper scraps with no text, low-opacity gray shoe-contact wear, polished residential open-house procedure atmosphere, coercive but bright Smilehome move-in ecology, abstract non-readable marks only, broader and more domestic than check-in queue marks, designed below production fixtures and gameplay actors, readable at 480x270, hand-painted 2D game art.
```

Negative prompt:

```text
No readable brochure text, no pseudo text, no letters, no numbers, no logos, no pamphlet copy, no signboard, no UI sticker, no map marker, no arrow, no objective marker, no rent notice, no debt notice, no eviction notice, no factory, no service worker, no cleaning worker, no horror house, no ruin, no blood, no gore, no character crowd, no waiting-line barrier fixture, no hard obstacle, no high-contrast gameplay marker, no photo, no 3D.
```

QA notes:

- Must differ from Batch 1 check-in queue wear by feeling domestic/open-house, not station/check-in.
- Blank paper scraps are allowed only if they cannot be read as text-bearing documents.
- No queue barrier or production fixture replacement.

## Clean PR / Production Readiness Gate

Before any later generation or integration step, the six assets must be reviewed against:

- 480x270 screen read.
- Yunseo 0.11 scale comparison.
- Existing R01 production fixture contrast and draw order.
- Common art lock hard rejects.
- Out-of-scope exclusion: no `.godot`, `generated_assets`, `exports`, archive folders, report files, or bulk asset folders in any eventual PR packaging.

## Evidence And Files Read

Files read:

- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_PLANNING_REPORT.md`

Commands/evidence:

- Current worktree status was checked before report creation.
- Prompt report path did not exist before this step.

## Prohibited Work Confirmation

- Image generation: not performed.
- PNG copy/edit: not performed.
- Godot execution: not performed.
- Import generation: not performed.
- Code modification: not performed.
- Git add/commit/push: not performed.
