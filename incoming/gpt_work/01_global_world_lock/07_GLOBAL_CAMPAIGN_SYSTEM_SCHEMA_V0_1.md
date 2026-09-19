# 07 GLOBAL CAMPAIGN SYSTEM SCHEMA V0.1

상태: **PRELOCK DATA CONTRACT / 최종 LOCK 아님**

목적: 96개 campaign을 지금 전부 세부 설계하는 것이 아니라, production entry 전에 모든 campaign이 같은 최소 질문에 답하도록 만드는 데이터 계약을 정의한다.

## 1. Campaign 최소 상위 schema

```yaml
campaign_id: E##_C##
sector_id: E01..E12
campaign_family: C01..C08

display_name: <current user-facing campaign name>
display_name_history:
  current_name: <same as display_name>
  aliases: []
  change_reason: <nullable>
  changed_at_or_version: <nullable/version label>

regional_secondary_collapse: <campaign-specific collapse statement>
infrastructure_anchor: <physical infrastructure anchor>
gameplay_law: <player-facing systemic rule>
human_recognition_rule: <how this campaign recognizes people/roles>

resource_ecology:
  resources_or_capacity: []
  consumers: []
  response_cost: []
  depletion_effect: []
  support_sources: []
  support_targets: []

persistence_profile:
  remember: []
  retention: {}
  visibility: {}
  propagation: {}
  gameplay_effects: []

visibility_state: unobserved | remote_detected | partially_restored | sortie_available | truth_restored

travel_access:
  remote_signal_state: unknown | remote_detected | decoded
  relay_state: none | relay_candidate | relay_established | degraded
  beacon_state: none | candidate | beacon_fixed | degraded | contaminated
  sortie_state: locked | sortie_available | active
  extraction_state: unavailable | available | extraction_degraded | blocked
```

상위 필드는 여기서 늘리지 않는다. 필요한 세부는 `resource_ecology`, `persistence_profile`, `travel_access` 내부에 넣는다.

## 2. ID Contract

- `campaign_id`: `E##_C##`, 96개 고정.
- `sector_id`: `E01~E12`.
- `campaign_family`: `C01~C08`.
- `campaign_id`는 display name과 독립된 영구 식별자다.
- ID 추가/삭제/sector 이동/family 재배열 금지.

### display_name_history

```yaml
display_name_history:
  current_name: "현재 표시명"
  aliases:
    - "과거 표시명"
  change_reason: "변경 이유"
  changed_at_or_version: "문서 버전 또는 변경 식별자"
```

실제 timestamp 인프라는 이번 범위가 아니다. 이름이 바뀌어도 같은 `campaign_id`의 역사를 추적하는 것이 목적이다.

## 3. Differentiation 6필드

- `regional_secondary_collapse`: 해당 campaign의 인프라가 장기적으로 어떤 2차 붕괴를 겪어 현재 규칙으로 굳었는가.
- `infrastructure_anchor`: 이동, 서비스, 조사, 전투, 회수 중 하나 이상에 실제 영향을 주는 물리 인프라.
- `gameplay_law`: 플레이어가 해당 campaign에서 배우고 이용하거나 거슬러야 하는 고유 규칙.
- `human_recognition_rule`: 캠페인이 인간을 어떤 서비스 역할/등록 상태로 읽는가.
- `resource_ecology`: 무엇을 소비하며 고갈 시 무엇이 멈추는가.
- `persistence_profile`: 무엇을 기억하고 누구에게 보이며 어떤 인과 링크로 간접 정보가 전파되고 gameplay에서 무엇까지 바꾸는가.

## 4. resource_ecology 최소 계약

```yaml
resource_ecology:
  resources_or_capacity:
    - <resource/capacity class>
  consumers:
    - <service/NPC/system>
  response_cost:
    - response: <response class>
      consumes: <resource/capacity>
  depletion_effect:
    - <service/route/NPC/system degradation>
  support_sources:
    - <campaign IDs or link criteria>
  support_targets:
    - <campaign IDs or link criteria>
```

