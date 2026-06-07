# R01 B안 Production Fixture Cleanup Exact Target List

## 1. Must Preserve

The R01 B production fixture active import/replacement scope is **100% LOCKED**. Cleanup must not affect active assets, runtime helpers, bridges, required import cache, or final reports.

### Active Assets And Imports

Preserve:

- `assets/art_inbox/r01_production_fixtures_v01/`

Seven alias PNGs:

| Path | Classification |
|---|---|
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png` | preserve |

Seven alias `.png.import` files:

| Path | Classification |
|---|---|
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png.import` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png.import` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png.import` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png.import` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png.import` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png.import` | preserve |
| `assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png.import` | preserve |

Required cache:

- required `.godot/imported` cache corresponding to the seven alias `.png.import` files: **preserve**
- broad `.godot/imported` cleanup: **forbidden**

### Active Runtime Files

| Path | Classification |
|---|---|
| `scripts/r01_production_fixture_visuals.gd` | preserve |
| `scripts/r01_station_fixture_collision_overrides.gd` | preserve |
| `scripts/r01_layout_blockout.gd` bridge/toggle | preserve |
| `scripts/r01_procedure_station_visuals.gd` fallback helper | preserve |

### Final Lock/Handoff Reports

All final lock/handoff reports in the active workspace must be preserved, including:

| Report | Classification |
|---|---|
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md` | preserve |
| `R01_B_PROP_SIZE_GAMEPLAY_RUNTIME_INTEGRATION_QA_REPORT.md` | preserve |
| `R01_B_PROP_SIZE_CLEANUP_FALLBACK_DECISION_PLAN.md` | preserve |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_95_PERCENT_HANDOFF.md` | preserve |
| `R01_B_PROP_SIZE_COLLISION_NAVIGATION_ACTIVE_IMPLEMENTATION_REPORT.md` | preserve |
| `R01_B_PROP_SIZE_ACTIVE_FINAL_VISUAL_QA_REPORT.md` | preserve |

## 2. Cleanup Candidate Exact Paths

The paths below are exact candidates only. This document does not approve deletion.

| Exact path | Classification | Rationale |
|---|---|---|
| `C:/workspace/_codex_r01_active_qa_output` | archive recommended | QA output evidence may be useful for audit; can be archived after final reports are verified |
| `C:/workspace/_codex_r01_collision_nav_active_impl_copy` | delete candidate | temp/copy QA project, active runtime no longer depends on it |
| `C:/workspace/_codex_r01_collision_nav_active_impl_output` | archive recommended | contains active implementation QA artifacts/results |
| `C:/workspace/_codex_r01_collision_nav_qa_output` | archive recommended | contains baseline collision/navigation HOLD evidence and results |
| `C:/workspace/_codex_r01_collision_nav_rework_copy` | delete candidate | temp/copy rework implementation project, no active dependency |
| `C:/workspace/_codex_r01_collision_nav_rework_output` | archive recommended | contains rework PASS artifacts/results |
| `C:/workspace/_codex_r01_gameplay_runtime_qa_copy` | delete candidate | temp/copy runtime QA project, no active dependency |
| `C:/workspace/_codex_r01_gameplay_runtime_qa_output` | archive recommended | contains runtime 100% PASS artifacts/results |
| `C:/workspace/_codex_r01_import_only_mirror_20260607_064237` | delete candidate | mirror import folder, no active dependency after 100% lock |

## 3. Other `C:/workspace/_codex_r01*` Folders

Additional observed folders are listed only and are not deletion-approved.

| Exact path | Classification | Rationale |
|---|---|---|
| `C:/workspace/_codex_r01_active_final_visual_qa_project_20260607_104143` | needs review | temp project; verify duplicate/failed run status before deletion |
| `C:/workspace/_codex_r01_active_final_visual_qa_project_20260607_104931` | archive recommended | likely final visual QA temp project; preserve or archive until final reports verified |
| `C:/workspace/_codex_r01_active_qa` | needs review | broad name; verify contents before deletion |
| `C:/workspace/_codex_r01_collision_nav_qa_project_20260607_112022` | delete candidate | temp/copy collision/nav QA project, likely no active dependency |
| `C:/workspace/_codex_r01_helper_replacement_qa_project_20260607_101705` | needs review | helper replacement QA temp project; verify whether any unique proof remains only here |
| `C:/workspace/_codex_r01_production_fixture_batch1` | preserve | source batch folder; source batch deletion forbidden |
| `C:/workspace/_codex_r01_production_fixture_batch2` | preserve | source batch folder; source batch deletion forbidden |
| `C:/workspace/_codex_r01_production_fixture_batch3` | preserve | source batch folder; source batch deletion forbidden |
| `C:/workspace/_codex_r01_production_fixture_final_replacement_qa` | needs review | may contain final replacement QA proof; do not delete without artifact inventory |

## 4. Classification Summary

| Classification | Meaning |
|---|---|
| delete candidate | eligible for deletion only after explicit user approval using exact path |
| preserve | must not be deleted |
| archive recommended | prefer moving/archiving or preserving until final audit is no longer needed |
| needs review | inspect contents and decide in a later document before any action |

Delete candidates in this document:

- `C:/workspace/_codex_r01_collision_nav_active_impl_copy`
- `C:/workspace/_codex_r01_collision_nav_rework_copy`
- `C:/workspace/_codex_r01_gameplay_runtime_qa_copy`
- `C:/workspace/_codex_r01_import_only_mirror_20260607_064237`
- `C:/workspace/_codex_r01_collision_nav_qa_project_20260607_112022`

Archive recommended:

- `C:/workspace/_codex_r01_active_qa_output`
- `C:/workspace/_codex_r01_collision_nav_active_impl_output`
- `C:/workspace/_codex_r01_collision_nav_qa_output`
- `C:/workspace/_codex_r01_collision_nav_rework_output`
- `C:/workspace/_codex_r01_gameplay_runtime_qa_output`
- `C:/workspace/_codex_r01_active_final_visual_qa_project_20260607_104931`

Preserve:

- active production fixture asset/import/cache
- active runtime helper/bridge files
- all final lock/handoff reports
- source batch folders
- fallback helper

Needs review:

- `C:/workspace/_codex_r01_active_final_visual_qa_project_20260607_104143`
- `C:/workspace/_codex_r01_active_qa`
- `C:/workspace/_codex_r01_helper_replacement_qa_project_20260607_101705`
- `C:/workspace/_codex_r01_production_fixture_final_replacement_qa`

## 5. Conditions Before Deletion

Before any cleanup execution:

1. Confirm all final reports remain in the active workspace.
2. Confirm `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md` exists.
3. Confirm active alias PNGs and `.png.import` files still exist.
4. Confirm required `.godot/imported` cache for active aliases is not targeted.
5. Confirm source batch folders are not targeted.
6. Confirm fallback helper is not targeted.
7. Confirm cleanup command uses exact listed paths only.
8. Confirm no wildcard or broad recursive cleanup command is used.
9. Confirm user explicitly approves the cleanup execution.

Forbidden deletion targets:

- `assets/art_inbox/r01_production_fixtures_v01/`
- any of the seven alias PNGs
- any of the seven alias `.png.import` files
- `.godot/imported` cache required by active aliases
- `scripts/r01_production_fixture_visuals.gd`
- `scripts/r01_station_fixture_collision_overrides.gd`
- `scripts/r01_layout_blockout.gd`
- `scripts/r01_procedure_station_visuals.gd`
- source batch folders
- final lock/handoff reports

## 6. Cleanup Approval Wording

Cleanup must not run until the user explicitly approves wording like:

```text
승인: R01 B안 cleanup exact target list 중 delete candidate로 표시된 다음 exact paths만 삭제해라:
- C:/workspace/_codex_r01_collision_nav_active_impl_copy
- C:/workspace/_codex_r01_collision_nav_rework_copy
- C:/workspace/_codex_r01_gameplay_runtime_qa_copy
- C:/workspace/_codex_r01_import_only_mirror_20260607_064237
- C:/workspace/_codex_r01_collision_nav_qa_project_20260607_112022

