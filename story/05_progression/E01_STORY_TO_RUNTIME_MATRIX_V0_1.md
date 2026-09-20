# E01 STORY TO RUNTIME MATRIX V0.1

상태: STORY PRODUCTION HANDOFF PLANNING
기준 Story Branch: story/e01-cold-reader-response-pass-v0-2
기준 Story HEAD: b0dd5697a527ae0eda71dc7183ad1fc2cdc29e48
Unreal 변경: 0
Story rewrite: 0

## 0. 판정 기준

이 문서는 final cold-reader story를 현재 Unreal authority와 대조한다. 스토리 문서에 존재하는 장면을 곧바로 runtime capability로 간주하지 않는다.

현재 확인된 실제 runtime slice는 E01_C01의 R01-L01 / R01-L02뿐이다.

- R01-L01: RPG34 first quest functional slice.
- R01-L02: RPG35 follow-up functional slice.
- R01-L01 → R01-L02: PHY-E01-001 VALIDATED.
- Gate D: C01 R01-L01/L02 canonical alignment에 한해 AUTHORIZED_BOUNDED.
- Base runtime: RPG35.
- Strategy: CANONICALIZE CURRENT RPG35 MODE.
- Map / asset modification: 승인되지 않음.
- AASPlaytestProgressSaveGame.h: READ-ONLY. 새 field, migration 필요 시 STOP.
- R01-L03: HOLD IMPLEMENTATION.
- C02~C08: current R01 slice와 같은 의미의 구현 권위가 없음.

RECOMMENDED STATUS는 다음 네 값만 사용한다.

- NOW
- NEXT WITH NARROW APPROVAL
- BLOCKED BY AUTHORITY
- LATER

NOW는 final reader scene 전체를 즉시 재현할 수 있다는 뜻이 아니다. 현재 Gate D 범위 안에서 그 unit의 핵심 story value를 기존 runtime capability로 정렬할 수 있다는 뜻이다.

## 1. Story → Runtime Matrix

