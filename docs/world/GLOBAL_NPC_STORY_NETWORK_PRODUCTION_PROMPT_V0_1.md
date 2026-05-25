# 전역 NPC 스토리 네트워크 제작팀 프롬프트 v0.1

이 문서는 NPC 제작 AI팀에게 `전 지구 NPC/잔향/기록/배경 인물 네트워크`를 만들게 하기 위한 복붙용 프롬프트다.

이 프롬프트는 E01 NPC 보강용이 아니다.
목표는 스토리를 쓰기 전에 전 세계적으로 유기적으로 연결될 NPC 씨앗, 미스터리 담당자, 반전 담당자, 작은 결말 담당자, 플레이어블 연결자를 먼저 깔아두는 것이다.

핵심:

```text
스토리는 캠페인 하나 안에서만 이어지지 않는다.
전 지구 96개 정식 캠페인 어디서든 미스터리, 반전, 작은 결말, 해금 단서가 튀어나올 수 있어야 한다.
그러려면 NPC/잔향/기록/배경 인물의 전역 배치가 먼저 있어야 한다.
```

---

## 0. 현재 상태

```text
E01 NPC 대량 후보 풀:
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md

E01 L5/L4 승격 후보 검토:
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md

E01 L5/L4 제작팀 프롬프트:
docs/world/E01_NPC_L5_L4_PRODUCTION_TEAM_PROMPT_V0_1.md

E01 L5/L4 묶음 산출물:
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md

하지만:
E01만으로는 스토리 전체를 설계할 수 없다.
전 지구 광역권과 96개 정식 캠페인에 스토리 씨앗이 있어야 한다.
전역 NPC 스토리 네트워크 1차 실제 산출물은 작성 완료되었다.
현재 1차 기준은 420개 씨앗이고, 전역 수량 만족 기준은 768개 제작 슬롯이다.
검수팀 전달 전 기준은 2,048개 제작 슬롯이다.
장기 풀스케일 목표는 10,240개 제작 슬롯이다.
이 프롬프트는 이후 보강과 재사용 기준으로 보존한다.
```

완료 산출물:

```text
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
story/03_regions/global_npc_l3_below_echo_object_bank_v0_1.md
story/03_regions/global_npc_l3_below_bank_review_v0_1.md
story/03_regions/global_npc_l3_below_text_sampling_standard_v0_1.md
story/03_regions/global_npc_l3_below_first_text_samples_v0_1.md
```

현재 완료 및 남은 보강:

```text
1. E02_C03/E02_C05/E02_C07 승격 후보 v0.1 프로필.
2. E03~E12 최소 3씨앗 캠페인의 G4/G5 승격 후보 검토.
3. CLAUSE-11/LEDGER-12 등 후속 플레이어블 상세 결재와 전역 씨앗 연결 강화.
4. 실제 시즌 슬라이스가 열릴 때 지역별 대사 은행과 잔향 문구 확장.
5. 전역 420개 씨앗 중 이름 공개가 필요한 후보의 언어권/현실 위치 재검산 완료.
6. 전역 수량 만족 기준 768개 제작 슬롯과 증분 +348 슬롯 등록 완료.
7. 검수 전 기준 1,024개 제작 슬롯과 검수팀 전달 프롬프트 작성 완료.
8. 장기 목표 10,240개 제작 슬롯과 2,048개 1차 검수 배치 작성 완료.
9. 전역 NPC 검수 보고서 작성 완료. 2,048 슬롯 조건부 통과.
10. 전역 NPC 통과 슬롯 레지스트리 작성 완료. L5/L4 192개, L3 이하 1,856개로 분리.
11. 전역 NPC L3 이하 잔향/오브젝트 은행 작성 완료. L3 이하 1,856개 은행화.
12. 전역 NPC L3 이하 은행 검수 작성 완료. 직접 대면화 위험과 이름 과잉 없음.
13. 전역 NPC L3 이하 세부 문구 샘플링 기준 작성 완료. 1차 표본 240개 제한.
14. 전역 NPC L3 이하 1차 샘플 문구 작성 완료. L3 52 / L2 82 / L1 55 / L0 51개.
```

---

## 1. 이번 작업의 목표

NPC 제작 AI팀은 아래를 만든다.

주의:
이 장의 `300~500개`와 `340~480개`는 1차 전역 씨앗 네트워크 기준이다.
후속 전역 수량 만족 기준은 `768개 제작 슬롯`이며, 검수팀 전달 전 기준은 `2,048개 제작 슬롯`이다.
장기 풀스케일 목표는 `10,240개 제작 슬롯`이다.

