# Core Loop S1 Pressure/Reward Tuning Implementation Report

## Final Verdict

PASS.

Core loop S1 pressure/reward tuning was implemented as a focused code-only batch on branch `codex/core-loop-s1-pressure-reward-preflight`.

Progress:
- Core loop S1 pressure/reward tuning: 20% -> 75% implementation + QA
- Stage/commit/push/PR: not performed

## Scope

Goal:
- Keep the S0 locked HUD/onboarding structure intact.
- Improve first 10-minute loop pressure, reward expectation, repeat-decision readability, and next-run motivation with small numeric/text/timing changes.

Implemented files:
- `scripts/main.gd`
- `scripts/run_result_evaluator.gd`
- `scripts/hud_controller.gd`

Not changed:
- `scripts/meta_progression.gd`
- movement speed
- collision/navigation
- R01 art/background/fixture files
- Yunseo walk/animation files
- PNG / `.png.import`
- economy/meta system structure
- new resources

## Implementation Summary

### Pressure ramp after 4/4 procedure completion

`scripts/main.gd`
- Added procedure-completion pressure ramp state:
  - `procedure_completion_pressure_stage`
  - `procedure_completion_pressure_timer`
  - `procedure_repeat_penalty_count`
- After 4/4 completion acknowledgment, the run now schedules two short pressure beats:
  - `등록 압력 재상승  회수선 유지`
  - `회수 임계 접근  보급소 신호 대기`
- The first beat nudges `audit_pressure_level` to at least 1 and adds a small processing bump.
- The second beat adds a smaller follow-up processing bump.

### Early audit/reward threshold tuning

`scripts/main.gd`
- Early audit thresholds were slightly lowered:
  - 30s: `120.0 -> 110.0`
  - 60s: `260.0 -> 230.0`
  - 90s: `520.0 -> 480.0`

This keeps the existing audit structure, but makes early pressure/reward feedback arrive a little sooner.

### Completion reward candidate and settlement reason

`scripts/main.gd`
- Objective/result summary now includes:
  - `절차 보상 후보: 보급소 정산 우선`

`scripts/run_result_evaluator.gd`
- Result reward lines now surface:
  - `절차 완료 기록: 4/4`
  - `절차 보상 후보: 보급소 정산 우선`
  - `압력 대응 기록: 회수선 유지 N단계` when the pressure ramp fired

### Repeat 55% decision feedback

`scripts/main.gd`
- Repeat interactions increment `procedure_repeat_penalty_count`.
- Objective/result summary now includes:
  - `반복 감산: N회 / 다음 장치 우선`

`scripts/run_result_evaluator.gd`
- Result reward lines include:
  - `반복 감산: N회 - 다음 장치 우선`

This keeps the S0 repeat feedback but makes the decision implication explicit: move to another device.

### HUD result compaction support

`scripts/hud_controller.gd`
- Result priority prefixes now keep the new S1 lines visible:
  - `절차 보상 후보:`
  - `압력 대응 기록:`
  - `반복 감산:`

No S0 HUD/onboarding layout structure was reworked.

## Forbidden Scope Confirmation

Not performed:
- S0 HUD/onboarding structure rewrite
- movement speed change
- collision/navigation change
- R01 art/background/fixture change
- Yunseo walk/animation change
- PNG / `.png.import` change
- new economy/meta system
- new resource addition
- broad cleanup
- local main reset/rebase
- stage/commit/push/PR

## Files Actually Read

- `CORE_LOOP_S1_PRESSURE_REWARD_TUNING_PREFLIGHT.md`
- `scripts/main.gd`
- `scripts/run_result_evaluator.gd`
- `scripts/hud_controller.gd`
- `scripts/meta_progression.gd`

## Evidence Used

- Targeted static scan of candidate files
- `git diff --stat`
- out-of-scope path scan
- temp/copy Godot import and probe logs
- temp/copy `results.json`
- generated 480x270 diagnostic screenshots
