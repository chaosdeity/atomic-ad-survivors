# CLAUSE-11 상세 결재 플레이어블팀 프롬프트 v0.1

이 문서는 플레이어블 제작팀에게 넘길 `11번 Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원` 상세 결재 작업용 복붙 프롬프트다.

목표는 20인 로스터를 다시 검토하는 것이 아니다.
목표는 이미 9~12번 중반 후보군으로 선정된 11번 후보가 플레이어블로 성립하는지 판정하고, 조건부 통과 또는 보류 사유를 결재 가능한 문서로 고정하는 것이다.

---

## 0. 현재 상태

```text
후보군 선정 문서:
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md

현재 판정:
후보 고정

이번 작성 목표 문서:
story/06_characters/clause_11_playable_decision_v0_1.md

이번 작업의 판정 목표:
통과 / 조건부 통과 / 보류 / 탈락 중 하나

다음 단계 후보:
조건부 통과라면 story/06_characters/clause_11_playable_condition_patch_v0_1.md
통과로 충분히 잠기면 story/06_characters/clause_11_profile_v1_0.md
```

CLAUSE-11은 새로 이름을 뽑는 작업이 아니다.
`Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원`을 기준으로 상세 결재한다.

---

## 1. 작업 범위

이번 작업에서 다룰 것:

```text
CLAUSE-11 플레이어블 자격 판정
E09_C06 대형마트 멤버십권 원점 잠금
약관의 작은 글씨 / 자동결제 승인 / 환불 예외 / 회원 등급 고정 절차 고정
E01_C06 포인트 거리, E02_C06 편의점 멤버십권, E10_C06 앱스토어 결제권과 분리
R06 회원 등급 브로커 NPC, LEDGER-12 라파와 분리
HP 0 / 긴급 인양 차별화
보급태그 / 멤버십 예외 / 결제 승인 기록 / 환불 대기표 정산 루트 판정
프로필 v1.0 전환 가능 여부 판단
```

이번 작업에서 하지 않을 것:

```text
20명 로스터 재작성
9~12번 후보 재선정
Mara Kincaid 이름 변경
E09 전체 소비권 상세화
E09_C05 케이블뉴스 수신권 상세화
E09_C01 교외단지 가족권 상세화
E09_C02 병원네트워크 진료권 상세화
E10_C06 앱스토어 결제권 선점
CLAUSE-11 프로필 v1.0 완성
NPC 마라로 전환
상인/도적/법률가/계산원/쿠폰 수집가화
스킬명/수치 밸런스 확정
현실 대형마트/회원제 매장 실명 패러디
```

---

## 2. 반드시 읽을 문서

### 2.1 직접 기준

```text
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
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

### 2.5 NPC/전역 충돌 방지

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/E01_NPC_L5_L4_PRODUCTION_TEAM_PROMPT_V0_1.md
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
```

---

## 3. 핵심 잠금

CLAUSE-11의 핵심 질문은 아래로 둔다.

```text
내가 동의한 약관은
언제부터 내 몸을 대신 설명하기 시작했는가?
```

핵심 문장 후보:

```text
작은 글씨에 동의했다고 해서,
내가 끝까지 회원인 것은 아니다.
```

최종 변화 문장 후보:

```text
예외 조항은 빠져나갈 구멍이 아니라,
아직 사람을 사람으로 읽는 문장이다.
```

CLAUSE-11은 법률가나 상인이 아니다.

```text
마라는 약관을 만든 사람이 아니라,
약관의 작은 글씨와 자동결제 승인, 환불 예외가
자신을 회원/결제 대상/환불 불가 구매자로 고정하기 전의 판정을 되받아치는 사람이다.
```

---

## 4. 이번 상세 결재에서 반드시 확인할 조건

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
마라는 대형마트 약관을 만든 사람이 아니라,
약관에 이미 동의한 회원으로 등록된 사람이다.
```

### 4.2 E09_C06 노출 범위 제한

이번 상세 결재는 E09 전체를 열지 않는다.

허용:

```text
E09_C06 대형마트 멤버십권
창고형 매장
대형마트
회원 서비스 데스크
멤버십 카운터
창고형 결제 라인
환불 대기줄
회원 등급표
자동결제 승인서
약관 책자
포인트 영수증
리뷰 보류표
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

### 4.3 E01_C06 / R06 회원 등급 브로커와 분리

