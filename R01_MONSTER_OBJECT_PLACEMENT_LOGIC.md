# R01 Monster Object Placement Logic

상태: R01 몬스터/오브젝트 배치 논리  
범위: zone별 spawn source, 오브젝트 위치 이유, 보스 접근 징후, 흔적 배치  
비범위: 코드 구현, spawn 수치 확정, 보스 수치/패턴 변경

## 1. 기본 원칙

R01에서는 몹과 오브젝트가 아무 데나 있으면 안 된다. 적은 캠페인 농도에서 나오지만, 화면에서는 반드시 `어디서 왜 나왔는지`를 암시해야 한다.

핵심 규칙:

1. 작은 몹은 종이 판촉물의 축적 지점에서 발생한다.
2. 중간 몹은 생활 인프라 장치와 연결된다.
3. 큰 몹은 동선, 방송, 보증, 상담 같은 구역 기능을 점유한다.
4. 엘리트는 구역 절차를 관리하는 위치에 선다.
5. 보스 접근 전에는 환경 전체가 같은 방향으로 말하기 시작한다.
6. trace는 위험/동선/이야기 이유가 있는 곳에만 둔다.
7. 중앙 전투 공간은 비워 두고, source와 설명은 mid-risk/edge에 둔다.

배치의 감정 목표:

```text
플레이어가 고른 route, trace, 생존 방식 때문에
다음 R01 배치가 조금 달라진 것처럼 느끼게 한다.
```

따라서 좋은 배치는 단순히 `적이 잘 나온다`가 아니라, 아래 흐름을 만든다.

```text
오브젝트 source를 본다
-> 위험을 예상한다
-> 예상과 살짝 다른 광고 반응이 나온다
-> 겨우 통과하거나 trace를 놓친다
-> 다음 방문 때 확인할 이유가 남는다
```

## 2. 몬스터 계층별 발생 위치

| 계층 | 발생 위치 | source object | 자연스러운 구역 | 배치 이유 |
| --- | --- | --- | --- | --- |
| 작은 몹 | flyer pile, 우편함 주변, 이전 player path, open-house paper scatter | 전단, 쿠폰, catalog scrap | 침묵 가장자리 낮은 수, 분양 주택 루프 주력, fake route 추적 | 광고 물질이 날씨처럼 쌓이다 개체화됨 |
| 중간 몹 | mailbox cluster, vacuum dock, sprinkler line, doorbell projector, drain edge | 생활 인프라 장치 | 분양 주택 루프, 배수로, fake route | 원래 도움 장치가 전투 기능으로 재동기화됨 |
| 큰 몹 | road choke, streetlight broadcast point, product compare board, warranty plate | 안내/방송/보증 장치 | fake route, model-house 접근부, loop 외곽 | 구역의 이동 판단을 흔드는 lane owner |
| 엘리트 | kiosk socket, contract podium, model-house node 접근 edge | 상담 키오스크, 모델하우스 장치 | 모델하우스 결절, 오픈하우스 변형 | 플레이어를 입주 후보로 분류하는 pattern owner |
| 보스 | 모델하우스 결절 이후 별도 arena/anchor | R01 가족 상품화 결절 | 보스 route ready 이후 | 지역 법칙의 얼굴. 일반 density 몹이 아님 |

## 3. 작은 몹 배치

작은 몹의 핵심은 `대량 광고 물질`이다.

허용 source:

- flyer pile.
- mailbox에서 흘러나온 전단.
- open-house sign 아래 종이 더미.
- 반복 실패 후 player path를 따라 남은 tiny coupon trail.
- fake return route의 친절한 화살표 주변.

금지 source:

- 비어 있는 중앙 바닥에서 아무 설명 없이 솟아남.
- 보스 결절 바로 앞에서 무한히 발생해 보스 전조를 가림.
- trace object 위에 겹쳐져 회수 대상이 안 보임.

권장 패턴:

| 패턴 | 위치 | 목적 |
| --- | --- | --- |
| 종이 몰림 | loop lane 양옆 | 기본 처치감과 XP 공급 |
| 쿠폰 trail | fake route 진입부 | 캠페인이 이전 동선을 학습했다는 표시 |
| flyer fall | mailbox/open-house sign 근처 | source가 있는 낙하 pressure |
| tiny density layer | edge/background | 수량감만 주고 판정은 만들지 않음 |

## 4. 중간 몹 배치

중간 몹은 생활 인프라와 연결되어야 한다.

