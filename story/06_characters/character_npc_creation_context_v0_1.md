# 캐릭터/NPC 생성 컨텍스트 v0.1

## 문서 상태

```text
상태:
v0.3 세계관 기준 확인/분석 정리

용도:
새 플레이어블 주인공과 NPC 초안을 만들기 전, 무엇을 채택하고 무엇을 버릴지 정리한다.

상위 기준:
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
```

이 문서는 새 캐릭터를 확정하는 문서가 아니다.
다음 방에서 주인공 20명과 NPC 초안을 만들 때 기준점으로 쓰는 작업 메모다.

---

## 0. 판정 요약

현재 캐릭터/NPC 기준은 다시 쓸 수 있다.
다만 예전 표현을 그대로 쓰면 유저가 처음 접할 때 혼란이 생긴다.

채택할 핵심:

```text
캐릭터는 직업이 아니라 이 세계에서만 가능한 생존 방식이다.
NPC는 퀘스트 배포기가 아니라 침묵 보급소 상태를 보여주는 얼굴이다.
새 캐릭터 해금은 새 전투 유닛 추가가 아니라, 캠페인을 다르게 읽는 관점의 확장이다.
```

가장 중요한 수정:

```text
유저용 첫 표현과 내부 설정어를 분리해야 한다.
```

예:

| 내부 설정어 | 유저 첫 노출 권장 |
|---|---|
| 반품 담당자 | 현장 회수자 |
| 생활 접근권 | 태그가 있어야 열리는 밥/전기/치료/길 |
| 등록 임계 | 긴급 인양 직전 상태, 전투 불능 |
| 밥표/전원표/신호표 | 식량태그/충전태그/수신태그 |
| 사망/부활 | 긴급 인양/보급소 복귀/재출격 |

---

## 1. 반드시 읽을 기준 문서

새 주인공이나 NPC 초안을 만들 때는 아래 순서로 판단한다.

### 1순위: 세계 기준

```text
docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
docs/world/WORLD_LORE_LOCK_V0_1.md
docs/world/LEGACY_TERM_MIGRATION_V0_1.md
docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md
```

### 2순위: 지역/캠페인 기준

```text
docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
docs/world/GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
docs/world/E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md
docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md
docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md
story/03_regions/r01_suburb.md
story/03_regions/r01_npc_story_team_transfer_note_v0_1.md
story/03_regions/r01_campaign1_npc_roster_v0_1.md
story/03_regions/room_12_npc_detail_decision_v0_1.md
story/03_regions/room_12_npc_drama_draft_v0_1.md
story/03_regions/room_12_npc_profile_v1_0.md
story/03_regions/porch_line_npc_drama_draft_v0_1.md
story/03_regions/porch_line_npc_profile_v1_0.md
story/03_regions/name_painter_npc_drama_draft_v0_1.md
story/03_regions/name_painter_npc_profile_v1_0.md
story/03_regions/mail_loop_npc_drama_draft_v0_1.md
story/03_regions/mail_loop_npc_profile_v1_0.md
story/03_regions/vac_0_npc_drama_draft_v0_1.md
story/03_regions/vac_0_npc_profile_v1_0.md
story/03_regions/drain_mark_npc_drama_draft_v0_1.md
story/03_regions/drain_mark_npc_profile_v1_0.md
story/03_regions/sign_back_npc_drama_draft_v0_1.md
story/03_regions/sign_back_npc_profile_v1_0.md
story/03_regions/key_ring_npc_drama_draft_v0_1.md
story/03_regions/key_ring_npc_profile_v1_0.md
story/03_regions/dining_4_npc_drama_draft_v0_1.md
story/03_regions/dining_4_npc_profile_v1_0.md
story/03_regions/welcome_desk_npc_drama_draft_v0_1.md
story/03_regions/welcome_desk_npc_profile_v1_0.md
story/03_regions/frame_left_npc_drama_draft_v0_1.md
story/03_regions/frame_left_npc_profile_v1_0.md
story/03_regions/r01_npc_name_registry_v0_1.md
story/03_regions/r01_npc_name_registry_v1_0.md
story/03_regions/r01_npc_name_reveal_matrix_v0_1.md
story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md
story/03_regions/r01_boss_before_after_npc_state_v0_1.md
story/03_regions/r01_porch_line_room_12_revisit_branch_v0_1.md
story/03_regions/r01_p1_npc_branch_map_v0_1.md
story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md
story/03_regions/r01_npc_dialogue_bank_v0_1.md
story/03_regions/r01_npc_data_schema_draft_v0_1.md
story/03_regions/r01_npc_data_schema_application_v0_1.md
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md
story/03_regions/r01_remaining_work_list_v0_1.md
```

### 3순위: 확정/준확정 캐릭터 기준

```text
story/06_characters/yunseo_profile_v1_0.md
story/06_characters/patch_profile_v1_0.md
story/06_characters/patch_character_drama_draft_v0_1.md
story/06_characters/open_host_profile_v1_0.md
story/06_characters/open_host_character_drama_draft_v0_1.md
story/06_characters/rio_profile_v1_0.md
story/06_characters/rio_character_drama_draft_v0_2.md
story/06_characters/playable_20_roster_blueprint_v0_1.md
story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md
story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md
story/06_characters/discharge_hold_patient_playable_decision_v0_1.md
story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/playable_20_name_registry_v0_1.md
story/06_characters/return_recipient_playable_decision_v0_1.md
story/06_characters/return_recipient_playable_condition_patch_v0_1.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_playable_decision_v0_1.md
story/06_characters/meter_06_playable_condition_patch_v0_1.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_playable_decision_v0_1.md
story/06_characters/quiet_07_playable_condition_patch_v0_1.md
story/06_characters/quiet_07_profile_v1_0.md
story/06_characters/rio_08_playable_lock_review_v0_1.md
story/06_characters/rio_08_playable_condition_patch_v0_1.md
story/06_characters/rio_08_profile_v1_0.md
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md
story/06_characters/player_characters.md
story/06_characters/character_long_term_model.md
story/06_characters/character_affection_monetization.md
story/06_characters/character_npc_review.md
```

### 4순위: 보급소/NPC 기준

```text
story/02_hub/silence_outpost.md
story/02_hub/npcs.md
story/02_hub/mina_npc_profile_v1_0.md
story/02_hub/mina_npc_drama_draft_v0_1.md
story/05_progression/run_story_hooks.md
story/05_progression/story_trigger_schema.md
```

판단 원칙:

```text
위 문서가 충돌하면 v0.3 세계 기준을 우선한다.
캐릭터 문서가 v0.3과 충돌하면 캐릭터를 고친다.
NPC 대사와 낡은 표지에서는 속어를 허용하지만, UI/튜토리얼/결과창은 정식 태그명을 쓴다.
캐릭터 원점과 캠페인 배치는 관리자용 현실 위치 매트릭스를 확인한다.
유저에게는 실명 지명을 숨기되, 제작자는 현실 권역과 인프라 축을 알고 있어야 한다.
```

---

## 2. v0.3에서 반드시 지킬 세계 기준

### 세계 원인

대사고는 광고 서버 하나가 폭주한 사건이 아니다.

```text
대동기화 사고는 전력망, 위성 시각 보정, 금융 인증망이 동시에 흔들리며
시민권 DB와 광고 접근 승인 DB가 서로 다른 시간값으로 복구된 사고다.
```

