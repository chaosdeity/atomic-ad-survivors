# P0 Asset Application Order

작성일: 2026-05-18
범위: PMO 승인된 스타일 샘플을 Godot에 적용하는 순서.
주의: 이 문서는 적용 계획이다. 기존 PNG 덮어쓰기, Godot import, `.import`/`.uid` 커밋은 하지 않는다.

## 1. 현재 샘플 판단

| 샘플 계열 | 판단 |
| --- | --- |
| `production_cleanup_v2` | 32/40/48 fixed pixel cell 검증용. prototype에 가깝다. |
| `production_cleanup_v2_polish` | fixed pixel sheet 후보 중 가장 사용 가능. 그래도 상업용 최종 후보라고 단정 금지. |
| `hybrid_2d_cutout` | hybrid 2D 방향 검증용. 480x270 mock 존재. |
| `hybrid_production_candidate` | PMO 승인 후보에 가장 가까움. 단 single-frame/source 중심이라 sprite sheet pilot 필요. |

## 2. 4종 스타일 샘플 현황

| 대상 | 사용 가능 후보 | 1x preview | 2x preview | 480x270 mock | 판단 |
| --- | --- | --- | --- | --- | --- |
| 윤서 player | `hybrid_production_candidate/yunseo_hybrid_candidate.png`, `production_cleanup_v2_polish/player_survivor_48x48_4dir_walk.png` | fixed pixel 쪽 존재 | fixed pixel 쪽 존재 | hybrid/fixed mock 존재 | hybrid는 production candidate 방향, fixed는 prototype sheet |
| 쿠폰 전단 떼 | `coupon_swarm_hybrid_candidate.png`, `enemy_coupon_slime_32x32_idle.png` | fixed pixel 쪽 존재 | fixed pixel 쪽 존재 | hybrid/fixed mock 존재 | hybrid가 세계관 적합, fixed는 대량 스폰 구조 검증용 |
| 미소 우편함/홈케어 | `mailbox_hybrid_candidate.png`, `enemy_appliance_zombie_32x32_idle.png` | fixed pixel 쪽 존재 | fixed pixel 쪽 존재 | hybrid/fixed mock 존재 | mailbox hybrid가 가장 명확한 생활 인프라 후보 |
| 행복 보증 상담원 | `happy_guarantee_consultant_hybrid_candidate.png`, `enemy_infected_housewife_40x40_walk.png` | fixed pixel 쪽 존재 | fixed pixel 쪽 존재 | hybrid/fixed mock 존재 | consultant hybrid가 elite 방향에 적합. housewife는 폐기/대체 후보 |

기존 v2 대비 개선점:

- 윤서: 어린/치비 대신 adult logistics/returns worker로 읽히는 방향 강화.
- 쿠폰: generic slime보다 광고/판촉 물질 계열 정체성 강화.
- 우편함: 생활 인프라가 광고 명령에 갇힌 적으로 분명해짐.
- 상담원: 주부 좀비보다 R01 모델하우스/상담 장치 정체성에 맞음.

부족한 항목:

- hybrid 후보는 sprite sheet가 아니라 source/candidate 이미지다.
- 4방향 2프레임 normalization, pivot, LOD, atlas가 아직 없다.
- 300마리급 실제 Godot runtime density 검증은 없다.

## 3. Godot 적용 순서

### Step 0. PMO 승인

먼저 PMO가 아래 중 하나를 선택한다.

| 선택 | 의미 |
| --- | --- |
| fixed pixel 유지 | 현재 32/40/48 sheet 구조를 유지하고 빠르게 prototype polish. |
| hybrid 2D pilot | larger cutout source를 normalized sheet로 변환해 상업 후보 방향 테스트. |
| 혼합 | 윤서/보스는 hybrid, 일반 enemy는 fixed pixel LOD로 임시 적용. |

PMO 판단 필요: 0.2 첫 평가가 "pixel prototype"인지 "hybrid commercial direction pilot"인지.

### Step 1. Player sprite

적용 대상:

- 현재 runtime path: `assets/characters/player/player_survivor_48x48_4dir_walk.png`
- loader: `scripts/sprite_assets.gd`
- current cell: `48x48`, 4 rows x 2 cols
- pivot: `(24, 43)`

순서:

1. 승인 후보를 별도 파일명으로 export.
2. 1x/2x/480 mock 확인.
3. `sprite_assets.gd` 경로 유지 가능 여부 확인.
4. 기존 PNG 덮어쓰기 전 PMO 승인.
5. Godot import 후 `.import`/`.uid` 변경 파일 최소 확인.

주의:

- 윤서가 어린/치비/군인처럼 보이면 적용 중단.
- 반품 스캐너/도장 장비가 보이지 않으면 적용 중단.

### Step 2. Tier1 enemy 3종

현재 runtime path:

- `enemy_billboard_tumor_32x32_idle.png`
- `enemy_appliance_zombie_32x32_idle.png`
- `enemy_coupon_slime_32x32_idle.png`

권장 치환 방향:

1. 쿠폰 전단 떼: 광고/판촉 물질 계열 대표.
2. 미소 우편함 또는 홈케어 청소기: 생활 인프라 계열 대표.
3. 세일 풍선/오픈하우스 표지판/가전 중 1종: 역할 계층 보강.

