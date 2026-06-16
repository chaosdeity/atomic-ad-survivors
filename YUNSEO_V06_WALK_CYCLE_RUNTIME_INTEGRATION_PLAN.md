# Yunseo v06 Walk Cycle Runtime Integration Plan

Date: 2026-06-15
Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`
Basis:
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\YUNSEO_V06_WALK_CYCLE_W1_RIGHT_REWORK_QA_REPORT.md`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\YUNSEO_V06_WALK_CYCLE_W2_SELF_QA_REPORT.md`
- `C:\workspace\_codex_yunseo_runtime_state_v02\YUNSEO_MOVEMENT_ANIMATION_STATE_MACHINE_AUDIT.md`

## Goal

Plan runtime integration for the W1/W2 `PASS_WITH_WATCH` Yunseo v06 4-direction walk cycle frames. This plan does not copy PNGs, create imports, modify code, run Godot, stage, commit, push, or modify W1/W2 source assets.

Progress: Yunseo movement animation `70% -> 78% integration plan`

## Final Source Frame Set

Final selected source frames: `16`

### walk_down from W1 original / preserved

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_04.png`

Source judgment: `PASS_WITH_WATCH`

Watch:
- Motion is subtle.
- Equipment is dense at 48px.

### walk_right from W1 right rework

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_04.png`

Source judgment: `PASS_WITH_WATCH`

Watch:
- Right stride is larger than ideal subtle-walk language.
- Reworked right frames are slightly cleaner and more side-on than preserved down frames.

### walk_up from W2

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_04.png`

Source judgment: `PASS`

Watch:
- Scanner/case side details are partly hidden by rear view, as expected.

### walk_left from W2

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_01.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_02.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_03.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_04.png`

Source judgment: `PASS_WITH_WATCH`

Watch:
- Left stride remains a little larger than ideal subtle-walk language.
- Tool details become dense at 48px.

## Target Alias Path Candidate

Recommended active target folder:

`assets/art_inbox/yunseo_runtime_v06_walk/`

Reason:
- Keeps action/state pose aliases in `assets/art_inbox/yunseo_runtime_v06/`.
- Keeps locomotion frames separate from action poses.
- Makes future cleanup and commit scope easier to audit.

## Alias Filename Rules

Recommended individual frame aliases:

walk_down:
- `yunseo_v06_walk_down_01.png`
- `yunseo_v06_walk_down_02.png`
- `yunseo_v06_walk_down_03.png`
- `yunseo_v06_walk_down_04.png`

walk_right:
- `yunseo_v06_walk_right_01.png`
- `yunseo_v06_walk_right_02.png`
- `yunseo_v06_walk_right_03.png`
- `yunseo_v06_walk_right_04.png`

walk_up:
- `yunseo_v06_walk_up_01.png`
- `yunseo_v06_walk_up_02.png`
- `yunseo_v06_walk_up_03.png`
- `yunseo_v06_walk_up_04.png`

walk_left:
- `yunseo_v06_walk_left_01.png`
- `yunseo_v06_walk_left_02.png`
- `yunseo_v06_walk_left_03.png`
- `yunseo_v06_walk_left_04.png`

Recommendation:
- Use 16 individual frame PNG aliases for first integration.
- Do not pack into a combined atlas yet. Individual frames are easier to validate against generated source and easier to swap if a watch item becomes HOLD.

Possible later atlas:
- `yunseo_v06_walk_4dir_4frame_sheet.png`
- Defer until after runtime QA confirms frame timing and scale.

## Source To Target Mapping

| Direction | Frame | Source | Target alias |
|---|---:|---|---|
| down | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_01.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_01.png` |
| down | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_02.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_02.png` |
| down | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_03.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_03.png` |
| down | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_down_frame_04.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_down_04.png` |
| right | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_01.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_01.png` |
| right | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_02.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_02.png` |
| right | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_03.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_03.png` |
| right | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\yunseo_v06_walk_right_rework_frame_04.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_right_04.png` |
| up | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_01.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_01.png` |
| up | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_02.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_02.png` |
| up | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_03.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_03.png` |
| up | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_up_frame_04.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_up_04.png` |
| left | 01 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_01.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_01.png` |
| left | 02 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_02.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_02.png` |
| left | 03 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_03.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_03.png` |
| left | 04 | `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\yunseo_v06_walk_left_frame_04.png` | `assets/art_inbox/yunseo_runtime_v06_walk/yunseo_v06_walk_left_04.png` |

## Expected Import Delta

PNG delta:
- New active alias PNGs: `+16`

`.png.import` delta:
- Expected new `.png.import` files: `+16`

Notes:
- Existing repo ignores `*.import`, so future staging will likely require exact `git add -f` for the 16 `.png.import` files.
- Do not run active-root broad Godot import.
- Import metadata should be prepared through the same controlled method used for Yunseo v06 action pose aliases, or generated only in a temp/copy workflow before active integration approval.

## Runtime State Priority

Required priority:
1. terminal / recalled / escape -> `retrieval_escape`
2. hurt / interrupted -> `hurt_interrupted`
3. hard action transient -> `cable_hook`, `pull_retrieval`, `reject_stamp`
4. charge ready / charge open -> `stamp_ready`
5. charge warning -> `scan_low`
6. procedure prompt scan -> `scan_low`
7. walking -> 4-direction walk cycle
8. idle -> pose 01 `idle`

Important rule:
- Action/transient pose always beats walk.
- Walk beats idle only while `player_is_moving`.
- Idle remains pose 01 when no movement/action state is active.