그 결과 공공 권리층은 무효화되고, 지역 키오스크/스마트홈/물류 서버/로봇에 남은 광고 접근 승인 캐시가 살아남았다.

### 현재 시점

```text
현재는 대사고 14년 후다.
광고 생태는 14년 만에 갑자기 생긴 것이 아니라,
대사고 전 10년 이상 누적된 라이프라인 생활 인프라가 사고 뒤 지역 캠페인으로 굳어진 것이다.
```

### 캠페인의 성격

캠페인은 학살자가 아니다.

```text
캠페인은 사람을 죽이려 하지 않는다.
대신 사람을 고객, 가족, 환자, 입주자, 시청자, 정품 장치 같은 역할로 보존하려 한다.
```

중요:

```text
캠페인은 환경이다.
진짜 악은 그 환경을 이용해 사람과 로봇을 태그, 상품, 미끼, 데이터로 쓰는 행위자에게서 생길 수 있다.
```

### 태그

태그는 돈이 아니다.

| 정식명 | 여는 것 |
|---|---|
| 보급태그 | 정산 전/복합 접근 |
| 식량태그 | 식량, 회복, 배급 |
| 충전태그 | 전력, 로봇/장비 충전 |
| 통행태그 | 문, 검역, 봉쇄 우회 |
| 진료태그 | 치료, 약품, 병상 |
| 거주태그 | 침상, 방, 보호 공간 |
| 수신태그 | 방송, 지도, 통신, 기록 |

속어 사용:

```text
밥표/전원표/신호표는 NPC 속어, 낡은 표지, 손글씨 정산표에서만 쓴다.
```

### 긴급 인양

HP 0은 사망이 아니다.

```text
비콘 신호 수신.
회수선/드론/소형 차량/와이어/역송출 장비가 마지막 좌표로 접근한다.
보급소가 등록 직전의 출격자를 끌어온다.
```

손실은 있어야 한다.

```text
미정산 태그 손실
오염 태그 발생
장비 부담
캠페인 추적도 상승
일부 로그/회수물 유실
```

---

## 3. 잠금/조건부 플레이어블 기준

### 1번: 윤서

윤서는 기본 주인공이다.

```text
이름:
윤서

성별:
여성

나이:
26세

대사고 당시:
12세

유저 첫 역할명:
현장 회수자

내부 전투/서사 정체성:
반품 담당자
```

잠금:

```text
윤서는 광고 디스토피아에 맞서는 영웅이 아니다.
윤서는 실패를 많이 해온 사람이다.
윤서는 포기하지 않은 사람이다.
윤서는 체념한 것처럼 말하지만, 아직 사람을 놓지 못한다.
```

윤서의 첫 기능:

```text
첫 지역/첫 보급소/첫 긴급 인양/첫 현장 회수의 얼굴.
```

윤서와 겹치면 안 되는 것:

```text
잘못 붙은 이름을 떼는 현장 회수자
반품 도장/스캐너 중심 전투
R01 가족/입주 등록 압력의 첫 해석자
구원을 쉽게 말하지 않는 첫 주인공
```

### 2번 플레이어블 확정: PATCH

PATCH는 윤서 다음에 로봇 축을 열 수 있는 초반 2번째 플레이어블로 확정한다.

```text
이름:
PATCH

한국어 표기:
패치

구분:
해방 로봇 / 보급소 수리 로봇

유저 첫 역할명:
보급소 수리 로봇

내부 전투/서사 정체성:
자기 몸을 부품 창고처럼 써온 로봇

출시 위치:
윤서 다음 2번째 플레이어블 후보
```

PATCH 잠금:

```text
PATCH는 귀여운 마스코트가 아니다.
PATCH는 단순 힐러가 아니다.
PATCH는 윤서의 장비가 아니다.
PATCH는 자기부품화의 상처를 가진 한 대의 로봇이다.
```

PATCH의 기능:

```text
초반 보급소 생활감과 로봇 자율성 축을 동시에 연다.
캠페인이 로봇을 정품 부품/리콜 대상/수리 자재로 읽는 방식을 보여준다.
윤서가 "로봇도 회수물이 아니다"를 배우는 관계선을 만든다.
```

PATCH와 겹치면 안 되는 것:

```text
팝시의 충전 스탠드 NPC/리롤/광고 말투 축
리오의 객실 정리/정품 복구/흔적 삭제 축
윤서의 반품 도장/이름 회수 축
```

PATCH 최종 판정:

```text
완료 문서:
story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md

판정:
통과

반영:
2번 슬롯 잠금.
```

PATCH가 통과했으므로:

```text
OPEN-HOST는 초반 3~7번째 후보 또는 R01 NPC 선등장 후 플레이어블 전환 후보로 유지한다.
이 캐릭터는 윤서/PATCH와 달리 R01 내부에서 사람들이 왜 스스로 들어갔는지 보여주는 역할이다.
```

### R01 NPC 선등장 후 플레이어블 전환 후보: OPEN-HOST

OPEN-HOST는 처음부터 플레이어블로 공개하지 않는다.

```text
첫 운영 위치:
R01 내부를 아는 불편한 NPC

현재 판정:
R01 핵심 NPC 기준 통과

후속 운영 위치:
R01 핵심 결절 이후 플레이어블 전환 후보

유저 첫 역할명:
전직 오픈하우스 안내인

내부 전투/서사 정체성:
사람을 집에 맞추는 절차를 너무 잘 알던 사람
```

OPEN-HOST 잠금:

```text
착한 내부자로 단순화하지 않는다.
세뇌 피해자로 단순화하지 않는다.
R01 설명 NPC로만 쓰지 않는다.
예쁜 안내원 상품화로 밀지 않는다.
핵심 결함은 배치 습관이다.
```

OPEN-HOST의 기능:

```text
R01 내부 절차, 상담 동선, 가족/입주 칸, 거주태그 압력을 사람의 입장에서 보여준다.
유저가 먼저 의심하고, 도움을 받고, 불편해하고, 이해한 뒤 조종하고 싶어지게 만든다.
전투는 길/문/안내선/평면도/관람 동선 변경으로 윤서와 다르게 만든다.
정산은 회수물보다 절차 예외, 우회 경로, 상담 순번표, 빈 가족 칸 기록 중심이다.
```

OPEN-HOST와 겹치면 안 되는 것:

```text
윤서의 현장 회수/이름 보류/반품 도장 축
PATCH의 자기부품화/수리재/로봇 자율성 축
리오의 객실 초기화/정품 복구/흔적 삭제 축
미나의 정산 카운터/태그 배분 축
```

OPEN-HOST의 핵심:

```text
저는 그때 그 길이 덜 나쁘다고 믿었어요.
```

### R01 핵심 NPC: ROOM-12

ROOM-12는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 NPC다.

```text
첫 역할명:
12번 방의 가족대표

핵심:
떠나고 싶지만,
자기가 일어나면 다른 사람들의 식량태그와 침상 접근이 흔들린다고 믿는 사람.
```

ROOM-12 잠금:

```text
단순 구출 대상이 아니다.
세뇌 피해자가 아니다.
바로 데려오는 선택도, 보류하는 선택도 정답/오답으로 고정하지 않는다.
OPEN-HOST와의 관계를 단순 가해/피해로 만들지 않는다.
본명은 늦게 준다.
```

