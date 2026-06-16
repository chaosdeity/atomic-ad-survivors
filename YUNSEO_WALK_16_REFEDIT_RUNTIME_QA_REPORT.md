# Yunseo Walk16 Refedit Runtime QA Report

Date: 2026-06-17

## Final Verdict

PASS

- Yunseo character asset family relock: 90% -> 96% runtime QA
- Yunseo walk-feel polish: 90% -> 96% runtime QA

Refedit v01 walk16 is confirmed as the active runtime walk source in the temp/copy QA project. Identity holds against the canonical Yunseo family, runtime texture load errors are 0 after temp import, and the old 48x48 survivor atlas does not become the default player walk.

## QA Method

- Active project root: `C:\workspace\스팀펑크`
- Temp/copy QA root: `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01`
- Temp/copy Godot project: `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\temp_project`
- Godot execution/import scope: temp/copy project only
- Active root Godot execution: not performed

The first temp probe before import produced missing temp `.ctex` load errors, as expected for a fresh copy without `.godot/imported`. A temp/copy-only Godot import was then run, and the final post-import runtime probe is the PASS basis.

## QA Outputs

- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\results.json`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\refedit_walk_4_direction_contact_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\refedit_walk_direction_transition_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\refedit_walk_start_stop_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\refedit_walk_r01_full_map_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\refedit_action_priority_return_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\refedit_vs_legacy_runtime_comparison_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\godot_probe_results.json`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\godot_probe_console_after_import.log`
- `C:\workspace\_codex_yunseo_runtime_qa\walk16_refedit_v01\godot_temp_import_console.log`

## Texture Load Result

PASS

- Temp import exit code: 0
- Post-import runtime probe exit code: 0
- Post-import Godot ERROR count: 0
- Post-import Godot FATAL count: 0
- Refedit texture load error count: 0
- `used_refedit_walk_set`: true
- `legacy_fallback_reversed`: false
- `old_atlas_defaulted`: false
- Refedit rows loaded:
  - down: 4
  - up: 4
  - left: 4
  - right: 4

## Walk Loop / Frame Result

PASS

- `walk_down`: 4-frame loop confirmed
- `walk_up`: 4-frame loop confirmed
- `walk_left`: 4-frame loop confirmed
- `walk_right`: 4-frame loop confirmed
- Frame index `% 4`: confirmed by probe expectation
- Walk fps: 6.0 retained
- Direction transition sheet: PASS
- Start/stop settle sheet: PASS
- S0 1px bob/contact shadow pulse: preserved in code path and visible in QA sheets

## Identity Result

PASS

- Canonical Yunseo identity is maintained in temp runtime sheets.
- Direction changes do not show outfit/face/equipment swaps.
- W3A/W3A-r2 long coat/trench/variant drift is not observed.
- Oversized rear gear read is not observed.
- Scanner, cable, and stamp case remain compact work gear.

## Walk-Feel Result

PASS_WITH_WATCH

- Down/up sliding is reduced compared with the previous runtime walk.
- Side stride is improved enough for runtime candidate use, but remains a watch item at live gameplay speed.
- 48px rhythm remains PASS_WITH_WATCH.
- R01 480x270 full-map preview preserves identity and walk readability.

## Priority / Interaction Result

PASS_STATIC

- Action/transient priority code was not changed during this QA.
- Action priority return sheet confirms walk/idle return remains visually compatible.
- Prompt, floater, safe toast, status ring, movement, collision, navigation, reward, cooldown, and processing scopes were not modified during this QA.
- Pose 05 `stamp_ready` watch remains open.

## Active Delta / Safety

PASS

- Active root Godot run: not performed
- Active root `.godot` creation/modification by QA: none observed
- Active `.png.import` delta from runtime QA: 0
- Active target alias folder count remains 16 PNG + 16 `.png.import`
- `generated_assets` / `exports` delta: 0
- Staged diff: 0
- Code/asset/import modification during runtime QA: none, except this report file
- Git add/commit/push/PR: not performed

Existing approved pre-QA worktree changes remain present from the import-only/code-integration steps:

- `scripts/main.gd`
- `scripts/sprite_assets.gd`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`

## Remaining Watch

- Side stride at live gameplay speed
- 48px rhythm in motion
- Pose 05 `stamp_ready` relationship to walk return
- Full interaction playthrough before commit/PR

## Next Step

Proceed to visual approval and staging gate. Recommended next approval split:

1. Stage exact refedit PNG/import/code/report files.
2. Run final active-root Godot QA only after explicit approval.
3. Commit/PR only after final runtime approval.
