# R01 Local Map Layout Logic Spec

상태: 설계 문서 초안
범위: R01 외곽 주택가 로컬 맵 배치 논리, 하위 구역, 반복 방문 변화, prop 배치 이유
비범위: 코드 수정, Godot import, 기존 PNG 수정, 보스 재제작, 전투/성장/보상 수치 변경

## 1. 목표

이 문서는 `r01_environment_atlas_slicing_spec`의 tile / prop / decal / tiny LOD 구조 위에 RPG 로컬 맵 배치 논리를 얹는다.

R01 외곽 주택가는 단순 전투 arena 배경이 아니다. 침묵 보급소 주변의 생활권이 캠페인에 의해 `완벽한 가족 상품` 생태권으로 바뀐 첫 로컬 맵이다. 따라서 모든 집, 우편함, 배수구, 가로등, 초인종, 문패, 모델하우스 결절은 화면을 예쁘게 채우기 위해 놓이는 것이 아니라 다음 질문에 답해야 한다.

```text
왜 이 지형지물이 이 구역에 있는가?
플레이어가 처음 방문했을 때 무엇을 읽는가?
반복 방문 후 같은 prop이 어떻게 다르게 보이는가?
보스 처리 후 이 prop은 조용해지는가, 더 많이 말하는가?
전투 가독성을 해치지 않고 어떤 위험/보상/흔적 이유를 제공하는가?
```

핵심 목표는 R01을 다음 구조로 고정하는 것이다.

```text
R01 = 밝은 오픈하우스 표면
    + 생활 인프라가 광고 명령으로 움직이는 자동화 동네
    + 흔적과 이름이 상품 문구로 덮이는 로컬 생태권
    + 반복 방문과 보스 outcome을 기억하는 RPG 지역
```

## 2. 참고 문서/산출물

읽은 세계/지역 문서:

- `story/01_bible/world_overview.md`
- `story/03_regions/r01_suburb.md`
- `story/03_regions/r01_boss.md`
- `story/90_implementation/first_boss_directive_0_2.md`
- `RPG_ARCHITECTURE_PLAN.md`

읽은 아트/에셋 문서:

- `P0_ART_DIRECTION_CORRECTION.md`
- `ASSET_PRODUCTION_PLAN.md`
- `ASSET_IMPORT_NOTES.md`

읽은 현재 환경 아트 산출물:

- `assets/style_samples/p0_direction/r01_environment_modular_candidate/R01_ENVIRONMENT_MODULAR_NOTES.md`
- `assets/style_samples/p0_direction/r01_environment_atlas_pilot/R01_ENVIRONMENT_ATLAS_PILOT_NOTES.md`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/R01_ENVIRONMENT_ATLAS_SLICING_SPEC.md`

확인한 이미지:

- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/r01_tile_atlas_spec.png`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/r01_prop_atlas_spec.png`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/r01_decal_atlas_spec.png`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/r01_tiny_lod_atlas_spec.png`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/r01_slicing_spec_480x270_mock.png`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/r01_slicing_spec_high_density_480x270_mock.png`

추가로 현재 로컬 반응 방향을 맞추기 위해 참고한 문서:

- `R01_SUBURB_LOCAL_RESPONSE_DESIGN.md`
- `R01_FINALE_ENDING_STRUCTURE_DESIGN.md`

## Viewport vs World Size

`480x270`은 실제 R01 맵 크기가 아니다. 이 값은 플레이어가 한 순간에 보는 카메라/viewport 크기이며, sprite scale, combat readability, density mock을 검수하기 위한 기준이다.

실제 R01 맵은 여러 viewport를 이동하는 RPG 로컬 생태권이다. 최종 world size는 이 문서에서 확정하지 않는다. 현재 문서의 목적은 정확한 픽셀 크기 결정이 아니라, 나중에 더 큰 RPG 로컬로 확장 가능한 구역 배치 논리와 이동 이유를 정하는 것이다.

따라서 이 문서에서 말하는 `center`, `mid-risk`, `edge`는 한 viewport 안에서의 카메라 가독성 대역이다. 반면 `silence_edge`, `subdivision_house_loop`, `model_house_node`, `drain_silence_pocket`, `fake_return_route`는 실제 월드 좌표상 서로 다른 위치와 이동 동선을 가진 로컬 구역이다.

금지 기준:

- `480x270`을 실제 R01 맵 크기로 확정하지 않는다.
- 모든 하위 구역을 한 화면 안에 배치하지 않는다.
- 최종 world size를 지금 확정하지 않는다.
- 구역 이동 이유 없이 prop만 나열하지 않는다.

## Scale Assumptions

아래 값은 설계 규모 가정이며 최종 맵 크기 확정이 아니다.

```text
viewport_size:
  480x270
  카메라 한 화면 / readability mock / sprite density 검수 기준.

minimum_test_layout:
minimum_prototype_local_map:
  at least 4-6 camera screens
  예: 약 960x540, 1440x540, 960x810 계열의 작은 로컬 테스트.
  목적: 5개 구역이 한 화면 장식이 아니라 실제 이동 구간을 가진다는 점을 확인.

recommended_first_godot_test_layout:
  8-12 camera screens
  예: 약 1920x810, 1440x1080 계열의 첫 Godot layout test.
  목적: 분양 주택 루프, 결절 접근, 배수로 샛길, 가짜 귀환로가 서로 다른 이동 이유를 갖는지 검증.

future_expanded_local_size:
  first test layout보다 더 큰 RPG 로컬로 확장 가능.
  반복 방문, 보스 후 outcome, 송출관 잔향, trace route가 추가될 수 있음.

not_final_world_size:
  위 픽셀 수는 참고값이다.
  R01 전체 맵 크기와 최종 월드 좌표는 이 문서에서 확정하지 않는다.
```

## Zone Adjacency

기본 연결 관계:

```text
silence_edge
  -> subdivision_house_loop

subdivision_house_loop
  -> model_house_node
  -> drain_silence_pocket
  -> fake_return_route

model_house_node
  -> subdivision_house_loop
  -> fake_return_route after boss / after broadcast records

drain_silence_pocket
  -> subdivision_house_loop
  -> silence_edge side return in low-pressure variants

fake_return_route
  -> subdivision_house_loop
  -> model_house_node hint route
  -> never replaces real recovery UI
```

구역 연결 의도:

| From | To | 이동 이유 |
| --- | --- | --- |
| `silence_edge` | `subdivision_house_loop` | 보급소 경계에서 가장 먼저 광고 생태권으로 들어감 |
| `subdivision_house_loop` | `model_house_node` | 같은 집 반복과 송출 기록이 결절 방향을 드러냄 |
| `subdivision_house_loop` | `drain_silence_pocket` | 위험하지만 trace/material이 있는 utility 샛길로 벗어남 |
| `subdivision_house_loop` | `fake_return_route` | 캠페인이 회수 동선을 학습해 친절한 길안내처럼 흉내냄 |
| `model_house_node` | `fake_return_route` | 보스/송출 기록 이후 상위 송출관 잔향이 route를 오염시킴 |
| `drain_silence_pocket` | `silence_edge` | 낮은 압력 variant에서 침묵 신호를 따라 바깥쪽으로 우회 복귀 가능 |

## Zone Relative Position

상대 위치는 첫 Godot 테스트를 위한 배치 논리이며, 최종 좌표 확정이 아니다.

```text
reference:
  silence_edge = 보급소 방향과 연결되는 로컬 입구.

subdivision_house_loop:
  silence_edge에서 안쪽 / 동쪽 또는 북동쪽으로 이어지는 기본 루프.
  R01의 가장 넓은 반복 전투 구역.

model_house_node:
  subdivision_house_loop 안쪽 깊은 곳 / 북동쪽 또는 중심부의 높은 농도 지점.
  송출 기록 3/3 이후 접근 방향이 명확해진다.

drain_silence_pocket:
  subdivision_house_loop 외곽 / 하단, 남쪽, 또는 측면 utility line.
  주동선에서 살짝 벗어난 위험 보상 pocket.

fake_return_route:
  silence_edge로 돌아가는 듯 보이는 반대편 우회로 / 서쪽, 남서쪽, 또는 루프 바깥쪽.
  실제 보급소 귀환 UI와 별개인 캠페인 위장 경로.
```

ASCII 배치 개념:

```text
                    [model_house_node]
                          ^
                          |
            [subdivision_house_loop] ---- [fake_return_route]
                ^             |
                |             v
        [silence_edge]   [drain_silence_pocket]
             ^
             |
        supply outpost direction
