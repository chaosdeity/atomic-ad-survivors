# Story Integration Notes

상태: 0.001 최종 통합 확장  
원전: `story/00_source/story_0.001.md`  
연결 문서: `story/01_bible/factions.md`, `story/01_bible/population_model.md`, `story/01_bible/malice_in_the_environment.md`, `story/03_regions/r01_suburb.md`, `story/03_regions/r01_boss.md`, `story/05_progression/region_evolution_model.md`, `story/05_progression/broadcast_records_and_recovery.md`, `story/05_progression/local_mystery_layers.md`, `story/05_progression/story_trigger_schema.md`, `story/05_progression/linked_scenario_system.md`, `story/06_characters/player_characters.md`, `story/06_characters/yunseo.md`, `story/04_content/trace_items.md`, `story/04_content/run_cards.md`, `story/05_progression/run_story_hooks.md`, `story/05_progression/endings.md`, `story/90_implementation/implementation_0_2_story_directive.md`

## 목표

이 문서는 스토리 문서를 나중에 Godot 구현으로 옮길 때 필요한 연결 방식을 정리한다. 지금 단계에서는 코드를 만들지 않는다. 대신 어떤 상태값, 데이터 필드, 조건 분기, UI 문구가 필요한지 개발 작업 지시서로 바꾸기 쉬운 형태로 둔다.

핵심은 세계관을 컷신 파일이 아니라 게임 상태 변화로 옮기는 것이다.

## 구현 원칙

- 초반에는 `.tres` 리소스보다 간단한 `Dictionary` 또는 JSON 유사 데이터로 빠르게 검증한다.
- 카드 설명은 `flavor_text`와 `effect_text`를 반드시 분리한다.
- 흔적 아이템은 전투 효과와 거점/스토리 효과를 분리한다.
- NPC 대사는 긴 대화창보다 런 전/후 짧은 조건 반응부터 넣는다.
- 보스 후 선택은 0.2에서 2개만 시작한다. 권장: `결절 파괴`, `기억 추출`.
- 지역은 클리어 플래그 하나로 끝내지 않는다. `campaign_pressure`, `boss_outcome`, `revisit_count`를 최소로 둔다.
- 수치 변화가 있으면 대사, 적 이름, 출격 게시판 문구 중 하나에 반드시 드러나야 한다.

## 0.2 확정 범위

0.2는 전체 세계를 구현하는 버전이 아니다. 0.2의 목표는 `외곽 주택가` 하나만으로도 이 게임의 스토리 구조가 성립한다는 것을 증명하는 것이다.

확정 포함:

```text
기본 캐릭터:
  윤서

거점:
  침묵 보급소 1화면
  NPC 5명 조건 대사 일부
  이름 보관함/정비 벤치/충전 스탠드/출격 게시판의 최소 반응

로컬:
  r01_suburb
  하위 구역은 데이터/문구/목표 위치로만 우선 표현

보스:
  스마일 홈 시어머니
  선택지 2개: 결절 파괴 / 기억 추출

진행:
  첫 강제 회수
  송출 기록 3개
  송출관 접근 절차 확정

반복:
  revisit_count
  campaign_pressure
  adaptation_charge
  같은 집의 이름 씨앗
  윤서의 빈 고객란 씨앗
  조작된 구조 신호 암시만
```

확정 제외:

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
복잡한 호감도/정착지 운영
```

0.2는 작아야 한다. 하지만 작더라도 반드시 “이 지역은 다음에 다시 들어가면 달라진다”는 감각을 줘야 한다.

## 전역 상태

0.2 최소 전역 상태는 아래 정도면 충분하다.

```text
GameStoryState
  human_stability
  robot_autonomy
  trace_preservation
  campaign_exploitation
  sync_risk
  unlocked_cards
  preserved_traces
  consumed_traces
  hub_stage
  ending_flags
  broadcast_records
  transmitter_access_state
  unlocked_characters
  selected_character
  behavior_memory
  population_state
  malice_threads