반드시 비교한다.

```text
E01_C06 / R06 회원 등급 브로커:
선택권과 멤버십 등급을 거래 압박으로 바꾸는 인간 악의의 얼굴.
상점/거래 UI가 아니라 선택 후폭풍 NPC.

CLAUSE-11 마라:
거래를 주도하는 브로커가 아니라,
이미 회원으로 등록되어 자동 승인과 환불 예외에 붙잡힌 플레이어블 후보.
```

금지:

```text
마라를 회원 등급 브로커 2호로 만들지 않는다.
마라가 포인트를 사고팔거나 태그를 거래하지 않는다.
마라가 R06 상권 구조를 설명하지 않는다.
마라가 상점/환불 UI 담당자가 되지 않는다.
```

### 4.4 LEDGER-12 라파와 분리

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
라파의 거래 장부와 거리상권 회원권을 가져오지 않는다.
```

### 4.5 기존 플레이어블과 분리

반드시 확인:

```text
윤서:
현장 회수, 잘못 붙은 태그, 반품 도장.

한이루:
수취/반송/미수령/재배송 판정.

Mara Kincaid:
소유권, 약관 동의, 자동결제 승인, 환불 예외, 회원 등급 고정.
```

마라는 물건의 회수 방향이나 배송 주소를 바꾸는 사람이 아니다.
마라는 자신이 동의했다고 처리된 조항이 생존 조건으로 굳기 전의 예외를 붙잡는 사람이다.

### 4.6 HP 0 차별화

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

### 4.7 전투 리듬 고정

전투 리듬은 법률 지식, 상술, 할인 스킬이 아니다.

고정 동사:

```text
보류한다
예외로 돌린다
작은 글씨를 접는다
자동승인을 늦춘다
환불 대기를 유지한다
회원 등급 고정을 미룬다
리뷰 완료를 보류한다
결제 승인 로그를 되접는다
동의 조항의 빈칸을 남긴다
```

금지 동사:

```text
소송한다
협박한다
흥정한다
훔친다
할인한다
장사한다
쿠폰을 뿌린다
포인트를 파밍한다
법률로 적을 처벌한다
카드로 광역 공격한다
```

### 4.8 태그 / 정산 루트 잠금

주 태그:

```text
보급태그
```

보조 태그 후보:

```text
수신태그
통행태그
```

정산 자원 후보:

```text
멤버십 예외
결제 승인 기록
환불 대기표
포인트 영수증
약관 조항
회원 등급표
자동결제 승인서
리뷰 보류표
```

과사용 위험:

```text
마라가 예외를 너무 많이 남기면,
캠페인은 그녀를 더 높은 등급의 회원으로 고정하고
다음 결제를 자동으로 승인한다.
```

금지 자원:

```text
돈
골드
할인율
쿠폰 마나
법률 포인트
주가/투자 포인트
범용 거래 자원
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 11번 플레이어블 후보를 상세 결재하려고 한다.

이번 작업 대상:
11번
Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원
캐나다 / E09 북미 대서양-오대호 메갈로폴리스
원점 캠페인: E09_C06 대형마트 멤버십권
심화 캠페인 후보: E10_C06 앱스토어 결제권
현재 판정 상태: 후보 고정 / 상세 결재 필요

목표:
마라를 직업 클래스나 멋있는 상인/법률가 캐릭터가 아니라,
대형마트 멤버십권이 사람을 회원, 결제 승인 대상, 환불 대기자, 리뷰어로 등록하려는 절차를 다르게 읽는 플레이어블 관점으로 결재한다.

중요:
20명 전체 로스터를 다시 만들지 않는다.
9~12번 후보군을 다시 선정하지 않는다.
Mara Kincaid 이름을 임의로 바꾸지 않는다.
이번 슬롯 하나만 상세 결재한다.
프로필 v1.0을 바로 확정하지 말고, 먼저 플레이어블 자격을 판정한다.

반드시 아래 문서를 우선순위대로 읽고 판단한다.

직접 기준:
1. story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
2. story/06_characters/playable_20_roster_blueprint_v0_1.md
3. story/06_characters/playable_20_name_registry_v0_1.md
4. docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
5. story/06_characters/gate_09_profile_v1_0.md
6. story/06_characters/broad_10_profile_v1_0.md

세계 기준:
7. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
8. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
9. docs/world/WORLD_LORE_LOCK_V0_1.md
10. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
11. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
12. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
13. docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md

