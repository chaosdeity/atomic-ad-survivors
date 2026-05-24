# Atomic Ad Survivors NPC 제작팀 프롬프트 v0.1

이 문서는 `Atomic Ad Survivors`의 NPC 제작팀에게 넘기는 복붙용 프롬프트다.

목표는 NPC 이름을 많이 뽑는 것이 아니다.
목표는 각 지역/캠페인에서 필요한 NPC를 빠르게 선별하고, 플레이어블과 겹치지 않게 기능을 잠근 뒤, 통과 후보만 상세화하는 것이다.

핵심 기준:

```text
NPC는 퀘스트 배포기가 아니다.
NPC는 시설, 상태값, 흔적, 선택 후폭풍, 캠페인 압력을 보여주는 얼굴이다.
```

---

## 0. 현재 진행 상태

```text
전체 NPC 제작 로드맵:
완료
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md

현재 확정/상세 NPC:
20명

구성:
침묵 보급소 상주 NPC 5명
R01 지역 NPC 12명
E01 L5/L4 프로필 v1.0 1차 3명

보급소 5명 통합 프로필:
story/02_hub/outpost_core_npc_profiles_v1_0.md

보급소 5명 대사 은행:
story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md

R01 Vertical Slice NPC 구현 목록:
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md

R01 NPC 데이터 스키마 적용:
story/03_regions/r01_npc_data_schema_application_v0_1.md

E01 R02/R03/R04/R08 보조 NPC 최소안:
story/03_regions/e01_support_npc_minimum_plan_v0_1.md

대량 제작 전용 프롬프트:
docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md

E01 NPC 대량 후보 풀:
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md

E01 L5/L4 승격 후보 검토:
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md

E01 L5/L4 묶음 산출물:
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md

현재 NPC 트랙 최신 완료:
E02 실제 JSON 파일 생성 여부 결정

현재 NPC 트랙 다음 작업:
E02 실제 JSON 파일 생성 조건 해소 또는 CLAUSE-11 상세 결재

전역 NPC 스토리 네트워크 1차 실제 산출:
story/03_regions/global_npc_story_seed_registry_v0_1.md
story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
story/06_characters/playable_global_npc_link_matrix_v0_1.md
story/03_regions/global_npc_name_location_exposure_registry_v0_1.md

R08/R07 v1.0 보류 해제 게이트:
story/03_regions/e01_r08_r07_v1_hold_release_gate_v0_1.md

E02 승격 후보 v0.1 검토:
story/03_regions/e02_npc_promotion_candidates_v0_1.md

E02 핵심 후보 v0.1 프로필 3종:
story/03_regions/e02_locker_recipient_profile_v0_1.md
story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md
story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md

E02 대사/잔향 은행:
story/03_regions/e02_first_slice_dialogue_bank_v0_1.md
story/03_regions/e02_trace_object_bank_v0_1.md

E02 Vertical Slice NPC 구현 컷:
story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md

E02 상태 반응/오브젝트 문구 확장 프롬프트:
docs/world/E02_FIRST_SLICE_STATE_OBJECT_EXPANSION_TEAM_PROMPT_V0_1.md

E02 상태 반응/오브젝트 문구 확장:
story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md
story/03_regions/e02_first_slice_object_text_bank_v0_1.md

E02 상태/오브젝트 데이터 적용표 프롬프트:
docs/world/E02_FIRST_SLICE_STATE_OBJECT_DATA_APPLICATION_TEAM_PROMPT_V0_1.md

E02 상태/오브젝트 데이터 적용표:
story/03_regions/e02_first_slice_state_object_data_application_v0_1.md

E02 첫 외부 슬라이스 QA 체크리스트 프롬프트:
docs/world/E02_FIRST_SLICE_NPC_QA_CHECKLIST_TEAM_PROMPT_V0_1.md

E02 첫 외부 슬라이스 QA 체크리스트:
story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md

E02 구현 데이터 전달/엔진 스키마화 프롬프트:
docs/world/E02_FIRST_SLICE_ENGINE_SCHEMA_HANDOFF_TEAM_PROMPT_V0_1.md

E02 구현 데이터 전달/엔진 스키마화:
story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md

E02 엔진 데이터 변환 전 검증 프롬프트:
docs/world/E02_FIRST_SLICE_ENGINE_DATA_PRE_CONVERSION_VALIDATION_TEAM_PROMPT_V0_1.md

E02 엔진 데이터 변환 전 검증:
story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md

E02 실제 엔진 데이터 작성 프롬프트:
docs/world/E02_FIRST_SLICE_ENGINE_DATA_WRITING_TEAM_PROMPT_V0_1.md

E02 엔진 데이터 패키지:
story/03_regions/e02_first_slice_engine_data_package_v0_1.md

E02 실제 JSON 파일 생성 여부 결정 프롬프트:
docs/world/E02_FIRST_SLICE_JSON_FILE_CREATION_DECISION_TEAM_PROMPT_V0_1.md

E02 실제 JSON 파일 생성 여부 결정:
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
```

