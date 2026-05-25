# LEDGER-12 조건부 해소 플레이어블팀 프롬프트 v0.1

이 문서는 플레이어블 제작팀에게 넘길 `LEDGER-12 조건부 해소` 작업용 복붙 프롬프트다.

목표는 20인 로스터를 다시 검토하는 것이 아니다.
목표는 이미 조건부 통과한 12번 후보 `Rafaela Costa / LEDGER-12 / 라파, 항만시장 태그 중개자`의 조건을 해소하고, 프로필 v1.0으로 갈 수 있는지 판정하는 것이다.

---

## 0. 현재 상태

```text
완료 문서:
story/06_characters/ledger_12_playable_decision_v0_1.md

현재 판정:
조건부 통과

다음 작성 문서:
story/06_characters/ledger_12_playable_condition_patch_v0_1.md

작성 목표:
조건부 통과 사유 해소
프로필 v1.0 전환 가능 여부 판정

다음 단계 후보:
story/06_characters/ledger_12_profile_v1_0.md
```

LEDGER-12는 이미 12번 슬롯 후보로 둘 가치가 있다고 판정되었다.
이번 작업은 라파를 새로 발명하는 일이 아니다.

해야 할 일은 조건부 통과 사유를 하나씩 잠그는 것이다.

---

## 1. 작업 범위

이번 작업에서 다룰 것:

```text
LEDGER-12 조건부 해소
상인/블랙마켓/도적/돈벌이 캐릭터화 차단
태그 교환 UI, 상점 할인, 돈/골드/태그 코인 자원화 금지
E11_C03 항만시장 회수권 직접 노출 범위 고정
E11_C06 거리상권 회원권 심화 단서 제한
E12_C06 모바일머니 회원권 선점 금지
미나의 보급소 정산 카운터와 기능 차이 고정
R06 회원 등급 브로커와 역할 차이 고정
CLAUSE-11 마라와 공식/비공식 거래 축 차이 고정
윤서/RETURN-05/R03 물류 회수 축과 차이 고정
HP 0의 거래 장부 이름 고정/미정산 태그 폐쇄 고정
브라질/라틴아메리카/항만시장 표현 밀도와 실명 노출 검수 상태 정리
프로필 v1.0 전환 가능 여부 판정
```

이번 작업에서 하지 않을 것:

```text
20명 로스터 재작성
9~12번 후보 재선정
Rafaela Costa 이름 임의 변경
LEDGER-12 프로필 v1.0 작성
E11 전체 지역 상세화
E11_C01 고지대 주거권 상세화
E11_C02 공공병원 진료권 상세화
E11_C04 전력복구 충전권 상세화
E11_C05 텔레노벨라 수신권 상세화
E11_C07 버스터미널 통행권 상세화
E11_C08 성당/학교 보급권 상세화
E12_C06 모바일머니 회원권 상세화
E06_C06 몰 VIP 결제권 선점
NPC 라파로 전환
상점/환전/태그 교환 UI 확정
스킬명/수치 밸런스 확정
스토리 본문 작성
현실 범죄/치안/빈곤 클리셰 캐릭터화
실제 항만/도시/시장 실명 노출
```

---

## 2. 반드시 읽을 문서

### 2.1 직접 기준

```text
story/06_characters/ledger_12_playable_decision_v0_1.md
docs/world/PLAYABLE_TEAM_LEDGER_12_DETAIL_PROMPT_V0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/gate_09_profile_v1_0.md
story/06_characters/broad_10_profile_v1_0.md
story/06_characters/clause_11_profile_v1_0.md
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
story/06_characters/clause_11_profile_v1_0.md
```

