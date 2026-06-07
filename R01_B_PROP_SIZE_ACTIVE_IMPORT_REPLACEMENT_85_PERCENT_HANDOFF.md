# R01 B Prop Size Active Import Replacement 85 Percent Handoff

Date: 2026-06-07

Final handoff decision: PASS / 85% LOCK for active import/replacement.

This handoff consolidates the import-only PASS, helper replacement PASS, and active final visual QA PASS into the current R01 B production fixture replacement state.

## 1. Final Verdict

| Track | Verdict |
| --- | --- |
| import-only | PASS |
| helper replacement | PASS |
| active final visual QA | PASS |
| active import/replacement progress | 85% |
| visual-only R01 scale/helper | 100% LOCK maintained |

The 85% lock is visual/import/replacement only. Collision, navigation, gameplay, runtime, and full integration remain separate workstreams and are not included in this lock.

## 2. Reflected Files

### Production Fixture Aliases

Active target folder:

`assets/art_inbox/r01_production_fixtures_v01/`

Seven active alias PNGs are reflected:

| Fixture role | Alias PNG |
| --- | --- |
| floor route pad | `r01_fixture_floor_route_pad.png` |
| route / return lane visual | `r01_fixture_route_return_lane.png` |
| waiting rail | `r01_fixture_waiting_rail.png` |
| renewal gate | `r01_fixture_renewal_gate.png` |
| check-in kiosk | `r01_fixture_checkin_kiosk.png` |
| procedure panel | `r01_fixture_procedure_panel.png` |
| room/meal access panel | `r01_fixture_room_meal_access_panel.png` |

Seven matching alias `.png.import` files are reflected in the same folder:

- `r01_fixture_checkin_kiosk.png.import`
- `r01_fixture_floor_route_pad.png.import`
- `r01_fixture_procedure_panel.png.import`
- `r01_fixture_renewal_gate.png.import`
- `r01_fixture_room_meal_access_panel.png.import`
- `r01_fixture_route_return_lane.png.import`
- `r01_fixture_waiting_rail.png.import`

Matching `.godot/imported` cache files are expected and were part of the import-only/helper replacement evidence for the seven aliases.

### Helper And Bridge

| File | Reflected role |
| --- | --- |
| `scripts/r01_production_fixture_visuals.gd` | Production texture helper that loads the seven active alias PNGs and draws production textures. |
| `scripts/r01_layout_blockout.gd` | Active bridge/toggle. `USE_PRODUCTION_FIXTURE_TEXTURES := true` selects `R01ProductionFixtureVisuals`. |
| `scripts/r01_procedure_station_visuals.gd` | Fallback vector/proxy helper remains present and is not removed. |

Fallback preservation remains required. The production helper extends the fallback helper and keeps fallback draw calls available if a production texture cannot load.

## 3. QA Evidence

Final active visual QA output directory:

`C:/workspace/_codex_r01_active_qa_output/r01_b_prop_size_active_implementation/`

Key QA artifacts:

- `r01_b_prop_size_active_implementation_contact_sheet.png`
- `sheet_active_target_checkin_station__8poses.png`
- `sheet_active_target_renewal_gate__8poses.png`
- `sheet_active_target_room_meal_lane__8poses.png`
- `results.json`

QA coverage:

| QA item | Result |
| --- | --- |
| 3 station scenes x 8 poses | PASS |
| final active contact sheet | PASS |
| `results.json` generated | PASS |
| Yunseo scale | PASS, `0.11` |
| suppressed placeholder records | PASS, `8` |
| production texture render | PASS |
| fallback vector/proxy not mixed into active visual read | PASS |
| duplicate placeholder absent | PASS |
| pose 04 cable | PASS |
| pose 08 cable | PASS |
| pose 05 `stamp_ready` | PASS |
| scanner gun-read | PASS |
| waiting rail overlap | PASS |
| rail/pad readability | PASS |
| kiosk/panel/access panel readability | PASS |

`results.json` evidence:

| Field | Value |
| --- | ---: |
| scene count | 3 |
| pose measurement count | 24 |
| Yunseo scale | 0.11 |
| suppressed placeholder records | 8 |

Suppressed placeholder record count confirms the old mapped placeholders are being suppressed by the station helper path rather than duplicated beside the production fixtures.

## 4. Count Gate

Final active visual QA count gate:

| Scope | Count |
| --- | ---: |
| raw `.import` | 1046 |
| scoped `.import`, excluding `generated_assets` and `exports` | 981 |
| target folder `.import` | 7 |
| `generated_assets` `.import` | 57 |
| `exports` `.import` | 8 |

Final visual QA expected `.import` delta: `0`

Final visual QA actual `.import` delta: `0`

No additional import is authorized by this handoff.

## 5. Excluded Scope

The following remain out of scope for this 85% lock:

- collision/navigation footprint QA
- gameplay integration
- runtime lock
- cleanup
- fallback helper removal
- scene/resource/project modification
- broad import or additional asset import

This handoff does not lock collision, navigation, gameplay, runtime behavior, state logic, source behavior, or interaction behavior.

## 6. Remaining 15%

The remaining 15% is reserved for separately approved work:

| Remaining track | Required next step |
| --- | --- |
| collision/navigation QA | Write and approve a specific collision/navigation QA plan before execution. |
| gameplay/runtime integration | Write and approve a gameplay/runtime integration plan before execution. |
| cleanup | Forbidden until an exact target list is approved. |

Cleanup must not be performed from this handoff. Any cleanup must list exact files or folders and preserve required alias PNGs, `.png.import` files, `.godot/imported` cache files, production helper, bridge/toggle, and fallback helper unless separately approved.

## 7. Lock Statement

R01 B active production fixture replacement is locked at 85% for visual/import/replacement scope.

Visual-only R01 scale/helper remains 100% LOCK.

The next work must not treat this as a collision/navigation/gameplay/runtime lock.

## 8. Files And Evidence Read

| File or folder | Evidence used |
| --- | --- |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_ONLY_EXECUTION_REPORT.md` | import-only PASS, seven alias imports, count gate baseline |
| `R01_B_PROP_SIZE_ACTIVE_HELPER_REPLACEMENT_EXECUTION_REPORT.md` | helper replacement PASS, 60% baseline, production helper/fallback preservation evidence |
| `R01_B_PROP_SIZE_ACTIVE_FINAL_VISUAL_QA_REPORT.md` | final active visual QA PASS, 85% progress, visual QA checklist evidence |
| `scripts/r01_layout_blockout.gd` | bridge/toggle evidence: `USE_PRODUCTION_FIXTURE_TEXTURES := true` and `R01ProductionFixtureVisuals` selection |
| `scripts/r01_production_fixture_visuals.gd` | production texture helper evidence |
| `scripts/r01_procedure_station_visuals.gd` | fallback helper presence and suppression/scene flow evidence |
| `assets/art_inbox/r01_production_fixtures_v01/` | seven alias PNGs and seven `.png.import` files |
| `C:/workspace/_codex_r01_active_qa_output/r01_b_prop_size_active_implementation/results.json` | 3 scenes, 24 pose measurements, Yunseo scale `0.11`, 8 suppressed placeholder records |

## 9. Final Status

PASS.

Active import/replacement is 85% locked for the R01 B production fixture visual replacement state.