---

## 1. NPC 제작팀 운영 원칙

NPC 제작은 플레이어블 제작과 병렬로 간다.
하지만 산출물은 섞지 않는다.

금지:

```text
플레이어블 후보를 NPC로 대체하기
NPC 기능을 플레이어블에게 흡수시키기
모든 캠페인에 12명씩 NPC 붙이기
지역마다 감성 사연 NPC 대량 생성
NPC를 상점/튜토리얼/퀘스트 배포기로만 만들기
이름 먼저 짓고 기능을 나중에 맞추기
국적과 현실 위치를 장식으로 쓰기
로봇/장치형 NPC에게 억지 사람 이름 붙이기
```

반드시 지킬 것:

```text
1. NPC는 먼저 담당 시설/상태값/선택 후폭풍을 가진다.
2. 이름은 캠페인 등록 방식과 현실 권역을 정한 뒤 붙인다.
3. 직접 대면 NPC, 잔향 NPC, 오브젝트 NPC, 자동 음성 NPC를 분리한다.
4. 플레이어블과 겹치는 경우 NPC 기능을 먼저 보존한다.
5. E01 외부 지역은 플레이어블 4~7번과 충돌하지 않게 최소 NPC로 시작한다.
6. E02 이후는 시즌 슬라이스 기준으로 NPC 예산을 잡는다.
7. 유저에게는 실명 지명을 숨길 수 있지만, 제작팀은 관리자용 현실 위치를 알아야 한다.
```

---

## 2. 반드시 읽을 문서

### 2.1 세계/캠페인 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
docs/world/WORLD_LORE_LOCK_V0_1.md
docs/world/LEGACY_TERM_MIGRATION_V0_1.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
```

### 2.2 지도/현실 위치 기준

```text
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
docs/world/E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md
docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md
```

### 2.3 NPC 기준

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
story/02_hub/npcs.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md
story/03_regions/r01_document_index_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md
story/03_regions/r01_npc_name_registry_v1_0.md
story/03_regions/r01_npc_dialogue_bank_v0_1.md
story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md
```

### 2.4 플레이어블 충돌 방지 기준

```text
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_profile_v1_0.md
```

---

## 3. NPC 분류 기준

NPC를 만들 때 먼저 아래 중 하나로 분류한다.

| 분류 | 의미 | 산출물 깊이 |
|---|---|---|
| 상주 핵심 NPC | 보급소/거점 시설을 대표하고 장기 상태 반응을 가진다 | 프로필 v1.0, 대사 은행, 상태값 반응 |
| 지역 핵심 NPC | 지역 캠페인 질문을 사람으로 보여준다 | 드라마 초안, 프로필, 선택 후폭풍 |
| 보조 NPC | 플레이어블 해금/지역 상태를 보조한다 | 후보표, 짧은 프로필, 조건 대사 |
| 잔향 NPC | 음성, 사진, 로그, 문패, 우편함처럼 남은 흔적이다 | 오브젝트 문구, 대사 조건, 데이터 필드 |
| 장치형 NPC | 로봇/키오스크/청소기/문/표지판처럼 작동하는 잔류 장치다 | 모델명, 작동 규칙, 상태값 반응 |
| 배경 인물 | 군중/대기열/게시물/자동 문구로 처리한다 | 이름 없음, 패턴 문구 |

중요:

```text
모든 NPC가 직접 대면할 필요는 없다.
R01 기준처럼 목소리, 주소, 사진, 상담표도 정식 NPC 기능을 가질 수 있다.
```

---

## 4. NPC 최소 필드

NPC 후보를 만들 때 아래 필드를 반드시 채운다.

```text
npc_id:
code_name:
display_role_name:
npc_track:
npc_type:
parent_campaign_id:
admin_real_region:
admin_city_band:
admin_infra_anchor:
user_display_region_name:
first_location:
first_exposure:
direct_meet_level:
playable_overlap_status:
related_playable:
state_keys:
choice_flags:
dialogue_refs_min:
name_policy:
wrong_belief:
core_function:
reward_or_unlock:
forbidden:
next_doc:
```

권장 값:

```text
npc_track:
hub | region | slice | trace | playable_overlap

npc_type:
human_resident | human_internal | robot_device | system_residue | profile_residue | object_trace | crowd_background

direct_meet_level:
direct | voice | object | trace | background

playable_overlap_status:
none | candidate | locked_playable | must_not_overlap

name_policy:
role_first | code_only | fragment_first | real_name_late | no_human_name
```

---

## 5. 복붙용 프롬프트

```text
Atomic Ad Survivors의 NPC 제작팀 작업을 진행한다.

이번 작업 대상:
[지역/캠페인/보급소/슬라이스 이름]

작업 목표:
[예: E01 R02/R03/R04/R08 보조 NPC 최소안 작성]

중요:
NPC 이름을 많이 뽑는 작업이 아니다.
지역/캠페인에 필요한 NPC 기능을 먼저 정하고, 직접 대면/잔향/오브젝트/배경으로 제작 범위를 나눈다.

반드시 아래 문서를 우선순위대로 읽고 판단한다.

세계 기준:
1. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
2. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
3. docs/world/WORLD_LORE_LOCK_V0_1.md
4. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
5. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
6. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
7. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
8. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md

지도/현실 위치 기준:
9. docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
10. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
11. docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
12. docs/world/E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md
13. docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md

NPC 기준:
14. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
15. story/02_hub/npcs.md
16. story/02_hub/outpost_core_npc_profiles_v1_0.md
17. story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md
18. story/03_regions/r01_document_index_v0_1.md
19. story/03_regions/r01_campaign1_npc_roster_v0_1.md
20. story/03_regions/r01_npc_data_schema_application_v0_1.md
21. story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md

플레이어블 충돌 방지:
22. story/06_characters/playable_20_roster_blueprint_v0_1.md
23. story/06_characters/playable_20_name_registry_v0_1.md
24. story/06_characters/discharge_hold_patient_profile_v1_0.md
25. story/06_characters/return_recipient_profile_v1_0.md
26. story/06_characters/meter_06_profile_v1_0.md
27. story/06_characters/quiet_07_profile_v1_0.md
28. story/06_characters/rio_08_profile_v1_0.md

판정 원칙:
1. NPC는 퀘스트 배포기가 아니라 시설/상태값/흔적/선택 후폭풍의 얼굴이다.
2. 플레이어블 후보와 겹치면 NPC 기능을 먼저 보존한다.
3. 직접 등장할 NPC와 잔향/오브젝트/배경 처리를 분리한다.
4. 이름은 현실 위치/캠페인 등록 방식/노출 단계가 정해진 뒤 붙인다.
5. 로봇/장치형 NPC에는 억지 사람 이름을 붙이지 않는다.
6. E01 R02/R03/R04/R08 보조 NPC는 각 지역 2~4명 이하로 제한한다.
7. 96개 정식 캠페인에 NPC를 전부 12명씩 붙이지 않는다.

출력은 아래 형식으로 작성한다.

# [지역/캠페인명] NPC 제작안 v0.1

## 문서 상태

상태:
제작팀 전달용 v0.1

용도:
이번 지역/캠페인에서 필요한 NPC 규모, 기능, 직접 구현 우선순위, 플레이어블 충돌 방지 기준을 고정한다.

판정:
통과 / 조건부 통과 / 보류 중 하나

## 0. 제작 범위 판정

이번 작업에서 만들 NPC 수를 먼저 제한한다.

작성 항목:
- 핵심 NPC 수
- 보조 NPC 수
- 잔향/오브젝트 수
- 직접 대면 수
- 이번 버전에서 만들지 않는 것

## 1. 지역/캠페인 질문

이 지역의 NPC들이 보여줘야 하는 질문을 1~3개로 정리한다.

예:
의료/보험 지역:
퇴원은 해방인가, 심사 보류인가?

물류/반품 지역:
수취인이 없으면 사람은 어디에 보관되는가?

## 2. 플레이어블 충돌 방지

이번 지역과 연결된 플레이어블을 먼저 적는다.

작성 항목:
- 관련 플레이어블
- 플레이어블이 담당하는 기능
- NPC가 절대 가져가면 안 되는 기능
- NPC가 보조해야 하는 기능

## 3. NPC 후보표

아래 표로 빠르게 후보를 만든다.

| 번호 | npc_id | 코드명/역할명 | 분류 | 첫 위치 | 담당 기능 | 상태값 | 잘못 믿는 것 | 직접 구현 | 플레이어블 충돌 | 판정 |
|---:|---|---|---|---|---|---|---|---|---|---|

판정은 아래 중 하나로 쓴다.

```text
통과
조건부 통과
보류
탈락
잔향 처리
배경 처리
```

## 4. 통과 후보 상세

통과 또는 조건부 통과 후보만 짧게 상세화한다.

각 NPC마다 작성:

```text
npc_id:
code_name:
유저 첫 표기:
내부 본명:
npc_type:
admin_real_region:
admin_infra_anchor:
user_display_region_name:
first_location:
first_exposure:
core_function:
wrong_belief:
state_keys:
choice_flags:
dialogue_refs_min:
reward_or_unlock:
forbidden:
```

## 5. 직접 구현 우선순위

| 우선순위 | NPC/잔향 | 구현 방식 | 필요한 에셋 | 필요한 플래그 | 대사량 | 이번 버전 포함 여부 |
|---:|---|---|---|---|---|---|

중요:
직접 대면 NPC가 너무 많으면 줄인다.
먼저 오브젝트/음성/번호표/로그로 처리할 수 있는지 확인한다.

## 6. 대사 방향

각 통과 후보당 최소 5줄만 먼저 만든다.

조건:
- 첫 노출
- 상태값 낮음
- 상태값 안정
- 선택 성공
- 선택 실패 또는 후폭풍

대사 형식:

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|

## 7. 이름/노출 정책

| NPC | 첫 표기 | 본명 공개 | 본명 공개 조건 | 이름 금지/보류 이유 |
|---|---|---|---|---|

주의:
본명 공개는 해방 완료가 아니다.
잔향형/장치형 NPC는 본명을 끝까지 주지 않을 수 있다.

## 8. 금지 방향

이번 지역 NPC에서 절대 하면 안 되는 방향을 적는다.

## 9. 다음 작업

다음에 만들 문서를 명시한다.

예:
story/03_regions/[region]_support_npc_minimum_plan_v0_1.md
story/03_regions/[npc_id]_npc_profile_v1_0.md
story/03_regions/[region]_npc_dialogue_bank_v0_1.md
```

