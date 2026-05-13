# Atomic Ad Survivors P0 에셋 Import Notes

## 목적

이 문서는 Vertical Slice 0.1용 P0 PNG 후보의 위치, 셀 구조, 애니메이션 순서, pivot 기준, cleanup 필요 여부를 정리한다. 이번 작업에서는 Godot 코드/씬 적용을 하지 않았고, 다음 작업자가 import/slicing/스프라이트 교체를 바로 시작할 수 있도록 파일과 메모만 준비했다.

생성 방식:

- `ASSET_PRODUCTION_PLAN.md`의 B 톤 팔레트와 P0 프롬프트를 기준으로 절차적 픽셀아트 후보 PNG를 생성했다.
- 모든 PNG는 실제 사용할 권장 경로에 저장했다.
- 대부분 투명 배경이다. 키 아트 초안과 일부 타일 베이스는 불투명 배경을 사용한다.
- 현재 결과물은 최종 아트가 아니라 slicing/import 검증용 후보이며, 아티스트 cleanup을 전제로 한다.

## 생성 파일 목록

| 파일 | 용도 | 크기 | 셀 크기 | 행/열 구조 | 애니메이션 순서 | Pivot 기준 | Cleanup |
|---|---|---:|---:|---|---|---|---|
| `assets/characters/player/player_survivor_48x48_4dir_walk.png` | 플레이어 생존자 | 96x192 | 48x48 | 4행 x 2열 | row 0 down, row 1 left, row 2 right, row 3 up / col 0-1 walk frame | x 24, y 43 foot baseline | needs cleanup |
| `assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png` | tier1 빌보드 종양 | 64x32 | 32x32 | 1행 x 2열 | col 0-1 idle wobble | x 16, y 28 foot/base | needs cleanup |
| `assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png` | tier1 가전 좀비 | 64x32 | 32x32 | 1행 x 2열 | col 0-1 idle wobble | x 16, y 28 foot/base | needs cleanup |
| `assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png` | tier1 쿠폰/광고 슬라임 | 64x32 | 32x32 | 1행 x 2열 | col 0-1 idle wobble | x 16, y 28 foot/base | needs cleanup |
| `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png` | tier2 감염된 1950s 주부 | 80x40 | 40x40 | 1행 x 2열 | col 0-1 walk/idle | x 20, y 37 foot baseline | needs cleanup |
| `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png` | 180초 이벤트용 대형 광고 마스코트 | 160x80 | 80x80 | 1행 x 2열 | col 0-1 idle | x 40, y 74 foot/base | needs cleanup |
| `assets/tilesets/suburb/tiles_suburb_ground_16x16.png` | 교외 바닥/보도 타일셋 | 128x64 | 16x16 | 4행 x 8열 | no animation | TileMap cell origin | needs cleanup |
| `assets/ui/hud/ui_hud_hp_charge_gauges.png` | HP/차징 HUD 게이지 프레임 | 160x64 | mixed | 3 gauge rows | row 0 HP, row 1 charge/cooldown, row 2 ready/open | Control top-left | needs cleanup |
| `assets/ui/cards/ui_card_catalog_9slice.png` | 레벨업 카드 UI | 372x106 | 124x106 | 1행 x 3열 | col 0 normal, col 1 selected/warning, col 2 disabled | Control top-left | needs cleanup |
| `assets/ui/icons/ui_card_icons_p0_32x32.png` | 카드 아이콘 기본 9종 | 288x32 | 32x32 | 1행 x 9열 | auto_damage, auto_range, charge_damage, charge_targets, charge_cooldown, move_speed, max_hp, heal_now, xp_gain | icon center x 16, y 16 | needs cleanup |
| `assets/ui/results/ui_result_panel_9slice.png` | 결과 화면 패널 | 244x174 | 244x174 | single panel | no animation | Control top-left | needs cleanup |
| `assets/vfx/vfx_particles_atomic_ad_atlas.png` | 차징/피격/처치/경고링 VFX atlas | 128x128 | 8/16/32 mixed | atlas | no animation; frame groups by rows | particle center per cell | usable prototype, cleanup recommended |
| `assets/marketing/key_art_bright_atomic_capsule_draft.png` | 키 아트/capsule 초안 | 480x270 | n/a | single image | no animation | n/a | draft only |

