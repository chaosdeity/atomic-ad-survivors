# 08 E01 Remap PM Decision Sheet V0.1

상태: PM DECISION REQUIRED
목표: 문서 근거로 이미 결정 가능한 항목은 제거하고, 실제로 PM 선택이 필요한 항목만 남긴다.

## 0. 이미 결정되어 다시 묻지 않는 것

다음은 최신 권위로 결론이 났다.

- 108초 forced extraction은 current main-game progression/unlock rule이 아니다. LEGACY.
- 70/88/108 global timer pressure는 current main gameplay default가 아니다. LEGACY.
- current main basic attack은 수동 유지 공격이다. auto-fire는 main default가 아니다.
- current R01은 quest → free exploration → finite local combat → voluntary return → report/growth 구조다.
- R01은 E01_C01 Local slice다. E01 전체를 R01로 축소하지 않는다.
- E01은 8 Campaign × 5 Local = 40 Local이다.
- source connection은 정확히 37개이며 이번 작업에서 edge를 추가하지 않는다.
- R01-L03의 old 240초 boss timing은 current rule로 유지하지 않는다.
- proof 수치를 Production에 적용하지 않는다.
- Final Lock은 수정하지 않는다.

## 1. PM-01: R08-L01 / R08-L02를 첫 플레이 흐름에 어떻게 배치할 것인가

확정 근거:
- R08-L01은 current Unreal에서 survivor-operated supply outpost 공간 후보가 있다.
- R08-L02는 world_structure 제작 순서에서 physical recovery equipment 역할 후보가 있다.
- current RPG34의 실제 playable flow는 별도 safe hub에서 quest를 수락하고 R01 field로 들어간다.
- 현재 자료만으로 RPG34 safe hub가 R08-L01과 1:1 canonical 동일 공간이라고 확정할 수 없다.

PM 결정 필요:
A. R08-L01 → R08-L02를 first-play playable prerequisite로 유지한다.
B. R08-L01을 framing/settlement hub로 유지하되 R08-L02는 optional/support infrastructure로 둔다.
C. current R01 RPG hub를 먼저 canonicalize한 뒤 R08 연결을 후속 Production Fill로 둔다.

결정 영향:
- P0 first 15 min 순서.
- R08-L02→R01-L01 edge의 travel 의미.
- first onboarding에서 shelter/resource system을 언제 노출할지.

## 2. PM-02: R01-L03 boss를 current RPG quest chain 어디에 배치할 것인가

확정 근거:
- R01-L03 Local ID/이름/boss role은 기존 inventory에 있다.
- old 240초/signal timer는 LEGACY.
- RPG34/35는 boss를 현재 구현 범위에 앞당기지 않았다.
- RPG35는 두 번째 조사 구간까지 연결했지만 전체 “같은 집의 이름” 연쇄와 boss는 미구현이다.

PM 결정 필요:
- boss를 몇 번째 quest/revisit milestone 뒤에 Production Fill할지.
- P0 priority를 “early production priority”로 유지할지, 실제 first-play priority와 분리할지.

금지:
- 새 초 단위 timer를 이번 결정 대신 임의 생성하지 않는다.

## 3. PM-03: legacy Godot anchor를 Unreal design anchor로 어떤 수준까지 보존할 것인가

확정 근거:
- 최신 docs/unreal에서 7개 old identifier exact match는 0건.
- semantic continuity는 일부 존재한다.
  - silence_edge_start: current R01 entry 의미
  - subdivision_loop_center: RPG35 housing follow-up 의미
  - model_house_node_anchor: future boss Local 의미
- current Unreal은 자체 map manifest/runtime 위치를 사용한다.

PM 결정 필요:
A. 이름은 폐기하고 semantic role만 Unreal tagging/Production Entry에 이관.
B. legacy alias로 문서에만 남기고 Unreal runtime에서는 새 이름 사용.
C. 일부만 current design anchor로 승격.

추천 경계:
- exact Godot identifier를 runtime 권위로 부활시키지는 않는다.

## 4. PM-04: E01 Sector Relay / Local Beacon / Recovery Line 실제 역할 배치