```

### 초기값 후보

```text
human_stability = 35
robot_autonomy = 15
trace_preservation = 0
campaign_exploitation = 0
sync_risk = 0
hub_stage = "temporary_silence"
broadcast_records = []
transmitter_access_state = "locked"
unlocked_characters = ["pc_yunseo_001"]
selected_character = "pc_yunseo_001"
behavior_memory = {}
population_state = {}
malice_threads = {}
```

## 인구 상태

인구는 단순 배경 수치가 아니라 보급소 압력과 진영 갈등의 원천이다. 0.2에서는 복잡한 인구 시뮬레이션 대신 라벨과 압력 단계로 시작한다.

```text
OutpostPopulation
  human_count_label
  robot_count_label
  supply_pressure
  trust_pressure
  silence_noise_pressure
```

장기 확장형:

```text
PopulationState
  human_named
  human_unnamed
  human_injured
  human_missing
  robot_liberated_named
  robot_liberated_unnamed
  robot_resync_risk
  robot_missing
  outpost_capacity
  food_pressure
  bunk_pressure
  charge_pressure
  silence_noise_pressure
  distrust_human_to_robot
  distrust_robot_to_human
```

처리 원칙:

- 인간을 구조하면 인간 안정도만 올리지 않는다. 보급/침상/소음 압력도 같이 고려한다.
- 로봇을 해방하면 로봇 자율성만 올리지 않는다. 재동기화/인간 불신/충전 압력도 같이 고려한다.
- 인구 변화는 숫자 UI보다 침상, 충전선, 배급표, 출격 게시판 문구로 먼저 보여준다.
- 캠페인은 보급소 인구를 `고객 수 증가`로 오해해야 한다.

초반은 인간 쪽이 조금 더 안정적이고, 로봇은 소수이며, 캠페인은 지역 단위로 압박하는 상태가 좋다.

## 지역 상태

```text
RegionState
  id
  unlocked
  campaign_pressure
  node_state
  boss_outcome
  revisit_count
  local_outcome
  discovery_level
  active_events
  discovered_traces
  adaptation_charge
  adaptation_auto_attack
  mystery_layers_unlocked
  local_trigger_flags
  sectors_seen
```

0.2 최소 구현:

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
  mystery_layers_unlocked = []
  local_trigger_flags = []
  sectors_seen = ["silence_edge"]
```

## 로컬 미스터리 층

로컬은 작은 스테이지가 아니라 여러 번 들어가며 층이 열리는 생태권이다. 전투 맵은 작게 시작해도, 데이터상으로는 표면 광고층, 생활 흔적층, 자동화 뒷면층, 캠페인 법칙층, 악의 개입층, 미지 접촉층을 받을 수 있어야 한다.

```text
LocalMysteryLayer
  id
  local_id
  layer_depth
  layer_type
  visibility
  required_triggers
  related_characters
  related_npcs
  related_traces
  related_boss_outcomes
  reveal_text
  gameplay_effect
  can_be_missed
  late_discovery_rule
```

0.2에서는 외곽 주택가에 아래 구역을 우선 연결한다.

```text
r01_suburb_sectors:
  silence_edge
  residential_loop
  model_home_node
  drainage_silence_pocket
  false_return_route
```

0.2에서 실제 맵을 크게 나누지 못해도 된다. 대신 각 구역은 최소 하나의 표시 방식이 필요하다.

| 구역 | 0.2 표시 방식 |
| --- | --- |
| `silence_edge` | 시작 지점 문구, 보급소 무전 |
| `residential_loop` | 반복 집 타일, 쿠폰 전단 떼 |
| `model_home_node` | 행복 보증 상담원, 보스 전조 |
| `drainage_silence_pocket` | 납 차폐 배터리 또는 무음 라디오 |
| `false_return_route` | 보스 후 재방문 문구 |

## 스토리 트리거

스토리 트리거는 컷신 재생 플래그가 아니라 세계 상태 변경 장치다. 반복 행동, 부재, 로컬 간 연결, 캐릭터 관점, 보스 선택, 흔적 사용을 같은 규칙으로 읽을 수 있어야 한다.

```text
StoryTrigger
  id
  type
  scope
  priority
  conditions_all
  conditions_any
  blockers
  repeat_policy
  cooldown_runs
  discovery_policy
  effects
  reveal_text
  audit_tags
```

