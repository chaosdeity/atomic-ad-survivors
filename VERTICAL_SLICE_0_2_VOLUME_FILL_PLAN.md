# Vertical Slice 0.2 Volume Fill Plan

상태: 0.2 평가 가능 상태로 가기 위한 볼륨 채우기 계획
범위: 문서 계획만 작성. 코드 구현, 에셋 생성, Godot import, 밸런스 조정 없음.
PMO 판단: 지금은 손맛/세부 밸런스 테스트를 계속하지 않고, 먼저 0.2 첫 평가에 필요한 시청각/공간/흐름 볼륨을 채운다.

## 1. 현재 판단

현재 상태에서 손맛 테스트, 세부 밸런스 조정, 10px/11px 같은 미세 판정 조정, 카드 재미 최종 판단을 계속하는 것은 이르다.

이유는 전투 입력 자체가 무의미해서가 아니다. 윤서의 기본 방향, 반품 스캐너, 반품 도장, R01 외곽 주택가, 침묵 보급소, 스마일 홈 시어머니, 캠페인 송출관의 상위 목표 관계는 이미 큰 방향이 잡혀 있다. 문제는 플레이어가 5~10분 동안 보는 것과 듣는 것이 아직 하나의 게임 세계로 닫히지 않았다는 점이다.

현재 주요 부족분:

- 최종/준최종 이미지 에셋이 부족하다. 현재 PNG 일부는 Godot slicing/import 검증용 후보에 가깝고, PMO 승인용 대표 아트 또는 상업용 최종 후보로 단정하면 안 된다.
- BGM/SFX가 부족하다. 자동공격, 반품 도장, 표식, 적 피격, 보스 패턴, 보급소 귀환이 소리 없이 평가되면 손맛 판단이 왜곡된다.
- UI 에셋이 부족하다. HUD, 카드 선택, 결과 화면, 보급소 화면이 코드/기본 UI 느낌으로 남으면 게임의 세계관 밀도가 낮게 읽힌다.
- R01 collision/navigation이 미확정이다. world-space blockout과 5개 구역 논리는 있으나 hard/soft blocker, passable hazard, navigation cost, enemy pathing 검증이 아직 평가 기준까지 닿지 않았다.
- 적/중간 위협 볼륨이 부족하다. basic/fast/tank/signal, speaker/charger, elite/중간 위협이 충분히 섞이지 않으면 전투 압박과 카드 가치가 실제보다 단순하게 보인다.
- 보스 연출이 부족하다. 스마일 홈 시어머니는 0.2의 첫 보스이자 지역 선택의 증거인데, 실루엣/아레나/패턴 예고/처리 결과/HP 65%와 25% 성과 피드백이 부족하면 보스 수치 평가가 무의미하다.
- 보급소 귀환감이 부족하다. 침묵 보급소는 메뉴가 아니라 런 결과가 이름, 흔적, 시설 변화로 바뀌는 장소여야 한다.
- 전체 5~10분 플레이 흐름의 시청각 완성도가 부족하다. 출격, R01 이동, 전투, 신호 이벤트, 강제 회수 또는 보스 접근, 결과/정산, 보급소, 재출격이 끊기지 않고 이어져야 손맛/밸런스 판단이 가능하다.

따라서 지금 해야 할 일은 세부 수치를 더 만지는 것이 아니라, 0.2가 평가 가능한 게임 상태로 보이고 들리게 만드는 볼륨 확보다.

## 2. 0.2 평가 가능 상태 정의

0.2 평가 가능 상태란 아래 상태를 말한다.

```text
게임을 켰을 때 임시 코드 드로잉이 아니라,
윤서/R01/보급소/적/보스/결과 화면이 최소한 하나의 세계처럼 보이고 들리는 상태.
```

더 구체적으로는 다음을 만족해야 한다.

