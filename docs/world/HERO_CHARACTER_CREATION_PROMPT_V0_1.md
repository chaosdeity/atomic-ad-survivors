# Atomic Ad Survivors 영웅 생성 프롬프트 v0.1

이 문서는 `Atomic Ad Survivors`의 플레이어블 영웅을 한 명씩 상세화할 때 쓰는 복붙용 프롬프트다.

여기서 영웅은 세상을 구하는 초인이나 직업 클래스가 아니다.

```text
영웅은 특정 캠페인을 다르게 읽는 플레이어블 관점이다.
```

이 프롬프트의 목적은 20인 로스터를 다시 나열하는 것이 아니다.
목적은 이미 잡힌 슬롯 하나를 결재 가능한 플레이어블 캐릭터로 깊게 만드는 것이다.

---

## 0. 현재 진행 상태

```text
플레이어블 20인 로스터 설계도:
완료
story/06_characters/playable_20_roster_blueprint_v0_1.md

이름 레지스트리:
완료
story/06_characters/playable_20_name_registry_v0_1.md

1번:
윤서 / YUNSEO-01 / 현장 회수자

2번:
PATCH / PATCH-02 / 보급소 수리 로봇

3번:
OPEN-HOST / 서이겸 / 전직 오픈하우스 안내인
R01 NPC 선등장 후 플레이어블 전환 후보

4번:
강하람 / HOLD-04 / 하람, 퇴원 보류자
프로필 v1.0 고정

5번:
한이루 / RETURN-05 / 이루, 반송 수취인
프로필 v1.0 고정

6번:
차유건 / METER-06 / 유건, 폐충전소 계량자
프로필 v1.0 고정

7번:
백여울 / QUIET-07 / 여울, 침묵권 피난자
프로필 v1.0 고정

8번:
리오 / RIO-08 / 리오, 객실 정리 로봇
프로필 v1.0 고정

9~12번 후보군:
9 Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자
10 Nora Weiss / BROAD-10 / 노라, 공영 안내 수신자
11 Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원
12 Rafaela Costa / LEDGER-12 / 라파, 항만시장 태그 중개자

현재 다음 상세화 우선순위:
9번 후보 상세 결재
```

---

## 1. 사용 원칙

이 프롬프트를 사용할 때는 한 번에 한 명만 다룬다.

금지:

```text
20명 전체 재작성
새 로스터 대량 제안
직업 클래스 목록화
초능력 히어로화
국적/이름 무작위 생성
캠페인과 무관한 멋있는 전투 콘셉트
NPC와 플레이어블 역할 혼합
```

반드시 지킬 것:

```text
1. 캐릭터는 캠페인을 다르게 읽는 관점이어야 한다.
2. 전투 리듬은 해당 캠페인의 절차/태그/인양 규칙에서 나와야 한다.
3. HP 0은 사망/부활이 아니라 긴급 인양/등록 실패/심사 재개/보류 취소로 해석한다.
4. 이름, 국적, 현실 위치는 관리자용 지도 기준과 맞춘다.
5. 유저에게는 실명 지명을 숨길 수 있지만, 제작자는 실제 권역을 알아야 한다.
6. E01 초반에 8명 주인공이 모두 있는 구조로 만들지 않는다.
7. 9번 이후는 각 현실 광역권과 캠페인 생태에 맞춰 현지명/다국적 이름을 우선한다.
8. 로봇은 사람 이름을 억지로 붙이지 않는다.
9. NPC로 더 강한 캐릭터는 플레이어블로 당기지 않는다.
```

---

## 2. 반드시 읽을 문서

### 2.1 세계 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
docs/world/WORLD_LORE_LOCK_V0_1.md
docs/world/LEGACY_TERM_MIGRATION_V0_1.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
```

### 2.2 지도/캠페인 기준

```text
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md
docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md
docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md
```

### 2.3 플레이어블 기준

```text
story/06_characters/character_npc_creation_context_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md

story/06_characters/yunseo_profile_v1_0.md
story/06_characters/patch_profile_v1_0.md
story/06_characters/open_host_profile_v1_0.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
```

### 2.4 R01/NPC 충돌 방지 기준

```text
story/03_regions/r01_document_index_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
```

---

## 3. 복붙용 프롬프트

```text
Atomic Ad Survivors의 플레이어블 영웅 한 명을 상세화하려고 한다.

이번 작업 대상:
[슬롯 번호]
[이름 / 코드명 / 유저 첫 표기]
[출신 캠페인권 또는 지역]
[현재 판정 상태: 후보 / 조건부 통과 / 통과로 승격 가능 / 프로필 v1.0 필요]

