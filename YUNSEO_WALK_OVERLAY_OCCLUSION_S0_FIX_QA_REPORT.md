# Yunseo Walk Overlay Occlusion S0 Fix Runtime QA Report

Date: 2026-06-16

Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`

Branch: `codex/yunseo-runtime-state-v02`

## Goal

Re-run 480x270 temp/copy Godot QA for the S0 overlay occlusion fix and verify that R01 procedure interaction completion no longer places a centered combat banner over Yunseo.

Progress:

`Yunseo movement animation 93% -> 97%`

Final judgment:

`PASS_WITH_WATCH`

## QA Method

Active root was not run directly.

Temp/copy project:

`C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\temp_project`

QA output:

`C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output`

Godot executable:

`C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe`

Capture method:

- Temp project import/cache only.
- Vulkan render path, same as prior successful screenshot probes.
- Active project root was not opened by Godot.

## QA Output

Generated artifacts:

- Screenshots: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\screenshots\`
- Interaction priority sheet: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\yunseo_walk_overlay_s0_runtime_interaction_priority_sheet.png`
- Final integrated sheet: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\yunseo_walk_overlay_s0_runtime_final_integrated_sheet.png`
- Results JSON: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\results.json`
- Godot import log: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\godot_temp_import.log`
- Overlay probe log: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\godot_yunseo_walk_overlay_s0_fix_runtime_probe.log`
- Safe toast probe log: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_runtime_qa_output\godot_yunseo_safe_toast_probe.log`

## Godot / Screenshot Results

- Temp import exit code: `0`
- Overlay runtime probe exit code: `0`
- Safe toast probe exit code: `0`
- Godot fatal/error count: `0`
- Texture load error count: `0`
- Screenshot count: `22`
- PNG magic header: `PASS`
- Screenshot size: all `480x270`

## Occlusion Result

Before:

- Prior runtime QA showed the interaction completion/combat banner crossing Yunseo's center in interaction priority and action return samples.

After:

- Central combat banner is empty in all overlay probe samples.
- `19_interaction_complete_hook_no_banner.png` shows interaction completion without a centered banner over Yunseo.
- `20_action_end_return_walk_no_banner.png` and `21_action_end_return_idle_no_banner.png` keep Yunseo visible during return states.
- `22_safe_toast_bottom.png` confirms `_show_safe_combat_notice()` renders a small lower-left safe toast instead of a centered banner.

Verdict:

`PASS_WITH_WATCH`

## Feedback Retention

Retained:

- Prompt toast remains visible/readable.
- Target E badge and short leader remain.
- Target floater retained after interaction completion.
- Status ring retained after interaction completion.
- Safe combat notice appears in the lower-left HUD-safe area.

Watch:

- Smaller completion feedback is readable in the sampled capture, but should remain watched in denser combat.

## Walk / Action Priority

- walk_down loop: `PASS`
- walk_right loop: `PASS`
- walk_up loop: `PASS`
- walk_left loop: `PASS`
- walk during interaction prompt -> `scan_low`: `PASS`
- interaction transient pose -> `cable_hook`: `PASS`
- action end -> walk return: `PASS`
- action end -> idle return: `PASS`
- survivor fallback as default player: `PASS_NOT_VISIBLE`

## Code Scope Confirmation

Static code check:

- `_show_safe_combat_notice()` routes R01 notices to `safe_combat_toasts`.
- Non-R01 centered combat banner behavior is preserved through `effects.show_combat_banner(text, color)` fallback.
- `_draw_safe_combat_toasts()` draws the toast at lower-left safe HUD position, size `172x18`.
- Diff scan found no reward/cooldown/processing/movement/collision/navigation tuning changes.

## Active Worktree Safety

Active root after QA:

- Active `.godot`: absent
- Active `.png.import` count: `44`, unchanged from preflight
- Staged diff: `0`
- Git add/commit/push/PR: not performed
- Godot was not run on the active root
- Import generation in active root: not performed

Note:

- The worktree already had pre-existing unstaged tracked changes before this QA rerun: `scripts/main.gd` and this QA report.
- This QA step did not introduce code/asset/import changes in the active root beyond writing this requested report.

## Remaining Watch Items

- Smaller feedback readability under dense combat.
- right/left stride readability.
- 48px tool density.
- pose 05 `stamp_ready` read.

## Final Verdict

`PASS_WITH_WATCH`