보존 대상, archive recommended, needs review, active project asset/import/cache, source batch folder, fallback helper, final reports는 삭제하지 마라.
```

If the user wants archive recommended paths removed too, they must approve those exact paths separately.

## 7. Explicit Non-Actions

This document did not perform:

- deletion
- cleanup execution
- `.godot/imported` deletion
- active project asset deletion
- code modification
- Godot execution
- import generation
- stage
- commit

## 8. Files Read And Evidence Used

실제로 읽은 파일/근거:

| File / Path | Evidence used |
|---|---|
| `R01_B_PROP_SIZE_CLEANUP_FALLBACK_DECISION_PLAN.md` | preserve rules, cleanup candidate categories, fallback keep recommendation, prohibitions |
| `R01_B_PROP_SIZE_ACTIVE_IMPORT_REPLACEMENT_100_PERCENT_LOCK_HANDOFF.md` | 100% LOCK, final report preservation, cleanup/fallback/staging exclusions |
| `assets/art_inbox/r01_production_fixtures_v01/` | seven alias PNGs and seven alias `.png.import` files confirmed |
| `C:/workspace/_codex_r01*` directory listing | exact cleanup candidate paths and other observed folders |

No cleanup, deletion, code modification, Godot execution, import generation, stage, or commit was performed while writing this list.
