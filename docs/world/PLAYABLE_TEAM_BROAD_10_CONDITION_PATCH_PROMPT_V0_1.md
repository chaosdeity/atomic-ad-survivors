# BROAD-10 조건부 해소 플레이어블팀 프롬프트 v0.1

이 문서는 플레이어블 제작팀에게 넘길 `BROAD-10 조건부 해소` 작업용 복붙 프롬프트다.

목표는 20인 로스터를 다시 검토하는 것이 아니다.
목표는 이미 조건부 통과한 10번 후보 `Nora Weiss / BROAD-10 / 노라, 공영 안내 수신자`의 조건을 해소하고, 프로필 v1.0으로 갈 수 있는지 판정하는 것이다.

---

## 0. 현재 상태

```text
완료 문서:
story/06_characters/broad_10_playable_decision_v0_1.md

현재 판정:
조건부 통과

다음 작성 문서:
story/06_characters/broad_10_playable_condition_patch_v0_1.md

작성 목표:
조건부 통과 사유 해소
프로필 v1.0 전환 가능 여부 판정

다음 단계 후보:
story/06_characters/broad_10_profile_v1_0.md
```

BROAD-10은 이미 10번 슬롯 후보로 둘 가치가 있다고 판정되었다.
이번 작업은 노라를 새로 발명하는 일이 아니다.

해야 할 일은 조건부 통과 사유를 하나씩 잠그는 것이다.

---

## 1. 작업 범위

이번 작업에서 다룰 것:

```text
BROAD-10 조건부 해소
방송인/아나운서/언론인/해커/서포터화 차단
QUIET-07과 수신 리스크 차이 고정
E07_C05-L01~L02 노출 제한
C05 계열 방송/뉴스/추천 캠페인과 분리
HP 0의 청취 확인 완료/대피 문장 자동 승인/반복 송출 동기화 고정
수신태그/안내 수신 로그/정정 방송 조각/청취 확인표/대피 문장 승인표 정산 루트 잠금
Nora Weiss 이름/현지 표기 검수 상태 정리
프로필 v1.0 전환 가능 여부 판정
```

이번 작업에서 하지 않을 것:

```text
20명 로스터 재작성
9~12번 후보 재선정
Nora Weiss 이름 임의 변경
E07 전체 지역 상세화
E09_C05 케이블뉴스 수신권 상세화
E10_C05 알고리즘 추천권 상세화
BROAD-10 프로필 v1.0 작성
NPC 노라로 전환
스킬명/수치 밸런스 확정
독일/유럽 대표 캐릭터화
현실 공영방송사 패러디
```

---

## 2. 반드시 읽을 문서

### 2.1 직접 기준

```text
story/06_characters/broad_10_playable_decision_v0_1.md
docs/world/PLAYABLE_TEAM_BROAD_10_DETAIL_PROMPT_V0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/gate_09_profile_v1_0.md
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
```

### 2.5 NPC/전역 스토리 충돌 방지

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
```

---

## 3. 핵심 잠금

BROAD-10의 핵심 질문은 유지한다.

```text
공식 안내가 계속 반복되면,
그것은 도움인가 명령인가?
```

핵심 문장:

```text
분명하게 들린다고 해서,
동의한 것은 아니다.
```

최종 변화 문장 후보:

```text
정확한 문장도 사람을 대신 살아주지는 못한다.
```

BROAD-10은 방송을 만드는 캐릭터가 아니다.
BROAD-10은 방송을 해킹하는 캐릭터도 아니다.
BROAD-10은 공식 안내가 사람을 이미 들은 사람, 이미 확인한 사람, 이미 대피 문장에 동의한 사람으로 확정하기 전의 판정을 늦추는 캐릭터다.

---

## 4. 조건부 통과 사유

아래 8개 조건을 반드시 해소한다.

### 4.1 방송인/아나운서/언론인/해커/서포터화 차단

금지:

```text
라디오 DJ
아나운서
언론인 영웅
방송국 내부자
정보 해커
노트북 해킹 캐릭터
소리 마법사
음파 공격 캐릭터
버프/디버프 서포터
광역 안내 지휘관
프로파간다 선동가
세계 진실 폭로자
독일 공영방송 대표 캐릭터
유럽 지식인 이미지 캐릭터
```

고정:

```text
노라는 공영 안내를 만드는 사람이 아니라,
공영 안내가 사람을 안전한 수신자로 등록하려는 절차에 붙잡힌 사람이다.
```

조건부 해소 문서에서 반드시 할 일:

```text
방송인처럼 보이는 요소를 모두 제거한다.
해커처럼 보이는 조작 동사를 금지한다.
서포터 클래스처럼 팀 전체를 강화하는 기능을 금지한다.
공영 안내 수신 절차의 피해자이자 판정 지연자로 고정한다.
```

### 4.2 QUIET-07과 수신 리스크 차이 고정

반드시 비교한다.

```text
QUIET-07 백여울:
낮은 수신.
약한 인양.
덜 들키지만 덜 구해진다.
침묵권의 유지 비용과 보급소 회수선의 약함을 담당한다.

