# Atomic Ad Survivors 에셋 제작 계획

> 현재 문서 상태: 레거시 제작 계획.
>
> 이 문서의 `1950s atomic suburb`, `파스텔 교외`, `1950s 주부`, `플라밍고`, `BBQ 그릴`, `미국식 단독주택/잔디` 중심 에셋 지시는 최신 R01/P0 기준에서 폐기한다.
> 최신 기준은 `P0_CAMPAIGN_VISUAL_IDENTITY_LOCK.md`, `R01_AD_CAMPAIGN_ENVIRONMENT_RULES.md`, `P0_ART_REWORK_DECISION.md`, `docs/world/E01_ADMIN_CITY_DONG_LOCATION_LOCK_V0_1.md`를 우선한다.
>
> 최신 판정: R01은 덜떨어진 미국 광고가 아니라, 한국 서부 수도권 신도시/분양/모델하우스 생활권을 고도화 스마일홈 광고 AI가 행복입주 보증 캠페인으로 재분류한 지역이다.

## 1. 에셋 제작 목표

이 문서는 `Atomic Ad Survivors`의 1차 목표 빌드인 `Vertical Slice 0.1`에서 코드 드로잉을 실제 스프라이트와 UI 에셋으로 교체하기 위한 제작 문서다. 다음 작업자가 바로 이미지 생성, 정리, Godot import, 스프라이트 적용을 시작할 수 있도록 최소 에셋 세트, 파일명, 폴더 구조, 생성 프롬프트, 적용 규칙을 한곳에 묶는다.

이번 문서의 범위는 "5분 플레이 가능한 Vertical Slice 0.1에 가장 먼저 필요한 에셋"이다. 최종 아트 전체 발주서가 아니며, 상점/로비/메타 진행/스토리 컷신/마케팅 완성본은 뒤로 미룬다.

현재 프로젝트는 `scripts/main.gd`, `scripts/enemy_controller.gd`, `scripts/effects_controller.gd`, `scripts/hud_controller.gd`, `scripts/wave_director.gd`, `scripts/level_up_cards.gd` 기준으로 플레이어, 잡몹, 엘리트, 차징 VFX, HUD, 레벨업 카드, 결과 화면이 코드 드로잉과 Godot 기본 UI로 작동한다. 따라서 P0 에셋은 이 표면을 먼저 갈아끼우는 순서로 제작한다.

꼭 필요한 것:

- 플레이어 48x48 4방향 2프레임 보행 시트
- 잡몹 32x32 2-3종과 엘리트 40x40 1-2종
- 3분 중간 이벤트용 대형 광고 마스코트 64-80px 1종
- 16x16 교외 바닥/보도 타일 최소 세트
- HP/차징 게이지, 레벨업 카드, 결과 화면 패널
- 차징/피격/처치 파티클 atlas

나중에 미룰 것:

- 최종 보스 전체 패턴용 대형 시트
- 로비, 상점, 메타 진행 UI
- 컷신, 대사창, 스토리 일러스트
- 완성형 capsule art, 스토어 이미지, 배너 변형

## 2. 아트 톤 요약

확정 톤은 `ART_DIRECTION_SPEC.md`의 `B - bright dystopian atomic`이다. 핵심 이미지는 1950s 광고지, 파스텔 교외, 웃는 기업 마스코트, 방사능 그린 슬라임, 레트로 카탈로그 UI다.

핵심 팔레트:

| 용도 | HEX | 이름 |
|---|---:|---|
| UI 종이/카드 | `#F5E9D0` | 광고 종이 |
| 바닥/보도 | `#E8C8A0` | 파스텔 베이지 |
| 의상/하늘/차가운 면 | `#C8DCD8` | 민트 페이드 |
| 지붕/엘리트/경고 보조 | `#F2B8B0` | 코랄 핑크 |
| 광고 강조/창문 | `#FAD89C` | 레몬 옐로우 |
| 잔디/우편함 | `#A8C8B8` | 세이지 그린 |
| 따뜻한 외곽선/텍스트 | `#7A4A3A` | 코코아 라이너 |
| 강한 외곽선 | `#2A2A28` | 잉크 블랙 |
| 방사능/차징 코어 | `#9FFF5C` | 유독 그린 |
| 데미지/광고 경고 | `#FF4D5C` | 네온 핑크-레드 |
| 히트 플래시/노치 | `#FFE93F` | 비타민 옐로우 |

