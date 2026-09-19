# 05 E01 Resource / Persistence Application V0.1

상태: CANDIDATE ONLY
구현 상태: NOT IMPLEMENTED
목표: RECOVER proof와 Final Lock을 참고해 E01 Campaign별 resource ecology, persistence, rumor 적용 후보를 식별한다.

## 0. 사용 제한

이 문서는 proof의 “가능한 시스템 성질”만 참고한다.

사용하는 개념:
- 시설/자원 가용성 변화가 서비스와 선택 결과에 인과적으로 이어질 수 있다.
- 한 번의 행동이나 시설 변화가 재방문에서 보존될 수 있다.
- 서로 다른 기록/관찰을 대조해 정보가 재해석될 수 있다.
- 플레이어 행동 이력이 이후 대화/상태에 기억될 수 있다.

사용하지 않는 것:
- proof의 수치, 확률, 턴 수, 자원 초기값.
- proof의 Godot 구현을 Unreal 정식 구현으로 승격.
- proof 사건을 공식 E01 시나리오로 승격.
- rumor가 물리 상태를 직접 바꾸는 구조.
- persistence class를 근거 없이 확정.

모든 Campaign의 최종 상태는 CANDIDATE / NOT IMPLEMENTED다.

## 1. Proof에서 가져올 수 있는 원칙

### campaign logic proof

기능 proof가 보여준 것은 “시설/자원/협력 상태가 서비스 접근과 NPC 선택에 인과적으로 연결될 수 있다”는 점이다. 시설이 사라지면 서비스가 보류되고, 대체 수단은 실제 비용/조건이 있을 때만 열린다는 식의 causality를 Production Fill 참고로 쓸 수 있다.

Production으로 가져오지 않는 것:
- 실험 수치.
- 실험의 특정 치료 결말.
- 독립 보존 설비의 존재를 정사로 확정하는 것.

### map evolution proof

기능 proof가 보여준 것은 “지역의 변경과 방문 이력을 저장하고 재방문에서 다른 상태를 보여주는 것”이 가능하다는 점이다. Final Lock persistence_profile을 설계할 때 장소 단위의 state residue, infrastructure change, revisitation consequence 후보로 쓸 수 있다.

Production으로 가져오지 않는 것:
- Godot scene 구조.
- 이동 표본이나 proof 횟수.
- 모든 Local이 STRUCTURAL persistence여야 한다는 결론.

### mystery event proof

기능 proof가 보여준 것은 서로 다른 source를 대조하고, 잘못된 가설을 검증하고, 과거 행동을 이후 상호작용이 기억하는 구조다. Final Lock의 direct memory와 rumor를 분리할 때 참고할 수 있다.

Production으로 가져오지 않는 것:
- 병원 사건 자체를 C02 canon으로 복사.
- 주민/가족 치료 조건을 정사로 확정.
- rumor가 별도 인과 채널 없이 자동 전파되는 것.

## 2. Campaign 적용 후보

| Campaign | resource ecology 후보 | persistence 후보 | rumor 필요성 후보 | 상태 |
|---|---|---|---|---|
| E01_C01 가족/세대/입주 | 도움/생활 서비스의 실제 가용성, 기록/주거 접근, 장소별 finite source의 결과를 scarcity/service dependency로 연결 | 조사 기록, MAIL-LOOP 선택, 완료/미완료 귀환, 재방문 local state. 현재 RPG34/35에 일부 runtime persistence 근거 있음 | LOW~MEDIUM. 직접 조사/기록이 우선이며 cross-local 소문은 후속 후보 | CANDIDATE / NOT IMPLEMENTED AS CAMPAIGN PROFILE |
| E01_C02 의료/환자/진료 | 병상/치료/약품/진료 access capacity가 실제 서비스 가용성과 연결되는 ecology | 시설 운영 상태, 환자/치료 접근, 플레이어 개입 이후 재방문 상태 | MEDIUM. 치료 가능 여부는 direct state가 우선, 외부 기록/주민 정보는 rumor 후보 | CANDIDATE / NOT IMPLEMENTED |
| E01_C03 반품/custody/회수 | custody slot, 회수품, 부품/보증 자산, 흐름 중단과 복구 | 분류/보관/회수/폐기 상태, custody chain 변경의 재방문 흔적 | MEDIUM. 소유권/회수 이력/브로커 주장은 rumor가 될 수 있으나 물리 custody를 직접 바꾸지 않음 | CANDIDATE / NOT IMPLEMENTED |
| E01_C04 정품/수리/충전 | 전력/충전/repair parts/operability capacity와 실제 설비 의존성 | 설비 손상/수리, machine operability, 재동기화 이후 상태 | LOW~MEDIUM. 진단/정품 정보의 오보 후보는 가능하나 실제 설비 상태와 분리 | CANDIDATE / NOT IMPLEMENTED |
| E01_C05 방송/source/authority | source access, broadcast path, verified record availability를 ecology처럼 다룰 후보. 새 currency로 만들지 않음 | source shutdown/restore, authority path, 확인된 기록의 persistent memory | HIGH. 이 Campaign은 source/authority가 핵심이므로 direct memory와 rumor channel을 명시적으로 분리할 가치가 큼 | CANDIDATE / NOT IMPLEMENTED |
| E01_C06 멤버십/결제/entitlement | access entitlement, account service capacity, loyalty benefit availability를 service ecology로 연결 | account/tier/review/entitlement 상태와 개입 이력 | MEDIUM~HIGH. reputation/거래 정보는 rumor 후보이나 실제 account entitlement를 rumor가 직접 변경하면 안 됨 | CANDIDATE / NOT IMPLEMENTED |
| E01_C07 통행/검역/transfer | passage capacity, transfer slot, quarantine throughput, route availability | gate/route/transfer 상태, inspection history, 우회로의 지속 상태 | HIGH. 바깥 세계/통행 가능성은 소문이 중요할 수 있으나 물리 route open/close와 분리 | CANDIDATE / NOT IMPLEMENTED |
| E01_C08 비상보급/shelter/survival capacity | 전력/급수/침상/보급/유지 자원이 실제 shelter capacity와 연결되는 ecology | outpost infrastructure, supply availability, repair/depletion의 재방문 상태 | MEDIUM. supply route safety와 구조 신호 정보에 rumor 후보, 실제 물자량과 분리 | CANDIDATE / NOT IMPLEMENTED |