```text
전역 NPC 스토리 시드 레지스트리 300~500개
전역 미스터리/반전/작은 결말 배치표
플레이어블 20인 연결 매트릭스
96개 캠페인별 NPC 밀도 검산표
전역 이름/현실 위치/노출 단계 레지스트리
```

중요:

```text
300~500개 전부를 프로필 v1.0으로 만들지 않는다.
하지만 전부 최소한 스토리 기능, 부모 캠페인, 노출 단계, 연결 대상, 금지 방향은 가져야 한다.
```

이 작업의 완료 기준은 `장문 프로필 개수`가 아니다.

완료 기준:

```text
전 세계 어디에서 이야기가 튀어나와도 받을 NPC/잔향/기록 씨앗이 이미 존재한다.
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
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md
```

### 2.2 NPC 기준

```text
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
```

### 2.3 플레이어블 기준

```text
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/character_npc_creation_context_v0_1.md
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

## 3. 전역 제작 원칙

### 3.1 스토리 전 선결정 원칙

스토리를 쓰기 전 아래가 먼저 있어야 한다.

```text
1. 플레이어블 20인의 최소 정체성, 캠페인 원점, 해금 권역, 감정 질문.
2. 96개 정식 캠페인의 NPC/잔향/기록 씨앗.
3. 전역 미스터리와 반전이 어느 캠페인에서 드러나는지.
4. 작은 결말이 어느 NPC 또는 잔향에서 닫히는지.
5. 어떤 NPC가 나중에 플레이어블, 보스, 보급소, 세계 진실과 연결될 수 있는지.
```

이 원칙을 어기면 안 된다.

```text
캐릭터 없이 스토리 먼저 쓰지 않는다.
NPC 없이 캠페인 미스터리 먼저 쓰지 않는다.
전역 연결 없이 E01 내부 이야기만 완결하지 않는다.
```

### 3.2 깊이 계층

전역 NPC는 아래 계층으로 만든다.

| 계층 | 이름 | 역할 | 산출 깊이 |
|---|---|---|---|
| G5 | 전역 핵심 NPC | 광역권 또는 장기 미스터리를 대표 | 프로필 v0.5~v1.0 후보 |
| G4 | 시즌 핵심 NPC | 시즌 슬라이스의 선택/반전/작은 결말 담당 | 프로필 v0.1~v1.0 후보 |
| G3 | 캠페인 기능 NPC | 96개 캠페인의 절차/상태값 얼굴 | 후보표 + 짧은 대사 |
| G2 | 잔향/기록 NPC | 로그, 방송, 사진, 영수증, 명단, 자동 음성 | 잔향 문구 + 트리거 |
| G1 | 배경 인물 | 대기열, 군중, 게시판, 명단 속 이름 | 한 줄 |
| G0 | 패턴 문구 | 자동 안내, 경고문, 앱 알림, 영수증 문구 | 이름 없음 |

중요:

```text
G5/G4가 적어도 G3/G2/G1/G0가 충분해야 세계가 넓어진다.
전역 스토리는 직접 대면 NPC보다 잔향/기록/배경을 통해 더 자주 연결된다.
```

### 3.3 스토리 기능 태그

모든 전역 NPC 씨앗은 아래 중 최소 1개 이상의 스토리 기능을 가진다.

```text
local_question
cross_region_clue
mystery_seed
false_answer
reversal_trigger
small_ending
playable_unlock_support
playable_contrast
boss_foreshadow
outpost_pressure
world_truth_fragment
faction_pressure
resource_ethics
route_block
rescue_failure
memory_recovery
```

금지:

```text
기능 없는 이름만 만들기
감성 사연만 있고 캠페인 절차가 없는 NPC
현실 국적/도시 이미지만 있는 NPC
나중에 어디에도 연결되지 않는 장식 NPC
```

---

## 4. 수량 목표

### 4.1 최소 전역 게이트

스토리 전체 설계를 시작하기 위한 최소 전역 게이트:

| 범위 | 최소 수 | 목적 |
|---|---:|---|
| E01 | 기존 120개 유지 + L5/L4 재분류 반영 | 첫 시즌 밀도 |
| E02 | 40~60개 | 첫 외부 슬라이스, GATE-09 연결 |
| E03~E12 | 각 20~30개 | 전역 미스터리/반전/작은 결말 씨앗 |
| 전역 합계 | 340~480개 | 스토리 네트워크 기본 밀도 |

### 4.2 96개 캠페인별 최소 보장

각 정식 캠페인은 최소 아래를 가진다.

```text
G3 이상 캠페인 기능 NPC 또는 후보 1개
G2 잔향/기록 1개
G1/G0 배경/패턴 문구 1개
```

즉:

```text
96개 캠페인 x 최소 3개 씨앗 = 288개
E01과 주요 시즌 후보는 더 두껍게 만든다.
최종 340~480개가 적정하다.
```

### 4.3 깊이 분포 목표

전역 340~480개 기준 권장 분포:

| 계층 | 권장 수 | 메모 |
|---|---:|---|
| G5 | 20~35 | 전역 핵심 또는 장기 미스터리 후보 |
| G4 | 50~80 | 시즌 핵심/반전/작은 결말 후보 |
| G3 | 90~130 | 캠페인 기능 NPC |
| G2 | 100~150 | 잔향/기록 |
| G1/G0 | 80~120 | 배경/패턴 문구 |

---

## 5. 전역 산출물

NPC 제작 AI팀은 아래 문서를 만든다.

### 5.1 전역 NPC 스토리 시드 레지스트리

```text
story/03_regions/global_npc_story_seed_registry_v0_1.md
```

내용:

```text
E01~E12 전역 NPC/잔향/기록/배경 씨앗 340~480개
```

### 5.2 96개 캠페인 NPC 커버리지 매트릭스

```text
story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
```

내용:

```text
96개 정식 캠페인마다 최소 NPC/잔향/배경 씨앗이 있는지 검산
```

### 5.3 전역 미스터리/반전/작은 결말 배치표

```text
story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
```

내용:

```text
어느 NPC/잔향/기록이 어떤 미스터리, 반전, 작은 결말, 세계 진실 조각을 담당하는지 배치
```

### 5.4 플레이어블 20인 연결 매트릭스

```text
story/06_characters/playable_global_npc_link_matrix_v0_1.md
```

내용:

```text
20명 플레이어블 각각의 원점/심화/교차 캠페인에 연결되는 NPC 씨앗
```

### 5.5 전역 이름/위치/노출 레지스트리

```text
story/03_regions/global_npc_name_location_exposure_registry_v0_1.md
```

내용:

```text
이름, 국적/언어권, 관리자용 현실 권역, 유저 노출 단계, 본명 공개 정책, 실명 지명 노출 정책
```

---

## 6. 전역 시드 필수 필드

`global_npc_story_seed_registry_v0_1.md`의 모든 행은 아래 필드를 가진다.

```text
global_seed_id:
display_label:
depth_level:
npc_form:
parent_region_code:
parent_campaign_id:
admin_real_region:
admin_infra_anchor:
user_display_region_name:
first_exposure:
story_function_tags:
mystery_role:
reversal_role:
small_ending_role:
playable_links:
cross_region_links:
state_keys:
choice_flags:
name_policy:
exposure_phase:
spoiler_grade:
one_line_dialogue_or_trace:
promotion_path:
forbidden:
```

값 기준:

```text
depth_level:
G5_global_core | G4_season_core | G3_campaign_function | G2_trace_record | G1_background | G0_pattern