| STORY UNIT | PRIMARY STORY VALUE | CORE PLAYER ACTION | REQUIRED NPC | REQUIRED SYSTEM | REQUIRED SPACE | CURRENT UNREAL EVIDENCE | CURRENT AUTHORITY | BLOCKER | IMPLEMENTATION RISK | RECOMMENDED STATUS |
|---|---|---|---|---|---|---|---|---|---|---|
| M01 | 윤서의 evidence-first 성격, 친절한 자동화의 불쾌함, 첫 귀환 관계선 | 미나에게 의뢰 수락 → 현장 기록 조사 → 국지 전투 → MAIL-LOOP의 반복 호출을 다루고 → 자율 귀환/보고 | 최소 미나. 완전한 reader 장면에는 도윤도 필요 | quest, investigation, finite combat, bounded choice, voluntary return, report/growth, persistence | current safe hub + R01-L01 침묵 가장자리 | RPG34가 safe hub, Mina interaction, L01 조사, MAIL-LOOP choice, finite combat, voluntary return, report, revisit를 기록 | Gate D가 RPG35 안의 L01/L02 canonical alignment를 승인. map/asset 변경 금지 | 도윤/붕대/실물 응급키트 사용 같은 생활 디테일은 current runtime evidence가 없음. GitHub branch에도 authoritative runtime source가 tracked 상태로 없음 | 중간. core는 재사용 가능하나 full reader fidelity를 욕심내면 즉시 범위 초과 | NOW |
| M02 | 복사된 기록과 실제 사람의 부재를 비교하는 조사 공포 | 세 기록을 독립 확인하고 서로의 provenance를 비교 → 선택 cleaning clue → 전투 → 귀환/보고 | 최소 미나. reader 장면의 Seven/Bokhee/VAC-0는 별도 | three independent record checkpoints, optional clue, finite combat, incomplete persistence, report | R01-L02 분양 주택 루프 + current safe hub | RPG35가 세 record, optional cleaning clue, finite enemy sources, voluntary return, persistence, one-time follow-up growth를 기록 | R01-L02는 CURRENT_RUNTIME_SLICE. Gate D bounded scope 안 | VAC-0 actor, 종이 물리 상호작용, Seven/Bokhee 귀환 staging은 runtime evidence 없음 | 낮음~중간. record core는 강한 재사용, reader 장면 전체는 별도 승인 필요 | NOW |
| M03 | 역할이 사람보다 먼저 채워지는 role replacement horror | 가족대표를 대체하라는 편의 제안을 거부/거리두기 → 식사 기능을 살린 채 검사 위협만 제거 → 당사자 결정 존중 | 가족대표 NPC. 귀환 beat에는 미나/팝시 | persistent NPC interaction, meal/reader dependency, role-candidate prompt, combat target separation, dialogue state | R01-L02 계열 12번 방 후보. exact anchor는 현재 implementation authority에 없음 | current L02에는 record investigation/finite combat만 확인됨 | Gate D는 semantic alignment이지 신규 NPC/meal/role-replacement content 승인이 아님 | 신규 NPC interaction 또는 map staging이 필요할 가능성 높음. map/asset 변경은 현 Gate D에서 금지 | 높음 | NEXT WITH NARROW APPROVAL |
| M04 | 돌봄을 물건·이동·야간 인계로 보여주는 생활 장면 | 컵 위치 확인 → 창가 이동을 돕되 몸 이동은 담당자에게 맡김 → 귀환 후 야간 도움과 아침 인계 | 환자, 돌봄 담당자, 심사 대리, 미나 | care interaction, assisted movement, night-call loop, handoff state | E01_C02의 응급 접수/병동 계열 + hub | current R02 runtime claim 없음 | C02는 DESIGN_READY일 뿐 current runtime slice 아님 | 새 Campaign space와 care interaction이 필요 | 높음 | BLOCKED BY AUTHORITY |
| M05 | 서하가 자기 상태를 직접 쓰고 윤서는 시간을 지킨다는 agency | 약 확보 범위 판단 → 무엇을 먼저 확인할지만 선택 → 서하가 자기 상태 작성 → 귀환 | 서하, 담당자, 미나 | major choice, patient-authored state, medicine/service queue consequence | C02 응급 접수/약국/심사 영역 | current R02 runtime 없음 | C02 DESIGN_READY | 환자 state, queue, medicine/service persistence 모두 current capability로 확인되지 않음 | 높음 | BLOCKED BY AUTHORITY |
| M06 | 사람과 물건이 같은 return line에 들어가는 공포, 도윤과 permission 관계 | 도윤에게 장비 접근 범위 허용 → line을 주임과 순회 → 사람 우선 처리를 하되 전체 시스템 정지는 피함 | 도윤, 반품 주임, 생존자 | relationship permission, line/custody state, manual scan, local hold, combat/flow consequence | C03 R03-L01 반품 접수 야드 중심 | current R03 runtime 없음 | C03 DESIGN_READY | C03 runtime, mixed-custody line, NPC supervisor, permission state 필요 | 높음 | BLOCKED BY AUTHORITY |
| M07 | 팝시가 자기 수리의 마지막 승인권을 갖는 장면 | 진단 단계 확인 → 한 단계씩 진행 → 팝시가 멈추면 윤서가 손을 거둠 → 귀환 후 manual approval | 팝시, Seven, 도윤 | operability/charging state, stepwise consent, manual approval switch, reversible comparison | C04 R04-L01 폐충전소 | current R04 runtime 없음 | C04 DESIGN_READY | Popsy runtime actor, repair/charging state, consent interaction 모두 미구현 권위 | 높음 | BLOCKED BY AUTHORITY |
| M08 | 거래가 숨긴 서비스 비용을 사람의 대기로 보이게 함 | 거래/우회/비용 공개 중 선택 → 약·충전·식량 대기 변화 확인 → 기록을 지웠을 때 생기는 실제 손실 수습 | 브로커, 대기자, 로봇, 미나, Seven | entitlement/service queue, transaction consequence, disclosure UI | C06 service/point 거래 영역 | current C06 runtime 없음 | C06는 R06-L01 external ingress KNOWN GAP. 일부 design only | ingress부터 graph blocker. transaction/service system도 없음 | 매우 높음 | BLOCKED BY AUTHORITY |
| M09 | 바깥 절차를 비판하던 보급소가 자기 입장 기준을 만들기 시작하는 갈등 | 수용 여유 확인 → 외부 신호 검증 → 임시 admission 운영 방식을 고름 → 한 사람에게 현재 답을 직접 전달 | 미나, 도윤, Seven, 주민/외부인 | shelter capacity, signal verification, admission decision, shared resource state | 침묵 보급소 계열 | current safe hub는 존재하지만 R08-L01과 runtime 1:1 동일성은 NOT LOCKED. R08 후보 asset은 production gate 미통과 | C08는 CURRENT_SUPPORTING_ASSET이지 current gameplay slice가 아님 | safe hub identity와 R08 mapping 미확정, admission/resource system 없음 | 높음 | BLOCKED BY AUTHORITY |
| M10 | 실제 행동이 “늘/절대”의 좋은 윤서로 편집되는 identity horror | 원본/편집본 비교 → 정정 방식을 고름 → 타인의 privacy와 provenance를 보존 → 잘못 확정된 상태를 미확정으로 되돌림 | Seven, 복희, 도윤, 주민 | provenance chain, source comparison, redaction, correction publication, rumor/record authority | hub + C05 provenance/broadcast access | current C05 runtime 없음 | C05 IMPLEMENTATION_SPEC_NEEDED | provenance/editorial runtime spec, C05 Local runtime, 실제 접근 경로 모두 없음 | 매우 높음 | BLOCKED BY AUTHORITY |
| HRI07 | “떠날지”를 윤서 중심이 아닌 각자의 욕망으로 말하는 관계 휴지부 | 저녁에 앉아 각자 WANT를 말함 → 해결하지 않고 끝냄 → 윤서가 먼저 잠들고 다른 사람들이 정리 | 미나, 도윤, 복희, 팝시, Seven | ensemble dialogue, blocking, VO timing. 저장은 필수 아님 | current safe hub 재사용 후보 | safe hub와 Mina interaction만 runtime evidence가 명시적. ensemble cast staging evidence 없음 | 새 Campaign/edge 없이도 후보가 될 수 있으나 현재 Gate D write scope에는 신규 ensemble content가 포함되지 않음 | 다수 NPC actor/대화 sequencing/animation capability 확인 필요 | 중간~높음 | NEXT WITH NARROW APPROVAL |
| M11 | 실제 사람이 떠나고 같은 공간에서 사라지며 빈 침상이 남는 사건 | verification 우선순위 선택 → departure control 복구 → 가은의 실제 출발을 목격 → 귀환해 빈 침상 확인 | 가은, 현오, 보류관, 미나, 복희, 도윤 | passage verification, departure state, manifest/control recovery, actual transition, return aftermath | C07 departure 시설 + hub | current C07 runtime 없음 | C07은 R07-L01 external ingress KNOWN GAP, 이후 Local도 runtime spec 부족 | graph ingress, passage/departure system, NPC state, cross-space consequence 모두 미확정 | 매우 높음 | BLOCKED BY AUTHORITY |
| M12 | player-made Yunseo의 누적 결과와 “도장을 내려놓는” 종결 | 동시 요청을 받음 → 하나를 놓침 → 실제 위임/거절 → 다른 사람들이 일을 끝까지 맡음 → 도장을 내려놓음 | 미나, 도윤, Seven, 복희, 팝시, 방문자 | accumulated relationship/history state, delegation, multi-request staging, hub blocking | hub + C02/C05/C07 상태 feed | current safe hub만 재사용 가능. multi-NPC/state aggregation evidence 없음 | 선행 Campaign runtime이 먼저 필요. 현재 Gate D는 C01 alignment 한정 | 장면 자체는 hub지만 의미는 M05/M10/M11 결과 누적에 의존. 조기 구현 시 빈 연출이 됨 | 높음 | LATER |

