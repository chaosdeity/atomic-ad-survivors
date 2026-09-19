# 23 CAMPAIGN FAMILY BOUNDARY CANONICAL V0.1

상태: **CANONICAL PRELOCK FAMILY CONTRACT / ID·family 변경 없음**

판정값: `PASS | PARTIAL | SYSTEM_OVERLAP | NEEDS_RULE_SPLIT`

비교 축:
- service
- human recognition
- registration consequence
- refusal consequence
- resource ecology
- persistence
- rumor propagation

## 1. C03 물류/반품 vs C04 정품/충전/수리

핵심 질문:
- C03: **누가 무엇을 수취/반품/회수하는가?**
- C04: **무엇이 정품/충전/수리 대상으로 인정되는가?**

| 축 | C03 | C04 |
|---|---|---|
| service | custody, receive, return, recover, release | authenticate, charge, diagnose, repair, restore operability |
| human recognition | 수취인/반품자/소유 주장자/보관 책임자 | 등록 사용자/정품 소유자/승인 운영자/수리 청구자 |
| registration consequence | 물건의 custody/release/return chain에 편입 | 장치의 service entitlement/validity/repair eligibility가 열림 |
| refusal consequence | hold, return reroute, storage dispute, recovery denial | charge/repair/parts/operation denial 또는 degraded service |
| resource ecology | handling, storage, sorting, transport, release capacity | power, diagnostic slot, certified parts, repair labor, charging capacity |
| persistence | 소유·보관·반출·회수 chain과 route exception | 장치 validity, repair state, service history, operability |
| rumor | logistics/admin/resident market channel | vendor/service/admin/maintenance network |

강제 규칙:
- C03의 주 플레이 행동은 **물건의 custody/flow를 고치는 것**이다.
- C04의 주 플레이 행동은 **장치/서비스의 유효성·작동 가능성을 고치는 것**이다.
- C04를 “반품해서 수리받기”, C03을 “정품 인증 후 수령”으로 만들면 주 행동이 겹치므로 실패.

판정: **PASS**

## 2. C07 검역/통행/이송 vs C08 비상보급/대피

핵심 질문:
- C07: **누가/무엇이 경계를 통과할 자격이 있는가?**
- C08: **누가 제한된 생존 자원·수용 capacity를 받을 것인가?**

| 축 | C07 | C08 |
|---|---|---|
| service | passage, quarantine clearance, transfer | relief, ration, shelter, evacuation capacity |
| human recognition | 통행자/검역 대상/이송 대상/문서 보유자 | 피난자/배급 대상/취약 인원/수용 대상 |
| registration consequence | 특정 corridor/gate/transfer chain 통과 가능 | ration/shelter/evacuation queue 및 service allocation 편입 |
| refusal consequence | hold, reroute, quarantine, missed transfer | 배급 축소, shelter denial, capacity exhaustion, relocation pressure |
| resource ecology | inspection lane, document/scan capacity, transport slot | water, food, cooling, power, medical/relief stock, shelter capacity |
| persistence | 승인·반려·route exception·quarantine history | allocation, depletion, evacuee movement, shelter/service state |
| rumor | admin/logistics/transport record | resident movement/support/broadcast/communications |

강제 규칙:
- C07의 성공은 **통과/이송 조건 해결**이다.
- C08의 성공은 **생존 capacity의 배분/유지**다.
- C08을 “대피소 gate 통과권 얻기”로 축소하면 실패.
- C07에서 보급을 주 목표로 삼으면 실패.

판정: **PASS**

## 3. C01 가족/주거 vs C06 멤버십/결제

핵심 질문:
- C01: **세대/가족/주거 역할이 무엇인가?**
- C06: **회원/VIP/포인트/결제 역할과 거래 권한이 무엇인가?**

| 축 | C01 | C06 |
|---|---|---|
| service | occupancy, household protection, home service | membership benefit, account/payment access, loyalty entitlement |
| human recognition | 세대원/보호자/입주자/거주자 | 회원/계정 보유자/VIP/결제 주체/포인트 보유자 |
| registration consequence | household/occupancy role가 공간·보호 서비스와 묶임 | account tier/payment/benefit entitlement가 거래 서비스와 묶임 |
| refusal consequence | 입주/주거 서비스/보호 역할 거부, relocation pressure | 혜택/결제/구매/회원 서비스 제한, account downgrade/hold |
| resource ecology | dwelling slot, household service, food/homecare/community capacity | account service capacity, benefit stock, payment/settlement access, loyalty inventory |
| persistence | household role, occupancy, home service state, resident movement | membership state, entitlement history, payment/benefit exceptions |
| rumor | residents/admin/logistics | merchant/platform/admin/communications |

강제 규칙:
- C01 recognition은 **생활공간 소속**에 귀속된다.
- C06 recognition은 **거래·혜택 접근권**에 귀속된다.
- “돈을 내면 가족으로 인정” 또는 “주거 등록이 곧 VIP” 같은 단축은 family 경계를 침범하므로 금지.

판정: **PASS**

## 4. C05 방송/추천 12지역 반복 위험

C05는 송신탑/방송국 skin만 바꾸고 동일한 “수신 등록→신호 받기” gameplay를 반복하면 실패한다.

각 E##_C05는 production entry 전에 최소 다음을 구분해야 한다.

1. signal/service source
2. authority model
3. human recognition
4. transformation rule
5. refusal consequence
6. resource ecology
7. persistence + rumor

현재 근거:
- E02_C05: 재난 명령/반복 갱신
- E07_C05: 검증된 공영정보/갱신 지연
- E12_C05: 이동형 저전력/coverage 왜곡

이는 family 차별화 방향의 유효한 증거지만 12개 전부의 개별 gameplay law가 잠긴 것은 아니다.

판정: **PARTIAL**

이 PARTIAL은 상위 family boundary 부족이 아니라 **개별 campaign production fill 미완성**이다. C05의 상위 anti-repeat contract는 잠겼으므로 Canonical PRELOCK을 막지 않는다.

## Boundary Gate

production entry에서:
- C03/C04, C07/C08, C01/C06은 위 핵심 질문과 주 행동을 위반하면 `NEEDS_RULE_SPLIT`.
- C05는 동일 primary verb/동일 registration consequence/동일 resource loop가 3개 이상 지역에서 반복되면 `SYSTEM_OVERLAP`.
- 미술/국가/도시명 차이만으로 PASS 처리하지 않는다.
