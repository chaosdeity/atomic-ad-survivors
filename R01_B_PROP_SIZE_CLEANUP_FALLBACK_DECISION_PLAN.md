# R01 B안 Production Fixture Cleanup/Fallback Decision Plan

## 1. Current LOCK State

Current status:

| Scope | Status |
|---|---|
| visual-only R01 scale/helper | **100% LOCK** |
| active import/replacement | **100% LOCK** |
| collision/navigation | PASS |
| gameplay/runtime integration | PASS |

Confirmed completed scope:

- import-only PASS
- helper replacement PASS
- active final visual QA PASS
- collision/navigation active rework PASS
- gameplay/runtime integration QA PASS

This plan is for the separate cleanup/fallback decision track only. It does not authorize cleanup, deletion, code edits, Godot execution, import generation, staging, or commit.

## 2. Must Preserve

The following must be preserved unless a later document explicitly approves a different target.

### Production Fixture Assets

Preserve:

- `assets/art_inbox/r01_production_fixtures_v01/`

Seven alias PNGs:

| Alias PNG | Preserve |
|---|---|
| `r01_fixture_checkin_kiosk.png` | yes |
| `r01_fixture_floor_route_pad.png` | yes |
| `r01_fixture_procedure_panel.png` | yes |
| `r01_fixture_renewal_gate.png` | yes |
| `r01_fixture_room_meal_access_panel.png` | yes |
| `r01_fixture_route_return_lane.png` | yes |
| `r01_fixture_waiting_rail.png` | yes |

Seven alias `.png.import` files:

| Alias import | Preserve |
|---|---|
| `r01_fixture_checkin_kiosk.png.import` | yes |
| `r01_fixture_floor_route_pad.png.import` | yes |
| `r01_fixture_procedure_panel.png.import` | yes |
| `r01_fixture_renewal_gate.png.import` | yes |
| `r01_fixture_room_meal_access_panel.png.import` | yes |
| `r01_fixture_route_return_lane.png.import` | yes |
| `r01_fixture_waiting_rail.png.import` | yes |

Required imported cache:

- Preserve `.godot/imported` cache files required by the seven approved aliases.
- Do not delete `.godot/imported` entries by broad pattern.

### Runtime/Helper Files

| File | Preserve |
|---|---|
| `scripts/r01_production_fixture_visuals.gd` | yes |
| `scripts/r01_station_fixture_collision_overrides.gd` | yes |
| `scripts/r01_layout_blockout.gd` bridge/toggle | yes |
| `scripts/r01_procedure_station_visuals.gd` fallback helper | yes, unless separately approved |

Fallback helper is still part of the safety design. It must remain until a separate keep/remove decision is approved.

## 3. Cleanup Candidate Scope

The following are cleanup candidate categories only. No deletion is approved by this plan.

| Candidate scope | Examples observed | Cleanup status |
|---|---|---|
| temp/copy QA project folders | `C:/workspace/_codex_r01_*_project_*`, `C:/workspace/_codex_r01_*_copy/*` | candidate only |
| external QA output folders | `C:/workspace/_codex_r01_*_output/*` | candidate only |
| mirror import folder | `C:/workspace/_codex_r01_import_only_mirror_20260607_064237` | candidate only |
| production fixture generation batches | `C:/workspace/_codex_r01_production_fixture_batch*` | candidate only |
| generated reports/debug sheets | copied QA PNG sheets, temp `results.json`, temp proof reports | preserve/delete decision required |

Exact candidate roots observed:

- `C:/workspace/_codex_r01_active_final_visual_qa_project_20260607_104143`
- `C:/workspace/_codex_r01_active_final_visual_qa_project_20260607_104931`
- `C:/workspace/_codex_r01_active_qa`
- `C:/workspace/_codex_r01_active_qa_output`
- `C:/workspace/_codex_r01_collision_nav_active_impl_copy`
- `C:/workspace/_codex_r01_collision_nav_active_impl_output`
- `C:/workspace/_codex_r01_collision_nav_qa_output`
- `C:/workspace/_codex_r01_collision_nav_qa_project_20260607_112022`
- `C:/workspace/_codex_r01_collision_nav_rework_copy`
- `C:/workspace/_codex_r01_collision_nav_rework_output`
- `C:/workspace/_codex_r01_gameplay_runtime_qa_copy`
- `C:/workspace/_codex_r01_gameplay_runtime_qa_output`
- `C:/workspace/_codex_r01_helper_replacement_qa_project_20260607_101705`
- `C:/workspace/_codex_r01_import_only_mirror_20260607_064237`
- `C:/workspace/_codex_r01_production_fixture_batch1`
- `C:/workspace/_codex_r01_production_fixture_batch2`
- `C:/workspace/_codex_r01_production_fixture_batch3`
- `C:/workspace/_codex_r01_production_fixture_final_replacement_qa`

