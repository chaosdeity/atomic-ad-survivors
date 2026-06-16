# Yunseo Walk16 Refedit Code Integration Report

Date: 2026-06-17
Worktree: `C:\workspace\스팀펑크`
Target folder: `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`

## Final Verdict

PASS_STATIC - code integration completed, pending runtime QA.

Progress:

- Yunseo character asset family relock: `86% -> 90% code integrated`
- Yunseo walk-feel polish: `86% -> 90% code integrated`

Godot was not executed in this step, so the final runtime verdict remains pending temp/copy runtime QA.

## Changed Files

- `C:\workspace\스팀펑크\scripts\sprite_assets.gd`
- `C:\workspace\스팀펑크\scripts\main.gd`

No other tracked file diff was introduced by this code integration step.

## Implementation Summary

`scripts/sprite_assets.gd` now:

- Tries to load the new refedit v01 full-size walk frames first.
- Preserves `assets/art_inbox/yunseo_runtime_v06_walk/` as a legacy walk folder fallback.
- Preserves the existing `res://assets/characters/player/player_survivor_48x48_4dir_walk.png` atlas fallback.
- Draws refedit frames at scale `0.11`.
- Uses pivot `(320,560) * 0.11`.
- Keeps row mapping compatible with `_player_sprite_row()`:
  - row `0`: down
  - row `1`: left
  - row `2`: right
  - row `3`: up

`scripts/main.gd` now:

- Keeps walk fps at `6.0`.
- Changes moving player cycle from `% 2` to `% 4` so the 4-frame direction strips can play.
- Leaves contact shadow drawing unchanged.
- Leaves action/transient/hurt/escape priority unchanged.

## Refedit Path Mapping

### row 0 / down

- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_01.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_02.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_03.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_down_refedit_v01_04.png`

### row 1 / left

- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_01.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_02.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_03.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_left_refedit_v01_04.png`

### row 2 / right

- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_01.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_02.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_03.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_right_refedit_v01_04.png`

### row 3 / up

- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_01.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_02.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_03.png`
- `res://assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/yunseo_v06_walk_up_refedit_v01_04.png`

Static path count:

- Refedit v01 paths in `sprite_assets.gd`: 16
- Legacy walk fallback paths in `sprite_assets.gd`: 16

## Fallback Status

Fallback chain:

1. `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`
2. `assets/art_inbox/yunseo_runtime_v06_walk/`
3. `assets/characters/player/player_survivor_48x48_4dir_walk.png`
4. procedural `draw_player_fallback()`

Existing `assets/art_inbox/yunseo_runtime_v06_walk/` is kept as a code fallback path. The folder is not present in the current worktree, and this step did not create or modify it.

## S0 Timing / Bob / Contact Shadow

S0 preservation result:

- Walk fps: kept at `6.0`
- 4-frame cycle: enabled with `% 4`
- Contact shadow pulse/draw circle: unchanged
- Stop-settle behavior: unchanged
- S0 bob/timing candidate scope: not modified

## Forbidden Scope Verification

Confirmed unchanged by this step:

- PNG content/hash
- PNG copy
- `.png.import` creation
- Godot active root execution
- Broad import
- Action pose 8 paths/assets
- Action/transient/hurt/escape priority
- Movement speed
- Collision/navigation
- Reward/cooldown/processing
- R01 background/fixture code
- Git staging/commit/push/PR

## Static Verification

| Check | Result |
| --- | --- |
| Diff limited to `scripts/sprite_assets.gd` and `scripts/main.gd` for tracked files | PASS |
| New refedit paths count 16 | PASS |
| Legacy walk fallback paths count 16 | PASS |
| Existing atlas fallback retained | PASS |
| Walk fps remains 6fps | PASS |
| 4-frame cycle connected | PASS |
| `git diff --check` | PASS |
| Staged diff 0 | PASS |
| Target PNG count remains 16 | PASS |
| Target `.png.import` count remains 16 | PASS |
| Source output folder `.png.import` remains 0 | PASS |
| Source hash equals target hash after code integration | PASS |

Note: `git diff --check` reported only line-ending warnings for existing working-copy handling (`LF will be replaced by CRLF`); no whitespace errors were reported.

## Runtime Risk / Watch

Runtime QA must confirm:

- Godot can load the full-size PNG fallback path without `.godot/imported` cache committed.
- Draw scale `0.11` and pivot `(320,560)` place Yunseo correctly in R01.
- 4-frame walk at 6fps improves timing without over-bounce.
- Side stride remains acceptable at live player speed.
- 48px-equivalent rhythm remains readable.
- Existing action priority return-to-walk still feels coherent.

## Next Step

Recommended next gate:

`Yunseo walk16 refedit v01 temp/copy runtime QA를 실행해라. R01 480x270 full-map, direction transition, action priority return-to-walk, S0 bob/shadow ON/OFF, 48px rhythm, side stride watch를 캡처하고 PASS/HOLD를 판정하라. active asset 추가 수정, unrelated code 수정, git add/commit/push/PR은 금지한다.`
