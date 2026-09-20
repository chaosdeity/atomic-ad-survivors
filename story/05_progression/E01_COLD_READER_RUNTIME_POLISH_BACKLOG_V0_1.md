# E01 COLD READER RUNTIME POLISH BACKLOG V0.1

상태: STORY REWRITE CLOSED / RUNTIME POLISH BACKLOG OPEN
원칙: final story를 다시 쓰지 않는다. 남은 Cold Reader 지적을 staging, interaction, combat, acting, information design 문제로 바꾼다.

## 0. 허용 분류

- SCRIPT TRIM
- LEVEL STAGING
- INTERACTION DESIGN
- COMBAT DESIGN
- VO / ACTING
- ANIMATION / BLOCKING
- UI / INFORMATION DESIGN
- OPTIONAL CONTENT PACING

SCRIPT TRIM은 신규 story rewrite가 아니다. 이미 final reader에 있는 의미를 유지한 채 runtime 전달에서 중복 자막/반복 설명을 덜어내는 polish만 뜻한다.

## 1. Mandatory Backlog

| 항목 | 분류 | Runtime 문제로 번역 | Production action | 완료 evidence |
|---|---|---|---|---|
| M01 generic combat | COMBAT DESIGN, LEVEL STAGING, INTERACTION DESIGN | 전투가 어느 이야기에도 붙일 수 있는 일반 교전처럼 보이면 “도움/기록/위협이 한 공간에 있다”는 M01 가치가 약해짐 | existing finite enemy를 investigation rhythm과 분리하지 말고 record/service interaction 전후의 시야·거리·attack window로 묶는다. 새 wave나 새 enemy system은 만들지 않는다 | 정상 플레이 영상에서 player가 record/service를 읽고, 국지 위협을 처리하고, 다시 조사로 돌아오는 흐름이 끊기지 않음 |
| M02 record-comparison pacing | INTERACTION DESIGN, UI / INFORMATION DESIGN, LEVEL STAGING | 세 기록을 한꺼번에 읽는 정보벽이 되거나 같은 행동 세 번으로 느껴질 위험 | record 1 → 이동/상황 변화 → record 2 → optional clue/전투 → record 3 순으로 현재 checkpoint를 단계화. “등록 claim”과 “윤서가 확인한 사실”을 한 화면에 섞지 않음 | 첫 플레이어가 세 record의 차이를 읽고 마지막에 “사람 수는 아직 확정 못 함”을 설명할 수 있음 |
| M08 transaction explanation density | SCRIPT TRIM, INTERACTION DESIGN, UI / INFORMATION DESIGN | 거래 규칙 설명이 사람의 기다림보다 앞서면 다시 제도 해설 장면이 됨 | 숫자/규칙 설명보다 queue delay, 충전 대기, 약 수령 변화가 먼저 보이게 한다. 거래 결과 UI는 원인과 영향만 짧게 노출 | player가 규칙 전문을 읽지 않고도 “내 이득 때문에 누가 늦어졌는지”를 식별 |
| M11 control-recovery repetition | SCRIPT TRIM, INTERACTION DESIGN, UI / INFORMATION DESIGN, OPTIONAL CONTENT PACING | control을 끊고 다시 복구하는 과정이 설명과 반복 interaction으로 길어져 departure 사건을 늦출 위험 | 실패→경고→복구 우선순위→회복을 한 playable recovery loop로 압축. 같은 경고/확인 대사를 여러 번 재생하지 않음 | recovery가 departure보다 기억에 남지 않고, Gaeun departure까지 pacing이 회복됨 |
| M12 simultaneous-discussion staging | LEVEL STAGING, VO / ACTING, ANIMATION / BLOCKING, UI / INFORMATION DESIGN | 여러 요청이 동시에 나오는 의도는 좋지만 실제 runtime에서는 누가 말하는지 잃기 쉬움 | Mina/Doyun/Seven/door visitor 호출을 위치·시선·audio priority로 분리. overlapping VO는 의도한 1~2회만. 현재 active request와 위임 상태를 UI로 최소 표시 | player가 과부하를 느끼면서도 각 요청의 주체와 “하나를 내려놓은 뒤 누가 맡았는지”를 추적 |
| Seven functional-character risk | SCRIPT TRIM, VO / ACTING, ANIMATION / BLOCKING | Seven이 시스템 설명기처럼만 보이면 캐릭터 관계가 사라짐 | source/copy/provenance/verification 어휘는 유지하되 모든 문장을 정의문으로 만들지 않는다. 망설임, 잘못 추정했다가 고치는 순간, 타인이 “그만” 했을 때 멈추는 timing을 연기로 살림 | Seven 대사를 이름표 없이 들어도 procedural voice가 식별되고, exposition machine만으로 느껴지지 않음 |
| Mina / Bokhee dialogue-rhythm overlap | SCRIPT TRIM, VO / ACTING | 둘 다 짧고 현실적인 정리 역할을 하면 리듬이 겹침 | Mina는 현재 자원/교대/몸 상태/지금 가능한 일에 반응. Bokhee는 맡겨진 것, 기록/이름, 개인적 경험과 provenance에 반응. 같은 길이의 “응/그래” 연속을 performance에서 다르게 처리 | blind VO review에서 두 인물의 function과 cadence가 구분됨 |
| Yunseo / Doyun short-response overlap | SCRIPT TRIM, VO / ACTING, ANIMATION / BLOCKING | 둘 다 짧은 반문과 농담을 쓰면 교환이 같은 목소리처럼 들릴 수 있음 | Doyun은 기술적 qualifier와 확인 질문을 한 박자 더 둔다. Yunseo는 먼저 관찰/거절하고 뒤늦게 인정하는 rhythm을 유지. 장비를 만질지 말지 손동작으로 대사의 기능을 나눔 | 음성만 듣거나 짧은 자막만 봐도 speaker confusion이 줄어듦 |

