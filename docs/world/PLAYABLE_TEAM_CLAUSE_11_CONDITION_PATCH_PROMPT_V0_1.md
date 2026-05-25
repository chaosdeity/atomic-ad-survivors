# CLAUSE-11 조건부 해소 플레이어블팀 프롬프트 v0.1

이 문서는 플레이어블 제작팀에게 넘길 `CLAUSE-11 조건부 해소` 작업용 복붙 프롬프트다.

목표는 20인 로스터를 다시 검토하는 것이 아니다.
목표는 이미 조건부 통과한 11번 후보 `Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원`의 조건을 해소하고, 프로필 v1.0으로 갈 수 있는지 판정하는 것이다.

---

## 0. 현재 상태

```text
완료 문서:
story/06_characters/clause_11_playable_decision_v0_1.md

현재 판정:
조건부 통과

다음 작성 문서:
story/06_characters/clause_11_playable_condition_patch_v0_1.md

작성 목표:
조건부 통과 사유 해소
프로필 v1.0 전환 가능 여부 판정

다음 단계 후보:
story/06_characters/clause_11_profile_v1_0.md
```

CLAUSE-11은 이미 11번 슬롯 후보로 둘 가치가 있다고 판정되었다.
이번 작업은 마라를 새로 발명하는 일이 아니다.

해야 할 일은 조건부 통과 사유를 하나씩 잠그는 것이다.

---

## 1. 작업 범위

이번 작업에서 다룰 것:

```text
CLAUSE-11 조건부 해소
법률가/상인/계산원/쿠폰 수집가/할인 개그 캐릭터화 차단
E09_C06 대형마트 멤버십권 노출 범위 고정
E10_C06 앱스토어 결제권 선점 금지
R06 회원 등급 브로커와 역할 차이 고정
LEDGER-12 라파와 공식/비공식 거래 축 차이 고정
윤서/이루의 회수·반송 축과 차이 고정
HP 0의 자동결제 승인/회원 등급 고정/환불 불가 처리/예외 조항 폐쇄 고정
보급태그/멤버십 예외/결제 승인 기록/환불 대기표/약관 조항 정산 루트 잠금
Mara Kincaid 이름/영어권 표기 검수 상태 정리
프로필 v1.0 전환 가능 여부 판정
```

이번 작업에서 하지 않을 것:

```text
20명 로스터 재작성
9~12번 후보 재선정
Mara Kincaid 이름 임의 변경
E09 전체 지역 상세화
E09_C05 케이블뉴스 수신권 상세화
E09_C07 주간이동 통행권 상세화
E10_C06 앱스토어 결제권 상세화
CLAUSE-11 프로필 v1.0 작성
NPC 마라로 전환
스킬명/수치 밸런스 확정
현실 대형마트/유통기업 실명 패러디
북미 소비문화 풍자 개그화
```

---

## 2. 반드시 읽을 문서

### 2.1 직접 기준

```text
story/06_characters/clause_11_playable_decision_v0_1.md
docs/world/PLAYABLE_TEAM_CLAUSE_11_DETAIL_PROMPT_V0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/gate_09_profile_v1_0.md
story/06_characters/broad_10_profile_v1_0.md
```

### 2.2 세계/시스템 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
docs/world/WORLD_LORE_LOCK_V0_1.md
docs/world/LEGACY_TERM_MIGRATION_V0_1.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md
```

### 2.3 지도/캠페인 기준

```text
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md
```

### 2.4 기존 캐릭터 충돌 방지

```text
story/06_characters/yunseo_profile_v1_0.md
story/06_characters/patch_profile_v1_0.md
story/06_characters/open_host_profile_v1_0.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
story/06_characters/gate_09_profile_v1_0.md
story/06_characters/broad_10_profile_v1_0.md
```

### 2.5 NPC/전역 스토리 충돌 방지

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
```

---

## 3. 핵심 잠금

CLAUSE-11의 핵심 질문은 유지한다.

