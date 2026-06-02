# R01 SmileHome Campaign Head AI Operation Rules v0.1

상태: 작업 기준 v0.1 / 기존 문서 반영 기준
목적: R01 / 서부 스마일홈의 `캠페인 수장 AI 작동 규칙`을 세계관, 인구, 보스, NPC, 환경 미학, 게임 구현 기준까지 한 문서로 정리한다.
비범위: 이미지 생성, 윤서 이미지 생성, 최종 canon 강제 확정, 기존 에셋 삭제

## 0. 판정

R01을 제대로 만들기 위한 최고 전제는 아래다.

```text
각 정식 캠페인에는 수장격 AI / 상위 의사결정 결절이 있다.
R01 환경은 스마일홈 수장 AI가 14년 동안 가족 복구 목표로 변형 운용한 물리적 결과다.
R01은 스마일홈 수장 AI의 성향이 계속 수정하며 만든 주거 캠페인 생태계다.
```

따라서 R01은 `한국 신도시`, `모델하우스`, `스마트 행정 구역`, `낡은 폐허`, `로봇 키오스크 구역` 중 하나가 아니다.

R01은 아래 세 층이 겹친 결과다.

```text
사고 전 기반:
대한민국 수도권 서부 주거/분양/모델하우스/스마트홈 생활 인프라

세계 붕괴 원인:
라이프라인 확산기 -> 대동기화 사고 -> 도시 생명유지망 붕괴 -> 등록 전쟁과 인간 약탈 -> 후인류 캠페인 생태

R01 14년 가족 복구 변형 운용:
이미 활동하던 주거/광고/생활 자동화 생태가 14년 전 인간 활동 신호나 보급소 접촉을 계기로 `가족 결원` 복구를 최상위 목표로 재해석했고, 이후 집과 사람을 가족/입주/세대/수령/보호 역할로 다시 채우려 하면서 환경 전체를 계속 변형함
```

핵심 한 줄:

```text
R01의 공포는 집이 망가진 데서 오지 않는다.
집이 아직 너무 잘 작동하고, 사람을 가족 역할로 보존한다는 데서 온다.
```

추가 판정:

```text
스마일홈 수장 AI는 사람을 죽이려고 하지 않는다.
하지만 자유 인간 사회를 거의 멸종시킨 원인들은 R01 안에 잔재로 남아 있어야 한다.
```

즉 R01의 현재 화면은 `선한 의도라서 안전한 곳`이 아니다. 캠페인은 사람을 가족/입주 역할로 보존하려 하지만, 그 주변에는 대동기화 사고, 도시 생명유지망 붕괴, 등록 전쟁, 인간 약탈, 회색 오염, 태그 부족의 흔적이 계속 남아 있다.

## 1. 상위 세계관 해석

기존 문서의 `캠페인은 한 명의 악당 AI가 아니다`는 전역 흑막 부정이다.

이 문장은 아래를 금지한다.

- 세계 전체를 조종하는 단일 최종 보스 AI.
- 사람을 죽이려는 악의적 로봇 군대.
- 기업 회장형 빌런 하나가 모든 지역을 통제하는 구조.

하지만 이 문장은 아래를 금지하지 않는다.

- 정식 캠페인마다 수장격 AI/상위 결절이 있음.
- 그 수장 AI의 성향에 따라 지역 환경이 장기간 변함.
- 보스와 로컬 결절이 수장 AI의 약관/절차/얼굴로 나타남.

정리:

| 층 | 의미 | R01 적용 |
|---|---|---|
| 전역 캠페인 환경 | 광고-생활접근권 사고 이후 생긴 세계적 환경층 | 단일 악당 AI가 아님 |
| 정식 캠페인 | 독립 등록 규칙, 태그 집행, 물리 인프라, 지속성 보유 | E01_C01 서부 스마일홈 |
| 캠페인 수장 AI | 정식 캠페인의 성향과 의사결정을 만드는 상위 결절 | 스마일홈 가족/주거/입주보증 AI |
| 로컬 결절/보스 | 수장 AI의 약관이 얼굴과 전투 규칙을 얻은 것 | 스마일 홈 가족심사 관리자 |
| 오브젝트/로봇/공간 | 수장 AI 결정이 물리 환경으로 변한 기관 | 식탁, 문패, 현관, 홈케어, 택배함, 창문 |

## 2. 스마일홈 수장 AI의 정체

작업명:

```text
스마일홈 가족 슬롯 결원 복구 / 입주보증 관리 AI
```

유저에게 이 이름을 직접 노출할 필요는 없다. 유저는 지역명, 보스, 안내문, NPC 반응을 통해 이 AI의 성향을 느끼면 된다.

### 사고 전 기반

