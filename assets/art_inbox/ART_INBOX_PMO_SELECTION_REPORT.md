# ART_INBOX_PMO_SELECTION_REPORT

Status: PMO selection pass / no commit / no import
Scope: `assets/art_inbox/` only
Date: 2026-05-26

## 0. Executive Decision

`assets/art_inbox/` should remain a quarantine inbox. Do not bulk commit it.

After re-checking the story lock, the final LFS commit candidate count is currently `0 PNG`.

Reason:

- `story/00_source/story_0.001.md` locks the world as a bright advertising ecology, not a generic apocalypse, steampunk, zombie, or monster setting.
- `story/90_implementation/r01_suburb_content_lock_0_2.md` locks 0.2 around R01 suburb, Yunseo, Silence Outpost, Smile Home Mother-in-law, trace items, and repeated return reactions.
- `story/90_implementation/story_deepening_0_2_asset_brief.md` explicitly says the existing Yunseo v05 and boss v04 visuals are discarded and must become a new direction, not production imports.
- The inbox PNGs are cache-recovered review material. Existing audits mark them as reviewable, not final-import-ready.

Therefore this pass treats many files as story-aligned reference or rework seeds, but not as LFS-ready runtime art.

## 1. Count / Size Recheck

Commands checked:

- `git status --short`
- `git ls-files --others --exclude-standard -- assets/art_inbox`
- `git lfs track`

Result:

| Measure | Count / Size |
| --- | ---: |
| Original review target files excluding `.import` and `.translation` | 528 |
| Original review target size excluding `.import` and `.translation` | 112.83 MiB |
| PNG review targets | 489 |
| Original CSV review docs | 19 |
| Original Markdown review docs | 20 |
| Current review files after this report/table | 530 |
| Current review size after this report/table | 112.86 MiB |
| Current CSV docs after this report/table | 20 |
| Current Markdown docs after this report/table | 21 |
| Current repo-visible untracked files under `assets/art_inbox` | 635 |
| Current physical files on disk including sidecars | 1,143 |
| Current physical size including sidecars | 113.95 MiB |
| `.import` sidecars present on disk | 508 |
| `.translation` files present | 105 |
| `.uid` files found under `assets/art_inbox` | 0 |

LFS policy is already configured for image/media extensions including PNG. That does not mean these PNGs should be committed.

## 2. Story Gate Used For Selection

Approved 0.2 story pillars:

- R01 is not a normal suburb. It is an open-house / family qualification / housing ad ecology.
- Yunseo is an adult return/logistics field worker whose scanner, stamp, name tag, and recovery line define her silhouette.
- Silence Outpost is a small settlement / salvage / repair / name archive space, not a clean upgrade menu.
- Smile Home Mother-in-law is not a joke mother, evil mom, or simple robot boss. It is a family suitability review node with a customer-service face.
- Early R01 enemies are coupon flyer swarm, smiling mailbox, sale balloon, homecare vacuum, and Happy Guarantee Consultant.
- First boss patterns are coupon barrage, cleaning suction, photo flash, and optional floor-plan route correction.
- Trace items should preserve names and uses: nameplate, family photo, nameless receipt, silent radio, mascot badge, lead-shield battery.

Hard discard gates:

- child/chibi Yunseo
- generic soldier / heroic survivor Yunseo
- human mother monster or horror mother boss
- steampunk brass / gasmask / dark industrial tone
- neon city as R01 primary language
- normal pretty suburb without command-role infrastructure
- generic robot enemies not tied to household ad systems
- clean abstract UI that hides the physical outpost fiction
- duplicate contact sheets, mockups, source sheets, and cache sidecars

## 3. Folder Judgement Summary