```text
내가 동의한 약관은
언제부터 내 몸을 대신 설명하기 시작했는가?
```

핵심 문장:

```text
작은 글씨에 동의했다고 해서,
내가 끝까지 회원인 것은 아니다.
```

최종 변화 문장 후보:

```text
예외 조항은 빠져나갈 구멍이 아니라,
아직 사람을 사람으로 읽는 문장이다.
```

CLAUSE-11은 약관을 만드는 사람이 아니다.
CLAUSE-11은 법률로 싸우는 사람도 아니다.
CLAUSE-11은 약관의 작은 글씨와 자동결제 승인, 환불 예외가 사람을 이미 동의한 회원으로 확정하기 전의 판정을 늦추는 캐릭터다.

---

## 4. 조건부 통과 사유

아래 8개 조건을 반드시 해소한다.

### 4.1 법률가/상인/쿠폰 캐릭터화 차단

금지:

```text
법률가
소송 전문가
계산원
마트 직원
상인
도적
쿠폰 수집가
할인 사냥꾼
포인트 농사 캐릭터
카드 배틀 캐릭터
절약 팁 캐릭터
소비 풍자 개그 캐릭터
대형마트 내부자 영웅
현실 유통기업 패러디 캐릭터
```

고정:

```text
마라는 약관을 만든 사람이 아니라,
약관에 이미 동의한 회원으로 등록된 사람이다.
```

조건부 해소 문서에서 반드시 할 일:

```text
법률가처럼 보이는 요소를 모두 제거한다.
상인/브로커처럼 보이는 거래 동사를 금지한다.
쿠폰/할인/포인트 개그로 읽히는 자원을 금지한다.
대형마트 멤버십 절차의 당사자이자 판정 지연자로 고정한다.
```

### 4.2 E09_C06 노출 범위 제한

조건부 해소 단계에서는 E09 전체를 열지 않는다.

허용:

```text
E09_C06 대형마트 멤버십권
E09_C06-L01 창고형 매장 외곽
E09_C06-L02 회원 서비스 데스크
창고형 결제 라인
멤버십 카운터
환불 대기줄
회원 등급표
자동결제 승인서
약관 책자
포인트 영수증
리뷰 보류표
미서명 약관 조항
절단된 멤버십 카드
```

금지:

```text
E09 전체 소비권
E09_C01 교외단지 가족권 상세화
E09_C02 병원네트워크 진료권 상세화
E09_C03 고속도로 반품권 상세화
E09_C05 케이블뉴스 수신권 상세화
E09_C07 주간이동 통행권 상세화
E10_C06 앱스토어 결제권 선점
현실 대형마트/창고형 매장 실명 패러디
북미 소비문화 풍자 에피소드화
```

노출 잠금:

```text
마라는 E09를 소개하는 캐릭터가 아니다.
마라는 E09_C06 대형마트 멤버십권의 첫 플레이어블 관점이다.
```

### 4.3 R06 회원 등급 브로커와 역할 차이 고정

반드시 비교한다.

```text
R06 회원 등급 브로커:
E01_C06 포인트 거리의 인간 NPC.
선택권과 멤버십 등급을 거래 압박으로 바꾸는 선택 후폭풍의 얼굴.
상점/거래 UI 담당자가 아니다.

CLAUSE-11 마라:
E09_C06 대형마트 멤버십권의 플레이어블 후보.
거래를 주도하는 사람이 아니라, 이미 약관에 등록되어 자동 승인과 환불 예외에 붙잡힌 회원이다.
```

금지:

```text
마라를 회원 등급 브로커 2호로 만들지 않는다.
마라가 포인트를 사고팔거나 태그를 거래하지 않는다.
마라가 R06 상권 구조를 설명하지 않는다.
마라가 상점/환불 UI 담당자가 되지 않는다.
마라가 인간 악의 브로커 축을 선점하지 않는다.
```

### 4.4 LEDGER-12 라파와 공식/비공식 거래 축 분리

반드시 비교한다.

