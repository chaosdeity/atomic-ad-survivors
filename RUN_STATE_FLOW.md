# Run State Flow

This file defines the current 0.2 run loop as a state contract. It is not a save/load design and does not add new progression rules.

## Core Rule

After the first forced recall has opened the Silence Outpost, every later run result should pass through the outpost before the next sortie.

Before the first recall, a terminal failure can restart directly because the outpost has not been introduced yet.

## State Diagram

```text
playing
  |
  | first forced recall
  v
recalled
  |
  | confirm result
  v
supply
  |
  | redeploy
  v
playing

playing
  |
  | game_over after first recall
  v
game_over
  |
  | confirm result
  v
supply
  |
  | redeploy
  v
playing

playing
  |
  | 300s normal recovery after first recall
  v
victory
  |
  | confirm result
  v
supply
  |
  | redeploy
  v
playing

playing
  |
  | boss recall / boss clear
  v
recalled or boss_victory
  |
  | confirm result
  v
supply
```

## Terminal Routing

| result state | before first recall | after first recall |
| --- | --- | --- |
| `game_over` | direct restart | result -> supply |
| `victory` | direct restart fallback | result -> supply |
| `recalled` | result -> supply | result -> supply |
| `boss_victory` | result -> supply | result -> supply |

## Supply Contract

The supply state is responsible for:

- showing traces and upgrade options,
- allowing `1/2/3/4` and mouse upgrade purchase,
- showing the redeploy button,
- incrementing sortie count only when leaving supply or redeploying from a terminal result,
- preserving meta progression and resetting only run-local cards/stats on redeploy.

## What Should Not Happen

- A post-outpost `game_over` should not skip directly to a new run.
- A post-outpost `victory` should not skip directly to a new run.
- Boss recall and boss victory should not behave like plain restart.
- Opening the outpost should not require buying an upgrade.
- Fast deaths before 45 seconds should not grant normal run rewards, but after the outpost is introduced they should still return to the outpost.

## Current Implementation Anchors

- `scripts/main.gd::_should_show_supply_after_result`
- `scripts/main.gd::_handle_terminal_action`
- `scripts/main.gd::_restart`
- `scripts/hud_controller.gd::show_result_screen`
- `scripts/hud_controller.gd::show_supply_depot`
- `scripts/run_result_evaluator.gd`