### 2.5 NPC/전역 스토리 충돌 방지

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
story/03_regions/global_npc_story_seed_registry_v0_1.md
story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
story/06_characters/playable_global_npc_link_matrix_v0_1.md
story/03_regions/global_npc_name_location_exposure_registry_v0_1.md
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
```

---

## 3. 핵심 잠금

LEDGER-12의 핵심 질문은 유지한다.

```text
태그를 돈처럼 팔던 사람이
보급소 규칙을 믿을 수 있는가?
```

핵심 문장:

```text
장부에 적었다고 해서,
사람이 정산된 것은 아니다.
```

최종 변화 문장 후보:

```text
태그는 가격표가 아니라,
누가 버려졌는지 남기는 기록이다.
```

한 줄 정의:

```text
라파는 태그를 돈처럼 돌리던 비공식 장부를,
보급소 규칙과 미정산 책임으로 되접는 12번 플레이어블 후보이다.
```

라파는 상인이 아니다.
라파는 블랙마켓 보스도 아니다.
라파는 태그 교환 UI, 환전상, 돈벌이 캐릭터, 도적 캐릭터가 아니다.

라파는 태그가 가격표로 닫히기 전, 거래 장부에 묶인 이름을 미정산 책임과 보급소 규칙이 다시 읽을 수 있게 되접는 캐릭터다.

---

## 4. 조건부 통과 사유

아래 9개 조건을 반드시 해소한다.

### 4.1 상인/블랙마켓/돈벌이 캐릭터화 차단

금지:

```text
상인
블랙마켓 보스
도적
밀수꾼 영웅
환전상
태그 교환 상점
돈벌이 캐릭터
아이템 파밍 캐릭터
거래 장인
장부 마법사
범죄 조직 캐릭터
가난/치안/항만 범죄 클리셰
라틴아메리카 대표성 캐릭터
선한 저항군만 하는 캐릭터
```

금지 전투 동사:

```text
판다
산다
흥정한다
훔친다
밀수한다
환전한다
가격을 올린다
가격을 깎는다
태그를 파밍한다
장부로 돈을 번다
상점을 연다
아이템을 복제한다
태그를 무제한 교환한다
```

허용되는 조작 동사:

```text
보류한다
되접는다
찢어 둔다
오염을 분리한다
미정산으로 남긴다
거래 항목을 사람 항목으로 되돌린다
태그의 가격표를 지운다
장부의 빈칸을 남긴다
비공식 표식을 보급소 규칙에 맞춘다
회수품 판정을 거래 대상에서 보류한다
```

조건부 해소 문서에서 반드시 할 일:

```text
상인처럼 보이는 요소를 모두 제거한다.
블랙마켓/환전/도적/밀수꾼 이미지로 읽히는 요소를 금지한다.
돈/골드/태그 코인/상점 할인/태그 교환 UI를 자원으로 쓰지 않는다.
라파의 조작을 거래 이득이 아니라 미정산 책임 보류로 고정한다.
```

### 4.2 E11_C03 노출 범위 제한

조건부 해소 단계에서는 E11 전체를 열지 않는다.

직접 허용:

```text
E11_C03 항만시장 회수권
E11_C03-L01 항만시장 외곽
E11_C03-L02 노점 반품로와 화물 창고 진입부
항만시장
노점 반품로
화물 창고
비공식 물류망
항만시장 거래표
비공식 회수품 표식
태그 홀더
거래 장부
미정산 태그
오염 태그 기록
```

심화 단서로만 허용:

```text
E11_C06 거리상권 회원권
거리 결제 골목
모바일 매대
모바일 결제 흔적
거리 회원표
할인 스피커 로그
```

금지 확장:

```text
E11 전체 광역권 소개
E11_C01 고지대 주거권 상세화
E11_C02 공공병원 진료권 상세화
E11_C04 전력복구 충전권 상세화
E11_C05 텔레노벨라 수신권 상세화
E11_C07 버스터미널 통행권 상세화
E11_C08 성당/학교 보급권 상세화
E12_C06 모바일머니 회원권 선점
E06_C06 몰 VIP 결제권 선점
현실 도시/항만/시장 실명 노출
현실 범죄 조직 패러디
라틴아메리카 빈곤/치안 대표 캐릭터화
```

노출 잠금:

```text
라파는 E11 전체를 소개하는 캐릭터가 아니다.
라파는 E11_C03 항만시장 회수권의 비공식 장부와 태그 윤리를 여는 후보이다.
E11_C06은 심화 단서로만 둔다.
```

### 4.3 미나와 보급소 정산 카운터 분리

반드시 비교한다.

```text
미나:
침묵 보급소 내부 정산 카운터.
회수물 정산, 태그 배분, 보관/소모 선택을 담당한다.

