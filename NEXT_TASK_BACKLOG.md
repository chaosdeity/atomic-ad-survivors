# Next Task Backlog

작성일: 2026-05-17
목적: Codex 새 방에 바로 줄 수 있는 작업 후보 10개를 정리한다.
원칙: 한 방에 한 작업. 커밋은 통합 방에서만 수행.

## 우선순위 요약

| 순위 | 작업 | 목적 |
| ---: | --- | --- |
| 1 | Run Result Evaluator 설계/구현 | 빠른 죽음 파밍 방지와 성과 기반 보상 |
| 2 | Signal Clue Progression 구현 | 신호추적을 출격 횟수에서 단서 기반으로 전환 |
| 3 | 보급소 UI 확장 설계 | 12개 이상 업글을 담을 화면 기반 |
| 4 | Meta Upgrade Tree 1차 구현 | RPG 성장 체감 추가 |
| 5 | main.gd 정산/루트 책임 분리 | 성장 시스템 추가 전 구조 안정화 |
| 6 | Card Catalog 희귀도/해금 설계 | 런 중 성장과 메타 성장 연결 |
| 7 | Damage Router 설계 | 적/보스 공통 피해 처리 |
| 8 | Web 한글 폰트/보급소 UI 시각 검수 | 실제 배포 가독성 확인 |
| 9 | 보스 도달/회수/처치 손플레이 체크리스트 | PMO 밸런스 판단 자료 |
| 10 | 0.2 통합 개발 로드맵 | Pro PMO 판단용 마일스톤 정리 |

## TASK 1. Run Result Evaluator 추가

목표:

런 종료 시 보상을 직접 지급하지 말고 생존 시간, 처치, 엘리트 처치, 신호 이벤트, 보스 HP 성과를 바탕으로 보상안을 계산하는 모듈을 추가한다.

수정 예상 파일:

- `scripts/run_result_evaluator.gd` 새로 추가
- `scripts/main.gd`
- `scripts/meta_progression.gd`
- 필요 시 `tools/balance_sim.py`

완료 조건:

- 45초 미만 보상 없음.
- 60/90/120/180/240초 성과 구간 구분.
- 빠른 죽음 파밍 방지 규칙 포함.
- 기존 첫 회수/보스 회수/보스 승리 동작을 깨지 않음.
- 커밋하지 않음.

## TASK 2. Signal Clue Progression 구현

목표:

`신호추적 1/3`을 출격 횟수가 아니라 실제 단서 state로 전환한다.

단서 초안:

- 미약한 송출 기록
- 방향이 뒤틀린 송출 지도
- 송출관 접근 절차 흔적

수정 예상 파일:

- `scripts/meta_progression.gd`
- `scripts/main.gd`
- `scripts/hud_controller.gd`
- `scripts/debug_tools.gd`

완료 조건:

- 단서 3개 보유 시 보스 조우 가능.
- `sortie_index >= 5` 직접 조건 제거 또는 보조 조건으로 약화.
- 중복 단서 획득 시 일반 재화로 전환.

## TASK 3. 보급소 UI 확장 설계

목표:

현재 4개 버튼 고정 보급소를 12개 이상 업글을 담을 수 있는 구조로 바꿀 설계/1차 UI를 만든다.

수정 예상 파일:

- `scripts/hud_controller.gd`
- 필요 시 `scripts/supply_depot_controller.gd` 새로 추가

완료 조건:

- 결과 화면과 보급소 화면 역할 분리 방향 제시.
- 업글 카테고리 또는 페이지 구조.
- 270px viewport에서 겹침 없음.
- 기존 4개 강화 구매 가능.

## TASK 4. Meta Upgrade Tree 1차 구현

목표:

보급소 업글을 최소 12개로 확장한다.

업글 분류:

- 기본 전투
- 차징
- 생존
- 성장/XP
- 신호 분석
- 보스 대응

수정 예상 파일:

- `scripts/meta_progression.gd`
- `scripts/main.gd`
- `tools/balance_sim.py`