지도/캠페인 기준:
14. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
15. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
16. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
17. docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md

기존 캐릭터 충돌 방지:
18. story/06_characters/yunseo_profile_v1_0.md
19. story/06_characters/patch_profile_v1_0.md
20. story/06_characters/open_host_profile_v1_0.md
21. story/06_characters/discharge_hold_patient_profile_v1_0.md
22. story/06_characters/return_recipient_profile_v1_0.md
23. story/06_characters/meter_06_profile_v1_0.md
24. story/06_characters/quiet_07_profile_v1_0.md
25. story/06_characters/rio_08_profile_v1_0.md
26. story/06_characters/gate_09_profile_v1_0.md
27. story/06_characters/broad_10_profile_v1_0.md

NPC/전역 충돌 방지:
28. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
29. docs/world/E01_NPC_L5_L4_PRODUCTION_TEAM_PROMPT_V0_1.md
30. story/03_regions/r06_member_rank_broker_profile_v1_0.md
31. story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
32. story/03_regions/r01_campaign1_npc_roster_v0_1.md
33. story/02_hub/outpost_core_npc_profiles_v1_0.md

핵심 질문:
내가 동의한 약관은 언제부터 내 몸을 대신 설명하기 시작했는가?

핵심 문장 후보:
작은 글씨에 동의했다고 해서, 내가 끝까지 회원인 것은 아니다.

최종 변화 문장 후보:
예외 조항은 빠져나갈 구멍이 아니라, 아직 사람을 사람으로 읽는 문장이다.

판정 기준:
1. 이 캐릭터가 플레이어블이어야 하는 이유를 먼저 판정한다.
2. NPC, 상점 이벤트, 환불 데스크 기록으로 남는 것이 더 강하면 플레이어블 통과시키지 않는다.
3. 법률가, 상인, 계산원, 쿠폰 수집가, 도적, 할인 캐릭터로 보이면 보류 또는 탈락이다.
4. E09_C06 대형마트 멤버십권 안에서만 판단하고 E09 전체 소비권으로 키우지 않는다.
5. E10_C06 앱스토어 결제권은 심화 후보로만 둔다. 이번 결재에서 선점하지 않는다.
6. R06 회원 등급 브로커 NPC와 겹치면 보류한다. 마라는 브로커가 아니라 약관에 등록된 회원이다.
7. LEDGER-12 라파와 겹치면 보류한다. 라파는 비공식 태그 중개자이고, 마라는 공식 멤버십 약관에 묶인 사람이다.
8. 윤서/이루의 회수·반송 축과 겹치지 않게 소유권, 동의 조건, 자동결제, 환불 예외로 분리한다.
9. HP 0은 사망/부활이 아니라 자동결제 승인, 회원 등급 고정, 환불 불가 처리 직전 긴급 인양이어야 한다.
10. 보급태그, 멤버십 예외, 결제 승인 기록, 환불 대기표, 포인트 영수증이 전투/정산 리듬으로 이어져야 한다.

출력은 아래 형식으로 작성한다.

# Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원 플레이어블 상세 결재 v0.1

## 문서 상태

상태:
스토리팀/시스템팀 결재용 v0.1

판정:
통과 / 조건부 통과 / 보류 / 탈락 중 하나

용도:
CLAUSE-11의 플레이어블 자격, 캠페인 축, 전투 리듬, 태그 정산, HP 0, 해금 조건, 금지 방향을 고정한다.

## 0. 판정 요약

마라가 플레이어블로 통과/조건부 통과/보류/탈락인 이유를 짧게 정리한다.

반드시 포함:
- E09_C06 대형마트 멤버십권이 플레이어블 관점으로 성립하는가
- 약관/자동결제/환불 예외가 전투 리듬으로 변환되는가
- R06 회원 등급 브로커와 분리되는가
- LEDGER-12 라파와 분리되는가
- 법률가/상인/쿠폰 캐릭터로 흐르지 않는가

## 1. 한 줄 정의

직업이 아니라 생존 방식으로 정의한다.

예:
마라는 법률가나 상인이 아니라, 자동결제와 회원 등급이 사람을 끝까지 회원으로 고정하기 전 약관 예외를 붙잡는 생존자다.

## 2. 기본 프로필

