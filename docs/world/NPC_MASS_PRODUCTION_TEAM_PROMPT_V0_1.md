# Atomic Ad Survivors NPC 대량 제작팀 프롬프트 v0.1

이 문서는 NPC 제작팀에게 대량 NPC 후보 풀을 맡기기 위한 복붙용 프롬프트다.

기존 `NPC_CREATION_TEAM_PROMPT_V0_1.md`가 지역별 최소안과 통과 후보 선별에 가깝다면, 이 문서는 훨씬 더 큰 NPC 풀을 만드는 데 쓴다.

핵심:

```text
NPC는 12명으로 끝나지 않는다.
하지만 모든 NPC가 v1.0 상세 프로필을 가져야 하는 것도 아니다.
```

목표는 아래 둘을 동시에 만족하는 것이다.

```text
1. 세계가 작게 느껴지지 않도록 충분히 많은 NPC 후보를 만든다.
2. 제작이 터지지 않도록 NPC를 깊이 계층별로 나눈다.
```

---

## 0. 현재 기준

```text
현재 상세 확정/통과 NPC:
침묵 보급소 5명
R01 지역 NPC 12명

추가 완료:
E01 R02/R03/R04/R08 보조 NPC 최소안 12명 후보
E01 NPC 대량 후보 풀 120개 후보
E01 L5/L4 승격 후보 28개 재분류
E01 프로필 v1.0 1차 필수 3명
E01 L5/L4 묶음 산출물 4개
전역 NPC 스토리 네트워크 제작 프롬프트
전역 NPC 스토리 네트워크 1차 실제 산출물 5개
R08/R07 v1.0 보류 해제 게이트
E02 승격 후보 v0.1 검토
E02 핵심 후보 v0.1 프로필 3종
E02 첫 외부 슬라이스 대사/잔향 은행
E02 Vertical Slice NPC 구현 컷
E02 상태 반응/오브젝트 문구 확장
E02 상태/오브젝트 데이터 적용표
E02 첫 외부 슬라이스 QA 체크리스트
E02 구현 데이터 전달/엔진 스키마화
E02 엔진 데이터 변환 전 검증
E02 실제 엔진 데이터 작성 프롬프트
E02 엔진 데이터 패키지
E02 실제 JSON 파일 생성 여부 결정
E02 실제 JSON 파일 생성 조건 해소
E02 실제 JSON 파일 생성 프롬프트
E02 실제 JSON 파일 6개
전역 NPC 이름/원점 검수
전역 NPC 수량 충족 매트릭스
전역 NPC 확장 슬롯 레지스트리
전역 NPC 검수 전 추가 확장 매트릭스
전역 NPC 풀스케일 목표 사다리
전역 NPC 2,048 1차 검수 배치
전역 NPC 검수팀 프롬프트
전역 NPC 검수 보고서
전역 NPC 통과 슬롯 레지스트리

그러나:
이 숫자는 전체 게임 NPC 수가 아니다.
이 숫자는 상세 기준이 존재하는 첫 기준점일 뿐이다.
전역 NPC는 420개 씨앗 기준의 1차 실제 산출물에서 출발했고, 현재 1차 검수 배치 기준은 2,048개 제작 슬롯이다.
장기 풀스케일 목표는 10,240개 제작 슬롯이다.
다만 2,048개 전부가 완성급 NPC는 아니다.
```