```

## Travel Logic

플레이어가 이동하는 이유:

- `silence_edge`에서 `subdivision_house_loop`로 이동하는 이유: 보급소 경계 밖에서 R01의 기본 광고 생태권으로 들어가 회수 가능한 기록과 기본 전투 목표를 찾는다.
- `subdivision_house_loop`를 반복해서 도는 이유: 같은 집 반복, 문패 덮어쓰기, 우편함/쿠폰 spawner, 송출 기록 clue가 이 구역에 가장 많이 나타난다.
- `model_house_node`로 깊게 들어가는 이유: 송출 기록 3개가 모이면 R01 법칙의 중심과 보스 조우 준비 지점이 명확해진다.
- `drain_silence_pocket`으로 샛길을 타는 이유: 위험하지만 납 차폐 배터리, 무음 라디오, 이름 없는 영수증 같은 흔적/재료 후보가 있다.
- `fake_return_route`를 확인하는 이유: 캠페인이 실제 회수 동선을 학습하고 흉내내기 시작했는지 확인한다. 이 구역은 목표 UI가 아니라 위험한 위장 경로다.

## Expansion Hooks

반복 방문과 진행 상태에 따라 확장될 수 있는 구역:

| 상태 | 확장/개방 구역 | 변화 |
| --- | --- | --- |
| 첫 방문 | `silence_edge`, `subdivision_house_loop` 중심 | 낮은 광고 농도, 기본 우편함/쿠폰 구조 확인 |
| 첫 회수 이후 | `drain_silence_pocket` hint 강화 | 위험 회수 구역과 trace/material 후보가 읽히기 시작 |
| 송출 기록 1/3 | `fake_return_route` 약한 개방 | 가로등 방송과 추천 동선이 늘어남 |
| 송출 기록 2/3 | `model_house_node` 접근부 확장 | 가족 창문 잔상, kiosk socket, floor plan line 증가 |
| 송출 기록 3/3 | `model_house_node` 명확화 | open-house signs가 같은 방향을 가리키고 보스 조우 준비 |
| 보스 처리 후: 결절 파괴 | `drain_silence_pocket`, 조용한 문패 조사 route 확장 | 광고 농도 감소, 구조/문패 회수 목표 증가, fake route 일부 끊김 |
| 보스 처리 후: 기억 추출 | `fake_return_route`, 가족사진/기억 route 확장 | 가족사진 잔상 증가, fake memory/photo flash 위험 증가 |
| 반복 실패/pressure 상승 | `fake_return_route`, `subdivision_house_loop` 변형 | player path를 따라 전단/추천 동선/가로등 방송이 더 직접적으로 배치 |

## 3. R01을 RPG 로컬 맵으로 보는 원칙

### 3.1 Prop은 장식이 아니라 지역 문장이다

R01의 prop은 아래 역할 중 하나 이상을 가져야 한다.

| Prop 계열 | 위치 이유 | RPG 역할 |
| --- | --- | --- |
| 집 | 모델하우스 상품 구역. 같은 가족 상품을 반복 복제하는 표면 | 반복 방문 시 같은 집 구조와 이름 덮어쓰기를 드러냄 |
| 우편함 | 개인 편지가 광고 탄/스폰 장치로 바뀐 생활 인프라 | 원거리 압박, flyer spawn, 이름 없는 영수증 후보 |
| 배수구 | 캠페인 물질이 생활 인프라 아래로 새는 지점 | 슬라임 위험, 침묵 주머니, 납 차폐 배터리/무음 라디오 후보 |
| 가로등 | 방송/감시/목표 안내를 겸하는 친절한 스피커 | 송출 기록, 추천 동선, 가짜 귀환로 위험 신호 |
| 초인종 | 집에 돌아가는 감각을 이벤트/스턴/가족사진으로 왜곡 | 가족사진 플래시, 녹슨 초인종 흔적 후보 |
| 문패/태그 | 사람 이름이 상품명, 가격표, 고객 프로필로 덮이는 표식 | 지워지지 않은 문패, 이름 회수, 보스 후 변화 |
| 모델하우스 노드 | R01 캠페인 법칙이 응축되는 지역 결절 접근점 | 송출 기록, 보스 전조, 후속 송출관 잔향 |

### 3.2 화면은 세 위험 대역으로 읽힌다

```text
center combat field:
  낮은 디테일, 낮은 대비, 이동과 적/telegraph 가독성 우선

mid-risk lanes:
  스폰, 위험, 흔적 후보가 있는 의미 있는 prop만 허용

edge story frame:
  집, 창문, 표지판, 가로등, 모델하우스 장치가 지역 법칙을 설명
```

중앙은 예쁜 배경을 보여주는 곳이 아니라 플레이어가 살아남는 곳이다. R01의 세계관 설명은 주로 외곽과 중위험 라인에 놓고, 중앙에 들어오는 prop은 `왜 위험/보상/스폰과 연결되는지`가 명확해야 한다.

### 3.3 구역은 실제 월드 좌표와 이동 동선을 가져야 한다

0.2 또는 첫 Godot 테스트에서는 하나의 로컬 맵 안에 시작 지점, 주택 루프, 결절 접근부, 배수로 샛길, 가짜 회수 우회로를 배치할 수 있다. 단, 이것은 한 viewport 안에 전부 넣는 장식 구성이 아니라 여러 camera screen을 이동하며 체감하는 월드 구역이어야 한다. 장기적으로는 각 구역이 별도 로컬 셀 또는 연결된 submap으로 확장될 수 있다.

간단 연결 구조:

```text
silence_edge
  -> subdivision_house_loop
      -> model_house_node
      -> drain_silence_pocket
      -> fake_return_route
```

`drain_silence_pocket`은 항상 주동선에서 살짝 벗어난 위험 보상 pocket이어야 한다. `fake_return_route`는 실제 회수 UI를 대체하지 않고, 캠페인이 회수 동선을 흉내내는 환경 구역으로만 작동한다. 상세 인접 관계와 상대 위치는 `Zone Adjacency`, `Zone Relative Position`, `Travel Logic` 섹션을 기준으로 한다.

### 3.4 반복 방문은 prop 밀도보다 prop 의미를 바꾼다

반복 방문 변화는 단순히 더 많은 장식을 뿌리는 방식이 아니다.

- 첫 방문: prop이 세계를 설명한다.
- 첫 회수 이후: prop이 플레이어의 이동을 학습하기 시작한다.
- 송출 기록 진행: prop이 같은 방향, 같은 집, 같은 가족 이미지를 더 명확히 가리킨다.
- 보스 처리 후: prop이 조용해지거나, 반대로 기억을 더 많이 내보낸다.

### 3.5 보스는 배치 논리의 중심이지만, 이 문서는 보스를 만들지 않는다

`model_house_node_prop`, `family_window_loop_prop`, `doorbell_projector_prop`, `open_house_sign_prop`는 스마일 홈 시어머니와 연결되는 환경적 문맥을 만든다. 단, 이 문서와 atlas는 보스 본체를 포함하거나 재제작하지 않는다.

## 4. 하위 구역 5개 정의

### 4.1 침묵 가장자리

```text
zone_id:
  silence_edge
display_name:
  침묵 가장자리
role:
  보급소와 이어지는 낮은 농도 입구이자 첫 조작/목표 읽기 완충 구역.
player_goal:
  안전한 공간에서 이동, 적 방향, 회수선 감각, R01의 낮은 광고 농도를 읽는다.
visual_identity:
  크림/피치 중심 바닥, 낮은 광고 밀도, 드문 전단, 신호가 끊긴 듯한 여백, 보급소 회수선이 닿는 느낌.
required_props:
  - ground_tile
  - sidewalk_tile
  - center_floor_variant_a
  - tiny_paper_fragment_a
  - recommended_route_decal_weak at very low opacity
optional_props:
  - flyer_pile_prop sparse
  - mailbox_device_prop one distant hint only
  - streetlight_speaker_prop edge only
enemy_bias:
  쿠폰 전단 떼 소수, 낮은 압박의 basic swarm.
hazard_bias:
  거의 없음. hazard가 있어도 tutorial 수준의 약한 flyer drop 또는 distant mailbox hint.
trace_candidates:
  - 첫 광고 잡음
  - 보급소 회수선 흔적
  - 이름 없는 영수증 낮은 확률
entry_condition:
  R01 진입 시작 지점. 첫 방문과 일반 재방문 모두 여기서 출발 가능.
exit_or_transition:
  추천 동선 흔적을 따라 subdivision_house_loop로 진입한다. 첫 회수 이후에는 fake_return_route와 시각적으로 대비된다.
revisit_changes:
  재방문이 늘수록 recommended_route_decal_weak가 조금 더 또렷해지지만, 실제 UI 회수 방향과 혼동되지 않게 낮은 opacity를 유지한다.
boss_outcome_changes:
  destroy_node: 광고 전단 밀도 감소, 일부 문패/바닥 흔적이 더 조용해짐.
  extract_memory: 낮은 농도에도 가족사진 냄새/빈 고객란 암시가 섞임.
notes:
  이 구역은 캠페인이 아직 완전히 장악하지 못한 가장자리다. 적 스폰 이유는 침투가 아니라 새어나온 광고 물질의 잔류다.
```

### 4.2 분양 주택 루프

```text
zone_id:
  subdivision_house_loop
display_name:
  분양 주택 루프
role:
  기본 전투 공간. 같은 집 반복, 쿠폰 전단 떼, 미소 우편함, 추천 동선이 주력으로 나타나는 R01의 표준 루프.
player_goal:
  기본 웨이브를 상대하며 같은 모델하우스 상품이 복제되는 구조를 읽고, 송출 기록/흔적 후보를 찾는다.
visual_identity:
  외곽에 반복 배치된 house_front_prop_small, 우편함, 전단 더미, 가격표/고객 태그, 약한 바닥 안내선.
required_props:
  - house_front_prop_small
  - mailbox_device_prop
  - flyer_pile_prop
  - price_tag_decal
  - customer_tag_decal
  - recommended_route_decal_weak
  - center_floor_variant_b
optional_props:
  - balloon_prop
  - queue_guide_fence_prop
  - sprinkler_slime_prop
  - family_window_loop_prop
enemy_bias:
  쿠폰 전단 떼, 미소 우편함, 세일 풍선 계열. 반복 실패 또는 캠페인 농도 상승 시 mailbox/flyer 조합 증가.
hazard_bias:
  우편함 광고탄, 희박한 slime puddle, 추천 동선 장판 전조 후보.
trace_candidates:
  - 지워지지 않은 문패
  - 이름 없는 영수증
  - 오래된 쿠폰북
  - 반품 스티커 묶음
entry_condition:
  silence_edge 이후 기본 진입. 첫 회수 이후부터 광고 prop 증가.
exit_or_transition:
  open_house_sign_prop와 route decal이 model_house_node 방향을 암시한다. drain_silence_pocket은 루프 바깥쪽 utility line에서 갈라진다.
revisit_changes:
  같은 집 구조가 더 노골적으로 반복된다. customer_tag_decal과 price_tag_decal이 문패 위치를 더 많이 덮고, flyer_pile_prop는 tiny LOD 조각으로 흔적을 남긴다.
boss_outcome_changes:
  destroy_node: 같은 집 반복 빈도가 줄기보다 광고 표면이 벗겨져 일부 문패가 보임.
  extract_memory: 가족 창문 잔상과 사진 panel이 증가해 같은 집이 더 슬프고 기묘하게 읽힘.
notes:
  이 구역의 집은 실제 거주지라기보다 복제된 모델하우스 front다. 예쁜 집 배치가 아니라 상품 복제 루프를 보여주는 구역이다.
```

### 4.3 모델하우스 결절

```text
zone_id:
  model_house_node
display_name:
  모델하우스 결절
role:
  보스/송출 기록/지역 결절 중심. R01의 법칙이 가장 강하게 응축되는 환경 중심.
