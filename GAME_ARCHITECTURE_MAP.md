# Game Architecture Map

작성일: 2026-05-17
목적: GPT Pro PMO와 Codex 구현방이 현재 코드 구조를 빠르게 파악하기 위한 지도.

## 1. 실행 구조

```text
project.godot
-> scenes/main.tscn
-> scripts/main.gd
   -> game_config.gd
   -> hud_controller.gd
   -> effects_controller.gd
   -> enemy_controller.gd
   -> level_up_cards.gd
   -> wave_director.gd
   -> debug_tools.gd
   -> sprite_assets.gd
   -> meta_progression.gd
   -> boss_controller.gd
   -> audio_factory.gd
   -> ui_font.gd
```

`main.gd`가 런타임 조립자이자 대부분의 게임 규칙 소유자다. 다른 컨트롤러들은 `RefCounted` 유틸 객체로 사용된다.

## 2. 주요 파일 책임

| 파일 | 현재 책임 | PMO 관점 평가 |
| --- | --- | --- |
| `scripts/main.gd` | 게임 루프, 입력, 전투, 보스 연결, 결과, 보급소, 디버그 메서드, 드로잉 일부 | 과도한 중심화. 성장 구조 전 분리 필요 |
| `scripts/game_config.gd` | 전투/색/차징/아레나 상수 | 안정적이나 성장 수치가 커지면 config 분화 필요 |
| `scripts/enemy_controller.gd` | 적 스폰, 이동, 역할, 방어 타입, 피해 처리 | 비교적 응집도 좋음 |
| `scripts/wave_director.gd` | 시간 구간별 웨이브 파라미터 | 시간표형이라 성과 기반 진행과 충돌 가능 |
| `scripts/level_up_cards.gd` | 카드 데이터, 3택 선택, 빌드 태그 가중치 | 데이터/로직 결합. 희귀도/해금 전 분리 권장 |
| `scripts/meta_progression.gd` | 세션 내 흔적, 보급소 강화, 보스 분석 | 현재 작지만 RPG 성장 핵심으로 확장 예정 |
| `scripts/boss_controller.gd` | 보스 상태, 패턴, 방어 타입, 드로잉 | 1차 보스 단위로 응집도 좋음 |
| `scripts/hud_controller.gd` | 모든 UI 생성/갱신 | 너무 많은 UI 표면 담당 |
| `scripts/effects_controller.gd` | 피해 숫자, 파티클, 링, 배너, 흔들림 | 효과 전담으로 적절 |
| `scripts/sprite_assets.gd` | 플레이어/적 스프라이트 로딩 및 fallback | 렌더 보조로 적절 |
| `scripts/audio_factory.gd` | 코드 생성 WAV 생성 | 전담 구조 적절 |
| `scripts/debug_tools.gd` | F키 입력 라우팅, 디버그 텍스트 | 기능 증가 시 debug command registry 필요 |
| `tools/balance_sim.py` | 전투/성장/보스 수치 표 출력 | PMO 판단에 유용, 계속 확장 필요 |

## 3. 런타임 상태 흐름

`main.gd`의 주요 상태:

```text
playing
level_up
game_over
victory
recalled
boss_victory
supply
```

핵심 전환:

```text
playing -> level_up -> playing
playing -> recalled -> supply -> playing
playing -> game_over -> playing
playing -> victory -> playing
playing -> boss_victory -> supply -> playing
```

주의점:

- `match_state`는 문자열 기반이다.
- 상태 전환과 보상 정산이 `main.gd`에 직접 들어 있다.
- 보급소 진입/재출격/결과 화면 콜백도 `main.gd`가 관리한다.

## 4. 전투 데이터 흐름

자동공격:

```text
main._update_auto_fire()
-> enemy_controller.nearest_enemy()
-> enemy_controller.damage_enemy()
-> main._handle_dead_positions()
-> XP/kills/effects/card synergies
```

차징:

```text
main._update_charge()
-> main._fire_charge()
-> main._charge_hit_indices()
-> enemy_controller.damage_enemy()
-> boss_controller.apply_damage()
-> aftereffects: puddle/heal/slow/knockback/followthrough
```

보스 피해:

```text
main._apply_boss_damage()
-> boss_controller.apply_damage()
-> effects damage number/status ring
-> main._on_boss_defeated()
```

위험:

- 전투 데미지 라우팅이 `main.gd`에 집중되어 있어 카드/보스/방어 타입 추가 때 충돌 위험이 크다.
- 보스와 적은 각각 별도 damage API를 가지며, 공통 인터페이스가 없다.

## 5. 성장 데이터 흐름

런 중 카드:

```text
XP 획득
-> level up
-> LevelUpCards.pick_three()
-> HUD 카드 선택
-> main._apply_card_effect()
-> player_stats 변경
```

세션 내 보급소 강화:

```text
회수/보스 결과
-> meta_progression trace 지급
-> supply UI
-> meta_progression.buy()
-> main._reset_player_stats()에서 bonuses 적용
```

현재 누락:

- 런 종료 보상 계산기.
- 성과 기반 trace 지급.
- 신호 단서 모델.
- 업글 해금 조건/최대 레벨/반복 비용 성장.

## 6. UI 표면 지도

`hud_controller.gd`가 보유한 UI:

| UI | 용도 |
| --- | --- |
| HP/Charge bars | 기본 전투 상태 |
| `stat_label` | 시간/레벨/처치/적 수 |
| `route_goal_label` | 진행 단계와 전투 목표 |
| `prompt_label` | 차징/배너/일시 메시지 |
| `boss_panel` | 보스 HP/상태 |
| `card_panel` | 레벨업 카드 3택 |
| `result_panel` | 결과/보급소 공용 패널 |
| `supply_upgrade_buttons` | 보급소 강화 버튼 |
| `debug_panel` | F12 상세 디버그 |

구조 문제:

- 결과 화면과 보급소 화면이 같은 패널을 재활용한다.
- 보급소가 확장될수록 `hud_controller.gd`가 급격히 비대해진다.
- UI 좌표가 모두 코드에 하드코딩되어 있어 다국어/긴 문구/해상도 대응이 어렵다.

## 7. 에셋/렌더링 지도

현재 렌더링은 혼합형이다.

- 플레이어/적: PNG sprite sheet 일부 사용.
- 보스/아레나/마커/이펙트: 코드 드로잉.
- UI: Godot Control 노드 코드 생성.
- 폰트: `assets/fonts/NotoSansKR-VF.ttf`.

리스크:

- 최종 에셋 적용 시 코드 드로잉과 sprite node 구조 중 하나로 방향을 정해야 한다.
- Web export에서 폰트 로딩/가독성은 계속 확인해야 한다.

## 8. 테스트/검증 지도

현재 검증 도구:

- `tools/balance_sim.py`
- Godot headless scene load
- Web export preset
- F키 디버그 HUD/상태 조작
- 임시 smoke script 방식

필요한 다음 검증:

- 보급소 UI 시각 스냅샷.
- Web 한글 폰트 확인.
- 실제 손플레이 보스 도달/회수/처치 루프.
- 성과 기반 보상 도입 후 빠른 죽음 파밍 방지 테스트.

## 9. 권장 모듈 분리 지도

우선순위 높은 분리 후보:

1. `run_result_evaluator.gd`: 런 성과 정산.
2. `route_progression.gd`: 신호 단서/보스 해금/목표 라벨.
3. `player_combat.gd`: 자동공격/차징/런타임 카드 효과.
4. `supply_depot_controller.gd`: 보급소 UI 데이터와 구매 흐름.
5. `card_catalog.gd` 또는 리소스화: 카드 데이터/희귀도/해금.
6. `damage_router.gd`: enemy/boss 공통 피해 API.
