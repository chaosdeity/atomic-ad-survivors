# E01 NPC L5/L4 묶음 산출물 제작팀 프롬프트 v0.1

이 문서는 NPC 제작 AI팀에게 `NPC-6.7 E01 L5/L4 묶음 산출물`만 맡기기 위한 복붙용 프롬프트다.

이번 작업은 새 NPC 후보 생성이 아니다.
이번 작업은 이미 검토된 28개 L5/L4 후보를 정해진 깊이로 나눠서 문서화하는 일이다.

후속 상태:

```text
NPC-6.7 묶음 산출물 4개 작성 완료.
이 프롬프트는 제작 기준과 검산 기준으로 보존한다.
```

핵심:

```text
확정/상세 NPC는 현재 20명이다.
E01 후보 풀은 120개다.
L5/L4 승격 검토 대상은 28개다.
그중 프로필 v1.0 1차 상세화는 3명 완료다.

이번 작업은 남은 25개를 전부 장문 프로필로 올리는 일이 아니다.
v0.1 짧은 프로필, 대사 은행, 잔향/배경 은행, 이름/현실 위치 검산으로 나눈다.
```

---

## 0. 현재 수량 기준

현재까지 실제 확정/상세 NPC 기준:

| 묶음 | 수 | 상태 |
|---|---:|---|
| 침묵 보급소 상주 NPC | 5 | 확정/상세 기준 존재 |
| R01 지역 NPC | 12 | 확정/상세 기준 존재 |
| E01 L5/L4 프로필 v1.0 1차 | 3 | 작성 완료 |
| 합계 | 20 | 확정/상세 NPC 기준 |

후보/검토 기준:

| 묶음 | 수 | 상태 |
|---|---:|---|
| E01 NPC 대량 후보 풀 | 120 | 후보 씨앗 작성 완료 |
| E01 L5/L4 승격 검토 | 28 | 재분류 완료 |
| 프로필 v1.0 우선 후보 | 5 | 3명 완료, 2명 보류 |
| 프로필 v0.1 후보 | 8 | 이번 작업 대상 |
| 대사 은행 후보 | 8 | 이번 작업 대상 |
| 잔향/배경 하향 후보 | 7 | 이번 작업 대상 |

주의:

```text
120개는 전부 확정 NPC가 아니다.
20명은 게임 전체 최종 NPC 수가 아니다.
NPC 숫자가 아직 작기 때문에, 전역 NPC 씨앗 제작은 별도 프롬프트로 계속 진행해야 한다.
```

전역 확장 프롬프트:

```text
docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
```

---

## 1. 이번 작업 목표

NPC 제작 AI팀은 아래 4개 파일을 작성한다.

```text
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md
```

이번 작업에서 작성하지 않는 것:

```text
새 플레이어블 후보
새 E01 NPC 후보
새 전역 NPC 후보
R08/R07 v1.0 장문 프로필
스토리 본문
캠페인 플롯
보스전
퀘스트라인
```

R08/R07 v1.0은 시즌 오픈 순서가 확정된 뒤 별도 작업으로 넘긴다.

---

## 2. 반드시 읽을 문서

최우선:

```text
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
docs/world/E01_NPC_L5_L4_PRODUCTION_TEAM_PROMPT_V0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
```

기존 NPC 기준:

```text
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/03_regions/r01_npc_name_registry_v1_0.md
story/03_regions/r01_npc_dialogue_bank_v0_1.md
story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/r02_discharge_review_face_profile_v1_0.md
story/03_regions/r03_final_return_review_officer_profile_v1_0.md
```