LEDGER-12 라파:
보급소 바깥 E11 항만시장/거리상권의 비공식 장부에 묶인 후보.
거래 장부와 오염 태그를 보급소 규칙이 다시 읽을 수 있게 되접는다.
```

고정 문장:

```text
미나는 보급소 안에서 정산한다.
라파는 보급소 바깥에서 정산된 척하던 태그를 다시 미정산으로 남긴다.
```

금지:

```text
라파가 미나의 정산 카운터를 대체하지 않는다.
라파가 보급소 태그 배분 UI를 열지 않는다.
라파가 회수물 보관/소모 선택을 대신하지 않는다.
미나가 라파의 비공식 장부 윤리를 대신 설명하지 않는다.
```

### 4.4 R06 회원 등급 브로커와 역할 차이 고정

반드시 비교한다.

```text
R06 회원 등급 브로커:
E01_C06 포인트 거리의 인간 NPC.
선택권과 멤버십 등급을 거래 압박으로 바꾸는 선택 후폭풍의 얼굴.
상점/거래 UI 담당자가 아니다.

LEDGER-12 라파:
E11_C03 항만시장 회수권의 12번 플레이어블 후보.
팔린 태그가 사람을 거래 항목으로 닫기 전 장부를 되접는 후보.
```

분리 문장:

```text
브로커는 선택권을 상품처럼 파는 사람이다.
라파는 팔린 태그가 사람을 거래 항목으로 닫기 전 장부를 되접는 사람이다.
```

금지:

```text
라파를 R06 회원 등급 브로커 2호로 만들지 않는다.
라파가 회원 등급, VIP 게이트, 포인트 거래를 설명하지 않는다.
라파가 E01 R06의 인간 악의를 글로벌로 반복하지 않는다.
라파가 브로커 악역에서 갑자기 선한 저항군으로 세탁되지 않는다.
```

### 4.5 CLAUSE-11 마라와 공식/비공식 거래 축 분리

반드시 비교한다.

```text
CLAUSE-11 마라:
공식 멤버십 약관에 등록된 회원.
자동결제, 환불 예외, 회원 등급, 리뷰 보류를 다룬다.

LEDGER-12 라파:
항만시장과 거리상권에서 태그를 돈처럼 팔던 비공식 중개자.
거래 장부, 태그 오염, 미정산 대가, 비공식 회수품 표식을 다룬다.
```

분리 문장:

```text
마라는 공식 약관에 붙잡힌 사람이다.
라파는 공식 바깥에서 태그를 돈처럼 돌리던 사람이다.
```

금지:

```text
라파가 약관 조항, 자동결제 승인, 환불 예외, 회원 등급 고정을 다루지 않는다.
마라를 라파의 공식 상점 버전처럼 만들지 않는다.
라파를 마라의 비공식 상인 버전처럼 만들지 않는다.
두 캐릭터 모두 돈/할인/상점 기능으로 합치지 않는다.
```

### 4.6 윤서/RETURN-05/R03 물류 회수 축과 분리

반드시 비교한다.

```text
윤서:
현장 회수, 잘못 붙은 태그, 회수선, 반품 도장.

한이루 / RETURN-05:
수취/반송/미수령/재배송 판정.

R03 최종 반품 심사 보류관:
E01 물류 회수 심사의 지역 NPC.

