# 01 E01 Authority Reconciliation V0.1

상태: E01 REMAP PRODUCTION FILL / AUTHORITY AUDIT
작성 기준: 2026-09-19
대상: FINAL GLOBAL WORLD STRUCTURE LOCK V0.2 이후 E01 첫 Production Fill
변경 범위: 감사 및 재분류만 수행. Final Lock, 구현, 맵, ID, 연결 원본은 변경하지 않음.

## 0. 결론

현재 E01 재매핑의 권위 순서는 다음과 같다.

1. GitHub chatgpt-work의 FINAL GLOBAL WORLD STRUCTURE LOCK V0.2가 구조 최상위 권위다.
2. 로컬 C:/workspace/스팀펑크의 2026-09-16~18 Unreal/RPG 문서가 현재 R01 본게임의 플레이 계약 권위다.
3. 로컬 2026-09-12 Unreal 세계 구조 교정 문서는 40 Local / 37 Connection 보존과 R01/R08 공간 정체성의 현재 지원 근거다.
4. GitHub의 기존 E01/R01 월드 문서는 Local ID, 이름, 기존 역할, 37 edge의 역사적 원본으로 사용하되, 최신 Unreal/RPG와 충돌하는 런타임·시간·해금 규칙은 승격하지 않는다.
5. RECOVER proof는 Production 수치나 정사로 승격하지 않고 resource/persistence/rumor 적용 가능성을 판단하는 기능적 참고만 허용한다.

핵심 변경점은 분명하다. 2026-09-16 이후 R01 본게임은 시간 제한 생존 런이 아니라 의뢰 수락 → 시간제한 없는 지역 탐험 → 장소에 귀속된 유한 전투 → 플레이어 선택 귀환 → 보고/영구 성장 구조다. 따라서 70/88/108초 압력과 자동 회수는 본게임 기본 진행 또는 해금 규칙이 아니다.

## 1. Authority 분류