완료 조건:

- 각 업글에 비용, 최대 레벨, 효과, 해금 조건 존재.
- 기존 4개 업글 보존.
- 너무 큰 수치 상승 금지.

## TASK 5. main.gd 정산/루트 책임 분리

목표:

`main.gd`에서 런 결과/보스 루트/목표 라벨 책임을 분리한다.

수정 예상 파일:

- `scripts/route_progression.gd` 새로 추가
- `scripts/main.gd`
- `scripts/debug_tools.gd`

완료 조건:

- `_route_stage_label`, `_next_goal_label`, `_boss_route_ready`가 새 모듈로 이동.
- 기존 HUD 표시 유지.
- 디버그 HUD 정보 유지.

## TASK 6. Card Catalog 희귀도/해금 설계

목표:

런 중 카드가 메타 성장/신호 진행과 연결될 준비를 한다.

수정 예상 파일:

- 설계 문서 또는 `scripts/level_up_cards.gd`

완료 조건:

- 카드 rarity 초안.
- 카드 해금 조건 초안.
- 보급소 업글과 충돌하지 않는 성장 방향.
- 구현을 바로 하지 않는다면 문서만 작성.

## TASK 7. Damage Router 설계/1차 추출

목표:

적과 보스 피해 처리를 공통 라우터로 묶을 수 있는 경계를 만든다.

수정 예상 파일:

- `scripts/damage_router.gd` 새로 추가
- `scripts/main.gd`
- `scripts/enemy_controller.gd`
- `scripts/boss_controller.gd`

완료 조건:

- 자동/차징/폭발/장판 damage type 유지.
- 방어 타입 효과 유지.
- 기존 보스 방패/왜곡 특수 판정 유지.
- 대규모 리팩터 금지, 1차 thin wrapper 권장.

## TASK 8. Web 한글 폰트/보급소 UI 시각 검수

목표:

Web export에서 한국어가 네모 글리프로 보이는 문제와 보급소 UI 겹침을 실제 브라우저/스크린샷으로 확인한다.

수정 예상 파일:

- 가능하면 없음.
- 필요 시 `scripts/ui_font.gd`, `export_presets.cfg`, `project.godot`.

완료 조건:

- Web export 성공.
- 로컬 서버 실행.
- 브라우저 스크린샷 확인.
- 폰트 문제 원인 기록.
- 수정이 필요하면 별도 작업으로 분리.

## TASK 9. 보스 루프 플레이테스트 체크리스트 작성

목표:

PMO와 사용자가 같은 기준으로 보스 도달/회수/처치 감각을 평가할 수 있게 체크리스트를 만든다.

출력 파일:

- `BOSS_PLAYTEST_CHECKLIST.md`

포함 항목:

- 보스 첫 조우까지 평균 런 수.
- 보스 HP 65/25% 도달 체감.
- Phase 3 광폭 읽힘.
- 코어 노출 보상감.
- 보스 패배 후 다음 도전 욕구.

## TASK 10. 0.2 통합 개발 로드맵 작성

목표:

현재 구현 상태와 `META_PROGRESSION_ARCHITECTURE.md`를 바탕으로 0.2까지의 PMO용 마일스톤을 만든다.

출력 파일:

- `VERSION_0_2_ROADMAP.md`

포함 항목:

- P0/P1/P2 범위.
- 구현 순서.
- 플레이테스트 기준.
- 금지 범위.
- Codex 방 분배 전략.

## 확인 필요 항목

- `META_PROGRESSION_ARCHITECTURE.md`는 이미 존재하지만 미추적 상태다. PMO가 이 문서를 공식 기준으로 삼을지 확인 필요.
- `story/` 폴더도 미추적 상태다. 통합 여부를 별도 결정해야 한다.
- `README_GAME.md`, `RPG_ARCHITECTURE_PLAN.md`는 기존 수정 상태다. 이 감사 작업과 별도 흐름으로 관리해야 한다.
