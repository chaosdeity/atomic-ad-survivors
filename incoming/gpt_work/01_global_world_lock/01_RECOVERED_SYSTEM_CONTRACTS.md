# 01 Recovered System Contracts

상태: 사용자 결정 반영 초안 / 최종 LOCK 아님  
범위: 전 지구 공통 시스템 계약만 정리한다. Godot/Python proof를 Unreal production code로 자동 포팅하지 않는다.

## 0. 반영 기준

이번 초안은 다음을 전제로 한다.

- 전 지구 정식 구조는 `E01~E12 × C01~C08 = 96개 캠페인`으로 유지한다.
- 새 정식 캠페인 ID를 만들지 않는다.
- 회수할 핵심은 새 캠페인 목록이 아니라 캠페인 반응, 지역 기억, 조사 정보 교차검증이다.
- proof의 확률/수치/성공률은 production balance 값이 아니다.
- 윤서 legacy reference는 최신 Unreal 캐릭터 정본을 대체하지 않는다.

## 1. Campaign Ecology Response Contract

공통 최소 흐름:

```text
PLAYER ACTION
→ PHYSICAL EFFECT
→ OBSERVED / DISCOVERED?
→ RESPONSE INTENT
→ RESOURCE CHECK
→ RELATIONSHIP / INFRASTRUCTURE CHECK
→ RESPONSE or SERVICE DEGRADATION
→ NPC / ROUTE / SERVICE CHANGE
→ PERSISTENCE
→ optional RUMOR / INFORMATION PROPAGATION
```

공통 계약과 지역 구현을 분리한다.

### 1.1 공통 계약

1. 플레이어 행동이 물리적 효과를 만들지 않았으면 캠페인은 물리 상태를 바꿀 근거가 없다.
2. 캠페인이 행동을 직접 관측하지 못했다면 즉시 정확한 counter를 만들 수 없다.
3. 대응에는 해당 캠페인의 `resource_ecology`가 허용하는 실제 자원/서비스 능력이 필요하다.
4. 자원이 부족하면 무한 증원 대신 서비스 중단, 대응 지연, 다른 캠페인 지원 요청, 우회, 경계 강화 같은 결과가 발생할 수 있다.
5. 다른 캠페인의 개입은 기존 관계/인프라/통신/물류 링크가 있을 때만 가능하다.
6. NPC·경로·서비스 변화는 결과 상태로 저장될 수 있으나, 캠페인마다 저장 범위가 다르다.
7. 모든 캠페인이 같은 대응표를 공유하지 않는다. 공통 계약은 인과 순서만 고정한다.

### 1.2 금지

- 시간만 지나면 전 지구가 플레이어를 자동으로 더 강하게 추적하는 구조.
- 캠페인 자원과 상관없는 무한 적 증원.
- 직접 관측도 정보 전달도 없는데 정밀 counter를 생성하는 구조.
- 다른 지역의 물리 상태를 소문만으로 즉시 변경하는 구조.

## 2. Region Persistence / Campaign Memory Contract

지역 기억은 두 층으로 나눈다.

### 2.1 Direct Memory

플레이어가 실제로 행동한 캠페인은 인과가 확인된 사건을 직접 기억할 수 있다.

대표 범주:

- 시설 파괴 / 복구
- 주민 구조 / 방치
- 특정 집단 지원
- 캠페인 서비스 방해
- 조사 사실 공개
- 중요 선택
- 반복적으로 사용한 경로
- 인양 성공 / 실패
- 특정 NPC 관계 변화

Direct Memory는 실제 물리 상태, NPC 상태, 서비스 상태, 통로 상태를 저장할 수 있다.

### 2.2 Rumor / Information Memory

연계 캠페인은 사건을 직접 본 것이 아니라 정보 경로를 통해 일부만 전달받는다.

허용 전파 경로:

- 주민 이동
- 통신망
- 물류망
- 방송
- 캠페인 간 지원 관계
- 행정 / 등록 기록
- 생존자 소문
- 회수선 / 비콘 기록

Rumor Memory가 바꿀 수 있는 것:

- NPC 태도
- 플레이어 평판 / 경계
- 캠페인 초기 반응
- 검문 강도
- 협상 조건
- 일부 서비스 접근
- 순찰 준비 상태
- 특정 질문 / 대사
- 플레이어 행동에 대한 기대

