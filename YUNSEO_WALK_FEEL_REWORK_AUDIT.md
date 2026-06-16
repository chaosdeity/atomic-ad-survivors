# Yunseo Walk-Feel Rework Audit

Date: 2026-06-16

Baseline:

- `origin/main` at `ee016947849a462aecdae6e9a49ee988871984f3`
- Includes PR #8 and PR #9
- Local `main` was not modified for this audit

Progress:

`Yunseo walk-feel polish 0% -> 20% audit`

## Final Verdict

`HOLD / NEEDS WALK-FEEL POLISH`

The current Yunseo walk cycle is technically functioning: 4 directions load, 4 frames advance, action priority works, and the S0 overlay fix keeps Yunseo visible. However, the movement does not yet strongly read as walking at 480x270. The failure is not a texture-load or state-machine failure. It is a feel/readability failure: body mass, foot contact, and frame-to-frame displacement are too weak or too visually masked to sell grounded locomotion.

Recommended first step:

`S0 timing/procedural bob probe before W3 asset rework.`

Reason:

- The current frames have enough directional silhouette to test whether small runtime motion improves perceived walking.
- A no-asset probe can quickly tell whether the weak feel is mostly timing/anchoring or truly frame-art limited.
- If bob/foot-phase tuning still reads as sliding, proceed to S1 W3 walk frame rework.

## Findings

### 1. Frame Change Works, Foot Plant Does Not Fully Read

Evidence:

- Runtime QA confirms `walk_down`, `walk_right`, `walk_up`, and `walk_left` all advance through 4 frames.
- The 4-direction contact sheet shows pose changes, especially in left/right.

Problem:

- The actor anchor remains visually fixed while the whole body swaps pose.
- There is no procedural vertical bob, heel/toe plant cue, or shadow/contact compression.
- At 480x270, this can read as a sprite sliding across the floor while the legs flicker.

Classification:

`Timing/code tuning needed first`

### 2. Down/Up Are Weaker Than Left/Right

Down/up frames preserve a mostly centered body column. The leg alternation is subtle, and the coat/equipment mass covers the lower-body differences. At runtime scale, down/up are more likely to read as idle shimmer than walking.

Classification:

`Asset rework likely needed if S0 probe fails`

### 3. Right/Left Stride Watch Is Real, But Not The Main Failure

Right/left show clearer walking than down/up, but stride width can look slightly posed rather than cyclic. The problem is not only exaggerated stride. The bigger issue is missing weight transfer: hips, shoulders, contact shadow, and body height do not visibly respond to the step.

Classification:

`Both timing/code and asset polish`

### 4. Equipment Density Masks Lower-Body Motion

Yunseo's reel/scanner/stamp case silhouette is important and should stay. But at 0.11 scale, upper-body equipment detail draws the eye away from legs and feet. The current equipment silhouette helps identity but competes with gait readability.

Classification:

`Asset rework candidate`

### 5. 6fps Is Acceptable, But Currently Too Even

Current runtime uses:

- `walk_frame := int(player_walk_anim_time * 6.0) % 4`
- frame advance only while moving
- no start/stop easing
- no movement-phase carryover when changing direction beyond shared timer

6fps is not obviously wrong, but the loop has no accent. A 4-frame walk needs a readable downbeat. Without bob/contact emphasis, 6fps can feel like an evenly timed flipbook rather than a step cycle.

Classification:

`Timing/code tuning needed`

### 6. Start/Stop And Direction Change Can Feel Slippery

Current movement state:

- `player_is_moving` follows raw input.
- `last_move_dir` changes immediately to input direction.
- `player_walk_anim_time` increments while moving.
- Drawing uses the current direction and current phase.

Likely feel issue:

- Direction changes may swap direction frame immediately without a planted transition.
- Start from idle can begin at frame 0 with no anticipatory contact.
- Stop returns to idle instantly, which can look like sliding into a pose.

Classification:

`S0/S2 movement feel candidate`

### 7. Action Pose Priority Is Good And Should Be Preserved

Current priority works:

- Action/transient pose beats walk.
- Prompt scan and interaction hook are visible.
- S0 overlay fix no longer covers Yunseo.

Do not solve walk-feel by lowering action priority. The action poses are part of the procedure read and should remain above walk.

Classification:

`Watch / preserve`

## Root Cause Summary

The weak walk feel comes from a combination of:

1. Insufficient visible foot plant at 480x270.
2. No body bob or contact-shadow rhythm.
3. Down/up lower-body silhouette being too subtle.
4. Equipment/detail density pulling attention away from feet.
5. Immediate direction/state switching with no grounded transition.
6. Even 6fps frame cycling without step accent.

