# Yunseo v06 Walk Cycle Generation Prompts

Date: 2026-06-15
Worktree: `C:\workspace\_codex_yunseo_runtime_state_v02`
Basis: `YUNSEO_V06_WALK_CYCLE_ASSET_PLAN.md`

## Goal

Lock generation prompts for Yunseo v06 4-direction x 4-frame walk cycle assets. This document does not generate images, copy PNGs, create imports, modify code, stage, commit, push, or create a PR.

Progress: Yunseo movement animation `30% -> 40% prompt lock`

## Generation Strategy

Batch W1:
- `walk_down` 4 frames
- `walk_right` 4 frames

Batch W2:
- `walk_up` 4 frames
- `walk_left` 4 frames

Rule:
- Generate and QA W1 first.
- Proceed to W2 only after W1 passes identity, scale, tool silhouette, and 48/64/96 preview checks.

## Shared Identity Lock

All prompts must preserve:
- adult Yunseo v06
- same face, bodyline, palette, and costume family as approved v06 runtime poses
- dusty ash rose swapped sleeve
- soft graphite / dirty pearl / ash gray base
- muted procedural field-worker clothing, not uniform
- compact recovery-line reel
- flat scanner
- stamp case / tool case
- grounded subtle walk loop for top-down / 3-quarter 2D game
- transparent background
- no name tag, no text, no logos

Hard read locks:
- scanner must read as a flat scanner, not a gun
- stamp case must read as a case/tool, not document/tablet/map
- cable/reel must not read as weapon
- no tactical/military/police/factory/service worker uniform
- no exaggerated running
- no combat pose

## Frame Consistency Rules

For every direction:
- 4 frames per direction.
- Stable ground contact.
- Stable head/body scale across all frames.
- Stable runtime origin target at `x=320, y=560`.
- No frame-to-frame costume drift.
- No sudden tool-side swap within one direction.
- No foot sliding when looped at 6-8 fps.
- Frame 01 and frame 04 must loop cleanly back to frame 01.
- Motion should be subtle: foot alternation, slight torso bob, coat/strap sway.
- Keep action-state gestures out of the walk cycle: no stamping, hooking, pulling, aiming, hurting, escaping.

Recommended frame rhythm:
- frame 01: neutral passing step
- frame 02: left/right foot forward emphasis
- frame 03: neutral opposite passing step
- frame 04: opposite foot forward emphasis

## Canvas / Origin / Scale Rules

Target per frame:
- transparent PNG
- normalized canvas `796x658`
- origin point `Vector2(320, 560)`
- runtime scale `0.11`

If generating direction strips:
- each direction strip should contain 4 frames of identical size
- each frame must preserve the same origin and ground-contact line
- final normalization must be able to split each frame to `796x658`

If generating a sheet:
- 4 columns x 1 row for a single direction
- or 4 rows x 4 columns for final combined sheet after all directions pass

Do not crop tightly around the body if it breaks origin consistency.

## Batch W1 Prompts

### walk_down Positive Prompt

```text
Create a production-quality transparent PNG 2D game character walk cycle for adult Yunseo v06, walk_down direction, 4 frames. Top-down / three-quarter 2D survivor game view. Yunseo is an adult Korean woman field investigator in a bright dystopian residential advertising facility, same face, bodyline, palette, and costume family as the approved Yunseo v06 runtime poses.

Palette and costume: soft graphite, dirty pearl, ash gray, muted procedural clothing, dusty ash rose swapped sleeve clearly visible but not dominant. Compact recovery-line reel, flat scanner, and stamp case/tool case are present as practical inspection/retrieval tools. Scanner is flat and compact, angled down or across the body, never aimed like a gun. Stamp case reads as a closed tool case, not a document, tablet, clipboard, or map. Cable is short, looped, slack, or bundled, never a weapon line.

Animation: subtle grounded walking loop, 4 frames, readable at runtime scale 0.11 in a 480x270 game view. Front-facing/downward walk, clear but restrained foot alternation, slight torso bob, small coat/strap sway, stable ground contact, no exaggerated run, no combat pose. Maintain same character scale and silhouette across frames.

Frame format: 4 frames, each normalized to 796x658 transparent canvas, shared origin at x=320 y=560, consistent ground contact and pivot. No text, no logos, no name tag, no UI.
```

### walk_down Negative Prompt