npc_form:
human | robot | device | system_voice | object_trace | profile_residue | crowd | document | broadcast | map_mark | transaction_log

first_exposure:
direct | voice | object | list_name | signage | log | background | broadcast | map_noise | recovered_record

mystery_role:
none | seed | misdirection | partial_answer | key_fragment | delayed_truth | final_truth_guard

reversal_role:
none | personal_reversal | route_reversal | resource_reversal | faction_reversal | world_rule_reversal

small_ending_role:
none | local_closure | failed_rescue | name_recovered | route_closed | route_reopened | settlement_shift | memory_preserved

name_policy:
real_name_now | role_first | name_late | fragment_only | no_human_name | list_only | corrupted_name

exposure_phase:
P0_hidden | P1_foreshadow | P2_remote_signal | S1_available | S2_later | finale_locked

spoiler_grade:
low | medium | high | final

promotion_path:
profile_v1 | profile_v0_1 | dialogue_bank | trace_bank | background_only | later_season_lock
```

---

## 7. 복붙용 마스터 프롬프트

```text
Atomic Ad Survivors의 전역 NPC 스토리 네트워크를 제작한다.

이번 작업은 E01 NPC 몇 명을 보강하는 작업이 아니다.
스토리를 쓰기 전에 전 지구 96개 정식 캠페인에 NPC/잔향/기록/배경 씨앗을 깔아두는 작업이다.

핵심 목표:
전 세계 어디서든 미스터리, 반전, 작은 결말, 플레이어블 해금 단서, 세계 진실 조각이 튀어나올 수 있도록 NPC 네트워크를 먼저 만든다.

