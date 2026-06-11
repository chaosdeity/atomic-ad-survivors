# R01 Procedure Interaction + Background Batch 1 Final Diff Audit

## Final Audit Verdict
- Functional/visual QA: PASS.
- Commit packaging: CONDITIONAL PASS / HOLD FOR STAGE APPROVAL.
- Commit readiness: 0% -> 40% conditional.
- Do not raise to 50% until PMO approves whether the repaired production fixture PNG 7개 are included in this commit scope.
- Stage/commit/push/PR: not performed.

Reason:
- The requested procedure/background implementation files are present and QA PASS.
- `.import` count gate is correct.
- No `.godot/imported`, `generated_assets`, or `exports` changes are present.
- However, 7 repaired production fixture PNG files are tracked modified in this worktree. They are necessary for texture repair PASS, but they were not listed in the current exact include scope. They need explicit PMO include/exclude approval before staging.
- Background `.png.import` files exist but are ignored by git rules, so they require exact `git add -f` if PMO wants them committed.

## Current Branch / Base
```text
worktree: C:/workspace/_codex_r01_procedure_interactions
branch: codex/r01-procedure-interactions
HEAD: 3860484 Merge pull request #2 from chaosdeity/codex/r01-production-fixtures-clean
```

## Changed File Audit
### Tracked Modified
```text
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png
scripts/main.gd
scripts/r01_layout_blockout.gd
scripts/r01_station_fixture_collision_overrides.gd
```

### Untracked / Include Candidates
```text
scripts/r01_production_background_visuals.gd
assets/art_inbox/r01_map_background_v01/
R01_MAP_BACKGROUND_PRODUCTION_AUDIT.md
R01_MAP_BACKGROUND_PRODUCTION_BATCH1_PROMPTS.md
R01_MAP_BACKGROUND_BATCH1_ACTIVE_INTEGRATION_PLAN.md
R01_MAP_BACKGROUND_BATCH1_IMPORT_ONLY_EXECUTION_REPORT.md
R01_MAP_BACKGROUND_BATCH1_HELPER_INTEGRATION_REPORT.md
R01_MAP_BACKGROUND_BATCH1_FINAL_VISUAL_QA_REPORT.md
R01_PROCEDURE_PROMPT_READABILITY_TUNING_QA_REPORT.md
R01_PROCEDURE_BACKGROUND_FINAL_DIFF_AUDIT.md
```

### Ignored But Required If Import Metadata Is Committed
The 7 background `.png.import` files exist and count toward the active import gate, but `git status --ignored` reports them as ignored:

```text
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_queue_wear_marks.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_shadow_wear.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_support_marks.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_station_contact_shadow_set.png.import
```

Stage implication:
- Use exact `git add -f` for these 7 `.png.import` files only if approved.
- Do not use `git add .`.

## Include Candidate Scope
### Core Procedure / Background Code
```text
scripts/main.gd
scripts/r01_layout_blockout.gd
scripts/r01_station_fixture_collision_overrides.gd
scripts/r01_production_background_visuals.gd
```

Rationale:
- `scripts/main.gd`: E interaction loop, audit processing, feedback, HUD/debug data, prompt readability tuning.
- `scripts/r01_layout_blockout.gd`: procedure target lookup and background helper bridge.
- `scripts/r01_station_fixture_collision_overrides.gd`: procedure interaction metadata on approved fixture trigger records.
- `scripts/r01_production_background_visuals.gd`: Batch 1 background visual-only helper.

### Background Batch 1 Assets
```text
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_queue_wear_marks.png
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_queue_wear_marks.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png
assets/art_inbox/r01_map_background_v01/r01_bg_checkin_station_ground_support.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_passage_support.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_shadow_wear.png
assets/art_inbox/r01_map_background_v01/r01_bg_renewal_gate_shadow_wear.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_floor_support.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_support_marks.png
assets/art_inbox/r01_map_background_v01/r01_bg_room_meal_access_support_marks.png.import
assets/art_inbox/r01_map_background_v01/r01_bg_station_contact_shadow_set.png
assets/art_inbox/r01_map_background_v01/r01_bg_station_contact_shadow_set.png.import
```

Rationale:
- Exact 7 Batch 1 aliases and exact 7 `.png.import` metadata files.
- Background target `.import`: 7.
- No `.godot/imported` cache should be staged.

