# Yunseo Default Walk Disable Hotfix QA Report

Date: 2026-06-28

## Checks Run

- `git status --short --branch`
- `git log --oneline --first-parent --max-count=3`
- `rg -n "PLAYER_USE_YUNSEO|YUNSEO_LAYERED|YUNSEO_FAILED|draw_yunseo_layered_walk|draw_yunseo_walk\\(" scripts/main.gd scripts/sprite_assets.gd`
- `git diff --check`
- Static runtime safety probe:
  - walk flag false
  - failed-frame debug false
  - pseudo-socket debug false
  - layered asset paths preserved
  - layered textures not loaded
  - layered draw function not callable
  - walk textures empty at load
  - moving fallback uses idle pose
  - 96px sheet absent

## Results

- Godot CLI availability: BLOCKED, `godot`, `godot4`, and `Godot` were not found on PATH.
- Godot import/probe exit 0: NOT RUN due to missing CLI.
- ERROR/FATAL 0: NOT RUN due to missing CLI.
- texture load error 0: static PASS for disabled/default path; live Godot check not run.
- moving broken/layered walk exposure 0: static PASS.
- idle glide fallback: static PASS.
- action/transient priority: static PASS by code path order.
- core loop HUD/reward regression: static PASS, no core loop/HUD/reward files changed.
- 480x270 contact sheet generated:
  - `qa/screenshots/yunseo_default_walk_disable_hotfix/yunseo_default_walk_disable_480x270_contact_sheet.png`

## Static Probe Output

```text
walk flag false: PASS
failed debug false: PASS
pseudo debug false: PASS
layered assets preserved: PASS
layered textures not loaded: PASS
layered draw not callable: PASS
walk textures empty at load: PASS
idle fallback moving: PASS
96 sheet absent: PASS
```

## Verdict

Runtime safety hotfix QA: PASS with live-Godot limitation noted.
Final walk quality: HOLD.