시각 규칙:

- 캐릭터: 3등신, 단순한 머리/몸/다리 실루엣, 1px 잉크 외곽선, 48x48 캔버스 하단 2px 그림자 공간 유지.
- 적: 활짝 웃는 얼굴과 광고 카피를 유지하되, 균열과 유독 그린 슬라임으로 위협을 표시한다.
- UI: 종이 카탈로그, TV 광고 프레임, 제품 쿠폰, 시리얼 경품 카드처럼 보이게 만든다.
- 이펙트: 형광 그린, 네온 핑크-레드, 비타민 옐로우 3색 폭죽을 사용한다. 별, 원, 짧은 광선, 슬라임 방울 형태가 좋다.
- 배경: 평면 파스텔 교외. 전투 시인성을 위해 배경은 낮은 대비, 캐릭터와 VFX는 높은 대비를 유지한다.

피해야 할 것:

- 어두운 스팀펑크, 황동, 녹슨 파이프, 가스마스크 중심 톤으로 회귀하지 말 것.
- 지나친 공포, 고어, 피, 리얼한 좀비 부패 표현 금지.
- 단색 보라/갈색/다크 블루 테마 금지. B 톤은 밝은 파스텔 패치워크가 기본이다.
- 고해상도 페인터리 질감, 흐린 안티앨리어싱, 반투명 그라데이션 과다 사용 금지.
- 적을 너무 무섭게만 만들지 말 것. "광고처럼 웃지만 망가져 있음"이 핵심이다.
- 배경 디테일을 과하게 넣어 480x270 전투 화면에서 탄/적/VFX를 묻히게 하지 말 것.

## 3. 우선순위별 에셋 목록

### P0: 바로 필요한 최소 세트

| 유형 | 권장 크기 | 수량 | 목적 | 교체 우선순위 |
|---|---:|---:|---|---:|
| 플레이어 생존자 | 48x48, 4방향 x 2프레임 | 1시트 | 현재 원형 플레이어 코드 드로잉 교체 | 1 |
| 잡몹 빌보드 종양 | 32x32, idle 2프레임 | 1종 | 기본 적 다수 출현용 | 2 |
| 잡몹 가전 좀비 | 32x32, idle 2프레임 | 1종 | 기본 적 변종 | 3 |
| 잡몹 TV 광고 유령/쿠폰 슬라임 | 32x32, idle 2프레임 | 1종 | 웨이브 반복 피로 완화 | 4 |
| 엘리트 감염된 1950s 주부 | 40x40, idle/walk 2프레임 | 1종 | 엘리트 시인성 | 5 |
| 엘리트/중간 이벤트 마스코트 | 64-80px, idle 2프레임 | 1종 | 180초 "대형 광고 마스코트 진입" 이벤트 | 6 |
| 교외 바닥/보도 타일 | 16x16 | 최소 24타일 | 현재 격자 배경 교체 | 7 |
| HUD HP/차징 게이지 프레임 | 112x9, 112x8 기준 확장 가능 | 1세트 | 현재 ColorRect 게이지를 광고 UI로 교체 | 8 |
| 레벨업 카드 배경 | 124x106 카드, 9-slice | 1세트 | 3택 카드 UI의 제품 카탈로그화 | 9 |
| 카드 아이콘 기본 세트 | 32x32 또는 48x48 | 9개 | 현재 카드 9종(`level_up_cards.gd`) 대응 | 10 |
| 결과 화면 패널 | 244x174 기준 9-slice | 1세트 | 승리/게임오버 결과 화면 정리 | 11 |
| 파티클/VFX atlas | 128x128 또는 256x256 | 1장 | 차징, 피격, 처치, 경고링 텍스처화 | 12 |

P0 카드 아이콘 9종은 현재 카드 ID 기준으로 먼저 만든다: `auto_damage`, `auto_range`, `charge_damage`, `charge_targets`, `charge_cooldown`, `move_speed`, `max_hp`, `heal_now`, `xp_gain`.

### P1: 다음 단계