player_goal:
  송출 기록 3/3 이전에는 전조를 읽고, 3/3 이후에는 보스 조우 준비 상태를 확인한다.
visual_identity:
  모델하우스 장치, 상담 키오스크 socket, 가족 창문 loop, 약한 평면도 선, 초인종 projector, 같은 방향을 가리키는 open-house sign.
required_props:
  - model_house_node_prop
  - consultation_kiosk_socket_prop
  - family_window_loop_prop
  - floor_plan_line_decal_weak
  - doorbell_projector_prop
  - open_house_sign_prop
optional_props:
  - house_front_prop_full edge only
  - family_profile_panel_decal
  - transmitter_residue_hint foreshadow only
  - streetlight_speaker_prop
enemy_bias:
  행복 보증 상담원, 미소 우편함, family-photo event source, 보스 전조 wave.
hazard_bias:
  사진 플래시/스턴 전조, 추천 평면도형 이동 제한 전조, 상담 예약 marker 후보.
trace_candidates:
  - 반쯤 탄 가족사진
  - 녹슨 초인종
  - 송출 기록
  - 지워지지 않은 문패
entry_condition:
  초반에는 외곽 전조로만 보인다. broadcast_records_decoded가 진행될수록 접근 의미가 강해지고, 3/3 이후 보스 조우 절차가 명확해진다.
exit_or_transition:
  boss encounter 또는 후속 송출관 잔향 목표로 이어진다. 보스 미처리 상태에서는 일반 회수와 별도 목표 문구로 분리한다.
revisit_changes:
  송출 기록 1/3 이후 streetlight_speaker_prop와 route decal 증가. 2/3 이후 family_window_loop_prop와 kiosk socket 증가. 3/3 이후 open_house_sign_prop가 같은 방향을 가리킨다.
boss_outcome_changes:
  destroy_node: node 조명이 약해지고 문패/창문 일부가 조용해짐. 구조/문패 회수 목표가 늘어남.
  extract_memory: family_window_loop_prop와 family_profile_panel_decal이 늘고, fake memory/photo flash 위험이 증가함.
notes:
  이 구역은 보스 본체가 아니라 보스가 나올 수밖에 없는 환경적 중심이다. 스마일 홈 시어머니와 캠페인 송출관을 같은 존재로 합치지 않는다.
```

### 4.4 배수로 침묵 주머니

```text
zone_id:
  drain_silence_pocket
display_name:
  배수로 침묵 주머니
role:
  숨은 단서, 침묵권, 위험 회수 구역. 슬라임 배수구와 침묵 신호가 충돌하는 곳.
player_goal:
  더 위험한 utility line에 들어가 trace/material 후보를 얻고, 캠페인 신호가 약한 틈을 확인한다.
visual_identity:
  muted color tiles, toxic_ad_drain_prop, low-detail floor crack, tiny paper fragments, 낮은 채도의 바닥, 신호가 죽은 가장자리.
required_props:
  - toxic_ad_drain_prop
  - center_floor_variant_c
  - tiny_paper_fragment_a
  - tiny_paper_fragment_b
  - tiny_coupon_chip sparse
  - campaign_floor_decal_weak at low opacity
optional_props:
  - sprinkler_slime_prop
  - transmitter_residue_hint weak and rare
  - homecare_vacuum_dock_prop broken variant later
enemy_bias:
  세일 풍선, slime source와 연결된 flyer, 낮은 수의 mailbox 또는 cleaning robot.
hazard_bias:
  슬라임 puddle, 배수구 leak, 시야/동선 방해. 단 중앙 spawn point에 직접 겹치지 않는다.
trace_candidates:
  - 납 차폐 배터리
  - 무음 라디오
  - 이름 없는 영수증
  - 지역 정보 조각
entry_condition:
  subdivision_house_loop의 mid-risk lane에서 분기. 첫 방문에는 암시만, 첫 회수 이후부터 회수 구역으로 읽힌다.
exit_or_transition:
  안전하게 나오면 루프 바깥쪽 또는 silence_edge 가까운 쪽으로 복귀한다. fake_return_route와 혼동되지 않게 UI 방향표시는 쓰지 않는다.
revisit_changes:
  캠페인 pressure가 오르면 toxic leak가 더 보이지만, silence pocket에서는 일부 방송/route decal이 끊긴다.
boss_outcome_changes:
  destroy_node: leak 약화, 침묵 재료/문패 조사 후보 증가.
  extract_memory: leak는 남고 사진/영수증 trace chance 증가. 가짜 가족 목소리 위험이 낮게 섞일 수 있음.
notes:
  위험하지만 들어갈 이유가 있는 구역이다. 배수구는 장식 구멍이 아니라 캠페인 물질과 침묵권이 충돌하는 출처다.
```

### 4.5 가짜 귀환로

```text
zone_id:
  fake_return_route
display_name:
  가짜 귀환로
role:
  회수/탈출 방향을 캠페인이 흉내내는 구역. 반복 실패와 보스 후 재방문 변형에 중요하다.
player_goal:
  친절한 길안내가 실제 회수 UI가 아니라 캠페인의 학습 결과임을 읽고, 위험을 감수할지 우회할지 판단한다.
visual_identity:
  recommended_route_decal_weak, streetlight_speaker_prop, open_house_sign_prop, customer tag, fake recovery marker, transmitter residue hint.
required_props:
  - recommended_route_decal_weak
  - streetlight_speaker_prop
  - open_house_sign_prop
  - customer_tag_decal
  - transmitter_residue_hint
optional_props:
  - road_arc_tile edge route only
  - campaign_floor_decal_weak
  - flyer_pile_prop
  - mailbox_device_prop
enemy_bias:
  player path를 따라오는 coupon/flyer, 가로등 방송 이후 mailbox shot, 반복 실패 시 맞춤형 추적 wave.
hazard_bias:
  route arrow 주변의 약한 bait, 추천 동선 장판 후보, fake memory/photo flash 후퇴 압박.
trace_candidates:
  - 조작된 구조 신호 씨앗
  - 이름 없는 영수증
  - 송출관 잔향
  - 무음 라디오 hint
entry_condition:
  첫 회수 이후 또는 반복 방문 시 더 명확해진다. 보스 후에는 outcome별로 의미가 달라진다.
exit_or_transition:
  실제 회수 UI와는 분리한다. 이 구역의 화살표는 월드 prop이며, UI 회수선은 별도 색/레이어/문구로 구분한다.
revisit_changes:
  반복 실패 또는 campaign_pressure 상승 시 플레이어의 이전 이동선을 따라 route decal과 flyer pile이 놓인다.
boss_outcome_changes:
  destroy_node: fake route 일부가 끊기고 실제 문패/구조 목표 쪽 단서가 보임. 추적형 엘리트 가능성.
  extract_memory: fake route가 가족 목소리/사진 방향으로 더 설득력 있게 변함. photo flash 위험 증가.
notes:
  캠페인이 플레이어의 회수 동선을 학습해 친절한 길안내처럼 위장한 구역이다. 실제 목표 UI와 헷갈리게 만들면 안 된다.
```

## 5. 구역별 prop 배치 규칙

### 5.1 침묵 가장자리 배치 규칙

- 중앙 60%는 `ground_tile`, `sidewalk_tile`, `center_floor_variant_a` 위주로 둔다.
- 첫 15-30초 안에 위험 prop을 밀집시키지 않는다.
- `mailbox_device_prop`는 보이더라도 먼 edge 또는 mid-risk 입구에 하나만 둔다.
- `streetlight_speaker_prop`는 보급소 통신과 캠페인 방송의 경계 느낌을 주되, 적 spawner처럼 읽히지 않게 한다.
- `recommended_route_decal_weak`는 실제 목표 화살표가 아니라 희미한 환경 흔적으로만 쓴다.

### 5.2 분양 주택 루프 배치 규칙

- `house_front_prop_small`은 반복 간격을 의도적으로 비슷하게 둔다.
- 같은 집 반복을 단순 리소스 재사용으로 보이지 않게, 문패 위치에는 `price_tag_decal` 또는 `customer_tag_decal`을 교대 배치한다.
- `mailbox_device_prop`는 집 front와 lane 사이에 둔다. 이유는 우편함이 집의 개인 통신을 광고 탄으로 바꾸는 장치이기 때문이다.
- `flyer_pile_prop`는 중앙에는 sparse하게, edge에는 더 많이 둘 수 있다.
- `queue_guide_fence_prop`는 잔디밭/driveway를 쇼룸 관람 동선처럼 바꾸는 edge prop으로 사용한다.

### 5.3 모델하우스 결절 배치 규칙

- `model_house_node_prop`는 중심 좌표가 아니라 구역 중심의 edge-facing anchor에 둔다. 전투 중앙을 먹지 않으면서 결절 방향을 만든다.
- `consultation_kiosk_socket_prop`는 엘리트 spawn 또는 appointment zone의 이유를 제공한다.
- `doorbell_projector_prop`는 가족사진/스턴/event trigger의 source로만 쓰고, danger telegraph는 별도 gameplay layer로 만든다.
- `floor_plan_line_decal_weak`는 모델하우스 법칙을 암시하되 실제 blocking wall과 혼동되지 않게 낮게 둔다.
- `open_house_sign_prop`는 송출 기록 3/3 단계에서 같은 방향을 가리키도록 배치한다.

### 5.4 배수로 침묵 주머니 배치 규칙

- `toxic_ad_drain_prop`는 중앙 spawn point 바로 옆에 두지 않는다. lane edge나 pocket 진입부가 적합하다.
- `campaign_floor_decal_weak`는 독성 leak와 겹쳐도 실제 hazard outline보다 약해야 한다.
- tiny LOD 조각은 종이 밀도보다 신호가 죽어 떨어진 잔해로 보이게 낮은 밀도로 둔다.
- trace 후보는 drain 가까이에 두되, 반드시 위험 회수 동선을 만든다.
- 초록색 leak는 윤서 차징/독 장판 telegraph와 value 차이를 둔다.

### 5.5 가짜 귀환로 배치 규칙

- `recommended_route_decal_weak`와 `open_house_sign_prop`는 친절한 길안내처럼 보이되 UI 목표표식과 다른 색/불투명도/레이어를 쓴다.
- `streetlight_speaker_prop`는 fake route의 목소리 anchor다. 이 prop 없이 route만 있으면 단순 장식 화살표가 된다.
- `transmitter_residue_hint`는 후속 송출관 잔향 암시로만 둔다. 스마일 홈 시어머니와 합치지 않는다.
- 반복 실패 후에는 이전 player path 근처에 flyer pile 또는 tiny coupon trail을 둬 캠페인이 학습했다는 감각을 준다.
- 보스 후에는 outcome에 따라 fake route가 끊기거나, 더 설득력 있는 가족사진 방향으로 강화된다.

## 6. asset_id별 배치 논리

### 6.1 Tiles

```text
asset_id: ground_tile
primary_zones:
  - silence_edge
  - subdivision_house_loop
