# Atomic Ad Survivors Codex Workspace Inventory

## 판정 요약

- 감사 범위: `C:\workspace`의 Atomic Ad Survivors 관련 `_codex_*`, `_codex_archive/*`, R01/Yunseo QA·output·temp_project, 2026-09 독립 proof 작업, 현재 프로젝트 내부 `_codex_playtest`.
- 감사 후보 컨테이너: **109개**
- 중복/파생 복사본 패밀리: **18개**
- 분류 단위: 동일 작업 목적·동일/연속 SHA·QA copy/temp_project/output 관계가 명백한 항목은 하나의 논리 그룹으로 묶음. A/B/C/D/E 수치는 **53개 논리 그룹 기준**.
- 로컬 `C:\workspace` 자체는 Git 저장소가 아니다. Workspace Readonly 커넥터는 개별 하위 폴더에 대해 git-status 경로 인자를 제공하지 않으므로, origin/branch/HEAD는 **과거 보고서에 명시된 경우만 확정**했다. .git credential/config 및 secret/key/token 파일은 읽지 않았다.
- GitHub `main` HEAD는 감사 시점 `416bf2718f897c92c234220710e1d7c92bb46b84`(2026-06-28)이며, 로컬 현재 프로젝트에는 2026-09 Unreal 전환 문서가 존재한다. 따라서 **현재 로컬 프로젝트 기준이 GitHub main보다 최신**이다.
- 현재 결과 브랜치 `chatgpt-work`의 감사 시작 HEAD는 `96c422f36842939ea17821f79c0b2c808f197314`.

## 현재 권위 기준

아래 5개를 월드맵 감사의 최우선 기준으로 사용했다.

1. `docs/world/GLOBAL_CAMPAIGN_MAP_PLACEMENT_V0_1.md`
2. `docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md`
3. `docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md`
4. `docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md`
5. `docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md`

추가 현재 엔진 기준은 `docs/unreal_epic_sample_adoption_plan_20260911.md`다. 이 문서는 최종 구현 엔진을 Unreal Engine 5.8로 확정하고 Godot를 레거시 규칙·시나리오·프로토타입으로 보존한다고 명시한다.

## 원시 후보 인벤토리

### 1) _codex core / launch / playtest 계열 (15)
`_codex_core_loop_onboarding_hud_20260620`, `_codex_core_loop_pressure_reward_s0_qa_20260620`, `_codex_core_loop_s0_s1_20260619`, `_codex_core_loop_s1_pressure_reward_qa_20260620`, `_codex_core_loop_s2_reward_choice_qa_20260620`, `_codex_core_loop_s3_reward_depth_qa_20260621`, `_codex_first_10_minute_full_manual_v2_20260621`, `_codex_first_10_minute_manual_preflight_20260620`, `_codex_launch_latest_game`, `_codex_launch_latest_game_core_loop_20260620_121015`, `_codex_launch_latest_game_emergency_20260619_125234`, `_codex_launch_latest_game_refedit`, `_codex_launch_latest_game_s2_r2`, `_codex_live_origin_main_pr15_20260620`, `_codex_pr20_live_playtest_20260621`.

### 2) R01 계열 (19)
`_codex_r01_background_batch2_assets`, `_codex_r01_background_batch2_final_visual_qa_output`, `_codex_r01_flow_recheck_20260619_130220`, `_codex_r01_flow_recheck_clean_import_20260619`, `_codex_r01_full_map_art_rework_assets`, `_codex_r01_full_map_art_rework_assets_v02`, `_codex_r01_full_map_art_rework_backup_before_v02_overwrite`, `_codex_r01_full_map_art_rework_v02_final_qa_output`, `_codex_r01_full_map_playtest`, `_codex_r01_full_map_playtest_output`, `_codex_r01_full_map_playtest_s0_feedback_qa_output`, `_codex_r01_full_map_playtest_s0_feedback_v02_qa_output`, `_codex_r01_full_map_playtest_screenshot_probe_output`, `_codex_r01_map_background_batch1`, `_codex_r01_npc_style_lineup_review`, `_codex_r01_production_fixture_batch1`, `_codex_r01_production_fixture_batch2`, `_codex_r01_production_fixture_batch3`, `_codex_r01_style_alignment_review_v02`.

### 3) Yunseo 및 QA 계열 (59)
June Codex runtime/QA 41개와 September 독립 실험 18개를 포함한다. 핵심 패밀리: 96px walk, canonical reference, default walk, guided walk, layered walk, pseudo socket, runtime state, visual state, walk cycle, walk feel, V06 scale QA, 2.5D, authored volume, crosspose, edge refine, face, face design, face fit, feasibility, feature mesh, fullbody, head structure, layer audit, shoulder gate, VRoid.

