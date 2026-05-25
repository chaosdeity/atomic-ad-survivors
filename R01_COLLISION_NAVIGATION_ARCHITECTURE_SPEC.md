# R01 Collision Navigation Architecture Spec

상태: 0.2 R01 Godot collision/navigation blockout 이전 기준서
범위: R01 외곽 주택가의 collision, navigation, passable hazard, blocker, enemy pathing 검증 기준
비범위: 코드 수정, Godot scene 수정, 에셋 import, 밸런스 수치 조정, 보스/카드/보상 변경

## 1. 목적

이 문서는 `R01_LOCAL_MAP_LAYOUT_LOGIC_SPEC.md`와 `R01_GODOT_LAYOUT_BLOCKOUT_REPORT.md` 사이의 빈칸을 메운다.

현재 R01은 world-space blockout과 5개 구역 anchor를 가진다. 하지만 blockout prop은 대부분 draw placeholder이며, 실제 collision polygon, navigation cost, enemy pathing 기준은 아직 없다. 이 상태에서 손맛/밸런스를 판단하면 플레이어가 어디서 막혔는지, 적이 왜 뭉쳤는지, 위험이 읽혔는지, R01이 arena가 아니라 로컬 필드로 느껴졌는지를 분리해서 볼 수 없다.

따라서 0.2 평가 가능 상태로 가기 전에 아래를 고정한다.

- hard blocker, soft blocker, no collision prop의 구분
- passable hazard와 실제 blocker의 구분
- player navigation과 enemy navigation의 차이
- 5개 zone별 collision/navigation 의도
- 100~300 enemy pathing 검증 기준
- debug label과 일반 UI 분리 기준

핵심 원칙:

```text
R01 collision은 벽을 세우기 위한 것이 아니라,
외곽 주택가를 읽히게 하고 전투 판단을 공정하게 만들기 위한 것이다.
```

## 2. 현재 기준

확정된 world-space blockout:

```text
world_bounds:
  position: (-720, -405)
  size: 1920 x 810

viewport_reference:
  480 x 270
  실제 world size가 아니라 한 화면 전투 가독성 기준

camera_screens:
  4 x 3 = 12 camera screens
```

확정된 zone anchor:

| Zone | Anchor |
| --- | --- |
| `silence_edge_start` | `(-600, 170)` |
| `subdivision_loop_center` | `(-105, 28)` |
| `model_house_node_anchor` | `(510, -238)` |
| `drain_pocket_anchor` | `(260, 270)` |
| `fake_return_route_anchor` | `(-500, -205)` |

현재 남은 리스크:

- blockout prop에 collision/navigation metadata가 없다.
- `R01MapController`의 기존 시간 기반 zone name과 world-space nearest anchor가 완전히 통합되지 않았다.
- 보스 위치와 `model_house_node_anchor`가 아직 같은 좌표계 기준으로 재배치되지 않았다.
- 30/100/300 density probe는 draw-only이며 실제 enemy pathing benchmark가 아니다.
- `480x270` 한 화면 가독성 규칙은 있으나, blocker와 hazard의 runtime 기준은 아직 없다.

## 3. Collision 분류

### 3.1 Hard Blocker

Hard blocker는 player와 enemy 모두 통과할 수 없는 실제 지형이다.

용도:

- 구역 외곽 형성
- house/front/fence/model node 같은 큰 구조물 표현
- camera edge frame과 실제 이동 경계 일치
- path funnel 생성

규칙:

- 중앙 전투 영역 50~60% 안에는 배치하지 않는다.
- player 시작점 주변에는 배치하지 않는다.
- 480x270 한 화면에서 플레이어가 빠져나갈 수 없는 U자형/ㄷ자형 포켓을 만들지 않는다.
- hard blocker 주변에는 최소 한 개 이상의 넓은 회피 방향이 있어야 한다.
- 보스 arena에서는 패턴 telegraph와 hard blocker가 겹쳐 불공정한 고립을 만들면 안 된다.

후보 prop:

| Prop | Hard blocker 여부 | 메모 |
| --- | --- | --- |
| `house_front_prop_full` | 가능 | edge frame 전용. 중앙 금지 |
| `house_front_prop_small` | 가능 | edge 또는 lane wall. 반복 집 구조 표현 |
| `queue_guide_fence_prop` | 가능 | 짧은 segment만 허용. 긴 미로 금지 |
| `model_house_node_prop` | 가능 | boss/objective anchor. 중심을 먹지 않게 edge-facing 배치 |
| `consultation_kiosk_socket_prop` | 조건부 가능 | event source면 trigger, 큰 body면 hard |
| large boss arena wall | 가능 | 보스전 별도 blockout에서 검증 |