사용할 기준 문서:

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/r02_discharge_review_face_profile_v1_0.md
story/03_regions/r03_final_return_review_officer_profile_v1_0.md
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md
story/03_regions/global_npc_story_seed_registry_v0_1.md
story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
story/06_characters/playable_global_npc_link_matrix_v0_1.md
story/03_regions/global_npc_name_location_exposure_registry_v0_1.md
story/03_regions/global_npc_name_origin_review_v0_1.md
story/03_regions/global_npc_quantity_satisfaction_matrix_v0_1.md
story/03_regions/global_npc_expansion_slot_registry_v0_1.md
story/03_regions/global_npc_pre_review_overfill_matrix_v0_1.md
story/03_regions/global_npc_full_scale_target_ladder_v0_1.md
story/03_regions/global_npc_2048_pre_review_wave_v0_1.md
docs/world/GLOBAL_NPC_REVIEW_TEAM_PROMPT_V0_1.md
story/03_regions/global_npc_review_report_v0_1.md
story/03_regions/global_npc_passed_slot_registry_v0_1.md
story/03_regions/e01_r08_r07_v1_hold_release_gate_v0_1.md
story/03_regions/e02_npc_promotion_candidates_v0_1.md
story/03_regions/e02_locker_recipient_profile_v0_1.md
story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md
story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md
story/03_regions/e02_first_slice_dialogue_bank_v0_1.md
story/03_regions/e02_trace_object_bank_v0_1.md
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md
docs/world/E02_FIRST_SLICE_STATE_OBJECT_EXPANSION_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md
docs/world/E02_FIRST_SLICE_STATE_OBJECT_DATA_APPLICATION_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md
docs/world/E02_FIRST_SLICE_NPC_QA_CHECKLIST_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md
docs/world/E02_FIRST_SLICE_ENGINE_SCHEMA_HANDOFF_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md
docs/world/E02_FIRST_SLICE_ENGINE_DATA_PRE_CONVERSION_VALIDATION_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md
docs/world/E02_FIRST_SLICE_ENGINE_DATA_WRITING_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_engine_data_package_v0_1.md
docs/world/E02_FIRST_SLICE_JSON_FILE_CREATION_DECISION_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
docs/world/E02_FIRST_SLICE_JSON_FILE_CREATION_CONDITION_PATCH_TEAM_PROMPT_V0_1.md
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
docs/world/E02_FIRST_SLICE_ACTUAL_JSON_FILE_WRITING_TEAM_PROMPT_V0_1.md
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
docs/world/E01_NPC_L5_L4_BUNDLE_OUTPUTS_TEAM_PROMPT_V0_1.md
docs/world/GLOBAL_NPC_STORY_NETWORK_PRODUCTION_PROMPT_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
```

---

## 1. 대량 제작 원칙

NPC 대량 제작은 “전부 깊게 쓰기”가 아니다.

NPC를 아래 계층으로 나눈다.

| 계층 | 이름 | 설명 | 상세화 깊이 |
|---|---|---|---|
| L5 | 핵심 NPC | 시즌/지역 질문을 대표한다 | 프로필 v1.0, 대사 은행, 상태값 반응 |
| L4 | 주요 보조 NPC | 플레이어블/NPC 선택 후폭풍을 담당한다 | 프로필 v0.1~v1.0 후보, 조건 대사 |
| L3 | 기능 NPC | 시설, 상점, 검사, 줄, 표식을 담당한다 | 후보표, 3~5줄 대사 |
| L2 | 잔향 NPC | 방송, 로그, 사진, 우편함, 번호표, 스피커 | 오브젝트 문구, 조건 반응 |
| L1 | 배경 인물 | 군중, 대기열, 게시판, 명단 속 이름 | 이름/역할/한 줄 |
| L0 | 패턴 문구 | 자동 안내, 영수증, 표지판, 앱 알림 | 이름 없음 |

중요:

```text
NPC 후보는 많이 만든다.
프로필 v1.0은 소수만 만든다.
대부분은 L1~L3 후보 풀로 남겨도 된다.
```

---

## 2. 목표 수량

### 2.1 E01 전체 NPC 후보 풀

E01은 첫 시즌이므로 풍부해야 한다.

권장 후보 수:

| 구역 | 기존 기준 | 대량 후보 목표 |
|---|---:|---:|
| 침묵 보급소 | 상주 5명 | 상주 5명 + 방문자/배경/잔향 20~30개 |
| R01 서부 스마일홈 | 핵심 12명 | 핵심 12명 + 배경/잔향/군중 20~30개 |
| R02 의료/보험 | 최소안 3명 | 후보 12~18개 |
| R03 물류/반품 | 최소안 3명 | 후보 12~18개 |
| R04 정품/충전/산업 | 최소안 3명 | 후보 12~18개 |
| R05 방송/수신 | 미정 | 후보 10~15개 |
| R06 상업/멤버십 | 미정 | 후보 10~15개 |
| R07 항만/이송 | 미정 | 후보 10~15개 |
| R08 침묵권/비상보급 | 최소안 3명 | 후보 12~18개 |

E01 전체 목표:

```text
1차 대량 후보 풀:
120~170개 NPC/잔향/배경 후보