```text
BehaviorMemory
  local_visit_count
  consecutive_local_runs
  avoided_local_runs
  same_boss_choice_streak
  trace_preserve_streak
  trace_consume_streak
  robot_liberation_count
  human_rescue_count
  campaign_risk_accept_count
  ignored_signal_events
  character_local_pair_count
  charge_skill_overuse_count
  recovery_reason_count
```

처리 원칙:

- 런 결과 정산 후 `BehaviorMemory`를 먼저 갱신한다.
- 그다음 `StoryTrigger`를 우선순위 순서로 평가한다.
- 한 런 종료 화면에 직접 보여줄 반응은 1~2개만 선택한다.
- 나머지 반응은 보급소 오브젝트, NPC 짧은 대사, 출격 게시판, 다음 런 배너로 분산한다.
- 핵심 진행은 단일 트리거 하나에만 의존하지 않는다. 놓쳤을 때 늦게 발견되는 우회 조건을 둔다.

## 연쇄 시나리오

연쇄 시나리오는 긴 퀘스트 줄이 아니라 여러 트리거와 노드가 느슨하게 이어지는 사건 묶음이다. 퀘스트 로그를 만들더라도 모든 단계를 체크리스트처럼 보여주지 않는다.

```text
LinkedScenario
  id
  title
  scenario_type
  scope
  entry_points
  required_nodes
  optional_nodes
  branch_points
  linked_triggers
  related_locals
  related_npcs
  related_characters
  related_traces
  final_states
  repeat_after_state
```

```text
ScenarioNode
  id
  scenario_id
  node_type
  trigger_condition
  reveal_channel
  text_key
  state_effect
  unlocks
  missable
  fallback_condition
```

0.2 우선 시나리오:

```text
r01_same_house_wrong_name
yunseo_blank_customer_profile
mall_returned_mascot_seed
faked_rescue_signal_hint
```

처리 원칙:

- 필수 노드는 적게 두고 선택 노드를 많이 둔다.
- 로컬 내부형과 로컬 횡단형을 구분한다.
- NPC, 흔적, 캐릭터 관점이 최소 하나 이상 연결되어야 장기 시나리오로 인정한다.
- 악의 개입형은 캠페인 환경과 분리해서 태그를 단다.
- 시나리오 결말은 안정화, 보존, 해방, 역이용, 은폐, 폭로 중 하나 이상을 가진다.

0.2 처리:

| 시나리오 | 상태 | 표현 |
| --- | --- | --- |
| `r01_same_house_wrong_name` | 최소 작동 | 반복 방문 배너, 문패/가족사진 반응 |
| `yunseo_blank_customer_profile` | 최소 작동 | 첫 회수, 이름 없는 영수증, 윤서 대사 |
| `mall_returned_mascot_seed` | 씨앗 | 마스코트 배지, 팝시 반응 |
| `faked_rescue_signal_hint` | 암시 | 무음 라디오, 수정된 구조 요청 문구 |

## 악의 행위자

캠페인 환경은 악당이 아니라 세계 법칙이다. 악의 행위자는 이 세계 법칙을 이용해 누군가를 일부러 상품, 자원, 미끼, 데이터로 만드는 존재다.

```text
MaliceThread
  id
  actor_type
  certainty
  discovered_evidence
  suspected_locals
  affected_population
  related_traces
  player_response
  current_status
```

확신도:

```text
rumor
pattern
evidence
confrontation
aftermath
```

0.2에서는 악의 행위자를 직접 등장시키지 않는다. 대신 아래 씨앗만 둔다.

```text
trace_silent_radio_001 -> 조작된 구조 신호 암시
trace_nameless_receipt_001 -> 계약/기록 조작 암시
mall_returned_mascot_seed -> 반품 권리 주장 암시
failed_rescue_banner -> 누군가 구조 신호를 이용한다는 암시
```

처리 원칙:

- 악의는 `malice_actor` 태그로 캠페인 환경과 구분한다.
- 악의 시나리오는 폭로, 은폐, 추적, 거래, 처벌 같은 응답 선택을 가질 수 있다.
- 악한 인간/로봇이 나와도 해당 진영 전체를 악으로 보이게 하지 않는다.
- 악역 하나를 제거해 캠페인 문제가 해결되는 구조를 피한다.

