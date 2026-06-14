# R01 Background Batch 2 Planning Report

Date: 2026-06-14
Worktree: `C:\workspace\_codex_r01_background_batch2`
Branch: `codex/r01-background-batch2`
Base: PR #5 merged main, `952a99d0ed307e5abddde4c47a995837155ee87b`

## Status

- Verdict: PLAN READY
- R01 background Batch 2: `0% -> 20% planning`
- Image generation: not performed
- PNG copy/edit: not performed
- Godot/import: not performed
- Code modification: not performed
- Git add/commit/push: not performed

## Batch 2 Goal

Batch 2 locks the next production background scope for the R01 areas that still read too broad or placeholder-like after Batch 1:

- open house street
- model house node
- fake return route
- suburb navigation / guided visit corridors

The goal is not a full map remake. It is a focused production reinforcement pass that makes the remaining R01 background read as Smilehome's family-slot / move-in procedure ecology, while preserving the already-approved fixture/interactions and Batch 1 station support.

## Batch 1 Already Solved

Batch 1 is treated as complete for planning purposes. It reinforced the immediate station areas around the existing production fixtures:

```text
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_queue_wear_marks.png
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_support_marks.png
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_shadow_wear.png
assets/art_inbox/r01_map_background_v01/r01_bg_station_contact_shadow_set.png
```

Fixture track remains complete and should not be replaced:

```text
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png
```

Batch 1 solved:

- check-in station ground / queue wear context
- room-meal access floor support / allocation pressure marks
- renewal gate passage support / gate shadow wear
- fixture contact shadow grounding
- no text / pseudo text in generated background assets
- no rent/debt, factory, service-worker, or haunted-ruin drift

Batch 1 did not solve:

- open-house street production language
- model-house node replacement for placeholder mass / node / floor-plan proxy
- fake return route distress language
- suburb navigation as coercive guided visit, not generic street/path vector work

## Remaining Candidate Reclassification

| Area | Current Status | Batch 2 Classification | Rationale |
|---|---:|---|---|
| open house street | HOLD | Priority production kit | Audit says this still reads as broad vector street / showroom marketing. Needs guided-visit pressure and coercive procedure visual language. |
| model house node | HOLD | Priority remake kit | The node is thematically central and still has placeholder mass / floor-plan / terminal language. |
| fake return route | CONDITIONAL PASS | Reinforcement kit | Concept is correct but too sparse. Must read as false procedure signal, not recovery UI. |
| suburb navigation corridors | Reinforce | Navigation / decal kit | Route relationships are structurally useful, but travel corridors still need Smilehome environmental law rather than generic lane bands. |
| station-adjacent check-in / room-meal / renewal | PASS for Batch 1 | Exclude from Batch 2 except compatibility checks | Already reinforced and should not be re-generated in this batch. |
| production fixtures | PASS | Exclude / protect | Existing fixture silhouettes, scale, trigger readability, and material density must remain primary. |

## Batch 2 Candidate Asset Table

| Priority | Asset ID | Role | Expected Screen Read | Risk |
|---:|---|---|---|---|
| P0 | `r01_bg_open_house_guided_visit_street_pad_v01` | Transparent street/floor support patch for the open-house approach. | A bright residential street has been converted into a guided visit lane, with waiting pressure, home-tour residue, and non-text procedure flow. | Could become ordinary showroom marketing or signage-heavy if it leans on banners/text. |
| P0 | `r01_bg_model_house_node_threshold_v01` | Production threshold under/around model-house node entrance. | The model-house node feels like a family-slot judgment threshold, not a placeholder rectangle. | Could become a haunted doorway or blocked collision object. |
| P0 | `r01_bg_family_profile_window_loop_panel_v01` | Background panel/facade detail for fake family-profile loop near model-house node. | Empty family slots are being previewed / filled by Smilehome without showing readable labels. | Could become literal UI, readable text, or a character portrait prop competing with story assets. |
| P1 | `r01_bg_fake_return_broken_route_decal_set_v01` | Broken/cancelled route marks and false-return residue. | The route looks helpful at first but visibly damaged, coercive, and non-recovery. | Could read as real recovery UI, danger telegraph, or arrow signage. |
| P1 | `r01_bg_suburb_navigation_house_axis_marks_v01` | Low-opacity house-axis / repeated-address corridor decals. | Suburb navigation is guided by repeated address/family-slot logic, not normal roads. | Could over-clutter the navigation path or become unreadable pseudo typography. |
| P1 | `r01_bg_open_house_queue_residue_decal_set_v01` | Decal set for guided-tour waiting scuffs, brochure scraps, and entry-loop wear. | Open-house pressure appears through material traces, not text signs. | Could duplicate Batch 1 queue wear too closely unless shapes are more facade/street-tour oriented. |
| P2 | `r01_bg_model_house_floorplan_shadow_replacement_v01` | Replacement for weak floor-plan placeholder lines. | Floor-plan logic reads as environmental law and family assignment geometry, not a UI map. | Could look like actual gameplay pathing or a minimap overlay. |
| P2 | `r01_bg_streetlight_voice_route_residue_v01` | Subtle streetlight-speaker / voice lure ground residue near fake return and navigation. | Navigation feels spoken by the neighborhood without drawing a literal speaker fixture. | Could compete with future streetlight prop or become too abstract to read. |

