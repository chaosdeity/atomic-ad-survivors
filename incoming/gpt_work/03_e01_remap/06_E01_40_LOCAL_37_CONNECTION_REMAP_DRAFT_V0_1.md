# 06 E01 40 Local / 37 Connection Remap Draft V0.1

상태: E01 REMAP DRAFT
목표: 기존 40 Local과 37 Connection을 FINAL GLOBAL WORLD STRUCTURE LOCK V0.2 계층 아래 한 장의 Production 구조로 다시 정렬한다.
제약: Local 삭제/추가/개명 없음. Edge 추가/삭제 없음. Unreal 구현 없음.

## 0. Canonical hierarchy

GLOBAL
→ SECTOR E01
→ CAMPAIGN E01_C01~E01_C08
→ LOCAL R01~R08-L01~L05

E01의 Local은 global node가 아니다.

| Campaign | Local set | count |
|---|---|---:|
| E01_C01 | R01-L01~R01-L05 | 5 |
| E01_C02 | R02-L01~R02-L05 | 5 |
| E01_C03 | R03-L01~R03-L05 | 5 |
| E01_C04 | R04-L01~R04-L05 | 5 |
| E01_C05 | R05-L01~R05-L05 | 5 |
| E01_C06 | R06-L01~R06-L05 | 5 |
| E01_C07 | R07-L01~R07-L05 | 5 |
| E01_C08 | R08-L01~R08-L05 | 5 |
| 합계 |  | 40 |

## 1. E01_C01 가족 / 세대 / 입주

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R01-L01 침묵 가장자리 | P0 | 첫 주거 출격/경계 | HIGH. RPG34 current first field slice | old 108 rule 제거 후 current quest law로 node contract 재작성 |
| R01-L02 분양 주택 루프 | P0 | 주거 반복/입주 기록 | HIGH. RPG35 후속 분양 주택 기록 대조와 의미 연속 | exact node boundary, resource/persistence profile |
| R01-L03 모델하우스 결절 | P0 | 첫 boss/family suitability | FUTURE. RPG35까지 boss 미구현 | boss placement, non-timer unlock, gameplay law |
| R01-L04 배수로 침묵 주머니 | P1 | 차폐/숨은 회수 | NONE-YET | Unreal semantic anchor와 목적 기반 활동 정의 |
| R01-L05 가짜 귀환로 | P1 | 재방문/거짓 귀환 | NONE-YET | current voluntary-return 구조와 충돌하지 않는 함정 의미 재정의 |

주요 기존 connections:
- R01-L01 → R01-L02
- R01-L02 → R01-L03
- R01-L02 → R01-L04
- R01-L03 → R01-L05
- cross: R01-L05 → R03-L01
- cross: R01-L03 → R02-L01

현재 해석:
- L01→L02 progression 의미는 current quest chain에 맞춰 조건부 보존 가능.
- L02→L03의 old early boss unlock은 REMAP.
- L04/L05는 future Production Fill.

## 2. E01_C02 의료 / 환자 / 진료

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R02-L01 응급 접수 홀 | P1 | 환자 등록/의료 진입 | NONE-YET | C02 gameplay law, recognition fields |
| R02-L02 장기 입원동 | P1 | 장기 치료/구출 윤리 | NONE-YET | service dependency/resource ecology |
| R02-L03 보험 심사 약국 | P1 | 진료 entitlement/약품 | NONE-YET | resource flow, access rule |
| R02-L04 격리문 복도 | P2 | quarantine/오염 | NONE-YET | C02 내부 conflict와 persistence |
| R02-L05 퇴원 불가 병동 | P2 | 의료 최종 심사 | NONE-YET | boss/event가 아니라 campaign law로 먼저 정의 |

주요 기존 connections:
- R02-L01 → R02-L02 → R02-L03
- R02-L03 → R02-L04 → R02-L05
- ingress legacy: R01-L03 → R02-L01

