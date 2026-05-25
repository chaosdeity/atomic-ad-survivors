# R03 엔진 데이터 스키마 핸드오프 v0.3

## 문서 상태

```text
상태:
초안 v0.3

판정:
R03 0.3 문서군을 엔진 상태값, 오브젝트 인스턴스, 정산 이벤트, 보급소 반응 데이터로 번역한다.

용도:
기획/스토리 문장을 구현자가 데이터 테이블, 런타임 상태, QA 케이스로 바꿀 때 쓰는 핸드오프 기준.
```

기준 문서:

```text
story/05_progression/r03_0_3_slice_detail_0_2.md
story/05_progression/r03_run_object_prototype_tickets_0_2.md
story/05_progression/r03_yunseo_reaction_settlement_phrase_bank_0_2.md
story/05_progression/r03_return05_u0_u2_seed_tickets_0_2.md
story/05_progression/r03_r02_support_seed_patch_0_2.md
story/05_progression/r03_settlement_ui_compaction_samples_0_2.md
story/05_progression/r03_object_qa_script_linkage_0_2.md
```

---

## 0. 핸드오프 잠금

R03 0.3 데이터화의 목적은 R03 전체를 완성하는 것이 아니다.

0.3에서 데이터로 잠글 것:

| 축 | 잠금 |
|---|---|
| 지역 | R03-L01 반품 접수 야드, R03-L02 자동 분류장 |
| 조건부 씨앗 | R03-L03 보증 심사 창고 입구 신호 |
| 열지 않을 것 | R03-L04, R03-L05는 0.3에서 열지 않는다 |
| 캐릭터 | 윤서 심화, RETURN-05 U0~U2 씨앗, HOLD-04 원격 씨앗 |
| 금지 | RETURN-05 정식 U5, R02 직접 출격, R03-L05 보스권 소모 |
| 태그 | 보급태그, 통행태그, 진료태그를 기준명으로 사용 |

핵심 문장:

```text
라벨은 태그가 아니다.
라벨은 런 중 판정 상태이고, 태그는 정산 후 생활 접근 자원이다.
```

---

## 1. 데이터 레이어

R03은 한 테이블로 처리하지 않는다. 같은 행동이 런 중 상태, 정산 사유, 보급소 반응, 다음 런 변화로 나뉘어야 한다.

| 레이어 | 저장 주기 | 역할 | 예시 |
|---|---|---|---|
| `r03_region_state` | 영속 | R03 누적 반응과 해금 상태 | 방문 수, L02 접근, 보관함 잔향 |
| `r03_run_state` | 런 한정 | 현재 출격의 라벨/레일/드론 상태 | 현재 라벨, 레일 방향, 드론 추적 대상 |
| `r03_object_instance` | 런 한정 | 맵에 배치된 오브젝트 상태 | 송장 프린터, 보관함, 보류 스탬프 |
| `r03_event_log` | 런 후 정산까지 | 플레이 행동을 정산 사유로 압축 | 라벨 전이, 레일 우회, 드론 오유도 |
| `r03_settlement_output` | 결과 화면 | 확정 태그/후보/흔적/다음 변화 | 보급태그 후보, 통행태그 후보 |
| `r03_outpost_projection` | 보급소 화면 | 보급소 요약과 다음 목표 | 반송 드론 재검사, 게시판 문구 |
| `r03_unlock_guard` | 영속/QA | 0.3 범위 보호 | L04/L05 잠금, RETURN-05 U5 차단 |

---

## 2. 영속 상태 스키마

### 2.1 `r03_region_state`

