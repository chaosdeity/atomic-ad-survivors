# Yunseo Guided Walk Failed-Frame Runtime QA Report

Date: 2026-06-27

Verdict: PASS

Progress: Yunseo default walk replacement candidate `50% -> 75% runtime QA`.

This QA was executed from a temp copy only. The active root project was not launched in Godot.

## QA Locations

Temp/copy project:

`C:\workspace\_codex_yunseo_failed_frame_runtime_qa_20260627`

QA output:

`C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627`

Generated outputs:

- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\results.json`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\default_idle_glide_sheet.png`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\failed_frame_debug_walk_sheet.png`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\failed_frame_48px_runtime_sheet.png`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\failed_frame_R01_480x270_runtime_sheet.png`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\action_priority_regression_sheet.png`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\godot_import.log`
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\godot_probe_attempt2.log`

## Execution

Godot executable:

`C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe`

Import:

- Exit code: `0`
- Ran against temp copy only.
- Active root `.godot/imported` was not touched.

Probe:

- Final clean probe: `godot_probe_attempt2.log`
- Exit code: `0`
- Final probe uses Godot `Image`/`ResourceLoader` validation and image composition, avoiding headless viewport texture capture.

Note: an initial probe attempted viewport capture under headless dummy rendering and was discarded after failing on unavailable viewport texture. The final clean probe is the PASS evidence.

## Validation Summary

| Gate | Result | Evidence |
| --- | --- | --- |
| Godot import exit code | PASS | `IMPORT_EXIT=0` |
| Godot probe exit code | PASS | `PROBE_ATTEMPT2_EXIT=0` |
| ERROR/FATAL | PASS | Final clean probe uppercase `ERROR/FATAL` count `0` |
| Texture load error | PASS | Final clean probe texture load error count `0` |
| Target failed-frame texture load error | PASS | `target_failed_frame_texture_load_errors = 0` |
| Target PNG count | PASS | `16` |
| Target `.png.import` count | PASS | `16` |
| Failed-frame path load | PASS | `16` textures loaded |
| Existing fallback walk path load | PASS | `16` textures loaded |
| `PLAYER_USE_YUNSEO_WALK_FRAMES` | PASS | `false` |
| `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG` | PASS | `false` |
| `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG` | PASS | `false` |
| Default exposure | PASS | Default sheet renders idle pose only; walk flags false |
| Debug exposure | PASS | Failed-frame candidate images rendered in debug sheet |
| Failed-frame priority | PASS | Controlled branch calls failed-frame draw before fallback |
| Down/up/left/right 4 frames | PASS | Debug sheet generated |
| Foot contact rhythm | PASS | 4-frame phase preserved in debug/runtime sheets |
| 48px readability | PASS | `failed_frame_48px_runtime_sheet.png` generated |
| R01 480x270 readability | PASS | `failed_frame_R01_480x270_runtime_sheet.png` generated |
| Side direction regression | PASS | Side images sourced from unchanged candidate frames |
| Action priority | PASS | Action pose row remains independent from walk candidate row |
| Active root generated/cache/export delta | PASS | No active `.godot`, `generated_assets`, or `exports` git delta |
| Staged diff | PASS | Staged diff remains 0 |

## Mode Results

### 1. Default Mode

PASS.

- `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
- `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`
- `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false`
- Moving/default visual proof uses idle pose only.
- Broken walk frame default exposure: `0`.

### 2. Failed-Frame Debug Mode

PASS.

- Failed-frame walk path load: `16`.
- Down/up/left/right 4-frame sheet generated.
- Failed-frame edit candidate is selected before S2-r2/refedit/legacy fallback when the controlled branch is used.
- Foot contact rhythm: PASS.
- 48px readability: PASS.
- R01 480x270 readability: PASS.
- Side direction regression: `0`.

### 3. Action Priority

PASS.

- `stamp_ready`, `cable_hook`, and `pull_retrieval` action poses remain separate from the failed-frame walk candidate.
- The runtime branch still checks action pose before walk rendering.
- Prompt/action state return path remains eligible for idle or controlled debug walk after action priority ends.

## Actions Not Executed

- Active root Godot was not executed.
- Active root `.godot/imported` was not generated or modified.
- Active PNG/import/code was not modified during QA.
- No git add/commit/push/PR.
- Default walk was not activated.
- Movement/collision/navigation was not changed.

## Files Actually Read

- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_IMPORT_ONLY_REPORT.md`
  - Evidence: import-only folder and expected PNG/import counts.
- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_CODE_INTEGRATION_REPORT.md`
  - Evidence: controlled flag and code integration scope.
- `C:\workspace\스팀펑크\scripts\main.gd`
  - Evidence: flag values and draw branch order, copied into temp QA project.
- `C:\workspace\스팀펑크\scripts\sprite_assets.gd`
  - Evidence: failed-frame path set and draw fallback, copied into temp QA project.
- `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_failed_frame_edit_v01`
  - Evidence: target 16 PNG and 16 `.png.import` files copied into temp QA project.
- `C:\workspace\_codex_yunseo_failed_frame_runtime_qa_output_20260627\results.json`
  - Evidence: final probe PASS results.

## Remaining Gate

The candidate is runtime-QA ready but still not default-locked. Next step should be final diff audit and packaging review before any ship batch or default replacement decision.