- 윤서가 adult 실무자/회수자로 읽히고, 반품 스캐너와 반품 도장이 화면에서 구분된다.
- R01 외곽 주택가가 빈 arena가 아니라 침묵 가장자리, 분양 주택 루프, 모델하우스 결절, 배수로 침묵 주머니, 가짜 귀환로를 가진 RPG 로컬 필드처럼 느껴진다.
- 기본 적, speaker/charger, elite/중간 위협, 보스가 서로 다른 실루엣과 위험 언어를 가진다.
- 스마일 홈 시어머니는 단순 큰 적이 아니라 외곽 주택가를 가족 상품 생태권으로 묶는 결절로 보인다.
- 침묵 보급소는 정산/업글 메뉴가 아니라 돌아온 장소로 느껴진다.
- HUD, 카드, 결과, 보급소 UI가 내부 수치를 노출하지 않으면서 플레이 목표와 성과를 전달한다.
- SFX/BGM placeholder라도 자동공격, 반품 도장, 피격, 보스, 보급소 귀환의 감각을 분리한다.
- 5~10분 플레이에서 출격, 전투, 정산, 보급소, 재출격 루프가 끊기지 않는다.

이 조건 전에는 카드 재미, 보스 수치, 판정 픽셀, 세부 DPS 같은 판단은 임시 판단으로만 취급한다.

## 3. 볼륨 카테고리

### A. 이미지 에셋

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| 윤서 | 기존 플레이어 후보는 import 검증용 성격이 강함 | 20대 중후반 실무자, 손글씨 이름표, 반품 스캐너/도장 장비, 회수선 릴이 읽힘 | PMO 승인용 윤서 48x48 스타일 샘플 검수, 4방향 2프레임 적용 계획 작성 |
| tier1 적 | 일부 32x32 후보 존재, 최종 방향은 재정의 필요 | 광고/판촉 물질 계열과 생활 인프라 계열이 분리되어 보임 | 쿠폰 전단 떼, 미소 우편함, 홈케어 청소기 후보별 실루엣 검수 |
| speaker/charger | 기능 역할에 맞는 별도 실루엣 부족 | 신호 발생원/차징 압박 원인으로 즉시 구분 | streetlight speaker, 상담 kiosk, charger marker placeholder 목록 작성 |
| elite | 행복 보증 상담원 방향이 더 적합하나 아직 적용 볼륨 부족 | 40x40 또는 48x48급 중간 위협으로 tier1보다 크고 역할이 분명함 | 행복 보증 상담원 스타일 샘플 검수 및 패턴 placeholder 연결 |
| 스마일 홈 시어머니 | 보스 콘셉트는 확정, 전용 이미지/연출 부족 | 둥근 1950s 가전, CRT 얼굴, 쿠폰 종이 치마, 모델하우스 장치가 읽힘 | 보스 80~128px visual/animation placeholder 계획 작성 |
| R01 prop | atlas/slicing 논리와 blockout prop은 있으나 최종/준최종 적용 부족 | zone별 prop이 장식이 아니라 spawn/hazard/trace/event 이유를 가짐 | house, mailbox, drain, streetlight, doorbell, nameplate, model house node별 적용 우선순위 정리 |
| 보급소 시설 | 보급소 문서상 시설은 있으나 화면 볼륨 부족 | 정산 카운터, 정비대, 이름 보관함, 출격 게시판, 차징 조율대가 한 화면에서 구분 | 시설별 visual placeholder sheet 계획 |
| UI 패널 | HUD/card/result 후보는 있으나 cleanup 및 적용 기준 필요 | Korean text를 얹어도 깨지지 않는 레트로 카탈로그/영수증 UI | HUD, 결과, 보급소 패널 9-slice 적용 계획 |
| 카드 UI | 카드 배경/아이콘 후보가 있으나 0.2 카드 풀과 연결 필요 | 기본 8장/해금 4장 카드가 제품 카탈로그처럼 보임 | 카드 아이콘 의미 재검수, hover/selected/disabled 상태 정의 |
| VFX atlas | 후보 atlas는 있으나 실제 손맛 연결 부족 | 반품 도장, 표식, 피격, 처치, 압박 링, 보스 패턴이 atlas에서 분리 | VFX atlas region map 및 P0 적용 순서 작성 |

