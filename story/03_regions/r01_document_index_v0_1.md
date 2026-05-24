# R01 전체 문서 인덱스/정리 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

목적:
R01 관련 문서가 많아졌으므로, 스토리팀/기획팀/구현팀이 어떤 순서로 읽어야 하는지 잠근다.

작업 성격:
새 설정 추가 아님.
새 NPC 추가 아님.
R01 확장 아님.
문서 체계 잠금.

다음 작업 포인터:
E01 R02/R03/R04/R08 보조 NPC 최소안
이후 큰 작업:
시즌 1 큰 줄거리 잠금
```

---

## 0. 결론

R01은 아래 기준으로 잠긴다.

```text
지역:
R01 / 서부 스마일홈
가족·주거·오픈하우스 캠페인

핵심 질문:
밖에 있으면 굶고,
안에 들어가면 이름이 바뀌는 세계에서,
사람은 어디에 남아 있을 수 있는가?

보스:
스마일 홈 가족심사 관리자
지역 광고 약관 / 가족 심사 절차의 얼굴

NPC:
12명 기준 잠금
새 NPC 추가 금지
```

이 문서는 R01의 새 내용을 만들지 않는다. 이미 작성된 문서의 읽는 순서와 우선순위만 정리한다.

---

## 1. R01 잠금 상태

| 항목 | 상태 | 최신 기준 문서 |
| --- | --- | --- |
| 지역 본문 | 정리 완료 | `story/03_regions/r01_suburb.md` |
| 보스 본문 | 정리 완료 | `story/03_regions/r01_boss.md` |
| NPC 12명 로스터 | 상세화 완료 | `story/03_regions/r01_campaign1_npc_roster_v0_1.md` |
| 본명/이름 조각 | 확정/해금 조건 정리 완료 | `story/03_regions/r01_npc_name_registry_v1_0.md`, `story/03_regions/r01_npc_name_reveal_matrix_v0_1.md` |
| 선택 후폭풍 | NPC별 매트릭스 완료 | `story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md` |
| 보스 전후 상태 | 시간축 정리 완료 | `story/03_regions/r01_boss_before_after_npc_state_v0_1.md` |
| P1 분기 | 개방 순서와 상태값 루트 완료 | `story/03_regions/r01_p1_npc_branch_map_v0_1.md` |
| 상태값 | 통합 매트릭스 완료 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` |
| 대사 | 조건 대사 은행 완료 | `story/03_regions/r01_npc_dialogue_bank_v0_1.md` |
| 데이터 구조 | 구현 스키마 초안 완료 | `story/03_regions/r01_npc_data_schema_draft_v0_1.md` |
| 데이터 적용 | 구현 스키마 적용표 완료 | `story/03_regions/r01_npc_data_schema_application_v0_1.md` |
| Vertical Slice | 구현 범위 정리 완료 | `story/03_regions/r01_vertical_slice_npc_scope_v0_1.md` |
| Vertical Slice 구현 목록 | 씬/오브젝트/대사 수/플래그 컷 완료 | `story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md` |
| 작업 포인터 | 다음 작업 정리 완료 | `story/03_regions/r01_remaining_work_list_v0_1.md` |

---

## 2. 읽는 순서

### 2.1 지역 이해

