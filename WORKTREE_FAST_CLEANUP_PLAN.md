# Worktree Fast Cleanup Plan

작성일: 2026-05-19
목적: 0.2 개발 속도 회복을 위해 현재 dirty/untracked 항목을 커밋/보류/폐기 후보로 분류한다.
주의: 이 문서는 분류만 한다. 삭제, 되돌리기, `git clean`, `git reset`, import 정리, 커밋을 실행하지 않는다.

## 1. 결론

0.2 속도 회복을 위해 지금은 세 가지를 분리한다.

```text
1. 바로 커밋할 작은 기준 문서
2. PMO 검수 전까지 보류할 에셋/대형 설계
3. 삭제 후보로 표시만 해둘 Godot/IDE/import 부산물
```

R01은 전체 5구역을 한 번에 완성하지 않는다. 첫 실제 플레이 구간은 `침묵 가장자리 -> 분양 주택 루프`로 제한한다. 모델하우스 결절, 배수로 침묵 주머니, 가짜 귀환로는 0.2 첫 구현에서 방향 암시/debug anchor/확장 marker만 유지한다.

## 2. Action 용어

| action | 의미 |
| --- | --- |
| `keep_commit` | 다음 정리 커밋 후보. 0.2 루프/속도 회복에 직접 도움 |
| `keep_uncommitted` | 당장 삭제하지 않지만 커밋 순서 뒤로 미룸 |
| `archive_later` | 보존 가치는 있으나 현재 작업트리에서 빼거나 별도 archive 후보 |
| `delete_candidate` | 삭제 후보. 이번 작업에서는 삭제하지 않음 |
| `ignore_candidate` | `.gitignore` 또는 local ignore 후보 |
| `needs_user_decision` | PMO/사용자 판단 없이는 커밋/폐기 금지 |

## 3. A. 즉시 커밋 후보

| path | action | 이유 |
| --- | --- | --- |
| `WORKTREE_FAST_CLEANUP_PLAN.md` | `keep_commit` | 현재 작업트리 정리 기준. 속도 회복에 직접 필요 |
| `R01_FIRST_PLAYABLE_STRIP_PLAN.md` | `keep_commit` | R01 0.2 구현 범위를 첫 playable strip으로 줄이는 기준 |
| `OUTPOST_WORLD_SPACE_DESIGN.md` | `keep_commit` | 보급소를 메뉴가 아닌 귀환 장소로 고정한 최신 설계 |
| `OUTPOST_BLOCKOUT_SCREEN_QA_REPORT.md` | `keep_commit` | 보급소 blockout의 문제점과 수정 범위를 작게 고정 |
| `R01_COLLISION_NAVIGATION_ARCHITECTURE_SPEC.md` | `keep_commit` | strip collision/pathing 작업에 바로 필요한 기준 |
| `VERTICAL_SLICE_0_2_VOLUME_FILL_PLAN.md` | `keep_commit` | 0.2 루프의 빈칸을 메우는 작업 기준 |
| `GAME_CURRENT_STATE_AUDIT.md` | `keep_commit` | 현재 구현 상태 파악용. 다음 작업자가 재탐색하는 시간을 줄임 |
| `GAME_ARCHITECTURE_MAP.md` | `keep_commit` | 주요 코드 책임 경계 확인용. 빠른 구현에 도움 |
| `MAIN_GD_RESPONSIBILITY_REPORT.md` | `keep_commit` | `main.gd` 과밀 위험을 인지하고 작은 작업으로 나누는 기준 |
| `NEXT_TASK_BACKLOG.md` | `keep_commit` | 다음 작업 후보를 모아두되, strip 기준으로 재정렬 필요 |

메모:

- 위 목록은 "커밋해도 0.2 속도를 올리는 문서" 후보이다.
- 커밋 시에도 한 번에 모두 넣기보다 `cleanup/strip docs`, `architecture/audit docs`, `outpost QA docs`로 나누는 편이 안전하다.

## 4. B. 보류 후보

