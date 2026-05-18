# R01 5-Zone Screenshot / Debug QA Report

작성일: 2026-05-18
범위: R01 5-zone blockout, debug overlay, collision/navigation 후속 후보.
주의: Godot headless live screenshot 캡처는 타임아웃으로 실패했다. `qa/screenshots/r01/` 이미지는 `scripts/r01_layout_blockout.gd`의 좌표/prop/collision 메타를 재현한 QA reference image이며, 라이브 런타임 캡처가 아니다.

## 1. 생성한 QA 이미지

| 파일 | 용도 |
| --- | --- |
| `qa/screenshots/r01/01_silence_edge_normal.png` | 침묵 가장자리 normal reference |
| `qa/screenshots/r01/02_silence_edge_debug.png` | 침묵 가장자리 debug reference |
| `qa/screenshots/r01/03_housing_loop_normal.png` | 분양 주택 루프 normal reference |
| `qa/screenshots/r01/04_housing_loop_debug.png` | 분양 주택 루프 debug reference |
| `qa/screenshots/r01/05_model_house_nexus_normal.png` | 모델하우스 결절 normal reference |
| `qa/screenshots/r01/06_model_house_nexus_debug.png` | 모델하우스 결절 debug reference |
| `qa/screenshots/r01/07_drain_pocket_debug.png` | 배수로 침묵 주머니 debug reference |
| `qa/screenshots/r01/08_fake_return_route_debug.png` | 가짜 귀환로 debug reference |

## 2. 현재 구조 확인

`scripts/r01_layout_blockout.gd` 기준:

- world bounds: `1920x810`
- viewport 기준: `480x270`
- camera screens: `12`
- zone anchor: 5개
- collision class: hard / soft / passable hazard / trigger / none
- pathing probe: 30 / 100 / 300 density preview
- debug 표시: `F12` detail HUD, `F1` help 또는 `F12`에서 blockout label 표시

Godot headless probe 기준 `first_visit` collision summary는 다음 구조다.

| 분류 | 개수 | 해석 |
| --- | ---: | --- |
| hard | 2 | house, model node 중심 |
| soft | 2 | mailbox/sign 계열 |
| hazard | 3 | flyer, floor plan, drain 등 passable hazard 후보 |
| trigger | 7 | photo/kiosk/projector/trace/speaker/fake route 등 |
| none | 8 | floor/scraps/route/tag/crack 등 |

## 3. Zone별 QA

### 침묵 가장자리

판정: 조건부 통과.

- 일반 화면에서 내부 `zone_id`는 노출되지 않고 자연문 구역명만 보이는 구조다.
- debug 상태에서만 anchor id, collision role, 거리 정보가 노출된다.
- 시작점이 `(-600, 170)`이고 hard blocker가 없어 첫 이동 완충 구역으로 적합하다.
- distant mailbox hint가 soft blocker라 첫 화면에서 너무 전투 장치처럼 보이지 않게 opacity 조절 필요.

후속 후보:

- 보급소 방향/침묵권 느낌을 더 주는 낮은 대비 edge prop 필요.
- 첫 방문 일반 화면에서는 marker label조차 너무 UI처럼 보이지 않게 fade 조건을 검토.

### 분양 주택 루프

판정: 조건부 통과.

- house, mailbox, flyer, route decal 조합으로 R01 기본 전투 루프의 역할은 읽힌다.
- 중앙 전체가 빈 arena는 아니지만, 현 blockout은 아직 "그려진 prop" 느낌이 강하다.
- house hard blocker 1개와 mailbox soft blocker가 붙어 있어 100마리 pathing에서 모서리 적체가 생길 수 있다.
- route decal이 no collision인 점은 적절하다.

후속 후보:

- house hard blocker를 edge-facing으로 더 밀고 중앙 회피 공간을 유지.
- mailbox prop enemy source와 mailbox enemy sprite의 시각 구분 필요.
- 100 enemy 실측 pathing에서 house corner stuck 확인 필요.

### 모델하우스 결절

판정: 통과에 가깝지만 boss arena 전환 기준 필요.

- `model_house_node_anchor` 주변은 hard node 1개 외에 trigger/hazard가 주로 배치되어 보스/elite/objective anchor로 확장 가능하다.
- pathing probe의 `model_house_node` 결과는 blocked sample 기준 pass로 설계되어 있다.
- 일반 화면에서 `SMILE HOME / 모델하우스` 자연문은 괜찮지만, 결절과 보스 본체를 혼동하지 않게 후속 visual 분리 필요.

후속 후보:

- 보스 arena용 clear radius를 별도 수치로 문서화.
- floor plan hazard는 passable telegraph와 background floor line의 대비 차이를 더 분리.
- 상담 kiosk / projector / family window trigger가 한 화면에서 너무 많아지면 F12 overlay가 지저분해질 수 있다.