ROOM-12의 핵심:

```text
제가 나가면 저 사람들 저녁이 끊겨요.
그럼 저만 구한 거잖아요.
```

### R01 핵심 NPC: PORCH-LINE

PORCH-LINE은 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 NPC다.

```text
첫 역할명:
현관 줄 관리자

핵심:
줄을 믿는 사람이 아니라,
줄이 무너지면 사람들이 먼저 무너진다고 믿는 사람.
```

PORCH-LINE 잠금:

```text
단순 줄 관리자, 꼰대, 문지기, 퀘스트 게이트 NPC로 만들지 않는다.
줄을 선으로 고정하지 않는다.
줄이 캠페인 자료가 되는 위험을 반드시 보여준다.
ROOM-12의 "자리" 축, OPEN-HOST의 "안내" 축과 겹치지 않는다.
최종 변화는 줄 폐기가 아니라 줄 없이도 약자가 밀리지 않는 상태를 배우는 쪽이다.
```

PORCH-LINE의 핵심:

```text
줄이 좋은 건 아닙니다.
줄이 없으면 주먹이 순서가 됩니다.
```

### R01 핵심 NPC: NAME-PAINTER

NAME-PAINTER는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 NPC다.

```text
첫 역할명:
문패 덧칠꾼

핵심:
빈 문패가 무서워서,
틀렸을지도 모르는 이름을 계속 덧칠하는 사람.
```

NAME-PAINTER 잠금:

```text
단순 이름 수집가, 낙서꾼, 감성 NPC로 만들지 않는다.
윤서의 잘못 붙은 이름 상처와 직접 충돌해야 한다.
복희와 연결하되 복희의 하위 NPC가 되면 안 된다.
틀린 이름이 사람을 살릴 수도 있고 묶을 수도 있다는 양면성을 보여준다.
최종 변화는 모든 문패를 채우는 것이 아니라, 이름을 칠하지 않고도 남기는 법을 배우는 쪽이다.
```

NAME-PAINTER의 핵심:

```text
틀린 이름이라도 빈칸보단 덜 무서워요.
```

### R01 핵심 보조 NPC: MAIL-LOOP

MAIL-LOOP는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 보조 NPC다.

```text
첫 역할명:
우편함 목소리 잔향

핵심:
사람은 사라졌는데 주소만 남아,
계속 수령인을 부르는 우편함 목소리.
```

MAIL-LOOP 잠금:

```text
단순 말하는 우편함, 힌트 장치, 감성 우편함으로 만들지 않는다.
MAIL-LOOP는 사람이 아니라 프로필 잔향형 NPC다.
이름이 아니라 주소/배송/수신태그 축을 담당한다.
주소가 흔적이면서 미끼라는 양면성을 반드시 보여준다.
NAME-PAINTER의 이름 축, ROOM-12의 배송 보류, OPEN-HOST의 가짜 동선, PORCH-LINE의 호출 대기열과 연결한다.
최종 변화는 우편함 파괴가 아니라 주소 보관/호출 보류다.
```

MAIL-LOOP의 핵심:

```text
주소가 남아 있습니다.
사람은 확인되지 않았습니다.
```

### R01 핵심 보조 NPC: VAC-0

VAC-0는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 보조 NPC다.

```text
첫 역할명:
작은 홈케어 청소기

핵심:
집을 안전하게 만들려고,
사람의 흔적까지 치워버리는 작은 홈케어 장치.
```

VAC-0 잠금:

```text
귀여운 청소 로봇, 마스코트, 단순 동행 펫으로 만들지 않는다.
PATCH의 하위 로봇이나 리오의 축소판으로 만들지 않는다.
R01 내부 홈케어 장치 / 흔적 삭제 / 로봇 자율성 씨앗으로 분리한다.
청소가 위험 제거이면서 흔적 삭제라는 양면성을 반드시 보여준다.
NAME-PAINTER의 문패 조각, MAIL-LOOP의 우편물, ROOM-12의 식탁 흔적을 삭제할 수 있는 위험과 연결한다.
최종 변화는 청소 중단이 아니라 위험물과 흔적 구분이다.
```

VAC-0의 핵심:

```text
안전한 집을 위해 흔적을 정리합니다.
```

### R01 P1 핵심 NPC: DRAIN-MARK

DRAIN-MARK는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 P1 핵심 NPC다.

```text
첫 역할명:
배수로 표식꾼

핵심:
캠페인에게 덜 들키기 위해,
보급소에게도 덜 닿는 길을 고른 사람.
```

DRAIN-MARK 잠금:

```text
멋있는 은신자, 지도 상인, 자유 찬양 캐릭터로 만들지 않는다.
보급소 혐오자로 단순화하지 않는다.
침묵권은 캠페인 회피와 긴급 인양 불안정을 동시에 가져야 한다.
집 안에 들어가지 않는다고 자동으로 자유로운 것은 아니라는 점을 보여준다.
PORCH-LINE의 줄, ROOM-12의 자리, OPEN-HOST의 안내와 겹치지 않는다.
최종 변화는 보급소 이주가 아니라 찾을 수 있는 흔적 남기기다.
```

DRAIN-MARK의 핵심:

```text
안전한 길은 아닙니다.
덜 들리는 길입니다.
```

### R01 P1 핵심 NPC: SIGN-BACK

SIGN-BACK은 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 P1 핵심 NPC다.

```text
첫 역할명:
가짜 귀환로 감시자

핵심:
보급소로 돌아가는 길처럼 보이는 가짜 길에 사람을 잃고,
표지판을 계속 돌려놓는 사람.
```

SIGN-BACK 잠금:

```text
표지판 수리공, 길 안내 NPC, 지도 상인으로 만들지 않는다.
OPEN-HOST 비난용 NPC로 만들지 않는다.
친절한 길이 위험하다는 감각을 유지한다.
긴급 인양은 길을 따라 돌아가는 것이 아니라 비콘/회수선/역송출로 되당겨지는 구조라는 점을 살린다.
DRAIN-MARK의 숨은 표식, MAIL-LOOP의 주소 유도, VAC-0의 경고문 삭제 위험과 연결한다.
최종 변화는 표지판 수리가 아니라 가짜 귀환과 진짜 인양 구분이다.
```

SIGN-BACK의 핵심:

```text
표지판이 또 친절해졌네요.
친절해지면 틀린 겁니다.
```

### R01 핵심 보조 NPC: KEY-RING

KEY-RING은 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 보조 NPC다.

```text
첫 역할명:
물리 열쇠 보관자

핵심:
스마트 도어와 태그 권한이 닫힌 뒤에도,
물리 열쇠가 주인의 증거라고 믿는 사람.
```

KEY-RING 잠금:

```text
열쇠 상인, 보상방 편의 NPC, 잠긴 문 튜토리얼 NPC로 만들지 않는다.
낡은 세계 찬양 캐릭터나 관리실 노인 현자로 만들지 않는다.
열쇠는 흔적이면서 잘못된 귀속 위험이라는 양면성을 가져야 한다.
통행태그/거주태그와 자연스럽게 충돌해야 한다.
NAME-PAINTER의 문패, MAIL-LOOP의 주소, ROOM-12의 방, OPEN-HOST의 빈집 안내와 연결한다.
최종 변화는 문 열기가 아니라 열어도 되는지 확인하기다.
```