### 3.2 Soft Blocker

Soft blocker는 player 또는 enemy의 이동을 완전히 막지 않고, 동선 판단이나 경로 비용을 바꾸는 요소다.

용도:

- 가벼운 우회 유도
- R01 생활 인프라 밀도 표현
- 적 흐름을 한곳으로 너무 뭉치지 않게 분산
- fake route, drain pocket, model node 접근부의 압박 조절

규칙:

- 플레이어를 즉시 멈추게 하지 않는다.
- enemy pathing에서는 낮은 회피 비용 또는 감속 비용으로 취급한다.
- soft blocker가 3개 이상 연속되어 실질 hard wall이 되면 안 된다.
- 시각적으로 큰 prop이 soft라면, 플레이어가 통과 가능한 영역을 바닥/그림자/투명도로 명확히 읽을 수 있어야 한다.

후보 prop:

| Prop | Soft blocker 의도 | 메모 |
| --- | --- | --- |
| `balloon_prop` | 약한 회피/시야 장식 | 전투 중앙 금지 |
| `flyer_pile_prop` | 낮은 감속 또는 no collision | pickup/보상과 혼동 금지 |
| `mailbox_device_prop` | 조건부 soft/hard | prop mailbox와 enemy mailbox 역할 분리 |
| `streetlight_speaker_prop` | edge soft | fake route voice anchor |
| `homecare_vacuum_dock_prop` | soft 또는 trigger | 흡입 hazard source와 분리 |
| `sprinkler_slime_prop` | soft + hazard source | 실제 hazard는 별도 telegraph layer |

### 3.3 No Collision

No collision은 시각 밀도, 이야기, 흔적, route hint를 위한 요소다.

규칙:

- enemy, player, projectile, pickup 이동을 막지 않는다.
- 실제 danger telegraph보다 낮은 layer/value로 둔다.
- 300 density 상황에서 enemy silhouette을 가리면 suppress 대상이다.
- gameplay pickup과 같은 크기/색/반짝임을 쓰면 안 된다.

후보:

- `tiny_paper_fragment_a`
- `tiny_paper_fragment_b`
- `tiny_coupon_chip`
- `tiny_ad_tag`
- `tiny_density_noise_cluster`
- `recommended_route_decal_weak`
- `campaign_floor_decal_weak`
- `floor_plan_line_decal_weak`
- price/customer tag decal

## 4. Passable Hazard 분류

Passable hazard는 통과 가능하지만 판단을 요구하는 위험이다. 이것은 blocker가 아니며, collision으로 길을 막는 대신 telegraph, SFX, animation, damage/slow/pull 같은 효과로 읽힌다.

공통 규칙:

- hazard outline은 background decal보다 선명해야 한다.
- hazard가 실제 damage/slow/pull을 가진다면 gameplay telegraph layer에서 표현한다.
- passable hazard는 player navigation을 막지 않는다.
- enemy는 hazard를 무시할지, 회피할지, 이용할지 역할별로 분리할 수 있다.
- hazard와 hard blocker가 겹쳐 탈출 불가능한 상황을 만들면 안 된다.

P0 passable hazard 후보:

| Hazard | Source | 효과 의도 | Collision |
| --- | --- | --- | --- |
| flyer drop | flyer pile, mailbox, boss coupon | 낙하/탄막 압박 | no collision, telegraph only |
| slime puddle | drain, sprinkler | 감속 또는 약한 damage | passable area |
| photo flash | doorbell, family window, boss | 짧은 둔화/포즈 고정 | passable area |
| vacuum pull | homecare dock, boss | 약한 pull | passable area |
| pressure ring | speaker/charger | warning 후 ring pressure | passable area |
| floor plan line | model node, boss P1 | 짧은 line hazard 또는 soft wall 후보 | P0에서는 passable 우선 |

금지:

- hazard를 collision wall로 대체해 패턴을 싸게 만들지 않는다.
- floor decal을 실제 hazard처럼 보이게 하지 않는다.
- 독성 slime visual과 R01 ambient decal이 같은 선명도로 겹치지 않게 한다.

## 5. Navigation Layer

