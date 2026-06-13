# Atomic Ad Survivors 세계지도 남은 작업 목록 v0.1

상태: v0.3 기반 잠금 반영 / v0.1 작업 정리
목적: 지금까지 완료한 세계지도/캠페인 작업과 아직 하지 않은 작업을 분리한다.
기준 문서: `docs/world/WORLD_FOUNDATION_LOCK_V0_3.md`, `docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md`, `docs/world/LEGACY_TERM_MIGRATION_V0_1.md`, `docs/world/WORLD_FOUNDATION_LOCK_V0_2.md`, `docs/world/WORLD_CAUSE_REVIEW_PROMPT_V0_1.md`, `docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md`, `docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md`, `docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md`, `docs/world/GLOBAL_CAMPAIGN_MAP_PLACEMENT_V0_1.md`, `docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md`, `docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md`, `docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md`, `docs/world/E01_WORLD_MAP_BLOCKOUT_V0_1.md`, `docs/world/E01_WORLD_MAP_PRODUCTION_TABLE_V0_1.md`, `docs/world/E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md`, `docs/world/E01_P0_WORLD_MAP_UI_WIREFRAME_V0_1.md`, `docs/world/E01_WORLD_MAP_ART_COLOR_DIRECTION_V0_1.md`, `docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md`, `docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md`, `docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md`, `docs/world/R01_FIRST_SORTIE_LEVEL_CONNECTION_V0_1.md`, `docs/world/R01_L03_FIRST_BOSS_DETAIL_V0_1.md`, `docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md`, `docs/world/WORLD_LORE_LOCK_V0_1.md`

## 0. 결론

세계지도 설계의 뼈대와 세계관 1차 잠금은 완료됐다. 단, 세계 기반의 상위 기준은 `WORLD_FOUNDATION_LOCK_V0_3.md`로 승격한다.

완료된 것:

- 세계 원인 5단계와 지역 설계용 3층 구조.
- 후인류 시대 + 캠페인 형성 원인 기준.
- 캠페인 정의.
- 전 지구 96개 정식 캠페인 목록.
- 전 지구 96개 정식 캠페인의 관리자용 현실 위치/도시권/인프라 앵커.
- E01 첫 시즌 40개 로컬 노드.
- E01 관리자용 현실 위치/도시권/인프라 축 매트릭스.
- E01 노드 좌표 블록아웃.
- E01 JSON 데이터.
- E01 제작자용 위치/특징표.
- E01 러프 SVG 시각화.
- E01 P0 월드맵 첫 화면 흐름.
- 긴급 인양 규칙/문구.
- R01 첫 출격 레벨과 월드맵 노드 연결.
- R01-L03 첫 보스 이름/역할/패턴/보상/후속 선택.
- E01 P0 월드맵 UI 와이어프레임.
- E01 월드맵 아트/색채 방향.
- E01 P1 확장 해금 구조.
- 캐릭터 해금 구조.
- E02 이후 광역권 확장 원칙.
- 용어 최종 확정.
- 세계관 1차 잠금 목록.
- 세계 기반 잠금 v0.2.
- 세계 원인 재검토 프롬프트.
- 세계 원인 재검토 실행 결과.
- 세계 기반 잠금 v0.3.
- 구용어 마이그레이션 1차 적용.

아직 완료되지 않은 것:

- 실제 인게임 월드맵 UI 구현.
- E02 이후 광역권의 실제 노드/좌표.
- 서사 원고 전반의 NPC 속어/태그 용어 세부 검수.

판정:

```text
설정 기준 문서의 핵심 뼈대는 완료.
세계관 1~4 정리는 P1 확장, 캐릭터 해금, E02 이후 확장 원칙, 용어 최종 확정, 세계관 1차 잠금 목록, 세계 기반 v0.3, 구용어 마이그레이션 1차까지 완료.
실제 인게임 구현은 아직 시작 전.
```

## 1. 완료 목록