| path | action | 이유 |
| --- | --- | --- |
| `R01_LOCAL_MAP_LAYOUT_LOGIC_SPEC.md` | `keep_uncommitted` | 장기 R01 5구역 기준으로 유용하지만, 지금은 strip 계획이 우선 |
| `R01_SUBURB_LOCAL_RESPONSE_DESIGN.md` | `keep_uncommitted` | 지역 반응 설계는 유용하나 0.2 구현 범위가 커질 수 있음 |
| `R01_FINALE_ENDING_STRUCTURE_DESIGN.md` | `keep_uncommitted` | 보스 이후/엔딩 구조라 첫 strip 구현 뒤로 미룸 |
| `META_PROGRESSION_ARCHITECTURE.md` | `keep_uncommitted` | 성장 기준서 후보. 최신성 확인 후 별도 커밋 |
| `RPG_GROWTH_ARCHITECTURE_V1.md` | `keep_uncommitted` | 0.2 성장 구조 기준이지만 `META_*`와 중복 검토 필요 |
| `RPG_GROWTH_READYNESS_REPORT.md` | `keep_uncommitted` | 구현 전 readiness 문서. 최신 기준 확인 필요 |
| `RPG_GROWTH_V1_IMPLEMENTATION_CONFLICT_AUDIT.md` | `keep_uncommitted` | 충돌 감사 문서. 최신 문서와 함께 묶어야 함 |
| `CHARGE_WEAPON_ARCHETYPE_CHARACTER_STORYBOARD.md` | `keep_uncommitted` | 차징/캐릭터 확장용. 현재 strip 작업에는 직접 필요 낮음 |
| `CHARGE_WEAPON_CARD_INTERPRETATION_DESIGN.md` | `keep_uncommitted` | 카드 해석 기준. 0.2 strip 이후 차징 polish 때 사용 |
| `SUPPLY_UPGRADE_PLAYTEST_CHECKLIST.md` | `keep_uncommitted` | 보급소/업글 QA용. 보급소 readability fix 뒤에 사용 |
| `ASSET_REWORK_REPORT.md` | `archive_later` | 과거 리워크 기록. 최신 P0 기준과 충돌 가능 |
| `assets/style_samples/` | `archive_later` | 스타일 후보/샘플 전체. 선별 전 대량 커밋 금지 |
| `assets/marketing/p0_rework_contact_sheet_1x2x3x.png` | `archive_later` | 검수용 이미지 후보. 런타임 필요 없음 |
| `assets/marketing/p0_rework_visibility_mock_480x270.png` | `archive_later` | 검수용 mock. 즉시 게임 적용 대상 아님 |
| `assets/marketing/key_art_bright_atomic_capsule_draft.png.import` | `delete_candidate` | import 부산물. 원본 key art 자체도 현재 status에는 import만 있음 |

## 5. C. 폐기 후보

이번 작업에서는 삭제하지 않는다. 아래는 삭제 후보 표시만 한다.

| path/group | action | 이유 |
| --- | --- | --- |
| `.idea/` | `ignore_candidate` | IDE 로컬 설정. repo 커밋 비권장 |
| `*.uid` 전체 | `delete_candidate` | Godot UID 부산물. 현재 정책상 커밋 금지 후보 |
| `*.import` 전체 | `delete_candidate` | Godot import 부산물. 실제 asset 적용 커밋 전에는 대량 커밋 금지 |
| `assets/**.png.import` | `delete_candidate` | PNG import 부산물. PNG 승인 전 커밋 금지 |
| `assets/reference_bright_dystopian/*.png.import` | `delete_candidate` | reference import 부산물. 원본 reference와 분리 |
| `generated_assets/01_atomic_steampunk/*.png.import` | `delete_candidate` | 스팀펑크 방향. 현재 P0 기준과 충돌 |
| `generated_assets/02_bright_dystopian_atomic/*.png.import` | `delete_candidate` | reference import 부산물. 원본 PNG는 별도 판단 |
| `generated_assets/03_cute_dystopian_atomic/*.png.import` | `delete_candidate` | 치비/어린 방향과 충돌 가능. import는 폐기 후보 |
| `qa/screenshots/r01/*.png.import` | `delete_candidate` | QA 이미지 import 부산물. QA PNG 자체와 분리 |
| `scripts/*.gd.uid` | `delete_candidate` | 코드 파일이 아니라 editor UID 부산물 |
| `input_model_sim.gd.uid` | `delete_candidate` | 시뮬 파일 UID 부산물 |

## 6. 사용자 판단 필요 항목