```text
CLAUSE-11 마라:
공식 멤버십 약관에 등록된 회원.
자동결제, 환불 예외, 회원 등급, 리뷰 보류를 다룬다.

LEDGER-12 라파:
항만시장과 거리상권에서 태그를 돈처럼 팔던 비공식 중개자.
거래 장부, 태그 오염, 미정산 대가를 다룬다.
```

금지:

```text
마라가 비공식 태그 중개자가 되지 않는다.
마라가 장부/브로커/항만시장 윤리를 선점하지 않는다.
마라가 라파의 거래 장부와 거리상권 회원권을 가져오지 않는다.
라파를 마라의 하위 상인처럼 만들지 않는다.
```

### 4.5 윤서/이루의 회수·반송 축과 분리

반드시 비교한다.

```text
윤서:
현장 회수, 잘못 붙은 태그, 반품 도장, 회수선.

한이루 / RETURN-05:
수취/반송/미수령/재배송 판정.

CLAUSE-11 마라:
소유권, 약관 동의, 자동결제 승인, 환불 예외, 회원 등급 고정.
```

금지:

```text
마라가 물건의 회수 방향을 바꾸지 않는다.
마라가 배송 주소나 수취인 판정을 다루지 않는다.
마라의 환불 대기표를 RETURN-05의 반송 로그처럼 쓰지 않는다.
마라의 멤버십 카드를 윤서의 회수 태그처럼 쓰지 않는다.
```

### 4.6 HP 0 / 긴급 인양 차별화

HP 0은 사망/부활이 아니다.

CLAUSE-11의 HP 0 후보:

```text
자동결제 승인
회원 등급 고정
환불 불가 처리
약관 동의 확정
리뷰 완료 처리
회원 카드 회수
예외 조항 폐쇄
```

보급소 인양 방식:

```text
절단된 멤버십 카드
미서명 약관 조항
환불 대기표
찢긴 포인트 영수증
예외 조항 여백
결제 승인 취소 로그
회원 등급표의 빈칸
```

차별화:

```text
윤서:
현장 회수/잘못 붙은 태그에서 인양.

이루:
수취인 확인 실패/미수령 보관/재배송 대기에서 인양.

미카:
막차 탑승 실패/플랫폼 잔류 처리 직전 인양.

노라:
청취 확인 완료/대피 문장 승인/반복 송출 동기화 직전 인양.

마라:
자동결제 승인/회원 등급 고정/환불 불가 처리 직전,
미서명 예외 조항과 절단된 멤버십 카드로 인양.
```

금지:

```text
쇼핑 실패
카드 한도 초과
파산
절도 실패
쿠폰 만료
할인 실패
법률 지식으로 부활
결제 취소로 무료 귀환
```

### 4.7 정산 루트 제한

CLAUSE-11의 정산/자원은 아래로 제한한다.

주 태그:

```text
보급태그
```

보조 태그:

```text
수신태그
통행태그
```

정산 자원:

```text
멤버십 예외
결제 승인 기록
환불 대기표
포인트 영수증
약관 조항
회원 등급표
자동결제 승인서
리뷰 보류표
미서명 조항
절단된 멤버십 카드
```

금지:

```text
돈
골드
할인율
쿠폰 마나
법률 포인트
주가/투자 포인트
범용 거래 자원
상점 가격 인하 자원
```

과사용 위험:

```text
마라가 예외를 너무 많이 남기면,
캠페인은 그녀를 더 높은 등급의 회원으로 고정하고
다음 결제를 자동으로 승인한다.
```

### 4.8 이름/표기 검수와 해금 시점 명확화

현재 후보:

```text
본명:
Mara Kincaid

코드명:
CLAUSE-11

유저 첫 표기:
마라, 대형마트 약관 회원
```

검수 보류:

```text
영어권 원문 발음 가이드
한국어 표기
유저 노출 표기
캐나다/북미 표현 밀도
영어 대사 사용량
```

해금 시점 고정:

```text
CLAUSE-11은 E01 초반 합류자가 아니다.
CLAUSE-11은 GATE-09, BROAD-10 이후 중반 외부 광역권 후보로 둔다.
직접 해금은 E09_C06 회원 서비스 데스크 또는 창고형 결제 라인 이후로 제한한다.
```

금지:

```text
E01 R06에서 즉시 해금
R06 브로커 이벤트 보상으로 즉시 합류
E09 전체 개방 보상으로 해금
E10_C06 앱스토어 결제권에서 선행 해금
미나 정산 이벤트로 즉시 합류
현실 유통기업 패러디 이름 사용
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 11번 플레이어블 후보 CLAUSE-11 조건부 해소 문서를 작성한다.

이번 작업 대상:
Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원

현재 판정:
조건부 통과

완료된 상세 결재 문서:
story/06_characters/clause_11_playable_decision_v0_1.md

이번 작성 목표 문서:
story/06_characters/clause_11_playable_condition_patch_v0_1.md

목표:
법률가/상인/쿠폰 캐릭터가 아니라,
대형마트 멤버십권이 사람을 회원/결제 승인 대상/환불 불가 구매자/리뷰 완료자로 확정하기 전의 판정을 늦추는 플레이어블 후보로 CLAUSE-11을 잠근다.

중요:
20명 로스터를 다시 만들지 않는다.
Mara Kincaid 이름을 임의로 바꾸지 않는다.
프로필 v1.0을 아직 작성하지 않는다.
이번 문서는 조건부 해소 문서다.

반드시 아래 문서를 우선순위대로 읽고 판단한다.

직접 기준:
1. story/06_characters/clause_11_playable_decision_v0_1.md
2. docs/world/PLAYABLE_TEAM_CLAUSE_11_DETAIL_PROMPT_V0_1.md
3. docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
4. story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
5. story/06_characters/playable_20_name_registry_v0_1.md
6. story/06_characters/playable_20_roster_blueprint_v0_1.md
7. story/06_characters/gate_09_profile_v1_0.md
8. story/06_characters/broad_10_profile_v1_0.md

세계/시스템 기준:
9. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
10. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
11. docs/world/WORLD_LORE_LOCK_V0_1.md
12. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
13. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
14. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
15. docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md

지도/캠페인 기준:
16. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
17. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
18. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
19. docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md

기존 캐릭터 충돌 방지:
20. story/06_characters/yunseo_profile_v1_0.md
21. story/06_characters/patch_profile_v1_0.md
22. story/06_characters/open_host_profile_v1_0.md
23. story/06_characters/discharge_hold_patient_profile_v1_0.md
24. story/06_characters/return_recipient_profile_v1_0.md
25. story/06_characters/meter_06_profile_v1_0.md
26. story/06_characters/quiet_07_profile_v1_0.md
27. story/06_characters/rio_08_profile_v1_0.md
28. story/06_characters/gate_09_profile_v1_0.md
29. story/06_characters/broad_10_profile_v1_0.md

NPC/전역 충돌 방지:
30. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
31. docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
32. story/03_regions/r06_member_rank_broker_profile_v1_0.md
33. story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
34. story/03_regions/r01_campaign1_npc_roster_v0_1.md
35. story/02_hub/outpost_core_npc_profiles_v1_0.md

조건부 해소 항목:
1. 법률가/상인/계산원/쿠폰 수집가/할인 개그 캐릭터화 차단.
2. E09_C06 창고형 매장, 멤버십 카운터, 회원 서비스 데스크까지만 노출하고 E09 전체 확장을 막는다.
3. E10_C06 앱스토어 결제권 선점을 금지한다.
4. R06 회원 등급 브로커와의 역할 차이를 고정한다.
5. LEDGER-12 라파와 공식/비공식 거래 축 차이를 고정한다.
6. 윤서/이루의 회수·반송 축과 소유권/동의/결제/환불 축을 분리한다.
7. HP 0의 자동결제 승인/회원 등급 고정/환불 불가 처리/예외 조항 폐쇄를 고정한다.
8. 보급태그, 멤버십 예외, 결제 승인 기록, 환불 대기표, 약관 조항의 정산 루트를 고정한다.
9. Mara Kincaid 이름/영어권 표기 검수 상태를 정리한다.
10. GATE-09/BROAD-10 이후 중반 외부 광역권 후보라는 해금 시점을 고정한다.

핵심 질문:
내가 동의한 약관은 언제부터 내 몸을 대신 설명하기 시작했는가?

핵심 문장:
작은 글씨에 동의했다고 해서, 내가 끝까지 회원인 것은 아니다.

최종 변화 문장 후보:
예외 조항은 빠져나갈 구멍이 아니라, 아직 사람을 사람으로 읽는 문장이다.

출력은 아래 형식으로 작성한다.

# CLAUSE-11 조건부 해소 문서 v0.1

## 문서 상태

상태:
작성 완료 v0.1

작업 성격:
CLAUSE-11 조건부 통과 사유 해소 문서.
최종 프로필 v1.0 작성 아님.

대상:
Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원

판정:
통과로 승격 가능 / 조건부 유지 / 보류 중 하나

다음 단계:
story/06_characters/clause_11_profile_v1_0.md
또는 조건부 유지 사유 작성

## 0. 판정 요약

조건부 통과 사유를 해소했는지 요약한다.

## 1. 조건부 사유 목록

상세 결재에서 남은 조건을 표로 정리한다.

| 조건 | 상세 결재 상태 | 이번 문서 판정 |

## 2. 법률가/상인/쿠폰 캐릭터화 차단

반드시 포함:
- 금지 직업 이미지
- 금지 전투 동사
- 허용되는 조작 동사
- 마라가 약관 제작자나 상인이 아니라 멤버십 절차에 붙잡힌 사람이라는 정의

## 3. E09_C06 노출 범위

허용 로컬:
E09_C06-L01 창고형 매장 외곽
E09_C06-L02 회원 서비스 데스크
창고형 결제 라인
멤버십 카운터
환불 대기줄
회원 등급표
자동결제 승인서
약관 책자
포인트 영수증
리뷰 보류표

금지 확장:
E09 전체
E09_C01
E09_C02
E09_C03
E09_C05
E09_C07
E10_C06
현실 유통기업 실명
북미 소비문화 풍자

## 4. R06 회원 등급 브로커와 분리

반드시 표로 비교한다.

| 항목 | R06 회원 등급 브로커 | CLAUSE-11 마라 |

비교 항목:
역할
트랙
원점 캠페인
다루는 압력
금지 중복

## 5. LEDGER-12 라파와 분리

반드시 표로 비교한다.

| 항목 | CLAUSE-11 마라 | LEDGER-12 라파 |

비교 항목:
공식/비공식
다루는 자원
위험
HP 0
금지 중복

## 6. 윤서/이루와 회수·반송 축 분리

윤서:
이루:
마라:

마라가 다루지 않는 것:
- 현장 회수
- 배송 주소
- 수취인 확인
- 미수령 보관
- 재배송 대기

마라가 다루는 것:
- 소유권
- 약관 동의
- 자동결제 승인
- 환불 예외
- 회원 등급 고정

## 7. HP 0 / 긴급 인양 고정

작성 항목:
- HP 0 상태명
- 캠페인이 마라를 어떻게 등록하려 하는가
- 보급소가 무엇을 잡고 되당기는가
- 윤서/이루/미카/노라와 다른 점

반드시 포함:
자동결제 승인
회원 등급 고정
환불 불가 처리
약관 동의 확정
예외 조항 폐쇄
절단된 멤버십 카드
미서명 약관 조항
환불 대기표
결제 승인 취소 로그

## 8. 정산 루트 잠금

관련 태그:
주 정산 자원:
보조 정산 자원:
과사용 위험:
금지 자원:

반드시 제한:
보급태그
수신태그
통행태그
멤버십 예외
결제 승인 기록
환불 대기표
포인트 영수증
약관 조항
회원 등급표
자동결제 승인서
리뷰 보류표

## 9. 이름/표기 검수 상태

현재 유지:
Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원

검수 보류:
영어권 원문 발음 가이드
한국어 표기
유저 노출 표기
캐나다/북미 표현 밀도
영어 대사 사용량

금지:
이름 임의 변경
영어 대사 남용
캐나다/북미 대표성 강조
현실 유통기업 패러디
소비문화 풍자 캐릭터화

## 10. 해금 시점 고정

고정:
GATE-09/BROAD-10 이후 중반 외부 광역권 후보.
E09_C06 회원 서비스 데스크 또는 창고형 결제 라인 이후.
E01 초반 합류 금지.

금지:
E01 R06에서 즉시 해금
R06 브로커 이벤트 보상
E09 전체 클리어 보상
E10_C06 선행 해금
미나 정산 이벤트로 즉시 합류

## 11. 프로필 v1.0 전환 가능 여부

판정:
통과로 승격 가능 / 조건부 유지 / 보류

프로필 v1.0에서 반드시 유지할 것:

프로필 v1.0에서 더 쓰면 안 되는 것:

## 12. 다음 작업

통과로 승격 가능이라면:
story/06_characters/clause_11_profile_v1_0.md

조건부 유지라면:
남은 조건과 추가 보완 문서명을 제안한다.

중요:
답변 끝에는 다음에 만들어야 할 문서명을 제안한다.
```