### 5.1 Player Navigation

Player navigation은 이동의 공정성과 조작 신뢰가 우선이다.

원칙:

- 플레이어가 보는 길은 실제로 지나갈 수 있어야 한다.
- 지나갈 수 없는 곳은 silhouette, shadow, fence, wall value로 명확히 막혀 보여야 한다.
- player radius 기준으로 좁은 통로를 만들지 않는다.
- 480x270 기준 어느 화면에서도 최소 2개 이상의 회피 방향이 있어야 한다.
- fake_return_route는 실제 회수 UI가 아니므로, navigation으로 플레이어를 속이되 UI로 속이면 안 된다.

P0 기준:

```text
minimum_combat_corridor:
  player가 좌우 회피와 차징 방향 전환을 할 수 있는 폭

no_dead_end_rule:
  trace/hazard pocket을 제외하고 막다른 길은 만들지 않는다.

trace_pocket_exception:
  drain_silence_pocket 같은 위험 보상 pocket은 짧은 막다른 형태 가능.
  단, 입구가 명확하고 hazard telegraph가 겹치지 않아야 한다.
```

### 5.2 Enemy Navigation

Enemy navigation은 몰려오는 압박을 만들되, prop과 blocker 때문에 멍청하게 뭉쳐 보이면 안 된다.

원칙:

- basic 적은 player까지 가장 단순한 경로로 접근한다.
- fast 적은 soft blocker 비용을 덜 받거나 우회가 빠르게 보인다.
- tank 적은 좁은 통로에서 다른 적을 과하게 막지 않아야 한다.
- signal/speaker/charger 계열은 무조건 추격하지 않고 anchor 주변을 유지할 수 있다.
- elite는 pathing 때문에 작은 prop에 걸려 보이면 안 된다.

Enemy pathing 실패로 보는 경우:

- 100마리 테스트에서 적이 한 blocker 모서리에 장시간 쌓인다.
- 300 density visual에서 실제 적과 density-only noise가 구분되지 않는다.
- 적이 no collision decal을 피하려고 부자연스럽게 돌아간다.
- soft blocker가 사실상 enemy wall이 된다.
- model_house_node 주변에서 보스/elite 접근 경로가 막힌다.

### 5.3 Projectile / Attack Navigation

투사체와 공격은 movement collision과 분리한다.

원칙:

- 반품 스캐너 투사체는 작은 prop clutter에 불필요하게 막히면 안 된다.
- 반품 도장은 player-facing combat field를 읽히게 해야 하며, edge prop에 시각적으로 가려지면 안 된다.
- boss coupon, flyer, speaker ring 같은 hazard는 collision wall과 무관하게 telegraph 기준으로 판정한다.
- hard blocker 뒤의 적을 맞힐지 여부는 후속 구현에서 별도 결정하되, 이번 문서는 hitbox 수치를 확정하지 않는다.

## 6. Zone별 기준

### 6.1 Silence Edge

역할:

- R01 진입 완충 구역
- 첫 조작/회수선 감각 확인
- 낮은 광고 농도

Collision/navigation 기준:

- hard blocker를 최소화한다.
- player 시작점 기준 넓은 이동 가능 영역을 유지한다.
- distant mailbox hint, weak route hint는 no collision 또는 edge soft로 둔다.
- 첫 방문 기준 hazard는 거의 없거나 tutorial 수준이어야 한다.

Acceptance:

- 첫 화면에서 이동 방향이 막힌 느낌이 없어야 한다.
- fake_return_route와 실제 출격/회수 UI가 헷갈리지 않아야 한다.

### 6.2 Subdivision House Loop

역할:

- R01 기본 전투 공간
- 같은 집 반복, 우편함, 전단, 가격표가 주력으로 보이는 구역

Collision/navigation 기준:

- house_front와 fence로 edge wall을 만들 수 있다.
- 중앙 50~60%는 combat field로 비워둔다.
- mailbox는 enemy source 또는 prop source인지 명확히 구분한다.
- route decal과 price/customer tag는 no collision이다.
- 반복 집 구조가 미로처럼 읽히면 안 된다.

Acceptance:

- 100 enemy pathing에서 적이 집 모서리에 과도하게 쌓이지 않는다.
- player는 loop를 돌며 방향을 바꿀 수 있고, 차징 각을 만들 수 있다.

### 6.3 Model House Node

역할:

