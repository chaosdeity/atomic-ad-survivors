# Atomic Ad Survivors 0.2 Asset Reclassification

검토일: 2026-05-21
방향: `출격형 광고 정산 액션 RPG`
검토 범위:

- `assets/`
- `assets/art_inbox/`
- `generated_assets/`
- `assets/style_samples/`
- `qa/screenshots/`

## 0. 결론

현재 에셋은 `bulk import` 금지다. 가장 쓸 만한 것은 `assets/art_inbox`의 cache-recovered review pack과 `assets/style_samples/p0_direction`의 R01 방향성 샘플이지만, 둘 다 바로 런타임 완성본은 아니다.

가장 큰 문제는 R01이다. 에셋 방향은 광고 생태계 쪽으로 많이 정리됐지만, 실제 맵은 아직 RPG 지역 구조가 아니라 넓은 블록아웃과 디버그 마커에 가깝다. 다음 구현방의 1순위는 에셋 적용이 아니라 R01을 `외곽 주택가 -> 반복 주택가 -> 오픈하우스 거리 -> 모델하우스 접근로`가 실제 이동/정산/재방문 상태를 만드는 지역으로 다시 잡는 것이다.

인물 에셋은 엄격하게 본다. 어설픈 인물, 치비, 저해상도 픽셀 임시본, 자동 크롭 실패, v02/v03 구버전은 전부 폐기한다. 재검토 결과 `char_yunseo_*_v05`도 플레이어 주인공으로는 탈락이다. 윤서는 리터치가 아니라 신규 제작한다.

## 1. 유지할 에셋 목록

### 1.1 유지: 검토 기준/레퍼런스

아래는 직접 import가 아니라 방향 기준으로 유지한다.

- `assets/art_inbox/CURRENT_REVIEW_ENTRYPOINTS.md`
- `assets/art_inbox/ART_INBOX_KO_HANDOFF_SUMMARY.md`
- `assets/art_inbox/ART_INBOX_QUALITY_GATE_REPORT.md`
- `assets/art_inbox/ART_INBOX_STORY_GATED_SMOKE_QUEUE.csv`
- `assets/art_inbox/ART_INBOX_CORE_IDENTITY_GATE_AUDIT.csv`
- `assets/art_inbox/ART_INBOX_R01_COMMAND_ROLE_AUDIT.csv`
- `assets/art_inbox/ART_INBOX_REJECTION_LEDGER.csv`
- `assets/art_inbox/mockups/r01_mock_480x270_normal_density.png`
- `assets/art_inbox/mockups/r01_mock_480x270_high_density.png`
- `assets/art_inbox/mockups/r01_mock_960x540_world_crop.png`
- `assets/art_inbox/mockups/outpost_mock_480x270.png`
- `assets/art_inbox/mockups/boss_encounter_mock_480x270.png`
- `assets/style_samples/p0_direction/hybrid_production_candidate/`
- `assets/style_samples/p0_direction/r01_environment_modular_candidate/`
- `assets/style_samples/p0_direction/r01_environment_atlas_pilot/`
- `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/`

### 1.2 유지: R01 작업선 후보

직접 적용 전 clean alpha, pivot, collision, layer, 480x270 검수를 거친다.

