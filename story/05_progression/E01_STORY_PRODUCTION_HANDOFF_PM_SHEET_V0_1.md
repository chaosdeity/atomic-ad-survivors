# E01 STORY PRODUCTION HANDOFF PM SHEET V0.1

상태: PM HANDOFF
스토리 제작: CLOSED
Unreal 구현: 이 작업에서 0
최종 목표 상태: E01 STORY PRODUCTION HANDOFF / READY FOR UNREAL IMPLEMENTATION DECISION

## 0. PM 결론

E01 스토리는 다시 쓰지 않는다.

현재 제작 순서는 다음으로 확정한다.

1. Slice 1: M01 EVIDENCE-FIRST RESIDENTIAL LOOP.
2. Slice 2: M02 RECORD COMPARISON STORY PASS.
3. Slice 3: M10 EDITED YUNSEO / PROVENANCE SYSTEM SLICE. 별도 C05/system authority 필요.

Cold Reader가 기억한 강한 장면을 story quality 순서로 당기지 않는다.

현재 실제 runtime authority가 있는 곳은 C01 R01-L01/L02뿐이다.

## 1. Story Authority

기준 branch:
story/e01-cold-reader-response-pass-v0-2

기준 HEAD:
b0dd5697a527ae0eda71dc7183ad1fc2cdc29e48

GitHub compare 결과:
branch와 지정 HEAD는 identical.

Final story status:

- E01 STORY PRODUCTION PASS.
- WOULD CONTINUE PLAYING = YES.
- M06 중반 이탈 문제 해소.
- M11 actual departure PASS.
- M12 player-made Yunseo payoff PASS.
- M10 identity horror PASS.
- ending payoff PASS.
- 대규모 rewrite 불필요.
- 신규 Main/Side/HRI 불필요.
- M13/E02 작성 금지 유지.

## 2. Current Unreal Authority

### Gate D

69_E01_IMPLEMENTATION_GATE_D_PM_APPROVAL_V0_1.md:

- C01 R01-L01/L02 canonical alignment = AUTHORIZED_BOUNDED.
- base runtime = RPG35.
- strategy = CANONICALIZE CURRENT RPG35 MODE.
- RPG34 = regression / rollback reference.
- map/asset modification = NO.
- AASPlaytestProgressSaveGame.h = READ-ONLY.
- save field/schema/migration 필요 시 reapproval.
- R01-L03 = HOLD IMPLEMENTATION.

### Physical transition

70_E01_L01_L02_PHYSICAL_TRANSITION_PM_CLARIFICATION_V0_1.md:

L01→L02는 “한 월드에서 끝까지 continuous sweep”이 필수 조건이 아니다.

PASS 조건은:

- 정상 이동으로 L01 north gate까지 도달.
- 위치에 귀속된 explicit gate interaction.
- bounded L02 transition.
- arbitrary/free teleport 없음.
- L02 investigation/return/revisit 정상.

현재 graph edge PHY-E01-001을 새로 만들거나 수정하지 않는다.

### E01 implementation readiness

- C01: CURRENT_RUNTIME_SLICE.
- C02: DESIGN_READY, runtime 없음.
- C03: DESIGN_READY, runtime 없음.
- C04: DESIGN_READY, runtime 없음.
- C05: IMPLEMENTATION_SPEC_NEEDED.
- C06: BLOCKED_BY_GRAPH, R06-L01 external ingress gap.
- C07: BLOCKED_BY_GRAPH, R07-L01 external ingress gap.
- C08: CURRENT_SUPPORTING_ASSET, production visual/function/play gate 미통과.

R08-L01과 current RPG safe hub의 1:1 runtime identity는 NOT LOCKED.

Campaign Dependency Graph는 evidence-backed row 0개다.

## 3. First Slice Decision

**M01 only.**

이유:

- existing Mina interaction.
- existing R01-L01 quest.
- existing residential record investigation.
- existing finite combat.
- existing MAIL-LOOP bounded choice.
- existing voluntary return/report/persistence.
- final story의 윤서 성격과 uncanny premise를 새 map/system 없이 정렬할 수 있음.

M01 full reader fidelity의 Doyun/붕대/item-use는 Slice 1 필수가 아니다.

## 4. Top Scene Preservation

| Scene | 현재 판정 |
|---|---|
| M03 role replacement horror | PROTOTYPE LATER |
| M04 window/cup/help | BLOCKED |
| M05 Seoha writes her own state | BLOCKED |
| M06 people/objects same return line | BLOCKED |
| M07 Popsy manual approval | BLOCKED |
| M09 shelter admission conflict | BLOCKED |
| M10 “always / never” edited Yunseo | BLOCKED |
| HRI07 dinner | PROTOTYPE LATER |
| M11 actual departure + empty bed | BLOCKED |
| M12 stamp on table | PROTOTYPE LATER |

현재 authority를 무시한 IMPLEMENT NOW 판정은 0개다.

## 5. 가장 중요한 Preflight Blocker

Gate D가 허용한 Unreal source 경로는 story HEAD의 Git tree에서 tracked file로 확인되지 않았다.

Workspace readonly snapshot에도 unreal/AtomicAdSurvivorsUE 경로가 존재하지 않았다.

따라서 실제 Unreal worker가 시작될 때 반드시 먼저 확인한다.

- exact writable file 존재.
- tracked / untracked 상태.
- current hash.
- RPG35 base인지.
- external execution mirror 존재 여부.
- source ↔ mirror hash 관계.

파일이 없으면 문서만 보고 코드를 재구성하지 않는다.

**STOP / LOCAL AUTHORING WORKSPACE REQUIRED**

로 보고한다.

이 blocker는 planning 완료를 막지 않지만 implementation start 여부 판단에는 직접 영향을 준다.

## 6. Save / Schema Guard

이번 first package에서:

- save wipe 금지.
- AASPlaytestProgressSaveGame.h 수정 금지.
- 새 save field 금지.
- schema migration 금지.
- current field로 의미 정렬이 불가능하면 SAVE_SCHEMA_REAPPROVAL_REQUIRED.

## 7. Map / Asset Guard

이번 first package에서:

- map/package 수정 0.
- geometry 수정 0.
- material 수정 0.
- camera 수정 0.
- imported asset 수정 0.
- new NPC asset 0.
- new Local 0.
- new travel edge 0.
- R01-L03 0.

기존 map/asset 없이 story beat를 만들 수 없으면 억지로 proxy를 추가하지 않고 reapproval로 돌린다.

## 8. Runtime Polish Priority

Story rewrite 대신 다음 순서로 runtime polish를 본다.

1. M01 generic combat.
2. M02 record-comparison pacing.
3. M08 transaction explanation density.
4. M11 control-recovery repetition.
5. M12 simultaneous-discussion staging.
6. Seven functional-character risk.
7. Mina/Bokhee dialogue rhythm separation.
8. Yunseo/Doyun short-response rhythm separation.

각 항목의 실제 category/action은 E01_COLD_READER_RUNTIME_POLISH_BACKLOG_V0_1.md를 따른다.

## 9. PM Decision Point

다음 Unreal 작업자가 필요한 결정은 story rewrite가 아니다.

결정 항목은 하나다.

**Gate D exact local authoring source가 preflight에서 확인되면, Slice 1 M01 package를 실행할 것인가.**

실행 승인 시에도 범위는 E01_FIRST_UNREAL_STORY_IMPLEMENTATION_PACKAGE_V0_1.md의 STOP condition을 넘지 않는다.

R01-L03, C02~C08, map/asset, save/schema는 자동 확장하지 않는다.

## 10. Files Actually Read / Evidence Used

### Operating rule
- AGENTS.md

