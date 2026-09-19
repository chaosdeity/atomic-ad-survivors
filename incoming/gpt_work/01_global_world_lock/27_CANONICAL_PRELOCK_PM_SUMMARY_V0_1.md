# 27 CANONICAL PRELOCK PM SUMMARY V0.1

상태: **PM 승인용 1-page summary / FINAL LOCK 아님**

## 지금 확정된 것

- E01~E12 × C01~C08 = 96 Campaign ID 고정
- ID immutable / Display Name은 production entry 전 제한 변경 가능 / alias-history 필수
- Global Visibility 5단계 유지
- E01 40 local은 global node가 아니며 GLOBAL→SECTOR→CAMPAIGN→LOCAL 유지
- Campaign 상위 differentiation 6필드 유지
- Direct Memory ≠ Rumor Memory
- Rumor는 causal channel 필요, rumor-only physical mutation 금지
- Global Travel은 Sector=Relay / Local sortie=Beacon / Extraction=Recovery Line+Beacon

## 최신 감사로 추가된 것

최신 109-audit의 service / 등록 대가 / 거부 비용 / 의존성 / 영구 세계변화 질문을 새 top-level field 없이 흡수했다.

- service → gameplay_law + resource_ecology
- 등록 대가 → gameplay_law + human_recognition_rule
- 거부 비용 → gameplay_law + resource_ecology
- dependency → resource_ecology.dependency_contract
- persistent world effect → persistence_profile class/physical state

Family boundary도 추가로 잠갔다.

- C03/C04: **PASS**
- C07/C08: **PASS**
- C01/C06: **PASS**
- C05: **PARTIAL, non-blocking**

C05는 family anti-repeat rule은 충분히 잠겼고, 12개 campaign의 개별 gameplay 값만 production entry에서 채우면 된다.

## 이전 PRELOCK에서 유지된 것

Previous PRELOCK의 6개 위험군은 폐기하지 않았다.

- Medical
- Customs
- Port Recovery
- Broadcast
- Residential
- C08

이들은 campaign-to-campaign differentiation gate로 유지되고, 이번 family-to-family gate와 함께 이중 검증한다.

## RECOVER 4 역할

World System:
- campaign-logic
- map-evolution-proof
- mystery-proof

Tech Pipeline:
- motion-proof

motion-proof는 Blender/GLB/Unreal 제작 QA reference이며 world rule에 섞지 않는다.

실제 RECOVER, binary 이동, DELETE 실행은 이번 작업에서 0이다.

## Service Dependency

resource_ecology 내부 계약으로 잠갔다.

필수:
provider / consumer / resource_or_service / dependency_strength / failure_effect / recovery_condition / propagation_channel

strength:
supporting / important / critical

실제 infrastructure relation이 있어야 하며 all-to-all global simulation은 금지한다.

## Persistence Scope

persistence_profile 내부 semantic class:
- NONE
- LIGHT
- STANDARD
- STRUCTURAL

저장 용량 등급이 아니라 어떤 gameplay/physical state가 재방문에도 지속되는지를 나타낸다.

96개 전부의 class를 지금 채우지 않는다. 근거가 충분한 campaign만 후보값을 둘 수 있다.

## 아직 제작 단계에서 열려 있는 것

- 96 campaign 각각의 service/dependency 세부값
- 96 campaign 각각의 persistence class
- C05 12지역의 개별 source/authority/recognition/transformation/resource law
- 실제 rumor link graph
- 실제 relay/beacon 좌표
- E01 40 local 상세 재연결
- E02~E12 local 제작
- Unreal 플레이 맵/implementation
- 실제 RECOVER 실행

이 미완성들은 상위 구조 결함이 아니라 production fill 항목이다.

## Final LOCK으로 올려도 되는가

Canonical PRELOCK 기준:
- schema locked enough: YES
- family boundary locked enough: YES
- latest audit structural conflict: NONE
- HOLD gate: 0
- main write: 0
- E02~E12 new local: 0

**PRELOCK STATUS: READY**

**FINAL LOCK RECOMMENDATION: PROCEED**

단, Final Lock 파일은 이번 작업에서 생성하지 않는다. PM 승인 후 별도 단계에서 진행한다.