LEDGER-12 라파:
거래 장부에 가격처럼 붙은 태그를 미정산 책임으로 되돌리는 후보.
```

고정 문장:

```text
윤서는 잘못 붙은 태그를 현장에서 회수한다.
이루는 잘못 닫힌 배송 상태를 되접는다.
라파는 거래 장부에 가격처럼 붙은 태그를 미정산 책임으로 되돌린다.
```

금지:

```text
라파가 현장 회수 방향을 바꾸지 않는다.
라파가 배송 주소나 수취인 판정을 다루지 않는다.
라파가 반송 로그, 미수령 보관, 재배송 대기를 다루지 않는다.
라파가 R03 반품 심사실의 지역 NPC 기능을 흡수하지 않는다.
```

### 4.7 HP 0 / 긴급 인양 차별화

HP 0은 사망/부활이 아니다.

LEDGER-12의 HP 0 상태명 후보:

```text
거래 장부 이름 고정 / 미정산 태그 폐쇄
```

HP 0 흐름:

```text
1. 장부 페이지 닫힘
2. 미정산 태그 폐쇄
3. 오염 태그 묶음
4. 거래 장부 이름 고정
5. 긴급 인양
```

보급소가 되당기는 단서:

```text
찢긴 장부 페이지
미정산 태그
가격이 지워진 태그 홀더
오염 태그 기록의 빈칸
항만시장 표식
비공식 회수품 라벨
모바일 결제 실패 흔적
```

차별화:

```text
윤서:
현장 좌표와 회수선에서 인양.

이루:
수취인 확인 실패/미수령 보관/재배송 대기에서 인양.

마라:
자동결제 승인/예외 조항 폐쇄 직전 인양.

미나:
보급소 내부 정산표와 회수물 정산에서 붙잡힌다.

라파:
거래 장부 이름 고정/미정산 태그 폐쇄 직전,
찢긴 장부 페이지와 가격이 지워진 태그 홀더로 인양.
```

금지:

```text
거래 실패
파산
돈 부족
도둑질 실패
암시장 거래 실패
상점 재고 소진
태그 코인 손실
거래 장부로 무료 부활
미나가 돈을 정산해 안전 귀환
```

### 4.8 정산 루트 제한

LEDGER-12의 정산/자원은 아래로 제한한다.

주 태그:

```text
보급태그
```

보조 태그:

```text
통행태그
수신태그
```

주 정산 자원:

```text
미정산 태그
오염 태그 기록
거래 장부
비공식 회수품 표식
항만시장 표식
```

보조 정산 자원:

```text
찢긴 장부 페이지
태그 홀더
모바일 결제 흔적
거리 회원표
노점 반품표
화물 창고 번호
가격이 지워진 태그
```

금지 자원:

```text
돈
골드
현금
암시장 포인트
태그 코인
거래 마나
할인율
시세표
주식/투자 포인트
범용 상점 자원
태그 교환권
무료 구매권
```

정산 감각:

```text
라파가 얻는 것은 돈이 아니다.
라파가 남기는 것은 아직 가격표로 닫히지 않은 미정산 책임이다.
```

과사용 위험:

```text
라파가 태그를 너무 많이 되접으면,
캠페인은 그녀를 더 정확한 거래 장부 보관자로 고정하고
미정산 태그를 라파의 이름 아래 정리하기 시작한다.
```

### 4.9 이름/표기 검수와 해금 시점 명확화

현재 후보:

```text
본명:
Rafaela Costa

코드명:
LEDGER-12

