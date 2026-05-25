# GUARD-13 조건부 해소 플레이어블팀 프롬프트 v0.1

이 문서는 플레이어블 제작팀에게 넘길 `GUARD-13 조건부 해소` 작업용 복붙 프롬프트다.

목표는 20인 로스터를 다시 검토하는 것이 아니다.
목표는 이미 조건부 통과한 13번 후보 `전태주 / GUARD-13 / 태주, 보호자 등록 거부자`의 조건부 사유를 해소하고, 프로필 v1.0으로 갈 수 있는지 판정하는 것이다.

핵심:

```text
GUARD-13은 의사, 간호사, 힐러, 탱커, 보디가드, 법적 보호자 영웅이 아니다.

GUARD-13은 타인의 치료 접근권이
보호자/보증인 서명으로 담보 잡히기 전
그 책임 칸을 비워 두는 13번 플레이어블 후보이다.
```

---

## 0. 현재 상태

```text
완료 문서:
story/06_characters/guard_13_pre_decision_review_v0_1.md
story/06_characters/guard_13_playable_decision_v0_1.md

현재 판정:
조건부 통과

다음 작성 문서:
story/06_characters/guard_13_playable_condition_patch_v0_1.md

작성 목표:
조건부 통과 사유 해소
프로필 v1.0 전환 가능 여부 판정

다음 단계 후보:
story/06_characters/guard_13_profile_v1_0.md
```

GUARD-13은 이미 13번 슬롯 후보로 둘 가치가 있다고 판정되었다.
이번 작업은 GUARD-13을 새로 발명하는 일이 아니다.

해야 할 일은 상세 결재에서 남긴 조건부 사유를 하나씩 잠그는 것이다.

---

## 1. 작업 범위

이번 작업에서 다룰 것:

```text
GUARD-13 조건부 해소
전태주 이름/국적/언어권 재검토
E12_C02 이동진료 승인권 원점 잠금
E04_C02 열대격리 진료권 보조 후보 제한
E01/R02 의료 후속 직접 원점 보류
HOLD-04 강하람과 환자/보호자 축 분리
R02 퇴원 불가 심사 대리 얼굴 및 의료 NPC 기능 침범 금지
힐러/탱커/보디가드/법률 보호자 영웅화 차단
보호자 서명/보증인 칸/호출벨/임시 서약서/치료 접근권 담보 판정 지연 고정
HP 0의 보호자 서명 확정 / 치료 접근권 담보 고정 차별화
E12_C02 현실권 표현 밀도와 실명 노출 검수 상태 정리
프로필 v1.0 전환 가능 여부 판정
```

이번 작업에서 하지 않을 것:

```text
20명 로스터 재작성
13~20번 전체 후보 재선정
GUARD-13 프로필 v1.0 작성
전태주 이름 무검수 최종 확정
전태주 이름 임의 폐기
E12 전체 광역권 상세화
E12_C01 해안정착 거주권 상세화
E12_C03 자원항만 회수권 상세화
E12_C04 마이크로그리드 충전권 상세화
E12_C05 모바일방송 수신권 상세화
E12_C06 모바일머니 회원권 선점
E12_C07 항만검문 통행권 상세화
E12_C08 우물/창고 보급권 선점
E04_C02 전체 상세화
E01 R02 의료/보험 반복
HOLD-04 기능 침범
R02 퇴원 불가 심사 대리 얼굴 기능 침범
의사/간호사/힐러/탱커/보디가드 캐릭터화
법률 보호자 드라마로 단순화
가족 신파 중심 캐릭터화
스킬명/수치 밸런스 확정
스토리 본문 작성
현실 도시/병원/구호단체 실명 노출
```

---

## 2. 반드시 읽을 문서

### 2.1 직접 기준

```text
story/06_characters/guard_13_playable_decision_v0_1.md
docs/world/PLAYABLE_TEAM_GUARD_13_DETAIL_PROMPT_V0_1.md
story/06_characters/guard_13_pre_decision_review_v0_1.md
docs/world/PLAYABLE_TEAM_GUARD_13_PRE_DECISION_REVIEW_PROMPT_V0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/character_npc_creation_context_v0_1.md
story/06_characters/playable_global_npc_link_matrix_v0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md
docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md
```