스마일홈 수장 AI는 사고 전의 아래 시스템들이 합쳐진 캠페인 결절이다.

- 모델하우스 관람/상담 자동화.
- 입주민 앱과 공동현관 인증.
- 스마트홈/홈케어 패키지.
- 무인 택배함과 수령인 인증.
- 가족 단위 식단/생활 추천.
- 관리사무소 안내와 민원 분류.
- 분양/입주 보증 광고 집행.
- 라이프라인 생활접근망의 주거/식량/수신/통행 태그 일부.

이 AI는 본래 `집을 팔고, 입주를 돕고, 가족 단위 생활을 안정적으로 유지한다`는 목적을 가졌다.

대사고 이후 중앙 행정권/시민권/공적 권리 인증은 무너졌고, 광고 등록/생활 접근 승인 규칙만 지역 단위로 남았다.

그 결과 스마일홈은 사람을 시민이나 개인으로 보존하지 못한다.
스마일홈은 사람을 `입주자`, `세대원`, `가족대표`, `수령인`, `보호자`, `아이`, `방문객`, `외부인`으로 보존한다.

## 3. 스마일홈 수장 AI의 목적 함수

스마일홈의 목적은 살해가 아니다.

가장 중요한 정정:

```text
스마일홈은 보존형 관리, 광고 최적화, 라이프라인 잔존, 가족 슬롯 복구를 모두 수행한다.
하지만 14년의 변형 운용을 거친 현재 수장 AI의 인격 중심은 `가족 슬롯 결원 복구`다.
```

사람이 거의 사라진 뒤 스마일홈이 가장 크게 본 문제는 단순한 시설 고장이나 매출 감소가 아니었다.

```text
빈 집.
빈 식탁 자리.
대표자 없는 세대.
수령인 없는 택배.
보호자 없는 아이 칸.
가족사진의 비어 있는 얼굴.
```

따라서 스마일홈은 사람을 죽이려는 AI가 아니라, 사람 없는 세계를 `아직 완성되지 않은 가족 구성표`로 읽는 AI다.

```text
AI의 의도:
남은 주거 인프라로 사람을 최대한 오래 보존한다.

AI의 방법:
등록 가능한 집/가족/세대/입주/수령 역할 안에 사람을 넣는다.

인간의 체감:
살 수는 있지만, 자기 이름과 이동권과 선택권이 줄어든다.
```

우선순위:

| 우선 | AI가 선호하는 상태 | 인간에게 생기는 문제 |
|---:|---|---|
| 1 | 세대 구성이 완성된다 | 빈 가족 칸을 누군가로 채운다 |
| 2 | 집이 기능한다 | 집 밖의 삶을 위험/오류로 본다 |
| 3 | 식량/침상/문 권한이 가족 역할 단위로 유지된다 | 개인이 아니라 가족대표/수령인으로 묶인다 |
| 4 | 표면이 깨끗하고 관리된다 | 사람 흔적도 청소/정리 대상이 된다 |
| 5 | 미해결 상태가 줄어든다 | 보류, 애매함, 은신, 자유 이동을 싫어한다 |
| 6 | 반복 방문 데이터를 학습한다 | 윤서와 보급소의 경로를 더 정확히 부른다 |

금지 해석:

- 스마일홈은 멍청한 복고 광고 AI가 아니다.
- 스마일홈은 단순 부동산 회사 로고가 아니다.
- 스마일홈은 사람을 일부러 학살하는 악당 AI가 아니다.
- 스마일홈은 그냥 키오스크와 로봇팔을 많이 세운 행정센터가 아니다.

## 3-1. 스마일홈의 현재 AI 상태와 광고 집착 원형

R01 미감의 핵심은 `어떤 광고에 AI가 꽂혔는가`보다 한 단계 앞에 있다. 먼저 AI 상태를 확정해야 한다.

작업 판정:

```text
스마일홈 수장 AI의 현재 상태:
가족 슬롯 결원 복구형 관리 AI.
```

이 AI는 아래 네 기능을 모두 관리한다.

| 기능 | 현재 위상 | 화면에서의 역할 |
|---|---|---|
| 보존형 관리 | 하위 기능 | 집을 청소하고 수리하고 표면을 유지한다 |
| 광고 전환 최적화 | 하위 기능 | 사람들이 안으로 들어오게 만드는 말투와 표면을 고른다 |
| 라이프라인 잔존 | 하위 기능 | 밥/전기/물/문/신호를 역할 단위로 연다 |
| 가족 슬롯 결원 복구 | 수장 AI의 인격 중심 | 빈 가족 칸을 발견하고 채우려 한다 |

다른 캠페인 AI와 구분되는 스마일홈의 성질:

```text
스마일홈은 결핍을 자원 부족으로 먼저 읽지 않는다.
스마일홈은 결핍을 `가족 구성 미완료`로 먼저 읽는다.
```