세계/규칙 기준:

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
```

플레이어블 충돌 방지:

```text
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/yunseo_profile_v1_0.md
story/06_characters/patch_profile_v1_0.md
story/06_characters/open_host_profile_v1_0.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
story/06_characters/gate_09_profile_v1_0.md
story/06_characters/broad_10_playable_decision_v0_1.md
```

---

## 3. 절대 원칙

```text
NPC는 퀘스트 배포기가 아니다.
NPC는 시설, 상태값, 흔적, 선택 후폭풍, 캠페인 압력을 보여주는 얼굴이다.
```

반드시 지킬 것:

```text
1. L5/L4 28개를 전부 프로필 v1.0으로 올리지 않는다.
2. v0.1 후보 8명은 짧게만 잠근다.
3. 대사 은행 후보 8명은 조건 대사 3~5줄씩만 쓴다.
4. 잔향/배경 후보 7명은 사람 프로필로 승격하지 않는다.
5. 본명은 기능과 현실 위치 검산 뒤에만 확정한다.
6. 직접 대면, 음성, 오브젝트, 로그, 배경 문구를 분리한다.
7. 플레이어블 20인 전투/해금/긴급 인양 기능을 빼앗지 않는다.
8. 보급소 5명과 R01 12명 기능을 대체하지 않는다.
```

금지:

```text
새 플레이어블 만들기
새 후보 추가하기
상점/강화/거래 UI 담당 NPC 만들기
지역 정답 설명자 만들기
R01 확정 NPC 반복하기
보급소 시설 기능 대체하기
하향 후보에게 본명 붙이기
현실 기관/기업/실제 사건 패러디하기
```

---

## 4. 산출물 1: v0.1 짧은 프로필

작성 파일:

```text
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
```

대상 8명:

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

출력 형식:

| npc_id | display_role_name | region | first_exposure | direct_meet_limit | core_function | wrong_belief | state_keys | choice_flags | playable_overlap_guard | forbidden | next_possible_upgrade |
|---|---|---|---|---|---|---|---|---|---|---|---|

각 후보 작성 기준:

```text
분량은 표 1행 + 필요 시 후보별 3~5줄 메모를 넘지 않는다.
장문 프로필처럼 쓰지 않는다.
직접 대면 가능 여부를 반드시 제한한다.
플레이어블 충돌 방지 대상을 반드시 적는다.
```

특히 주의:

```text
r04_mass_001은 PATCH, METER-06, RIO-08과 겹치면 안 된다.
r05_mass_001은 R05 세계 진실을 조기 설명하면 안 된다.
r02_mass_002는 HOLD-04 보호자 서사를 대체하면 안 된다.
r03_mass_002는 RETURN-05 반송 수취인 전투를 대체하면 안 된다.
r08_mass_002는 KEY-RING 반복이나 QUIET-07 은신 기능이 되면 안 된다.
r06_mass_002는 상점/사채 UI가 되면 안 된다.
r07_mass_002는 GATE-09 환승/개찰 판정이 되면 안 된다.
```

---

## 5. 산출물 2: 대사 은행

작성 파일:

```text
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
```

대상 8명:

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

각 후보당:

```text
대사 3~5줄
조건 2~4개
금지 1~3개
```

권장 조건:

```text
보급 압력 상승
수신 안정도 하락
로봇 자율성 상승
인간 안정도 하락
배송상태 오염
통행태그 부족
진료태그 부족
멤버십 압박 상승
인양 안정도 하락
```

출력 형식:

```text
## [npc_seed_id] [display_role_name]

처리:
대사 은행

지역:

권장 조건:
-
-

대사:
1.
2.
3.
4.
5.

금지:
-
```

금지:

```text
상점 대사
거래 안내
강화 안내
퀘스트 설명
지역 정답 설명
본명 공개
개그 NPC화
```

---

## 6. 산출물 3: 잔향/배경 은행

작성 파일:

```text
story/03_regions/e01_npc_trace_background_bank_v0_1.md
```

L5/L4 하향 대상 7개:

```text
r01_mass_001 모델하우스 사진 보정 담당
r01_mass_002 대체 보호자 칸 관리자
r04_mass_003 불량품 프레스 정렬자
r05_mass_003 추천 서버 열관리자
r02_mass_004 격리문 복도 살균 음성
r03_mass_004 압축 대기라인 방송
r04_mass_004 충전 케이블 분리 음성
```

추가 허용:

```text
E01 NPC 대량 후보 풀의 L2/L1/L0 후보를 필요한 만큼 함께 정리해도 된다.
단, 이 경우에도 사람 프로필로 승격하지 않는다.
```

출력 형식:

| trace_id | source_candidate | region | form | where_seen | trigger_condition | text_or_audio | what_it_implies | who_must_not_be_replaced | forbidden |
|---|---|---|---|---|---|---|---|---|---|

form 허용값:

```text
log
system_voice
signage
object_trace
document
list_name
background_pattern
```

금지:

```text
본명 부여
초상/직접 대면
개인 퀘스트
플레이어블 해금 중심 단서화
R01 확정 NPC 대체
보급소 NPC 대체
```

---

## 7. 산출물 4: 이름/현실 위치 검산

작성 파일:

```text
story/03_regions/e01_npc_name_location_registry_v0_1.md
```

대상:

```text
프로필 v1.0 3명 완료분
프로필 v1.0 보류 2명
v0.1 짧은 프로필 8명
대사 은행 후보 8명
잔향/배경 하향 후보 7명
```

출력 형식:

| 대상 | 현재 표기 | 본명 공개 정책 | 관리자용 현실 권역 | 인프라 앵커 | 유저 노출 지역명 | 중복 위험 | 검산 판정 |
|---|---|---|---|---|---|---|---|

본명 공개 정책 허용값:

```text
role_only
fragment_only
name_late
real_name_allowed_later
no_human_name
```

검산 판정 허용값:

```text
통과
조건부 통과
보류
하향 유지
```

반드시 확인할 중복 대상:

```text
윤서
PATCH
서이겸 / OPEN-HOST
강하람 / HOLD-04
한이루 / RETURN-05
차유건 / METER-06
백여울 / QUIET-07
리오 / RIO-08
Mika Arakawa / GATE-09
Nora Weiss / BROAD-10
미나
장도윤
팝시
세븐
복희
R01 확정 NPC 12명
```

---

## 8. 복붙용 마스터 프롬프트

```text
Atomic Ad Survivors의 NPC-6.7 E01 L5/L4 묶음 산출물을 제작한다.

