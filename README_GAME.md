# Atomic Ad Survivors

Godot 4 prototype for the B tone: bright dystopian atomic suburb.

## Run

Open this folder in Godot 4.x and run `res://scenes/main.tscn`.

## Controls

- Move: WASD or arrow keys
- Charge: Space or left click
- Aim M5 charge: point the mouse/touch direction during the 1 second charge window

## Prototype Scope

- 2D top-down survival arena
- Auto-fire baseline weapon
- Chasing ad-mascot enemies and elites
- M5 window aiming:
  - Every 5 seconds, a 1 second charge window opens
  - Tap/click/space during the window to fire a charge burst
  - Aim during the window for a stronger directional focus burst
- HUD: HP, charge meter, time, level, kills, enemy count
- Minimal level-up card pause

## Art Direction Lock

Chosen tone: `B - bright dystopian atomic`.

Reference art is copied into `res://assets/reference_bright_dystopian/`. The current prototype uses code-drawn shapes in the B palette so mechanics can be tested before sprite slicing/import cleanup.