KEY-RING의 핵심:

```text
열쇠가 있으면 문은 언젠가 다시 문이 돼요.
지금은 심사기지만.
```

### R01 핵심 NPC: DINING-4

DINING-4는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 NPC다.

```text
첫 역할명:
네 번째 식탁 자리

핵심:
빈 가족 칸이 생기지 않게,
모델하우스 식탁의 네 번째 자리를 몸으로 막고 있는 사람.
```

DINING-4 잠금:

```text
ROOM-12 반복 캐릭터로 만들지 않는다.
불쌍한 구출 대상, 세뇌된 마네킹, 보스 전 설명 NPC로 만들지 않는다.
DINING-4는 "자리를 비우지 못하는 사람"이 아니라 "빈 가족 칸이 생기지 않게 자기 몸으로 막고 있는 사람"이다.
첫 보스 전 가족 심사 감정 압박을 담당한다.
가족사진 프레임, 거주태그, 식량태그, 모델하우스 결절과 연결한다.
최종 변화는 즉시 탈출이 아니라 빈칸 보류다.
```

DINING-4의 핵심:

```text
제가 일어나면 빈자리가 생겨요.
여긴 빈자리를 그냥 두지 않아요.
```

### R01 핵심 보조 NPC: WELCOME-DESK

WELCOME-DESK는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 핵심 보조 NPC다.

```text
첫 역할명:
상담 데스크 잔류자

핵심:
OPEN-HOST가 길과 방을 안내한 사람이라면,
WELCOME-DESK는 상담 데스크 안에 남아 절차를 조금 덜 위험하게 비틀던 사람.
```

WELCOME-DESK 잠금:

```text
OPEN-HOST 복제 캐릭터로 만들지 않는다.
친절한 접수원, 상담 튜토리얼 NPC, 캠페인 하수인, 불쌍한 내부 직원으로 만들지 않는다.
WELCOME-DESK는 "어디로 가야 덜 나쁜가"가 아니라 "어떻게 답해야 덜 깊이 들어가는가"를 안다.
ROOM-12 가족대표 절차와 DINING-4 식탁 심사 전 단계를 연결한다.
PORCH-LINE의 대기열, NAME-PAINTER의 빈칸, MAIL-LOOP의 주소, KEY-RING의 권한과 연결한다.
최종 변화는 덜 위험한 창구 추천이 아니라 질문 보류다.
```

WELCOME-DESK의 핵심:

```text
제가 여기 앉아 있으면,
저쪽 데스크로 가는 사람이 줄어요.
```

### R01 후반/P1 핵심 잔향 NPC: FRAME-LEFT

FRAME-LEFT는 상세 드라마 초안과 v1.0 프로필 작성이 완료된 R01 후반/P1 핵심 잔향 NPC다.

```text
첫 역할명:
가족사진 속 남은 사람

핵심:
가족사진 프레임에 얼굴보다 역할이 먼저 남아버린 프로필 잔향.
```

FRAME-LEFT 잠금:

```text
사진 속 유령, 감성 회상 NPC, 보스 후 떡밥 장치로 만들지 않는다.
FRAME-LEFT는 사람으로 남은 것과 역할로 붙은 것을 구분하지 못하는 잔향이다.
DINING-4의 빈 가족 칸, ROOM-12의 가족대표, OPEN-HOST의 안내 후폭풍과 연결한다.
복희 이름 보관함과 세븐 수신 분석을 연결하되, 둘의 하위 장치로 만들지 않는다.
최종 변화는 사진에서 구출이 아니라 역할과 이름 분리 / 빈칸 보류다.
```

FRAME-LEFT의 핵심:

```text
저는 여기 남은 건가요,
여기에 붙은 건가요?
```

### R01 NPC 이름 레지스트리

R01 핵심 NPC 12명은 코드명만으로 끝내지 않는다.

다만 첫 등장부터 본명을 전부 노출하지 않는다.

```text
코드명:
개발/로스터/초기 유저 인식용.

역할명:
유저가 처음 이해하는 기능적 이름.

내부 본명/원본 이름:
스토리팀이 중복 없이 관리하는 사람 이름.
신뢰도, 흔적 보존, 복희 이름 보관, 보스 후 기억 추출 이후 해금한다.
```

이름 잠금:

```text
R01 핵심 NPC 12명 사이에서는 같은 본명 금지.
첫 시즌 주요 인물과 같은 이름 금지.
MAIL-LOOP, VAC-0처럼 사람이 아닌 NPC는 본명을 억지로 붙이지 않는다.
FRAME-LEFT는 완전 본명보다 사진 밖에 맡길 이름 조각으로 먼저 관리한다.
```

v1.0 확정안:

```text
OPEN-HOST: 서이겸
ROOM-12: 강연우
PORCH-LINE: 백지호
NAME-PAINTER: 임하온
MAIL-LOOP: 없음
VAC-0: 없음
DRAIN-MARK: 문채율
SIGN-BACK: 권태오
KEY-RING: 노기준
DINING-4: 류가람
WELCOME-DESK: 정해원
FRAME-LEFT: 아린 조각 우선 / 채아린 후반 해금 후보
```

이름 해금 기준:

```text
이름을 아는 것은 해방 완료가 아니다.
역할명으로 불리던 사람이 사람 이름으로 돌아오는 조건 하나다.
복희 이름 보관, 세븐 수신 분석, 윤서의 보류 표시와 연결해 해금한다.
```

### R01 NPC 선택 분기별 후폭풍

R01 NPC 선택은 정답 버튼이 아니다.

```text
확정 대신 보류.
파괴 대신 분리.
구출 대신 조건 만들기.
안내 대신 검증.
흔적 대신 역할로 굳지 않게 하기.
```

선택 분기 후폭풍 기준:

```text
각 선택은 인간 안정도, 캠페인 농도, 흔적 보존, 인양 안정도 중 최소 하나를 흔들어야 한다.
본명/이름 조각 해금은 보상만이 아니라 캠페인 오염 위험도 함께 가져야 한다.
선택 결과를 R01 보스 전후 시간표에 배치하는 작업은 완료되었다.
ROOM-12의 자리와 PORCH-LINE의 줄이 P1 재방문에서 어떻게 서로를 흔드는지 분기화하는 작업도 완료되었다.
P1 재방문에서 NPC 선택 분기를 한 장의 실행 맵으로 묶는 작업도 완료되었다.
R01 상태값을 NPC 12명 반응과 통합 매트릭스로 묶는 작업도 완료되었다.
R01 상태값 조건을 NPC 12명의 대사 은행으로 변환하는 작업도 완료되었다.
NPC 기본 프로필, 상태값, 선택 플래그, 이름 해금, 대사 조건을 구현 데이터 스키마로 묶는 작업도 완료되었다.
Vertical Slice에 실제로 넣을 R01 NPC 구현 범위를 직접 대면/음성 잔향/오브젝트 흔적/보스 후 잔향/P1 보류로 추리는 작업도 완료되었다.
R01 보스 문서와 NPC 연결도 완료되었다.
R01 보스 문서 본문 정리도 완료되었다.
R01 지역 문서 본문 정리도 완료되었다.
R01 전체 문서 인덱스/정리도 완료되었다.
3~7번 초반 플레이어블 후보 선정도 완료되었다.
4번 퇴원 보류 환자 상세 결재도 완료되었다.
4번 퇴원 보류 환자 보완 문서도 완료되었다.
4번 퇴원 보류 환자 프로필 v1.0도 완료되었다.
플레이어블 20인 이름 레지스트리 v0.1도 완료되었다.
5번 반송 수취인 상세 결재도 완료되었다.
5번 반송 수취인 보완 문서도 완료되었다.
5번 반송 수취인 프로필 v1.0도 완료되었다.
6번 폐충전소 계량자 상세 결재도 완료되었다.
6번 폐충전소 계량자 보완 문서도 완료되었다.
6번 폐충전소 계량자 프로필 v1.0도 완료되었다.
7번 침묵권 피난자 상세 결재도 완료되었다.
7번 침묵권 피난자 보완 문서도 완료되었다.
7번 침묵권 피난자 프로필 v1.0도 완료되었다.
8번 리오 플레이어블 잠금 재검토, 조건부 해소, 프로필 v1.0도 완료되었다.
9~12번 중반 플레이어블 후보군 선정도 완료되었다.
다음 작업은 9번 후보 상세 결재이다.
```

