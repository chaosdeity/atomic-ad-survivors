# World Story Diagrams

이 문서는 `Atomic Ad Survivors 0.2`의 세계, 스토리, R01 지역, 보급소, 카드, 정산, 에셋 제작 방향을 같은 그림으로 맞추기 위한 공유 다이어그램 문서다.

현재 기준:

> Atomic Ad Survivors는 광고가 생존권을 쥔 세계에서, 윤서와 여러 캐릭터가 출격해 광고 약관과 정산 규칙을 비틀고, 밥표/전원표/신호표를 확보하며, 그 결과가 보급소와 지역 상태를 바꾸는 모바일 액션 RPG다.

주의:

- 이 게임은 단순 로그라이크, 단순 로그라이트, 단순 뱀서류가 아니다.
- 광고는 적이 아니라 환경이다.
- 실패는 죽음이 아니라 인양, 정산 실패, 후보 보류, 지역 결과로 남는다.
- R01은 작은 아레나가 아니라 반복 출격과 정산 결과를 기억하는 RPG 지역이다.
- 에셋 제작은 스토리 기능과 지역 역할이 확정된 뒤에 한다.

## 1. Core World Relationship

```mermaid
flowchart TD
    Campaign["캠페인 광고 환경\n위성망, 배급망, 검문, 약관, 자동화 심사"]
    R01["R01 외곽 주택가\n가족/주택/오픈하우스 광고 생태계"]
    Outpost["침묵 보급소\n정산, 배분, 이름 보관, 재출격"]
    Yunseo["윤서\n기본 지급 주인공\n반품 도장과 차징"]
    Characters["추가 캐릭터\n다른 차징 무기, 정산 루트, 지역 관점"]
    Humans["인간 생존자\n밥표가 필요한 사람들"]
    Robots["해방 로봇\n전원표가 필요한 존재들"]
    Signal["신호 해석\n신호표, 결절 분석, 다음 목표"]
    Cards["카드와 약관\n도구, 밥벌이, 약관, 룰 변경"]
    Gear["장비와 세트\n기업/광고 환경 기반 빌드 폭"]

    Campaign -->|"생존 규칙을 광고로 덮음"| R01
    Campaign -->|"정상 고객/불량 재고로 판정"| Yunseo
    R01 -->|"출격 지역"| Yunseo
    R01 -->|"지역별 정산 후보"| Cards
    Yunseo -->|"귀환/인양"| Outpost
    Characters -->|"다른 방식의 출격"| R01
    Outpost -->|"재정비 후 재출격"| R01
    Outpost -->|"밥표 배분"| Humans
    Outpost -->|"전원표 배분"| Robots
    Outpost -->|"신호표 고정"| Signal
    Signal -->|"모델하우스 결절 접근"| R01
    Cards -->|"광고 정산 규칙을 비틂"| Campaign
    Gear -->|"캐릭터와 카드 빌드를 보조"| Cards
```

## 2. 0.2 Sortie RPG Loop

```mermaid
flowchart TD
    Board["보급소 출격 게시판\n오늘 필요한 밥표/전원표/신호표"]
    Sortie["R01 출격"]
    Region["R01RegionGraph\n어느 길로 들어갈지 선택"]
    Combat["전투\n자동공격 + 반품 도장 차징"]
    Cards["카드 선택\n도구/밥벌이/약관"]
    Risk["위험 구역 욕심\n오픈하우스 거리, 가짜 귀환로, 배수로"]
    Candidates["배급권 후보 생성\n밥표/전원표/신호표"]
    Audit["광고 감사 문턱\n캠페인 압력, 검문, 약관 대가"]
    End["귀환/긴급 인양/일부 인양/정산 실패"]
    Settlement["정산\n승인, 보류, 오염, 후보화"]
    Allocation["보급소 배분\n인간/로봇/신호/시설"]
    Change["다음 출격 변화\n지역 상태, NPC 반응, 목표 변화"]

    Board --> Sortie --> Region --> Combat --> Cards --> Risk
    Risk --> Candidates --> Audit --> End --> Settlement --> Allocation --> Change --> Board
```

## 3. R01 Region Graph

R01은 `2 + 3 + 보조 1` 구조로 간다. 구역 이름은 배경 이름이 아니라 정산과 위험 규칙을 가진 노드다.

