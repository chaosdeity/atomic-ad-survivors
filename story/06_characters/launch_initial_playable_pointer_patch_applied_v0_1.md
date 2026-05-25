# 출시 초기 플레이어블 포인터 실제 보정 적용 v0.1

## 문서 상태

- 상태: 작성 완료
- 문서 성격: 포인터 실제 보정 적용 기록
- 작업 범위: 기존 로스터, 이름 레지스트리, 캐릭터 컨텍스트, 제작 프롬프트의 충돌 문구와 다음 작업 포인터 보정
- 금지 준수: 새 프로필 v1.0 작성 없음, 상세 결재 시작 없음, 새 후보 추가 없음, 문서 전체 재작성 없음
- 다음 작업 포인터: 출시 초기 플레이어블 포인터 보정 완료 검수

## 0. 적용 기준

이번 보정은 아래 기준을 실제 문서에 반영했다.

- PATCH는 `PATCH-02 legacy_code 보존 / 출시 초기 +1 확정 아님 / U1~U4 보류`로 표기한다.
- OPEN-HOST는 `NPC 선등장 / 출시 초기 U5 전환 금지`로 표기한다.
- HOLD/RETURN/METER/QUIET는 `출시 후 보류`로 표기한다.
- `프로필 v1.0 고정`은 `기능 산출물 보존`으로 설명한다.
- 기존 번호는 해금 순번이 아니라 산출 번호/legacy_code다.
- 미개방 캠페인 후보는 캠페인 개방 전 상세 결재 금지다.
- 다음 작업 포인터는 `출시 초기 플레이어블 포인터 보정 완료 검수`로 넘긴다.

## 1. 보정 적용표

