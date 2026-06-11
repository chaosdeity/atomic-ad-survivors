# R01 Map Background Batch 1 Active Integration Plan

## 1. Current State
- Fixture/interaction track: 90% PASS 유지.
- Map/background production track: 45% PASS.
- Batch 1 external generation/self QA: PASS.
- Batch 1 generated asset count: 7 PNG.
- Active project integration: NOT STARTED.
- Active project PNG copy/import/code bridge: NOT PERFORMED.

Batch 1 is a station-adjacent background reinforcement pass only. It does not replace the approved production fixture 7종 and does not change collision/navigation/gameplay resolver behavior.

## 2. Recommended Active Target Path
Recommended folder:

```text
assets/art_inbox/r01_map_background_v01/
```

Reason:
- Keeps Batch 1 background reinforcement separate from `assets/art_inbox/r01_production_fixtures_v01/`.
- Makes future Batch 2/3 map/background work discoverable without mixing it into fixture replacement assets.
- Allows exact import/count gates by folder.
- Avoids accidental replacement of fixture alias PNG files.

## 3. Asset Alias Filename Mapping
External source folder:

```text
C:/workspace/_codex_r01_map_background_batch1/
```

Planned active aliases:

| Source PNG | Active target alias | Role |
|---|---|---|
| `r01_bg_checkin_station_ground_support_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png` | check-in ground pad, queue context, fixture contact shadow support |
| `r01_bg_checkin_queue_wear_marks_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_checkin_queue_wear_marks.png` | check-in waiting/scuff decal layer |
| `r01_bg_room_meal_access_floor_support_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png` | room/meal access lane floor support |
| `r01_bg_room_meal_access_support_marks_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_support_marks.png` | room/meal repeated-use decal layer |
| `r01_bg_renewal_gate_passage_support_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png` | renewal gate passage threshold support |
| `r01_bg_renewal_gate_shadow_wear_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_shadow_wear.png` | renewal gate shadow/wear decal layer |
| `r01_bg_station_contact_shadow_set_v01.png` | `assets/art_inbox/r01_map_background_v01/r01_bg_station_contact_shadow_set.png` | reusable station fixture contact shadows |

Alias names intentionally drop `_v01` from the file stem because the containing folder already carries `v01`. If PMO wants immutable source names, keep the original stems instead; both approaches must be exact-listed before import-only approval.

## 4. Expected Import Delta
Current count gate observed before active integration:

| Gate | Current |
|---|---:|
| raw `.import` | 7 |
| production fixture target `.import` | 7 |
| proposed background target `.import` | 0 |
| `.godot/imported` files | 0 |

Expected after approved Batch 1 import-only step:

| Gate | Expected |
|---|---:|
| raw `.import` | 14 |
| production fixture target `.import` | 7 |
| background target `.import` | 7 |
| `.godot/imported` files | project-policy dependent, expected generated cache only if Godot import is explicitly approved |

Expected `.png.import` delta: `+7`.

No `generated_assets`, `exports`, source batch folders, or external QA folders should be added to the active project.

## 5. `.godot/imported` Cache Policy
- Do not manually create, copy, delete, or stage `.godot/imported` cache files.
- If an import-only approval later allows Godot import, cache generation must be counted and reported, but not treated as source art.
- If the repo policy continues to exclude `.godot/imported`, keep cache out of git and include only source PNG + `.png.import` files in stage planning.
- If texture load QA needs cache, prefer a temp/copy QA project first; active Godot broad import requires separate preflight and explicit approval.

## 6. Helper Integration Options
### A. Add Directly To `r01_procedure_station_visuals.gd`
Pros:
- Reuses existing station scene role layout.
- Minimal new file count.

Cons:
- Pollutes fallback helper with production-only background assets.
- Harder to keep fallback vector/proxy helper intact.
- Higher risk that production background appears when production texture helper is disabled.

Verdict: not recommended.