Final classification:

`Both timing/code tuning and asset rework may be needed. Start with S0 timing/procedural bob probe, then decide whether S1 W3 frame rework is required.`

## S0 Timing / Procedural Bob Candidate

Goal:

Improve perceived walking without changing assets.

Allowed future files if approved:

- `scripts/main.gd`
- possibly `scripts/sprite_assets.gd` only if draw helper needs an offset parameter

Candidate changes:

- Add a tiny walk draw offset while moving:
  - vertical bob: 1 px, phase-based
  - optional horizontal sway: 0.5-1 px only if it does not jitter
  - contact shadow pulse: slightly wider/darker on planted frames
- Try walk timing variants:
  - 5fps, 6fps, 7fps comparison
  - keep default candidate at 6fps unless QA shows better read
- Add phase reset rules:
  - start moving begins on a planted frame
  - stopping holds last walk frame for a short visual settle, or returns to idle after a tiny delay
- Keep movement speed/collision/navigation unchanged.

S0 PASS:

- 480x270 capture reads more like grounded walking.
- No prompt/toast/fixture occlusion.
- Action/transient priority remains intact.
- No gameplay numeric changes.

S0 HOLD:

- Bob looks floaty or puppet-like.
- Pixel snapping creates jitter.
- Down/up still read as idle shimmer.
- Direction changes still feel like sliding.

## S1 Walk Frame Rework Candidate

Trigger:

Run S1 only if S0 timing/bob does not make the current W1/W2 frames read as walking.

Scope:

- W3 walk frame rework, not runtime action pose rework.
- Keep Yunseo v06 palette, face/bodyline, dusty ash rose sleeve, reel/scanner/stamp case identity.
- Preserve existing action pose priority and fallback chain.

Frame goals:

- Stronger foot contact/plant silhouettes.
- Clearer alternating leg shapes for down/up.
- Slight shoulder/hip counter-shift without combat/run pose.
- Equipment held closer to body so it does not cover foot motion.
- Consistent origin and ground contact across all 16 frames.

Recommended W3 focus:

1. down/up leg separation and contact read
2. right/left stride normalization
3. equipment density reduction at 48px
4. contact shadow compatibility

S1 PASS:

- At 48px and runtime 0.11 scale, all 4 directions read as walking.
- Yunseo remains same character.
- Tools do not read as gun/map/tablet/weapon.
- No clipping with prompt/toast/fixture.

S1 HOLD:

- Frames look like a different character.
- Direction anchors pop.
- Down/up still read static.
- Equipment obscures feet.

## S2 Movement Feel Candidate

Do only after S0/S1 proves what the visual needs.

Candidate scope:

- Structured visual state resolver.
- Movement animation phase object.
- Direction-change smoothing.
- Start/stop visual settle.
- Optional action-lock timing metadata.

Avoid:

- movement speed changes
- collision radius changes
- navigation changes
- reward/cooldown/processing changes

S2 PASS:

- idle/walk/action/hurt/escape transitions feel intentional.
- walk never overrides higher-priority procedure/action states.
- controls do not feel delayed.

## Hold / Watch Items

Can remain watch for now:

- pose 05 `stamp_ready` read
- smaller safe toast feedback readability
- right/left stride if S0 improves perceived grounding
- 48px tool density if identity remains readable

Cannot remain watch if the next full playtest still reports sliding:

- down/up walk readability
- direction-change pop
- foot plant/contact shadow absence

## Forbidden Scope For This Track

Do not change without separate approval:

- reward values
- cooldown values
- processing values
- movement speed
- collision
- navigation
- R01 background/fixture assets
- Yunseo action pose PNGs
- PR #8/#9 merged history

## Recommended Next Approval

```text
Yunseo walk-feel S0 timing/bob probe를 실행해라.

목표:
현재 W1/W2 walk frames는 그대로 두고, runtime draw/timing만 최소 조정해 480x270에서 걷는 느낌이 살아나는지 검증한다.

허용:
- scripts/main.gd
- 필요 시 scripts/sprite_assets.gd draw offset parameter

금지:
- PNG 수정/생성
- import 생성
- movement speed/collision/navigation/reward/cooldown/processing 변경
- action pose priority 변경

QA:
- 480x270 temp/copy screenshots
- no-bob vs bob comparison sheet
- 5/6/7fps timing comparison if cheap
- start/stop/direction-change samples
- action priority regression check
```

## Next Step

S0 timing/procedural bob probe.

If S0 HOLD, proceed to S1 W3 walk frame rework plan.