## 3. E01_C03 반품 / custody / 회수

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R03-L01 반품 접수 야드 | P1 | 반품/custody 진입 | NONE-YET | current logistics gameplay law |
| R03-L02 자동 분류장 | P1 | sorting/flow | NONE-YET | movement vs process distinction |
| R03-L03 보증 심사 창고 | P1 | warranty/custody/parts | NONE-YET | cross-C04 dependency |
| R03-L04 파쇄 전 대기라인 | P2 | old time-limited recovery | NONE-YET | fixed-time behavior 제거 후 목적/상태 압력 재설계 |
| R03-L05 최종 반품 심사실 | P2 | final return/custody judgment | NONE-YET | persistence/resource outcome |

주요 기존 connections:
- R03-L01 → R03-L02 → R03-L03
- R03-L03 → R03-L04 → R03-L05
- ingress legacy: R01-L05 → R03-L01
- cross legacy: R03-L03 → R04-L01

## 4. E01_C04 정품 / 수리 / 충전

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R04-L01 폐충전소 | P1 | charging/operability 진입 | NONE-YET | actual service dependency |
| R04-L02 배터리 침전 공장 | P1 | energy/industrial damage | NONE-YET | resource ecology |
| R04-L03 리콜 펌웨어실 | P1 | validity/repair/re-sync | NONE-YET | recognition/gameplay law |
| R04-L04 폐기 프레스 라인 | P2 | repair failure/disposal | NONE-YET | state consequence |
| R04-L05 재동기화 코어 | P2 | final validity/resync | NONE-YET | campaign resolution without generic boss repetition |

주요 기존 connections:
- R04-L01 → R04-L02 → R04-L03
- R04-L03 → R04-L04 → R04-L05
- ingress legacy: R03-L03 → R04-L01

## 5. E01_C05 방송 / source / authority

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R05-L01 수신탑 외곽 | P2 | source/broadcast 진입 | NONE-YET | C05 distinct gameplay law |
| R05-L02 반복 뉴스 스튜디오 | P2 | edited source/record | NONE-YET | authority verification |
| R05-L03 추천 서버실 | P2 | source/recommendation data | NONE-YET | resource ecology without currency abstraction |
| R05-L04 빈 관객석 공개홀 | P2 | audience/authority presentation | NONE-YET | non-repetitive activity |
| R05-L05 마지막 앵커 송출실 | P2 | final broadcast procedure | NONE-YET | persistence + direct memory/rumor split |

주요 기존 connections:
- R08-L03 → R05-L01
- R05-L01 → R05-L02 → R05-L03 → R05-L04 → R05-L05
- type는 remote_signal. Sector Relay나 physical route로 승격하지 않음.

## 6. E01_C06 멤버십 / 결제 / entitlement

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R06-L01 회원 게이트 거리 | P1 | membership gate | NONE-YET | ingress/visibility dependency부터 필요 |
| R06-L02 포인트 거래 골목 | P1 | account/entitlement abuse | NONE-YET | access/resource law |
| R06-L03 리뷰 키오스크 광장 | P1 | loyalty/reputation | NONE-YET | recognition/persistence |
| R06-L04 VIP 라운지 | P2 | tier access | NONE-YET | player choice consequence |
| R06-L05 블랙프라이데이 홀 | P2 | payment/membership final procedure | NONE-YET | distinct final activity |

주요 기존 connections:
- R06-L01 → R06-L02 → R06-L03
- R06-L03 → R06-L04 → R06-L05
- 원본 37 edge에 R06-L01 외부 ingress가 없음. 새 edge는 이번 draft에서 만들지 않음.

## 7. E01_C07 통행 / 검역 / transfer

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R07-L01 검역 게이트 | P2 | passage/quarantine 진입 | NONE-YET | E01 travel relation과 Local gameplay 분리 |
| R07-L02 냉동 컨테이너 야드 | P2 | transfer/cold custody | NONE-YET | resource/route state |
| R07-L03 수하물 오분류 터미널 | P2 | transfer misclassification | NONE-YET | recognition law |
| R07-L04 밀수 통행로 | P2 | unofficial passage/rumor | NONE-YET | rumor causal channel |
| R07-L05 마지막 출항 관리탑 | P2 | final passage/transfer control | NONE-YET | route persistence / Sector travel boundary |

주요 기존 connections:
- R07-L01 → R07-L02 → R07-L03 → R07-L04 → R07-L05
- type는 blockade.
- 원본 37 edge에 R07-L01 외부 ingress가 없음. Final Lock Sector Relay와 혼동하지 않음.

