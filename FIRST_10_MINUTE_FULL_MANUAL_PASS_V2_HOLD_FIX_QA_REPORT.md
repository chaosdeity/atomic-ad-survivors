# First 10-Minute Full Manual Pass V2 HOLD Fix QA Report

Date: 2026-06-21 KST
Branch: `codex/first-10-minute-v2-hold-fix`

## Verdict

PASS. HOLD fix is 75% implementation + QA ready.

## Checks

| Check | Result | Evidence |
| --- | --- | --- |
| route nudge | PASS | Visible screenshot shows `다음: 접수 장치`; code maps each remaining procedure target to a short label |
| text fatigue reduced | PASS | RunResult now emits compact lines: `정산`, `목표`, `보상 잠김`; result panel caps progress lines to 4 |
| reward choice / recommended upgrade / redeploy next-run motivation | PASS | Supply session data includes `next_run_hint`; supply panel and feedback show `다음 런` or `선택 1개 -> 다음 런 변화` |
| S0/S1/S2/S3 LOCK regression | PASS | `logic_invariant_check.py`: 65 PASS, 0 WARN, 0 FAIL; `RUN_FLOW_PROBE PASS` |
| Yunseo idle glide | PASS | Visible runtime remained on idle/glide state; no code touched animation |
| broken walk frame default exposure | PASS | No broken default walk exposure observed; no animation code/assets touched |
| Godot ERROR/FATAL 0 | PASS | Final boot after import prewarm: strict gate 0; run flow probe strict gate 0 |
| texture load error 0 | PASS | Final boot after import prewarm: strict gate 0 |
| git diff --check | PASS | exit 0 |
| staged diff 0 | PASS | `git diff --cached --stat` produced no staged changes |

## Commands

- `git diff --check`
- `python tools\logic_invariant_check.py`
- Godot `--headless --path . --import`
- Godot `--headless --path . scenes/main.tscn --quit-after 35`
- Godot `--headless --path . --script tools/run_flow_probe.gd`
- visible temp-worktree recheck with screenshots

## QA Output

- `qa/hold_fix_manual_recheck/contact_sheet.png`
- `qa/hold_fix_manual_recheck/*.png`
- `godot_import.log`
- `godot_boot_35s_after_import.log`
- `run_flow_probe.log`
- `logic_invariant_check.log`

Note: desktop screenshots include surrounding user desktop/browser context because OpenGL window-only capture returned black frames. The Godot window content remains visible enough to verify route nudge and compressed result text.

## Files Actually Read

- `C:\workspace\스팀펑크\FIRST_10_MINUTE_FULL_MANUAL_PASS_V2_REPORT.md`
- `scripts/main.gd`
- `scripts/hud_controller.gd`
- `scripts/run_result_evaluator.gd`
- `tools/logic_invariant_check.py`
- `tools/run_flow_probe.gd`
