# 02 Global World Structure Lock Draft v0.2

상태: 사용자 결정 반영 초안 / **최종 LOCK 아님**

## 0. 이번 결정 반영 요약

사용자 확정:

1. 96개 캠페인 ID 완전 고정
2. display name은 제작 전까지 제한적 수정 가능
3. 글로벌 기본 줌은 12광역권 + 수신된 계열/cluster만 노출
4. E01 40 local node는 글로벌에서 압축
5. 모든 정식 캠페인에 6개 differentiation field 적용
6. 광역권 이동은 relay + beacon + 회수선 혼합형
7. Regional/Campaign Memory는 Direct Memory와 Rumor/Information Memory로 분리

## 1. 글로벌 계층

정식 계층:

```text
GLOBAL
→ SECTOR E01~E12
→ CAMPAIGN E##_C01~C08
→ LOCAL NODE
```

### 1.1 ID Lock

고정:

- Sector: `E01~E12`
- Campaign family: 각 sector의 `C01~C08`
- 정식 campaign 조합: 총 96개

금지:

- 새 정식 campaign ID 추가
- 기존 ID 삭제
- sector 간 ID 이동
- C01~C08 계열 재배열

## 2. Campaign Display Name Policy

```text
ID = locked
DISPLAY NAME = limited mutable until production entry
```

display name을 바꿀 때는 반드시 남긴다.

- current display name
- previous alias
- 변경 시각/버전
- 변경 이유
- 연결 문서의 옛 명칭 검색 가능성

ID가 동일하므로 이름 변경으로 역사적 연결이 끊기면 안 된다.

## 3. Global Map Visibility

기본 글로벌 화면은 96개 캠페인을 전부 펼치지 않는다.

기본 노출:

- 12개 광역권
- 현재까지 발견/수신된 campaign family
- 일부 campaign signal / cluster

정보 공개 5단계:

| 단계 | 표시 | 실지리/캠페인 정보 | 행동 |
|---|---|---|---|
| 미관측 | 노이즈/빈 영역 | 없음 | 탐지 근거 확보 |
| 원격 감지 | 광역권 가명, 계열 신호/cluster | 방향·해안선 일부 | 신호 분석 |
| 부분 복원 | 주요 인프라 축, 일부 campaign identity | 항만/철도/강/산맥 암시 | relay 후보 탐색 |
| 출격 가능 | 접근 가능한 campaign/local 진입점, 위험/인양 조건 | 실제 구조가 더 명확 | 출격 |
| 진실 복원 | 옛 지도, 깨진 좌표, 원본 기록 | 실명 일부 암시 가능 | 세계 진실 교차검증 |

실제 지리 노출은 기존 10% 인식 밀도 원칙을 유지한다.

## 4. E01 40-node Compression Rule

E01은 40 local node / 37 연결을 가진 첫 풀 시즌 exemplar지만 전 지구 기본 밀도가 아니다.

글로벌 표시:

```text
GLOBAL
→ E01
→ E01의 8 CAMPAIGN
→ 선택한 CAMPAIGN 내부에서 LOCAL NODE
```

금지:

- 글로벌 지도에 E01 local 40개 동시 표시
- E01 40개를 세계 노드 40개로 집계
- E02~E12를 E01 밀도로 자동 확장

## 5. Campaign Differentiation Contract

모든 정식 캠페인은 최소 다음 6필드를 가진다.

### 5.1 regional_secondary_collapse

지역의 원래 시스템이 장기간 어떤 2차 붕괴를 겪었는가.

### 5.2 infrastructure_anchor

실제 플레이와 직접 연결되는 물리 인프라. 배경 미술용 명사가 아니라 이동, 서비스, 위험, 회수, 조사에 쓰여야 한다.

### 5.3 gameplay_law

플레이어가 해당 캠페인에서 배우고 이용해야 하는 고유 규칙.

### 5.4 human_recognition_rule

캠페인이 사람을 어떤 서비스 대상/역할/등록 상태로 판정하는가.

