# R03 오브젝트 데이터 패키지 초안 v0.3

## 문서 상태

```text
상태:
초안 v0.3

판정:
R03 0.3 P0 오브젝트 6종을 엔진 데이터 패키지 후보로 정리한다.

용도:
기획 티켓을 오브젝트 타입, 파라미터, 이벤트 출력, 정산 연결, QA 기준으로 변환한다.
```

---

## 0. 공통 잠금

```text
라벨은 태그가 아니다.
R03 오브젝트는 사람을 죽이는 장치가 아니라 목적지/수취/반송 판정을 잘못 붙이는 장치다.
R03-L04, R03-L05는 0.3에서 열지 않는다.
RETURN-05 정식 U5는 열지 않는다.
```

유저-facing 자원명:

```text
보급태그
통행태그
진료태그
```

---

## 1. 패키지 요약

| 데이터 ID | 오브젝트 | object_type | 우선 | 주요 출력 |
|---|---|---|---|---|
| R03-DATA-OBJ-01 | 송장 프린터 | `invoice_printer` | P0 | `label_applied`, `label_transferred` |
| R03-DATA-OBJ-02 | 자동 분류 레일 | `sorting_rail` | P0 | `route_bypassed` |
| R03-DATA-OBJ-03 | 미수령 보관함 | `unclaimed_locker` | P0 | `locker_opened`, `locker_left` |
| R03-DATA-OBJ-04 | 반송 드론 | `return_drone` | P0 | `drone_misdirected` |
| R03-DATA-OBJ-05 | 보류 스탬프 | `hold_stamp` | P0 | `hold_used` |
| R03-DATA-OBJ-06 | 압축 경고선 | `compression_warning_line` | P1/P0 경계 | `compression_warning` |

---

## 2. 공통 데이터 필드

| 필드 | 타입 | 설명 |
|---|---|---|
| `object_type` | string | 오브젝트 타입 |
| `display_name` | string | 개발/디버그 표시명 |
| `zone_allowlist` | array | 배치 가능 구역 |
| `state_machine` | array | 상태 흐름 |
| `telegraph_time` | float | 전조 시간 |
| `active_time` | float | 활성 시간 |
| `cooldown_time` | float | 재사용 대기 |
| `affects_player` | bool | 플레이어 영향 |
| `affects_enemies` | bool | 적 영향 |
| `affects_objects` | bool | 오브젝트 영향 |
| `event_outputs` | array | 이벤트 출력 |
| `settlement_outputs` | array | 정산 후보 |
| `repeat_reaction` | string | 다음 런 변화 |
| `readability_rule` | string | 모바일 가독성 기준 |

---

## 3. R03-DATA-OBJ-01 송장 프린터

```text
source_ticket:
R03-OBJ-01
```

### 데이터

| 필드 | 값 |
|---|---|
| `object_type` | `invoice_printer` |
| `display_name` | 송장 프린터 |
| `zone_allowlist` | R03-L01 접수 야드, 라벨 통로 |
| `state_machine` | idle -> telegraph -> active -> cooldown |
| `telegraph_time` | 0.8 |
| `active_time` | 1.2 |
| `cooldown_time` | 6.0 |
| `affects_player` | true |
| `affects_enemies` | true |
| `affects_objects` | partial |
| `event_outputs` | `label_applied`, `label_transferred` |
| `settlement_outputs` | 보급태그 후보, 통행태그 후보, 목적지 누락 로그 |
| `repeat_reaction` | `printer_recheck_interval_down` |

### 규칙

| 상황 | 결과 |
|---|---|
| 플레이어 피격 | 현재 라벨 상태 부착 |
| 적 피격 | 적에게 라벨 상태 부착 |
| 라벨 전이 | `label_transferred` 기록 |
| 보류 스탬프 영향 | active 취소 또는 cooldown 전환 |

### QA

| 체크 | 기준 |
|---|---|
| 전조 | 480x270에서 사각 윤곽 확인 |
| 회피 | 기본 이동으로 전조 후 회피 가능 |
| 역이용 | 적에게 라벨 부착 가능 |
| 정산 | 단독 피해가 아니라 이벤트 로그를 남김 |

---

## 4. R03-DATA-OBJ-02 자동 분류 레일

```text
source_ticket:
R03-OBJ-02
```

### 데이터

