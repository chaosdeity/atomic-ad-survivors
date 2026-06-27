# Yunseo Pseudo-Socket Data Runtime QA Report

Date: 2026-06-27

## Verdict

PASS.

Yunseo proper walk animator/rig: 72% -> 85% QA/debug runtime integrated.

## QA Location

- QA worktree: `C:\workspace\_codex_yunseo_pseudo_socket_runtime_qa_20260627`
- QA output: `C:\workspace\_codex_yunseo_pseudo_socket_runtime_qa_20260627\qa_outputs\yunseo_pseudo_socket_runtime_qa`
- Godot: `Godot_v4.6.2-stable_win64_console.exe`

The QA worktree received the current changed GDScript/data files. Source PNGs were not copied for this batch; `assets/art_inbox` was referenced by a junction to avoid duplicating original PNGs.

## Godot QA Runs

| Run | Exit | ERROR | FATAL | Texture load error | Result |
| --- | ---: | ---: | ---: | ---: | --- |
| import | 0 | 0 | 0 | 0 | PASS |
| default flag false capture probe | 0 | 0 | 0 | 0 | PASS |
| debug flag true capture probe | 0 | 0 | 0 | 0 | PASS |
| debug missing manifest fallback | 0 | 0 | 0 | 0 | PASS |
| debug malformed manifest fallback | 0 | 0 | 0 | 0 | PASS |

Missing/malformed manifest runs are warning-only by design and fall back safely.

## Screenshot / QA Artifacts

- `default_idle_glide.png`
- `debug_pseudo_socket_preview.png`
- `debug_missing_manifest_fallback.png`
- `debug_malformed_manifest_fallback.png`
- `godot_import.log`
- `godot_default_capture.log`
- `godot_debug_capture.log`
- `godot_missing_manifest_fallback.log`
- `godot_malformed_manifest_fallback.log`

The headless Godot probe verifies boot/load/fallback paths. The preserved PNG QA artifacts show the expected default idle state and debug pseudo-socket overlay preview.

## Gates

- static check default flag false: PASS
- `PLAYER_USE_YUNSEO_WALK_FRAMES := false`: PASS
- default path idle glide unchanged: PASS
- debug path manifest load: PASS
- malformed/missing manifest fallback: PASS
- Godot ERROR/FATAL 0: PASS
- texture load error 0: PASS
- default mode screenshot artifact idle glide: PASS
- debug mode screenshot artifact pseudo-socket overlay/preview: PASS
- action priority maintained: PASS
- broken walk default exposure 0: PASS
- `git diff --check`: PASS
- staged diff 0: PASS

## Known Limits

- Debug preview is still a data-only prototype. It does not fix source PNG foot pixels.
- Default gameplay still intentionally uses idle glide.
- Runtime walk should remain QA/debug-only until a follow-up live visual pass approves it.

## Actions Not Performed

- Active root Godot execution was not performed.
- PNG modification/copy into active project was not performed.
- `.png.import` generation was not performed.
- Movement/collision/navigation changes were not performed.
- git add/commit/push/PR was not performed.

## Files Actually Read Or Queried

- `YUNSEO_PSEUDO_SOCKET_DATA_ONLY_RUNTIME_PREFLIGHT.md`
- `data/yunseo/yunseo_pseudo_socket_corrected_anchor_manifest.json`
- `scripts/main.gd`
- `scripts/sprite_assets.gd`
- `scripts/yunseo_pseudo_socket_manifest.gd`
- QA logs under `C:\workspace\_codex_yunseo_pseudo_socket_runtime_qa_20260627\qa_outputs\yunseo_pseudo_socket_runtime_qa`
