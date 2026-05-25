# RPG Growth v1 Implementation Conflict Audit

작성일: 2026-05-17
목적: `RPG_GROWTH_ARCHITECTURE_V1.md` 승인 기준과 현재 구현 사이의 충돌을 목록화하고, 맵 최소 구조 작업 전에 필요한 결정과 P0 작업 순서를 재정렬한다.
범위: 감사 문서만 작성한다. 코드 구현/수정은 하지 않는다.
브리지 메모: Boss Identity Bridge 이후 코드상 첫 보스 노출명은 `스마일 홈 시어머니`이며, `캠페인 송출관`은 후속 접근 목표 문구로만 유지한다.

## 1. Executive Summary

`RPG_GROWTH_ARCHITECTURE_V1.md`는 0.2 기준서로 승인 가능하다. Boss Identity Bridge 이전 구현은 "캠페인 송출관 직접 보스전"을 중심으로 만들어져 있었고, 0.2의 최신 기준인 "첫 보스 = 스마일 홈 시어머니, 캠페인 송출관 = 상위 접근 목표"와 충돌했다.

가장 중요한 충돌:

```text
문서 기준:
  0.2 첫 보스 = 스마일 홈 시어머니
  캠페인 송출관은 0.2 직접 보스전 금지

브리지 전 구현:
  scripts/boss_controller.gd의 보스 이름 = 캠페인 송출관
  main.gd, hud_controller.gd, 결과 문구, 디버그, 보급소 힌트가 모두 송출관 직접 조우/처치 기준
```

PMO 판단:

```text
맵 최소 구조 작업 전에 보스 처리 방침을 먼저 결정해야 한다.
```

권장 결정:

```text
0.2에서는 현재 보스 구현을 폐기하지 말고, 스마일 홈 시어머니로 리스킨/리테마하는 브리지 전략을 사용한다.
캠페인 송출관은 코드상 직접 보스가 아니라 상위 접근 상태/후속 목표로 내려야 한다.
```

## 2. Sources Checked

확인 문서:

- `RPG_GROWTH_ARCHITECTURE_V1.md`
- `story/90_implementation/first_boss_directive_0_2.md`
- `story/90_implementation/story_cross_validation_0_2.md`
- `GAME_CURRENT_STATE_AUDIT.md`
- `GAME_ARCHITECTURE_MAP.md`
- `RPG_GROWTH_READYNESS_REPORT.md`

확인 코드:

- `scripts/boss_controller.gd`
- `scripts/main.gd`
- `scripts/hud_controller.gd`
- `scripts/meta_progression.gd`
- `scripts/run_result_evaluator.gd`
- `scripts/debug_tools.gd`
- `scripts/wave_director.gd`

## 3. Locked Document Criteria

아래 기준은 0.2에서 유지한다.

| 항목 | 기준 |
| --- | --- |
| 0.2 플레이어블 | 윤서 1명 |
| 첫 지역 | 외곽 주택가 |
| 첫 보스 | 스마일 홈 시어머니 |
| 상위 목표 | 캠페인 송출관 |
| 반복 재화 | 광고 전단 조각 |
| 보스 재화 | 캠페인 코어 파편 |
| 스토리 단서 | 송출 기록 3개, 송출관 접근 절차 확정 |
| 금지 | 좌표 조각 재화, 송출 기록 소비 재화, 사망 보상, 보스 조우 코어 보상 |
| 첫 전투 | `signal_overload` 강제 회수 |
| 수익화 | 0.2 없음, 상세는 별도 문서 |

## 4. Conflict List

### C1. First Boss Identity Conflict

| 구분 | 문서 기준 | 현재 구현 |
| --- | --- | --- |
| 보스 이름 | 스마일 홈 시어머니 | 캠페인 송출관 |
| 보스 역할 | 외곽 주택가 중간 결절 | 캠페인 상위 송출체 |
| 0.2 송출관 | 직접 보스전 금지 | 직접 조우/처치 |

근거:

- `scripts/boss_controller.gd`: `BOSS_NAME := "캠페인 송출관"`
- `scripts/hud_controller.gd`: 초기 보스 라벨 `"캠페인 송출관"`
- `scripts/main.gd`: 보스 조우 배너, 목표, 결과 설명이 송출관 기준
- `story/90_implementation/first_boss_directive_0_2.md`: `스마일 홈 시어머니 != 캠페인 송출관`

영향:

- 맵/지역 생태권과 보스 정체성이 어긋난다.
- 0.2에서 증명하려는 "외곽 주택가가 선택을 먹고 변한다"는 구조가 약해진다.
- 송출관을 너무 일찍 소비해 장기 상위 목표가 사라진다.

심각도:

```text
P0 blocker
```

### C2. Boss Pattern Theme Conflict

현재 보스 패턴:

- 황금 시간대 스윕
- 보증서 방패
- 신호 왜곡 세일
- 가정용 안전 시연

문서상 스마일 홈 시어머니 P0 패턴:

- 오늘의 가족 특가
- 깨끗한 거실
- 기념사진 시간

영향:

- 전투 기능 자체는 재사용 가능하지만, 테마와 판독 문구가 다르다.
- 현재 패턴은 상위 송출체/방송탑에 더 가깝고, 스마일 홈 시어머니의 가족/모델하우스/홈케어 정체성이 약하다.

심각도:

```text
P0, 단 재사용 가능
```

### C3. Boss Entry And Route Wording Conflict

문서 기준:

```text
broadcast_records_decoded >= 3
transmitter_access_state = "procedure_confirmed"
r01_suburb_state.node_state = "active"
-> 외곽 주택가 중심 결절 노출
```

현재 구현:

- `main.gd`는 120/180/240초에 `boss_signal_state`를 갱신한다.
- `_boss_route_ready()`는 `meta_progression.has_all_signal_clues()` 기반이다.
- 브리지 전 UI 문구는 "캠페인 송출관 조우", "송출관 침묵", "보스 좌표 확정"을 사용했다.

영향:

- 내부적으로 단서 state가 일부 존재했지만, 브리지 전 유저 표현은 "송출관 직접 조우"로 남아 있었다.
- 0.2 문서의 "송출관 접근 절차 확정 -> 중심 결절 노출"과 다르다.

심각도:

```text
P0 wording / P1 routing
```

### C4. Signal Clue Naming Conflict

문서 기준:

- 송출 기록 1: 첫 잡음 영수증
- 송출 기록 2: 길 잃은 카탈로그
- 송출 기록 3: 개장 전 점검표
- 좌표 조각 없음

현재 구현:

- `SIGNAL_CLUE_FAINT_BROADCAST_RECORD`
- `SIGNAL_CLUE_WARPED_BROADCAST_MAP`
- `SIGNAL_CLUE_BROADCAST_COORDINATE_TRACE`
- 라벨: "미약한 방송 기록", "뒤틀린 방송 지도", "방송 좌표 흔적"
- 업글명: "좌표 연동 해석"

영향:

- 코드 구조는 단서 3개를 받을 수 있어 유리하다.
- 하지만 "좌표" 표현이 남아 있어 최신 기준의 "송출관 접근 절차"와 충돌한다.

심각도:

```text
P1
```

### C5. Campaign Core Fragment Reward Conflict

문서 기준:

```text
보스 조우만 함: 코어 파편 0
HP 65% 이하: +1
HP 25% 이하: +1
보스 처리: +2
```

현재 구현:

- `meta_progression.record_boss_recall()`은 첫 보스 회수면 HP와 무관하게 코어 파편 +1을 지급한다.
- `run_result_evaluator.gd`는 보스 회수 + HP 65% 이하일 때 후보 +1로 계산한다.
- `main.gd`의 실제 보스 회수 정산은 `meta_progression.record_boss_recall()` 경로를 사용한다.

영향:

- 문서의 "보스 조우만으로 지급 금지"를 실제 지급 경로가 깨뜨릴 수 있다.
- `run_result_evaluator`와 `meta_progression`이 서로 다른 보상 기준을 가진다.

심각도:

```text
P0
```