유저 첫 표기:
라파, 항만시장 태그 중개자
```

검수 보류:

```text
포르투갈어권 원문 발음 가이드
한국어 표기
유저 노출 표기
브라질/라틴아메리카 표현 밀도
포르투갈어 대사 사용량
스페인어권 E11 지역과의 혼합 노출 정책
```

해금 시점 고정:

```text
LEDGER-12는 E01 초반 합류자가 아니다.
LEDGER-12는 GATE-09, BROAD-10, CLAUSE-11 이후 직접 해금한다.
9~12번 중 가장 늦게 직접 해금한다.
직접 해금은 E11_C03-L01~L02 이후로 제한한다.
E11_C06은 심화 단서로만 둔다.
```

금지:

```text
이름 임의 변경
포르투갈어/스페인어 대사 남용
브라질 또는 라틴아메리카 대표성 강조
현실 항만/시장/범죄 조직 패러디
빈곤/치안 클리셰로 캐릭터 설명
E01 R06에서 즉시 해금
미나 정산 이벤트로 즉시 합류
R06 브로커 이벤트 보상
CLAUSE-11 이벤트 보상
E11 전체 클리어 보상
E12_C06 선행 해금
상점 기능 개방 보상
태그 교환 UI 튜토리얼 보상
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 12번 플레이어블 후보 LEDGER-12 조건부 해소 문서를 작성한다.

이번 작업 대상:
Rafaela Costa / LEDGER-12 / 라파, 항만시장 태그 중개자

현재 판정:
조건부 통과

완료된 상세 결재 문서:
story/06_characters/ledger_12_playable_decision_v0_1.md

이번 작성 목표 문서:
story/06_characters/ledger_12_playable_condition_patch_v0_1.md

목표:
라파를 상인/블랙마켓/돈벌이/태그 교환 UI 캐릭터가 아니라,
태그를 돈처럼 돌리던 비공식 장부를 보급소 규칙과 미정산 책임으로 되접는 플레이어블 후보로 잠근다.

중요:
20명 로스터를 다시 만들지 않는다.
Rafaela Costa 이름을 임의로 바꾸지 않는다.
프로필 v1.0을 아직 작성하지 않는다.
이번 문서는 조건부 해소 문서다.
E11 전체를 열지 않는다.
E12_C06 모바일머니 회원권을 선점하지 않는다.
상점/환전/태그 교환 UI를 만들지 않는다.

반드시 아래 문서를 우선순위대로 읽고 판단한다.

직접 기준:
1. story/06_characters/ledger_12_playable_decision_v0_1.md
2. docs/world/PLAYABLE_TEAM_LEDGER_12_DETAIL_PROMPT_V0_1.md
3. docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
4. story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
5. story/06_characters/playable_20_name_registry_v0_1.md
6. story/06_characters/playable_20_roster_blueprint_v0_1.md
7. story/06_characters/gate_09_profile_v1_0.md
8. story/06_characters/broad_10_profile_v1_0.md
9. story/06_characters/clause_11_profile_v1_0.md

세계/시스템 기준:
10. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
11. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
12. docs/world/WORLD_LORE_LOCK_V0_1.md
13. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
14. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
15. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
16. docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md

지도/캠페인 기준:
17. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
18. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
19. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
20. docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md

기존 캐릭터 충돌 방지:
21. story/06_characters/yunseo_profile_v1_0.md
22. story/06_characters/patch_profile_v1_0.md
23. story/06_characters/open_host_profile_v1_0.md
24. story/06_characters/discharge_hold_patient_profile_v1_0.md
25. story/06_characters/return_recipient_profile_v1_0.md
26. story/06_characters/meter_06_profile_v1_0.md
27. story/06_characters/quiet_07_profile_v1_0.md
28. story/06_characters/rio_08_profile_v1_0.md
29. story/06_characters/gate_09_profile_v1_0.md
30. story/06_characters/broad_10_profile_v1_0.md
31. story/06_characters/clause_11_profile_v1_0.md

NPC/전역 충돌 방지:
32. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
33. docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
34. story/03_regions/global_npc_story_seed_registry_v0_1.md
35. story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
36. story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
37. story/06_characters/playable_global_npc_link_matrix_v0_1.md
38. story/03_regions/global_npc_name_location_exposure_registry_v0_1.md
39. story/03_regions/r06_member_rank_broker_profile_v1_0.md
40. story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
41. story/03_regions/r01_campaign1_npc_roster_v0_1.md
42. story/02_hub/outpost_core_npc_profiles_v1_0.md

