# Implementation 0.2 Story Directive

상태: 0.2 구현 전 작업 지시서  
범위: 스토리 상태, 첫 로컬, 첫 회수, 송출 기록, 보스 선택, 거점 반응  
주의: 이 문서는 코드가 아니라 코드 작업자가 따라야 할 스토리/데이터 지시서다.

장기 운영 기준: 0.2는 시즌 리셋 구조가 아니라 환경 반응형 구조의 축소판이다. 자세한 기준은 `story/05_progression/environment_response_operations.md`를 따른다.

플레이어 경험 기준: 철학과 성향 해석은 내부에 숨긴다. 유저에게는 전투 재미, 캐릭터 매력, 짧은 문구, 지역 현상으로 전달한다. 자세한 기준은 `story/01_bible/player_experience_philosophy.md`를 따른다.

## 목표

0.2의 목표는 외곽 주택가 하나만으로도 `Atomic Ad Survivors`의 핵심 구조가 작동한다는 것을 증명하는 것이다.

플레이어는 윤서로 출격하고, 첫 전투에서 캠페인 신호 과부하로 강제 회수되며, 이후 반복 출격을 통해 송출 기록과 흔적을 모은다. 지역은 클리어되는 맵이 아니라 플레이어의 선택과 반복 행동을 먹고 변하는 로컬 생태권으로 보여야 한다.

## 포함 범위

0.2에 반드시 포함한다.

```text
플레이어블:
  윤서

거점:
  침묵 보급소 1화면
  NPC 5명 조건 대사 일부
  출격 게시판 변화
  이름 보관함/정비 벤치/충전 스탠드 최소 반응

로컬:
  r01_suburb
  하위 구역 5개를 데이터/문구/목표 위치로 표시

진행:
  첫 강제 회수
  송출 기록 3개
  송출관 접근 절차 확정

보스:
  스마일 홈 시어머니
  선택지 2개: 결절 파괴 / 기억 추출

콘텐츠:
  흔적 P0 3개, P1 권장 3개
  런 카드 12개
  광고 전단 조각
  캠페인 코어 파편

반복 변화:
  재방문 횟수
  캠페인 농도
  차징 적응
  같은 집의 이름
  윤서의 빈 고객란
  조작된 구조 신호 암시
```

## 제외 범위

0.2에서 만들지 않는다.

```text
로봇 플레이어블 실제 구현
나리 실제 구현
고위험 역송출형 실제 구현
코어 해방 선택
신호 우회 선택
캠페인 송출관 실제 보스전
로봇 서비스센터/폐쇼핑몰/방송국 실제 지역
진짜 악의 행위자 직접 등장
최종 엔딩 구현
복잡한 호감도
정착지 운영
다지역 연쇄 시나리오 완성
```

송출관은 첫 보스가 아니라 상위 접근 목표다. 0.2에서 직접 싸우지 않는다.

## 핵심 상태

0.2는 작게 시작하되, 나중에 로컬과 캐릭터가 늘어나도 깨지지 않는 구조여야 한다.

```text
GameStoryState
  human_stability
  robot_autonomy
  trace_preservation
  campaign_exploitation
  sync_risk
  selected_character
  unlocked_characters
  broadcast_records
  transmitter_access_state
  preserved_traces
  consumed_traces
  behavior_memory
  population_state
  malice_threads
  observation_layers
```

초기값 후보:

```text
human_stability = 35
robot_autonomy = 15
trace_preservation = 0
campaign_exploitation = 0
sync_risk = 0
selected_character = "pc_yunseo_001"
unlocked_characters = ["pc_yunseo_001"]
broadcast_records = []
transmitter_access_state = "locked"
preserved_traces = []
consumed_traces = []
behavior_memory = {}
population_state = {}
malice_threads = {}
observation_layers = {}
```

## 외곽 주택가 상태

`r01_suburb`는 클리어 플래그 하나로 끝나면 안 된다. 지역은 반복 출격에 따라 말을 바꾸고, 목표를 바꾸고, 플레이어의 행동을 기억해야 한다.