| 필드 | 타입 | 초기값 | 의미 | 노출 |
|---|---|---:|---|---|
| `r03_visit_count` | int | 0 | R03 출격 완료 횟수 | 내부 |
| `r03_l01_cleared` | bool | false | R03-L01 완료 | 월드맵 |
| `r03_l02_unlocked` | bool | false | R03-L02 접근 가능 | 월드맵 |
| `r03_l02_cleared` | bool | false | R03-L02 완료 | 월드맵 |
| `r03_l03_seed_seen` | bool | false | 보증 심사 창고 입구 신호 확인 | 보급소/게시판 |
| `r03_l04_locked` | bool | true | R03-L04 직접 오픈 차단 | 내부 QA |
| `r03_l05_locked` | bool | true | R03-L05 직접 오픈 차단 | 내부 QA |
| `r03_return05_seed_stage` | int | 0 | RETURN-05 U0~U2 씨앗 단계 | 로그/게시판 |
| `r03_r02_seed_stage` | int | 0 | R02 보조 씨앗 단계 | 로그/게시판 |
| `r03_drone_misdirect_memory` | int | 0 | 반송 드론 오유도 누적 | 다음 런 변화 |
| `r03_locker_residue_count` | int | 0 | 남긴 보관함 잔향 | 다음 런 변화 |
| `r03_route_bypass_count` | int | 0 | 레일/게이트 우회 누적 | 정산/다음 런 |
| `r03_hold_overuse_count` | int | 0 | 보류 스탬프 남발 기록 | 정산/다음 런 |
| `r03_compression_pressure` | int | 0 | 압축 경고선 압력 | 원격 경고 |

### 2.2 영속 상태 업데이트 규칙

| 이벤트 | 상태 변화 |
|---|---|
| R03-L01 첫 완료 | `r03_l01_cleared = true`, `r03_l02_unlocked = true` |
| R03-L02 첫 완료 | `r03_l02_cleared = true`, `r03_l03_seed_seen` 조건 평가 |
| 보관함 남김 | `r03_locker_residue_count += 1` |
| 반송 드론 오유도 | `r03_drone_misdirect_memory += 1` |
| 레일 우회 | `r03_route_bypass_count += 1` |
| 보류 스탬프 사용 | `r03_hold_overuse_count += 1` |
| 압축 경고선 등장 | `r03_compression_pressure += 1` |
| RETURN-05 씨앗 2개 이상 | `r03_return05_seed_stage = max(current, 2)` |
| R02 씨앗 2개 이상 | `r03_r02_seed_stage = max(current, 1)` |

---

## 3. 런 상태 스키마

### 3.1 `r03_run_state`

| 필드 | 타입 | 초기값 | 의미 |
|---|---|---:|---|
| `current_label_status` | enum | `none` | 플레이어에게 붙은 현재 라벨 상태 |
| `label_timer` | float | 0.0 | 라벨 지속 시간 |
| `route_adjustment_level` | int | 0 | 레일/게이트 경로 보정 강도 |
| `active_rail_zone_id` | string | `""` | 현재 영향을 주는 레일 구역 |
| `drone_focus_target_id` | string | `""` | 반송 드론 추적 대상 |
| `hold_charge_count` | int | 0 | 이번 런 보류 스탬프 사용 횟수 |
| `locker_interaction_count` | int | 0 | 보관함 상호작용 횟수 |
| `compression_warning_seen` | bool | false | 압축 경고선 목격 |
| `r03_event_count` | int | 0 | 정산 이벤트 누적 |

### 3.2 라벨 상태 enum

| 값 | UI | 의미 | 정산 가능성 |
|---|---|---|---|
| `none` | 표시 없음 | 판정 없음 | 없음 |
| `unclaimed` | 미수령 | 아직 확인되지 않은 대상 | 보급태그 후보 |
| `return_pending` | 반송 대기 | 되돌릴 대상으로 분류 | 보급태그 후보/흔적 |
| `route_adjusted` | 경로 보정 | 레일/게이트 영향 증가 | 통행태그 후보 |
| `held` | 보류 | 판정 지연 | 흔적 보존 |
| `closing` | 완료 임박 | 판정이 닫히는 중 | 위험 보상 |

주의:

```text
라벨 상태는 전투/이동/정산 사유를 만드는 내부 상태다.
유저 자원명으로 "라벨태그" 같은 이름을 만들지 않는다.
```

---

## 4. 오브젝트 인스턴스 스키마

### 4.1 공통 필드

| 필드 | 타입 | 필수 | 설명 |
|---|---|---|---|
| `instance_id` | string | yes | 맵 안의 고유 인스턴스 |
| `object_type` | enum | yes | `invoice_printer`, `sorting_rail` 등 |
| `zone_id` | enum | yes | R03-L01/L02 내부 구역 |
| `spawn_group` | string | yes | 배치 묶음 |
| `state` | enum | yes | idle, telegraph, active, cooldown, disabled |
| `position_key` | string | yes | 블록아웃 앵커 또는 타일 키 |
| `readability_priority` | int | yes | 모바일 화면 가독성 우선순위 |
| `event_outputs` | array | yes | 발생 가능한 정산 이벤트 |
| `repeat_reaction_key` | string | no | 다음 런 변화 연결 |