placement_reason:
  R01의 기본 전투 판독 바닥. 광고 생태계가 얹히기 전의 낮은 정보량 표면이다.
gameplay_role:
  이동, 적, projectile, pickup을 읽게 하는 기본 contrast floor.
story_role:
  침묵 보급소 가까운 생활권이 아직 완전히 광고 표면으로 덮이지 않았음을 보여준다.
spawn_or_event_use:
  없음. spawn source가 아니라 안전한 기본층이다.
revisit_variant:
  첫 회수 이후 tiny paper와 weak route 흔적이 늘어날 수 있다.
boss_outcome_variant:
  Destroy node: 더 깨끗하고 조용한 구역이 생김.
  Extract memory: 작은 사진/영수증 잔향 decal이 edge 쪽에 붙을 수 있음.
placement_rules:
  중앙 기본 tile로 사용. saturation과 contrast는 enemy/VFX보다 낮게 유지.
avoid:
  실제 danger telegraph와 비슷한 큰 도형이나 강한 색을 추가하지 않는다.
```

```text
asset_id: road_arc_tile
primary_zones:
  - fake_return_route
  - subdivision_house_loop edge roads
placement_reason:
  동네의 도로/회전로가 캠페인의 추천 동선처럼 굽어 보이는 edge route다.
gameplay_role:
  edge orientation과 fake route framing.
story_role:
  회수/탈출 방향을 캠페인이 교외 도로 안내처럼 흉내낸다.
spawn_or_event_use:
  fake route event나 streetlight broadcast 근처의 환경 anchor.
revisit_variant:
  반복 실패 후 더 명확한 route arc로 보일 수 있으나 실제 UI와 분리한다.
boss_outcome_variant:
  Destroy node: 일부 arc가 끊겨 보임.
  Extract memory: arc 옆에 family/profile residue가 늘 수 있음.
placement_rules:
  edge_only. 큰 ring처럼 중앙에 두지 않는다.
avoid:
  보스/위험 장판의 원형 telegraph처럼 읽히는 배치 금지.
```

```text
asset_id: sidewalk_tile
primary_zones:
  - silence_edge
  - subdivision_house_loop
placement_reason:
  보급소와 주택가 사이의 보행 생활권 경계다.
gameplay_role:
  낮은 디테일의 lane 구분. 중앙 배치 가능.
story_role:
  평범한 귀가 동선이 오픈하우스 관람 동선으로 바뀌는 바탕.
spawn_or_event_use:
  초반 안내, safe lane, weak route와 함께 사용.
revisit_variant:
  customer tag, tiny paper가 가장자리 쪽에 조금씩 증가.
boss_outcome_variant:
  Destroy node: 보도 위 광고 잔해 감소.
  Extract memory: 보도 가장자리에 사진/문패 흔적 후보 증가.
placement_rules:
  center_allowed. grid나 lane을 만들되 tactical wall처럼 보이지 않게 한다.
avoid:
  고대비 crack으로 projectile을 가리지 않는다.
```

```text
asset_id: center_floor_variant_a
primary_zones:
  - silence_edge
placement_reason:
  첫 진입 완충 구역의 가장 조용한 바닥이다.
gameplay_role:
  조작 학습, 초기 enemy read, UI 목표 확인.
story_role:
  캠페인이 아직 완전히 장악하지 못한 경계의 여백.
spawn_or_event_use:
  첫 방문 intro와 낮은 밀도 시작 지점.
revisit_variant:
  첫 회수 이후에도 가장 낮은 광고 농도 구역으로 유지.
boss_outcome_variant:
  Destroy node: 더 넓게 보일 수 있음.
  Extract memory: 사진 냄새/빈 고객란 같은 문구와만 연결하고 시각 밀도는 낮게 유지.
placement_rules:
  시작 지점 주변에 우선 사용.
avoid:
  flyer pile이나 mailbox를 과하게 얹어 완충 역할을 잃게 하지 않는다.
```

```text
asset_id: center_floor_variant_b
primary_zones:
  - subdivision_house_loop
  - model_house_node approach
placement_reason:
  반복 주택 루프의 약한 평면도 흔적을 받아낼 수 있는 중심 바닥.
gameplay_role:
  기본 전투 공간에서 낮은 정보량 유지.
story_role:
  같은 집 평면이 바닥 법칙처럼 스며드는 암시.
spawn_or_event_use:
  mailbox/flyer wave가 지나간 뒤에도 읽히는 낮은 detail base.
revisit_variant:
  송출 기록 1/3 이후 floor-plan 느낌이 약간 증가.
boss_outcome_variant:
  Destroy node: floor-plan trace 약화.
  Extract memory: 가족사진/평면도 잔향이 유지.
placement_rules:
  중앙과 mid-risk lane에 사용 가능.
avoid:
  실제 추천 평면도 보스 패턴과 같은 강도로 쓰지 않는다.
```

```text
asset_id: center_floor_variant_c
primary_zones:
  - drain_silence_pocket
  - fake_return_route weak edge
placement_reason:
  흐릿한 route stain과 crack이 신호 불안정 구역에 맞는다.
gameplay_role:
  pocket/side lane의 분위기 구분.
story_role:
  캠페인 신호가 새거나 끊기는 바닥 흔적.
spawn_or_event_use:
  drain leak, fake route bait, low signal event와 연결.
revisit_variant:
  campaign pressure 상승 시 leak/stain 주변 tiny LOD 증가.
boss_outcome_variant:
  Destroy node: stain이 끊기고 silence pocket이 넓어짐.
  Extract memory: stain 주변 trace 후보가 증가.
placement_rules:
  mid-risk나 side pocket 중심.
avoid:
  전체 중앙 바닥을 이 variant로 덮어 route guide처럼 보이게 하지 않는다.
```

### 6.2 Edge Props / Interactive Props

```text
asset_id: house_front_prop_full
primary_zones:
  - model_house_node
  - subdivision_house_loop outer edge
placement_reason:
  완전한 모델하우스 상품 전시물. R01 법칙을 크게 보여주는 외곽 facade다.
gameplay_role:
  경계, 시선 방향, 결절 전조. 전투 중앙에는 개입하지 않는다.
story_role:
  집이 거주지가 아니라 가족 상품 showroom으로 바뀐 상태를 보여준다.
spawn_or_event_use:
  보스 전조, 송출 기록 2/3 이상, 큰 open-house route framing.
revisit_variant:
  반복 방문 시 같은 facade가 다른 문패/가족사진으로 반복된다.
boss_outcome_variant:
  Destroy node: 일부 창문/표지판이 꺼지고 문패 후보가 드러남.
  Extract memory: 가족 창문 잔상과 profile panel이 강화됨.
placement_rules:
  edge_only, foreground_edge. hard_block일 때는 이동 경계와 일치시킨다.
avoid:
  중앙 전투 영역으로 침범하거나 player/enemy를 가리지 않는다.
```

```text
asset_id: house_front_prop_small
primary_zones:
  - subdivision_house_loop
placement_reason:
  반복되는 완벽한 가족 상품의 기본 unit이다.
gameplay_role:
  외곽 반복 리듬과 lane boundary.
story_role:
  같은 집 반복 현상을 단순 tile 재사용이 아니라 캠페인 법칙으로 읽게 한다.
spawn_or_event_use:
  mailbox, doorbell, price/customer tag와 조합해 house cluster spawn anchor를 만든다.
revisit_variant:
  같은 위치에 비슷한 집이 반복되지만 문패/태그가 조금씩 달라진다.
boss_outcome_variant:
  Destroy node: 일부 house가 광고 표면을 잃고 조용해짐.
  Extract memory: house마다 가족 잔상이 더 잘 보임.
placement_rules:
  edge_only. 480x270 viewport에서는 한 순간에 2-4개 정도가 읽히는 밀도를 우선.
avoid:
  예쁜 교외 장식으로만 보이게 단독 배치하지 않는다. tag/window/route와 묶는다.
```

```text
asset_id: family_window_loop_prop
primary_zones:
  - model_house_node
  - subdivision_house_loop
placement_reason:
  빈집 창문이 실제 가족이 아니라 광고 잔상 loop를 출력한다.
gameplay_role:
  보스 전조, memory route, family-photo event source hint.
story_role:
  가족 기억이 광고 이미지로 재생산되는 슬픔을 보여준다.
spawn_or_event_use:
  송출 기록 2/3 이후 증가. extract_memory 후 photo flash 위험과 연결 가능.
revisit_variant:
  반복 방문 시 손 흔드는 실루엣이 더 명확해지거나 같은 가족 구성이 반복된다.
boss_outcome_variant:
  Destroy node: 일부 창문이 꺼짐.
  Extract memory: 잔상이 증가하고 빈자리가 플레이어를 향함.
placement_rules:
  edge_only, house facade나 model node 주변.
avoid:
  중앙에 독립 prop처럼 세워 실제 NPC나 목표처럼 보이게 하지 않는다.
```

```text
asset_id: open_house_sign_prop
primary_zones:
  - subdivision_house_loop
  - model_house_node
  - fake_return_route
placement_reason:
  캠페인이 모든 길을 모델하우스 관람 동선으로 바꾼다.
gameplay_role:
  방향 암시, elite/boss 전조, fake route bait.
story_role:
  동네 전체가 매물화되었음을 직접적으로 보여준다.
spawn_or_event_use:
  송출 기록 3/3에서 같은 방향을 가리키며 보스 접근을 준비.
