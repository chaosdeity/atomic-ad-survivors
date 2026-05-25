# Main.gd Responsibility Report

작성일: 2026-05-17
대상: `scripts/main.gd`
현재 줄 수: 약 1602줄

## 1. 현재 main.gd가 맡고 있는 책임

`main.gd`는 현재 게임의 런타임 중심이다. 단순 씬 루트가 아니라 게임 시스템 상당수를 직접 소유한다.

## 2. 책임 목록

| 책임 | 대표 함수/상태 | 현재 평가 |
| --- | --- | --- |
| 씬 초기화 | `_ready`, `_build_camera`, `_build_audio` | 유지 가능 |
| 입력 처리 | `_input`, `_ensure_input_map`, `_card_choice_from_event`, `_supply_choice_from_event` | UI/전투/디버그가 섞임 |
| 메인 루프 | `_process` | 모든 상태와 시스템 호출을 직접 순서화 |
| 플레이어 이동 | `_update_player`, `player_pos`, `last_move_dir` | 분리 가능 |
| 적 접촉 피해 | `_update_enemies` | enemy controller와 main 사이 책임 중복 |
| 자동공격 | `_update_auto_fire`, `_try_split_shot` | 카드/보스/적 라우팅이 섞임 |
| 차징 | `_update_charge`, `_fire_charge`, `_charge_hit_indices` | 가장 복잡한 전투 책임 중 하나 |
| 장판/폭발 | `_update_charge_puddles`, `_try_kill_burst`, `_spawn_charge_puddle` | 카드 효과와 전투 효과가 섞임 |
| 보스 연결 | `_update_boss`, `_apply_boss_damage`, `_start_boss_encounter` | 보스 컨트롤러와 경계는 있으나 라우팅은 main |
| 웨이브 이벤트 | `_update_wave_events`, `_update_preboss_signal_events` | progression과 wave가 섞임 |
| 첫 회수 | `_update_first_recall_event`, `_apply_first_recall_collapse` | 튜토리얼/스토리 진행으로 분리 가능 |
| 라우트 UI | `_route_stage_label`, `_next_goal_label`, `_boss_route_ready` | 새 progression 모듈 후보 |
| 결과 처리 | `_finish_match`, `_result_data` | 보상/결과/화면 콜백이 섞임 |
| 보급소 | `_show_supply_depot`, `_apply_supply_upgrade_choice` | 성장 시스템 확장 전에 분리 권장 |
| 카드 선택 | `_show_level_card`, `_apply_card_choice`, `_apply_card_effect` | player combat/card system으로 분리 후보 |
| HUD 갱신 | `_update_hud`, `_debug_overlay_text`, `_debug_info` | 표시 데이터 생성과 UI 호출이 섞임 |
| 디버그 명령 | `_debug_*` 15개 이상 | debug command handler로 분리 가능 |
| 드로잉 | `_draw_*` 아레나/플레이어/적 마커 | 렌더링 책임이 main에 남음 |
| 재시작/초기화 | `_restart`, `_reset_player_stats` | 런 세션 초기화 모듈 후보 |
| 수치 계산 | `_move_speed`, `_auto_range`, `_charge_damage` 등 | player stats 계산기로 분리 가능 |

## 3. 가장 큰 구조 문제 5개

1. **전투, 진행, UI, 성장 정산이 모두 main.gd에 직접 결합되어 있다.**
   RPG 성장 경제를 넣으면 `_finish_match`, `_restart`, `_result_data`, `_show_supply_depot`, `_reset_player_stats`가 동시에 커질 가능성이 높다.

2. **런 성과 정산 지점이 없다.**
   현재 보상은 특정 이벤트에서 직접 지급된다. 생존 시간, 처치, 엘리트, 신호 이벤트, 보스 HP 성과를 종합하는 독립 함수/모듈이 필요하다.

3. **보스 해금/신호추적이 route label과 sortie_index에 얽혀 있다.**
   성과 기반 단서 시스템을 도입하려면 `sortie_index` 조건을 약화하고 별도 route progression state가 필요하다.