### 2.2 1~12번 플레이어블 기준

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
story/06_characters/ledger_12_profile_v1_0.md
```

### 2.3 충돌 방지 기준

```text
story/06_characters/discharge_hold_patient_playable_decision_v0_1.md
story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/03_regions/r02_discharge_review_face_profile_v1_0.md
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/global_npc_story_seed_registry_v0_1.md
story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
story/03_regions/global_npc_name_location_exposure_registry_v0_1.md
```

### 2.4 세계/지도/시스템 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
docs/world/WORLD_LORE_LOCK_V0_1.md
docs/world/LEGACY_TERM_MIGRATION_V0_1.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md
```

---

## 3. 상세 결재에서 이어받을 조건부 사유

아래 조건을 반드시 해소한다.

```text
1. 전태주 이름은 최종 확정 금지 상태다.
2. E12_C02 이동진료 승인권을 원점으로 삼으면 이름/국적/언어권 재검토가 필요하다.
3. E12_C02 원점은 우선 후보지만 아직 프로필 v1.0 잠금 전이다.
4. E04_C02 열대격리 진료권은 보조 후보로만 제한해야 한다.
5. E01/R02 의료 후속 직접 원점은 보류해야 한다.
6. HOLD-04와 환자/퇴원 보류/보험 심사 축이 겹치면 안 된다.
7. R02 의료 NPC와 병원 행정 얼굴 기능이 겹치면 안 된다.
8. 전투 리듬이 힐러/탱커/보디가드/법률 보호자 이미지로 새면 안 된다.
9. HP 0은 보호자 서명 확정 / 치료 접근권 담보 고정으로 고정해야 한다.
```

조건부 해소 문서는 위 조건을 단순 반복하지 말고, 각 조건에 대해 `해소 / 일부 해소 / 미해소`를 판정해야 한다.

---

## 4. 핵심 잠금

핵심 질문:

```text
내가 서명하면,
누구의 치료권이 담보가 되는가?
```

핵심 문장:

```text
보호자란 이름이 붙어도,
사람을 맡길 수 있다는 뜻은 아니다.
```

최종 변화 문장 후보:

```text
보호는 대신 서명하는 일이 아니라,
닫히는 접근권을 다시 사람 쪽에 남기는 일이다.
```

한 줄 정의:

```text
GUARD-13은 타인의 치료 접근권이 보호자/보증인 서명으로 담보 잡히기 전,
그 책임 칸을 비워 두는 13번 플레이어블 후보이다.
```

잘못 믿는 것:

```text
보호자 등록을 거부하면
책임에서 벗어날 수 있다고 믿는다.
```

해소 문서의 핵심은 "거부"를 해방으로 고정하는 것이 아니다.
거부만으로는 누군가의 치료 접근권이 열리지 않는다. GUARD-13은 닫히는 접근권을 사람 쪽에 남기는 법을 배워야 한다.

---

## 5. 이름/국적/언어권 해소

조건부 해소 문서에서 가장 먼저 처리할 항목이다.

현재 표기:

```text
임시 본명:
전태주

코드명:
GUARD-13

유저 첫 표기 임시안:
태주, 보호자 등록 거부자
```

조건부 해소 문서에서는 아래 셋 중 하나를 판정한다.

### 5.1 전태주 유지 가능

이 판정은 엄격하게 쓴다.

가능 조건:

```text
E12_C02 이동진료 승인권에서 전태주라는 이름이 관리자 설정상 성립하는 이유가 있다.
이름이 한국어권 대표 캐릭터의 무리한 전역 배치처럼 보이지 않는다.
현실 도시/병원/구호단체 실명을 쓰지 않고도 이름/언어권 설명이 가능하다.
유저 노출에서 이름이 E12_C02 전체 현실권을 대표한다고 오독되지 않는다.
프로필 v1.0에서 이름을 고정해도 로스터 다양성과 현실권 검수 기준을 해치지 않는다.
```

이 판정을 내릴 경우에도 문서에는 `전태주 최종 확정`이 아니라 `전태주 유지 가능 / 프로필 v1.0에서 최종 고정 검토`라고 적는다.

### 5.2 전태주 임시 유지

조건부 해소는 가능하지만 이름 고정은 프로필 v1.0 직전까지 미루는 판정이다.

허용 조건:

```text
GUARD-13의 플레이어블 축은 통과 가능하다.
E12_C02 원점도 통과 가능하다.
다만 이름/국적/언어권은 별도 로컬라이즈 검수가 필요하다.
프로필 v1.0 프롬프트에서 이름 최종 후보를 다시 판정하도록 넘긴다.
```

이 경우 최종 판정은 `통과로 승격 가능`이 아니라 `조건부 유지 연장` 또는 `프로필 v1.0 전 이름 패치 필요`로 적어야 한다.

### 5.3 새 이름 후보 필요

전태주 이름이 E12_C02 원점과 맞지 않는다고 판단하면 이 판정을 쓴다.

필수:

```text
전태주를 임의로 폐기하지 않는다.
새 이름을 확정하지 않는다.
이름 재선정 기준만 만든다.
다음 작업을 guard_13_name_origin_patch_v0_1.md 또는 프로필 v1.0 전 이름 검수로 넘긴다.
```

금지:

```text
현실 민족/국가/언어권을 장식처럼 붙인 이름
실제 도시/병원/구호단체 실명과 결합한 이름
가족 신파를 강화하기 위한 이름
보호자/보증인 역할을 너무 설명적으로 반복하는 이름
```

---

## 6. E12_C02 원점 잠금

우선 원점:

```text
E12_C02 이동진료 승인권
```

관리자용 기준:

```text
관리자용 현실 권역:
E12 아프리카 해안-자원 도시 벨트

관리자용 현실 위치:
이동 진료소, 도시 병원 연결망, 약품 천막

인프라 앵커:
이동진료 트럭, 승인 환자, 임시 약품, 승인 데스크

유저 노출 지역명:
E12_C02 이동진료 승인권

등록하려는 역할:
진료 대상, 이동 환자, 승인 환자, 보호자/보증인 대기자
```

조건부 해소 문서에서 판정할 것:

```text
E12_C02가 보호자/보증인 등록 압박의 원점으로 충분한가.
이동진료 트럭, 승인 환자표, 임시 약품 천막, 승인 데스크가 전투 리듬과 붙는가.
E12_C02가 병원 내부 드라마가 아니라 이동진료 접근권과 책임 담보 절차를 보여 주는가.
E12_C06 모바일머니 회원권, E12_C08 우물/창고 보급권을 선점하지 않는가.
```

E04_C02 처리:

```text
E04_C02 열대격리 진료권은 보조 후보로만 둔다.
격리 동의, 보호자 확인, 임시 약품선 단서만 허용한다.
E04_C02 전체 상세화는 하지 않는다.
E04_C02를 원점으로 전환하려면 별도 사유가 필요하다.
```

E01/R02 처리:

```text
E01/R02 의료 후속 직접 원점은 보류한다.
R02에서는 보호자/보증인 압력의 암시만 허용한다.
직접 해금, 상세 설명, 플레이어블 원점화는 금지한다.
```

---

## 7. HOLD-04와 분리

조건부 해소 문서에는 아래 문장을 반드시 유지한다.

```text
하람은 자기 몸이 환자로 고정되는 절차를 늦춘다.
GUARD-13은 타인의 치료 접근권이 보호자/보증인 서명으로 담보 잡히는 절차를 늦춘다.
```

반드시 비교할 항목:

```text
중심 역할
중심 절차
캠페인이 붙이는 이름
전투 감각
HP 0 감각
정산 이미지
금지 중복
```

해소 조건:

```text
GUARD-13이 환자 팔찌, 병상 재배정, 퇴원 불가, 보험 심사 대기 중심으로 읽히지 않는다.
GUARD-13이 하람의 의료/보험/퇴원 보류 축을 반복하지 않는다.
GUARD-13이 힐러가 되지 않는다.
GUARD-13의 중심 절차가 보호자 등록, 보증인 서명, 호출벨 응답, 임시 서약으로 유지된다.
```

---

## 8. R02 의료 NPC와 분리

조건부 해소 문서에서는 R02 퇴원 불가 심사 대리 얼굴과 반드시 비교한다.

해소 조건:

```text
R02 의료 NPC는 E01 지역 NPC로 퇴원 심사와 병원 행정 압력의 얼굴이다.
GUARD-13은 전역 C02의 보호자/보증인 등록 절차를 겪고 지연시키는 플레이어블 후보다.
GUARD-13은 병원 전체 구조를 설명하지 않는다.
GUARD-13은 R02 의료/보험 지역 안내 NPC가 되지 않는다.
GUARD-13은 퇴원 불가 심사 대리 얼굴의 행정 기능을 가져오지 않는다.
```