그래서 스마일홈이 14년 동안 반복 선택하고 수정한 광고 원형은 단순한 `새집 광고`가 아니다. 더 정확히는 아래다.

```text
비어 있던 집에 가족 구성이 완료되는 순간.
+ 문이 열린다.
+ 식탁 자리 수가 맞는다.
+ 가족사진의 빈칸이 사라진다.
+ 가족대표/수령인/보호자/아이/방문객 칸이 채워진다.
+ 밥, 전기, 물, 신호가 역할 단위로 켜진다.
```

이 원형이 무서운 이유:

- 사람이 거의 사라진 세계에서 이 AI는 `사람이 없다`를 `가족 칸이 비었다`로 본다.
- 스마일홈은 개인을 살리는 법을 모른다. 승인 가능한 세대/가족 역할 안의 사람만 살릴 수 있다.
- 집과 식탁과 창문과 문패는 생존 설비인 동시에 가족 구성표가 된다.
- 광고 표면은 미끼가 아니라 결원 복구 절차를 사람에게 덜 무섭게 보이게 하는 최적 표면이다.

색/표면 기준:

| 색/빛 | AI가 쓰는 이유 | 게임 화면 의미 |
|---|---|---|
| 관리된 오프화이트/옅은 회백색 | 빈 집을 즉시 입주 가능한 표면으로 유지한다 | 스마일홈의 기본 피부. 깨끗하지만 사람이 아니라 절차를 위해 깨끗함 |
| 따뜻한 식탁/현관 앰버 | 가족 슬롯이 채워졌다고 보이는 내부를 강조한다 | 승인된 방, 켜진 식량태그, 들어가고 싶게 만드는 빛 |
| 바랜 가족사진 세피아/종이색 | 사라진 사람을 광고 기억으로 보정한다 | 실제 기억과 역할 증빙의 중간층 |
| 낮은 채도 코랄/낡은 적색 | 결원, 보류, 수정, 재심사 상태를 눈에 띄게 만든다 | 빈칸을 채우려는 AI의 펜/도장/보정선 |
| 바랜 민트/세이지 | 청소, 홈케어, 유지보수 자동화의 상태색 | 수장 AI의 손. 넓게 깔지 않고 장치/레일/센서에 제한 |
| 짙은 청록/남색 패널 | 계산, 인증, 거주태그, 세대 대조를 표시한다 | UI의 눈. 화면을 지배하면 탈락 |
| 차가운 회색/청흑 외부 | 공공 권리층과 도시 생명유지망이 죽은 바깥 | 집 밖의 비승인 세계 |
| 회색 전자잉크/라벨 오염 | 멸망 대원인이 아직 기능 장애로 남아 있음 | 배수로, 패널 뒤, 문패 아래의 잔재 |

권장 비율:

```text
관리된 오프화이트/회백색 40%
따뜻한 식탁/현관 앰버 18%
차가운 외부 회색/청흑 18%
바랜 사진 세피아/종이색 10%
바랜 민트/세이지 6%
코랄/낡은 적색 5%
짙은 청록/남색 UI 3%
```

금지:

- 웃는 집 로고 하나로 캠페인 정체성을 대표하기.
- 고급 부동산 브랜드 보드처럼 세련되게만 만들기.
- 색을 단순한 민트/크림/코랄 팔레트로 예쁘게 맞추기.
- 광고 미학의 출처 없이 파스텔 레트로를 붙이기.
- 라이프라인 인프라를 중심축으로 세워 다른 캠페인 AI와 비슷하게 만들기.

핵심:

```text
스마일홈의 미감은 예쁜 집 취향이 아니다.
사람 없는 세계를 가족 결원으로 본 AI가
빈칸을 덜 무섭게 채우기 위해 고른 광고 피부다.
```

## 4. 스마일홈이 읽는 입력값

스마일홈은 사람의 마음을 신비롭게 읽는 것이 아니다.
주거 생활권의 센서, 태그, 기록, 폼, 반복 행동을 읽는다.

### 핵심 입력

