# 04 Campaign Differentiation Gate

상태: 사용자 결정 반영 초안 / 최종 campaign 세부값 아님

목적: 기존 96 ID를 유지하면서 중복 위험 6개군이 이름/미술 테마가 아니라 실제 gameplay law, resource ecology, persistence, rumor propagation에서 갈라지도록 한다.

## 공통 Gate

각 캠페인은 최소 다음 6필드에서 이웃/유사 캠페인과 의미 있는 차이를 가져야 한다.

- `regional_secondary_collapse`
- `infrastructure_anchor`
- `gameplay_law`
- `human_recognition_rule`
- `resource_ecology`
- `persistence_profile`

실패 조건:

- 이름만 다름
- 국가/도시 미술만 다름
- 적 스킨만 다름
- 동일한 대기열/검문/회수/방송/보급 규칙을 반복
- 동일한 소문 효과를 전 지역에 복제

---

## 1. E02_C02 ↔ E05_C02 의료 대기

### E02_C02 만성 대기 진료권

- infrastructure: 예약/번호표/야간 진료/통근 연계형 의료 인프라
- gameplay law: 예약 슬롯과 실제 현장 순번이 어긋나는 상태를 읽고 우회한다.
- human recognition: 예약 환자 / 대기 환자 / 미도착 환자 / 야간 환자
- resource ecology: 진료 슬롯, 야간 capacity, 약품/처치 capacity
- persistence: 누적 예약 이력, 놓친 순번, 특정 클리닉의 대응 이력
- rumor: 방재 방송·통근망·환자 이동을 통해 “이 플레이어가 순번을 건너뛴다/돕는다” 같은 요약 정보 전파 가능

### E05_C02 대기열 진료권

- infrastructure: 고밀도 병원군과 공공/민간 혼합 진료 접근망
- gameplay law: 하나의 번호표가 아니라 여러 진료/자원 bottleneck 중 어디를 풀지 선택한다.
- human recognition: 진료 대기자 / 보호자 / 자원 요청자 / 우선처치 대상
- resource ecology: 병상, 처치 인력 capacity, 약품, 이동 capacity
- persistence: 어떤 병목을 우선 해소/방치했는지와 그에 따른 주민 이동
- rumor: 환자/보호자 이동과 지역 통신을 통해 플레이어 우선순위에 대한 평판이 퍼짐

차별화 핵심: **예약·시간 질서 vs 다중 자원 병목**.

---

## 2. E03_C07 ↔ E07_C07 ↔ E12_C07 통관

### E03_C07 항만통관 이동권

- infrastructure: 초대형 항만 + 고속 물류 연결
- gameplay law: 사람/화물/컨테이너 분류가 대량 자동 통관 흐름에 묶인다.
- human recognition: 통행자와 화물 소유/수취 역할이 섞여 판정될 수 있음
- resource ecology: 검사 lane, 스캔 capacity, 화물 처리 capacity
- persistence: 반복 사용한 통관 route와 검수 우회 기록
- rumor: 항만 물류 데이터와 연계 캠페인 정산 기록

### E07_C07 통관철도 통행권

- infrastructure: 국경/광역 철도와 표준화된 환승·검문
- gameplay law: 열차 시간/선로/승계 문서가 통과 가능성을 결정
- human recognition: 승객 / 환승자 / 서류 미일치자
- resource ecology: 운행 slot, 검사 인력, 선로 capacity
- persistence: 어떤 열차/환승 규칙을 반복 사용했는지
- rumor: 공공/보험/철도 네트워크의 공식 기록 중심

### E12_C07 항만검문 통행권

- infrastructure: 자원항만 + 트럭/국경도로 검문
- gameplay law: 화물 흐름과 육상 이동권이 함께 묶인다.
- human recognition: 운송자 / 검문 대상 / 화물 연계자
- resource ecology: 연료, 트럭 capacity, 검문 lane, 항만 하역 capacity
- persistence: 어떤 운송망/검문을 우회 또는 지원했는지
- rumor: 운송 기사/항만 노동망/모바일 통신을 통한 불완전 전파 비중이 큼

차별화 핵심: **대량 자동 항만 / 표준 철도 / 자원항만-육상 운송**.

---

## 3. E03_C03 ↔ E08_C03 ↔ E11_C03 ↔ E12_C03 항만 회수

### E03_C03 초대형 분류항
- gameplay: 대량 자동 분류와 소유권/수취 상태 재분류
- resource: 분류 capacity, 자동 회수 장비
- persistence: 분류 규칙에 남긴 예외/우회 기록
- rumor: 물류 데이터 중심

### E08_C03 항만창고
- gameplay: 보관/반출/검역 사이의 창고 상태를 다룬다.
- resource: 창고 공간, 냉장/보존, 하역 접근
- persistence: 어떤 물품을 보존/반출/봉인했는지
- rumor: 항로/피난/창고 관리 기록 중심

### E11_C03 항만시장
- gameplay: 공식 소유권과 비공식 시장의 소유 주장 충돌
- resource: 거래 가능한 물자, 공동체 보급, 운송 접근
- persistence: 누구의 소유권/회수를 인정했는지
- rumor: 상인/운송자/공동체 소문이 초기 협상에 강하게 영향

