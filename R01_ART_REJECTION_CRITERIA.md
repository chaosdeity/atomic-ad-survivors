# R01 Art Rejection Criteria

상태: R01 아트 반려 기준  
범위: 반려 사유, 수정 지시, 기존 샘플 유지/폐기 구분, 다음 작업 지시  
비범위: 새 이미지 생성, 기존 에셋 삭제, 보스 디자인 신규 확정

## 1. 반려 원칙

R01 아트는 예쁘기만 하면 실패할 수 있다. 승인 기준은 `보기 좋은가`보다 `광고 환경이 자동화 인프라로 읽히는가`다.

즉시 반려 문장:

```text
그냥 간판 많은 마을이면 반려한다.
```

## 2. 자동 반려 기준

| 코드 | 반려 사유 | 왜 문제인가 | 수정 방향 |
| --- | --- | --- | --- |
| R01-RJ-01 | 단순 현수막/간판 중심 | 광고가 매체로만 보임 | 우편함, 초인종, 창문, 배수구 등 장치화 |
| R01-RJ-02 | 정상적인 예쁜 교외 마을 | 모델하우스 상품화가 사라짐 | 문패 덮어쓰기, 반복 facade, queue rail 추가 |
| R01-RJ-03 | 스팀펑크/황동/가스마스크 | 프로젝트 톤과 충돌 | bright dystopian atomic + 작은 위험 신호 |
| R01-RJ-04 | 고어/좀비 공포 중심 | 광고 친절함의 공포가 사라짐 | 종이, 광고 잉크, 제품 상처로 표현 |
| R01-RJ-05 | 치비/어린 캐릭터화 | C 감정층을 유아 귀여움으로 오해 | 성인 실무자, 역할에 갇힌 소비재 형태 |
| R01-RJ-06 | 배경과 몹 분리 | 생태계가 아니라 스킨 교체로 보임 | 몹 source를 오브젝트/인프라에 연결 |
| R01-RJ-07 | 생활 인프라가 장식 | R01 핵심이 사라짐 | 장치마다 spawn/hazard/event/trace 역할 부여 |
| R01-RJ-08 | telegraph와 배경 충돌 | 플레이가 불공정해짐 | gameplay telegraph layer/value 분리 |
| R01-RJ-09 | fake route가 실제 UI처럼 보임 | UI 신뢰가 깨짐 | broken/cancelled world prop으로 낮춤 |
| R01-RJ-10 | 송출관을 첫 보스로 그림 | 0.2 구조와 장기 서사 충돌 | residue/hint/기록으로만 표현 |
| R01-RJ-11 | 보스 디자인을 새로 확정 | 현재 작업 범위 위반 | 보스 context/approach cue까지만 |
| R01-RJ-12 | readable text를 이미지에 굽기 | 현지화/가독성/스케일 문제 | abstract block, Godot label/decal 후보로 분리 |
| R01-RJ-13 | 중앙 전투 영역 과밀 | 윤서/적/위험이 묻힘 | center floor low detail, edge prop 분리 |
| R01-RJ-14 | house가 주거지로만 읽힘 | 가족 상품 절차가 안 보임 | customer tag, contract, window loop, guide rail |
| R01-RJ-15 | tiny LOD가 실제 적처럼 보임 | 300 density 판독 혼란 | no collision/no HP density layer로 단순화 |
| R01-RJ-16 | 네온/대형 전광판 중심 | R01이 홈/가족/주거 라인이 아니라 번화가/오락 라인으로 보임 | 현관, 문패, 창문, 우편함, 초인종, 키오스크 중심으로 재구성 |
| R01-RJ-17 | 캠페인 라인 혼합 과다 | 지역마다 다른 광고 생태계 원칙이 무너짐 | R01은 residential conversion 라인으로 제한 |
| R01-RJ-18 | 선택의 흔적 없음 | 세계가 반응하지 않고 랜덤 배경처럼 보임 | 이전 route, trace 선택, 보스 outcome에 따른 visual state 추가 |
| R01-RJ-19 | 보상 정산만 있고 미해결 단서 없음 | 다음 출격 욕구가 약함 | 보상과 함께 이상 문장, 좌표, 이름, route 변화 추가 |

## 3. 수정 가능 기준

아래는 즉시 폐기보다 수정 대상으로 본다.

| 상태 | 수정 조건 |
| --- | --- |
| 집이 약간 정상 주택처럼 보임 | 현관/문패/창문에 상품화 신호를 추가하면 조건부 유지 |
| prop crop에 주변 fragment가 있음 | source recut/alpha trim으로 수정 가능 |
| 색이 telegraph와 살짝 충돌 | alpha/value 조정 후 480x270 재검수 |
| pseudo text가 있음 | 실제 글자를 지우고 block 형태로 재도색 |
| edge prop이 너무 큼 | placement를 edge_only로 제한하거나 small variant 제작 |
| tiny paper가 너무 많음 | density layer로 낮추고 실제 enemy와 분리 |