### 5.5 resource_ecology

캠페인이 대응과 서비스를 위해 실제로 소비하는 capacity/resource, 고갈 시 중단되는 기능, 외부 지원 가능 경로.

### 5.6 persistence_profile

무엇을 직접 기억하고, 얼마나 유지하며, 누가 알 수 있고, 어떤 링크로 정보가 전파되며, gameplay에서 무엇을 바꿀 수 있는지 정의한다.

이 6필드는 설정 문장으로 끝나면 실패다. 최소 하나 이상의 이동/전투/조사/협상/서비스 선택 차이를 만들어야 한다.

## 6. Regional / Campaign Memory

### 6.1 Direct Memory

행동이 실제 발생한 캠페인의 기억.

물리 상태와 직접 연결 가능:

- 시설 상태
- 주민 상태
- 서비스 상태
- 통로 상태
- 반복 경로
- 인양 결과
- NPC 관계
- 조사 공개 결과

### 6.2 Rumor / Information Propagation

연계 캠페인의 간접 기억.

전달 채널:

- 주민 이동
- 통신망
- 물류망
- 방송
- 캠페인 지원 관계
- 행정/등록 기록
- 생존자 소문
- 회수선/비콘 기록

소문으로 변화 가능:

- 태도
- 경계
- 초기 반응
- 검문
- 협상
- 일부 서비스 접근
- 순찰 준비
- 질문/대사
- 플레이어에 대한 기대

소문만으로 변화 금지:

- 물리 시설 상태
- 실제 통로 상태
- 실제 자원량
- 사건 세부 사실의 완전한 획득
- 보스의 전지적 즉시 counter

## 7. Campaign Resource Ecology

공통 최소 계약:

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

공통 계약은 인과 순서를 고정한다.

지역 implementation은 다음을 다르게 가진다.

- 무엇을 관측할 수 있는가
- 어떤 자원을 쓰는가
- 어떤 서비스가 먼저 무너지는가
- 어떤 연결 캠페인에 지원을 요청하는가
- NPC가 무엇을 잃거나 얻는가
- 어떤 기억이 남고 어떤 소문이 전파되는가

## 8. Global Travel / Relay / Beacon

사용자 선택: 혼합형.

### 8.1 Sector 접근

`RELAY / 현지 중계점`이 필요하다.

새 sector를 여는 근거:

- 원격 신호 복원
- 현지 relay
- 침묵점/대피점/중계 인프라
- 연결 가능한 회수선 근거

### 8.2 Local sortie

`BEACON / 회수 가능한 고정 좌표`를 기준으로 시작한다.

자유로운 순간이동식 좌표 선택은 금지한다.

### 8.3 귀환 / 인양

`회수선 + BEACON`을 사용한다.

실패 시 남을 수 있는 것:

- 귀환 지연
- 회수품 손실
- 신호 노출
- 좌표 오염
- 현지 캠페인의 인양 패턴 관측
- 다음 sortie 조건 변화

### 8.4 정보 전달

정보는 신체 이동보다 먼저 도달할 수 있다.

단, 정보 전달이 물리적 이동을 대신하지 않는다.

## 9. E02~E12 Expansion Boundary

유지:

- E02 이후 기본값은 season slice.
- 모든 광역권을 40 local로 만들지 않는다.
- 미사용 캠페인은 remote signal / background pressure 상태로 존재할 수 있다.
- 이번 초안에서 E02~E12 신규 local node는 생성하지 않는다.

## 10. 상태

이번 문서는 사용자 결정을 반영했지만 **최종 LOCK 파일이 아니다**.

최종 LOCK 전 남은 작업:

- 96개 캠페인에 6필드 적용 규칙 검증
- 중복 위험 6개군 differentiation gate 검증
- persistence/rumor propagation의 데이터 계약 최소형 확인
- travel/relay 정보가 글로벌 UI에서 과도하게 노출되지 않는지 확인

E01 상세 재연결과 실제 플레이 맵 제작은 아직 시작하지 않는다.
