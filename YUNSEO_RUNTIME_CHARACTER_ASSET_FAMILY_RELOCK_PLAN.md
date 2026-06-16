# Yunseo Runtime Character Asset Family Relock Plan

Date: 2026-06-17

Status: `PLAN ONLY`

Progress:

- `Yunseo character asset family relock 0% -> 20% plan`
- `Yunseo walk-feel polish 75% HOLD 유지`

## Goal

Resolve Yunseo runtime asset consistency drift by stopping piecemeal prompt-only generation and relocking the runtime character as one asset family: action poses plus walk cycle.

This step creates the plan only.

## Hard Scope Lock For This Step

Do not perform any of the following in this step:

- image generation
- PNG edit, copy, rename, normalization, or atlas creation
- `.png.import` creation or regeneration
- active project import
- runtime code changes
- Godot active-root execution
- `git add`, commit, push, or PR creation
- W3A or W3A-r2 active integration

## Background

Current baseline:

- PR #8 merged Yunseo v06 runtime/state and walk baseline.
- PR #9 merged the S0 overlay occlusion follow-up.
- Yunseo runtime/state v02 is `100% LOCK`.
- Current default action identity is the approved Yunseo v06 action pose set.
- W1/W2 walk cycle is active and technically works, but walk-feel remains weak.
- W3A improves down/up gait readability but reads like a long-coat/trench/default-outfit variant.
- W3A-r2 still fails original Yunseo face/body/style identity and is `HARD HOLD / REJECT`.

Core problem:

`identity drift from isolated prompt generation`

The next Yunseo default runtime asset pass must use existing approved Yunseo assets as reference/edit targets. Text prompt alone is no longer an acceptable production method for default Yunseo.

## PMO Recommendation

Recommended decision: `A + D`

- `A`: Keep the approved Yunseo v06 action pose 8 as canonical master, then remake only the walk 16 frames by reference/edit against that master.
- `D`: Preserve W3A and W3A-r2 only as variant/skin research candidates. They must remain excluded from default runtime integration.

Reason:

- The v06 action 8 already carries the accepted runtime identity and is merged as the default.
- The active problem is walk-feel, not action-pose identity.
- Rebuilding all 24 frames now would increase cost and risk without proving that the existing canonical action identity is wrong.
- W3A/W3A-r2 proved the failure mode: better gait is not useful if the character family changes.

Fallback: `B` only if the reference/edit walk pass cannot preserve action-to-walk continuity.

Rejected as a relock solution: `C`. S0 bob/timing can remain a comparison/control layer, but it cannot solve the asset-family drift alone.

## Option Judgment

| Option | Judgment | Notes |
|---|---|---|
| A. Keep v06 action 8 canonical; remake walk 16 only | `RECOMMENDED / PASS TO PLAN` | Lowest-risk path. Uses approved identity as anchor and fixes the failing walk surface. |
| B. Remake action 8 + walk 16 from one reference sheet | `FALLBACK / HOLD FOR NOW` | Valid if A fails, but larger import/code/QA blast radius and risks losing accepted action identity. |
| C. Keep PR #8 assets and compensate with S0 bob/timing only | `HOLD / CONTROL ONLY` | Useful for ON/OFF QA and temporary feel comparison, not sufficient for identity relock. |
| D. Preserve W3A/W3A-r2 as variant/skin candidates only | `PASS / REQUIRED` | Keeps useful gait/costume research while preventing default drift. |

## Canonical Reference Assets

Primary canonical master:

- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_action_sheet_8poses_updated_v02.png`
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_action_sheet_updated_v02_scale_check_96_64_48.png`
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_normalized_contact_sheet_draft_v02.png`
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_normalized_scale_check_96_64_48_draft_v02.png`

Canonical individual pose references:

- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_01_hold_v02_cutout_normalized_draft_v02.png` - idle
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_02_normalized_draft_v02.png` - scan low
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_03_normalized_draft_v02.png` - cable hook
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_04_hold_v02_cutout_normalized_draft_v02.png` - pull retrieval
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_05_hold_v02_cutout_normalized_draft_v02.png` - stamp ready
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_06_normalized_draft_v02.png` - reject stamp
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_07_normalized_draft_v02.png` - hurt interrupted
- `assets/yunseo_p0_v06_runtime_action_sheet/yunseo_p0_v06_runtime_pose_08_hold_v02_cutout_normalized_draft_v02.png` - retrieval escape

Runtime/merged alias references:

- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_idle.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_scan.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_hook.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_pull.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_stamp_ready.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_reject_stamp.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_hurt.png`
- `assets/art_inbox/p0_commercial_runtime_v01/characters/yunseo_p0_v06_pose_escape.png`
- `assets/art_inbox/p0_commercial_runtime_v01/contact_sheets/yunseo_combat_integrated_48x48_sheet.png`

Walk baseline references, not canonical identity:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w1_right_rework\frames\*.png`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w2\frames\*.png`

W3A/W3A-r2 preservation-only references:

- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_down_up_rework\`
- `C:\workspace\_codex_yunseo_walk_cycle_assets\w3a_r2_down_up_rework\`

## Default Yunseo Identity Lock Rules

Identity gate order:

1. Same character read as approved v06 action set.
2. Same face/head/body proportions.
3. Same outfit structure.
4. Same equipment layout.
5. Same runtime scale/origin/grounding.
6. Only then judge walk-feel.

Default fails immediately if it looks like:

- variant / skin / alternate costume
- long coat or trench coat Yunseo
- generic survivor
- tactical soldier
- service/cleaning/delivery worker
- mascot/chibi/younger character
- different illustration family from the current runtime action set

## Anatomy / Costume / Equipment Standards

Face and head:

- Preserve the v06 face/body read from the action poses.
- Hair silhouette must remain compact and recognizable across down/up/left/right.
- Do not introduce a new facial style, larger eyes, softer mascot face, or unrelated portrait identity.

Upper body:

- Preserve fitted utility outfit, harness/strap rhythm, and dusty ash rose replacement sleeve.
- No new long outerwear layer.
- No trench, cape, apron, bulky coat panel, or rear coat flap.

Lower body:

- Preserve trousers/boots/leg proportion from v06.
- Improve walking through boot, cuff, knee, hip, and hem movement, not through a new garment silhouette.
- Down/up leg alternation must be readable without changing costume family.

Harness:

- Harness/straps must stay close to the action pose language.
- Strap motion may shift subtly by frame, but cannot become a new chest rig, backpack, or tactical vest.

Equipment:

- Recovery-line reel stays compact and attached to the established body side/back language.
- Scanner stays compact, angled down/across body, and never reads as a gun.
- Stamp case stays procedural and compact, not a tablet, map, document board, or clipboard.
- Cables stay short, slack, bundled, or looped. No taut weapon line, whip, spear, laser, or attack beam.

## Canvas / Origin / Scale

Keep current runtime constants:

- frame canvas: `796x658`
- runtime origin: `Vector2(320, 560)`
- runtime scale: `0.11`

This is a hard default unless a later approved technical audit proves a new walk-only origin is safer.

Requirements:

- All action and walk frames must share stable ground contact.
- Frame-to-frame foot plant must not pop around the origin.
- Any exception must include a separate origin/scale audit and side-by-side runtime proof before active integration.

## Action Pose Priority

Keep the current action/state priority. Do not solve walk-feel by lowering action priority.

Required priority:

1. terminal / recalled / escape -> `retrieval_escape`
2. hurt / interrupted -> `hurt_interrupted`
3. hard action transient -> `cable_hook`, `pull_retrieval`, `reject_stamp`
4. charge ready / charge open -> `stamp_ready`
5. charge warning / stationary prompt scan -> `scan_low`
6. walking -> 4-direction walk cycle
7. idle -> pose 01 `idle`

Walk may beat idle only while moving. Walk must never beat action, hurt, escape, or hard procedure transients.

## Walk Cycle Structure

Keep the structure:

- 4 directions: `down`, `right`, `up`, `left`
- 4 frames per direction
- 16 frames total
- target runtime rate remains `6 fps` until QA proves otherwise
- S0 bob/timing remains a QA ON/OFF comparison layer, not a replacement for asset relock

Walk remake target:

- Reference/edit each walk frame from approved v06 action or current W1/W2 frames.
- Edit leg/boot/cuff/hip/shoulder/strap motion while preserving original face/body/outfit/equipment.
- Down/up are the highest priority because they currently read weakest.
- Left/right must be kept in family with down/up; no side-only partial style mismatch.

## Replacement Strategy

Preferred next asset pass: `W4 family relock walk 16`

Characteristics:

- Uses approved v06 action assets as identity reference/edit targets.
- Produces a full 16-frame walk family together.
- Does not mix W1/W2, W3A, W3A-r2, and new frames inside default unless the full family sheet passes.
- Does not promote a single improved direction alone.

Partial replacement rule:

`No inconsistent partial replacement.`

Any default walk replacement must pass as the whole 16-frame family against the action 8 master. If only down/up improve but side/action continuity fails, the set remains HOLD.

## Import Delta And Risk If Merged Assets Are Replaced Later

No import or asset replacement is allowed in this step.

Expected future active delta for option A:

- Replace or add 16 walk PNG aliases.
- Replace or add 16 `.png.import` files if Godot import metadata changes.
- Potential code delta: ideally `0` if filenames and paths remain stable; otherwise likely `scripts/sprite_assets.gd` only.
- Runtime QA reports/contact sheets.

Risk:

- `.png.import` is ignored by the repo and may require exact `git add -f` in a future approved stage.
- Replacing files with same names reduces code churn but raises rollback/hash audit needs.
- Adding a new versioned folder reduces overwrite risk but may require code path changes.
- Active `.godot` or broad import pollution is a stage blocker.
- If action 8 are also replaced under option B, blast radius expands to 24 PNG + 24 imports + all action priority QA.

Recommendation for future approved integration:

- Use temp/copy QA first.
- Keep active root untouched until identity/family PASS.
- Prefer exact alias replacement only after hash manifest and rollback package are prepared.

## Active Integration Forbidden Range

Until a later approval explicitly unlocks integration, do not:

- copy W4 candidate PNGs into active asset folders
- overwrite PR #8 merged walk aliases
- touch PR #8 merged action pose PNGs
- generate or modify `.png.import`
- edit `scripts/main.gd`
- edit `scripts/sprite_assets.gd`
- run active-root Godot import
- stage, commit, push, or open PR
- integrate W3A/W3A-r2 into default runtime

W3A/W3A-r2 remain `HARD HOLD` for default.

## QA Sequence

QA must run in this order. A later step cannot rescue a failure in an earlier identity gate.

1. Identity sheet
   - Compare v06 action 8, current W1/W2, W4 candidate walk 16, W3A/W3A-r2 rejected references.
   - Gate: W4 must read as the same default Yunseo before walk-feel scoring.

2. Action/walk family sheet
   - Layout action 8 plus walk 16 together.
   - Check action-to-walk and walk-to-action continuity.
   - Gate: no outfit swap, prop swap, face/body drift, or style-family jump.

3. 96/64/48 scale sheet
   - Verify default identity and walk rhythm at all three sizes.
   - Gate: 48px must preserve Yunseo read and avoid gun/document/cable-weapon misread.

4. R01 480x270 full-map sheet
   - Place all directions in representative R01 contexts.
   - Gate: readable on actual background without becoming a variant or old survivor fallback.

5. S0 bob/timing ON/OFF sheet
   - Compare no-bob and S0 bob/shadow/timing candidates.
   - Gate: bob helps grounding without float, jitter, or puppet motion.

6. Interaction/action priority sheet
   - Capture walk -> prompt scan, walk -> cable hook, walk -> stamp ready, walk -> pull/reject, walk -> hurt, walk -> escape.
   - Gate: action priority remains intact and walk returns cleanly.

## PASS / HOLD / REJECT Criteria

PASS:

- W4 walk 16 reads as the same Yunseo as the approved v06 action 8.
- No frame reads as a variant, skin, or different illustration family.
- 4 directions x 4 frames preserve canvas `796x658`, origin `(320,560)`, scale `0.11`.
- Down/up walk-feel improves without adding long coat/trench/new outfit mass.
- Left/right remain family-consistent with down/up and action poses.
- Scanner, stamp case, reel, cable, harness, sleeve, trousers, and boots retain default identity.
- At 96/64/48 and R01 480x270, walking reads as grounded enough.
- Action/hurt/escape/transient poses still beat walk.

HOLD:

- Walk-feel improves but identity is not fully locked.
- One direction reads better but breaks family continuity.
- Down/up pass but left/right or action transitions look like an outfit swap.
- Bob/timing is needed but introduces jitter or float.
- Import/code scope is unclear.
- QA cannot prove 480x270 readability.

REJECT:

- Candidate resembles W3A/W3A-r2 failure modes.
- Face/body/style no longer read as approved v06 Yunseo.
- Long coat/trench/new outerwear appears in default.
- Scanner reads as firearm, cable reads as weapon, stamp case reads as tablet/map/document.
- Frame origin/scale drift causes foot sliding or anchor pop.
- Any active integration happens before family QA approval.

## Rollback Criteria

Future integration must rollback or remain HOLD if any of the following occur:

- default runtime shows a variant-like Yunseo
- action-to-walk transition shows outfit/face/body/style swap
- old 48x48 survivor becomes default again
- texture load error or Godot fatal/error appears
- `.godot`, generated cache, external QA output, rejected/raw assets, or unrelated docs enter staged scope
- action priority regresses
- prompt/toast/fixture occludes Yunseo in required 480x270 sheets
- S0 bob/timing masks rather than solves walk weakness
- W3A/W3A-r2 frames enter active default aliases

Rollback target:

- PR #8 + PR #9 merged baseline.
- Current v06 action 8 remain canonical.
- Current W1/W2 active walk remains fallback until W4 passes.

## Next Approval Text

Use this exact next approval only when ready to start the next asset-only relock step:

```text
Yunseo runtime character asset family relock W4 reference/edit walk pass를 실행해라.

