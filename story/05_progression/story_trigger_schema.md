# Story Trigger Schema

상태: 0.001 확장 기준
연결 문서: `local_mystery_layers.md`, `local_ecology_roadmap.md`, `region_evolution_model.md`, `story_integration_notes.md`

## 목적

장기 운영형 스토리는 나중에 콘텐츠를 추가할 때 기존 개연성을 망가뜨리기 쉽다. 이를 막기 위해 처음부터 트리거의 종류, 조건, 우선순위, 반복 규칙을 정해 둔다.

핵심은 “퀘스트 플래그”가 아니라 “세계가 플레이어의 행동을 관찰한다”는 구조다.

## 트리거 원칙

- 트리거는 컷신 재생 장치가 아니라 세계 상태 변경 장치다.
- 한 번의 선택보다 반복된 습관이 더 강한 신호가 될 수 있다.
- 같은 결과도 여러 조건으로 도달 가능해야 한다.
- 유저가 단서를 놓쳐도 장기 진행이 막히면 안 된다.
- 새 로컬, 새 NPC, 새 캐릭터를 추가할 때 기존 트리거를 재사용할 수 있어야 한다.
- 모든 트리거는 범위, 조건, 차단 조건, 반복 여부, 효과를 명시한다.

## 기본 구조

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

### 필드 설명

| 필드 | 의미 |
| --- | --- |
| `id` | 고유 트리거 ID |
| `type` | 트리거 종류 |
| `scope` | 전역, 로컬, NPC, 캐릭터, 아이템, 보스 중 적용 범위 |
| `priority` | 여러 트리거가 동시에 켜졌을 때 우선순위 |
| `conditions_all` | 모두 만족해야 하는 조건 |
| `conditions_any` | 하나 이상 만족하면 되는 조건 |
| `blockers` | 켜지면 안 되는 조건 |
| `repeat_policy` | 1회, 반복, 단계 반복, 누적 반복 |
| `cooldown_runs` | 같은 반응이 다시 뜨기까지 필요한 런 수 |
| `discovery_policy` | 즉시 공개, 은근한 암시, 늦은 발견, 숨김 |
| `effects` | 상태 변화, 대사 해금, 적 변형, 카드/흔적 해금 |
| `reveal_text` | 유저에게 보여줄 짧은 문구 |
| `audit_tags` | 나중에 검색하기 위한 태그 |

## 트리거 종류

| 종류 | 용도 | 예시 |
| --- | --- | --- |
| `event_once` | 한 번만 발생하는 발견 | 첫 송출 기록 해석 |
| `state_threshold` | 상태값이 기준을 넘을 때 | 캠페인 농도 80 이상 |
| `behavior_repeated` | 같은 행동 반복 | 같은 로컬 3회 연속 출격 |
| `sequence_chain` | 순서 있는 행동 | 쇼핑몰 전단 회수 후 주택가 모델하우스 조사 |
| `absence_neglect` | 하지 않은 행동 누적 | 송출 이벤트 3회 무시 |
| `cross_local` | 로컬 간 연결 | 주택가 코어가 서비스 센터 로그를 엶 |
| `character_perspective` | 캐릭터별 해석 | 윤서로 주택가 2회 재방문 |
| `npc_state` | NPC 관계/상태 변화 | 팝시-제로 신뢰 2단계 |
| `trace_item` | 흔적 보관/소모/사용 | 불탄 가족사진 보관 |
| `boss_outcome` | 보스 처리 선택 | 결절 파괴, 기억 추출 |
| `population_state` | 보급소 인구 변화 | 해방 로봇 5기 유입 |
| `malice_actor` | 의도적 악의 개입 | 조작된 계약서 발견 후 누군가가 기록을 지움 |
| `observation_update` | 업데이트/관측 갱신 단위 변화 | 기존 로컬에 새 관측층 개방 |

## 행동 기억

반복 행동 트리거를 위해 전역 행동 기억을 둔다.

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

### 행동 기억 사용 예시

