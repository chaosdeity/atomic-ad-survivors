# GATE-09 조건부 해소 플레이어블팀 프롬프트 v0.1

이 문서는 플레이어블 제작팀에게 넘긴 GATE-09 조건부 해소 작업용 복붙 프롬프트다.

목표는 20인 로스터를 다시 검토하는 것이 아니다.
목표는 이미 조건부 통과한 9번 후보 `Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자`의 조건을 해소하고, 프로필 v1.0으로 갈 수 있는지 판정하는 것이다.

---

## 0. 현재 상태

```text
완료 문서:
story/06_characters/gate_09_playable_decision_v0_1.md

현재 판정:
조건부 통과

다음 작성 문서:
story/06_characters/gate_09_playable_condition_patch_v0_1.md

작성 결과:
완료 / 통과로 승격 가능

다음 단계:
story/06_characters/gate_09_profile_v1_0.md
```

GATE-09는 이미 9번 슬롯 후보로 둘 가치가 있다고 판정되었다.
이번 작업은 미카를 새로 발명하는 일이 아니다.

해야 할 일은 조건부 통과 사유를 하나씩 잠그는 것이다.

---

## 1. 작업 범위

이번 작업에서 다룰 것:

```text
GATE-09 조건부 해소
E02_C07-L01~L02 노출 범위 잠금
빠른 이동/역무원/개찰 도둑화 차단
C07 계열 다른 캠페인과 차별화
HP 0 차별화
통행태그/수신태그/환승 심사 로그 정산 루트 잠금
프로필 v1.0 전환 가능 여부 판정
```

이번 작업에서 하지 않을 것:

```text
20명 로스터 재작성
9~12번 후보 재선정
Mika 이름 변경
E02 전체 지역 상세화
GATE-09 프로필 v1.0 작성
NPC 미카로 전환
스킬명/수치 밸런스 확정
```

---

## 2. 반드시 읽을 문서

### 2.1 직접 기준

```text
story/06_characters/gate_09_playable_decision_v0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
```

### 2.2 세계/시스템 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
docs/world/WORLD_LORE_LOCK_V0_1.md
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
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
```

---

## 3. 핵심 잠금

GATE-09의 핵심 문장은 유지한다.

```text
문이 닫히기 전까지는,
아직 잔류자가 아니다.
```

최종 변화 문장은 아래를 기준으로 보완한다.

```text
문이 닫힌 뒤에도,
사람은 완료된 절차가 아니다.
```

GATE-09는 빠른 이동 캐릭터가 아니다.

```text
미카는 속도로 도망치는 캐릭터가 아니라,
통과 / 환승 / 미탑승 / 잔류 판정이 닫히기 전의 짧은 틈을 조작하는 캐릭터다.
```

---

## 4. 조건부 통과 사유

아래 8개 조건을 반드시 해소한다.

### 4.1 단순 교통/속도/역무원 캐릭터화 차단

금지:

```text
빠른 이동 캐릭터
대시/순간이동 캐릭터
역무원 안내 NPC
개찰구 도둑
도시 지하철 전문가
일본 관광지 대표 캐릭터
```

고정:

```text
미카는 환승 절차가 사람을 잔류자로 확정하기 전의 판정을 늦춘다.
```

### 4.2 E02_C07-L01~L02 노출 범위 제한

미카 조건부 해소 단계에서는 E02 전체를 열지 않는다.

허용:

```text
환승 통로
막차 심사 플랫폼
개찰 클립 좌표
저주파 안내 반복
정기권 심사 로그
```

금지:

```text
E02 전체 도시 투어
도쿄/오사카/나고야 전면 노출
철도망 전체 해금
다른 E02 캠페인 동시 상세화
```

### 4.3 C07 계열 다른 캠페인과 분리

반드시 비교한다.

```text
E02_C07:
지하철 환승 심사권.
막차/환승/개찰/플랫폼 잔류.

E01_C07:
마지막 출항권.
항만/출항/승선/봉쇄선.

E06_C07:
공항검역 이송권.
비행/검역/이송/탑승 게이트.