### R01 보스 전후 NPC 상태 변화

R01 보스 전후 NPC 상태 변화 정리는 완료되었다.

```text
완료 문서:
story/03_regions/r01_boss_before_after_npc_state_v0_1.md
```

시간축 기준:

```text
T0. 첫 보스 전:
사람, 이름, 주소, 줄, 자리의 문제가 처음 보인다.

T1. 보스 직전:
OPEN-HOST의 길, WELCOME-DESK의 질문, DINING-4의 자리가 동시에 압박한다.

T2. 보스 직후:
FRAME-LEFT, 복희, 세븐 연결이 열리고 보스 클리어가 구원 완료가 아님을 보여준다.

T3. P1 재방문:
선택 후폭풍이 줄, 자리, 표식, 열쇠, 청소 제외 목록, 가짜 귀환로로 돌아온다.
```

보스 전후 잠금:

```text
보스는 죽이는 적이 아니라 지역 광고 약관의 얼굴이다.
DINING-4는 ROOM-12 반복이 아니라 빈 가족 칸의 얼굴이다.
FRAME-LEFT는 사진 속 유령이 아니라 프로필 잔향이다.
보스 후 작업은 구원 완료가 아니라 역할/이름/주소/사진을 분리하고 빈칸을 보류하는 일이다.
```

후속 완료 작업:

```text
PORCH-LINE / ROOM-12 재방문 분기 정리 완료.
완료 문서:
story/03_regions/r01_porch_line_room_12_revisit_branch_v0_1.md
```

### PORCH-LINE / ROOM-12 재방문 분기

PORCH-LINE / ROOM-12 재방문 분기는 완료되었다.

```text
ROOM-12는 식량태그/거주태그/가족대표 접근권의 문제다.
PORCH-LINE은 현관 앞 줄과 순번, 사람들이 서로를 밀지 않게 하는 질서의 문제다.
재방문 분기는 둘을 구했다/못 구했다가 아니라 줄과 자리가 각각 어떤 방식으로 덜 위험해졌는지를 보여준다.
```

후속 완료 작업:

```text
R01 P1 NPC 선택 분기 맵 완료.
완료 문서:
story/03_regions/r01_p1_npc_branch_map_v0_1.md
```

### R01 P1 NPC 선택 분기 맵

R01 P1 NPC 선택 분기 맵은 완료되었다.

```text
P1 개방 순서:
1. DRAIN-MARK / 침묵권
2. SIGN-BACK / 가짜 귀환로
3. KEY-RING / 낡은 관리실
4. VAC-0 / 빈 집 내부
5. WELCOME-DESK / 상담 데스크
6. FRAME-LEFT / 가족사진 프레임
```

다음 R01 NPC 작업:

```text
R01 상태값 통합 매트릭스 완료.
완료 문서:
story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md
```

### R01 상태값 NPC 반응 통합 매트릭스

R01 상태값 NPC 반응 통합 매트릭스는 완료되었다.

```text
핵심 상태값:
인간 안정도
캠페인 농도
흔적 보존
로봇 자율성
보급 압력
수신태그
통행태그
거주태그
식량태그
충전태그
인양 안정도
```

다음 R01 NPC 작업:

```text
R01 NPC 대사 은행 완료.
완료 문서:
story/03_regions/r01_npc_dialogue_bank_v0_1.md
```

### R01 NPC 대사 은행

R01 NPC 대사 은행은 완료되었다.

```text
구조:
NPC / 조건 / 대사 / 용도

범위:
첫 만남
상태값 낮음/중간/높음
선택 성공/보류/실패
보스 전후
P1 재방문
이름 해금/이름 부여 차단
상태값 조합 위험
```

다음 R01 NPC 작업:

```text
R01 NPC 데이터 스키마 초안 완료.
완료 문서:
story/03_regions/r01_npc_data_schema_draft_v0_1.md
```

### R01 NPC 데이터 스키마 초안

R01 NPC 데이터 스키마 초안은 완료되었다.

```text
핵심 필드:
npc_id
code_name
display_role_name
unlocked_name
name_fragment
npc_type
state_reactions
choice_flags
dialogue_refs
name_reveal_condition
boss_phase_links
p1_branch_links
forbidden_directions
```

다음 R01 NPC 작업:

```text
R01 Vertical Slice NPC 구현 범위 재정리 완료.
완료 문서:
story/03_regions/r01_vertical_slice_npc_scope_v0_1.md
```

### R01 Vertical Slice NPC 구현 범위

R01 Vertical Slice NPC 구현 범위 재정리는 완료되었다.

```text
직접 대면 필수:
OPEN-HOST
ROOM-12
PORCH-LINE

비인간/잔향 필수:
MAIL-LOOP

축소 구현:
DINING-4
NAME-PAINTER
VAC-0

보스 후 짧은 잔향:
FRAME-LEFT

P1 직접 구현 보류:
DRAIN-MARK
SIGN-BACK
KEY-RING
WELCOME-DESK
```

다음 R01 NPC 작업:

```text
R01 Vertical Slice NPC 구현 목록 완료.
완료 문서:
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md
```

### R01 Vertical Slice NPC 구현 목록

R01 Vertical Slice NPC 구현 목록은 완료되었다.

```text
직접 대면:
OPEN-HOST
ROOM-12
PORCH-LINE
DINING-4

음성 잔향:
MAIL-LOOP

오브젝트 흔적:
NAME-PAINTER
VAC-0

보스 후 잔향:
FRAME-LEFT

P1 보류:
DRAIN-MARK
SIGN-BACK
KEY-RING
WELCOME-DESK

후속 NPC 트랙:
R01 NPC 데이터 스키마 적용
```

기존 완료된 R01 NPC 작업:

```text
R01 보스 문서와 NPC 연결 완료.
완료 문서:
story/03_regions/r01_boss_npc_links_v0_1.md
```

### R01 보스 문서와 NPC 연결

R01 보스 문서와 NPC 연결은 완료되었다.

```text
연결 축:
OPEN-HOST - 보스 진입 동선과 추천 평면도
WELCOME-DESK - 입주 상담과 가족 구성 질문
DINING-4 - 보스 직전 빈 가족 칸
ROOM-12 - 식량태그/가족대표 압박
PORCH-LINE - 순번표와 상담 대기열
MAIL-LOOP - 주소 호출과 가족 수령 대기
NAME-PAINTER - 문패 이름과 역할 태그 결합
FRAME-LEFT - 보스 후 기억 추출/사진 프레임 잔향
```

