# E01 CURRENT AUTHORITY SLICE SELECTION V0.1

상태: FIRST STORY PRODUCTION SLICE SELECTED
Story rewrite: 0
Unreal implementation in this planning pass: 0

## 0. 결론

첫 Story Production Slice는 M01 “문은 먼저 열렸다”의 core runtime alignment로 잡는다.

이 선택은 좋은 에피소드 순위가 아니다. 현재 승인된 RPG35 mode 안에서 R01-L01의 기존 quest, investigation, finite combat, choice, voluntary return, report/persistence를 그대로 재사용하면서 final story의 윤서 성격과 uncanny premise를 가장 적은 확장으로 체감시킬 수 있기 때문이다.

Slice 이름:

**SLICE 1 — M01 EVIDENCE-FIRST RESIDENTIAL LOOP**

M02는 다음 slice로 분리한다. M03 이상의 scene은 현재 Gate D의 canonical alignment 범위를 넘어가는 신규 NPC/system staging이 필요하므로 Slice 1에 넣지 않는다.

## 1. 현재 authority와 맞는 이유

RPG34 / RPG35 current evidence가 이미 다음을 제공한다.

- safe hub.
- Mina interaction / quest accept.
- R01-L01 first quest.
- time-unlimited exploration.
- finite place-bound combat.
- residential record investigation.
- MAIL-LOOP bounded choice.
- voluntary return.
- incomplete progress persistence.
- report / one-time growth.
- revisit.
- save-failure rollback.
- LMB hold/release attack contract.

Gate D는 이를 RPG35 current mode 안에서 C01 residential-role semantics에 정렬하도록 제한 승인했다.

이번 Slice는 새 content chain을 추가하지 않고 다음 의미만 명확히 만든다.

- 등록된 household / recipient claim은 진실 확정이 아니다.
- 윤서가 직접 본 것과 못 본 것을 분리한다.
- MAIL-LOOP를 “가족 배정 승인”으로 확대하지 않는다.
- 전투는 조사를 대신하지 않는다.
- 돌아와서 Mina에게 보고하는 행위가 현장 확인의 종결이다.

## 2. Slice에 포함하는 장면

### A. Hub setup

- Mina와 실제 NPC interaction.
- 목적은 “누가 사는지 확정”이 아니라 receipt / household record와 현장을 확인하는 것.
- current safe hub를 사용한다.
- current hub를 R08-L01이라고 새로 확정하지 않는다.

### B. R01-L01 entry / uncanny setup

- 정상 이동으로 current L01 field에 진입.
- 자동 도움과 등록 claim이 사람의 실제 응답보다 먼저 움직이는 느낌을 UI/interaction 의미로 보존.
- existing record checkpoint를 사용한다.
- 새 자동문/응급키트 asset을 요구하지 않는다.

### C. Investigation + finite combat

- 기록 조사 중 장소 귀속 finite enemy를 처리한다.
- combat은 “전투를 해서 스토리 unlock”하는 구조가 아니라 조사 동선을 방해하는 국지 위협이다.
- NPC/world object auto-target 금지 계약 유지.

### D. Bounded MAIL-LOOP choice

- 반복 호출을 멈추거나 기존 대기를 유지하는 current choice boundary를 유지.
- 선택이 household truth, 가족대표 지정, 전역 정화로 확대되지 않는다.

### E. Voluntary return + Mina report

- player가 직접 귀환한다.
- 등록 claim과 현장 관찰을 구분해 보고한다.
- report/growth one-time, duplicate 방지, persistence contract 유지.

## 3. 가능한 한 포함하는 여섯 요소

| 목표 요소 | Slice 1 판정 | 구현 경계 |
|---|---|---|
| 윤서의 행동 성격 | 포함 | “본 것만 말하고 모르는 것은 미확정으로 남김”을 현재 investigation/report semantics로 표현 |
| 실제 NPC interaction | 포함 | 현재 evidence가 있는 Mina만 필수 |
| 생활 행동 하나 | 조건부 | current map/runtime에 이미 존재하는 도움/kit interaction이 preflight에서 확인될 때만 사용. 새 inventory/item-use system을 만들지 않음 |
| uncanny / role horror | 포함 | “도움/등록 claim이 실제 사람 확인보다 먼저 작동”하는 M01 core. M03 role replacement 자체는 아님 |
| combat 또는 traversal | 포함 | current finite combat + 정상 이동 |
| 귀환 후 관계 beat | 포함 | Mina report. Doyun beat는 Slice 1에서 제외 |

생활 행동을 억지로 채우기 위해 붕대 inventory, 부상 item-use, Doyun hand-care system을 새로 만들지 않는다. current runtime에 해당 capability가 없다면 이 한 항목은 다음 승인 후보로 남긴다.

## 4. Slice 1에서 명시적으로 제외

- M02 full record-comparison loop.
- M03 family-representative role replacement.
- M04 hospital / cup / window / night care.
- M05 Seoha.
- M06 return line / Doyun permission system.
- M07 Popsy repair consent.
- M08 transaction/service queue.
- M09 shelter admission.
- M10 provenance/edited Yunseo.
- HRI07 ensemble dinner.
- M11 departure.
- M12 delegation/ending.
- R01-L03.
- R08 mandatory chain.
- 새 Campaign.
- 새 map / asset.
- 새 save field/schema/migration.
- 새 travel edge/dependency.

## 5. 왜 M03가 첫 Slice가 아닌가

M03는 Cold Reader memory value가 높지만 current L02 evidence는 three-record investigation, optional clue, finite combat까지다.

다음 capability는 문서상 존재한다고 확인되지 않았다.

- 실제 family-representative NPC.
- 손을 대야 meal service가 계속되는 dependency.
- player를 새 가족대표로 등록하려는 runtime role-candidate state.
- meal function은 보존하고 inspection device만 제거하는 target-specific scenario logic.
- 해당 NPC의 대화/귀환 persistence.

따라서 M03를 NOW로 만들면 authority보다 story desirability가 앞서게 된다.

## 6. 첫 5분 목표

정상 플레이 기준 목표 흐름:

0:00~0:45
- current safe hub에서 Mina에게 의뢰 수락.
- “등록 claim 확인”과 “현장 사실 확인”이 다르다는 목적을 짧게 이해.

0:45~2:00
- R01-L01 이동.
- 첫 record / service interaction.
- 사람이 확인되지 않았는데 시스템 상태는 완료/유효로 보이는 불일치 확인.

2:00~3:20
- 장소 귀속 finite combat 1회.
- 공격이 record/NPC/world object를 자동 표적으로 삼지 않음.

3:20~4:10
- MAIL-LOOP bounded choice.
- household truth를 새로 확정하지 않음.

4:10~5:00
- 자율 귀환.
- Mina report에서 registered claim vs verified observation을 분리해서 확인.
- 다음 행동이 읽힘.

이는 scripted speed-run 증거가 아니라 player-facing target이다. 실제 5분 체감은 정상 속도 수동 플레이로 별도 검증한다.

## 7. Slice 1 종료 판정

PASS 조건:

- 새 map/asset 없이 existing R01-L01을 사용.
- save schema 변경 없이 current state field를 사용.
- story canon 추가 없이 final M01 의미를 정렬.
- legacy timer/auto-fire 재유입 0.
- existing RPG35 L02 follow-up 및 gate transition regression 0.
- Mina report까지 player가 “무엇을 확인했고 무엇을 모르는지” 이해 가능.

최종 선택:

**SLICE 1 = M01 EVIDENCE-FIRST RESIDENTIAL LOOP**
