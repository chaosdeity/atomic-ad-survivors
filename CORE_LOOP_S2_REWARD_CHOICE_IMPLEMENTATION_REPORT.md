# Core Loop S2 Reward Choice Implementation Report

Date: 2026-06-20
Branch: `codex/core-loop-s2-reward-choice`
Base HEAD: `48114607e7ca76721befea874cd0a791e8eee995`

## Final Verdict

PASS_WITH_NOTES: Core loop S2 reward choice implementation completed and target QA passed. The ship target required one additional minimal dependency, `scripts/run_result_evaluator.gd`, because the target baseline did not yet carry `procedure_completion_bonus` and related procedure result fields into `last_run_result`.

Progress:
- Core loop S2 reward choice: 20% -> 75% implementation + QA

## Implemented Scope

Implemented a small 2-choice reward decision between result and supply/redeploy:

1. `정산 우선`
   - Exposed as the first supply reward choice.
   - Feedback: `정산 우선: 절차 보상 후보 고정`
   - Next result note records the previous selection.

2. `다음 동선 보정`
   - Exposed as the second supply reward choice.
   - Feedback: `다음 동선 보정: 목표 안내 강화`
   - Next result note records the previous selection.

The choice is available only after a completed 4/4 procedure run that produces `procedure_completion_bonus`.

## Changed Files

- `scripts/main.gd`
  - Added compact S2 reward choice state.
  - Prepended two `reward_choice` actions to the supply action list when eligible.
  - Added selection handling through the existing supply action path.
  - Added next-run result note consumption so the choice has visible meaning after redeploy.

- `scripts/hud_controller.gd`
  - Added compact `1회 선택` display for `reward_choice` rows.
  - Preserved existing supply panel structure.

- `scripts/run_result_evaluator.gd`
  - Carries `procedure_completion_bonus`, repeat penalty count, and completion pressure stage into the result payload.
  - Keeps the reward choice eligibility signal available after result -> supply.

No new helper script was added.

## Out Of Scope Avoided

- No movement speed changes.
- No collision/navigation changes.
- No R01 art/background/fixture changes.
- No Yunseo walk/animation changes.
- No PNG or `.png.import` changes.
- No new asset.
- No complex shop UI.
- No permanent economy/meta progression overhaul.
- No broad cleanup.

## Files Actually Read

- `C:\workspace\스팀펑크\CORE_LOOP_S2_REWARD_CHOICE_PREFLIGHT.md`
- `C:\workspace\_codex_first_10_minute_manual_preflight_20260620\FIRST_10_MINUTE_MANUAL_GAMEPLAY_PASS_REPORT.md`
- `C:\workspace\스팀펑크\FIRST_10_MINUTE_MANUAL_GAMEPLAY_PASS_PREFLIGHT.md`
- `C:\workspace\스팀펑크\CORE_LOOP_S1_PRESSURE_REWARD_TUNING_LOCK_HANDOFF.md`
- `C:\workspace\스팀펑크\CORE_LOOP_PRESSURE_REWARD_S0_LOCK_HANDOFF.md`
- `C:\workspace\스팀펑크\CORE_10_MINUTE_LOOP_DIAGRAMS.md`
- `C:\workspace\스팀펑크\VERTICAL_SLICE_0_2_PLAYFLOW_CHECKLIST.md`
- `C:\workspace\스팀펑크\NEXT_0_2_IMPLEMENTATION_BATCH_PLAN.md`
- `C:\workspace\_codex_core_loop_s2_reward_choice_20260620\scripts\main.gd`
- `C:\workspace\_codex_core_loop_s2_reward_choice_20260620\scripts\hud_controller.gd`
- `C:\workspace\_codex_core_loop_s2_reward_choice_20260620\scripts\run_result_evaluator.gd`
- `C:\workspace\_codex_core_loop_s2_reward_choice_20260620\scripts\meta_progression.gd`

## Evidence Used

- Targeted static diff review.
- Temp/copy Godot import and probe QA.
- `results.json` PASS.
- Screenshot captures for both reward choices.
- `git diff --check` PASS.
- Staged diff remained 0.

## Actions Not Executed

- No `git add`.
- No commit.
- No push.
- No PR.
- No root active project Godot run.
- No root unstaged archive/report cleanup.
