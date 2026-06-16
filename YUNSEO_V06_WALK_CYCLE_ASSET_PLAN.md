# Yunseo v06 4-Direction Walk Cycle Asset Plan

Date: 2026-06-15
Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`
Branch: `codex/yunseo-runtime-state-v02`

## Goal

Define the asset scope for Yunseo v06 runtime 4-direction walking animation. This plan does not generate images, copy PNGs, create imports, or modify code.

Progress: Yunseo movement animation `20% -> 30% asset plan`

## Current Baseline

Yunseo v06 runtime state is currently `PASS_WITH_WATCH`:
- 8 normalized action/state poses are connected at runtime.
- Runtime scale is `0.11`.
- Normalized pose canvas is `796x658`.
- Runtime pose origin is `Vector2(320, 560)`.
- Procedure interaction transient poses work.
- Existing temporary 48x48 survivor remains fallback only.

Movement animation audit result:
- Current 8pose set is not a walking animation.
- Dedicated walk cycle assets are needed.
- S1 walk cycle asset pass is the recommended next production step.

## Role Separation

Keep current 8pose assets for action/state:
- `idle`: default still/readiness pose
- `scan_low`: prompt / procedure scanning
- `cable_hook`: procedure interaction transient
- `pull_retrieval`: successful retrieval / pull transient
- `stamp_ready`: charge ready / stamp state
- `reject_stamp`: whiff / reject transient
- `hurt_interrupted`: damage / interruption
- `retrieval_escape`: recall / escape / recovery

Add new walk cycle assets for locomotion only:
- `walk_down`
- `walk_up`
- `walk_left`
- `walk_right`

Walk should only display when no higher-priority action/hurt/escape state is active.

## Frame Count Recommendation

Recommended: `4 frames per direction`

Reasoning:
- 4 frames are enough to show readable top-down stepping at runtime scale `0.11`.
- 4 frames keep generation, normalization, import, and QA manageable.
- 6 frames may be smoother, but the extra frames add production risk without enough benefit at 480x270.
- Current gameplay camera and combat effects need clean silhouettes more than high-frame animation.

Rejected for now:
- `2 frames`: too close to the old 48x48 prototype feel.
- `6 frames`: useful later for polish, not needed for first production walk pass.
- `8-direction`: defer until aiming/facing becomes a separate visual requirement.

Planned asset count:
- 4 directions x 4 frames = 16 walk frames total.

## Canvas / Origin / Scale

Preferred format:
- One transparent PNG sheet:
  - `yunseo_v06_walk_4dir_4frame_sheet.png`
  - 4 rows x 4 columns
  - rows: down, left, right, up
  - columns: frame 01-04
- Or separate direction strips if generation quality is higher:
  - `yunseo_v06_walk_down_4frame.png`
  - `yunseo_v06_walk_left_4frame.png`
  - `yunseo_v06_walk_right_4frame.png`
  - `yunseo_v06_walk_up_4frame.png`

Frame canvas:
- Preferred: each frame normalized to `796x658`.
- Runtime origin: `Vector2(320, 560)` per frame.
- Runtime scale: `0.11`.
- Ground contact must stay stable under the origin across all frames.

If a smaller cropped walk frame is used:
- It must document a new walk origin.
- It must visually match the current action-pose ground contact at 480x270.
- It must not introduce foot sliding or anchor popping.

## Four-Direction Silhouette Requirements

### walk_down

Purpose:
- Most readable/default player-facing locomotion.

Requirements:
- Face and torso readable at 0.11 scale.
- Dusty ash rose replacement sleeve visible but not dominant.
- Reel/scanner/stamp case silhouette visible as carried equipment, not weapon.
- Step alternation must be clear in feet and coat/strap sway.
- Scanner points down or across the body, never forward like a pistol.

Failure reads:
- gun-ready stance
- mascot strut
- service worker carrying cleaning gear
- office worker holding a tablet/map

### walk_up

Purpose:
- Back-facing movement while preserving Yunseo identity.

Requirements:
- Back silhouette retains hair/coat/gear identity.
- Circular recovery-line reel may be most visible from this angle.
- Cable should wrap or hang, not trail like a weapon beam.
- Stamp case should read as a work case attached to body side/back.
- Head and shoulders must not collapse into a generic dark figure.

Failure reads:
- tactical backpack soldier
- cable weapon user
- faceless black silhouette

### walk_left

Purpose:
- Side profile movement with gear clarity.

Requirements:
- Nose/chin/head profile subtle but present.
- Dusty ash rose sleeve remains visible on the forward arm when plausible.
- Reel appears as a side-mounted circular tool or partial circle.
- Scanner should angle down/neutral, not horizontal like a gun.
- Cable line should be short, bundled, or looped.

Failure reads:
- handgun silhouette
- spear/cable weapon silhouette
- delivery/service worker with generic bag

### walk_right

Purpose:
- Mirror-compatible side profile without losing asymmetrical identity.

Requirements:
- Can be generated independently or mirrored from left only if the replacement sleeve and tool placement remain intentional.
- If mirrored, document whether dusty ash rose sleeve swaps screen side or remains character side.
- Reel/scanner/stamp case should remain the same character equipment, not a new prop.
- Feet must alternate with readable body bob at 0.11 scale.

Failure reads:
- inconsistent costume between left and right
- scanner as firearm
- cable as attack line

## Reel / Scanner / Stamp Case Direction Rules

Recovery-line reel:
- Down: partial circle visible near hip/side.
- Up: circle can be most visible on back/side.
- Left/right: visible as a side-mounted circular silhouette, partly occluded by body.
- Never enlarge into a shield, map marker, or boardgame token.

Scanner:
- Must read as inspection/scanning equipment.
- Keep compact, angled downward or across body.
- No pistol grip, muzzle, trigger pose, long barrel, or aiming line.

Stamp case:
- Should read as a procedural work case / stamp kit.
- Do not make it look like a tablet, map, open document, or UI board.
- Pose 05 remains `PASS_WITH_WATCH`; walk assets should avoid repeating that open-case ambiguity.

Cable:
- Use short loops, bundled line, or slack coil.
- No taut weapon line during normal walking.
- No laser/whip/spear read.

## Palette / Identity Rules

Keep v06 identity:
- Existing Yunseo v06 palette.
- Dusty ash rose replacement sleeve.
- Adult field-worker silhouette, not teen mascot, not generic survivor.
- Same hair/face/costume family as current 8pose runtime.
- Same R01 bright advertisement world contrast.

Avoid:
- pure black tactical outfit
- generic pastel mascot
- service/cleaning worker read
- weaponized scanner/cable
- office/map/tablet worker read

## Generation Prompt Draft

Use for each direction or for a full sheet generation:

```text
Production-quality transparent PNG 2D game character walk cycle for Yunseo v06, top-down/isometric 2D survivor game, adult Korean woman field investigator in a bright dystopian residential advertising facility, same identity and palette as approved Yunseo v06 runtime poses. Four-frame walk cycle, stable ground contact, consistent body scale and pivot, readable at runtime scale 0.11 in a 480x270 game view.

