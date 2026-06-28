# Yunseo Default Walk Disable Hotfix Implementation Report

Date: 2026-06-28
Branch/worktree: `codex/yunseo-default-walk-disable-hotfix` at `fc05d34`

## Goal

Disable rejected Yunseo layered/default walk exposure from the actual default movement runtime while preserving the layered walk assets as reference/fallback candidates.

## Baseline Audit

- `origin/main` includes PR #23 merge commit: `a627f49 Enable Yunseo layered default walk (#23)`.
- `origin/main` current head is `fc05d34 Disable Yunseo layered default walk`.
- Current worktree was created clean from `origin/main`.

## Implementation State

- `scripts/main.gd`
  - `PLAYER_USE_YUNSEO_WALK_FRAMES := false`
  - `PLAYER_USE_YUNSEO_FAILED_FRAME_WALK_DEBUG := false`
  - `PLAYER_USE_YUNSEO_PSEUDO_SOCKET_DEBUG := false`
  - Moving player branch falls back to Yunseo `idle` pose when walk/debug flags are off.
  - Action/transient pose path still resolves before moving fallback.

- `scripts/sprite_assets.gd`
  - Layered walk paths remain declared under `YUNSEO_LAYERED_WALK_PATHS`.
  - Default runtime does not load layered walk textures.
  - `yunseo_walk_textures = {}` during `load_all()`, so ordinary walk frames are not loaded for default runtime.

## Files Changed By This Follow-Up

No gameplay/runtime source files were changed in this follow-up. Only reports and QA evidence were added.

## Verdict

Implementation state: PASS for safety hotfix.
Default walk final quality: HOLD until an approved 96px-first walk sheet exists.