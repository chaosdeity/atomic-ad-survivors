# Outpost Blockout Screen QA Report

Target commit: `1988026 Add outpost world-space blockout`

## 1. Readability

Result: **Fail / needs revision before commit approval.**

The supply depot text is technically visible, but the new world-space blockout is too present behind the upgrade UI. At 480x270, the Korean text in the header, scroll hint, upgrade buttons, and feedback line competes with facility boxes, corridor lines, and facility labels. After buying an upgrade, disabled/applied upgrade rows become especially low contrast.

The redeploy button remains readable.

## 2. Place Feel

Result: **Partial pass.**

The depot now reads more like a place than a plain menu. The recovery platform, counter, archive, sortie board, tuning area, and gate imply a hub layout. The blockout is a good direction for "returning place" identity.

However, because the whole outpost is shown underneath the menu at once, it reads more like a transparent design map than an in-world room. It needs stronger separation from the functional upgrade UI.

## 3. UI Overlap

Result: **Fail.**

The blockout overlaps the supply label, scroll hint, upgrade list, feedback label, and redeploy area. The largest issue is not direct layout collision, but visual competition: the background lines and labels sit under text-heavy UI. This makes the upgrade list harder to scan than before the blockout.

Recommended fix scope: keep the blockout, but lower opacity further or mask/dim it behind the upgrade list and header text. Avoid changing upgrade values or the flow.

## 4. Internal ID Exposure

Result: **Pass in normal mode.**

Normal supply view did not expose internal facility ids, collision classes, or anchor coordinates. Natural labels such as facility names and summary text are user-facing enough.

## 5. F12 Debug Overlay

Result: **Partial pass.**

F12 correctly exposes outpost variant, world bounds, collision counts, facility ids, collision classes, anchors, and bounds. This satisfies debug-only visibility.

Issue: the debug panel is too large and too opaque for screenshot QA. It covers most of the supply panel and makes visual inspection difficult. It is useful for data confirmation, but not comfortable for screen QA.

## 6. Purchase / Redeploy Flow

Result: **Pass with readability caveat.**

Confirmed:

- `1` key purchase works.
- Click purchase path remains callable.
- Supply screen refreshes after purchase.
- Redeploy button remains visible and functional.
- First recall/result -> supply -> redeploy flow remains intact in debug-driven test.

Caveat: after a purchase, applied/disabled row text becomes very low contrast over the blockout.

## 7. State Variation

Result: **Partial pass by code/debug inspection.**

The state model distinguishes:

- dormant
- first_recall
- broadcast_record_1/2/3
- boss_analysis_1/2/3
- boss_cleared
- destroy_node
- extract_memory

The variant mapping changes facility details such as record cards, core tray, analysis slots, route notes, and outcome-specific archive/board states. This is structurally good.

Risk: at 480x270, the visual differences are subtle behind the supply UI. They may not be legible to a player unless the outpost view gets a cleaner presentation layer or a separate inspection moment.

## 8. Required Fixes

1. Reduce blockout opacity or add a stronger opaque backing behind the supply text and upgrade list.
2. Remove or hide nonessential facility labels from the normal supply view, or keep them much fainter.
3. Improve contrast for applied/disabled upgrade rows after purchase.
4. Shrink or scroll the F12 debug panel so it does not cover the whole depot during screenshot QA.
5. Re-check `destroy_node` and `extract_memory` visually after the readability fix, because current state differences are too subtle under the UI.

## 9. Commit Readiness

Result: **Not ready for approval as-is.**

The outpost blockout direction is correct and the functional flow appears intact, but the core QA question fails: the depot starts to feel like a place, yet it currently makes the upgrade UI harder to read at 480x270.

Recommended next task: a small visual separation pass only. Do not change upgrade numbers, rewards, combat, cards, or progression.

## Test Results

- `Godot_v4.6.2-stable_win64_console.exe --headless --path . scenes/main.tscn --quit-after 2`: pass.
- `python tools\balance_sim.py`: pass.
- `git diff --check`: pass with existing LF/CRLF warnings for `README_GAME.md` and `RPG_ARCHITECTURE_PLAN.md`.
- `git status --short`: dirty before QA; many pre-existing modified/untracked files were present. This QA added only this report file.
