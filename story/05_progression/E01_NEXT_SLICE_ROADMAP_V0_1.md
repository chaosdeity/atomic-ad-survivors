# E01 NEXT SLICE ROADMAP V0.1

상태: POST-SLICE-1 ROADMAP
후보 수: 2
추가 후보를 이 문서에서 만들지 않는다.

## 0. 기준

Slice 1은 M01 current-authority alignment다.

그 다음은 다음 순서로만 본다.

- Slice 2: authority expansion이 거의 없는 것.
- Slice 3: 시즌 강점을 크게 보여주지만 새 Campaign/system authority가 필요한 것.

M07/M10/M11/M12를 “좋아서” Slice 1로 당기지 않는다.

## Slice 2 — M02 RECORD COMPARISON STORY PASS

### 선택 이유

M02는 RPG35 current runtime이 이미 가진 R01-L02 후속 의뢰와 가장 직접적으로 겹친다.

현재 evidence:

- first report 뒤 Mina에게 follow-up quest 수락.
- north gate interaction.
- R01-L02 bounded transition.
- three independent housing-record checkpoints.
- optional cleaning clue.
- finite local enemy sources.
- voluntary return.
- incomplete progress persistence.
- one-time follow-up growth.
- first-quest regression reference.

따라서 Slice 2는 새 Campaign, 새 map, 새 travel edge, 새 save schema 없이 진행할 가능성이 가장 높다.

### Story goal

세 기록을 “문서 3개 수집”으로 끝내지 않고 다음 차이를 player가 체감하게 한다.

- 이전 구성표를 참조한 claim.
- 다른 주소에서 재사용된 이름/관계.
- 새 현장 확인 없이 최신으로 표시된 profile.
- 윤서가 직접 확인한 사실.
- 아직 확인하지 못한 사람/본명/의사.

### 포함

- M02 three-record comparison core.
- optional cleaning clue는 optional로 유지.
- finite combat.
- return/report.
- M02 record-comparison pacing backlog.

### 제외

- 실제 VAC-0 robot actor가 current runtime에 없으면 신규 생성하지 않음.
- 종이가 바퀴에 물리는 물리 시뮬레이션을 새로 만들지 않음.
- Seven/Bokhee full return staging을 current capability로 가정하지 않음.
- M03를 자동으로 이어 붙이지 않음.
- R01-L03 금지.

### 승인 효과

현재 Gate D와 같은 semantic alignment 범위로 충분한지 local preflight에서 먼저 확인한다.

M02 reader fidelity를 위해 신규 actor, map, asset, save state가 필요해지는 순간 narrow reapproval로 분리한다.

### Slice 2 종료 gate

- 세 record가 서로 독립 checkpoint로 남음.
- player가 source 차이를 이해.
- optional clue를 놓쳐도 core가 완료.
- L01/L02 transition/persistence/report regression 0.
- new map/asset/save/schema 0.

---

## Slice 3 — M10 EDITED YUNSEO / PROVENANCE SYSTEM SLICE

### 선택 이유

M10은 E01의 시즌 정체성을 크게 보여준다.

- identity horror.
- player-made Yunseo.
- 실제 행동이 좋은 전설로 편집되는 문제.
- “늘 / 절대”의 폭력.
- 좋은 이야기가 실제로 누군가를 도운 모순.
- 타인의 목소리와 privacy.
- 상태를 “사망”에서 “사망 확인되지 않음”으로 되돌리는 authority boundary.

그러나 현재 구현 비용이 큰 이유도 명확하다.

### 필요한 새 authority

- E01_C05 implementation spec.
- provenance/source-copy runtime contract.
- original vs edited clip representation.
- privacy/redaction rule.
- correction publication flow.
- rumor/record authority state.
- 실제 이전 player action을 참조할 state contract.
- C05 Local runtime host/entry authority.
- 필요 시 physical access authority.
- save/state 요구가 생기면 별도 schema gate.

현재 C05는 IMPLEMENTATION_SPEC_NEEDED이며 current runtime evidence가 없다.

### 목표

M10을 “오디오 컷신”으로 만들지 않는다.

player가 실제로 이전에 한 행동과 current edited version을 비교하고, 무엇을 고칠지 선택하며, 다른 사람의 privacy까지 함께 다루는 playable provenance scene으로 설계한다.

### 반드시 보존

- 윤서가 좋은 버전을 조금 좋아함.
- “늘 / 절대”부터 문제 삼음.
- 원본 전체 공개가 자동 정답이 아님.
- 다른 사람의 voice/privacy가 별도 문제.
- 좋은 이야기가 실제로 누군가를 도운 사례.
- Bokhee가 모르는 상태를 모른다고 남기는 coda.

### Slice 3 진입 전 gate

다음이 없으면 시작하지 않는다.

1. C05 local implementation spec.
2. provenance system authority.
3. prior-play source linkage contract.
4. map/entry authority.
5. save/state boundary.
6. exact writable file scope.
7. rollback/QA plan.

Slice 3는 현재 구현 승인이 아니다.

## Final Roadmap

- Slice 1: M01 current R01-L01 story alignment.
- Slice 2: M02 current R01-L02 record-comparison story pass.
- Slice 3: M10 new C05 provenance/identity-horror slice, 별도 system/Campaign approval 필요.

이 세 단계 사이에 R01-L03를 자동 삽입하지 않는다.