---

## 6. 빠른 판정 기준

### 6.1 통과로 승격 가능

```text
법률가/상인/쿠폰 캐릭터화가 차단되었다.
E09_C06-L01~L02 노출 범위가 잠겼다.
E10_C06 앱스토어 결제권을 선점하지 않는다.
R06 회원 등급 브로커와 역할 차이가 명확하다.
LEDGER-12 라파와 공식/비공식 거래 축이 명확히 분리되었다.
윤서/이루의 회수·반송 축과 소유권/동의/결제/환불 축이 분리되었다.
HP 0이 자동결제 승인/회원 등급 고정/환불 불가 처리/예외 조항 폐쇄 직전 인양으로 고정되었다.
정산 루트가 보급태그/멤버십 예외/결제 승인 기록/환불 대기표 중심으로 제한되었다.
Mara Kincaid 표기 검수 상태가 명확하다.
GATE-09/BROAD-10 이후 중반 외부 광역권 후보라는 해금 위치가 고정되었다.
```

### 6.2 조건부 유지

```text
캐릭터 축은 유지되지만 일부 표현이 여전히 법률가/상인/쿠폰 캐릭터처럼 읽힌다.
R06 브로커 또는 LEDGER-12 라파와 차이가 아직 약하다.
HP 0 차별화가 아직 윤서/이루의 회수·반송과 가까운 편이다.
E09_C06 범위가 E09 전체 소비권으로 넓어진다.
E10_C06 앱스토어 결제권을 너무 빨리 선점한다.
정산 루트가 돈/할인/쿠폰 자원처럼 추상화된다.
```

### 6.3 보류

```text
CLAUSE-11이 플레이어블보다 NPC, 환불 데스크 기록, 상점 이벤트로 더 강하다.
전투 리듬이 약관 조항/자동결제/환불 예외/회원 등급 보류가 아니라 할인과 포인트에 머문다.
마라가 R06 브로커의 상업 압력이나 라파의 비공식 거래 장부를 대체한다.
E09_C06 대형마트 멤버십권이 캐릭터 핵심으로 보이지 않는다.
```

---

## 7. 다음 작업

```text
이 프롬프트를 사용해 story/06_characters/clause_11_playable_condition_patch_v0_1.md를 작성한다.
작성 후 판정이 통과로 승격 가능이면 clause_11_profile_v1_0.md 작성 프롬프트를 만든다.
조건부 유지면 남은 조건만 다시 좁혀 별도 보완 프롬프트를 만든다.
```