---

## 6. E01 보조 NPC 최소안 즉시 사용 버전

아래는 현재 다음 NPC 작업에 바로 쓰는 버전이다.

```text
Atomic Ad Survivors의 NPC 제작팀 작업을 진행한다.

이번 작업 대상:
E01 R02/R03/R04/R08 보조 NPC 최소안

목표:
R02 의료/보험, R03 물류/반품, R04 정품/충전/산업, R08 침묵권/비상보급에 필요한 보조 NPC를 빠르게 후보표로 만든다.

중요:
각 지역 2~4명 이하로 제한한다.
플레이어블 4~7번과 기능이 겹치면 탈락 또는 잔향 처리한다.
R01처럼 12명씩 만들지 않는다.

관련 플레이어블:
R02:
강하람 / HOLD-04 / 퇴원 보류자

R03:
한이루 / RETURN-05 / 반송 수취인

R04:
차유건 / METER-06 / 폐충전소 계량자
PATCH / 보급소 수리 로봇

R08:
백여울 / QUIET-07 / 침묵권 피난자
DRAIN-MARK / R01 배수로 표식 NPC와 혼동 금지

필수 판단:
1. 각 지역에서 플레이어블이 이미 담당하는 기능은 무엇인가?
2. NPC가 보조해야 할 시설/상태값/선택 후폭풍은 무엇인가?
3. 직접 대면 NPC와 잔향/오브젝트 처리 NPC는 누구인가?
4. 각 지역에서 이름 있는 NPC는 몇 명까지만 필요한가?
5. 어느 NPC가 프로필 v1.0까지 갈 가치가 있는가?
6. 어느 후보는 이름 없이 로그/번호표/자동 문구로 충분한가?

출력:
# E01 R02/R03/R04/R08 보조 NPC 최소안 v0.1

반드시 포함:
1. 지역별 NPC 수 제한
2. 지역별 캠페인 질문
3. 플레이어블 충돌 방지표
4. NPC 후보표
5. 통과 후보 짧은 상세
6. 직접 구현 우선순위
7. 최소 대사 5줄씩
8. 이름/노출 정책
9. 금지 방향
10. 다음 작업 포인터

기준 문서:
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md의 5번 복붙용 프롬프트를 따른다.
```

---

## 7. 빠른 판정 기준

NPC 후보를 많이 받았을 때는 아래 기준으로 바로 자른다.

### 7.1 통과

```text
담당 시설이 있다.
상태값 반응이 있다.
플레이어블과 겹치지 않는다.
잘못 믿는 것이 캠페인 구조와 연결된다.
선택 후폭풍이 있다.
```

### 7.2 조건부 통과

```text
기능은 좋지만 플레이어블과 일부 겹친다.
이름/국적/현실 위치가 아직 흔들린다.
직접 대면이 필요한지 잔향 처리로 충분한지 미정이다.
```