## 4. 기존 샘플 중 유지 가능한 것

유지는 `최종 승인`이 아니라 `다음 작업의 기준으로 참고 가능`을 뜻한다.

### 4.1 구조/배치 기준으로 유지

| 경로 | 유지 이유 | 사용 제한 |
| --- | --- | --- |
| `assets/style_samples/p0_direction/r01_environment_modular_candidate/R01_ENVIRONMENT_MODULAR_NOTES.md` | R01을 광고 자동화 생태계로 본 핵심 문장과 5계층이 명확함 | 문서 기준으로 유지 |
| `assets/style_samples/p0_direction/r01_environment_modular_candidate/r01_model_house_corruption_variants.png` | 정상 주택보다 모델하우스 상품화 방향이 강함 | final asset 아님, house 상품화 강화 필요 |
| `assets/style_samples/p0_direction/r01_environment_modular_candidate/r01_combat_field_480x270_mock.png` | 중앙 전투 영역과 edge prop 분리 기준 참고 가능 | 대표 아트로 사용 금지 |
| `assets/style_samples/p0_direction/r01_environment_modular_candidate/r01_high_density_480x270_mock.png` | density 계층 가독성 참고 가능 | 실제 300 spawn 수치로 확정 금지 |
| `assets/style_samples/p0_direction/r01_environment_atlas_pilot/R01_ENVIRONMENT_ATLAS_PILOT_NOTES.md` | atlas/pilot의 유지/수정 기준이 정리됨 | pilot 구조 기준 |
| `assets/style_samples/p0_direction/r01_environment_atlas_slicing_spec/R01_ENVIRONMENT_ATLAS_SLICING_SPEC.md` | tile/prop/decal/tiny LOD 분리와 pivot/layer 기준 | spec guide, production PNG 아님 |

### 4.2 스타일 샘플로 유지

| 경로 | 유지 이유 | 사용 제한 |
| --- | --- | --- |
| `assets/style_samples/p0_direction/sample_coupon_flyer_swarm_32x32_style_v2.png` | 종이 판촉물 계층의 small enemy 방향 참고 | final sprite 아님 |
| `assets/style_samples/p0_direction/sample_smiling_mailbox_or_homecare_vacuum_32x32_style_v2.png` | 생활 인프라/재동기화 계층 참고 | mailbox/vacuum 역할 분리 필요 |
| `assets/style_samples/p0_direction/sample_happy_guarantee_consultant_40x40_style_v2.png` | 상담 로봇 elite 방향 참고 | 보스 대체물로 사용 금지 |
| `assets/style_samples/p0_direction/sample_yunseo_48x48_style_v2.png` | 윤서가 광고 세계에 덜 칠해진 성인 실무자로 보이는지 참고 | 캐릭터 최종 승인과 별개 |

### 4.3 art_inbox에서 유지 또는 조건부 유지

| 경로 | 상태 | 이유 |
| --- | --- | --- |
| `assets/art_inbox/R01_ZONE_ASSET_MAPPING.md` | 유지 | zone별 asset placement guide로 유효 |
| `assets/art_inbox/R01_LOCAL_STATE_VARIANTS_MAPPING.md` | 유지 | destroy_node/extract_memory/revisit/fake route 상태 구분이 명확 |
| `assets/art_inbox/r01_props/r01_prop_model_house_command_node_facade_v02.png` | 조건부 유지 | model-house nexus context |
| `assets/art_inbox/r01_props/r01_prop_smiling_mailbox_speaker_v02.png` | 조건부 유지 | 생활 인프라 광고 명령 장치 |
| `assets/art_inbox/r01_props/r01_prop_doorbell_projector_house_recommend_v02.png` | 조건부 유지 | doorbell event source |
| `assets/art_inbox/r01_props/r01_prop_drain_campaign_intake_v02.png` | 조건부 유지 | drain/silence pocket source |
| `assets/art_inbox/r01_props/r01_prop_homecare_vacuum_command_device_v02.png` | 조건부 유지 | memory cleanup/vacuum logic |
| `assets/art_inbox/r01_props/r01_prop_consultation_kiosk_v02.png` | 조건부 유지 | elite/socket context |
| `assets/art_inbox/r01_map_markers/r01_state_fake_return_cancelled_sign_v05.png` | 유지 | fake route를 실제 UI와 분리하는 데 유용 |
| `assets/art_inbox/r01_props/r01_state_drain_silence_pocket_silent_radio_v07.png` | 유지 | drain silence pocket trace로 적합 |
| `assets/art_inbox/r01_props/r01_state_drain_silence_pocket_lead_battery_cable_v05.png` | 유지 | 침묵/역송출 재료 trace로 적합 |
| `assets/art_inbox/r01_decals/r01_state_fake_return_broken_floor_arrow_decal_v06.png` | 유지 | fake return route world decal로 적합 |

