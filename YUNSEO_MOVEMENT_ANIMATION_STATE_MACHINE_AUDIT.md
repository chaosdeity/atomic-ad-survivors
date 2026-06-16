# Yunseo Movement Animation / State Machine Audit

Date: 2026-06-15
Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`
Branch: `codex/yunseo-runtime-state-v02`

## Summary

Current Yunseo v06 runtime integration makes Yunseo visible and switches transient action poses, but it does not yet make Yunseo feel like a fully controlled player character. Movement input, last direction, and moving/not-moving state already exist in `scripts/main.gd`, but the Yunseo draw path currently renders one state pose at a time and does not use directional walk frames.

Judgment: movement animation/state machine is `HOLD / NEEDS SEPARATE IMPLEMENTATION`.

Progress: Yunseo movement animation `0% -> 20% audit`

## Current Implementation State

Player input / movement:
- Location: `scripts/main.gd`
- `_input(event)` handles charge, terminal action, and procedure interaction.
- `_update_player(delta)` reads `Input.get_vector("move_left", "move_right", "move_up", "move_down")`.
- `_update_player(delta)` sets:
  - `player_is_moving`
  - `last_move_dir`
  - `player_pos`
- Movement speed is available through `_move_speed()`, which uses `C.PLAYER_SPEED` and `player_stats["move_speed_mult"]`.

Relevant current variables:
- `last_move_dir := Vector2.DOWN`
- `player_is_moving := false`
- `attack_pose_timer`
- `attack_pose_dir`
- `player_pose_override_id`
- `player_pose_override_timer`
- `hurt_feedback_cooldown`

Player draw:
- Location: `scripts/main.gd`
- `_draw_player()` computes the old player sheet frame:
  - `player_frame := int(elapsed * 6.0) % 2 if player_is_moving else 0`
- Current v02 runtime draw order:
  1. `sprite_assets.draw_yunseo_pose(self, player_pos, _player_runtime_pose_id())`
  2. fallback `sprite_assets.draw_player(...)`
  3. fallback `sprite_assets.draw_player_fallback(...)`

Existing 48x48 player sheet:
- Location: `scripts/sprite_assets.gd`
- `PLAYER_PATH := "res://assets/characters/player/player_survivor_48x48_4dir_walk.png"`
- `draw_player(...)` uses:
  - cell size `48x48`
  - pivot `Vector2(24, 43)`
  - 4 directional rows
  - frame column from `player_frame`
- `_player_sprite_row()` maps `last_move_dir` to down / left / right / up rows.

Yunseo v06 runtime poses:
- Location: `scripts/sprite_assets.gd`
- `draw_yunseo_pose(...)` draws full normalized pose PNGs at:
  - canvas `796x658`
  - origin `Vector2(320, 560)`
  - scale `0.11`
- Pose selection is driven by `_player_runtime_pose_id()` in `scripts/main.gd`.

## Direction / Velocity Availability

Available now:
- Direction: `last_move_dir`
- Moving boolean: `player_is_moving`
- Raw per-frame input direction: local `input_dir` inside `_update_player(delta)`
- Speed: `_move_speed()`
- Player position delta can be inferred from `old_pos` and `player_pos`, but no persistent `player_velocity` is stored.

Not available as persistent state:
- `player_velocity`
- movement animation phase independent of global `elapsed`
- movement-facing state separate from action-facing state
- action lock / animation lock state
- per-pose duration metadata

Audit conclusion:
- S0 can reuse `player_is_moving` and `last_move_dir`.
- S1/S2 should add a persistent movement animation phase and explicit state resolver output.
- S3 is not required for animation quality and should be avoided.

## Can the Current 8pose Set Replace Walking?

No, not convincingly.

Reasons:
- The 8pose set is action/readiness oriented, not a directional locomotion cycle.
- `idle`, `scan_low`, `cable_hook`, `pull_retrieval`, `stamp_ready`, `reject_stamp`, `hurt_interrupted`, and `retrieval_escape` are semantically distinct one-off poses.
- Reusing `scan_low` as a generic walk pose would make Yunseo look like she is constantly inspecting or bracing, not walking.
- Reusing `retrieval_escape` for movement would over-signal escape/recovery.
- The current source has no 4-direction walk rows or 2-4 frame loop.

Minimum visual conclusion:
- Current 8pose assets are enough for idle/action/hurt/escape transient state.
- They are not enough for proper directional walking.

## Gaps / Missing Work

Missing for S0:
- No movement-specific Yunseo pose resolver branch.
- No distinction between idle facing and walking facing in the Yunseo draw helper.
- No movement-facing metadata passed to `draw_yunseo_pose(...)`.

Missing for S1:
- Yunseo walk cycle assets.
- Directional anchor/pivot/origin consistency for each walk frame.
- Import metadata for new walk assets.
- Contact sheet and 480x270 walk QA.

Missing for S2:
- Central player visual state resolver that returns structured state, not only pose id.
- State priority table with durations and interrupt rules.
- Action lock / transient lock timing.
- Movement animation phase clock.
- Rules for when movement can animate under an action pose.

Missing for S3:
- Not needed at this stage.
- Collision, navigation, and gameplay movement rules should remain unchanged.

## State Priority Audit

Current `_player_runtime_pose_id()` priority:
1. `match_state == "recalled"` -> `retrieval_escape`
2. `hurt_feedback_cooldown > 0.0` -> `hurt_interrupted`
3. charge missed -> `reject_stamp`
4. charge open / ready flash -> `stamp_ready`
5. transient override -> `cable_hook` or `pull_retrieval`
6. charge warning -> `scan_low`
7. nearby procedure prompt -> `scan_low`
8. default -> `idle`

Recommended final priority:
1. terminal / recalled / escape
2. hurt / interrupted
3. hard action lock: pull, hook, reject, stamp
4. charge ready / warning
5. procedure prompt scan
6. walk
7. idle

Why movement sits low:
- Movement should not override hurt, procedure, charge, or escape states.
- Walk should fill only the visual gap when no higher-priority action is active.

## Procedure Interaction Conflict

Current procedure transient:
- `_try_procedure_interaction()` sets `cable_hook` for `0.18s`.
- `_fire_charge()` sets `pull_retrieval` or `reject_stamp` for `0.22s`.
- `_procedure_prompt_active()` sets `scan_low` while near a procedure station.

Potential conflict:
- If walk state is inserted too high, Yunseo will snap from action pose into walk immediately and weaken procedure feedback.
- If prompt scan always beats walk, Yunseo will look stuck in scan pose near stations even while moving.

Recommended conflict rule:
- Hard transients (`cable_hook`, `pull_retrieval`, `reject_stamp`, `hurt_interrupted`, `retrieval_escape`) beat walk.
- Prompt scan should beat idle but not necessarily beat active movement for long. Use either:
  - scan only when nearly stationary near a station, or
  - scan as a short pulse when entering prompt range.

## Scope Classification

### S0: Pose-based idle/move distinction

Goal:
- Minimal runtime improvement without new assets.

Possible implementation:
- Add `_player_visual_state()` or extend `_player_runtime_pose_id()`.
- If `player_is_moving` and no higher-priority action state, use a movement placeholder pose.
- Keep `last_move_dir` only for future-facing metadata or simple horizontal flip if approved.

Limit:
- No true walk cycle.
- Risk of overusing an action pose as walking.

Recommendation:
- Only use S0 as a tiny bridge if a near-term playtest needs motion feedback before new assets exist.
- Do not call it final movement animation.

### S1: Yunseo walk cycle asset pass

Goal:
- Make Yunseo read as a playable character while moving.

Asset need:
- Yes, new assets are needed.

Recommended asset options:
- 4-direction walk sheet, 2-4 frames per direction.
- Or 8-direction if future aiming/facing becomes important.
- Same visual identity as v06 normalized action poses.
- Transparent PNG.
- Consistent ground contact, origin, and scale with current `origin (320,560)` / `scale 0.11`, or a documented new walk pivot.

Code candidates:
- `scripts/sprite_assets.gd`
  - load walk sheet or per-frame walk textures
  - draw helper for walk state
- `scripts/main.gd`
  - persistent movement animation phase
  - movement state resolver branch
  - optional facing state from `last_move_dir`

Recommendation:
- This is the right next production step.

### S2: Full visual animation state machine

Goal:
- Make player visual state deterministic and extensible.

Needed work:
- Create a structured resolver output such as:
  - `state_id`
  - `pose_id` or `animation_id`
  - `facing_dir`
  - `locked_until` / `duration`
  - `can_blend_with_movement`
- Add state priority table.
- Add action timing and visual lock rules.
- Add QA probes for transitions:
  - idle -> walk
  - walk -> prompt scan
  - walk -> procedure hook -> idle/walk
  - walk -> charge ready -> pull/reject
  - walk -> hurt -> recovery
  - recall -> escape

Recommendation:
- Do after S1 assets exist, unless the state logic is needed first to de-risk asset naming and QA.

### S3: Combat / collision / movement rules

Goal:
- Change gameplay movement behavior.

Recommendation:
- Not needed for this track.
- Avoid changes to speed, collision radius, navigation, knockback, reward, cooldown, or processing values.

## Recommended Implementation Order

1. S1 asset planning first
   - Decide exact Yunseo walk asset format.
   - Prefer 4 directions x 3 frames or 4 directions x 4 frames.
   - Keep scale/origin compatible with v06 runtime poses.

2. S0/S2 hybrid code plan
   - Add a structured resolver, but only wire idle/walk/action/hurt/escape priorities.
   - Do not touch gameplay movement rules.

3. S1 integration
   - Add walk draw helper in `sprite_assets.gd`.
   - Add movement animation phase in `main.gd`.
   - Keep v06 8pose actions as higher-priority transient states.

4. 480x270 temp/copy QA
   - idle still frame
   - walking left/right/up/down
   - walk near procedure prompt
   - interact while moving
   - hurt while moving
   - charge ready / reject / pull
   - recall escape

## Code Change Candidate Files

Likely required:
- `scripts/sprite_assets.gd`
- `scripts/main.gd`

Possible only if new import paths need documentation:
- new report / asset integration plan markdown

Avoid:
- `scripts/game_config.gd`
- `scripts/r01_layout_blockout.gd`
- `scripts/r01_map_assembly.gd`
- R01 background/fixture assets
- collision/navigation/gameplay balance systems

## PASS / HOLD Criteria

S0 PASS:
- Movement state is detectable.
- Walk placeholder does not override action/hurt/escape states.
- Prompt scan does not freeze the player visually while moving.
- No gameplay/collision/navigation/balance changes.

S0 HOLD:
- Yunseo looks like she slides without intent.
- Action poses are overused as walking.
- Procedure transient pose becomes unreadable.

S1 PASS:
- Yunseo has a real walk cycle in 4 directions.
- Walk scale and ground contact match v06 runtime poses.
- No cable/stamp/action pose clipping introduced.
- 480x270 screenshots show Yunseo as the player, not the old survivor.

S1 HOLD:
- Walk cycle reads as a different character.
- Direction changes pop or shift anchor badly.
- Walk frames occlude prompt/toast/fixture.
- Import or texture load errors occur.

S2 PASS:
- State priority is deterministic.
- Action locks are short and readable.
- Idle/walk/action/hurt/escape transitions are captured in temp/copy QA.
- Existing procedure transient feedback remains intact.

S2 HOLD:
- Movement overrides higher-priority action state.
- State lock makes controls feel delayed.
- Pose transition timing hides prompt/interaction feedback.

S3 HOLD by default:
- Any speed/radius/collision/navigation/reward/cooldown/processing change should be treated as out of scope for movement animation unless explicitly approved.

## Final Recommendation

Do not treat the current v06 8pose runtime pass as movement animation complete.

Recommended next step:
- Create a dedicated `Yunseo walk cycle asset plan` and then run S1 asset generation/normalization.
- In parallel or immediately after, implement a small visual state resolver that keeps the current v06 action poses above walk in priority.

Overall movement track status:
- Audit complete: `20%`
- Implementation not started.