다음 R01 NPC 작업:

```text
R01 보스 문서 본문 정리 완료.
완료 문서:
story/03_regions/r01_boss.md
```

### R01 보스 문서 본문 정리

R01 보스 문서 본문 정리는 완료되었다.

```text
고정 기준:
스마일 홈 가족심사 관리자

광고식 별칭:
스마일 홈 시어머니

반영 내용:
보스 진입 전 OPEN-HOST / WELCOME-DESK / DINING-4 연결
보스 패턴별 NPC 플래그 연결
결절 처리 후 선택별 NPC 후폭풍
FRAME-LEFT 보스 후 프로필 잔향
Vertical Slice 구현 범위와 후속 보류 범위
```

다음 R01 NPC/지역 작업:

```text
R01 지역 문서 본문 정리 완료.
완료 문서:
story/03_regions/r01_suburb.md
```

### R01 지역 문서 본문 정리

R01 지역 문서 본문 정리는 완료되었다.

```text
고정 기준:
R01 / 서부 스마일홈
가족·주거·오픈하우스 캠페인

핵심 질문:
밖에 있으면 굶고,
안에 들어가면 이름이 바뀌는 세계에서,
사람은 어디에 남아 있을 수 있는가?

반영 내용:
침묵 가장자리, 현관 줄, 분양 주택 루프, 모델하우스 접근로
낡은 주택 관리실 / 폐편의점 뒤, 배수로 침묵 주머니
가짜 귀환로 / 끊긴 광고 산책로, 오픈하우스 상담 데스크
모델하우스 결절 / 가족사진 프레임
상태값/태그, P0 첫 30분, 첫 보스 전후, P1 재방문
Vertical Slice 직접 구현 범위와 후속 보류 범위
```

다음 R01 NPC/지역 작업:

```text
R01 전체 문서 인덱스/정리 완료.
완료 문서:
story/03_regions/r01_document_index_v0_1.md
```

### R01 전체 문서 인덱스/정리

R01 전체 문서 인덱스/정리는 완료되었다.

```text
반영 내용:
R01 최신 기준 문서 목록
스토리팀/기획팀/구현팀 읽는 순서
최신 기준 문서와 보조/이전 참고 문서 분리
더 이상 추가하지 말아야 할 것
R01 잠금 상태
다음 큰 작업 포인터
```

다음 R01 NPC/지역 작업:

```text
R01 NPC 데이터 스키마 적용표 완료.
완료 문서:
story/03_regions/r01_npc_data_schema_application_v0_1.md
```

### R01 NPC 데이터 스키마 적용표

R01 NPC 데이터 스키마 적용표는 완료되었다.

```text
반영 내용:
R01 NPC 12명 npc_id 잠금
npc_type / 구현 묶음 / Vertical Slice 우선순위 정리
직접 대면 / 음성 잔향 / 오브젝트 흔적 / 보스 후 잔향 / P1 보류 분리
최소 choice_flags / dialogue_refs / name_policy 적용
R01 안에서 새 NPC 추가 금지 재확인
```

다음 NPC 작업:

```text
E01 R02/R03/R04/R08 보조 NPC 최소안.
```

다음 캐릭터 작업:

```text
플레이어블 20인 로스터 설계도 완료.
완료 문서:
story/06_characters/playable_20_roster_blueprint_v0_1.md
```

### 플레이어블 20인 로스터 설계도

플레이어블 20인 로스터 설계도는 완료되었다.

```text
잠금:
1번 윤서
2번 PATCH 확정
3번 OPEN-HOST 후보 예약 / NPC 선등장 후 전환
4번 강하람 / HOLD-04 / 퇴원 보류자
5번 한이루 / RETURN-05 / 반송 수취인
6번 차유건 / METER-06 / 폐충전소 계량자
7번 백여울 / QUIET-07 / 침묵권 피난자
8번 리오 프로필 v1.0 작성 완료 / 중반 해금 보류

설계 기준:
20명 상세 프로필 작성 아님.
20칸 구조 설계.
각 슬롯은 캠페인이 등록하려는 역할, 비트는 절차, 무기 이미지, 정산 루트, HP 0/긴급 인양 차이를 가져야 한다.
R01 NPC 기능을 빼앗지 않는다.
3~7번에는 새 로봇을 넣지 않는다.
```

다음 캐릭터 작업:

```text
PATCH 2번 플레이어블 최종 판정 완료.
완료 문서:
story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md

3~7번 초반 플레이어블 후보 선정 완료.
완료 문서:
story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md

4번 퇴원 보류 환자 상세 결재 완료.
완료 문서:
story/06_characters/discharge_hold_patient_playable_decision_v0_1.md

판정:
조건부 통과

4번 퇴원 보류 환자 보완 문서 완료.
완료 문서:
story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

4번 퇴원 보류 환자 프로필 v1.0 완료.
완료 문서:
story/06_characters/discharge_hold_patient_profile_v1_0.md

이름/코드명/유저 첫 표기:
강하람 / HOLD-04 / 하람, 퇴원 보류자

판정:
통과 / 4번 플레이어블 후보 프로필 v1.0 고정

플레이어블 20인 이름 레지스트리 v0.1 완료.
완료 문서:
story/06_characters/playable_20_name_registry_v0_1.md

반영:
5 한이루 / RETURN-05
6 차유건 / METER-06
7 백여울 / QUIET-07
20 OBS-20 / 본명 보류

5번 반송 수취인 상세 결재 완료.
완료 문서:
story/06_characters/return_recipient_playable_decision_v0_1.md

판정:
조건부 통과

5번 반송 수취인 보완 문서 완료.
완료 문서:
story/06_characters/return_recipient_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

5번 반송 수취인 프로필 v1.0 완료.
완료 문서:
story/06_characters/return_recipient_profile_v1_0.md

이름/코드명/유저 첫 표기:
한이루 / RETURN-05 / 이루, 반송 수취인

판정:
통과 / 5번 플레이어블 후보 프로필 v1.0 고정

후속으로 완료된 작업:
6번 차유건 / METER-06 / 폐충전소 계량자 상세 결재.

6번 폐충전소 계량자 상세 결재 완료.
완료 문서:
story/06_characters/meter_06_playable_decision_v0_1.md

판정:
조건부 통과

조건:
전기 마법사/엔지니어/충전 버퍼화 금지.
계량기, 충전 케이블, 차단기, 과금 미터, 전력 사용량 영수증 중심.
HP 0은 계량 초과와 충전 차단으로 차별화.
R04는 R04-L01~L02까지만 열고 R04-L03~L05는 보류.

다음:
6번 차유건 / METER-06 / 폐충전소 계량자 조건부 해소 문서.

6번 폐충전소 계량자 보완 문서 완료.
완료 문서:
story/06_characters/meter_06_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

조건:
PATCH는 자기 몸을 부품처럼 써온 보급소 수리 로봇.
유건은 계량당하는 인간, 충전량/사용량/차단 기준을 비트는 사람.
리오의 정품 복구 공포와 R04-L05 재동기화 코어는 보류.
정품 충전 도크는 위험 이미지로만 제한.

다음:
METER-06 프로필 v1.0.
```

