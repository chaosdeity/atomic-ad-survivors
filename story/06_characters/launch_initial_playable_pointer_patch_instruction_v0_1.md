# 출시 초기 플레이어블 포인터 보정 지시서 v0.1

## 문서 상태

- 상태: 작성 완료
- 문서 성격: 포인터 보정 지시서
- 작성 범위: 기존 로스터, 이름 레지스트리, 캐릭터 컨텍스트, 제작 프롬프트의 과거 포인터 보정 방향 지정
- 금지 범위: 새 프로필 v1.0 작성, 상세 결재 시작, 새 플레이어블 추가, PATCH +1 확정, OPEN-HOST U5 확정, 한국인 후보 추가, 미개방 캠페인 후보 진행
- 상위 기준: `launch_initial_playable_structure_lock_v0_1.md`
- 선행 검수: `launch_initial_playable_pointer_consistency_review_v0_1.md`

## 0. 목적

이 문서는 기존 문서 본문을 대량 수정하는 문서가 아니다. 다음 보정 작업자가 어떤 문구를 어떤 기준으로 고쳐야 하는지 잠그는 지시서다.

현재 문제는 캐릭터 산출물이 너무 많다는 것이 아니라, 산출 번호와 출시 초기 해금 상태가 섞여 보이는 것이다. 따라서 보정은 삭제보다 분리와 재명명 중심으로 진행한다.

핵심 보정 문장:

- PATCH는 `PATCH-02 legacy_code 보존 / 출시 초기 +1 확정 아님 / U1~U4 보류`로 쓴다.
- OPEN-HOST는 `NPC 선등장 / 출시 초기 U5 전환 금지`로 쓴다.
- HOLD/RETURN/METER/QUIET는 `프로필 산출물 보존 / 출시 후 보류`로 쓴다.
- GATE/BROAD/CLAUSE/LEDGER/GUARD/MODEL/LOCKOUT/NAME/RATION/LINE/OBS는 캠페인 개방 전 상세 결재 금지로 쓴다.
- `프로필 v1.0 고정`은 기능 산출물 보존이지 출시/해금 확정이 아니다.
- 다음 작업 포인터는 미개방 후보 상세 결재가 아니라 포인터 보정 또는 해금 순번 정합성으로 둔다.

## 1. 보정 대상 표

