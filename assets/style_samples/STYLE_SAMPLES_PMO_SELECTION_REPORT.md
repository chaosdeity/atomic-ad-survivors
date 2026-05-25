# STYLE_SAMPLES_PMO_SELECTION_REPORT

Status: PMO selection pass / no commit / no import
Scope: `assets/style_samples/` only
Date: 2026-05-26

## 0. Executive Decision

Do not commit `assets/style_samples/` as a folder.

Most current samples are not production-usable. They are useful mainly as evidence for what the next art direction must avoid or rebuild. The strongest surviving value is not "use this PNG" but "use this rule": hybrid 2D/cartoon readability, adult Yunseo, and R01 as advertising-controlled living infrastructure.

Final runtime asset candidates:

```text
none
```

Final direction lock candidates:

```text
2 docs + 2 review sheets, all conditional and non-runtime
```

The R01 map should be redesigned from the world bible and local-map logic. Current map samples still read too much as arena/mock composition or model-home illustration, not a world-space RPG local map. Yunseo and Smile Home boss also require redesign from story/personality/world rules, not direct adoption.

## 1. File Count / Size

Current `assets/style_samples/` state before this report:

| Measure | Count / Size |
| --- | ---: |
| Physical files | 192 |
| Physical size | 69.30 MiB |
| PNG files | 94 |
| `.import` sidecars | 94 |
| Markdown notes | 4 |

After this report/table, current folder count increases by 2 text files.

No files were deleted, moved, edited as images, imported into Godot, staged, or committed.

## 2. Basis Used

Key rules applied:

- Pixel art is not locked as the final direction.
- `production_cleanup_v2` and `production_cleanup_v2_polish` are not final art direction.
- Hybrid 2D/cartoon cutout remains more likely than fixed 32/40/48 pixel cleanup.
- Existing `smile_home_mother_in_law_boss_candidate.png` is not an approved boss.
- R01 must not be a normal suburb with signs. It must be a living advertising infrastructure ecology.
- 480x270 is a viewport/readability mock, not the final map size.
- R01 is a world-space RPG local map, not one polished arena image.
- Existing `art_inbox` PMO report says no current inbox PNG is LFS-ready runtime art.

## 3. Folder Judgement Summary

| Folder | Keep Candidate | Hold Candidate | Delete Candidate | Direction Lock Value | PMO Needed |
| --- | --- | --- | --- | --- | --- |
| `hybrid_production_candidate` | notes + contact sheet as weak direction evidence | individual Yunseo/coupon/mailbox/consultant PNGs as reference only | source/chromakey files, boss candidate as approval asset | conditional; not production | decide whether hybrid cartoon is the visual grammar |
| `hybrid_2d_cutout` | one contact sheet or warm mock as predecessor reference | cutouts only if PMO wants ancestry | chromakey/source/older mocks | reference only | none unless tracing evolution |
| `production_cleanup_v2` | none for direction lock | one sheet as rejection evidence | all runtime/direct art use | rejected archive | confirm fixed pixel is not the lock |
| `production_cleanup_v2_polish` | none for direction lock | maybe one polish sheet as prototype evidence | all direct art use | rejected archive / prototype only | confirm not commercial direction |
| `r01_environment_modular_candidate` | notes + contact sheet as the best rule reference | mockups and prop sheets as rebuild references | source/chromakey variants | strongest conditional direction evidence | redesign as world-space local map |
| `r01_environment_atlas_pilot` | notes as reference | atlas/mock PNGs as structural reference | direct production atlas use | reference only | redo after world-space map design |
| `r01_environment_atlas_slicing_spec` | spec doc as reference | rect/pivot guide as technical reference | current guide PNGs as final art | reference only | rewrite after new map kit exists |
| root `sample_*` PNGs | none | v2 contact sheet as old prompt trace | individual sample PNGs and v1/v2 concepts | rejected archive | none |
| all `.import` | none | none | all `.import` sidecars | none | keep out of commit |

## 4. Direction Lock Candidates

These are the only items I would allow PMO to consider as direction-lock references, and even these are not runtime assets:

1. `assets/style_samples/p0_direction/hybrid_production_candidate/HYBRID_PRODUCTION_CANDIDATE_NOTES.md`
   - Captures the intended pipeline: 2D/cartoon source -> normalized sprite sheet -> atlas/LOD.
   - Good for the art-team rule, not as approval of every PNG in the folder.

2. `assets/style_samples/p0_direction/r01_environment_modular_candidate/R01_ENVIRONMENT_MODULAR_NOTES.md`
   - Best written articulation of "do not attach ads to a suburb; make living infrastructure execute ad commands."
   - Keep as a world/design rule reference.

3. `assets/style_samples/p0_direction/hybrid_production_candidate/hybrid_candidate_contact_sheet.png`
   - Useful single-page comparison of adult Yunseo, coupon, mailbox, consultant, and the rejected/too-dense boss direction.
   - Conditional only. It should not be treated as final art.

4. `assets/style_samples/p0_direction/r01_environment_modular_candidate/r01_modular_environment_contact_sheet.png`
   - Best visual sheet for R01 media hierarchy and enemy-size hierarchy.
   - Conditional only. The actual map must be redesigned.

Recommended commit status for these four:

```text
commit only if PMO wants visual lock artifacts in repo.
otherwise keep only this report/table and rebuild from docs.
```

## 5. Reference Archive

Reference-only, not direction lock:

- `hybrid_production_candidate/yunseo_hybrid_candidate.png`
- `hybrid_production_candidate/coupon_swarm_hybrid_candidate.png`
- `hybrid_production_candidate/mailbox_hybrid_candidate.png`
- `hybrid_production_candidate/happy_guarantee_consultant_hybrid_candidate.png`
- `hybrid_production_candidate/hybrid_candidate_mock_480x270.png`
- `hybrid_production_candidate/hybrid_candidate_high_density_mock_480x270.png`
- `hybrid_production_candidate/r01_ad_environment_props_candidate.png`
- `hybrid_2d_cutout/hybrid_contact_sheet.png`
- `hybrid_2d_cutout/hybrid_mock_480x270_warm_contrast.png`
- `r01_environment_modular_candidate/r01_combat_field_480x270_mock.png`
- `r01_environment_modular_candidate/r01_high_density_480x270_mock.png`
- `r01_environment_modular_candidate/r01_model_house_corruption_variants.png`
- `r01_environment_modular_candidate/r01_ad_props_cutout_sheet.png`
- `r01_environment_modular_candidate/r01_enemy_size_hierarchy_sheet.png`
- `r01_environment_atlas_pilot/R01_ENVIRONMENT_ATLAS_PILOT_NOTES.md`
- `r01_environment_atlas_slicing_spec/R01_ENVIRONMENT_ATLAS_SLICING_SPEC.md`

Reason:

- These contain silhouette, scale, density, or modularity clues.
- They are still not final because the character, boss, and world-space map need redesign.

## 6. Rejected Archive

Keep only as failure-history evidence if PMO wants a visual audit trail:

- `production_cleanup_v2/**`
- `production_cleanup_v2_polish/**`
- root `sample_*` PNGs
- `hybrid_production_candidate/smile_home_mother_in_law_boss_candidate.png`
- `hybrid_production_candidate/smile_home_mother_in_law_boss_candidate_source_chromakey.png`

Reasons:

- Fixed pixel cleanup is not the locked commercial direction.
- Pixel cleanup samples retain prototype/pipeline lessons but should not drive final art.
- Early sample PNGs are prompt-output history, not direction lock.
- Existing Smile Home boss candidate is too dense and conceptually not approved; the boss needs separate redesign as a family suitability review node.

## 7. Delete Candidate Summary

Do not commit:

- `assets/style_samples/**/*.import`
- source/chromakey PNGs
- root `sample_*` individual PNGs
- `production_cleanup_v2/**` as production direction
- `production_cleanup_v2_polish/**` as production direction
- duplicate 480x270 mocks
- old cool/mint background mocks
- current atlas/spec PNGs as production atlases
- existing boss candidate as approval asset
- any file that implies 480x270 is the final map size
- any file that makes R01 a normal pretty suburb plus signs

## 8. Minimal Commit Recommendation

Immediate commit recommendation:

```text
assets/style_samples/STYLE_SAMPLES_PMO_SELECTION_REPORT.md
assets/style_samples/STYLE_SAMPLES_PMO_SELECTION_TABLE.csv
```

Optional PMO visual lock bundle, only if PMO explicitly wants visual artifacts:

```text
assets/style_samples/p0_direction/hybrid_production_candidate/HYBRID_PRODUCTION_CANDIDATE_NOTES.md
assets/style_samples/p0_direction/r01_environment_modular_candidate/R01_ENVIRONMENT_MODULAR_NOTES.md
assets/style_samples/p0_direction/hybrid_production_candidate/hybrid_candidate_contact_sheet.png
assets/style_samples/p0_direction/r01_environment_modular_candidate/r01_modular_environment_contact_sheet.png
```

I do not recommend committing individual character/enemy/boss/map PNGs as lock assets right now.

## 9. Files That Must Not Be Committed

- `assets/style_samples/**/*.import`
- `assets/style_samples/p0_direction/production_cleanup_v2/**`
- `assets/style_samples/p0_direction/production_cleanup_v2_polish/**`
- `assets/style_samples/p0_direction/sample_*`
- `assets/style_samples/p0_direction/hybrid_production_candidate/*source*`
- `assets/style_samples/p0_direction/hybrid_2d_cutout/*chromakey*`
- `assets/style_samples/p0_direction/hybrid_2d_cutout/*source*`
- `assets/style_samples/p0_direction/r01_environment_modular_candidate/*source*`
- `assets/style_samples/p0_direction/hybrid_production_candidate/smile_home_mother_in_law_boss_candidate*.png`
- `assets/art_inbox/**`

## 10. PMO Final Judgment Needed

PMO needs to decide:

1. Is hybrid 2D/cartoon the commercial art grammar, or is it only a stepping stone?
2. Should the repo preserve any visual style lock PNGs, or only textual reports?
3. Should R01 map art restart from `R01_LOCAL_MAP_LAYOUT_LOGIC_SPEC.md` before any atlas work continues?
4. Should Yunseo be redesigned before enemies, so every enemy scale/color is checked against her final silhouette?
5. Should Smile Home boss naming shift toward `스마일 홈 심사관` in UI while keeping `시어머니` as campaign-facing nickname?
6. Should `assets/style_samples/` be added to ignore rules after selected reports are committed?

## 11. Next Work

Recommended order:

1. Write a new art brief for Yunseo from story/personality/world rules.
2. Redesign R01 as a world-space RPG local map, not a 480x270 arena.
3. Create a new R01 local-map blockout sheet: route, house repetition, model-house node, drain silence pocket, fake return route.
4. Redesign Smile Home boss separately as a family suitability review node.
5. Produce one new hybrid 2D pilot only after PMO signs off on the redesigned brief.