BROAD-10 노라:
공식 수신 과잉.
청취 확인 압박.
대피 문장 승인 압박.
반복 송출 동기화.
너무 잘 들려 더 쉽게 등록된다.
```

금지:

```text
노라를 침묵권 피난자 2호로 만들지 않는다.
노라의 능력을 단순 전파 차단으로 만들지 않는다.
노라의 HP 0을 수신 공백/저소음 비콘 지연으로 쓰지 않는다.
노라가 여울보다 침묵권을 잘 다루게 하지 않는다.
```

고정 문장 후보:

```text
여울은 덜 들려서 늦게 구해지고,
노라는 너무 잘 들려서 빨리 등록된다.
```

### 4.3 E07_C05-L01~L02 노출 범위 제한

조건부 해소 단계에서는 E07 전체를 열지 않는다.

허용:

```text
E07_C05-L01 공영 스튜디오 외곽
E07_C05-L02 안내 라디오탑
안내 수신소
반복 전광판
재난 안내 문구
청취 확인 로그
대피 문장 승인표
다국어 안내 선택 실패
정정 방송 조각
미승인 청취 로그
```

금지:

```text
E07 전체 도시 투어
E07_C02 보험통합 진료권 상세화
E07_C03 철도물류 반품권 상세화
E07_C07 통관철도 통행권 상세화
유럽 정치/국경/복지 설명
독일 현실 지명 전면 노출
공영방송사 실명 패러디
E09_C05 케이블뉴스 수신권 선점
E10_C05 알고리즘 추천권 선점
```

노출 잠금:

```text
노라는 E07을 소개하는 캐릭터가 아니다.
노라는 E07_C05 공영안내 수신권의 첫 플레이어블 관점이다.
```

### 4.4 C05 계열 방송/뉴스/추천 캠페인과 분리

반드시 비교한다.

```text
E01_C05 마지막 수신탑:
방송 중추, 반복 뉴스, 세계 진실 미스터리, 마지막 앵커 송출실.

E02_C05 재난안내 생방송권:
도시 방재 생방송, 반복 안내 전광판, 생방송 안내 절차.

E07_C05 공영안내 수신권:
공영 안내, 청취 확인, 대피 문장 승인, 안내 라디오탑.

E09_C05 케이블뉴스 수신권:
뉴스 구독, 케이블 중계, 미디어 프로필, 구독자 등록.

E10_C05 알고리즘 추천권:
개인화 추천, 모델 학습, 광고 피드, 추천 대상 등록.
```

BROAD-10은 `방송/추천 일반` 캐릭터가 아니다.
BROAD-10은 `공영 안내 수신` 캐릭터다.

조건부 해소 문서에서 반드시 할 일:

```text
각 C05 계열과 노라가 무엇을 하지 않는지 표로 분리한다.
E09/E10은 심화 후보로만 둔다.
E01_C05 세계 진실 미스터리를 노라가 조기 폭로하지 않게 한다.
```

### 4.5 HP 0 / 긴급 인양 차별화

HP 0은 사망/부활이 아니다.

BROAD-10의 HP 0 후보:

```text
청취 확인 완료
대피 문장 자동 승인
공영 안내 문구에 프로필 고정
반복 송출 동기화
안전 문장 수신자 처리
미승인 청취 로그 폐쇄
```

보급소 인양 방식:

```text
정정 방송 조각
미승인 청취 로그
라디오 잡음 좌표
반복 전광판의 빈 줄
수신태그 역송출 비콘
대피 문장 승인표의 미서명 칸
```

차별화:

```text
윤서:
현장 회수/잘못 붙은 태그에서 인양.