| 구분 | 완료 내용 | 산출물 |
|---|---|---|
| 세계 원인 | 단일 대사고가 아니라 5단계 세계 원인과 지역 설계용 3층 붕괴 구조로 재설계 | `WORLD_FOUNDATION_LOCK_V0_3.md`, `WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md` |
| 세계 기반 | 세계 원인 5단계, 첫 30분 이해 순서, 윤서 제약, 회색 오염/인양 물리성 보강 | `WORLD_FOUNDATION_LOCK_V0_3.md` |
| 재검토 프롬프트 | 윤서 작업 전 세계 원인을 다시 평가하는 질문 세트 | `WORLD_CAUSE_REVIEW_PROMPT_V0_1.md` |
| 재검토 결과 | 대동기화 사고 한 줄, 첫 30분 장면 3개 이상, 구용어 원칙을 실제로 평가 | `WORLD_CAUSE_REVIEW_RESULT_V0_1.md` |
| 세계 기반 v0.3 | 대동기화 사고 사건상, 인구/보급소 규모, 첫 30분 장면, 구용어 마이그레이션 원칙을 상위 기준으로 통합 | `WORLD_FOUNDATION_LOCK_V0_3.md` |
| 구용어 1차 마이그레이션 | 스크립트 유저 노출 문자열과 구현 문서의 배급권/사망 보상/HP 0 사망 계열을 태그/인양 기준으로 정리 | `LEGACY_TERM_MIGRATION_V0_1.md` |
| 캠페인 정의 | 학살 AI가 아니라 잘못된 보존/등록 생태계로 정의 | `WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md` |
| 시간축/원인 | 현재 시점은 대동기화 사고 후 10세대 이상 지난 후인류 시대이며, 300년은 단일 절대값으로 고정하지 않고 300~330년 후보로 재검산한다. 캠페인 현재 상태는 특정 최근 연수가 아니라 사고 전 서비스 목적과 사고 후 지역 승인 캐시의 장기 누적으로 고정 | `WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md` |
| 자원명 | 보급태그/식량태그/충전태그 등 태그 계열 UI 명칭 잠금 | `WORLD_TERMINOLOGY_LOCK_V0_1.md` |
| 전 지구 구조 | 12개 광역권 x 8개 계열 = 96개 정식 캠페인 | `GLOBAL_CAMPAIGN_CATALOG_V0_1.md` |
| 전 지구 관리자 위치 | 12개 광역권과 96개 정식 캠페인의 현실 도시권/인프라 앵커, 소형 로컬 노드 위치 지정 규칙 | `GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md` |
| 실제 지구 기반 | 실루엣+가명, 10% 인식 밀도 기준 정리 | `GLOBAL_CAMPAIGN_MAP_PLACEMENT_V0_1.md` |
| E01 로컬 | 첫 시즌 40개 로컬 노드 지정 | `E01_FIRST_SEASON_LOCAL_NODES_V0_1.md` |
| E01 관리자 위치 | 유저에게 숨길 현실 도시권/인프라 축과 로컬 노드별 관리자 위치 명시 | `E01_ADMIN_REAL_LOCATION_MAP_V0_1.md` |
| E01 좌표 | 0~100 정규화 좌표와 인양 등급 지정 | `E01_WORLD_MAP_BLOCKOUT_V0_1.md` |
| E01 데이터 | 40개 노드/37개 연결선 JSON 생성 | `data/world/e01_world_map_nodes_v0_1.json` |
| E01 시각화 | 제작용 SVG 러프 생성 | `assets/world/e01_world_map_blockout_v0_1.svg` |
| 제작표 | 40개 노드 위치감/시각 특징/제작 메모 정리 | `E01_WORLD_MAP_PRODUCTION_TABLE_V0_1.md` |
| P0 첫 화면 | 첫 화면 노드 5개, 클릭 흐름, 패널, 잠금/해금 기준 정리 | `E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md` |
| 인양 규칙 | HP 0, A0~A4 인양 문구, 손실, 실패 조건 정리 | `EMERGENCY_EXTRACTION_RULES_V0_1.md` |
| R01 연결 | R01-L01~L03을 실제 Godot 앵커/웨이브/인양 구조와 연결 | `R01_FIRST_SORTIE_LEVEL_CONNECTION_V0_1.md` |
| 첫 보스 | R01-L03 보스의 정식 역할명, 전투 별칭, 패턴 의미, 실패/성공 정산, P1 해금 정리 | `R01_L03_FIRST_BOSS_DETAIL_V0_1.md` |
| UI 와이어프레임 | 모바일/데스크톱 P0 월드맵 배치, 노드 패널, 보스 신호, P1 프리뷰 정리 | `E01_P0_WORLD_MAP_UI_WIREFRAME_V0_1.md`, `assets/world/e01_p0_world_map_ui_wireframe_v0_1.svg` |
| 아트/색채 | 청흑 수신 지도 팔레트, 청록 인양선, 코랄 광고 압력, 노랑 제한 규칙 정리 | `E01_WORLD_MAP_ART_COLOR_DIRECTION_V0_1.md`, `assets/world/e01_world_map_art_color_direction_v0_1.svg` |
| P1 확장 | 첫 보스 후 신호 감지/해석/출격 가능 상태, R01/R08/R03/R02/R04/R06 해금 순서 정리 | `E01_P1_EXPANSION_DESIGN_V0_1.md` |
| 캐릭터 해금 | U0~U5 해금 단계, 윤서/R03 심화, 해방 로봇/의료/브로커/방송 캐릭터 해금 기준 정리 | `CHARACTER_UNLOCK_STRUCTURE_V0_1.md` |
| E02 이후 확장 | E02~E12 광역권을 시즌 슬라이스로 여는 원칙, 추천 해금 순서, E02 첫 외부 확장 기준 정리 | `E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md` |
| 세계관 잠금 | v0.3 기반을 상위 기준으로 둔 L0~L3 잠금 등급, 금지 설정, 열린 항목, 다음 제작 단계 정리 | `WORLD_LORE_LOCK_V0_1.md` |

