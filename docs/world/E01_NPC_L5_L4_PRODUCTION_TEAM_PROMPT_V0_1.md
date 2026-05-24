# E01 NPC L5/L4 제작팀 프롬프트 v0.1

이 문서는 NPC 제작 AI팀에게 `E01 NPC L5/L4 승격 후보 검토 v0.1` 이후의 실제 산출물 제작을 맡기기 위한 복붙용 프롬프트다.

목표는 NPC를 새로 많이 뽑는 것이 아니다.
목표는 이미 재분류된 28개 후보를 기준으로, 필요한 산출물만 정해진 깊이로 제작하는 것이다.

핵심:

```text
L5/L4 후보를 전부 프로필 v1.0으로 올리지 않는다.
프로필 v1.0, 프로필 v0.1, 대사 은행, 잔향/배경 은행으로 나눠 제작한다.
```

---

## 0. 현재 상태

```text
완료 문서:
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md

검토 결과:
E01 NPC 대량 후보 풀 120개 중 L5/L4 승격 후보 28개 재검토 완료

재분류:
프로필 v1.0 우선 후보 5명
프로필 v0.1 후보 8명
대사 은행 후보 8명
잔향/배경 하향 후보 7명

1차 상세화 추천:
1. r06_mass_001 회원 등급 브로커
2. r02_mass_001 퇴원 불가 심사 대리 얼굴
3. r03_mass_001 최종 반품 심사 보류관

1차 필수 산출물:
작성 완료

완료 파일:
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/r02_discharge_review_face_profile_v1_0.md
story/03_regions/r03_final_return_review_officer_profile_v1_0.md

다음 권장:
v0.1 짧은 프로필 묶음
대사 은행
잔향/배경 은행
이름/현실 위치 검산

후속 상태:
묶음 산출물 4개 작성 완료

완료 파일:
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md

이번 작업의 성격:
NPC 제작 AI팀 산출물 제작 지시
새 후보 생성 아님
새 플레이어블 생성 아님
로스터 재검토 아님
```

---

## 1. 작업 목표

NPC 제작 AI팀은 아래 산출물을 만든다.

### 1.1 1차 필수 산출물

```text
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/r02_discharge_review_face_profile_v1_0.md
story/03_regions/r03_final_return_review_officer_profile_v1_0.md
```

이 3개는 작성 완료했다.

### 1.2 2차 선택 산출물

시즌 오픈 순서가 불명확하면 초안 수준으로만 작성하거나 보류한다.

```text
story/03_regions/r08_false_rescue_signal_keeper_profile_v1_0.md
story/03_regions/r07_departure_hold_officer_profile_v1_0.md
```

### 1.3 묶음 산출물

```text
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md
```

묶음 산출물은 반드시 깊이를 낮춰 쓴다.
v0.1 후보, 대사 은행 후보, 잔향/배경 후보를 장문 프로필로 승격하지 않는다.

---

## 2. 반드시 읽을 문서

### 2.1 최우선 기준

```text
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
```

### 2.2 세계/지역 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
docs/world/WORLD_LORE_LOCK_V0_1.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md
```

### 2.3 기존 NPC 기준

```text
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
story/03_regions/r01_npc_name_registry_v1_0.md
story/03_regions/r01_npc_dialogue_bank_v0_1.md
story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
```

### 2.4 플레이어블 충돌 방지 기준

```text
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/yunseo_profile_v1_0.md
story/06_characters/patch_profile_v1_0.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
story/06_characters/gate_09_profile_v1_0.md
```

---

## 3. 제작 원칙

### 3.1 공통 원칙

```text
NPC는 퀘스트 배포기가 아니다.
NPC는 시설, 상태값, 흔적, 선택 후폭풍, 캠페인 압력을 보여주는 얼굴이다.
```

반드시 지킬 것:

```text
1. 먼저 NPC가 담당하는 지역 질문을 쓴다.
2. 그다음 NPC가 잘못 믿는 것을 쓴다.
3. 그다음 플레이어블/보급소/R01 NPC와 충돌하지 않는 기능을 쓴다.
4. 이름은 기능과 현실 위치 검산 뒤에 확정한다.
5. 직접 대면, 음성, 오브젝트, 로그, 배경 문구를 분리한다.
6. 프로필 v1.0 후보도 실제 구현 때 전부 직접 대면하지 않을 수 있음을 명시한다.
```

금지:

```text
새 플레이어블 후보 만들기
NPC를 상점/강화/거래 UI 담당자로 만들기
NPC를 지역의 정답 설명자로 만들기
모든 L5/L4를 직접 대면 NPC로 올리기
모든 후보에게 본명 붙이기
R01 확정 NPC 기능 대체하기
보급소 5명 시설 기능 대체하기
플레이어블 전투/해금 기능 빼앗기
현실 기관/기업/실제 사건 패러디하기
```

### 3.2 깊이 제한

```text
프로필 v1.0:
지역 질문을 대표하는 핵심 NPC만.

