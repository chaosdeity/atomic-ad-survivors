# Yunseo Walk Emergency Stabilization Plan

## Status Correction

Current verdict:

- PR #10 refedit walk: FAIL for shipping walk-feel
- PR #11 S2-r2 walk: FAIL for shipping walk-feel
- S0 bob/shadow: FAIL
- Yunseo walk-feel polish: 100% LOCK -> 60% HOLD
- Current runtime status: HOLD / NOT SHIPPABLE

Emergency stabilization progress:

- 0% -> 20% plan

## PMO Recommendation

Choose Option D.

Do not use any current Yunseo walk frame set as the default runtime walk. Temporarily lower movement presentation to canonical idle/action-pose based movement, then move true walk production into a separate animator/rig pipeline.

Reasoning:

- PR #10 and PR #11 both preserve some identity but fail as shippable walking motion.
- The broken walk is more damaging than a temporary no-walk state.
- The old 48x48 dummy fallback reads as motion but not as Yunseo, so it should remain only a last-resort technical fallback.
- A revert PR would remove files but increase branch/state complexity without solving the core animation pipeline problem.

## Emergency Choice Review

### A. Disable S2-r2 Walk and Use Canonical Idle/Action Pose During Movement

Recommended as the visible behavior inside Option D.

Pros:
- Immediately removes broken walk exposure.
- Keeps default Yunseo identity canonical.
- Keeps action pose priority intact.
- Low code risk.

Cons:
- No true walk animation during the emergency window.
- Movement reads as glide, so it must be framed as temporary stabilization.

### B. Revert to Existing 48x48 Dummy Fallback

Not recommended.

Pros:
- Motion reads simply.

Cons:
- Not Yunseo.
- Previously rejected as default identity.
- Would regress the campaign character lock.

### C. Revert PR #10 / PR #11

Not recommended for the first emergency step.

Pros:
- Removes the problematic walk assets from main.

Cons:
- Creates more git/state churn.
- Deletes useful evidence and fallback candidates.
- Does not solve the runtime exposure problem better than a feature flag.

### D. Idle Glide + Separate Animator/Rig Pipeline

PMO recommendation.

Pros:
- Stabilizes player-facing runtime quickly.
- Preserves all asset evidence for later review.
- Keeps integration reversible through a small code flag.
- Separates emergency runtime safety from long-term walk craft.

Cons:
- Requires a later dedicated animation pipeline before walk can be called complete.

## Files To Touch In Implementation

Planned implementation files:

- `scripts/sprite_assets.gd`
- `scripts/main.gd`

Optional docs/report files for implementation PR:

- `YUNSEO_WALK_EMERGENCY_STABILIZATION_PLAN.md`
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_IMPLEMENTATION_REPORT.md`
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_RUNTIME_QA_REPORT.md`

Do not touch:

- PNG files
- `.png.import` files
- R01 background/fixture files
- generated/export folders
- story/world docs

## Asset Preservation / Runtime Exposure

Preserve these folders as historical candidates and evidence:

- `assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/`
- `assets/art_inbox/yunseo_runtime_v06_walk_refedit_v01/`
- `assets/art_inbox/yunseo_runtime_v06_walk/`
- `assets/art_inbox/yunseo_runtime_v06/`

Runtime exposure rule:

- Canonical action pose folder remains active.
- Current walk folders remain in repo but are not used as default runtime walk.
- S2-r2/refedit/legacy walk may remain loadable behind a disabled debug/dev flag, but default gameplay must not call them.
- 48x48 atlas remains final emergency technical fallback only if Yunseo idle/action textures fail.

## Feature Flag

Add a small explicit runtime presentation flag.

Recommended flag shape:

- `YUNSEO_MOVEMENT_VISUAL_MODE := "idle_glide"`

Allowed values:

- `"idle_glide"`: default emergency mode. Movement uses canonical idle pose plus stable ground shadow and existing world-position movement.
- `"walk_s2_r2"`: debug-only. Uses S2-r2 walk frames.
- `"walk_refedit"`: debug-only. Uses PR #10 refedit walk frames.
- `"walk_legacy"`: debug-only. Uses legacy walk frames.
- `"atlas"`: final technical fallback, not default.

Default for PR:

- `"idle_glide"`

The flag should be code-local and simple. Do not introduce settings UI or broad config plumbing in the emergency PR.

## Fallback Chain Redefinition

Emergency default chain:

1. Action/transient pose priority if active:
   - hurt, escape, stamp, scan, hook, pull, reject remain unchanged.
2. Moving with no action pose:
   - draw canonical Yunseo idle pose.
3. Idle:
   - draw canonical Yunseo idle pose.
4. If canonical idle pose fails:
   - use existing 48x48 atlas fallback.

Debug-only walk chain when explicitly enabled:

1. S2-r2 walk
2. refedit walk
3. legacy walk
4. 48x48 atlas fallback

Default runtime must not silently fall from idle-glide into S2-r2/refedit/legacy walk. The point of the emergency patch is to stop exposing those walk cycles.

## Runtime Presentation Rule

Default movement visual:

- Use `yunseo_v06_pose_01_idle.png` while moving.
- Preserve origin `(320,560)` and scale `0.11`.
- Keep movement speed, collision, navigation, reward, cooldown, and processing unchanged.
- Keep action/transient pose priority unchanged.
- Keep contact shadow pulse OFF.
- Use only a stable small base shadow if already present.
- Avoid bob/shadow tricks that reintroduce S0 failure.

Optional micro-procedure for later probe only:

- A tiny 1px settle at start/stop may be tested, but the emergency default should prefer visually calm idle glide over fake walk.

## QA Criteria

Run QA in a temp/copy Godot project only.

Required checks:

- Texture/load:
  - canonical idle pose loads
  - action pose 8 loads
  - no texture load errors
  - 48x48 atlas does not appear unless forced by missing Yunseo textures
- Movement:
  - moving state does not draw S2-r2/refedit/legacy walk frames in default mode
  - no `% 4` walk cycling in default mode
  - idle glide is visually stable at 480x270
  - no shadow pulse / foot-eating shadow
- Identity:
  - Yunseo reads as canonical Yunseo during movement
  - no W3A/W3A-r2 variant read
  - no equipment damage or weapon/map/tablet misread
- Interaction:
  - action/transient pose priority still overrides movement presentation
  - interaction after movement returns to idle/movement cleanly
  - prompt/toast/floater/status ring unchanged
  - pose 05 `stamp_ready` watch retained
- Safety:
  - active root `.godot` not created
  - active import delta 0
  - staged diff 0 before stage-only

QA sheets:

- `yunseo_emergency_idle_glide_480x270_sheet.png`
- `yunseo_emergency_direction_change_sheet.png`
- `yunseo_emergency_action_priority_sheet.png`
- `yunseo_emergency_vs_s2_r2_disabled_sheet.png`
- `yunseo_emergency_r01_full_map_sheet.png`

## PASS / HOLD Criteria

PASS:

- Broken walk frames are not visible in default runtime movement.
- Canonical Yunseo identity remains stable while moving.
- Action priority still works.
- No texture/runtime errors.
- No movement/collision/navigation/gameplay behavior changes.
- 480x270 read is calmer and more shippable than broken walk.

HOLD:

- Any S2-r2/refedit/legacy walk frame still appears in default mode.
- Idle glide looks jittery or shadow-pulsed.
- Action priority regresses.
- 48x48 atlas appears as default player.
- Prompt/toast/floater/status ring regresses.

REJECT:

- Code changes affect movement speed/collision/navigation/reward/cooldown/processing.
- PNG/import files are modified.
- Broad cleanup or unrelated R01/background/fixture changes enter scope.

## Rollback Criteria

Rollback or hold the emergency PR if:

- default mode still exposes PR #10 or PR #11 walk frames
- 48x48 atlas becomes default
- action pose priority is broken
- idle/action Yunseo textures fail to load
- active import files are generated
- runtime QA logs Godot ERROR/FATAL
- PR scope exceeds the planned code/docs-only range

Rollback method:

- Revert only the emergency code patch.
- Do not delete walk asset folders.
- Do not revert PR #10/#11 unless separately approved.

## PR Scope

Recommended emergency PR scope:

- `scripts/sprite_assets.gd`
- `scripts/main.gd`
- emergency plan/report docs

Expected scope:

- code 2
- docs 2-3
- PNG delta 0
- `.png.import` delta 0
- `.godot/imported` committed delta 0

Explicitly out of scope:

- new walk images
- PNG edits/deletes
- import generation
- broad art cleanup
- R01/background/fixture changes
- story/world docs
- branch cleanup

## Long-Term Follow-Up

Move true walk production to a dedicated animator/rig pipeline.

Requirements for future walk restart:

- runtime-scale-first motion blocking
- manual animator/rig authored lower body
- locked canonical upper body and equipment
- 96/64/48px movement readability before 796 canvas alignment
- side/down/up foot plant reviewed in actual 480x270 runtime
- no text/reference-only generation as final source

## Next Approval Text

Recommended next approval:

`Yunseo walk emergency stabilization code implementation을 실행해라. YUNSEO_WALK_EMERGENCY_STABILIZATION_PLAN.md 기준으로 default runtime movement를 idle_glide mode로 전환하고, S2-r2/refedit/legacy walk는 default에서 비활성화한다. PNG 수정/삭제, .png.import 생성, Godot active root 실행, git add/commit/push/PR은 하지 않는다.`