### Needs PMO Decision: Repaired Production Fixture PNG 7개
```text
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_checkin_kiosk.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_floor_route_pad.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_procedure_panel.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_renewal_gate.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_room_meal_access_panel.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_route_return_lane.png
assets/art_inbox/r01_production_fixtures_v01/r01_fixture_waiting_rail.png
```

Why they are present:
- Earlier texture repair restored actual PNG binaries over LFS pointer text files.
- Texture repair QA report says PNG magic PASS, pointer false, texture load errors 0, 480x270 interaction QA PASS.

Why they need explicit decision:
- They are tracked modified and required for reliable local QA.
- They were not listed in the current exact include list.
- If excluded, texture load confidence may depend on external LFS state instead of committed binaries.

PMO recommendation:
- Include them in the stage scope only if this PR is meant to carry the fixture pointer repair as part of procedure/background readiness.
- Otherwise, create a separate fixture-pointer repair commit/PR and keep this procedure/background commit narrower.

### Report / Planning Docs Include Candidates
Recommended include:
```text
R01_MAP_BACKGROUND_PRODUCTION_AUDIT.md
R01_MAP_BACKGROUND_PRODUCTION_BATCH1_PROMPTS.md
R01_MAP_BACKGROUND_BATCH1_ACTIVE_INTEGRATION_PLAN.md
R01_MAP_BACKGROUND_BATCH1_IMPORT_ONLY_EXECUTION_REPORT.md
R01_MAP_BACKGROUND_BATCH1_HELPER_INTEGRATION_REPORT.md
R01_MAP_BACKGROUND_BATCH1_FINAL_VISUAL_QA_REPORT.md
R01_PROCEDURE_PROMPT_READABILITY_TUNING_QA_REPORT.md
R01_PROCEDURE_BACKGROUND_FINAL_DIFF_AUDIT.md
```

Optional / do not include by default:
- External QA output reports under `C:/workspace/_codex_r01*`.
- Contact sheets and Godot logs under external QA output folders.
- Temp project runner files.

## Exclude Candidates
Do not stage:
```text
C:/workspace/_codex_r01_map_background_batch1/
C:/workspace/_codex_r01_map_background_batch1_final_visual_qa_project_20260608_084827/
C:/workspace/_codex_r01_map_background_batch1_final_visual_qa_output_20260608_084827/
C:/workspace/_codex_r01_procedure_prompt_readability_tuning_qa_output_20260608_090000/
C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/
.godot/imported/
generated_assets/
exports/
docs/world/
story/
```

Also exclude:
- Any broad `C:/workspace/_codex_r01*` temp/copy/output folder.
- Any source batch folder unless separately approved.
- Any unrelated world/story/design document.
- Any cleanup output not explicitly approved.

## Out-of-Scope Audit
### Relative To Explicit User Include List
- Out-of-scope / needs review: 7 tracked repaired production fixture PNGs.
- Background `.png.import` files are in scope by requirement but ignored by git, requiring explicit force-add.

### Relative To Recommended Expanded Commit Scope
If PMO approves including repaired production fixture PNGs, out-of-scope file count becomes 0 for this worktree's intended procedure/background readiness package.

## Count Gate
Current active count:

```text
raw .import: 14
fixture target .import: 7
background target .import: 7
.godot/imported: 0
generated_assets .import: 0
exports .import: 0
```

Result: PASS.

## Static Checks
- `git diff --check`: PASS.
- Existing LF/CRLF warnings were reported for already modified GDScript files; no whitespace errors were reported.
- `.godot/imported`: 0 active files.
- `generated_assets`: 0 import changes.
- `exports`: 0 import changes.

## Diff Behavior Notes
- `scripts/main.gd`: adds procedure interaction state, E key handling, interaction execution, debug info, prompt draw, and prompt readability tuning.
- `scripts/r01_layout_blockout.gd`: adds background helper bridge, procedure interaction lookup, and distance helper. No direct `KIND_COLLISION_META` or `ZONE_PROPS` edit was made in this pass.
- `scripts/r01_station_fixture_collision_overrides.gd`: adds interaction metadata to existing station fixture trigger records.
- `scripts/r01_production_background_visuals.gd`: new visual-only helper.

## Final QA Evidence
### Texture Repair PASS
Evidence:
```text
C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/R01_PROCEDURE_INTERACTION_FIXTURE_TEXTURE_REPAIR_REPORT.md
```