### 배수로 침묵 주머니

판정: 후속 검증 필요.

- drain hazard + trace trigger 조합은 위험 보상 pocket으로 적합하다.
- 현재는 debug reference 기준 side pocket 정체성은 보이나, 실제 런타임에서 플레이어가 들어갈 이유가 충분히 표현되는지는 미검증.
- pocket 입구가 enemy swarm에 막히면 trap으로 읽힐 수 있다.

후속 후보:

- 입구 width / escape direction 기준을 추가.
- drain visual은 hard blocker가 아니라 passable hazard임을 더 분명히.
- trace candidate marker가 pickup UI처럼 보이지 않게 보급소/결과 UI와 색 분리.

### 가짜 귀환로

판정: 조건부 통과.

- fake route probe는 hard blocker 0, trigger 2개 이상 기준으로 pass 구조다.
- 실제 회수 UI가 아니라 environment event/phrase driven으로 설계된 점은 적절하다.
- 다만 route decal, speaker, fake recovery marker가 같은 화면에 모이면 플레이어가 "회수 버튼"으로 오해할 위험이 있다.

후속 후보:

- fake recovery marker는 실제 귀환 UI 색상/형태와 절대 공유하지 않는다.
- UI 단어 `귀환`, `회수`, `Return`을 prop 이미지에 직접 넣지 않는다.
- family voice/photo trigger를 passable hazard로 읽히게 하고, 확정 안내선처럼 보이지 않게 한다.

## 4. Debug Overlay QA

판정: 구조는 적절하나 밀도 조절 필요.

통과 항목:

- `DebugTools.detail_visible`이 true일 때만 collision/nav summary와 pathing probe가 HUD에 나온다.
- blockout label은 `debug_tools.blockout_debug_labels_visible()`가 true일 때만 내부 id를 보여준다.
- 일반 화면에서는 zone display name만 출력된다.

주의 항목:

- F12 상태에서 모든 prop collision label이 동시에 뜨면 모델하우스/분양 루프에서 시각 노이즈가 크다.
- `none` collision까지 표시하면 QA에는 좋지만 PMO 화면 리뷰에는 과하다.
- 300 density preview는 debug-only draw이며 실제 spawn 수로 오해하면 안 된다.

수정 후보:

- F12 1단계: zone + collision count만.
- F12 2단계 또는 Ctrl 옵션: prop별 collision label까지.
- `none` collision은 기본 overlay에서 숨기고 요청 시만 표시.

## 5. Navigation / Collision 수정 필요 항목

커밋 분리 기준: 아래는 바로 수정하지 말고 R01 collision/navigation fix 커밋으로 분리한다.

| 후보 | 우선도 | 이유 |
| --- | --- | --- |
| `fake_return_route` visual/UI 혼동 제거 | 높음 | 실제 귀환 UI처럼 보이면 0.2 루프 이해를 깨뜨림. |
| `model_house_node` clear radius 기준 추가 | 높음 | boss/elite/objective anchor가 막히지 않아야 함. |
| `subdivision_loop` house hard blocker 위치 조정 | 중간 | 100 enemy pathing에서 모서리 적체 가능. |
| soft blocker 밀도 조정 | 중간 | mailbox/sign이 실질 hard wall처럼 되면 안 됨. |
| passable hazard 대비 규칙 | 중간 | drain/floor plan/flyer가 blocker 또는 pickup과 혼동될 수 있음. |
| F12 overlay 단계화 | 낮음-중간 | QA 편의와 PMO 리뷰 화면을 분리. |

## 6. 현재 QA 결론

R01은 이제 단일 480x270 arena가 아니라 12 camera screens 규모의 world-space local map으로 설계되어 있다. 5개 구역도 단순 배경 이름이 아니라 entry, combat loop, objective anchor, risk pocket, false route 역할을 가진다.

다만 현재는 아직 "실제 art/scene"이 아니라 code-drawn blockout + metadata QA 단계다. 0.2에서 게임처럼 보이게 하려면 다음이 필요하다.

- live Godot screenshot 재시도 또는 GUI 환경 캡처.
- 30/100/300 pathing 실제 런타임 관찰.
- fake return route UI 혼동 제거.
- model house node 주변 boss arena clear space 정의.
- 보급소/결과 UI와 R01 prop 색상 언어 분리.

## 7. PMO 판단 필요

- `qa/screenshots/r01/`의 reference image를 문서 커밋에 포함할지.
- live screenshot이 없는 상태에서 이 QA를 "pre-QA"로 인정할지.
- F12 overlay를 단계화하는 구현 작업을 0.2 P0로 올릴지.
- fake return route marker의 최종 금지 색/형태 기준.