### C6. Currency Naming Conflict

문서 기준:

```text
광고 전단 조각
캠페인 코어 파편
```

현재 구현:

- `TRACE_TORN_AD_FLYER`
- UI/정산 일부: "찢어진 광고 전단", "전단"
- 문서/최신 기준: "광고 전단 조각"

영향:

- 시스템적으로 큰 충돌은 아니지만, 유저-facing 명칭 통일 필요.

심각도:

```text
P2
```

### C7. Upgrade Tree Theme Conflict

문서 기준:

- 윤서 3계열: 반품 스캐너 출력, 반품 도장 개조, 회수선 안정화
- 보급소 시설: 정산 카운터, 정비대, 이름 보관함, 출격 게시판, 차징 조율대

현재 구현:

- 업글은 16개 수준으로 늘어나 있으나 테마가 이전 구조와 섞여 있다.
- 예: "수동 송출 안정화", "코어 신호 판독", "좌표 연동 해석", "방패 주파수 픽업"

영향:

- 기능적 기반은 활용 가능하다.
- 다만 0.2 유저 경험은 윤서/반품/보급소 중심이어야 하므로 명칭과 카테고리 재정렬 필요.

심각도:

```text
P1
```

### C8. Card Pool Conflict

문서 기준:

```text
0.2 카드 풀 = 기본 8장 + 해금 4장
```

현재 구현:

- `level_up_cards.gd`에는 17개 카드가 존재한다.
- 기존 카드명/태그가 스토리팀 0.2 카드 지시서와 다르다.

영향:

- 현재 전투 재미 검증에는 도움되지만, 0.2 콘텐츠 락과 다르다.
- 카드 데이터/희귀도/해금 분리 전에는 문서와 코드가 계속 벌어진다.

심각도:

```text
P1/P2
```

### C9. First Boss Outcome Conflict

문서 기준:

```text
보스 처리 후 선택:
  결절 파괴
  기억 추출
```

현재 구현:

- 보스 처치 시 `boss_victory`로 보급소 복귀.
- "송출 침묵" 및 코어 파편 지급 중심.
- 보스 선택 UI/상태가 없다.

영향:

- 0.2에서 지역 생태권 변화를 증명하려면 보스 선택이 필요하다.
- 현 구현은 보스 승리를 단일 결과로 처리한다.

심각도:

```text
P0 after boss replacement
```

### C10. Region Ecology State Missing

문서 기준:

```text
campaign_pressure
boss_outcome
revisit_count
adaptation_charge
discovered_traces
broadcast_records_found
```

현재 구현:

- `sortie_index`, `boss_signal_state`, `boss_clear_count`, `signal_clues`는 있음.
- `r01_suburb_state` 형태의 지역 상태 컨테이너는 없음.

영향:

- "맵 최소 구조" 전에 최소 지역 상태 모델이 필요하다.
- 단, 보스 정체성 충돌을 해결한 뒤 붙이는 편이 안전하다.

심각도:

```text
P1
```

## 5. Boss Handling Options

### Option A. 현재 캠페인 송출관 보스를 0.2 임시 보스로 유지

내용:

- 현재 구현을 유지한다.
- 문서의 "스마일 홈 시어머니"는 0.3 이후로 미룬다.

장점:

- 구현 비용 최저.
- 현재 보스/디버그/결과 루프를 바로 플레이 가능.

단점:

- 승인된 v1 기준과 정면 충돌.
- 외곽 주택가 로컬 생태권과 보스 선택 구조가 약해진다.
- 상위 목표인 송출관을 0.2에서 소모한다.

판정:

```text
비추천
```

### Option B. 현재 보스 구현을 삭제하고 스마일 홈 시어머니를 새로 구현

내용:

- `boss_controller.gd`를 사실상 새 보스 기준으로 재작성한다.
- 패턴/아레나/문구/결과를 모두 새로 만든다.

장점:

- 문서 기준과 가장 깨끗하게 일치.
- 장기 구조 부채가 적다.

단점:

- 구현 비용 큼.
- 현재 동작하는 보스 전투/디버그/밸런스 기반을 잃는다.
- 0.2 속도에 부담.

판정:

```text
품질은 좋지만 즉시 착수 리스크 큼
```

### Option C. 현재 보스 구현을 스마일 홈 시어머니로 리스킨/리테마

내용:

- 현재 `boss_controller.gd`의 HP/페이즈/방어 타입/코어 노출/패턴 흐름은 유지한다.
- 이름, 문구, 패턴 라벨, 텔레그래프 의미, 결과 문구를 스마일 홈 시어머니 기준으로 바꾼다.
- 캠페인 송출관은 보스가 아니라 "상위 접근 목표/후속 송출 결절"로 UI 문구를 내린다.
- 이후 0.3에서 패턴을 완전히 스마일 홈 시어머니스럽게 재구성한다.

매핑 예시:

| 현재 패턴 | 0.2 리테마 |
| --- | --- |
| 황금 시간대 스윕 | 오늘의 가족 특가 |
| 보증서 방패 | 무상 보증 상담 |
| 신호 왜곡 세일 | 추천 평면도 |
| 가정용 안전 시연 | 깨끗한 거실 / 홈 시연 돌진 |
| 코어 노출 | 가족사진 플래시 후 외피 균열 |

장점:

- 현재 구현 자산을 살린다.
- 승인된 문서 기준과 큰 방향을 맞춘다.
- 맵 최소 구조 작업 전에 필요한 충돌을 빠르게 줄일 수 있다.

단점:

- P0 문서의 `기념사진 시간`, `홈케어 청소기` 정체성을 완전히 살리진 못한다.
- 임시 리테마가 오래 남으면 다시 부채가 된다.

판정:

```text
추천
```

## 6. Recommended Decision

권장안:

```text
Option C: 현재 캠페인 송출관 보스를 스마일 홈 시어머니로 리스킨/리테마한다.
```

세부 방침:

1. 0.2 직접 보스 이름과 UI 문구는 `스마일 홈 시어머니`로 바꾼다.
2. `캠페인 송출관`은 보스 이름이 아니라 `송출관 접근 절차 확정`과 후속 목표 문구에만 남긴다.
3. 현재 보스 패턴 로직은 0.2 임시로 재사용한다.
4. 패턴명/경고문/결과문/보급소 힌트는 외곽 주택가/가족 상품화/모델하우스 테마로 바꾼다.
5. 보스 HP 65%/25% 코어 파편 지급 기준은 문서 기준으로 통일한다.
6. 보스 처치 후 `결절 파괴 / 기억 추출` 선택 UI 또는 최소 선택 상태를 추가한다.

이 결정이 필요한 이유:

```text
맵 최소 구조는 외곽 주택가를 만든다.
외곽 주택가의 중심 결절이 송출관이면 0.2 스토리 기준과 어긋난다.
따라서 맵 작업 전에 보스 정체성부터 맞춰야 한다.
```

## 7. P0 Work Order Reordering

기존 `RPG_GROWTH_ARCHITECTURE_V1.md`의 P0 작업은 유효하지만, 현재 구현 충돌 때문에 순서를 조정한다.

### Revised P0 Order

1. **Boss Identity Bridge**
   - 캠페인 송출관 직접 보스 문구를 스마일 홈 시어머니로 전환.
   - 송출관은 상위 목표 문구로만 남긴다.

2. **Boss Reward Rule Fix**
   - 보스 조우/첫 보스 회수만으로 코어 파편 지급 금지.
   - HP 65%/25%, 처치 기준으로 통일.
   - `run_result_evaluator`와 `meta_progression` 기준 일치.

3. **Boss Outcome Hook**
   - 보스 처리 후 `결절 파괴 / 기억 추출` 상태를 받을 수 있는 최소 hook 추가.
   - UI가 부담되면 우선 디버그/기본 선택 상태로라도 `boss_outcome`을 만든다.

4. **Signal Record Wording Pass**
   - "좌표 흔적/좌표 연동" 표현을 "송출관 접근 절차/개장 전 점검표" 쪽으로 정리.
   - 송출 기록은 재화가 아니라 state임을 UI에 맞춘다.