0.2 금지:

- 구조 신호 조작범을 보여주지 않는다.
- 외부 인간 집단을 직접 등장시키지 않는다.
- 해방 로봇을 부품으로 거래하는 장면을 직접 보여주지 않는다.
- 악의 씨앗은 흔적/문구/NPC 반응으로만 둔다.

### 상태값 연결

| 상태값 | 영향 |
| --- | --- |
| `campaign_pressure` | 적 밀도, 엘리트 확률, 위험 보상, 출격 게시판 문구 |
| `boss_outcome` | 재방문 적 이름, 지역 문구, 보스 잔향, NPC 반응 |
| `revisit_count` | 재방문 목표, 소결절, 고농도 이벤트 |
| `adaptation_charge` | 차징 방해 엘리트, 실패 후 캠페인 학습 문구 |
| `discovered_traces` | 흔적 UI, NPC 반응, 카드 해금 |

## 보스 선택 결과

0.2에서는 `결절 파괴`와 `기억 추출`을 우선한다.

```text
BossOutcome
  id
  label
  immediate_state_changes
  region_changes
  hub_reactions
  unlocked_rewards
  locked_or_delayed_rewards
```

### r01 선택 1: 결절 파괴

```text
id = "destroy_node"
label = "결절 파괴"
immediate_state_changes:
  human_stability +10
  campaign_pressure -20
  trace_preservation +2
region_changes:
  boss_outcome = "destroy_node"
  node_state = "aftershock"
  active_events += ["quiet_open_house", "hunter_elite_hint"]
unlocked_rewards:
  trace_nameplate_001
  card_premium_silence_001 candidate
locked_or_delayed_rewards:
  trace_home_assistant_core_001
```

### r01 선택 2: 기억 추출

```text
id = "extract_memory"
label = "기억 추출"
immediate_state_changes:
  trace_preservation +12
  human_stability +3
  campaign_pressure -8
  sync_risk +5
region_changes:
  boss_outcome = "extract_memory"
  node_state = "memory_afterimage"
  active_events += ["family_photo_afterimage", "fake_memory_wave"]
unlocked_rewards:
  trace_burnt_family_photo_001
  trace_nameless_receipt_001 candidate
  card_family_bundle_001 candidate
```

`코어 해방`과 `신호 우회`는 문서상 유지하되 0.3 이후로 미루면 좋다.

### 보스 선택 후 필수 반응

보스 선택 후에는 수치만 바뀌면 안 된다. 0.2에서는 최소 아래 3개가 바뀌어야 한다.

| 선택 | 출격 게시판 | NPC 반응 | 다음 런 |
| --- | --- | --- | --- |
| 결절 파괴 | `조용한 오픈하우스` | 미나 또는 복희 | 문패/구조/안정화 목표 증가 |
| 기억 추출 | `보정된 가족사진` | 복희 또는 세븐 | 가족사진 잔향/흔적 목표 증가 |

선택 후 첫 귀환에서는 NPC 반응을 2개 이하로 제한한다.

## 흔적 데이터

```text
TraceItem
  id
  name
  short_description
  source_region
  source_type
  related_npcs
  combat_effect_id
  hub_story_effect_id
  preserve_changes
  consume_changes
  campaign_use_changes
  unlocks
  ending_axis
```

### 선택 처리

| 선택 | 상태 변화 | UI 반응 |
| --- | --- | --- |
| 보관 | `trace_preservation` 상승, `preserved_traces` 추가 | 이름 보관함/카탈로그 벽 오브젝트 추가 |
| 소모 | 시설 강화, `consumed_traces` 추가 | 즉시 강화 표시, NPC 짧은 반응 |
| 인간 사용 | `human_stability` 상승 | 침상/카운터 변화 |
| 로봇 사용 | `robot_autonomy` 상승 | 충전 스탠드/팝시 반응 |
| 캠페인 활용 | `campaign_exploitation`, `sync_risk` 상승 | 위험 카드/광고 문구 해금 |

0.2 흔적 우선순위:

```text
P0:
trace_nameplate_001
trace_burnt_family_photo_001
trace_nameless_receipt_001

P1:
trace_mascot_badge_001
trace_lead_battery_001
trace_silent_radio_001
```