- 보스 후보 80-128px: Cheerful Corporate Mascot Robot, Sad Corporate Mascot, Mascot Statue 중 1-2종.
- 추가 적 변종: 광고 카피만 바뀐 빌보드, 냉장고/토스터/TV 가전 좀비, 슬라임 쿠폰 더미.
- 파괴 가능한 오브젝트: 우편함, 플라밍고, BBQ 그릴, 잔디 의자, 광고 표지판.
- 배경 소품: 1950s 자동차, 주택 정면 일부, 잔디 장식, 깨진 가로등.
- 카드 아이콘 확장: 희귀도 프레임, 업그레이드 단계 배지, 선택/hover 상태.
- 마우스/터치 UI 아이콘: 차징 버튼, 포인터 조준 표시, 재시작 버튼 아이콘.

### P2: 나중

- 메타 진행 UI: 영구 성장, 컬렉션, 도감.
- 상점/로비: 시작 화면, 캐릭터 선택, 빌드 기록.
- 스토리 컷신: 광고 내레이션, 기업 마스코트 대화, 엔딩 패널.
- 배너/상점 페이지 이미지: capsule art 완성본, 스크린샷 프레임, SNS 카드.

## 4. 파일명/폴더 구조 제안

권장 구조:

```text
assets/
  characters/
    player/
    enemies/
      tier1/
      tier2/
      bosses/
  tilesets/
    suburb/
  ui/
    cards/
    hud/
    results/
    icons/
  vfx/
  marketing/
```

P0 파일명 예:

```text
assets/characters/player/player_survivor_48x48_4dir_walk.png
assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png
assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png
assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png
assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png
assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png
assets/tilesets/suburb/tiles_suburb_ground_16x16.png
assets/ui/hud/ui_hud_hp_charge_gauges.png
assets/ui/cards/ui_card_catalog_9slice.png
assets/ui/icons/ui_card_icons_p0_32x32.png
assets/ui/results/ui_result_panel_9slice.png
assets/vfx/vfx_particles_atomic_ad_atlas.png
assets/marketing/key_art_bright_atomic_capsule_draft.png
```

파일명 규칙:

- `type_subject_size_variant.png` 순서로 작성한다.
- 크기는 실제 셀 크기를 파일명에 넣는다.
- 애니메이션 시트는 `4dir_walk`, `idle`, `walk`, `atlas`를 명시한다.
- Godot에서 slicing할 때 헷갈리지 않도록 한 파일에는 같은 셀 크기만 넣는다.
- 광고 카피 텍스트가 들어간 적은 가능하면 텍스트 없는 베이스와 카피 레이어 버전을 따로 보관한다.

## 5. 이미지 생성 프롬프트

아래 프롬프트는 이미지 생성 도구에 바로 복사해서 사용할 수 있는 초안이다. 생성 후 픽셀 정리, 팔레트 정리, 투명 배경 확인, 셀 정렬은 별도 작업으로 처리한다.

### 5.1 플레이어 스프라이트 시트

목적: 현재 원형 플레이어 코드 드로잉을 교체할 48x48 4방향 2프레임 보행 시트.

Prompt:

```text
Pixel art sprite sheet for a top-down 2D survivor game, 1950s bright dystopian atomic suburb theme. A small 3-head-tall survivor in a pastel mint safety jumpsuit and round space helmet, cheerful but determined expression, simple black dot eyes, cocoa brown 1px outline, subtle off-white porcelain face, tiny atomic lunchbox or badge. 4 directions: down, left, right, up. 2 walking frames per direction, arranged in a clean grid. Bright pastel 1950s advertisement style, readable at 48x48 pixels, flat lighting, limited palette: ad paper cream, mint fade, coral pink, lemon yellow, sage green, cocoa outline, ink black, toxic green accent. Transparent background.
```

Negative prompt:

```text
dark steampunk, brass pipes, gas mask, horror gore, realistic zombie, painterly rendering, smooth gradients, blurry anti-aliasing, oversized weapon, complex tiny details, purple theme, brown monochrome, non-pixel art, isometric view, side view, text labels
```

Output requirements:

- PNG with alpha.
- Cell size 48x48.
- 4 rows x 2 columns or 2 rows x 4 columns is acceptable, but document the order.
- Feet end 2px above the bottom of each cell.
- Pivot target: visual center x, foot baseline y around 42-44.

Notes for cleanup:

- Enforce 1px outline with `#2A2A28` or `#7A4A3A`.
- Remove stray semi-transparent pixels.
- If left/right are mirrored, keep both cells anyway for Godot animation consistency.

### 5.2 잡몹 32x32 빌보드/가전 좀비

목적: 기본 웨이브에 반복 출현할 32x32 tier1 적 2-3종.

Prompt:

```text
Pixel art sprite sheet, 32x32 enemies for a top-down survivor game, bright dystopian 1950s atomic advertising suburb. Create three small enemy designs: 1) a smiling billboard tumor with cracked ad sign saying simple fake ad shapes, toxic green slime leaking from one crack, 2) a cute haunted toaster or TV appliance zombie with tiny legs and forced smile, 3) a coupon slime blob made of pastel paper scraps and radioactive green ooze. Each enemy has 2 idle wobble frames. Round cheerful silhouettes corrupted by cracks and slime. 1px ink outline, pastel cream, mint, coral, lemon, sage, cocoa, toxic green accents. Transparent background, clean grid, readable at 32x32.
```

Negative prompt:

```text
realistic gore, blood, scary horror face, dark industrial steampunk, rusty brass, high detail texture, unreadable tiny text, photorealism, vector art, blurred edges, monochrome palette, large boss scale
```

Output requirements:

- PNG with alpha.
- Cell size 32x32.
- 3 enemy types x 2 frames, arranged in a grid.
- Each enemy should fit inside 28x28 visible pixels with shadow space reserved.

Notes for cleanup:

- Replace generated text with simple blocks or remove it if unreadable.
- Keep toxic green slime small but visible.
- Make each silhouette distinct at 480x270 zoom.

### 5.3 엘리트 40x40 감염된 1950s 주부 또는 마스코트

목적: 현재 `elite` 원형 적을 교체할 40x40 tier2 적.

Prompt:

```text
Pixel art 40x40 elite enemy sprite for a top-down 2D survivor game, bright dystopian atomic 1950s suburb. Infected 1950s housewife mascot character, pastel dress, pearl necklace shape, fixed cheerful advertisement smile, one cracked porcelain cheek, toxic green slime leaking from a shopping bag or apron pocket. Cute first, threatening second. 2-frame walk or idle animation, front-facing top-down readable stance. 1px cocoa/ink outline, flat pastel colors, strong silhouette, transparent background.
```

Negative prompt:

```text
bloody zombie, horror corpse, realistic human anatomy, pinup style, dark noir, steampunk goggles, brass machinery, excessive wrinkles, painterly shading, blurry pixels, brown-only palette
```

Output requirements:

- PNG with alpha.
- Cell size 40x40.
- 2 frames minimum.
- Visible body should fit inside 36x38 pixels.
- Foot baseline at y 36-38.

Notes for cleanup:

- Face must remain readable and smiling.
- Add 2-3 cracks maximum; do not over-detail.
- Ensure it is larger and clearer than 32x32 tier1 enemies.

### 5.4 80x80 대형 광고 마스코트

목적: 180초 중간 이벤트와 향후 보스 후보에 사용할 대형 존재감 에셋.

Prompt:

```text
Pixel art 80x80 large elite mascot for a top-down survivor game, bright dystopian atomic 1950s advertisement theme. A cheerful corporate mascot robot, round porcelain face, huge forced smile, one cracked eye lens, pastel mint and coral metal body, lemon yellow ad badge, toxic green slime leaking from seams, friendly waving pose that feels wrong. Designed as a mid-event mini boss, readable at 80x80, 1px ink outline plus small cocoa shadow, flat colors, 2 idle frames, transparent background.
```

Negative prompt:

```text
dark steampunk robot, brass boiler, horror monster, gore, realistic metal rendering, heavy shadows, complex mechanical detail, black background, sci-fi neon cyberpunk, purple gradient, huge weapon
```

Output requirements:

- PNG with alpha.
- Cell size 80x80 or 64x80 if the final silhouette needs width control.
- 2 idle frames.
- Keep lower 2px clear for shadow separation.

Notes for cleanup:

- This asset must be recognizable even when surrounded by 100+ enemies.
- Keep the smile and broken eye as the main read.
- Optional: produce text-free badge area for later localization.

### 5.5 16x16 교외 타일셋

목적: 현재 코드 격자 배경을 16x16 suburb tiles로 교체할 최소 세트.