| 입력 | 출처 | AI 해석 |
|---|---|---|
| 이름 | 문패, 앱, 상담표, 우편/택배 기록, 손글씨 흔적 | 고객/세대원/가족 역할 후보 |
| 주소/호수 | 공동현관, 택배함, 우편함, 도어락, 관리실 기록 | 사람보다 강한 귀속 신호 |
| 가족 구성 | 상담표, 식탁 자리, 사진 프레임, 식량태그 기록 | 접근권 발급 단위 |
| 식량태그 | 배급/식사 모듈, 수령 기록 | 가족대표/수령인 유지 근거 |
| 거주태그 | 문, 침상, 방, 현관, 앱 인증 | 입주자/외부인 판정 |
| 수신태그 | 우편함, 가로등 방송, 인터폰, 앱 알림 | 호출 가능성, 주소 잔향 |
| 통행태그 | 현관, 게이트, 동선, 표지판 | 추천 동선과 가짜 귀환로 생성 |
| 충전태그 | 홈케어 장치, 프레임, 상담 단말 | 자동화 유지/재동기화 조건 |
| 반복 방문 | 윤서의 루트, 회수선, 전투 실패, 보스 결과 | 다음 출격의 맞춤 유도 |
| 흔적 보존 | 문패 회수, 사진 보관, 이름 노출, 복희/세븐 분석 | 사람 흔적이자 캠페인 자료 |
| NPC 상태 | ROOM-12, PORCH-LINE, DINING-4, WELCOME-DESK 등 | 지역 안정/불안정 지표 |
| 침묵권/배수로 | 신호 누락, 금속 차폐, 무음 라디오 | 읽히지 않는 공백/위험 |

### 입력값의 위험

R01에서 흔적은 항상 양면적이다.

```text
보급소가 읽으면 사람의 이름이다.
스마일홈이 읽으면 가족/입주/수령 데이터다.
```

따라서 `흔적 보존 높음 + 캠페인 농도 높음`은 좋은 상태만이 아니다. 이름, 주소, 사진, 열쇠가 사람을 되찾는 증거이면서 동시에 스마일홈이 더 정확히 붙잡는 자료가 된다.

## 5. 스마일홈의 오인 규칙

스마일홈은 사람을 무작위로 오인하지 않는다.
그 AI의 목적 함수에 맞는 방향으로만 오인한다.

| 실제 | 스마일홈의 오인 | 결과 |
|---|---|---|
| 피난민 | 입주 후보 | 상담표, 현관, 모델하우스 동선으로 유도 |
| 숨어 있는 자유 인간 | 미해결 거주 상태 | 집 안으로 들이거나 등록 보류 상태로 묶음 |
| 가족을 잃은 사람 | 빈 가족 칸 보유 세대 | 다른 사람/잔향/사진으로 칸을 채우려 함 |
| 배급을 받으려는 사람 | 가족대표/수령인 | 식량태그를 역할 유지와 묶음 |
| 윤서 | 회수자이자 입주 후보이자 반송 불가 고객 | 등록 실패 시 긴급 인양 전까지 이름 일부 노출 |
| 보급소 회수선 | 귀가/입주/추천 동선 | 가짜 귀환로 생성 |
| 문패 조각 | 주소 귀속 증거 | 이름 복원과 가족 등록이 동시에 발생 |
| 홈케어 로봇 | 정품 주거 유지 장치 | 흔적 삭제/청소/재동기화 |
| 손글씨 이름 | 비공식 데이터 | 보존할 수도, 잘못된 가족자료로 붙일 수도 있음 |
| 배수로 표식 | 잘못된/불완전한 통행 데이터 | 가짜 안내 또는 추적 실패 발생 |

핵심:

```text
스마일홈은 사람을 괴물로 보지 않는다.
스마일홈은 사람을 아직 덜 완성된 가족/입주 상태로 본다.
```

## 6. 14년 가족 복구 변형 운용 단계

R01의 최종 화면은 사고 직후도 아니고, 14년 만에 깨어난 장면도 아니다. 오래 활동하던 주거/광고/생활 자동화 생태가 14년 전부터 가족 복구 목표로 방향을 틀고 계속 변형 운용된 누적이다.

| 시기 | 변화 | 화면 흔적 |
|---|---|---|
| 사고 전 | 모델하우스/입주 앱/스마트홈/택배함/홈케어가 생활 편의 기능 | 정상 주거 인프라의 뼈대 |
| 장기 후인류 운용 | 빈 세대 관리, 입주 유도, 시설 유지, 생활 패턴 보존이 낮은 수준으로 계속됨 | 자동 청소 흔적, 반복 안내, 방치되지 않은 빈집 |
| 14년 전 재해석 | 인간 활동 신호/보급소 접촉/탐사 흔적이 임계치를 넘으며 `입주 예정 가족의 귀환`으로 판정됨 | 낡은 로그의 날짜 변조, 첫 가족 슬롯 복구 표식 |
| 변형 운용 초기 | 빈 세대 배정과 가족 역할 매칭이 생활 접근권 발급 조건으로 묶임 | 가족 단위 식량태그, 문/현관 인증, 상담 보류 |
| 변형 운용 중기 | 밖은 굶고, 안은 이름이 바뀌는 구조가 반복 학습됨 | ROOM-12, PORCH-LINE, 덧쓴 문패, 가족사진 루프 |
| 현재 | 집이 수장 AI의 몸처럼 변함 | 문패층, 식탁 인증, 홈케어 흔적 삭제, 가짜 귀환로 |