그중 L5~L4:
20~30개

그중 실제 직접 대면 우선:
10~18개
```

### 2.2 E02 첫 외부 슬라이스

E02는 첫 외부 확장이라 넉넉한 후보 풀이 필요하다.

권장:

```text
E02 후보 풀:
40~60개

L5 핵심:
5~7개

L4 주요 보조:
8~12개

L1~L3 배경/잔향/기능:
30~40개
```

### 2.3 E02~E12 전역 NPC 씨앗

전역 캠페인은 지금 전부 상세화하지 않는다.
대신 광역권별 씨앗을 만든다.

권장:

| 범위 | 후보 수 |
|---|---:|
| E02~E12 각 광역권 | 20~30개 |
| 11개 외부 광역권 전체 | 220~330개 |
| 이 중 L5 핵심 예약 | 광역권당 2~4개 |
| 이 중 L1~L3 배경/잔향 | 대부분 |

정리:

```text
대량 NPC 제작팀은 1차로 300~500개 후보 씨앗을 만들 수 있다.
하지만 v1.0 상세화 대상은 그중 일부만 올린다.
```

---

## 3. 대량 NPC 필수 필드

대량 후보는 너무 길면 안 된다.
아래 필드만 먼저 채운다.

```text
npc_seed_id:
display_label:
depth_level:
npc_form:
parent_region:
parent_campaign_id:
admin_real_region:
admin_infra_anchor:
user_display_region_name:
first_exposure:
core_function:
wrong_belief:
state_key:
playable_overlap:
name_policy:
one_line_dialogue:
promotion_candidate:
forbidden:
```

값 기준:

```text
depth_level:
L5_core | L4_major_support | L3_function | L2_trace | L1_background | L0_pattern

npc_form:
human | robot | device | system_voice | object_trace | profile_residue | crowd | document

first_exposure:
direct | voice | object | list_name | signage | log | background

name_policy:
real_name_now | role_first | name_late | fragment_only | no_human_name | unnamed

promotion_candidate:
profile_v1 | short_profile | dialogue_bank | trace_bank | background_only | reject
```

---

## 4. 이름/국적/현실 위치 규칙

대량 NPC일수록 이름 관리가 중요하다.

규칙:

```text
1. 모든 이름 있는 NPC는 관리자용 현실 위치를 가진다.
2. 유저에게 실제 도시명을 노출하지 않아도 제작팀은 알아야 한다.
3. E01 초반은 한국어권 이름이 많아도 된다.
4. E02 이후는 해당 현실 권역의 언어권/이주/물류/관광/피난 맥락을 반영한다.
5. 모든 외부 NPC를 전형적 현지 이름으로만 만들지 않는다.
6. 항만, 공항, 물류, 관광, 검역, 피난권은 다국적 이름이 자연스럽다.
7. 로봇/장치/잔향형에는 억지 사람 이름을 붙이지 않는다.
8. 본명 공개가 필요한 NPC만 본명을 가진다.
9. L1 배경 인물은 이름 대신 번호/명단/호명 조각만으로 충분하다.
```

중복 금지 기준:

```text
윤서
PATCH
서이겸
강하람
한이루
차유건
백여울
리오
Mika Arakawa
Nora Weiss
Mara Kincaid
Rafaela Costa
미나
장도윤
팝시
세븐
복희
R01 본명 9명
아린
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 NPC 대량 후보 풀을 제작한다.