```mermaid
flowchart LR
    Outer["outer_residential_edge\n외곽 주택가\n안전한 진입, 조작 안정"]
    Loop["subdivision_loop\n반복 주택가\n반복 문패, 우편함, 기본 전투"]
    OpenHouse["open_house_street\n오픈하우스 거리\n신호표/밥표 욕심, 압력 상승"]
    Model["model_house_approach\n모델하우스 접근로\n보스/결절 해석"]
    Drain["drain_silence_pocket\n배수로 침묵 주머니\n위험 완충, 전원표/우회"]
    Fake["fake_return_route\n가짜 귀환로\n광고가 흉내 내는 안전"]

    Outer --> Loop
    Loop --> OpenHouse
    OpenHouse --> Model
    Loop --> Drain
    Drain --> OpenHouse
    Loop --> Fake
    Fake --> Loop
    Fake -. "혼동/감사 위험" .-> OpenHouse
```

각 노드는 최소한 다음 값을 가져야 한다.

```mermaid
flowchart TD
    Node["R01 region node"]
    Entry["entry_reason\n왜 들어가는가"]
    Risk["risk_profile\n무엇이 위험한가"]
    Settlement["settlement_effect\n어떤 후보/정산을 만든가"]
    Variants["state_variants\n재방문 때 무엇이 바뀌는가"]
    Assets["visual_asset_keys\n어떤 에셋이 필요한가"]
    Confusion["return_confusion_risk\n가짜 귀환/검문 혼동 위험"]

    Node --> Entry
    Node --> Risk
    Node --> Settlement
    Node --> Variants
    Node --> Assets
    Node --> Confusion
```

## 4. Ration Ticket And Settlement Meaning

```mermaid
flowchart TD
    RunAction["런 중 행동"]
    FoodCandidate["밥표 후보\n인간 생존"]
    PowerCandidate["전원표 후보\n해방 로봇 작동"]
    SignalCandidate["신호표 후보\n결절 해석"]
    Settlement["정산 카운터"]
    Approved["승인"]
    Held["보류"]
    Contaminated["오염"]
    Downgraded["확정분 후보화"]
    FoodUse["인간 구역 안정"]
    PowerUse["정비대/로봇 안정"]
    SignalUse["출격 게시판/모델하우스 노출"]
    RegionChange["R01 상태 변화"]

    RunAction --> FoodCandidate
    RunAction --> PowerCandidate
    RunAction --> SignalCandidate
    FoodCandidate --> Settlement
    PowerCandidate --> Settlement
    SignalCandidate --> Settlement
    Settlement --> Approved
    Settlement --> Held
    Settlement --> Contaminated
    Settlement --> Downgraded
    Approved --> FoodUse
    Approved --> PowerUse
    Approved --> SignalUse
    Held --> RegionChange
    Contaminated --> RegionChange
    Downgraded --> RegionChange
```

## 5. Card And Rule-Bending Flow

카드는 단순 공격력 상승이 아니라 이번 판의 규칙과 정산 방향을 바꾸는 장치다.

```mermaid
flowchart TD
    Context["런 컨텍스트\n구역, 압력, 부족 자원, 장비, 캐릭터"]
    Tool["도구 카드\n싸움과 차징 손맛 변경"]
    Earn["밥벌이 카드\n배급권 후보/정산 변경"]
    Terms["약관 카드\n강한 효과와 대가"]
    RuleCards["룰 변경 카드\n적 행동, 감사 기준, 후보 판정 변형"]
    Synergy["누적 시너지\n2장, 3장, 4장 조합"]
    AuditLine["광고 감사 문턱\n다음 카드 전까지 넘겨야 할 압박"]
    Result["이번 판 빌드 정체성"]

    Context --> Tool
    Context --> Earn
    Context --> Terms
    Tool --> Synergy
    Earn --> Synergy
    Terms --> Synergy
    RuleCards --> Synergy
    Synergy --> AuditLine
    AuditLine --> Result
```

## 6. Boss Is A Regional Clause Face

보스는 죽이는 적이 아니라 지역 광고 약관의 얼굴이다.
캠페인 송출관은 스마일 홈 시어머니보다 높은 상위 결절이며, 0.2에서는 직접 보스가 아니라 후속 목표로 남긴다.