These are not approved for deletion. A later exact cleanup target list must classify each target as:

- delete
- preserve
- archive
- needs review

## 4. Fallback Helper Decision

Fallback helper:

- `scripts/r01_procedure_station_visuals.gd`

### Keep Advantages

- Provides safe draw fallback if production textures fail to load.
- Preserves verified `super` fallback calls in `scripts/r01_production_fixture_visuals.gd`.
- Reduces risk of missing fixture draw in runtime.
- Supports debugging by allowing vector/proxy comparison if production texture read regresses.
- Keeps current 100% LOCK behavior unchanged.

### Remove Advantages

- Reduces duplicated visual helper code after production replacement is fully trusted.
- Simplifies long-term helper ownership.
- Reduces chance that future developers accidentally rely on fallback visuals instead of production textures.

### Removal Risks

- Breaks existing production helper inheritance unless the helper is refactored first.
- Removes safety path verified by runtime QA.
- Could cause missing draw or preload errors if production texture loading fails.
- Would require code changes, runtime QA rerun, and new lock evidence.
- Could blur the boundary between cleanup and behavior change.

### PMO Recommendation

PMO recommendation: **keep fallback helper for now.**

Cleanup recommendation:

- Do not touch active production assets, imports, cache, runtime helpers, bridges, or fallback helper.
- Cleanup should initially target only temp/copy QA project folders and external QA output folders.
- Even temp/output cleanup must wait for an exact target list and explicit approval.

## 5. Prohibitions

Forbidden in this planning stage:

- broad cleanup
- `.godot/imported` cache deletion by broad pattern
- alias PNG deletion
- alias `.png.import` deletion
- fallback helper deletion
- `scripts/r01_procedure_station_visuals.gd` removal
- production helper deletion
- collision override helper deletion
- `scripts/r01_layout_blockout.gd` bridge/toggle removal
- Godot execution
- import generation
- code modification
- staging
- commit

## 6. Next Stage

Recommended next steps:

1. Write an exact cleanup target list.
2. For each target, classify as delete/preserve/archive/needs review.
3. Include explicit approval wording for cleanup.
4. Write a separate fallback keep/remove decision document.
5. If fallback removal is ever proposed, require:
   - code change plan
   - temp/copy runtime QA rerun
   - count gate delta check
   - rollback plan
6. Stage/commit only after separate user approval.

## 7. Decision Summary

Current decision:

- active import/replacement remains **100% LOCK**
- cleanup is **not approved**
- fallback helper removal is **not approved**
- PMO recommends **fallback helper keep**
- PMO recommends future cleanup only for temp/copy and output folders after exact target approval

## 8. Files Read And Evidence Used

실제로 읽은 파일/근거:

| File / Path | Evidence used |
|---|---|
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md` | 100% LOCK, reflected files, cleanup/fallback exclusions, no staging/commit approval |
| `R01_B_PROP_SIZE_GAMEPLAY_RUNTIME_INTEGRATION_QA_REPORT.md` | runtime QA PASS, fallback safety PASS, copied cache proof, 100% progress |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_95_PERCENT_HANDOFF.md` | alias PNG/import preservation, fallback helper preservation, cleanup guardrails |
| `assets/art_inbox/r01_production_fixtures_v01/` | seven alias PNGs and seven alias `.png.import` files confirmed |
| `C:/workspace/_codex_r01*` directory listing | candidate temp/copy/output/mirror folders identified for later exact cleanup target list |

No cleanup, deletion, code modification, Godot execution, import generation, staging, or commit was performed while writing this plan.