백여울:
수신 공백/저소음 비콘 지연/인양 지연.

리오:
객실 초기화/체크아웃 처리 직전 객실 카드 비콘.

미카:
개찰 미통과/막차 탑승 실패/플랫폼 잔류 처리 직전 인양.

노라:
청취 확인 완료/대피 문장 자동 승인/반복 송출 동기화 직전,
미승인 청취 로그와 정정 방송 조각을 보급소가 되당긴다.
```

금지:

```text
수신 공백
저소음 비콘 지연
방송 탑 붕괴
라디오 폭발
진실 폭로 실패
신호 차단 실패
```

### 4.6 정산 루트 제한

BROAD-10의 정산/자원은 아래로 제한한다.

주 태그:

```text
수신태그
```

보조 태그:

```text
통행태그
보급태그는 보조 후보로만 사용
```

정산 자원:

```text
안내 수신 로그
정정 방송 조각
청취 확인표
대피 문장 승인표
반복 송출 잔향
미승인 청취 로그
전광판 빈 줄
```

금지:

```text
방송 포인트
여론 게이지
정보 해킹 자원
뉴스 구독료
알고리즘 추천 점수
범용 마나/음파 에너지
```

과사용 위험:

```text
공식 안내가 너무 선명해져 노라의 프로필을 안전한 수신자로 다시 고정한다.
```

### 4.7 이름/표기 검수

현재 후보:

```text
본명:
Nora Weiss

코드명:
BROAD-10

유저 첫 표기:
노라, 공영 안내 수신자
```

조건부 해소 문서에서는 독일어 원문 표기를 확정하지 않아도 된다.
다만 프로필 v1.0 전에 검수 필요 상태로 남긴다.

금지:

```text
Nora Weiß 등 현지 표기를 검수 없이 확정
독일어 대사 남용
독일/유럽 대표성 강조
현실 방송사/정치권 암시
관광풍 별명 부여
```

표기 잠금:

```text
검수 전 문서에서는 Nora Weiss를 기본 표기로 쓴다.
유저 첫 표기는 노라, 공영 안내 수신자로 유지한다.
```

### 4.8 해금 시점 명확화

고정:

```text
BROAD-10은 E01 초반 합류자가 아니다.
BROAD-10은 GATE-09 이후 중반 외부 광역권 후보로 둔다.
직접 해금은 E07_C05 수신소 또는 공영 안내 라디오탑 이후로 제한한다.
```

금지:

```text
E01 R05 방송 중추에서 바로 해금
E02 재난안내 생방송권에서 바로 해금
E07 전체 개방 보상으로 해금
R08 침묵권에서 수신 캐릭터로 선등장
세븐의 정보 분석 이벤트를 통해 즉시 합류
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 10번 플레이어블 후보 BROAD-10 조건부 해소 문서를 작성한다.

이번 작업 대상:
Nora Weiss / BROAD-10 / 노라, 공영 안내 수신자

현재 판정:
조건부 통과

완료된 상세 결재 문서:
story/06_characters/broad_10_playable_decision_v0_1.md

이번 작성 목표 문서:
story/06_characters/broad_10_playable_condition_patch_v0_1.md

목표:
방송인/해커/서포터가 아니라,
공영 안내가 사람을 안전한 수신자/청취 확인 완료자/대피 문장 승인자로 확정하기 전의 판정을 늦추는 플레이어블 후보로 BROAD-10을 잠근다.

중요:
20명 로스터를 다시 만들지 않는다.
Nora Weiss 이름을 임의로 바꾸지 않는다.
프로필 v1.0을 아직 작성하지 않는다.
이번 문서는 조건부 해소 문서다.

반드시 아래 문서를 우선순위대로 읽고 판단한다.