Prompt:

```text
Pixel art 16x16 tileset for a top-down 2D game, bright dystopian 1950s atomic suburb. Pastel suburban ground tiles: cream concrete sidewalk, cracked sidewalk, mint grass, sage lawn, coral roof fragments, lemon ad paper litter, toxic green slime puddle overlay, curb edges, driveway asphalt in soft warm gray, small repeating flower and atomic warning stamp. Flat lighting, low contrast background for combat readability, 1px cocoa detail lines only where needed. Clean tile grid, no perspective, seamless edges where appropriate.
```

Negative prompt:

```text
dark dungeon, industrial steampunk factory, rusty pipes, realistic texture, high contrast noisy ground, large props inside ground tiles, blurry anti-aliasing, isometric tiles, 3D render, brown monochrome
```

Output requirements:

- PNG tilesheet with alpha where overlays need it.
- 16x16 cells.
- Minimum 24 tiles: grass variants, sidewalk variants, curb, driveway, cracks, slime overlay, paper litter.
- Include a separate row for transparent overlays if possible.

Notes for cleanup:

- Test readability under player/enemy/VFX colors.
- Keep ground saturation lower than characters.
- Avoid tiny text; use icon-like ad shapes instead.

### 5.6 레벨업 카드 UI

목적: 현재 3택 버튼을 레트로 제품 카탈로그 카드로 교체할 9-slice 배경과 아이콘 스타일.

Prompt:

```text
Pixel art UI kit for level-up cards in a bright dystopian 1950s atomic advertisement game. Three catalog coupon cards, cream paper background, cocoa ink outline, rounded corners 4-6px, tiny halftone dots, cheerful product label area, atomic starburst badge, toxic green and neon red accent strips. Include empty card background suitable for 9-slice, selected/hover border variant, small 32x32 icon frames, and simple product-catalog decorative shapes. No readable text, transparent background, pixel-perfect UI.
```

Negative prompt:

```text
modern sci-fi UI, dark metal frame, steampunk brass, heavy gradients, glossy mobile game card, unreadable generated text, realistic paper texture, huge ornamental details, purple theme
```

Output requirements:

- PNG with alpha.
- Base card target: 124x106, 9-slice safe corners.
- Include normal, hover/selected, disabled/locked if space allows.
- Leave title/body text areas blank.

Notes for cleanup:

- Mark 9-slice margins in a separate note or guide image.
- Keep corners simple so scaling does not distort.
- Icons can be generated separately if this sheet gets crowded.

### 5.7 HUD 게이지 UI

목적: HP와 차징 게이지를 광고/제품 미터 느낌으로 교체.

Prompt:

```text
Pixel art HUD gauge UI for a 480x270 top-down survivor game, bright dystopian 1950s atomic advertisement style. Compact HP bar and charge meter frames, cream paper and cocoa outline, soda-bottle or catalog meter styling, toxic green fill for charge, neon pink-red fill for HP, lemon yellow ready state notches, small atomic icon caps. Designed for top-left HUD, readable at low resolution, flat colors, transparent background, no text.
```

Negative prompt:

```text
large ornate UI, brass pressure gauge, dark steampunk, realistic glass reflections, modern neon cyberpunk, tiny unreadable labels, thick gradients, blurry edges
```

Output requirements:

- PNG with alpha.
- Include 112px-wide frame variants matching current HUD scale, plus stretchable center if possible.
- Separate frame, fill, and cap elements if the tool supports layers.

Notes for cleanup:

- Charge states need three readable colors: cooldown green, warning pink-red, ready yellow.
- Keep total HUD height compact; do not block the playfield.
- Make sure fills can be cropped horizontally in Godot.

### 5.8 파티클/VFX atlas

목적: `effects_controller.gd`의 차징, 피격, 처치, 경고링을 atlas 기반으로 전환할 준비.

Prompt:

```text
Pixel art VFX particle atlas for a bright dystopian atomic 1950s advertisement survivor game. Small particles on transparent background: toxic green slime drops, neon pink-red sparks, vitamin yellow starbursts, cream ad paper confetti, short diagonal ray streaks, circular charge ring segments, tiny atomic symbols, 2-frame pop flash shapes. High contrast, clean pixel edges, no blur, designed for 480x270 gameplay with many particles.
```