| 분류 | source path | 위치 | date/version | 핵심 규칙 | 현재 채택 | Final Lock 관계 |
|---|---|---|---|---|---|---|
| CURRENT_AUTHORITY | incoming/gpt_work/01_global_world_lock/GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md | GitHub | FINAL V0.2 | GLOBAL → SECTOR → CAMPAIGN → LOCAL, E01 8 Campaign, Production Entry 6필드, Relay/Beacon/Extraction 분리 | 채택 | 최상위. 수정 금지 |
| CURRENT_AUTHORITY | docs/unreal/r01_rpg34_20260916.md | local | 2026-09-16 | 의뢰·자유 탐험·유한 전투·자율 귀환·보고·성장, 300초 이후 자동회수 없음 | 채택 | E01_C01 현재 gameplay 해석에 사용 |
| CURRENT_AUTHORITY | docs/unreal/r01_rpg35_20260918.md | local | 2026-09-18 | 첫 의뢰 뒤 분양 주택 기록 대조, 조사·전투·자율 귀환·일회 성장, 보스/P1은 앞당기지 않음 | 채택 | E01_C01 후속 slice의 현재 구현 근거 |
| CURRENT_AUTHORITY | docs/unreal/main_subgame_combat_contract_20260914.md | local | 2026-09-16 개정 / 09-18 보강 | 본게임 수동 유지 공격, 시간제한 없는 탐험, finite local combat, 자율 귀환. auto attack은 서브게임에서만 가능 | 채택 | Local gameplay law의 현재 R01 근거 |
| CURRENT_SUPPORTING | docs/unreal/world_structure_execution_20260912.md | local | 2026-09-12 | E01 40 Local / 37 Connection 보존, R08 침묵권과 R01 주거 캠페인 분리, Unreal 제작 순서 | 채택 | Final Lock 하위 제작 해석. 새 global 구조를 만들지 않음 |
| CURRENT_SUPPORTING | docs/unreal/R01_L01_UNREAL_HERO_SHOT_GATE_V0_1.md | local | 2026-09-10 | R01-L01의 현재 Unreal 공간 의미와 first-scene 구성, L02/보스/P1 목표 조기 투입 금지 | 채택 | R01-L01 시각/공간 의미만 지원 |
| CURRENT_SUPPORTING | docs/unreal/r08_supply_execution_20260912.md | local | 2026-09-12 | R08-L01 생존자 보급소 공간 후보, 귀환→정산→휴식 관계. 기능/플레이 완료 아님 | 부분 채택 | C08/R08 공간 참고. Campaign 운영 규칙으로 승격 금지 |
| CURRENT_SUPPORTING | docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md | GitHub | v0.1 | 8 Campaign × 5 Local = 40, Local ID/이름/priority/기존 역할 | inventory에 채택 | Final Lock의 E01 하위 Production Fill 원본 |
| CURRENT_SUPPORTING | data/world/e01_world_map_nodes_v0_1.json | GitHub | schema v1 | 40 nodes와 실제 37 links | 원본 개수/edge에 채택 | edge 추가 없이 감사 기준으로 사용 |
| LEGACY_REFERENCE | docs/world/E01_WORLD_MAP_BLOCKOUT_V0_1.md | GitHub | v0.1 | 기존 좌표/노출/P0~P2/인양 등급 | 참고 | normalized 좌표와 옛 인양 구조는 Final Lock 이동 체계와 별도 검토 |
| LEGACY_REFERENCE | docs/world/E01_WORLD_MAP_PRODUCTION_TABLE_V0_1.md | GitHub | v0.1 | 각 Local 위치감·기존 플레이/서사 역할 | 참고 | 이름/역할 inventory 근거. 현재 Unreal gameplay 권위 아님 |
| LEGACY_REFERENCE | docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md | GitHub | v0.1 | signal detect → interpret → sortie의 옛 P1 해금 구조 | 참고 | 실제 Campaign Production Entry와 travel graph는 재감사 필요 |
| CONFLICTING_LEGACY | docs/world/R01_FIRST_SORTIE_LEVEL_CONNECTION_V0_1.md | GitHub | v0.1 Godot | 108초 강제 회수, 고정 anchor, L01→L02 unlock, 옛 boss timing | 시간/해금은 폐기 | 최신 RPG34가 충돌을 명시적으로 교체 |
| CONFLICTING_LEGACY | docs/world/R01_L03_FIRST_BOSS_DETAIL_V0_1.md | GitHub | v0.1 Godot | signal clues + 시간 기반 boss 진입, old runtime anchor | timing은 폐기/role만 참고 | 최신 RPG34/35에서 boss는 아직 앞당기지 않음 |
| CURRENT_SUPPORTING + CONFLICT_NOTE | docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md | GitHub | v0.1 | HP0는 사망이 아니라 물리적 긴급 인양, Beacon/Recovery causality | 개념만 채택 | Final Lock의 Beacon + Recovery Line과 정합. 108 trigger/A0~A4 고정은 현행 권위 아님 |
| REVIEW_NEEDED | campaign-logic-20260905-235627 | local proof | 2026-09-05~06 | 자원·시설 가용성이 서비스/선택 결과에 인과적으로 연결될 수 있음 | 후보만 | production 수치/설정 승격 금지 |
| REVIEW_NEEDED | map-evolution-proof-20260906-055930 | local proof | 2026-09-06 | 방문 이후 상태를 보존하고 재방문에 반영하는 기능 proof | 후보만 | persistence 설계 후보, class 확정 근거 아님 |
| REVIEW_NEEDED | mystery-proof-20260906-011128 | local proof | 2026-09-06 | 서로 다른 기록 대조, 행동 이력 기억, 선택 결과의 후속 반영 | 후보만 | rumor/direct-memory 분리 후보. 정사 승격 금지 |

## 2. 특별 충돌 검사

| 항목 | 과거 기준 | 최신 Unreal/RPG 기준 | 판정 |
|---|---|---|---|
| 108초 forced extraction | R01-L01 70/88/108 압력과 강제 회수, L02 unlock gate | RPG34가 강제 회수·전역 압력·무한 웨이브를 제거했고 300초 이후 자동회수 없음까지 검사. main combat contract도 70/88/108을 본게임 기본에서 제외 | LEGACY |
| fixed-time Run | 시간 생존/회수로 progression | 시간제한 없는 지역 탐험, 의뢰 목표와 장소 귀속 전투, 플레이어 선택 귀환 | LEGACY |
| auto-fire | Godot/Vampire-Survivor 계열 자동 사격 해석 | 본게임은 좌클릭 유지 중 반복 공격, 해제 시 중지. 자동 공격은 서브게임에서 가능 | LEGACY for main |
| return / extraction | 정해진 시각의 forced recovery가 progression gate | 정상 귀환은 플레이어가 E로 선택. HP0의 물리적 emergency recovery 개념은 유지 가능 | CURRENT = voluntary return + emergency recovery, timer trigger는 LEGACY |
| boss timing | signal clue 3 + 240초 등 시간 기반 첫 보스 진입 | RPG34/35는 보스/P1을 현재 slice에 앞당기지 않음. RPG35까지 보스 미구현 | LEGACY / REVIEW |
| R01 위치 | P0 전체를 사실상 주택가 진행이 지배 | R01은 E01_C01의 Local slice이며 E01 전체는 8 Campaign. 최신 RPG도 R01만 구현 중일 뿐 Sector를 R01로 축소하지 않음 | CURRENT |
| R08 위치 | 옛 P0에서 시작 허브/인양 중심 | 최신 world_structure는 R08을 생존자 운영 침묵권 예외로 분리. E01_C08과는 역사적 관계. Final Lock에서 Relay/Beacon/Recovery 역할 분리 필요 | REVIEW |

