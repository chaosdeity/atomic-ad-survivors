# Yunseo Walk Overlay Occlusion S0 Fix QA Report

Date: 2026-06-16

Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`

Branch: `codex/yunseo-runtime-state-v02`

## Goal

Verify in a 480x270 temp/copy runtime QA that removing the procedure completion combat banner resolves Yunseo center occlusion without breaking walk/action states or removing interaction feedback entirely.

Progress:

`Yunseo movement animation 93% -> 97%`

Final judgment:

`PASS_WITH_WATCH`

## Basis

- `YUNSEO_WALK_OVERLAY_OCCLUSION_S0_FIX_REPORT.md`
- `YUNSEO_V06_WALK_CYCLE_RUNTIME_QA_REPORT.md`

## QA Method

Active root was not run directly.

Temp/copy project:

`C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\temp_project`

QA output:

`C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output`

Godot executable:

`C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe`

Godot version:

`4.6.2.stable.official.71f334935`

Note:

As in the prior runtime QA, screenshot capture used the Vulkan render path. The `--headless` dummy renderer path is not used for final screenshots because it returns null viewport texture on this machine.

## QA Output

Generated:

- Individual screenshots: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\screenshots\`
- 4-direction walk contact sheet: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\yunseo_walk_overlay_s0_4_direction_contact_sheet.png`
- 96/64/48 scale check: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\yunseo_walk_overlay_s0_96_64_48_scale_check.png`
- R01 runtime scene sheet: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\yunseo_walk_overlay_s0_r01_scene_sheet.png`
- Interaction priority sheet: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\yunseo_walk_overlay_s0_interaction_priority_sheet.png`
- Final integrated sheet: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\yunseo_walk_overlay_s0_final_integrated_sheet.png`
- Results JSON: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\results.json`
- Godot import log: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\godot_temp_import.log`
- Godot probe log: `C:\workspace\_codex_yunseo_walk_overlay_s0_fix_qa_output\godot_yunseo_walk_overlay_s0_fix_probe.log`

## Automated Results

Godot:

- Temp import exit code: `0`
- Runtime probe exit code: `0`
- Texture load error count: `0`
- Godot fatal/error count: `0`

Screenshots:

- Screenshot count: `21`
- All screenshots: `480x270`
- PNG magic header: `PASS`

Walk/runtime state:

- walk_down loop: `PASS`
- walk_right loop: `PASS`
- walk_up loop: `PASS`
- walk_left loop: `PASS`
- prompt priority over walk: `PASS`
- interaction transient hook over walk: `PASS`
- action end -> walk return: `PASS`
- action end -> idle return: `PASS`
- survivor fallback as default: `PASS_NOT_VISIBLE`

Overlay-specific checks:

- Combat banner empty during prompt sample: `PASS`
- Combat banner empty immediately after interaction completion: `PASS`
- Combat banner empty during action end -> walk return: `PASS`
- Combat banner empty during action end -> idle return: `PASS`
- Interaction completion floater retained: `PASS`, floater count `2`
- Interaction completion status ring retained: `PASS`, status ring count `1`

## Visual Review

Reviewed sheets:

- `yunseo_walk_overlay_s0_interaction_priority_sheet.png`
- `yunseo_walk_overlay_s0_final_integrated_sheet.png`
- `yunseo_walk_overlay_s0_r01_scene_sheet.png`
- `yunseo_walk_overlay_s0_96_64_48_scale_check.png`
- `screenshots\19_interaction_complete_hook_no_banner.png`

Findings:

- The large center combat banner no longer appears over Yunseo.
- Yunseo center visibility is restored during interaction completion and action return samples.
- Prompt/toast remains readable.
- Target floater and status ring remain visible after interaction completion.
- The interaction completion feedback is smaller than the removed banner, so feedback readability remains `PASS_WITH_WATCH`, but it is not gone.
- Walk direction and loop readability remain consistent with prior QA.
- 48px tool density and right/left stride remain watch items, unchanged from prior walk QA.

## Active Worktree Safety

Active root checks after QA:

- Active `.godot`: absent
- Active staged diff: `0`
- Active import count: `44`, unchanged from preflight
- Active `.png.import` count: `44`, unchanged from preflight
- Active tracked diff remains the intended branch work only: `scripts/main.gd`, `scripts/sprite_assets.gd`

No code, asset, import, git staging, commit, push, or PR action was performed during this QA step.

## PASS / HOLD Criteria

PASS:

- Central combat banner no longer covers Yunseo.
- Yunseo center visibility passes after interaction completion.
- Target floater/status ring/prompt toast remain.
- Walk 4-direction loop remains.
- Action/transient priority remains.
- Idle/walk return remains.
- Texture load error: `0`
- Godot fatal/error: `0`
- Active worktree pollution: `0`

Watch:

- Completion feedback is now smaller and local, so verify in later full playtest that it remains readable under combat density.
- right/left stride watch remains.
- 48px tool density watch remains.

Final judgment:

`PASS_WITH_WATCH`
