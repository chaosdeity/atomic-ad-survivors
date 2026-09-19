# 32 E01 C02 Local Role Mapping V0.1

상태: **E01_C02 LOCAL ROLE MAPPING**
대상: R02-L01~R02-L05
구현 상태: **NOT UNREAL IMPLEMENTATION**

## 0. 원칙

5 Local의 ID/name은 기존 canonical을 그대로 사용한다.

현재 R02 Unreal 구현 근거가 없으므로 CURRENT를 남발하지 않는다.
- CANONICAL_SUPPORTING: canonical Local/source role이 Production contract를 지지함.
- FUTURE_PRODUCTION_FILL: 역할 방향은 정의하지만 실제 gameplay/runtime 구현은 후속.

proof 사건, 수치, 등장인물, 결말은 Local role로 승격하지 않는다.

## 1. Mapping

| Local | historical/source role | current Production role | production_status | recognition role | service/resource role | investigation role | persistence candidate | implementation_status |
|---|---|---|---|---|---|---|---|---|
| R02-L01 응급 접수 홀 | 병원 응급 접수/환자 등록 Local | actual patient state와 intake/eligibility record를 대조하는 care-entry anchor | **CANONICAL_SUPPORTING** | patient / care recipient | diagnostic/registration service, care staff/service capacity | 현재 care need, 등록 patient status, available service 비교 | verified intake/eligibility state, important service choice, revisit | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R02-L02 장기 입원동 | 장기 입원/요양·회복 병동 Local | actual condition과 long-term-care record, bed/treatment capacity를 대조하는 anchor | **CANONICAL_SUPPORTING** | long-term care subject / patient | bed/treatment capacity, care staff/service capacity | 실제 상태와 장기 관리 record mismatch 확인 | verified care state, capacity observation, service decision, revisit | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R02-L03 보험 심사 약국 | 약국/보험 심사 Local | care eligibility와 medicine availability를 대조하는 service anchor | **CANONICAL_SUPPORTING** | insured / eligible care subject | medicine/medical supply, registration/service availability | eligibility claim과 actual medicine/service availability 비교 | verified eligibility/supply state, important allocation decision, revisit | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R02-L04 격리문 복도 | 감염/격리 구역 Local | actual isolation need와 registered isolation status/capacity를 대조하는 anchor | **FUTURE_PRODUCTION_FILL** | isolation subject | isolation capacity, diagnostic/service availability | isolation record, actual condition, actual capacity cross-check | verified isolation state, service hold/reallocation decision, revisit | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R02-L05 퇴원 불가 병동 | 퇴원 심사/병동 Local | discharge eligibility, actual condition, care/transfer support를 대조하는 anchor | **FUTURE_PRODUCTION_FILL** | discharge-eligible subject / care recipient | discharge service, transport/transfer support, care capacity | discharge record와 actual condition/capacity 비교 | verified discharge state, service decision, revisit consequence | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |

## 2. Local boundary

### R02-L01

접수/등록은 현재 건강 상태 그 자체가 아니다.
patient record와 actual condition/service availability의 mismatch를 조사한다.

### R02-L02

장기 입원 여부를 선악 판정으로 단순화하지 않는다.
실제 care need, record, finite care capacity의 관계가 핵심이다.

proof의 특정 환자, 가족 치료, 합의 결말은 사용하지 않는다.

### R02-L03

보험/eligibility는 medicine을 생성하는 권한이 아니다.
eligible = true와 medicine/service available = true를 분리한다.

### R02-L04

격리 status는 actual isolation need와 다를 수 있다.
record만으로 physical isolation facility를 변경하지 않는다.

### R02-L05

퇴원 가능 여부는 actual condition과 실제 care/transfer support를 함께 본다.
E02식 예약 시간, 번호표, 대기 순번을 주 law로 만들지 않는다.

## 3. Persistence boundary

모든 Local은 STANDARD 후보 범위 안에서 다음을 저장할 수 있다.
- 조사 상태.
- 확인한 patient/service record.
- verified capacity/service state.
- 중요한 선택.
- revisit consequence.

하지만 STRUCTURAL physical persistence는 잠그지 않는다.

## 4. Graph preservation

기존 C02 source refs:
- 12 R01-L03 → R02-L01
- 13 R02-L01 → R02-L02
- 14 R02-L02 → R02-L03
- 22 R02-L03 → R02-L04
- 23 R02-L04 → R02-L05

이번 mapping:
- new source pair = **0**
- new visibility edge = **0**
- new physical edge = **0**
- new dependency edge = **0**

## 5. Result

- R02-L01: CANONICAL_SUPPORTING.
- R02-L02: CANONICAL_SUPPORTING.
- R02-L03: CANONICAL_SUPPORTING.
- R02-L04: FUTURE_PRODUCTION_FILL.
- R02-L05: FUTURE_PRODUCTION_FILL.
- CURRENT Unreal implementation claim: **0**.
- proof canonization: **0**.

판정: **E01_C02 LOCAL ROLE MAPPING DEFINED**.