슬롯:
본명:
코드명:
유저 첫 표기:
성별/표현:
나이감:
국적/언어권:
관리자용 현실 위치:
유저 노출 지역명:
출신 캠페인권:
심화 캠페인 후보:
첫 해금 시점:
플레이어블 전환 방식:
이름/영어권 표기 검수 상태:

## 3. 핵심 오판

마라가 잘못 믿는 것을 하나로 고정한다.

형식:
마라는 [잘못된 믿음]을 믿는다.
이 믿음은 일부 맞다.
하지만 [대형마트 멤버십권의 구조] 때문에 위험하다.

후보:
마라는 약관을 읽고 동의했으니, 적어도 예외를 요구할 권리는 남아 있다고 믿는다.

## 4. 플레이어블이어야 하는 이유

마라가 NPC, 환불 데스크 기록, 상점 이벤트가 아니라 플레이어블이어야 하는 이유를 설명한다.

반드시 포함:
- 플레이어가 마라로 E09_C06을 다르게 읽는 지점
- 윤서/PATCH/이루/GATE-09/BROAD-10과 겹치지 않는 지점
- 약관 조항, 자동결제, 환불 예외, 회원 등급 고정이 전투 리듬으로 변환되는 지점

## 5. 전투 리듬

전투 방식은 법률 지식이나 할인 스킬이 아니라 멤버십 절차에서 나온다.

작성 항목:
- 기본 리듬
- 위험한 강점
- 실패 시 후폭풍
- 플레이어 조작감
- 파티/동행 시 역할

고정 동사 후보:
보류한다 / 예외로 돌린다 / 작은 글씨를 접는다 / 자동승인을 늦춘다 / 환불 대기를 유지한다 / 회원 등급 고정을 미룬다 / 리뷰 완료를 보류한다 / 결제 승인 로그를 되접는다

금지 동사:
소송한다 / 협박한다 / 흥정한다 / 훔친다 / 할인한다 / 장사한다 / 쿠폰을 뿌린다 / 포인트를 파밍한다 / 법률로 적을 처벌한다 / 카드로 광역 공격한다

## 6. 태그 / 정산 / 자원

관련 태그:
주 정산 자원:
보조 정산 자원:
상태값 반응:
과사용 위험:

반드시 검토:
- 보급태그
- 수신태그
- 통행태그
- 멤버십 예외
- 결제 승인 기록
- 환불 대기표
- 포인트 영수증
- 약관 조항
- 회원 등급표
- 자동결제 승인서
- 리뷰 보류표

## 7. HP 0 / 긴급 인양 차별화

사망/부활로 쓰지 않는다.

작성 항목:
- HP 0 상태명
- 보급소가 어떻게 되당기는가
- 캠페인이 어떻게 다시 등록하려 하는가
- 다른 캐릭터의 HP 0과 다른 점

반드시 비교:
윤서:
이루:
미카:
노라:
마라:

CLAUSE-11의 HP 0 후보:
자동결제 승인 / 회원 등급 고정 / 환불 불가 처리 / 약관 동의 확정 / 리뷰 완료 처리 / 회원 카드 회수 / 예외 조항 폐쇄

## 8. 해금 조건

첫 암시:
첫 대면:
동행 또는 임시 조작:
정식 해금:
해금 보류 조건:

주의:
E01 초반에 억지로 넣지 않는다.
GATE-09, BROAD-10 이후 외부 광역권 후보라는 순서를 지킨다.
E09_C06 창고형 매장 또는 회원 서비스 데스크 이후로 제한한다.

## 9. 관계선

반드시 기존 캐릭터와 비교한다.

윤서:
PATCH:
OPEN-HOST:
하람:
이루:
유건:
여울:
리오:
미카:
노라:
보급소 NPC:
R06 회원 등급 브로커:
LEDGER-12 라파:
E09_C06 지역 NPC 후보:

## 10. 대표 대사

첫 만남:
전투 시작:
보급태그 부족:
자동결제 압박:
환불 예외 압박:
HP 0 직전:
긴급 인양 후:
성장 후:

대사는 시스템 설명이 아니라 마라의 잘못된 믿음과 멤버십 약관의 압력을 보여줘야 한다.

## 11. 비주얼 / 사운드 방향

핵심 이미지:
실루엣:
색감:
사운드:
UI 아이콘 후보:

주의:
법률가 정장, 계산원 유니폼, 상인 가방, 쿠폰북 개그, 카드 마법사로 보이면 실패다.
멤버십 카드, 약관 책자, 작은 글씨, 포인트 영수증, 환불 도장, 창고형 결제 라인, 회원 등급표를 우선 검토한다.

## 12. 금지 방향

반드시 포함:
- 법률가화 금지
- 상인/브로커화 금지
- 계산원/마트 직원화 금지
- 도적/절도 캐릭터화 금지
- 쿠폰 수집가/할인 개그 캐릭터화 금지
- R06 회원 등급 브로커 반복 금지
- LEDGER-12 라파의 비공식 태그 중개 선점 금지
- E09 전체 소비권 소개 캐릭터화 금지
- E10_C06 앱스토어 결제권 선점 금지
- 현실 유통기업 실명 패러디 금지

## 13. 성장 방향

초기:
중반:
후반:
최종 변화 문장:

최종 변화 문장 후보:
예외 조항은 빠져나갈 구멍이 아니라, 아직 사람을 사람으로 읽는 문장이다.

## 14. 프로필 v1.0 전환 조건

조건부 통과라면 무엇을 해결해야 v1.0으로 갈 수 있는지 적는다.

반드시 확인:
- 이름/언어권 검수
- E09_C06 로컬 노출 범위
- R06 회원 등급 브로커와 차별화
- LEDGER-12 라파와 차별화
- HP 0 차별화
- 보급태그/멤버십 예외 정산 루트
- 법률가/상인/쿠폰 캐릭터화 차단
- 다음 문서명

## 15. 결재 포인트

스토리팀/시스템팀/전투팀/아트팀이 확인할 항목을 5~8개로 정리한다.

## 16. 최종 판정

판정:
NPC 가능성:
플레이어블 가능성:
운영 추천:
다음 작업:

중요:
답변 끝에는 다음에 만들어야 할 문서명을 제안한다.

우선 제안:
story/06_characters/clause_11_playable_decision_v0_1.md

조건부 통과 시 다음:
story/06_characters/clause_11_playable_condition_patch_v0_1.md

통과로 충분히 잠기면:
story/06_characters/clause_11_profile_v1_0.md
```

---

## 6. 빠른 판정 기준

### 6.1 통과

```text
대형마트 멤버십권이 플레이어블 관점으로 분명하다.
전투 리듬이 약관 조항, 자동결제, 환불 예외, 회원 등급 고정에서 나온다.
HP 0이 자동결제 승인/회원 등급 고정/환불 불가 처리 직전 긴급 인양으로 차별화된다.
R06 회원 등급 브로커와 분리된다.
LEDGER-12 라파와 분리된다.
E09_C06 범위를 넘지 않는다.
```

### 6.2 조건부 통과

```text
캐릭터 축은 좋지만 법률가/상인/쿠폰 캐릭터화 위험이 남아 있다.
보급태그와 멤버십 예외 정산 루트가 약하다.
HP 0 차별화가 아직 윤서/이루의 회수·반송과 가까운 편이다.
E09_C06 로컬 범위가 E09 전체 소비권으로 넓어진다.
R06 브로커 또는 LEDGER-12 라파와 겹치는 표현이 있다.
이름/언어권 검수가 필요하다.
```

### 6.3 보류

```text
마라가 플레이어블보다 NPC, 환불 데스크 기록, 상점 이벤트로 더 강하다.
전투 리듬이 할인/쿠폰/포인트 장난에 머문다.
E09_C06이 아니라 E10_C06 앱스토어 결제권 또는 E01_C06 포인트 거리와 섞인다.
기존 캐릭터와 감정 질문이 겹친다.
```

### 6.4 탈락

```text
단순 법률가/상인/쿠폰 수집가/마트 직원으로 보인다.
약관과 멤버십 절차가 전투/정산/HP 0으로 이어지지 않는다.
R06 회원 등급 브로커나 LEDGER-12 라파의 역할을 빼앗는다.
현실 유통기업 패러디나 소비문화 개그가 캐릭터의 핵심이 된다.
```

---

## 7. 다음 작업

```text
이 프롬프트를 사용해 story/06_characters/clause_11_playable_decision_v0_1.md를 작성한다.
작성 후 판정이 조건부 통과라면 조건부 해소 문서를 따로 만든다.
통과로 충분히 잠기기 전에는 clause_11_profile_v1_0.md로 바로 가지 않는다.
```