| 대상 문서 | 보정한 문구 유형 | 보정 내용 | 남은 위험 | 판정 |
|---|---|---|---|---|
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | PATCH +1 확정 오해 | `PATCH 2번 플레이어블 확정` 계열 문구를 `PATCH-02 legacy_code 보존 / 출시 초기 +1 확정 아님 / U1~U4 보류`로 보정했다 | 과거 상세 결재 완료 이력은 남아 있으므로 이후 검수에서 해금 순번으로 오독되지 않는지 확인 필요 | 보정 완료 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | 3~7번 초반 후보 오해 | `초반 1~8번`, `3~7번 초반 후보` 표현을 `프로필 산출 번호 1~8`, `3~7번 기존 후보 산출물 / 출시 후 보류`로 보정했다 | 표가 길어 일부 행의 해금 위치 문구는 후속 검수에서 더 세밀하게 볼 수 있음 | 추가 검수 필요 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | 프로필 v1.0 최종 해금 오해 | HOLD/RETURN/METER/QUIET/RIO 등의 `프로필 v1.0 고정` 판정을 `기능 산출물 보존`으로 보정했다 | 기존 상세 결재 링크 자체는 유지되어 산출물 완료와 해금 완료를 분리해 읽어야 함 | 보정 완료 |
| `story/06_characters/playable_20_roster_blueprint_v0_1.md` | 다음 작업 포인터 오류 | `미개방 캠페인 플레이어블 보류 게이트` 다음 포인터를 `출시 초기 플레이어블 포인터 보정 완료 검수`로 교체했다 | 없음 | 보정 완료 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | PATCH +1 확정 오해 | 최신 반영과 PATCH 행에 `PATCH-02 legacy_code 보존 / 출시 초기 +1 확정 아님 / U1~U4 보류`를 추가했다 | L5 등급명은 유지되므로 L5가 해금 확정이 아니라는 설명을 계속 유지해야 함 | 보정 완료 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | 한국인 후보 과밀 오해 | HOLD/RETURN/METER/QUIET 행에 `기능 산출물 보존 / 출시 후 보류`를 추가했다 | 한국어권 이름이 남아 있으므로 출시 초기 후보가 아니라는 문구를 후속 검수에서 확인 필요 | 보정 완료 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | 프로필 v1.0 최종 해금 오해 | L5 정의를 `이름/코드/프로필 산출물 잠금. 출시/해금 확정은 별도 판정`으로 보정했다 | L5 명칭 자체는 남아 있어 용어 검수 가능 | 일부 보류 |
| `story/06_characters/playable_20_name_registry_v0_1.md` | 다음 작업 포인터 오류 | 권장 다음 작업과 다음 상세 작업을 `출시 초기 플레이어블 포인터 보정 완료 검수`로 교체했다 | 없음 | 보정 완료 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | PATCH +1 확정 오해 | PATCH 섹션 제목과 판정을 `PATCH-02 legacy_code 보존 / 출시 초기 U1~U4 보류`로 보정했다 | 과거 완료 문서 링크는 보존되어 있음 | 보정 완료 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | OPEN-HOST U5 확정 오해 | OPEN-HOST 관련 문구를 `NPC 선등장 유지 / 출시 초기 U5 전환 금지`로 보정했다 | 후속 전환 가능성은 남아 있으므로 R01 NPC 기능 보존 조건을 유지해야 함 | 보정 완료 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | 3~7번 초반 후보 오해 | 섹션 제목과 운영 잠금을 `3~7번 기존 후보 산출물 / HOLD/RETURN/METER/QUIET 출시 후 보류`로 보정했다 | 문서가 길어 후속 완료 검수에서 남은 간접 표현 확인 필요 | 추가 검수 필요 |
| `story/06_characters/character_npc_creation_context_v0_1.md` | 다음 작업 포인터 오류 | 여러 `다음: 미개방 캠페인 플레이어블 보류 게이트` 포인터를 완료 검수로 교체했다 | 문서 안의 과거 보류 게이트 참조 링크는 일부 맥락상 남을 수 있음 | 보정 완료 |
| `docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 프로필 v1.0 최종 해금 오해 | 4~13번 프로필 상태를 `기능 산출물 보존` 또는 `캠페인 개방 후 해금/재검토`로 보정했다 | 상세 결재용 프롬프트 성격상 과거 산출물 목록은 유지 | 보정 완료 |
| `docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | PATCH +1 확정 오해 | PATCH 현황에 `출시 초기 +1 확정 아님 / U1~U4 보류`를 추가했다 | 없음 | 보정 완료 |
| `docs/world/HERO_CHARACTER_CREATION_PROMPT_V0_1.md` | 다음 작업 포인터 오류 | 현재 다음 상세화 우선순위를 `출시 초기 플레이어블 포인터 보정 완료 검수`로 보정했다 | 없음 | 보정 완료 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | PATCH +1 확정 오해 | PATCH 관련 현재 잠금과 체크리스트를 `PATCH-02 legacy_code 보존 / U1~U4 보류`로 보정했다 | 프롬프트 내부의 예시가 길어 완료 검수에서 재검색 필요 | 보정 완료 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 3~7번 초반 후보 오해 | `3~7번 초반 후보`를 `기존 후보 산출물 / 출시 초기 해금 대상 아님`으로 보정했다 | 없음 | 보정 완료 |
| `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md` | 미개방 캠페인 후보 진행 오해 | 다음 작업 포인터와 현재 작업 메모를 완료 검수로 교체했다 | 미개방 후보 관련 금지 문구는 유지되어야 함 | 보정 완료 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | PATCH +1 확정 오해 | PATCH 확정 슬롯 문구를 `PATCH-02 legacy_code 보존 / 출시 초기 +1 확정 아님 / U1~U4 보류`로 보정했다 | 없음 | 보정 완료 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | OPEN-HOST U5 확정 오해 | OPEN-HOST 3번 후보 문구를 `3번 산출 번호 / NPC 선등장 / 출시 초기 U5 전환 금지`로 보정했다 | 후속 전환 조건은 남아 있으므로 R01 기능 침범 여부를 계속 확인해야 함 | 보정 완료 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 한국인 후보 과밀 오해 | 3~7 한국어권 후보를 출시 초기 해금이 아닌 기존 산출물로 보정했다 | 없음 | 보정 완료 |
| `docs/world/CHARACTER_AND_NPC_CREATION_PROMPT_V0_1.md` | 다음 작업 포인터 오류 | 보류 게이트 다음 작업 문구를 `출시 초기 플레이어블 포인터 보정 완료 검수`로 교체했다 | 없음 | 보정 완료 |

## 2. 남겨 둔 것

아래 항목은 삭제하지 않았다.

- 기존 상세 결재 문서 링크
- 기존 프로필 v1.0 파일 링크
- 기존 코드명 숫자
- legacy profile name
- 캠페인 개방 후 재검토 후보의 기능 메모

삭제하지 않은 이유는 산출물 자체가 문제가 아니라 산출물과 해금 순번의 혼동이 문제였기 때문이다.

## 3. 금지 재확인

이번 보정으로 아래 작업은 여전히 금지다.

- PATCH +1 확정
- OPEN-HOST 출시 초기 U5 확정
- HOLD/RETURN/METER/QUIET 출시 초기 해금
- NAME/RATION/LINE/OBS 상세 결재
- LOCKOUT-17 최종 고정
- MODEL-15 즉시 해금
- 한국인 후보 추가
- 새 프로필 v1.0 작성

## 4. 다음 작업 포인터

출시 초기 플레이어블 포인터 보정 완료 검수
