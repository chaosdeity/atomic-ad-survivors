# Worktree Cleanup Report

작성일: 2026-05-18
범위: `git status --short`, `git diff --stat`, 지정 문서/에셋 폴더 확인 기준.
주의: 이 문서는 분류만 한다. `git add .`, 커밋, 삭제, 되돌리기, Godot import 정리는 하지 않았다.

## 1. 요약

현재 작업트리는 크게 네 덩어리다.

| 분류 | 판단 |
| --- | --- |
| 기존 tracked 문서 수정 | `README_GAME.md`, `RPG_ARCHITECTURE_PLAN.md` 2개. 상위 방향 문서라 PMO 검토 후 커밋 판단 필요. |
| 기존 tracked PNG 수정 | player/enemy/UI PNG 10개. 실제 교체인지 임시 리워크인지 PMO 판단 필요. 기존 PNG를 덮어쓴 상태이므로 가장 주의가 필요하다. |
| 미커밋 문서 | R01, 성장, 보급소, 보스, 카드/차징 관련 문서 다수. 대부분 살릴 후보이나 중복/최신성 검토 필요. |
| import/uid/IDE 부산물 | `.idea/`, `*.import`, `*.uid` 다수. 기본 제외 후보. 단 Godot import 파일을 의도적으로 커밋하기로 결정한 경우만 별도 커밋. |

`git diff --stat` 기준 tracked 변경은 12개 파일이다.

- 문서: 2개, `7 insertions(+), 1 deletion(-)`.
- PNG: 10개 binary 변경.
- 코드 `.gd` 수정은 없음.

## 2. 이미 커밋된 것

현재 repo에 tracked로 존재하는 주요 기준 문서/코드:

| 파일 | 상태 |
| --- | --- |
| `P0_ART_DIRECTION_CORRECTION.md` | 이미 커밋됨. 현재 dirty 아님. P0 아트 판단 기준으로 유지. |
| `README_GAME.md` | 이미 커밋된 파일이나 현재 수정됨. |
| `RPG_ARCHITECTURE_PLAN.md` | 이미 커밋된 파일이나 현재 수정됨. |
| `scripts/*.gd` | tracked 코드 존재. 현재 실제 코드 diff 없음. |
| `assets/characters/.../*.png`, `assets/ui/.../*.png` | tracked PNG 존재. 현재 일부 binary diff 있음. |

## 3. 아직 커밋 후보인 것

PMO가 살릴 가능성이 높은 문서 후보:

- `CHARGE_WEAPON_ARCHETYPE_CHARACTER_STORYBOARD.md`
- `CHARGE_WEAPON_CARD_INTERPRETATION_DESIGN.md`
- `R01_COLLISION_NAVIGATION_ARCHITECTURE_SPEC.md`
- `R01_LOCAL_MAP_LAYOUT_LOGIC_SPEC.md`
- `R01_FINALE_ENDING_STRUCTURE_DESIGN.md`
- `VERTICAL_SLICE_0_2_VOLUME_FILL_PLAN.md`
- `R01_SUBURB_LOCAL_RESPONSE_DESIGN.md`
- `META_PROGRESSION_ARCHITECTURE.md`
- `GAME_ARCHITECTURE_MAP.md`
- `GAME_CURRENT_STATE_AUDIT.md`
- `MAIN_GD_RESPONSIBILITY_REPORT.md`
- `SUPPLY_UPGRADE_PLAYTEST_CHECKLIST.md`
- `NEXT_TASK_BACKLOG.md`
- `RPG_GROWTH_*`

이번 작업에서 새로 작성한 커밋 후보:

- `WORKTREE_CLEANUP_REPORT.md`
- `R01_5_ZONE_SCREENSHOT_DEBUG_QA_REPORT.md`
- `P0_ASSET_APPLICATION_ORDER.md`
- `SFX_BGM_PLACEHOLDER_LIST.md`
- `OUTPOST_VISUAL_PLACEHOLDER_PLAN.md`
- `SMILE_HOME_BOSS_VISUAL_PLACEHOLDER_PLAN.md`
- `VERTICAL_SLICE_0_2_PLAYFLOW_CHECKLIST.md`
- `qa/screenshots/r01/*.png`

## 4. 버릴 후보

바로 삭제하지 말고 PMO 확인 후 제외/정리할 후보:

| 후보 | 이유 |
| --- | --- |
| `generated_assets/01_atomic_steampunk/*.import` | 현재 방향이 스팀펑크 금지에 가깝다. 원본 PNG도 reference 이상으로 쓰지 않는 편이 안전. |
| `generated_assets/03_cute_dystopian_atomic/*.import` | 어린/치비 방향 금지와 충돌할 수 있다. |
| 일부 오래된 P0 리워크 보고서 | `ASSET_REWORK_REPORT.md`는 현재 `P0_ART_DIRECTION_CORRECTION.md`와 판단이 충돌한다. 역사 기록으로는 살릴 수 있으나 최신 기준으로 쓰면 위험. |
| 중복 성장/아키텍처 문서 | `RPG_GROWTH_*`, `META_PROGRESSION_ARCHITECTURE.md`, `RPG_ARCHITECTURE_PLAN.md` 사이 최신성 정리가 필요. |

## 5. 에셋 작업물

### Tracked PNG 수정

주의해서 검수해야 할 PNG:

- `assets/characters/player/player_survivor_48x48_4dir_walk.png`
- `assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png`
- `assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png`
- `assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png`
- `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png`
- `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png`
- `assets/ui/cards/ui_card_catalog_9slice.png`
- `assets/ui/hud/ui_hud_hp_charge_gauges.png`
- `assets/ui/icons/ui_card_icons_p0_32x32.png`
- `assets/ui/results/ui_result_panel_9slice.png`

판단:

- 기존 PNG를 덮어쓴 상태라 커밋 전 반드시 PMO 이미지 검수 필요.
- `P0_ART_DIRECTION_CORRECTION.md` 기준으로는 기존 리워크 PNG 전체를 상업용 최종 후보로 단정하면 안 된다.
- 커밋한다면 "Godot slicing/import 검증용 PNG 교체"와 "PMO 승인용 스타일 샘플"을 분리해야 한다.

### Style sample 후보

- `assets/style_samples/p0_direction/production_cleanup_v2/`
- `assets/style_samples/p0_direction/production_cleanup_v2_polish/`
- `assets/style_samples/p0_direction/hybrid_2d_cutout/`
- `assets/style_samples/p0_direction/hybrid_production_candidate/`
- `assets/style_samples/p0_direction/r01_environment_*`

판단:

- `production_cleanup_v2/_polish`: 32/40/48 pixel 셀 구조와 1x/2x/480 mock 확인용.
- `hybrid_production_candidate`: PMO 승인 후보에 가장 가까운 방향 샘플. 단 아직 애니메이션/atlas 준비 전.

## 6. 문서 작업물

지정 문서 분류:

| 문서 | 분류 |
| --- | --- |
| `CHARGE_WEAPON_ARCHETYPE_CHARACTER_STORYBOARD.md` | 미커밋이지만 살릴 것. 윤서/차징 아키타입 후속 구현 기준. PMO 검토 필요. |
| `CHARGE_WEAPON_CARD_INTERPRETATION_DESIGN.md` | 미커밋이지만 살릴 것. 카드 해석 기준. 세부 수치 튜닝과 분리. |
| `R01_COLLISION_NAVIGATION_ARCHITECTURE_SPEC.md` | 미커밋이지만 살릴 것. Codex 구현 작업으로 전환 가능. |
| `R01_LOCAL_MAP_LAYOUT_LOGIC_SPEC.md` | 미커밋이지만 살릴 것. R01 world-space 기준. PMO 검토 필요. |
| `VERTICAL_SLICE_0_2_VOLUME_FILL_PLAN.md` | 미커밋이지만 살릴 것. 이번 작업의 상위 계획으로 적합. |
| `P0_ART_DIRECTION_CORRECTION.md` | 이미 커밋됨. 최신 아트 기준으로 유지. |
| `R01_FINALE_ENDING_STRUCTURE_DESIGN.md` | 미커밋이지만 살릴 것. 결과/정산 문구 구현 작업으로 전환 가능. |

중복/폐기 후보:

- `ASSET_REWORK_REPORT.md`: 최신 기준과 충돌하는 과거 리워크 보고서. 살린다면 "historical report / superseded" 표시 필요.
- 성장 관련 여러 문서는 `META_PROGRESSION_ARCHITECTURE.md`를 최신 기준으로 정하고 나머지를 참조/폐기 분리해야 한다.

## 7. 제외 대상

일괄 커밋 금지:

- `.idea/`
- `*.import`
- `*.uid`
- `.godot/`가 새로 보이면 기본 제외

예외:

- Godot import 메타를 실제 asset 적용 커밋에 포함하기로 PMO가 결정한 경우만, 해당 PNG와 동일 커밋에 최소 파일만 포함한다.

## 8. 주의해서 검수해야 할 코드 변경

현재 tracked `.gd` 코드 diff는 없다.

다만 untracked `.uid`가 `scripts/*.gd.uid`, `input_model_sim.gd.uid` 등에 생겨 있다. 이는 코드 변경이 아니라 Godot UID 부산물로 보이며 이번 커밋에는 넣지 않는 것이 안전하다.

## 9. 커밋 분리 기준 제안

1. 문서 정리 커밋: 이번 산출물 7개 문서와 QA 이미지.
2. R01 기존 설계 문서 커밋: `R01_*_SPEC`, `VERTICAL_SLICE_0_2_VOLUME_FILL_PLAN.md`, finale 문서.
3. 스토리/성장 문서 커밋: `story/`, `META_PROGRESSION_ARCHITECTURE.md`, `RPG_GROWTH_*`.
4. PNG 교체 커밋: PMO가 승인한 경우에만 tracked PNG 10개를 별도 커밋.
5. Godot import 커밋: 실제 import 정책이 정해진 뒤 별도 또는 PNG 적용 커밋에 최소 포함.

## 10. PMO 판단 필요

- tracked PNG 10개를 살릴지, 되돌릴지, style sample로만 이동할지.
- `ASSET_REWORK_REPORT.md`를 폐기할지, superseded historical note로 살릴지.
- `RPG_ARCHITECTURE_PLAN.md`의 최신성 문구를 지금 커밋할지.
- untracked story/성장 문서 중 어떤 것을 0.2 기준으로 고정할지.
- `*.import` / `*.uid` 커밋 정책.