### B. Add `scripts/r01_production_background_visuals.gd`
Pros:
- Clean separation between fixture sprites, fallback station helper, and background reinforcement.
- Can share station scene data without changing `KIND_COLLISION_META`, `ZONE_PROPS`, or player movement resolver.
- Supports a future toggle such as `USE_PRODUCTION_BACKGROUND_TEXTURES`.
- Easier to QA texture load errors independently from fixture texture load errors.

Cons:
- Adds one helper file and one layout bridge.

Verdict: PMO recommended.

### C. Integrate Into `r01_production_fixture_visuals.gd`
Pros:
- Production texture logic stays in one helper.
- Can draw background and fixture textures from one scene pass.

Cons:
- Mixes fixture replacement with environment reinforcement.
- Makes it harder to preserve the fixture 100% LOCK boundary.
- More likely to create accidental fixture/background ordering regressions.

Verdict: acceptable only for a short-lived prototype, not recommended for active integration.

## 7. PMO Recommended Implementation
Use Option B:

```text
scripts/r01_production_background_visuals.gd
```

Minimal active bridge target:

```text
scripts/r01_layout_blockout.gd
```

Recommended bridge shape:
- Add preload for `R01ProductionBackgroundVisuals`.
- Add `const USE_PRODUCTION_BACKGROUND_TEXTURES := true`.
- Add `var production_background_visuals`.
- Initialize helper only when toggle is true.
- Draw background helper in a dedicated method, for example `_draw_production_background_layers(canvas)`.
- Call the background layer after `_draw_travel_corridors(canvas)` and before `_draw_procedure_station_floor_layers(canvas)`.

This places Batch 1 support art above broad map base/corridor bands but below procedure fixture floor/back/front layers, player, prompt, and foreground hints.

## 8. Layer / Draw-Order Plan
Current draw order evidence from `scripts/r01_layout_blockout.gd`:

```text
_draw_ground
_draw_zone_fields
_draw_travel_corridors
_draw_procedure_station_floor_layers
_draw_density_tests
_draw_props
_draw_procedure_station_back_layers
...
draw_foreground_hints -> _draw_procedure_station_front_layers
```

Recommended Batch 1 insertion:

```text
_draw_ground
_draw_zone_fields
_draw_travel_corridors
_draw_production_background_layers
_draw_procedure_station_floor_layers
_draw_density_tests
_draw_props
_draw_procedure_station_back_layers
...
draw_foreground_hints -> _draw_procedure_station_front_layers
```

Layer rules:
- Batch 1 background is below production fixtures.
- Batch 1 ground support sits above base ground, zone fields, and travel corridors.
- Batch 1 must not cover Yunseo, fixture silhouettes, E prompt, banner, floater, or debug HUD.
- Renewal gate center opening must remain visually passable.
- Floor/route lane background marks must remain visually no-collision.
- Contact shadow set must be low contrast and used only under fixture footprints.

## 9. Collision / Navigation Impact
- Batch 1 background assets are visual-only.
- No collision records should be added.
- `KIND_COLLISION_META`: direct modification prohibited.
- `ZONE_PROPS`: direct modification prohibited.
- Player movement resolver: modification prohibited.
- Existing station fixture collision overrides remain the only approved collision/navigation rework layer.
- Floor pad / route lane remain no-collision.
- Waiting rail remains soft-boundary only, not a player hard blocker.

## 10. QA Plan
### Import-Only QA
- Copy exactly 7 approved source PNGs into `assets/art_inbox/r01_map_background_v01/`.
- Run approved import path only after separate approval.
- Verify `.png.import` delta is `+7`.
- Verify texture load error count is 0 in temp/copy QA before any active broad run.
- Verify no `.godot/imported` cache is manually copied or staged.

### Helper Integration QA
- Add `scripts/r01_production_background_visuals.gd`.
- Add minimal bridge to `scripts/r01_layout_blockout.gd`.
- Do not touch fixture helper fallback behavior.
- Do not touch interaction scope.
- Do not touch collision/navigation/gameplay resolver.