| 필드 | 값 |
|---|---|
| `object_type` | `sorting_rail` |
| `display_name` | 자동 분류 레일 |
| `zone_allowlist` | R03-L02 자동 분류장 |
| `state_machine` | idle -> direction_on -> direction_shift -> cooldown |
| `telegraph_time` | 0.6 |
| `active_time` | 5.0 |
| `cooldown_time` | 3.0 |
| `affects_player` | true |
| `affects_enemies` | true |
| `affects_objects` | true |
| `event_outputs` | `route_bypassed` |
| `settlement_outputs` | 통행태그 후보, 레일 우회 기록 |
| `repeat_reaction` | `rail_direction_memory` |

### 파라미터 후보

| 파라미터 | 값 |
|---|---:|
| `push_strength` | 0.35 |
| `speed_bonus` | 0.18 |
| `speed_penalty` | 0.12 |
| `direction_shift_warning` | 0.7 |

### QA

| 체크 | 기준 |
|---|---|
| 조작감 | 플레이어 입력이 완전히 사라지지 않음 |
| 읽기 | 방향 화살표가 전투 중 보임 |
| 역이용 | 적/드론을 레일로 밀 수 있음 |
| 정산 | 우회 성공 시 통행태그 후보 사유가 남음 |

---

## 5. R03-DATA-OBJ-03 미수령 보관함

```text
source_ticket:
R03-OBJ-03
```

### 데이터

| 필드 | 값 |
|---|---|
| `object_type` | `unclaimed_locker` |
| `display_name` | 미수령 보관함 |
| `zone_allowlist` | R03-L01 보관 구역, R03-L02 가장자리 |
| `state_machine` | sealed -> inspectable -> opened 또는 left -> residue |
| `telegraph_time` | 0.0 |
| `active_time` | 상호작용형 |
| `cooldown_time` | 없음 |
| `affects_player` | false |
| `affects_enemies` | false |
| `affects_objects` | false |
| `event_outputs` | `locker_opened`, `locker_left`, `r02_seed_found`, `return05_seed_found` |
| `settlement_outputs` | 보급태그 후보, 목적지 누락 로그, 진료태그 접근 보류 기록 |
| `repeat_reaction` | `locker_residue_next_run` |

### 상호작용

| 선택 | 즉시 효과 | 정산 |
|---|---|---|
| 열기 | 물자/흔적 회수 | 보급태그 후보 |
| 남기기 | 다음 런 잔향 | RETURN-05 씨앗 가능 |
| 보류 | 판정 지연 | 흔적 보존 |

### QA

| 체크 | 기준 |
|---|---|
| 선택성 | 열기/남기기가 모두 가능 |
| 보상감 | 열기는 보급 감정, 남기기는 이야기 잔향 |
| 금지 | 단순 상자처럼 열고 끝나지 않음 |

---

## 6. R03-DATA-OBJ-04 반송 드론

```text
source_ticket:
R03-OBJ-04
```

### 데이터

| 필드 | 값 |
|---|---|
| `object_type` | `return_drone` |
| `display_name` | 반송 드론 |
| `zone_allowlist` | R03-L02 자동 분류장 |
| `state_machine` | patrol -> scan -> pursue -> confirm 또는 confused -> cooldown |
| `telegraph_time` | 0.5 |
| `active_time` | 4.0 |
| `cooldown_time` | 5.5 |
| `affects_player` | true |
| `affects_enemies` | true |
| `affects_objects` | true |
| `event_outputs` | `drone_misdirected`, `label_applied` |
| `settlement_outputs` | 보급태그 후보, 목적지 누락 로그 |
| `repeat_reaction` | `drone_recheck` |

### 타깃 규칙

| 우선순위 | 대상 |
|---:|---|
| 1 | `return_pending` 라벨 대상 |
| 2 | 최근 보류 스탬프 사용 대상 |
| 3 | 플레이어 |
| 4 | 라벨 붙은 적 |

### QA

| 체크 | 기준 |
|---|---|
| 추적 전조 | 스캔선/소리로 읽힘 |
| 오유도 | 적에게 붙이는 성공 사례가 있음 |
| 반복 | 오유도 누적 시 다음 런 재검사 문구 출력 |
| 금지 | 단순 유도탄처럼 보이지 않음 |

---

## 7. R03-DATA-OBJ-05 보류 스탬프

```text
source_ticket:
R03-OBJ-05
```