### 4) 독립 proof / misc (6)
`_codex_imagegen_tmp`, `_codex_patches`, `campaign-logic-20260905-235627`, `map-evolution-proof-20260906-055930`, `motion-proof-20260905-145830`, `mystery-proof-20260906-011128`.

### 5) _codex_archive 역사 패키지 (10)
`r01_background_batch2_merged_20260615`, `r01_full_map_art_rework_merged_20260615`, `r01_procedure_background_merged_20260611`, `r01_production_fixtures_clean_pr_merged_20260612`, `workspace_cleanup_clean_pr_merged_20260614`, `workspace_cleanup_phase1_20260613`, `workspace_final_wrapup_20260614`, `yunseo_runtime_state_v02_merged_20260616`, `yunseo_walk_feel_s2_r2_merged_20260619`, `yunseo_walk16_refedit_merged_20260617`.

### 6) 현재 프로젝트 내부 임시 복사본 (1)
`C:\workspace\스팀펑크\_codex_playtest`.

합계 109개.

## Git provenance가 문서로 확인된 대표 그룹

| 그룹 | branch / HEAD | main 관계 | 판정 |
|---|---|---|---|
| R01 procedure background | `codex/r01-procedure-interactions` / `d2b122b70be2c78b446f37f9cff682f654a777f0` | merge 후 당시 main `d72efc7049f7513ed6091c1cd266429cb66fd218` | 역사상 merge 완료 |
| R01 full map art | `codex/r01-full-map-art-rework` / `220e0d9a251c9c3c91444fe8eb15ec2b152856d4` | merge 보고 존재 | 역사상 merge 완료 |
| R01 background batch2 | feature head `bcc28ba93274a4d18081e16afc79f1308431413a` | merge commit `0b9851596748e0b91a89368d9cba6e6129434f9e`가 당시 main | 역사상 merge 완료 |
| Yunseo runtime state v02 | archived merge report | origin/main 포함 PASS 기록 | 역사상 merge 완료 |
| Yunseo walk feel S2 R2 | base `ee016947849a462aecdae6e9a49ee988871984f3` | 43-file scoped diff, out-of-scope 0 기록 | 역사 증거 |
| Yunseo walk16 refedit | clean reapply 기록 | 42 static + 2 code 최소 patch 재구성 | 역사 증거 |

## 18개 중복/파생 복사 패밀리

1. R01 background batch2 assets → QA output → merged archive.
2. R01 full-map art rework v01/v02 → overwrite backup → final QA → merged archive.
3. R01 full-map playtest → output → S0 feedback QA → v02 QA → screenshot probe.
4. R01 production fixture batch1/2/3 → clean-PR archive.
5. R01 map/procedure background QA temp_project chain.
6. core loop S0/S1 → pressure/reward QA variants.
7. core loop S2 reward choice → QA/result copies.
8. core loop S3 reward depth → playtest copies.
9. first-10-minute preflight → full manual v2.
10. launch_latest_game variants → live-origin/PR playtest.
11. Yunseo runtime-state → Godot QA copy → QA outputs → merged archive.
12. Yunseo walk-cycle assets → runtime QA output.
13. Yunseo walk16/guided walk → asset v01/v02 → clean reapply archive.
14. Yunseo walk-feel probe/live/overlay QA → merged archive.
15. Yunseo 96px runtime → QA copy → sheet iterations.
16. Yunseo default-walk final/hotfix → QA/output/postmerge validation.
17. Yunseo layered-walk pipeline/runtime/default-enable QA.
18. Yunseo pseudo-socket prototype → foot-contact correction → runtime QA.

## temp_project 판정

과거 보고서가 직접 지목한 `temp_project`는 R01 background batch2, R01 full-map art v02, Yunseo runtime-state, walk-cycle, walk-overlay, walk16-refedit, walk-feel-live 계열에 존재한다. 이들은 상위 결과 보고서/merge package가 보존되어 있고 실행 복사본 자체는 독립 설계 자산이 아니므로 D 후보로 묶었다.

## 확인 필요

- Workspace Readonly 인터페이스 제한 때문에 모든 하위 clone의 실제 `.git` origin/branch/HEAD를 직접 질의할 수 없었다.
- 따라서 보고서에 Git provenance가 없는 폴더는 origin/branch/HEAD를 추정하지 않았다.
- `_codex_patches`, 일부 September Yunseo crosspose/edge-refine 계열은 현재 기준과의 정확한 흡수 여부가 명확하지 않아 E로 유지했다.