이번 작업은 NPC 12명짜리 최소안이 아니다.
세계가 작게 보이지 않도록 대량 NPC 씨앗을 만든다.

중요:
많이 만들되, 전부 상세 프로필로 만들지 않는다.
모든 후보를 L5/L4/L3/L2/L1/L0 계층으로 나눈다.

목표 수량:
1차 작업에서는 아래 중 하나를 선택한다.

A안:
E01 전체 NPC 후보 풀 120~170개

B안:
E02 첫 외부 슬라이스 후보 풀 40~60개

C안:
E02~E12 전역 NPC 씨앗 220~330개

D안:
전부 통합 300~500개 NPC 씨앗

이번 작업 추천:
A안부터 한다.
E01 전체 NPC 후보 풀 120~170개를 만든다.

반드시 읽을 문서:
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md

대량 후보 필드:
npc_seed_id:
display_label:
depth_level:
npc_form:
parent_region:
parent_campaign_id:
admin_real_region:
admin_infra_anchor:
user_display_region_name:
first_exposure:
core_function:
wrong_belief:
state_key:
playable_overlap:
name_policy:
one_line_dialogue:
promotion_candidate:
forbidden:

depth_level 기준:
L5_core:
시즌/지역 질문을 대표하는 핵심 NPC.

L4_major_support:
플레이어블 해금/선택 후폭풍을 담당하는 주요 보조 NPC.

L3_function:
시설/검사/접수/줄/표식/상점/정산 기능 NPC.

L2_trace:
음성, 로그, 사진, 번호표, 표지판, 우편함, 잔향.

L1_background:
군중, 명단, 대기열, 게시물 속 이름.

L0_pattern:
자동 문구, 영수증, 앱 알림, 경고문 패턴.

출력 형식:

# NPC 대량 후보 풀 v0.1

## 문서 상태

상태:
제작팀 대량 후보 풀 v0.1

작업 범위:
E01 전체 / E02 첫 외부 / E02~E12 전역 / 통합 중 선택

총 후보 수:
[숫자]

판정:
후보 풀 작성 완료

## 0. 수량 요약

| 권역/지역 | L5 | L4 | L3 | L2 | L1 | L0 | 합계 |
|---|---:|---:|---:|---:|---:|---:|---:|

## 1. 기존 확정 NPC 보존

보급소 5명, R01 12명, E01 보조 NPC 최소안 12명은 기존 기준으로 보존한다.
이들을 대체하지 않는다.
대량 후보는 이들을 확장하거나 주변을 채운다.

## 2. 후보 테이블

아래 형식으로 대량 작성한다.

| npc_seed_id | display_label | depth_level | npc_form | parent_region | parent_campaign_id | admin_real_region | admin_infra_anchor | first_exposure | core_function | wrong_belief | state_key | playable_overlap | name_policy | one_line_dialogue | promotion_candidate | forbidden |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|

## 3. L5/L4 승격 후보

후보 풀 중 상세화 가치가 있는 L5/L4만 따로 뽑는다.

| 우선 | npc_seed_id | 이유 | 다음 문서 |
|---:|---|---|---|

## 4. L2/L1/L0 잔향/배경 은행

이름 있는 NPC로 만들지 않고 세계 밀도를 올리는 후보를 정리한다.

| 유형 | 후보 수 | 사용처 | 예시 문구 |
|---|---:|---|---|

## 5. 플레이어블 충돌 검산

윤서, PATCH, 강하람, 한이루, 차유건, 백여울, 리오, 미카 후보와 충돌하는지 점검한다.

## 6. 이름/국적/현실 위치 검산

이름 중복, 언어권 편중, 현실 위치 미지정 후보를 점검한다.

## 7. 다음 작업

다음 중 하나를 지정한다.

