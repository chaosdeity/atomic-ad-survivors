# 07 E01 P0 Current Gameplay Revalidation V0.1

상태: latest Unreal/RPG 기준 P0 재검증
과거 P0:
R08-L01 → R08-L02 → R01-L01 → R01-L02 → R01-L03

## 0. 결론

과거 5개 P0 ID를 삭제하지 않는다. 그러나 “5개가 이 순서로 첫 15분에 필수 진행되며 R01-L01은 108초 강제 회수로 끝나고 R01-L03이 첫 보스로 이어진다”는 과거 gameplay contract는 현재 권위가 아니다.

최신 current flow:
- 안전 거점에서 의뢰 수락
- 지역 진입
- 시간제한 없는 탐사
- 장소에 귀속된 유한 전투
- 기록/목표 조사
- 플레이어 선택 귀환
- 의뢰 보고/성장
- 재방문 또는 후속 분양 주택 기록 대조
- 보스는 RPG35 범위 밖

## 1. P0 node 재검증

| Node | 과거 P0 역할 | 최신 근거 | 판정 | 현재 해석 |
|---|---|---|---|---|
| R08-L01 침묵 보급소 | 첫 시작 hub/정산/귀환 | current R08 Unreal spatial candidate는 존재. current RPG34의 실제 safe hub와 이 Local이 1:1로 잠긴 근거는 없음 | REINTERPRET | survivor outpost/hub 의미는 유지 후보. first-play mandatory step 여부는 PM/Production Fill 필요 |
| R08-L02 역송출 주유소 | 두 번째 단계, 인양 기준점/출격 장비 | world_structure 제작 순서에는 유지. Final Lock은 Relay/Beacon/Recovery 역할을 분리 | REINTERPRET | physical recovery support 의미는 유지 후보. Sector Relay나 108초 forced gate로 사용 금지 |
| R01-L01 침묵 가장자리 | 첫 출격, 108초 인양 tutorial | latest R01 RPG는 first quest/field exploration으로 전환. R01-L01 시각 gate도 first scene을 유지 | KEEP | first playable R01 slice는 유지. 완료 조건은 시간 아닌 quest/exploration으로 교체 |
| R01-L02 분양 주택 루프 | 기본 run, old timer/boss-signal progression | RPG35가 첫 보고 뒤 분양 주택 기록 대조를 실제 후속 playable segment로 추가 | REINTERPRET | 후속 주거 탐사 Local 의미 유지. exact boundary/unlock은 current quest chain에 맞춰야 함 |
| R01-L03 모델하우스 결절 | 첫 boss/P0 종료 | RPG34/35 모두 boss/P1을 현재 범위에 앞당기지 않음. RPG35 끝까지 boss 미구현 | REORDER | Local과 boss role은 보존하되 first 15 min/old timer gate에서 뒤로 이동. exact placement는 REVIEW |

## 2. Rule 재검증

| Rule | 판정 | 근거 |
|---|---|---|
| 70초 pressure warning | LEGACY_RULE_REMOVE | current main contract에서 global timer pressure 제거 |
| 88초 signal collapse | LEGACY_RULE_REMOVE | current main contract에서 fixed-time progression 제거 |
| 108초 forced extraction | LEGACY_RULE_REMOVE | RPG34에서 강제 회수 없음, 300초 이후 자동회수 없음 검증 |
| 108초 완료 → L02 unlock | LEGACY_RULE_REMOVE | current progression은 quest/report/follow-up |
| fixed-time Run | LEGACY_RULE_REMOVE | current main은 time-unlimited regional exploration |
| main auto-fire | LEGACY_RULE_REMOVE | current main은 좌클릭 유지 공격, release stop |
| HP0 = death | LEGACY_RULE_REMOVE | current/world docs에서 HP0는 사망 의미가 아님 |
| emergency physical recovery | REINTERPRET | HP0/작전 불가 시 Recovery causality는 유지 가능. fixed timer와 분리 |
| voluntary return | KEEP | RPG34/35 current core contract |
| finite place-bound combat | KEEP | RPG34/35 current core contract |
| report/growth/revisit | KEEP | RPG34/35 current core contract |
| old boss signal 3 + 240 sec | LEGACY_RULE_REMOVE | current boss 미구현/조기 진행 금지 |
| R08-L02 = all-purpose extraction origin | REVIEW_NEEDED | Final Lock Relay/Beacon/Recovery 분리 필요 |