- `assets/art_inbox/r01_props/r01_prop_model_house_command_node_facade_v02.png`
- `assets/art_inbox/r01_props/r01_prop_smiling_mailbox_speaker_v02.png`
- `assets/art_inbox/r01_props/r01_prop_doorbell_projector_house_recommend_v02.png`
- `assets/art_inbox/r01_props/r01_prop_drain_campaign_intake_v02.png`
- `assets/art_inbox/r01_props/r01_prop_homecare_vacuum_command_device_v02.png`
- `assets/art_inbox/r01_props/r01_prop_consultation_kiosk_v02.png`
- `assets/art_inbox/r01_props/r01_prop_streetlamp_speaker_v02.png`
- `assets/art_inbox/r01_decals/r01_state_fake_return_broken_floor_arrow_decal_v06.png`
- `assets/art_inbox/r01_props/r01_state_drain_silence_pocket_silent_radio_v07.png`
- `assets/art_inbox/r01_tiles/r01_tile_suburb_cream_combat_base_v02.png`
- `assets/art_inbox/r01_tiles/r01_tile_suburb_sidewalk_patch_v02.png`
- `assets/art_inbox/r01_tiles/r01_tile_suburb_road_patch_v02.png`
- `assets/art_inbox/r01_tiles/r01_tile_driveway_patch_v02.png`
- `assets/art_inbox/r01_ground_patches/r01_ground_fake_return_broken_trace_v02.png`
- `assets/art_inbox/r01_ground_patches/r01_ground_modelhouse_catalog_scatter_v02.png`
- `assets/art_inbox/r01_decals/r01_decal_player_enemy_shadow_common_v02.png`

### 1.3 유지: 윤서 없음

현재 폴더 안의 윤서 에셋은 정식 유지 대상이 없다. `char_yunseo_*_v05`는 이전 버전보다 정리되어 있지만, 주인공 호감도와 성인 실무자 감각이 부족하고 바보처럼 보이는 얼굴/비율 문제가 있다. 모바일 전투에서 오래 봐야 하는 플레이어 얼굴로는 실패다.

### 1.4 유지: 적/보급소/UI/VFX 작업선 후보

적:

- `assets/art_inbox/enemies/enemy_coupon_flyer_swarm_tiny_v04.png`
- `assets/art_inbox/enemies/enemy_mailbox_shooter_v04.png`
- `assets/art_inbox/enemies/enemy_homecare_vacuum_ad_device_v04.png`
- `assets/art_inbox/enemies/enemy_doorbell_projector_v04.png`
- `assets/art_inbox/enemies/enemy_sprinkler_broadcaster_v04.png`
- `assets/art_inbox/enemies/enemy_drain_suction_ad_intake_v04.png`
- `assets/art_inbox/enemies/enemy_streetlamp_speaker_v04.png`
- `assets/art_inbox/enemies/enemy_recommended_route_sign_robot_v04.png`
- `assets/art_inbox/enemies/enemy_happy_guarantee_consultant_elite_idle_v03.png`

보스:

현재 정식 유지 대상 없음. `boss_smile_home_mother_in_law_*_v04`는 모델하우스/가족 평가 결절이라는 의도만 메모로 남기고, 비주얼은 신규 설계한다.

보급소:

- `assets/art_inbox/outpost/outpost_prop_recall_platform_v02.png`
- `assets/art_inbox/outpost/outpost_prop_settlement_counter_v02.png`
- `assets/art_inbox/outpost/outpost_prop_name_archive_locker_v02.png`
- `assets/art_inbox/outpost/outpost_prop_sortie_board_v02.png`
- `assets/art_inbox/outpost/outpost_prop_upgrade_bench_v02.png`
- `assets/art_inbox/outpost/outpost_prop_charging_tuning_table_v02.png`
- `assets/art_inbox/outpost/outpost_prop_gate_door_v02.png`
- `assets/art_inbox/outpost/outpost_prop_boss_analysis_board_v02.png`

UI/VFX:

- `assets/art_inbox/ui/ui_frame_hp_gauge_clean_v04.png`
- `assets/art_inbox/ui/ui_frame_charge_gauge_clean_v04.png`
- `assets/art_inbox/ui/ui_frame_card_clean_v04.png`
- `assets/art_inbox/ui/ui_frame_upgrade_button_clean_v06.png`
- `assets/art_inbox/ui/ui_panel_result_backing_clean_v04.png`
- `assets/art_inbox/ui/ui_panel_supply_backing_clean_v04.png`
- `assets/art_inbox/ui/ui_icon_category_area_clean_v04.png`
- `assets/art_inbox/ui/ui_icon_category_auto_clean_v04.png`
- `assets/art_inbox/ui/ui_icon_category_charge_clean_v04.png`
- `assets/art_inbox/ui/ui_icon_category_signal_analysis_clean_v04.png`
- `assets/art_inbox/ui/ui_icon_category_support_clean_v04.png`
- `assets/art_inbox/ui/ui_icon_category_survival_clean_v04.png`
- `assets/art_inbox/vfx/vfx_return_stamp_ready_frame_01_v04.png`
- `assets/art_inbox/vfx/vfx_return_stamp_ready_frame_02_v05.png`
- `assets/art_inbox/vfx/vfx_return_stamp_mark_clean_v04.png`
- `assets/art_inbox/vfx/vfx_return_stamp_dissolve_clean_v04.png`
- `assets/art_inbox/vfx/vfx_speaker_wave_clean_v04.png`