| 몹 | 연결 시설 | 권장 위치 | 위험 패턴 | 배치 이유 |
| --- | --- | --- | --- | --- |
| 미소 우편함 | 우편함, parcel box, 문패 | house front와 lane 사이 | 직선 flyer projectile | 개인 통신이 광고 탄환으로 변함 |
| 홈케어 청소기 | vacuum dock, garage, driveway | loop mid-risk, model-house edge | suction, pickup 방해 | 청결 명령이 기억 제거로 확장됨 |
| 초인종 projector | doorbell, 현관 panel | model-house node, house edge | photo flash, short stun cue | 귀가 감각이 가족 광고 이벤트로 변함 |
| 스프링클러 broadcaster | lawn sprinkler, drain line | lawn lane, drain pocket 입구 | slime puddle, spray zone | 생활 유지 장치가 캠페인 물질을 살포 |
| drain suction unit | toxic drain, utility crack | drain silence pocket | suction/leak, 좁은 pocket 압박 | 하부 인프라가 캠페인 물질 source가 됨 |

중간 몹이 많을 때의 주의:

- prop mailbox와 enemy mailbox는 실루엣, 상태, animation으로 구분한다.
- 청소기 enemy와 vacuum dock prop은 같은 화면에서 역할이 겹치지 않게 둔다.
- 초인종 projection은 source이고, 실제 위험 telegraph는 별도 layer로 만든다.

## 5. 큰 몹 배치

큰 몹은 구역을 점유하는 장치다. 단순히 HP가 큰 적이 아니라 특정 route나 lane을 광고 절차로 잠근다.

| 큰 몹 후보 | 점유 구역 | 기능 | 배치 조건 |
| --- | --- | --- | --- |
| route sign robot | fake return route, loop 외곽 | 추천 동선 강제, route bait | 첫 회수 이후 또는 반복 실패 후 |
| streetlamp speaker unit | road edge, fake route | 방송 후 탄/버프/추적 cue | streetlight prop과 연결 |
| warranty plate tank | model-house 접근부 | 보증서 shield, plated pressure | 보스 전조 또는 high pressure |
| speaker wave unit | open-house event zone | wave line, mob speed aura | 중앙이 아닌 edge-facing lane |
| product compare board crawler | model-house node edge | 선택지/계약 압박 | kiosk/socket 주변 |

큰 몹 금지:

- 중앙 50-60%를 계속 막아 player pathing을 불공정하게 만들기.
- 일반 prop과 구분되지 않는 정지 장식처럼 만들기.
- 보스보다 더 중요한 실루엣으로 model-house node를 덮기.

## 6. 엘리트 배치

행복 보증 상담원은 아무 데나 등장하면 안 된다. 이 엘리트는 `상담 절차가 전투 패턴이 되는 지점`에 있어야 한다.

권장 등장 위치:

- consultation kiosk socket이 있는 model-house node 접근부.
- contract podium 또는 product compare board 주변.
- open-house signs가 같은 방향으로 정렬된 high-risk edge.
- 분양 주택 루프에서 송출 기록 2/3 이후 열리는 상담 대기 lane.

패턴과 위치 연결:

| 패턴 | 필요한 환경 source | 위치 |
| --- | --- | --- |
| 추천 매물 구역 | floor-plan line, route decal | 넓은 lane, 중앙 외곽 |
| 상담 예약 | kiosk socket, customer tag | player path 근처 mid-risk |
| 고객 동선 최적화 | streetlight speaker, open-house signs | route/fake route 연결부 |
| 잡몹 speed aura | flyer pile, mailbox cluster | paper/source가 있는 곳 |

엘리트 배치 실패:

- 침묵 가장자리 첫 화면에 갑자기 등장.
- 배수로 pocket 안에서 부동산 상담 맥락 없이 등장.
- 보스 전조 없이 보스 대체물처럼 중앙에 배치.

## 7. 보스 접근 전 환경 징후

보스가 나타나기 전 환경이 먼저 바뀌어야 한다.

보스 접근 징후:

1. open-house signs가 서로 다른 방향을 버리고 같은 방향을 가리킨다.
2. family window loop가 늘고, 가족 구성원이 player 쪽을 보는 듯한 frame이 생긴다.
3. doorbell projector가 단순 장식이 아니라 event source로 읽힌다.
4. consultation kiosk socket이 켜지고 상담 대기 구역이 생긴다.
5. floor-plan line이 모델하우스 결절 주변에 많아진다.
6. 가로등 방송이 플레이어를 `새 가족 구성원` 또는 `입주 후보`로 부른다.
7. 우편함과 청소기가 집 front보다 player path를 더 자주 바라본다.
8. transmitter residue hint가 낮은 빈도로 보이지만, 보스 본체처럼 커지지 않는다.

보스 접근 전 금지:

- 보스 본체를 미리 일반 prop처럼 배치.
- 캠페인 송출관을 보스 silhouette로 보여주기.
- 보스 arena로 가는 길을 실제 회수 UI처럼 표현.
- 모든 징후를 텍스트 팝업으로 설명.