확정 근거:
Final Lock은 다음을 분리한다.
- Sector Relay = global/sector movement
- Local Beacon = Local sortie access
- Extraction = Recovery Line + Beacon

문제:
- old R08-L02 “역송출 주유소/인양 기준점” 문서는 이 역할을 섞어 해석할 여지가 있다.
- source 37 Local edge는 Relay graph가 아니다.

PM 결정 필요:
- E01의 Sector Relay anchor를 어느 infrastructure에 둘지.
- R08-L02가 Local Beacon/Recovery support 중 무엇을 담당할지.
- 한 Local이 여러 역할을 겸할 경우 UI/데이터에서 role을 별도 필드로 나눌지.

## 5. PM-05: 37 source edge를 visibility graph와 physical travel graph로 분리할 것인가

확정 근거:
- source 37 edge에는 main/branch/boss_branch/remote_signal/blockade/internal_crisis가 섞여 있다.
- R06-L01과 R07-L01은 source edge 내 외부 ingress가 없다.
- remote_signal을 physical travel로 볼 근거가 없다.
- Final Lock은 visibility/dependency와 travel 역할을 구분한다.

PM 결정 필요:
A. 37개는 historical visibility/progression graph로 보존하고, physical travel graph를 별도 Production data로 만든다.
B. 37개 자체를 차후 승인 작업에서 travel semantics까지 재분류한다.
C. Campaign dependency graph와 Local travel graph를 완전히 분리하고 37개는 legacy mapping source로만 둔다.

이번 작업에서는 어떤 선택도 적용하지 않았고 edge 수는 37을 유지했다.

## 6. PM-06: Persistence Production Fill의 첫 대상과 깊이

확정 근거:
- C01 current RPG는 quest/checkpoint/revisit persistence의 실제 runtime 근거가 있다.
- C08 current Unreal은 resource/shelter infrastructure 공간 근거가 있다.
- C02 proof는 service availability/patient decision 같은 persistence 후보를 보여주지만 canon 구현은 아니다.
- Final Lock persistence class는 Campaign별 Production Fill 대상이다.

PM 결정 필요:
- 첫 class assignment를 C01부터 할지 C01+C08 병렬로 할지.
- C01 current state를 LIGHT 또는 STANDARD 수준의 Production profile로 확장할지.
- C08 supply/infrastructure 상태를 survivor layer와 historical C08 campaign layer 중 어디에 귀속할지.

현재 상태:
CANDIDATE / NOT IMPLEMENTED.

## 7. PM-07: Campaign Production Fill 우선순위

근거 기반 작업 가능도:
- C01: current gameplay 자료가 가장 많음.
- C08: current spatial/infrastructure 자료가 있음.
- C02/C03: legacy local 역할과 proof/서사 연결 근거가 비교적 많음.
- C04/C06: family와 Local inventory는 있으나 current gameplay 근거 부족.
- C05/C07: Final Lock상 차별화와 rumor/travel 설계가 특히 중요하며 current Unreal 구현 없음.

PM 결정 필요:
- 다음 Production Fill 순서를 승인한다.
- 후보 순서: C01 → C08 → C02/C03 → C04/C06 → C05/C07.
- 이 순서는 “게임 내 해금 순서”가 아니라 “설계 Production Fill 작업 순서” 후보다.

## 8. 승인 전 HOLD 항목

PM 결정 전 실제 Unreal 구현으로 넘어가지 않는다.

HOLD:
- R08/R01 onboarding order 변경.
- R01-L03 boss 구현/timing.
- old anchor runtime 승격.
- Sector Relay/Beacon/Recovery 실제 data assignment.
- 37 edge 재작성/추가.
- persistence class 확정.
- C02~C08 gameplay 구현.

## 9. 승인 후 다음 작업의 최소 입력

PM이 위 항목을 결정하면 다음 Production Fill이 가능하다.

1. E01_C01 Production Entry 6-field V0.1.
2. E01 travel-role schema: Relay / Beacon / Recovery / Local connection 분리.
3. R01 current quest chain ↔ Local node mapping.
4. C01 persistence class와 direct memory scope.
5. 이후 승인된 Campaign 순서로 6-field fill.

최종 상태:
E01 REMAP DRAFT READY / PM APPROVAL WAIT.