1. L5/L4 승격 후보 상세 결재
2. NPC 이름 레지스트리 확장
3. NPC 대사 은행 확장
4. 잔향/배경 문구 은행 작성
5. E02 첫 외부 슬라이스 NPC 후보 풀 작성
```

---

## 6. E01 전체 대량 후보 즉시 사용 버전

아래를 그대로 NPC 제작팀에 넘긴다.

```text
Atomic Ad Survivors의 E01 전체 NPC 대량 후보 풀을 만든다.

이번 작업은 최소안이 아니다.
E01 세계가 작게 보이지 않도록 NPC/잔향/배경 후보를 120~170개 만든다.

단, 전부 상세 프로필로 만들지 않는다.
모든 후보를 L5/L4/L3/L2/L1/L0로 나눈다.

대상:
침묵 보급소
R01 서부 스마일홈
R02 의료/보험
R03 물류/반품
R04 정품/충전/산업
R05 방송/수신
R06 상업/멤버십
R07 항만/이송
R08 침묵권/비상보급

수량 목표:
침묵 보급소 방문자/배경/잔향 20~30개
R01 추가 배경/잔향/군중 20~30개
R02 후보 12~18개
R03 후보 12~18개
R04 후보 12~18개
R05 후보 10~15개
R06 후보 10~15개
R07 후보 10~15개
R08 후보 12~18개

기존 확정 NPC는 대체하지 않는다.
보급소 5명, R01 12명, E01 보조 NPC 최소안 12명은 기준점으로 보존한다.

반드시 출력:
1. 수량 요약표
2. 120~170개 후보 테이블
3. L5/L4 승격 후보 20~30개
4. L2/L1/L0 잔향/배경 은행
5. 플레이어블 충돌 검산
6. 이름/국적/현실 위치 검산
7. 다음 상세화 우선순위

필드:
npc_seed_id
display_label
depth_level
npc_form
parent_region
parent_campaign_id
admin_real_region
admin_infra_anchor
user_display_region_name
first_exposure
core_function
wrong_belief
state_key
playable_overlap
name_policy
one_line_dialogue
promotion_candidate
forbidden

중요:
NPC는 많이 만든다.
하지만 직접 대면 NPC는 적게 둔다.
세계 밀도는 L2/L1/L0 잔향, 문구, 군중, 명단, 안내, 로그로 채운다.