```text
r01_suburb_state
  id = "r01_suburb"
  unlocked = true
  campaign_pressure = 60
  node_state = "active"
  boss_outcome = "none"
  local_outcome = "none"
  discovery_level = 0
  revisit_count = 0
  active_events = []
  discovered_traces = []
  adaptation_charge = 0
  adaptation_auto_attack = 0
  mystery_layers_unlocked = []
  local_trigger_flags = []
  sectors_seen = ["silence_edge"]
  local_memory_profile = "active"
  observation_layers = []
```

하위 구역은 실제 맵 분할이 아니어도 된다. 0.2에서는 목표 위치, 배너 문구, 배경 오브젝트, 적 조합으로 표시한다.

| 구역 | 0.2 표시 |
| --- | --- |
| `silence_edge` | 시작 지점, 보급소 무전, 첫 회수 문구 |
| `residential_loop` | 반복 집 타일, 쿠폰 전단 떼, 단골 고객 배너 |
| `model_home_node` | 행복 보증 상담원, 보스 전조 |
| `drainage_silence_pocket` | 납 차폐 배터리, 무음 라디오 |
| `false_return_route` | 보스 후 재방문 문구, 조작된 구조 신호 암시 |

## 행동 기억

0.2 최소 행동 기억은 아래만 있어도 충분하다.

```text
BehaviorMemory
  local_visit_count.r01_suburb
  consecutive_local_runs.r01_suburb
  character_local_pair_count.pc_yunseo_001.r01_suburb
  charge_skill_overuse_count.r01_suburb
  ignored_signal_events
  recovery_reason_count.signal_overload
```

처리 원칙:

- 반복 행동은 보상만 주는 장치가 아니라 세계가 플레이어를 알아보는 장치다.
- 0.2에서 관측층은 별도 복잡한 UI가 아니라 게시판 문구, NPC 한 줄, 오브젝트 변화로만 암시한다.
- `local_memory_profile`, `trace_preservation`, `campaign_exploitation`, `sync_risk` 같은 내부 해석값은 유저에게 직접 보여주지 않는다.
- 한 런 종료 후 직접 보여줄 변화는 1~2개로 제한한다.
- 나머지는 다음 런 배너, 게시판 부제, NPC 한 줄, 배경 오브젝트로 분산한다.

## 첫 강제 회수

첫 전투는 HP 0 긴급 인양이 아니라 `signal_overload` 강제 회수로 끝난다.

이유:

- 윤서는 아직 외곽 주택가의 송출 패턴을 모른다.
- 침묵 보급소도 윤서의 침묵 핵이 얼마나 버티는지 처음 측정한다.
- 일정 이상 깊이 들어가면 캠페인 신호가 윤서를 상품 프로필로 등록하려 한다.
- 보급소는 윤서가 사라지기 전에 역송출 장비를 강제로 끊어 회수한다.

연출 문구 후보:

| 시점 | 문구 |
| --- | --- |
| 60초 | `오늘의 추천 고객이 감지되었습니다.` |
| 70초 | `윤서: 방금... 내 이름을 읽었어?` |
| 90초 | `캠페인 신호 과부하. 침묵권 경계가 밀립니다.` |
| 100초 | `회수 절차 시작. 아직 결제되지 않은 생존자입니다.` |

회수 직전 HUD:

```text
신호 과부하
침묵 보급소가 역송출선을 강제로 당깁니다
```

보급소 도착 직후:

```text
미나: 죽은 건 아니야. 하지만 저쪽은 네 이름을 장바구니에 넣었어.
도윤: 좋은 소식은 장비가 버텼다는 거고, 나쁜 소식은 저쪽도 배웠다는 거야.
```

첫 보상은 죽어서 받는 것이 아니다. 생존 시간, 처치 수, 신호 목표 접촉, 회수 직전 데이터량에 따라 광고 전단 조각과 첫 장비 보정을 지급한다.

## 송출 기록

송출 기록은 재화가 아니다. 캠페인 송출관 접근을 여는 스토리 단서다.

정의:

- 캠페인이 반복 송출하는 광고 문구 사이에 끼어 있는 자동 점검 로그이자 좌표 잔향이다.
- 인간 귀에는 광고 소음처럼 들리지만, 침묵 보급소의 장비는 그 사이의 공백을 읽을 수 있다.
- 전투 중 깊이 들어가야만 얻는 이유는 송출 기록이 지역 표면이 아니라 고농도 신호층에서만 드러나기 때문이다.
- 보급소로 회수되어야 해석 가능한 이유는 전장에서는 기록이 계속 광고 문구로 덮어쓰기 되기 때문이다.