### B. 맵/공간 볼륨

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| R01 world-space 확장 | 1920x810, 12 camera screens 규모 blockout 보고 있음 | 실제 이동 이유가 있는 5개 구역이 플레이 중 체감됨 | blockout 기준 zone별 이동 목표와 시야 기준 재정리 |
| collision/navigation | blockout props는 draw placeholder 중심 | hard blocker, soft blocker, passable hazard, navigation cost가 분리됨 | R01 collision/navigation architecture spec 작성 |
| hard/soft blocker | 구역 논리는 있으나 충돌 의도 미확정 | 집/울타리/모델하우스는 hard, 전단/낮은 장식은 soft/no collision | prop별 collision intent table 작성 |
| passable hazard | drain/slime/floor plan 등 위험 후보만 있음 | 지나갈 수 있지만 판단이 필요한 장판/흡입/플래시 위험 | passable hazard color/layer 규칙 정의 |
| zone별 prop | zone별 required/optional prop은 문서화됨 | 실제 화면에서 zone 정체성이 읽힘 | 5개 구역별 prop density budget 작성 |
| 5개 구역 이동감 | anchor와 adjacency는 있음 | silence_edge에서 model_house_node까지 이동 리듬이 있음 | 각 구역 480x270 screenshot 목표 작성 |
| 100~300 enemy pathing 테스트 | 30/100/300 density는 draw-only probe | 실제 enemy pathing과 nav/obstacle 충돌이 검증됨 | 100/300 pathing test checklist 작성 |

### C. 적/전투 볼륨

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| basic/fast/tank/signal | 적 역할 분화가 충분히 보이지 않음 | R01 tier1 안에서 접근 속도, 내구, 신호 목표가 구분됨 | 0.2 enemy role sheet 작성 |
| speaker/charger | 패턴 소스/위험 원인으로 구분 필요 | 스피커는 신호/호명, charger는 차징 압박/전조를 담당 | speaker/charger visual + SFX placeholder 목록 |
| 압박 링/위험 전단 | 전투 압박 언어가 아직 임시적 | danger ring, flyer fall, route decal이 gameplay telegraph와 분리됨 | 위험 전조 색/레이어 규칙 작성 |
| elite/중간 위협 | 행복 보증 상담원 후보가 있음 | 5~10분 플레이 중 1~2회 기억나는 중간 위협 | elite spawn timing과 telegraph placeholder 계획 |
| 피격 원인 표시 | 고밀도에서 왜 맞았는지 흐릴 수 있음 | 적 접촉, flyer, ring, boss pattern의 원인이 다르게 보임 | hit feedback icon/color/SFX matrix 작성 |
| 차징/자동공격 피드백 | 윤서 방향은 확정, feedback volume 부족 | 반품 스캐너 적중과 반품 도장 표식/외피 균열이 확실함 | scanner/stamp feedback pass 계획 |

### D. 보스 볼륨

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| 스마일 홈 시어머니 실루엣 | 콘셉트 확정, 전용 placeholder 부족 | 80~128px급 보스가 R01 가족 상품 결절로 읽힘 | silhouette sheet와 1~2프레임 idle 계획 |
| 패턴별 예고/피드백 | 오늘의 가족 특가, 깨끗한 거실, 기념사진 시간 구조 있음 | 쿠폰 탄막, 흡입 장판, 사진 플래시가 모바일에서도 판독됨 | pattern telegraph placeholder spec 작성 |
| HP 65/25 성과 | 보상 구조는 문서화됨 | 실패해도 외피 손상 기록/코어 파편 성과가 이해됨 | HP threshold result UI 문구/효과 계획 |
| 보스 회수/처리 결과 | 결절 파괴/기억 추출 확정 | 선택 후 보급소/재방문 변화가 즉시 보임 | boss outcome visual and phrase checklist |
| 결절 파괴/기억 추출 hook | 지역 반응 문구는 있음 | 다음 R01 방문의 prop/문구/위험 변화로 이어짐 | outcome별 R01 preview state 정의 |
| 보스 arena/모델하우스 결절 공간 | model_house_node anchor는 있음 | 모델하우스 앞 원형 교차로와 결절 장치가 보스전 무대로 읽힘 | boss arena collision/prop/blocker 계획 |