## 2. 수정할 에셋 목록과 이유

### 2.1 R01 맵/환경

- `assets/art_inbox/r01_tiles/*`: 현재 개별 타일 후보는 쓸 수 있지만, RPG 지역 구조를 만들기에는 구역별 목적/거리/상태 변화가 부족하다. production atlas로 다시 export하고 `outer residential`, `subdivision loop`, `open-house street`, `model-house approach`, `drain side network`, `fake return route`로 분리한다.
- `assets/art_inbox/r01_ground_patches/*`: 오염/흔적은 위험 장판이 아니라 낮은 계층의 지역 흔적이어야 한다. alpha/value를 낮추고 gameplay telegraph와 색을 분리한다.
- `assets/art_inbox/r01_hazards/r01_hazard_ad_ink_puddle_v02.png`: 위험 장판처럼 강하게 읽히면 안 된다. `low-tier contamination trace` 또는 `drain residue`로 낮춘다.
- `assets/art_inbox/r01_hazards/r01_hazard_pressure_ring_telegraph_v02.png`: 실제 위험 telegraph로 쓸 경우만 유지한다. 배경 decal로 쓰면 폐기한다.
- `assets/art_inbox/r01_props/r01_prop_model_house_command_node_facade_v02.png`: 정상 예쁜 집으로 읽히면 실패다. 문패/고객번호/창문 루프/입주 심사 장치를 더 명확히 한다.
- `assets/art_inbox/r01_props/r01_prop_recommended_route_sign_v02.png`, `assets/art_inbox/r01_decals/*route*`: 실제 목표 UI처럼 읽히면 안 된다. broken/cancelled/fake route 언어로 낮춘다.
- `qa/screenshots/r01/*.png`: 현재는 디버그 원형/마커 레퍼런스다. RPG 지역 검수 스크린샷으로 교체 필요.

### 2.2 윤서

수정 대상이 아니라 신규 제작 대상이다. 현재 `char_yunseo_*_v05`는 주인공으로 유지하지 않는다.

- 실패 이유: 얼굴/비율이 어설프고, 성인 실무자/생존 귀환자라기보다 바보 같은 인상으로 읽힌다.
- 새 기준: 유능한 정산/출격 실무자, 밝지만 지친 생존감, 작은 화면에서도 단단한 실루엣, 치비 금지, 과장된 멍청한 표정 금지.
- return stamp 액션은 새 윤서 body와 별도 VFX로 다시 만든다.

### 2.3 적/보스

