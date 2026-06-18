# Yunseo Walk-Feel S2-r2 Runtime QA Report

## Final Verdict

PASS / runtime QA passed with watch.

S2-r2 walk16 is used as the default runtime walk source in the temp/copy Godot project. It does not reverse to refedit, legacy walk, or the old 48x48 atlas fallback. Runtime-scale walk feel is improved over refedit/S0, with remaining watch on down/up rhythm and 48px live readability.

Progress:
- Yunseo walk-feel polish 97% -> 99% S2-r2 runtime QA
- S2 constrained rig/edit 92% -> 98% runtime QA

## QA Output

Temp/copy QA project:

`C:\workspace\_codex_yunseo_runtime_qa\s2_r2_runtime_qa_20260619\`

QA output path:

`C:\workspace\_codex_yunseo_runtime_qa\s2_r2_runtime_qa_20260619\qa_outputs\`

Generated outputs:
- `results.json`
- `s2_r2_runtime_4_direction_contact_sheet.png`
- `s2_r2_runtime_live_sequence_down_up_sheet.png`
- `s2_r2_runtime_live_sequence_left_right_sheet.png`
- `s2_r2_runtime_start_stop_settle_sheet.png`
- `s2_r2_runtime_r01_full_map_sheet.png`
- `s2_r2_runtime_vs_refedit_comparison_sheet.png`
- `s2_r2_runtime_action_priority_return_sheet.png`

Godot logs:
- `godot_import.log`
- `godot_probe_after_import.log`
- `godot_probe_results.json`

Note: the first temp probe was run before temp `.godot/imported` existed, so Godot reported missing temp ctex files and fell back to direct image load. This was not an active-root error. After temp-only import, the final probe passed with no ERROR/FATAL lines.

## Texture / Load / Fallback

Final temp Godot probe:
- Godot exit code: 0
- Godot ERROR/FATAL count in final probe log: 0
- texture load error count: 0
- S2-r2 default source: PASS
- refedit fallback reversal: 0
- legacy fallback reversal: 0
- 48x48 atlas fallback reversal: 0

Loaded runtime paths point to:

`res://assets/art_inbox/yunseo_runtime_v06_walk_s2_r2_v01/`

## Walk Loop / Frame

PASS:
- down/up/left/right each loaded as 4-frame walk loops
- `% 4` frame loop probe PASS
- walk fps remains `6.0`
- bob remains minimal at `1.0px`
- start/stop settle remains `2.0` frames
- contact shadow pulse default OFF

## Live Rhythm

PASS_WITH_WATCH:
- down/up foot plant reads better than refedit, but still small at runtime scale
- side stride is less exaggerated than refedit and reads as walk in 480x270 sequence
- 48px-equivalent rhythm remains watch, not fully locked
- R01 480x270 sheet shows reduced slide feel compared with refedit/S0

S2-r2 is improved enough for active integration candidate status, but not a “no-watch” art lock.

## Identity / Equipment

PASS:
- canonical Yunseo identity remains intact
- equipment damage not observed
- scanner gun-read not observed
- stamp case document/map/tablet read not observed
- cable weapon-read not observed
- W3A/W3A-r2 variant drift not observed

This matches S2-r2 self QA: locked region delta max `0.0%`.

## Interaction / Priority

PASS:
- action/transient priority probe returned expected poses:
  - `stamp_ready`
  - `cable_hook`
  - `hurt_interrupted`
- action priority return sheet generated
- prompt/toast/floater/status ring code was not modified during this QA
- pose 05 `stamp_ready` remains watch, with no regression detected by probe/sheet

## Active Delta Safety

PASS:
- active root Godot was not run
- active `.godot` does not exist
- active `.png.import` count for S2-r2 target remains 16
- active import delta from this QA: 0
- staged diff: 0
- no code edits in this QA step
- no asset edits in this QA step
- no git add/commit/push/PR

Temp-only Godot import created temp `.godot/imported` files under:

`C:\workspace\_codex_yunseo_runtime_qa\s2_r2_runtime_qa_20260619\.godot\`

This does not affect the active root.

## Remaining Watch

- down/up hem seam at small scale
- 48px live runtime rhythm
- side stride naturalness under long play
- bob/settle interaction during real manual movement
- pose 05 `stamp_ready` return-to-walk timing

## Next Step

Proceed to final diff audit for S2-r2 active integration, with the following QA basis:

- import-only PASS
- code integration PASS
- temp/copy runtime QA PASS_WITH_WATCH
- runtime texture load error 0
- final Godot ERROR/FATAL 0
- fallback reversal 0
- identity/equipment PASS
- walk-feel improved over refedit/S0 with watch retained