revisit_variant:
  반복 방문 시 표지판 수보다 방향 일치가 더 중요해진다.
boss_outcome_variant:
  Destroy node: 일부 sign이 넘어지거나 방향성이 깨짐.
  Extract memory: sign이 가족사진/기억 구역으로 더 설득력 있게 안내.
placement_rules:
  edge_only 또는 fake route edge. collision은 soft_block.
avoid:
  실제 objective arrow와 같은 시각 위계 금지.
```

```text
asset_id: balloon_prop
primary_zones:
  - subdivision_house_loop
  - model_house_node edge
placement_reason:
  오픈하우스 행사 표면을 만드는 보조 판촉물이다.
gameplay_role:
  sales event mood, 세일 풍선 enemy와 테마 연결.
story_role:
  밝고 친절한 표면이 오래 켜져 있는 불편함.
spawn_or_event_use:
  open-house day variant, balloon enemy spawn hint로 제한.
revisit_variant:
  캠페인 pressure 상승 시 바람 빠진 풍선 또는 더 많은 행사 흔적.
boss_outcome_variant:
  Destroy node: 풍선이 꺼지고 흔들림 감소.
  Extract memory: 사진 촬영회/가족 행사 잔향과 묶임.
placement_rules:
  edge_only, low density.
avoid:
  R01 세계관을 풍선/표지판만으로 설명하려 하지 않는다.
```

```text
asset_id: queue_guide_fence_prop
primary_zones:
  - subdivision_house_loop
  - model_house_node
placement_reason:
  마당과 보도를 쇼룸 관람 대기 동선으로 바꾸는 장치다.
gameplay_role:
  edge boundary, route funnel, soft obstacle.
story_role:
  생활 공간이 판매 절차와 고객 동선으로 재배열되었음을 보여준다.
spawn_or_event_use:
  consultation kiosk socket, recommended route와 조합.
revisit_variant:
  반복 방문 시 더 많은 집 앞이 줄 서는 구조로 변함.
boss_outcome_variant:
  Destroy node: 일부 guide line이 끊김.
  Extract memory: 가족사진/상담 대기 동선으로 유지.
placement_rules:
  edge_only. collision은 soft_block이되 player path를 과하게 좁히지 않는다.
avoid:
  중앙 회피 공간을 울타리로 나누지 않는다.
```

```text
asset_id: mailbox_device_prop
primary_zones:
  - subdivision_house_loop
  - fake_return_route
placement_reason:
  개인 편지가 광고 전단/탄환으로 변환되는 생활 인프라 source다.
gameplay_role:
  ranged shot source, flyer spawn hint, mid-risk lane pressure.
story_role:
  사적인 통신이 캠페인 제안으로 덮인 상태를 보여준다.
spawn_or_event_use:
  미소 우편함 spawn, ad-flyer projectile, 이름 없는 영수증 후보.
revisit_variant:
  첫 회수 이후 우편함이 더 자주 플레이어 동선을 바라봄.
boss_outcome_variant:
  Destroy node: 일부 mailbox가 닫히거나 발사 빈도 연출 감소.
  Extract memory: 우편함이 가족/고객명 문구를 더 정확히 흉내냄.
placement_rules:
  mid_risk_only. 집 front와 lane 사이에 둔다.
avoid:
  중앙 spawn point 바로 옆, player 시작점, telegraph 위에 배치 금지.
```

```text
asset_id: doorbell_projector_prop
primary_zones:
  - model_house_node
  - subdivision_house_loop mid-risk
placement_reason:
  귀가/방문의 신호가 가족사진 projection, 짧은 stun, event trigger로 바뀐 장치다.
gameplay_role:
  photo flash warning source, short stun event anchor.
story_role:
  집에 들어가는 감각이 캠페인 가족 이미지로 대체됨.
spawn_or_event_use:
  녹슨 초인종 흔적, 기념사진 시간 전조, family window loop와 연결.
revisit_variant:
  송출 기록 2/3 이후 projection이 더 자주 켜짐.
boss_outcome_variant:
  Destroy node: projector가 꺼지거나 짧게 깜빡임.
  Extract memory: photo flash/fake memory 위험 증가.
placement_rules:
  mid_risk_only. 실제 stun telegraph는 gameplay_telegraph layer에서 별도 표시.
avoid:
  pink projection을 실제 danger 표시처럼 강하게 쓰지 않는다.
```

```text
asset_id: sprinkler_slime_prop
primary_zones:
  - subdivision_house_loop
  - drain_silence_pocket
placement_reason:
  잔디 관리 인프라가 물 대신 캠페인 슬라임을 뿌린다.
gameplay_role:
  slime puddle source, lane denial hint.
story_role:
  광고 물질이 생활 유지 시스템 안으로 들어왔음을 보여준다.
spawn_or_event_use:
  세일 풍선 폭발, drain leak, 청소기/홈케어 변형과 조합.
revisit_variant:
  pressure 상승 시 더 잘 보이지만 중앙 밀도는 제한.
boss_outcome_variant:
  Destroy node: slime pressure 약화.
  Extract memory: 슬라임은 남고 주변 trace chance가 증가할 수 있음.
placement_rules:
  mid_risk_only, lane edge. green value는 charge/poison telegraph와 분리.
avoid:
  player charge effect, XP, enemy outline을 가리는 녹색 덩어리 금지.
```

```text
asset_id: streetlight_speaker_prop
primary_zones:
  - fake_return_route
  - model_house_node
  - silence_edge edge
placement_reason:
  친절한 가로등 방송이 감시, 추천, 목표 안내를 겸한다.
gameplay_role:
  audio/text event anchor, fake route voice source, surveillance marker.
story_role:
  캠페인이 플레이어 상태를 고객 분석처럼 말하기 시작함.
spawn_or_event_use:
  송출 기록 1/3 이후 증가. fake recovery marker, route phrase trigger.
revisit_variant:
  반복 방문 시 윤서의 이동 패턴과 이름을 더 직접적으로 부름.
boss_outcome_variant:
  Destroy node: 방송이 늦거나 끊김.
  Extract memory: 가족 목소리/정확한 호명 위험 증가.
placement_rules:
  edge_only 또는 lane edge. 이벤트 anchor로 사용.
avoid:
  중앙에 세워 projectile/적 telegraph를 가리지 않는다.
```

```text
asset_id: toxic_ad_drain_prop
primary_zones:
  - drain_silence_pocket
  - subdivision_house_loop mid-risk lanes
placement_reason:
  캠페인 물질이 오래된 utility drain으로 새고, 신호 흐름이 불안정한 곳에 침묵 주머니가 생긴다.
gameplay_role:
  Slime puddle source, hazard warning source, trace-risk anchor.
story_role:
  광고 물질이 표지판뿐 아니라 생활 기반 시설 안으로 들어왔음을 보여준다.
spawn_or_event_use:
  sprinkler slime, flyer drop hazard, 납 차폐 배터리/무음 라디오 후보 위치.
revisit_variant:
  campaign pressure가 오르면 더 잘 보임. silence pocket에서는 일부 route signal이 끊김.
boss_outcome_variant:
  Destroy node: leak 약화.
  Extract memory: leak는 유지되고 trace chance 증가.
placement_rules:
  Mid-risk only, never central spawn point. pocket 진입 이유로 사용.
avoid:
  밝은 green player charge, poison telegraph와 value 충돌 금지.
```

```text
asset_id: homecare_vacuum_dock_prop
primary_zones:
  - subdivision_house_loop
  - drain_silence_pocket
placement_reason:
  홈케어 청소기가 먼지와 기억을 모두 불필요한 것으로 분류하는 docking 지점이다.
gameplay_role:
  cleaning robot spawn/socket hint, pickup pull/denial theme anchor.
story_role:
  원래 도와주던 가전이 광고 명령에 갇힌 생활 인프라임을 보여준다.
spawn_or_event_use:
  홈케어 청소기 wave, 리콜 청소일 variant, 청소기 먼지통 trace.
revisit_variant:
  로봇 자율성/청소기 흔적 이후 dock이 더 자주 보일 수 있음.
boss_outcome_variant:
  Destroy node: dock이 꺼진 채 남아 구조/조사 대상으로 바뀜.
  Extract memory: dock이 가족사진/생활물 회수 위험과 연결.
placement_rules:
  mid_risk_only, house/garage edge 근처.
avoid:
  모든 wave source를 dock으로 설명해 mailbox/drain 역할을 흐리지 않는다.
```

```text
asset_id: consultation_kiosk_socket_prop
primary_zones:
  - model_house_node
  - subdivision_house_loop high-risk edge
placement_reason:
  행복 보증 상담원이 등장하거나 상담 예약 패턴을 발행할 수 있는 무인 부동산 socket이다.
gameplay_role:
  elite spawn/objective socket, appointment marker source.
story_role:
  플레이어를 입주 후보로 분류하는 모델하우스 상담 시스템의 잔해.
spawn_or_event_use:
  행복 보증 상담원, 추천 매물 구역, 송출 기록 2/3 이후 결절 접근.
revisit_variant:
  송출 기록이 쌓이면 비어 있던 socket이 더 자주 켜짐.
boss_outcome_variant:
  Destroy node: socket이 꺼지고 조사 가능 residue로 남음.
  Extract memory: socket에 가족 상담 기록/사진 residue가 남음.
placement_rules:
  mid_risk_only 또는 model node edge. hard_block/trigger 여부를 명확히.
avoid:
  시작 지점 근처 배치 금지. elite spawn 이유가 없는 곳에 장식으로 두지 않는다.
```

```text
asset_id: flyer_pile_prop
primary_zones:
  - subdivision_house_loop
  - silence_edge sparse
  - fake_return_route
placement_reason:
  캠페인의 판촉 물질이 쌓인 곳이며, 쿠폰 전단 떼가 발생할 수 있는 바닥 source다.
gameplay_role:
  flyer spawn hint, minor hazard marker, trace clutter.
story_role:
  광고가 물리 물질이 되어 동네 표면에 계속 쌓인다.
spawn_or_event_use:
  쿠폰 전단 떼, 이름 없는 영수증, fake route trail.
revisit_variant:
  반복 방문 시 player path와 mailbox 주변에 더 자주 남음.
