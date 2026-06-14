# R01 Background Batch 2 Active Integration Plan

Status: PLAN ONLY
Worktree: `C:\workspace\_codex_r01_background_batch2`
Basis:

- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md`
- `C:\workspace\_codex_r01_background_batch2_assets\batch2a\R01_BACKGROUND_BATCH2A_SELF_QA_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2_assets\batch2b\R01_BACKGROUND_BATCH2B_SELF_QA_REPORT.md`

Progress: R01 background Batch 2 `60% -> 70% integration plan`

## 1. Goal

Plan active integration for the six Batch 2A/2B PASS assets. This report decides target zones, draw order, import target paths, helper strategy, and QA gates.

This step does not copy PNGs into the active project, run Godot, generate imports, edit code, stage, commit, push, or regenerate images.

## 2. Source PASS Assets

| Asset | Source folder | Role |
|---|---|---|
| `r01_bg_open_house_guided_visit_street_pad_v01.png` | `C:\workspace\_codex_r01_background_batch2_assets\batch2a\` | Open-house street approach pad; guided visit pressure under open-house fixtures. |
| `r01_bg_model_house_node_threshold_v01.png` | `C:\workspace\_codex_r01_background_batch2_assets\batch2a\` | Model-house node threshold floor support; family-slot judgment threshold without collision read. |
| `r01_bg_family_profile_window_loop_panel_v01.png` | `C:\workspace\_codex_r01_background_batch2_assets\batch2a\` | Model-house facade/window loop background panel; family-profile slot pressure without portraits/UI. |
| `r01_bg_fake_return_broken_route_decal_set_v01.png` | `C:\workspace\_codex_r01_background_batch2_assets\batch2b\` | Fake-return route residue; broken promise of exit/recovery without route UI. |
| `r01_bg_suburb_navigation_house_axis_marks_v01.png` | `C:\workspace\_codex_r01_background_batch2_assets\batch2b\` | Low-opacity suburb navigation axis wear; repeated house/address logic without symbols/text. |
| `r01_bg_open_house_queue_residue_decal_set_v01.png` | `C:\workspace\_codex_r01_background_batch2_assets\batch2b\` | Open-house waiting residue; domestic guided-tour queue pressure distinct from check-in queue wear. |

## 3. Recommended Active Target Path

Recommended folder:

```text
assets/art_inbox/r01_map_background_v02/
```

Reason:

- Keeps Batch 2 separate from Batch 1 station-adjacent background in `r01_map_background_v01`.
- Matches the next production pass rather than overwriting or mixing with Batch 1 assets.
- Allows an exact `.png.import` delta gate of `+6`.
- Avoids collision with `assets/art_inbox/r01_production_fixtures_v01/`.
- Makes future Batch 2 review/removal easy if a location-specific asset needs rework.

Alias policy:

- Recommended active aliases drop `_v01` because the containing folder carries `v02`.
- Exact source names remain preserved in the external output folders.

| Source PNG | Recommended active alias |
|---|---|
| `r01_bg_open_house_guided_visit_street_pad_v01.png` | `assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png` |
| `r01_bg_model_house_node_threshold_v01.png` | `assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png` |
| `r01_bg_family_profile_window_loop_panel_v01.png` | `assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png` |
| `r01_bg_fake_return_broken_route_decal_set_v01.png` | `assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png` |
| `r01_bg_suburb_navigation_house_axis_marks_v01.png` | `assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png` |
| `r01_bg_open_house_queue_residue_decal_set_v01.png` | `assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png` |

## 4. Current Count Gate And Expected Import Delta

Observed before active integration:

| Path | PNG | `.png.import` |
|---|---:|---:|
| `assets/art_inbox/r01_map_background_v01/` | 7 | 7 |
| `assets/art_inbox/r01_map_background_v02/` | 0 | 0 |
| `assets/art_inbox/r01_production_fixtures_v01/` | 7 | 7 |

Expected after approved import-only step:

| Gate | Expected |
|---|---:|
| `r01_map_background_v02` PNG | 6 |
| `r01_map_background_v02` `.png.import` | 6 |
| Expected `.png.import` delta | `+6` |
| Production fixture `.png.import` delta | `0` |
| Batch 1 background `.png.import` delta | `0` |
| `.godot/imported` manual copy | `0` |
| `generated_assets` / `exports` / external output folders in active PR | `0` |

## 5. Scene / Zone Mapping

Evidence from `scripts/r01_layout_blockout.gd`:

- `open_house_street_anchor`: `Vector2(800, -210)`, risk-reward street / signal ticket pressure.
- `model_house_node_anchor`: `Vector2(2320, -1220)`, broadcast record / node approach.
- `fake_return_route_anchor`: `Vector2(-1680, -520)`, false recovery mimic / route risk.
- `subdivision_loop_center` connects toward `open_house_street_anchor`, `model_house_node_anchor`, and `fake_return_route_anchor`.

Recommended placement:

| Asset | Scene/zone | Anchor basis | Proposed center/offset | Proposed size | Alpha |
|---|---|---|---|---:|---:|
| `open_house_guided_visit_street_pad` | `open_house_street_anchor` | zone anchor | anchor + `Vector2(-20, 45)` | `Vector2(520, 292)` | 0.80 |
| `open_house_queue_residue_decal_set` | `open_house_street_anchor` | zone anchor | anchor + `Vector2(-76, 92)` | `Vector2(440, 248)` | 0.52 |
| `model_house_node_threshold` | `model_house_node_anchor` | zone anchor / model node placeholder | anchor + `Vector2(-8, 54)` | `Vector2(460, 258)` | 0.72 |
| `family_profile_window_loop_panel` | `model_house_node_anchor` | zone anchor / family window placeholder | anchor + `Vector2(74, -78)` | `Vector2(500, 156)` | 0.70 |
| `fake_return_broken_route_decal_set` | `fake_return_route_anchor` | zone anchor | anchor + `Vector2(-28, 18)` | `Vector2(460, 258)` | 0.50 |
| `suburb_navigation_house_axis_marks` | subdivision-to-open/model corridor | midpoint corridor field | `subdivision_loop_center.lerp(open_house_street_anchor, 0.55)` + `Vector2(36, -34)` | `Vector2(640, 220)` | 0.38 |

Notes:

- The suburb navigation asset should be a broad corridor support layer, not a zone object.
- Fake-return asset must remain below route/fake-recovery placeholders and lower contrast than gameplay route markers.
- Family-profile panel should sit behind model-house node props and never become an interactable UI panel.

## 6. Batch 1 Background Overlap / Conflict Review

Batch 1 active background assets cover station-adjacent procedure scenes only:

- `active_target_checkin_station`
- `active_target_renewal_gate`
- `active_target_room_meal_lane`

Batch 2 planned zones cover:

- open-house street
- model-house node
- fake-return route
- suburb navigation corridor

Conflict verdict: PASS for scope separation.

Remaining cautions:

- `open_house_queue_residue_decal_set` must remain visually different from Batch 1 `checkin_queue` by reading as domestic open-house residue, not station processing queue wear.
- `fake_return_broken_route_decal_set` must stay below actual route markers and avoid real recovery UI.
- `suburb_navigation_house_axis_marks` should not duplicate `travel_corridors`; it should be quieter and broader than route lines.

## 7. Production Fixture Draw Order Review

Production fixture set currently remains the approved foreground/hero visual layer:

1. `r01_fixture_checkin_kiosk.png`
2. `r01_fixture_floor_route_pad.png`
3. `r01_fixture_procedure_panel.png`
4. `r01_fixture_renewal_gate.png`
5. `r01_fixture_room_meal_access_panel.png`
6. `r01_fixture_route_return_lane.png`
7. `r01_fixture_waiting_rail.png`

Batch 2 draw-order principle:

```text
base ground
zone fields / broad route bands
travel corridors
Batch 2 broad pads
Batch 2 low-opacity residue / axis marks
Batch 1 station background support
production fixture floor/back/front layers
props / prompts / player / enemies / telegraphs
foreground hints / HUD
```

Recommended collision/draw-order verdict:

| Fixture | Batch 2 collision risk | Plan |
|---|---:|---|
| check-in kiosk | Low | Batch 2 does not target check-in station. |
| floor route pad | Medium visual overlap in open-house/fake-return QA | Keep Batch 2 below fixture and reduce alpha if route pad arrows lose priority. |
| procedure panel | Low/medium in overlay | Batch 2 must not create panel-like silhouettes. |
| renewal gate | Low | Batch 2 does not target renewal gate. |
| room-meal access panel | Low | Batch 2 does not target room-meal lane. |
| route return lane | Medium in fake-return zone | Fake-return residue must be below lane fixture and never imply true recovery path. |
| waiting rail | Medium in open-house queue | Residue must stay floor-only and not replace rail/barrier read. |

## 8. Code Helper Strategy

Recommended implementation path: extend existing `scripts/r01_production_background_visuals.gd`.

Reason:

- Existing helper already owns background texture loading and draw metadata.
- `scripts/r01_layout_blockout.gd` already calls `production_background_visuals.draw_background_layer(canvas, scene)` for station scenes.
- Batch 2 needs zone/corridor anchor access, not only procedure station `scene` dictionaries.

Recommended minimal code shape for a future approved execution:

1. Add Batch 2 texture paths to `TEXTURE_PATHS`.
2. Keep existing station `BACKGROUND_META` unchanged for Batch 1.
3. Add a separate `ZONE_BACKGROUND_META` or equivalent Batch 2 metadata table keyed by zone/corridor names.
4. Add `draw_zone_background_layer(canvas, layout)` or `draw_map_background_layer(canvas, layout)` that can call `layout.anchor_position(...)`.
5. In `scripts/r01_layout_blockout.gd`, call the Batch 2 draw method after `_draw_travel_corridors(canvas)` and before `_draw_production_background_layers(canvas)`.

Alternative: create `scripts/r01_production_background_batch2_visuals.gd`.

Use only if the existing helper becomes hard to read after adding zone/corridor metadata. Current recommendation is not to create a second helper yet, because Batch 2 is the same conceptual layer as Batch 1: production background support.

Forbidden for integration:

- Do not modify `KIND_COLLISION_META`.
- Do not modify `ZONE_PROPS` for Batch 2 background assets.
- Do not modify player movement, collision, spawn, prompt, combat, or resolver code.
- Do not make Batch 2 assets interactable.

## 9. Temp Visual QA Sequence Before Active Integration

Before any final active merge/commit, run this sequence only after separate explicit approval:

### Step A: Import-only preparation

1. Copy exactly six final PASS PNGs into `assets/art_inbox/r01_map_background_v02/`.
2. Run only the approved import path.
3. Verify `r01_map_background_v02` `.png.import` delta is exactly `+6`.
4. Verify Batch 1 and production fixture import counts remain unchanged.
5. Verify active output contains no external QA folders, rejected outputs, raw chroma-key sources, `.godot/imported` manual copies, `generated_assets`, or `exports`.

### Step B: Helper integration

1. Extend `scripts/r01_production_background_visuals.gd` or add the separately approved helper.
2. Minimal bridge in `scripts/r01_layout_blockout.gd`.
3. Verify no collision/navigation/gameplay resolver diff.
4. Verify texture path keys load all 13 background textures: 7 Batch 1 + 6 Batch 2.

### Step C: Temp/copy visual QA

Generate 480x270 contact sheets in a temp QA output folder:

- Open-house street with pad + queue residue + fixtures.
- Model-house node with threshold + family-profile panel + model props.
- Fake-return route with broken route residue + route return lane fixture.
- Suburb navigation corridor with axis marks plus travel corridor lines.
- Integrated overview across subdivision loop -> open-house -> model-house.
- Integrated overview across subdivision loop -> fake-return route.
- Yunseo 0.11 scale overlay for all Batch 2 placements.
- Prompt readability frames around nearby interaction prompts.
- Procedure fixture visibility frames for all seven production fixtures.

Required checks:

- Texture load error count: 0.
- Godot log error lines: 0 in temp QA.
- Yunseo 0.11 readable.
- Prompt ring and `E` text readable, especially given Batch 1 previously had conditional prompt text readability.
- Production fixtures remain primary visual elements.
- Fake-return residue does not read as actual recovery UI.
- Suburb navigation axis marks do not read as map UI, boardgame tokens, or address text.

## 10. PASS / HOLD Criteria

PASS requires all of:

- Six final PNGs copied only to `assets/art_inbox/r01_map_background_v02/`.
- `.png.import` delta exactly `+6`.
- No active `.godot/imported` manual copy in packaged scope.
- No `generated_assets`, `exports`, raw chroma-key, rejected, or external QA folders in active project.
- Batch 1 background count remains 7 PNG / 7 imports.
- Production fixture count remains 7 PNG / 7 imports.
- Texture load errors 0.
- Yunseo 0.11 readable in all Batch 2 zone frames.
- Prompt readability PASS; no regression from Batch 1 conditional prompt issue.
- Production fixtures are not replaced, obscured, or made secondary.
- No text/pseudo text, rent/debt, factory/service/cleaning-worker, haunted/ruin, UI marker, map marker, boardgame token, or recovery UI drift.
- No collision/navigation/gameplay resolver changes.

HOLD if any of:

- Any extra file beyond exact six PNGs enters `r01_map_background_v02`.
- Any `.png.import` delta is not exactly `+6`.
- Batch 2 asset reads as UI, route objective, map marker, address text, or interactable panel.
- Fake-return residue reads as a real recovery path.
- Suburb axis marks read as map UI or boardgame token layout.
- Open-house queue residue visually duplicates Batch 1 check-in queue.
- Yunseo 0.11, prompt text, or fixture silhouette becomes obscured.
- Helper integration touches collision, navigation, spawn, prompt resolver, player movement, or unrelated gameplay code.

## 11. Approval Gates

Import-only approval wording:

```text
승인. R01 background Batch 2 import-only를 실행해라.
Exact source: Batch 2A/2B PASS PNG 6개.
Exact target: assets/art_inbox/r01_map_background_v02/.
Code modification, Godot broad run, cleanup, commit/push/PR 금지.
```

Helper integration approval wording:

```text
승인. R01 background Batch 2 helper integration을 실행해라.
Preferred helper: scripts/r01_production_background_visuals.gd 확장.
Allowed bridge: scripts/r01_layout_blockout.gd minimal draw-order call.
KIND_COLLISION_META, ZONE_PROPS, player resolver, gameplay/state/runtime 변경 금지.
```

Temp visual QA approval wording:

```text
승인. R01 background Batch 2 temp visual QA를 실행해라.
Open-house/model-house/fake-return/suburb navigation 480x270, Yunseo 0.11, prompt readability, fixture visibility, texture load error 0을 확인해라.
Active broad Godot 실행, cleanup, commit/push/PR 금지.
```

## 12. Current Verification

Current active target count before integration:

```text
assets/art_inbox/r01_map_background_v01 png=7 import=7
assets/art_inbox/r01_map_background_v02 missing png=0 import=0
assets/art_inbox/r01_production_fixtures_v01 png=7 import=7
staged diff=0
```

Current worktree tracked active project was not modified by this planning step.

## 13. Files Actually Read

- `C:\workspace\_codex_r01_background_batch2\AGENTS.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md`
- `C:\workspace\_codex_r01_background_batch2_assets\batch2a\R01_BACKGROUND_BATCH2A_SELF_QA_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2_assets\batch2b\R01_BACKGROUND_BATCH2B_SELF_QA_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2\scripts\r01_production_background_visuals.gd`
- Targeted sections of `C:\workspace\_codex_r01_background_batch2\scripts\r01_layout_blockout.gd`
- Targeted sections of `C:\workspace\_codex_r01_background_batch2\R01_MAP_BACKGROUND_BATCH1_ACTIVE_INTEGRATION_PLAN.md`
- Targeted sections of `C:\workspace\_codex_r01_background_batch2\R01_MAP_BACKGROUND_BATCH1_FINAL_VISUAL_QA_REPORT.md`
- File counts from `C:\workspace\_codex_r01_background_batch2\assets\art_inbox\r01_map_background_v01\`
- File counts from `C:\workspace\_codex_r01_background_batch2\assets\art_inbox\r01_production_fixtures_v01\`
- File presence check for `C:\workspace\_codex_r01_background_batch2\assets\art_inbox\r01_map_background_v02\`

## 14. Evidence Used

- Batch 2A self QA verdict: PASS.
- Batch 2B self QA verdict: PASS.
- Existing Batch 1 helper shows a working background texture metadata pattern.
- Existing layout draw order has a clean insertion point after travel corridors and before station/background/fixture layers.
- Existing zones provide direct anchors for open-house, model-house, fake-return, and subdivision navigation.
- Current count gate confirms Batch 2 target folder is absent and expected import delta can be exact-gated at `+6`.

## 15. Forbidden Work Compliance

- Active project PNG copy: not performed.
- Godot execution: not performed.
- Import generation: not performed.
- Code modification: not performed.
- Git add/commit/push: not performed.
- Image regeneration: not performed.