프로필 v0.1:
기능은 강하지만 충돌 위험이 있어 짧게 잠글 후보만.

대사 은행:
상태값과 선택 후폭풍을 말하는 조건 대사만.

잔향/배경 은행:
사람 프로필 대신 로그, 음성, 표식, 배경 문구로 남길 후보만.
```

---

## 4. 후보별 제작 잠금

### 4.1 프로필 v1.0 우선 후보

| 우선 | 후보 | 지역 | 산출물 | 핵심 기능 | 충돌 방지 |
|---:|---|---|---|---|---|
| 1 | `r06_mass_001` 회원 등급 브로커 | R06 | `story/03_regions/r06_member_rank_broker_profile_v1_0.md` | 멤버십/선택권 거래 압박 | 상점/거래 UI 금지, 라파/마라 선점 금지 |
| 2 | `r02_mass_001` 퇴원 불가 심사 대리 얼굴 | R02 | `story/03_regions/r02_discharge_review_face_profile_v1_0.md` | 퇴원 심사/치료태그 압박 | 하람 해금/전투/힐러 기능 대체 금지 |
| 3 | `r03_mass_001` 최종 반품 심사 보류관 | R03 | `story/03_regions/r03_final_return_review_officer_profile_v1_0.md` | 최종 반품 판정/배송상태 압박 | 윤서 과거 설명자 금지, 이루 전투 기능 대체 금지 |
| 4 | `r08_mass_001` 가짜 구조 신호 보관자 | R08 | `story/03_regions/r08_false_rescue_signal_keeper_profile_v1_0.md` | 가짜 구조 신호/수신 안정도 압박 | 여울의 낮은 수신 전투 대체 금지 |
| 5 | `r07_mass_001` 출항 심사 보류관 | R07 | `story/03_regions/r07_departure_hold_officer_profile_v1_0.md` | 출항/통행 판정 압박 | GATE-09 환승 심사 반복 금지 |

### 4.2 프로필 v0.1 후보

아래 8개는 장문 프로필 v1.0으로 올리지 말고, `e01_l5_l4_short_profiles_v0_1.md` 안에 짧은 프로필로 묶는다.

```text
r04_mass_001 재동기화 코어 전 감시자
r05_mass_001 마지막 앵커 그림자
r02_mass_002 보호자 호출 대행자
r03_mass_002 분류선 수동 정지 담당자
r04_mass_002 리콜 접수 부스 잔류자
r08_mass_002 폐역 중계실 열쇠 담당
r06_mass_002 포인트 사채 중개자
r07_mass_002 검역문 열화상 판독자
```

각 후보의 필수 필드:

```text
npc_id:
display_role_name:
region:
first_exposure:
direct_meet_limit:
core_function:
wrong_belief:
state_keys:
choice_flags:
playable_overlap_guard:
forbidden:
next_possible_upgrade:
```

### 4.3 대사 은행 후보

아래 8개는 `e01_l5_l4_dialogue_bank_v0_1.md` 안에 조건 대사로만 쓴다.

```text
hub_mass_001 밤 카운터 임시 정산자
hub_mass_002 충전 스탠드 뒤 대기 로봇
r02_mass_003 약품 봉인 담당자
r03_mass_003 보증 스티커 회수원
r05_mass_002 반복 뉴스 데스크 편집자
r06_mass_003 리뷰 조작 대기열 관리자
r07_mass_003 수하물 오분류 접수원
r08_mass_003 민방위 급수표 관리자
```

각 후보당 대사 수:

```text
3~5줄
```

대사 조건 예시:

```text
보급 압력 상승
수신 안정도 하락
로봇 자율성 상승
인간 안정도 하락
배송상태 오염
통행태그 부족
진료태그 부족
멤버십 압박 상승
```

금지:

```text
상점 대사
거래 안내
강화 안내
퀘스트 설명
지역 정답 설명
본명 공개
```

### 4.4 잔향/배경 하향 후보

아래 7개는 `e01_npc_trace_background_bank_v0_1.md` 안에 로그, 자동 음성, 표식, 배경 문구로만 쓴다.

```text
r01_mass_001 모델하우스 사진 보정 담당
r01_mass_002 대체 보호자 칸 관리자
r04_mass_003 불량품 프레스 정렬자
r05_mass_003 추천 서버 열관리자
r02_mass_004 격리문 복도 살균 음성
r03_mass_004 압축 대기라인 방송
r04_mass_004 충전 케이블 분리 음성
```

각 후보의 필수 필드:

```text
trace_id:
source_candidate:
region:
form:
where_seen:
trigger_condition:
text_or_audio:
what_it_implies:
who_must_not_be_replaced:
forbidden:
```

---

## 5. 복붙용 마스터 프롬프트

```text
Atomic Ad Survivors의 E01 NPC L5/L4 산출물을 제작한다.