중요:
1. NPC 숫자가 작으면 안 된다.
2. E01만으로 스토리를 이어가지 않는다.
3. 96개 정식 캠페인 전체에 최소 스토리 씨앗을 둔다.
4. 모든 씨앗은 부모 캠페인 ID, 관리자 현실 위치, 스토리 기능, 노출 단계, 연결 대상을 가진다.
5. 전부 프로필 v1.0으로 쓰지는 않는다.
6. 하지만 전부 최소한의 캐릭터/잔향/기록 기능은 가져야 한다.
7. 플레이어블 20인과 연결되지 않는 고립 NPC를 대량 생산하지 않는다.
8. 미스터리/반전/작은 결말 위치를 먼저 배치한다.

반드시 읽을 문서:
1. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
2. docs/world/WORLD_CAUSE_REVIEW_RESULT_V0_1.md
3. docs/world/WORLD_LORE_LOCK_V0_1.md
4. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
5. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
6. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
7. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
8. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
9. docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
10. docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md
11. docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
12. docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
13. story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
14. story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
15. story/06_characters/playable_20_roster_blueprint_v0_1.md
16. story/06_characters/playable_20_name_registry_v0_1.md
17. story/06_characters/character_npc_creation_context_v0_1.md

작업 범위:
E01~E12 전체.
12개 지구 광역권.
96개 정식 캠페인.
전역 NPC/잔향/기록/배경 씨앗 340~480개.

산출물:
1. story/03_regions/global_npc_story_seed_registry_v0_1.md
2. story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
3. story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
4. story/06_characters/playable_global_npc_link_matrix_v0_1.md
5. story/03_regions/global_npc_name_location_exposure_registry_v0_1.md

수량 기준:
- E01은 기존 120개 후보를 유지하고 전역 레지스트리에 연결한다.
- E02는 40~60개 후보를 만든다.
- E03~E12는 각 20~30개 후보를 만든다.
- 최종 합계는 340~480개 사이로 한다.
- 96개 정식 캠페인마다 최소 3개 씨앗을 둔다.

각 정식 캠페인 최소 씨앗:
1. G3 이상 캠페인 기능 NPC 또는 후보 1개
2. G2 잔향/기록 1개
3. G1/G0 배경/패턴 문구 1개

전역 시드 필수 필드:
global_seed_id:
display_label:
depth_level:
npc_form:
parent_region_code:
parent_campaign_id:
admin_real_region:
admin_infra_anchor:
user_display_region_name:
first_exposure:
story_function_tags:
mystery_role:
reversal_role:
small_ending_role:
playable_links:
cross_region_links:
state_keys:
choice_flags:
name_policy:
exposure_phase:
spoiler_grade:
one_line_dialogue_or_trace:
promotion_path:
forbidden:

스토리 기능 태그:
local_question
cross_region_clue
mystery_seed
false_answer
reversal_trigger
small_ending
playable_unlock_support
playable_contrast
boss_foreshadow
outpost_pressure
world_truth_fragment
faction_pressure
resource_ethics
route_block
rescue_failure
memory_recovery

반드시 배치할 것:
1. 각 광역권마다 장기 미스터리 씨앗 2~4개.
2. 각 광역권마다 작은 결말 후보 2~4개.
3. 각 광역권마다 반전 트리거 1~3개.
4. 각 광역권마다 플레이어블 20인 중 최소 2명과 연결되는 NPC/잔향.
5. 각 캠페인 계열 C01~C08마다 전역 반복 테마와 지역별 변형.
6. E01의 미스터리가 E02~E12의 기록과 맞물리는 단서.
7. E02~E12의 단서가 E01의 보급소/윤서/플레이어블 해금과 되돌아오는 연결.

금지:
1. E01만 두껍게 만들고 외부 광역권을 비워두기.
2. 96개 캠페인 중 빈 캠페인 남기기.
3. 이름만 있는 NPC 대량 생성.
4. 국적/도시 이미지만 있는 NPC 생성.
5. 현실 지명/기관/기업을 직접 패러디하기.
6. 미스터리와 반전 위치를 나중으로 미루기.
7. 플레이어블 20인과 연결되지 않는 고립 NPC만 늘리기.
8. 모든 전역 핵심을 한 번에 유저에게 노출하기.
9. 전부 직접 대면 NPC로 만들기.
10. 전부 장문 프로필 v1.0으로 만들기.

출력 형식:

# 전역 NPC 스토리 시드 레지스트리 v0.1

## 문서 상태

상태:
작성 완료 v0.1