| 순서 | 문서 | 읽는 이유 |
| ---: | --- | --- |
| 1 | `story/03_regions/r01_document_index_v0_1.md` | 지금 읽는 문서. R01 문서 체계의 입구다. |
| 2 | `story/03_regions/r01_suburb.md` | R01을 서부 스마일홈 / 가족·주거·오픈하우스 캠페인 지역으로 이해한다. |
| 3 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` | 지역 압력이 어떤 상태값과 태그로 읽히는지 확인한다. |

지역 이해 단계에서 확정할 것:

- R01은 단순 폐주택가가 아니다.
- R01은 가족, 주거, 입주, 오픈하우스, 이름, 주소, 태그가 사람을 묶는 지역이다.
- P0 첫 30분, 첫 보스 전후, P1 재방문은 한 지역의 시간축이다.

### 2.2 보스 이해

| 순서 | 문서 | 읽는 이유 |
| ---: | --- | --- |
| 1 | `story/03_regions/r01_boss.md` | 스마일 홈 가족심사 관리자 본문 기준이다. |
| 2 | `story/03_regions/r01_boss_npc_links_v0_1.md` | 보스 패턴과 NPC 연결을 확인한다. |
| 3 | `story/03_regions/r01_boss_before_after_npc_state_v0_1.md` | 보스 전후 NPC 상태 변화와 후폭풍을 시간축으로 본다. |

보스 이해 단계에서 확정할 것:

- 보스는 죽이는 적이 아니라 지역 광고 약관과 가족 심사 절차의 얼굴이다.
- DINING-4, WELCOME-DESK, OPEN-HOST는 보스 진입 전 압박을 각각 다른 방식으로 담당한다.
- FRAME-LEFT는 보스 후 가족사진 프레임의 프로필 잔향이다.

### 2.3 NPC 로스터

| 순서 | 문서 | 읽는 이유 |
| ---: | --- | --- |
| 1 | `story/03_regions/r01_campaign1_npc_roster_v0_1.md` | NPC 12명의 위치, 역할, 오판, 기능을 한 번에 본다. |
| 2 | `story/03_regions/r01_npc_name_registry_v1_0.md` | 본명/코드명/역할명 잠금 기준을 본다. |
| 3 | `story/03_regions/r01_npc_name_reveal_matrix_v0_1.md` | 이름 해금이 언제, 누구를 통해, 어떤 위험과 함께 열리는지 본다. |

NPC 로스터 단계에서 확정할 것:

- R01 NPC는 12명으로 잠근다.
- MAIL-LOOP와 VAC-0에는 사람 본명을 붙이지 않는다.
- FRAME-LEFT는 full name보다 이름 조각과 프로필 잔향을 먼저 다룬다.

### 2.4 상태값/선택 분기

| 순서 | 문서 | 읽는 이유 |
| ---: | --- | --- |
| 1 | `story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md` | NPC별 선택지, 상태값 변화, 다른 NPC 반응, 대가를 본다. |
| 2 | `story/03_regions/r01_porch_line_room_12_revisit_branch_v0_1.md` | ROOM-12의 자리와 PORCH-LINE의 줄이 겹치지 않는지 확인한다. |
| 3 | `story/03_regions/r01_p1_npc_branch_map_v0_1.md` | P1 재방문 NPC 개방 순서와 루트 개폐를 본다. |
| 4 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` | 선택 분기가 상태값 조합으로 어떻게 누적되는지 확인한다. |

상태값/선택 분기 단계에서 확정할 것:

- 좋은 선택 하나로 모든 문제가 해결되지 않는다.
- 이름 해금은 구원 완료가 아니라 위험이 붙는 조건 변화다.
- 낮음/높음은 선악 판정이 아니라 생활/윤리/절차 압력의 방향이다.

### 2.5 대사/데이터 스키마

