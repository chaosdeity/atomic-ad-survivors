# 03 E01 37 Connection Audit V0.1

상태: source-exact edge audit
원본: data/world/e01_world_map_nodes_v0_1.json
원칙: 37개를 추정하거나 보충하지 않는다. JSON에 있는 정확한 37개만 감사한다.

## 0. 결론

- 원본 edge 수: 37
- 감사 edge 수: 37
- 임의 추가: 0
- 임의 삭제: 0
- 이 37개는 “Local 간 기존 map connection 집합”이다.
- Final Lock의 Sector Relay / Local Beacon / Recovery Line 역할과 동일한 그래프로 간주하지 않는다.
- 특히 remote_signal은 정보/가시성 관계일 수 있으며 Sector Relay가 아니다.
- R06-L01과 R07-L01은 원본 37 edge 안에서 외부 ingress가 없다. 따라서 현 JSON만으로 E01 전체 physical travel graph가 완결됐다고 볼 수 없다. 이 공백을 이번 작업에서 새 edge로 메우지 않는다.

## 1. 37 Connection audit

표의 travel requirement는 현재 자료가 물리 이동을 실제로 요구하는지에 대한 감사다. “미확정”은 edge 삭제가 아니라 Production Fill 필요를 뜻한다.

| # | source | target | connection_type | existing_reason | campaign_boundary_crossing | visibility requirement | travel requirement | current validity |
|---:|---|---|---|---|---|---|---|---|
| 1 | R08-L01 | R08-L02 | P0/main | 옛 시작 hub → 인양 장비/출격 준비 | NO | P0 선명 | current 공간 관계는 가능 | REMAP |
| 2 | R08-L02 | R01-L01 | P0/main | 옛 인양 기준점 → 첫 주거 출격 | YES C08→C01 | P0 선명 | 최신 RPG는 quest-driven entry. 필수 물리 gate는 미확정 | REMAP |
| 3 | R01-L01 | R01-L02 | P0/main | 첫 주거 slice → 분양 주택 후속 | NO | current quest progression으로 노출 가능 | exact node travel은 미확정, progression 의미는 살아 있음 | KEEP_CONDITIONAL |
| 4 | R01-L02 | R01-L03 | P0/main | 분양 주택 → 첫 boss | NO | boss unlock은 후속 | 최신 RPG35에서 boss 앞당김 금지 | REMAP |
| 5 | R01-L02 | R01-L04 | P1/branch | 주거 재방문 → 배수로 침묵 pocket | NO | legacy P1 signal | 미확정 | REVIEW_NEEDED |
| 6 | R01-L03 | R01-L05 | P1/branch | boss 이후 가짜 귀환로 | NO | legacy P1 signal | boss 자체 current 미구현 | REVIEW_NEEDED |
| 7 | R08-L02 | R08-L03 | P1/branch | 인양 장비 → silence network 확장 | NO | legacy P1 signal/interpret | 미확정 | REVIEW_NEEDED |
| 8 | R08-L03 | R08-L04 | P1/branch | 폐역 중계 → shelter/supply 저장고 | NO | legacy P1 | 미확정 | REVIEW_NEEDED |
| 9 | R01-L05 | R03-L01 | P1/branch | 가짜 귀환/반품 단서 → 물류 회수축 | YES C01→C03 | legacy unlock clue | physical travel 미확정 | REMAP |
| 10 | R03-L01 | R03-L02 | P1/branch | 반품 접수 → 자동 분류 | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 11 | R03-L02 | R03-L03 | P1/branch | 분류 → 보증/custody 심사 | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 12 | R01-L03 | R02-L01 | P1/branch | 가족/보호자 단서 → 의료축 | YES C01→C02 | legacy unlock clue | physical travel 미확정 | REMAP |
| 13 | R02-L01 | R02-L02 | P1/branch | 응급 접수 → 장기 치료 | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 14 | R02-L02 | R02-L03 | P1/branch | 장기 치료 → 보험/약품 | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 15 | R03-L03 | R04-L01 | P1/branch | 보증/부품 단서 → 충전/repair축 | YES C03→C04 | legacy unlock clue | physical travel 미확정 | REMAP |
| 16 | R04-L01 | R04-L02 | P1/branch | 충전 → 배터리/산업 | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 17 | R04-L02 | R04-L03 | P1/branch | 배터리 → firmware/repair | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 18 | R06-L01 | R06-L02 | P1/branch | membership gate → 거래/broker | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 19 | R06-L02 | R06-L03 | P1/branch | 거래 → review/reputation | NO | campaign progression | future intra-campaign travel 후보 | KEEP_CONDITIONAL |
| 20 | R03-L03 | R03-L04 | P2/boss_branch | 보증 심사 → 폐기 전 custody 압력 | NO | P2 후속 | old 시간제한 role 제거 후 재설계 필요 | REVIEW_NEEDED |
| 21 | R03-L04 | R03-L05 | P2/boss_branch | 폐기 대기 → 최종 반품 심사 | NO | P2 boss progression | 미확정 | REVIEW_NEEDED |
| 22 | R02-L03 | R02-L04 | P2/boss_branch | 약품/보험 → 격리 | NO | P2 후속 | 미확정 | REVIEW_NEEDED |
| 23 | R02-L04 | R02-L05 | P2/boss_branch | 격리 → 퇴원 심사 boss | NO | P2 boss progression | 미확정 | REVIEW_NEEDED |
| 24 | R04-L03 | R04-L04 | P2/boss_branch | firmware/repair → 폐기 press | NO | P2 후속 | 미확정 | REVIEW_NEEDED |
| 25 | R04-L04 | R04-L05 | P2/boss_branch | 폐기 press → resync core | NO | P2 boss progression | 미확정 | REVIEW_NEEDED |
| 26 | R06-L03 | R06-L04 | P2/boss_branch | review/reputation → VIP | NO | P2 후속 | 미확정 | REVIEW_NEEDED |
| 27 | R06-L04 | R06-L05 | P2/boss_branch | VIP → payment/membership boss | NO | P2 boss progression | 미확정 | REVIEW_NEEDED |
| 28 | R08-L03 | R05-L01 | P2/remote_signal | silence network에서 broadcast source 감지 | YES C08→C05 | remote visibility signal | physical travel로 보지 않음 | KEEP_CONDITIONAL |
| 29 | R05-L01 | R05-L02 | P2/remote_signal | broadcast outer → studio source | NO | remote/source progression | physical travel 미확정 | KEEP_CONDITIONAL |
| 30 | R05-L02 | R05-L03 | P2/remote_signal | studio → recommendation/source data | NO | remote/source progression | physical travel 미확정 | KEEP_CONDITIONAL |
| 31 | R05-L03 | R05-L04 | P2/remote_signal | source data → public hall | NO | remote/source progression | physical travel 미확정 | KEEP_CONDITIONAL |
| 32 | R05-L04 | R05-L05 | P2/remote_signal | public hall → main broadcast | NO | remote/source progression | physical travel 미확정 | KEEP_CONDITIONAL |
| 33 | R07-L01 | R07-L02 | P2/blockade | quarantine gate → cold transfer yard | NO | P2 blockade progression | future local travel 후보 | KEEP_CONDITIONAL |
| 34 | R07-L02 | R07-L03 | P2/blockade | cold transfer → baggage classification | NO | P2 blockade progression | future local travel 후보 | KEEP_CONDITIONAL |
| 35 | R07-L03 | R07-L04 | P2/blockade | misclassification → unofficial passage | NO | P2 blockade progression | future local travel 후보 | KEEP_CONDITIONAL |
| 36 | R07-L04 | R07-L05 | P2/blockade | unofficial passage → final transfer control | NO | P2 blockade progression | future local travel 후보 | KEEP_CONDITIONAL |
| 37 | R08-L04 | R08-L05 | P2/internal_crisis | shelter/supply pressure → false rescue signal crisis | NO | P2 internal crisis | physical route/trigger 미확정 | REVIEW_NEEDED |