조건부 유지 파일은 final import 전에 crop, pseudo text, 480x270 가독성, telegraph conflict를 다시 확인한다.

## 5. 기존 샘플 중 폐기해야 할 것

폐기는 `현재 방향의 대표/상업 후보로 쓰지 않는다`는 뜻이다. 기록 보존이나 반례 참고는 가능하다.

| 경로/계열 | 폐기 이유 |
| --- | --- |
| `generated_assets/01_atomic_steampunk/` 전체 | 스팀펑크, 황동, 산업 폐허 방향으로 프로젝트 톤과 충돌 |
| `generated_assets/03_cute_dystopian_atomic/*chibi*` | 치비/어린 캐릭터화 위험 |
| `generated_assets/03_cute_dystopian_atomic/13_please_stay_mascot_boss.png` | 단순 큰 마스코트 보스 방향 위험 |
| `assets/style_samples/p0_direction/hybrid_production_candidate/r01_openhouse_battlefield_candidate.png` | 정상적인 clean open-house suburb로 읽힐 위험. 대표 아트 금지 |
| `assets/style_samples/p0_direction/hybrid_2d_cutout/r01_suburb_openhouse_background_warm_contrast_480x270.png` | warm readable background 참고는 가능하나 R01 생태계 설명 부족 |
| `assets/reference_bright_dystopian/10_abandoned_atomic_suburb_16px_tileset.png` | 일반 abandoned suburb tileset 방향으로 R01 법칙 약함 |
| `assets/reference_bright_dystopian/11_abandoned_atomic_suburb_16px_tileset_v2.png` | 위와 동일. 구조 참고만 가능 |
| `assets/reference_bright_dystopian/20_cheerful_corporate_mascot_robot_boss.png` | 단순 corporate mascot boss로 오해 위험 |
| `assets/art_inbox/rejected/` 내부 rejected 파일 | 반려 기록. 재사용하려면 원 반려 사유 해소 후 새 후보로 제출 |
| `assets/style_samples/p0_direction/production_cleanup_v2/enemy_infected_housewife_40x40_walk.png` | 주부 좀비 방향은 R01 적 계층보다 약함. 행복 보증 상담원 우선 |

## 6. 반려 판정 절차

1. 480x270 normal density mock에 배치한다.
2. 480x270 high density mock에 배치한다.
3. source object와 enemy/hazard/event/trace 연결을 적는다.
4. fake route/UI/telegraph conflict를 확인한다.
5. R01 5계층 중 어느 계층인지 표시한다.
6. normal suburb, steampunk, gore, chibi, disconnected monster 여부를 체크한다.
7. 승인, 조건부 수정, 반려 중 하나로 기록한다.

판정 양식:

```text
asset_id:
proposed_layer:
zone_allowed:
source_role:
480_readability:
telegraph_conflict:
story_fit:
decision: approved / conditional / rejected
reason:
required_fix:
```

## 7. 반려 기준 상세

### 7.1 집/배경

반려:

- 사람이 살기 좋은 예쁜 집으로만 보임.
- 창문이 따뜻한 생활감만 줌.
- 문패가 상품 데이터로 덮인 흔적이 없음.
- 마당이 사적 공간으로만 보이고 관람 동선이 없음.
- 같은 집 반복이 의도처럼 읽히지 않음.

수정:

- family window loop 추가.
- price/customer tag가 문패를 덮게 함.
- queue guide fence와 floor-plan line 추가.
- open-house sign이 모델하우스 결절 방향을 가리키게 함.

### 7.2 생활 인프라

반려:

- 우편함, 초인종, 스프링클러, 배수구, 청소기가 소품처럼만 보임.
- 전투 source, event source, trace anchor 중 아무 기능도 없음.
- smiling face만 있고 광고 명령이 읽히지 않음.

수정:

- projectile slot, projector lens, slime nozzle, intake grille, speaker grille, cable, tag를 추가.
- 장치가 원래 기능을 어떻게 오해했는지 드러내기.

### 7.3 몬스터

반려:

- 그냥 귀여운 작은 몬스터.
- 좀비/살점 적.
- 군사 로봇.
- 배경 인프라와 소재/팔레트가 분리됨.
- tier 크기 차이가 없어서 계층이 안 읽힘.

수정:

- paper, household device, kiosk, route sign 등 source를 명확히 함.
- tiny/small/medium/large/elite 크기 체계 적용.
- common enemy의 내부선과 glow 줄이기.

### 7.4 보스/결절

반려:

- 스마일 홈 시어머니를 악한 로봇 엄마 또는 주부 좀비로 단순화.
- 송출관을 첫 보스처럼 그림.
- 모델하우스 결절을 보스 본체처럼 중앙에 둠.
- 보스 전조 없이 보스만 덩그러니 배치.

수정:

- boss body가 아니라 approach cue로 제한.
- 모델하우스 node, family window, kiosk, doorbell, floor-plan line이 먼저 말하게 함.
- transmitter residue는 작고 낮은 hint로만 유지.

### 7.5 UI/Telegraph

반려:

- 배경 decal이 실제 위험 장판처럼 보임.
- fake route가 시스템 목표 화살표처럼 보임.
- pickup/reward와 종이 조각이 같은 sparkle을 씀.
- debug label, id, collision class가 일반 화면에 보임.

수정:

- background decal alpha/value 낮춤.
- gameplay telegraph outline/pulse를 별도 layer로 제작.
- fake route에는 broken/cancelled world prop 언어 사용.
- debug 정보는 QA overlay 전용으로 제한.

### 7.6 캠페인 라인 오류

반려:

- R01을 네온 광고 번화가처럼 그림.
- 거대 전광판, billboard, 음악 무대, 티켓 게이트가 주력 매체로 보임.
- 할인/소매 라인의 매대, 계산대, 쇼핑 카트가 R01의 중심이 됨.
- 방송/송출관 라인의 거대한 탑이나 화면이 첫 보스보다 중요하게 보임.

수정:

- R01 주력 매체를 주소 기반 주거 전환 인프라로 되돌린다.
- 현관, 문패, 창문, 우편함, 초인종, 모델하우스 동선, 상담 키오스크를 중심에 둔다.
- 네온은 필요할 경우 희미한 고장 조명이나 먼 상위 신호 잔향으로만 쓴다.
- 다른 캠페인 라인의 매체는 trace, residue, future foreshadow 수준으로 제한한다.

### 7.7 선택의 흔적 부재

반려:

- 첫 방문과 재방문 화면이 prop 밀도만 다르고 의미가 같다.
- player route, trace choice, boss outcome이 visual state에 반영되지 않는다.
- 귀환 결과가 보상 정산으로만 읽히고 다음 행동 질문이 없다.
- 실패/강제 회수가 단순 패배이고 캠페인이 학습했다는 흔적이 없다.

수정:

- 이전 동선 주변에 coupon trail, mailbox gaze, weak route 변형을 둔다.
- trace 선택에 따라 문패, 가족사진, 영수증, 라디오 계열 visual state를 바꾼다.
- `destroy_node`는 광고 표면이 벗겨지는 방향, `extract_memory`는 가족/이름 잔향이 증가하는 방향으로 분리한다.
- 귀환/재방문 문구에 보상, 미스터리, 선택의 흔적 중 최소 둘을 연결한다.

## 8. 다음 아트팀 작업 지시

다음 작업은 대량 양산이 아니라 `R01 광고 인프라 샘플 검수 패스`다.

작업 순서:

1. `R01_VISUAL_RULES_FOR_ART_TEAM.md`의 우선 샘플 12개 중 1-6번을 먼저 잡는다.
2. 각 샘플마다 source_role을 적는다: `enemy_source`, `hazard_source`, `event_source`, `trace_anchor`, `node_context`.
3. normal density 480x270 mock과 high density 480x270 mock을 모두 만든다.
4. 중앙 전투 영역을 과하게 채우지 않는다.
5. readable text는 이미지에 굽지 않는다.
6. 보스 본체는 새로 만들지 않는다. 접근 전조와 node context까지만 만든다.
7. 조건부 유지 에셋은 crop/pseudo text/telegraph conflict를 정리한 뒤 재제출한다.
8. 반려 파일은 이름만 바꿔 재제출하지 않는다. 반려 사유를 해결한 새 후보로 제출한다.

첫 검수 통과 조건:

- R01이 `예쁜 배경 + 광고 소품`이 아니라 `광고 명령 자동화 인프라`로 읽힌다.
- 집이 정상 주택이 아니라 가족 상품 시연 장치로 보인다.
- 우편함, 초인종, 스프링클러, 배수구, 청소기, 키오스크가 실제 source로 보인다.
- 작은 몹이 많아도 paper/infrastructure/robot/elite 계층이 읽힌다.
- fake return route와 실제 UI가 분리된다.
- 송출관은 후속 상위 신호로만 남는다.