- `assets/art_inbox/enemies/enemy_happy_guarantee_consultant_elite_idle_v03.png`: elite로 유지 가능하지만 idle만으로 부족하다. warning/attack/hit/death strip 필요.
- `assets/art_inbox/enemies/enemy_special_charger_preview_line_v04.png`, `enemy_special_tank_warranty_plate_v04.png`: warning line은 VFX와 분리하고, warranty tank는 군용 탱크처럼 읽히지 않게 보증/심사 장치로 repaint한다.
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_*_v04.png`: 현재 보스 에셋은 유지하지 않는다. 의도는 "모델하우스 가족 평가 결절"로 쓸 수 있지만, 실행물은 촌스럽고 약하다. 집/시어머니/마스코트가 뒤섞인 어중간한 캐릭터 대신, R01 끝의 심사 장치이자 광고 환경의 법처럼 보이는 새 보스로 재설계한다.

### 2.4 카드/정산/보급소 UI

- `assets/art_inbox/ui/ui_panel_supply_backing_clean_v04.png`: 보급소는 상점이 아니다. "구매/업그레이드" 중심 panel로 쓰지 말고 귀환, 정산, 배급, 재출격 물리 장소의 UI로 재배치한다.
- `assets/art_inbox/ui/ui_frame_upgrade_button_clean_v06.png`: `upgrade` 표현은 정비/조율/배분으로 바꾸고, 모바일 버튼 문구를 2-4음절 수준으로 줄인다.
- `assets/art_inbox/ui/ui_frame_card_clean_v04.png`: 카드 UI는 도구/밥벌이/약관이 1초 안에 구분되어야 한다. 긴 설명은 접고, 한 줄 효과 + 대가 + 정산 영향만 보인다.
- `assets/art_inbox/ui/ui_panel_result_backing_clean_v04.png`: 정산 화면은 랜덤 보상표가 아니라 행동 사유를 보여줘야 한다. 밥표/전원표/신호표 후보, 승인, 보류, 오염을 짧게 분리한다.

### 2.5 VFX

- `assets/art_inbox/vfx/vfx_charger_warning_line_clean_v04.png`
- `assets/art_inbox/vfx/vfx_boss_target_warning_clean_v04.png`
- `assets/art_inbox/vfx/vfx_return_stamp_fire_thin_line_v06.png`
- `assets/art_inbox/vfx/vfx_boss_warning_marker_clean_v04.png`

위 4개는 서로 색/형태 언어가 겹치면 안 된다. return stamp는 윤서의 공격, charger warning은 적 예고, boss warning은 보스 패턴, contamination trace는 지역 흔적으로 분리한다.

## 3. 폐기할 에셋 목록과 이유

### 3.1 전면 폐기

- `generated_assets/01_atomic_steampunk/*`: 어두운 스팀펑크/황무지/가스마스크/산업 폐허 방향이라 새 기준과 정면 충돌.
- `generated_assets/03_cute_dystopian_atomic/*`: 치비, 봉제 장난감, 과한 귀여움, melancholy key art가 현재 성인 실무자/밝은 광고 디스토피아 기준을 흐림.
- `assets/art_inbox/rejected/*.png`: 181개 전체 폐기. bad autocrop, edge fragment, label misaligned, rough crop, superseded, below hybrid bar, too normal/horror 사유가 이미 기록됨.
- `assets/characters/player/player_survivor_48x48_4dir_walk.png`: 어설픈 임시 인물. 윤서 정체성과 성인 실무자 감각 없음.
- `assets/characters/enemies/tier1/enemy_appliance_zombie_32x32_idle.png`
- `assets/characters/enemies/tier1/enemy_billboard_tumor_32x32_idle.png`
- `assets/characters/enemies/tier1/enemy_coupon_slime_32x32_idle.png`
- `assets/characters/enemies/tier2/enemy_infected_housewife_40x40_walk.png`
- `assets/characters/enemies/tier2/elite_ad_mascot_80x80_idle.png`

위 기존 runtime pixel assets는 개발 임시 참조 외에는 폐기한다. 인물/적 모두 품질선이 낮고, 새 방향의 생활 인프라 광고 생태계를 충분히 전달하지 못한다.

### 3.2 직접 import 폐기, 레퍼런스만 허용

- `generated_assets/02_bright_dystopian_atomic/*`: 방향 찾기 레퍼런스로는 유지 가능하나, 직접 import 금지. 일부는 예쁘지만 너무 일러스트/과밀/정상 교외/일반 HUD 방향이 섞여 있다.
- `assets/reference_bright_dystopian/*`: reference only. production asset으로 쓰지 않는다.
- `assets/style_samples/p0_direction/production_cleanup_v2/`
- `assets/style_samples/p0_direction/production_cleanup_v2_polish/`
- `assets/style_samples/p0_direction/hybrid_2d_cutout/`

위 style sample은 방향 이력으로만 남긴다. 특히 인물/적이 v05 후보보다 약하면 전부 폐기한다.

### 3.3 윤서/인물 세부 폐기

- `assets/art_inbox/characters/*_v02.png`
- `assets/art_inbox/characters/*_v03.png`
- `assets/art_inbox/characters/char_yunseo_*_v05.png`
- `assets/art_inbox/characters/*source_chromakey_v02.png`
- `assets/art_inbox/characters/*alpha_sheet_v02.png`
- `assets/art_inbox/rejected/rejected_*char_yunseo*.png`

이유: 인물은 어설프면 게임 전체 신뢰도가 무너진다. 구버전, fragment, label 포함, 자동 crop 실패, childlike 가능성, 멍청해 보이는 얼굴/비율은 예외 없이 폐기한다.

### 3.4 보스 세부 폐기

- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_combat_lod_readable_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_battle_silhouette_readable_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_core_exposed_combat_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_coupon_sweep_warning_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_floorplan_hazard_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_warranty_shield_panel_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_vacuum_rail_dash_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_destroy_node_quiet_core_v04.png`
- `assets/art_inbox/bosses/boss_smile_home_mother_in_law_extract_memory_photo_core_v04.png`

이유: "스마일 홈 시어머니" v04는 R01 최종 보스의 격이 부족하다. 밝고 이상한 광고 디스토피아의 보스라기보다 집/로봇/시어머니 개그가 섞인 약한 마스코트로 보인다. 이름과 일부 패턴 메모만 남기고 비주얼은 전면 폐기한다.

## 4. 신규 제작이 필요한 P0 에셋 목록

### 4.1 R01 RPG 지역 구조 P0

1. `R01_region_topology_board`: 5280x2970 이상의 실제 월드 토폴로지 이미지 또는 data map. 각 구역이 실제 거리와 입구/출구를 가져야 한다.
2. `R01_zone_gate_set`: 외곽 주택가, 반복 주택가, 오픈하우스 거리, 모델하우스 접근로, 배수로, 가짜 귀환로 입구/경계 시각물.
3. `R01_open_house_street_kit`: 긴 위험 동선용 바닥, 표지, check-in kiosk, queue rail, signal trace.
4. `R01_model_house_approach_kit`: 보스 전조가 아니라 접근로/결절 해석용 facade, floor-plan trace, 문패/가족창 루프.
5. `R01_contamination_trace_low_tier_set`: 밥표/전원표/신호표 오염 흔적. 위험 장판처럼 보이면 실패.
6. `R01_state_variant_set`: first visit, after settlement, contaminated ration, contaminated power, contaminated signal, destroy_node, extract_memory.
7. `R01_480x270_RPG_QA_screens`: normal/high density/debug이 아니라 실제 플레이 화면 기준의 구역별 QA 스크린샷.

### 4.2 윤서 P0

1. `yunseo_new_concept_silhouette_board`: 기존 v05 금지. 유능한 성인 출격/정산 실무자, 작은 화면에서도 멍청해 보이지 않는 얼굴과 비율.
2. `yunseo_playable_4dir_idle_walk_sheet`: 64-74px, bottom-center pivot, 4방향 idle/walk 최소 2프레임.
3. `yunseo_charge_return_stamp_body_sheet`: 몸 pose만. VFX 없음.
4. `yunseo_return_stamp_vfx_sheet`: ready/fire/mark/dissolve를 별도 VFX로 분리.
5. `yunseo_mobile_portrait_and_head_icon`: 초상화도 새 디자인 기준으로 제작. v05 재사용 금지.

### 4.3 적 P0

1. `coupon_flyer_swarm_lod_set`: tiny 8-14px, small 22-30px, density-only no HP/no AI.
2. `mailbox_shooter_attack_strip`: idle/move/flyer spit/hit/death.
3. `homecare_vacuum_suction_strip`: pickup interference와 memory cleanup 역할이 읽히는 strip.
4. `doorbell_projector_event_strip`: photo flash source, 실제 위험 telegraph와 분리.
5. `happy_guarantee_consultant_elite_full_state`: idle/warning/attack/hit/death.

### 4.4 보스 P0

1. `r01_boss_new_concept_board`: 기존 스마일 홈 시어머니 비주얼 금지. R01 끝의 모델하우스 심사 장치, 가족 적합성 판정, 계약/보증/평면도 압력을 하나의 강한 실루엣으로 재설계.
2. `r01_boss_combat_lod_sheet`: 120-170px에서 읽히는 단순 전투 body. 집 모양 드레스, 과한 마스코트 얼굴, 시어머니 개그 금지.
3. `boss_cue_layer_sheet`: coupon sweep, floorplan hazard, warranty shield, vacuum rail, pressure ring을 본체와 분리.
4. `boss_outcome_state_sheet`: destroy_node, extract_memory, core_exposed.

### 4.5 카드/정산/보급소 UI P0

1. `mobile_card_choice_panel`: 도구/밥벌이/약관 3장, 480x270에서 한 줄 효과 중심.
2. `settlement_result_compact_panel`: 후보/승인/보류/오염/행동 사유를 짧은 행 단위로 표시.
3. `outpost_supply_allocation_panel`: 상점이 아니라 살아 돌아온 장소의 배분 UI.
4. `sortie_board_map_hint_panel`: 신호표 배분에 따라 오픈하우스/모델하우스 방향을 과하게 친절하지 않게 표시.

### 4.6 VFX P0

1. `return_stamp_vfx_final`: 윤서 액션 전용.
2. `enemy_warning_vfx_final`: charger/speaker/flyer fall 분리.
3. `boss_warning_vfx_final`: boss target/floorplan/coupon sweep 분리.
4. `contamination_trace_vfx_final`: 낮은 계층 흔적용, damage hazard 금지.

## 5. 우선순위

### R01

P0. `실제 RPG 지역 구조`부터 만든다. 구역 이름만 있으면 실패다. 구역은 실제 거리, 진입 이유, 정산 결과, 재방문 변화가 있어야 한다.
P0. 오픈하우스 거리는 신호표/처리량/압력의 위험 구역이어야 한다.
P0. 오염 표식은 지역 흔적으로 낮추고, 위험 장판과 분리한다.
P1. production atlas와 실제 Sprite2D/TileMap 적용.
P2. 보스 outcome 후 지역 변형.

### 윤서

P0. 신규 concept silhouette부터 다시 만든다. v05 기반 금지.
P0. 어설픈 인물 전부 제거.
P0. 새 4방향 playable sheet와 portrait/head icon 모바일 판독.
P2. 스킨/변주 금지, 0.2 이후.

### 적

P0. coupon, mailbox, homecare vacuum, doorbell.
P1. speaker, signal booster, route sign, sprinkler, drain.
P1. consultant elite full state.
P2. warranty tank/charger/special variants.

### 보스

P0. 새 R01 보스 concept board. 기존 스마일 홈 시어머니 v04 비주얼 금지.
P0. 모델하우스 가족 평가 결절이라는 역할만 유지하고, combat LOD body와 cue를 새로 분리.
P1. outcome state.
P2. 전체 보스 결과 확장.

### 카드 UI

P0. 카드 3분류가 1초 안에 읽히는 선택 화면.
P0. 카드 설명 짧게: 이름, 분류, 한 줄 효과, 대가/정산 영향.
P1. 시너지 표시.
P2. 장기 카탈로그/도감.

### 보급소 UI

P0. 정산 카운터, 배급권 배분, 출격 게시판을 상점 UI에서 분리.
P0. 살아 돌아온 장소라는 물리감.
P1. NPC/시설 반응.
P2. 장기 성장/정비 확장.

### VFX

P0. return stamp, enemy warning, boss warning, contamination trace 색/형태 분리.
P1. 30/100/300 density QA.
P2. polish.

## 6. Codex 구현방 작업 지시서

### 목표

`Atomic Ad Survivors 0.2`를 에셋 교체가 아니라 `출격형 광고 정산 액션 RPG`로 보이게 만든다. 첫 구현 목표는 R01을 평지 생존장이 아니라 반복 출격과 정산 결과를 기억하는 RPG 지역으로 만드는 것이다.

### 절대 금지

- `assets/art_inbox` bulk import 금지.
- `assets/art_inbox/rejected` 재사용 금지.
- `generated_assets/01_atomic_steampunk` 사용 금지.
- `generated_assets/03_cute_dystopian_atomic` 사용 금지.
- 기존 `assets/characters/player`와 `assets/characters/enemies` 픽셀 임시본을 새 art direction의 정식 에셋으로 취급 금지.
- `char_yunseo_*_v05`를 정식 윤서로 사용 금지.
- `boss_smile_home_mother_in_law_*_v04`를 R01 보스로 사용 금지.
- fake return route를 실제 귀환 UI처럼 보이게 만들지 말 것.
- 오염 표식을 피해 장판처럼 만들지 말 것.
- 보급소를 상점처럼 만들지 말 것.

### 구현 순서

1. `R01RegionGraph` 또는 동등한 데이터 구조를 만든다. 노드는 `outer_residential_edge`, `subdivision_loop`, `open_house_street`, `model_house_approach`, `drain_silence_pocket`, `fake_return_route`로 시작한다.
2. 각 노드에 `entry_reason`, `settlement_effect`, `risk_profile`, `state_variants`, `visual_asset_keys`, `return_confusion_risk`를 둔다.
3. 현재 `scripts/r01_layout_blockout.gd`의 넓은 world bounds는 유지하되, 단순 anchor nearest 판정에서 지역 graph/route/POI 판정으로 올린다.
4. `scripts/r01_map_controller.gd`의 legacy 시간 기반 배경 드로잉과 새 blockout/graph 구조를 정리한다. 같은 R01을 두 시스템이 다르게 그리면 안 된다.
5. `scripts/r01_map_assembly.gd`의 placeholder asset_key를 실제 후보 asset_key와 연결하되, `rejected`와 구 pixel runtime assets는 제외한다.
6. `sprite_assets.gd`에서 기존 pixel player/enemy를 deprecated 처리한다. 새 윤서/적 sheet가 들어오기 전까지는 dev fallback으로만 남긴다.
7. 오염 표식은 `region_trace_layer`로 내리고, `gameplay_telegraph_layer`와 draw order를 분리한다.
8. 카드/정산/보급소 UI는 480x270에서 짧게 재배치한다. `upgrade`, `shop`, `buy` 의미는 숨기고 `정산`, `배분`, `재출격`, `조율` 언어로 바꾼다.
9. 새 윤서 concept silhouette가 통과하기 전까지 인물 신규 적용은 막는다. 어설픈 인물은 임시라도 노출하지 않는다.
10. 새 R01 보스 concept board가 통과하기 전까지 스마일 홈 시어머니 v04는 import하지 않는다.
11. 새 QA 스크린샷을 만든다: 각 R01 구역 normal/high density, 보급소 정산, 카드 선택, 오염 흔적, fake return route.

### 성공 기준

- 플레이어가 R01에서 “어느 길로 들어갈지”를 고민한다.
- 오픈하우스 거리가 위험하지만 들어갈 이유가 있다.
- 배수로/가짜 귀환로가 장식이 아니라 정산/오염/흔적 선택지다.
- 같은 R01 재출격이 이전 정산 결과 때문에 달라 보인다.
- 윤서는 성인 실무자로 읽힌다.
- 적은 광고 생태계 현상이지 침공군이 아니다.
- 보급소는 상점이 아니라 살아 돌아와 정산하고 배분하는 장소다.
- 480x270에서 플레이어, 적, telegraph, pickup, UI가 서로 먹히지 않는다.