```mermaid
flowchart TD
    R01Law["R01 가족/주택/오픈하우스 약관"]
    Boss["스마일 홈 시어머니\n신규 비주얼 필요\n가족 적합성 심사 결절"]
    RunHistory["런 중 행동\n카드, 구역, 차징, 배급권, 안정도"]
    Probability["결과 확률표"]
    Rupture["결절 파열"]
    Bypass["배급 우회"]
    Memory["기억 추출"]
    Authority["권한 박탈"]
    Incomplete["미완 귀환"]
    RegionState["R01 상태 변화"]
    OutpostState["보급소 반응"]

    R01Law --> Boss
    RunHistory --> Probability
    Boss --> Probability
    Probability --> Rupture
    Probability --> Bypass
    Probability --> Memory
    Probability --> Authority
    Probability --> Incomplete
    Rupture --> RegionState
    Bypass --> RegionState
    Memory --> RegionState
    Authority --> RegionState
    Incomplete --> OutpostState
    RegionState --> OutpostState
```

## 7. Story To Asset Gate

에셋은 먼저 만들고 끼우는 것이 아니라, 스토리 기능과 지역 역할이 확정된 뒤 제작한다.

```mermaid
flowchart TD
    StoryRole["스토리 역할\n왜 존재하는가"]
    GameplayRole["게임 역할\n무슨 판단을 만들 것인가"]
    RegionNode["지역 노드\n어느 위치/상태에 붙는가"]
    AssetKey["visual_asset_key\n필요 에셋 명세"]
    ArtGate["아트 게이트\n톤, 가독성, 모바일 크기, 금지 목록"]
    RuntimeGate["런타임 게이트\n충돌, 전조, UI, 성능"]
    QAScreen["480x270 QA 화면"]
    Import["정식 적용"]

    StoryRole --> GameplayRole --> RegionNode --> AssetKey --> ArtGate --> RuntimeGate --> QAScreen --> Import
```

금지:

- 윤서 v05를 최종 주인공으로 사용하지 않는다.
- 스마일 홈 시어머니 v04를 최종 보스로 사용하지 않는다.
- 기존 pixel player/enemy 임시본을 최종 에셋으로 취급하지 않는다.
- `generated_assets/01_atomic_steampunk`, `generated_assets/03_cute_dystopian_atomic`, `assets/art_inbox/rejected`는 사용하지 않는다.
- `assets/art_inbox`와 `assets/style_samples/p0_direction`은 후보/참고이지 bulk import 대상이 아니다.

## 8. Monetization Boundary

0.2에는 실제 과금이 없다. 그러나 장기 구조는 처음부터 세계관과 충돌하지 않게 설계한다.

```mermaid
flowchart TD
    Core["무료 핵심 경험\n윤서, R01, 보급소, 첫 재미 루프"]
    NoSale["생존권 직접 판매 금지\n밥표/전원표/신호표"]
    Character["캐릭터/조각\n완제 드롭, 조각 성장, 천장, 복각"]
    Gear["장비/세트\n기업/광고 환경 기반 빌드 폭"]
    Catalog["캠페인 카탈로그\n시즌/복각/후발 접근"]
    Cosmetic["스킨 세트\n외형, 대사, 이펙트"]
    Ads["선택형 보상 광고\n메타 보상만"]

    Core --> NoSale
    Core --> Character
    Core --> Gear
    Core --> Catalog
    Character --> Cosmetic
    Catalog --> Cosmetic
    Ads --> Catalog
    Ads -. "생존권 지급 금지" .-> NoSale
```

## 9. What Must Be Deepened Before Final Assets

```mermaid
flowchart TD
    StoryDeepening["스토리 심화"]
    R01Ecology["R01 광고 생태계\n집, 가족, 검문, 배급, 오픈하우스"]
    YunseoIdentity["윤서 정체성\n성인 실무자, 반품 담당자, 생존 감정"]
    BossIdentity["R01 보스 정체성\n모델하우스 심사 장치, 가족 적합성 법"]
    OutpostPeople["보급소 사람/로봇\n배급권 배분의 감정 대상"]
    AssetSpec["에셋 명세 선명화"]

    StoryDeepening --> R01Ecology
    StoryDeepening --> YunseoIdentity
    StoryDeepening --> BossIdentity
    StoryDeepening --> OutpostPeople
    R01Ecology --> AssetSpec
    YunseoIdentity --> AssetSpec
    BossIdentity --> AssetSpec
    OutpostPeople --> AssetSpec
```

결론:

> 스토리가 깊어져야 에셋이 명확해진다.
> R01 지역 구조가 먼저고, 그 다음이 에셋이다.
> 윤서와 R01 보스는 신규 제작 대상이다.