| Folder | Keep Candidate | Hold Candidate | Delete Candidate | Immediate Runtime Candidate | PMO Needed |
| --- | --- | --- | --- | --- | --- |
| `characters` | none as final PNG | Yunseo v05 only as rejection/reference for adult worker cues | all existing Yunseo v05/v03 PNGs and character/enemy atlases for repo commit | none | approve new Yunseo art brief before any sprite work |
| `enemies` | coupon flyer, mailbox, vacuum, consultant as story-fit role seeds | doorbell, speaker, signal, route sign as P1/P2 reference | non-0.2 specials, generic robot reads, old source/chromakey sheets | none | decide if sale balloon must be newly produced first |
| `bosses` | pattern taxonomy only | v04 cue set as visual caution/reference | existing v02/v04 boss PNGs for runtime commit | none | approve new family-suitability-node silhouette |
| `r01_props` | command-role props as rebuild seeds: model house node, mailbox, doorbell, drain, vacuum, kiosk, silent radio | nameplate / family photo / receipt / fake return variants | decorative-only props and source sheets | none | PMO must confirm which props execute mechanics |
| `r01_tiles` | palette and ground-material reference | all tile PNGs need modular rebuild | current painterly patches as runtime tiles | none | decide final grid size and placement rules |
| `r01_decals` | fake return arrow, broken route, family photo afterimage as rework seeds | broadcast / paper / shadow decals need scale check | decals that read as UI objective arrows | none | check fake-return readability in mockup |
| `r01_ground_patches` | silence pocket, drain stain, family floorplan as references | all need placement and opacity pass | generic puddles/scatter as direct runtime | none | decide density budget for 480x270 |
| `r01_hazards` | coupon residue / flyer warning / pressure telegraph as mechanic seeds | all need gameplay readability pass | hazard art that is decorative or too UI-like | none | define final telegraph palette |
| `r01_map_markers` | maybe one R01 marker as map reference | all markers need UI language review | current marker set for runtime | none | decide whether diegetic map markers exist in 0.2 |
| `outpost` | recall platform, settlement counter, upgrade bench, name archive, sortie board as layout seeds | most props need spatial hierarchy review | clean sci-fi/menu-like props if not grounded in outpost fiction | none | approve outpost blockout before asset import |
| `ui` | HP/charge frames and return/result panels as UI grammar reference | clean UI requires Korean padding and story text tests | duplicate v02 frames, generic icons, source sheets | none | decide temporary UI import exception or full redraw |
| `vfx` | return stamp, charger warning, boss warning, speaker wave as effect-language seeds | all need color/value collision test | generic fireworks/atomic particles/combo effects not tied to 0.2 | none | define final VFX colors against gameplay density |
| `mockups` | `r01_mock_960x540_world_crop.png`, `outpost_mock_480x270.png`, `boss_encounter_mock_480x270.png` as reference only | density mockups for design discussion | duplicate/old mockup variants for repo | none | use as rebuild brief inputs only |
| `contact_sheets` | latest sheets as reference index only | technical slice overlays if needed off-repo | duplicate older contact sheets and large overlays | none | preserve only a minimal report-facing set if any |
| `rejected` | ledger value only | optional off-repo rejected archive | all rejected PNGs in main repo | none | decide whether to keep external archive outside repo |

## 4. Runtime Candidate List

Final `runtime_candidate` / LFS commit candidates:

```text
none
```

The previous internal smoke queue remains useful as a rebuild checklist, not as final commit material.

Story-fit rework seeds:

- `r01_props/r01_prop_model_house_command_node_facade_v02.png`
- `r01_props/r01_prop_smiling_mailbox_speaker_v02.png`
- `r01_props/r01_prop_doorbell_projector_house_recommend_v02.png`
- `r01_props/r01_prop_drain_campaign_intake_v02.png`
- `r01_props/r01_prop_homecare_vacuum_command_device_v02.png`
- `r01_props/r01_prop_consultation_kiosk_v02.png`
- `r01_decals/r01_state_fake_return_broken_floor_arrow_decal_v06.png`
- `r01_props/r01_state_drain_silence_pocket_silent_radio_v07.png`
- `enemies/enemy_coupon_flyer_swarm_tiny_v04.png`
- `enemies/enemy_mailbox_shooter_v04.png`
- `enemies/enemy_homecare_vacuum_ad_device_v04.png`
- `enemies/enemy_happy_guarantee_consultant_elite_idle_v03.png`
- `outpost/outpost_prop_recall_platform_v02.png`
- `outpost/outpost_prop_settlement_counter_v02.png`
- `outpost/outpost_prop_upgrade_bench_v02.png`
- `outpost/outpost_prop_name_archive_locker_v02.png`
- `outpost/outpost_prop_sortie_board_v02.png`
- `ui/ui_frame_hp_gauge_clean_v04.png`
- `ui/ui_frame_charge_gauge_clean_v04.png`
- `vfx/vfx_return_stamp_ready_frame_01_v04.png`
- `vfx/vfx_return_stamp_mark_clean_v04.png`
- `vfx/vfx_charger_warning_line_clean_v04.png`
- `vfx/vfx_boss_warning_marker_clean_v04.png`

These are not commit candidates until redrawn or explicitly approved as temporary placeholders.

## 5. Reference Archive List

Worth keeping as reference, preferably not as many raw PNGs in main repo:

- `assets/art_inbox/ART_INBOX_*_AUDIT.md`
- `assets/art_inbox/ART_INBOX_*_AUDIT.csv`
- `assets/art_inbox/ART_INBOX_REJECTION_LEDGER.md`
- `assets/art_inbox/ART_INBOX_REJECTION_LEDGER.csv`
- `assets/art_inbox/ART_INBOX_STORY_REWORK_BACKLOG.csv`
- `assets/art_inbox/ART_INBOX_STORY_GATED_SMOKE_QUEUE.csv`
- `contact_sheets/generated_source_overview_contact_sheet_v02.png`
- `contact_sheets/r01_modular_environment_contact_sheet.png`
- `contact_sheets/r01_props_contact_sheet_v02.png`
- `contact_sheets/r01_tiles_contact_sheet_v02.png`
- `contact_sheets/r01_decals_hazards_contact_sheet_v02.png`
- `contact_sheets/enemy_role_expansion_contact_sheet_v04.png`
- `contact_sheets/outpost_contact_sheet_v02.png`
- `contact_sheets/ui_vfx_clean_functional_contact_sheet_v06.png`
- `contact_sheets/yunseo_pose_contact_sheet_v05.png` as rejection/context only
- `contact_sheets/boss_combat_lod_cues_contact_sheet_v04.png` as rejection/context only
- `mockups/r01_mock_960x540_world_crop.png`
- `mockups/outpost_mock_480x270.png`
- `mockups/boss_encounter_mock_480x270.png`