### E12_C03 자원항만
- gameplay: 자원 화물의 회수와 지역 생존 capacity 사이 선택
- resource: 연료/광물/전력 관련 물자와 하역 capacity
- persistence: 어떤 자원을 빼거나 남겼는지에 따른 서비스 결과
- rumor: 자원망/운송망을 통해 공급 우선순위에 대한 정보 전파

차별화 핵심: **자동 분류 / 보관 / 비공식 소유 / 생존 자원**.

---

## 4. E02_C05 ↔ E07_C05 ↔ E12_C05 방송/안내

### E02_C05 재난안내 생방송권
- gameplay law: 방재 명령의 타이밍/우선순위/반복 안내 해석
- recognition: 안내 수신자 / 대피 대상
- resource: 중계 capacity, 비상 방송 우선권
- persistence: 어떤 안내를 따르거나 반박했는지
- rumor: 공식 재난 방송이 빠르지만 요약/반복되어 맥락 손실 가능

### E07_C05 공영안내권
- gameplay law: 표준/공식 신뢰와 지역 예외의 충돌
- recognition: 공공 안내 수신자 / 등록 이용자
- resource: 공영 중계망, 검증된 기록 접근
- persistence: 공식 기록과 플레이어 증언의 신뢰 차이
- rumor: 공식 네트워크는 정확도가 높지만 갱신이 느릴 수 있음

### E12_C05 모바일방송권
- gameplay law: 이동형/저전력 중계의 범위와 끊김을 이용
- recognition: 연결 가능한 수신자 / 오프라인 집단
- resource: 배터리, 중계 장비, 통신 범위
- persistence: 어떤 지역에 신호를 남겼는지
- rumor: 빠르게 퍼질 수 있으나 relay 반복 과정에서 왜곡/누락 가능

차별화 핵심: **방재 명령 / 공영 표준 / 이동형 저전력 네트워크**.

---

## 5. E01_C01 ↔ E09_C01 주거/가족

### E01_C01 서부 스마일홈
- infrastructure: 현관, 문패, 가족 슬롯, 모델하우스 절차
- gameplay law: 가족/입주 역할 확정을 보류·반려·드러낸다.
- recognition: 가족대표 / 세대원 / 수령인 / 보호자 후보
- resource: 주거 서비스, 식탁/보호/수령 슬롯 capacity
- persistence: 어떤 가족 역할을 확정/보류했는지, 반복 출격/회수선 학습
- rumor: 주민 이동, 홈 프로필, 우편/등록 기록을 통해 부분 전파

### E09_C01 교외단지 가족권
- infrastructure: 교외 소유권/보험/커뮤니티 규약 중심 주거 인프라
- gameplay law: 거주 가능성과 소유/보험/커뮤니티 자격의 충돌을 다룬다.
- recognition: 소유자 / 보험대상 / 승인 거주자 / 커뮤니티 구성원
- resource: 주거 유지, 보험/복구 capacity, 공동 서비스
- persistence: 어떤 소유/보호 규칙을 인정하거나 깨뜨렸는지
- rumor: 이웃/보험/지역 서비스 네트워크를 통한 평판과 접근 조건 변화

차별화 핵심: **가족 슬롯/입주 심사 vs 소유권/보험/커뮤니티 규약**.

---

## 6. C08 전체 비상보급/대피

C08은 “안전지대” 공통 스킨으로 만들면 실패다.

각 E##_C08은 최소 다음을 서로 다르게 가져야 한다.

1. **primary survival resource**
   - 물, 냉방, 전력, 의료, 식량, 통신, 연료 등
2. **physical shelter topology**
   - 지하, 폐역, 항만창고, 산악 음영, 공동체 창고 등
3. **communication constraint**
   - 무음, 저전력, 간헐 relay, 이동 방송, 차폐 등
4. **eligibility / recognition**
   - 누구를 배급/대피/비상 인원으로 읽는가
5. **resource depletion consequence**
   - 어떤 서비스가 실제로 중단되는가
6. **persistence / rumor pattern**
   - 직접 기억과 주변 캠페인 정보 전파가 어떻게 다른가

현재 단계에서는 12개 C08의 local node나 상세 이벤트를 만들지 않는다. 위 6항목을 채워 서로 다른 gameplay law가 확인될 때만 제작 단계로 진입한다.

---

## 7. 통과 기준

중복 위험 캠페인 두 개를 비교했을 때 다음 질문 중 최소 4개에서 다른 답이 나와야 한다.

- 플레이어가 실제로 만지는 인프라는 다른가?
- 배워야 하는 gameplay law는 다른가?
- 인간을 판정하는 역할이 다른가?
- 고갈되는 자원과 서비스가 다른가?
- 직접 기억하는 사건이 다른가?
- 소문이 이동하는 네트워크와 정확도가 다른가?
- 같은 행동을 했을 때 다음 방문의 준비 상태가 다른가?

4개 미만이면 differentiation HOLD.