E07_C07:
통관철도 통행권.
국경/통관/철도/검문.
```

GATE-09는 `이동 일반` 캐릭터가 아니다.
GATE-09는 `막차 환승 심사` 캐릭터다.

### 4.4 HP 0 차별화

HP 0은 사망/부활이 아니다.

GATE-09의 HP 0 후보:

```text
개찰 미통과
막차 탑승 실패
플랫폼 잔류 처리
저주파 안내 반복
환승 로그 폐쇄
```

보급소 인양 방식:

```text
개찰 클립 좌표
환승 심사 로그 조각
막차 안내 기록
저주파 비콘 역송출
```

차별화:

```text
윤서:
현장 회수/인양의 기본축.

차유건:
계량 초과/충전 차단/정품 도크 회수 직전 인양.

백여울:
수신 공백/저소음 비콘 지연/인양 지연.

미카:
개찰 미통과/막차 탑승 실패/플랫폼 잔류 처리 직전 인양.
```

### 4.5 전투 리듬 고정

전투 리듬은 빠른 이동이 아니다.

고정 동사:

```text
보류한다
늦춘다
환승 중으로 둔다
미탑승 확정을 지연한다
개찰 클립을 남긴다
잔류 처리를 미룬다
닫히는 판정 사이를 통과한다
```

금지 동사:

```text
순간이동한다
훔친다
질주한다
승객을 지휘한다
철도망을 장악한다
문을 계속 연다
```

### 4.6 정산 루트 제한

GATE-09의 정산/자원은 아래로 제한한다.

```text
통행태그
수신태그
환승 심사 로그
개찰 클립
막차 안내 기록
정기권 조각
```

금지:

```text
범용 교통 포인트
돈/요금 중심 정산
시간 마법 자원
철도 전력 자원
```

### 4.7 이름/표기 검수

현재 후보:

```text
본명:
Mika Arakawa

코드명:
GATE-09

유저 첫 표기:
미카, 막차 환승 심사자
```

조건부 해소 문서에서는 일본어 원문 표기를 확정하지 않아도 된다.
다만 프로필 v1.0 전에 검수 필요 상태로 남긴다.

금지:

```text
일본어 표기를 부정확하게 확정
성/이름 순서 혼동을 아무 설명 없이 확정
관광풍 별명 부여
```

### 4.8 해금 시점 명확화

미카는 E01 초반 합류자가 아니다.

고정:

```text
9번은 중반 첫 외부 광역권 후보.
E02_C07-L02 이후 조건부 해금.
E01 초반 8명 주인공 구조 금지.
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 9번 플레이어블 후보 GATE-09 조건부 해소 문서를 작성한다.

대상:
Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자

현재 판정:
조건부 통과

기준 문서:
story/06_characters/gate_09_playable_decision_v0_1.md
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md

이번 작업 목표:
gate_09_playable_decision_v0_1.md의 조건부 통과 사유를 해소하고,
GATE-09가 프로필 v1.0으로 갈 수 있는지 판정한다.

이번 작업에서 하지 말 것:
20명 로스터 재작성
9~12번 후보 재선정
GATE-09 프로필 v1.0 작성
미카 이름 변경
E02 전체 지역 상세화
스킬 수치/밸런스 확정

반드시 해소할 조건:
1. 단순 교통/속도/역무원/개찰 도둑화 차단.
2. E02_C07-L01~L02 노출 범위 제한.
3. E01_C07 마지막 출항권, E06_C07 공항검역 이송권, E07_C07 통관철도 통행권과 분리.
4. HP 0을 개찰 미통과, 막차 탑승 실패, 플랫폼 잔류 처리, 저주파 안내 반복으로 고정.
5. 전투 리듬을 빠른 이동이 아니라 통과/환승/미탑승/잔류 판정 조작으로 고정.
6. 정산 루트를 통행태그, 수신태그, 환승 심사 로그, 개찰 클립, 막차 안내 기록으로 제한.
7. 일본어 원문 표기와 유저 첫 표기 정책을 프로필 v1.0 전 검수 대상으로 남긴다.
8. E02 외부 광역권 후보가 E01 초반 8명 합류처럼 보이지 않게 해금 시점을 명확히 둔다.

