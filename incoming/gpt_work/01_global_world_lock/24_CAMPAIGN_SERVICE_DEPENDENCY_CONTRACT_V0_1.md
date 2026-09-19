# 24 CAMPAIGN SERVICE DEPENDENCY CONTRACT V0.1

상태: **CANONICAL PRELOCK DATA CONTRACT / 실제 96-link graph 아님**

목표: campaign을 독립 섬으로 만들지 않되 전 세계 자동 연결 simulation도 만들지 않는다.

이 계약은 새 top-level field가 아니다. `resource_ecology` 내부에 둔다.

## 최소 구조

```yaml
resource_ecology:
  dependency_contract:
    - provider: E##_C## | infrastructure_ref
      consumer: E##_C## | infrastructure_ref
      resource_or_service: <power | food | medicine | communications | fuel | transport | ...>
      dependency_strength: supporting | important | critical
      failure_effect: <bounded downstream service degradation>
      recovery_condition: <physical/service condition>
      propagation_channel: support_dependency | logistics | communications | administrative_record
```

필수:
- provider
- consumer
- resource_or_service
- dependency_strength
- failure_effect
- recovery_condition
- propagation_channel

## dependency_strength

- `supporting`: 없어도 핵심 서비스는 유지되지만 비용/대기/위험이 상승.
- `important`: 일부 기능·capacity가 실제로 감소하고 대체선이 필요.
- `critical`: 명시된 서비스가 중단되거나 안전한 운용이 불가능.

숫자 하나로 전 세계 의존성을 simulation하지 않는다.

## 생성 Gate

dependency는 최소 하나의 실제 infrastructure 관계가 있어야 한다.

허용 근거:
- 물리 배전/발전 연결
- 실제 물류·보급 노선
- 의료 공급/이송 연결
- 연료 공급과 convoy/extraction의 직접 관계
- 실제 통신 relay/방송/기록망
- 공식 행정/서비스 연계

금지 근거:
- 같은 family라서
- 같은 sector라서
- 지도상 가깝다는 이유만으로
- “세계관상 연결될 법해서”
- 플레이어 평판/rumor만으로

## 대표 예시

### POWER → medical capacity
provider 전력/마이크로그리드 → consumer 의료 서비스. 전력 실패는 진료 장비/냉장/야간 capacity를 감소시킬 수 있다. 복구에는 전력 source 복구 또는 검증된 대체전원 연결이 필요하다.

### LOGISTICS → food / medicine
실제 stock 이동 corridor가 있을 때만 연결한다. 실패 시 stock arrival/throughput이 줄며 rumor만으로 재고가 변하지 않는다.

### COMMUNICATION → remote information
실제 relay/network가 있을 때만 remote information fidelity/latency에 영향을 준다. 통신 실패는 시설을 자동 파괴하지 않는다.

### FUEL → convoy / extraction
실제 차량/회수선이 연료를 소비할 때만 convoy/extraction capacity에 영향을 준다.

## Failure Propagation

```text
PHYSICAL/SERVICE FAILURE
→ VALIDATED DEPENDENCY EDGE
→ BOUNDED DOWNSTREAM DEGRADATION
→ persistence of actual changed state
→ optional information propagation
```

- downstream effect는 edge에 명시된 service 범위를 넘지 않는다.
- cascade가 필요하면 다음 edge도 별도로 유효해야 한다.
- rumor propagation과 service dependency를 같은 것으로 취급하지 않는다.
- 정보가 먼저 도달해 preparation을 바꿀 수는 있지만 physical state는 별도 인과가 있어야 한다.

## Recovery

recovery는 다음 중 실제 원인이 있어야 한다.
- provider 물리 복구
- 대체 provider 연결
- stock/service 실제 전달
- route 복구
- admin/service authorization + 실제 resource 확보

“소문이 복구되었다고 알려짐”만으로 service capacity를 회복시키지 않는다.

## production entry 최소조건

해당 campaign이 외부 service를 쓰거나 제공한다면:
1. provider/consumer가 명시되거나 `none justified`가 기록되어야 한다.
2. strength는 supporting/important/critical 중 하나.
3. failure_effect는 물리/서비스 범위로 한정.
4. recovery_condition 존재.
5. propagation_channel이 실제 causal channel인지 검증.

현재 PRELOCK은 계약만 잠근다. 96개의 dependency edge를 생성하지 않는다.
