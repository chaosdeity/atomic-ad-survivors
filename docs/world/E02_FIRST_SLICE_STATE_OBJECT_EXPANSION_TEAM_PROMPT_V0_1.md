# E02 First Slice State/Object Expansion Team Prompt v0.1

## 목적

이 프롬프트는 NPC 제작팀에게 그대로 전달하는 작업 지시서다.

이번 작업은 새 NPC 제작이 아니다. E02 첫 외부 슬라이스에서 이미 선별된 9개 NPC/잔향 후보를 대상으로, 상태 반응 매트릭스와 오브젝트 문구 은행을 구현 가능한 수준까지 확장한다.

## 현재 잠금 상태

- 전역 NPC 스토리 네트워크 1차 실제 산출 완료: 420개 씨앗
- E02 첫 외부 슬라이스 구현 컷 완료
- E02 첫 외부 슬라이스 범위:
  - v0.1 프로필 3명
  - 조건 대사 은행 3명
  - 잔향/오브젝트 은행 3개
- 이번 작업의 출력물은 아래 2개 문서만 허용한다.
  - `story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md`
  - `story/03_regions/e02_first_slice_object_text_bank_v0_1.md`

## 반드시 먼저 읽을 문서

- `story/03_regions/global_npc_story_seed_registry_v0_1.md`
- `story/03_regions/e02_npc_promotion_candidates_v0_1.md`
- `story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md`
- `story/03_regions/e02_locker_recipient_profile_v0_1.md`
- `story/03_regions/e02_disaster_phrase_approver_profile_v0_1.md`
- `story/03_regions/e02_last_train_transfer_hold_profile_v0_1.md`
- `story/03_regions/e02_first_slice_dialogue_bank_v0_1.md`
- `story/03_regions/e02_trace_object_bank_v0_1.md`
- `story/06_characters/gate_09_profile_v1_0.md`
- `story/06_characters/broad_10_profile_v1_0.md`

## 작업 대상 9개

### v0.1 프로필 3

1. `g_E02_C03_g5_001` / 마지막 보관함 수취인
2. `g_E02_C05_g5_001` / 방재 문구 승인자
3. `g_E02_C07_g5_001` / 막차 환승 보류관

### 조건 대사 은행 3

1. `g_E02_C03_g4_001` / 편의점 회수 카운터 잔류자
2. `g_E02_C05_g4_001` / 반복 안내 편집자
3. `g_E02_C07_g4_001` / 정기권 판독자

### 잔향/오브젝트 은행 3

1. `g_E02_C04_g4_001` / 미세부품 검수자
2. `g_E02_C08_g4_001` / 지하 대피실 조용한 관리자
3. `g_E02_C01_g4_001` / 가족 정기권 보류자

## 핵심 기준

E02는 빠른 이동, 방송 해답, 상점 기능, 수리/강화 UI, 안전 대피소를 만들기 위한 지역이 아니다. E02의 첫 슬라이스는 보관 만료, 방재 문구 승인, 막차 환승 보류, 정기권 판독, 회수/리콜/대피 안내의 잔여 상태가 서로 물려서 전역 미스터리를 조금씩 바꾸는 구간이다.

상태 반응과 오브젝트 문구는 다음 기능을 해야 한다.

- 플레이어블 캐릭터를 대체하지 않는다.
- 새 인물을 늘리지 않는다.
- 메인 스토리 장면을 쓰지 않는다.
- 구현자가 조건문과 표시 문구로 옮길 수 있게 만든다.
- 각 캠페인 단위의 작은 반전, 작은 결말, 전역 단서가 어디서 켜지는지 명확히 남긴다.

## 출력물 1: 상태 반응 매트릭스

문서 경로:

`story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md`

### 수량 기준

- 전체 27~42행
- v0.1 프로필 3명: 각 4~6개 반응
- 조건 대사 은행 3명: 각 3~5개 반응
- 잔향/오브젝트 은행 3개: 각 2~4개 반응
- 직접 대면 반응은 전체 2명 범위를 넘기지 않는다.

### 반드시 다룰 상태 키

- `delivery_state`
- `passage_tag`
- `signal_tag`
- `signal_stability`
- `campaign_density`
- `human_stability`
- `trace_preservation`
- `robot_autonomy`
- `charge_tag`
- `extraction_stability`
- `residence_tag`
- `supply_pressure`

### 반드시 검토할 E02 플래그

- `e02_locker_expiry_seen`
- `e02_last_train_missed`
- `e02_locker_recipient_spoken`
- `e02_locker_extension_refused`
- `e02_disaster_phrase_delayed`
- `e02_caption_cut_recovered`
- `e02_guidance_loop_muted`
- `e02_phrase_approved_too_late`
- `e02_gate_unpassed_log_seen`
- `e02_transfer_hold_spoken`
- `e02_platform_residue_preserved`

### 권장 표 구조

| reaction_id | target_seed | campaign | trigger_state | trigger_flag | threshold_or_condition | reaction_form | line_or_change | consequence | protected_playable | forbidden_overlap |
|---|---|---|---|---|---|---|---|---|---|---|

### 작성 방식

- `reaction_id`는 `e02_sr_001` 형식으로 작성한다.
- `reaction_form`은 `직접 대면`, `장치 음성`, `전광판`, `로그`, `영수증`, `문서`, `자동 자막`, `잔향 오브젝트` 중 하나로 제한한다.
- `line_or_change`는 실제 게임에 넣을 수 있는 짧은 문장 또는 상태 변화 설명으로 쓴다.
- `consequence`는 즉시 보상 대신 압력, 지연, 보존, 오염, 숨김, 재판독 같은 후속 변화를 적는다.
- `protected_playable`에는 침범 방지 대상이 있으면 `GATE-09`, `BROAD-10`, `RETURN-05`, `QUIET-07`, `OPEN-HOST`, `PATCH`, `METER`, `RIO` 등으로 적는다.
- `forbidden_overlap`에는 이 반응이 무엇이 되면 안 되는지 적는다.