Negative prompt:

```text
smoke clouds, realistic fire, blood splatter, dark horror gore, soft airbrush glow, lens flare, high resolution painterly effects, purple magic theme, brass debris
```

Output requirements:

- PNG with alpha.
- 128x128 or 256x256 atlas.
- Keep particles in 8x8, 16x16, and 32x32 cells.
- Include white flash shape that can be tinted in Godot.

Notes for cleanup:

- Keep a simple atlas map note: cell coordinates and intended use.
- Favor tintable white/yellow shapes for reuse.
- Limit semi-transparent pixels to intentional glows only.

### 5.9 결과 화면 패널

목적: 승리/게임오버 결과 화면을 카탈로그 영수증/TV 광고 패널처럼 보이게 만들기.

Prompt:

```text
Pixel art result screen UI panel for a bright dystopian 1950s atomic advertisement survivor game. Cream paper catalog receipt panel, cocoa ink outline, rounded 4-6px corners, small atomic stamp, coupon perforation edge, cheerful but slightly damaged corporate ad style, empty areas for result title and stats, small restart button frame. Transparent background, 9-slice friendly, no readable generated text.
```

Negative prompt:

```text
dark game over horror screen, blood, skulls, brass steampunk, modern glass UI, full screen illustration, unreadable text, heavy gradients, purple/brown monochrome
```

Output requirements:

- PNG with alpha.
- Base panel target: 244x174.
- Include button frame around 196x32 or a stretchable button frame.

Notes for cleanup:

- Keep text areas plain enough for Korean labels.
- Preserve 9-slice corners.
- Add one small damaged corner or slime drip, not too many.

### 5.10 키 아트 또는 capsule art 초안

목적: Steam capsule/프로젝트 대표 이미지의 초안 방향 확인. P0 적용 에셋은 아니지만 톤 공유용으로 유용하다.

Prompt:

```text
Draft key art for "Atomic Ad Survivors", bright dystopian 1950s atomic suburb, cheerful pastel advertisement world collapsing under radioactive slime. A small survivor in mint space helmet stands in a pastel suburban street, surrounded by smiling billboard tumors, appliance zombies, and a huge corporate mascot robot with a cracked porcelain smile. Toxic green charge burst explodes like a retro ad starburst, neon pink and vitamin yellow confetti, cream paper catalog texture, readable game capsule composition, playful black comedy, not horror, high contrast focal character.
```

Negative prompt:

```text
dark steampunk, gritty apocalypse, realistic gore, horror poster, brown monochrome, purple sci-fi, gas mask survivor, brass machinery, photorealistic faces, unreadable logo text, cluttered composition
```

Output requirements:

- Draft PNG, preferably 16:9 and capsule-friendly crop.
- Keep logo/text area blank or use placeholder only.
- Prioritize tone and composition over final polish.

Notes for cleanup:

- Do not treat this as final marketing art.
- Use it as palette, mood, and enemy/player relationship reference.
- Crop-test for wide capsule and small thumbnail readability.

## 6. Godot 적용 규칙

- Import filter: 모든 픽셀아트 텍스처는 Godot import에서 filter nearest를 사용한다. 프로젝트 기본도 nearest여야 한다.
- Pixel snap: `project.godot`의 480x270 viewport, integer scale, 2D snap 설정을 유지한다.
- 스프라이트 크기: 플레이어 48x48, 잡몹 32x32, 엘리트 40x40, 대형 마스코트 64-80px, 타일 16x16 기준.
- Pivot 기준: 캐릭터는 x 중앙, y는 발 위치에 둔다. 발 baseline은 셀 하단에서 2-4px 위를 기준으로 한다.
- 발 위치: top-down 게임이므로 머리 중심이 아니라 발 위치를 이동/정렬 기준으로 삼는다. 그림자는 별도 sprite 또는 하단 여백으로 처리한다.
- Collision/hitbox: 스프라이트와 분리한다. 현재 플레이어 반경, 적 반경, 접촉 피해는 코드 상 수치로 유지하고, 이미지 크기에 맞춰 무리하게 hitbox를 키우지 않는다.
- Animation: 4방향 이동은 사전 작화한다. Godot에서 자유 회전으로 방향을 만들지 않는다.
- 카드 UI: 카드 배경과 결과 패널은 9-slice를 고려해 모서리와 테두리 두께를 일정하게 만든다.
- HUD 게이지: 프레임과 fill을 분리해 Godot에서 fill width만 조절할 수 있게 한다.
- VFX: 가능하면 `vfx_particles_atomic_ad_atlas.png` 한 장으로 관리한다. 차징/피격/처치/광고 종이 조각을 같은 atlas에서 뽑아 tint 또는 scale로 변주한다.
- Text: 생성 이미지 안에는 읽어야 하는 텍스트를 넣지 않는다. 한국어 UI 텍스트는 Godot Label로 얹는다.
- Alpha: 배경 없는 sprite/UI는 PNG alpha를 사용하고, 반투명 픽셀은 의도된 glow 외에는 정리한다.
- 테스트: 480x270에서 실제 크기로 배치해 적 100마리 이상, 파티클 다수, 카드 UI 표시 상태를 확인한다.

