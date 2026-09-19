# Unreal Persistence Test Translation

STATUS: RECOVERED RESEARCH / PROOF ONLY

NOT PRODUCTION AUTHORITY

NOT GAME BALANCE

NOT UNREAL PASS

이 문서는 Godot proof를 Unreal 구현으로 옮기는 문서가 아니다. proof가 확인했던 의미를 향후 Unreal 테스트 계약으로 다시 검증하기 위한 질문과 통과 조건만 정리한다.

## 테스트 계약 1. 최초 방문 상태

질문:
- 신규 지역 진입 시 persistence 대상 상태가 명시적인 초기값에서 시작하는가?
- 초기 상태와 시각적 표현이 일치하는가?

통과 조건:
- 최초 방문과 재방문을 구별할 수 있는 저장 상태가 존재한다.
- 초기 상태가 이전 세션의 잔여값에 오염되지 않는다.

## 테스트 계약 2. 물리 상태 변화

질문:
- facility의 파괴 또는 변경이 저장 대상의 authoritative state를 바꾸는가?
- NPC 또는 route의 파생 상태가 그 authoritative state를 참조하는가?

통과 조건:
- 단순 연출만 바뀌지 않고 원인 상태가 저장된다.
- 파생 상태는 원인 상태와 모순되지 않는다.

## 테스트 계약 3. 재방문

질문:
- 지역을 떠난 뒤 다시 들어왔을 때 이전 변화가 유지되는가?
- 이미 처리한 변화가 재진입만으로 중복 적용되지 않는가?

통과 조건:
- revisit가 첫 방문 상태로 되돌아가지 않는다.
- idempotent하게 동일 상태를 재구성한다.

## 테스트 계약 4. 저장 및 새 프로세스 재로드

질문:
- 게임 프로세스를 새로 시작한 뒤에도 저장된 facility, NPC, route 상태가 복원되는가?
- 메모리 캐시에만 남은 상태를 PASS로 잘못 판단하지 않는가?

통과 조건:
- 디스크 또는 production save authority에서 다시 읽어 같은 의미 상태를 만든다.
- 새 프로세스에서 복원 결과를 별도 검사한다.

## 테스트 계약 5. STANDARD / STRUCTURAL 의미

질문:
- STANDARD persistence와 STRUCTURAL persistence가 서로 다른 보존 범위를 갖는가?
- 구조적 변화가 단순 세션 상태와 같은 수명으로 취급되지 않는가?

통과 조건:
- 각 persistence profile의 저장 수명과 reset 조건이 테스트에서 명시된다.
- profile 간 승격 또는 강등은 별도 설계 승인 없이 일어나지 않는다.

## 회귀 질문

- facility가 변경되었는데 NPC가 이전 위치 또는 이전 서비스를 계속 사용하는가?
- route가 열리거나 닫힌 뒤 재방문에서 반대로 보이는가?
- 저장 직후에는 맞지만 새 프로세스에서는 초기화되는가?
- 동일 save를 두 번 로드했을 때 side effect가 중복 발생하는가?
- E01 proof의 좌표, node 수, 이동량을 테스트 계약 자체로 잘못 고정했는가?

이 문서는 Blueprint, C++, SaveGame 구현 코드를 포함하지 않는다.