boss_outcome_variant:
  Destroy node: piles 감소, 종이 재만 남음.
  Extract memory: 영수증/사진 조각이 섞인 pile 증가.
placement_rules:
  center_allowed only sparse. high density에서는 tiny LOD로 대체.
avoid:
  적과 pickup을 덮는 큰 pile을 중앙에 반복 배치하지 않는다.
```

### 6.3 Decals / Node Hints / Tiny LOD

```text
asset_id: campaign_floor_decal_weak
primary_zones:
  - subdivision_house_loop mid-risk
  - drain_silence_pocket
  - fake_return_route
placement_reason:
  캠페인 표식이 바닥에 희미하게 남아 지역 법칙을 암시한다.
gameplay_role:
  배경 흔적. 실제 위험 telegraph가 아니다.
story_role:
  광고가 표면 장식이 아니라 바닥 법칙으로 스며든다.
spawn_or_event_use:
  추천 매물 구역 전조의 환경 버전. 실제 danger는 별도 layer.
revisit_variant:
  pressure 상승 시 살짝 증가하지만 high density에서는 거의 보이지 않게 한다.
boss_outcome_variant:
  Destroy node: 약화/끊김.
  Extract memory: family/profile residue와 함께 남음.
placement_rules:
  low opacity, decal_low_opacity_background.
avoid:
  붉은 사각형 danger zone처럼 보이는 value/alpha 금지.
```

```text
asset_id: recommended_route_decal_weak
primary_zones:
  - silence_edge
  - subdivision_house_loop
  - fake_return_route
placement_reason:
  캠페인이 플레이어 동선을 추천/학습하는 약한 바닥 안내선이다.
gameplay_role:
  orientation hint, fake route bait, non-telegraph path memory.
story_role:
  안전한 귀환로가 아니라 고객 동선 최적화다.
spawn_or_event_use:
  first recovery 이후, fake return route, 송출 기록 1/3 이후 증가.
revisit_variant:
  player 반복 경로 근처에 더 자주 나타남.
boss_outcome_variant:
  Destroy node: 일부 끊김.
  Extract memory: 가족사진/모델하우스 방향으로 더 설득력 있게 이어짐.
placement_rules:
  center_allowed if opacity low. UI arrow와 색/레이어 분리.
avoid:
  실제 목표/회수 UI로 오해되는 선명한 화살표 금지.
```

```text
asset_id: family_profile_panel_decal
primary_zones:
  - model_house_node
  - subdivision_house_loop edge
placement_reason:
  가족 구성과 고객 프로필을 광고 panel로 정리한 잔상이다.
gameplay_role:
  memory objective hint, model node buildup.
story_role:
  인간 가족이 프로필 패널과 구매 가능 이미지로 바뀐 상태.
spawn_or_event_use:
  송출 기록 2/3, extract_memory 후, 가족사진 촬영회 variant.
revisit_variant:
  반복 방문 시 빈 고객란 또는 같은 가족 구성 반복을 암시.
boss_outcome_variant:
  Destroy node: panel 일부가 깨지고 문패 후보가 보임.
  Extract memory: panel과 창문 잔상 증가.
placement_rules:
  edge_only, wall/fence/house front에 붙인다.
avoid:
  UI panel로 오해되도록 중앙에 선명하게 놓지 않는다.
```

```text
asset_id: price_tag_decal
primary_zones:
  - subdivision_house_loop
  - model_house_node edge
placement_reason:
  문패의 사람 이름이 가격/상품 표식으로 덮인 상태를 보여준다.
gameplay_role:
  trace hint, house repetition differentiation.
story_role:
  이름이 상품명으로 바뀌는 R01의 핵심 현상.
spawn_or_event_use:
  지워지지 않은 문패, 이름 회수 목표 근처.
revisit_variant:
  반복 방문 시 더 많은 문패 위치를 차지.
boss_outcome_variant:
  Destroy node: 일부 price tag 아래 원래 문패가 보임.
  Extract memory: price tag와 family photo residue가 함께 남음.
placement_rules:
  edge_only, house door/nameplate 위치.
avoid:
  실제 readable text를 이미지에 굽지 않는다.
```

```text
asset_id: customer_tag_decal
primary_zones:
  - subdivision_house_loop
  - fake_return_route
placement_reason:
  캠페인이 플레이어와 거주자를 고객 프로필로 분류하는 표식이다.
gameplay_role:
  fake route bait, profile hazard hint, repeated house marker.
story_role:
  인간을 고객란과 구매 기록으로 바꾸는 캠페인 법칙.
spawn_or_event_use:
  윤서의 빈 고객란, 이름 없는 영수증, fake recovery marker.
revisit_variant:
  반복 방문 시 윤서 또는 단골 고객 암시가 증가.
boss_outcome_variant:
  Destroy node: tag 일부가 비거나 찢김.
  Extract memory: 고객란이 더 정확하고 불편하게 변함.
placement_rules:
  edge_only. fake route에서는 낮은 opacity로 lane edge에 배치.
avoid:
  실제 UI status tag처럼 보이게 중앙에 선명하게 두지 않는다.
```

```text
asset_id: floor_plan_line_decal_weak
primary_zones:
  - model_house_node
  - subdivision_house_loop
placement_reason:
  모델하우스 평면도가 바닥 법칙처럼 새겨진 흔적이다.
gameplay_role:
  model node approach hint, weak environmental law marker.
story_role:
  동네가 거리가 아니라 판매용 집 평면으로 재해석됨.
spawn_or_event_use:
  추천 평면도 보스 패턴의 사전 암시. 실제 wall/blocking은 별도 telegraph.
revisit_variant:
  송출 기록 2/3 이후 model node 주변에서 더 잘 보임.
boss_outcome_variant:
  Destroy node: 선이 끊기고 일부 방 구획이 사라짐.
  Extract memory: family room, photo area 같은 느낌이 더 남음.
placement_rules:
  low opacity, center_allowed only if weak.
avoid:
  플레이어가 실제 벽으로 오해할 강도 금지.
```

```text
asset_id: model_house_node_prop
primary_zones:
  - model_house_node
placement_reason:
  R01 캠페인 법칙이 모이는 모델하우스 결절 접근 장치다.
gameplay_role:
  boss/context anchor, objective socket, 송출 기록 culmination.
story_role:
  스마일 홈 시어머니가 나올 수 있는 환경적 중심. 단, 보스 본체는 아니다.
spawn_or_event_use:
  송출 기록 3/3 이후 접근 명확화, 보스 전조, 후속 재방문 조사.
revisit_variant:
  기록 단계가 오를수록 더 잘 보이고 주변 sign이 같은 방향을 가리킴.
boss_outcome_variant:
  Destroy node: 꺼진 aftershock node, 구조/문패 목표 anchor.
  Extract memory: memory_afterimage node, 가족사진/기록 추출 anchor.
placement_rules:
  edge_only 또는 구역 중심 anchor. trigger collision.
avoid:
  보스처럼 움직이거나 공격하는 asset으로 취급하지 않는다.
```

```text
asset_id: transmitter_residue_hint
primary_zones:
  - fake_return_route
  - model_house_node
  - drain_silence_pocket rare
placement_reason:
  캠페인 송출관의 후속 잔향을 암시하는 작은 신호 흔적이다.
gameplay_role:
  post-boss/future objective hint, fake route signal source.
story_role:
  스마일 홈 시어머니와 상위 송출관을 분리해 장기 구조를 남긴다.
spawn_or_event_use:
  보스 후 낮은 확률 송출관 잔향 배너, 조작된 구조 신호 씨앗.
revisit_variant:
  송출 기록 3/3 또는 보스 처리 후 더 의미 있게 보임.
boss_outcome_variant:
  Destroy node: 약하지만 남아 있는 상위 신호.
  Extract memory: 가족사진 기록과 함께 더 선명한 후속 신호.
placement_rules:
  edge_only, rare. narrative hint로만 사용.
avoid:
  스마일 홈 시어머니와 송출관을 같은 보스로 합치는 배치 금지.
```

```text
asset_id: tiny_paper_fragment_a
primary_zones:
  - all zones
placement_reason:
  광고 물질이 완전히 적으로 조직되기 전의 종이 잔해다.
gameplay_role:
  density filler, movement trail, low-cost swarm atmosphere.
story_role:
  캠페인이 종이/전단/쿠폰 형태로 환경에 쌓임.
spawn_or_event_use:
  flyer pile 주변, mailbox shots 이후, silence edge sparse.
revisit_variant:
  반복 방문 시 player path와 house loop에 증가.
boss_outcome_variant:
  Destroy node: 감소 또는 재처럼 희미해짐.
  Extract memory: 사진/영수증 조각과 함께 남음.
placement_rules:
  8-12px display, no collision, low layer.
avoid:
  HP/AI 있는 enemy처럼 취급하지 않는다.
```

```text
asset_id: tiny_paper_fragment_b
primary_zones:
  - subdivision_house_loop
  - drain_silence_pocket
  - fake_return_route
placement_reason:
  방향성이 다른 paper fragment로 동선/바람/잔류 신호를 만든다.
gameplay_role:
  density variation, trail break-up.
story_role:
  같은 광고 물질이 계속 접히고 찢겨 반복되는 느낌.
spawn_or_event_use:
  fake route trail, drain pocket debris, high density background pressure.
revisit_variant:
  같은 집 반복이 심해질수록 작은 종이층 증가.
boss_outcome_variant:
  Destroy node: 감소.
  Extract memory: trace 후보 주변에 유지.
placement_rules:
  tiny_paper_fragment_a와 섞되 동일 pattern 반복을 피한다.
avoid:
  중앙을 종이 noise로 과하게 더럽히지 않는다.
```

```text
asset_id: tiny_coupon_chip
primary_zones:
  - subdivision_house_loop
  - fake_return_route
placement_reason:
  쿠폰 전단 떼와 오픈하우스 판촉물이 남긴 작은 조각이다.
gameplay_role:
  swarm pressure visual, flyer/coupon enemy trail.
story_role:
  혜택/쿠폰이 물리적 압박이 되는 R01 표면층.
spawn_or_event_use:
  coupon flyer spawn, open-house day, high density mock layer.
