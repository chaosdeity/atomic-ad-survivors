# 03 Global World Decision Matrix v0.1

상태: 사용자 결정 기록 / 최종 LOCK 아님

| # | 항목 | 사용자 확정 | 적용 규칙 | 남은 검증 |
|---:|---|---|---|---|
| 1 | 96 campaign ID | A | E01~E12 × C01~C08 = 96 완전 고정 | 데이터/문서 누락 검사 |
| 2 | display name | B | ID 고정, 제작 전 제한적 개명 가능, alias/history 추적 | alias 저장 형식 |
| 3 | global zoom | B | 12 sector + 발견된 family/signal/cluster 중심 | 과도한 정보 노출 여부 |
| 4 | E01 40-node | B | global에서 압축, campaign 진입 후 local 표시 | UI 계층 표현 |
| 5 | differentiation fields | A+B+C | 6필드 모두 필수 | 실제 gameplay 차이 gate |
| 6 | sector travel | C 혼합형 | relay + beacon + 회수선, 정보는 먼저 전달 가능 | UI/서사 표현 |
| 7 | regional memory | 사용자 커스텀 | Direct Memory와 Rumor/Information 분리 | propagation 최소 데이터 구조 |

## 1. 96 ID

확정:

```text
GLOBAL
→ E01~E12
→ E##_C01~C08
→ LOCAL NODE
```

새 ID 추가/삭제/이동/재배열 금지.

## 2. Display Name

확정:

```text
campaign_id: immutable
display_name: mutable until production entry
aliases/history: required
```

production entry 이후 이름 변경은 별도 migration 판단이 필요하다.

## 3. Global Zoom

확정 visibility state:

1. 미관측
2. 원격 감지
3. 부분 복원
4. 출격 가능
5. 진실 복원

기본 화면에서 96개 전체를 나열하지 않는다.

## 4. E01 Compression

확정:

- E01 local 40개는 world-global node가 아니다.
- E01은 풀 시즌 exemplar이지 전체 세계의 기본 밀도가 아니다.
- local은 campaign을 연 뒤에 본다.

## 5. Differentiation Fields

확정 6필드:

1. `regional_secondary_collapse`
2. `infrastructure_anchor`
3. `gameplay_law`
4. `human_recognition_rule`
5. `resource_ecology`
6. `persistence_profile`

검증 gate:

- 미술/명칭 차이만 있으면 실패.
- 플레이어 행동, 서비스, 이동, 조사, 전투, 협상 중 최소 하나가 달라져야 한다.
- 중복 위험군은 persistence와 rumor propagation 차이까지 확인한다.

## 6. Global Travel

확정 혼합형:

```text
remote information
→ relay candidate
→ sector relay / local silence point
→ beacon-fixed sortie
→ recovery line + beacon extraction
```

무료 순간이동 금지.

## 7. Memory

확정:

```text
DIRECT MEMORY ≠ RUMOR MEMORY
```

### Direct

실제 사건/물리 상태/관계 변화 저장 가능.

### Rumor

연결망을 통해 불완전하게 전파되는 정보.

허용 효과:

- attitude
- access
- inspection
- negotiation
- patrol preparation
- dialogue/question

물리 상태 자동 변경 금지.

## 8. persistence_profile 최소 구조

권장 기본안:

```yaml
persistence_profile:
  remember: []
  retention: {}
  visibility: {}
  propagation: {}
  gameplay_effects: []
```

이 구조는 아래 질문에 답해야 한다.

- 무엇을 기억하는가?
- 얼마나 오래 기억하는가?
- 누가 아는가?
- 어디로 전파되는가?
- 전달 과정에서 얼마나 왜곡되는가?
- 실제 gameplay에서 무엇이 바뀌는가?

## 9. 기존 Draft 대비 차이

닫힌 결정:

- 96 ID lock
- display-name policy
- global visibility
- E01 compression
- 6 differentiation fields
- relay/beacon hybrid
- direct/rumor memory split

여전히 잠그지 않은 것:

- 개별 96 campaign의 6필드 실제 값
- 각 campaign propagation link의 구체 목록
- 개별 relay 위치/개수
- E01 local 재매핑
- 실제 플레이 맵

## 10. 다음 승인 Gate

다음 단계로 가기 전에 사용자 승인이 필요한 것은 새 선택지가 아니라 **이번 결정 반영이 의도와 일치하는지**다.

승인 후에도 바로 플레이 맵으로 가지 않고 먼저:

1. 6개 중복 위험군 차별화 gate 검증
2. 96 campaign용 schema 최소형 정의
3. final LOCK 후보 문서 생성

순서로 진행한다.