## 8. E01_C08 비상보급 / shelter / survival capacity

중요: R08 침묵권은 현재 생존자 운영 예외 공간이다. E01_C08의 historical relief/shelter infrastructure와 관계가 있지만 현재 “광고 캠페인 운영 hub”로 쓰지 않는다.

| Local | Priority | 기존 역할 | 현재 Unreal relevance | Production Fill gap |
|---|---|---|---|---|
| R08-L01 침묵 보급소 | P0 | survivor hub/settlement | HIGH-SPATIAL. Unreal candidate 존재 | 실제 gameplay integration, resource/persistence profile |
| R08-L02 역송출 주유소 | P0 | recovery equipment | MEDIUM. world_structure 제작 순서 존재 | Local Beacon/Recovery Line/Sector Relay 역할 분리 |
| R08-L03 폐역 무음 플랫폼 | P1 | silence network/remote signal | NONE-YET | local access vs signal visibility |
| R08-L04 민방위 저장고 | P1 | shelter/supply capacity | NONE-YET | resource ecology |
| R08-L05 가짜 구조 신호탑 | P2 | internal crisis/false rescue | NONE-YET | rumor/direct signal/persistence |

주요 기존 connections:
- R08-L01 → R08-L02
- R08-L02 → R08-L03
- R08-L03 → R08-L04
- R08-L04 → R08-L05
- cross: R08-L02 → R01-L01
- cross remote_signal: R08-L03 → R05-L01

## 9. Exact 37 Connection set

아래는 원본 JSON의 37개를 phase/type별로 그대로 재정렬한 것이다.

P0 main, 4:
1. R08-L01 → R08-L02
2. R08-L02 → R01-L01
3. R01-L01 → R01-L02
4. R01-L02 → R01-L03

P1 branch, 15:
5. R01-L02 → R01-L04
6. R01-L03 → R01-L05
7. R08-L02 → R08-L03
8. R08-L03 → R08-L04
9. R01-L05 → R03-L01
10. R03-L01 → R03-L02
11. R03-L02 → R03-L03
12. R01-L03 → R02-L01
13. R02-L01 → R02-L02
14. R02-L02 → R02-L03
15. R03-L03 → R04-L01
16. R04-L01 → R04-L02
17. R04-L02 → R04-L03
18. R06-L01 → R06-L02
19. R06-L02 → R06-L03

P2 boss_branch, 8:
20. R03-L03 → R03-L04
21. R03-L04 → R03-L05
22. R02-L03 → R02-L04
23. R02-L04 → R02-L05
24. R04-L03 → R04-L04
25. R04-L04 → R04-L05
26. R06-L03 → R06-L04
27. R06-L04 → R06-L05

P2 remote_signal, 5:
28. R08-L03 → R05-L01
29. R05-L01 → R05-L02
30. R05-L02 → R05-L03
31. R05-L03 → R05-L04
32. R05-L04 → R05-L05

P2 blockade, 4:
33. R07-L01 → R07-L02
34. R07-L02 → R07-L03
35. R07-L03 → R07-L04
36. R07-L04 → R07-L05

P2 internal_crisis, 1:
37. R08-L04 → R08-L05

Count: 4 + 15 + 8 + 5 + 4 + 1 = 37.

## 10. Remap draft 판정

현재 유지:
- 8 Campaign × 5 Local 계층.
- 40 Local ID/name/priority inventory.
- 37 source edge 집합.
- R01은 E01_C01 Local slice.
- R08은 E01_C08 historical infrastructure와 연결되지만 current survivor silence zone layer를 분리.

현재 재해석:
- R01 L01/L02를 fixed-time run이 아니라 current RPG quest/exploration flow에 맞춤.
- R01-L03 boss를 current first 15 minutes에서 분리.
- R08-L02 recovery 역할을 Final Lock Relay/Beacon/Recovery 분리에 맞춰 재감사.
- cross-Campaign legacy edge를 visibility/unlock/physical travel로 분리.

Production Fill gap:
- Campaign 6-field 완성.
- R06/R07 ingress와 physical travel graph.
- Sector Relay / Local Beacon / Recovery Line 실제 anchor.
- C01 boss의 current quest placement.
- resource ecology/persistence class.
- C02~C07 current Unreal local implementation.