## 3. 질문별 답

### 여전히 첫 플레이에 필요한가?

확정:
- R01-L01: YES. current first field/slice 의미가 살아 있다.
- R01-L02: YES as follow-up residential play, 다만 old fixed-time unlock이 아니라 RPG35식 후속 quest 의미다.

확인 필요:
- R08-L01: first-play presentation/hub로 유지할지 current RPG safe hub와 정합화 필요.
- R08-L02: first-play mandatory 장비 단계인지, support infrastructure인지 확정 필요.
- R01-L03: current first 15 minutes에는 NO. boss role은 future C01 진행으로 보존.

### 순서가 맞는가?

과거 5-node strict order는 current gameplay authority와 맞지 않는다.

현재 근거가 보장하는 순서는:
quest accept → R01 current field objective → voluntary return → report/growth → next housing-record objective.

R08-L01/L02를 이 흐름 앞/사이/뒤 어디에 배치할지는 Production Fill 결정이 필요하다.

### 108초 강제 회수가 아직 유효한가?

아니다. main game 기본 progression/unlock rule로는 LEGACY다.

### R01-L03 첫 보스 도달 방식이 최신 gameplay와 맞는가?

아니다. old signal clues + 시간 gate는 current RPG와 맞지 않는다. RPG35까지 boss 자체가 의도적으로 범위 밖이다.

### R08 Relay / Beacon / Recovery 구조와 Final Lock에 맞는가?

현재 옛 문서의 용어 결합은 그대로는 맞지 않는다.

Final Lock:
- Relay = Sector/global movement role
- Beacon = Local sortie access role
- Extraction = Recovery Line + Beacon

따라서 R08-L02를 한 번에 Relay + Beacon + Extraction origin으로 처리하면 안 된다.

### 첫 15분 gameplay가 지역 탐사/전투로 자연스럽게 연결되는가?

구조적으로는 current RPG34/35가 그 방향을 제공한다.

- quest goal
- area exploration
- finite combat
- investigation
- voluntary return
- report/growth
- next goal

다만 자동 검사와 scripted capture는 재미를 증명하지 않는다. user normal-speed gameplay 재미/조작감은 current docs에서도 미승인이다.

## 4. P0 요약 분류

KEEP:
- R01-L01의 first playable residential field role.
- voluntary return.
- finite place-bound combat.
- report/growth/revisit.

REORDER:
- R01-L03 first boss를 old first-15-min P0 종착점에서 뒤로 이동.

REINTERPRET:
- R08-L01 survivor hub role.
- R08-L02 recovery support role.
- R01-L02 next residential exploration role.
- emergency physical recovery.

LEGACY REMOVE:
- 70/88/108 timer sequence as main progression.
- 108-second unlock.
- fixed-time run.
- main auto-fire.
- 240-second boss timing.

REVIEW:
- R08-L01/L02의 current first-play 위치.
- R01-L03의 exact quest placement.
- R08-L02와 Sector Relay/Local Beacon/Recovery Line 실제 분리.
- R01-L03 P0 priority metadata를 “production priority”로 유지할지 향후 조정할지.

## 5. 이번 draft에서 하지 않은 것

- P0 priority 값 자체 변경 없음.
- Local ID/이름 변경 없음.
- boss 새 timing 창작 없음.
- R08/R01 사이 새 edge 추가 없음.
- Unreal 구현 없음.