| 대상 문서 | 문제 문구 유형 | 현재 위험 | 수정 지시 | 우선순위 | 판정 |
|---|---|---|---|---|---|
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | PATCH +1 확정 오해 | `PATCH는 2번 플레이어블`, `윤서 다음 2번째 플레이어블`이 출시 초기 +1 확정처럼 읽힌다 | `PATCH-02 legacy_code 보존`, `출시 초기 +1 확정 아님`, `U1~U4 보류`를 상단과 PATCH 표기에 병기한다 | P0 | 상위 기준 충돌 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | 3~7번 초반 후보 오해 | `초반 1~8번 슬롯`, `3~7번 초반 후보`가 출시 초기 해금처럼 읽힌다 | 3~7은 `프로필 산출 번호 3~7` 또는 `기존 후보 선정 산출물`로 표기하고 출시 초기 상태는 `출시 후 보류`로 둔다 | P0 | 즉시 보정 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | 프로필 v1.0 최종 해금 오해 | HOLD/RETURN/METER/QUIET의 프로필 완료가 곧 해금 완료처럼 보인다 | `프로필 v1.0 작성 완료` 뒤에 `기능 산출물 보존, 출시 초기 해금 아님`을 덧붙인다 | P0 | 즉시 보정 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | legacy_code / unlock_order 혼동 | 1~13 번호가 표에서 해금 순번처럼 보인다 | `profile_output_no`, `legacy_code`, `unlock_order`, `user_display_order` 분리 원칙을 표 위에 재삽입한다 | P0 | 즉시 보정 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | 다음 작업 포인터 오류 | 다음 작업이 아직 `미개방 캠페인 플레이어블 보류 게이트`로 남아 있다 | 완료된 과거 포인터로 표시하고 다음 작업을 `로스터/레지스트리/컨텍스트/프롬프트 포인터 보정` 또는 `해금 순번/UI 노출 순서 분리표 작성`으로 교체한다 | P1 | 즉시 보정 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | PATCH +1 확정 오해 | `2번 PATCH 확정`, `L5 확정`이 출시 초기 U5 합류로 오해될 수 있다 | L5를 `이름/코드/프로필 산출물 잠금`으로 정의하고 PATCH의 launch_status는 `U1~U4 보류`로 별도 표기한다 | P0 | 즉시 보정 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | 한국인 후보 과밀 오해 | HOLD/RETURN/METER/QUIET가 L5 확정으로 나열되어 출시 초기 한국인 추가처럼 보인다 | 네 후보 모두 `한국어권 산출물 보존, 출시 후 보류, 출시 초기 한국인 +1 아님`을 비고에 추가한다 | P0 | 즉시 보정 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | 프로필 v1.0 최종 해금 오해 | 프로필 완료가 이름 확정, 해금 확정, 출시 확정으로 한 덩어리처럼 읽힌다 | `profile_lock_status`와 `launch_status`를 분리한다. 프로필 완료는 해금 확정이 아니라고 명시한다 | P0 | 즉시 보정 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | 다음 작업 포인터 오류 | 보류 게이트가 다음 작업으로 반복된다 | 보류 게이트 완료 이후 기준을 반영하고 포인터를 포인터 보정 또는 해금 순번 정합성으로 교체한다 | P1 | 즉시 보정 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | PATCH +1 확정 오해 | `PATCH는 윤서 다음에 로봇 축을 열 수 있는 초반 2번째 플레이어블로 확정` 문구가 상위 잠금과 충돌한다 | 해당 문구를 `PATCH는 산출물과 legacy_code를 보존하되 출시 초기에는 U1~U4 보류`로 바꾼다 | P0 | 상위 기준 충돌 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | 3~7번 초반 후보 오해 | `초반 3~7번째 후보`가 출시 초기 후보 확정처럼 읽힌다 | `기존 3~7 후보 산출물`로 낮추고 HOLD/RETURN/METER/QUIET는 출시 후 보류라고 명시한다 | P0 | 즉시 보정 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | 한국인 후보 과밀 오해 | E01 한국어권 후보가 계속 누적되는 흐름처럼 보인다 | 출시 초기 한국인 추가 없음, 윤서 단독 U5, PATCH도 U1~U4 보류라는 기준을 컨텍스트 상단에 추가한다 | P0 | 즉시 보정 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | 다음 작업 포인터 오류 | `미개방 캠페인 플레이어블 보류 게이트`가 아직 다음 작업처럼 남아 있다 | 완료된 과거 작업으로 표시하고 다음 포인터를 포인터 보정 또는 해금 순번/UI 노출 순서 분리로 바꾼다 | P1 | 즉시 보정 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | PATCH +1 확정 오해 | `PATCH: 윤서 다음 2번째 플레이어블 확정`, `2번 PATCH 확정`이 제작팀을 다시 과속시킬 수 있다 | `PATCH-02는 legacy_code이며 출시 초기 +1 확정이 아니다. PATCH는 U1~U4 보류`로 프롬프트 상단과 현황 요약을 교체한다 | P0 | 상위 기준 충돌 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 3~7번 초반 후보 오해 | `3~7번 초반 후보 선정 완료`가 새 상세 결재 재개 신호처럼 보인다 | `3~7번은 기존 산출물 보존, 출시 후 보류`로 바꾸고 새 상세 결재 금지를 병기한다 | P0 | 즉시 보정 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 미개방 캠페인 후보 진행 오해 | GATE/BROAD/CLAUSE/LEDGER/GUARD/MODEL 등의 프로필 완료 문구가 다음 슬롯 진행 신호처럼 읽힐 수 있다 | 각 후보는 캠페인 개방 후 재검토이며, 미개방 후보 상세 결재 금지를 상단 금지 규칙으로 올린다 | P0 | 즉시 보정 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | legacy_code / unlock_order 혼동 | 기존 번호가 최종 해금 순번처럼 사용될 수 있다 | 프롬프트 첫머리에 `프로필 산출 번호 != legacy_code != unlock_order != user_display_order`를 고정 문장으로 둔다 | P0 | 즉시 보정 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 다음 작업 포인터 오류 | 다음 작업이 보류 게이트로 남아 있다 | 다음 작업을 미개방 후보 상세 결재가 아니라 포인터 보정 또는 해금 순번 정합성으로 바꾼다 | P1 | 즉시 보정 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | PATCH +1 확정 오해 | `PATCH는 2번 슬롯으로 잠근다`가 출시 초기 합류 확정처럼 보인다 | `PATCH-02 legacy_code 보존. 출시 초기 +1 확정 아님. U1~U4 보류`로 교체한다 | P0 | 상위 기준 충돌 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | OPEN-HOST U5 확정 오해 | `3번 후보 번호 예약`이 출시 초기 전환 가능성으로 오해될 수 있다 | `OPEN-HOST는 NPC 선등장. 출시 초기 U5 전환 금지. 후속 전환 조건부 가능`으로 정리한다 | P0 | 즉시 보정 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 한국인 후보 과밀 오해 | 3~7 한국어권 후보가 초기 주인공 후보로 보인다 | 출시 초기 한국인 후보 추가 금지와 HOLD/RETURN/METER/QUIET 출시 후 보류를 상단 규칙으로 올린다 | P0 | 즉시 보정 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 미개방 캠페인 후보 진행 오해 | 작성 완료된 외부권 산출물이 다음 프로필 진행 신호처럼 보일 수 있다 | 미개방 캠페인은 상세 결재와 프로필 v1.0 진행 금지, 기존 산출물은 기능 산출물 보존으로 정리한다 | P0 | 즉시 보정 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 다음 작업 포인터 오류 | 보류 게이트를 다음 작업으로 반복한다 | 포인터를 포인터 보정 또는 해금 순번/UI 노출 순서 분리로 교체한다 | P1 | 즉시 보정 |
| `docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 프로필 v1.0 최종 해금 오해 | 이미 프로필이 있는 캐릭터 목록이 해금 가능 목록처럼 보일 수 있다 | `프로필 v1.0은 기능 산출물 보존이며 출시/해금 확정이 아니다`를 템플릿 상단에 추가한다 | P1 | 즉시 보정 |
| `docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 미개방 캠페인 후보 진행 오해 | 9번 이후 예시가 다음 상세 결재 재개 신호로 읽힐 수 있다 | 캠페인 개방 전 상세 결재 금지와 열린 캠페인 우선 원칙을 더 앞에 둔다 | P1 | 즉시 보정 |
| `docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 다음 작업 포인터 오류 | 다음 작업이 보류 게이트로 남아 있다 | 포인터를 최신 출시 초기 구조 잠금 이후 작업으로 교체한다 | P1 | 즉시 보정 |
| `story/06_characters/playable_global_npc_link_matrix_v0_1.md` | 프로필 v1.0 최종 해금 오해 | 캐릭터와 NPC 연결표가 해금 순서처럼 읽힐 수 있다 | 직접 보정 전 확인이 필요하다. 연결표는 유지하되 launch_status와 unlock_order 혼동 여부를 별도 점검한다 | P2 | 확인 필요 |
| `story/06_characters/playable_slots_9_to_12_candidate_selection_v0_1.md` | 미개방 캠페인 후보 진행 오해 | 9~12 후보 선정 문서가 이후 상세 결재를 계속 밀어도 된다는 신호로 남을 수 있다 | 완료 산출물로 보존하되 캠페인 개방 후 재검토 기준을 상단에 추가할지 확인한다 | P2 | 확인 필요 |

## 2. 공통 수정 지시

보정 작업자는 아래 문장들을 그대로 기준으로 삼는다.

1. `PATCH는 2번 플레이어블 확정`이라고 쓰지 않는다.
2. `PATCH-02는 legacy_code와 프로필 산출 번호로 보존한다`라고 쓴다.
3. `PATCH는 출시 초기 +1 확정이 아니며 U1~U4 보류다`라고 쓴다.
4. `OPEN-HOST는 출시 초기 U5 전환 금지이며 R01 NPC 선등장을 유지한다`라고 쓴다.
5. `HOLD-04, RETURN-05, METER-06, QUIET-07은 출시 후 보류다`라고 쓴다.
6. `프로필 v1.0 고정`은 `기능 산출물 보존`으로만 해석한다고 쓴다.
7. `기존 번호는 최종 해금 순번이 아니다`를 모든 기준 문서 상단에 둔다.
8. 미개방 캠페인 후보는 캠페인 개방 전 상세 결재와 프로필 작성을 금지한다고 쓴다.
9. 한국어권 임시명은 legacy placeholder로만 보존한다고 쓴다.
10. 다음 작업은 미개방 후보 상세 결재가 아니라 포인터 보정 또는 해금 순번 정합성으로 둔다.

## 3. 치환 지시

아래 치환은 의미 기준이다. 문장을 기계적으로 한 줄 치환하지 말고 문맥에 맞춰 반영한다.

| 기존 표현 | 교체 지시 |
|---|---|
| PATCH는 2번 플레이어블로 확정 | PATCH-02는 legacy_code와 프로필 산출 번호로 보존. 출시 초기 +1 확정 아님 |
| PATCH는 윤서 다음 2번째 플레이어블 | PATCH는 U1~U4 보류. 윤서 단독 U5 시작을 기본값으로 유지 |
| 3~7번 초반 플레이어블 후보 | 3~7번 기존 후보 산출물. 출시 초기 해금 대상 아님 |
| 초반 1~8번 슬롯 | 프로필 산출 번호 1~8. 해금 순번과 별도 |
| OPEN-HOST 3번 후보 | OPEN-HOST는 NPC 선등장. 3번은 산출 번호/후속 전환 검토 번호일 뿐 출시 초기 U5 아님 |
| HOLD/RETURN/METER/QUIET 프로필 v1.0 고정 | 기능 산출물 보존. 출시 후 보류 |
| GATE/BROAD/CLAUSE/LEDGER/GUARD/MODEL 프로필 완료 | 기능 산출물 보존. 캠페인 개방 후 재검토 |
| LOCKOUT-17 프로필 v1.0 | 기능 초안/보류 산출물. 최종 고정 아님 |
| NAME/RATION/LINE/OBS 다음 상세 결재 | 캠페인 개방 전 상세 결재 금지 |
| 다음 작업은 미개방 캠페인 보류 게이트 | 보류 게이트 완료. 다음은 포인터 보정 또는 해금 순번/UI 노출 순서 분리 |

## 4. 보정 순서

1. `playable_20_roster_blueprint_v0_1.md`
2. `playable_20_name_registry_v0_1.md`
3. `character_npc_creation_context_v0_1.md`
4. `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md`
5. `CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md`
6. `HERO_CHARACTER_CREATION_PROMPT_V0_1.md`

이 순서가 중요한 이유는 로스터 설계도와 이름 레지스트리가 먼저 의미를 분리해야, 컨텍스트와 프롬프트가 같은 문구를 반복하지 않기 때문이다.

## 5. 보정 후 필수 확인

보정 작업이 끝난 뒤 아래 항목을 확인한다.

- `PATCH +1 확정`으로 읽히는 문구가 남아 있지 않다.
- `OPEN-HOST U5 확정`으로 읽히는 문구가 남아 있지 않다.
- HOLD/RETURN/METER/QUIET가 출시 초기 해금처럼 읽히지 않는다.
- `프로필 v1.0 고정`이 해금 확정으로 읽히지 않는다.
- 미개방 캠페인 후보가 다음 상세 결재 대상으로 남아 있지 않다.
- `legacy_code`, `profile_output_no`, `unlock_order`, `user_display_order`가 분리되어 있다.
- 다음 작업 포인터가 미개방 후보 진행으로 이어지지 않는다.

## 6. 금지

- 새 프로필 v1.0 작성 금지.
- 상세 결재 시작 금지.
- 새 플레이어블 추가 금지.
- PATCH +1 확정 금지.
- OPEN-HOST U5 확정 금지.
- 한국인 후보 추가 금지.
- 미개방 캠페인 후보 진행 금지.
- 기존 산출물 삭제 금지.
- 기존 번호를 최종 해금 순번처럼 사용하는 것 금지.

## 7. 최종 판정

이번 단계의 판정은 `즉시 보정`이다.

단, 즉시 보정의 의미는 새 캐릭터 제작이 아니라 기존 기준 문서의 포인터 문구 정리다. 상위 기준과 충돌하는 PATCH 관련 문구는 가장 먼저 고친다. 그 다음 3~7번 초반 후보 오해, 프로필 v1.0 해금 오해, 다음 작업 포인터 오류를 순서대로 정리한다.

## 8. 다음 작업 포인터

로스터/레지스트리/컨텍스트/프롬프트 포인터 보정