작업 범위:
E01~E12 / 96개 정식 캠페인 / 전역 NPC 씨앗 340~480개

판정:
통과 / 조건부 통과 / 보류 중 하나

## 0. 수량 요약

권역별 수량표.
계층별 수량표.
캠페인 커버리지 요약.

## 1. 전역 제작 원칙

## 2. E01 연결 요약

기존 E01 120개 후보와 L5/L4 재분류를 전역 레지스트리에 어떻게 연결했는지 요약한다.

## 3. E02 첫 외부 슬라이스

40~60개 후보를 표로 작성한다.

## 4. E03~E12 전역 후보

각 광역권 20~30개 후보를 표로 작성한다.

## 5. 96개 캠페인 커버리지 검산

모든 캠페인 ID가 최소 씨앗 3개를 가지는지 검산한다.

## 6. 미스터리/반전/작은 결말 배치

어느 후보가 어떤 역할을 하는지 별도 표로 정리한다.

## 7. 플레이어블 20인 연결

각 플레이어블 슬롯과 연결되는 NPC/잔향/기록 씨앗을 정리한다.

## 8. 이름/현실 위치/노출 정책

본명 공개, 역할명 우선, 잔향 처리, 실명 지명 노출 단계를 정리한다.

## 9. 승격 후보

G5/G4 중 나중에 프로필 v1.0 또는 시즌 핵심으로 올릴 후보를 정리한다.

## 10. 보류/위험

과도한 스포일러, 현실 패러디 위험, 플레이어블 충돌, 중복 이름, 특정 권역 과밀을 정리한다.

## 11. 다음 작업

다음 제작팀이 작성해야 할 문서명을 제안한다.

완료 기준:
1. 전역 후보가 340~480개 사이에 있다.
2. 96개 정식 캠페인에 빈 칸이 없다.
3. 각 캠페인은 최소 G3/G2/G1 또는 G0 씨앗을 가진다.
4. 미스터리/반전/작은 결말/플레이어블 연결이 별도 표로 정리되어 있다.
5. E01만 두껍고 외부 광역권이 빈 구조가 아니다.
6. 유저 노출 단계와 스포일러 등급이 명시되어 있다.
7. 현실 위치는 관리자 필드로만 쓰고, 유저 노출명은 별도로 둔다.
8. 마지막에 부족한 캠페인 ID와 다음 보강 우선순위를 적는다.
```

---

## 8. 권역별 제작 기준

### E01

```text
기존 120개 후보를 버리지 않는다.
E01은 전역 레지스트리의 첫 기준점이다.
R05/R07/R08의 미스터리와 외부 광역권 단서가 E02~E12로 이어지게 한다.
```

### E02

```text
첫 외부 슬라이스.
GATE-09와 연결된다.
E02_C07만 두껍게 만들지 말고 E02_C03/E02_C05/E02_C04도 씨앗을 둔다.
40~60개 후보를 만든다.
```

### E03~E12

```text
각 20~30개 후보를 만든다.
각 광역권마다 미스터리 씨앗, 반전 트리거, 작은 결말, 플레이어블 연결을 모두 둔다.
나중에 시즌이 열릴 때 확장 가능한 구조로 만든다.
```

---

## 9. 이 프롬프트의 결론

```text
스토리를 먼저 쓰지 않는다.
전역 NPC/잔향/기록/배경 씨앗을 먼저 깐다.
플레이어블 20인과 전역 NPC 네트워크가 맞물린 뒤 스토리를 이어간다.
```

이 프롬프트는 NPC 제작 AI팀이 전역 숫자와 연결 구조를 만들기 위한 지시서다.
1차 실제 산출물 5개, 전역 NPC 이름/원점 검수, 수량 충족 매트릭스, 확장 슬롯 레지스트리, 검수 전 추가 확장 매트릭스, 풀스케일 목표 사다리, 2,048 1차 검수 배치, 검수팀 프롬프트, 검수 보고서, 통과 슬롯 레지스트리, L3 이하 잔향/오브젝트 은행, L3 이하 은행 검수, L3 이하 세부 문구 샘플링 기준, L3 이하 1차 샘플 문구, L3 이하 1차 샘플 문구 QA, L3 이하 1차 샘플 문구 적용 기준, L3 이하 1차 샘플 문구 적용 티켓, L3 이하 1차 적용 티켓 QA, L3 이하 1차 적용 티켓 엔진/레벨 핸드오프 기준은 작성 완료되었다.
이후에는 240개 1차 표본 문구 적용 티켓의 엔진/레벨 핸드오프 QA를 진행하고 1,856개 전체 문구 작성으로 번지지 않게 한다.
