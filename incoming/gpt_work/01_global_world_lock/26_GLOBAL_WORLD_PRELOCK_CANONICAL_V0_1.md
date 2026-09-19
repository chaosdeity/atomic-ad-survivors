# 26 GLOBAL WORLD PRELOCK CANONICAL V0.1

상태: **CANONICAL PRELOCK / FINAL GLOBAL WORLD LOCK 아님**

Source of Truth:
- PRELOCK recovery: `81f7583ee0457c72d89fb37de5fdbb6d6f6eab79`
- latest 109-audit: `20c850c775d57543f8a83c6aed1a503d15b3efce`
- reconciliation: 21~25
- schema/registry: 07~08 updated canonical PRELOCK basis

## Gate Result

| # | Gate | 판정 | 근거 |
|---:|---|---|---|
| 1 | 96 ID 고정 | **PASS** | E01~E12 × C01~C08 immutable. |
| 2 | Registry 96/96 | **PASS** | rows 96 / unique 96 / missing 0 / unexpected 0. |
| 3 | Display Name policy | **PASS** | ID와 분리, production entry 전 제한 변경, alias/history 필수. |
| 4 | Visibility 5단계 | **PASS** | 미관측→원격 감지→부분 복원→출격 가능→진실 복원. |
| 5 | E01 compression | **PASS** | E01 40 local은 global node가 아님. GLOBAL→SECTOR→CAMPAIGN→LOCAL. |
| 6 | 기존 differentiation 6필드 | **PASS** | top-level 6필드 유지. |
| 7 | service / 등록대가 / 거부비용 흡수 | **PASS** | gameplay_law + human_recognition_rule + resource_ecology 내부 sub-structure. |
| 8 | C03/C04 boundary | **PASS** | custody/flow vs validity/repair. |
| 9 | C07/C08 boundary | **PASS** | passage/transfer vs survival allocation/capacity. |
| 10 | C01/C06 boundary | **PASS** | household/occupancy vs membership/payment entitlement. |
| 11 | C05 반복위험 | **PARTIAL (NON-BLOCKING)** | family anti-repeat contract는 잠김. 12개 개별 law는 production fill. |
| 12 | service dependency contract | **PASS** | provider/consumer/resource/service/strength/failure/recovery/channel 계약 정의. |
| 13 | persistence scope contract | **PASS** | NONE/LIGHT/STANDARD/STRUCTURAL semantic class 정의. |
| 14 | Direct / Rumor boundary | **PASS** | Direct와 정보 객체 분리. |
| 15 | Rumor causal propagation | **PASS** | 실제 resident/communications/logistics/broadcast/admin/support/recovery channel 필요. |
| 16 | Rumor physical mutation = 0 | **PASS** | rumor-only facility/route/resource/NPC physical mutation 금지. |
| 17 | Relay / Beacon / Recovery | **PASS** | Sector=Relay, Local sortie=Beacon, Extraction=Recovery Line+Beacon. |
| 18 | E02~E12 신규 local = 0 | **PASS** | 이번 canonical 작업에서 local node 생성 없음. |
| 19 | latest 109-audit와 충돌 없음 | **PASS** | audit concern은 기존 6-field 내부 보강으로 흡수. 구조적 conflict 없음. |
| 20 | main 변경 = 0 | **PASS, final read-back에서 재확인 대상** | 모든 write target은 chatgpt-work. main ref update/merge/push 수행 없음. |

## Latest Audit Reconciliation

최신 감사의 신규 질문은 새 top-level schema를 요구하지 않는다.

- service → gameplay_law + resource_ecology
- 등록 대가 → gameplay_law + human_recognition_rule
- 거부 비용 → gameplay_law + resource_ecology
- 의존성 → resource_ecology.dependency_contract + persistence_profile
- 영구 세계변화 → persistence_profile.class + physical_state

RECOVER 4개 중:
- World System: campaign-logic / map-evolution-proof / mystery-proof
- Tech Pipeline: motion-proof

실제 RECOVER는 이번 작업에서 실행하지 않았다.

## Persistence Scope

class 의미:
- NONE: 장기 gameplay state 거의 없음
- LIGHT: 태도/서비스/간단 지역 상태
- STANDARD: NPC/서비스/경로/중요 선택의 재방문 변화
- STRUCTURAL: 시설/주민 이동/service capacity/route의 지속적 물리 구조 변화

모든 campaign에 class가 필요하지만 이번 PRELOCK에서 96개 전부의 값을 결정하지 않는다.

현재 후보:
- E01_C01: STANDARD
- E09_C01: STANDARD
- E03_C03 / E08_C03 / E11_C03 / E12_C03: STANDARD

STRUCTURAL은 실제 production evidence가 있을 때만 올린다.

## Registry Status

신규 status 열:
- family_boundary_status
- service_dependency_status
- persistence_definition_status

값은 DEFINED / PARTIAL / TBD만 사용한다.

이 열은 세부설계를 새로 만든 것이 아니라, 현재 canonical 계약 대비 준비 상태를 표시한다.

## PASS / PARTIAL / HOLD

- PASS: **19 gates**
- PARTIAL: **1 gate** (C05 campaign-specific production fill)
- HOLD: **0**
- READY: **YES**

C05 PARTIAL은 상위 schema/family boundary가 부족해서 생긴 문제가 아니다. 12개 campaign 제작 단계에서 개별 source/authority/recognition/transformation/resource/persistence를 채우면 된다.

“모든 96 campaign 세부값 미완성”만으로 NOT READY 판정하지 않는다.

## Canonical PRELOCK

**READY**

의미:
- 상위 schema가 충분히 잠겼다.
- family boundary가 production을 시작할 수 있을 만큼 명확하다.
- service dependency와 persistence scope가 top-level field 추가 없이 정의되었다.
- 개별 campaign 세부값은 production entry gate에서 채울 수 있다.

이 문서는 **FINAL GLOBAL WORLD LOCK이 아니다.**
Final Lock 파일은 생성하지 않는다.