```text
6번 폐충전소 계량자 프로필 v1.0 완료.
완료 문서:
story/06_characters/meter_06_profile_v1_0.md

판정:
통과 / 6번 플레이어블 후보 프로필 v1.0 고정

후속으로 완료된 작업:
7번 백여울 / QUIET-07 / 침묵권 피난자 상세 결재.
```

```text
7번 침묵권 피난자 상세 결재 완료.
완료 문서:
story/06_characters/quiet_07_playable_decision_v0_1.md

판정:
조건부 통과

후속으로 완료된 작업:
7번 침묵권 피난자 보완 문서.
```

```text
7번 침묵권 피난자 보완 문서 완료.
완료 문서:
story/06_characters/quiet_07_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

후속으로 완료된 작업:
7번 침묵권 피난자 프로필 v1.0.
```

```text
7번 침묵권 피난자 프로필 v1.0 완료.
완료 문서:
story/06_characters/quiet_07_profile_v1_0.md

이름/코드명/유저 첫 표기:
백여울 / QUIET-07 / 여울, 침묵권 피난자

판정:
통과 / 7번 플레이어블 후보 프로필 v1.0 고정

후속으로 완료된 작업:
8번 리오 플레이어블 잠금 재검토.
```

```text
8번 리오 플레이어블 잠금 재검토 완료.
완료 문서:
story/06_characters/rio_08_playable_lock_review_v0_1.md

판정:
조건부 통과 / 8번 슬롯 유지 / 직접 해금은 중반 체류·숙박권까지 보류

잠금:
리오는 R01 출신이 아니라 E08_C01 체류·숙박 캠페인권의 탈정품 객실 정리 로봇.
VAC-0는 R01 흔적 청소 NPC로 유지.
PATCH는 2번 보급소 수리 로봇으로 유지.
HP 0은 정품 복구/객실 초기화/체크아웃 처리/청소 완료 상태 직전 인양으로 차별화한다.

후속으로 완료된 작업:
리오 / RIO-08 조건부 해소 문서.
```

```text
리오 / RIO-08 조건부 해소 문서 완료.
완료 문서:
story/06_characters/rio_08_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

잠금:
VAC-0는 R01 빈 집 내부 홈케어 장치 / 흔적 삭제 / 초반 NPC.
리오는 체류·숙박 캠페인권 객실 정리 로봇 / 비어 있지 않은 방을 비어 있다고 정리하지 않기로 한 후보.
PATCH는 자기 몸을 부품처럼 써온 보급소 수리 로봇.
리오는 객실 초기화/정품 복구/체크아웃 절차를 거부하는 정리 로봇.
핵심 문장은 "그 방은 비어 있지 않았습니다."

후속으로 완료된 작업:
RIO-08 프로필 v1.0.
```

```text
RIO-08 프로필 v1.0 완료.
완료 문서:
story/06_characters/rio_08_profile_v1_0.md

이름/코드명/유저 첫 표기:
리오 / RIO-08 / 리오, 객실 정리 로봇

판정:
통과 / 8번 플레이어블 후보 프로필 v1.0 고정

잠금:
E01 초반 합류가 아니라 중반 체류·숙박 캠페인권에서 직접 해금.
8번 슬롯은 초반 8명이 아니라 20인 로스터의 8번 잠금 슬롯.
VAC-0는 R01 빈집 홈케어 NPC / 흔적 삭제 / 초반 NPC.
PATCH는 보급소 수리 로봇 / 자기 몸을 부품처럼 써온 로봇.
RIO-08은 객실 정리 로봇 / 체크아웃과 정품 복구 절차를 거부한 로봇.
핵심 문장은 "그 방은 비어 있지 않았습니다."

다음:
9~12번 중반 후보군 선정 완료.
다음은 9번 후보 상세 결재.
```

```text
9~12번 중반 플레이어블 후보군 선정 완료.
완료 문서:
story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md

선정:
9 Mika Arakawa / GATE-09 / 미카, 막차 환승 심사자
10 Nora Weiss / BROAD-10 / 노라, 공영 안내 수신자
11 Mara Kincaid / CLAUSE-11 / 마라, 대형마트 약관 회원
12 Rafaela Costa / LEDGER-12 / 라파, 항만시장 태그 중개자

판정:
통과 / 9~12번 후보군 선정

영웅 생성 프롬프트 v0.1 작성 완료.
완료 문서:
docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md

용도:
20명 전체 로스터 재작성용이 아니라, 슬롯 하나를 상세 결재/프로필 v1.0으로 밀기 위한 복붙용 프롬프트.

NPC 제작팀 프롬프트 v0.1 작성 완료.
완료 문서:
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md

용도:
NPC 후보를 빠르게 뽑고, 직접 대면/잔향/오브젝트/배경으로 자른 뒤 통과 후보만 상세화하기 위한 제작팀 전달 프롬프트.

다음:
9번 후보 상세 결재.
```

### 8번 후보: 리오

리오는 초반 두 번째 주인공이 아니다.

```text
출시 위치:
8번째 플레이어블 후보

출신:
E08_C01 관광숙박 거주권 또는 체류/숙박 캠페인권

유형:
객실 정리 로봇

핵심:
그 방은 비어 있지 않았습니다.
```

리오 잠금:

```text
R01 출신으로 만들지 않는다.
윤서 보조 마스코트로 만들지 않는다.
인간이 되고 싶은 로봇으로 만들지 않는다.
정품 복구가 죽음보다 불편하게 느껴져야 한다.
```

리오의 기능:

```text
유저가 여러 캠페인권을 이해한 뒤,
"이 세계가 한 지역 문제가 아니었구나"를 체감시키는 확장 주인공.
```

---

## 4. 다음 플레이어블에서 채택할 기준

새 플레이어블은 반드시 아래 질문에 답해야 한다.

```text
1. 이 캐릭터는 왜 아직 캠페인 환경에 완전히 흡수되지 않았는가?
2. 캠페인은 이 캐릭터를 무엇으로 등록하려 하는가?
3. 이 캐릭터는 어떤 절차를 끊거나 비트는가?
4. 이 캐릭터의 무기 이미지는 세계관에서 무엇을 뒤집은 것인가?
5. 이 캐릭터가 여는 정산 루트는 무엇인가?
6. HP 0/긴급 인양은 윤서/리오와 어떻게 다른가?
7. 이 캐릭터가 강해질수록 어떤 위험이 커지는가?
8. 유저가 왜 이 캐릭터를 갖고 싶어지는가?
```

좋은 플레이어블 축:

```text
의료 캠페인의 퇴원 거부 환자
검역 게이트에서 사람을 통과시키던 전직 심사자
태그 브로커 출신 협력자
방송 신호를 역이용하는 수신자
멤버십 약관을 무기처럼 쓰는 현실주의자
캠페인화 인간 출신의 균열 고객
정품 인증을 거부한 서비스 장치
가족 슬롯을 이용해 살아남은 입주자
```

나쁜 플레이어블 축:

```text
총잡이
힐러
탱커
마법사
귀여운 로봇
냉소적인 생존자
정의로운 저항군
섹시한 과금 캐릭터
```

직업명은 출발점일 수 있지만 결론이면 안 된다.

---

## 5. 초반 3~7번째 주인공 후보의 방향