조건부 해소 항목:
1. 상인/블랙마켓/도적/돈벌이 캐릭터화 차단.
2. 태그 교환 UI, 상점 할인, 돈/골드/태그 코인 자원화 금지.
3. E11_C03-L01~L02만 직접 노출하고 E11_C06은 심화 단서로 제한한다.
4. E12_C06 모바일머니 회원권과 E06_C06 몰 VIP 결제권을 선점하지 않는다.
5. 미나의 보급소 정산 카운터와 라파의 외부 장부 윤리를 분리한다.
6. R06 회원 등급 브로커와 라파의 선택권 상품화/팔린 태그 미정산 책임 축을 분리한다.
7. CLAUSE-11 마라와 공식 약관/비공식 장부 축을 분리한다.
8. 윤서/RETURN-05/R03의 회수·반송·물류 심사 축을 빼앗지 않는다.
9. HP 0의 거래 장부 이름 고정/미정산 태그 폐쇄를 고정한다.
10. 브라질/라틴아메리카/항만시장 표현 밀도와 현실 실명 노출 정책을 검수 보류로 정리한다.

핵심 질문:
태그를 돈처럼 팔던 사람이 보급소 규칙을 믿을 수 있는가?

핵심 문장:
장부에 적었다고 해서, 사람이 정산된 것은 아니다.

최종 변화 문장 후보:
태그는 가격표가 아니라, 누가 버려졌는지 남기는 기록이다.

한 줄 정의:
라파는 태그를 돈처럼 돌리던 비공식 장부를, 보급소 규칙과 미정산 책임으로 되접는 12번 플레이어블 후보이다.

출력은 아래 형식으로 작성한다.

# LEDGER-12 조건부 해소 문서 v0.1

## 문서 상태

상태:
작성 완료 v0.1

작업 성격:
LEDGER-12 조건부 통과 사유 해소 문서.
최종 프로필 v1.0 작성 아님.

대상:
Rafaela Costa / LEDGER-12 / 라파, 항만시장 태그 중개자

판정:
통과로 승격 가능 / 조건부 유지 / 보류 중 하나

다음 단계:
story/06_characters/ledger_12_profile_v1_0.md
또는 조건부 유지 사유 작성

## 0. 판정 요약

조건부 통과 사유를 해소했는지 요약한다.

## 1. 조건부 사유 목록

상세 결재에서 남은 조건을 표로 정리한다.

| 조건 | 상세 결재 상태 | 이번 문서 판정 |

## 2. 상인/블랙마켓/돈벌이 캐릭터화 차단

반드시 포함:
- 금지 직업 이미지
- 금지 전투 동사
- 허용되는 조작 동사
- 라파가 상인/블랙마켓/태그 교환 UI가 아니라 미정산 책임 보류자라는 정의

## 3. E11_C03/E11_C06 노출 범위

직접 허용:
E11_C03 항만시장 회수권
E11_C03-L01 항만시장 외곽
E11_C03-L02 노점 반품로와 화물 창고 진입부
항만시장
노점 반품로
화물 창고
비공식 물류망
거래 장부
미정산 태그
오염 태그 기록

심화 단서:
E11_C06 거리상권 회원권
거리 결제 골목
모바일 매대
거리 회원표
모바일 결제 흔적

금지 확장:
E11 전체
E11_C01
E11_C02
E11_C04
E11_C05
E11_C07
E11_C08
E12_C06
E06_C06
현실 도시/항만/시장 실명
현실 범죄 조직 패러디
빈곤/치안 클리셰

## 4. 미나와 보급소 정산 카운터 분리

반드시 표로 비교한다.

| 항목 | 미나 | LEDGER-12 라파 |

비교 항목:
위치
역할
신뢰
위험
다루는 자원
금지 중복

