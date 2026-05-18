# R01 Godot Layout Blockout Report

상태: 1차 Godot blockout 구현 완료
범위: world-space R01 local map layout, zone marker, placeholder props, camera clamp, state preview, density probe
비범위: final art import, production atlas 생성, 보스/전투/카드/보급소/성장 수치 변경

## 1. 수정/생성 파일 목록

생성:

- `scripts/r01_layout_blockout.gd`
- `R01_GODOT_LAYOUT_BLOCKOUT_REPORT.md`

수정:

- `scripts/main.gd`
- `scripts/debug_tools.gd`

## 2. World Layout 규모

Blockout world bounds:

```text
position: (-720, -405)
size: 1920 x 810
```

`480x270` viewport 기준:

```text
1920 / 480 = 4 screens
810 / 270 = 3 screens
total = 12 camera screens
```

이번 blockout은 요구된 최소 4-6 screens를 넘고, 권장 8-12 screens의 상단인 12 camera screens 규모다.

## 3. Viewport와 World Size 구분

`480x270`은 계속 camera viewport / 한 화면 가독성 기준으로만 사용한다.

실제 R01 blockout world는 `1920x810`이며, 플레이어는 이 좌표계 안에서 여러 화면을 이동한다. Godot 프로젝트 viewport 설정은 그대로 `480x270`이고, Camera2D limit만 blockout bounds에 맞춰 확장했다.

## 4. Zone Anchor 좌표

```text
silence_edge_start:        (-600,  170)
subdivision_loop_center:   (-105,   28)
model_house_node_anchor:   ( 510, -238)
drain_pocket_anchor:       ( 260,  270)
fake_return_route_anchor:  (-500, -205)
```

각 anchor는 `scripts/r01_layout_blockout.gd`의 `ZONES` table에서 world coordinate로 관리된다.

## 5. Zone Adjacency 확인

구현한 이동 연결:

```text
silence_edge_start -> subdivision_loop_center
subdivision_loop_center -> model_house_node_anchor
subdivision_loop_center -> drain_pocket_anchor
subdivision_loop_center -> fake_return_route_anchor
```

Headless probe 기준 거리:

```text
silence_edge_start -> subdivision_loop_center: 514.97
subdivision_loop_center -> model_house_node_anchor: 670.06
subdivision_loop_center -> drain_pocket_anchor: 437.94
subdivision_loop_center -> fake_return_route_anchor: 458.60
```

## 6. Zone별 Placeholder Prop 목록

`silence_edge_start`

- low_concentration_floor
- sparse_flyer_scraps
- weak_route_hint
- distant_mailbox_hint
- destroy_node: quiet_nameplate_marker
- extract_memory: blank_customer_photo_hint

`subdivision_loop_center`

- house_front_placeholder
- mailbox_device_placeholder
- flyer_pile_placeholder
- price_customer_tag_placeholder
- recommended_route_decal_placeholder
- broadcast_record_3: same_house_repeat_marker
- destroy_node: exposed_nameplate_marker
- extract_memory: family_window_photo_marker

`model_house_node_anchor`

- model_house_node_placeholder
- consultation_kiosk_socket_placeholder
- family_window_loop_placeholder
- doorbell_projector_placeholder
- floor_plan_line_placeholder
- broadcast_record_3: open_house_direction_stack
- destroy_node: dimmed_node_shell
- extract_memory: memory_afterimage_window

`drain_pocket_anchor`

- toxic_ad_drain_placeholder
- muted_floor_crack
- tiny_paper_fragments
- trace_candidate_marker
- destroy_node: quiet_drain_material_marker
- extract_memory: receipt_fragment_marker

`fake_return_route_anchor`

- recommended_route_decal_placeholder
- streetlight_speaker_placeholder
- fake_recovery_marker
- transmitter_residue_hint_placeholder
- destroy_node: broken_return_arrow
- extract_memory: family_voice_risk_marker

## 7. State Variant별 변화

Debug key:

```text
Ctrl+1 first_visit
Ctrl+2 broadcast_record_3
Ctrl+3 destroy_node
Ctrl+4 extract_memory
```

Headless probe prop counts:

```text
first_visit:
  silence 4, subdivision 5, model node 5, drain 4, fake route 4

broadcast_record_3:
  silence 4, subdivision 6, model node 6, drain 4, fake route 4

destroy_node:
  silence 5, subdivision 6, model node 6, drain 5, fake route 5

extract_memory:
  silence 5, subdivision 6, model node 6, drain 5, fake route 5
```

의도:

- `first_visit`: 낮은 광고 밀도와 넓은 silence edge.
- `broadcast_record_3`: 모델하우스 방향성과 open-house route 증가.
- `destroy_node`: 광고 prop을 늘리지 않고 문패/침묵/끊긴 route marker를 추가.
- `extract_memory`: family window/photo marker와 fake route 위험 신호 증가.

## 8. 30 / 100 / 300 Density 테스트 결과

`scripts/r01_layout_blockout.gd`에서 draw-only density placeholder를 배치했다.

```text
30 density: combat_readability
100 density: tier_hierarchy
300 density: tiny_lod_density_only
```

300 density는 실제 enemy가 아니다.

```text
no collision
no HP
no AI
draw-only tiny LOD placeholder
```

위험 기록:

- 300 density는 실제 전투 enemy로 올리면 안 된다.
- tiny LOD는 enemy silhouette과 telegraph보다 아래 layer로 유지해야 한다.
- subdivision loop 근처 고밀도는 가독성 확인용이며, production spawn 수치가 아니다.

## 9. 카메라 / Arena Clamp 조정 여부

조정함.

- 기존 `C.ARENA_HALF` 기반 player clamp를 blockout 활성 시 `R01LayoutBlockout.player_bounds()`로 대체했다.
- Camera2D limit을 `WORLD_BOUNDS`로 설정했다.
- 기존 `R01MapController`의 시간 기반 zone transition 구조는 제거하지 않았다.
- blockout drawing은 `R01LayoutBlockout.ENABLED`가 true일 때만 `main.gd`에서 기존 arena draw 대신 사용한다.

## 10. 기존 루프 영향 여부

이번 변경은 아래 수치를 변경하지 않았다.

- 전투 damage / HP / enemy cap
- 카드 효과
- 보스 수치
- 보급소/성장/보상 수치
- 저장/불러오기

주의: `scripts/main.gd`에는 작업 시작 전부터 다른 미커밋 변경이 존재했다. 이번 blockout 작업은 그 변경을 되돌리지 않고, camera/player clamp와 draw/debug 연결만 추가했다.

## 11. 테스트 결과

실행:

```powershell
C:\workspace\cog_gaya_project\tools\godot-4.6.2\Godot_v4.6.2-stable_win64_console.exe --headless --path . scenes/main.tscn --quit-after 2
```

결과:

```text
PASS
```

Probe 출력 확인:

- world bounds / 12 camera screens
- 5개 anchor coordinate
- 4개 adjacency distance
- state variant별 prop count
- 30 / 100 / 300 density count

추가 테스트는 최종 검증 섹션에 기록한다.

최종 검증:

```powershell
python tools\balance_sim.py
```

결과:

```text
PASS
```

```powershell
git diff --check
```

결과:

```text
PASS
```

참고: `git diff --check`는 기존 작업트리의 LF/CRLF 변환 warning을 출력했지만 whitespace error는 없었다.

## 12. 남은 리스크

- 현재 blockout props는 draw 기반 placeholder라 collision / navigation cost / interactable metadata가 없다.
- `R01MapController`의 기존 시간 기반 zone name과 새 world-space nearest anchor는 아직 완전히 통합하지 않았다.
- 보스 위치와 `model_house_node_anchor`는 아직 같은 좌표계로 재배치하지 않았다.
- 300 density는 시각 density probe일 뿐 실제 performance benchmark가 아니다.
- 실제 screenshot 저장 probe는 만들지 않았고, headless coordinate/camera probe로 대체했다.

## 12.1 커밋 전 정리 메모

- 일반 화면에서는 `zone_id`, `prop_id`, 영어 role, density probe 설명을 숨긴다.
- 일반 화면에 남는 텍스트는 자연문 구역명만 허용한다.
- 내부 blockout label과 30/100/300 density probe는 F1 도움말 또는 F12 debug HUD가 켜진 상태에서만 그린다.
- `main.gd`에는 P0-7A-2 차징 무기 변경이 같이 남아 있으므로, R01 blockout 커밋 시 R01 관련 hunk만 부분 스테이징해야 한다.

## 13. 다음 작업 추천

1. nearest zone anchor를 `R01MapController` 또는 별도 region state에 연결할지 결정한다.
2. blockout prop metadata를 collision / spawn_role / trace_role table로 분리한다.
3. Playwright 또는 Godot screenshot dump로 5개 zone별 `480x270` 화면 캡처를 저장한다.
4. boss / elite / objective anchor를 `model_house_node_anchor` 주변으로 별도 blockout pass에서 정렬한다.
5. production atlas import 전에 placeholder prop별 collision intent를 확정한다.
