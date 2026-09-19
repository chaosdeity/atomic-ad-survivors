# 41 E01 C04 Local / Persistence Mapping V0.1

상태: **E01_C04 LOCAL / PERSISTENCE MAPPING**
대상: R04-L01~R04-L05
구현 상태: **NOT UNREAL IMPLEMENTATION**

## 0. 원칙

5 Local의 ID/name은 canonical을 그대로 사용한다.

현재 R04 Unreal 구현 근거가 없으므로 CURRENT로 승격하지 않는다.

각 Local은 C04의 validity / authentication / charging / diagnosis / repair / operability family 안에서만 해석한다. C03 custody/logistics gameplay는 분리한다.

## 1. Mapping

| Local | device/service role | human recognition relation | resource role | investigation role | persistence candidate | C03 boundary risk | production_status | implementation_status |
|---|---|---|---|---|---|---|---|---|
| R04-L01 폐충전소 | charging availability / device service condition | registered owner / authorized operator / service claimant | power/energy, charging capacity, diagnostic availability | actual device condition과 charging/service record 비교 | verified charging/service state, important service choice, revisit | LOW: return/destination flow로 확장하지 않음 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R04-L02 배터리 침전 공장 | battery/energy condition / safe processing service | authorized operator / maintenance custodian | energy support, safe processing/cooling, maintenance capacity | actual battery/device condition과 maintenance/service state 비교 | verified condition/capacity, isolate/service decision, revisit | LOW: storage/transport logistics가 primary가 아님 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R04-L03 리콜 펌웨어실 | recall / firmware / validation / service state | recall recipient / service claimant / authorized operator | firmware/validation service, diagnostic capacity, maintenance support | recall/firmware record와 actual operability 교차검증 | verified recall/validation state, diagnosis, service decision, revisit | MEDIUM: recall item custody/release로 변형 금지 | **CANONICAL_SUPPORTING** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R04-L04 폐기 프레스 라인 | operability / repairability / service failure 이후 device treatment 판단 | service claimant / maintenance custodian | repair parts, maintenance, safe processing capacity | repair/isolate/restore 가능성과 actual service failure 검증 | verified repairability, treatment decision, revisit | **HIGH: custody destination/폐기 flow를 primary gameplay로 만들지 않음** | **FUTURE_PRODUCTION_FILL** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |
| R04-L05 재동기화 코어 | operability / synchronization / service restoration candidate | authorized operator / maintenance custodian / recall recipient | validation/firmware service, power, maintenance, operability support | synchronization/service state와 actual operability 비교 | verified restoration state, important choice, revisit consequence | MEDIUM: release/destination 결말로 변형 금지 | **FUTURE_PRODUCTION_FILL** | **NOT IMPLEMENTED / FUTURE PRODUCTION FILL** |

## 2. Local boundary

### R04-L01
핵심은 charging availability와 actual device service condition이다. 물건의 인수/반품/목적지를 정하는 Local로 바꾸지 않는다.

### R04-L02
핵심은 energy / battery / safe processing capacity다. 정확한 화학 수치, 공정량, 냉각 수치 등은 창작하지 않는다.

### R04-L03
핵심은 recall / firmware / validation / service state다. recall이라는 이유로 C03식 custody/release workflow를 만들지 않는다.

### R04-L04
C04 의미:
- operability
- repairability
- service failure 이후 treatment 판단

C03 금지 의미:
- custody destination
- 반품/회수 flow
- 폐기 물류 routing

### R04-L05
핵심은 operability / synchronization / service restoration candidate다. 기존 Local role 이상으로 새로운 서사 결말을 확정하지 않는다.

## 3. Local persistence

STANDARD 후보:
- verified device condition
- verified validity/recall/service state
- diagnosis result
- verified charging/repair/maintenance availability
- important isolate/repair/charge/restore decision
- revisit consequence

STRUCTURAL은 자동 잠그지 않는다.

특히 다음은 별도 evidence 전까지 persistent structural change가 아니다.
- 충전소 영구 복구
- 공장 영구 파괴/수리
- 대규모 설비 교체
- 장기 parts/energy stock 구조
- 건물/도로 영구 변화

## 4. Information boundary

허용:
- charging availability information
- recall/firmware information
- repair/diagnostic availability
- maintenance/service status
- operability support information

금지:
- rumor만으로 charging 완료
- rumor만으로 repair 완료
- rumor만으로 power/parts 생성
- rumor만으로 device condition 변경

## 5. Graph preservation

기존 C04 source refs:
- 15 R03-L03 → R04-L01
- 16 R04-L01 → R04-L02
- 17 R04-L02 → R04-L03
- 24 R04-L03 → R04-L04
- 25 R04-L04 → R04-L05

source 15는 progression source이며 C03→C04 dependency가 아니다.

이번 mapping:
- new source pair = **0**
- new visibility edge = **0**
- new physical edge = **0**
- new dependency edge = **0**

## 6. Result

- R04-L01: CANONICAL_SUPPORTING.
- R04-L02: CANONICAL_SUPPORTING.
- R04-L03: CANONICAL_SUPPORTING.
- R04-L04: FUTURE_PRODUCTION_FILL / C03 HIGH-RISK boundary locked.
- R04-L05: FUTURE_PRODUCTION_FILL.
- CURRENT Unreal implementation claim: **0**.
- C03 gameplay absorption: **0**.

판정: **E01_C04 LOCAL / PERSISTENCE MAPPING DEFINED**.