## 출력물 2: 오브젝트 문구 은행

문서 경로:

`story/03_regions/e02_first_slice_object_text_bank_v0_1.md`

### 수량 기준

- 오브젝트 그룹 10~14개
- 총 문구/변형 30~45개
- 각 오브젝트는 기본 문구와 조건 변화 문구를 함께 가진다.

### 반드시 포함할 오브젝트군

- 역전 보관함 만료 UI
- 보관함 만료 로그
- 막차 뒤 회수실 조명
- 반복 전광판
- 잘린 방재 자막
- 방재 스튜디오 송출 로그
- 개찰 미통과 로그
- 플랫폼 잔류 명단
- 정기권 판독기
- 편의점 카운터 영수증 또는 닫힌 셔터
- 리콜 검사표 또는 미세부품 검사표
- 무음 대피소 안내 스피커
- 가족 정기권 거래 로그 또는 세대 갱신 알림

### 권장 표 구조

| object_text_id | campaign | object | form | first_seen | trigger_condition | default_text | changed_text | implied_mystery | linked_seed | protected_playable | forbidden_overlap |
|---|---|---|---|---|---|---|---|---|---|---|---|

### 작성 방식

- `object_text_id`는 `e02_obj_001` 형식으로 작성한다.
- 문구는 짧고 차갑게 쓴다. 설명문이 아니라 실제 안내문, 로그, 영수증, 장치 메시지처럼 작성한다.
- `implied_mystery`는 이 문구가 암시하는 미스터리를 1문장으로 쓴다.
- `changed_text`는 조건이 켜졌을 때 바뀌는 문구다. 단순한 강화판이 아니라 플레이어의 이전 선택이나 상태 압력을 반영해야 한다.
- 플레이어에게 정답을 직접 말하지 않는다.

## 절대 금지

- 새 NPC 추가
- E02 전체 48개 씨앗 상세화
- v1.0 프로필 작성
- 메인 스토리 장면 작성
- 퀘스트 본문 작성
- 직접 대면 NPC를 2명 초과로 늘리기
- `GATE-09`의 통과/환승/미탑승/잔류 판정을 대체하기
- `BROAD-10`의 청취 확인/정정 방송/재청취/대피 문장 승인 판정을 대체하기
- 편의점 상인 NPC 만들기
- 지하철 빠른 이동 만들기
- 미세부품 수리/강화 UI 만들기
- 지하 대피실을 안전지대나 회복지로 만들기
- 실제 지명, 실제 회사명, 실제 역명 사용

## 침범 방지 기준

### GATE-09 보호

막차 환승 보류관과 정기권 판독자는 GATE-09의 하위 단서로만 작동한다. 이들은 개찰 미통과, 플랫폼 잔류, 막차 환승 보류의 흔적을 보여줄 수 있지만, 통과 판정을 조작하거나 플레이어를 이동시키면 안 된다.

### BROAD-10 보호

방재 문구 승인자와 반복 안내 편집자는 BROAD-10의 하위 압력으로만 작동한다. 이들은 문구 승인 지연, 잘린 자막, 반복 안내의 이상을 보여줄 수 있지만, 방송을 장악하거나 정답을 송출하면 안 된다.

### 다른 플레이어블 보호

- `RETURN-05`를 보관함/회수실의 사람 버전으로 만들지 않는다.
- `QUIET-07`을 무음 대피소 관리자로 만들지 않는다.
- `OPEN-HOST`의 가족/거주지 침식을 E02 가족 정기권 로그가 대신 설명하지 않는다.
- `PATCH`, `METER`, `RIO`의 정비/부품/계량 기능을 미세부품 검수자가 대신하지 않는다.

## 최종 검수 체크리스트

작성 후 스스로 아래를 확인하고 문서 말미에 검수 결과를 남겨라.

- 출력 문서가 정확히 2개인가?
- 새 NPC가 추가되지 않았는가?
- 직접 대면 NPC가 2명 이하인가?
- 상태 반응 매트릭스가 27~42행인가?
- 오브젝트 문구 은행이 총 30~45개 문구/변형인가?
- E02_C03, E02_C05, E02_C07에 과도하게 쏠리지 않고 E02_C04, E02_C08, E02_C01 보조 잔향도 살아 있는가?
- GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO를 대체하지 않았는가?
- 문구가 스토리 산문이 아니라 구현 가능한 안내문/로그/장치 메시지인가?

## NPC 제작팀에게 전달할 프롬프트

아래 지시를 그대로 수행하라.

1. 먼저 필수 문서를 모두 읽고, E02 첫 외부 슬라이스의 기존 잠금 상태를 확인한다.
2. 새 NPC, 새 프로필, 새 스토리 장면을 만들지 않는다.
3. `story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md`를 작성한다.
4. `story/03_regions/e02_first_slice_object_text_bank_v0_1.md`를 작성한다.
5. 두 문서 모두 상태 키, 플래그, 보호 대상, 금지 겹침을 표 안에 명시한다.
6. 작성 후 코드펜스 균형, trailing whitespace, 표 수량 조건을 검수한다.
7. 커밋/푸시는 별도 지시가 있을 때만 한다.