## 6. Rejected Archive Preservation

Recommendation: do not preserve `assets/art_inbox/rejected/` in the main repo.

Reason:

- It contains 181 rejected PNGs plus matching `.import` sidecars on disk.
- The learning value is already captured by `ART_INBOX_REJECTION_LEDGER.*`.
- Keeping rejected PNGs in main repo consumes LFS and makes future asset searches noisy.
- If PMO wants visual rejection history, store it outside the runtime repo or keep one compact contact sheet plus the ledger.

Classification:

- `rejected_archive` value: yes, as process history.
- Main repo value: no.
- Commit candidate: false.

## 7. Delete Candidate Summary

Delete from future repo scope / do not commit:

- all `*.import` under `assets/art_inbox/`
- all `*.translation` under `assets/art_inbox/`
- all `assets/art_inbox/rejected/*.png`
- all `assets/art_inbox/rejected/*.png.import`
- existing Yunseo v05/v03 PNGs as production/runtime art
- existing Smile Home Mother-in-law v02/v04 PNGs as production/runtime art
- source/chromakey sheets and alpha sheets unless a new approved slicing workflow specifically needs them
- duplicate contact sheets with older version numbers
- technical slice guide overlays unless stored off-repo for art operations
- duplicate mockups and density variants after one reference is selected
- UI v02 duplicates when a cleaner v04/v06 exists
- generic VFX not tied to R01/Yunseo/boss/outpost story functions

## 8. Needs Rework List

High-priority rework, not commit:

1. Yunseo: redraw from the story brief. Required silhouette is adult return/logistics worker with scanner, stamp/labeler, recovery line reel, name tag, worn workwear.
2. Smile Home Mother-in-law: redraw as a family suitability review node, not a human mother monster. Required silhouette is consultation booth + front door + CRT/customer-service face + paper/terms body.
3. R01 enemies: recreate coupon flyer swarm, smiling mailbox, sale balloon, homecare vacuum, Happy Guarantee Consultant with clear 1x gameplay silhouettes.
4. R01 props: convert pretty cutouts into command-role objects that issue housing/family/food/charge/receiver-tag logic.
5. R01 tiles/ground: rebuild as placement-safe modular map material, not painterly contact-sheet objects.
6. Fake return route: make it readable as campaign lure, never as a real system objective.
7. Outpost: rebuild around settlement counter, name archive, repair bench, sortie board, recovery platform, and trace storage.
8. UI/VFX: keep HP/charge and return-stamp language, but validate Korean text, mobile size, and gameplay contrast.

## 9. LFS Commit Candidates

Final LFS commit candidates now:

```text
none
```

Possible future LFS commit units after PMO approval:

- new Yunseo production sheet only
- new R01 P0 enemy pack only
- new R01 world prop/trace pack only
- new outpost physical facility pack only
- new UI/VFX functional pack only

Do not commit cache-recovered inbox PNGs as final art.

## 10. Items That Must Not Enter Main Repo

- `assets/art_inbox/` as a whole
- `assets/art_inbox/rejected/`
- `assets/art_inbox/**/*.import`
- `assets/art_inbox/**/*.translation`
- source/chromakey sheets
- duplicate contact sheets
- duplicate mockups
- any old Yunseo v05/v03 runtime candidate
- any old Smile Home Mother-in-law v02/v04 runtime candidate
- non-story enemy specials before R01 P0 enemies are rebuilt
- generic clean UI that makes the outpost feel like a menu instead of a place

## 11. Next Commit Unit Proposal

No commit was made.

Suggested future commits, in order:

1. Documentation only: this PMO selection report and table.
2. Cleanup decision commit: remove or ignore `.translation`, `.import`, rejected PNGs, and duplicate sheets from repo scope.
3. Rebuild brief commit: Yunseo + R01 P0 enemy + boss + outpost art briefs from locked story docs.
4. First LFS art commit: one approved production sheet pack only, not the whole inbox.

## 12. PMO Final Judgment Needed

PMO needs to decide:

- Whether `rejected/` should be external archived or deleted from repo scope entirely.
- Whether any current UI/VFX files may be used as temporary placeholders, despite zero final LFS candidates.
- Whether the boss public name remains `스마일 홈 시어머니` or shifts toward `스마일 홈 심사관` for UI while keeping 시어머니 as campaign-facing nickname.
- Whether sale balloon must be produced before any enemy pack is approved.
- Whether contact sheets should be preserved as one compressed review artifact or excluded from main repo.
- Whether `assets/art_inbox` should be added to ignore rules after this review.