### Final story authority
- story/05_progression/E01_PRODUCTION_ORDER_MANIFEST_V0_1.md
- story/05_progression/E01_CHOICE_IMPLEMENTATION_MAP_V0_1.md
- story/05_progression/E01_FINAL_READER_SPINE_V0_1.md
- story/05_progression/E01_COLD_READER_RESPONSE_AUDIT_V0_1.md
- story/05_progression/cold_reader_pack_v0_2/00_E01_COLD_READER_ORDER.md
- story/05_progression/cold_reader_pack_v0_2/01_M01_READER.md
- story/05_progression/cold_reader_pack_v0_2/02_M02_READER.md
- story/05_progression/cold_reader_pack_v0_2/03_M03_READER.md
- story/05_progression/cold_reader_pack_v0_2/04_M04_READER.md
- story/05_progression/cold_reader_pack_v0_2/05_M05_READER.md
- story/05_progression/cold_reader_pack_v0_2/06_M06_READER.md
- story/05_progression/cold_reader_pack_v0_2/07_M07_READER.md
- story/05_progression/cold_reader_pack_v0_2/08_M08_READER.md
- story/05_progression/cold_reader_pack_v0_2/09_M09_READER.md
- story/05_progression/cold_reader_pack_v0_2/10_M10_READER.md
- story/05_progression/cold_reader_pack_v0_2/11_HRI07_READER.md
- story/05_progression/cold_reader_pack_v0_2/12_M11_READER.md
- story/05_progression/cold_reader_pack_v0_2/13_M12_READER.md
- story/05_progression/cold_reader_pack_v0_2/14_COLD_READER_PACK_AUDIT.md

### Current Unreal authority
- docs/unreal/r01_rpg34_20260916.md
- docs/unreal/r01_rpg35_20260918.md
- docs/unreal/world_structure_execution_20260912.md
- docs/unreal/main_subgame_combat_contract_20260914.md
- docs/unreal/r08_supply_execution_20260912.md
- docs/unreal/R01_L01_UNREAL_HERO_SHOT_GATE_V0_1.md

### E01 implementation / graph authority
- incoming/gpt_work/03_e01_remap/10_E01_REMAP_CANONICAL_V0_1.md
- incoming/gpt_work/03_e01_remap/17_E01_COMMON_GRAPH_POPULATION_CANONICAL_V0_1.md
- incoming/gpt_work/03_e01_remap/19_E01_LOCAL_PHYSICAL_TRAVEL_GRAPH_V0_1.csv
- incoming/gpt_work/03_e01_remap/20_E01_CAMPAIGN_DEPENDENCY_GRAPH_V0_1.csv
- incoming/gpt_work/03_e01_remap/64_E01_IMPLEMENTATION_READINESS_MATRIX_V0_1.md
- incoming/gpt_work/03_e01_remap/65_E01_FIRST_IMPLEMENTATION_HANDOFF_PACKAGE_V0_1.md
- incoming/gpt_work/03_e01_remap/66_E01_PRODUCTION_IMPLEMENTATION_HANDOFF_GATE_V0_1.md
- incoming/gpt_work/03_e01_remap/68_E01_IMPLEMENTATION_PM_DECISION_SHEET_V0_1.md
- incoming/gpt_work/03_e01_remap/69_E01_IMPLEMENTATION_GATE_D_PM_APPROVAL_V0_1.md
- incoming/gpt_work/03_e01_remap/70_E01_L01_L02_PHYSICAL_TRANSITION_PM_CLARIFICATION_V0_1.md

### Additional repository evidence
- story branch HEAD와 b0dd5697a527ae0eda71dc7183ad1fc2cdc29e48 compare = identical.
- story HEAD tree에서 Gate D writable Unreal paths tracked file 미발견.
- Workspace readonly에서 unreal/AtomicAdSurvivorsUE path 미발견.

## 11. Final

**E01 STORY PRODUCTION HANDOFF**

**READY FOR UNREAL IMPLEMENTATION DECISION**
