# E01 M05 시나리오 통합 보정 v0.2
## 흰 팔찌는 문을 열어주지 않는다

문서 성격: V0.1 비파괴 integration overlay  
Campaign: E01_C02 백색팔찌 격리권  
신규 LOCKED canon: 0

`e01_m05_white_wristband_scenario_draft_v0_1.md`의 장면과 인간극을 유지하되, 아래 보정이 우선한다.

## 1. C02 갈등 엔진 교체

V0.1의 "동생 치료 순번"을 C02의 주 시스템으로 사용하지 않는다.

v0.2 핵심은 다음 mismatch다.

```text
동생의 actual care need
!=
guardian / care-recipient record
!=
current eligibility / discharge state
!=
finite bed / treatment / medicine / transfer capacity
```

서하가 나가고 싶어 하는 마음과 동생을 버리고 싶지 않은 마음은 유지한다. 다만 "몇 번째 순번"을 지키는 이야기가 아니라, 서하의 퇴원 또는 guardian-link 변경이 동생의 care continuity, eligibility, transfer support를 어떻게 불안정하게 만드는지로 바꾼다.

## 2. 서하 / 동생 / 보호자 설정

- 서하: episode-local candidate 인물
- 동생: episode-local candidate 관계
- guardian 연결: C02의 patient/care/discharge record mismatch를 드러내는 candidate 장치
- 기존 C02 authority의 proof character로 승격하지 않음
- 캐릭터 roster나 LOCKED canon에 자동 등록하지 않음

서하와 동생이 존재한다고 해서 C02 전체 규칙이 가족 보호자 시스템으로 환원되지 않는다.

## 3. 제거 또는 하향할 표현

다음은 V0.2 authority로 사용하지 않는다.

- "치료 순번"이 C02의 핵심 자원이라는 표현
- 번호표/대기열 기반의 승패
- 보호자 슬롯 하나가 자동으로 치료 순서를 생성 또는 삭제한다는 단정
- 17분 같은 exact mechanic을 C02 canon 값처럼 사용
- 특정 환자 한 명의 결과를 C02 Local의 영구 법칙으로 승격

시간 압박이 필요하면 "짧은 교대 갱신 창" 정도로만 처리하고 exact duration은 production fill로 남긴다.

## 4. 장면별 보정

### Opening

약품 부족은 실제 medicine availability로 유지한다. 등록상 받을 수 있음과 현재 재고가 있음은 분리한다.

### R02-L01 응급 접수 홀

윤서를 visitor/guardian 후보로 분류하는 것은 시스템 claim이다. 윤서의 실제 관계를 증명하지 않는다.

### R02-L02 장기 입원동

서하는 actual condition, long-term-care record, current capacity의 어긋남을 알고 있어 윤서를 안내한다. 역에스코트 구조는 유지한다.

### R02-L03 보험 심사 약국

약품을 가져갈 때 "다른 환자의 순번이 사라짐" 대신 "현재 available supply와 verified eligibility 사이에 결손이 생김"을 보여준다. 피해는 이름 있는 환자의 실제 투약/서비스 부족으로 인간적으로 체감시킨다.

### 퇴원 심사

R02-L05 퇴원 불가 병동은 canonical semantic anchor다. 다만 R02-L03 또는 R02-L02에서 R02-L05로 가는 physical route는 이번 문서가 확정하지 않는다. 장면 배치는 route validation 전 candidate다.

## 5. 윤서 적용

주축 후보:

- CONTROL <-> DELEGATION
- HOLD <-> COMMIT

서하와의 trust는 contextual memory로만 기록한다.

윤서가 잘못 대신 결정했을 때 repair는:

1. 개입을 줄인다.
2. 서하가 직접 자기 선택을 말하게 한다.
3. 실제 care/support 조건을 다시 마련한다.
4. 결과 비용을 후속 방문에서 부담한다.

## 6. 결말 경계

서하가 남음 / 떠남 / 연락선을 만듦은 episode candidate 결과다. 어떤 결과도 C02의 영구 route, bed 수, medicine stock, structural persistence를 잠그지 않는다.

NEXT HOOK가 R03를 가리켜도 정보 단서다. R02 -> R03 physical travel 또는 Campaign Dependency edge를 뜻하지 않는다.