revisit_variant:
  반복 실패 또는 campaign pressure 상승 시 증가.
boss_outcome_variant:
  Destroy node: 감소.
  Extract memory: family/photo trace와 섞여 더 불편한 잔해가 됨.
placement_rules:
  9-14px, no collision, enemy보다 아래.
avoid:
  pickup과 같은 색/크기로 보이지 않게 한다.
```

```text
asset_id: tiny_ad_tag
primary_zones:
  - subdivision_house_loop
  - fake_return_route
  - model_house_node edge
placement_reason:
  고객 태그와 가격표가 작은 density layer로 흩어진 형태다.
gameplay_role:
  customer/profile pressure, low-detail ad clutter.
story_role:
  사람 이름이 작은 광고 label로 분해되는 현상.
spawn_or_event_use:
  customer tag areas, fake route, repeated house lanes.
revisit_variant:
  단골 고객 주간/윤서 빈 고객란 암시가 커질수록 증가.
boss_outcome_variant:
  Destroy node: 찢긴 tag가 남음.
  Extract memory: 더 정확한 customer/profile residue로 남음.
placement_rules:
  8-14px, no readable language.
avoid:
  UI tag처럼 보이지 않게 low opacity/low layer 사용.
```

```text
asset_id: tiny_density_noise_cluster
primary_zones:
  - subdivision_house_loop
  - high_density_global_layer
placement_reason:
  300마리 상황의 종이 밀도감을 위해 개별 적이 아닌 배경 pressure를 만든다.
gameplay_role:
  LOD3 density-only paper noise. draw call 절감 후보.
story_role:
  캠페인 물질이 날씨처럼 화면을 채우는 감각.
spawn_or_event_use:
  high campaign pressure, large swarm wave, 300-density visual layer.
revisit_variant:
  pressure가 높거나 반복 실패가 누적될 때 증가.
boss_outcome_variant:
  Destroy node: 크게 감소.
  Extract memory: 완전히 줄지 않고 photo/receipt residue와 섞임.
placement_rules:
  14-32px cluster, no collision, no HP, no AI, enemy/player보다 아래.
avoid:
  실제 enemy 수로 계산하거나 enemy silhouette을 가리는 과밀 배치 금지.
```

## 7. RPG 로컬 레이어 구조

```text
surface layer:
  광고 표면층

trace layer:
  문패, 가족사진, 이름 없는 영수증, 무음 라디오

infrastructure layer:
  우편함, 청소기, 초인종, 스프링클러, 배수구

campaign law layer:
  같은 집 반복, 추천 동선, 가족 프로필, 모델하우스 평면도

node layer:
  모델하우스 결절, 스마일 홈 시어머니 접근, 송출관 잔향
```

### 7.1 Surface Layer: 광고 표면층

맵에서 보이는 방식:

- 전단, 쿠폰, 풍선, 오픈하우스 표지판, 가격표, 작은 종이 조각.
- 밝고 친절하지만 과하게 반복되는 판촉 표면.

표현 prop:

- `flyer_pile_prop`
- `open_house_sign_prop`
- `balloon_prop`
- `price_tag_decal`
- `tiny_paper_fragment_a`
- `tiny_paper_fragment_b`
- `tiny_coupon_chip`

설계 원칙:

- 첫 방문에서 가장 먼저 읽히는 층이다.
- 단독으로 R01을 설명하지 않는다. surface layer만 있으면 "간판 붙은 교외"가 된다.

### 7.2 Trace Layer: 흔적층

맵에서 보이는 방식:

- 문패가 가격표 아래에 남아 있거나, 가족사진 panel이 광고 이미지와 겹친다.
- 이름 없는 영수증, 무음 라디오, 납 차폐 배터리는 위험 pocket 또는 결절 주변에서 암시된다.

표현 prop:

- `price_tag_decal`
- `customer_tag_decal`
- `family_profile_panel_decal`
- `family_window_loop_prop`
- `toxic_ad_drain_prop`
- `transmitter_residue_hint`

설계 원칙:

- trace는 전투 보상이자 누군가의 생활 흔적이다.
- trace 후보 위치는 위험/동선/이야기 이유가 있어야 한다.

### 7.3 Infrastructure Layer: 생활 인프라층

맵에서 보이는 방식:

- 우편함, 초인종, 스프링클러, 배수구, 청소기 dock, 가로등 speaker가 장치처럼 놓인다.
- 적/위험/이벤트가 갑자기 나오지 않고 생활 장치에서 발생한다.

표현 prop:

- `mailbox_device_prop`
- `doorbell_projector_prop`
- `sprinkler_slime_prop`
- `streetlight_speaker_prop`
- `toxic_ad_drain_prop`
- `homecare_vacuum_dock_prop`
- `consultation_kiosk_socket_prop`

설계 원칙:

- R01의 적은 군대가 아니라 생활 인프라가 광고 명령으로 재동기화된 결과다.
- mid-risk prop은 반드시 spawn, hazard, event, trace 중 하나와 연결한다.

### 7.4 Campaign Law Layer: 캠페인 법칙층

맵에서 보이는 방식:

- 같은 집 front가 반복된다.
- 추천 동선과 모델하우스 평면도가 낮은 opacity로 바닥에 남는다.
- 가족 프로필 panel과 customer tag가 동네를 판매 절차로 재배열한다.

표현 prop:

- `house_front_prop_full`
- `house_front_prop_small`
- `recommended_route_decal_weak`
- `floor_plan_line_decal_weak`
- `family_profile_panel_decal`
- `customer_tag_decal`
- `queue_guide_fence_prop`

설계 원칙:

- 반복 방문할수록 가장 중요한 층이다.
- 같은 집 반복은 리소스 재사용이 아니라 R01 법칙으로 읽혀야 한다.

### 7.5 Node Layer: 결절층

맵에서 보이는 방식:

- 모델하우스 결절, 상담 kiosk socket, 같은 방향의 open-house signs, 송출관 잔향 hint가 한 구역으로 수렴한다.

표현 prop:

- `model_house_node_prop`
- `consultation_kiosk_socket_prop`
- `doorbell_projector_prop`
- `open_house_sign_prop`
- `transmitter_residue_hint`
- `streetlight_speaker_prop`

설계 원칙:

- 스마일 홈 시어머니 접근 문맥은 만들되 보스 본체를 이 atlas/문서에 포함하지 않는다.
- 송출관은 상위 잔향으로만 남긴다.

## 8. 반복 방문 변화

### 8.1 첫 방문

상태:

- 광고 농도 낮음.
- 침묵 가장자리 넓음.
- 우편함/쿠폰 중심.

구역 변화:

- `silence_edge`가 가장 넓게 체감되어야 한다.
- `subdivision_house_loop`는 기본 집/우편함/flyer 조합만 보여준다.
- `model_house_node`는 edge 전조로만 존재한다.
- `drain_silence_pocket`은 위험해 보이는 side pocket 정도로만 암시된다.
- `fake_return_route`는 아직 거의 보이지 않는다.

Prop 규칙:

- `mailbox_device_prop`와 `flyer_pile_prop`는 적당히 드문 간격.
- `recommended_route_decal_weak`는 매우 희미하게.
- `family_window_loop_prop`는 적거나 멀리.

### 8.2 첫 회수 이후

상태:

- 보급소가 R01을 더 명확히 읽는다.
- 분양 주택 루프의 광고 prop이 증가한다.
- 송출 기록 이벤트가 시작될 수 있다.

구역 변화:

- `subdivision_house_loop`의 house repetition이 조금 더 노골적이다.
- `drain_silence_pocket`이 trace/material 후보 구역으로 읽힌다.
- `fake_return_route`가 아주 약하게 나타난다.

Prop 규칙:

- `price_tag_decal`, `customer_tag_decal`, `flyer_pile_prop` 증가.
- `streetlight_speaker_prop`가 짧은 방송 anchor가 된다.
- `tiny_paper_fragment_*`가 player path 주변에 낮게 쌓인다.

### 8.3 송출 기록 1/3

상태:

- 가로등 방송/추천 동선 증가.
- 같은 집 반복 암시.

구역 변화:

- `fake_return_route`의 route decal이 보이기 시작한다.
- `subdivision_house_loop`에서 같은 집 반복이 의도처럼 보일 만큼 정렬된다.

Prop 규칙:

- `streetlight_speaker_prop`를 route 시작/끝 edge에 배치.
- `recommended_route_decal_weak` opacity를 소폭 상승.
- `house_front_prop_small` 반복 간격을 맞춘다.

### 8.4 송출 기록 2/3

상태:

- 모델하우스 결절 prop 증가.
- 가족 창문 잔상 증가.

구역 변화:

- `model_house_node` 접근 방향이 더 분명하다.
- `subdivision_house_loop`의 문패와 가족 panel이 더 자주 보인다.

Prop 규칙:

- `family_window_loop_prop`와 `family_profile_panel_decal` 증가.
- `consultation_kiosk_socket_prop`가 high-risk edge에 켜짐.
- `floor_plan_line_decal_weak`가 node 주변에 추가.

### 8.5 송출 기록 3/3

상태:

- 모델하우스 결절 접근이 명확해짐.
- open-house signs가 같은 방향을 가리킴.
- 보스 조우 준비.

구역 변화:

- `model_house_node`가 전투 전조의 중심이 된다.
- `fake_return_route`는 실제 보스 접근과 혼동되지 않게 별도 edge route로 남는다.

Prop 규칙:

- `open_house_sign_prop` 방향 정렬.
- `model_house_node_prop` visible priority 상승.
- `doorbell_projector_prop`와 `consultation_kiosk_socket_prop`가 event source로 읽힘.
- `transmitter_residue_hint`는 낮은 확률 foreshadow로만 둔다.

## 9. 보스 처리 후 변화

0.2 기준 직접 outcome은 `destroy_node`와 `extract_memory`다. 이 문서는 outcome에 따른 환경 prop 변화만 정의하며, 보스 보상/전투/성장 수치를 변경하지 않는다.

### 9.1 결절 파괴: `destroy_node`

핵심 감각:

```text
광고 표면이 한 겹 낮아졌다.
하지만 동네가 완전히 정화된 것은 아니다.
조용해진 집들이 오히려 더 정확한 흔적을 드러낸다.
```

구역 변화:

- `silence_edge`: 더 넓고 조용하게 읽힘.
- `subdivision_house_loop`: 광고 prop 밀도 감소. 일부 price/customer tag 아래 문패 후보가 보임.
- `model_house_node`: node 조명 약화, 일부 창문 loop 정지.
- `drain_silence_pocket`: leak 약화, 침묵 재료/문패 조사 후보 증가.
- `fake_return_route`: route가 끊기고 실제 구조/문패 단서 쪽으로 갈라짐.

Prop 변화:

- 감소: `campaign_floor_decal_weak`, `tiny_density_noise_cluster`, `balloon_prop`, 일부 `flyer_pile_prop`.
- 변형: `house_front_prop_small`의 문패/창문이 조용해짐.
- 증가: 문패/구조/침묵 관련 trace 후보 위치.
- 위험: 적 수가 줄어도 추적형 엘리트 또는 조용한 감시 이벤트 가능.

### 9.2 기억 추출: `extract_memory`

핵심 감각:

```text
더 위험하지만 더 많이 알게 된다.
광고 농도는 덜 줄고, 가족사진과 이름의 잔향이 더 선명해진다.
```

구역 변화:

- `silence_edge`: 낮은 농도에도 가족사진/빈 고객란 암시가 섞임.
- `subdivision_house_loop`: 가족 창문 잔상, profile panel, 영수증 조각 증가.
- `model_house_node`: memory_afterimage 중심이 됨.
- `drain_silence_pocket`: leak는 남고 trace chance 증가.
- `fake_return_route`: 가족 목소리/사진 방향으로 더 설득력 있게 위장.

Prop 변화:

- 증가: `family_window_loop_prop`, `family_profile_panel_decal`, `doorbell_projector_prop`, `customer_tag_decal`.
- 유지: `campaign_floor_decal_weak`, `toxic_ad_drain_prop`.
- 위험: fake memory, photo flash, 가족사진 잔상 event 증가.
- 보상/목표: 흔적 회수 목표와 윤서/복희/세븐 반응 연결.

## 10. 480x270 Viewport 전투 가독성 규칙

이 섹션의 `480x270`은 실제 R01 world size가 아니라 카메라 한 화면의 가독성 기준이다. 실제 R01 맵은 여러 viewport를 이동하는 로컬 생태권이며, 아래 규칙은 플레이어가 어느 구역을 보더라도 한 순간의 화면이 읽히게 만드는 viewport composition 규칙이다.

기본 규칙:

- 중앙 전투 영역은 낮은 디테일 유지.
- 외곽 props는 세계관 설명용.
- mid-risk props는 위험/보상/스폰 이유가 있어야 함.
- edge props가 적/위험 telegraph를 가리면 안 됨.
- 가짜 귀환로와 실제 회수/목표 UI는 헷갈리지 않게 구분.
- floor decal은 gameplay telegraph보다 약해야 함.
- 300마리 상황에서는 prop보다 적 가독성이 우선.

한 viewport 안에서의 배치 기준:

| 화면 대역 | 허용 요소 | 제한 요소 |
| --- | --- | --- |
| 중앙 50-60% | ground/sidewalk/center floor, weak route, sparse flyer pile | house, large sign, streetlight, hard-block prop |
| 중위험 lane | mailbox, drain, sprinkler, dock, kiosk socket, weak decal | 과도한 색상 telegraph 충돌, player 시작점 근처 hazard |
| 외곽 frame | house, family window, sign, fence, balloon, node hint | foreground가 player/enemy를 덮는 배치 |

Telegraph 분리:

```text
decal_low_opacity_background
decal_environment_law
prop
interactive
gameplay_telegraph
enemy
player
pickup / reward
foreground_edge
ui
```

`campaign_floor_decal_weak`, `recommended_route_decal_weak`, `floor_plan_line_decal_weak`는 실제 위험 표시가 아니다. danger rectangle, stun/photo flash, slime hazard는 반드시 gameplay telegraph layer에서 더 선명한 outline/value로 별도 제작한다.

## 11. 300마리 밀도 대응 배치 규칙

### 11.1 LOD 역할

```text
LOD0:
  elite / large / named interactive props
  full cutout
  count-limited

