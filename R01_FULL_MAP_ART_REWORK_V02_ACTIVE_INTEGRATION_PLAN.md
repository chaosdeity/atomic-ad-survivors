# R01 Full-Map Art Rework V02 Active Integration Plan

Worktree: `C:\workspace\_codex_r01_full_map_art_rework`
Branch: `codex/r01-full-map-art-rework`
Source QA output: `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\`
Status: integration plan only
Progress: R01 full-map art rework `75% -> 80% integration plan`

## 1. Basis

Primary references:

- `C:\workspace\_codex_r01_full_map_art_rework\R01_FULL_MAP_COLOR_ART_REWORK_V02_REPORT.md`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\qa_sheets\full_480x270_integrated_sheet_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\qa_sheets\before_v01_after_v02_comparison_sheet.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\qa_sheets\fixture_overlay_sheet_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\qa_sheets\yunseo_0_11_comparison_sheet_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\qa_sheets\palette_swatch_value_check_sheet_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\qa_sheets\standalone_asset_sheet_v02.png`

Decision update:

- V02 is raised to aesthetic PASS.
- Active integration remains HOLD until this plan is reviewed.
- No PNG copy, Godot import, code edit, or Git operation is part of this step.

## 2. V02 Asset List

Approved v02 candidates:

- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_open_house_guided_visit_street_pad_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_model_house_node_threshold_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_fake_return_floor_residue_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_suburb_navigation_floor_axis_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_open_house_queue_floor_residue_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_checkin_station_ground_support_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_renewal_gate_passage_support_v02.png`
- `C:\workspace\_codex_r01_full_map_art_rework_assets_v02\reworked_assets_v02\r01_bg_room_meal_access_floor_support_v02.png`

Retain existing assets:

- `r01_bg_checkin_queue_wear_marks.png`
- `r01_bg_room_meal_access_support_marks.png`
- `r01_bg_renewal_gate_shadow_wear.png`
- `r01_bg_station_contact_shadow_set.png`
- `r01_bg_family_profile_window_loop_panel.png`
- All 7 production fixture PNGs.
- Yunseo v06 assets.

## 3. Replacement Mapping

Recommended integration path: overwrite existing target PNG filenames with reviewed v02 image content. This keeps `scripts/r01_production_background_visuals.gd` unchanged and avoids a code delta.

| Runtime role | Current target PNG | V02 source PNG | Action |
|---|---|---|---|
| `open_house_pad` | `assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png` | `r01_bg_open_house_guided_visit_street_pad_v02.png` | Replace content, keep target filename |
| `model_house_threshold` | `assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png` | `r01_bg_model_house_node_threshold_v02.png` | Replace content, keep target filename |
| `fake_return_residue` | `assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png` | `r01_bg_fake_return_floor_residue_v02.png` | Replace content, keep target filename |
| `suburb_axis_marks` | `assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png` | `r01_bg_suburb_navigation_floor_axis_v02.png` | Replace content, keep target filename |
| `open_house_queue_residue` | `assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png` | `r01_bg_open_house_queue_floor_residue_v02.png` | Replace content, keep target filename |
| `checkin_ground` | `assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png` | `r01_bg_checkin_station_ground_support_v02.png` | Replace content, keep target filename |
| `renewal_passage` | `assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png` | `r01_bg_renewal_gate_passage_support_v02.png` | Replace content, keep target filename |
| `room_meal_floor` | `assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png` | `r01_bg_room_meal_access_floor_support_v02.png` | Replace content, keep target filename |

Optional alternate path:

- Copy v02 files under their `_v02.png` filenames and update `TEXTURE_PATHS`.
- This is not recommended for the first active integration because it creates both PNG/import and code deltas.

## 4. Target Path Candidates

Batch 2 targets:

- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v02\r01_bg_open_house_guided_visit_street_pad.png`
- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v02\r01_bg_model_house_node_threshold.png`
- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v02\r01_bg_fake_return_broken_route_decal_set.png`
- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v02\r01_bg_suburb_navigation_house_axis_marks.png`
- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v02\r01_bg_open_house_queue_residue_decal_set.png`

Batch 1 targets:

- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v01\r01_bg_checkin_station_ground_support.png`
- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v01\r01_bg_renewal_gate_passage_support.png`
- `C:\workspace\_codex_r01_full_map_art_rework\assets\art_inbox\r01_map_background_v01\r01_bg_room_meal_access_floor_support.png`

## 5. Expected Import Delta

Recommended overwrite path:

- PNG content delta: 8 existing PNG files modified.
- `.png.import` file count delta: `0`.
- `.png.import` content delta: expected `0` if filenames and import settings remain unchanged.
- `.godot/imported` active-cache delta before QA: expected `0`, because active import must not be generated during copy.
- Temp/copy QA import cache delta: expected nonzero inside temp QA project only.