이번 작업은 새 NPC 후보 생성이 아니다.
이미 재분류된 28개 L5/L4 후보를 기준으로, 필요한 산출물을 정해진 깊이로 작성한다.

가장 중요한 기준 문서:
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md

반드시 지킬 것:
1. L5/L4 후보를 전부 프로필 v1.0으로 올리지 않는다.
2. 프로필 v1.0은 최대 5명이며, 1차 필수 작업은 3명이다.
3. v0.1 후보 8명은 짧은 프로필 묶음으로만 작성한다.
4. 대사 은행 후보 8명은 조건 대사 3~5줄씩만 작성한다.
5. 잔향/배경 후보 7명은 로그, 자동 음성, 표식, 배경 문구로만 작성한다.
6. 새 플레이어블 후보를 만들지 않는다.
7. 보급소 5명, R01 확정 NPC 12명, 플레이어블 20인 기능을 대체하지 않는다.
8. 상점/강화/거래/퀘스트 배포 NPC로 만들지 않는다.
9. 현실 기관/기업/실제 사건 패러디를 하지 않는다.

반드시 읽을 문서:
1. story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
2. story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
3. docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
4. docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
5. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
6. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
7. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
8. docs/world/WORLD_LORE_LOCK_V0_1.md
9. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
10. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
11. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
12. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
13. docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
14. story/02_hub/outpost_core_npc_profiles_v1_0.md
15. story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md
16. story/03_regions/r01_campaign1_npc_roster_v0_1.md
17. story/03_regions/r01_npc_data_schema_application_v0_1.md
18. story/03_regions/e01_support_npc_minimum_plan_v0_1.md
19. story/06_characters/playable_20_roster_blueprint_v0_1.md
20. story/06_characters/playable_20_name_registry_v0_1.md

이번 작업 산출물:

1차 필수 프로필 v1.0:
- story/03_regions/r06_member_rank_broker_profile_v1_0.md
- story/03_regions/r02_discharge_review_face_profile_v1_0.md
- story/03_regions/r03_final_return_review_officer_profile_v1_0.md

2차 선택 프로필 v1.0:
- story/03_regions/r08_false_rescue_signal_keeper_profile_v1_0.md
- story/03_regions/r07_departure_hold_officer_profile_v1_0.md

묶음 산출물:
- story/03_regions/e01_l5_l4_short_profiles_v0_1.md
- story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
- story/03_regions/e01_npc_trace_background_bank_v0_1.md
- story/03_regions/e01_npc_name_location_registry_v0_1.md

작업 순서:
1. r06_mass_001, r02_mass_001, r03_mass_001 프로필 v1.0을 먼저 작성한다. 완료.
2. R08/R07 시즌 오픈 순서가 충분히 판단되면 r08_mass_001, r07_mass_001 프로필 v1.0을 작성한다.
3. v0.1 후보 8명을 e01_l5_l4_short_profiles_v0_1.md로 묶는다.
4. 대사 은행 후보 8명을 e01_l5_l4_dialogue_bank_v0_1.md로 묶는다.
5. 잔향/배경 후보 7명을 e01_npc_trace_background_bank_v0_1.md로 묶는다.
6. v1.0/v0.1 후보의 이름, 본명 공개 시점, 관리자용 현실 위치를 e01_npc_name_location_registry_v0_1.md로 검산한다.

프로필 v1.0 출력 형식:

# [display_role_name] 프로필 v1.0

## 문서 상태

상태:
작성 완료 v1.0

판정:
통과 / 조건부 통과 / 보류 중 하나

용도:
이 NPC의 지역 기능, 상태값 반응, 선택 후폭풍, 플레이어블 충돌 방지, 금지 방향을 고정한다.

## 0. 판정 요약

## 1. 한 줄 정의

## 2. 기본 프로필

npc_id:
display_role_name:
본명 공개 정책:
npc_track:
npc_type:
parent_region:
parent_campaign_id:
admin_real_region:
admin_infra_anchor:
user_display_region_name:
first_location:
first_exposure:
direct_meet_level:

## 3. 지역 질문

이 NPC가 대표하는 지역 질문을 쓴다.

## 4. 핵심 오판

이 NPC가 잘못 믿는 것을 쓴다.

## 5. 보이는 역할과 실제 기능

## 6. 상태값 반응

state_keys:
choice_flags:
반응 단계:

## 7. 선택 후폭풍

## 8. 플레이어블 충돌 방지

반드시 비교:
윤서:
PATCH:
하람:
이루:
유건:
여울:
리오:
미카:
향후 10~12번 후보:

## 9. 보급소/R01 NPC 충돌 방지