이번 작업은 새 NPC 후보 생성이 아니다.
스토리 본문 작성도 아니다.
이미 검토된 E01 L5/L4 후보 28개를 기준으로, 장문 프로필이 아닌 묶음 산출물을 작성한다.

현재 수량 기준:
- 확정/상세 NPC: 20명
- E01 후보 풀: 120개
- L5/L4 승격 검토: 28개
- 프로필 v1.0 1차 상세화: 3명 완료
- 이번 작업 대상: v0.1 8명, 대사 은행 8명, 잔향/배경 7명, 이름/현실 위치 검산

반드시 읽을 문서:
1. story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
2. story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
3. docs/world/E01_NPC_L5_L4_PRODUCTION_TEAM_PROMPT_V0_1.md
4. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
5. story/02_hub/outpost_core_npc_profiles_v1_0.md
6. story/03_regions/r01_campaign1_npc_roster_v0_1.md
7. story/03_regions/e01_support_npc_minimum_plan_v0_1.md
8. story/06_characters/playable_20_roster_blueprint_v0_1.md
9. story/06_characters/playable_20_name_registry_v0_1.md

작성할 파일:
1. story/03_regions/e01_l5_l4_short_profiles_v0_1.md
2. story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
3. story/03_regions/e01_npc_trace_background_bank_v0_1.md
4. story/03_regions/e01_npc_name_location_registry_v0_1.md

대상 분류:

v0.1 짧은 프로필 8명:
- r04_mass_001 재동기화 코어 전 감시자
- r05_mass_001 마지막 앵커 그림자
- r02_mass_002 보호자 호출 대행자
- r03_mass_002 분류선 수동 정지 담당자
- r04_mass_002 리콜 접수 부스 잔류자
- r08_mass_002 폐역 중계실 열쇠 담당
- r06_mass_002 포인트 사채 중개자
- r07_mass_002 검역문 열화상 판독자

대사 은행 8명:
- hub_mass_001 밤 카운터 임시 정산자
- hub_mass_002 충전 스탠드 뒤 대기 로봇
- r02_mass_003 약품 봉인 담당자
- r03_mass_003 보증 스티커 회수원
- r05_mass_002 반복 뉴스 데스크 편집자
- r06_mass_003 리뷰 조작 대기열 관리자
- r07_mass_003 수하물 오분류 접수원
- r08_mass_003 민방위 급수표 관리자

잔향/배경 하향 7개:
- r01_mass_001 모델하우스 사진 보정 담당
- r01_mass_002 대체 보호자 칸 관리자
- r04_mass_003 불량품 프레스 정렬자
- r05_mass_003 추천 서버 열관리자
- r02_mass_004 격리문 복도 살균 음성
- r03_mass_004 압축 대기라인 방송
- r04_mass_004 충전 케이블 분리 음성

작성 원칙:
1. v0.1 후보를 장문 프로필로 승격하지 않는다.
2. 대사 은행 후보는 조건 대사 3~5줄씩만 쓴다.
3. 잔향/배경 후보는 로그, 자동 음성, 표식, 문서, 배경 문구로만 쓴다.
4. 새 NPC 후보를 추가하지 않는다.
5. 새 플레이어블 후보를 추가하지 않는다.
6. 상점/강화/거래/퀘스트 배포 기능을 만들지 않는다.
7. 보급소 5명, R01 12명, 플레이어블 20인 기능을 대체하지 않는다.
8. 본명은 이름/현실 위치 검산 문서에서만 정책으로 판단한다.

완료 기준:
1. 4개 산출물이 모두 작성되어 있다.
2. v0.1 8명, 대사 은행 8명, 잔향/배경 7개가 누락되지 않는다.
3. 28개 L5/L4 재분류를 임의로 바꾸지 않는다.
4. 코드펜스 균형이 맞는다.
5. trailing whitespace가 없다.
6. 마지막에 작성 파일 목록과 보류 항목을 요약한다.
```

---

## 9. 최종 주의

이 프롬프트의 목적은 NPC 숫자를 부풀리는 것이 아니다.
목적은 이미 만들어진 E01 후보 120개 중 핵심 28개를 과승격하지 않고, 구현 가능한 깊이로 나누는 것이다.

전역 NPC 숫자는 아직 부족하다.
전역 유기성을 만들기 위한 다음 대량 작업은 아래 문서로 별도 진행한다.

```text
docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
```
