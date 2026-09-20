# E01 PRODUCTION ORDER MANIFEST V0.1

상태: PRODUCTION ORDER / COLD READER TEST
기준 브랜치: `story/e01-full-season-editorial-v0-1`
기준 HEAD: `e8e79edfb9d8799351d04de50ba040f1133e0cc6`
production-edit 브랜치: `story/e01-production-edit-v0-1`

## 운영 원칙

- 한 Main 사이의 기본 추천 optional은 최대 1편이다.
- HRI07은 optional이 아니라 M10 → M11 사이의 REQUIRED EMOTIONAL BRIDGE다.
- HRI07은 quest completion gate가 아니다.
- optional은 CORE FIRST PLAY를 밀어내거나 새로운 선행 조건을 만들지 않는다.
- MERGED / ARCHIVED unit은 standalone production episode로 세지 않는다.
- source draft는 삭제하거나 overwrite하지 않는다.

## CORE FIRST PLAY

| 순서 | Unit | Production source | 비고 |
|---:|---|---|---|
| 1 | M01 | current CLEAN V0.2 | unchanged |
| 2 | M02 | current CLEAN V0.2 | unchanged |
| 3 | M03 | current CLEAN V0.2 | unchanged |
| 4 | M04 | current CLEAN V0.2 | unchanged |
| 5 | M05 | `production_edit/e01_m05_white_wristband_scenario_production_edit_v0_1.md` | major choice 유지, care 설명 축약 |
| 6 | M06 | `production_edit/e01_m06_return_clerk_scenario_production_edit_v0_1.md` | relationship permission |
| 7 | M07 | `production_edit/e01_m07_repair_meaning_scenario_production_edit_v0_1.md` | Popsy final decision ownership 보존 |
| 8 | M08 | `production_edit/e01_m08_survivor_rank_scenario_production_edit_v0_1.md` | field transaction / diegetic consequence |
| 9 | M09 | current scenario draft v0.1 | unchanged |
| 10 | M10 | `production_edit/e01_m10_who_spoke_last_scenario_production_edit_v0_1.md` | SS12 핵심 coda 흡수 |
| 11 | HRI07 | `production_edit/e01_hri07_if_you_could_leave_production_edit_v0_1.md` | REQUIRED EMOTIONAL BRIDGE |
| 12 | M11 | current scenario draft v0.1 | unchanged |
| 13 | M12 | `production_edit/e01_m12_player_made_yunseo_scenario_production_edit_v0_1.md` | player-facing meta category 차단 |

## STRONG OPTIONAL

| Unit | Recommended insertion window | Production status |
|---|---|---|
| SS01 | M02 → M03 | ACTIVE / source unchanged |
| SS04 | M05 → M06 | ACTIVE / source unchanged |
| SS06 | M06 → M07 | ACTIVE / source unchanged |
| SS08 | M07 → M08 | ACTIVE / source unchanged |
| SS10 | M08 → M09 | ACTIVE / source unchanged |
| HRI06 | M08 → M09 | ACTIVE / production edit |
| SS11 | M09 → M10 | ACTIVE / source unchanged |

SS10과 HRI06은 같은 M08 → M09 window를 공유한다. 기본 first-pass에서는 둘 중 하나만 추천한다.

## RELATIONSHIP OPTIONAL

| Unit | Recommended insertion window | Production status |
|---|---|---|
| HRI01 | M03 → M04 | ACTIVE / production edit |
| SS02 | M05 → M06 | ACTIVE / source unchanged |
| HRI02 | M05 → M06 | ACTIVE / source unchanged |
| SS03 | M06 → M07 | ACTIVE / production edit |
| HRI03 | M06 → M07 | ACTIVE / production edit |
| SS07 | M07 → M08 | ACTIVE / production edit, HRI04 핵심 흡수 |
| HRI04 | — | MERGED INTO SS07 / standalone OFF |

SS02와 HRI02, SS03와 HRI03은 각각 같은 window를 공유한다. 기본 first-pass에서는 같은 gap에 둘을 연속 배치하지 않는다.

## DEEP LORE OPTIONAL

| Unit | Recommended insertion window | Production status |
|---|---|---|
| SS05 | M06 → M07 | ACTIVE / production edit |
| HRI05 | M08 → M09 | ACTIVE / production edit |
| SS13 | M10 → HRI07 | ACTIVE / production edit |
| SS14 | M11 → M12 | DEFAULT OFF / production edit |
| SS09 | — | ARCHIVED / NOT DEFAULT PRODUCTION / source preserved |
| SS12 | — | MERGED INTO M10 CODA / standalone OFF |

## Production exceptions

- **SS09**: source draft는 archive/source로 보존한다. default production order에 넣지 않는다.
- **HRI04**: standalone production unit을 만들지 않는다. 동률 / 재계산 / “우선순위 없음” / 사람에게 확인 / 후반 Seven의 빠른 웃음만 SS07 aftermath/revisit에 흡수한다.
- **SS12**: standalone production unit을 만들지 않는다. “연락 두절 / 생존 미확인” → 편집 → “사망” 사례만 M10 coda에 흡수한다. 정정 상한은 “사망 확인되지 않음”이다.
- **SS14**: production edit은 유지하지만 first-play default는 OFF다.

최종 first-play spine:
`M01 → M02 → M03 → M04 → M05 → M06 → M07 → M08 → M09 → M10 → HRI07 → M11 → M12`