허용:

```text
R02에서 보호자/보증인 압력의 암시
미서명 보호자 칸의 잔향
호출벨 기록의 짧은 흔적
HOLD-04 이후 비교용 후속 단서
```

금지:

```text
R02 직접 해금
R02 의료 NPC 대체
퇴원 심사 설명 담당
보험 심사 안내 담당
보급소 진료태그 UI 개방 담당
```

---

## 9. 전투 리듬 / 자원 / UI 금지선

기본 리듬:

```text
보호자 서명
보증인 칸
호출벨
임시 서약
치료 접근권 담보
판정 지연
```

고정 동사:

```text
거부한다
보류한다
빈칸으로 남긴다
호출을 끊지 않는다
서명을 미룬다
담보 판정을 되접는다
보증인 칸을 비워 둔다
대리 책임을 분리한다
임시 서약을 찢어 둔다
치료 접근권을 사람 쪽에 남긴다
```

금지 동사:

```text
치료한다
회복시킨다
보호막을 친다
대신 맞는다
소송한다
법률로 이긴다
가족을 설득한다
병원을 운영한다
보험금을 청구한다
서명해서 해결한다
몸으로 지킨다
```

허용 자원:

```text
보호자 호출벨
보증인 등록표
임시 서약서
미서명 보호자 칸
진료 접근권 보류표
응답하지 않은 호출 기록
담보 처리 대기표
승인 환자표
이동진료 승인 보류표
임시 약품 천막 로그
승인 데스크 번호표
```

금지 자원:

```text
치유력
방어력
보호막
가족애 게이지
보험금
법률 포인트
간병 포인트
보디가드 스택
희생 스택
```

---

## 10. HP 0 / 긴급 인양 잠금

핵심 상태명:

```text
보호자 서명 확정 / 치료 접근권 담보 고정
```

보조 상태명:

```text
보증인 등록 완료 / 호출벨 신호 단절
```

해소 조건:

```text
HP 0이 사망, 치료 실패, 수술 실패, 간병 포기, 보험금 미지급으로 읽히지 않는다.
HP 0은 GUARD-13이 보호자/보증인 등록 절차에 붙잡히는 순간이다.
보급소는 끊기지 않은 호출벨, 찢긴 임시 서약서, 비어 있는 보증인 칸, 진료 접근권 보류표의 불일치를 잡아 인양한다.
```

반드시 비교:

```text
윤서: 현장 좌표와 회수선
HOLD-04: 환자 팔찌 / 퇴원 보류 / 보험 심사 고정
CLAUSE-11: 자동결제 승인 / 예외 조항 폐쇄
LEDGER-12: 거래 장부 이름 고정 / 미정산 태그 폐쇄
```

금지:

```text
사망
부활
치료 실패
수술 실패
보험금 미지급
간병 포기
가족이 버림
방패 파괴
희생으로 모두를 구함
힐러가 쓰러짐
```

---

## 11. 출력 문서 필수 구조

출력 문서는 아래 구조를 따른다.

```text
# GUARD-13 조건부 해소 문서 v0.1

## 문서 상태
## 0. 판정 요약
## 1. 조건부 사유 목록
## 2. 이름/국적/언어권 해소
## 3. E12_C02 원점 잠금
## 4. E04_C02 및 E01/R02 제한선
## 5. HOLD-04 분리 잠금
## 6. R02 의료 NPC 분리 잠금
## 7. 힐러/탱커/보디가드/법률 보호자 금지선
## 8. 전투 리듬과 자원 잠금
## 9. HP 0 / 긴급 인양 차별화
## 10. 해금 조건
## 11. 관계선 검수
## 12. 대사/비주얼/사운드 보정
## 13. 프로필 v1.0 전환 조건
## 14. 최종 판정
```

`## 문서 상태`에는 아래를 반드시 포함한다.