획득 구조:

```text
시간 도달
-> 신호 이벤트 출현
-> 목표 달성/생존/처치
-> 송출 기록 확보
-> 보급소 해석
```

### 송출 기록 1

```text
id = "broadcast_record_01"
name = "첫 잡음 영수증"
timing = "120초 전후"
event = "광고 전단 소용돌이 안에서 신호 표식을 회수"
```

전투 중 배너:

```text
축하합니다! 고객님의 위치가 일부 확인되었습니다.
```

보급소 해석:

```text
세븐: 이건 좌표가 아니라 영수증입니다. 누군가를 산 기록이 아니라, 누군가를 찾으려다 실패한 기록입니다.
```

의미: 플레이어가 더 깊이 들어가면 단순 보상 이상의 정보가 나온다는 것을 배운다.

### 송출 기록 2

```text
id = "broadcast_record_02"
name = "길 잃은 카탈로그"
timing = "180초 전후"
event = "움직이는 모델하우스 표지판을 일정 시간 생존하며 추적"
```

전투 중 배너:

```text
가까운 행복 매장을 안내합니다. 이 길은 항상 처음입니다.
```

보급소 해석:

```text
도윤: 광고가 방향을 갖고 있어. 길 안내가 아니라, 길을 만드는 쪽에 가까워.
```

의미: 캠페인 신호가 단순 소음이 아니라 경로와 접근 절차를 가진다는 것을 보여준다.

### 송출 기록 3

```text
id = "broadcast_record_03"
name = "개장 전 점검표"
timing = "240초 전후"
event = "고농도 신호 결절 주변 엘리트 처치 또는 생존"
```

전투 중 배너:

```text
개장 준비 완료. 가족 단위 고객은 정문으로 입장해 주세요.
```

보급소 해석:

```text
세븐: 세 조각이 같은 문을 가리킵니다. 위치라기보다 입장 절차입니다.
```

확정 문구:

```text
송출관 접근 절차 확정
외곽 주택가의 상위 송출 결절에 접근할 수 있습니다
```

의미: 좌표는 물리적 위치, 신호 주파수, 접근 절차가 합쳐진 상태다. 단순 좌표 조각 재화로 다루지 않는다.

## 재화

### 광고 전단 조각

광고 전단 조각은 돈이 아니다. 캠페인 환경에서 떨어져 나온 판촉 물질이며, 침묵 보급소는 이것을 분해해 역송출 장비와 보급소 설비를 보정한다.

획득 이유:

- 캠페인 개체는 처치되거나 신호가 끊기면 판촉 물질을 흘린다.
- 오래 생존할수록 더 깊은 광고층의 전단을 긁어올 수 있다.
- 엘리트와 신호 이벤트는 더 농축된 판촉 물질을 남긴다.

사용 방향:

```text
장비 개조
역송출 장비 보정
보급소 설비 수리
초반 카드/스탯 성장
```

대체 이름 후보:

```text
광고 전단 조각
판촉 전단
할인권 잔해
쿠폰 섬유
행복 보증지
```

획득 문구:

```text
판촉 물질 회수
광고 전단 조각 +12
```

정산 문구:

```text
보급소가 전단을 분해해 역송출 장비의 접점을 보정했습니다.
```

### 캠페인 코어 파편

캠페인 코어 파편은 보스 또는 고농도 결절에서 떨어지는 신호 핵심 잔해다.

획득 이유:

- 보스에게 유의미한 피해를 줘야만 결절 내부의 반복 송출 구조가 깨진다.
- HP 65%, 25%, 처치 같은 명확한 성과 구간에서만 지급한다.
- 보스 얼굴만 보고 회수된 경우에는 지급하지 않는다.

의미:

- 광고 전단 조각은 외피 재료다.
- 캠페인 코어 파편은 지역 법칙을 바꾸는 내부 부품이다.
- 보급소는 코어 파편으로 보스 대응 장비, 상위 성장, 스토리 해금을 연다.

획득 문구:

```text
송출 결절 균열
캠페인 코어 파편 +1
```

정산 문구:

```text
도윤: 이건 전단이 아니야. 저쪽이 스스로를 반복시키는 부품이야.
```

## 흔적 0.2