LOD1:
  small / medium enemies
  simplified internal lines
  shared oval shadow

LOD2:
  tiny paper fragments
  8-14px
  batchable

LOD3:
  density-only paper noise
  no collision
  no HP
  no AI
  particle/background pressure layer
```

### 11.2 Prop와 적 우선순위

- 300마리 상황에서는 enemy silhouette과 projectile/telegraph가 prop보다 우선이다.
- `tiny_density_noise_cluster`는 수량감을 주되 실제 적으로 계산하지 않는다.
- medium mailbox enemy와 prop mailbox가 같은 화면에 많으면 역할이 흐려진다. prop mailbox는 source anchor, enemy mailbox는 공격 unit으로 구분한다.
- large/elite는 1-3개 정도로 제한하고 pattern owner 역할을 가진다.
- `family_window_loop_prop`, `house_front_prop_full`, `streetlight_speaker_prop`는 camera edge 밖 또는 foreground edge에 고정한다.

### 11.3 고밀도에서 줄일 것

- 중앙 `flyer_pile_prop` 수.
- `campaign_floor_decal_weak` opacity.
- `recommended_route_decal_weak` 선명도.
- large edge prop이 camera 안쪽으로 들어오는 정도.
- prop별 독립 glow.

### 11.4 고밀도에서 유지할 것

- 윤서 silhouette 주변 clear space.
- enemy tier별 크기 차이.
- 실제 danger telegraph의 outline/value.
- pickup/reward의 색상 분리.
- fake route와 UI objective의 시각 분리.

## 12. Godot 테스트 씬으로 넘길 정보

### 12.1 Zone marker

테스트 씬에는 최소 아래 marker 또는 logical area가 필요하다. 이 marker들은 한 화면용 장식 포인트가 아니라 여러 camera screen을 가진 local map 안의 world-space 구역 anchor다.

```text
silence_edge_start
subdivision_loop_center
model_house_node_anchor
drain_pocket_anchor
fake_return_route_anchor
```

각 marker는 prop 배치, spawn hint, trace 후보, phrase trigger를 분리해서 소비한다.

### 12.2 Prop metadata 소비 규칙

Godot 테스트 씬은 slicing spec의 rect/pivot/layer/collision 값을 그대로 참조하되, 이 문서의 `primary_zones`와 `placement_reason`을 추가 메타로 가진다.

권장 필드:

```text
asset_id
zone_allowed
zone_preferred
placement_band: center / mid_risk / edge
story_layer: surface / trace / infrastructure / campaign_law / node
spawn_role: none / enemy_source / hazard_source / event_source / trace_anchor
revisit_visibility_rule
boss_outcome_rule
telegraph_conflict
```

### 12.3 State variant hook

테스트 씬은 최소 아래 state를 프리뷰할 수 있어야 한다.

```text
visit_state:
  first_visit
  after_first_recovery
  broadcast_record_1
  broadcast_record_2
  broadcast_record_3

boss_outcome:
  none
  destroy_node
  extract_memory
```

### 12.4 Acceptance check

Godot 테스트 씬에서 확인할 질문:

- 480x270 viewport에서 현재 카메라 화면의 중앙 전투 영역이 비어 있고 읽히는가?
- 전체 테스트 layout이 최소 4-6 camera screens 이상으로 구성되어 5개 구역이 실제 이동 동선을 가지는가?
- 각 mid-risk prop은 spawn/hazard/trace/event 이유가 있는가?
- 같은 집 반복이 리소스 재사용이 아니라 캠페인 법칙으로 읽히는가?
- `fake_return_route`가 실제 회수 UI와 구분되는가?
- `model_house_node_prop`가 보스 본체가 아니라 결절 접근점으로 읽히는가?
- 100/300 density에서 tiny LOD가 적 silhouette을 가리지 않는가?
- 보스 outcome 후 같은 구역이 완전히 사라지지 않고 다르게 반응하는가?

## 13. 아직 부족한 점

- 이 문서는 배치 논리 문서이며 실제 Godot scene placement는 하지 않았다.
- 각 zone의 정확한 좌표, collision polygon, navigation cost, spawn weight는 아직 없다.
- `destroy_node`와 `extract_memory`의 prop variant 이미지는 아직 별도 제작되지 않았다.
- `fake recovery marker`는 현재 atlas asset_id로 독립 정의되지 않았다. 지금은 `recommended_route_decal_weak`, `streetlight_speaker_prop`, `customer_tag_decal`, `transmitter_residue_hint` 조합으로 표현한다.
- `납 차폐 배터리`, `무음 라디오`, `지워지지 않은 문패`, `반쯤 탄 가족사진`, `이름 없는 영수증`은 trace object visual로 아직 atlas에 고정되어 있지 않다.
- 실제 300마리 성능과 draw order는 이미지 mock 기준일 뿐, Godot runtime 검증이 필요하다.
- 보스 본체와 보스 arena pattern은 이 문서에서 다루지 않았다.

## 14. 다음 작업 추천

1. `R01_LOCAL_MAP_LAYOUT_LOGIC_SPEC.md`를 기준으로 Godot 테스트 씬용 zone marker와 prop placement table을 만든다.
2. `r01_environment_atlas_slicing_spec`의 asset metadata에 `zone_allowed`, `story_layer`, `spawn_role`, `revisit_visibility_rule`, `boss_outcome_rule`을 별도 JSON 또는 `.tres` 후보로 분리한다.
3. 480x270 viewport screenshot/blockout으로 `first_visit`, `broadcast_record_3`, `destroy_node`, `extract_memory` 네 상태의 한 화면 가독성을 비교하되, 실제 테스트 layout은 최소 4-6 camera screens 이상으로 둔다.
4. `fake_return_route`와 실제 회수 UI의 색/레이어/문구 분리 기준을 UI 문서와 연결한다.
5. trace object visual 후보를 별도 소형 prop/decal pass로 만든다. 단, 보스나 기존 PNG는 건드리지 않는다.
6. 30 / 100 / 300 density 테스트를 통해 center prop suppression과 tiny LOD 규칙을 확정한다.