| 순서 | 문서 | 읽는 이유 |
| ---: | --- | --- |
| 1 | `story/03_regions/r01_npc_dialogue_bank_v0_1.md` | NPC / 조건 / 대사 / 용도 구조의 조건 대사를 본다. |
| 2 | `story/03_regions/r01_npc_data_schema_draft_v0_1.md` | npc_id, npc_type, choice_flags, dialogue_refs 등 구현 필드로 옮긴다. |
| 3 | `story/03_regions/r01_npc_data_schema_application_v0_1.md` | 스키마 초안과 Vertical Slice 구현 목록을 합친 적용표를 본다. |
| 4 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` | 대사 조건과 상태값 키가 맞는지 다시 대조한다. |

대사/데이터 단계에서 확정할 것:

- 대사는 장문 설명이 아니라 런 전후 한 줄 반응 중심이다.
- `dialogue_refs`는 대사 은행의 조건과 연결한다.
- 구현 데이터가 문학 설정을 잃지 않되, 새 설정을 덧붙이지 않는다.

### 2.6 Vertical Slice 구현 범위

| 순서 | 문서 | 읽는 이유 |
| ---: | --- | --- |
| 1 | `story/03_regions/r01_vertical_slice_npc_scope_v0_1.md` | 직접 대면, 음성/잔향, 오브젝트 흔적, 선택 플래그, 후속 보류 범위를 본다. |
| 2 | `story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md` | NPC별 구현 등급, 첫 노출 위치, 씬/오브젝트, 대사 수, 플래그를 확인한다. |
| 3 | `story/03_regions/r01_suburb.md` | 지역 본문 안의 구현 우선순위와 구역별 노출을 대조한다. |
| 4 | `story/03_regions/r01_boss.md` | 보스 관련 실제 구현 범위와 후속 보류 범위를 확인한다. |
| 5 | `story/03_regions/r01_npc_data_schema_draft_v0_1.md` | 최소 구현 데이터 필드와 플래그 이름을 확인한다. |

Vertical Slice 단계에서 확정할 것:

- 12명 전원을 직접 등장시키지 않는다.
- P1 NPC는 대부분 흔적 선노출/후속 보류로 둔다.
- R01의 핵심 질문이 최소 구현에서도 살아야 한다.

---

## 3. 팀별 빠른 읽기 경로

### 스토리팀

| 순서 | 문서 |
| ---: | --- |
| 1 | `story/03_regions/r01_suburb.md` |
| 2 | `story/03_regions/r01_boss.md` |
| 3 | `story/03_regions/r01_campaign1_npc_roster_v0_1.md` |
| 4 | `story/03_regions/r01_npc_name_registry_v1_0.md` |
| 5 | `story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md` |
| 6 | `story/03_regions/r01_boss_before_after_npc_state_v0_1.md` |
| 7 | `story/03_regions/r01_npc_dialogue_bank_v0_1.md` |

스토리팀은 인물의 말투보다 먼저 역할의 차이를 본다. 특히 ROOM-12/DINING-4, OPEN-HOST/WELCOME-DESK는 섞으면 안 된다.

### 기획팀

| 순서 | 문서 |
| ---: | --- |
| 1 | `story/03_regions/r01_suburb.md` |
| 2 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` |
| 3 | `story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md` |
| 4 | `story/03_regions/r01_p1_npc_branch_map_v0_1.md` |
| 5 | `story/03_regions/r01_vertical_slice_npc_scope_v0_1.md` |
| 6 | `story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md` |
| 7 | `story/03_regions/r01_remaining_work_list_v0_1.md` |

기획팀은 상태값을 RPG 능력치처럼 쓰지 않는다. 상태값은 R01의 생활, 윤리, 절차 압력을 읽히게 하는 장치다.

### 구현팀