반드시 포함:
미나는 보급소 안에서 정산한다.
라파는 보급소 바깥에서 정산된 척하던 태그를 다시 미정산으로 남긴다.

## 5. R06 회원 등급 브로커와 분리

반드시 표로 비교한다.

| 항목 | R06 회원 등급 브로커 | LEDGER-12 라파 |

비교 항목:
트랙
원점
얼굴
다루는 압력
금지 중복

반드시 포함:
브로커는 선택권을 상품처럼 파는 사람이다.
라파는 팔린 태그가 사람을 거래 항목으로 닫기 전 장부를 되접는 사람이다.

## 6. CLAUSE-11 마라와 분리

반드시 표로 비교한다.

| 항목 | CLAUSE-11 마라 | LEDGER-12 라파 |

비교 항목:
공식/비공식
원점 캠페인
다루는 자원
위험
HP 0
금지 중복

반드시 포함:
마라는 공식 약관에 붙잡힌 사람이다.
라파는 공식 바깥에서 태그를 돈처럼 돌리던 사람이다.

## 7. 윤서/RETURN-05/R03 물류 회수 축 분리

윤서:
이루 / RETURN-05:
R03 최종 반품 심사 보류관:
라파:

라파가 다루지 않는 것:
- 현장 회수 방향
- 배송 주소
- 수취인 확인
- 반송 로그
- 미수령 보관
- 재배송 대기
- R03 반품 심사실 지역 NPC 기능

라파가 다루는 것:
- 거래 장부
- 미정산 태그
- 오염 태그 기록
- 비공식 회수품 표식
- 가격처럼 붙은 태그를 미정산 책임으로 되돌리는 판정

## 8. HP 0 / 긴급 인양 고정

작성 항목:
- HP 0 상태명
- 캠페인이 라파를 어떻게 등록하려 하는가
- 보급소가 무엇을 잡고 되당기는가
- 윤서/이루/마라/미나와 다른 점

반드시 포함:
거래 장부 이름 고정
미정산 태그 폐쇄
장부 페이지 닫힘
오염 태그 묶음
찢긴 장부 페이지
가격이 지워진 태그 홀더
오염 태그 기록의 빈칸
모바일 결제 실패 흔적

금지:
거래 실패
파산
돈 부족
암시장 거래 실패
상점 재고 소진
태그 코인 손실
거래 장부로 무료 부활

## 9. 정산 루트 잠금

관련 태그:
주 정산 자원:
보조 정산 자원:
과사용 위험:
금지 자원:

반드시 제한:
보급태그
통행태그
수신태그
미정산 태그
오염 태그 기록
거래 장부
비공식 회수품 표식
항만시장 표식
찢긴 장부 페이지
태그 홀더
모바일 결제 흔적
가격이 지워진 태그

금지:
돈
골드
현금
암시장 포인트
태그 코인
거래 마나
할인율
시세표
범용 상점 자원
태그 교환권
무료 구매권

## 10. 이름/표기 검수 상태

현재 유지:
Rafaela Costa / LEDGER-12 / 라파, 항만시장 태그 중개자

검수 보류:
포르투갈어권 원문 발음 가이드
한국어 표기
유저 노출 표기
브라질/라틴아메리카 표현 밀도
포르투갈어 대사 사용량
스페인어권 E11 지역과의 혼합 노출 정책

금지:
이름 임의 변경
포르투갈어/스페인어 대사 남용
브라질 또는 라틴아메리카 대표성 강조
현실 항만/시장/범죄 조직 패러디
빈곤/치안 클리셰로 캐릭터 설명

## 11. 해금 시점 고정

고정:
E01 초반 합류 금지.
GATE-09/BROAD-10/CLAUSE-11 이후.
9~12번 중 가장 늦게 직접 해금.
E11_C03-L01~L02 이후 직접 대면.
E11_C06은 심화 단서.

