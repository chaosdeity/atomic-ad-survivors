# Core Loop Onboarding/HUD Compression QA Report

Date: 2026-06-20

## Final Verdict

PASS

The onboarding/HUD compression fix passed temp/copy Godot QA.

## QA Output Path

`C:\workspace\_codex_core_loop_onboarding_hud_20260620\qa_outputs\onboarding_hud`

Generated outputs:
- `results.json`
- `onboarding_first_30_seconds_sheet.png`
- `hud_compression_before_after_sheet.png`
- `interaction_progress_feedback_sheet.png`
- `r01_flow_readability_sheet.png`
- `godot_import.log`
- `godot_probe.log`

Note: the PNG outputs are 480x270 temp-probe diagnostic contact sheets. The headless probe uses deterministic nonblank sheets while runtime assertions verify the actual HUD/objective strings and flow state.

## Runtime Gate

- Godot import exit code: 0
- Godot probe exit code: 0
- Import ERROR: 0
- Import FATAL: 0
- Probe ERROR: 0
- Probe FATAL: 0
- Texture load error: 0

Warning-only note:
- Probe log includes `ObjectDB instances leaked at exit`.
- This warning occurred after all checks passed and the process exit code was 0.
- It is not classified as a blocker for this temp-probe QA.

## Probe Results

Initial 30-second onboarding:
- PASS: action prompt is short.
- PASS: initial objective includes `E: 접수 장치 확인`.
- PASS: progress chip reads `입주 절차 0/4`.
- PASS: first notice reads `표식 장치로 이동`.
- PASS: dense separators/status text removed from the first objective line.

Procedure interaction progress:
- PASS: check-in -> `입주 절차 1/4`
- PASS: procedure panel -> `입주 절차 2/4`
- PASS: room/meal access -> `입주 절차 3/4`
- PASS: renewal gate -> `입주 절차 4/4`
- PASS: completion feedback is short for all 4 interactions.
- PASS: cooldown remains active after each interaction.

Result/supply/redeploy:
- PASS: recalled result transition
- PASS: supply transition
- PASS: redeploy transition to playing sortie 2

Readability/flow:
- PASS: objective/progress can be read as one compact line.
- PASS: progress uses staged `n/4` chip.
- PASS: text overload reduced in first-loop objective and feedback.
- PASS: route/result/supply hook retained.

Yunseo state:
- PASS: idle glide state not changed.
- PASS: no walk animator/rig work.
- PASS: no broken walk frame exposure introduced by this change.

## PASS/HOLD Criteria

PASS criteria met:
- Player can identify the next action within the first 30 seconds.
- Text amount is reduced.
- Objective/progress are quickly readable.
- Existing core loop flow does not regress in the probe.
- Runtime/texture blocker is absent.
- Forbidden scope changes are absent.

No HOLD blocker remains from this QA pass.

## Files Actually Read

- `CORE_LOOP_ONBOARDING_HUD_COMPRESSION_FIX_PLAN.md`
- `CORE_10_MINUTE_LOOP_S0_S1_SHIP_REPORT.md`
- targeted sections of `scripts/main.gd`
- targeted sections of `scripts/hud_controller.gd`

## Evidence Used

- `C:\workspace\_codex_core_loop_onboarding_hud_20260620\qa_outputs\onboarding_hud\results.json`
- `C:\workspace\_codex_core_loop_onboarding_hud_20260620\qa_outputs\onboarding_hud\godot_import.log`
- `C:\workspace\_codex_core_loop_onboarding_hud_20260620\qa_outputs\onboarding_hud\godot_probe.log`
- generated 480x270 QA sheets listed above