직접 기준:
1. story/06_characters/broad_10_playable_decision_v0_1.md
2. docs/world/PLAYABLE_TEAM_BROAD_10_DETAIL_PROMPT_V0_1.md
3. docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
4. story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
5. story/06_characters/playable_20_name_registry_v0_1.md
6. story/06_characters/playable_20_roster_blueprint_v0_1.md
7. story/06_characters/gate_09_profile_v1_0.md

세계/시스템 기준:
8. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
9. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
10. docs/world/WORLD_LORE_LOCK_V0_1.md
11. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
12. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
13. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
14. docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md

지도/캠페인 기준:
15. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
16. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
17. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
18. docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md

기존 캐릭터 충돌 방지:
19. story/06_characters/yunseo_profile_v1_0.md
20. story/06_characters/patch_profile_v1_0.md
21. story/06_characters/open_host_profile_v1_0.md
22. story/06_characters/discharge_hold_patient_profile_v1_0.md
23. story/06_characters/return_recipient_profile_v1_0.md
24. story/06_characters/meter_06_profile_v1_0.md
25. story/06_characters/quiet_07_profile_v1_0.md
26. story/06_characters/rio_08_profile_v1_0.md
27. story/06_characters/gate_09_profile_v1_0.md

조건부 해소 항목:
1. 방송인/아나운서/언론인/해커/서포터화 차단.
2. QUIET-07과의 수신 리스크 차이 고정.
3. E07_C05-L01~L02 노출 제한.
4. C05 계열 방송/뉴스/추천 캠페인과 분리.
5. HP 0의 청취 확인 완료/대피 문장 자동 승인/반복 송출 동기화 고정.
6. 수신태그, 안내 수신 로그, 정정 방송 조각, 청취 확인표, 대피 문장 승인표의 정산 루트 고정.
7. Nora Weiss 이름/현지 표기 검수 상태 정리.
8. GATE-09 이후 중반 외부 광역권 후보라는 해금 시점 고정.

핵심 질문:
공식 안내가 계속 반복되면, 그것은 도움인가 명령인가?

핵심 문장:
분명하게 들린다고 해서, 동의한 것은 아니다.

최종 변화 문장 후보:
정확한 문장도 사람을 대신 살아주지는 못한다.

출력은 아래 형식으로 작성한다.

# BROAD-10 조건부 해소 문서 v0.1

## 문서 상태

상태:
작성 완료 v0.1

작업 성격:
BROAD-10 조건부 통과 사유 해소 문서.
최종 프로필 v1.0 작성 아님.

판정:
통과로 승격 가능 / 조건부 유지 / 보류 중 하나

다음 단계:
story/06_characters/broad_10_profile_v1_0.md
또는 조건부 유지 사유 작성

## 0. 판정 요약

조건부 통과 사유 8개를 해소했는지 요약한다.

## 1. 조건부 사유 목록

상세 결재에서 남은 조건을 표로 정리한다.

| 조건 | 상세 결재 상태 | 이번 문서 판정 |

## 2. 방송인/해커/서포터화 차단

반드시 포함:
- 금지 직업 이미지
- 금지 전투 동사
- 허용되는 조작 동사
- 노라가 공영 안내 제작자가 아니라 수신 절차에 붙잡힌 사람이라는 정의

## 3. QUIET-07과 수신 리스크 분리

반드시 표로 비교한다.

| 항목 | QUIET-07 백여울 | BROAD-10 노라 |

비교 항목:
수신 상태
위험
인양 방식
HP 0
전투 리듬
정산 자원
금지 중복

## 4. E07_C05-L01~L02 노출 범위

허용 로컬:
E07_C05-L01 공영 스튜디오 외곽
E07_C05-L02 안내 라디오탑
안내 수신소
반복 전광판
청취 확인 로그
대피 문장 승인표
정정 방송 조각

금지 확장:
E07 전체
E07_C02
E07_C07
E09_C05
E10_C05
실제 방송사명
현실 정치권

## 5. C05 계열 캠페인 분리

아래 캠페인을 반드시 비교한다.

E01_C05:
E02_C05:
E07_C05:
E09_C05:
E10_C05:

BROAD-10이 무엇을 하지 않는지 명확히 쓴다.