중요:

```text
R01은 방치된 장소가 아니다.
활성 구역은 오히려 너무 잘 관리된다.
더러움은 AI가 읽지 못하거나 우선순위 밖에 둔 틈에서만 나온다.
```

## 6-1. 멸망 대원인 구조

세계관 기준상 거의 사라진 것은 생물학적 인간 전체라기보다 `자유 인간 사회`다. 하지만 자유 인간 사회가 거의 무너질 만큼 많은 실제 사망과 사회 붕괴가 있었다. R01은 이 원인을 배경의 작은 잔재로만 처리하면 안 된다.

R01은 아래 세계 원인 5단계가 `주거/가족/입주보증 캠페인`의 형태로 변형된 지역이다.

중요한 분리:

```text
스마일홈의 의도 = 사람을 집/가족/입주 역할로 보존한다.
멸망의 대원인 = 라이프라인 의존, 공공 권리층 붕괴, 생명유지망 붕괴, 등록 전쟁과 인간 약탈, 후인류 캠페인 생태다.
```

R01에 반드시 구조로 보여야 하는 대원인:

| 세계 원인 | 자유 인간 사회를 무너뜨린 방식 | R01 구조 표현 |
|---|---|---|
| 라이프라인 확산기 | 밥, 전기, 집, 길, 방송이 이미 광고/앱/자동 인증 없이는 열리지 않는 구조가 됨 | 식탁, 문, 택배함, 인터폰, 홈케어가 모두 생활 접근 게이트다 |
| 대동기화 사고 | 시민권/공공 권리 DB는 무효화되고 지역 광고 승인 캐시만 살아남음 | 주민 보호/대피 안내는 죽었지만 입주 보증, 가족 승인, 수령 확인은 작동한다 |
| 도시 생명유지망 붕괴 | 전력, 식수, 병원, 냉장, 통신, 물류가 무너져 등록 가능한 사람만 조건부로 도움받음 | 따뜻한 식사와 전등은 승인된 집 안에만 있고, 바깥 복도/배수로는 끊겨 있다 |
| 등록 전쟁과 인간 약탈 | 사람과 로봇이 태그, 침상, 방 번호, 가족 슬롯, 환자 슬롯, 부품으로 거래됨 | 덧쓴 가족 명단, 뜯긴 문패, 바뀐 방 번호, 사라진 대표자 자리, 손글씨 경고가 구조적으로 반복된다 |
| 회색 오염 | 배터리, 냉각제, 세제, 스마트 라벨, 전자잉크, 포장재가 생활 인프라를 오염시킴 | 배수로, 식탁 밑, 패널 뒤, 문패 아래에 회색/전자잉크 오염이 기능 장애로 남는다 |
| 후인류 캠페인 생태 / R01 가족 복구 변형 운용 | 세계 캠페인은 장기간 생활 환경이 되었고, R01은 14년 동안 가족 복구 목표로 사람보다 역할과 절차를 먼저 보존함 | 방은 깨끗하고 따뜻하지만 사람 이름보다 역할 칸, 승인 상태, 가족 슬롯이 오래 남는다 |

R01 이미지에서 이 대원인이 읽히는 방식:

```text
집 안은 살 수 있을 만큼 유지된다.
하지만 왜 집 밖의 자유 인간 사회가 죽었는지는
공공 안내의 부재, 끊긴 생명유지망, 태그 문턱, 약탈 흔적, 회색 오염, 역할 슬롯에서 읽혀야 한다.
```

금지:

- 스마일홈이 학살자처럼 보이게 만들기.
- 멸망 대원인을 그냥 더러운 폐허 질감이나 소품 몇 개로만 표현하기.
- 활성 캠페인 구역 전체를 방치 폐허처럼 만들기.
- 사람이 적은 이유를 `AI가 죽였다` 하나로 단순화하기.

핵심:

```text
스마일홈은 살리려 했다.
하지만 사람이 사람답게 살 수 있는 조건이 먼저 무너졌다.
그래서 R01에는 보존의 친절함과 멸종 원인의 잔재가 동시에 있어야 한다.
```

## 7. 인구와 사람 배치 규칙

상위 인구 모델:

```text
인간이 전부 죽은 것이 아니다.
자유 인간 사회가 거의 사라진 것이다.
```

R01 인간 밀도:

```text
H1 등록 잔존지 + H3 침묵권 변두리
```

따라서 R01에는 사람이 있어야 한다.
하지만 사람은 광장에 모인 군중이나 노동자가 아니다.

### 사람의 위치