0.2 흔적은 `P0 필수 3개`와 `P1 권장 3개`로 나눈다. 일정이 위험하면 P0 3개만으로도 0.2 합격이 가능해야 한다.

| id | 우선순위 | 역할 |
| --- | --- | --- |
| `trace_nameplate_001` | P0 | 같은 집의 이름, 인간 안정도, 단골 고객 시나리오 |
| `trace_burnt_family_photo_001` | P0 | 기억 추출 루트, 복희 반응 |
| `trace_nameless_receipt_001` | P0 | 윤서의 빈 고객란, 계약/기록 조작 암시 |
| `trace_mascot_badge_001` | P1 | 반품된 마스코트 씨앗, 팝시 반응 |
| `trace_lead_battery_001` | P1 | 정비 벤치, 침묵권 보정 |
| `trace_silent_radio_001` | P1 | 조작된 구조 신호 암시 |

각 흔적은 최소 아래 필드를 가진다.

```text
TraceItem
  id
  name
  short_description
  source_region
  related_npcs
  combat_effect_id
  hub_story_effect_id
  preserve_changes
  consume_changes
  unlocks
```

## 카드 12개

카드는 `story/04_content/run_cards.md`를 기준으로 데이터화한다.

필수 원칙:

- `flavor_text`와 `effect_text`를 분리한다.
- 광고풍 설명은 웃겨도 된다.
- 실제 효과 문장은 짧고 명확해야 한다.
- 캠페인 위험 카드는 이득과 비용을 함께 둔다.

```text
RunCard
  id
  name
  flavor_text
  effect_text
  tags
  rarity
  unlock_condition
  stack_rule
  narrative_axis
```

## 보스 선택

0.2 보스는 `스마일 홈 시어머니`다. 캠페인 송출관은 아직 직접 보스가 아니다.

### 결절 파괴

```text
id = "destroy_node"
label = "결절 파괴"
human_stability +10
campaign_pressure -20
trace_preservation +2
boss_outcome = "destroy_node"
node_state = "aftershock"
active_events += ["quiet_open_house", "hunter_elite_hint"]
```

필수 반응:

```text
출격 게시판: 조용한 오픈하우스
NPC 반응: 미나 또는 복희
다음 런: 문패/구조/안정화 목표 증가
```

### 기억 추출

```text
id = "extract_memory"
label = "기억 추출"
trace_preservation +12
human_stability +3
campaign_pressure -8
sync_risk +5
boss_outcome = "extract_memory"
node_state = "memory_afterimage"
active_events += ["family_photo_afterimage", "fake_memory_wave"]
```

필수 반응:

```text
출격 게시판: 보정된 가족사진
NPC 반응: 복희 또는 세븐
다음 런: 가족사진 잔향/흔적 목표 증가
```

## 연쇄 시나리오

0.2에서는 완성형 퀘스트가 아니라 씨앗과 짧은 반응으로 둔다.

| id | 0.2 처리 |
| --- | --- |
| `r01_same_house_wrong_name` | 반복 방문, 문패, 가족사진 반응 |
| `yunseo_blank_customer_profile` | 첫 회수, 이름 없는 영수증, 윤서 대사 |
| `faked_rescue_signal_hint` | 무음 라디오, 수정된 구조 요청 문구 |
| `mall_returned_mascot_seed` | 마스코트 배지, 팝시 반응 |

트리거 후보:

```text
r01_same_house_wrong_name:
  consecutive_local_runs.r01_suburb >= 3
  OR trace_nameplate_001 acquired
  OR trace_burnt_family_photo_001 acquired

yunseo_blank_customer_profile:
  selected_character = pc_yunseo_001
  forced_recovery_reason = signal_overload
  trace_nameless_receipt_001 acquired

faked_rescue_signal_hint:
  trace_silent_radio_001 acquired
  OR ignored_signal_events >= 2

mall_returned_mascot_seed:
  trace_mascot_badge_001 acquired
```

악의 행위자는 직접 보여주지 않는다. 0.2에서는 `rumor` 또는 `pattern` 단계까지만 허용한다.

## 정산 순서

런 종료 후 처리 순서는 고정한다.