## 2. Boundary crossing 감사

원본 37개 중 Campaign boundary를 넘는 edge는 아래 5개다.

1. R08-L02 → R01-L01, C08→C01
2. R01-L05 → R03-L01, C01→C03
3. R01-L03 → R02-L01, C01→C02
4. R03-L03 → R04-L01, C03→C04
5. R08-L03 → R05-L01, C08→C05

이 5개를 Sector Relay로 승격하지 않는다.

- 2, 9, 12, 15는 옛 P0/P1 unlock/progression과 물리 이동 의미가 섞여 있다.
- 28은 type 자체가 remote_signal이므로 정보 가시성 관계로 우선 해석한다.
- Final Lock의 Campaign visibility/dependency와 Local travel connection은 별도 필드로 재구성해야 한다.

## 3. Graph completeness 주의

원본을 그대로 보존하면 다음이 보인다.

- R06 내부 chain은 R06-L01에서 시작하지만 다른 Campaign으로부터 들어오는 원본 edge가 없다.
- R07 내부 chain은 R07-L01에서 시작하지만 다른 Campaign으로부터 들어오는 원본 edge가 없다.
- 따라서 37개 집합은 “모든 Local에 실제 도보/차량으로 도달하는 완전 travel topology”라고 증명할 수 없다.
- 이번 단계에서는 38번째/39번째 edge를 만들지 않는다.
- Production Fill에서 visibility dependency, campaign unlock, physical travel, Relay 접근을 분리한 뒤 별도 PM 결정이 필요하다.

## 4. Final Lock travel 역할과의 분리

- Sector Relay: Global/sector 이동 역할. 37 Local edge에서 자동 추론 금지.
- Local Beacon: Local sortie access 역할. 기존 R08-L02나 각 node를 자동 Beacon으로 승격 금지.
- Recovery Line + Beacon: Extraction. 108초 타이머와 동일하지 않다.
- remote_signal: 정보/가시성 edge. Relay가 아니다.
- blockade/boss_branch/main/branch: 기존 map edge type이며 물리 이동인지 unlock인지 현재 자료만으로 동일하게 볼 수 없다.

## 5. 감사 결과

- 정확한 37 edge 확보: PASS
- edge 임의 추가: 0
- edge 임의 삭제: 0
- Local edge / Sector Relay 분리: PASS
- physical travel 완결성: REVIEW_NEEDED
- R06 ingress: REVIEW_NEEDED
- R07 ingress: REVIEW_NEEDED
