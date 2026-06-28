# Yunseo Visual State Runtime Candidate Handoff

Date: 2026-06-28
Candidate worktree: `C:\workspace\_codex_yunseo_visual_state_runtime`

## Status

`PlayerVisualState` resolver structure is a PASS candidate, but it must not ship yet.

Reason:

- The structure is good.
- The approved 96px walk sheet does not exist.
- Shipping resolver logic without the approved sheet would ship structure without an acceptable default walk result.

## Candidate Resolver Priority

Target priority:

```text
recalled/hurt/action/charge > walk > idle
```

Observed candidate implementation:

- recalled/terminal states block walk.
- hurt beats walk.
- hard action beats walk.
- charge open/warning beats walk.
- walk only resolves when `player_is_moving`.
- idle resolves when no higher-priority state applies.

## Movement Phase

Candidate intent:

- `movement_phase` advances only while the player is moving.
- `movement_phase` resets when movement stops.
- walk frame index derives from movement phase.

## Optional 96px Sheet Path

```text
res://assets/art_staging/yunseo_walk_96px_first_v01/sprite_sheet_96.png
```

This path is optional and currently absent in the hotfix worktree.

## Ship Gate

Do not ship this resolver runtime until:

- approved 96px sheet exists,
- 96px read PASS,
- 64px read PASS,
- 48px read PASS,
- R01 480x270 gameplay contact sheet PASS,
- Godot integration QA PASS.

## Handoff Verdict

Resolver structure: PASS candidate.
Runtime ship: HOLD.