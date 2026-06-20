# Core Loop S1 Pressure/Reward Tuning QA Report

## Final Verdict

PASS.

The S1 pressure/reward tuning batch passed temp/copy Godot QA while preserving the S0 locked onboarding/HUD structure.

## QA Environment

Source worktree:
- `C:\workspace\_codex_core_loop_s1_pressure_reward_preflight_20260620`

Branch:
- `codex/core-loop-s1-pressure-reward-preflight`

Temp/copy QA project:
- `C:\workspace\_codex_core_loop_s1_pressure_reward_qa_20260620`

QA output path:
- `C:\workspace\_codex_core_loop_s1_pressure_reward_qa_20260620\qa_outputs\core_loop_s1_pressure_reward_tuning`

Godot:
- `Godot_v4.6.2-stable_win64_console.exe`

Viewport:
- `480x270`

## QA Artifacts

Generated:
- `results.json`
- `godot_import.log`
- `godot_probe.log`
- `first_30s_hud.png`
- `procedure_completion.png`
- `pressure_ramp.png`
- `result_reward_lines.png`
- `supply_redeploy_hint.png`
- `final_redeploy_state.png`

## Gate Results

Import:
- exit code: 0
- ERROR: 0
- FATAL: 0
- texture load error: 0
- WARNING: 0

Probe:
- exit code: 0
- ERROR: 0
- FATAL: 0
- texture load error: 0
- WARNING: 2

Probe warning note:
- The warnings are ObjectDB exit cleanup warnings after successful probe completion.
- They are not texture, import, runtime fatal, or gameplay assertion failures.

## Functional Results

PASS:
- game boot
- first 30s HUD preserved
- initial text short enough for 480x270
- procedure targets 4 found
- interaction 4 progress
- repeat 55% feedback preserved
- 4/4 completion acknowledgment preserved
- 4/4 completion reward candidate line present
- repeat decision line present
- first pressure ramp beat
- second pressure ramp beat
- result transition
- result completion candidate
- result pressure record
- result repeat decision feedback
- supply transition
- supply empty/next-run hint preserved
- redeploy transition
- Yunseo idle glide state preserved
- broken walk frame default exposure remains absent by flag check

## Key Evidence

First 30s HUD:
- `E: 접수 장치 확인   입주 절차 0/4`

Repeat feedback:
- `접수 완료 1/4 반복 55%  입주 절차 1/4`

Completion acknowledgment:
- `절차 완료 - 압력 상승  입주 절차 4/4`

Pressure ramp:
- `등록 압력 재상승  회수선 유지`
- `회수 임계 접근  보급소 신호 대기`

Result/reward lines:
- `절차 완료 기록: 4/4`
- `절차 보상 후보: 보급소 정산 우선`
- `압력 대응 기록: 회수선 유지 2단계`
- `반복 감산: 1회 - 다음 장치 우선`

Supply/redeploy:
- `다음 목표: 오픈하우스 체류로 수신태그 확보`
- redeploy returned to `playing`, sortie `2`

## PASS/HOLD Decision

PASS because:
- first 30s HUD stayed readable and unchanged in structure
- interaction 4종 progress passed
- 4/4 completion now has clearer pressure/reward beat
- repeat 55% reduction now reads as a decision cue
- result/supply/redeploy next-run motivation passed
- no runtime/texture blocker
- S0 LOCK behavior did not regress

No HOLD blockers remain in this batch.

## Files Actually Read

- `CORE_LOOP_S1_PRESSURE_REWARD_TUNING_PREFLIGHT.md`
- `scripts/main.gd`
- `scripts/run_result_evaluator.gd`
- `scripts/hud_controller.gd`
- `scripts/meta_progression.gd`

## Evidence Used

- temp/copy Godot import log
- temp/copy Godot probe log
- `results.json`
- generated 480x270 diagnostic captures
- targeted static scan