## 2. 아직 안 한 작업

### 2.1 R01 첫 출격 레벨 연결

상태:

- 완료. `docs/world/R01_FIRST_SORTIE_LEVEL_CONNECTION_V0_1.md`를 기준으로 한다.

잠금:

```text
R01-L01 = 첫 출격/첫 인양.
R01-L02 = 기본 반복 런.
R01-L03 = 첫 보스 결절.
외곽 회수 차선과 오픈하우스 거리는 별도 월드맵 노드가 아니라 내부 구간.
```

### 2.2 첫 보스 세부화

상태:

- 완료. `docs/world/R01_L03_FIRST_BOSS_DETAIL_V0_1.md`를 기준으로 한다.

잠금:

```text
정식 역할명 = 스마일 홈 가족심사 관리자.
전투 별칭 = 스마일 홈 시어머니.
승리 = 결절 침묵과 심사 우회.
후속 선택 = 결절 파괴 / 기억 추출.
```

### 2.3 P0 월드맵 UI 와이어프레임

상태:

- 완료. `docs/world/E01_P0_WORLD_MAP_UI_WIREFRAME_V0_1.md`와 `assets/world/e01_p0_world_map_ui_wireframe_v0_1.svg`를 기준으로 한다.

잠금:

```text
모바일 세로 화면 우선.
첫 화면 선명 노드는 R08/R01의 5개.
상단 상태줄 + 중앙 지도 + 하단 노드 패널.
데스크톱은 좌측 지도 + 우측 단일 정보 패널.
```

### 2.4 최종 월드맵 아트 방향

상태:

- 완료. `docs/world/E01_WORLD_MAP_ART_COLOR_DIRECTION_V0_1.md`와 `assets/world/e01_world_map_art_color_direction_v0_1.svg`를 기준으로 한다.