| 순서 | 문서 |
| ---: | --- |
| 1 | `story/03_regions/r01_npc_data_schema_draft_v0_1.md` |
| 2 | `story/03_regions/r01_npc_data_schema_application_v0_1.md` |
| 3 | `story/03_regions/r01_npc_dialogue_bank_v0_1.md` |
| 4 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` |
| 5 | `story/03_regions/r01_vertical_slice_npc_scope_v0_1.md` |
| 6 | `story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md` |
| 7 | `story/03_regions/r01_boss.md` |
| 8 | `story/03_regions/r01_suburb.md` |

구현팀은 스키마와 대사 조건을 먼저 보고, 지역/보스 문서로 연출 의도를 확인한다.

---

## 4. 최신 기준으로 볼 문서

| 구분 | 문서 | 기준 역할 |
| --- | --- | --- |
| 인덱스 | `story/03_regions/r01_document_index_v0_1.md` | R01 문서 읽는 순서와 우선순위 |
| 지역 본문 | `story/03_regions/r01_suburb.md` | R01 지역 최신 본문 |
| 보스 본문 | `story/03_regions/r01_boss.md` | 첫 보스 최신 본문 |
| NPC 로스터 | `story/03_regions/r01_campaign1_npc_roster_v0_1.md` | NPC 12명 기준 |
| 이름 기준 | `story/03_regions/r01_npc_name_registry_v1_0.md` | 본명/역할명 최신 기준 |
| 이름 해금 | `story/03_regions/r01_npc_name_reveal_matrix_v0_1.md` | 이름 해금 조건 |
| 선택 후폭풍 | `story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md` | NPC별 선택 결과 |
| 보스 전후 | `story/03_regions/r01_boss_before_after_npc_state_v0_1.md` | 시간축별 NPC 상태 |
| 보스 연결 | `story/03_regions/r01_boss_npc_links_v0_1.md` | 보스 패턴과 NPC 연결 |
| ROOM-12/PORCH-LINE | `story/03_regions/r01_porch_line_room_12_revisit_branch_v0_1.md` | 자리와 줄의 재방문 분리 |
| P1 맵 | `story/03_regions/r01_p1_npc_branch_map_v0_1.md` | P1 NPC 개방 순서 |
| 상태값 | `story/03_regions/r01_state_value_npc_reaction_matrix_v0_1.md` | 상태값 정의와 NPC 반응 |
| 대사 | `story/03_regions/r01_npc_dialogue_bank_v0_1.md` | 조건 대사 은행 |
| 데이터 | `story/03_regions/r01_npc_data_schema_draft_v0_1.md` | 구현 스키마 초안 |
| 데이터 적용 | `story/03_regions/r01_npc_data_schema_application_v0_1.md` | 스키마 초안과 Vertical Slice 구현 목록을 합친 적용표 |
| 구현 범위 | `story/03_regions/r01_vertical_slice_npc_scope_v0_1.md` | Vertical Slice 범위 |
| 구현 목록 | `story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md` | NPC별 씬/오브젝트/플래그 컷 |
| 작업 관리 | `story/03_regions/r01_remaining_work_list_v0_1.md` | 남은 작업과 다음 포인터 |
| 전달 메모 | `story/03_regions/r01_npc_story_team_transfer_note_v0_1.md` | 스토리팀 전달 요약 |

---

## 5. 보조/이전 참고 문서

| 구분 | 문서 | 사용 방식 |
| --- | --- | --- |
| 이전 이름 후보 | `story/03_regions/r01_npc_name_registry_v0_1.md` | 이름 변천 확인용. 최신 이름 기준은 v1.0을 따른다. |
| NPC별 드라마 초안 | `story/03_regions/*_npc_drama_draft_v0_1.md` | 각 NPC의 감정 원전 확인용. 최신 분기/상태값보다 우선하지 않는다. |
| NPC별 프로필 | `story/03_regions/*_npc_profile_v1_0.md` | 첫 등장, 말투, 관계선 확인용. 구현 필드는 데이터 스키마를 따른다. |
| 작업 중 상세 메모 | 과거 작업 프롬프트/전달 메모 | 맥락 확인용. 최신 문서와 충돌하면 최신 문서를 따른다. |

보조 문서는 버리는 문서가 아니다. 다만 R01 전체 기준을 결정할 때는 최신 기준 문서가 우선한다.

---

## 6. 충돌 시 우선순위

문서 사이에 표현이 다르면 아래 순서로 판단한다.

| 우선순위 | 문서군 | 이유 |
| ---: | --- | --- |
| 1 | `r01_document_index_v0_1.md` | 읽는 순서와 문서 우선순위 기준 |
| 2 | `r01_suburb.md`, `r01_boss.md` | 지역/보스 본문 최신 기준 |
| 3 | `r01_campaign1_npc_roster_v0_1.md`, `r01_npc_name_registry_v1_0.md` | NPC 12명과 이름 기준 |
| 4 | 상태값/선택/보스 전후/P1 매트릭스 문서 | 분기와 조건 해석 |
| 5 | `r01_npc_dialogue_bank_v0_1.md`, `r01_npc_data_schema_draft_v0_1.md`, `r01_npc_data_schema_application_v0_1.md` | 구현 전달용 대사/필드/적용표 |
| 6 | NPC별 드라마 초안/프로필 | 감정 원전과 말투 참고 |

예외:

- 데이터 필드명은 `r01_npc_data_schema_draft_v0_1.md`를 우선한다.
- Vertical Slice 실제 구현 묶음과 최소 플래그는 `r01_npc_data_schema_application_v0_1.md`를 우선한다.
- 실제 출력 대사는 `r01_npc_dialogue_bank_v0_1.md`를 우선한다.
- 지역 구역명과 보스 명칭은 `r01_suburb.md`, `r01_boss.md`를 우선한다.

---

## 7. 더 이상 추가하지 말아야 할 것

R01은 지금부터 확장보다 잠금 단계다.

```text
금지:
새 NPC 추가.
새 구역 추가.
보스 정체 변경.
ROOM-12와 DINING-4 중복화.
OPEN-HOST와 WELCOME-DESK 혼합.
MAIL-LOOP와 VAC-0에 사람 본명 부여.
FRAME-LEFT를 사진 속 유령으로 변경.
DRAIN-MARK와 SIGN-BACK을 P0 해결형 서브퀘스트로 당기기.
상태값을 RPG 능력치처럼 단순화하기.
```

특히 아래 분리는 유지한다.

| 구분 | 유지할 차이 |
| --- | --- |
| ROOM-12 | 식량태그/거주태그/가족대표 접근권의 문제 |
| DINING-4 | 첫 보스 전 빈 가족 칸의 얼굴 |
| OPEN-HOST | 입구 안내와 덜 나쁜 동선 |
| WELCOME-DESK | 상담 절차 내부의 질문 보류 |
| MAIL-LOOP | 주소와 수신태그의 잔향 |
| NAME-PAINTER | 이름과 문패가 귀속 신호가 되는 문제 |
| KEY-RING | 열쇠가 있어도 열어도 되는지는 별도라는 문제 |
| DRAIN-MARK | 안전하지 않은 자유와 침묵권 |
| SIGN-BACK | 가짜 귀환로와 진짜 인양의 구분 |
| FRAME-LEFT | 보스 후 가족사진 프레임의 프로필 잔향 |

---

## 8. 다음 큰 작업

R01 문서 체계는 잠긴 것으로 본다.

다음 큰 작업:

```text
1. E01 R02/R03/R04/R08 보조 NPC 최소안
2. 시즌 1 큰 줄거리 잠금
```

바로 다음 작업 포인터는 **E01 R02/R03/R04/R08 보조 NPC 최소안**으로 넘긴다.

이유:

- R01 NPC 12명은 이미 상세화되었다.
- R01 지역/보스/상태값/대사/Vertical Slice 범위와 구현 목록도 정리되었다.
- R01 NPC 데이터 스키마 적용표도 작성되었다.
- 이제 R01 안에서 새 NPC를 더 늘리지 않고, E01의 다른 지역 보조 NPC를 최소 수량으로 자른다.

---

## 9. 최종 요약

```text
R01은 이제 새 설정을 더 얹는 단계가 아니다.

이 인덱스를 입구로 삼고,
r01_suburb.md와 r01_boss.md를 본문 기준으로 삼고,
NPC 로스터/상태값/선택/대사/스키마/Vertical Slice 문서를 목적별로 읽는다.

다음 작업은 E01 R02/R03/R04/R08 보조 NPC 최소안이다.
```
