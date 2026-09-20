# E01 PRODUCTION EDIT DELTA AUDIT V0.1

상태: READY FOR COLD READER TEST
기준 브랜치: `story/e01-full-season-editorial-v0-1`
기준 HEAD: `e8e79edfb9d8799351d04de50ba040f1133e0cc6`
작업 브랜치: `story/e01-production-edit-v0-1`

## 1. Scope delta

| 검증 항목 | 결과 |
|---|---:|
| 신규 episode | 0 |
| 신규 character | 0 |
| 신규 LOCKED canon | 0 |
| 기존 source overwrite | 0 |
| main branch 변경 | 0 |
| Unreal 변경 | 0 |
| new Local | 0 |
| travel / ingress / dependency 추가 | 0 |
| M13 | 0 |
| E02 | 0 |
| 신규 Side / HRI | 0 |

이번 변경은 기존 E01 source를 삭제하거나 교체하지 않는다. 필요한 16편에만 별도 production-edit 파일을 추가한다.

## 2. Production unit delta

- 기존 episode unit: **33**.
- standalone default-capable production unit: **30**.
- unit reduction: **3/33 ≈ 9.1%**.
- MERGED:
  - **HRI04 → SS07 aftermath/revisit**
  - **SS12 → M10 coda/revisit**
- ARCHIVED:
  - **SS09 → ARCHIVED / NOT DEFAULT PRODUCTION**
- **SS14 → first-play DEFAULT OFF**.

## 3. Runtime / text reduction estimate

production-facing runtime/text 감량 추정: **약 15.6%**.

산정 방식:
- SS09 standalone 제거, HRI04·SS12 standalone 흡수.
- M05/M06/M07/M08/M10/M12 및 선택된 Side/HRI에서 반복 설명·3지선다·same-writer coda를 CUT / COMPRESS.
- source header, production note, implementation note는 실제 플레이 runtime 계산에서 제외.
- 개별 편집은 **20% 초과 감량 금지** 기준을 적용한다.

이 수치는 연출/VO 타이밍 확정 전 editorial estimate이며 최종 runtime LOCK이 아니다.

## 4. Choice delta

- 편집 전 explicit choice section: **29/33**.
- 편집 후 MAJOR CHOICE SCREEN: **6/33**.
- RELATIONSHIP PERMISSION 포함 최대 screen-capable interaction: **11/33**.
- production target: **약 14/33 이하**, 충족 후보.

Major choice 우선:
`M05 / M07 / M09 / M10 / M11 / M12`

M06은 relationship permission, M08은 diegetic field transaction으로 낮춘다.
Side/HRI major choice screen은 0을 원칙으로 한다.

## 5. Production edit files

생성 대상 16편:
- Main: M05, M06, M07, M08, M10, M12
- Side: SS03, SS05, SS07, SS13, SS14
- HRI: HRI01, HRI03, HRI05, HRI06, HRI07

별도 production-edit를 만들지 않은 승인 상태:
- SS09: source archive 보존
- HRI04: SS07에 merge
- SS12: M10 coda에 merge

First-play에서 source unchanged:
- M01, M02, M03, M04, M09, M11

## 6. Approved-content preservation checks

- M05: 서하가 자기 상태를 직접 쓰는 climax 보존.
- M06: A/B/C ethics screen 제거, 도윤 permission interaction으로 축소.
- M07: Popsy final decision ownership 및 윤서 손이 멈추는 장면 보존.
- M08: service-access 설명을 실제 대기/피해/거래 행동으로 압축.
- M10: “연락 두절 / 생존 미확인” → 편집 → “사망” chain 보존. 복희의 정정 상한은 “사망 확인되지 않음”.
- M12: WAIT / COMMIT / SELF-COST / PEOPLE-FIRST / RECORD-FIRST 등 내부 category는 player-facing에서 0. NPC는 구체 과거 사건을 말함.
- SS07: HRI04 핵심 5요소 merge.
- SS14: 새 evidence 추가 없이 mystery 범위 축소.
- HRI06: 윤서 없이 미나/도윤/세븐이 공지 범위를 합의.
- HRI07: large choice 0, 각자 WANT 보존, 윤서가 먼저 잠든 뒤 다른 사람들이 정리하는 ending 보존.

## 7. Default first-play units

**13 units**

`M01 → M02 → M03 → M04 → M05 → M06 → M07 → M08 → M09 → M10 → HRI07 → M11 → M12`

HRI07은 REQUIRED EMOTIONAL BRIDGE이며 quest completion gate가 아니다.

## Final state

**E01 PRODUCTION EDIT — READY FOR COLD READER TEST**