```text
No gun, no pistol grip, no rifle, no weapon aiming, no long barrel, no muzzle, no trigger pose, no cable weapon, no whip, no laser line, no sword, no spear, no combat stance, no exaggerated running, no tactical soldier, no military, no police, no factory uniform, no cleaner uniform, no service worker uniform, no delivery worker, no mascot, no child/chibi proportions, no generic survivor, no name tag, no text, no pseudo text, no logo, no tablet, no open map, no document board, no clipboard, no office worker, no boardgame token, no UI sticker, no map marker, no frame-to-frame scale drift, no foot sliding, no anchor pop, no cropped feet, no horror/ruin look, no rent/debt/collection imagery.
```

### walk_right Positive Prompt

```text
Create a production-quality transparent PNG 2D game character walk cycle for adult Yunseo v06, walk_right direction, 4 frames. Top-down / three-quarter 2D survivor game view. Yunseo is an adult Korean woman field investigator, same face, bodyline, palette, costume, and tool identity as approved Yunseo v06 runtime poses.

Palette and costume: soft graphite, dirty pearl, ash gray, dusty ash rose swapped sleeve, muted practical field outfit. Side-profile walking silhouette should preserve Yunseo identity: head profile, shoulder line, coat/strap rhythm, compact recovery-line reel, flat scanner, and closed stamp case/tool case. The scanner must angle down or rest across the body as a flat inspection scanner, not point forward like a gun. Cable/reel must appear as compact recovery equipment, with short slack loops or bundled line, not a weapon line.

Animation: subtle grounded rightward walk loop, 4 frames. Clear foot alternation and slight body bob while staying calm and procedural, not running or attacking. Maintain stable ground contact, stable frame scale, consistent tool placement, and readable silhouette at runtime scale 0.11 in 480x270.

Frame format: 4 frames, each normalized to 796x658 transparent canvas, shared origin at x=320 y=560, consistent ground contact and pivot. No text, no logos, no name tag, no UI.
```

### walk_right Negative Prompt

```text
No gun silhouette, no scanner as pistol, no forward aiming, no rifle, no long barrel, no cable weapon, no whip, no taut attack line, no sword, no spear, no combat pose, no exaggerated run, no tactical/military/police read, no factory/service/cleaning worker uniform, no delivery worker, no generic survivor, no mascot, no chibi, no child proportions, no name tag, no text, no logo, no tablet, no map, no document, no clipboard, no open case, no office-worker read, no inconsistent sleeve side within frames, no frame-to-frame scale drift, no anchor pop, no foot sliding, no cropped equipment, no boardgame token, no UI sticker, no map marker, no horror/ruin, no rent/debt/collection imagery.
```

## Batch W2 Prompts

### walk_up Positive Prompt

```text
Create a production-quality transparent PNG 2D game character walk cycle for adult Yunseo v06, walk_up direction, 4 frames. Top-down / three-quarter 2D survivor game view. Yunseo is seen from the back/upward walking direction while preserving the same adult Yunseo v06 identity, bodyline, palette, costume family, and field investigator silhouette.

Palette and costume: soft graphite, dirty pearl, ash gray, muted procedural outfit, dusty ash rose swapped sleeve visible where the arm swing allows it. Back-facing silhouette must retain identity through hair/head shape, shoulders, coat/strap shape, compact recovery-line reel, flat scanner, and stamp case/tool case. The circular recovery-line reel can be more visible from the back/side, but it must not become a shield, target marker, boardgame token, or weapon device. Cable remains short, bundled, or slack.

Animation: subtle grounded upward/back-facing walk loop, 4 frames. Stable foot alternation, restrained torso bob, natural shoulder/strap sway. No combat pose, no escape sprint, no tactical backpack read. Maintain stable ground contact and readable silhouette at runtime scale 0.11 in 480x270.

Frame format: 4 frames, each normalized to 796x658 transparent canvas, shared origin at x=320 y=560, consistent ground contact and pivot. No text, no logos, no name tag, no UI.
```

### walk_up Negative Prompt

```text
No tactical backpack soldier, no military, no police, no factory uniform, no service worker uniform, no cleaner uniform, no delivery worker, no faceless black silhouette, no generic survivor, no mascot, no chibi, no gun, no rifle, no scanner as weapon, no cable weapon, no whip, no laser line, no sword, no spear, no shield, no target marker, no boardgame token, no map marker, no UI sticker, no tablet, no map, no document board, no clipboard, no name tag, no text, no logo, no exaggerated running, no escape sprint, no frame-to-frame scale drift, no foot sliding, no anchor pop, no cropped feet or gear, no horror/ruin look, no rent/debt/collection imagery.
```

### walk_left Positive Prompt

