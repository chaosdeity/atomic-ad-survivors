# 10 RUMOR INFORMATION PROPAGATION CONTRACT V0.1

상태: **PRELOCK DATA CONTRACT / 실제 96-link graph 아님**

목표: 96 campaign을 완전 연결하지 않고 실제 사람·통신·물류·행정·지원·회수 기록의 인과가 있는 경우에만 정보가 이동하게 한다.

## 1. Link Contract

```yaml
rumor_link:
  source_campaign: E##_C##
  target_campaign: E##_C##
  channel: resident_movement | communications | logistics | broadcast | administrative_record | support_dependency | beacon_recovery_record
  direction: one_way | two_way
  information_classes: []
  fidelity: exact | summarized | noisy | biased
  latency_class: immediate | short | delayed | episodic
  trust_bias: trusted | neutral | skeptical | hostile
  allowed_effects:
    - attitude
    - alert_posture
    - checkpoint_scrutiny
    - negotiation_terms
    - service_access
    - patrol_preparedness
    - dialogue_expectation
```

## 2. Link 생성 Gate

최소 하나의 실제 causal channel이 있어야 한다.

- `resident_movement`
- `communications`
- `logistics`
- `broadcast`
- `administrative_record`
- `support_dependency`
- `beacon_recovery_record`

'같은 family', '가깝다', '플레이어가 유명하다'만으로 자동 link를 만들지 않는다.

## 3. Information Object

Direct Memory 자체를 복사하지 않고 전파용 정보 객체를 만든다.

```yaml
information_event:
  claim_class: <facility_incident | rescue | extraction | service_disruption | route_behavior | investigation | ...>
  source_campaign: E##_C##
  origin_scope: direct | networked | rumor
  event_time_or_order: <logical sequence/version>
  fidelity: exact | summarized | noisy | biased
  detail_loss: none | low | medium | high
  source_bias: neutral | institutional | survivor | service_provider | unknown
  contradiction_state: none | contradicted | superseded
```

## 4. 전달 중 가능한 변화

- DETAIL LOSS
- DISTORTION
- DELAY
- SOURCE BIAS

연속 relay를 거쳤다고 무조건 거짓이 되는 규칙은 두지 않는다. channel과 source provenance를 따른다.

## 5. 허용 효과

- NPC 태도
- 경계/alert posture
- 검문 강도
- 협상 조건
- 서비스 접근
- 순찰 준비 상태
- 질문/대사
- 플레이어에 대한 기대

## 6. Rumor 단독 금지 효과

- 시설 파괴/복구
- 실제 통로 개폐
- 물리 자원 증감
- 아이템 실제 이동
- 주민 순간 이동
- 정확한 사건 세부정보 자동 습득
- 전지적 보스 counter

## 7. Direct vs Rumor Conflict Resolution

```text
DIRECT OBSERVATION
> VERIFIED NETWORK RECORD
> TRUSTED RUMOR
> UNVERIFIED RUMOR
```

단순 점수화하지 않는다.

- 같은 claim/같은 시점에서는 Direct가 물리/현지 판단의 기준이다.
- 더 나중의 Verified Network Record가 후속 사건을 입증하면 오래된 Direct를 갱신할 수 있다.
- Rumor와 Direct가 충돌하면 rumor는 `contradicted`로 남길 수 있다.
- 캠페인 시스템이 Direct를 알아도 그 정보를 보지 못한 NPC는 rumor만 알고 있을 수 있다.

예:
- Rumor: “플레이어가 병원 서비스를 파괴한다.”
- Direct: “플레이어가 이 병원의 전력을 복구했다.”

해당 병원의 현재 직접 기억은 현지 판단에서 우선한다. 외부 NPC는 이전 rumor만 알아 경계가 늦게 바뀔 수 있다.

## 8. 엔진 비의존 예시

### A. 시설 파괴 → 주민 이동 → 검문 강화
1. A에서 시설 파괴가 Direct Memory.
2. 서비스 중단으로 주민이 B 방향으로 실제 이동.
3. `resident_movement`가 `service_disruption`을 summarized로 전달.
4. B는 자기 시설을 자동 변경하지 않음.
5. B는 `checkpoint_scrutiny`, `dialogue_expectation`만 조정.

### B. 주민 구조 → 다른 campaign 태도 변화
1. 구조를 A가 직접 관측.
2. 구조된 주민이 B로 이동.
3. 주민 진술이 noisy/summarized rumor로 전달.
4. B NPC의 attitude/negotiation이 달라질 수 있음.
5. B의 물리 자원은 자동 변경되지 않음.

### C. 인양 실패 → recovery record
1. A local에서 extraction 실패.
2. beacon/recovery system이 실패 기록 저장.
3. 기록 접근권이 있는 B로 `beacon_recovery_record` 전달.
4. B는 verified network record를 가질 수 있음.
5. B가 작전 준비나 service access를 보수적으로 바꿀 수 있으나 A beacon을 원격으로 자동 수리/파괴하지 않음.

## 9. 완전 연결 그래프 방지

- 모든 campaign pair에 기본 link를 만들지 않는다.
- link가 없으면 rumor도 이동하지 않는다.
- global broadcast도 information class와 송출 범위를 검사한다.
- 실제 96 campaign link graph는 이번 작업에서 생성하지 않는다.