## 2. Unit별 추가 Runtime Polish

### M01

- 자동 도움 UI는 친절하게 보이되 “실제 사람 확인”과 동일한 색/완료 표현을 쓰지 않는다.
- record를 읽는 동안 combat HUD가 핵심 문장을 덮지 않게 한다.
- Mina report는 긴 recap가 아니라 “등록 claim / 현장 관찰 / 미확인” 세 의미를 짧게 분리한다.

### M02

- 세 record의 문구 차이는 typography만으로 해결하지 않는다. player 이동과 source 위치 차이도 사용한다.
- optional cleaning clue는 core proof가 아니다. 놓쳐도 main comparison이 성립해야 한다.
- VAC-0 actor가 실제로 없으면 final story를 핑계로 신규 actor를 이번 alignment에 끼워 넣지 않는다.

### M03

- prototype 승인 시 가장 먼저 검증할 것은 chair/meal/role prompt 세 요소가 한눈에 읽히는지다.
- dialogue보다 “윤서가 앉으려다 멈추는 거리”가 먼저 전달되어야 한다.
- full combat를 만들기 전 role-replacement read가 되는지 gray-box interaction으로 검증 가능하다. 단 map/asset 변경은 별도 승인.

### M04~M07

- 각 Campaign runtime authority가 생기기 전에는 VO나 cutscene만 먼저 제작하지 않는다.
- agency scene은 mechanic 없는 cinematic으로 대체하지 않는다.

### M09

- admission conflict는 수치표 UI가 주인공이 되지 않게 한다.
- capacity는 decision constraint이지 moral score가 아니다.

### M10

- “좋은 윤서” audio/editing은 실제 이전 행동과 연결되어야 한다.
- source/copy UI가 실제 이전 플레이를 참조하지 못하는 상태라면 구현을 시작하지 않는다.

### HRI07

- 해결 회의가 아니라 저녁이라는 공간 리듬을 우선한다.
- 모든 캐릭터가 같은 카메라/같은 자세/같은 간격으로 말하는 dialogue carousel 금지.

### M11

- departure는 loading screen 문구만으로 처리하지 않는다.
- player가 Gaeun이 같은 공간에서 떠나는 순간과 return 후 빈 bed를 서로 다른 장면으로 체감해야 한다.

### M12

- “동시 요청”은 불친절한 UI가 아니라 윤서의 과부하를 체감시키는 staging이어야 한다.
- 위임 후 NPC가 다시 윤서에게 매 step 승인받으러 오면 story payoff 실패다.
- stamp ending은 선행 state가 실제로 쌓인 뒤 구현한다.

## 3. 현재 Slice에서 바로 볼 Backlog

Slice 1 M01에서 실제로 검증 가능한 것은 다음뿐이다.

- M01 generic combat.
- registered claim vs verified observation UI.
- investigation 중 HUD 가독성.
- Mina report pacing.

M02 pacing은 Slice 2에서 본다.

나머지는 해당 Campaign/runtime authority가 생긴 뒤에 연다.

최종 상태: COLD READER NOTES CONVERTED TO RUNTIME POLISH / STORY REWRITE NOT REQUIRED.