Rumor Memory만으로 바꾸면 안 되는 것:

- 다른 지역 시설의 자동 파괴
- 방문하지 않은 통로의 자동 개방
- 실제 자원의 이유 없는 감소
- 사건을 보지 않은 캠페인의 정확한 세부 사실 획득
- 모든 보스의 즉시 counter 행동

## 3. persistence_profile 제안

필드 폭증을 피하기 위해 `persistence_profile`은 하나의 복합 계약으로 둔다.

```yaml
persistence_profile:
  remember:
    - <기억할 사건 범주>
  retention:
    class: session | short | long | structural
    decay_rule: <필요 시>
  visibility:
    direct_knowers: <직접 아는 주체>
    network_knowers: <공식 네트워크로 알 수 있는 주체>
  propagation:
    channels: [resident, comms, logistics, broadcast, admin, beacon]
    targets: <연계 캠페인 필터>
    fidelity: exact | summarized | noisy | biased
  gameplay_effects:
    - attitude
    - access
    - inspection
    - negotiation
    - patrol_preparation
    - service_priority
```

### 3.1 의미

- `remember`: 무엇을 기억하는가.
- `retention`: 얼마나 오래 기억하는가.
- `visibility`: 누가 직접 또는 공식 네트워크로 알 수 있는가.
- `propagation`: 어떤 캠페인으로 어떤 경로를 통해 얼마나 정확하게 전달되는가.
- `gameplay_effects`: 기억/소문이 실제 플레이에서 무엇을 바꿀 수 있는가.

`memory_scope`를 별도 필드로 늘리기보다 위 구조로 표현한다. 필요하면 event 단위 태그로 `direct | networked | rumor | none`을 사용할 수 있지만 campaign schema의 최상위 필드로 추가하지 않는다.

## 4. Physical Causality Gate

물리 상태 변경은 항상 실제 인과 경로를 요구한다.

예:

```text
시설 파괴
→ 현지 서비스 capacity 감소
→ 현지 주민 이동
→ 주민/물류가 연결 캠페인으로 이동
→ 연결 캠페인이 수요 증가를 관측
→ 해당 캠페인의 resource check
→ 서비스 우선순위 또는 검문 변화
```

금지 예:

```text
시설 파괴
→ 소문 전파
→ 다른 대륙 시설 자동 파괴
```

정보는 먼저 이동할 수 있지만 물질, 사람, 장비, 서비스 capacity는 실제 이동/소모 경로를 가져야 한다.

## 5. Investigation Cross-Validation Contract

조사 시스템은 단일 단말이 정답을 말하는 구조를 피한다.

공통 계약:

1. 기록은 출처와 관점을 가진다.
2. 서로 다른 출처의 기록을 대조하면 의미가 바뀔 수 있다.
3. 위치, 치료, 동의, 자원, 등록 상태가 같은 사건의 해석을 바꿀 수 있다.
4. 불완전한 근거로도 행동할 수 있지만 결과 책임이 남는다.
5. 인양/철수 후에도 미해결 단서와 책임이 사라지지 않을 수 있다.
6. 조사 결과는 `불충분 / 경쟁 가설 / 충분 근거`처럼 근거 수준을 구분할 수 있다.
7. 특정 proof의 NPC·사건·대사를 정사로 자동 편입하지 않는다.

## 6. Yunseo Legacy Reference Contract

과거 8-pose sheet의 역할은 다음으로 제한한다.

- 액션 실루엣 비교
- 스캐너 / 반품 도장 / 회수선 장비 읽힘 비교
- 포즈별 윤서 정체성 유지 여부 비교
- 최신 3D 캐릭터의 가독성 회귀 검사

금지:

- 최신 4번 얼굴 대체
- Unreal 최종 캐릭터 자산 승격
- 과거 2D 런타임 규격을 최신 캐릭터 파이프라인 규격으로 강제

## 7. 검증 요약

- Direct Memory와 Rumor Memory를 분리했다.
- Rumor만으로 물리 상태가 바뀌지 않는다.
- persistence는 모든 캠페인에 같은 값이 아니라 같은 스키마를 공유하고 값은 지역별로 다르게 둔다.
- 캠페인 자원 생태는 공통 인과 계약만 공유하며 대응 내용은 지역별 implementation이다.
- 새 캠페인 ID는 생성하지 않았다.