## 10. 대표 대사

첫 대면:
상태 악화:
태그 부족:
선택 직후:
재방문:
후폭풍:

## 11. 비주얼/사운드 방향

## 12. 구현 메모

직접 대면 조건:
대사 은행 연결:
오브젝트/로그 연결:
보상 또는 해금 여부:

## 13. 금지 방향

## 14. 다음 산출물

## 15. 최종 판정

v0.1 짧은 프로필 출력 형식:

| npc_id | display_role_name | region | first_exposure | direct_meet_limit | core_function | wrong_belief | state_keys | choice_flags | playable_overlap_guard | forbidden | next_possible_upgrade |

대사 은행 출력 형식:

## [candidate_id] [display_role_name]

처리:
대사 은행

권장 조건:

대사:
1.
2.
3.
4.
5.

금지:

잔향/배경 은행 출력 형식:

| trace_id | source_candidate | region | form | where_seen | trigger_condition | text_or_audio | what_it_implies | who_must_not_be_replaced | forbidden |

이름/현실 위치 검산 출력 형식:

| 대상 | 후보 이름/표기 | 본명 공개 정책 | 관리자용 현실 권역 | 인프라 앵커 | 유저 노출 지역명 | 중복 위험 | 검산 판정 |

완료 기준:
1. 산출물마다 코드펜스 균형을 맞춘다.
2. 28개 후보의 재분류를 임의로 바꾸지 않는다.
3. v1.0 프로필이 5명을 넘지 않는다.
4. v0.1/대사/잔향 후보를 장문 프로필로 승격하지 않는다.
5. 플레이어블, 보급소, R01 NPC 충돌 방지 항목을 누락하지 않는다.
6. 마지막에 작성한 파일 목록과 보류/조건부 항목을 요약한다.
```

---

## 6. 개별 후보별 핵심 지시

### 6.1 r06_mass_001 회원 등급 브로커

```text
핵심:
E01에서 인간의 선택과 약관 악의를 가장 선명하게 보여준다.

반드시 고정:
선택권이 상품이 되는 구조
멤버십 등급이 생존 접근권을 가르는 압박
거래가 아니라 후폭풍을 담당하는 인물

금지:
상점 NPC
태그 교환 UI
선량한 정보상
라파/마라의 글로벌 멤버십/태그 중개 축 선점
```

### 6.2 r02_mass_001 퇴원 불가 심사 대리 얼굴

```text
핵심:
R02의 퇴원 심사/치료태그 압박을 대표한다.

반드시 고정:
하람의 전투와 해금 기능을 빼앗지 않는다.
사람 악역보다 절차의 얼굴로 쓴다.
치료받는 것과 나갈 수 있는 것이 다르다는 질문을 담당한다.

금지:
힐러 NPC
병원 보스 정답 설명자
하람 과거 대체자
보호자 서사 독점
```

### 6.3 r03_mass_001 최종 반품 심사 보류관

```text
핵심:
R03의 수취/반송/완료 판정 압력을 대표한다.

반드시 고정:
윤서의 과거가 아니라 R03 시스템의 현재 얼굴이다.
이루의 반송 수취인 전투 기능을 대체하지 않는다.
완료 판정이 사람을 어디로 보내는지 묻는다.

금지:
윤서 과거 설명자
반품 센터 상사
배송 퀘스트 NPC
RETURN-05 기능 반복
```

### 6.4 r08_mass_001 가짜 구조 신호 보관자

```text
핵심:
크게 부르면 산다는 잘못된 믿음을 대표한다.

반드시 고정:
여울의 낮은 수신 전투와 반대편 압력으로 둔다.
구조 신호가 클수록 캠페인도 선명하게 듣는 위험을 보여준다.

금지:
은신/정찰 NPC
침묵권 지도자
여울 해금 대체자
가짜 구조 신호의 정답 설명자
```

### 6.5 r07_mass_001 출항 심사 보류관

```text
핵심:
밖은 해답인가를 검산하는 얼굴이다.

반드시 고정:
GATE-09의 환승/개찰/플랫폼 잔류와 분리한다.
출항, 봉쇄, 검역, 통행 판정 압력으로 제한한다.

금지:
빠른 이동 NPC
탈출 정답 제공자
항만 선장/브로커 영웅
GATE-09 반복
```

---

## 7. 최종 주의

NPC 제작 AI팀은 이번 작업에서 문서를 실제로 작성한다.
하지만 이 프롬프트를 넘기는 방에서는 산출물을 대신 쓰지 않는다.

이 프롬프트의 역할은 제작 범위와 금지 방향을 고정하는 것이다.
후속 묶음 산출물 4개는 `docs/world/E01_NPC_L5_L4_BUNDLE_OUTPUTS_TEAM_PROMPT_V0_1.md` 기준으로 작성 완료되었다.