## 2. Authority Summary

### 현재 만들 수 있다고 말할 수 있는 것

- M01 core: current R01-L01 runtime semantics에 story value를 정렬.
- M02 core: current R01-L02 record-comparison semantics에 story value를 정렬.
- L01→L02는 북쪽 관문까지 정상 이동 + 위치 귀속 interaction + bounded transition이면 current physical relation을 만족한다. 전 구간 단일 world-space continuous sweep가 필수는 아니다.

### 현재 만들 수 있다고 말하면 안 되는 것

- R01-L03 boss.
- C02~C08 full story runtime.
- R08-L01을 current RPG safe hub와 동일하다고 확정.
- M03의 실제 가족대표/식사 role-replacement system.
- M07 manual repair approval system.
- M10 provenance/correction system.
- M11 departure system.
- M12 accumulated relationship state.
- 새 save field/schema/migration.
- 새 map/asset/geometry/material/camera.
- 새 Local, travel edge, Campaign dependency.

## 3. Production Read

현재 runtime은 E01 story의 “첫 두 조사 단위”를 받을 그릇은 있다. 그러나 Cold Reader가 가장 강하게 기억한 후반부 장면들은 아직 그릇이 없다.

따라서 production 순서는 스토리 선호도가 아니라 authority 순서로 간다.

1. M01 current-authority story alignment.
2. M02 current-authority story alignment.
3. 좁은 별도 승인 뒤 M03 또는 hub 관계 staging 후보.
4. C02~C08는 각 Campaign implementation authority가 생긴 뒤.
5. 후반 payoff인 M10/M11/M12는 선행 상태가 실제 runtime에 존재한 뒤.

최종 판정: STORY MATRIX COMPLETE / CURRENT NOW = M01, M02 ONLY.