| 상태 | 조건 | 반응 |
| --- | --- | --- |
| `consecutive_local_runs.r01_suburb >= 3` | 외곽 주택가 3회 연속 출격 | “단골 고객님, 같은 행복을 또 찾으셨군요!” 배너 |
| `trace_preserve_streak >= 4` | 흔적 보관 4회 연속 | 기억 보관소 확장, 미나 대사 |
| `campaign_risk_accept_count >= 3` | 위험 카드 3회 선택 | 캠페인이 협력 고객 문구 출력 |
| `ignored_signal_events >= 2` | 송출 이벤트 2회 무시 | 다음 런에서 신호 이벤트가 더 적극적으로 출현 |
| `character_local_pair_count.pc_yunseo_001.r01_suburb >= 2` | 윤서로 주택가 2회 이상 | 윤서 전용 모델하우스 대사 |

## 우선순위

여러 트리거가 동시에 발생하면 아래 순서로 처리한다.

1. 보스 선택 직후 결과
2. 새 로컬 첫 발견
3. 새 송출 기록 또는 핵심 진행 단서
4. 캐릭터 전용 미스터리
5. NPC 개인 상태 변화
6. 반복 행동 반응
7. 지역 농도/재침식 반응
8. 일반 반복 대사

한 번에 너무 많은 반응을 보여주면 루즈해진다. 런 종료 후 핵심 반응은 1~2개만 출력하고, 나머지는 보급소 오브젝트나 출격 게시판 문구로 넘긴다.

## 반복 정책

| 정책 | 의미 | 사용처 |
| --- | --- | --- |
| `once` | 한 번만 발생 | 첫 기록 해석, 첫 보스 조우 |
| `repeat_with_cooldown` | 쿨다운 후 반복 | 지역 농도 경고 |
| `stage_repeat` | 1단계, 2단계, 3단계로 발전 | 캠페인 학습, NPC 신뢰 |
| `accumulative` | 누적치만 쌓이고 특정 시점에 반응 | 로봇 해방 수, 인간 구조 수 |
| `observation_reinterpretable` | 관측 갱신 때 기존 상태를 재해석 | 외곽 주택가 무음 라디오 관측층 |

## 발견 정책

| 정책 | 의미 |
| --- | --- |
| `direct` | 즉시 UI나 대사로 알림 |
| `hinted` | 광고 배너, 적 이름, 오브젝트 변화로 암시 |
| `delayed` | 다음 런 또는 보급소 귀환 후 공개 |
| `character_locked` | 특정 캐릭터 관점에서만 공개 |
| `recoverable_missed` | 놓쳤어도 다른 조건으로 나중에 발견 가능 |
| `hidden_until_chain` | 연쇄 시나리오 조건 전까지 숨김 |

## 연속 행동 트리거 예시

```text
id = "r01_suburb_regular_customer"
type = "behavior_repeated"
scope = "local:r01_suburb"
priority = 6
conditions_all:
  consecutive_local_runs.r01_suburb >= 3
blockers:
  local_outcome.r01_suburb == "silent_collapse"
repeat_policy = "stage_repeat"
cooldown_runs = 2
discovery_policy = "hinted"
effects:
  active_events += ["regular_customer_banner"]
  campaign_pressure +3
  unlock_hint = "same_house_wrong_name"
reveal_text = "단골 고객님, 같은 행복을 또 찾으셨군요!"
audit_tags = ["r01", "campaign_reads_player", "repeat_visit"]
```

```text
id = "global_trace_hoarder"
type = "behavior_repeated"
scope = "global"
priority = 5
conditions_all:
  trace_preserve_streak >= 5
repeat_policy = "stage_repeat"
cooldown_runs = 3
discovery_policy = "delayed"
effects:
  hub_stage_flags += ["memory_shelf_expanded"]
  npc_lines += ["mina_trace_hoarder_01"]
  trace_preservation +2
reveal_text = "보급소 한쪽 벽에 이름 없는 물건들이 줄을 맞춰 놓였다."
audit_tags = ["trace", "hub", "long_term_identity"]
```

