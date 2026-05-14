# Balance Notes

## Failure And Long-Term Growth

The current combat tuning intentionally raises pressure for experienced survivor-like players. If early difficulty continues to rise, the run structure should add a light roguelite safety net: after a failed sortie, hub upgrades, traces, or permanent growth should make the next sortie slightly stronger without removing the need for movement, auto-fire builds, and charge timing.

## First Sortie Recall

The first sortie should collapse before the player can approach boss pacing: warning around 70 seconds, campaign signal collapse around 88 seconds, and emergency recall by roughly 108 seconds at the latest. The player should feel overwhelmed by the campaign environment, not simply stopped by a timer. This introduces the loop of sortie, recall, Silent Supply Depot, growth, and redeployment. The first boss should be held back until the player has seen a few redeployments and understands that failed runs still return useful traces.

## First Meta Growth

The first emergency recall grants one `torn_ad_flyer` trace, shown to the player as a torn ad flyer. The Silent Supply Depot can spend that trace on one small permanent upgrade: +1 auto-fire damage, +2 charge damage, or +5 max HP. These values are intentionally low so the protagonist still starts weak, while the next sortie feels slightly less hopeless. Runtime level-up cards reset each sortie; these meta bonuses persist for the current session and are structured so they can later move into save/load data.

The depot upgrade loop is session-only meta growth for now; save/load is not implemented yet. After the first recall, the Silent Supply Depot should act as the emotional start of the next loop: review the trace, choose or hold one small upgrade, and make redeployment feel intentional rather than like a simple retry.

## Preboss Session Loop

The first boss is still not implemented. Before that fight exists, the player should learn the loop through several recall/redeployment cycles: runtime card builds, enemy defense types, and one small Silent Supply Depot upgrade in the current session only.

Current combat code tracks only the boss signal state: none, faint, detected, and near. Sortie 1 remains the forced recall. Sortie 2 is a baseline 5-minute run with a faint signal event, sortie 3 slightly raises signal/tank pressure, and sortie 4 can mark the boss signal as near without spawning a boss, boss health bar, boss AI, or boss scene.

## Early Damage Scale

Keep early combat numbers small so RPG and roguelite growth has room to inflate later. Baseline auto-fire is 15 damage per 0.5 second shot, normal charge is 20 damage, focused charge is 30 damage, and a basic enemy has 45 HP. This means a focused charge wounds a fresh basic enemy but does not delete it, while follow-up auto-fire or combined effects still matter.

Future enemy families should include defensive identity, not just larger HP: examples include anti-auto armor, charge-resistant plating, signal shields, and enemies that must be softened by one damage type before another becomes efficient.

## Level-Up Build Tags

Level-up cards now carry build tags for `auto`, `charge`, `area`, `survival`, and `utility`. The 3-card offer is corrected to show at least two visible build directions, while selected build tags weakly bias future offers once the player has taken two or more cards in that direction. The bias is intentionally soft and still prevents all three cards from collapsing into one build. This structure should later connect to character identity, weapon kits, and session-only or longer-term growth.

## Balance Simulator

Run the combat balance simulator from the repository root:

```sh
python tools/balance_sim.py
```

The simulator reads current constants from `scripts/game_config.gd`, enemy role HP multipliers from `scripts/enemy_controller.gd`, and card damage values from `scripts/level_up_cards.gd`. It prints Markdown tables for:

- Base TTK by enemy role: HP, auto-fire shots, auto-only TTK, and cleanup shots after normal or focused charge.
- Charge efficiency: repeated normal/focused charge casts and real kill time using the current 8 second charge period.
- Growth stages: current card logic comparisons for no growth, auto damage cards, charge damage cards, and combined damage cards.
- Defense type preview: virtual armor profiles for anti-auto, anti-charge, plated, and exposed-core enemies.
- Meta progression preview: first trace upgrade comparisons for auto +1, charge +2, and max HP +5.
- Build preview: rough package checks for auto, charge, area, and survival card directions.
- Preboss progression preview: session sortie steps, boss signal events, and small wave pressure changes before any boss body exists.

Use the output as a numeric gate before changing live balance:

- Early combat should stay small enough that later RPG and roguelite growth has room to inflate.
- Focused charge should not kill a fresh basic enemy in the opening baseline. It should leave at least one auto shot of cleanup.
- Fast enemies may die quickly, but their lower HP should be paid for by speed and pressure, not by higher durability.
- Tank and signal roles should remain visibly different in TTK. If they collapse to the same kill time after a small number of cards, raise role identity before raising every enemy HP.
- Charge-only kill times should remain inefficient against durable targets while charge plus auto-fire should feel meaningfully better.
- If a card package makes focused charge one-shot basic enemies, treat that as a mid-run power spike, not the first-sortie baseline.
- When adding defensive enemy families, prefer multiplier profiles that make the player swap priorities instead of simply adding larger HP numbers.
