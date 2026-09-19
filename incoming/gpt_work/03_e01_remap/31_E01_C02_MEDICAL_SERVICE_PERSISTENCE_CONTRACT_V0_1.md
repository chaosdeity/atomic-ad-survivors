# 31 E01 C02 Medical Service / Persistence Contract V0.1

상태: **E01_C02 MEDICAL SERVICE / PERSISTENCE CONTRACT**
Campaign: E01_C02 의료 / 환자 / 진료
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence class: **STANDARD**
STRUCTURAL: **NOT LOCKED**
정확한 resource quantity: **NOT LOCKED**

## 0. 목적

E01_C02의 medical service categories, finite capacity, degradation/recovery, recognition mismatch, registration/refusal consequence, Direct Memory, Rumor boundary를 하나의 Production contract로 고정한다.

공통 법칙:
availability
→ care/service 가능 여부
→ gameplay consequence

## 1. Medical service categories

| category | capacity meaning | degradation meaning | recovery meaning | recognition / registration consequence |
|---|---|---|---|---|
| bed / treatment capacity | 실제 환자를 수용하거나 처치할 수 있는 유한 service capacity | record상 대상이어도 실제 수용/처치가 제한 | 실제 공간/service 회복 근거가 있을 때 복구 | patient/long-term-care status와 actual capacity를 분리해 판단 |
| medicine / medical supply | 실제 사용할 수 있는 약품·의료물자 availability | care eligibility가 있어도 필요한 supply가 없으면 service 제한 | 실제 resupply/recovery evidence 필요 | insured/eligible status가 stock을 생성하지 않음 |
| care staff / service capacity | 실제 진료·관찰·지원 절차를 수행할 수 있는 service availability | 절차가 남아 있어도 실제 service 수행 범위가 축소 | 실제 service availability 회복 근거 필요 | registered patient status만으로 무한 service를 생성하지 않음 |
| isolation capacity | 실제 격리/분리 care를 유지할 수 있는 capacity | isolation record와 실제 공간/지원 상태가 어긋날 수 있음 | 실제 isolation service 회복 근거 필요 | isolation-subject record와 actual condition을 대조 |
| diagnostic / registration service availability | 현재 상태와 기존 record를 확인·검증하는 service availability | stale record 또는 검증 불가 상태가 증가 | 검증 가능한 service/record source가 회복될 때 개선 | registration은 current health truth와 동일하지 않음 |
| transport / transfer support | 실제 이송/전원/퇴원 후 이동을 지원할 수 있는 availability | discharge/transfer record가 있어도 실제 이동이 제한 | 실제 transport/support 근거 필요 | discharge-eligible status가 transport를 자동 생성하지 않음 |

정확한 숫자, 재생 주기, 최대치, 소모량은 후속 gameplay/production evidence 전까지 잠그지 않는다.

## 2. Recognition mismatch

핵심 식:
actual condition / actual care need / actual capacity
≠
registered patient / eligibility / isolation / discharge state

player는 최소 다음을 구분한다.
- 실제 환자 상태.
- 시스템이 저장한 patient/service status.
- 현재 service eligibility.
- 현재 실제 capacity.
- 현재 가능한 service outcome.

등록 record가 오래되었거나 틀릴 수 있다는 사실 자체가 자동 정답을 만들지는 않는다. 서로 다른 record와 current observation을 대조해야 한다.

## 3. Registration / refusal consequence

### registration path

기존 patient/eligibility/isolation/discharge record를 사용할 경우:
- medical service path를 확인할 수 있다.
- service priority/eligibility claim을 검증할 수 있다.
- 현재 capacity와 충돌하면 잘못된 배정 또는 보류가 드러날 수 있다.

### refusal / bypass path

기존 record의 판정을 그대로 받아들이지 않을 경우:
- 일부 institutional path를 바로 사용하지 못할 수 있다.
- current condition, alternate verified record, actual capacity를 추가 확인해야 할 수 있다.
- 다른 service path가 실제 availability를 갖는 경우에만 우회가 성립한다.

