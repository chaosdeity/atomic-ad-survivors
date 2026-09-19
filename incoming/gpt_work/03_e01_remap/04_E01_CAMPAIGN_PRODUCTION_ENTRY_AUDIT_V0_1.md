# 04 E01 Campaign Production Entry Audit V0.1

상태: Final Lock 6-field alignment audit
대상: E01_C01~E01_C08
원칙: 근거 없는 Production Entry 값을 새로 창작하지 않는다.

Final Lock 6 fields:
1. regional_secondary_collapse
2. infrastructure_anchor
3. gameplay_law
4. human_recognition_rule
5. resource_ecology
6. persistence_profile

판정:
- DEFINED: 현재 권위 자료로 Production Entry 수준의 방향을 고정할 수 있음.
- PARTIAL: family/local/runtime 근거는 있으나 Campaign 전체 Production Entry로 잠글 정보가 부족함.
- TBD: 현재 근거로 값을 정하면 창작 또는 legacy 승격이 됨.

## 0. Campaign 총괄 판정

| Campaign | family focus | campaign verdict |
|---|---|---|
| E01_C01 | 가족 / 세대 / 입주 | PARTIAL |
| E01_C02 | 의료 / 환자 / 진료 | PARTIAL |
| E01_C03 | 반품 / custody / 회수 | PARTIAL |
| E01_C04 | 정품 / 수리 / 충전 | PARTIAL |
| E01_C05 | 방송 / source / authority | PARTIAL |
| E01_C06 | 멤버십 / 결제 / entitlement | PARTIAL |
| E01_C07 | 통행 / 검역 / transfer | PARTIAL |
| E01_C08 | 비상보급 / shelter / survival capacity | PARTIAL |

요약: DEFINED 0 Campaign / PARTIAL 8 / TBD 0.
이는 “아무것도 결정되지 않았다”는 뜻이 아니다. 8개 모두 family와 Local inventory는 존재하지만, 6필드 전체를 Production Entry로 잠글 수준은 아직 아니다.

## 1. E01_C01 가족 / 세대 / 입주

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | R01 주거 생활 자동화가 장기간 유지·갱신된 환경이며 가족/입주 기록이 핵심 | Campaign 전체에서 어떤 2차 붕괴가 지역 구조를 바꾸는지 미정 |
| infrastructure_anchor | DEFINED | 주거 단지, 자동 도움/수령 로그, 세대 인증 기록, 분양 주택 기록 구역 | Local별 최종 Unreal anchor/geometry는 미정 |
| gameplay_law | DEFINED for current slice | quest accept → free exploration → finite local combat → voluntary return → report/growth → revisit | C01 전체 5 Local의 법칙으로 확장할 규칙은 미정 |
| human_recognition_rule | DEFINED | Final Lock household/occupancy/family-role + current MAIL-LOOP/records | Local별 예외/오판/우회 규칙 미정 |
| resource_ecology | PARTIAL | help kit, records, finite sources, report growth 등 current slice의 자원/서비스 상호작용 | Campaign-level scarcity, regeneration, trade, service dependency 미정 |
| persistence_profile | PARTIAL | RPG34/35에서 조사/선택/미완료 귀환/재방문 저장 근거 존재 | Final Lock persistence class NONE/LIGHT/STANDARD/STRUCTURAL 미선택 |

Campaign verdict: PARTIAL.

## 2. E01_C02 의료 / 환자 / 진료

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | 기존 병원 Local과 proof에서 시설 가용성→치료 접근 인과 후보 | E01 의료권의 실제 secondary collapse 정사 미잠금 |
| infrastructure_anchor | PARTIAL | 응급 접수, 장기 입원, 약국/보험, 격리, 퇴원 심사라는 기존 Local 묶음 | 최신 Unreal 공간/동선 없음 |
| gameplay_law | TBD | Final Lock은 family를 잠그지만 C02의 campaign-specific law는 Production Fill 대상 | legacy 사건을 그대로 승격 금지 |
| human_recognition_rule | PARTIAL | medical entitlement / patient identity / care eligibility family | E01_C02의 구체 필드와 오판 규칙 미정 |
| resource_ecology | PARTIAL | 치료·약품·병상/서비스 capacity 후보를 proof로 검토 가능 | 수치/소비/재생산/공급선 미정 |
| persistence_profile | TBD | 치료/시설 상태를 지속시키는 것이 유의미할 수 있으나 class 미정 | direct memory vs rumor 포함 설계 필요 |

Campaign verdict: PARTIAL.

## 3. E01_C03 반품 / custody / 회수

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | 반품/물류/폐기 Local이 custody chain 붕괴를 시사 | 실제 E01 logistics secondary collapse 미잠금 |
| infrastructure_anchor | PARTIAL | 반품 접수, 자동 분류, 보증 창고, 폐기 대기, 최종 심사 | 최신 Unreal 구현 없음 |
| gameplay_law | TBD | Final Lock family는 logistics/custody/flow/return/recovery | Local gameplay loop와 실패/우회법 미정 |
| human_recognition_rule | PARTIAL | 수취인/회수 대상/custody role 계열 근거 | E01-specific recognition fields 미정 |
| resource_ecology | PARTIAL | 회수품, custody 대상, 부품/보증 자산 후보 | 실제 resource circulation/손실/복구 미정 |
| persistence_profile | TBD | custody 상태/회수 결과는 지속 후보 | class와 저장 단위 미정 |

Campaign verdict: PARTIAL.

