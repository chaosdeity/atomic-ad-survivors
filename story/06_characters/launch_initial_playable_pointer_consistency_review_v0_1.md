# 출시 초기 플레이어블 구조 포인터 정합성 검수 v0.1

## 문서 상태

- 상태: 작성 완료
- 문서 성격: 포인터 정합성 검수
- 작성 범위: 기존 로스터, 이름 레지스트리, 캐릭터 컨텍스트, 제작 프롬프트에 남은 출시 초기 플레이어블 포인터 점검
- 금지 범위: 새 프로필 v1.0 작성, 상세 결재 시작, 새 플레이어블 추가, PATCH +1 확정, OPEN-HOST U5 확정, 한국인 후보 추가, 미개방 캠페인 후보 진행
- 상위 기준: `launch_initial_playable_structure_lock_v0_1.md`

## 0. 상위 잠금 기준

출시 초기 플레이어블 구조는 아래 기준을 최상위로 둔다.

- 윤서 단독 U5 시작을 기본으로 둔다.
- PATCH는 출시 초기 +1 확정이 아니라 U1~U4 보류다.
- OPEN-HOST는 출시 초기 플레이어블이 아니라 R01 NPC 선등장 유지다.
- OPEN-HOST의 플레이어블 전환은 R01 NPC 기능을 빼앗지 않는 후속 조건에서만 검토한다.
- HOLD-04, RETURN-05, METER-06, QUIET-07은 프로필 산출물 보존 대상이지만 출시 초기 해금 대상이 아니다.
- 미개방 캠페인 후보는 상세 결재와 프로필 v1.0 진행을 금지한다.
- 기존 번호는 해금 순번이 아니다. 프로필 산출 번호, legacy_code, unlock_order, user_display_order를 분리한다.

## 1. 검수 결론

최근 작성된 출시 초기 잠금 문서 5종은 서로 충돌하지 않는다. 문제는 그 이전에 작성된 로스터, 이름 레지스트리, 캐릭터 컨텍스트, 제작 프롬프트에 남은 과거 포인터다.

가장 큰 충돌은 `PATCH 2번 확정`이라는 문구가 출시 초기 +1 확정처럼 읽히는 점이다. 이제 이 문구는 `PATCH-02 프로필 산출 번호 및 legacy_code 보존`으로만 해석해야 하며, 출시 초기 U5 합류는 확정하지 않는다.

두 번째 문제는 `3~7번 초반 후보`와 `프로필 v1.0 고정` 문구가 HOLD, RETURN, METER, QUIET의 출시 초기 해금을 암시할 수 있다는 점이다. 이들은 기존 산출물로 보존하되 출시 초기 구조에서는 전부 출시 후 보류로 분류한다.

세 번째 문제는 일부 문서의 다음 작업 포인터가 아직 `미개방 캠페인 플레이어블 보류 게이트`에 머물러 있다는 점이다. 해당 게이트와 출시 초기 구조 잠금이 이미 작성되었으므로, 다음 포인터는 포인터 보정 또는 해금 순번/UI 노출 순서 분리로 넘어가야 한다.

## 2. 포인터 정합성 검수표

