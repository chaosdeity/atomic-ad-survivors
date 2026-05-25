# 플레이어블 20인 프로필 번호/코드명 마이그레이션 판정 팀 프롬프트 v0.1

## 역할

너는 플레이어블 20인 로스터의 `기존 산출 번호`, `코드명 숫자`, `최종 해금 순번`을 분리해 마이그레이션 기준을 정하는 검수팀이다.

이번 작업은 새 프로필 작성이 아니다. 기존 파일명과 코드명을 즉시 바꾸는 작업도 아니다. 캠페인 오픈 순번 재배치 결과를 반영해, 어떤 숫자를 보존하고 어떤 숫자를 별도 해금 순번으로 관리할지 판정한다.

## 반드시 먼저 읽을 문서

1. `story/06_characters/playable_20_campaign_open_order_rebuild_v0_1.md`
2. `story/06_characters/playable_20_campaign_open_order_rebuild_result_v0_1.md`
3. `story/06_characters/playable_20_global_name_origin_correction_v0_1.md`
4. `story/06_characters/playable_20_roster_blueprint_v0_1.md`
5. `story/06_characters/playable_20_name_registry_v0_1.md`
6. `story/06_characters/playable_global_npc_link_matrix_v0_1.md`
7. `story/06_characters/character_npc_creation_context_v0_1.md`
8. `docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md`
9. `docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md`
10. `docs/world/E02_PLUS_REGION_EXPANSION_PRINCIPLES_V0_1.md`

## 핵심 전제

- 기존 숫자는 대부분 프로필 산출 번호다.
- 새 해금 순번은 캠페인 오픈 순서 기준이다.
- 코드명 숫자를 즉시 변경하면 기존 문서 링크와 참조가 깨진다.
- 따라서 `문서 파일명`, `내부 코드명`, `최종 해금 순번`, `유저 노출 순번`을 분리해야 한다.
- 13~19 한국어권 임시명은 최종명이 아니며, 전역 이름/원점 교정 후보를 우선한다.

## 작성해야 할 산출물

`story/06_characters/playable_20_profile_number_code_migration_decision_v0_1.md`

## 반드시 포함할 내용

### 1. 판정 요약

다음을 명확히 선언한다.

- 기존 1~13번 프로필 문서는 보존한다.
- 기존 코드명 숫자는 즉시 변경하지 않는다.
- 새 해금 순번은 별도 컬럼으로 관리한다.
- 14번 상세 결재는 계속 금지다.

### 2. 번호 체계 정의

아래 네 가지를 분리해 정의한다.

| 구분 | 의미 | 예시 |
|---|---|---|
| 프로필 산출 번호 | 문서가 작성된 기존 순서 | GATE-09 |
| 내부 코드명 | 기존 문서/포인터용 식별자 | gate_09_profile_v1_0.md |
| 새 해금 순번 | 캠페인 오픈 기준 플레이어블 해금 순서 | 새 해금 4번 |
| 유저 노출 순번 | UI/선택 화면에 보일 순서 | 추후 엔진/UX 판정 |

### 3. 후보별 마이그레이션 표

표 컬럼은 아래로 고정한다.

| 기존 코드 | 기존 산출 번호 | 새 해금 순번 초안 | 파일명 유지 | 코드명 숫자 유지 | 별칭 필요 | 판정 |

필수 포함 후보:

- 윤서
- PATCH
- OPEN-HOST
- HOLD-04
- RETURN-05
- METER-06
- QUIET-07
- RIO-08
- GATE-09
- BROAD-10
- CLAUSE-11
- LEDGER-12
- GUARD-13
- TRANSIT/REVIEW/RATION/LOCKOUT/NAME/LINE/OBS 계열 방향 후보

### 4. 이름 교정 마이그레이션 표

표 컬럼은 아래로 고정한다.

| 기존 코드/계열 | legacy_name | candidate_name | 원점 캠페인 | 문서 반영 방식 | 판정 |

필수 포함:

- GUARD-13: legacy `전태주`, candidate `Amina Diop`
- TRANSIT 계열: legacy `신이준`, candidate `Arjun Mehta`
- REVIEW 계열: legacy `박다미`, candidate `Maya Chen`
- RATION 계열: legacy `오진솔`, candidate `Sari Wijaya`
- LOCKOUT 계열: legacy `남태건`, candidate `Omar Al-Hadid`
- NAME 계열: legacy `최미결`, candidate `Leila Haddad`
- LINE 계열: legacy `나유찬`, candidate `Mateo Rojas`
- OBS-20: 본명 보류 유지

### 5. 마이그레이션 규칙

반드시 아래 원칙을 지킨다.

- 이미 생성된 파일명은 이번 단계에서 바꾸지 않는다.
- 새 해금 순번은 문서 표의 별도 컬럼으로 추가한다.
- 코드명 숫자와 새 해금 순번이 다를 경우 `legacy_code`와 `unlock_order`를 나눠 쓴다.
- GATE-09가 새 해금 4번 후보가 되어도 즉시 GATE-04로 바꾸지 않는다.
- GUARD-13이 새 해금 18번 초안으로 밀려도 guard_13 파일명은 유지한다.
- GUARD-13의 전태주는 legacy profile name으로 보존하되, E12_C02 최종 후보명은 Amina Diop 우선으로 판정한다.

### 6. 포인터 갱신 지시

마지막에 다음 포인터를 하나만 지정한다.

허용되는 다음 작업:

- `다음 열린 캠페인 후보 상세 결재`

금지되는 다음 작업:

- `14번 TRANSIT-14 상세 결재`
- `새 프로필 v1.0 작성`
- `기존 파일명 일괄 변경`
- `한국인 신규 플레이어블 추가`
- `기존 번호 그대로 다음 프로필 작성`

## 검수 기준

- 코드펜스 균형을 확인한다.
- trailing whitespace를 만들지 않는다.
- 실제 파일명 rename을 하지 않는다.
- 실제 캐릭터 프로필을 새로 작성하지 않는다.
- 커밋/푸시는 지시가 없으면 하지 않는다.