핵심 문장:
문이 닫히기 전까지는,
아직 잔류자가 아니다.

출력 형식:

# GATE-09 플레이어블 조건부 해소 문서 v0.1

## 문서 상태

상태:
스토리팀/시스템팀/전투팀 결재용 v0.1

대상:
Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자

판정:
통과로 승격 가능 / 조건부 유지 / 보류 중 하나

다음 작업 포인터:
통과로 승격 가능이면 story/06_characters/gate_09_profile_v1_0.md
조건부 유지이면 보완 조건을 다시 명시

## 0. 조건부 통과 사유 요약

기존 상세 결재의 조건부 사유 8개를 짧게 요약한다.

## 1. 최종 고정 문장

GATE-09의 핵심 문장과 최종 변화 문장을 고정한다.

## 2. 실패 방향 차단

아래 실패 방향을 각각 차단한다.

- 빠른 이동 캐릭터
- 역무원/안내원 캐릭터
- 개찰구 도둑
- 일본 관광/도시 대표 캐릭터
- 범용 교통 캐릭터

## 3. 노출 범위 잠금

E02_C07-L01~L02에서 허용할 공간, 오브젝트, 로그, 상태값을 고정한다.
E02 전체 확장은 금지한다.

## 4. C07 계열 차별화

E02_C07, E01_C07, E06_C07, E07_C07을 비교표로 분리한다.

## 5. HP 0 / 긴급 인양 차별화

개찰 미통과, 막차 탑승 실패, 플랫폼 잔류 처리, 저주파 안내 반복을 중심으로 HP 0을 고정한다.
윤서, 차유건, 백여울과의 차이를 적는다.

## 6. 전투 리듬 잠금

통과/환승/미탑승/잔류 판정 조작을 전투 리듬으로 고정한다.
빠른 이동, 순간이동, 철도망 장악은 금지한다.

## 7. 태그 / 정산 루트

통행태그, 수신태그, 환승 심사 로그, 개찰 클립, 막차 안내 기록, 정기권 조각을 정산 루트로 정리한다.

## 8. 이름 / 표기 / 해금 시점

Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자 표기를 유지한다.
일본어 원문 표기는 프로필 v1.0 전 검수 대상으로 둔다.
E02_C07-L02 이후 중반 해금임을 고정한다.

## 9. 관계/충돌 정리

윤서, 차유건, 백여울, 리오, E01_C07/E06_C07/E07_C07 후보와의 충돌 방지를 정리한다.

## 10. 대사 보강

조건부 해소에 필요한 대사를 최소 8줄 작성한다.

조건:
첫 만남
환승 심사 로그
개찰 미통과
막차 안내
HP 0 직전
긴급 인양 후
성장 이후
금지 방향을 피하는 대사

## 11. 결재 체크리스트

스토리팀, 시스템팀, 전투팀, 월드팀, UI팀, 아트팀, 내러티브 QA 확인 항목을 표로 작성한다.

## 12. 최종 판정

통과로 승격 가능 / 조건부 유지 / 보류 중 하나로 판정한다.
통과로 승격 가능이면 다음 문서를 gate_09_profile_v1_0.md로 지정한다.
```

---

## 6. 완료 기준

이 프롬프트 작업이 완료되었다고 보려면 아래를 만족해야 한다.

```text
1. gate_09_playable_condition_patch_v0_1.md가 작성된다.
2. 판정이 통과로 승격 가능 / 조건부 유지 / 보류 중 하나로 명확하다.
3. 빠른 이동/역무원/개찰 도둑화가 차단된다.
4. E02_C07-L01~L02 노출 제한이 문서에 박힌다.
5. C07 계열 캠페인 차별화 표가 있다.
6. HP 0이 플랫폼 잔류 처리 중심으로 고정된다.
7. 다음 포인터가 gate_09_profile_v1_0.md 또는 추가 보완 문서로 이어진다.
```

완료 결과:

```text
완료 문서:
story/06_characters/gate_09_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

다음 작업:
story/06_characters/gate_09_profile_v1_0.md
```