목표:
이 캐릭터를 직업 클래스나 멋있는 전투 캐릭터가 아니라,
해당 캠페인을 다르게 읽는 플레이어블 관점으로 결재한다.

중요:
20명 전체 로스터를 다시 만들지 않는다.
이름을 대량으로 새로 뽑지 않는다.
이번 슬롯 하나만 상세화한다.

반드시 아래 문서를 우선순위대로 읽고 판단한다.

세계 기준:
1. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
2. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
3. docs/world/WORLD_LORE_LOCK_V0_1.md
4. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
5. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
6. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md

지도/캠페인 기준:
7. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
8. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
9. docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
10. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
11. docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md

플레이어블 기준:
12. story/06_characters/character_npc_creation_context_v0_1.md
13. story/06_characters/playable_20_roster_blueprint_v0_1.md
14. story/06_characters/playable_20_name_registry_v0_1.md
15. story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md
16. story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md

이미 프로필 v1.0이 있는 캐릭터:
17. story/06_characters/yunseo_profile_v1_0.md
18. story/06_characters/patch_profile_v1_0.md
19. story/06_characters/discharge_hold_patient_profile_v1_0.md
20. story/06_characters/return_recipient_profile_v1_0.md
21. story/06_characters/meter_06_profile_v1_0.md
22. story/06_characters/quiet_07_profile_v1_0.md
23. story/06_characters/rio_08_profile_v1_0.md

NPC 충돌 방지:
24. story/03_regions/r01_document_index_v0_1.md
25. story/03_regions/r01_campaign1_npc_roster_v0_1.md
26. story/03_regions/r01_npc_data_schema_application_v0_1.md
27. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md

판정 기준:
1. 이 캐릭터가 플레이어블이어야 하는 이유를 먼저 판정한다.
2. NPC로 남는 것이 더 강하면 플레이어블 통과시키지 않는다.
3. 기존 플레이어블과 전투 리듬, 태그 정산, HP 0, 해금 지역, 감정 질문이 겹치면 보류한다.
4. 한국인/E01 인간 슬롯은 이미 앞쪽에 많으므로, 9번 이후는 관리자용 현실 위치와 캠페인권에 맞는 현지명/다국적 이름을 우선한다.
5. E01 초반에 8명 주인공이 모두 있는 구조로 만들지 않는다.
6. 해금 시점은 캠페인 지도와 실제 지역 배치에 맞춰야 한다.

출력은 아래 형식으로 작성한다.

# [캐릭터명] / [코드명] / [유저 첫 표기] 플레이어블 상세 결재 v0.1

## 문서 상태

상태:
스토리팀/시스템팀 결재용 v0.1

판정:
통과 / 조건부 통과 / 보류 / 탈락 중 하나

용도:
이 캐릭터의 플레이어블 자격, 캠페인 축, 전투 리듬, 태그 정산, HP 0, 해금 조건, 금지 방향을 고정한다.

## 0. 판정 요약

이 캐릭터가 플레이어블로 통과/조건부 통과/보류/탈락인 이유를 짧게 정리한다.

## 1. 한 줄 정의

직업이 아니라 생존 방식으로 정의한다.

예:
퇴원 보류자는 힐러가 아니라, 퇴원/재입원/심사 보류 리듬을 전투화한 사람이다.

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
첫 해금 시점:
플레이어블 전환 방식:

## 3. 핵심 오판

이 캐릭터가 잘못 믿는 것을 하나로 고정한다.

형식:
이 캐릭터는 [잘못된 믿음]을 믿는다.
이 믿음은 일부 맞다.
하지만 [캠페인 구조] 때문에 위험하다.

## 4. 플레이어블이어야 하는 이유

이 캐릭터가 NPC가 아니라 플레이어블이어야 하는 이유를 설명한다.

반드시 포함:
- 플레이어가 이 캐릭터로 캠페인을 다르게 읽는 지점
- 윤서/PATCH/리오/기존 후보와 겹치지 않는 지점
- 전투 리듬으로 변환 가능한 지점

## 5. 전투 리듬

전투 방식은 초능력이나 직업 스킬이 아니라 캠페인 절차에서 나온다.

작성 항목:
- 기본 리듬
- 위험한 강점
- 실패 시 후폭풍
- 플레이어 조작감
- 파티/동행 시 역할

## 6. 태그 / 정산 / 자원

관련 태그:
주 정산 자원:
보조 정산 자원:
상태값 반응:
과사용 위험:

## 7. HP 0 / 긴급 인양 차별화

사망/부활로 쓰지 않는다.

작성 항목:
- HP 0 상태명
- 보급소가 어떻게 되당기는가
- 캠페인이 어떻게 다시 등록하려 하는가
- 다른 캐릭터의 HP 0과 다른 점

