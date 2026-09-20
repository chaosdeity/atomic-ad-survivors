# E01 STORY VALUE / IMPLEMENTATION COST AUDIT V0.1

상태: PRODUCTION PRIORITY AUDIT
목적: Cold Reader가 기억한 story value를 현재 runtime reuse와 구현 비용으로 분리한다.
Story ranking 문서가 아니라 실제 제작 순서 판단 문서다.

## 0. 분류

결과는 다음 네 값만 사용한다.

- HIGH STORY VALUE / LOW COST
- HIGH STORY VALUE / HIGH COST
- SUPPORTING VALUE
- DEFER

“LOW COST”는 현재 authority와 existing runtime을 기준으로 한 상대 비용이다. final art, VO, full animation까지 싸다는 뜻은 아니다.

## 1. Candidate Scene Audit

| Candidate scene | Cold Reader memory | Character / Horror / Agency | Existing runtime reuse | 주요 dependency | Future reuse | RESULT |
|---|---|---|---|---|---|---|
| M01: 자동 도움 + record mismatch + MAIL-LOOP + Mina 귀환 보고 | 직접 top-memory 목록은 아니지만 E01 입구 기능이 강함 | 윤서의 evidence-first 성격, 친절한 시스템의 불쾌함, bounded choice | 매우 높음. RPG34/RPG35 first quest backbone과 직접 겹침 | full reader fidelity의 Doyun/붕대/kit use는 별도 | C01 전체의 조사 문법, report 문법 재사용 | HIGH STORY VALUE / LOW COST |
| M02: 세 기록 비교 | pacing 지적이 있었으나 final reader spine 핵심 | 추론이 아니라 source를 다시 읽는 윤서, record horror | 매우 높음. RPG35 three records + optional clue가 직접 존재 | VAC-0 actor/물리 종이 interaction은 current evidence 없음 | 이후 provenance/verification UX의 기초 | HIGH STORY VALUE / LOW COST |
| M03: 가족대표 자리 대체 | Cold Reader 보존 top scene | character + role horror + agency가 한 장면에 결합 | 공간은 L02 계열 재사용 가능성이 있으나 mechanic reuse는 낮음 | human NPC, meal dependency, role-candidate, target-selective combat, staging | E01의 role horror 문법을 강하게 정의 | HIGH STORY VALUE / HIGH COST |
| M04: 컵 / 창가 / 야간 도움 | Cold Reader 보존 top scene | 윤서가 몸을 대신 움직이지 않는다는 care boundary, 생활감 매우 높음 | current hub 일부 외 재사용 낮음 | C02 space, patient/caregiver NPC, assisted movement, night-call loop | care/settlement 생활 시스템에 높음 | HIGH STORY VALUE / HIGH COST |
| M05: 서하가 자기 상태를 씀 | Cold Reader 보존 top scene | agency value 매우 높음 | current choice UI 개념만 일부 재사용 가능 | C02 medical state, patient-authored state, medicine queue | 향후 “player가 대신 결정하지 않음”의 표준 | HIGH STORY VALUE / HIGH COST |
| M06: 사람/물건 같은 return line | Cold Reader 보존 top scene | bureaucratic horror + Doyun permission + procedural NPC | current finite interaction/hold 개념 외 직접 runtime 없음 | C03 line/custody system, supervisor NPC, permission state | return/custody campaign 전체에 높음 | HIGH STORY VALUE / HIGH COST |
| M07: Popsy manual approval | Cold Reader 보존 top scene | 캐릭터 agency를 mechanic 자체로 보여줌 | current runtime 직접 reuse 낮음 | C04 operability/charging, Popsy actor, reversible repair state | companion repair/consent system에 높음 | HIGH STORY VALUE / HIGH COST |
| M08: broker transaction / visible wait cost | residual explanation-density 지적 | system ethics와 현장 consequence는 중요 | current runtime reuse 낮음 | C06 ingress, entitlement queue, broker/service state | economy/service consequence에 높음 | SUPPORTING VALUE |
| M09: shelter admission conflict | Cold Reader 보존 top scene | 윤서 영향력과 공동체 책임이 강함 | current safe hub 공간 개념은 재사용 가능하지만 identity/system은 미잠금 | R08/runtime host 결정, capacity, signal verification, admission system | hub governance loop에 높음 | HIGH STORY VALUE / HIGH COST |
| M10: “늘/절대” edited Yunseo | Cold Reader identity horror PASS, top scene | E01 핵심 identity horror와 player-made Yunseo를 직접 연결 | current runtime 직접 reuse 거의 없음 | C05 implementation spec, provenance, redaction, correction publication | 시즌 전체 기록/rumor 시스템의 중심 | HIGH STORY VALUE / HIGH COST |
| HRI07: dinner | Cold Reader 보존 top scene | 전투 없이 독립적 WANT를 보여주는 관계 payoff | current safe hub 공간 reuse 가능 | ensemble NPC, dialogue sequencing, VO/blocking | 반복 hub relationship scene에 높음 | HIGH STORY VALUE / HIGH COST |
| M11: actual departure + empty bed | Cold Reader top scene, departure PASS | 사건성과 관계 payoff 모두 최고 수준 | current runtime 직접 reuse 없음 | C07 ingress, verification/departure, cross-space state, aftermath | 시즌 후반 passage system에 높음 | HIGH STORY VALUE / HIGH COST |
| M12: simultaneous requests / delegation | ending payoff PASS | player-made Yunseo 누적 결과를 행동으로 회수 | current hub 일부만 재사용 가능 | M05/M10/M11 등 선행 state, ensemble, delegation | end-of-season convergence에 높음 | DEFER |
| M12: stamp on table ending only | Cold Reader top scene | 매우 높은 상징/관계 가치 | hub table/blocking만 보면 비용은 낮아 보임 | Doyun/Popsy 존재와 선행 누적 의미가 없으면 껍데기 장면 | finale blocking pattern | DEFER |