Key facts:
- Final verdict: PASS.
- PNG magic PASS for fixture PNG 7개.
- Pointer text count: 0.
- Production fixture texture load errors: 0.
- 480x270 interaction QA failures: 0.
- Procedure interaction total: 8.
- Repeat reward decay/cooldown: PASS.

### Background Final Visual QA
Evidence:
```text
R01_MAP_BACKGROUND_BATCH1_FINAL_VISUAL_QA_REPORT.md
```

Key facts:
- Final verdict: CONDITIONAL PASS.
- Background texture load error: 0.
- Production fixture texture load error: 0.
- Conditional issue: E prompt text readability.

### Prompt Readability Tuning PASS
Evidence:
```text
R01_PROCEDURE_PROMPT_READABILITY_TUNING_QA_REPORT.md
C:/workspace/_codex_r01_procedure_prompt_readability_tuning_qa_output_20260608_090000/results.json
```

Key facts:
- Final verdict: PASS.
- Prompt text readability: PASS.
- Background texture load error: 0.
- Production fixture texture load error: 0.
- Godot log error 0.
- 3 station x 5 modes rendered at 480x270.
- Pose 04/08 cable clear.
- Pose 05 `stamp_ready` clear.

## Active Original Worktree Check
`C:/workspace/스팀펑크` is already dirty with many unrelated world/story/art changes and untracked files. This audit did not modify that worktree.

For commit packaging, use only:

```text
C:/workspace/_codex_r01_procedure_interactions
```

Do not stage from `C:/workspace/스팀펑크`.

## Commit Message Candidate
```text
R01 procedure interactions and background batch 1
```

Alternative if fixture pointer repair is included:

```text
R01 procedure interactions, fixture texture repair, and background batch 1
```

## Stage Approval Text
### Narrow Stage Approval
Use only if PMO excludes repaired fixture PNGs from this commit:

```text
승인. stage-only 실행해라.
작업 위치: C:/workspace/_codex_r01_procedure_interactions
R01_PROCEDURE_BACKGROUND_FINAL_DIFF_AUDIT.md의 narrow scope만 exact path로 stage한다.
git add . 금지.
background .png.import 7개는 exact path로 git add -f 허용.
production fixture PNG 7개 stage 금지.
.godot/imported, generated_assets, exports, external QA output, docs/world, story stage 금지.
commit/push/PR 금지.
```

### Recommended Expanded Stage Approval
Use if PMO includes texture repair with this package:

```text
승인. stage-only 실행해라.
작업 위치: C:/workspace/_codex_r01_procedure_interactions
R01_PROCEDURE_BACKGROUND_FINAL_DIFF_AUDIT.md의 recommended expanded scope만 exact path로 stage한다.
포함: procedure/background code, Batch 1 background PNG 7 + .png.import 7, repaired production fixture PNG 7, approved reports.
git add . 금지.
background .png.import 7개는 exact path로 git add -f 허용.
.godot/imported, generated_assets, exports, external QA output, docs/world, story stage 금지.
commit/push/PR 금지.
```

## Progress
- Procedure interaction track: 92%.
- Map/background track: 90%.
- Commit readiness: 0% -> 40% conditional.
- Raise to 50% only after PMO resolves fixture PNG include/exclude and approves exact stage scope.

## Files Actually Read
- `git status --short`
- `git diff --name-only`
- `git ls-files --others --exclude-standard`
- `git status --short --ignored -- .godot generated_assets exports assets/art_inbox/r01_map_background_v01`
- `git diff --check`
- `git diff --stat`
- `git diff --numstat`
- `C:/workspace/_codex_r01_procedure_interaction_texture_repair_qa_output/R01_PROCEDURE_INTERACTION_FIXTURE_TEXTURE_REPAIR_REPORT.md` targeted verdict/count/QA lines
- `C:/workspace/_codex_r01_procedure_interactions/R01_MAP_BACKGROUND_BATCH1_FINAL_VISUAL_QA_REPORT.md` targeted verdict/count/QA lines
- `C:/workspace/_codex_r01_procedure_interactions/R01_PROCEDURE_PROMPT_READABILITY_TUNING_QA_REPORT.md` targeted verdict/count/QA lines
- `C:/workspace/_codex_r01_procedure_prompt_readability_tuning_qa_output_20260608_090000/results.json` targeted summary lines

## Evidence Used
- Git tracked/untracked/ignored file lists.
- `.import` count gate command output.
- `git diff --check` output.
- QA reports and final render result JSON.
- Active original worktree status check.
