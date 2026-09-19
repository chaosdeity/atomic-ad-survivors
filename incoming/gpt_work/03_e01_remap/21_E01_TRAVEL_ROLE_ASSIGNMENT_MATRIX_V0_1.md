# 21 E01 Travel Role Assignment Matrix V0.1

상태: E01 TRAVEL ROLE PRODUCTION FILL
구현 상태: NOT UNREAL IMPLEMENTATION

## 0. Assignment matrix

| subject | role | state | actual host / meaning | boundary |
|---|---|---|---|---|
| E01 | SECTOR_RELAY | TBD / PRODUCTION FILL | actual host TBD | R08-L02 또는 source cross-campaign edge에서 자동 추론 금지 |
| R08-L02 | RECOVERY_SUPPORT | CANDIDATE_LOCK | recovery-support infrastructure 의미 유지 | exact device layout와 Recovery Line endpoint는 미확정 |
| R08-L02 | LOCAL_BEACON_SUPPORT | CANDIDATE | Beacon 기능 지원 가능성 | actual Local Beacon assignment가 아님 |
| R08-L02 | SECTOR_RELAY | NOT_ASSIGNED | E01 Sector Relay host로 지정하지 않음 | old signal/recovery 의미만으로 승격 금지 |
| R08-L02 | RECOVERY_LINE_ENDPOINT | NOT_ASSIGNED | exact extraction endpoint 미정 | Recovery Support와 endpoint를 동일시하지 않음 |
| R08-L01 | SURVIVOR_SETTLEMENT_HUB | CANONICAL_ROLE | framing / survivor settlement / supply outpost | Relay 또는 Beacon 자동 배정 금지 |
| R08-L01 | CURRENT_RPG_SAFE_HUB_RUNTIME_HOST | TBD / NOT LOCKED | RPG34/35 safe hub와 runtime 1:1 동일성 미확정 | canonical role과 runtime host identity를 분리 |
| E01 | LOCAL_BEACON_ACTUAL_ASSIGNMENT | TBD / PRODUCTION FILL | actual Beacon host 미정 | source edge만으로 자동 배치 금지 |
| E01 | RECOVERY_LINE_EXACT_GEOMETRY | TBD / PRODUCTION FILL | physical line / anchor 미정 | 70/88/108초 fixed-time extraction 복구 금지 |

## 1. R08-L02 separation

R08-L02는 아래 네 role을 하나로 합치지 않는다.

- RECOVERY_SUPPORT = CANDIDATE_LOCK
- LOCAL_BEACON_SUPPORT = CANDIDATE
- SECTOR_RELAY = NOT_ASSIGNED
- RECOVERY_LINE_ENDPOINT = NOT_ASSIGNED

같은 physical place에 여러 장치가 존재할 수 있어도 data role, assignment state, support relation, actual physical host는 독립 관리한다.

## 2. R08-L01 boundary

R08-L01의 survivor settlement hub 의미는 canonical이다.

그러나 current RPG34/35의 safe hub와 R08-L01이 같은 runtime 공간이라는 근거는 없다. 따라서 CURRENT_RPG_SAFE_HUB_RUNTIME_HOST는 TBD / NOT LOCKED로 유지한다.

## 3. Result

- Sector Relay actual host: TBD / PRODUCTION FILL.
- R08-L01: SURVIVOR_SETTLEMENT_HUB = CANONICAL_ROLE.
- R08-L01 current RPG safe hub runtime identity: TBD / NOT LOCKED.
- R08-L02 Recovery Support: CANDIDATE_LOCK.
- R08-L02 Beacon Support: CANDIDATE.
- R08-L02 Sector Relay: NOT_ASSIGNED.
- Recovery Line exact geometry: TBD / PRODUCTION FILL.
- Local Beacon actual assignment: TBD / PRODUCTION FILL.
- new assignment invented: 0.

판정: TRAVEL ROLE ASSIGNMENT BOUNDARY / PASS.