## 3. C01 적용 주의

C01은 다른 Campaign보다 current runtime 근거가 많다.

현재 확인:
- RPG34에서 미완료 정상 귀환 뒤 진행 저장.
- 조사/선택 checkpoint 보존.
- 보고 보상 중복 방지.
- 재방문에서 source/local state 확인.
- RPG35에서 세 기록 checkpoint와 선택 흔적 저장.

그러나 이것은 Final Lock의 persistence_profile class를 확정한 것이 아니다.

따라서:
- “C01 persistence는 구현됐다”라고 Campaign 전체에 확대하지 않는다.
- 현재 runtime state를 Production Entry의 증거로 사용하되 NONE/LIGHT/STANDARD/STRUCTURAL은 별도 결정한다.
- R01-L03~L05와 C01 전체 secondary collapse는 아직 미구현이다.

## 4. C08 적용 주의

R08-L01 current Unreal candidate에는 다음 공간 의미가 있다.

- 수동 정산/생활.
- 발전/전력 설비.
- 침상/물자.
- 생존자가 고쳐 쓰는 shelter/outpost.
- 귀환→정산→휴식 관계.

하지만:
- 기능/UI/정상 속도 플레이는 완료가 아니다.
- E01_C08의 historical relief/shelter Campaign과 현재 survivor-operated silence zone은 같은 운영 주체가 아니다.
- resource ecology를 “캠페인이 현재 R08을 자동 운영한다”로 쓰면 안 된다.

## 5. Rumor 적용 규칙 후보

Final Lock과 proof를 함께 보면 rumor는 다음 조건에서만 후보가 된다.

1. direct memory / direct observation과 별도 저장.
2. 누가, 어디서, 어떤 channel로 전달했는지 causal source 필요.
3. rumor는 정보/가시성/판단을 바꿀 수 있으나 물리 문·재고·시설을 자동 변경하지 않음.
4. contradictory rumor가 가능하더라도 verified record보다 높은 권위로 자동 승격하지 않음.
5. C05/C07은 rumor 가치가 높고, C01/C04는 direct state 중심이 더 적합한 후보.

상태: CANDIDATE / NOT IMPLEMENTED.

## 6. Persistence 적용 깊이 후보

이 문서는 class를 잠그지 않는다. 다만 다음 질문을 Production Fill 입력으로 남긴다.

- C01: 현재 quest/revisit state를 Local LIGHT 또는 STANDARD 중 어디까지 확장할 것인가.
- C02: treatment/service availability 변화가 Local을 넘는가.
- C03: custody state를 item-level로 저장할지 Local summary로 저장할지.
- C04: infrastructure operability를 Local state로 보존할지 Campaign-wide service dependency로 올릴지.
- C05: verified source와 rumor를 어떤 persistence scope로 나눌지.
- C06: entitlement/account state를 gameplay persistence와 어떻게 분리할지.
- C07: route/quarantine state가 travel graph에 미치는 범위를 어디까지 허용할지.
- C08: outpost resource depletion/repair를 현재 survivor layer와 historical campaign layer 중 어디에 저장할지.

## 7. 완료 판정

- proof 수치 Production 적용: 0
- proof 사건 canon 승격: 0
- resource ecology: 8 Campaign 후보 식별
- persistence: 8 Campaign 후보 식별
- rumor: 필요성 후보 식별
- 구현: 0