추천 산출물:
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
```

---

## 7. 금지 방향

대량 제작에서 특히 금지한다.

```text
모든 후보에게 감성 과거사 붙이기
모든 후보를 직접 대면 NPC로 만들기
모든 후보에게 본명 붙이기
모든 후보를 퀘스트 제공자로 만들기
플레이어블 기능을 NPC가 빼앗기
지역별 대표 NPC만 만들고 배경 밀도 비우기
이름/국적/현실 위치 없이 코드명만 늘리기
실제 사건/실존 인물 패러디처럼 보이는 배치
```

---

## 8. 다음 작업

```text
1. E01 전체 NPC 대량 후보 풀 120개 작성 완료.
2. 결과 문서는 story/03_regions/e01_npc_mass_candidate_pool_v0_1.md를 기준으로 사용한다.
3. L5/L4 승격 후보 28개 재분류 완료.
4. 승격 검토 결과 문서는 story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md를 기준으로 사용한다.
5. 프로필 v1.0 1차 필수 3명 작성 완료.
6. E01 L5/L4 묶음 산출물 4개 작성 완료.
7. v0.1 짧은 프로필, 대사 은행, 잔향/배경 은행, 이름/현실 위치 검산 결과를 기준으로 사용한다.
8. 전역 NPC 스토리 네트워크 1차 실제 산출물 5개 작성 완료.
9. R08/R07 v1.0 보류 해제 게이트 작성 완료.
10. E02 승격 후보 v0.1 검토 작성 완료.
11. E02 핵심 후보 v0.1 프로필 3종 작성 완료.
12. E02 첫 외부 슬라이스 대사/잔향 은행 작성 완료.
13. E02 Vertical Slice NPC 구현 컷 작성 완료.
14. E02 상태 반응/오브젝트 문구 확장도 작성 완료되었다.
15. 완료 산출물은 e02_first_slice_state_reaction_matrix_v0_1.md, e02_first_slice_object_text_bank_v0_1.md다.
16. E02 상태/오브젝트 데이터 적용표도 작성 완료되었다.
17. 완료 산출물은 e02_first_slice_state_object_data_application_v0_1.md다.
18. E02 첫 외부 슬라이스 QA 체크리스트도 작성 완료되었다.
19. 완료 산출물은 e02_first_slice_npc_qa_checklist_v0_1.md다.
20. E02 구현 데이터 전달/엔진 스키마화도 작성 완료되었다.
21. 완료 산출물은 e02_first_slice_engine_schema_handoff_v0_1.md다.
22. E02 엔진 데이터 변환 전 검증도 작성 완료되었다.
23. 완료 산출물은 e02_first_slice_engine_data_pre_conversion_validation_v0_1.md다.
24. E02 실제 엔진 데이터 작성 프롬프트와 Markdown 엔진 데이터 패키지도 작성 완료되었다.
25. 완료 산출물은 E02_FIRST_SLICE_ENGINE_DATA_WRITING_TEAM_PROMPT_V0_1.md와 e02_first_slice_engine_data_package_v0_1.md다.
26. E02 실제 JSON 파일 생성 여부 결정도 작성 완료되었다.
27. 판정은 조건부 생성 가능이며 실제 data/e02/*.json 파일은 만들지 않았다.
28. E02 실제 JSON 파일 생성 조건 해소도 작성 완료되었다.
29. 판정은 조건 해소이며 해당 문서 시점에서는 실제 data/e02/ 디렉터리와 JSON 파일을 만들지 않았다.
30. E02 실제 JSON 파일 생성 프롬프트도 작성 완료되었다.
31. 실제 data/e02/ 디렉터리와 허용된 6개 JSON 파일을 생성했고 validation.actual_files_created는 true다.
32. 전역 NPC 이름/원점 검수도 작성 완료되었다.
33. E01 한국권 과밀 생산 금지, E02 이후 한국어 임시명 금지, L5/L4 이름 게이트를 잠갔다.
34. 전역 NPC 수량 충족 매트릭스도 작성 완료되었다.
35. 420개 1차 게이트를 768개 제작 슬롯 만족 기준으로 확장했고, 증분 +348개는 E02~E12와 cross_region에만 배정했다.
36. 전역 NPC 확장 슬롯 레지스트리도 작성 완료되었다.
37. 증분 +348개를 E02 +24, E03~E12 +300, cross_region +24 슬롯으로 등록했다.
38. 전역 NPC 검수 전 추가 확장 매트릭스도 작성 완료되었다.
39. 검수 전 기준을 1,024개 제작 슬롯으로 올렸고, 증분 +256개는 E02~E12와 cross_region에만 배정했다.
40. 전역 NPC 풀스케일 목표 사다리도 작성 완료되었다.
41. 1,024개를 약 1/10 단계로 보고 장기 목표 10,240개 제작 슬롯을 설정했다.
42. 전역 NPC 2,048 1차 검수 배치도 작성 완료되었다.
43. E01은 120개 고정, E02~E12와 cross_region만 증분 배정했다.
44. 전역 NPC 검수팀 프롬프트도 2,048개 기준으로 갱신 완료되었다.
45. 전역 NPC 검수 보고서도 작성 완료되었다.
46. 2,048 슬롯 조건부 통과, L5/L4 192개만 이름/직접 대면 검토, L3 이하 1,856개 하향으로 판정했다.
47. 전역 NPC 통과 슬롯 레지스트리도 작성 완료되었다.
48. 통과 슬롯 2,048개를 L5/L4 192개 후보와 L3 이하 1,856개 은행형 슬롯으로 정리했다.
49. 다음은 전역 NPC L3 이하 잔향/오브젝트 은행 작성으로 넘긴다.
```