```text
Create a production-quality transparent PNG 2D game character walk cycle for adult Yunseo v06, walk_left direction, 4 frames. Top-down / three-quarter 2D survivor game view. Yunseo is an adult Korean woman field investigator, same face, bodyline, palette, costume, and tool identity as approved Yunseo v06 runtime poses.

Palette and costume: soft graphite, dirty pearl, ash gray, dusty ash rose swapped sleeve, muted practical field outfit. Side-profile walking silhouette should preserve Yunseo identity: subtle face/profile read, shoulder line, coat/strap rhythm, compact recovery-line reel, flat scanner, and closed stamp case/tool case. The scanner must angle downward or across the body as a flat inspection tool, never forward like a gun. The cable/reel must be compact, looped, or bundled, not a weapon line.

Animation: subtle grounded leftward walk loop, 4 frames. Clear foot alternation and small body bob, calm procedural movement, not running or attacking. Maintain stable ground contact, stable frame scale, consistent tool placement, and readable silhouette at runtime scale 0.11 in 480x270.

Frame format: 4 frames, each normalized to 796x658 transparent canvas, shared origin at x=320 y=560, consistent ground contact and pivot. No text, no logos, no name tag, no UI.
```

### walk_left Negative Prompt

```text
No gun silhouette, no scanner as pistol, no forward aiming, no rifle, no long barrel, no cable weapon, no whip, no taut attack line, no sword, no spear, no combat pose, no exaggerated run, no tactical/military/police read, no factory/service/cleaning worker uniform, no delivery worker, no generic survivor, no mascot, no chibi, no child proportions, no name tag, no text, no logo, no tablet, no map, no document, no clipboard, no open case, no office-worker read, no inconsistent sleeve side within frames, no frame-to-frame scale drift, no anchor pop, no foot sliding, no cropped equipment, no boardgame token, no UI sticker, no map marker, no horror/ruin, no rent/debt/collection imagery.
```

## QA Sheet Requirements

W1 QA sheet must include:
- walk_down 4 native frames
- walk_right 4 native frames
- 48px preview row for both directions
- 64px preview row for both directions
- 96px preview row for both directions
- simple loop strip contact sheet
- neutral/checker background

W2 QA sheet must include:
- walk_up 4 native frames
- walk_left 4 native frames
- 48px preview row for both directions
- 64px preview row for both directions
- 96px preview row for both directions
- simple loop strip contact sheet
- neutral/checker background

Final combined QA sheet must include:
- all 4 directions x 4 frames
- direction labels outside image content only, never baked into asset PNG
- 48/64/96 scale comparison
- v06 8pose reference row
- R01 480x270 mock overlay after integration planning

## Reject Criteria

Reject the generated batch if any of these are true:
- Yunseo reads as a different character from v06 runtime poses.
- The scanner reads as a gun, pistol, rifle, or aimed weapon.
- Cable/reel reads as a weapon, whip, laser, spear, or attack line.
- Stamp case reads as a document, tablet, map, clipboard, UI board, or office object.
- Costume reads as tactical/military/police/factory/service/cleaning worker uniform.
- Any frame has foot sliding, anchor pop, cropped feet, or major scale drift.
- Walk reads as running, combat stance, escape sprint, or mascot bounce.
- Direction pair is inconsistent in body proportions, sleeve placement, palette, or equipment.
- 48px preview collapses into old survivor/generic character.
- Background is not transparent.
- Text, logo, name tag, pseudo text, UI marker, or map marker appears.

## W1 Generation Approval Text

Use this before generating Batch W1:

```text
Approve Batch W1 generation only: Yunseo v06 walk_down 4 frames and walk_right 4 frames. Use the locked prompts in YUNSEO_V06_WALK_CYCLE_GENERATION_PROMPTS.md. Do not generate W2 yet. Output transparent PNG candidates outside active root, plus W1 QA sheets with native frames and 48/64/96 previews. Reject any scanner-as-gun, cable-as-weapon, stamp-case-as-document/tablet/map, uniform, mascot, or anchor-pop result.
```

## W2 Generation Approval Text

Use this only after W1 passes:

```text
Approve Batch W2 generation only after W1 PASS: Yunseo v06 walk_up 4 frames and walk_left 4 frames. Use the locked prompts in YUNSEO_V06_WALK_CYCLE_GENERATION_PROMPTS.md and match W1 character identity, palette, scale, origin, tool silhouettes, and walking rhythm. Output transparent PNG candidates outside active root, plus W2 QA sheets with native frames and 48/64/96 previews. Do not copy into active root, do not create imports, and do not modify code until W2 QA PASS.
```

## Final Lock

Prompt lock judgment: `PASS`

Next action should be W1 generation only, not W2, integration, import, or code work.