```text
1. 생존/회수/실패 판정
2. 지역 상태 갱신
3. 캠페인 학습 갱신
4. 행동 기억 갱신
5. 송출 기록 체크
6. 연쇄 시나리오/악의 씨앗 체크
7. 흔적 회수 UI
8. 보스 선택 UI, 해당 시점에만
9. 전역 상태값 갱신
10. NPC 반응 1~2개 출력
11. 출격 게시판 갱신
```

회수나 인양은 보상의 원인이 아니라 정산 지점이다. 보상은 런에서 실제로 해낸 성과에서 나온다.

## NPC 반응

0.2 NPC 대사는 짧고 조건 중심이어야 한다.

최소 반응 범주:

```text
첫 강제 회수
송출 기록 해석
새 흔적 첫 회수
보스 선택 직후
반복 방문
악의 씨앗 암시
```

한 번 귀환할 때 화면에 직접 노출되는 NPC 반응은 1~2개로 제한한다. 나머지는 시설 상호작용이나 다음 런 게시판으로 넘긴다.

## 출격 게시판

게시판은 지역이 변했다는 것을 가장 싸게 보여주는 장치다.

| 조건 | 표시명 | 부제 |
| --- | --- | --- |
| 기본 | 외곽 주택가 | 영원히 팔리는 행복한 동네 |
| `boss_outcome = destroy_node` | 외곽 주택가 | 조용한 오픈하우스 |
| `boss_outcome = extract_memory` | 외곽 주택가 | 보정된 가족사진 |
| `campaign_pressure >= 80` | 외곽 주택가 | 재방문 고객 전용 혜택 |
| `consecutive_local_runs >= 3` | 외곽 주택가 | 단골 고객 주간 |
| `malice_threads.faked_rescue_signal.certainty = rumor` | 외곽 주택가 | 수상한 구조 신호 |

## 테스트 기준

0.2 스토리 테스트는 아래 질문에 답할 수 있어야 한다.

- 첫 전투가 죽음이 아니라 강제 회수로 느껴지는가.
- 잘한 플레이어가 더 많은 보상을 얻지만 첫 전투를 클리어하지 못하는 구조가 납득되는가.
- 송출 기록이 단순 재화가 아니라 접근 절차로 이해되는가.
- 광고 전단 조각과 캠페인 코어 파편의 차이가 느껴지는가.
- 보스 선택 후 다음 런의 게시판, 목표, NPC 반응 중 최소 하나가 바뀌는가.
- 같은 지역을 여러 번 갔을 때 세계가 플레이어를 알아보는가.
- 캠페인 환경과 진짜 악의 씨앗이 구분되는가.
- 스마일 홈 시어머니와 캠페인 송출관의 역할이 섞이지 않는가.
- 윤서가 강하지만 완벽한 해설자가 아니라는 느낌이 남는가.
- 로컬 하나가 작아도 생태권처럼 느껴지는가.

## 합격 조건

0.2 스토리 구현은 아래를 만족하면 통과다.

```text
첫 런:
  signal_overload 강제 회수 발생
  성과 기반 전단 조각 지급
  보급소 첫 반응 출력

반복 런:
  r01_suburb revisit_count 증가
  campaign_pressure 또는 active_events 변화
  송출 기록 3개 획득 가능

보스:
  스마일 홈 시어머니 조우
  결절 파괴/기억 추출 중 하나 선택
  선택 후 게시판 부제 변경

흔적:
  6개 흔적 중 일부 획득 가능
  보관/소모/반응 중 최소 하나 작동

연쇄:
  같은 집의 이름 또는 윤서의 빈 고객란 중 하나 이상 발동
  조작된 구조 신호는 암시까지만 표시
```

## 연결 문서

- `story/01_bible/world_overview.md`
- `story/01_bible/population_model.md`
- `story/01_bible/malice_in_the_environment.md`
- `story/02_hub/silence_outpost.md`
- `story/02_hub/npcs.md`
- `story/03_regions/r01_suburb.md`
- `story/03_regions/r01_boss.md`
- `story/04_content/trace_items.md`
- `story/04_content/run_cards.md`
- `story/05_progression/broadcast_records_and_recovery.md`
- `story/05_progression/region_evolution_model.md`
- `story/05_progression/story_trigger_schema.md`
- `story/05_progression/linked_scenario_system.md`
- `story/06_characters/yunseo.md`
- `story/90_implementation/story_integration_notes.md`