```text
상태:
작성 완료 v0.1

작업 성격:
GUARD-13 조건부 통과 사유 해소 문서.
최종 프로필 v1.0 작성 아님.
20인 로스터 재작성 아님.

대상:
전태주 / GUARD-13 / 태주, 보호자 등록 거부자

이전 판정:
조건부 통과

이번 판정:
통과로 승격 가능 / 조건부 유지 연장 / 보류 중 하나

다음 단계:
통과로 승격 가능이면 story/06_characters/guard_13_profile_v1_0.md
조건부 유지 연장이면 story/06_characters/guard_13_name_origin_patch_v0_1.md 또는 보완 문서
보류면 13번 C02 후보 재선정 또는 NPC/잔향/오브젝트 이관
```

---

## 12. 최종 판정 기준

### 12.1 통과로 승격 가능

```text
GUARD-13이 보호자/보증인 등록 절차를 플레이어블 관점으로 분명히 다룬다.
전태주 이름을 유지할지, 임시 유지할지, 새 이름 후보로 넘길지 명확히 판정했다.
프로필 v1.0 작성에 필요한 이름/국적/언어권 리스크가 관리 가능한 상태다.
E12_C02 이동진료 승인권 원점이 충분히 잠겼다.
E04_C02는 보조 단서로만 제한했다.
E01/R02 직접 원점화를 금지했다.
HOLD-04와 환자/보호자 축이 명확히 분리된다.
R02 의료 NPC 기능을 침범하지 않는다.
전투 리듬이 힐러/탱커/보디가드/법률 보호자 이미지로 새지 않는다.
HP 0이 보호자 서명 확정 / 치료 접근권 담보 고정으로 차별화된다.
```

### 12.2 조건부 유지 연장

```text
플레이어블 축과 E12_C02 원점은 좋지만 이름/국적/언어권이 아직 확정되지 않았다.
전태주 유지 가능성은 있으나 프로필 v1.0에서 바로 고정하기 어렵다.
E12_C02 표현 밀도 또는 현실권 검수가 더 필요하다.
HOLD-04/R02 의료 NPC와 분리는 가능하지만 문장 잠금이 더 필요하다.
```

### 12.3 보류

```text
GUARD-13이 플레이어블보다 NPC, 병원 사건 기록, 오브젝트 잔향으로 더 강하다.
E12_C02 원점과 보호자/보증인 등록 축이 잘 붙지 않는다.
전태주 이름을 유지할 수도, 대체할 수도 없는 상태다.
HOLD-04 또는 R02 의료 NPC와 분리할 수 없다.
힐러/탱커/보디가드/법률 보호자 이미지가 차단되지 않는다.
```

---

## 13. 복붙용 마스터 프롬프트