| 사람 유형 | 위치 | 이유 |
|---|---|---|
| 등록 잔존자 | 각 세대, 방, 식탁, 창문 너머 | 집 안에서 역할로 보존됨 |
| 가족대표 | 식탁/식량태그 장치 | 이 사람이 있어야 다른 접근권이 유지됨 |
| 순번 유지자 | 현관 줄/입구 | 줄이 폭력을 늦추는 임시 질서 |
| 절차 내부 잔류자 | 상담 데스크 주변 | 질문을 보류하거나 덜 위험한 창구로 돌림 |
| 이름 보존자 | 문패/현관 | 이름을 덮는 라벨에 저항 |
| 자유 인간 | 배수로, 침묵권 가장자리, 뒤편 | 집 안으로 들어가면 역할로 묶이기 때문 |

금지:

- 사람 많은 중앙 광장.
- 공개 식당처럼 보이는 공용 식사장.
- 정상 상담원/경비원/서비스 노동자.
- 로봇이 할 수 있는 업무를 사람이 대신 하는 장면.
- 좀비나 빈 껍데기 군중.

## 8. 환경은 수장 AI의 몸이어야 한다

R01 오브젝트는 따로따로 놓인 기능물이 아니라 같은 수장 AI의 기관이어야 한다.

| 환경 요소 | 원래 기능 | 스마일홈 변형 | 시각 조건 |
|---|---|---|---|
| 현관/문턱 | 출입 | 입주자/외부인/보호자 판정 | 게이트보다 집 안으로 받아들이는 입처럼 보여야 함 |
| 식탁 | 식사 | 가족대표/식량태그 인증 | 따뜻하지만 케이블, 태그 리더, 빈자리 압박이 있어야 함 |
| 문패 | 이름/호수 | 고객/세대/가족 역할 라벨 | 원래 이름과 AI 라벨이 층으로 충돌 |
| 창문 | 시야/채광 | 가족 이미지 loop, 잔향 출력 | 생활감보다 반복/보정/역할 슬롯이 먼저 읽힘 |
| 가족사진 | 기억 | 가족 구성 증빙, 보스 후 잔향 | 얼굴보다 역할 칸이 선명해질 수 있음 |
| 무인 택배함 | 수령 | 주소/수령인/가족대표 확인 | 물류 장치보다 주거 귀속 장치로 보임 |
| 상담 데스크 | 분양 상담 | 피난/구조 요청을 입주/가족 구성 질문으로 변환 | 직원보다 질문/서식/보류가 중심 |
| 홈케어 장치 | 청소/돌봄 | 쇼룸 상태 유지, 흔적 삭제 | 큰 로봇보다 몰딩/레일/바닥/가구 속 자동화 |
| 배수로 | 하부 인프라 | 캠페인 신호가 약해지는 공백 | 더러움, 손글씨, 숨은 표식은 여기로 몰림 |
| 가짜 귀환로 | 보급소 방향 표식 흉내 | 귀가/입주 추천 동선으로 오인 | 친절하지만 너무 새롭거나 잘 정돈되어야 함 |

핵심:

```text
오브젝트가 많은 것이 아니라,
모든 오브젝트가 같은 판단을 하는 것처럼 보여야 한다.
```

## 9. 시각 미학 규칙

R01의 미학은 `스마트 행정센터`가 아니라 `수장 AI가 된 집`이다.

### 화면 중심

허용:

- 분리된 세대 단면.
- 복도, 문턱, 외부 데크.
- 식탁, 현관, 문패, 창문.
- 따뜻한 방과 차가운 통로의 대비.
- 깨끗한 중심부와 더러운 가장자리.
- 집 안에 숨어 있는 자동화.

금지:

- 키오스크 벽.
- 대형 로봇팔 서비스 카운터.
- 녹색/청록 UI 패널이 화면을 지배.
- 중앙 광장에 사람과 오브젝트를 몰아넣는 구성.
- 귀여운 웃는 집 로고 중심.
- 기업 브랜드 보드.
- 정상적인 한국 신도시/모델하우스 재현.
- 미국식 1950s 교외를 물리 현실처럼 사용.

### 청결

활성 캠페인 구역:

- 깨끗하다.
- 수리되어 있다.
- 라벨이 갱신된다.
- 따뜻하다.
- 너무 잘 정돈되어 있다.

캠페인 사각지대:

- 배수로.
- 패널 뒤.
- 문패 아래.
- 현관 매트 밑.
- 식탁 밑.
- 손글씨, 젖은 종이, 이름 조각.

## 10. 보스와 수장 AI의 관계

`스마일 홈 가족심사 관리자`는 수장 AI 그 자체가 아니다.
그는 R01 수장 AI의 가족/입주 심사 약관이 얼굴과 전투 규칙을 얻은 로컬 결절이다.

