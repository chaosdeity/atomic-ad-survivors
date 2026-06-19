# Yunseo Walk Emergency Stabilization Final Diff Audit

Date: 2026-06-19
Branch: `codex/yunseo-walk-emergency-stabilization`
Worktree: `C:\workspace\스팀펑크`

## Final Verdict

PASS / commit-ready audit.

Progress:
- Emergency stabilization: 85% -> 95% commit-ready audit
- Yunseo walk-feel polish: 60% HOLD 유지

## Recommended Include Scope

Stage only the emergency stabilization scope below. Do not use `git add .`.

Exact recommended include count: 6 files.

1. `scripts/main.gd`
2. `YUNSEO_WALK_EMERGENCY_STABILIZATION_PLAN.md`
3. `YUNSEO_WALK_EMERGENCY_STABILIZATION_IMPLEMENTATION_REPORT.md`
4. `YUNSEO_WALK_EMERGENCY_STABILIZATION_RUNTIME_QA_REPORT.md`
5. `YUNSEO_WALK_EMERGENCY_STABILIZATION_RUNTIME_QA_UNBLOCK_REPORT.md`
6. `YUNSEO_WALK_EMERGENCY_STABILIZATION_FINAL_DIFF_AUDIT.md`

Effective tracked code diff:
- `scripts/main.gd`
- `26` changed lines: `17` insertions, `9` deletions

Code change summary:
- adds `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
- gates walk-frame animation and settle logic behind that flag
- moving default now draws canonical Yunseo `idle`
- action/transient pose priority remains before moving branch
- 48x48 atlas remains only as fallback after Yunseo pose draw failure

## Exclude Scope

Do not stage or commit:

- temp/copy QA output:
  - `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_20260619\`
  - `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\`
- walk asset source/output folders outside the repo
- `.godot`
- `generated_assets`
- `exports`
- unrelated R01/background/fixture assets
- unrelated story/world docs
- S2-r2 PNG/import folders
- refedit/legacy walk folders
- broad untracked art inbox recovery/manifests/docs
- unrelated root docs/reports

## Diff Classification

PASS.

Tracked diff:
- `scripts/main.gd` only

Untracked include candidates:
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_PLAN.md`
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_IMPLEMENTATION_REPORT.md`
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_RUNTIME_QA_REPORT.md`
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_RUNTIME_QA_UNBLOCK_REPORT.md`
- `YUNSEO_WALK_EMERGENCY_STABILIZATION_FINAL_DIFF_AUDIT.md`

Out-of-scope asset/import delta:
- asset PNG delta: 0
- `.png.import` delta: 0
- `.godot` staged/tracked delta: 0
- `generated_assets` delta: 0
- `exports` delta: 0
- S2-r2/refedit/legacy walk folder delta: 0
- `scripts/sprite_assets.gd` delta: 0

Staged diff:
- 0

`git diff --check`:
- PASS
- Git reports an LF -> CRLF warning for `scripts/main.gd`; no whitespace error was reported.

## QA Evidence Summary

Initial runtime QA:
- HOLD
- cause separated as temp/copy import-cache mismatch
- Godot ERROR count: 112
- texture/import load error count: 111
- not a draw-chain logic failure

Unblock runtime QA:
- PASS
- new temp/copy project created
- committed `.png.import` files excluded from temp copy
- temp-only `.png.import` and `.godot/imported` regenerated
- import ERROR: 0
- import FATAL: 0
- import texture load error: 0
- runtime exit code: 0
- runtime ERROR: 0
- runtime FATAL: 0
- runtime texture load error: 0

Runtime behavior:
- `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
- moving down/up/left/right all render canonical Yunseo idle glide
- moving direction sheets matched idle reference with 0 changed pixels
- broken S2-r2/refedit/legacy walk frames are not exposed by default
- `stamp_ready` action priority remains active
- `cable_hook` action priority remains active
- 48x48 atlas does not become the default player
- contact shadow remains default OFF
- active root delta remained 0 for assets/import/cache

QA outputs:
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\results.json`
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\godot_import.log`
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\godot_probe.log`
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\emergency_idle_glide_movement_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\emergency_action_priority_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\emergency_r01_full_map_sheet.png`
- `C:\workspace\_codex_yunseo_runtime_qa\emergency_stabilization_unblock_20260619\project_copy\qa_outputs\emergency_vs_walk_failure_comparison_sheet.png`

## Watch / Blocker

No blocker for emergency stabilization commit readiness.

Watch:
- Yunseo walk-feel polish remains 60% HOLD
- emergency stabilization is a safety fallback, not the final walk solution
- idle glide may still feel temporary in full manual play
- proper walk animator/rig pipeline remains a separate track

## Rollback Criteria

Rollback or disable this change if any of the following appear after integration:

- moving state still exposes S2-r2/refedit/legacy walk frames by default
- canonical idle pose fails to load and 48x48 atlas becomes the visible default
- action/transient pose priority regresses
- prompt/toast/floater/status ring behavior regresses
- movement speed, collision, navigation, reward, cooldown, or processing changes appear in diff
- runtime texture/import errors appear in a clean temp/copy QA run

Rollback action:
- restore the previous `_draw_player()` moving branch or set a follow-up patch that redefines the default draw chain
- do not delete preserved walk asset folders as part of rollback

## Stage Approval

Approval phrase for the next step:

`Yunseo walk emergency stabilization stage-only를 실행해라. final diff audit 기준 recommended include scope 6개만 exact stage한다. git add . 금지. commit/push/PR/Godot/import/code 추가 수정 금지.`

## Next Step

Stage-only.