Prompt scan conflict rule:
- Near-station prompt scan should not freeze visible walking forever.
- Recommended first integration: keep current prompt scan priority above walk only when stationary or nearly stationary.
- If `player_is_moving`, allow walk to display unless a hard action/charge/hurt/escape state is active.

## Frame Timing Recommendation

Frame count:
- `4` frames per direction

Recommended first runtime rate:
- `6 fps`

Rationale:
- W1/W2 watch items include larger left/right stride.
- 6 fps keeps the cycle grounded and avoids a running feel.
- 8 fps can be tested later if movement feels too sluggish.

Implementation expression:
- `walk_frame := int(player_walk_anim_time * 6.0) % 4`

Animation clock:
- Add persistent `player_walk_anim_time`.
- Increment only while `player_is_moving` and `match_state == "playing"` and not paused.
- Optionally reset or damp when stationary to avoid frame snapping.

## Direction Selection

Use existing state:
- `last_move_dir`
- `player_is_moving`

Direction mapping:
- if `abs(last_move_dir.x) > abs(last_move_dir.y)`:
  - `x > 0` -> `right`
  - `x < 0` -> `left`
- else:
  - `y >= 0` -> `down`
  - `y < 0` -> `up`

This mirrors existing `_player_sprite_row()` behavior and avoids gameplay movement changes.

## Code Change Candidate Files

Expected required files:
- `scripts/sprite_assets.gd`
- `scripts/main.gd`

`scripts/sprite_assets.gd` planned changes:
- Add `YUNSEO_WALK_PATHS` for 4 directions x 4 frames.
- Add `yunseo_walk_textures`.
- Load 16 walk textures in `load_all()`.
- Add `draw_yunseo_walk(canvas, pos, direction, frame)` helper.
- Use same normalized canvas/origin/scale assumptions:
  - canvas `796x658`
  - origin `Vector2(320, 560)`
  - scale `0.11`
- Keep fallback order intact.

`scripts/main.gd` planned changes:
- Add `player_walk_anim_time`.
- Update walk anim time in `_process` or `_update_player`.
- Add visual state resolver or extend `_player_runtime_pose_id()` into a structured resolver.
- In `_draw_player()`, draw:
  1. higher-priority Yunseo action pose if active
  2. Yunseo walk if moving
  3. Yunseo idle pose
  4. existing 48x48 player fallback
  5. vector dummy fallback
- Do not change speed, collision, navigation, reward, cooldown, or processing values.

Avoid changing:
- `scripts/game_config.gd`
- `scripts/r01_layout_blockout.gd`
- `scripts/r01_map_assembly.gd`
- R01 background/fixture assets
- gameplay balance systems

## QA Watch Items

Required watch list:
- right stride is larger than ideal subtle walk
- left stride is larger than ideal subtle walk
- 48px tool detail density
- walk_down motion is subtle
- prompt scan vs walking conflict
- action transient pose vs walking conflict
- charge ready / stamp state vs walking conflict
- hurt/escape priority over walk
- scanner-as-gun regression in runtime scale
- stamp case as document/tablet/map regression in runtime scale
- cable/reel weapon read regression in runtime scale

## Temp/Copy 480x270 QA Plan

QA must run in temp/copy project only.

Required screenshots:
- idle pose 01 at spawn
- walk_down in open house street
- walk_right in open house street
- walk_up near model house threshold
- walk_left near fake return route
- walk near check-in fixture
- walk near room/meal lane
- walk near renewal gate
- walk into procedure prompt range while moving
- stationary near procedure prompt -> scan pose or prompt state
- interact while moving -> cable_hook transient beats walk
- charge ready while moving -> stamp_ready beats walk
- charge pull/reject -> pull_retrieval/reject_stamp beats walk
- hurt while moving -> hurt_interrupted beats walk
- recall/escape -> retrieval_escape beats walk

Required QA outputs:
- 480x270 screenshot set
- walk direction contact sheet
- state transition sheet
- W1/W2 source comparison sheet
- results.json
- Godot log
- QA report

PASS:
- all 16 walk textures load
- no texture load errors
- Godot fatal/error count `0`
- old 48x48 survivor does not appear as default
- walk frame timing reads as walking, not running
- walk does not override action/hurt/escape states
- idle returns to pose 01 when movement stops
- prompt/toast does not cover Yunseo
- R01 fixture/background separation remains readable
- active `.godot` absent after temp/copy QA
- active import/code/asset deltas are only expected scope

HOLD:
- any walk texture fails to load
- scanner reads as gun at runtime scale
- stamp case reads as document/tablet/map at runtime scale
- cable/reel reads as weapon
- left/right stride reads as running
- direction changes pop or anchor shifts badly
- movement overrides action/transient/hurt/escape
- old 48x48 survivor appears as default
- active worktree pollution occurs

## Integration Sequence Recommendation

1. Stage 1: alias prep only
   - Copy 16 selected frames into `assets/art_inbox/yunseo_runtime_v06_walk/`.
   - Prepare 16 `.png.import` files.
   - Verify hashes and import delta.

2. Stage 2: code integration
   - Add walk texture loading and draw helper.
   - Add movement visual state resolver.
   - Keep existing action pose fallback and old survivor fallback.

3. Stage 3: temp/copy runtime QA
   - Verify 480x270 walk and state priority.
   - Check watch items.

4. Stage 4: final diff audit
   - Include active alias PNGs, import files, code, and reports only.
   - Exclude external W1/W2 generation folders unless explicitly requested.

## Final Judgment

Integration plan: `PASS`

Proceed only after approval for alias prep/integration. No active integration was performed in this step.
