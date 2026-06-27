# Yunseo Guided Walk Failed-Frame Code Integration Report

Date: 2026-06-27

Verdict: PASS

Progress: Yunseo default walk replacement candidate `35% -> 50% controlled code integrated`.

This step added the failed-frame edit walk set to runtime as a controlled/debug-only candidate. Default walk remains OFF.

## Changed Files

- `scripts/sprite_assets.gd`
- `scripts/main.gd`

No PNG, `.png.import`, movement, collision, navigation, or action-priority files were modified in this step.

## Implementation

### `scripts/sprite_assets.gd`

Added `YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS` with 16 paths:

- `down`: 4
- `left`: 4
- `right`: 4
- `up`: 4

Added `yunseo_failed_frame_walk_textures` and load support in `load_all()`.

Added `draw_yunseo_failed_frame_walk()`:

- Draws the failed-frame-edit walk set first.
- Falls back to existing `draw_yunseo_walk()` if the candidate set cannot draw.
- Existing `draw_yunseo_walk()` continues to use the existing S2-r2/refedit/legacy loaded chain.

Existing fallback chain remains available:

1. Failed-frame edit walk, only when the controlled flag calls it
2. S2-r2 walk
3. Refedit walk
4. Legacy walk
5. Idle glide from `main.gd` fallback

### `scripts/main.gd`

Added controlled flag:

`PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`

Default safety flags remain:

- `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
- `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`
- `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false`

Draw behavior:

- Action pose priority remains first.
- Pseudo-socket debug path remains separate and unchanged in priority.
- Failed-frame walk is only attempted if `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG` is true.
- Existing walk frame path is only attempted if `PLAYER_USE_YUNSEO_WALK_FRAMES` is true.
- If controlled/debug walk drawing fails, idle pose fallback remains.

## Validation

| Gate | Result | Evidence |
| --- | --- | --- |
| Target PNG 16 exists | PASS | `assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01` import-only result. |
| Target `.png.import` 16 exists | PASS | `assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01` import-only result. |
| Failed-frame edit path count | PASS | `YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS` has 16 `res://assets/art_inbox/` paths. |
| S2-r2 path count | PASS | `YUNSEO_S2_R2_WALK_PATHS` remains 16 paths. |
| Refedit path count | PASS | `YUNSEO_WALK_PATHS` remains 16 paths. |
| Legacy path count | PASS | `YUNSEO_LEGACY_WALK_PATHS` remains 16 paths. |
| `PLAYER_USE_YUNSEO_WALK_FRAMES` | PASS | Still `false`. |
| New debug flag | PASS | `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`. |
| Pseudo-socket debug flag | PASS | Still `false`; path not removed. |
| `git diff --check` | PASS | No whitespace errors; only existing line-ending warnings were printed. |
| Staged diff | PASS | Staged diff remains 0. |
| PNG/import additional edits | PASS | No PNG or `.png.import` changes in this code step. |
| Godot execution | PASS | Not executed. |
| Default walk exposure | PASS | Controlled flag default false; default runtime remains idle glide path. |

## Actions Not Executed

- No default walk ON.
- No active PNG modification.
- No `.png.import` addition or regeneration.
- No Godot execution.
- No git add/commit/push/PR.
- No movement/collision/navigation changes.
- No pseudo-socket debug path removal.

## Files Actually Read

- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_ACTIVE_INTEGRATION_PREFLIGHT.md`
  - Evidence: controlled/default-OFF integration policy and fallback target.
- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_IMPORT_ONLY_REPORT.md`
  - Evidence: isolated imported asset folder and PNG/import counts.
- `C:\workspace\스팀펑크\scripts\sprite_assets.gd`
  - Evidence: existing Yunseo walk path sets, loading path, draw helper shape.
- `C:\workspace\스팀펑크\scripts\main.gd`
  - Evidence: current walk flags, pseudo-socket branch, action priority, idle fallback.
- `C:\workspace\스팀펑크\assets\art_inbox\yunseo_runtime_v06_walk_failed_frame_edit_v01`
  - Evidence: target asset folder from import-only stage.

## Next Gate

Run temp/copy runtime QA next. Required focus:

- Default OFF keeps S0 idle glide.
- Controlled flag ON draws failed-frame-edit walk candidate.
- Pseudo-socket debug path remains separate.
- 48px/R01 480x270 readability remains PASS.
- Godot ERROR/FATAL 0 and texture load error 0.