5. **Run Result Evaluator Integration**
   - 성과 기반 정산을 실제 지급 경로와 연결.
   - 빠른 죽음 파밍 방지 확인.

6. **Outpost Result/Upgrade UI Boundary**
   - 정산 카운터, 정비대, 차징 조율대, 이름 보관함, 출격 게시판의 최소 역할 분리.

7. **R01 Suburb Minimum State**
   - `campaign_pressure`, `boss_outcome`, `revisit_count`, `adaptation_charge`, `discovered_traces`, `broadcast_records_found` 중 P0만 추가.

8. **Map Minimum Structure**
   - 위 기준이 잡힌 뒤 외곽 주택가 맵 최소 구조 작업 착수.

## 8. Map Minimum Structure Growth/Story Criteria

맵 최소 구조 작업에 넘길 기준:

### Region Identity

```text
r01_suburb = 완벽한 가족과 완벽한 집을 팔던 동네가,
끝나지 않는 오픈하우스 광고 생태권으로 변한 첫 로컬.
```

### Required Zones

0.2 최소:

- 침묵 가장자리
- 분양 주택 루프
- 모델하우스 결절

P1:

- 배수로 침묵 주머니
- 가짜 귀환로

### Required Growth Hooks

맵은 최소한 아래 state를 받을 수 있어야 한다.

```text
revisit_count
broadcast_records_found
boss_outcome
discovered_traces
campaign_pressure
```

### Required Reactions

| 조건 | 맵/문구 반응 |
| --- | --- |
| 재방문 1회 | 같은 집이 또 있다는 문구 |
| 재방문 3회 | 단골 고객 배너 |
| 송출 기록 1 | 광고 문구 사이에 잡음/영수증 전조 |
| 송출 기록 2 | 모델하우스 방향성 강화 |
| 송출 기록 3 | 중심 결절 노출 |
| 결절 파괴 | 광고 소음 일부 감소, 문패 반응 |
| 기억 추출 | 가족사진/문패 미스터리 강화 |

### Boss Arena Direction

스마일 홈 시어머니 아레나는:

```text
외곽 주택가 중앙 모델하우스 앞 원형 교차로
```

필수 오브젝트:

- 오픈하우스 표지판
- 같은 집을 가리키는 화살표
- 가족사진 플래시 장치
- 쿠폰 전단
- 홈케어 청소기 소환 지점

## 9. Secondary Conflicts To Track

| 충돌 | 처리 시점 |
| --- | --- |
| 현재 카드 17장 vs 0.2 카드 12장 | 보스 브리지 후 P1 |
| `torn_ad_flyer` 코드명 vs 광고 전단 조각 유저명 | UI 문구 정리 때 |
| 기존 16개 업글 vs 윤서 3계열 성장 | 보급소 UI 경계 후 |
| `sortie_index` 웨이브 압력 의존 | 성과 정산/지역 상태 이후 |
| 저장/불러오기 없음 | 0.2에서는 세션 기준 유지 |
| 캠페인 송출관 관련 기존 디버그 키 | 보스 브리지 때 이름/설명 수정 |

## 10. Final Recommendation

한 줄 결론:

```text
RPG Growth v1 문서는 기준서로 승인.
다만 브리지 전 구현의 캠페인 송출관 보스 표현은 0.2 기준과 충돌했으므로,
맵 최소 구조 전에 해당 보스 표현을 스마일 홈 시어머니로 브리지하는 충돌 해소 작업을 먼저 진행해야 한다.
```

다음 작업으로 권장:

```text
작업명:
  Boss Identity Bridge for RPG Growth v1

목표:
  기존 캠페인 송출관 보스 구현을 0.2 스마일 홈 시어머니 기준으로 리스킨/리테마하고,
  캠페인 송출관은 상위 접근 목표 문구로만 남긴다.

금지:
  보스 로직 전면 재작성
  캠페인 송출관 직접 보스 유지
  보스 조우만으로 코어 파편 지급
```
