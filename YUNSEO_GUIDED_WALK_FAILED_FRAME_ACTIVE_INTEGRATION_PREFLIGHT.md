# Yunseo Guided Walk Failed-Frame Active Integration Preflight

Date: 2026-06-27

Verdict: PASS

Progress: Yunseo default walk replacement candidate `0% -> 20% integration preflight`.

This is a preflight only. No active project PNG, `.png.import`, runtime code, Godot run, staging, commit, push, or PR action was performed.

## Source Evidence

Failed-frame edit output root:

`C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01`

Required source artifacts:

- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01\results.json`
- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01\guided_walk_failed_frame_contact_sheet.png`
- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01\failed_frame_48px_zoom_sheet.png`
- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01\failed_frame_R01_480x270_sheet.png`
- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01\default_walk_replacement_recheck_sheet.png`

Source frame check:

| Gate | Result |
| --- | --- |
| 16 source frames exist | PASS |
| Source PNG magic | PASS |
| Source size `796x658` | PASS |
| Target 5 changed | PASS |
| Non-target 11 unchanged | PASS |
| Identity/costume drift | PASS, no drift reported; edits are lower-body/contact-only |
| Equipment drift | PASS, equipment/upper body untouched |
| 48px readability sheet exists | PASS |
| R01 480x270 sheet exists | PASS |

Changed target frames:

- `s2_r2_down_01`
- `s2_r2_down_02`
- `s2_r2_down_03`
- `s2_r2_down_04`
- `s2_r2_up_03`

Byte-identical non-target frames:

- `s2_r2_left_01`
- `s2_r2_left_02`
- `s2_r2_left_03`
- `s2_r2_left_04`
- `s2_r2_right_01`
- `s2_r2_right_02`
- `s2_r2_right_03`
- `s2_r2_right_04`
- `s2_r2_up_01`
- `s2_r2_up_02`
- `s2_r2_up_04`

## Recommended Active Target

Recommended new active asset folder:

`assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/`

Rationale:

- Keeps the candidate isolated from existing active walk folders.
- Avoids overwriting S2-r2, refedit, or legacy walk folders.
- Makes import/review delta easy to audit.
- Allows controlled QA/debug runtime selection before default activation.

Existing walk folders must not be overwritten.

## Expected Delta For Future Integration

Expected include if integration is approved later:

- PNG: `+16`
- `.png.import`: `+16`
- `.godot/imported` committed delta: `0`

Expected code candidates:

- `scripts/sprite_assets.gd`
  - Add a new `YUNSEO_FAILED_FRAME_EDIT_WALK_PATHS` dictionary or equivalent constant.
  - Load it only through a controlled selection path.
  - Preserve existing fallback sets.
- `scripts/main.gd`
  - Add a QA/debug or controlled flag for the failed-frame-edit candidate.
  - Keep default walk activation OFF.
  - Preserve S0 idle glide fallback.

No movement, collision, navigation, action priority, or default runtime behavior should change in the integration step.

## Default Activation Policy

Do not enable default walk immediately.

Recommended policy:

1. Import the candidate into a new isolated art-inbox folder.
2. Add a QA/debug or controlled runtime flag, default `false`.
3. Confirm default OFF keeps S0 idle glide unchanged.
4. Confirm controlled ON renders the failed-frame-edit walk candidate.
5. Only after controlled QA PASS should a separate default replacement decision be made.

Current default safety state remains S0 idle glide.

## Fallback Chain

Recommended future fallback chain:

1. Failed-frame-edit walk candidate
2. S2-r2 walk
3. Refedit walk
4. Legacy walk
5. Idle glide

The failed-frame-edit candidate should be first only when the controlled/QA flag is enabled. With the flag disabled, existing behavior should remain unchanged.

## QA Plan For Integration Step

Use a temp/copy Godot QA worktree only.

Required checks:

- Default OFF: S0 idle glide PASS.
- Default OFF: broken walk exposure 0.
- Controlled/debug ON: failed-frame-edit walk path loads PASS.
- Controlled/debug ON: down/up/left/right walk preview PASS.
- 48px readability PASS.
- R01 480x270 readability PASS.
- Action priority remains higher than walk preview.
- Godot ERROR/FATAL 0.
- Texture load error 0.
- `.godot/imported` generated cache not included in commit.
- PNG/import delta exactly matches approved asset folder.

## HOLD Conditions

Runtime integration must stay blocked if any of these occur:

- Candidate frames do not import cleanly.
- Any active walk folder overwrite is required.
- Default walk must be enabled to verify the candidate.
- Identity/costume/equipment drift appears in runtime scale.
- 48px or R01 480x270 readability regresses.
- Action priority is affected.
- Broken walk frame appears in default mode.
- Godot ERROR/FATAL or texture load error appears.

## Actions Not Executed

- No active project PNG copied.
- No `.png.import` generated.
- No code modified.
- No Godot execution.
- No git add/commit/push/PR.
- No existing active walk folder overwrite.
- No default walk activation.

## Files Actually Read

- `C:\workspace\스팀펑크\YUNSEO_GUIDED_WALK_FAILED_FRAME_EDIT_REPORT.md`
  - Evidence: prior PASS verdict, edited frame scope, drift/readability conclusions, restrictions.
- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01\results.json`
  - Evidence: exact changed/unchanged frame lists and validation summary.
- `C:\workspace\_codex_yunseo_guided_walk_failed_frame_edit_v01`
  - Evidence: 16 source frame files and required QA sheet outputs.
- `C:\workspace\스팀펑크\scripts\sprite_assets.gd`
  - Evidence: current Yunseo walk path dictionaries and fallback loading order found by targeted search.
- `C:\workspace\스팀펑크\scripts\main.gd`
  - Evidence: current walk/debug flags and draw path found by targeted search.

## Evidence Used

- External output frame scan:
  - `frame_count = 16`
  - `all_png_magic = true`
  - `all_796x658 = true`
  - `target_changed_pass = true`
  - `non_target_unchanged_pass = true`
- Existing runtime search evidence:
  - `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
  - `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false`
  - Current `sprite_assets.gd` fallback order loads S2-r2, then refedit, then legacy.

## Next Approval Prompt

Approve the next step with:

`Yunseo failed-frame edit QA/debug asset integration batch를 실행해라. 새 폴더 assets/art_inbox/yunseo_runtime_v06_walk_failed_frame_edit_v01/에 16 PNG를 복사하고, default OFF/controlled ON 경로로만 runtime QA를 진행해라.`