## 8. 해금 조건

첫 암시:
첫 대면:
동행 또는 임시 조작:
정식 해금:
해금 보류 조건:

E01 초반에 억지로 넣지 않는다.
관리자용 현실 위치와 지역 캠페인 개방 순서를 따른다.

## 9. 관계선

반드시 기존 캐릭터와 비교한다.

윤서:
PATCH:
OPEN-HOST:
리오:
해당 지역 NPC:
충돌하는 R01 NPC 또는 보급소 NPC:

## 10. 대표 대사

첫 만남:
전투 시작:
태그 부족:
HP 0 직전:
긴급 인양 후:
성장 후:

대사는 시스템 설명이 아니라 캐릭터의 잘못된 믿음과 캠페인 압력을 보여줘야 한다.

## 11. 비주얼 / 사운드 방향

핵심 이미지:
실루엣:
색감:
사운드:
UI 아이콘 후보:

## 12. 금지 방향

이 캐릭터를 만들 때 절대 하면 안 되는 방향을 적는다.

예:
단순 힐러화
전기 마법사화
정찰꾼화
NPC 기능 흡수
지역 캠페인과 무관한 직업화

## 13. 성장 방향

초기:
중반:
후반:
최종 변화 문장:

## 14. 프로필 v1.0 전환 조건

조건부 통과라면 무엇을 해결해야 v1.0으로 갈 수 있는지 적는다.

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
예:
story/06_characters/[code]_playable_decision_v0_1.md
또는
story/06_characters/[code]_profile_v1_0.md
```

---

## 4. 9번 후보용 즉시 사용 버전

아래는 현재 다음 작업인 9번 미카 상세 결재에 바로 쓰는 버전이다.

```text
Atomic Ad Survivors의 9번 플레이어블 후보를 상세 결재하려고 한다.

대상:
Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자

출신 축:
E02_C07 지하철 환승 심사권

관리자용 현실 위치:
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md 기준으로 확인한다.

현재 상태:
9~12번 중반 플레이어블 후보군 선정 완료.
9번은 첫 외부/일본권 후보이며, 상세 결재 대상이다.

목표:
미카를 단순 교통 캐릭터, 빠른 이동 캐릭터, 개찰구 도둑, 지하철 안내원으로 만들지 않는다.
핵심은 막차/환승/승차권/심사/미탑승/귀환선의 리듬이다.

반드시 판단할 것:
1. 미카가 플레이어블이어야 하는가, 아니면 E02 NPC가 더 맞는가?
2. 윤서의 회수선, 차유건의 계량, 백여울의 침묵권과 겹치지 않는가?
3. 교통 캠페인에서 HP 0은 사망이 아니라 무엇인가?
4. 막차 환승 심사가 전투 리듬으로 어떻게 변하는가?
5. E02 실제 권역과 이름/언어권/해금 시점이 맞는가?
6. 초반 E01에 억지로 넣지 않고 중반 개방으로 운용되는가?

출력 형식은 `HERO_CHARACTER_CREATION_PROMPT_V0_1.md`의 3번 복붙용 프롬프트 형식을 따른다.
```

---

## 5. 금지 방향 총괄

영웅 생성 작업 전체에서 금지한다.

```text
직업 클래스 먼저 만들기
무기부터 만들기
스킬 이름부터 만들기
국적과 이름을 장식으로 쓰기
현실 위치를 나중에 끼워 맞추기
E01에 모든 주인공을 몰아넣기
NPC 기능을 플레이어블이 흡수하기
로봇마다 사람 이름 붙이기
모든 캐릭터를 한국인으로 유지하기
9번 이후 외부 캠페인을 한국식 이름으로 통일하기
HP 0을 죽음/부활로 처리하기
```

권장 방향:

```text
캠페인 절차에서 전투 리듬을 뽑는다.
잘못된 믿음 하나를 캐릭터 엔진으로 둔다.
해당 지역의 현실 인프라를 관리자용으로 명시한다.
유저 첫 표기는 기능이 보이게 둔다.
본명은 사람으로 돌아오는 틈으로 사용한다.
```

---

## 6. 다음 작업

```text
1. 이 프롬프트를 사용해 9번 Mika Arakawa / GATE-09 상세 결재를 진행한다.
2. 결과 문서는 story/06_characters/gate_09_playable_decision_v0_1.md로 작성한다.
3. 통과/조건부 통과 후 필요한 경우 condition patch 문서를 작성한다.
4. 최종 통과 시 story/06_characters/gate_09_profile_v1_0.md로 프로필을 고정한다.
```
