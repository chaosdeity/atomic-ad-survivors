# Core Loop Onboarding/HUD Compression Implementation Report

Date: 2026-06-20

## Final Verdict

PASS - implementation completed in focused scope.

Progress:
- Onboarding/HUD fix: 20% -> 75% implementation + QA
- Core loop usability: 75% HOLD -> 90% usability QA

## Goal

Fix the player-facing issue found after PR #13:
- Starting objective was not immediately actionable.
- HUD/feedback text was too dense at 480x270.
- Progress and action guidance were split across longer status phrases.

## Changed Files

- `scripts/main.gd`
- `scripts/hud_controller.gd`

No change:
- `scripts/route_phrase_resolver.gd`

## Implementation Summary

### Short first directive

The first sortie objective now resolves to compact action text:

- `E: 접수 장치 확인   입주 절차 0/4`
- `E: 상담 패널 확인   입주 절차 1/4`
- `E: 방/밥 슬롯 확인   입주 절차 2/4`
- `E: 갱신 게이트 확인   입주 절차 3/4`
- `회수선 유지   입주 절차 4/4`

### Progress chip

Core first-loop progress is now represented as:

- `입주 절차 n/4`

This replaces dense first-run HUD strings that mixed stage, audit percent, and pressure in a single objective line.

### First 30-second guide

The active notice now returns a short onboarding hint during the first 30 seconds:

- `표식 장치로 이동`
- After the first interaction, the system falls back to next target guidance.

### Current-target marker

During the first 30 seconds, the next incomplete procedure station receives a small recurring status ring.

This is intentionally lightweight:
- no new assets
- no fixture/background changes
- no navigation or collision changes

### Interaction feedback

Procedure completion feedback is shortened:

- `접수 완료 1/4`
- `상담 완료 2/4`
- `방/밥 확인 3/4`
- `갱신 완료 4/4`

The safe toast keeps the same compact progress chip.

### HUD compression

The route goal label no longer wraps in the compact HUD lane.

The audit panel is now conditional:
- hidden unless processing, pressure, or high progress is active
- displays compact status only
- removes threshold/time-heavy text from the default read

## Scope Confirmation

Performed:
- objective/status wording compression
- first 30-second directive improvement
- current target/action prompt display
- progress chip display
- short interaction completion feedback
- conditional audit panel display

Not performed:
- movement speed changes
- collision/navigation changes
- R01 art/background/fixture changes
- asset generation
- PNG / `.png.import` changes
- walk animator/rig work
- broad cleanup
- active root Godot execution
- git add/commit/push/PR

## Files Actually Read

- `CORE_LOOP_ONBOARDING_HUD_COMPRESSION_FIX_PLAN.md`
- `CORE_10_MINUTE_LOOP_S0_S1_SHIP_REPORT.md`
- `CORE_10_MINUTE_LOOP_S0_S1_QA_REPORT.md`
- `CORE_10_MINUTE_LOOP_S0_S1_FINAL_DIFF_AUDIT.md`
- targeted sections of `scripts/main.gd`
- targeted sections of `scripts/hud_controller.gd`

## Evidence Used

- `git diff --check -- scripts/main.gd scripts/hud_controller.gd`
- scoped diff file list
- temp/copy Godot import/probe logs
- temp/copy `results.json`
- generated 480x270 QA sheets
