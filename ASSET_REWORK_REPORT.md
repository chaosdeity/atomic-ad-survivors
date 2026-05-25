# Vertical Slice 0.1 P0 Art Rework Report

## Scope

This pass reworked the existing P0 prototype PNGs into stronger commercial-candidate pixel assets while preserving filenames, cell sizes, row/column layouts, and pivot assumptions from `ASSET_IMPORT_NOTES.md`.

No Godot code, scenes, gameplay values, generated reference images, or slicing structures were changed.

## Reworked Assets

| File | Structure Kept | Before | After | Commercial Candidate |
|---|---|---|---|---|
| `assets/characters/player/player_survivor_48x48_4dir_walk.png` | Yes, 96x192 / 48x48 / 4 rows x 2 cols | Prototype block figure, weak direction read | Stronger helmet, suit, lunchbox badge, direction-specific face/back/profile, clearer 2-frame walk | Candidate, needs final animator polish |
| `assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png` | Yes, 64x32 / 32x32 / 1 row x 2 cols | Simple sign body | Billboard silhouette with sign legs, toxic slime growth, fake ad bars, wobble frame | Candidate |
| `assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png` | Yes, 64x32 / 32x32 / 1 row x 2 cols | Generic box enemy | TV/appliance silhouette with antenna, screen face, legs, plug/side limbs | Candidate |
| `assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png` | Yes, 64x32 / 32x32 / 1 row x 2 cols | Green blob with paper | Coupon-paper slime with irregular top silhouette, paper shards, radioactive body | Candidate |
| `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png` | Yes, 80x40 / 40x40 / 1 row x 2 cols | Small dress figure | Clear hair/dress/shopping-bag silhouette, slime leak, 1950s housewife profile | Candidate, needs expression polish |
| `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png` | Yes, 160x80 / 80x80 / 1 row x 2 cols | Large robot placeholder | Oversized smiling mascot robot, cracked eye, badge, leaking slime, waving pose | Candidate |
| `assets/ui/hud/ui_hud_hp_charge_gauges.png` | Yes, 160x64 | Flat bars | Compact retro ad meter frames with HP/charge/ready color states and star caps | Candidate, frame/fill should still be split later |
| `assets/ui/cards/ui_card_catalog_9slice.png` | Yes, 372x106 / 124x106 x 3 | Basic card blocks | Catalog coupon cards with blank text areas, icon slots, selected/disabled variants | Candidate |
| `assets/ui/icons/ui_card_icons_p0_32x32.png` | Yes, 288x32 / 32x32 x 9 | Very rough symbols | Reworked 9 card icons matching current card order | Candidate, some icons need semantic refinement |
| `assets/ui/results/ui_result_panel_9slice.png` | Yes, 244x174 | Simple panel | Receipt/catalog result panel with blank stat area, button frame, coupon perforation | Candidate |

## Validation Images

| File | Purpose |
|---|---|
| `assets/marketing/p0_rework_visibility_mock_480x270.png` | 480x270 mock combat screen for silhouette and role readability |
| `assets/marketing/p0_rework_contact_sheet_1x2x3x.png` | 1x/2x/3x scale contact sheet for pixel readability review |

## Palette Check

The rework stays inside the B-tone family:

- ad paper cream and pastel beige for UI/background-ad surfaces
- mint fade and sage green for survivor/appliance/suburb softness
- coral pink and lemon yellow for 1950s ad highlights
- cocoa/ink outlines for pixel readability
- toxic green and neon red/yellow for corruption and game signal accents

It intentionally avoids brass, rust, gas masks, dark steampunk lighting, realistic gore, and painterly high-resolution shading.

## 480x270 Visibility Result

Pass with caveats.

- Player reads as the central survivor at native size, with stronger helmet/body contrast than the prototype.
- Tier1 enemy silhouettes are now separable: billboard rectangle, appliance antenna box, and low slime blob.
- Elite housewife reads as taller and more humanoid than tier1 enemies.
- Mascot reads immediately as a large special enemy.
- UI assets have clearer blank text zones and stronger retro ad framing.

Caveats:

- The player side-view walk remains minimal because only two frames are available.
- The 32x32 enemies are readable, but final shipping polish would benefit from manual sub-pixel-level pixel cleanup by a dedicated pixel artist.
- The UI sheets are commercial-candidate layout art, but HUD frame/fill separation should be done before final Godot UI replacement.

## Godot Slicing Notes

- Do not change `scripts/sprite_assets.gd` region assumptions.
- Player pivot remains x 24, y 43.
- Tier1 enemy pivot remains x 16, y 28.
- Housewife pivot remains x 20, y 37.
- Mascot pivot remains x 40, y 74.
- Keep nearest filtering and pixel snap.
- Keep gameplay collision/hitbox separate from sprite size.

## Still Prototype

The following are not part of this rework and remain prototype/previous-pass candidates:

- `assets/tilesets/suburb/tiles_suburb_ground_16x16.png`
- `assets/vfx/vfx_particles_atomic_ad_atlas.png`
- `assets/marketing/key_art_bright_atomic_capsule_draft.png`

## Next Recommended Work

1. Open the game scene and test movement direction changes with the reworked player sheet.
2. Spawn a dense F11 swarm and check whether billboard/appliance/coupon enemies remain distinct.
3. Apply the reworked HUD/card assets in a separate UI-only pass.
4. Give the player and housewife a final manual animation polish pass if these assets are intended for trailer footage.
5. Rework tiles/VFX/key art separately; they were intentionally not part of this pass.