## 에셋별 적용 메모

### 플레이어

- 파일: `assets/characters/player/player_survivor_48x48_4dir_walk.png`
- 방향 순서: down, left, right, up.
- 각 방향은 2프레임 보행이다.
- 다음 Godot 적용 시 `AnimatedSprite2D` 또는 `Sprite2D + AtlasTexture`로 direction별 animation을 나누면 된다.
- Pivot은 셀 중앙이 아니라 발 위치 기준을 권장한다. Sprite offset 또는 parent node 위치를 조정해 foot baseline이 gameplay position과 맞게 한다.
- Cleanup: 팔/다리 포즈와 헬멧 실루엣을 더 부드럽게 정리하고, 좌/우 방향의 얼굴 read를 개선하면 좋다.

### Tier1 적

- 파일:
  - `assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png`
  - `assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png`
  - `assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png`
- 모두 32x32 셀 2프레임 idle이다.
- 현재 `enemy_controller.gd`는 적 종류 구분 없이 `elite` bool만 쓰므로, 적용 작업에서는 랜덤 tier1 sprite 선택 또는 enemy `kind` 필드 추가가 필요할 수 있다.
- Collision은 sprite 크기에 맞추지 말고 기존 tier1 radius 8 기준을 우선 유지한다.
- Cleanup: 빌보드/가전/슬라임의 실루엣은 구분되지만 최종 아트로 쓰려면 광고 카피 영역, 균열, slime highlight를 수작업 보강하는 것이 좋다.

### Tier2 엘리트와 대형 마스코트

- 파일:
  - `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png`
  - `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png`
- 40x40 주부는 일반 elite 교체용이다.
- 80x80 마스코트는 180초 중간 이벤트 notice와 함께 등장시키기 좋은 후보지만, 현재 코드상 별도 대형 적 타입은 아직 없다.
- 적용 시 기존 elite radius 12는 40x40 엘리트에는 유지 가능하다. 80x80 마스코트는 별도 hitbox/radius를 설정해야 한다.
- Cleanup: 마스코트는 표정/깨진 눈/배지 read를 더 크게 정리해야 100마리 이상 적이 있는 화면에서도 잘 보인다.

### 교외 타일셋

- 파일: `assets/tilesets/suburb/tiles_suburb_ground_16x16.png`
- 구조: 4행 x 8열, 총 32타일.
- 행별 의도:
  - row 0: sage grass variants.
  - row 1: beige sidewalk/curb variants.
  - row 2: cream paper/litter/slime overlay 후보.
  - row 3: soft gray driveway/road variants.
- 적용 시 `TileSet` tile size는 16x16으로 설정한다.
- Cleanup: 실제 TileMap용으로 쓰려면 seamless edge, overlay alpha, curb autotile 패턴을 별도로 정리해야 한다.

### HUD 게이지

- 파일: `assets/ui/hud/ui_hud_hp_charge_gauges.png`
- 구조:
  - row 0: HP red fill sample.
  - row 1: charge cooldown green fill sample.
  - row 2: ready/open yellow fill sample.
- 현재 파일은 프레임과 fill이 한 장에 들어간 후보이므로, 적용 시에는 프레임/캡/fill을 atlas region으로 잘라 쓰거나 별도 파일로 분리하는 것이 좋다.
- Godot에서는 fill 영역을 crop/scale하지 말고 width clipping 방식으로 조절하는 것을 권장한다.
- Cleanup: 실제 UI 적용 전 fill 없는 빈 프레임 버전과 fill strip을 분리하면 좋다.

### 레벨업 카드 UI