### 7.3 보류

```text
좋은 이미지가 있지만 기능이 약하다.
다른 지역에 더 맞는다.
시즌 후반에 열어야 한다.
```

### 7.4 탈락

```text
직업만 있고 캠페인 질문이 없다.
기존 NPC의 하위 기능이다.
플레이어블 기능을 빼앗는다.
상점/튜토리얼/길 안내 역할밖에 없다.
현실 위치와 캠페인 축이 맞지 않는다.
```

### 7.5 잔향 처리

```text
사람으로 직접 만날 필요는 없지만,
음성/기록/사진/번호표/문패/영수증으로 남으면 좋은 경우.
```

### 7.6 배경 처리

```text
군중, 줄, 방송 문구, 게시판, 안내문으로 충분한 경우.
```

---

## 8. 다음 작업

```text
1. E01 R02/R03/R04/R08 보조 NPC 최소안 작성 완료.
2. 결과 문서는 story/03_regions/e01_support_npc_minimum_plan_v0_1.md를 기준으로 사용한다.
3. NPC 대량 후보 풀 제작도 완료되었다.
4. 대량 제작 전용 프롬프트는 docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md를 사용한다.
5. E01 대량 후보 풀은 story/03_regions/e01_npc_mass_candidate_pool_v0_1.md를 기준으로 사용한다.
6. E01 L5/L4 승격 후보 검토도 완료되었다.
7. 승격 검토 결과는 story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md를 기준으로 사용한다.
8. E01 프로필 v1.0 1차 필수 3명도 작성 완료되었다.
9. 완료 산출물은 r06_member_rank_broker_profile_v1_0.md, r02_discharge_review_face_profile_v1_0.md, r03_final_return_review_officer_profile_v1_0.md다.
10. E01 L5/L4 묶음 산출물 4개도 작성 완료되었다.
11. 완료 산출물은 e01_l5_l4_short_profiles_v0_1.md, e01_l5_l4_dialogue_bank_v0_1.md, e01_npc_trace_background_bank_v0_1.md, e01_npc_name_location_registry_v0_1.md다.
12. 전역 NPC 스토리 네트워크 1차 실제 산출물도 작성 완료되었다.
13. 완료 산출물은 global_npc_story_seed_registry_v0_1.md, global_campaign_npc_coverage_matrix_v0_1.md, global_mystery_reversal_ending_seed_map_v0_1.md, playable_global_npc_link_matrix_v0_1.md, global_npc_name_location_exposure_registry_v0_1.md다.
14. R08/R07 v1.0 보류 해제 게이트도 작성 완료되었다.
15. E02 승격 후보 v0.1 검토도 작성 완료되었다.
16. E02 핵심 후보 v0.1 프로필 3종도 작성 완료되었다.
17. E02 첫 외부 슬라이스 대사/잔향 은행도 작성 완료되었다.
18. E02 Vertical Slice NPC 구현 컷도 작성 완료되었다.
19. E02 상태 반응/오브젝트 문구 확장도 작성 완료되었다.
20. 완료 산출물은 e02_first_slice_state_reaction_matrix_v0_1.md, e02_first_slice_object_text_bank_v0_1.md다.
21. E02 상태/오브젝트 데이터 적용표도 작성 완료되었다.
22. 완료 산출물은 e02_first_slice_state_object_data_application_v0_1.md다.
23. E02 첫 외부 슬라이스 QA 체크리스트도 작성 완료되었다.
24. 완료 산출물은 e02_first_slice_npc_qa_checklist_v0_1.md다.
25. E02 구현 데이터 전달/엔진 스키마화도 작성 완료되었다.
26. 완료 산출물은 e02_first_slice_engine_schema_handoff_v0_1.md다.
27. E02 엔진 데이터 변환 전 검증도 작성 완료되었다.
28. 완료 산출물은 e02_first_slice_engine_data_pre_conversion_validation_v0_1.md다.
29. E02 실제 엔진 데이터 작성 프롬프트와 엔진 데이터 패키지도 작성 완료되었다.
30. 완료 산출물은 E02_FIRST_SLICE_ENGINE_DATA_WRITING_TEAM_PROMPT_V0_1.md와 e02_first_slice_engine_data_package_v0_1.md다.
31. E02 실제 JSON 파일 생성 여부 결정도 작성 완료되었다.
32. 판정은 조건부 생성 가능이며 실제 data/e02/*.json 파일은 만들지 않았다.
33. 다음 산출물은 E02 실제 JSON 파일 생성 조건 해소 또는 CLAUSE-11 상세 결재를 권장한다.
```