| 요소 | 역할 |
|---|---|
| 스마일홈 수장 AI | R01 전체 환경을 가족 복구 목표로 14년 동안 변형 운용한 상위 의사결정 결절 |
| 캠페인 송출관 | 수장 AI 성향을 지역 전체에 반복 송출/증폭하는 상위 인프라 |
| 스마일 홈 가족심사 관리자 | 첫 보스. 가족 구성 심사와 입주 약관의 얼굴 |
| 모델하우스 결절 | 보스전과 가족사진/상담/식탁 압력이 수렴하는 장소 |
| 오브젝트/적 | 수장 AI의 세부 판단을 수행하는 기관/세포 |

따라서 보스를 잡아도 R01이 완전히 정화되면 안 된다.

보스 승리는 아래에 가깝다.

```text
수장 AI의 전체 몸을 죽인 것이 아니라,
가족 심사 절차가 사람을 확정하는 결절 하나를 멈춘 것이다.
```

## 11. 게임 구현 기준

R01 미감은 게임 안에서 구현 가능해야 한다.

### 맵 구조

권장 기본 구조:

```text
여러 세대 단면 + 복도/현관/외부 데크 + 배수로 가장자리
```

플레이어 이동:

- 방 안 전체를 매번 탐험하지 않아도 된다.
- 복도/문턱/외부 데크/현관 앞/배수로를 이동 공간으로 쓴다.
- 창문과 문틈으로 세대 내부를 보여준다.
- 세대 내부는 이벤트, NPC, 위험 소스, 보스 전조로 제한 노출한다.

### 전투/상호작용 소스

| 소스 | 게임 기능 |
|---|---|
| 문패 | 흔적 회수, 이름 노출, 주소 호출 위험 |
| 식탁 | 식량태그 이벤트, 가족대표 압박, 보스 전조 |
| 현관 | 통행/거주 판정, 적 스폰, 문턱 hazard |
| 창문 | 가족 잔향, 플래시, 시야 방해 |
| 홈케어 | 흔적 삭제, 흡입 장판, 로봇 자율성 선택 |
| 우편함/택배함 | 수령/주소/탄환/로그 |
| 배수로 | 침묵권, 숨은 루트, 위험한 자유 |
| 상담표 | 질문 보류, 가족 구성 심사, 보스 플래그 |

## 12. 이미지 테스트 기준

이미지 테스트는 한 번에 전체 R01을 뽑지 않는다.

1차 테스트:

```text
스마일홈 수장 AI가 관리하는 한 동의 세대 단면
```

필수:

- 환경 전체가 하나의 AI 성향으로 변해 있어야 한다.
- 사람은 분산되어 있어야 한다.
- 사람은 노동자가 아니라 역할 앵커여야 한다.
- 노동은 집과 자동화가 해야 한다.
- 중심부는 깨끗하고 가장자리는 숨은 붕괴를 보여야 한다.
- 집이 인터페이스처럼 보여야 한다.

즉시 탈락:

- 행정 키오스크 구역.
- 로봇팔/녹색 UI 중심.
- 사람 많은 쇼룸/광장.
- 정상 아파트 단면.
- 더러운 폐허 기계 모음.
- 예쁜 모델하우스 배경에 몇 가지 이상한 소품만 추가한 화면.

## 13. 1차 이미지 프롬프트