### 0.2 흔적 역할

| 흔적 | 우선순위 | 0.2 역할 |
| --- | --- | --- |
| `trace_nameplate_001` | P0 | 같은 집의 이름, 인간 안정도 |
| `trace_burnt_family_photo_001` | P0 | 기억 추출 루트, 복희 반응 |
| `trace_nameless_receipt_001` | P0 | 윤서의 빈 고객란, 계약/기록 조작 암시 |
| `trace_mascot_badge_001` | P1 | 반품된 마스코트 씨앗, 팝시 반응 |
| `trace_lead_battery_001` | P1 | 정비 벤치/침묵권 보정 |
| `trace_silent_radio_001` | P1 | 조작된 구조 신호 암시 |

## 카드 데이터

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

### 카드 풀

기본 카드와 해금 카드를 분리한다.

```text
base_pool:
  card_fresh_return_001
  card_free_radiation_001
  card_smile_stabilizer_001
  card_like_new_heart_001
  card_sweet_rebroadcast_001
  card_shining_customer_001
  card_expired_love_001
  card_family_bundle_001

unlock_pool:
  card_premium_silence_001
  card_mascot_handshake_001
  card_surprise_repurchase_001
  card_homecare_vortex_001
```

### 문체 처리

- 카드 선택 화면에는 `name`, `flavor_text`, `effect_text`를 모두 보여준다.
- 빠른 전투 UI에는 `name`과 핵심 수치만 보여준다.
- `flavor_text`는 광고풍 농담, `effect_text`는 숫자와 효과만 담당한다.
- 캠페인 위험 카드에는 좋은 효과와 작은 비용을 함께 둔다.

## 플레이어블 캐릭터 데이터

```text
PlayerCharacter
  id
  name
  type
  role
  adaptation_source
  starting_weapon
  auto_attack_style
  charge_skill
  charge_window_rule
  strength
  weakness
  faction_tension
  first_recovery_line
  unlock_condition
  story_axis
```

0.2 기본 캐릭터:

```text
pc_yunseo_001
  type = "human"
  adaptation_source = ["silence_core", "rebroadcast_device"]
  starting_weapon = "return_scanner"
  charge_skill = "return_stamp"
  unlock_condition = "default"
```

캐릭터 선택은 엔딩을 강제하지 않는다. 대신 대사, 차징 스킬, 위험 반응, 송출 기록 해석 감각을 바꾼다.

## NPC 대사 조건

```text
NpcLine
  id
  speaker
  trigger
  condition
  priority
  line
  once
  cooldown_runs
```

### 우선순위

1. 보스 선택 직후
2. 새 흔적 첫 회수
3. 캠페인 학습 첫 발생
4. NPC 개인 상태 변화
5. 지역 농도 변화
6. 일반 반복 대사

### 트리거

```text
before_run
after_success
after_failure
after_trace_found
after_trace_used
after_boss_choice
on_revisit
on_campaign_adaptation
on_card_unlock
on_population_pressure
on_malice_thread
on_character_wrong_belief
```

NPC 대사는 랜덤 묶음보다 조건 대사 중심으로 시작한다. 대사량이 적어도 조건이 정확하면 세계가 살아 보인다.

### 캐릭터 보정 조건

장기 구조 기준으로 NPC와 플레이어블 캐릭터는 각자의 잘못된 믿음과 위험 반응을 가진다.

```text
CharacterBeliefState
  character_id
  wrong_belief_id
  pressure_source
  stage
  unlocked_lines
  visual_hint
```

0.2 우선 반영:

```text
yunseo_detects_intentional_lie
mina_safety_becomes_closure
doyun_uses_dangerous_signal
popsy_fears_return_claim
seven_cannot_judge_intent
bokhee_questions_preservation
```

## 런 결과 정산

```text
RunResult
  region_id
  success
  survived_time
  boss_defeated
  boss_outcome
  traces_found
  cards_chosen
  charge_uses
  auto_attack_kills
  deaths_by_enemy_type
  campaign_pressure_delta
  flyer_fragments_earned
  core_fragments_earned
  broadcast_record_found
  forced_recovery_reason
  scenario_nodes_found
  malice_evidence_found
```