If `_v02.png` filename-preserving path is chosen instead:

- New PNG files: 8.
- New `.png.import` files: likely 8 after Godot import.
- Code path changes: `scripts/r01_production_background_visuals.gd` `TEXTURE_PATHS` must change.
- This path increases review surface and is not preferred.

## 6. Helper / Code Modification Need

Expected helper/code changes: none.

Reason:

- Current `scripts/r01_production_background_visuals.gd` references stable role filenames.
- The recommended integration overwrites those target PNGs in place.
- `BACKGROUND_META` and `MAP_BACKGROUND_META` sizes/alphas remain initially unchanged.

Watch-only alpha candidates after first runtime QA:

- `open_house_pad`: currently `alpha: 0.80`; low-contrast watch, possible range `0.82-0.88`.
- `open_house_queue_residue`: currently `alpha: 0.52`; possible range `0.56-0.64` if procedure traces vanish at 480x270.
- `model_house_threshold`: currently `alpha: 0.72`; possible range `0.74-0.82`.
- `fake_return_residue`: currently `alpha: 0.50`; possible range `0.54-0.62` if the floor pattern becomes too faint.
- `suburb_axis_marks`: currently `alpha: 0.38`; possible range `0.42-0.52`.
- Batch 1 floor bases: keep initial alphas unchanged unless prompt/Yunseo visibility or station fixture grounding fails.

No alpha changes should be made before first real render QA.

## 7. Low-Contrast Watch QA

Specific watch items:

- At 480x270, tile seams must remain visible enough to read as floor material, not blank warm wash.
- Repeated-route wear must read as procedure pressure, not disappear under fixtures.
- Open-house and model-house zones must keep warm residential signal without becoming cream pastel pads.
- Fake-return and suburb-axis areas must not become too clean or sterile.
- Fixture contact shadows and fixed-point wear must remain visible near route lane, rail, kiosk, renewal gate, and floor pad.
- Yunseo v06 must stay separated from the floor in value and silhouette.
- Prompt bubble and `E` marker must remain readable in all target views.
- No map marker, UI sticker, boardgame-token, hospital/quarantine, factory, basement, or horror-house read.

Failure triggers:

- If floor patterns are not visible in the 480x270 final render, raise relevant layer alpha or add a focused v02b contrast pass.
- If the map returns to cream/beige wash, lower warm base contribution or reduce `open_house_pad` / `model_house_threshold` alpha.
- If panel seams look like map/UI outlines, reduce alpha and prefer asset-level seam softening over code-level blur.

## 8. 480x270 Final Render QA Plan

QA mode:

- Use a temp/copy project only.
- Do not broad-import the active root.
- Do not copy temp `.godot` cache back to active.

Required render coverage:

- `open_house_street`
- `model_house_node`
- `fake_return_route`
- `suburb_navigation_corridor`
- Batch 1 station contexts:
  - `active_target_checkin_station`
  - `active_target_room_meal_lane`
  - `active_target_renewal_gate`

Required modes:

- Integrated view.
- Fixture overlay view.
- Yunseo 0.11 / v06 comparison view.
- Prompt readability view.
- Value/grayscale check or equivalent palette-value sheet.

Required outputs:

- Final 480x270 integrated contact sheet.
- Before/after active comparison sheet against current Batch 1/2.
- Fixture overlay sheet.
- Yunseo 0.11 comparison sheet.
- Prompt readability sheet.
- Palette/value check sheet.
- Texture-load result JSON.
- Godot log and temp import log.
- Active import/cache count gate report.

Pass gates:

- Background texture load errors: `0`.
- Production fixture texture load errors: `0`.
- Godot render log errors: `0`.
- Active `.godot/imported` cache delta: `0`.
- Active `.png.import` count delta: `0` for overwrite path.
- Prompt readable in all target frames.
- Yunseo visible in all target frames.
- V02 aesthetic remains bright model-house procedure space.

## 9. Integration Sequence For Next Step

1. Confirm this plan.
2. Copy the 8 approved v02 PNGs over the 8 stable target filenames.
3. Do not change code initially.
4. Run temp/copy Godot import and 480x270 render QA.
5. Inspect low-contrast watch items.
6. Only if needed, do a small follow-up alpha/code pass or v02b asset contrast pass.
7. Prepare final active integration QA report.

## 10. Forbidden Work Compliance In This Step

Performed:

- Read v02 report/manifest.
- Read current background helper mapping.
- Wrote this plan.

Not performed:

- PNG copy.
- Import generation.
- Code modification.
- Godot execution.
- Git add/commit/push.
- PR creation.
