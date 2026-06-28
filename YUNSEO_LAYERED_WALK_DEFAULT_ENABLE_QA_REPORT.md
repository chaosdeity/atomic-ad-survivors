# Yunseo Layered Walk Default Enable QA Report

Date: 2026-06-28

Verdict: PASS

## QA Environment

- Source branch worktree: `C:\workspace\_codex_yunseo_layered_default_walk_branch`
- Temp/copy QA project: `C:\workspace\_codex_yunseo_layered_default_enable_runtime_qa_20260628`
- Godot executable: `C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe`
- Godot version: `4.6.2.stable.official.71f334935`
- Active root Godot execution: not performed

## Commands

- Editor import in temp/copy:
  - `--headless --editor --path <temp> --quit`
- Default-enable QA probe in temp/copy:
  - `--headless --path <temp> --script res://tools/yunseo_layered_walk_default_qa.gd`

## Results

- Godot editor import exit: PASS, `0`
- Godot default-enable probe exit: PASS, `0`
- Godot ERROR/FATAL/SCRIPT ERROR in final import/probe logs: PASS, `0`
- Texture load errors in final import/probe logs: PASS, `0`
- Layered default texture load: PASS, `16/16`
- Failed-frame controlled cache remains separate: PASS, `16/16`
- Default walk flag ON: PASS
- Failed-frame debug flag OFF: PASS
- Pseudo-socket debug flag OFF: PASS
- Action/transient pose priority: PASS, override returned `stamp_ready`
- Idle fallback texture availability: PASS
- Gameplay default draw helper: PASS
- 480x270 default proof: PASS
- 480x270 contact sheet: PASS

## Art Readability

- down/up: PASS. Foot-contact rhythm is visible without overlay.
- left/right: PASS. Stride reads at R01 480x270 scale.
- 48px/R01 480x270 readability: PASS_WITH_WATCH or better.
- Identity/costume/equipment drift: 0 observed in proof/contact sheet.
- Scanner gun-read: no.
- Stamp case tablet/map-read: no.
- Cable weapon-read: no.

## QA Artifacts

- Final probe log:
  - `C:\workspace\_codex_yunseo_layered_default_enable_runtime_qa_20260628\qa\yunseo_layered_walk_default_enable\godot_default_enable_probe_attempt2.log`
- Final import log:
  - `C:\workspace\_codex_yunseo_layered_default_enable_runtime_qa_20260628\qa\yunseo_layered_walk_default_enable\godot_editor_import.log`
- Result JSON:
  - `C:\workspace\_codex_yunseo_layered_default_enable_runtime_qa_20260628\qa\yunseo_layered_walk_default_enable\results.json`
- 480x270 proof:
  - `C:\workspace\_codex_yunseo_layered_default_enable_runtime_qa_20260628\qa\yunseo_layered_walk_default_enable\default_walk_gameplay_480x270.png`
- Contact sheet:
  - `C:\workspace\_codex_yunseo_layered_default_enable_runtime_qa_20260628\qa\yunseo_layered_walk_default_enable\default_walk_contact_sheet_480x270.png`

## Files Actually Read

- `scripts/main.gd`: default flag and player draw branch.
- `scripts/sprite_assets.gd`: default walk source order and draw helper.
- `tools/yunseo_layered_walk_default_qa.gd`: QA checks and proof generation.
- Final Godot import/probe logs listed above.

## Remaining Risk

The 480x270 proof is generated in temp/copy through the same loaded default textures and draw helper. Headless viewport capture is not used because Godot headless dummy rendering can return null viewport textures. This is the same limitation observed in the prior layered runtime QA.
