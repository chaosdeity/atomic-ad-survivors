# R01 Map/Background Production Audit

## Final Judgement
- Verdict: HOLD for full map/background production lock.
- Recommended direction: zone-by-zone production reinforcement, not full remake yet.
- R01 production fixture/interaction track: 90% PASS 유지.
- R01 map/background production track: 0% -> 20% audit complete.

The repaired production fixtures now render with much higher material density than the current map/background. The gameplay interaction layer reads, but the wider R01 environment still looks partly like a vector/blockout stage around production-quality props. This is not a failure of the fixture pass; it is a background production gap.

## Key Findings
- Production fixture 7종 have detailed material, edge wear, small hardware, and readable scale cues.
- Current background uses large flat color bands, low-alpha grid/route strokes, vector rectangles, and placeholder-style house/device shapes.
- Yunseo 0.11 scale remains readable against fixtures, but houses, roads, signs, and repeated map props are too simple next to the fixture assets.
- The core horror, "houses force endless move-in procedures," reads strongly at station clusters, but weakens away from fixture zones because map props still say "blockout/model-house route" more than "ritualized housing procedure."
- Forbidden directions are mostly avoided: not a ruined horror house, not rent/debt collection, not factory/service-worker centered. The risk is "simple model-house promo zone" because open-house/model-house props are still literal and schematic.

## Zone Judgement
| Zone | Judgement | Reason | Action |
|---|---|---|---|
| check-in station | CONDITIONAL PASS | Production kiosk/panel/rail now read clearly, but surrounding street/ground rectangles remain vector-flat. | Reinforce first. Add production ground mat, check-in queue context, subtle signage/house-ad residue. |
| renewal gate lane | CONDITIONAL PASS | Gate fixture is strong and scale works, but lane/axis/background are flat bands; model-house node area still has placeholder language. | Reinforce first, then consider model-node remake. |
| room/meal access lane | CONDITIONAL PASS | Access panel and floor pad read; background still relies on generic lane geometry and lacks "meal/room allocation procedure" environmental support. | Reinforce first. |
| open house street | HOLD | Intended pressure route exists, but visual language is still broad vector street, banner/sign, floor-plan/proxy hazard. Can read as simple showroom marketing. | Production background batch needed. |
| model house node | HOLD | Object ids and visuals are explicitly placeholder-like: model house mass, node placeholder, terminal, floor-plan line. This zone is thematically central and under-produced. | Remake/reinforce as second batch. |
| fake return route | CONDITIONAL PASS | Concept avoids recovery UI and has broken ad path signal, but still uses sparse vector fragments and needs production distress language. | Reinforce, not full discard. |

## Element Classification
### Keep
- Production fixture 7종 and their `.png.import` aliases.
- Station collision/interaction roles already proven by QA.
- World layout anchors and route relationships: check-in -> room/meal -> renewal/model-house flow is structurally useful.
- Route/fake-return conceptual tags, because they preserve the intended non-recovery false path.
- Yunseo scale relationship near fixtures.

### Reinforce
- Ground/road/lane bands from `_draw_ground`, `_draw_model_house_axis`, `_draw_open_house_street`, `_draw_travel_corridors`.
- Check-in, room/meal, and renewal station surrounding pads/lanes so fixtures do not float on flat vector fields.
- Waiting rail, floor pad, and route lane context with production-quality floor dirt, scuffing, tape, house-ad fragments, and subtle procedure markings.
- Fake return route visual fragments so it reads as false housing-procedure signal rather than generic broken arrow.
- Open-house street props that support the coercive procedure theme.

### Remake
- Model house node background and prop set: `model_house_mass_placeholder`, `model_house_node_placeholder`, `floor_plan_line_placeholder`, family-plan terminal context.
- Repeated house/proxy silhouettes if they remain visible near production fixture shots.
- Generic vector kiosk/sign/floor-plan proxies when they appear near production assets and compete with the new fixture style.

### Discard
- Any visible placeholder/proxy visual language that survives as final art: ids containing `placeholder` are acceptable as internal ids, but the visible art should not look like placeholder geometry.
- Pure flat rectangles as final "procedure environment" around production fixtures.
- Any future treatment that pushes the map toward ruined haunted-house, rent/debt collection, factory labor, or simple showroom marketing.

## Production Background Rework Scope
Full map remake is not recommended yet. The current layout is serviceable and the fixture pass proves the visual direction. The right next step is a production background reinforcement pass in small batches:

1. Station-adjacent background kit: check-in/room-meal/renewal floor mats, lane paint, queue scuffs, fixture shadows, rail anchoring, small housing-procedure debris.
2. Open-house street kit: production street patch, ad corridor, non-marketing coercive signage, guided-visit residue.
3. Model-house node kit: production model-house mass, node threshold, family-plan terminal background, floor-plan line replacement.
4. Fake return route kit: broken procedure path, false return markers, signal residue, non-recovery ambiguity.

## First Batch Recommendation
Batch 1 should target the areas visible in the current 480x270 interaction contact sheet:
- check-in station background pad and queue lane
- room/meal access lane floor/pad surround
- renewal gate lane threshold and gate approach
- fixture-contact shadows and ground wear for all three station scenes

Reason: these are already validated gameplay targets, appear in the 480x270 QA sheet, and create the largest visible mismatch between production fixtures and vector background.

## PASS Criteria For Next Background QA
- Production fixture and background material density feel consistent at 480x270.
- Yunseo 0.11 scale still reads against lane, pad, rail, panels, roads, and house props.
- No visible vector/proxy placeholders in station-adjacent shots.
- "Endless move-in procedure" reads without relying on debug labels or explicit explanatory text.
- Open-house and model-house zones feel coercive/procedural, not ordinary marketing.
- Fake return route reads as false procedure signal, not recovery UI.

## Evidence
- Repaired production fixture contact sheet: `C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/screens/contact_sheet.png`
- Earlier conditional/tuning contact sheet: `C:/workspace/_codex_r01_procedure_interaction_480x270_tuning_qa_output/screens/contact_sheet.png`
- Fixture PNG sizes in `assets/art_inbox/r01_production_fixtures_v01/`
- `scripts/r01_map_assembly.gd` object defaults and placements
- `scripts/r01_layout_blockout.gd` ground, corridor, prop placeholder, and station draw passes

## Files Actually Read
- `C:/workspace/_codex_r01_procedure_interactions/project.godot`
- `C:/workspace/_codex_r01_procedure_interactions/scripts/r01_map_assembly.gd` lines around kind defaults, object placements, and object build
- `C:/workspace/_codex_r01_procedure_interactions/scripts/r01_layout_blockout.gd` lines around draw pass, ground/corridor draw, prop placeholder draw, and station fixture layer draw
- `C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/screens/contact_sheet.png`
- `C:/workspace/_codex_r01_procedure_interaction_480x270_tuning_qa_output/screens/contact_sheet.png`
- `C:/workspace/_codex_r01_procedure_interactions/assets/art_inbox/r01_production_fixtures_v01/` filename/size list only

## Forbidden Work Compliance
- No image generation.
- No Godot import.
- No code modification.
- No PNG modification/copy/delete.
- No commit/push/PR.
- Active original dirty worktree not modified.