Recommended first generation batch: P0 + P1 only, 6 assets. Keep P2 as follow-up if first QA still shows model-house/fake-return weakness.

## Reject Criteria

Global reject rules:

- no readable text
- no pseudo text
- no letters, numbers, labels, logos, UI panels, fake signage copy
- no 월세 / rent collection framing
- no 추심 / debt collection framing
- no eviction notice or debt-office horror
- no factory, conveyor, industrial labor, cleaning labor, or service-worker crowd
- no service counter labor scene
- no haunted house, ruined horror mansion, gore, zombie, or dark abandoned ruin
- no ordinary clean real-estate brochure / showroom marketing
- no replacement of existing production fixtures
- no new gameplay blockers, hard fences, walls, machines, or characters
- no UI arrow, minimap, danger telegraph, or recovery marker look
- no asset that obscures Yunseo, production fixtures, route readability, or prompt areas

R01-specific reject rules:

- fake return route must not read as real recovery UI.
- model-house node must not read as a haunted doorway or a normal sales office.
- open-house street must not become banner/poster/signboard-only advertising.
- suburb navigation must not become generic road paint; it must imply Smilehome's family-slot / move-in judgment ecology.

## Draw Order And Scale Conditions

Batch 2 assets must not conflict with existing production fixtures or interaction readability.

Layer intent:

```text
base ground
Batch 2 broad support pads / street patches
Batch 2 low-opacity environmental law decals
Batch 2 contact residue / scuffs / shadows
existing Batch 1 station background support
existing production fixtures
player / enemies / prompts / gameplay telegraphs
HUD
```

Scale/readability:

- Transparent PNGs unless a full background patch is explicitly approved later.
- Texture density should sit below production fixture density by roughly 30-45%.
- Keep strongest contrast around thresholds and route pressure, not under player standing zones.
- Do not create dark details under Yunseo's expected 0.11-scale read area.
- No element should imply collision unless the existing layout already has collision there.
- Decals must remain below gameplay telegraphs in contrast, edge sharpness, and saturation.
- Fake return markings should be broken / ambiguous but lower priority than actual hazard markers.
- Model-house threshold must remain passable-looking unless a future gameplay blocker explicitly owns that shape.

## QA Plan

QA is not executed in this planning pass. Proposed later QA sequence:

1. Generate only the approved Batch 2 assets after separate approval.
2. Verify PNG magic headers and alpha transparency.
3. Place assets in a temp/copy QA project only.
4. Do not run Godot from active root unless separately approved.
5. Render 480x270 contact sheets for:
   - open-house street
   - model-house node
   - fake return route
   - suburb navigation corridor
   - integrated R01 route overview
6. Confirm:
   - file count matches approved asset list
   - no text / pseudo text
   - no rent/debt, factory, service, haunted-house drift
   - no production fixture replacement
   - no collision/readability confusion
   - fake return is not recovery UI
   - model-house node is not placeholder or ordinary showroom
   - Yunseo and gameplay prompts remain readable at 480x270
7. Compare against Batch 1 station sheets so texture density and palette remain compatible.
8. Write visual QA report before any active project integration.

## Prompt Drafts

These are draft prompts only. They are not final generation prompts.

### Common Draft Positive Base

```text
Top-down 2D game background support asset for R01, a bright dystopian Korean residential advertising suburb controlled by Smilehome family-slot move-in procedure logic, production-quality hand-painted digital game art, transparent background, clean alpha edges, readable at 480x270, warm off-white residential pavement, pale mint homecare automation marks, muted coral family-slot correction residue, soft amber entrance glow, low-opacity gray contact wear, guided open-house route pressure, model-house threshold atmosphere, repeated address/family-slot environmental law, polished but coercive residential campaign mood, abstract non-readable marks only, no characters, no replacement fixtures, designed to sit below existing production fixtures and gameplay actors
```

### Common Draft Negative Base

```text
no readable text, no pseudo text, no letters, no numbers, no logo, no UI label, no signage words, no characters, no people, no workers, no service staff, no factory, no industrial labor, no cleaning labor, no rent notice, no debt collection, no eviction notice, no haunted house, no ruined mansion, no gore, no zombie, no dark horror, no realistic photo, no 3D render, no glossy brochure showroom, no simple real-estate marketing poster, no replacement kiosk, no replacement gate, no replacement rail, no hard blocker, no minimap, no recovery UI, no high contrast gameplay arrow, no black background
```

### `r01_bg_open_house_guided_visit_street_pad_v01`

