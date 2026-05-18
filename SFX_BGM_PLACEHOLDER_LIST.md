# SFX / BGM Placeholder List

작성일: 2026-05-18
목표: 0.2가 무음 프로토타입처럼 느껴지지 않도록 최소 사운드 placeholder 범위를 고정한다.
주의: 세부 믹싱/최종 음원 제작 지시가 아니라, 구현/소싱 전 체크리스트다.

## 1. SFX 우선순위

| ID | 이벤트 | placeholder 방향 | 우선도 |
| --- | --- | --- | --- |
| `sfx_auto_attack_fire` | 자동공격 | 짧은 scanner beep + paper tick | P0 |
| `sfx_auto_attack_hit` | 자동공격 명중 | 얇은 ad-paper ping / small zap | P0 |
| `sfx_return_stamp_ready` | 반품 도장 charge ready | 짧은 double tone + stamp spring | P0 |
| `sfx_return_stamp_hit` | 반품 도장 명중 | 단단한 rubber stamp clack + impact | P0 |
| `sfx_return_stamp_whiff` | 반품 도장 빗나감 | 마른 종이 스침 + 낮은 click | P0 |
| `sfx_mark_apply` | 표식 부여 | seal stick / label snap | P0 |
| `sfx_mark_expire` | 표식 소멸 | tape peel / small fizz | P1 |
| `sfx_enemy_hit_paper` | 쿠폰/전단 피격 | paper snap, torn coupon | P0 |
| `sfx_enemy_hit_appliance` | 가전/우편함 피격 | plastic click, small motor spark | P0 |
| `sfx_enemy_kill` | 적 처치 | paper burst or broken jingle tail | P0 |
| `sfx_speaker_pulse` | speaker 파동 | distant ad speaker chirp + low pulse | P0 |
| `sfx_charger_windup` | charger 돌진 예고 | rising warning whirr | P0 |
| `sfx_charger_dash` | charger 돌진 | short rush + hard brake | P0 |
| `sfx_pressure_ring_warn` | 압박 링 예고 | ring swell + family-commercial tone | P0 |
| `sfx_pressure_ring_hit` | 압박 링 적중 | low thump + receipt slap | P1 |
| `sfx_flyer_drop_warn` | 위험 전단 낙하 예고 | flutter above + coupon whistle | P0 |
| `sfx_flyer_drop_hit` | 위험 전단 낙하 | paper stack slap | P1 |
| `sfx_boss_pattern_warn` | 보스 패턴 예고 | friendly jingle that cuts wrong | P0 |
| `sfx_boss_shell_hit` | 보스 외피 피격 | appliance shell knock | P0 |
| `sfx_boss_core_expose` | HP 65/25 성과 | signal crack + warm CRT pop | P0 |
| `sfx_outpost_return` | 보급소 귀환 | cable pull + quiet door bell | P0 |
| `sfx_upgrade_buy` | 업글 구매 | counter stamp + register soft ding | P0 |
| `sfx_result_settle` | 결과 정산 | receipt print + paper tray slide | P0 |

## 2. BGM / Ambience

| ID | 위치 | placeholder 방향 | 우선도 |
| --- | --- | --- | --- |
| `amb_r01_suburb_loop` | R01 ambient | distant open-house speaker, paper wind, suburban hum | P0 |
| `amb_outpost_loop` | 보급소 ambient | quiet fluorescent hum, fabric, low radio silence | P0 |
| `bgm_finale_pressure_layer` | 270초 이후 | ad pressure pulse, low rhythmic signal | P0 |
| `bgm_boss_smile_home` | 보스전 | bright family jingle warped into combat pulse | P0 |
| `bgm_result_settlement` | 결과/정산 | short soft cadence, receipt rhythm | P1 |

## 3. Material SFX Matrix

| 재료 | hit | kill | 위험 |
| --- | --- | --- | --- |
| 종이/쿠폰 | snap, tear, flutter | paper burst | flyer fall |
| 생활 가전/우편함 | plastic knock, motor click | motor stall, spring pop | flyer spit / suction |
| 광고 잉크/슬라임 | wet fizz, sticky pop | toxic bubble | drain puddle |
| 모델하우스/보스 외피 | appliance shell knock | panel crack | photo flash, coupon fan, vacuum pull |

## 4. 구현 연결 메모

현재 `scripts/audio_factory.gd`는 tone/burst 기반 placeholder 생성이 가능하다. 0.2 P0에서는 외부 음원 없이도 다음을 먼저 구현할 수 있다.

- 자동공격 fire/hit 분리.
- 반품 도장 ready/hit/whiff 분리.
- speaker/charger/hazard warning 분리.
- 보급소 귀환/정산/업글 stinger 추가.

외부 wav/ogg를 쓰는 경우:

- 파일명은 위 ID와 맞춘다.
- 0.2에서는 looping ambience와 one-shot SFX를 분리.
- normalize/loudness는 최종 믹싱 전이라도 큰 볼륨 튐이 없게 한다.

## 5. 금지/주의

- 최종 상업용 사운드라고 단정하지 않는다.
- 과도한 horror/gore sound 금지.
- 스팀펑크 brass/steam identity로 새지 않는다.
- R01 ambient가 너무 어둡거나 폐허처럼 들리면 실패.
- 중요한 telegraph SFX는 BGM에 묻히지 않아야 한다.

## 6. PMO 판단 필요

- 외부 placeholder 음원을 쓸지, `AudioFactory` procedural tone으로 먼저 갈지.
- 보스전 BGM을 완전 전용으로 둘지, R01 pressure layer 위에 얹을지.
- 윤서 반품 도장의 대표 소리: rubber stamp 쪽인지 scanner/seal 쪽인지.
