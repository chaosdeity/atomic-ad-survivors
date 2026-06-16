# Yunseo v06 Walk Cycle Runtime QA Report

Date: 2026-06-16

Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`

Branch: `codex/yunseo-runtime-state-v02`

## Goal

Verify that Yunseo v06 walk cycle runtime integration works at 480x270 without modifying code or assets.

Requested progress:

- PASS target: `Yunseo movement animation 90% -> 97%`
- HOLD target: `Yunseo movement animation 90% 유지`

Final progress:

`Yunseo movement animation 90% 유지`

Final judgment: `HOLD`

## QA Method

Active project root was not run directly.

Temp/copy project:

`C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\temp_project`

QA output:

`C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output`

Godot executable:

`C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe`

Godot version:

`4.6.2.stable.official.71f334935`

Important capture note:

- `--headless` uses a dummy renderer on this machine and returns a null viewport texture.
- Final screenshot probe used the same Vulkan render path as prior successful runtime QA.
- Active root was still not executed.

## Output Files

Required QA artifacts:

- Individual screenshots: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\screenshots\`
- 4-direction walk contact sheet: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\yunseo_walk_4_direction_contact_sheet.png`
- 96/64/48 runtime scale check: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\yunseo_walk_runtime_96_64_48_scale_check.png`
- R01 full-map scene sheet: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\yunseo_walk_r01_full_map_scene_sheet.png`
- Interaction priority sheet: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\yunseo_walk_interaction_priority_sheet.png`
- Final integrated runtime sheet: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\yunseo_walk_final_integrated_runtime_sheet.png`
- Results JSON: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\results.json`
- Godot import log: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\godot_temp_import.log`
- Godot probe log: `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\godot_yunseo_walk_cycle_runtime_probe.log`

## Automated Results

Godot:

- Temp import exit code: `0`
- Runtime probe exit code: `0`
- Texture load errors: `0`
- Godot fatal/error count: `0`

Screenshots:

- Screenshot count: `23`
- All screenshots: `480x270`
- PNG magic header: `PASS`

Runtime state checks:

- Yunseo walk texture load: `PASS`, 4 frames loaded per direction
- walk_down frame sequence: `PASS`, frames 0-3
- walk_right frame sequence: `PASS`, frames 0-3
- walk_up frame sequence: `PASS`, frames 0-3
- walk_left frame sequence: `PASS`, frames 0-3
- idle -> walk state: `PASS`
- walk -> idle state: `PASS`
- prompt priority over walk: `PASS`
- interaction transient priority over walk: `PASS`
- action end -> walk return: `PASS`
- action end -> idle return: `PASS`

Active root checks:

- Active `.godot`: absent
- Active staged diff: `0`
- Active import count unchanged: `44`
- Active `.png.import` count unchanged: `44`
- Active tracked code/asset delta outside intended prior scope: `0`

## Visual Review

Walk cycle itself:

- Yunseo walk frames are visible in runtime: `PASS`
- Existing 48x48 survivor is not visible as the default player: `PASS`
- Four directions read as directional movement: `PASS_WITH_WATCH`
- 6fps timing reads acceptable in sampled frames: `PASS`
- right/left stride exaggeration: `PASS_WITH_WATCH`
- 48px tool density: `PASS_WITH_WATCH`

Prompt/action priority:

- Prompt state uses `scan_low` over walk: `PASS`
- Interaction transient uses `cable_hook` over walk: `PASS`
- Return from action to walk/idle state: `PASS`

Failure:

- Interaction completion/combat banner crosses the player center and partially covers Yunseo in `21_walk_interaction_priority_hook.png`.
- The same banner persists and covers Yunseo in `22_action_end_return_walk.png` and `23_action_end_return_idle.png`.
- This violates the runtime QA visibility requirement even though the walk state machine itself is working.

Representative failing captures:

- `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\screenshots\21_walk_interaction_priority_hook.png`
- `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\screenshots\22_action_end_return_walk.png`
- `C:\workspace\_codex_yunseo_walk_cycle_runtime_qa_output\screenshots\23_action_end_return_idle.png`

## PASS / HOLD Criteria Evaluation

PASS items met:

- Yunseo walk frames display in runtime.
- Existing 48x48 survivor does not become the default player.
- All 4 directions advance through a 4-frame sequence.
- Action/transient pose has priority over walk.
- Idle return works.
- Texture load error: `0`
- Godot fatal/error: `0`
- Active `.godot` generated: `NO`
- Active import/code/asset delta outside intended scope: `0`

HOLD item triggered:

- Interaction feedback/combat banner occludes Yunseo during the interaction priority and return samples.

Final judgment:

`HOLD`

Reason:

The walk cycle runtime integration is functionally correct, but the actual 480x270 runtime screen still has a player visibility failure during interaction feedback. Per instruction, no fix was applied in this QA step.

## Recommended Next Step

Run a fix-only step for the interaction completion/combat banner placement or size.

Suggested scope:

- Allowed file likely: `scripts/main.gd` or the effects/banner drawing helper if separated.
- Move interaction completion feedback to a safe HUD/toast area, or make it smaller and detached from the player center.
- Do not change reward, cooldown, processing, movement speed, collision, navigation, or walk assets.
- Re-run this same 480x270 runtime QA after the fix.