### E. 보급소 볼륨

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| 침묵 보급소 배경/시설 | 편의점형 거점 방향 확정 | 작은 공간 안에서 카운터, 보관함, 정비, 출격이 구분됨 | outpost one-screen visual blockout 계획 |
| 정산 카운터 | 성과/회수물 중심 기능 필요 | 런 결과, 광고 전단 조각, 흔적, 송출 기록이 정리됨 | counter result panel placeholder 정의 |
| 정비대 | 반품 스캐너 성장 시설 | 첫 개조 후 다음 런이 기대됨 | workbench visual state 0/1 계획 |
| 이름 보관함 | 흔적 보관의 감정 코어 | 문패/사진/영수증이 장소에 남는 느낌 | name locker object slots 계획 |
| 출격 게시판 | 다음 목표 전달 | 송출 기록, 보스 접근, 후속 신호 목표를 문구로 표시 | sortie board phrase priority UI 계획 |
| 차징 조율대 | 반품 도장/회수선 성장 시설 | 차징 손맛과 회수 안정화가 한 시설에서 연결됨 | stamp tuning bench placeholder 계획 |
| 업글 UI | 내부 수치 노출 위험 | 숫자보다 장비/시설 문구 중심의 작은 개조 UI | upgrade card/panel separation plan |
| 귀환 문구 | 귀환감 부족 | 첫 회수, 보스 실패, 보스 처리 후 문구가 다름 | return phrase bank P0 작성 |

### F. UI/UX 볼륨

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| HUD | 기본 기능 중심 | HP, 차징, 목표가 작고 읽기 쉬움 | HUD visual placeholder 적용 계획 |
| 카드 선택 | 카드 데이터는 있으나 최종 판단 보류 | 3택이 카탈로그/쿠폰 UI로 보이고 내부 수치를 과노출하지 않음 | card UI layout and text length check |
| 결과 화면 | 정산과 성장 연결이 더 필요 | 생존/처치/신호/흔적/보스 성과가 한 번에 읽힘 | result screen hierarchy 계획 |
| 보급소 화면 | 메뉴처럼 보일 위험 | 시설이 있는 장소 화면 위에 필요한 UI만 뜸 | hub screen layer plan |
| 출격 목표 | 송출 기록/보스 접근이 중요 | 다음 할 일이 자연문으로 보임 | sortie objective phrase set 작성 |
| 디버그와 일반 UI 분리 | blockout label/density probe가 있음 | 일반 화면에는 zone_id/prop_id/내부 role이 숨김 | debug visibility checklist |
| 내부 수치 비노출 | 원칙은 확정 | trace_preservation, campaign_pressure 등은 현상으로만 표현 | hidden state wording guide |

### G. SFX/BGM 볼륨

| 항목 | 현재 상태 | 필요한 상태 | 작업 후보 |
| --- | --- | --- | --- |
| 자동공격 | 소리 정체성 부족 | 짧은 scanner beep/return ping | scanner SFX placeholder 2종 |
| 반품 도장 | 윤서 핵심 손맛인데 소리 부족 | 짧고 명확한 stamp/clack + impact | stamp charge/ready/fire/hit SFX 목록 |
| 표식 | 표식 부여와 우선 타겟 피드백 필요 | 적에게 붙는 작은 seal sound | mark apply/expire SFX |
| 적 피격 | 적 재료가 다르게 느껴져야 함 | 종이, 가전, 슬라임 피격음 구분 | enemy material hit SFX matrix |
| speaker/charger | 신호 위협이 소리로 먼저 읽힘 | 방송 잡음, 충전 경고, 짧은 jingle | speaker/charger loop and warning placeholders |
| 압박 링/전단 낙하 | 위험 전조 판독 필요 | ring windup, flyer fall, paper snap | hazard telegraph SFX set |
| 보스 패턴 | 보스 정체성 강화 | 가족 특가 jingle, vacuum pull, photo flash | boss pattern SFX list |
| 보급소 귀환 | 죽음이 아니라 회수로 읽힘 | cable pull, door bell, quiet neon | outpost return stinger |
| R01 ambient | 빈 arena 느낌 방지 | distant ad speaker, suburban hum, paper wind | R01 ambient loop placeholder |
| 피날레 압박 | 5~10분 후반 밀도 | ad pressure layer, low signal pulse | finale pressure BGM layer |
| 결과/정산 | 성과가 정리되는 느낌 | receipt print, counter stamp, soft settle | result/settlement SFX |