## 8. NPC 또는 흔적 오브젝트 배치

R01에 NPC가 직접 서 있는 경우는 제한적이어야 한다. 이 지역은 사람이 사는 마을이 아니라 사람이 상품 절차로 덮인 장소다. NPC가 있다면 실제 인물보다 `흔적`, `통신`, `보급소 반응`으로 두는 편이 맞다.

권장 trace 위치:

| 흔적 | 위치 | 보호/위험 구조 | 이야기 |
| --- | --- | --- | --- |
| 지워지지 않은 문패 | house front edge, price tag 아래 | 근처에서 버티거나 우편함/엘리트 처리 | 이름이 상품명 아래에 남아 있음 |
| 반쯤 탄 가족사진 | model-house node, family window 주변 | photo flash 위험 또는 상담원 패턴 후 | 가족 기억이 광고 이미지로 재생산됨 |
| 이름 없는 영수증 | mailbox, drain pocket, fake route | 작은 몹 trail 또는 drain hazard | 거래는 있는데 사람이 없음 |
| 무음 라디오 | drain silence pocket, 낮은 신호 지점 | slime/suction pocket을 통과 | 광고 말투가 아닌 조작 신호 씨앗 |
| 납 차폐 배터리 | utility line, drain pocket 깊은 곳 | 위험 회수, 낮은 광고 농도 | 침묵권과 역송출 기술의 재료 |
| 녹슨 초인종 | model-house 현관, doorbell projector 근처 | event trigger 후 회수 | 집에 돌아가는 감각의 잔해 |

NPC 흔적의 금지:

- trace를 중앙 보상 아이콘처럼 아무 데나 드롭.
- trace가 단순 재화처럼 보이게 반짝임만 줌.
- 사람이 숨어 사는 정상 마을처럼 NPC를 배치.

## 9. Zone별 배치 논리

### 9.1 침묵 가장자리

| 항목 | 배치 원칙 |
| --- | --- |
| 작은 몹 | 소수 coupon/flyer. source는 먼 flyer pile 또는 edge mailbox |
| 중간 몹 | 첫 방문에는 거의 없음. distant mailbox hint 정도 |
| 큰 몹/엘리트 | 배치 금지 |
| 오브젝트 | low detail floor, sparse paper, weak route decal |
| trace | 이름 없는 영수증 낮은 확률, 보급소 회수선 흔적 |
| 위험 | tutorial 수준. 시작점 근처 hazard 금지 |

플레이어가 추측할 이야기:

```text
아직 캠페인 농도는 낮지만, 광고 물질이 보급소 밖으로 새고 있다.
```

### 9.2 분양 주택 루프

| 항목 | 배치 원칙 |
| --- | --- |
| 작은 몹 | flyer/coupon 주력. house/mailbox 사이에서 발생 |
| 중간 몹 | mailbox, homecare vacuum, sprinkler 계열 |
| 큰 몹 | route sign 또는 speaker unit은 pressure 상승 후 |
| 엘리트 | 송출 기록 진행 후 낮은 빈도 |
| 오브젝트 | repeated house, price/customer tag, queue fence |
| trace | 문패, 영수증, 쿠폰북, 반품 스티커 |
| 위험 | 우편함 탄, slime puddle, route bait |

플레이어가 추측할 이야기:

```text
집들이 비슷한 것은 배경 재사용이 아니라 같은 가족 상품을 계속 찍어내는 법칙이다.
```

### 9.3 모델하우스 결절

| 항목 | 배치 원칙 |
| --- | --- |
| 작은 몹 | 보스 전조 wave 또는 상담 event 주변 |
| 중간 몹 | doorbell projector, mailbox, family-photo source |
| 큰 몹 | warranty/speaker/product compare 계열 가능 |
| 엘리트 | 행복 보증 상담원의 주 배치 지점 |
| 오브젝트 | node facade, kiosk socket, floor-plan line, family window |
| trace | 가족사진, 초인종, 송출 기록, 문패 |
| 위험 | photo flash, appointment marker, 평면도형 제한 |

플레이어가 추측할 이야기:

```text
여기는 보스가 갑자기 등장하는 방이 아니라, R01 가족 상품화 법칙이 모이는 중심이다.
```

### 9.4 배수로 침묵 주머니

| 항목 | 배치 원칙 |
| --- | --- |
| 작은 몹 | 낮은 수의 flyer/coupon. 종이보다 leak와 silence residue 중심 |
| 중간 몹 | drain suction, sprinkler, broken vacuum |
| 큰 몹 | 보통 금지. 좁은 pocket을 불공정하게 막으면 안 됨 |
| 엘리트 | 일반적으로 금지. 특별 변형에서만 story 이유 필요 |
| 오브젝트 | toxic drain, muted floor, radio, lead battery |
| trace | 무음 라디오, 납 차폐 배터리, 이름 없는 영수증 |
| 위험 | passable slime, suction, 좁은 입구 압박 |