| path | action | 판단 질문 |
| --- | --- | --- |
| `project.godot` | `needs_user_decision` | Godot 4.6 editor rewrite로 보임. `stretch/aspect`, `scale_mode`, `msaa_2d` 제거가 의도인지 확인 필요 |
| `README_GAME.md` | `needs_user_decision` | `story/` bible 위치 문구 추가. story 폴더 커밋 정책과 함께 판단 |
| `RPG_ARCHITECTURE_PLAN.md` | `needs_user_decision` | `META_PROGRESSION_ARCHITECTURE.md`, `story/` 참조 추가. 상위 기준 최신화로 커밋할지 확인 |
| `assets/characters/player/player_survivor_48x48_4dir_walk.png` | `needs_user_decision` | tracked PNG 덮어쓰기. PMO 이미지 검수 전 커밋 금지 |
| `assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png` | `needs_user_decision` | tracked PNG 덮어쓰기. pilot asset인지 실패 후보인지 확인 필요 |
| `assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png` | `needs_user_decision` | tracked PNG 덮어쓰기. 현재 strip 대상이 아님 |
| `assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png` | `needs_user_decision` | tracked PNG 덮어쓰기. 쿠폰 역할 후보라 검수 필요 |
| `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png` | `needs_user_decision` | tracked PNG 덮어쓰기. 첫 strip에는 후순위 |
| `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png` | `needs_user_decision` | tracked PNG 덮어쓰기. 첫 strip에는 후순위 |
| `assets/ui/cards/ui_card_catalog_9slice.png` | `needs_user_decision` | tracked UI PNG 교체. 현재 strip 작업과 분리 |
| `assets/ui/hud/ui_hud_hp_charge_gauges.png` | `needs_user_decision` | tracked UI PNG 교체. HUD 가독성 검수 필요 |
| `assets/ui/icons/ui_card_icons_p0_32x32.png` | `needs_user_decision` | tracked UI PNG 교체. 카드 UI 작업과 분리 |
| `assets/ui/results/ui_result_panel_9slice.png` | `needs_user_decision` | tracked UI PNG 교체. 보급소/result QA 뒤 판단 |
| `assets/marketing/p0_rework_contact_sheet_1x2x3x.png` | `needs_user_decision` | 보존할 QA sheet인지 archive로 뺄지 판단 |
| `assets/marketing/p0_rework_visibility_mock_480x270.png` | `needs_user_decision` | 보존할 visibility mock인지 archive로 뺄지 판단 |

## 7. 반드시 손대지 말 것

| path/group | action | 이유 |
| --- | --- | --- |
| `story/` | `needs_user_decision` | 사용자가 따로 작업 중일 수 있음. 이번 cleanup에서 수정/삭제/분류 커밋 금지 |
| 확신 없는 PNG 전체 | `needs_user_decision` | 기존 PNG 덮어쓰기/삭제 금지 |
| unrelated dirty 문서 | `keep_uncommitted` | 이번 strip 범위와 무관하면 정리 커밋에 섞지 않음 |
| `assets/style_samples/` 원본 PNG | `archive_later` | 샘플 선별 전 대량 커밋/삭제 금지 |

## 8. 추천 커밋 순서

1. `cleanup + first strip docs`: `WORKTREE_FAST_CLEANUP_PLAN.md`, `R01_FIRST_PLAYABLE_STRIP_PLAN.md`.
2. `outpost design docs`: `OUTPOST_WORLD_SPACE_DESIGN.md`, `OUTPOST_BLOCKOUT_SCREEN_QA_REPORT.md`.
3. `R01 implementation references`: 필요한 경우 `R01_COLLISION_NAVIGATION_ARCHITECTURE_SPEC.md`만 먼저.
4. `architecture audit docs`: `GAME_CURRENT_STATE_AUDIT.md`, `GAME_ARCHITECTURE_MAP.md`, `MAIN_GD_RESPONSIBILITY_REPORT.md`.
5. PNG 적용 커밋은 PMO 이미지 검수 후 별도.
6. `.import`/`.uid`는 정책 확정 전 커밋하지 않는다.

## 9. 다음 Codex 작업 5개

1. R01 playable strip blockout 적용.
2. Strip collision/pathing probe.
3. 윤서/쿠폰/우편함 3개 sprite 적용 pilot.
4. Strip enemy density visual QA.
5. Strip audio/ambient cue 연결.