### 데이터

| 필드 | 값 |
|---|---|
| `object_type` | `hold_stamp` |
| `display_name` | 보류 스탬프 |
| `zone_allowlist` | R03-L01 접수 야드, R03-L02 재검사 구역 |
| `state_machine` | available -> used -> recharge |
| `telegraph_time` | 0.0 |
| `active_time` | 2.5 |
| `cooldown_time` | 12.0 |
| `affects_player` | true |
| `affects_enemies` | true |
| `affects_objects` | true |
| `event_outputs` | `hold_used` |
| `settlement_outputs` | 보류 기록, 흔적 보존 |
| `repeat_reaction` | `hold_overuse_review` |

### 기능 제한

```text
보류 스탬프는 해제가 아니다.
판정을 늦추고, 늦춘 흔적을 남긴다.
```

### QA

| 체크 | 기준 |
|---|---|
| 만능 방지 | 모든 라벨/드론/레일을 완전 무효화하지 않음 |
| 보상 | 위험한 판정을 늦추는 체감 |
| 후폭풍 | 남발하면 재검사 반응 |

---

## 8. R03-DATA-OBJ-06 압축 경고선

```text
source_ticket:
R03-OBJ-06
```

### 데이터

| 필드 | 값 |
|---|---|
| `object_type` | `compression_warning_line` |
| `display_name` | 압축 경고선 |
| `zone_allowlist` | R03-L02 끝, 후속 입구 가장자리 |
| `state_machine` | hidden -> warning -> sweep -> residue |
| `telegraph_time` | 1.2 |
| `active_time` | 0.8 |
| `cooldown_time` | 10.0 |
| `affects_player` | true |
| `affects_enemies` | true |
| `affects_objects` | false |
| `event_outputs` | `compression_warning` |
| `settlement_outputs` | 압축 경고 기록 |
| `repeat_reaction` | `compression_pressure_up` |

### 범위 보호

```text
압축 경고선은 R03-L04의 원격 경고다.
0.3에서 R03-L04 입장권처럼 쓰지 않는다.
R03-L05 보스권을 암시하더라도 직접 열지 않는다.
```

---

## 9. 데이터 패키지 예시

```json
{
  "object_type": "return_drone",
  "display_name": "반송 드론",
  "zone_allowlist": ["r03_l02_sorting_floor"],
  "state_machine": ["patrol", "scan", "pursue", "confused", "cooldown"],
  "telegraph_time": 0.5,
  "active_time": 4.0,
  "cooldown_time": 5.5,
  "event_outputs": ["drone_misdirected", "label_applied"],
  "settlement_outputs": ["보급태그 후보", "목적지 누락 로그"],
  "repeat_reaction": "drone_recheck",
  "readability_rule": "scan line visible at 480x270"
}
```

---

## 10. 구현 순서

| 순서 | 대상 | 이유 |
|---:|---|---|
| 1 | 송장 프린터 | 라벨 상태의 원천 |
| 2 | 자동 분류 레일 | R03 이동 차별화 |
| 3 | 보류 스탬프 | 판정 지연의 손맛 |
| 4 | 반송 드론 | 시스템 실수 유도 |
| 5 | 미수령 보관함 | 보상 선택과 잔향 |
| 6 | 압축 경고선 | 후속 압력 |

---

## 11. QA 요약

| 항목 | 통과 기준 |
|---|---|
| 이벤트 출력 | 6종 모두 `r03_event_log`로 이어짐 |
| 정산 연결 | 보급태그/통행태그/진료태그 기준명 유지 |
| 라벨 분리 | 라벨을 태그 자원으로 만들지 않음 |
| 재방문 | 최소 3종이 다음 런 변화 제공 |
| 범위 | R03-L04/R03-L05 직접 오픈 없음 |
| 캐릭터 | RETURN-05 정식 U5 노출 없음 |

---

## 12. 최종 결론

R03 오브젝트는 각각 따로 재미있어야 하지만, 정산에서는 하나의 문장으로 묶여야 한다.

```text
라벨이 붙고,
길이 바뀌고,
보관함이 선택을 만들고,
드론이 실수를 학습하고,
스탬프가 판정을 늦추고,
경고선이 다음 구역을 겁준다.
```

이 흐름이 유지되면 R03은 물류 배경이 아니라 물류 판정 생태계가 된다.
