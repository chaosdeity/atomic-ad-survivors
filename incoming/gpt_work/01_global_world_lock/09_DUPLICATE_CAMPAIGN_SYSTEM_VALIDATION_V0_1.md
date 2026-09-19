# 09 DUPLICATE CAMPAIGN SYSTEM VALIDATION V0.1

상태: **CANDIDATE_LOCK 재검증 완료 / 최종 세계관 LOCK 아님**

## Authority

- CONFIRMED: 공식 기준 문서 근거.
- USER_LOCKED: 사용자 확정 구조 원칙.
- CANDIDATE_LOCK: 중복 제거에 필요한 최소 제작 계약으로 이번 PRELOCK에서 후보화.

`13_CAMPAIGN_DIFFERENTIATION_CANDIDATE_LOCK_V0_1.md`의 상세값을 기준으로 재검증했다.

## 1. 의료 대기

- E02_C02: 예약/번호표/야간 진료의 시간·순번 질서.
- E05_C02: 병상/처치/약품/이송의 다중 병목 우선순위.
- resource depletion과 direct memory가 다름.
- rumor channel도 E02의 행정/통신 중심과 E05의 주민 이동/지원 dependency 중심으로 갈림.

판정: **DEFINED_CANDIDATE**

## 2. 통관

- E03_C07: 대량 자동 분류 + 항만/고속철.
- E07_C07: 표준 문서 + 철도/환승 slot.
- E12_C07: convoy + 연료/트럭/하역 + 국경도로.
- recognition/resource/memory/rumor path가 서로 다름.

판정: **DEFINED_CANDIDATE**

## 3. 항만 회수

- E03_C03: 자동 분류/반품 category.
- E08_C03: custody/보관/반출 권한.
- E11_C03: 공식 소유권 vs 비공식 시장 claim.
- E12_C03: 회수량과 지역 생존 resource dependency.
- '항구에서 물건 찾기' 4종으로 수렴하지 않도록 ownership judge와 depletion effect를 분리함.

판정: **DEFINED_CANDIDATE**

## 4. 방송 / 안내

- E02_C05: 빠른 재난명령/반복 갱신, context loss.
- E07_C05: 검증된 공영 source chain, 상대적 정확성 + update delay.
- E12_C05: 이동형/저전력 relay, coverage gap + 왜곡.
- rumor contract의 fidelity/latency 차이와 직접 연결.

판정: **DEFINED_CANDIDATE**

## 5. 주거 / 가족

- E01_C01: 가족/세대/보호자 역할과 주거·식량·홈케어 접근.
- E09_C01: 소유권/보험/커뮤니티 자격과 공용 서비스 접근.
- 같은 사람을 평가하는 질문 자체가 다름.

판정: **DEFINED_CANDIDATE**

## 6. C08

12개 C08 각각에 다음을 최소 candidate lock으로 부여했다.

- primary survival resource
- physical shelter type
- communication constraint
- human recognition
- depletion consequence
- persistence/rumor pattern

이 값은 기존 campaign schema 내부에 매핑되며 새 최상위 field가 아니다.

핵심 분리:
- E01: 침묵/회수선/비상물자
- E02: 지하 방재비축/대피 capacity
- E03: 지하 distribution branch
- E04: 고지대 물/비축
- E05: 공동 급수 throughput
- E06: 물 + 냉방/에너지
- E07: 표준 방공/구호 stock
- E08: 오래된 저장공간 개방/보존
- E09: 공공 shelter network
- E10: 산악 무전/beacon power
- E11: 공동체 음식/구호 hub
- E12: 우물 + 곡물

판정: **DEFINED_CANDIDATE**

## 7. 전체

| 위험군 | 재검증 |
|---|---|
| 의료 대기 | DEFINED_CANDIDATE |
| 통관 | DEFINED_CANDIDATE |
| 항만 회수 | DEFINED_CANDIDATE |
| 방송/안내 | DEFINED_CANDIDATE |
| 주거/가족 | DEFINED_CANDIDATE |
| C08 | DEFINED_CANDIDATE |

- PARTIAL: 0
- SYSTEM_OVERLAP: 0
- NAME_ONLY_DIFFERENCE: 0
- UNRESOLVED: 0

이 판정은 **final canon LOCK이 아니라 final LOCK에 넣을 수 있을 정도로 검토된 후보**라는 뜻이다.