## 3. Godot 7 anchor 감사

최신 docs/unreal에서 아래 7개 정확한 식별자 검색 결과는 모두 0건이었다. Unreal 쪽은 Route29/RPG34/RPG35 자체 map manifest와 runtime 위치를 사용한다. 따라서 식별자 자체를 현재 Unreal 계약으로 승격하지 않는다.

| legacy anchor | 옛 의미 | 최신 exact ID | 처리 |
|---|---|---|---|
| silence_edge_start | R01-L01 첫 진입 | 없음 | 의미만 KEEP_REINTERPRET. 현재 R01 first field entry로 재정의 필요 |
| outer_recovery_lane_anchor | R01-L01 회수 차선 | 없음 | return/recovery 공간 의미만 KEEP_REINTERPRET. 108초 gate 제거 |
| subdivision_loop_center | R01-L02 주거 루프 중심 | 없음 | RPG35의 분양 주택 기록 대조와 의미 연속성 있음. exact anchor는 LEGACY |
| open_house_street_anchor | L02 내부 boss signal 구간 | 없음 | REVIEW_NEEDED. 현재 RPG35에서 boss unlock 기능 근거 없음 |
| model_house_node_anchor | R01-L03 boss 진입 | 없음 | Local boss 의미만 보존 후보. timing/runtime anchor는 LEGACY |
| drain_pocket_anchor | R01-L04 P1 숨은 회수 | 없음 | REVIEW_NEEDED. 최신 Unreal 구현 근거 없음 |
| fake_return_route_anchor | R01-L05 P1 재방문 변형 | 없음 | REVIEW_NEEDED. 최신 Unreal 구현 근거 없음 |

## 4. R01 / R08 권위 경계

- R01-L01~L05는 E01_C01 내부 Local이다.
- 최신 RPG34/35는 E01_C01의 현재 playable slice에 대한 권위이지 E01 전체 구조의 권위가 아니다.
- R01-L01 의미는 현재 첫 의뢰/현장 탐사와 연결할 수 있다.
- R01-L02 의미는 RPG35의 분양 주택 기록 대조 후속 구간과 연결 가능하지만, 옛 L01 108초 완료 → L02 자동 해금 구조는 유지하지 않는다.
- R01-L03의 boss role은 이름/Local inventory 차원에서 남지만, 현 RPG35까지 실제 보스 진행은 미구현이며 첫 15분 또는 시간 gate로 되살리지 않는다.
- R08-L01은 현재 생존자 보급소 공간 후보가 존재하지만 최종 기능/플레이 PASS가 아니다.
- R08-L02를 Sector Relay, Local Beacon, Recovery Line 중 무엇으로 쓸지는 Final Lock 역할 분리를 따라 별도 Production Fill이 필요하다. 옛 “모든 인양의 단일 원점”을 자동 채택하지 않는다.

## 5. 채택 규칙

CURRENT:
- GLOBAL → E01 → E01_C01~C08 → Local.
- 40 Local ID와 이름 inventory.
- JSON의 37 edge 원본 집합.
- R01 main gameplay: quest, free exploration, finite local combat, voluntary return, report/growth, revisit persistence.
- main basic attack: manual held attack.
- HP0/emergency extraction은 사망이 아닌 물리적 recovery로 해석 가능.

LEGACY:
- 108초 forced extraction을 main progression/unlock으로 사용.
- 70/88/108 global pressure 기본 규칙.
- fixed-time run을 E01 Local 공통 규칙으로 사용.
- Godot exact anchor 이름을 Unreal runtime anchor로 사용.
- old 240초 boss timing을 current R01 boss gate로 사용.
- auto-fire를 main game 기본 공격으로 사용.

REVIEW:
- R08-L01/L02가 현재 first-play prerequisite인지.
- R01-L03 boss를 current RPG quest chain 어디에 배치할지.
- 37 edge의 visibility/unlock 의미와 실제 travel 의미 분리.
- R06/R07 ingress 부재를 어떻게 Production graph에서 처리할지.
- Campaign별 6-field Production Entry와 persistence class.

## 6. 변경 확인

- Final Lock 수정: 0
- Local ID 추가/삭제/개명: 0
- Connection 추가/삭제: 0
- Unreal/Blueprint/C++ 구현: 0
- E02~E12 Local 생성: 0