```text
id = "r01_yunseo_model_home_echo"
type = "character_perspective"
scope = "character:pc_yunseo_001/local:r01_suburb"
priority = 4
conditions_all:
  character_local_pair_count.pc_yunseo_001.r01_suburb >= 2
  discovered_traces contains "trace_burnt_family_photo_001"
conditions_any:
  boss_outcome.r01_suburb == "extract_memory"
  broadcast_records contains "opening_inspection_sheet"
repeat_policy = "once"
discovery_policy = "direct"
effects:
  unlock_mystery_layer = "r01_yunseo_customer_blank"
  npc_lines += ["doyun_yunseo_blank_profile_01"]
reveal_text = "윤서의 고객 프로필은 아직 완성되지 않았다. 캠페인은 그 빈칸을 가족으로 채우려 한다."
audit_tags = ["yunseo", "r01", "character_layer"]
```

## 연쇄 시나리오 구조

연쇄 시나리오는 하나의 긴 퀘스트가 아니라 여러 트리거가 느슨하게 이어지는 구조가 좋다.

```text
ScenarioChain
  id
  title
  scope
  entry_triggers
  optional_steps
  required_steps
  branch_points
  fail_forward_rules
  final_states
```

### 설계 규칙

- 필수 단계는 적게 둔다.
- 선택 단계는 많게 둔다.
- 놓친 단계는 다른 로컬이나 다른 캐릭터로 우회 발견 가능하게 둔다.
- 연쇄 시나리오의 보상은 “정답 보상”보다 “세계 해석 변화”가 되어야 한다.
- 최종 상태는 하나가 아니라 2~4개로 나뉘어야 한다.

## 로컬 크기와 트리거 예산

트리거를 감당하려면 로컬 하나가 너무 작으면 안 된다. 작은 맵 하나에 모든 반응을 몰아넣으면 유저는 풍부함이 아니라 체크리스트를 느낀다.

### 로컬 하나의 최소 트리거 예산

| 범주 | 0.2 최소 | 장기 권장 |
| --- | --- | --- |
| 표면 발견 | 3개 | 8개 이상 |
| 반복 방문 반응 | 2개 | 6개 이상 |
| 캐릭터 전용 반응 | 1개 | 캐릭터당 2개 이상 |
| 흔적 기반 반응 | 3개 | 10개 이상 |
| NPC 연결 반응 | 2개 | NPC당 2~4개 |
| 보스 선택 후 변화 | 2개 | 선택당 4개 이상 |
| 다른 로컬 연결 | 1개 | 로컬당 3개 이상 |

0.2에서는 이 예산을 모두 구현하지 않아도 된다. 하지만 문서와 데이터 구조는 이 정도 확장을 받아낼 수 있어야 한다.

## 추가 콘텐츠 규칙

새 콘텐츠를 추가할 때는 아래를 반드시 정한다.

- 어느 로컬/캐릭터/NPC/흔적에 속하는가.
- 어떤 기존 상태값을 읽는가.
- 어떤 행동 기억을 증가시키는가.
- 다른 콘텐츠를 막는가, 늦추는가, 변형하는가.
- 유저가 놓쳤을 때 나중에 복구 가능한가.
- 전투, 보급소, 출격 게시판 중 어디에 드러나는가.
- 세계 자체의 반응인지, 누군가의 의도적 악의인지 구분되는가.

## 금지 방향

- 출격 횟수만 채우면 핵심 서사가 열리는 구조.
- 하나의 정답 루트를 따라가지 않으면 스토리가 끊기는 구조.
- 모든 반복 행동을 벌칙으로만 처리하는 구조.
- 트리거 이름만 다르고 실제 효과가 카드 해금뿐인 구조.
- 나중에 추가된 악역이 캠페인 세계 법칙 전체를 설명해버리는 구조.
- 작은 로컬에 너무 많은 대사를 넣어 전투 리듬을 끊는 구조.