```text
Draft only: Create a transparent top-down open-house guided visit street pad for R01. It should sit under the open-house street approach and show warm pavement, pale mint guided-tour floor paint, soft amber threshold wear, muted coral correction residue, repeated shoe scuffs, tape corners, brochure-paper scraps without text, and subtle family-slot queue pressure. It must imply a cheerful residential tour route that quietly forces move-in procedure, not a normal showroom sign path and not a haunted street.
```

### `r01_bg_model_house_node_threshold_v01`

```text
Draft only: Create a transparent top-down model-house node threshold asset for R01. It should support a model-house facade / node entrance without replacing any fixture. Include soft threshold shadows, clean off-white showroom pavement, pale mint homecare line residue, amber entry glow, broken family-slot alignment marks, and worn approach scuffs. The center remains passable and readable. It should feel like a judgment threshold for family registration, not a blocked doorway, prison gate, haunted house, or normal sales office.
```

### `r01_bg_family_profile_window_loop_panel_v01`

```text
Draft only: Create a background facade detail panel for a family-profile window loop. Use abstract empty family-slot silhouettes, soft screen glow, muted coral correction smears, pale mint home profile calibration traces, and non-readable panel fragments. It should read as repeated ad-family preview logic from Smilehome, not actual portraits, not readable UI, not character art, and not a replacement interactable.
```

### `r01_bg_fake_return_broken_route_decal_set_v01`

```text
Draft only: Create a transparent decal set for the fake return route. Include broken recommended-route fragments, cancelled-looking abstract path marks, soft streetlight-voice residue, worn tape, scuffed pavement, and subtle transmitter noise traces. It should look like a helpful route that has become suspicious and damaged, but not a real recovery UI, not a danger telegraph, not readable signs, and not a minimap arrow.
```

### `r01_bg_suburb_navigation_house_axis_marks_v01`

```text
Draft only: Create low-opacity top-down house-axis navigation marks for R01 suburb corridors. Include repeated address-grid logic, family-slot alignment geometry, soft pavement wear, abstract route pressure, and subtle homecare automation residue. Keep it below gameplay contrast. The result should make navigation feel governed by Smilehome residential judgment, not normal road paint and not UI pathfinding.
```

### `r01_bg_open_house_queue_residue_decal_set_v01`

```text
Draft only: Create a transparent open-house queue residue decal set. Include guided-tour waiting scuffs, folded ad-paper fragments without text, entry-loop wear, small adhesive corners, soft shadow patches, and repeated pressure marks around a model-house approach. It should differ from Batch 1 station queue marks by reading as street-tour / facade-entry pressure rather than kiosk processing.
```

## Priority Recommendation

Start with 6 assets:

1. `r01_bg_open_house_guided_visit_street_pad_v01`
2. `r01_bg_model_house_node_threshold_v01`
3. `r01_bg_family_profile_window_loop_panel_v01`
4. `r01_bg_fake_return_broken_route_decal_set_v01`
5. `r01_bg_suburb_navigation_house_axis_marks_v01`
6. `r01_bg_open_house_queue_residue_decal_set_v01`

Hold for second wave:

1. `r01_bg_model_house_floorplan_shadow_replacement_v01`
2. `r01_bg_streetlight_voice_route_residue_v01`

## Files Actually Read

- `R01_MAP_BACKGROUND_PRODUCTION_AUDIT.md` targeted lines for zone judgement, remaining scope, and batch recommendations.
- `R01_MAP_BACKGROUND_PRODUCTION_BATCH1_PROMPTS.md` targeted lines for Batch 1 goal, asset list, prompt rules, composition rules, reject criteria, and QA plan.
- `R01_MAP_BACKGROUND_BATCH1_FINAL_VISUAL_QA_REPORT.md` targeted lines for Batch 1 QA verdict, loaded background textures, fixture texture checks, and forbidden-theme checks.
- `R01_PROCEDURE_BACKGROUND_FINAL_DIFF_AUDIT.md` targeted lines for Batch 1 include scope, QA evidence, fixture/background counts, and final readiness.
- `R01_PROCEDURE_INTERACTION_FIXTURE_TEXTURE_REPAIR_REPORT.md` targeted lines for fixture repair PASS and 7 fixture paths.
- `R01_VISUAL_RULES_FOR_ART_TEAM.md`, `R01_ART_REJECTION_CRITERIA.md`, `story/03_regions/r01_suburb.md` targeted lines for R01 visual direction, reject rules, open house/model house/fake return/navigation story context.

## Evidence Used

- `git status --short`
- `git branch --show-current`
- `git rev-parse HEAD`
- `rg --files` targeted R01/background/fixture/art document discovery
- `Select-String` targeted context reads
- path existence from `assets/art_inbox/r01_map_background_v01/`
- path existence from `assets/art_inbox/r01_production_fixtures_v01/`

## Forbidden Work Compliance

- No image generation.
- No PNG copy/edit.
- No Godot execution.
- No import generation.
- No code modification.
- No `git add`.
- No commit.
- No push.
- No local main cleanup.