## 4. E01_C04 정품 / 수리 / 충전

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | 충전소/배터리/repair/firmware/폐기 구조 | E01 산업 secondary collapse 미잠금 |
| infrastructure_anchor | PARTIAL | 폐충전소, 배터리 공장, firmware실, press, resync core | 최신 Unreal 구현 없음 |
| gameplay_law | TBD | validity/charging/diagnose/repair/operability family | gameplay law 미정 |
| human_recognition_rule | PARTIAL | 정품/유효/수리 가능/충전 대상 판정 family | 인간·기계 각각의 필드 미정 |
| resource_ecology | PARTIAL | charge, repair parts, energy/operability를 ecology 후보로 검토 가능 | 수치와 공급/소모 구조 미정 |
| persistence_profile | TBD | repair/operability state의 지속 가치 높음 | persistence class 미정 |

Campaign verdict: PARTIAL.

## 5. E01_C05 방송 / source / authority

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | 방송/데이터/추천/공개홀/송출 Local inventory | source failure가 지역에 만드는 2차 붕괴 미정 |
| infrastructure_anchor | PARTIAL | 수신탑, studio, server, public hall, broadcast room | 최신 Unreal 구현 없음 |
| gameplay_law | TBD | Final Lock에서 C05는 campaign-specific gameplay law Production Fill 필요가 명시적 | repetition을 피하는 실제 law를 새로 설계해야 함 |
| human_recognition_rule | PARTIAL | source / authority / audience / receiver family | E01-specific fields 미정 |
| resource_ecology | TBD | 신호/출처/검증된 기록을 자원처럼 다룰 여지는 있으나 확정 근거 부족 | currency화 금지, causal ecology 설계 필요 |
| persistence_profile | TBD | source/authority 변화와 rumor가 지속될 가치 있음 | class, direct memory, rumor channel 미정 |

Campaign verdict: PARTIAL.

## 6. E01_C06 멤버십 / 결제 / entitlement

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | 회원 gate, 거래 골목, review, VIP, 행사장 inventory | E01 commercial secondary collapse 미잠금 |
| infrastructure_anchor | PARTIAL | membership gate / market / review kiosk / VIP / payment event | 최신 Unreal 구현 없음 |
| gameplay_law | TBD | membership/payment/account/loyalty/entitlement family | 실제 player interaction law 미정 |
| human_recognition_rule | PARTIAL | member/account/tier/review/entitlement family | E01-specific recognition fields 미정 |
| resource_ecology | PARTIAL | access entitlement / benefit / account state 후보 | 현금·단일 currency처럼 단순화하면 안 됨. ecology 미정 |
| persistence_profile | TBD | account/tier/reputation state는 persistence 후보 | class와 복구/오류 경로 미정 |

Campaign verdict: PARTIAL.

## 7. E01_C07 통행 / 검역 / transfer

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | 검역, 냉동 transfer, baggage, 비공식 passage, 출항 관리 inventory | E01 passage network secondary collapse 미잠금 |
| infrastructure_anchor | PARTIAL | quarantine gate / cold yard / baggage / breakwater / control tower | 최신 Unreal 구현 없음 |
| gameplay_law | TBD | passage/quarantine/transfer family | inspection, reroute, transfer law 미정 |
| human_recognition_rule | PARTIAL | passenger / quarantine subject / transfer subject family | E01-specific fields 미정 |
| resource_ecology | PARTIAL | passage capacity, transfer slots, supplies/permits 후보 | 실제 resource flow 미정 |
| persistence_profile | TBD | route closure/inspection history/rumor 가치 있음 | class와 rumor propagation 미정 |

Campaign verdict: PARTIAL.

## 8. E01_C08 비상보급 / shelter / survival capacity

중요: R08 침묵권은 생존자들이 운영하는 예외 공간이며 “현재 광고 캠페인 그 자체”로 취급하지 않는다. E01_C08과의 관계는 옛 비상보급·대피 인프라의 역사적 연관이다.

| field | status | 현재 근거 | Production Fill gap |
|---|---|---|---|
| regional_secondary_collapse | PARTIAL | survivor outpost가 옛 보급/전력/차폐 infrastructure를 개조 사용 | C08 본래 campaign collapse와 현재 R08 survivor ecology 경계 미정 |
| infrastructure_anchor | PARTIAL | R08-L01 current supply candidate, R08-L02 planned recovery equipment, shelter/storage locals | R08-L02 이후 Unreal 구현 및 Sector Relay/Beacon 분리 미완료 |
| gameplay_law | TBD | survival allocation / relief / shelter / evacuation capacity family | survivor hub gameplay와 historical campaign law를 분리해야 함 |
| human_recognition_rule | PARTIAL | evacuee / relief recipient / shelter capacity family | 현 생존자 운영은 campaign recognition과 동일하지 않음 |
| resource_ecology | PARTIAL | 전력, 물자, 침상, 급수, 유지비라는 현 R08 공간 근거 존재 | production 수치와 회복/소모/공급 경로 미정 |
| persistence_profile | TBD | outpost infrastructure와 공급 상태 persistence 가치 높음 | class/복구/장기 변화 미정 |

Campaign verdict: PARTIAL.

## 9. 다음 Production Fill의 최소 입력

각 Campaign을 DEFINED로 승격하려면 최소한 아래가 필요하다.

- regional_secondary_collapse: 지역 차원의 2차 붕괴 1개 이상과 인과 경로.
- infrastructure_anchor: 실제 Local/시설과 기능적 dependency.
- gameplay_law: 시간/전투/조사/선택/귀환/보고 중 무엇이 그 Campaign을 구별하는지.
- human_recognition_rule: 어떤 identity/entitlement/custody/authority 필드로 인간을 판정하는지.
- resource_ecology: 무엇이 부족해지고, 이동하고, 회복되고, 누가 접근하는지.
- persistence_profile: NONE/LIGHT/STANDARD/STRUCTURAL 중 class와 저장 범위, direct memory/rumor 관계.

이번 감사에서는 위 빈칸을 창작해 채우지 않았다.