| 문서 | 점검 항목 | 현재 문구 | 문제 여부 | 권장 처리 | 판정 |
|---|---|---|---|---|---|
| `launch_initial_playable_structure_lock_v0_1.md` | 윤서 단독 U5 시작 | 윤서 단독 U5 시작 기본. PATCH는 U1~U4 보류. OPEN-HOST는 NPC 선등장 유지 | 없음 | 출시 초기 구조의 최상위 기준으로 유지 | 통과 |
| `patch_launch_plus_one_condition_review_v0_1.md` | PATCH U1~U4 보류 | 최종 판정은 U1~U4 보류. +1은 최대치이며 필수가 아님 | 없음 | PATCH 관련 후속 문서가 이 판정을 우선 참조 | 통과 |
| `open_host_npc_first_transition_condition_review_v0_1.md` | OPEN-HOST NPC 선등장 | 출시 초기 U5 전환 금지. NPC 선등장 유지. 후속 전환은 조건부 가능 | 없음 | OPEN-HOST 관련 포인터의 기준 문서로 유지 | 통과 |
| `launch_initial_plus_one_playable_limit_review_v0_1.md` | 출시 초기 한국인 +1 없음 | +1 후보는 확정하지 않으며 윤서 단독 시작을 기본값으로 둔다 | 없음 | 초기 한국인 추가 검토의 상위 제한으로 유지 | 통과 |
| `playable_next_allowed_work_review_v0_1.md` | 미개방 캠페인 후보 상세 결재 금지 | NAME, TICKET, RATION, LINE, OBS 상세 결재 금지. LOCKOUT은 기능 초안 보존 | 없음 | 미개방 후보 금지 기준으로 유지하되 다음 포인터는 최신 잠금 문서가 승계 | 통과 |
| `playable_20_roster_blueprint_v0_1.md` | PATCH U1~U4 보류 | PATCH는 2번 플레이어블로 잠근다. PATCH를 윤서 다음 2번째 플레이어블로 잠근다 | 있음 | PATCH-02는 프로필 산출 번호와 legacy_code로만 보존. 출시 초기 상태는 U1~U4 보류로 보정 | 상위 기준 충돌 |
| `playable_20_roster_blueprint_v0_1.md` | HOLD, RETURN, METER, QUIET 출시 후 보류 | 3~7번 초반 후보. 초반 1~8번 슬롯 우선 설계 | 있음 | 3~7은 기존 후보 선정 산출물로 보존하되 출시 초기 해금 대상이 아님을 명시 | 포인터 수정 필요 |
| `playable_20_roster_blueprint_v0_1.md` | OPEN-HOST NPC 선등장 | OPEN-HOST는 3번 후보로 번호 예약. R01 NPC 선등장 후 전환 | 부분 있음 | 3번 번호 예약은 프로필 산출 번호로만 유지하고 출시 초기 U5 전환 금지를 병기 | 보정 필요 |
| `playable_20_roster_blueprint_v0_1.md` | 미개방 캠페인 후보 상세 결재 금지 | 다음 작업은 미개방 캠페인 플레이어블 보류 게이트 | 있음 | 보류 게이트 완료 후 포인터로 갱신. 다음은 해금 순번/UI 노출 순서 분리 또는 포인터 보정 | 포인터 수정 필요 |
| `playable_20_roster_blueprint_v0_1.md` | 기존 번호와 해금 순번 분리 | 기존 번호는 최종 해금 순번으로 사용 금지 | 없음 | 이 문구는 유지하고 PATCH, 3~7, 9~13 표기에도 같은 기준을 확장 | 통과 |
| `playable_20_name_registry_v0_1.md` | PATCH U1~U4 보류 | 2번 PATCH 확정. PATCH-02 L5 확정 | 부분 있음 | L5는 이름/코드/프로필 산출물 확정으로 제한. launch_status는 U1~U4 보류로 별도 표기 | 보정 필요 |
| `playable_20_name_registry_v0_1.md` | HOLD, RETURN, METER, QUIET 출시 후 보류 | HOLD-04, RETURN-05, METER-06, QUIET-07 L5 확정 | 부분 있음 | L5 확정이 출시 초기 해금을 뜻하지 않도록 launch_status 출시 후 보류를 추가 | 보정 필요 |
| `playable_20_name_registry_v0_1.md` | 기존 번호와 해금 순번 분리 | 번호는 최종 해금 순번이 아니라 기존 산출물 관리 번호다 | 없음 | 유지. 레지스트리 전반에 unlock_order 미확정 기준을 적용 | 통과 |
| `playable_20_name_registry_v0_1.md` | 다음 작업 포인터 | 미개방 캠페인 플레이어블 보류 게이트 | 있음 | 보류 게이트와 출시 초기 구조 잠금 완료 상태로 갱신 | 포인터 수정 필요 |
| `character_npc_creation_context_v0_1.md` | PATCH U1~U4 보류 | PATCH는 윤서 다음에 로봇 축을 열 수 있는 초반 2번째 플레이어블로 확정한다 | 있음 | PATCH 출시 초기 +1 확정 문구 삭제. U1~U4 보류와 윤서 단독 U5 시작 기준으로 교체 | 상위 기준 충돌 |
| `character_npc_creation_context_v0_1.md` | OPEN-HOST NPC 선등장 | OPEN-HOST는 초반 3~7번째 후보 또는 R01 NPC 선등장 후 플레이어블 전환 후보 | 부분 있음 | OPEN-HOST는 우선 NPC 선등장으로 고정. 전환은 출시 초기 금지와 후속 조건부 가능으로 분리 | 보정 필요 |
| `character_npc_creation_context_v0_1.md` | HOLD, RETURN, METER, QUIET 출시 후 보류 | 3~7번 초반 플레이어블 후보 선정 완료 | 있음 | 기존 후보 선정 완료와 출시 초기 해금 금지를 분리해 문구 보정 | 포인터 수정 필요 |
| `character_npc_creation_context_v0_1.md` | 미개방 캠페인 후보 상세 결재 금지 | NAME-18 상세 결재로 넘어가지 않는다. LOCKOUT-17은 기능 초안 보존 | 없음 | 미개방 후보 금지 문구는 유지 | 통과 |
| `character_npc_creation_context_v0_1.md` | 다음 작업 포인터 | 다음 작업은 미개방 캠페인 플레이어블 보류 게이트 | 있음 | 완료된 과거 포인터로 처리하고 출시 초기 구조 잠금 이후 포인터로 갱신 | 포인터 수정 필요 |
| `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | PATCH U1~U4 보류 | PATCH: 윤서 다음 2번째 플레이어블 확정. 1번은 윤서, 2번은 PATCH 확정 | 있음 | 2번을 해금 순번처럼 쓰는 문구를 제거하고 PATCH-02 산출 번호 보존으로 보정 | 상위 기준 충돌 |
| `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | HOLD, RETURN, METER, QUIET 출시 후 보류 | 3~7번 초반 후보 선정은 완료되었다 | 있음 | 3~7 프로필 산출물 보존과 출시 후 보류 상태를 함께 명시 | 포인터 수정 필요 |
| `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 미개방 캠페인 후보 상세 결재 금지 | NAME-18 상세 결재로 넘어가지 않음. LOCKOUT-17은 캠페인 미개방으로 대기 | 없음 | 금지 문구 유지. 다음 작업 포인터만 최신화 | 통과 |
| `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 다음 작업 포인터 | 다음 작업은 미개방 캠페인 플레이어블 보류 게이트 | 있음 | 출시 초기 구조 잠금 완료를 반영해 포인터 보정 | 포인터 수정 필요 |
| `CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | PATCH U1~U4 보류 | PATCH는 윤서 다음 2번째 플레이어블로 확정되었다. PATCH는 2번 슬롯으로 잠근다 | 있음 | PATCH +1 확정처럼 읽히는 문구를 U1~U4 보류로 교체 | 상위 기준 충돌 |
| `CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | HOLD, RETURN, METER, QUIET 출시 후 보류 | PATCH 이후 초반 3~7번째 주인공 후보는 아래 범위에서 우선 찾는다 | 있음 | 초반 주인공 후보 표현을 기존 산출물 보존 및 출시 후 보류로 보정 | 포인터 수정 필요 |
| `CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 기존 번호와 해금 순번 분리 | 기존 1~13번은 프로필 산출 번호와 최종 해금 순번을 분리해야 한다 | 없음 | 유지. 상단 잠금 문구에도 같은 기준을 반영 | 통과 |
| `CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 다음 작업 포인터 | 다음에는 미개방 캠페인 플레이어블 보류 게이트만 작성하라 | 있음 | 보류 게이트 완료 후 포인터로 갱신 | 포인터 수정 필요 |
| `HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 초기 다수 플레이어블 금지 | E01 초반에 8명 주인공이 모두 있는 구조로 만들지 않는다 | 없음 | 유지. 출시 초기 윤서 단독 U5 기준을 추가 참조 | 통과 |
| `HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 미개방 캠페인 후보 상세 결재 금지 | LOCKOUT-17은 기능 초안 보존. NAME-18 상세 결재로 넘어가지 않는다 | 없음 | 유지. 상세 결재 금지 기준으로 유효 | 통과 |
| `HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 다음 작업 포인터 | 다음 작업은 미개방 캠페인 플레이어블 보류 게이트다 | 있음 | 완료된 포인터를 최신 출시 초기 구조 잠금 및 포인터 보정으로 갱신 | 포인터 수정 필요 |

## 3. 보정 원칙

포인터 보정 시 기존 산출물을 삭제하지 않는다. 문제는 산출물의 존재가 아니라, 산출 번호와 출시 초기 해금 상태가 섞여 보이는 표현이다.

- `2번 PATCH 확정`은 `PATCH-02 산출 번호 및 legacy_code 보존`으로 바꾼다.
- `PATCH 윤서 다음 2번째 플레이어블`은 출시 초기 기준에서 폐기하고, `PATCH는 U1~U4 보류`로 바꾼다.
- `3~7번 초반 후보`는 `3~7번 기존 후보 선정 산출물` 또는 `프로필 산출 번호 3~7`로 바꾼다.
- HOLD-04, RETURN-05, METER-06, QUIET-07의 `프로필 v1.0 고정`은 출시 초기 해금이 아니라 산출물 보존으로만 해석한다.
- OPEN-HOST의 `3번 후보`는 출시 초기 U5 전환이 아니라 NPC 선등장 후 후속 전환 검토 번호로만 둔다.
- `미개방 캠페인 보류 게이트` 다음 작업 포인터는 완료된 과거 포인터로 정리한다.
- 모든 로스터/프롬프트 문서에는 `프로필 산출 번호 != 최종 해금 순번` 문구를 상단에 다시 둔다.

## 4. 문서별 우선 보정 순서

1. `playable_20_roster_blueprint_v0_1.md`
2. `playable_20_name_registry_v0_1.md`
3. `character_npc_creation_context_v0_1.md`
4. `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md`
5. `CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md`
6. `HERO_CHARACTER_CREATION_PROMPT_V0_1.md`

로스터 설계도와 이름 레지스트리가 먼저 보정되어야 한다. 두 문서가 기준을 잡은 뒤 컨텍스트와 프롬프트 문서의 반복 문구를 따라 고친다.

## 5. 최종 판정

출시 초기 구조 잠금 자체는 통과다. 다만 기존 로스터와 프롬프트 문서에는 상위 기준과 충돌하는 포인터가 남아 있다.

최종 판정:

- 출시 초기 구조 기준: 통과
- 기존 문서 포인터 정합성: 보정 필요
- PATCH 관련 포인터: 상위 기준 충돌
- 3~7번 초반 후보 포인터: 포인터 수정 필요
- 미개방 캠페인 다음 작업 포인터: 포인터 수정 필요

## 6. 다음 작업 포인터

로스터/레지스트리/컨텍스트/프롬프트 포인터 보정
