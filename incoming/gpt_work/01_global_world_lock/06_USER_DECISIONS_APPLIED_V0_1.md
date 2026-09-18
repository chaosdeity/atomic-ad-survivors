# 06 User Decisions Applied v0.1

상태: 결정 반영 기록 / 최종 LOCK 아님

## 1. 96 Campaign ID

사용자 확정: A

- E01~E12 고정
- 각 sector C01~C08 고정
- 총 96 ID 고정
- 신규 ID / 삭제 / sector 이동 / family 재배열 금지

## 2. Display Name

사용자 확정: B

- ID immutable
- display name은 해당 지역 production entry 전까지 제한 수정 가능
- aliases/history 추적 필수

## 3. Global Zoom

사용자 확정: B

기본 노출:

- 12 sector
- 발견/수신된 campaign family
- 일부 signal / cluster

visibility:

1. 미관측
2. 원격 감지
3. 부분 복원
4. 출격 가능
5. 진실 복원

## 4. E01 Local Compression

사용자 확정: B

- 40 local node는 global world node 아님
- GLOBAL → E01 → 8 CAMPAIGN → LOCAL
- E01은 전체 세계의 기본 밀도 아님

## 5. Campaign Differentiation

사용자 확정: A+B+C 전부

필수 6필드:

- regional_secondary_collapse
- infrastructure_anchor
- gameplay_law
- human_recognition_rule
- resource_ecology
- persistence_profile

## 6. Global Travel

사용자 확정: C 혼합형

- sector 접근 = relay / 현지 중계점
- local sortie = beacon / fixed coordinate
- 귀환/인양 = recovery line + beacon
- 정보는 신체보다 먼저 이동 가능
- 순간이동처럼 보이는 표현 금지

## 7. Regional / Campaign Memory

사용자 커스텀 확정.

```text
PLAYER ACTION
→ DIRECT CAMPAIGN MEMORY
→ causal information path
→ LINKED CAMPAIGN RUMOR / INFORMATION
→ limited gameplay preparation changes
```

전지적 공유 금지.

Direct Memory와 Rumor Memory를 구분한다.

### 소문 허용 효과

- 태도
- 평판/경계
- 초기 반응
- 검문
- 협상
- 일부 서비스 접근
- 순찰 준비
- 질문/대사
- 행동 기대

### 소문 단독 금지 효과

- 시설 파괴/복구
- 통로 개폐
- 물리 자원 증감
- 사건 세부정보 완전 획득
- 즉시 전지적 보스 counter

## 8. persistence_profile 적용

사용자 요구를 만족하기 위한 최소 복합 구조:

- remember
- retention
- visibility
- propagation
- gameplay_effects

별도 최상위 필드를 계속 늘리지 않는다.

## 9. 캠페인 자원 생태

유지:

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

모든 캠페인이 동일 response table을 쓰지 않는다.

## 10. 기존 Draft에서 닫힌 항목

- ID lock
- display name policy
- global information density
- E01 compression
- differentiation fields
- travel model
- memory model

## 11. 아직 확정하지 않은 항목

- 96 campaign 각각의 6필드 실제 상세값
- 개별 rumor link graph
- 개별 relay/beacon 위치
- E01 40 local 재연결
- 실제 Unreal 플레이 맵
- 최종 LOCK 문서

## 12. 범위 검증

이번 결정 반영본은:

- 새 campaign ID 0
- E02~E12 신규 local node 0
- E01 상세 재연결 0
- 실제 플레이 맵 생성 0
- main 변경 0

을 목표로 한다.