목표:
기존 승인 Yunseo v06 action pose 8개를 canonical master로 유지하고, default walk 16frames만 같은 에셋 패밀리로 reference/edit 재제작한다.

허용:
- 기존 승인 v06 action pose 8개와 현재 W1/W2 walk frames를 reference/edit target으로 사용
- active root 밖에서만 W4 후보 PNG와 QA sheet 생성
- identity sheet
- action/walk family sheet
- 96/64/48 scale sheet
- R01 480x270 full-map sheet
- S0 bob/timing ON/OFF sheet
- interaction/action priority sheet

금지:
- 텍스트 프롬프트만으로 새 윤서 생성
- active asset 폴더에 PNG 복사/덮어쓰기
- .png.import 생성 또는 수정
- scripts/main.gd 수정
- scripts/sprite_assets.gd 수정
- Godot active-root import
- git add/commit/push/PR
- W3A/W3A-r2 default integration

판정:
default runtime 에셋이 variant처럼 보이면 실패.
일관성 없는 partial replacement는 HOLD.
PASS 시에만 별도 active integration plan으로 넘어간다.
```

## Final Decision

Current plan status: `PASS / READY FOR NEXT APPROVAL`

Default relock direction:

`A + D: v06 action 8 canonical 유지, walk 16 전체 reference/edit 재제작, W3A/W3A-r2 default 제외.`