### Final Visual QA
Generate/verify 480x270 sheets:
- Fixture overlay with Batch 1 background.
- Yunseo 0.11 comparison.
- Pose 04/08 cable visibility.
- Pose 05 `stamp_ready` readability.
- Check-in, procedure panel, room/meal access, renewal gate interaction prompt.
- Far prompt empty.
- Texture load error 0.
- Production fixture 7종 still render as hero objects.
- No fallback/proxy fixture appears.
- No text/pseudo text in background assets.
- No forbidden theme drift: rent/debt, ruined horror, factory, service-worker scene, or ordinary clean showroom brochure.

## 11. Count Gate Criteria
Before any active integration:

```text
raw .import: 7
production fixture target .import: 7
background target .import: 0
.godot/imported files: 0
```

Expected after import-only approval:

```text
raw .import: 14
production fixture target .import: 7
background target .import: 7
expected .png.import delta: +7
```

Expected after helper integration:

```text
raw .import: 14
background target .import: 7
code delta: +1 helper file, +1 layout bridge file
collision/navigation data delta: 0
gameplay resolver delta: 0
```

Any unexpected import delta, generated asset folder addition, export folder addition, `.godot/imported` manual copy, or unrelated code/doc file must stop the integration.

## 12. Approval Gates
### Import-Only Approval
Approval wording:

```text
승인. R01 map/background Batch 1 import-only를 실행해라.
Exact source: C:/workspace/_codex_r01_map_background_batch1/*.png listed in the plan.
Exact target: assets/art_inbox/r01_map_background_v01/.
Code modification, Godot broad run, cleanup, commit/push/PR 금지.
```

### Helper Integration Approval
Approval wording:

```text
승인. R01 map/background Batch 1 helper integration을 실행해라.
Allowed files: scripts/r01_production_background_visuals.gd 신규, scripts/r01_layout_blockout.gd minimal bridge.
KIND_COLLISION_META, ZONE_PROPS, player resolver, gameplay/state/runtime 변경 금지.
```

### Final Visual QA Approval
Approval wording:

```text
승인. R01 map/background Batch 1 480x270 final visual QA를 temp/copy project에서 실행해라.
Fixture overlay, Yunseo 0.11, pose 04/08 cable, pose 05 stamp_ready, interaction prompt, texture load error 0을 확인해라.
Active broad Godot 실행, cleanup, commit/push/PR 금지.
```

## 13. Progress
- Map/background production track: 45% -> 50% after this active integration plan.
- Active import has not started, so do not raise above 55%.
- Fixture/interaction track: 90% PASS 유지.

## 14. Files Actually Read
- `C:/workspace/_codex_r01_procedure_interactions/R01_MAP_BACKGROUND_PRODUCTION_BATCH1_PROMPTS.md`
- `C:/workspace/_codex_r01_procedure_interactions/R01_MAP_BACKGROUND_PRODUCTION_AUDIT.md`
- `C:/workspace/_codex_r01_map_background_batch1/R01_MAP_BACKGROUND_PRODUCTION_BATCH1_SELF_QA_REPORT.md`
- `C:/workspace/_codex_r01_map_background_batch1/results.json`
- `C:/workspace/_codex_r01_procedure_interactions/scripts/r01_layout_blockout.gd` targeted `rg` lines for draw order/helper bridge
- `C:/workspace/_codex_r01_procedure_interactions/scripts/r01_production_fixture_visuals.gd` targeted `rg` lines for production texture helper pattern

## 15. Evidence Used
- External Batch 1 self QA verdict: PASS.
- External `results.json`: 7 assets, all alpha/visible/dark-blocker checks PASS, active project not written, Godot import not run, no replacement fixture drawn.
- Current count gate: raw `.import` 7, production fixture target `.import` 7, proposed background target absent/0, `.godot/imported` files 0.
- Existing draw order shows a clean insertion point before procedure station fixture layers.

## 16. Forbidden Work Compliance
- PNG copy: not performed.
- Godot import: not performed.
- Code modification: not performed.
- Commit/push/PR: not performed.
- Cleanup: not performed.
- Active project production assets and existing dirty worktree files were not changed by this plan step.