### 정산 후 처리 순서

1. 생존/실패 판정.
2. 지역 상태 갱신.
3. 캠페인 학습 갱신.
4. 행동 기억 갱신.
5. 송출 기록/시나리오 노드/악의 씨앗 체크.
6. 흔적 회수 UI.
7. 보스 선택 UI, 해당 시점에만.
8. 전역 상태값 갱신.
9. NPC 반응 1~2개 출력.
10. 다음 출격 게시판 문구 갱신.

## 송출 기록과 재화

송출 기록은 재화가 아니라 보스 접근을 여는 스토리 진행 단서다. 광고 전단 조각과 캠페인 코어 파편은 반복 성장 재화다.

```text
BroadcastProgress
  records_found
  decoded_records
  transmitter_access_state
```

```text
CurrencyState
  flyer_fragments
  campaign_core_fragments
```

처리 원칙:

- `flyer_fragments`: 처치, 생존 시간, 엘리트 처치, 신호 목표 달성에서 획득.
- `campaign_core_fragments`: 보스 HP 구간, 보스 처치, 보스 처리 선택에서 획득.
- `broadcast_records`: 120초, 180초, 240초 전후의 신호 이벤트 목표를 통과했을 때 획득.
- 회수/인양/성공은 정산 시점이지 보상 원인이 아니다.
- 첫 전투는 `forced_recovery_reason = "signal_overload"`로 끝내고, 성과에 따라 전단 조각과 첫 장비 보정을 지급한다.

## 캠페인 학습

캠페인 학습은 플레이어를 벌주기 위한 장치가 아니라, 세계가 플레이어를 기억한다는 장치다.

```text
CampaignAdaptation
  region_id
  adaptation_charge
  adaptation_auto_attack
  adaptation_mobility
  risk_card_acceptance
```

### 0.2 차징 적응

```text
if charge_uses >= threshold:
  adaptation_charge += 1

if adaptation_charge >= 2:
  active_events += ["charge_disruptor_elite_hint"]

if adaptation_charge >= 3:
  elite_pool += ["family_planner"]
```

차징 방해 엘리트는 차징을 막는 적이 아니라, 차징 타이밍에 새로운 회피 판단을 요구하는 적이어야 한다.

## 출격 게시판

```text
MissionBoardEntry
  region_id
  display_name
  subtitle
  campaign_pressure_label
  boss_outcome_label
  recommended_goals
  danger_tags
  reward_tags
```

### r01 문구 후보

| 조건 | 표시명 | 부제 |
| --- | --- | --- |
| 결절 활성 | 외곽 주택가 | 영원히 팔리는 행복한 동네 |
| 결절 파괴 | 외곽 주택가 | 조용한 오픈하우스 |
| 기억 추출 | 외곽 주택가 | 보정된 가족사진 |
| 캠페인 농도 높음 | 외곽 주택가 | 재방문 고객 전용 혜택 |

### 0.2 게시판 필수 조건

| 조건 | danger_tags | reward_tags |
| --- | --- | --- |
| `boss_outcome = none` | 가족 상품화, 오픈하우스 | 전단, 문패 |
| `boss_outcome = destroy_node` | 잔향, 추적형 엘리트 | 문패, 침묵 재료 |
| `boss_outcome = extract_memory` | 가짜 기억, 가족사진 잔상 | 사진, 영수증, 기억 조각 |
| `consecutive_local_runs >= 3` | 단골 고객 주간 | 문패, 추가 전단 |
| `malice_thread.certainty = rumor` | 수상한 구조 신호 | 무음 라디오 |

## 엔딩 판정

```text
EndingCheck
  human_stability
  robot_autonomy
  trace_preservation
  campaign_exploitation
  sync_risk
  final_choice
```

판정 순서:

1. 캠페인 흡수 실패
2. 공존 시도
3. 인간 우선
4. 로봇 우선
5. 미정/일반 생존 후일담

엔딩 화면은 거점 오브젝트 3개, NPC 대사 2~3개, 마지막 캠페인 문구 1개로 충분하다.

## 0.2 최소 구현 지시서 후보

