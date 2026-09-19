# Map Evolution Recovery Context

STATUS: RECOVERED RESEARCH / PROOF ONLY

NOT PRODUCTION AUTHORITY

NOT GAME BALANCE

NOT UNREAL PASS

## 역할

이 폴더는 map-evolution-proof의 지역 상태 영속성 검증 결과를 보존한다. Godot 런타임을 production으로 옮기거나 E01의 로컬 구조를 글로벌 기준으로 만드는 자료가 아니다.

## 유효하게 회수한 것

- direct persistence
- revisit state
- facility, NPC, route change의 재방문 반영
- save/reload 이후 상태 보존 검증
- Final Lock의 STANDARD/STRUCTURAL persistence 의미를 검증할 때 참고할 수 있는 테스트 패턴

## 승격 금지

- Godot runtime 직접 port 금지
- E01 proof의 node 밀도를 글로벌 표준으로 사용 금지
- Godot PASS를 Unreal PASS로 해석 금지
- proof의 좌표, 이동량, 프레임 수를 production 값으로 승격 금지

## 원본 경로 불일치 해결

**RESOLVED BY PM SOURCE PATH CORRECTION**

초기 승인 경로 `proof02/control01/control_results.json`은 Workspace에 존재하지 않았다.

PM 검증 후 실제 source `control01/control_results.json`을 승인했으며 SHA-256은 `8e84a66d528f343023f20496df78cd50583028f06e80aa3cba17f877dcd7df59`이다. 로컬 격리 clone을 통해 `docs/world/evidence/map_evolution_20260906/control_results.json`으로 회수했고, GitHub `chatgpt-work`에서 read-back을 확인했다.

Recovery commit: `1f0731e89d900071d499ba323d08548f1e5c3453`

## Binary Recovery Pending

아래 PNG는 원본 존재, 크기, SHA-256까지 확인했지만 현재 GitHub connector 경로에서 binary direct write가 차단되어 변환이나 placeholder 없이 보류했다.

- 01_first_visit.png
- 04_revisit.png
- 06_fresh_process_reload.png

상세 source path, target path, size, SHA는 Recovery Execution Manifest에 기록한다.