금지:
E01 R06에서 즉시 해금
미나 정산 이벤트로 즉시 합류
R06 브로커 이벤트 보상
CLAUSE-11 이벤트 보상
E11 전체 클리어 보상
E12_C06 선행 해금
상점 기능 개방 보상
태그 교환 UI 튜토리얼 보상

## 12. 프로필 v1.0 전환 가능 여부

판정:
통과로 승격 가능 / 조건부 유지 / 보류

프로필 v1.0에서 반드시 유지할 것:

프로필 v1.0에서 더 쓰면 안 되는 것:

## 13. 다음 작업

통과로 승격 가능이라면:
story/06_characters/ledger_12_profile_v1_0.md

조건부 유지라면:
남은 조건과 추가 보완 문서명을 제안한다.

중요:
답변 끝에는 다음에 만들어야 할 문서명을 제안한다.
```

---

## 6. 빠른 판정 기준

### 6.1 통과로 승격 가능

```text
상인/블랙마켓/돈벌이 캐릭터화가 차단되었다.
태그 교환 UI, 상점 할인, 돈/골드/태그 코인 자원화가 금지되었다.
E11_C03-L01~L02 노출 범위가 잠겼다.
E11_C06은 심화 단서로 제한되었다.
E12_C06 모바일머니 회원권과 E06_C06 몰 VIP 결제권을 선점하지 않는다.
미나의 보급소 정산 카운터와 라파의 외부 장부 윤리가 분리되었다.
R06 회원 등급 브로커와 선택권 상품화/팔린 태그 미정산 책임 축이 분리되었다.
CLAUSE-11 마라와 공식 약관/비공식 장부 축이 명확히 분리되었다.
윤서/RETURN-05/R03의 회수·반송·물류 심사 축을 빼앗지 않는다.
HP 0이 거래 장부 이름 고정/미정산 태그 폐쇄 직전 인양으로 고정되었다.
정산 루트가 돈/상점 자원이 아니라 미정산 태그/오염 태그 기록/거래 장부 중심으로 제한되었다.
Rafaela Costa 표기 검수 상태가 명확하다.
GATE-09/BROAD-10/CLAUSE-11 이후 9~12번 중 가장 늦게 해금되는 위치가 고정되었다.
```

### 6.2 조건부 유지

```text
캐릭터 축은 유지되지만 일부 표현이 여전히 상인/블랙마켓/돈벌이 캐릭터처럼 읽힌다.
태그 교환 UI나 상점 할인으로 오해될 자원이 남아 있다.
미나의 정산 카운터 또는 R06 브로커와 차이가 아직 약하다.
CLAUSE-11 마라와 공식/비공식 분리는 보이지만 자원명이 아직 비슷하다.
HP 0 차별화가 미정산 태그 폐쇄보다 거래 실패처럼 읽힌다.
E11_C06 또는 E12_C06을 너무 빨리 열 위험이 있다.
정산 루트가 돈/할인/상점 자원처럼 추상화된다.
```

### 6.3 보류

```text
LEDGER-12가 플레이어블보다 NPC, 상인, 장부 기록, 조건 대사로 더 강하다.
전투 리듬이 태그 윤리가 아니라 거래/환전/상점 기능에 머문다.
라파가 미나의 정산 카운터, R06 브로커, CLAUSE-11 마라의 기능을 대체한다.
E11_C03 항만시장 회수권이 캐릭터 핵심으로 보이지 않는다.
라파가 블랙마켓/범죄/빈곤/치안 클리셰로만 작동한다.
```

---

## 7. 다음 작업

```text
이 프롬프트를 사용해 story/06_characters/ledger_12_playable_condition_patch_v0_1.md를 작성한다.
작성 후 판정이 통과로 승격 가능이면 ledger_12_profile_v1_0.md 작성 프롬프트를 만든다.
조건부 유지면 남은 조건만 다시 좁혀 별도 보완 프롬프트를 만든다.
```