플레이어가 추측할 이야기:

```text
광고 시스템 아래에도 신호가 죽는 틈이 있고, 그 틈에는 더 위험하지만 중요한 흔적이 있다.
```

### 9.5 가짜 귀환로

| 항목 | 배치 원칙 |
| --- | --- |
| 작은 몹 | player path를 따라 coupon trail, flyer follow |
| 중간 몹 | mailbox shot, streetlight event, route sign robot |
| 큰 몹 | 안내/방송/route owner 계열 |
| 엘리트 | 반복 실패 또는 보스 후 변형에서 제한적 가능 |
| 오브젝트 | broken fake return sign, weak route decal, streetlight speaker |
| trace | 조작된 구조 신호, 이름 없는 영수증, 송출관 잔향 |
| 위험 | route bait, fake memory/photo flash, 후퇴 압박 |

플레이어가 추측할 이야기:

```text
캠페인은 내가 어디로 돌아가려는지 배웠고, 그 길을 친절하게 흉내 내기 시작했다.
```

## 10. 반복 방문과 배치 변화

| 상태 | 배치 변화 |
| --- | --- |
| 첫 방문 | silence edge와 기본 loop 중심. 광고 prop 낮음 |
| 첫 회수 이후 | flyer pile, price/customer tag, streetlight 방송 증가 |
| 송출 기록 1/3 | fake route 약하게 보임. 같은 집 반복 정렬 |
| 송출 기록 2/3 | family window, kiosk socket, floor-plan line 증가 |
| 송출 기록 3/3 | open-house signs가 같은 방향을 가리킴. 보스 접근 명확 |
| destroy_node | 광고 표면 감소, 조용한 문패/구조 단서 증가 |
| extract_memory | 가족사진/영수증/창문 잔상 증가, fake memory 위험 증가 |
| 반복 실패 | 이전 player path 근처에 coupon trail과 route bait 증가 |

## 11. 귀환/재방문 훅

몹/오브젝트 배치는 귀환 로그와 연결될 수 있어야 한다. 배치가 바뀌었는데 플레이어가 알 수 없으면 세계가 반응한 느낌이 약해진다.

권장 훅:

| 배치 변화 | 귀환/재방문 문구 방향 | 다음 행동 욕구 |
| --- | --- | --- |
| player path 주변 coupon trail 증가 | 이전 회수 동선 근처에 새 전단이 쌓였다는 보고 | 같은 route를 다시 확인하거나 우회 |
| mailbox가 보급소 방향을 향함 | 우편함이 실제 귀환 방향을 학습한 듯 보임 | fake return route 의심 |
| 문패 아래 price tag가 벗겨짐 | 광고 표면 아래 원래 이름 일부가 보임 | 문패 trace 회수 |
| drain pocket의 방송이 끊김 | 광고 말투가 아닌 무음 구간 감지 | 라디오/배터리 회수 |
| family window가 윤서 쪽을 봄 | 캠페인이 윤서를 가족 구성원으로 더 정확히 분류 | 모델하우스 결절 재방문 |
| transmitter residue hint 증가 | 로컬 보스 뒤에 더 큰 신호가 남음 | 송출관 후속 추적 |

좋은 귀환 문구는 반드시 `보상`, `미스터리`, `선택의 흔적` 중 최소 둘을 포함한다.

## 12. 배치 반려 기준

아래 중 하나라도 해당하면 몬스터/오브젝트 배치를 반려한다.

- 적이 source 없이 중앙에서 발생한다.
- 집/우편함/청소기/배수구가 전투와 이야기 중 어느 쪽에도 연결되지 않는다.
- mid-risk prop이 spawn, hazard, event, trace 중 아무 역할도 없다.
- hard blocker가 중앙 전투 공간을 먹어 불공정한 pathing을 만든다.
- fake return route가 실제 회수 UI로 읽힌다.
- 모델하우스 결절이 보스 본체처럼 보인다.
- 송출관 hint가 첫 보스보다 중요하게 보인다.
- trace가 단순 보상 아이콘처럼 놓인다.
- 고밀도에서 prop/decal이 enemy silhouette과 telegraph보다 선명하다.
- 같은 집 반복이 캠페인 법칙이 아니라 타일 재사용으로 보인다.
- 반복 방문 변화가 귀환/재방문 문구와 연결되지 않는다.
- 플레이어 선택의 흔적 없이 랜덤하게만 변한 것처럼 보인다.