## 4. 우선순위

### P0: 평가 가능 상태에 반드시 필요한 것

- 윤서 최소 visual pass: 성인 실무자 실루엣, 반품 스캐너, 반품 도장 구분.
- R01 최소 visual pass: 5개 구역의 배경/prop placeholder가 서로 다르게 읽힘.
- R01 collision/navigation architecture spec: hard/soft blocker, passable hazard, pathing 기준.
- basic/fast/tank/signal 또는 이에 준하는 tier1 역할 구분.
- speaker/charger 또는 신호/차징 압박 source의 최소 구분.
- 반품 스캐너/반품 도장 VFX + SFX placeholder 1차.
- 스마일 홈 시어머니 실루엣과 보스 arena placeholder.
- 보스 패턴 P0 3종의 예고/피드백 placeholder.
- 침묵 보급소 one-screen visual placeholder: 정산 카운터, 정비대, 이름 보관함, 출격 게시판, 차징 조율대.
- HUD, 카드 선택, 결과 화면의 placeholder UI 적용 계획.
- R01 ambient, 보급소 귀환, 보스 패턴, 결과/정산 SFX/BGM placeholder 목록.
- 5~10분 출격 -> 전투 -> 정산 -> 보급소 -> 재출격 플로우 checklist.

### P1: 손맛/밸런스 테스트 전에 있으면 좋은 것

- 윤서 4방향 2프레임 cleanup 및 실제 viewport mock 검수.
- tier1 3종, elite 1종, speaker/charger 각 1종의 준최종 sample.
- 100~300 enemy pathing test와 고밀도 시야 suppression 규칙.
- 카드 UI 아이콘/상태 확장: selected, disabled, rare/locked 후보.
- 보스 HP 65/25 성과 결과 화면과 보급소 문구 강화.
- 결절 파괴/기억 추출 후 R01 prop/state preview.
- 이름 보관함 흔적 object slot과 P0 흔적 3종 visual placeholder.
- SFX material variation: paper, appliance, slime, boss shell.
- BGM layer: R01 ambient, pressure, boss, outpost.

### P2: 0.3 이후 또는 상업 polish 후보

- 상업 최종 아트 전체 pass.
- 보스 고급 애니메이션, 전용 컷인, 긴 연출.
- 코어 해방, 신호 우회, 캠페인 송출관 직접 보스전.
- 대형 마을형 보급소, 복잡한 NPC 관계/호감도.
- 장비 세트, 오퍼레이터, 카탈로그, 과금/가챠/상점.
- 고급 카드 도감, 스토리 컷신, 마케팅 capsule art 완성본.
- 복잡한 저장/계정/동기화 시스템.

## 5. 절대 지금 하지 말 것

```text
세부 판정 10px/11px 미세 조정
카드 밸런스 최종화
보스 수치 최종화
과금/가챠/카탈로그 구현
최종 상업용 아트라고 단정
대규모 저장/계정 시스템
```

추가 금지:

- 기존 dirty 파일 정리 또는 되돌리기.
- 코드 수정.
- 에셋 생성.
- Godot import.
- 보스/보상/성장/카드 변경.
- 내부 상태값을 일반 UI에 직접 노출.
- R01을 다시 빈 arena 기준으로 평가.

## 6. 다음 작업 분해

추천 순서:

1. R01 collision/navigation architecture spec
   - 목적: 현재 world-space blockout을 실제 플레이 가능한 로컬 필드로 바꾸기 전, 충돌/이동/위험 기준을 문서화한다.
   - 산출물: hard blocker, soft blocker, passable hazard, enemy navigation, 100~300 pathing 테스트 기준.

2. R01 Godot collision/navigation blockout
   - 목적: 5개 구역의 이동감과 적 pathing을 실제 Godot에서 확인한다.
   - 산출물: collision placeholder, navigation probe, 5개 zone screenshot/checklist.

