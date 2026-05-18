# World Story Diagrams

This document is the shared diagram layer for story, PMO, art, and implementation. It should prevent the team from mixing up the 0.2 scope, the first boss identity, and the long-term campaign structure.

## 1. Core World Relationship

```mermaid
flowchart TD
    Campaign["캠페인\n광고 위성망 + 자동화 인프라 + 소비자 예측 모델"]
    R01["R01 외곽 주택가\n가족/주택/오픈하우스 광고 생태계"]
    Outpost["침묵 보급소\n회수, 정산, 기억 보관, 재출격"]
    Yunseo["윤서\n반품/물류/정비 실무자\n침묵 핵 보유"]
    Humans["인간 생존자\n몸, 기억, 거처 보존"]
    Robots["해방 로봇\n상품 명령에서 벗어나 이름 획득"]
    Traces["흔적\n문패, 가족사진, 영수증, 코어 파편"]

    Campaign -->|"지역 법칙을 광고로 덮음"| R01
    Campaign -->|"윤서를 고객/모델로 읽으려 함"| Yunseo
    R01 -->|"출격/회수 대상"| Yunseo
    Yunseo -->|"회수선으로 귀환"| Outpost
    Outpost -->|"재정비 후 재출격"| R01
    R01 -->|"흔적 생성"| Traces
    Traces -->|"정산/보관/개조"| Outpost
    Humans -->|"보호와 기억 요구"| Outpost
    Robots -->|"이름과 자율성 요구"| Outpost
    Outpost -->|"불편한 공존 장소"| Humans
    Outpost -->|"불편한 공존 장소"| Robots
```

## 2. 0.2 Vertical Slice Story Loop

```mermaid
flowchart TD
    Start["게임 시작\n윤서"]
    FirstRun["첫 출격\nR01 외곽 주택가"]
    ForcedRecall["첫 강제 회수\n신호 과부하"]
    Supply["침묵 보급소\n정산/개조/다음 목표"]
    Sortie2["재출격\n송출 기록 1/3"]
    Sortie3["재출격\n송출 기록 2/3"]
    Sortie4["재출격\n송출 기록 3/3"]
    BossAccess["모델하우스 결절 접근"]
    Boss["스마일 홈 시어머니\n0.2 첫 보스"]
    Outcome["결절 처리 선택\n결절 파괴 / 기억 추출"]
    Followup["후속 목표\n캠페인 송출관 잔향 추적"]

    Start --> FirstRun --> ForcedRecall --> Supply
    Supply --> Sortie2 --> Supply
    Supply --> Sortie3 --> Supply
    Supply --> Sortie4 --> Supply
    Supply --> BossAccess --> Boss --> Outcome --> Supply --> Followup
```

## 3. Boss Identity Boundary

```mermaid
flowchart LR
    SmileHome["스마일 홈 시어머니\n0.2 첫 보스\n가족 상품화 법칙의 얼굴"]
    Broadcaster["캠페인 송출관\n상위 결절/후속 목표\n0.2 직접 보스 아님"]
    Consultant["행복 보증 상담원\nElite\n보스의 대형판 아님"]
    R01Node["모델하우스 결절\nR01 중심 신호"]

    Consultant -->|"지역 elite 계층"| R01Node
    R01Node -->|"첫 보스 형태"| SmileHome
    SmileHome -->|"처리 후 잔향/상위 단서"| Broadcaster
```

Rules:

- The first visible boss is `스마일 홈 시어머니`.
- `캠페인 송출관` remains a higher signal and follow-up objective in 0.2.
- `행복 보증 상담원` is an elite enemy direction, not the boss base.

## 4. Run Result Routing

```mermaid
flowchart TD
    Playing["playing"]
    FirstRecall["recalled\n첫 강제 회수"]
    GameOver["game_over\n첫 회수 이후 실패"]
    Victory["victory\n300초 정상 회수"]
    BossRecall["recalled\n보스 회수"]
    BossVictory["boss_victory\n스마일 홈 결절 침묵"]
    Result["결과 화면"]
    Supply["supply\n침묵 보급소"]
    Restart["새 출격"]

    Playing --> FirstRecall --> Result --> Supply --> Restart --> Playing
    Playing --> GameOver --> Result --> Supply
    Playing --> Victory --> Result --> Supply
    Playing --> BossRecall --> Result --> Supply
    Playing --> BossVictory --> Result --> Supply
```

Rule: after the outpost has been introduced, a run ending should return to the outpost instead of jumping straight into a new run.

## 5. Trace And Choice Flow

```mermaid
flowchart TD
    Run["R01 런"]
    Trace["흔적 회수\n전단, 문패, 가족사진, 영수증, 코어 파편"]
    Settlement["정산 카운터"]
    Archive["이름 보관함"]
    Bench["정비대/차징 조율대"]
    Board["출격 게시판"]
    RegionState["R01 지역 반응"]
    Outcome["보스 처리\n결절 파괴 / 기억 추출"]

    Run --> Trace --> Settlement
    Settlement -->|"일반 성장 재화"| Bench
    Settlement -->|"기억/이름/분석"| Archive
    Archive -->|"문구와 상태 변화"| Board
    Outcome --> RegionState
    Outcome --> Archive
    RegionState -->|"다음 출격의 환경/문구 변화"| Run
```

## 6. Faction Pressure

```mermaid
flowchart TD
    PlayerChoice["플레이어 선택"]
    HumanStability["인간 안정도\n몸/기억/거처 보존"]
    RobotAutonomy["로봇 자율성\n상품 명령에서 벗어남"]
    CampaignPressure["캠페인 농도\n위험과 보상 압력"]
    OutpostMood["보급소 분위기/시설 반응"]
    RegionMood["지역 재방문 반응"]

    PlayerChoice --> HumanStability
    PlayerChoice --> RobotAutonomy
    PlayerChoice --> CampaignPressure
    HumanStability --> OutpostMood
    RobotAutonomy --> OutpostMood
    CampaignPressure --> RegionMood
    CampaignPressure --> OutpostMood
```

0.2 does not need the full faction system implemented. It only needs visible seeds:

- outpost text changes,
- R01 route phrase changes,
- trace preservation/usage implications,
- boss outcome differences.

## 7. Art/Implementation Guardrails

```mermaid
flowchart LR
    Story["Story Docs"]
    PMO["PMO Priority"]
    Art["Art Direction"]
    Code["Godot Implementation"]
    QA["Play/Screen QA"]

    Story --> PMO --> Art --> Code --> QA
    QA --> PMO
    PMO --> Story
```

Guardrails:

- Art must read the R01/suburb/outpost story before making production candidates.
- Code must preserve the run-state contract before adding new systems.
- PMO should decide scope before asset replacement or major UI changes.
- QA should check whether story intent is visible on screen, not only whether code runs.