## 6. HP 0 / 긴급 인양 고정

작성 항목:
- HP 0 상태명
- 캠페인이 노라를 어떻게 등록하려 하는가
- 보급소가 무엇을 잡고 되당기는가
- 윤서/여울/리오/미카와 다른 점

반드시 포함:
청취 확인 완료
대피 문장 자동 승인
공영 안내 문구에 프로필 고정
반복 송출 동기화
미승인 청취 로그
정정 방송 조각
대피 문장 승인표의 미서명 칸

## 7. 정산 루트 잠금

관련 태그:
주 정산 자원:
보조 정산 자원:
과사용 위험:
금지 자원:

반드시 제한:
수신태그
통행태그
안내 수신 로그
정정 방송 조각
청취 확인표
대피 문장 승인표
반복 송출 잔향

## 8. 이름/표기 검수 상태

현재 유지:
Nora Weiss / BROAD-10 / 노라, 공영 안내 수신자

검수 보류:
독일어 원문 표기
현지 표기 변형
유저 노출 표기

금지:
검수 없는 Nora Weiß 확정
독일어 대사 남용
현실 공영방송 패러디

## 9. 해금 시점 고정

고정:
GATE-09 이후 중반 외부 광역권 후보.
E07_C05 수신소 또는 공영 안내 라디오탑 이후.
E01 초반 합류 금지.

금지:
E01 R05에서 즉시 해금
R08 침묵권에서 수신 캐릭터로 선등장
E07 전체 클리어 보상
세븐 정보 분석 이벤트로 즉시 합류

## 10. 프로필 v1.0 전환 가능 여부

판정:
통과로 승격 가능 / 조건부 유지 / 보류

프로필 v1.0에서 반드시 유지할 것:

프로필 v1.0에서 더 쓰면 안 되는 것:

## 11. 다음 작업

통과로 승격 가능이라면:
story/06_characters/broad_10_profile_v1_0.md

조건부 유지라면:
남은 조건과 추가 보완 문서명을 제안한다.

중요:
답변 끝에는 다음에 만들어야 할 문서명을 제안한다.
```

---

## 6. 빠른 판정 기준

### 6.1 통과로 승격 가능

```text
방송인/해커/서포터화가 차단되었다.
QUIET-07과 수신 리스크가 명확히 반대로 분리되었다.
E07_C05-L01~L02 노출 범위가 잠겼다.
C05 계열 다른 방송/뉴스/추천 캠페인을 선점하지 않는다.
HP 0이 청취 확인 완료/대피 문장 자동 승인/반복 송출 동기화 직전 인양으로 고정되었다.
정산 루트가 수신태그/안내 수신 로그/정정 방송 조각/청취 확인표 중심으로 제한되었다.
Nora Weiss 표기 검수 상태가 명확하다.
GATE-09 이후 중반 외부 광역권 후보라는 해금 위치가 고정되었다.
```

### 6.2 조건부 유지

```text
캐릭터 축은 유지되지만 일부 표현이 여전히 방송인/해커/서포터처럼 읽힌다.
QUIET-07과 HP 0 차이가 아직 약하다.
E07_C05 범위가 E07 전체 소개로 넓어진다.
E09_C05/E10_C05 심화 후보를 너무 빨리 선점한다.
정산 루트가 정보 포인트나 방송 포인트처럼 추상화된다.
```

### 6.3 보류

```text
BROAD-10이 플레이어블보다 NPC나 안내 방송 기록으로 더 강하다.
전투 리듬이 청취 확인/정정/승인 보류가 아니라 정보 제공에 머문다.
노라가 세븐의 분석 기능이나 여울의 수신 리스크를 대체한다.
E07_C05 공영안내 수신권이 캐릭터 핵심으로 보이지 않는다.
```

---

## 7. 다음 작업

```text
이 프롬프트를 사용해 story/06_characters/broad_10_playable_condition_patch_v0_1.md를 작성한다.
작성 후 판정이 통과로 승격 가능이면 broad_10_profile_v1_0.md 작성 프롬프트를 만든다.
조건부 유지면 남은 조건만 다시 좁혀 별도 보완 프롬프트를 만든다.
```