### 4.2 오브젝트 타입

| object_type | 문서 ID | 역할 |
|---|---|---|
| `invoice_printer` | R03-OBJ-01 | 라벨 부착 |
| `sorting_rail` | R03-OBJ-02 | 이동 방향/속도 보정 |
| `unclaimed_locker` | R03-OBJ-03 | 열기/남기기 선택 |
| `return_drone` | R03-OBJ-04 | 라벨 대상 추적 |
| `hold_stamp` | R03-OBJ-05 | 판정 지연 |
| `compression_warning_line` | R03-OBJ-06 | 후속 위험 예고 |

---

## 5. 이벤트 로그 스키마

### 5.1 `r03_event_log`

| 필드 | 타입 | 예시 |
|---|---|---|
| `event_id` | string | `r03_evt_0007` |
| `event_key` | enum | `drone_misdirected` |
| `source_object_id` | string | `r03_l02_drone_02` |
| `target_kind` | enum | player, enemy, object |
| `zone_id` | enum | `r03_l02_sorting_floor` |
| `label_status` | enum | `return_pending` |
| `settlement_weight` | int | 1 |
| `tag_candidate_outputs` | array | `보급태그 후보` |
| `trace_outputs` | array | `목적지 누락 로그` |
| `next_run_effect_key` | string | `drone_recheck` |

### 5.2 이벤트 키

| event_key | 발생 조건 | 정산 후보 |
|---|---|---|
| `label_applied` | 송장 프린터가 라벨 부착 | 흔적 |
| `label_transferred` | 라벨이 적/오브젝트로 전이 | 보급태그 후보 |
| `route_bypassed` | 레일/게이트 우회 성공 | 통행태그 후보 |
| `locker_opened` | 미수령 보관함 즉시 회수 | 보급태그 후보 |
| `locker_left` | 보관함 남김 | 흔적/다음 런 잔향 |
| `drone_misdirected` | 반송 드론을 적에게 유도 | 보급태그 후보 |
| `hold_used` | 보류 스탬프 사용 | 흔적 보존 |
| `compression_warning` | 압축 경고선 등장 | R03-L04 원격 경고 |
| `r02_seed_found` | 처방/팔찌 기록 확인 | 진료태그 접근 보류 기록 |
| `return05_seed_found` | 수취인 확인 실패 기록 확인 | RETURN-05 U0~U2 씨앗 |

---

## 6. 정산 출력 스키마

### 6.1 `r03_settlement_output`

| 필드 | 타입 | 설명 |
|---|---|---|
| `result_title` | string | 결과 화면 제목 |
| `result_description` | string | 한 문장 결과 설명 |
| `confirmed_tags` | array | 확정 태그 |
| `tag_candidates` | array | 후보 태그 |
| `candidate_resolution` | array | 승인/보류 결과 |
| `trace_items` | array | 흔적/로그 |
| `next_run_changes` | array | 다음 런 변화 |
| `seed_outputs` | array | RETURN-05/R02/R04 씨앗 |
| `compressed_lines` | array | UI용 압축 출력 |

### 6.2 태그 후보 변환

| 이벤트 | 후보 |
|---|---|
| `locker_opened` | 보급태그 후보 |
| `drone_misdirected` | 보급태그 후보 |
| `route_bypassed` | 통행태그 후보 |
| `r02_seed_found` | 진료태그 접근 보류 기록 |
| `hold_used` | 흔적 보존. 태그 직접 지급 아님 |
| `label_applied` | 단독 지급 없음 |

---

## 7. 보급소 투영 스키마

### 7.1 `r03_outpost_projection`