Costume: muted professional field outfit, dusty ash rose replacement sleeve, compact recovery-line reel, small scanner, stamp case silhouette, practical straps and worn procedural gear. Equipment must read as inspection/retrieval tools, not weapons. Subtle step alternation, coat/strap sway, clear foot placement, no exaggerated cartoon bounce.

Direction: [walk_down / walk_up / walk_left / walk_right].
Transparent background, no text, no UI, no map markers.
Frame format: 4 frames, each normalized to 796x658 canvas with shared origin at x=320 y=560, consistent ground contact, same character scale across all frames.
```

Full sheet prompt variant:

```text
Create a transparent PNG sprite sheet for Yunseo v06 4-direction walking animation. Layout: 4 rows x 4 columns. Rows in order: walk_down, walk_left, walk_right, walk_up. Columns are frames 01-04. Each frame is normalized to 796x658 canvas with stable origin at x=320 y=560 and runtime scale 0.11. Maintain approved Yunseo v06 identity, dusty ash rose replacement sleeve, compact recovery-line reel, scanner, and stamp case. The walk should be readable in a 480x270 top-down 2D game without looking like a weapon pose or a generic survivor.
```

## Negative Prompt

```text
No guns, no pistol grip, no rifle, no weapon aiming, no long barrel, no whip, no cable weapon, no laser line, no sword, no spear, no tactical soldier, no police, no military, no cleaner/service worker, no delivery worker, no generic mascot, no chibi child, no boardgame token, no UI sticker, no map marker, no text, no pseudo text, no tablet, no open map, no document board, no clipboard read, no office worker, no horror/ruin look, no rent/debt/collection imagery, no factory outfit, no exaggerated cartoon bounce, no frame-to-frame scale drift, no foot sliding, no anchor pop, no transparent brush wash.
```

## 48 / 64 / 96 Scale QA

For each direction and frame:

48px preview:
- Character identity still recognizable as Yunseo, not the old survivor.
- Scanner does not read as a gun.
- Cable does not read as weapon line.
- Walk step is visible enough, even if small.

64px preview:
- Dusty ash rose sleeve can be identified.
- Reel/scanner/stamp case read as compact procedural tools.
- Left/right direction difference is clear.
- Ground contact does not jitter across frames.

96px preview:
- Costume details match v06 action poses.
- No frame has inconsistent face/body proportions.
- No frame has accidental tablet/map/document silhouette.
- Foot/coat/strap motion forms a smooth 4-frame loop.

Contact sheet required:
- 4 directions x 4 frames at native preview.
- 48/64/96 scaled preview rows.
- Checkerboard or neutral background.

## R01 480x270 QA Criteria

Required temp/copy QA scenes:
- walk_down in open house street
- walk_up in model house threshold
- walk_left in fake return route
- walk_right in suburb navigation corridor
- walk near check-in / room-meal / renewal fixture
- walk into procedure prompt range
- interact while moving, verifying transient action pose priority
- hurt while moving
- charge ready while moving
- recall/escape state after movement

PASS:
- Yunseo reads as the playable character in motion.
- Walk cycle does not replace action/hurt/escape states.
- Prompt/toast does not cover Yunseo.
- Fixture/background separation remains readable.
- No old 48x48 survivor appears as default.
- No texture load errors.
- No Godot fatal/errors.
- No active `.godot` pollution from QA.

HOLD:
- Walk looks like sliding still poses.
- Direction changes pop or shift anchor badly.
- Scanner reads as a gun.
- Cable reads as weapon line.
- Stamp case reads as tablet/map/document.
- Yunseo blends into R01 background.
- Walk cycle reads as a different character from the 8pose set.

## Import Target Candidates

Preferred active target folder:
`assets/art_inbox/yunseo_runtime_v06/`

Preferred sheet file:
- `yunseo_v06_walk_4dir_4frame_sheet.png`
- `yunseo_v06_walk_4dir_4frame_sheet.png.import`

Alternative direction strips:
- `yunseo_v06_walk_down_4frame.png`
- `yunseo_v06_walk_down_4frame.png.import`
- `yunseo_v06_walk_left_4frame.png`
- `yunseo_v06_walk_left_4frame.png.import`
- `yunseo_v06_walk_right_4frame.png`
- `yunseo_v06_walk_right_4frame.png.import`
- `yunseo_v06_walk_up_4frame.png`
- `yunseo_v06_walk_up_4frame.png.import`

Recommendation:
- Use a single sheet if generation/normalization can keep frame alignment stable.
- Use direction strips if generation quality is better and normalization can still enforce identical frame size/origin.

`.png.import` note:
- Existing repo ignores `*.import`, so future staging will need exact `git add -f` for walk `.png.import` files.

## Implementation Order

1. Generate walk candidate assets outside active root.
2. Build 48/64/96 scale contact sheet.
3. Reject candidates with gun/cable weapon/document/map reads.
4. Normalize accepted frames to `796x658` and origin `320,560`, or document a new stable walk origin.
5. Prepare active alias PNG and `.png.import`.
6. Add `sprite_assets.gd` walk texture loading/draw helper.
7. Add `main.gd` visual state resolver:
   - action/hurt/escape poses above walk
   - walk when `player_is_moving`
   - idle when stationary and no higher state
8. Run temp/copy 480x270 walk QA.
9. Write integration report and final diff audit before staging.

## PASS / HOLD Criteria

Asset plan PASS:
- 4-direction walk scope is defined.
- 4-frame recommendation is locked.
- 8pose action/state role remains separate.
- Canvas/origin/scale criteria are defined.
- Tool silhouette risks are explicit.
- QA expectations are defined before generation.

Asset plan HOLD:
- Walk tries to reuse the current 8pose set as final movement animation.
- No clear decision on frame count.
- No scanner/cable/stamp case rejection criteria.
- No 480x270 R01 QA plan.
- No import target candidate.

Future asset PASS:
- 4 directions x 4 frames are visually consistent.
- Yunseo identity matches v06 runtime poses.
- Runtime 0.11 scale remains readable.
- No weapon/document/map misread.
- Stable ground contact.

Future asset HOLD:
- Any direction reads as a different character.
- Scanner/cable becomes weapon-like.
- Stamp case becomes document/tablet/map-like.
- Directional frames drift in scale/origin.
- Walk cycle looks like a generic survivor or service worker.

## Final Recommendation

Proceed with a dedicated S1 walk cycle asset pass using `4 directions x 4 frames`.

Keep the current v06 8pose set as action/state poses. Do not use it as the final walking animation.