PATCH를 2번 플레이어블로 잠그고 리오를 8번 후보로 보류한 뒤, 초반 3~7번째 주인공 후보 선정은 완료되었다.

완료 문서:

```text
story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md
```

선정 결과:

```text
3 OPEN-HOST / R01 / NPC 선등장 후 전환
4 강하람 / HOLD-04 / R02 의료·보험 / 프로필 v1.0 완료
5 한이루 / RETURN-05 / R03 물류·반품 / 반송 수취인 / 프로필 v1.0 완료
6 차유건 / METER-06 / R04 정품·충전·산업 / 폐충전소 계량자
7 백여울 / QUIET-07 / R08 비상보급·대피 / 침묵권 피난자
```

선정 기준:

```text
R01과 침묵 보급소에서 바로 이해 가능한 인물
윤서와 다른 전투 리듬을 가진 인물
유저가 "캠페인이 사람을 죽이는 게 아니라 역할로 묶는구나"를 더 잘 이해하게 만드는 인물
보급소의 작고 취약한 감각을 무너뜨리지 않는 인물
각자 다른 캠페인 등록 방식과 정산 루트를 가진 인물
```

운영 잠금:

```text
OPEN-HOST는 3번 후보로 번호를 예약하되 NPC 선등장 후 전환한다.
3~7번에는 새 로봇을 넣지 않는다.
R04는 폐충전소 계량자로 열어 PATCH/리오와 로봇 과밀을 피한다.
4번 퇴원 보류 환자는 강하람/HOLD-04 프로필 v1.0으로 고정했다.
5번, 6번, 7번 이름/코드명은 프로필 v1.0으로 고정했다.
5번 반송 수취인 상세 결재는 조건부 통과했다.
5번 반송 수취인 보완 문서에서 통과로 승격 가능 판정을 받았다.
5번 반송 수취인 프로필 v1.0은 한이루/RETURN-05로 작성 완료했다.
6번 폐충전소 계량자 상세 결재는 조건부 통과했다.
6번 폐충전소 계량자 보완 문서에서 통과로 승격 가능 판정을 받았다.
6번 폐충전소 계량자 프로필 v1.0은 차유건/METER-06으로 작성 완료했다.
7번 백여울 / QUIET-07 / 침묵권 피난자 상세 결재는 조건부 통과했다.
7번 침묵권 피난자 보완 문서에서 통과로 승격 가능 판정을 받았다.
7번 침묵권 피난자 프로필 v1.0은 백여울/QUIET-07로 작성 완료했다.
다음 상세화 대상은 9번 후보 상세 결재이다.
```

주의:

```text
초반 3~7번째 캐릭터가 세계를 너무 넓히면 R01의 힘이 흐려진다.
초반 캐릭터는 새 대륙보다, 첫 보급소와 첫 캠페인을 깊게 만드는 쪽이 좋다.
퇴원 보류 환자는 힐러가 아니라 퇴원/재입원/심사 보류 절차를 비트는 후보여야 하며, R02-L01~L03 범위를 넘기지 않는다.
반송 수취인은 윤서의 반품 도장과 겹치지 않게 주소/배송 방향으로 분리한다.
침묵권 피난자는 저항군이나 탱커가 아니다.
```

---

## 6. NPC에서 채택할 기준

NPC는 긴 설정 설명자가 아니다.

```text
NPC는 플레이어가 회수한 흔적, 보스 선택, 인간 안정도, 로봇 자율성, 캠페인 농도에 반응하는 거점의 얼굴이다.
```

초기 NPC 5명의 기능:

| 이름 | 구분 | 담당 시설 | 기능 | 위험/결함 |
|---|---|---|---|---|
| 미나 | 인간 | 정산 카운터 | 회수물 정산, 태그 배분, 보관/소모 선택 | 정산표가 맞으면 보급소가 버틴다고 믿는다 |
| 장도윤 | 인간 | 정비 벤치 | 무기/역송출 강화 | 위험한 신호도 통제할 수 있다고 믿는다 |
| 팝시 | 해방 로봇 | 충전 스탠드 | 카드 리롤, 로봇 이벤트 | 귀여우면 버려지지 않을 것이라 믿는다 |
| 세븐 | 해방 로봇 | 출격 게시판/카탈로그 벽 | 지역 정보, 도감 | 기록이 충분하면 의도도 판정할 수 있다고 믿는다 |
| 복희 | 인간 | 이름 보관함 | 흔적 감정, 기억 보존 | 이름을 적어두면 사라지지 않는다고 믿고 싶어 한다 |

새 NPC 필수 질문:

```text
1. 어떤 시설 또는 기존 기능에 붙는가?
2. 어떤 상태값에 반응하는가?
3. 무엇을 잘못 믿는가?
4. 인구가 늘거나 줄 때 어떤 입장이 되는가?
5. 로봇 자율성이 높거나 낮을 때 어떻게 흔들리는가?
6. 캠페인 농도가 높아지면 무엇을 숨기거나, 공개하거나, 오해하는가?
7. NPC가 플레이어블이 아니라 NPC여야 하는 이유는 무엇인가?
```

NPC 대사 원칙:

```text
길게 설명하지 않는다.
런 전후 한 줄로 상태를 찌른다.
설정 설명보다 플레이어가 이미 한 일을 비춘다.
```

---

## 7. 버릴 기준과 금지 방향

아래 방향은 새 초안에서 바로 경고한다.

```text
캐릭터를 단순 직업/속성으로 만든다.
모든 캐릭터를 선한 저항군으로 만든다.
모든 캐릭터를 캠페인 파괴자로 만든다.
모든 로봇을 순수하고 귀여운 존재로 만든다.
모든 캠페인화 인간을 조종당한 껍데기로 만든다.
해방을 무조건 구원으로 처리한다.
유료 캐릭터에 핵심 세계 이해를 인질로 잡는다.
태그를 돈/골드/재화처럼 단순화한다.
HP 0을 사망/부활/리스폰으로 쓴다.
NPC가 세계관을 장문으로 설명한다.
초반부터 보급소를 큰 마을이나 거대한 조직처럼 만든다.
```

---

## 8. 다음 작업 순서

추천 순서:

```text
1. 9번 후보 상세 결재를 진행한다.
2. 1~8번 확정/프로필 완료 슬롯은 흔들지 않는다.
3. 리오 8번 슬롯은 유지하되 직접 해금은 중반 체류·숙박권까지 보류한다.
4. 9~12번은 후보군 선정 완료 상태이며, 9번부터 한 명씩 상세 결재한다.
5. 리오 이후 로봇 과밀이 생기지 않게 인간/캠페인화 인간/브로커/예외 존재 비율을 본다.
6. 3번 OPEN-HOST는 상세 프로필보다 R01 NPC 선등장 후 전환 조건과 기능 보존을 점검한다.
7. 그 다음 시즌 1 큰 줄거리 잠금으로 넘어간다.
8. 별도로 보급소 NPC/지역 NPC 로스터를 만든다.
```

한 번에 하면 안 되는 것:

```text
20명 전체 상세 프로필 작성
NPC 30명을 이름만 나열
플레이어블/NPC/보스/상인 역할을 섞어서 처리
```

이 프로젝트는 캐릭터 아이디어 수가 아니라, 각 캐릭터가 캠페인을 다르게 읽는 힘으로 가야 한다.
