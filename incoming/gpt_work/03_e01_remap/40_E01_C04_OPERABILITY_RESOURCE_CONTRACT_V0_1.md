# 40 E01 C04 Operability / Resource Contract V0.1

상태: **E01_C04 OPERABILITY / RESOURCE CONTRACT**
Campaign: E01_C04 정품 / 수리 / 충전
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence class: **STANDARD**
STRUCTURAL: **NOT LOCKED**
정확한 resource quantity: **NOT LOCKED**

## 0. 목적

E01_C04의 validity, authentication, diagnosis, charging, repair, operability, recall/service state와 이를 제한하는 power / charging / parts / diagnostic / maintenance / validation service capacity의 인과를 Production contract로 정의한다.

공통 법칙:
resource/service availability
→ diagnose / charge / repair 가능 여부
→ operability consequence

C03 custody/logistics 영역은 침범하지 않는다.

## 1. Device / service state contract

### validity
- 등록된 validity/authenticity state와 actual device condition을 대조한다.
- validity record는 service 판단의 근거가 될 수 있으나 actual operability를 자동 생성하지 않는다.

### authentication
- 장치와 service record를 검산하고 registered owner/operator/service claimant 관계를 확인한다.
- authentication은 device의 실제 condition을 대신하지 않는다.

### diagnosis
- actual device condition, diagnostic service availability, record와 current operability의 mismatch를 확인한다.
- 진단이 가능해야 charge / repair / isolate / restore 판단을 근거 있게 할 수 있다.

### charging
- 실제 power / energy availability, charging capacity, actual device condition을 확인한다.
- record상 충전 대상이어도 실제 power/capacity가 없으면 charging service는 제한된다.

### repair
- 실제 repair parts, maintenance capacity, diagnosis result, safe processing 조건을 확인한다.
- repair는 실제 parts/service가 있을 때만 성립하며 record만으로 완료되지 않는다.

### operability
- actual machine state, diagnosis 결과, charging/repair/validation 결과를 바탕으로 판단한다.
- operability consequence는 실제 service/resource condition에 의해 결정된다.

### recall / service state
- recall / firmware / maintenance / validation record를 actual device condition과 대조한다.
- stale recall/service state는 service를 잘못 허용하거나 거부할 수 있다.

## 2. Resource / service categories

| category | availability/state | degradation meaning | recovery meaning | operability consequence |
|---|---|---|---|---|
| power / energy | 실제 사용 가능한 energy service | 충전/작동 지원 제한 | 실제 energy availability 회복 근거 필요 | charging/operation 제한 |
| charging capacity | 실제 충전 service 처리 가능성 | eligible device도 충전 불가/제한 | 실제 charging service 회복 | charge 가능 여부 변화 |
| repair parts | 실제 수리 가능한 부품 availability | repairability가 있어도 수리 실행 제한 | 실제 parts 확보 근거 필요 | repair 가능 여부 변화 |
| diagnostic service capacity | actual diagnosis 수행 가능성 | 상태 검증이 어려워 service 판단 보류 | 실제 diagnostic service 회복 | diagnose/isolate/repair 판단 제한 |
| maintenance capacity | 실제 점검/수리 service 수행 가능성 | 유지보수/복구 제한 | 실제 maintenance availability 회복 | operability restoration 제한 |
| firmware / validation service | recall/firmware/validity 검산 service | record와 current state 검증 제한 | 실제 validation service 회복 | service allow/deny 판단 변화 |
| safe processing / cooling capacity | battery/device를 안전하게 처리할 실제 capacity | charge/repair/처리 조건 제한 | 실제 safe-processing availability 회복 | isolate/repair/charge 조건 변화 |
| operability support | 실제 작동 지속에 필요한 supporting service | 복구 후 안정 운용 제한 | 실제 support availability 회복 | restored state 유지 가능성 변화 |

정확한 수치, 최대치, 재생 주기, 처리량은 잠그지 않는다.

## 3. Human recognition relation

주 recognition axes:
- registered owner
- authorized operator
- service claimant
- maintenance custodian
- recall recipient

핵심 mismatch:
actual human-device/service relationship
≠
registered owner/operator/claimant/custodian/recall state

device validity 자체는 인간 recognition이 아니다.

## 4. Official service / refusal consequence

### official service path
validity / recall / maintenance / firmware record가 검증되면 diagnosis/charging/repair/restore의 공식 service path와 owner/operator/service claimant 관계를 검산할 수 있다.

하지만 record가 actual device condition 또는 실제 capacity를 자동 변경하지 않는다.

### bypass / refusal path
stale 또는 모순된 record를 그대로 따르지 않으면 actual condition, diagnosis, service capacity를 추가 확인해야 한다.

alternate path는 실제 power/parts/maintenance/validation availability가 있을 때만 허용한다.

무료 power, 무료 charging, 무료 repair, 무료 diagnosis를 생성하지 않는다.

## 5. C03 exclusion

C04 allowed:
- validity
- authentication
- diagnosis
- charging
- repair
- operability
- recall/service state
- power/parts/diagnostic/maintenance/validation capacity

C03 excluded:
- custody
- receipt
- return
- claim destination
- hold/release
- recovery logistics
- item destination flow

특히 R04-L04의 폐기 의미를 custody destination gameplay로 바꾸지 않는다.

## 6. Direct Memory / STANDARD persistence

STANDARD Direct Memory 후보:
- verified device condition
- verified validity/recall/firmware/service state
- diagnosis result
- verified charging/repair/maintenance availability
- important isolate/repair/charge/restore decision
- revisit consequence

재방문 시 이미 검증한 service record와 diagnosis, 이전 service decision과 결과를 참조할 수 있다. 더 최신의 verified state가 있으면 오래된 record를 갱신할 수 있다.

## 7. Rumor / Information boundary

Rumor candidates:
- charging availability
- repair/diagnostic availability
- recall/firmware information
- maintenance/service status
- operability support information

금지:
- rumor로 actual device condition 변경
- rumor로 power/parts 생성
- rumor로 charging/repair 완료
- rumor로 facility capacity 증가
- all-to-all service rumor

## 8. STRUCTURAL exclusion

STRUCTURAL physical persistence = **NOT LOCKED**

자동 포함 금지:
- 공장 영구 파괴
- 충전소 영구 수리
- 대규모 설비 교체
- 장기 재고 구조 변화
- 건물/도로 영구 변화
- 대규모 인구/상권 재편

## 9. Dependency boundary

cross_campaign_dependency = **NONE_LOCKED**

- Common Campaign Dependency Graph rows = 0.
- source 15 R03-L03 → R04-L01은 progression source.
- source pair는 dependency evidence가 아니다.
- new dependency edge = 0.

## 10. Contract result

- validity: **DEFINED**
- authentication: **DEFINED**
- diagnosis: **DEFINED**
- charging: **DEFINED**
- repair: **DEFINED**
- operability: **DEFINED**
- recall/service state: **DEFINED**
- resource/service causality: **DEFINED**
- C03/C04 boundary: **DEFINED**
- persistence: **STANDARD**
- STRUCTURAL: **NOT LOCKED**
- exact quantity invention: **0**
- Unreal implementation: **0**

판정: **E01_C04 OPERABILITY / RESOURCE CONTRACT DEFINED**.
