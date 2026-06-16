# Yunseo Walk Runtime Overlay Occlusion S0 Fix Report

Date: 2026-06-16

Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`

Branch: `codex/yunseo-runtime-state-v02`

## Goal

Resolve the S0 runtime QA HOLD where the interaction completion/combat banner crossed Yunseo's center in 480x270 runtime captures.

Progress:

`Yunseo movement animation 90% HOLD -> 93% S0 fix implemented`

## Basis

- `YUNSEO_V06_WALK_CYCLE_RUNTIME_QA_REPORT.md`
- `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\yunseo_walk_interaction_priority_sheet.png`
- `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\results.json`

## Failure Being Fixed

The walk cycle runtime QA showed that Yunseo walk/action state worked, but the procedure interaction completion feedback triggered the global combat banner. That banner is drawn by the effects controller across the center of the viewport and covered Yunseo in:

- `21_walk_interaction_priority_hook.png`
- `22_action_end_return_walk.png`
- `23_action_end_return_idle.png`

## Changed File

Allowed file changed:

- `scripts/main.gd`

No other file was modified by this S0 fix.

## Implementation

In `_try_procedure_interaction()`, removed the procedure completion call to:

`effects.show_combat_banner("%s 절차 수행" % label, C.VITAMIN_YELLOW)`

The local procedure feedback remains intact:

- `procedure_interaction_feedback_timer`
- `last_procedure_interaction`
- `effects.add_status_ring(pos, C.VITAMIN_YELLOW, 38.0, 0.34)`
- `effects.add_floater(pos + Vector2(0, -24), result, C.VITAMIN_YELLOW, 12)`
- safe prompt/toast drawing from `_draw_procedure_interaction_prompt()`

Reason:

`effects_controller.gd` owns the global combat banner drawing position, but that file was outside the allowed edit scope. Removing the procedure-specific global banner call in `main.gd` is the smallest allowed change that prevents this interaction feedback from crossing the player center.

## Explicit Non-Changes

No changes were made to:

- Yunseo walk cycle frame timing
- Yunseo walk direction logic
- Yunseo action/transient state priority
- reward values
- cooldown values
- interaction trigger logic
- interaction processing values
- collision
- navigation
- movement speed
- PNG files
- `.png.import` files
- Godot import/cache

Spot checks:

- `procedure_interaction_feedback_timer = 0.45` unchanged
- `procedure_interaction_feedback_timer = 0.32` unchanged
- `interaction_processing` lookup unchanged
- `processing *= 0.55` unchanged
- `_move_speed()` unchanged
- R01 collision calls through `resolve_player_position()` and `clamp_player_position()` unchanged
- walk frame calculation remains `int(player_walk_anim_time * 6.0) % 4`

## Verification

Commands run:

- `git diff -- scripts\main.gd`
- targeted `rg` for procedure feedback, processing, walk, movement, collision, and banner calls
- `git diff --check`
- `git diff --cached --name-only`

Results:

- `git diff --check`: PASS
- staged diff: `0`
- Godot was not run
- no import generated
- no asset changed

Note:

`git diff -- scripts\main.gd` still includes prior Yunseo runtime and walk integration changes already present in this branch. The S0 fix itself is the removal of the procedure-specific global combat banner call described above.

## PASS/HOLD For This Step

Implementation status: `PASS`

Runtime QA status: not run in this step by request.

Next required step:

Re-run the 480x270 temp/copy walk runtime QA and confirm that:

- `21_walk_interaction_priority_hook.png` no longer has the large center banner
- action return samples no longer cover Yunseo
- prompt/toast readability remains acceptable
- walk/action priority remains PASS