## 7. 현재 레퍼런스 이미지 활용 가이드

### `assets/reference_bright_dystopian/`

이 폴더는 현재 확정 톤의 직접 레퍼런스다. 다음 용도로 우선 확인한다.

- `01_suburban_atomic_ad_key_art.png`, `23_space_helmet_suburban_atomic_ad_key_art.png`: 플레이어와 키 아트의 전체 톤, 파스텔 교외, 차징 주인공 분위기.
- `02_pastel_survivor_48x48_4dir_sprite.png`, `03_pastel_survivor_48x48_4dir_sprite_v2.png`: 플레이어 48x48 시트의 가장 직접적인 참고.
- `07_billboard_tumor_32x32.png`, `09_billboard_tumor_32x32_v2.png`: tier1 빌보드 종양 적.
- `04_vintage_ad_mascot_robot_48x48.png`, `06_infected_1950s_housewife_40x40.png`, `20_cheerful_corporate_mascot_robot_boss.png`: 엘리트와 대형 마스코트.
- `10_abandoned_atomic_suburb_16px_tileset.png`, `11_abandoned_atomic_suburb_16px_tileset_v2.png`: 16x16 교외 타일셋.
- `12_appliance_catalog_talent_tree.png`, `13_appliance_catalog_talent_tree_v2.png`, `21_cereal_prize_levelup_ui.png`, `22_cereal_prize_levelup_ui_v2.png`: 레벨업 카드와 카탈로그 UI.
- `14_tv_commercial_hud_elements.png`, `15_tv_commercial_hud_elements_v2.png`: HP/차징 HUD 프레임.
- `18_ad_sunburst_charged_shot_gameplay.png`, `19_mascot_statue_ooze_explosion_gameplay.png`: 차징 VFX와 폭발 방향.

### `generated_assets/02_bright_dystopian_atomic/`

이 폴더는 B 톤의 우선 원본 생성물이다. `assets/reference_bright_dystopian/`와 중복되는 파일이 많으므로, 실제 에셋 제작 시에는 아래 파일을 우선 비교 대상으로 둔다.

- 플레이어: `02_pastel_survivor_48x48_4dir_sprite.png`, `03_pastel_survivor_48x48_4dir_sprite_v2.png`
- 적: `07_billboard_tumor_32x32.png`, `09_billboard_tumor_32x32_v2.png`, `06_infected_1950s_housewife_40x40.png`
- UI: `14_tv_commercial_hud_elements.png`, `15_tv_commercial_hud_elements_v2.png`, `21_cereal_prize_levelup_ui.png`, `22_cereal_prize_levelup_ui_v2.png`
- 배경: `10_abandoned_atomic_suburb_16px_tileset.png`, `11_abandoned_atomic_suburb_16px_tileset_v2.png`
- 대형 적/보스 후보: `20_cheerful_corporate_mascot_robot_boss.png`, `08_sad_corporate_mascot_boss_gameplay.png`

### `generated_assets/03_cute_dystopian_atomic/`

이 폴더에서는 "귀여움의 양"만 제한적으로 가져온다. B 톤보다 더 둥글고 슬픈 C 톤이므로 전체 팔레트와 UI 문법을 그대로 가져오면 톤이 흔들린다.

가져와도 되는 요소:

- `03_sad_mascot_robot_40x40.png`, `17_sad_mascot_robot_40x40_v2.png`: 마스코트 얼굴의 귀여운 비례.
- `06_oversized_hamster_36x36.png`: 둥근 동물형 실루엣 아이디어.
- `09_marshmallow_health_hud_elements.png`: 게이지의 부드러운 블록감. 단, B 톤에서는 카탈로그/TV 광고 느낌으로 조정.
- `14_sticker_card_levelup_ui.png`: 아이콘 sticker read. 단, 카드 자체는 scrapbook보다 제품 카탈로그 쪽으로 유지.

주의할 점:

- 하트/눈물/스티커가 너무 많아지면 C 톤으로 이동한다.
- 2.5등신 치비 비례는 플레이어 최종에는 쓰지 않는다. B 톤 플레이어는 3등신이 기준이다.

### `generated_assets/01_atomic_steampunk/`

이 폴더는 피해야 할 방향을 확인하는 용도로 주로 사용한다.

피해야 할 요소:

- 황동, 압력계, 파이프, 산업 폐허, 가스마스크, 어두운 갈색/검정 배경.
- `07_brass_control_panel_talent_tree.png`, `08_pressure_gauge_hud_elements.png`의 금속 UI 문법.
- `06_industrial_facility_ruins_16px_tileset.png`의 고밀도 녹슨 배경.

제한적으로 참고할 요소:

- `10_toxic_green_charged_shot_gameplay.png`: 방사능 그린 이펙트의 시인성만 참고.
- `13_technical_paper_levelup_cards.png`: 카드 정보 위계만 참고 가능. 재질은 B 톤 종이 카탈로그로 바꿔야 한다.

## 8. 다음 방에 넘길 작업

### P0 에셋 생성 작업 프롬프트

```md
작업 목표:
Atomic Ad Survivors Vertical Slice 0.1용 P0 에셋을 생성하고 정리한다. 실제 Godot 적용은 하지 말고, 생성된 PNG와 간단한 atlas/시트 메모만 준비한다.

참고 문서:
- ASSET_PRODUCTION_PLAN.md
- ART_DIRECTION_SPEC.md
- README_GAME.md

수정 가능 폴더:
- assets/characters/
- assets/tilesets/
- assets/ui/
- assets/vfx/
- assets/marketing/

제약:
- 확정 톤은 B - bright dystopian atomic.
- generated_assets 기존 파일은 이동/삭제/리네임하지 말 것.
- P0 최소 세트 우선: 플레이어, tier1 적 2-3종, elite 1종, 80px 마스코트, suburb tiles, HUD gauges, level-up card UI, result panel, VFX atlas.
- 모든 픽셀아트는 480x270 Godot viewport에서 읽히게 만들 것.

완료 조건:
- P0 PNG 후보가 권장 폴더 구조에 저장됨.
- 각 시트의 셀 크기/행열/애니메이션 순서를 짧은 메모로 남김.
- Godot import 적용은 하지 않음.
```

### Godot에 플레이어/적 스프라이트 적용 작업 프롬프트

```md
작업 목표:
생성된 P0 캐릭터 에셋 중 플레이어와 기본 적/엘리트 스프라이트를 Godot 4 프로젝트에 적용한다. 기존 플레이 루프, M5 차징, 웨이브, 카드 UI 동작은 유지한다.

참고 문서:
- ASSET_PRODUCTION_PLAN.md
- GAME_PRODUCTION_PLAN.md
- ART_DIRECTION_SPEC.md

참고 파일:
- scripts/main.gd
- scripts/enemy_controller.gd
- scripts/effects_controller.gd
- scripts/wave_director.gd

제약:
- import filter nearest, pixel snap 유지.
- collision/hitbox는 스프라이트와 분리하고 기존 밸런스를 크게 바꾸지 말 것.
- 플레이어 pivot은 발 위치 기준으로 맞출 것.
- 우선 플레이어 48x48, 잡몹 32x32, 엘리트 40x40만 적용. UI/VFX/타일은 별도 작업으로 남겨도 됨.

완료 조건:
- 게임 실행 시 코드 원형 대신 스프라이트가 보임.
- 5분 플레이 루프, 레벨업, 결과 화면이 유지됨.
- 480x270 viewport에서 스프라이트가 흐려지지 않음.
- 변경 파일과 테스트 결과를 보고.
```