순서:

1. 쿠폰 먼저 적용. 대량 스폰에서 silhouette 확인.
2. 우편함/청소기 적용. 쿠폰과 크기/형태 분리 확인.
3. 세 번째 tier1은 역할이 겹치지 않는 후보로 PMO 결정.

주의:

- 32x32 fixed path를 유지할지, hybrid source를 22~38px tall runtime sprite로 바꿀지 먼저 결정.
- tier1 3종 모두 같은 색/둥근 비례가 되면 실패.

### Step 3. Elite 교체

현재 runtime path:

- `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png`
- `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png`

권장:

- 40x40/50~64px급 elite는 `행복 보증 상담원`으로 교체.
- 기존 infected housewife는 R01 P0 대표 적에서 내려보낸다.
- 80x80 large elite는 스마일 홈 시어머니와 혼동될 수 있으므로 별도 보스 전조/large hazard로 재분류.

PMO 판단 필요:

- `행복 보증 상담원`을 40x40 fixed sheet로 만들지, hybrid 50~64px tall로 갈지.

### Step 4. HUD / Card UI

현재 runtime PNG:

- `assets/ui/hud/ui_hud_hp_charge_gauges.png`
- `assets/ui/cards/ui_card_catalog_9slice.png`
- `assets/ui/icons/ui_card_icons_p0_32x32.png`
- `assets/ui/results/ui_result_panel_9slice.png`

순서:

1. HUD: HP/charge/goal readability 우선.
2. Card: 3택 카드가 카탈로그/쿠폰 UI로 읽히는지 확인.
3. Result: 정상 회수/정산/보스 처리 결과 문구가 긴 한국어에도 버티는지 확인.
4. Supply/outpost panel: 실제 장소 위에 UI가 얹히는 구조로 후속.

주의:

- 내부 수치 `campaign_pressure`, `trace_preserved`, `records=3` 직접 노출 금지.
- 카드 수치 조정은 이번 단계에서 하지 않는다.

### Step 5. VFX atlas

현재 후보:

- `assets/vfx/vfx_particles_atomic_ad_atlas.png`

우선 적용 region:

1. 자동공격 scanner line / small hit ping.
2. 반품 도장 ready ring.
3. 반품 도장 hit stamp.
4. 표식 부여/소멸 seal.
5. enemy paper burst / appliance spark.
6. pressure ring / flyer drop telegraph.
7. boss warning cue.

주의:

- VFX는 collision/hitbox와 분리.
- passable hazard와 background decal의 색상 대비를 분리.

## 4. `sprite_assets.gd` 유지 가능 여부

현재 구조는 유지 가능하다.

장점:

- fixed path / cell / pivot가 명확하다.
- fallback draw가 있어 누락 시 게임이 멈추지 않는다.
- import texture가 없어도 `Image.load()` fallback이 있다.

위험:

- hybrid 2D 후보는 현재 fixed cell assumption과 맞지 않는다.
- `draw_texture_rect_region()` fixed region 구조라 larger cutout atlas를 바로 쓰려면 rect table이 필요하다.

권장:

- 0.2 빠른 적용은 현재 `sprite_assets.gd` 유지.
- hybrid pilot은 별도 `actor_visual_profiles` 또는 rect metadata table로 확장.
- 기존 경로를 바로 덮어쓰기 전에 `assets/style_samples/.../pilot_runtime/` 같은 별도 staging 경로에서 검증.

## 5. Import / UID 커밋 기준

| 파일 | 커밋 기준 |
| --- | --- |
| PNG | PMO 승인된 최소 파일만. 기존 PNG 덮어쓰기 전 별도 검수. |
| `.import` | Godot에서 실제 import profile이 필요한 PNG 적용 커밋에 한해 해당 파일만 포함. |
| `.uid` | 원칙적으로 제외. Godot 4.6 정책상 필요 파일인지 별도 확인 후 최소 포함. |
| `.idea/` | 커밋 금지. |

## 6. Atlas / Slicing / Pivot / Collision 기준

| 항목 | 기준 |
| --- | --- |
| Player pivot | foot/base center. fixed pixel이면 `(24,43)` 유지. |
| Tier1 pivot | fixed 32x32이면 `(16,28)` 유지. hybrid면 foot center metadata 필요. |
| Elite pivot | fixed 40x40이면 `(20,37)`. hybrid면 foot center metadata 필요. |
| Boss pivot | gameplay body base center. visual height 100~135px 후보. |
| Collision | sprite 크기와 분리. hitbox/collision은 단순 shape 유지. |
| Atlas slicing | manual rect table 또는 import region table 필요. ad hoc string parsing 금지. |
| LOD | 300 density 대비 LOD0/1/2 분리. full detail을 300마리에 그대로 쓰지 않는다. |

## 7. 다음 적용 작업 추천

1. PMO가 hybrid vs fixed pixel pilot 방향 결정.
2. 윤서 1종만 runtime sheet로 normalization.
3. 쿠폰 전단 떼 1종을 30/100 density에서 검증.
4. 우편함/청소기 1종을 쿠폰과 silhouette 비교.
5. 행복 보증 상담원 elite를 1회 등장시키는 visual-only test.
