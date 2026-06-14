# R01 Background Batch 2 Final Diff Audit

Status: PASS - COMMIT-READY AUDIT
Worktree: `C:\workspace\_codex_r01_background_batch2`
Progress: R01 background Batch 2 `95% -> 97% commit-ready audit`

## 1. Goal

Audit the final Batch 2 working tree diff before staging. This report locks the exact commit scope and excludes external generation/QA outputs.

No staging, commit, push, PR creation, file deletion, file move, Godot execution, import generation, or active asset modification was performed.

## 2. Basis

- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_PLANNING_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_IMPORT_ONLY_EXECUTION_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_HELPER_INTEGRATION_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_FINAL_VISUAL_QA_REPORT.md`

## 3. Git Status

`git status --short`:

```text
 M scripts/r01_layout_blockout.gd
 M scripts/r01_production_background_visuals.gd
?? R01_BACKGROUND_BATCH2_ACTIVE_INTEGRATION_PLAN.md
?? R01_BACKGROUND_BATCH2_FINAL_VISUAL_QA_REPORT.md
?? R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md
?? R01_BACKGROUND_BATCH2_HELPER_INTEGRATION_REPORT.md
?? R01_BACKGROUND_BATCH2_IMPORT_ONLY_EXECUTION_REPORT.md
?? R01_BACKGROUND_BATCH2_PLANNING_REPORT.md
?? assets/art_inbox/r01_map_background_v02/
```

Staged diff:

```text
git diff --cached --name-only
```

Result: empty.

## 4. Tracked / Untracked Separation

Tracked modified files:

```text
scripts/r01_layout_blockout.gd
scripts/r01_production_background_visuals.gd
```

Untracked non-ignored files:

```text
R01_BACKGROUND_BATCH2_ACTIVE_INTEGRATION_PLAN.md
R01_BACKGROUND_BATCH2_FINAL_VISUAL_QA_REPORT.md
R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md
R01_BACKGROUND_BATCH2_HELPER_INTEGRATION_REPORT.md
R01_BACKGROUND_BATCH2_IMPORT_ONLY_EXECUTION_REPORT.md
R01_BACKGROUND_BATCH2_PLANNING_REPORT.md
assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png
assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png
assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png
assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png
```

Ignored but required import files:

```text
assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png.import
```

Ignore evidence:

```text
.gitignore:4:*.import assets/art_inbox/r01_map_background_v02/*.png.import
```

## 5. Commit Include Candidate

Exact include list for the Batch 2 commit:

```text
assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png
assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png
assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png
assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png
assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png.import
assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png
assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png.import
scripts/r01_layout_blockout.gd
scripts/r01_production_background_visuals.gd
R01_BACKGROUND_BATCH2_PLANNING_REPORT.md
R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md
R01_BACKGROUND_BATCH2_ACTIVE_INTEGRATION_PLAN.md
R01_BACKGROUND_BATCH2_IMPORT_ONLY_EXECUTION_REPORT.md
R01_BACKGROUND_BATCH2_HELPER_INTEGRATION_REPORT.md
R01_BACKGROUND_BATCH2_FINAL_VISUAL_QA_REPORT.md
R01_BACKGROUND_BATCH2_FINAL_DIFF_AUDIT.md
```

Include count:

- Active target PNG: 6
- Active target `.png.import`: 6
- Helper/code files: 2
- Batch 2 planning/QA/audit reports: 7
- Total exact include count: 21

## 6. Commit Exclude Candidate

Exclude from commit:

```text
C:\workspace\_codex_r01_background_batch2_assets\batch2a\
C:\workspace\_codex_r01_background_batch2_assets\batch2b\
C:\workspace\_codex_r01_background_batch2_final_visual_qa_output\
```

Reason:

- External generation source/output folders are outside the active worktree.
- They contain raw chroma-key sources, rejected candidates, QA sheets, temp project files, logs, and generated temp `.godot/imported` cache.
- The active commit should contain only approved aliases, import metadata, helper bridge/code, and core reports.

Also exclude:

```text
raw_chromakey/
rejected/
temp_project/
godot.log
godot_import.log
robocopy_temp_project.log
final visual QA frame PNGs/contact sheets
generated temp `.godot/imported` cache
```

These files are all under external output folders, not active commit scope.

## 7. Out-of-Scope Audit

| Scope | Result | Evidence |
|---|---:|---|
| `.godot` active changes | 0 | Active `.godot/imported` is missing/0. |
| `generated_assets` changes | 0 | Existing folder observed, but no git status delta. |
| `exports` changes | 0 | `exports` missing. |
| unrelated `assets/art_inbox` folders | 0 | Only `r01_map_background_v02/` is new; `v01` and fixtures count unchanged. |
| story/world unrelated docs | 0 | No `story/` or `docs/` status entries. |
| external QA output in git status | 0 | QA output folders are outside worktree. |
| rejected/raw assets in active project | 0 | No `raw_chromakey` or `rejected` under active target. |

Active count gate:

```text
assets/art_inbox/r01_map_background_v02 png=6 import=6
assets/art_inbox/r01_map_background_v01 png=7 import=7
assets/art_inbox/r01_production_fixtures_v01 png=7 import=7
active .godot/imported: 0 / missing
```

## 8. Diff Check

Executed:

```text
git diff --check
```

Result: PASS.

Git emitted line-ending warnings only:

```text
LF will be replaced by CRLF the next time Git touches it
```

Affected warning files:

- `scripts/r01_layout_blockout.gd`
- `scripts/r01_production_background_visuals.gd`

No whitespace errors were reported.

## 9. Code Diff Summary

`git diff --stat`:

```text
scripts/r01_layout_blockout.gd               |  6 +++++
scripts/r01_production_background_visuals.gd | 35 ++++++++++++++++++++++++++++
2 files changed, 41 insertions(+)
```

Scope:

- `scripts/r01_production_background_visuals.gd`: Batch 2 texture paths, map metadata, map draw helper.
- `scripts/r01_layout_blockout.gd`: minimal draw-order bridge after travel corridors.

Forbidden logic not changed:

- `KIND_COLLISION_META`
- `ZONE_PROPS`
- player movement/resolver
- collision/navigation metadata
- gameplay logic

## 10. `.png.import` Stage Requirement

The six `.png.import` files are ignored by `.gitignore` via `*.import`.

Therefore the next stage-only step must use `git add -f` for those six `.png.import` files, or they will be omitted.

Recommended exact stage command shape:

```powershell
git add -- `
  assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png `
  assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png `
  assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png `
  assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png `
  assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png `
  assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png `
  scripts/r01_layout_blockout.gd `
  scripts/r01_production_background_visuals.gd `
  R01_BACKGROUND_BATCH2_PLANNING_REPORT.md `
  R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md `
  R01_BACKGROUND_BATCH2_ACTIVE_INTEGRATION_PLAN.md `
  R01_BACKGROUND_BATCH2_IMPORT_ONLY_EXECUTION_REPORT.md `
  R01_BACKGROUND_BATCH2_HELPER_INTEGRATION_REPORT.md `
  R01_BACKGROUND_BATCH2_FINAL_VISUAL_QA_REPORT.md `
  R01_BACKGROUND_BATCH2_FINAL_DIFF_AUDIT.md

git add -f -- `
  assets/art_inbox/r01_map_background_v02/r01_bg_fake_return_broken_route_decal_set.png.import `
  assets/art_inbox/r01_map_background_v02/r01_bg_family_profile_window_loop_panel.png.import `
  assets/art_inbox/r01_map_background_v02/r01_bg_model_house_node_threshold.png.import `
  assets/art_inbox/r01_map_background_v02/r01_bg_open_house_guided_visit_street_pad.png.import `
  assets/art_inbox/r01_map_background_v02/r01_bg_open_house_queue_residue_decal_set.png.import `
  assets/art_inbox/r01_map_background_v02/r01_bg_suburb_navigation_house_axis_marks.png.import
```

Do not use `git add .`.

## 11. Commit Message Candidate

Recommended commit message:

```text
Integrate R01 background Batch 2 assets
```

## 12. Stage Approval Wording

Recommended next approval:

```text
승인. R01 background Batch 2 final stage-only를 실행해라.
기준: C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_FINAL_DIFF_AUDIT.md
목표: audit의 exact include list 21개만 stage한다.
주의: .png.import 6개는 git add -f로 stage한다.
금지: git add ., commit, push, PR, 파일 수정, 삭제/이동, Godot 실행, import 생성.
```

## 13. Files Actually Read

- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_PLANNING_REPORT.md` was used as basis context from prior steps.
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_GENERATION_PROMPTS.md` was used as basis context from prior steps.
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_IMPORT_ONLY_EXECUTION_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_HELPER_INTEGRATION_REPORT.md`
- `C:\workspace\_codex_r01_background_batch2\R01_BACKGROUND_BATCH2_FINAL_VISUAL_QA_REPORT.md`
- Target file listing under `C:\workspace\_codex_r01_background_batch2\assets\art_inbox\r01_map_background_v02\`

## 14. Evidence Used

- `git status --short`
- `git diff --name-only`
- `git ls-files --others --exclude-standard`
- `git status --short --ignored -- .godot generated_assets exports assets/art_inbox/r01_map_background_v02 story docs assets/art_inbox/r01_map_background_v01 assets/art_inbox/r01_production_fixtures_v01`
- `git check-ignore -v -- assets/art_inbox/r01_map_background_v02/*.png.import`
- `git diff --check`
- `git diff --stat`
- Active and external folder file counts.

## 15. Forbidden Work Compliance

- `git add`: not performed.
- Commit: not performed.
- Push: not performed.
- PR creation: not performed.
- File deletion/move: not performed.
- Godot execution: not performed.
- Import generation: not performed.

## 16. Final Verdict

PASS.

Batch 2 is ready for an exact stage-only approval using the include list above.
