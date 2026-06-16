# Yunseo Walk16 Refedit Final Diff Audit

Date: 2026-06-17

## Final Verdict

PASS / commit-ready audit

- Yunseo character asset family relock: 96% -> 98% commit-ready audit
- Yunseo walk-feel polish: 96% -> 98% commit-ready audit

The refedit v01 walk16 active integration is ready for a stage-only approval gate. Do not stage broad folders; use the exact include scope below.

## Recommended Include Scope

### Runtime Assets

Include `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/` only.

- PNG: 16 files
- `.png.import`: 16 files
- Total asset files: 32 files

PNG files:

- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_04.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_04.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_04.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_01.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_02.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_03.png`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_04.png`

`.png.import` files:

- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_04.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_04.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_04.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_01.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_02.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_03.png.import`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_04.png.import`

### Code

- `scripts/sprite_assets.gd`
- `scripts/main.gd`

Code scope is limited to walk texture source integration and 6fps walk frame indexing. Action pose paths, action/transient priority, movement speed, collision, navigation, reward, cooldown, processing, R01 background, and fixture logic are outside the include scope.

### Reports / Planning Docs

- `YUNSEO_RUNTIME_CHARACTER_ASSET_FAMILY_RELOCK_PLAN.md`
- `YUNSEO_CANONICAL_RUNTIME_REFERENCE_SHEET_PLAN.md`
- `YUNSEO_WALK_16_REFERENCE_EDIT_GENERATION_PROMPTS.md`
- `YUNSEO_WALK_16_REFERENCE_EDIT_PREFLIGHT_REPORT.md`
- `YUNSEO_WALK_16_REFEDIT_ACTIVE_INTEGRATION_PLAN.md`
- `YUNSEO_WALK_16_REFEDIT_IMPORT_ONLY_REPORT.md`
- `YUNSEO_WALK_16_REFEDIT_CODE_INTEGRATION_REPORT.md`
- `YUNSEO_WALK_16_REFEDIT_RUNTIME_QA_REPORT.md`
- `YUNSEO_WALK_FEEL_REWORK_AUDIT.md`
- `YUNSEO_WALK_16_REFEDIT_FINAL_DIFF_AUDIT.md`

### Exact File Count

- Runtime PNG files: 16
- Runtime `.png.import` files: 16
- Code files: 2
- Report / planning docs: 10
- Recommended total include count: 44 files

## Force-Add Requirement

The 16 `.png.import` files are ignored by `.gitignore` via `*.import`.

Stage approval must use exact force-add for these 16 files. Do not broad force-add `assets/`, `assets/art_inbox/`, or any parent folder.

## Exclude Scope

Do not include:

- `C:\workspace\_codex_yunseo_canonical_reference_sheet\`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\walk16_reference_edit_v01\`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\`
- W3A / W3A-r2 source folders
- `.godot`
- `generated_assets`
- `exports`
- unrelated R01/background/fixture assets
- unrelated story/world docs
- unrelated manifests
- unrelated `art/`, `assets/yunseo*`, `assets/r01_smoke_p0/`, `assets/sprites/`, `assets/style_samples/`, `docs/world/`, and tool scripts

Current workspace contains additional unrelated untracked files and folders. They are not part of this commit-ready scope.

## Diff / Status Verification

- Tracked diff scope: `scripts/main.gd`, `scripts/sprite_assets.gd`
- Untracked include scope found:
  - 9 prior Yunseo planning / QA docs
  - 16 refedit PNG files
  - this final audit doc
- Ignored include scope requiring force-add: 16 `.png.import` files
- Active `.godot` status: no git delta observed
- `generated_assets` / `exports` status: no git delta observed
- Staged diff: 0
- `git diff --check`: PASS with line-ending warnings only for `scripts/main.gd` and `scripts/sprite_assets.gd`

Line-ending warnings observed:

- `scripts/main.gd`: LF will be replaced by CRLF the next time Git touches it
- `scripts/sprite_assets.gd`: LF will be replaced by CRLF the next time Git touches it

No whitespace errors were reported.

## QA Evidence Summary

- Reference/edit self QA: PASS_WITH_WATCH
- Temp/copy runtime QA: PASS
- Texture load error count: 0
- Godot ERROR/FATAL count after temp import: 0
- Refedit walk set used: true
- Legacy fallback reversed: false
- Old `player_survivor_48x48_4dir_walk.png` defaulted: false
- Direction rows loaded: down 4, up 4, left 4, right 4
- Walk fps retained: 6.0
- Identity consistency: PASS
- W3A/W3A-r2 variant drift: not observed
- Long coat/trench/oversized gear read: not observed
- Walk-feel: PASS_WITH_WATCH
- Active root Godot run during runtime QA: not performed
- Active project import delta from runtime QA: 0

## Watch Items

- Side stride at live gameplay speed
- 48px rhythm in motion
- Pose 05 `stamp_ready` relationship to walk return

## Rollback Criteria

Rollback to the legacy active walk source if any of the following appears during final active-root QA or review:

- Refedit v01 fails texture load in active runtime
- Fallback path unexpectedly becomes the active default
- Old 48x48 survivor atlas appears as default player walk
- Identity drift appears in active runtime
- W3A/W3A-r2-like variant read appears
- Side stride becomes too exaggerated in live play
- 48px rhythm fails in motion
- Interaction/action priority return regresses
- Runtime errors, import errors, or `.godot/imported` commit pollution occur

Rollback path:

- Keep `assets/art_inbox/yunseo_runtime_v06_walk/` as fallback.
- Revert `scripts/sprite_assets.gd` walk source preference to legacy first.
- Keep action pose 8 unchanged.
- Keep S0 timing/bob/contact shadow unchanged unless separately approved.

## Stage Approval Text

Approved stage-only scope:

`scripts/sprite_assets.gd`, `scripts/main.gd`, exact 16 PNG files under `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`, exact 16 `.png.import` files under `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/` using `git add -f`, and the 10 Yunseo planning/QA report docs listed in `YUNSEO_WALK_16_REFEDIT_FINAL_DIFF_AUDIT.md`.

Do not stage broad folders, external QA output folders, `.godot`, `generated_assets`, `exports`, unrelated assets, unrelated story/world docs, or unrelated tool scripts.

## Next Step

Stage-only.

After stage-only, run staged diff audit before commit approval.