금지:
- 거부하면 자동 사망.
- 거부하면 무한 자원 손실.
- 예약/번호표 순번을 핵심 페널티로 만드는 구조.
- 무료 대체 service 생성.

## 4. Degradation / recovery law

service degradation은 실제 availability 변화 또는 verified service mismatch에 의해 발생한다.

허용:
- supply 부족으로 특정 service 제한.
- staff/service availability 저하로 처리 범위 제한.
- isolation capacity 부족으로 service 재배치 필요.
- transfer support 부재로 discharge/transfer path 제한.
- stale registration service 때문에 추가 검증 필요.

recovery는 실제 service/resource evidence가 있을 때만 성립한다.

금지:
- rumor만으로 capacity 복구.
- eligibility flag만으로 medicine/bed 생성.
- proof의 특정 시설 또는 치료 장치를 E01_C02 정사로 승격.

## 5. Direct Memory

STANDARD Direct Memory 후보:
- 확인한 patient/service record.
- verified actual condition.
- verified care eligibility.
- verified bed/treatment/medicine/service availability.
- isolation/discharge status verification.
- important maintain/bypass/reallocate/hold decision.
- revisit investigation state.

Direct Memory는 현재 확인한 실제 상태의 player knowledge와 중요한 선택을 보존한다.

정보 우선순위:
DIRECT OBSERVATION
> VERIFIED NETWORK RECORD
> TRUSTED RUMOR
> UNVERIFIED RUMOR

## 6. Rumor / Information boundary

Rumor candidates:
- care availability.
- patient transfer information.
- isolation status.
- medicine availability.
- discharge status.

허용 causal channels 후보:
- communications.
- administrative/medical record.
- logistics/transfer.
- resident/patient movement where actual movement evidence exists.

Rumor는 service/resource state에 대한 claim일 수 있으나 physical state가 아니다.

금지:
- rumor로 병상 증가/감소.
- rumor로 약품 stock 생성/삭제.
- rumor로 환자 physical condition 변경.
- rumor로 격리문 physical state 변경.
- rumor로 transfer route 생성.
- all-to-all medical rumor.

## 7. STANDARD persistence

STANDARD로 지속 가능한 것:
- 중요한 조사 진행.
- 검증된 patient/service status.
- 검증된 eligibility/capacity state.
- 중요한 service decision.
- return/report 진행 상태.
- revisit consequence.

재방문:
- 이미 확인한 record를 처음부터 미확인으로 되돌리지 않는다.
- 검증한 availability/unavailability를 player knowledge로 보존할 수 있다.
- 이전 service decision의 후속 반응을 참조할 수 있다.
- 더 최신의 verified state가 있으면 오래된 record를 갱신할 수 있다.

## 8. STRUCTURAL exclusion

STRUCTURAL physical persistence = **NOT LOCKED**

자동 포함 금지:
- 시설 영구 파괴.
- 병상 수의 장기 구조 변경.
- 의료창고/약품 재고의 무기한 변화.
- 도로/transfer route 영구 변경.
- 대규모 주민/환자 이동.
- facility repair/damage 영구 확정.

이 항목은 실제 Production/Gameplay evidence 후 별도 PM 검토 대상이다.

## 9. Dependency boundary

cross_campaign_dependency = **NONE_LOCKED**

- Common Campaign Dependency Graph rows = 0.
- R01-L03 → R02-L01은 historical progression source.
- 실제 provider/consumer/resource/failure/recovery 근거가 없다.
- new dependency edge = 0.

## 10. Contract result

- medical service categories: **DEFINED**
- capacity meaning: **DEFINED**
- degradation: **DEFINED**
- recovery: **DEFINED WITHOUT EXACT QUANTITY**
- recognition mismatch: **DEFINED**
- registration/refusal consequence: **DEFINED**
- Direct Memory: **DEFINED**
- Rumor boundary: **DEFINED**
- persistence: **STANDARD**
- STRUCTURAL: **NOT LOCKED**
- proof canonization: **0**
- Unreal implementation: **0**

판정: **E01_C02 MEDICAL SERVICE / PERSISTENCE CONTRACT DEFINED**.