문서 작업이 끝난 뒤 코드 작업으로 넘어갈 때 첫 지시서는 아래 범위가 좋다.

확정된 상세 지시서는 `story/90_implementation/implementation_0_2_story_directive.md`를 기준으로 한다.

```text
목표:
  외곽 주택가 반복 런이 선택에 따라 다르게 보이는 최소 스토리 상태 시스템 구현

포함:
  r01_suburb_state
  campaign_pressure
  boss_outcome: none / destroy_node / extract_memory
  revisit_count
  adaptation_charge
  behavior_memory 최소 항목
  malice_thread hint 상태
  흔적 P0 3개 데이터, P1 3개 후보
  카드 12개 데이터
  런 전/후 조건 대사 일부
  출격 게시판 문구 변화
  송출 기록 3개
  첫 강제 회수 이벤트

제외:
  코어 해방
  신호 우회
  최종 엔딩 구현
  복잡한 호감도
  전체 지역 로드맵 구현
```

## 0.2 작업 분해

문서가 코드 작업으로 넘어갈 때 작업 지시서는 아래 순서가 좋다.

1. `GameStoryState`와 `r01_suburb_state` 저장 구조.
2. 런 결과 정산에서 `revisit_count`, `campaign_pressure`, `behavior_memory` 갱신.
3. 첫 강제 회수와 송출 기록 3단계.
4. 흔적 P0 3개 데이터와 보관/소모/반응 처리. 일정이 허용되면 P1 3개를 추가한다.
5. 보스 선택 2개와 다음 런 게시판 변화.
6. NPC 조건 대사 최소 세트.
7. 같은 집의 이름/윤서의 빈 고객란/조작된 구조 신호 씨앗.
8. 차징 적응과 가족 플래너 엘리트 힌트.

## 0.2 문구 최소 세트

최소 문구 세트는 아래 정도면 된다.

```text
첫 강제 회수:
  윤서 1
  미나 1
  도윤 1

송출 기록:
  전투 중 배너 3
  보급소 해석 3
  송출관 접근 확정 1

흔적:
  흔적별 획득 문구 6
  관련 NPC 반응 1개씩

보스:
  등장 문구 2
  선택지 설명 2
  선택 후 NPC 반응 4

재방문:
  게시판 부제 4
  단골 고객 배너 1
  조작된 구조 신호 암시 1
```

문구는 부족한 편이 낫다. 조건이 맞는 대사 1줄이 무작위 대사 10줄보다 세계를 더 잘 살린다.

## 테스트 관찰 항목

- 플레이어가 같은 지역을 다시 들어갈 이유를 이해하는가.
- 보스 선택 후 다음 런에서 차이가 눈에 보이는가.
- 카드 문구가 웃기지만 효과는 명확한가.
- 흔적을 보관할지 소모할지 실제로 고민하게 되는가.
- 캠페인 학습이 불공정한 벌칙이 아니라 세계 반응으로 느껴지는가.
- NPC 대사가 적어도 거점이 바뀐 것처럼 느껴지는가.
- 스마일 홈 시어머니와 캠페인 송출관의 역할이 섞이지 않는가.
- 조작된 구조 신호가 범인 공개 없이도 “뭔가 이상하다”로 느껴지는가.
- 윤서가 강하지만 완벽한 해설자가 아니라는 느낌이 남는가.
- 첫 지역이 작아도 생태권처럼 느껴지는가.

## 금지 방향

- 스토리 상태를 컷신 재생 플래그로만 만들지 않는다.
- 카드, 흔적, NPC, 보스 선택이 서로 따로 노는 구조를 피한다.
- 수치를 많이 만들고 UI/대사에 드러내지 않는 상태를 피한다.
- 초반부터 `.tres` 리소스 계층을 과하게 만들지 않는다.
- 모든 선택을 영구 잠금으로 만들지 않는다. 일부는 지연, 비용, 재방문으로 회복 가능해야 한다.
- 0.2에서 악의 행위자를 직접 등장시키지 않는다.
- 0.2에서 로봇 해방 루트를 크게 열지 않는다.
- 송출관을 캠페인 전체의 최종 정체처럼 보이게 하지 않는다.