잠금:

```text
월드맵 기본은 청흑 수신 지도.
인양/침묵권은 청록.
광고 압력은 코랄/적색.
노랑은 작은 주의 점멸만 허용.
```

### 2.5 P1 확장 설계

상태:

- 완료. `docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md`를 기준으로 한다.

잠금:

```text
P1은 첫 보스 직후 16개 노드가 모두 열리는 구조가 아니다.
R01/R08 재정렬을 먼저 열고, R03 또는 R02를 첫 외부 권역으로 선택하게 한다.
R04는 R03/R02 단서 뒤에 열며, R06은 브로커/가짜 태그 단서 뒤에 늦게 연다.
R05/R07은 P1에서 원격 신호만 허용한다.
```

### 2.6 E02 이후 광역권 확장

상태:

- 원칙 완료. `docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md`를 기준으로 한다.

잠금:

```text
E## 코드는 출시 순서가 아니라 지구 광역권 카탈로그 코드다.
첫 외부 광역권 후보는 E02 일본 태평양 메갈로폴리스가 가장 안전하다.
E02 이후 기본 확장 단위는 40개 풀 광역권이 아니라 12~18개 로컬 시즌 슬라이스다.
새 광역권은 캐릭터 심화, 캠페인 변형, 인양 중계 근거가 있을 때 연다.
```

### 2.7 캐릭터 해금 구조

상태:

- 완료. `docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md`를 기준으로 한다.

잠금:

```text
캐릭터 해금은 플레이어블 지급만이 아니라 캠페인을 읽는 관점의 확장이다.
P1에서 정식 신규 플레이어블 U5는 만들지 않는 편이 안전하다.
해방 로봇은 R04-L03 이후 게스트/협력 후보, 정식 U5는 R04-L05 이후 검토한다.
의료계/브로커/방송/검역 캐릭터는 P1에서 신호 또는 조우까지만 둔다.
```

### 2.8 용어 최종 확정

상태:

- 완료. `docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md`를 기준으로 한다.

잠금:

```text
UI 정식 자원명은 태그 계열을 쓴다.
상위 자원명 = 보급태그.
개별 자원명 = 식량태그, 충전태그, 통행태그, 진료태그, 거주태그, 수신태그.
밥표/전원표/신호표는 UI 정식명이 아니라 NPC 속어와 현장 표현으로만 쓴다.
라이프라인 = 유저용 기반망 명칭.
생활 접근 중개망 = 내부 설정어.
A0~A4 유저 표기는 귀환 안정, 인양 가능, 인양 불안정, 고위험 인양, 신호만 감지로 쓴다.
```

### 2.9 세계관 1차 잠금 목록

상태:

- 완료. `docs/world/WORLD_FOUNDATION_LOCK_V0_3.md`를 상위 기준으로 두고, `docs/world/WORLD_LORE_LOCK_V0_1.md`를 제작 잠금표로 쓴다.

잠금:

```text
L0 = 세계 원인, 라이프라인, 캠페인, 현재 시점. 단, 세부 내용은 WORLD_FOUNDATION_LOCK_V0_3 우선.
L1 = 세계지도, P1 확장, 캐릭터 해금, E02 확장 원칙, 용어, 인양/보급소, 아트 톤.
L2 = 제작 중 조정 가능한 방향 잠금.
L3 = 아직 별도 작업이 필요한 열린 항목.
다음 제작 전환 작업 = P0 월드맵 UI 구현 스펙.
```

### 2.10 세계 기반 잠금 v0.3

상태:

- 완료. `docs/world/WORLD_FOUNDATION_LOCK_V0_3.md`를 기준으로 한다.

잠금:

```text
유저가 처음 이해해야 하는 순서 = 태그 -> 캠페인 -> 등록 역할 -> 긴급 인양 -> 선택.
대동기화 사고 = 전력망, 위성 시각 보정, 금융 인증망이 동시에 흔들리며 시민권 DB와 광고 접근 승인 DB가 서로 다른 시간값으로 복구된 사고.
세계 원인 = AI 캠페인의 인간 인정 기준 붕괴가 최상위 원인. 라이프라인 확산기와 대동기화 사고는 조건, 도시 생명유지망 붕괴/회색 오염/등록 전쟁/인간 약탈은 그 기준을 강제한 가속 조건.
태그는 돈이 아니라 생활 접근 승인 조각.
침묵 보급소는 전파 음영/차폐/수동 설비가 겹친 작은 회수 거점.
긴급 인양은 비콘, 회수선, 역송출, 저신호 통로를 쓰는 물리 회수.
회색 오염은 광고 마법이 아니라 복합 산업/생활 오염.
윤서는 구문명 직장인이 아니라 침묵 보급소 현장 회수자.
전 지구 확인 자유 인간은 7000~9000명, 거주형 침묵 보급소는 약 200~240개 기준.
```

### 2.11 세계 원인 재검토 프롬프트

상태:

- 완료. `docs/world/WORLD_CAUSE_REVIEW_PROMPT_V0_1.md`를 기준으로 한다.

용도:

```text
윤서 또는 다른 플레이어블 캐릭터 결재 전에,
세계 원인이 유저 이해, 과학적/사회적/게임적 개연성, 캐릭터 제약을 버티는지 다시 판정한다.
캐릭터 프로필 작성 금지.
세계 원인 검토만 수행.
```

### 2.12 세계 원인 재검토 결과

상태:

- 완료. `docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md`를 기준으로 한다.

판정:

```text
세계 기반은 조건부 통과에서 제작 전환 가능 상태로 상승.
보완된 핵심은 대동기화 사고 사건상, 첫 30분 장면, 구용어 마이그레이션 원칙이다.
```

### 2.13 구용어 마이그레이션 1차

상태:

- 완료. `docs/world/LEGACY_TERM_MIGRATION_V0_1.md`를 기준으로 한다.

적용:

```text
scripts 유저 노출 문자열 = 태그/인양 기준으로 정리.
story/90_implementation = 구현 지시문 기준으로 정리.
밥표/전원표/신호표 = NPC 속어와 낡은 표지 설명에서만 허용.
```

## 3. 추천 진행 순서

| 순서 | 작업 | 이유 |
|---:|---|---|
| 1 | P0 월드맵 UI 구현 스펙 | 세계관 기준이 잠겼으므로 실제 제작 작업으로 전환할 수 있다. |
| 2 | 윤서 캐릭터 기준 문서 | 세계 기반 v0.3과 윤서 나이/역할 제약이 맞물렸으므로 캐릭터 작업으로 넘어갈 수 있다. |
| 3 | 잔여 원고/NPC 속어 검수 | `밥표/전원표/신호표`를 누가 언제 쓰는지 화자별로 정리한다. |
| 4 | E02 시즌 슬라이스 상세 | E02를 실제 제작하기로 할 때 12~18개 로컬로 확장한다. |

## 4. 지금 하면 안 되는 일

- E02~E12 로컬 노드를 모두 같은 밀도로 만들기.
- 96개 캠페인 보스 이름을 전부 확정하기.
- 실제 지명을 유저용 지도에 바로 노출하기.
- P2 지역을 첫 화면에서 너무 자세히 보여주기.
- 월드맵 색을 최종 아트처럼 확정하기.
- 용어 잠금 문서 없이 UI 문구를 임의 변경하기.

## 5. 다음 한 걸음

추천 다음 작업:

```text
P0 월드맵 UI 구현 스펙 v0.1
```

포함해야 할 것:

- Godot 월드맵 씬 구조.
- P0 노드 데이터 로딩 방식.
- 모바일/데스크톱 배치.
- 노드 상태와 버튼 상태.
- R01-L03 처리 후 P1 흐린 신호 전환.
- 잠금 용어 적용.
- 기존 코드의 구용어 처리 범위.