| 필드 | 예시 |
|---|---|
| `route_stage_label` | R03-L02 자동 분류장 재검사 |
| `next_objective_short` | R03-L02에서 드론 재검사 회피 |
| `allocation_summary` | 보급태그는 물자 칸, 통행태그는 레일 우회 기록 |
| `allocation_reaction_summary` | 미나가 물자와 목적지 기록을 따로 묶었습니다 |
| `regional_clause_short` | 수취/반송 판정 보류와 보관 기한 재검사 |
| `outpost_event_log` | 윤서: 이름이랑 주소는 따로 둬. |
| `supply_actions` | 보급태그 임시 배분, 통행태그 후보 보류 |

### 7.2 보급소 표시 우선순위

1. 확정 태그와 후보 태그.
2. 후보 승인/보류.
3. 정산 사유.
4. 다음 출격 변화.
5. RETURN-05/R02 씨앗.
6. 세부 해석은 로그로 이동.

---

## 8. 예시 페이로드

### 8.1 런 상태 예시

```json
{
  "current_label_status": "route_adjusted",
  "label_timer": 4.2,
  "route_adjustment_level": 1,
  "active_rail_zone_id": "r03_l02_main_rail",
  "drone_focus_target_id": "enemy_034",
  "hold_charge_count": 2,
  "locker_interaction_count": 1,
  "compression_warning_seen": false,
  "r03_event_count": 7
}
```

### 8.2 이벤트 예시

```json
{
  "event_id": "r03_evt_0007",
  "event_key": "drone_misdirected",
  "source_object_id": "r03_l02_return_drone_02",
  "target_kind": "enemy",
  "zone_id": "r03_l02_sorting_floor",
  "label_status": "return_pending",
  "settlement_weight": 2,
  "tag_candidate_outputs": ["보급태그 후보"],
  "trace_outputs": ["목적지 누락 로그"],
  "next_run_effect_key": "drone_recheck"
}
```

### 8.3 정산 예시

```json
{
  "result_title": "목적지 판정 보류 귀환",
  "confirmed_tags": ["보급태그"],
  "tag_candidates": ["보급태그 후보", "통행태그 후보", "진료태그 접근 보류 기록"],
  "next_run_changes": ["반송 드론 재검사", "미수령 보관함 잔향"],
  "seed_outputs": ["RETURN-05 U1 신호", "R02 처방 기록 씨앗"]
}
```

---

## 9. 엔진 구현 우선순위

| 순서 | 작업 | 이유 |
|---:|---|---|
| 1 | `r03_run_state`와 라벨 enum | 모든 오브젝트가 공유하는 최소 상태 |
| 2 | `r03_event_log` | 정산/보급소/반복 반응의 중간층 |
| 3 | R03-OBJ-01~05 인스턴스 | 0.3 핵심 재미 |
| 4 | `r03_settlement_output` | 유저 보상 이해 |
| 5 | `r03_outpost_projection` | 반복 출격 체감 |
| 6 | `r03_unlock_guard` | 과확장 차단 |

---

## 10. QA 체크

| 체크 | 통과 기준 |
|---|---|
| 라벨 분리 | 라벨 상태가 태그 자원으로 정산되지 않는다 |
| 태그명 | 보급태그, 통행태그, 진료태그 기준명 사용 |
| 범위 | R03-L01/L02만 직접 출격 가능 |
| 잠금 | R03-L04/R03-L05는 0.3에서 열지 않는다 |
| 캐릭터 | RETURN-05 정식 U5가 열리지 않는다 |
| 반복 반응 | 적어도 3개 이벤트가 다음 런 변화로 이어진다 |
| UI | 결과/보급소 압축 출력이 기존 compaction 기준을 넘지 않는다 |

---

## 11. 최종 결론

R03 0.3 구현은 "물류 오브젝트 6개를 맵에 놓기"가 아니라, 아래 순서로 붙어야 한다.

```text
오브젝트 반응
-> 이벤트 로그
-> 태그 후보/흔적 정산
-> 보급소 반응
-> 다음 런 변화
```

이 구조가 있어야 유저가 "창고에 다녀왔다"가 아니라 "내 목적지가 시스템에 붙었다가 틀어졌다"라고 느낀다.

추천 다음 작업:

```text
1. R03-L01/L02 레벨 블록아웃 티켓과 상태 필드 매핑
2. R03 오브젝트 데이터 패키지를 엔진 테이블 후보로 변환
3. R03 정산/보급소 UI 문구 테이블을 실제 키 단위로 분리
```