- 파일: `assets/ui/cards/ui_card_catalog_9slice.png`
- 구조: 1행 x 3열, 각 124x106.
- 순서: normal, selected/warning, disabled.
- 9-slice 권장 margin: left 8, top 8, right 8, bottom 8.
- 텍스트는 이미지에 넣지 않고 Godot Label로 얹는다.
- Cleanup: 모서리와 테두리는 9-slice에 맞지만, 최종 카드에는 더 명확한 title/icon/body 구역 정리가 필요하다.

### 카드 아이콘

- 파일: `assets/ui/icons/ui_card_icons_p0_32x32.png`
- 구조: 1행 x 9열, 각 32x32.
- 순서:
  1. `auto_damage`
  2. `auto_range`
  3. `charge_damage`
  4. `charge_targets`
  5. `charge_cooldown`
  6. `move_speed`
  7. `max_hp`
  8. `heal_now`
  9. `xp_gain`
- Cleanup: 아이콘 의미는 잡히지만, 최종 UI에서는 각 카드명과 더 직접적으로 연결되도록 별도 보정이 필요하다.

### 결과 화면 패널

- 파일: `assets/ui/results/ui_result_panel_9slice.png`
- 기준 크기: 현재 `hud_controller.gd`의 result panel 크기와 같은 244x174.
- 9-slice 권장 margin: left 10, top 10, right 10, bottom 10.
- 내부 텍스트 영역은 Godot Label을 유지한다.
- Cleanup: 한국어 통계 텍스트의 실제 줄 수를 올려보고 장식이 겹치지 않는지 확인해야 한다.

### VFX Atlas

- 파일: `assets/vfx/vfx_particles_atomic_ad_atlas.png`
- 구조:
  - y 0-15: star particles.
  - y 16-35: slime/drop particles.
  - y 36-55: ray streaks.
  - y 56-91: burst spokes.
  - y 92-127: ring segments/miss ring 후보.
- 적용 시 `effects_controller.gd`의 현재 draw_circle/draw_line/draw_star 기반 particle을 atlas sprite 또는 `GPUParticles2D` texture로 대체할 수 있다.
- Cleanup: atlas map을 JSON/resource로 분리할지, 코드 상수 region으로 둘지 결정해야 한다.

### 키 아트 초안

- 파일: `assets/marketing/key_art_bright_atomic_capsule_draft.png`
- 480x270, 16:9 draft.
- 실제 store capsule이 아니라 톤 공유용 초안이다.
- Cleanup: 로고 영역, 주인공 포즈, 적 배치, readable focal point를 전문 일러스트로 다시 잡는 것이 필요하다.

## Godot 적용 공통 주의점

- Import filter는 nearest로 설정한다.
- Pixel snap과 integer viewport scale을 유지한다.
- 스프라이트 pivot은 visual center가 아니라 발 위치 기준으로 맞춘다.
- Collision/hitbox는 PNG 크기와 분리하고, 기존 gameplay radius를 먼저 유지한다.
- UI는 이미지에 텍스트를 굽지 말고 기존 Label/Button 텍스트를 살린다.
- 카드와 결과 패널은 9-slice로 써야 크기 조절 시 테두리가 깨지지 않는다.
- VFX atlas는 tint 가능한 흰색/노란색/그린 계열을 섞어 사용하고, 파티클 수가 많을 때 draw call 증가를 확인한다.

## 다음 작업 추천 순서

1. 플레이어 시트를 Godot에 import하고 nearest/filter/pivot/slicing이 맞는지 확인한다.
2. tier1 적 2종을 랜덤 sprite로 붙여 군집 상황에서 시인성을 확인한다.
3. 40x40 elite를 기존 elite bool에 매핑한다.
4. HUD와 카드 UI는 프레임/fill/텍스트 레이어 분리 후 적용한다.
5. VFX atlas는 차징 burst부터 한 종류씩 교체해 성능과 느낌을 확인한다.