4. **전투 피해 라우팅이 적과 보스 사이에 통합되어 있지 않다.**
   자동공격, 차징, 폭발, 장판이 enemy와 boss에 각각 다른 경로로 들어간다. 카드가 늘수록 누락 위험이 커진다.

5. **UI 표시 데이터와 게임 규칙 데이터가 같은 함수에서 만들어진다.**
   `_result_data`, `_session_progress_data`, `_debug_info`가 게임 상태 해석을 직접 수행한다. PMO가 바꿀 문구/구조와 코드 규칙이 분리되지 않았다.

## 4. main.gd 분리 우선순위

### P0. Run Result Evaluator

분리 대상:

- `_finish_match`
- 보상 지급 조건
- 회수/사망/생존/보스 결과 정산
- 생존 시간/처치/엘리트/보스 HP 기반 보상 계산

권장 파일:

`scripts/run_result_evaluator.gd`

이유:

RPG 성장 구조의 첫 관문이다. 빨리 죽기 파밍 방지와 성과 기반 재화 지급은 여기서 시작해야 한다.

### P1. Route Progression

분리 대상:

- `_route_stage_label`
- `_next_goal_label`
- `_boss_route_ready`
- `_update_preboss_signal_events`
- `boss_signal_state`, `boss_signal_unlocked`, 신호 단서 상태

권장 파일:

`scripts/route_progression.gd`

이유:

신호추적 1/2/3을 출격 횟수가 아니라 성과 기반 단서로 바꾸려면 독립 state owner가 필요하다.

### P2. Player Combat Controller

분리 대상:

- `_update_auto_fire`
- `_update_charge`
- `_fire_charge`
- `_charge_hit_indices`
- `_apply_card_effect`
- `_try_split_shot`, `_try_kill_burst`, charge aftereffects

권장 파일:

`scripts/player_combat_controller.gd`

이유:

카드/빌드/장기 업글이 늘어날수록 플레이어 전투 계산이 독립되어야 한다.

### P3. Supply Depot Controller

분리 대상:

- `_show_supply_depot`
- `_apply_supply_upgrade_choice`
- 보급소 표시 데이터 생성
- 구매 가능/적용 결과 UI 메시지

권장 파일:

`scripts/supply_depot_controller.gd`

이유:

보급소는 곧 업글 트리, 정산, 흔적, 목표 게시판을 모두 품게 된다. 지금처럼 result panel 재활용만으로는 금방 막힌다.

### P4. Damage Router

분리 대상:

- 적/보스 피해 적용
- 방어 타입 효과
- damage number 종류
- shield/boss 특별 판정

권장 파일:

`scripts/damage_router.gd`

이유:

적과 보스가 서로 다른 API를 쓰는 현재 구조는 새 공격/카드/상성 추가 시 중복과 누락을 만든다.

## 5. 즉시 분리하지 않아도 되는 것

- `AudioFactory`: 현재 작고 독립적이다.
- `SpriteAssets`: 현재 sprite fallback 역할로 충분하다.
- `EffectsController`: 커졌지만 전투 규칙을 직접 결정하지 않으므로 P0은 아니다.
- `BossController`: 보스 단일 책임은 비교적 선명하다. 다만 보스 소환물/전용 결과가 늘면 보조 모듈 필요.

## 6. main.gd에 남겨도 되는 최종 책임

장기적으로 `main.gd`는 다음 정도만 남기는 것이 좋다.

- 씬 루트 초기화.
- 시스템 객체 생성.
- `_process`에서 모듈 update 순서 호출.
- `_input`에서 입력을 각 모듈로 전달.
- `_draw`에서 렌더 모듈 호출.
- 최상위 상태 전환 조정.

목표 크기:

- 현재 약 1600줄.
- 1차 분리 후 900~1100줄.
- 성장/보급소/전투 분리 후 500~700줄.

## 7. 확인 필요 항목

- Godot 4.2 호환성을 유지할지, 현재 검증 기준인 Godot 4.6.2를 기준으로 삼을지 결정 필요.
- 보급소 UI를 코드 Control로 계속 만들지, 별도 scene으로 분리할지 결정 필요.
- 성과 기반 보상 시스템을 먼저 문서대로 구현할지, `main.gd` 분리부터 할지 PMO 판단 필요.
