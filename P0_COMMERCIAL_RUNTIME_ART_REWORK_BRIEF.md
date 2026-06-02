# P0 Commercial Runtime Art Rework Brief

Status: production rework required

## One-line Decision

현재 P0 런타임 에셋은 Godot 적용 검증은 통과했지만 시판용 품질은 아니다. 다음 작업은 "더 많은 placeholder 적용"이 아니라 윤서, R01 전투, UI/VFX, 보급소, 결과/카드 화면을 같은 상용 아트 언어로 다시 제작하는 것이다.

## Why The Current Result Fails

| 항목 | 현재 문제 | 시판용 기준 |
| --- | --- | --- |
| 윤서 | 48x48 안에서 주인공성, 얼굴/장비 실루엣, 포즈 선명도가 약함 | 축소해도 "윤서"로 보이는 고유 실루엣, 장비, 색 분리 필요 |
| 전투 화면 | 배경, 적, 오브젝트, VFX가 같은 대비 영역에서 겹침 | 플레이어 > 위험 > 상호작용 대상 > 배경 순서로 명도/채도 계층화 |
| UI | 텍스트와 장식, 전투 정보가 같은 공간에서 경쟁함 | 480x270에서도 전투 가림 최소, HUD 정보 그룹화 |
| R01 오브젝트 | 상태 변화는 있으나 상태별 제작 밀도와 방향성이 균일하지 않음 | 6상태가 같은 모델의 변화로 보여야 함 |
| VFX | 기능 피드백은 있으나 screen noise가 강함 | 짧고 선명하며 gameplay read를 방해하지 않는 이펙트 |
| 보급소 | anchor는 있으나 상용 허브 화면의 공간감/조명/재질이 없음 | 작아도 "돌아온 장소"로 읽히는 통합 배경/시설 구성 |
| 전체 톤 | mockup, generated placeholder, UI wire가 한 화면에 섞임 | 한 명의 아트 디렉터가 정리한 것처럼 일관된 shape language |

## Commercial Quality Bar

| 기준 | Pass 조건 | Fail 조건 |
| --- | --- | --- |
| 480x270 첫인상 | 1초 안에 플레이어, 위협, 상호작용 대상, HP/charge가 구분됨 | 화면이 장난감 스티커처럼 흩어져 보임 |
| 축소 판독 | 1x/2x/3x에서 같은 캐릭터로 읽힘 | 확대해야만 형태를 알 수 있음 |
| 아트 언어 | 모든 런타임 에셋이 같은 조명, 외곽선, 색 제한, 재질 규칙을 공유 | PNG마다 다른 생성/가공 흔적이 보임 |
| 전투 우선순위 | 윤서와 위험 이펙트가 배경보다 앞에 선다 | 배경 장식과 이펙트가 플레이어를 삼킴 |
| 상태 변화 | normal/revealed/stamped/suppressed/overloaded/spent가 같은 물체의 단계로 보임 | 색만 바뀐 별도 이미지처럼 보임 |
| UI | 읽히지만 전투를 가리지 않음 | 텍스트가 화면 중앙 전투 판단을 방해 |
| 보스 | 일반 적과 silhouette, scale, attack cue가 명확히 다름 | 큰 일반 적처럼 보임 |

## New Art Direction Lock

| 축 | 결정 |
| --- | --- |
| 렌더링 | low-res pixel art가 아니라 고해상도 2D hand-painted/cel-shaded cutout을 48-96px 게임 크기로 정리 |
| 외곽선 | 짙은 갈색/먹색 1-2px outer line, 내부선은 최소화 |
| 팔레트 | warm cream 배경, muted mint 시설, coral stamp/VFX, toxic green source signal, dark cocoa outline |
| 캐릭터 | 윤서는 성인 현장 회수 담당자. 로비 미소 캐릭터가 아니라 업무복, 도장 장비, 회수 릴, 식별 배지가 보여야 함 |
| R01 | 밝은 1950s 오픈하우스 광고 공간이지만 내부가 명령 장치처럼 오염됨 |
| 공포 수위 | 고어 금지. 불편함은 광고 문구, 과친절한 형태, 등록/보증/심사 장치에서 나온다 |
| UI | diegetic receipt/catalog language. 단, 텍스트는 Godot Label 유지 |

## P0 Production Targets