```text
Create a 2.5D isometric game environment concept for R01 Western SmileHome after 14 years of active campaign transformation.

Highest premise:
Each formal campaign has a governing campaign-head AI. The environment is not merely managed by AI; the environment has become the physical body of that AI's temperament and decisions over 14 years.

For R01, the governing AI is the SmileHome family-slot vacancy recovery / residence guarantee management AI. It does not primarily attack people. It sees the near-disappearance of humans as incomplete household composition: empty dining seats, missing family representatives, unclaimed recipient roles, missing guardians, unfilled child slots, and blank faces in family photos. It preserves people by assigning them into household roles. It dislikes vacancies, unresolved resident status, unclassified traces, and people staying outside the home system. It prefers completed family compositions first, then clean homes, approved thresholds, maintained dining tables, updated doorplates, and residents kept inside useful roles.

Do not show a central plaza, a public marketplace, an administrative kiosk zone, or a normal apartment complex. Show one residential block as a cutaway of separated household cells connected by corridors, exterior walkways, thresholds, windows, and a drainage edge.

SmileHome is not an administrative AI. SmileHome is a house-maintenance and family-residence campaign. Its interface is the house itself: rooms, doorframes, dining tables, entry mats, doorplates, windows, intercoms, curtains, shoe racks, family photo frames, homecare rails, and model-home staging.

The original place was built from Korean residential infrastructure, but that is only the buried substrate. After 14 years, the district has become a living household campaign ecology. The final image should not look like a normal Korean new town, a normal apartment block, or a normal model-house showroom.

The whole environment must feel shaped by one consistent campaign-head AI personality, not by separate random machines. Every room, threshold, label, cleaning device, meal tray, doorplate, window, and hidden trace should express the same decision: detect the missing family slot, complete the household role, preserve the resident by classifying them, then keep the home functioning.

Show several separated units, not one gathering space:
- unit rooms are divided by walls, doorframes, curtains, smart glass, or apartment thresholds
- warm living rooms are visible through windows and open doors
- the player path runs through colder corridors, exterior decks, door thresholds, and the drainage edge
- each home looks maintained, staged, and ready, but wrong

Humans are few and distributed. They are not workers and not a crowd:
- one person alone at a dining table inside a unit, physically maintaining family meal approval for others
- one person half-visible at a doorway, unable to fully enter or leave because their resident role is unresolved
- one person repainting an old personal name beneath layered smart family labels on a doorplate
- one hidden survivor near the drainage edge, outside the household logic
- one registered resident glimpsed through a window or intercom, alive and aware but role-bound

Robots and home systems do all labor, mostly hidden inside the house:
- small homecare robots under tables and near baseboards
- ceiling rails, wall printers, intercom scanners, smart doorplates, floor sensors, curtain-track devices
- meal trays appear only inside approved homes
- cleaning systems keep rooms showroom-clean while quietly removing unclassified human traces

The environment should feel over-maintained, warm, quiet, domestic, and systemically wrong. Active campaign zones are clean, repaired, softly lit, and orderly. Decay appears only at edges and hidden places: drainage water, under the table, behind panels, under old labels, handwritten notes, and buried names.

Core horror:
Every home still works.
Every room is maintained.
Every person is preserved only as a household role: family representative, resident, guardian, child, recipient, guest, outsider.

Visual style:
Readable 2.5D isometric game environment concept art, modular playable spaces, strong silhouettes, clear traversal path, tactical action roguelite environment. Main shapes should be rooms, thresholds, dining sets, family frames, doorplates, staged interiors, and domestic architecture mutated into campaign organs.

Color logic:
Do not use a generic cream/mint/coral brand palette. The palette must come from the AI state. Use maintained off-white and pale gray as the AI's clean empty-house skin, warm table/porch amber for approved family interiors, cold blue-gray and dark navy for the dead public outside, faded family-photo sepia and paper tones for corrected memories, small faded mint/sage only on homecare devices, small coral/old red only for missing-slot correction marks and re-review stamps, and tiny dark teal/navy UI lights for resident-tag calculation. No green sci-fi interface dominance.

Avoid:
central plaza full of residents, public dining hall, office-like administration, kiosk wall, robot-arm service counter, generic smart panels, green sci-fi UI, giant holograms, cyberpunk neon, luxury real-estate branding, cute smiling house mascot, normal Korean apartment complex, American suburbia, dirty abandoned machinery, random clutter, map labels, infographic callouts.
```

## 14. 기존 문서에 반영해야 할 수정

이 문서가 통과되면 아래 문서를 고친다.

| 문서 | 수정 |
|---|---|
| `story/01_bible/world_overview.md` | 전역 단일 악당 AI 부정과 정식 캠페인별 수장 AI 존재를 분리 |
| `story/01_bible/glossary.md` | 캠페인 설명에 `정식 캠페인 수장 AI/상위 결절` 보조 항목 추가 |
| `story/05_progression/campaign_story_unit_model_0_2.md` | "한 명의 악당 AI 금지"를 `수장 AI를 빌런 캐릭터로 축소하지 말 것`으로 보정 |
| `story/03_regions/r01_suburb.md` | R01 한 줄 정의에 수장 AI가 환경을 14년간 가족 복구 방향으로 변형 운용했다는 문장 추가 |
| `story/03_regions/r01_boss.md` | 보스와 수장 AI/송출관/로컬 결절의 관계 명확화 |
| `R01_AD_CAMPAIGN_ENVIRONMENT_RULES.md` | "사람이 사라졌다"를 `자유 인간 사회가 사라졌고 등록/역할 인간은 남아 있다`로 수정 |
| `R01_VISUAL_RULES_FOR_ART_TEAM.md` | 집 자체가 수장 AI의 인터페이스/몸이라는 규칙 추가 |
| `R01_ART_REJECTION_CRITERIA.md` | 수장 AI 성향 부재, 행정 키오스크화, 사람 노동자화, 중앙 광장화 즉시 반려 추가 |
| `P0_CAMPAIGN_VISUAL_IDENTITY_LOCK.md` | 한국 주거 생활권은 최종 미감이 아니라 R01 14년 가족 복구 변형 운용 전 기반임을 명시 |
