# 61 E01 Information / Rumor Cross Audit V0.1

상태: FINAL INFORMATION / RUMOR CROSS-AUDIT
범위: E01_C01~E01_C08
구현 상태: AUDIT ONLY

## 0. Verdict

- Direct Memory와 Rumor/Information 분리: PASS
- all-to-all rumor: 0
- rumor-only physical mutation: 0
- C05 information significance: HIGH
- C07 route/passage information significance: HIGH
- C01/C04: Direct state 중심
- 판정: PASS

## 1. Campaign matrix

| Campaign | Direct Memory 우선 대상 | Rumor 허용 대상 | 허용 causal channel | rumor가 바꿀 수 있는 것 | rumor가 절대 바꾸면 안 되는 것 |
|---|---|---|---|---|---|
| C01 | 조사한 household/occupancy/receipt record, quest/checkpoint, choice, return/report | household/occupancy/receipt/service availability 정보 | resident movement, communications, administrative record, support/beacon/recovery record 중 실제 근거가 있는 것 | player/NPC의 정보 기대, 추가 조사 필요성, service claim의 신뢰도 | 문/통로 물리 상태, stock, facility damage/repair, service capacity, route, geometry |
| C02 | actual patient condition, verified eligibility/capacity, isolation/discharge verification | care availability, transfer, isolation, medicine, discharge 정보 | communications, medical/administrative record, logistics/transfer, actual movement | care claim의 신뢰도, 재검증 우선순위, 정보 기반 준비 | bed capacity, medicine stock, patient condition, isolation facility, transfer route |
| C03 | actual custody, receipt, claimant, destination, processing state | claimant, pickup/recovery, destination/return, hold/release status | logistics, communications, processing record, actual person/item movement | custody claim의 신뢰도와 조사 방향 | actual custody, item location, warehouse capacity, transport 생성, release 완료 |
| C04 | actual device condition, validity/service record, diagnosis, service availability | charging, repair/diagnostics, recall/firmware, maintenance, operability-support 정보 | communications, service/maintenance record, 실제 service network | 어떤 device/service를 재검증할지, service claim 신뢰도 | device condition, power, charging capacity, parts stock, repair 완료, facility state |
| C05 | original source, archive, transformation chain, authority state, verified/unverified state | broadcast content, retransmission, source credibility claim, 외부 interpretation | communications, broadcast, administrative record, resident movement, recovery/beacon record, actual source delivery | trust/withhold/expose/redirect-information 판단, presentation/authority 기대 | transmitter/facility 작동, physical route, stock, transmission capacity 자체 |
| C06 | account, entitlement/tier, transaction, review/reputation, actual service availability | merchant/service reputation, review credibility, benefit/account-status 정보 | communications, commercial/administrative record, actual service interaction | access claim 검증 우선순위, reputation/benefit 정보의 신뢰도 | actual entitlement, inventory, service capacity, access gate physical state |
| C07 | inspection, quarantine/clearance, transfer stage, manifest, actual route availability | route safety, inspection intensity, departure, quarantine, unofficial passage 정보 | communications, manifest/administrative record, traveler movement, actual transport/service reporting | 준비, 질문, 검사 강도 기대, route candidate의 정보 신뢰도 | physical route open, quarantine release, transport 생성, gate state, transfer slot 생성 |
| C08 | actual need/capacity, eligibility/allocation, service availability, signal credibility | rescue signal, route safety, shelter/relief availability, evacuation status | resident movement, communications, emergency/administrative record, recovery/beacon record | allocation/evacuation 정보의 신뢰도, 준비와 재검증 우선순위 | actual stock, generator repair, bed count, route open, facility damage/repair |

## 2. Significance profile

- C05 HIGH: Campaign primary law 자체가 source provenance와 authority transformation이다. Rumor/Information이 gameplay 중심이지만 Direct verified provenance보다 우선하지 않는다.
- C07 HIGH: route/passsage 정보는 실제 선택에 큰 영향을 주지만 physical route와 transfer capacity는 별도 evidence가 필요하다.
- C08 MEDIUM-HIGH: rescue/shelter/relief 정보가 allocation 판단에 중요하나 actual survival capacity와 분리된다.
- C02/C03/C06 MEDIUM: service/custody/entitlement claim을 보조하는 정보 채널이다.
- C01/C04 LOW-MEDIUM: 핵심은 직접 확인한 residential/device state이며 rumor는 보조 정보다.

## 3. Global prohibition check

- all-to-all rumor graph 생성: 0
- Direct Memory를 전 세계 NPC에 자동 복제: 0
- rumor가 Direct를 자동 overwrite: 0
- rumor로 physical/service state mutation: 0
- remote_signal을 physical travel/dependency로 승격: 0

최종 판정: INFORMATION / RUMOR CROSS-AUDIT PASS.