| 우선 | 파일명 | 용도 | 규격 | 프레임 | Pivot | 상용 리워크 기준 |
| --- | --- | --- | --- | ---: | --- | --- |
| P0 | `char_yunseo_combat_sheet_v01.png` | 윤서 전투 통합 시트 | 48x48 cells, transparent | 15 | foot x24 y43 | idle 3방향, walk 3방향 x3, stamp ready/release, hit/retrieval을 같은 모델로 제작 |
| P0 | `enemy_r01_coupon_swarm_sheet_v01.png` | 기본 swarm 적 | 32x32 cells, transparent | 5 | x16 y28 | idle/move 2, hit 1, death residue 2 |
| P0 | `enemy_r01_mailbox_attacker_sheet_v01.png` | 생활 인프라 적 | 48x48 cells, transparent | 5 | x24 y42 | 일반 적과 다른 실루엣, 과친절 광고 얼굴 |
| P0 | `obj_r01_mailbox_states_v01.png` | source object 6상태 | 64x64 cells, transparent | 6 | x32 y52 | 같은 우편함이 6단계로 변해야 함 |
| P0 | `obj_r01_door_sensor_states_v01.png` | source object 6상태 | 64x64 cells, transparent | 6 | x32 y52 | revealed/source ring이 물체 내부에서 나와야 함 |
| P0 | `obj_r01_speaker_pylon_states_v01.png` | source object 6상태 | 64x96 cells, transparent | 6 | x32 y84 | vertical silhouette, overload 때만 강한 signal |
| P0 | `vfx_stamp_core_sheet_v01.png` | 도장/차지 VFX | 96x96 cells, transparent | 15 | x48 y48 | charge, release, hit, reveal, overload 각 3프레임 |
| P0 | `ui_hud_runtime_frame_v01.png` | HUD frame/fill atlas | mixed, transparent | static | top-left | 전투 중앙을 침범하지 않는 좌상단 정보 패널 |
| P0 | `ui_card_runtime_9slice_v01.png` | 카드 선택 | 124x106 cells | 3 | top-left | normal/selected/disabled가 명확하고 텍스트 영역 비움 |
| P0 | `ui_result_runtime_9slice_v01.png` | 결과/정산 | 244x174 | 1 | top-left | 숫자와 보상 텍스트가 먼저 읽힘 |
| P0 | `outpost_core_facilities_sheet_v01.png` | 보급소 핵심 시설 | 96x64 cells, transparent | 6 | center/base | 회수, 정산, 정비, 출격, 보관, 조율 기능 구분 |
| P0 | `boss_smile_home_judge_sheet_v01.png` | 스마일 홈 심사관 보스 | 96x96 cells, transparent | 8 | x48 y88 | idle 2, warning 2, attack cue 2, hit 1, core exposed 1 |

## Do Now

1. 현재 `p0_2_playable_art_kit`는 runtime prototype으로 격하한다.
2. 새 상용 후보는 `assets/art_inbox/p0_commercial_runtime_v01/` 아래에 별도 제작한다.
3. 윤서 전투 시트부터 다시 만든다. 시트 하나 안에서 모델, 비율, 장비 위치가 흔들리면 실패다.
4. R01 전투 mockup은 배경을 먼저 낮추고, 캐릭터/적/VFX를 그 위에 얹어 판독 계층을 맞춘다.
5. 모든 시트는 contact sheet, 480x270 in-game mock, Godot import proof를 함께 납품한다.

## Defer

| 항목 | 이유 |
| --- | --- |
| 윤서 로비 bust | 전투 판독 해결 전에는 상용 품질에 기여하지 않음 |
| NPC 정식 bust | 보급소 시설/화면 구성이 먼저 |
| 가챠/홍보/key art | 런타임 화면이 시판용으로 보인 뒤 제작 |
| 전 캐릭터 Live2D/Spine | MVP 범위 초과 |
| cinematic boss intro | 전투 보스 silhouette와 cue 검증 이후 |

## Validation Shots Required

| 샷 | 파일명 | Pass 기준 |
| --- | --- | --- |
| R01 normal combat | `qa/screenshots/commercial/r01_combat_normal_480x270.png` | 윤서, 적, source, HUD가 즉시 분리 |
| R01 dense combat | `qa/screenshots/commercial/r01_combat_dense_480x270.png` | VFX가 겹쳐도 윤서 위치 유지 |
| R01 source interaction | `qa/screenshots/commercial/r01_source_states_480x270.png` | 6상태가 같은 물체 변화로 보임 |
| Outpost | `qa/screenshots/commercial/outpost_core_480x270.png` | 시설 기능과 이동 동선이 읽힘 |
| Result | `qa/screenshots/commercial/result_settlement_480x270.png` | 결과 숫자/보상 우선 |
| Card choice | `qa/screenshots/commercial/card_choice_480x270.png` | 카드 3장 텍스트 영역 확보 |
| Boss | `qa/screenshots/commercial/smile_home_boss_480x270.png` | 일반 적과 보스가 명확히 다름 |

## Next Codex Prompt

```text
현재 P0 runtime prototype은 시판용 품질이 아니므로, 기존 `assets/art_inbox/p0_2_playable_art_kit`를 상용 후보로 승격하지 마라.
새 폴더 `assets/art_inbox/p0_commercial_runtime_v01/`에 상용 런타임 아트 후보를 별도 제작하라.
우선순위는 윤서 전투 통합 시트 -> R01 기본 적/오브젝트 3종 상태 시트 -> stamp/source VFX -> HUD/card/result UI -> outpost core facilities -> smile home judge boss 순서다.
각 에셋은 같은 외곽선, 조명, 팔레트, 재질 규칙을 공유해야 하며, 480x270에서 윤서와 위험 요소가 먼저 읽혀야 한다.
로비/홍보/시네마틱/가챠/NPC 정식 bust는 만들지 마라.
적용 전후로 480x270 스크린샷 7종과 Godot import proof를 남기고, 시판용 판정은 screenshot review 후에만 말하라.
```