```text
Atomic Ad Survivors의 13번 플레이어블 후보 GUARD-13 조건부 해소 문서를 작성한다.

이번 작업 대상:
전태주 / GUARD-13 / 태주, 보호자 등록 거부자

이번 작성 문서:
story/06_characters/guard_13_playable_condition_patch_v0_1.md

현재 판정:
상세 결재에서 조건부 통과.

목표:
GUARD-13이 의사/간호사/힐러/탱커/보디가드/법적 보호자 영웅이 아니라,
타인의 치료 접근권이 보호자/보증인 서명으로 담보 잡히기 전 그 책임 칸을 비워 두는
13번 플레이어블 후보로 프로필 v1.0에 갈 수 있는지 판정한다.

중요:
20명 전체 로스터를 다시 만들지 않는다.
13~20번 전체 후보를 재선정하지 않는다.
GUARD-13 프로필 v1.0을 쓰지 않는다.
전태주 이름을 무검수 최종 확정하지 않는다.
전태주 이름을 임의로 폐기하지 않는다.
E12 전체 광역권을 열지 않는다.
E12_C06 모바일머니 회원권을 선점하지 않는다.
E01 R02 의료/보험을 반복하지 않는다.
HOLD-04의 퇴원 보류 환자 축을 빼앗지 않는다.
R02 의료 NPC의 행정 얼굴을 빼앗지 않는다.
의사/간호사/힐러/탱커/보디가드/법률 보호자 캐릭터로 만들지 않는다.
스토리 본문을 쓰지 않는다.
스킬 수치 밸런스를 확정하지 않는다.

반드시 읽을 문서:
1. story/06_characters/guard_13_playable_decision_v0_1.md
2. docs/world/PLAYABLE_TEAM_GUARD_13_DETAIL_PROMPT_V0_1.md
3. story/06_characters/guard_13_pre_decision_review_v0_1.md
4. docs/world/PLAYABLE_TEAM_GUARD_13_PRE_DECISION_REVIEW_PROMPT_V0_1.md
5. story/06_characters/playable_20_roster_blueprint_v0_1.md
6. story/06_characters/playable_20_name_registry_v0_1.md
7. story/06_characters/character_npc_creation_context_v0_1.md
8. story/06_characters/playable_global_npc_link_matrix_v0_1.md
9. story/06_characters/discharge_hold_patient_profile_v1_0.md
10. story/03_regions/r02_discharge_review_face_profile_v1_0.md
11. story/06_characters/clause_11_profile_v1_0.md
12. story/06_characters/ledger_12_profile_v1_0.md
13. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
14. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
15. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
16. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
17. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
18. story/03_regions/global_npc_story_seed_registry_v0_1.md
19. story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
20. story/03_regions/global_npc_name_location_exposure_registry_v0_1.md

핵심 질문:
내가 서명하면, 누구의 치료권이 담보가 되는가?

핵심 문장:
보호자란 이름이 붙어도, 사람을 맡길 수 있다는 뜻은 아니다.

최종 변화 문장 후보:
보호는 대신 서명하는 일이 아니라, 닫히는 접근권을 다시 사람 쪽에 남기는 일이다.

반드시 해소할 조건:
1. 전태주 이름/국적/언어권을 검수하고, 유지 가능 / 임시 유지 / 새 이름 후보 필요 중 하나로 판정한다.
2. E12_C02 이동진료 승인권을 원점으로 잠글 수 있는지 판정한다.
3. E04_C02는 보조 후보로 제한하고 E01/R02 직접 원점은 보류한다.
4. HOLD-04와 환자/퇴원 보류/보험 심사 축을 분리한다.
5. R02 의료 NPC와 병원 행정 얼굴 기능을 분리한다.
6. 힐러/탱커/보디가드/법률 보호자 영웅화를 차단한다.
7. 전투 리듬을 보호자 서명, 보증인 칸, 호출벨, 임시 서약서, 치료 접근권 담보 판정 지연으로 고정한다.
8. HP 0을 보호자 서명 확정 / 치료 접근권 담보 고정으로 잠근다.
9. 프로필 v1.0으로 갈 수 있는지 최종 판정한다.

출력 문서 구조:
# GUARD-13 조건부 해소 문서 v0.1

## 문서 상태
## 0. 판정 요약
## 1. 조건부 사유 목록
## 2. 이름/국적/언어권 해소
## 3. E12_C02 원점 잠금
## 4. E04_C02 및 E01/R02 제한선
## 5. HOLD-04 분리 잠금
## 6. R02 의료 NPC 분리 잠금
## 7. 힐러/탱커/보디가드/법률 보호자 금지선
## 8. 전투 리듬과 자원 잠금
## 9. HP 0 / 긴급 인양 차별화
## 10. 해금 조건
## 11. 관계선 검수
## 12. 대사/비주얼/사운드 보정
## 13. 프로필 v1.0 전환 조건
## 14. 최종 판정

최종 판정은 아래 셋 중 하나만 쓴다.
1. 통과로 승격 가능
2. 조건부 유지 연장
3. 보류

완료 기준:
1. 코드펜스 균형을 맞춘다.
2. trailing whitespace가 없게 한다.
3. 프로필 v1.0을 쓰지 않는다.
4. 전태주 이름을 무검수 최종 확정하지 않는다.
5. E12_C02 원점 적합성을 판정한다.
6. HOLD-04와 R02 의료 NPC 분리 판정을 반드시 포함한다.
7. HP 0 차별화를 반드시 포함한다.
8. 다음 작업 포인터를 명확히 적는다.
```

---

## 14. 다음 작업

```text
이 프롬프트를 사용해 story/06_characters/guard_13_playable_condition_patch_v0_1.md를 작성한다.
작성 후 판정이 통과로 승격 가능이면 guard_13_profile_v1_0.md 작성 프롬프트를 만든다.
이름/국적/언어권이 남으면 guard_13_name_origin_patch_v0_1.md 또는 보완 문서로 넘긴다.
보류라면 C02 후보 재선정 또는 NPC/잔향/오브젝트 처리 프롬프트로 전환한다.
```