## 2. 비용을 낮게 보지 않은 이유

후반 장면은 “대사만 재생하면 된다”로 계산하지 않는다.

M10/M11/M12의 가치 대부분은 앞에서 실제로 생성된 state와 player action이 되돌아오는 데 있다. 선행 Campaign과 state가 없는 상태에서 컷신만 만들면 Cold Reader가 통과시킨 이유를 잃는다.

따라서 scene animation 비용보다 dependency 비용을 우선 계산했다.

## 3. Preserve The Top Scenes

아래 판정은 장면의 좋고 나쁨이 아니라 현재 authority로 실제 production에 넣을 수 있는지다.

| Cold Reader remembered scene | 판정 | 근거 |
|---|---|---|
| M03 role replacement horror | PROTOTYPE LATER | R01-L02 공간 맥락은 가까우나 family-representative NPC / meal dependency / role state가 current capability로 확인되지 않음. 별도 좁은 승인이 있으면 existing L02 안의 prototype 후보 |
| M04 window / cup / help | BLOCKED | C02 runtime 없음. patient/caregiver/assisted-movement/night-care system 필요 |
| M05 Seoha writes her own state | BLOCKED | C02 runtime 없음. patient-authored state와 medical support consequence 필요 |
| M06 people and objects in same return line | BLOCKED | C03 runtime 없음 |
| M07 Popsy manual approval | BLOCKED | C04 runtime 및 Popsy repair/charging state 없음 |
| M09 shelter admission conflict | BLOCKED | R08 candidate는 supporting asset뿐이고 current safe hub와 R08 runtime host 동일성 미잠금 |
| M10 “always / never” edited Yunseo | BLOCKED | C05 IMPLEMENTATION_SPEC_NEEDED. provenance/correction runtime 없음 |
| HRI07 dinner | PROTOTYPE LATER | 새 Campaign은 필요 없을 수 있으나 ensemble NPC/dialogue/blocking capability가 current Gate D 범위 밖. 좁은 hub-staging 승인 후보 |
| M11 actual departure + empty bed | BLOCKED | C07 external ingress KNOWN GAP + departure runtime 없음 |
| M12 stamp on table | PROTOTYPE LATER | 물리적 blocking prototype 자체는 가능성이 있으나 Doyun/Popsy cast와 선행 누적 payoff 없이 E01 ending으로 승격하면 안 됨 |

현재 authority를 그대로 적용하면 top-memory scene 중 IMPLEMENT NOW 판정은 0개다.

이 결과가 곧 “top scenes를 뒤로 미룬다”는 의미는 아니다. 오히려 임시 구현으로 소모하지 않고 필요한 runtime authority가 생길 때까지 보존한다는 의미다.

## 4. Immediate Production Read

첫 작업은 기억 장면을 억지로 당기는 것이 아니라 M01/M02의 low-cost backbone을 final story 의미에 맞추는 것이다.

그 뒤에 가장 가까운 고가치 prototype은 M03다. 이유는 새 Campaign이 아니라 이미 존재하는 R01-L02 맥락을 활용할 가능성이 있기 때문이다. 다만 현재 Gate D로 자동 실행하지 않는다.

최종 판정:

- HIGH STORY VALUE / LOW COST: M01 core, M02 core.
- top remembered scenes: 현재 IMPLEMENT NOW 0.
- first narrow prototype candidate after current slice: M03.
- season-strength high-cost target: M10.