반드시 답해야 한다.

1. 이 캠페인은 무엇을 실제로 소비하는가?
2. 누구에게 서비스하는가?
3. 대응할 때 무엇이 소모되는가?
4. 고갈되면 무엇이 멈추는가?
5. 외부 지원을 어디서 받을 수 있는가?
6. 누구를 지원할 수 있는가?

수치 밸런스는 이번 단계에서 고정하지 않는다.

## 5. persistence_profile 최소 계약

```yaml
persistence_profile:
  remember:
    - event_class: <facility_change | npc_outcome | extraction | investigation | route_use | ...>
      scope: direct | networked | rumor | none

  retention:
    class: session | short | long | structural
    reset_condition: <optional>

  visibility:
    direct_knowers: []
    verified_network_knowers: []
    rumor_eligible_knowers: []

  propagation:
    link_types: []
    information_classes: []
    fidelity: exact | summarized | noisy | biased
    latency_class: immediate | short | delayed | episodic

  gameplay_effects:
    - attitude
    - alert_posture
    - checkpoint_scrutiny
    - negotiation_terms
    - service_access
    - patrol_preparedness
    - dialogue_expectation
```

`direct | networked | rumor | none`은 event 단위 scope tag이며 campaign 최상위 필드로 추가하지 않는다.

### Physical state gate

- Direct Memory는 실제 물리 상태를 보존할 수 있다.
- Network/Rumor Memory는 정보 상태이며 물리 상태를 자동 변경하지 않는다.
- 다른 campaign의 물리 변화에는 별도의 사람/물자/서비스/행정/장치 인과가 필요하다.

## 6. Direct vs Rumor 충돌 규칙

기본 우선순위:

```text
DIRECT OBSERVATION
> VERIFIED NETWORK RECORD
> TRUSTED RUMOR
> UNVERIFIED RUMOR
```

숫자 점수로 합산하지 않는다.

- 같은 claim과 같은 시간대에서는 Direct가 물리/현지 판단의 기준이다.
- 더 나중의 Verified Network Record가 후속 사건을 증명하면 오래된 Direct를 갱신할 수 있다.
- Rumor가 Direct와 충돌하면 rumor는 `contradicted`로 남길 수 있다.
- Direct를 Rumor로 그대로 복사하지 않고 fidelity/latency/bias를 거친 별도 정보 객체로 만든다.
- campaign 시스템이 Direct를 알아도 그 정보를 보지 못한 NPC는 rumor만 알고 있을 수 있다.

## 7. visibility_state

1. `unobserved`
2. `remote_detected`
3. `partially_restored`
4. `sortie_available`
5. `truth_restored`

이 상태는 HUD 디자인이 아니라 정보 접근 권한 계약이다.

## 8. travel_access 최소 계약

```yaml
travel_access:
  remote_signal_state: unknown | remote_detected | decoded
  relay_state: none | relay_candidate | relay_established | degraded
  beacon_state: none | candidate | beacon_fixed | degraded | contaminated
  sortie_state: locked | sortie_available | active
  extraction_state: unavailable | available | extraction_degraded | blocked
```

- `sortie_available`에는 최소 `decoded signal + relay_established + beacon_fixed`가 필요하다.
- extraction은 sortie와 별도 상태다.
- 정보는 신체 이동보다 먼저 갈 수 있다.
- 무료 순간이동은 없다.

## 9. production entry gate

production entry 전에 최소 다음을 확인한다.

- 6 differentiation fields가 `DEFINED` 또는 사용자 승인된 `PARTIAL`.
- gameplay_law가 같은 family의 기존 campaign과 실제 플레이에서 구별됨.
- `resource_ecology.depletion_effect` 존재.
- `persistence_profile`이 Direct/Rumor를 구분.
- travel이 필요한 campaign은 `travel_access` 상태를 가짐.
- `display_name_history` 구조 존재.