- 송출 기록 3/3 이후 보스 접근 방향
- 스마일 홈 시어머니 arena 전조
- R01 campaign law의 중심

Collision/navigation 기준:

- `model_house_node_prop`는 hard/objective anchor 가능.
- boss arena 전까지는 전투 중앙을 먹지 않는 edge-facing anchor로 둔다.
- consultation kiosk, doorbell, family window는 trigger/event source로 분리한다.
- floor plan line은 P0에서는 passable hazard 또는 visual guide로 먼저 둔다.
- 보스 arena blockout은 별도 sub-area처럼 검증한다.

Acceptance:

- model node가 보스 본체처럼 오해되지 않고 결절 접근점으로 읽힌다.
- 보스 arena 진입부가 prop으로 막히지 않는다.

### 6.4 Drain Silence Pocket

역할:

- 위험 보상 pocket
- trace/material 후보 위치
- 침묵 신호와 광고 leak가 만나는 구역

Collision/navigation 기준:

- 짧은 pocket 구조 가능.
- toxic drain은 hard blocker보다 hazard source로 우선 취급한다.
- slime puddle은 passable hazard다.
- pocket 입구가 적에게 완전히 막히지 않도록 최소한의 우회 공간을 둔다.
- trace candidate marker는 no collision 또는 trigger다.

Acceptance:

- 위험하지만 들어갈 이유가 있는 공간으로 읽힌다.
- player가 trapped 상태로 사망하는 구조가 되면 실패다.

### 6.5 Fake Return Route

역할:

- 캠페인이 회수 동선을 흉내내는 위험 구역
- 실제 회수 UI와 다른 환경적 유혹

Collision/navigation 기준:

- route decal은 no collision이다.
- streetlight speaker는 edge soft 또는 trigger anchor다.
- fake recovery marker는 visual/event marker이며 실제 recovery action과 분리한다.
- 좁은 funnel은 가능하지만, 회수 UI처럼 확정 안내하면 안 된다.
- memory/family voice hazard는 passable hazard로 둔다.

Acceptance:

- 플레이어가 “수상한 길”로 읽지 “시스템 회수 버튼”으로 읽지 않는다.
- fake route에 들어가도 탈출 경로가 남아 있다.

## 7. Prop Metadata 초안

후속 Godot blockout에서 prop별로 최소 아래 필드를 가진다.

```text
prop_id
zone_allowed
zone_preferred
placement_band: center / mid_risk / edge
collision_type: hard / soft / none / trigger
nav_cost_player: block / normal / slow / warning_only
nav_cost_enemy: block / normal / soft_avoid / ignore
spawn_role: none / enemy_source / hazard_source / event_source / trace_anchor
hazard_type: none / flyer_drop / slime / photo_flash / vacuum_pull / pressure_ring / floor_plan
debug_visible_only: true / false
general_ui_visible: true / false
```

P0 prop classification:

| Prop | Placement | Collision | Player Nav | Enemy Nav | Role |
| --- | --- | --- | --- | --- | --- |
| `house_front_prop_full` | edge | hard | block | block | story frame |
| `house_front_prop_small` | edge/mid | hard/soft | block/normal | block/soft_avoid | repeated house |
| `queue_guide_fence_prop` | edge/mid | hard/soft | block/normal | block/soft_avoid | route funnel |
| `mailbox_device_prop` | mid/edge | soft/trigger | normal | normal | enemy_source/hazard_source |
| `streetlight_speaker_prop` | edge | soft/trigger | normal | normal | event_source |
| `toxic_ad_drain_prop` | mid/edge | trigger | warning_only | ignore | hazard_source/trace_anchor |
| `sprinkler_slime_prop` | mid | trigger | warning_only | ignore | hazard_source |
| `doorbell_projector_prop` | edge/mid | trigger | normal | normal | photo_flash source |
| `consultation_kiosk_socket_prop` | mid/edge | hard/trigger | block/normal | block/normal | elite/boss context |
| `model_house_node_prop` | edge/objective | hard/trigger | block/normal | block/normal | objective/boss context |
| `recommended_route_decal_weak` | ground | none | normal | ignore | route hint |
| `floor_plan_line_decal_weak` | ground | none | normal | ignore | campaign law hint |
| `tiny_density_noise_cluster` | background | none | normal | ignore | density only |

## 8. Pathing Test Matrix

### 8.1 30 Enemy Test

목적:

- 기본 조작과 구역 이동을 방해하지 않는지 확인한다.
- 첫 플레이어블의 전투 중앙 clear space를 본다.

합격 기준:

- player 주변 실루엣이 유지된다.
- basic enemy가 hard blocker에 오래 걸리지 않는다.
- silence_edge와 subdivision_loop에서 첫 이동 방향이 명확하다.

### 8.2 100 Enemy Test

목적:

- 실제 R01 기본 웨이브 압박에서 collision/navigation이 버티는지 확인한다.

합격 기준:

- subdivision_loop_center 주변에서 적이 2개 이상의 경로로 흘러온다.
- mailbox/house/fence 모서리에 적이 한 덩어리로 붙어 멈추지 않는다.
- player는 480x270 한 화면 안에서 최소 2개 방향으로 회피 가능하다.
- 반품 도장 전방 각이 prop으로 항상 가려지지 않는다.

실패 기준:

- hard blocker가 적 압박을 완전히 무력화한다.
- soft blocker가 enemy wall이 된다.
- trace pocket에 들어간 순간 적이 입구를 완전히 막는다.

### 8.3 300 Density Test

목적:

- 300은 실제 enemy 수 확정이 아니라 고밀도 시야와 pathing 위험 검증이다.
- tiny density layer와 실제 enemy가 구분되는지 확인한다.

합격 기준:

- 300 density-only layer는 no collision, no HP, no AI를 유지한다.
- 실제 enemy silhouette과 projectile/telegraph가 prop보다 우선 읽힌다.
- tiny_density_noise_cluster는 player 주변 clear space를 침범해도 판정을 만들지 않는다.
- debug label이 일반 화면에 노출되지 않는다.

실패 기준:

- density-only 조각이 실제 적처럼 보인다.
- prop/decal이 hazard telegraph보다 선명하다.
- 300 테스트를 근거로 실제 spawn 수치를 확정하려 한다.

## 9. Debug와 일반 화면 분리

일반 화면에 노출 금지:

- `zone_id`
- `prop_id`
- `collision_type`
- `nav_cost`
- `spawn_role`
- `density count`
- `campaign_pressure`
- 내부 anchor 좌표

debug 화면에서만 허용:

- zone anchor label
- collision polygon
- nav probe line
- pathing stuck marker
- 30/100/300 density probe count
- hard/soft/no collision color overlay

일반 화면에 허용:

- 자연문 구역명
- 출격 목표 문구
- 보급소/지역 반응 문구
- 위험 telegraph
- gameplay HUD

## 10. Acceptance Check

R01 collision/navigation blockout 완료 조건:

- 5개 zone에 collision/navigation 의도가 연결되어 있다.
- hard/soft/no collision/trigger가 prop별로 분리되어 있다.
- passable hazard가 blocker와 분리되어 있다.
- player navigation과 enemy navigation이 다르게 정의되어 있다.
- 30/100/300 density/pathing 검증 결과를 기록할 수 있다.
- model_house_node 주변 보스/elite/objective anchor가 막히지 않는다.
- fake_return_route가 실제 회수 UI와 혼동되지 않는다.
- 일반 화면에서 debug label이 숨겨진다.
- R01이 빈 arena가 아니라 이동 이유가 있는 RPG 로컬 필드로 읽힌다.

## 11. 금지사항

- 이번 문서 기준으로 코드 수정하지 않는다.
- Godot scene을 수정하지 않는다.
- 에셋을 생성하거나 import하지 않는다.
- enemy 수, damage, HP, 카드, 보스 수치를 변경하지 않는다.
- 300 density probe를 실제 spawn 설계로 확정하지 않는다.
- collision으로 손맛 문제를 숨기지 않는다.
- hazard를 보이지 않는 벽으로 만들지 않는다.
- R01을 다시 단일 arena로 축소하지 않는다.

## 12. 다음 작업

추천 다음 작업은 `R01 Godot collision/navigation blockout`이다.

산출물 후보:

1. `scripts/r01_layout_blockout.gd` 또는 별도 blockout data에 prop별 collision intent 연결
2. 5개 zone별 hard/soft/no collision debug overlay
3. passable hazard placeholder: flyer drop, slime, photo flash, pressure ring
4. 30/100/300 enemy pathing probe
5. `480x270` zone screenshot checklist
6. debug label 일반 화면 숨김 확인
7. `R01_GODOT_COLLISION_NAVIGATION_BLOCKOUT_REPORT.md` 작성