3. P0 style sample production cleanup 검수/적용 계획
   - 목적: 현재 slicing/import 후보와 PMO 승인용 스타일 샘플을 분리한다.
   - 산출물: 윤서, 쿠폰 전단 떼, 미소 우편함/홈케어 청소기, 행복 보증 상담원, 스마일 홈 시어머니 후보별 검수표.

4. SFX/BGM placeholder list 작성
   - 목적: 손맛 판단 전에 최소 청각 피드백 목록을 고정한다.
   - 산출물: 자동공격, 반품 도장, 표식, 적 피격, speaker/charger, 보스, 보급소, 결과 SFX/BGM 목록.

5. 보급소 시설 visual placeholder 계획
   - 목적: 침묵 보급소가 메뉴가 아니라 돌아오는 장소로 읽히게 한다.
   - 산출물: 정산 카운터, 정비대, 이름 보관함, 출격 게시판, 차징 조율대 배치/상태 계획.

6. 스마일 홈 시어머니 visual/animation placeholder 계획
   - 목적: 첫 보스가 수치 덩어리가 아니라 R01 결절로 보이게 한다.
   - 산출물: 실루엣, idle 1~2프레임, 패턴별 telegraph, HP threshold feedback, 처리 결과 연출.

7. 카드 UI/VFX placeholder 계획
   - 목적: 카드 재미 판단 전에 카드가 0.2 세계관 UI로 읽히게 한다.
   - 산출물: 기본 8장/해금 4장 카드 UI 상태, icon 후보, 반품 도장/표식/VFX atlas region mapping.

8. 0.2 통합 플레이 플로우 checklist
   - 목적: 5~10분 전체 흐름이 끊기지 않는지 PMO가 판단할 수 있게 한다.
   - 산출물: 첫 실행, 첫 런, 첫 회수, 첫 개조, 재출격, 신호 이벤트, 보스 접근, 결과/정산, 보급소 귀환 체크리스트.

## 7. PMO 게이트

손맛/밸런스 테스트 재개 조건:

- 윤서/적/보스 최소 에셋 적용 또는 준최종 placeholder 적용 계획이 PMO 승인됨.
- R01 collision/navigation blockout이 적용되어 hard/soft blocker, passable hazard, enemy pathing이 검증됨.
- SFX placeholder 1차가 적용 또는 적용 목록이 확정되어 자동공격, 반품 도장, 피격, 보스, 보급소 귀환 소리 기준이 생김.
- 보급소 visual placeholder가 적용 또는 적용 계획이 확정되어 정산/정비/이름 보관/출격/차징 조율이 장소로 읽힘.
- HUD, 카드 선택, 결과/정산, 보급소 화면이 내부 수치를 노출하지 않고 일반 UI와 디버그 UI가 분리됨.
- 5~10분 플레이 흐름이 끊기지 않음.
- 결과/정산/보급소/재출격 루프가 확인됨.
- 스마일 홈 시어머니 보스는 최소 실루엣, arena, 패턴 예고, HP 65/25 성과, 처리 결과 hook을 가짐.
- R01은 빈 arena가 아니라 RPG 로컬 필드 감각을 가짐.

게이트 통과 후에만 아래 판단으로 돌아간다.

- 반품 도장 손맛 점수.
- 자동공격 안정감.
- 카드 선택 재미.
- 보스 HP/패턴 수치.
- 적 밀도와 웨이브 속도.
- collision radius나 10px/11px 같은 미세 판정.

## 8. 0.2 고정 방향 재확인

- 0.2 첫 플레이어블은 윤서다.
- 윤서 자동공격은 반품 스캐너다.
- 윤서 차징은 반품 도장이다.
- 첫 지역은 R01 외곽 주택가다.
- 첫 보스는 스마일 홈 시어머니다.
- 캠페인 송출관은 상위 목표/후속 신호다.
- 침묵 보급소는 첫 거점이다.
- 0.2 과금은 없다.
- R01은 빈 arena가 아니라 RPG 로컬 필드 감각을 가진다.
- 세부 밸런스는 볼륨 확보 후 테스트한다.
