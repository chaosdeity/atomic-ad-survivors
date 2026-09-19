# 13 E01_C01 Production Entry V0.1

상태: E01_C01 PRODUCTION ENTRY
Campaign verdict: **DEFINED**
구현 상태: NOT UNREAL IMPLEMENTATION
persistence_profile.class: **STANDARD**

## 0. 범위

E01_C01 가족 / 세대 / 입주 Campaign의 Final Lock 6 fields를 Production Entry 수준으로 정의한다.

중요한 구분:
- **current playable slice**: 현재 구현/검증 근거가 있는 R01-L01 first playable과 R01-L02 follow-up slice.
- **C01 campaign contract**: R01-L01~R01-L05 전체 residential campaign의 Production 방향.

current playable slice를 C01 전체 구현 완료로 확대하지 않는다.

## 1. regional_secondary_collapse

상태: **DEFINED**

### causal contract

장기간 유지·수선되는 주거 자동화와 생활 서비스는 계속 작동하지만, 가족/입주/수령/보호 역할을 나타내는 기록이 누적·잔존하고 실제 인간 관계와 어긋날 수 있다.

그 결과 시스템은 실제 관계보다 **등록된 household/occupancy/recipient/guardian 역할**을 우선해 도움, 접근, 수령, 보호 절차를 판단한다.

```text
long-lived residential automation/service
+ accumulated household/occupancy/receipt records
+ registered role precedence
→ actual relationship vs registered-role mismatch
→ misdirected / withheld / contradictory residential service or access
→ investigation, local conflict, choice, return, revisit gameplay
```

이 2차 붕괴는 “전 세계가 같은 규칙으로 오작동한다”는 신규 설정이 아니다. E01_C01 residential campaign의 인과 계약이다.

### production boundary
- 대규모 신규 세계관 사건 창작 금지.
- current MAIL-LOOP/records를 “가족 배정 승인”으로 확대 해석 금지.
- 등록 역할 불일치가 실제 service/access/gameplay consequence로 이어져야 한다.

## 2. infrastructure_anchor

상태: **DEFINED**

| Local | status | Production anchor |
|---|---|---|
| R01-L01 침묵 가장자리 | CURRENT | current first playable residential slice. 반복 수선 주거, 자동 도움/열린 자동문, 응급 키트, 수령 로그, 세대 인증 기록, 우편/호출 위협, 정상 귀환 동선의 의미를 사용 |
| R01-L02 분양 주택 루프 | CURRENT | current follow-up housing-record investigation/revisit slice. 서로 다른 주거 기록 대조, 선택 조사 흔적, 유한 local combat, 자율 귀환/보고의 의미를 사용 |
| R01-L03 모델하우스 결절 | CURRENT_SUPPORTING | 기존 boss/family suitability Local role + PM-02의 early-season C01 boss milestone. exact quest number와 current boss implementation은 없음 |
| R01-L04 배수로 침묵 주머니 | FUTURE_PRODUCTION_FILL | ID/name과 기존 차폐/숨은 회수 의미만 유지. current Unreal semantic anchor는 미정 |
| R01-L05 가짜 귀환로 | FUTURE_PRODUCTION_FILL | ID/name과 재방문/거짓 귀환 의미만 유지. current voluntary-return contract와 충돌하지 않는 구체 law는 후속 Fill |

### legacy alias boundary
아래 Godot exact identifier는 document alias/reference로만 보존한다.
- silence_edge_start
- outer_recovery_lane_anchor
- subdivision_loop_center
- open_house_street_anchor
- model_house_node_anchor
- drain_pocket_anchor
- fake_return_route_anchor

Unreal runtime authority로 부활시키지 않는다.

## 3. gameplay_law

상태: **DEFINED**

### C01 campaign-specific law

1. **무엇을 조사하는가**
   - household / occupancy / receipt / guardian / resident-candidate를 판정하는 주거 기록.
   - 생활 서비스와 residential access가 어떤 등록 역할을 기준으로 작동하는지.
   - current slice에서는 수령 로그, 인증 기록, 분양 주택 기록 대조와 선택 단서를 포함한다.

2. **무엇을 인정/거부하는가**
   - 시스템의 등록 역할은 “사실”이 아니라 조사해야 할 claim으로 취급한다.
   - 플레이어는 확인된 기록과 현장 상태를 대조해 local service/호출 상태에 대한 선택을 한다.
   - current first slice의 확정 선택은 MAIL-LOOP 호출 보류 / 기존 대기 유지 범위이며, 이를 가족 배정 승인으로 확대하지 않는다.

3. **무엇을 우회하는가**
   - 등록 역할 불일치가 만든 즉시 강제 완료나 단일 정답 압력을 우회한다.
   - 선택 조사, 미완료 정상 귀환, 재방문으로 조사를 이어갈 수 있다.
   - Local별 구체 우회 경로/장치는 해당 Local Production Fill 전까지 창작하지 않는다.

4. **무엇이 다음 방문에 남는가**
   - quest/checkpoint.
   - 조사 기록.
   - 중요 선택.
   - 정상/미완료 귀환 상태.
   - report/growth 처리 상태.
   - revisit state.
   - 상세 저장 범위는 §6 STANDARD profile을 따른다.

5. **언제 정상 귀환하는가**
   - designated return interaction에서 플레이어가 선택해 귀환한다.
   - 미완료 귀환도 정상 상태이며 진행을 보존한다.
   - 70/88/108초 timer pressure나 forced extraction을 정상 귀환 규칙으로 쓰지 않는다.

6. **어떻게 보고/성장으로 이어지는가**
   - 목표를 충분히 마친 뒤 safe-hub report를 통해 선택/결과를 확정하고 일회성 permanent growth를 적용한다.
   - 반복 보고로 성장 보상을 복제하지 않는다.
   - follow-up/revisit는 저장된 결과를 이어받는다.

### current backbone

```text
quest
→ exploration
→ finite place-bound combat
→ investigation
→ choice
→ voluntary return
→ report/growth
→ revisit / follow-up
```

### boss milestone
R01-L03:
```text
R01-L01 first quest
→ voluntary return
→ report/growth
→ R01-L02 follow-up investigation/revisit
→ additional C01 progression
→ R01-L03 boss milestone
```

exact quest number는 TBD다.

### forbidden
- fixed-time run.
- 108초 forced extraction.
- 108초 → L02 unlock.
- main auto-fire.
- 240초 boss gate.
- infinite global wave.

## 4. human_recognition_rule

상태: **DEFINED**

E01_C01이 사람을 잘못 읽는 주된 축은 다음 다섯 역할이다.

- household member.
- occupant.
- guardian.
- recipient.
- resident candidate.

### recognition law
- 시스템은 주거 서비스/보호/수령 판단에서 등록된 household/occupancy role을 우선할 수 있다.
- 실제 인간 관계와 등록 역할이 다르면 misrecognition이 발생한다.
- 플레이어는 기록과 현장 상태를 대조해 그 claim의 신뢰성을 판단한다.
- misrecognition은 실제 access/help/receipt/protection consequence와 연결되어야 한다.

### boundary
- 새 top-level schema field를 만들지 않는다.
- C06의 membership/payment/account/loyalty entitlement와 혼동하지 않는다.
- current MAIL-LOOP choice를 가족 관계 확정으로 확대하지 않는다.

## 5. resource_ecology

상태: **DEFINED**

E01_C01의 resource ecology는 새 currency가 아니라 **생활 서비스와 주거 접근의 실제 가용성**을 중심으로 한다.

### resource / service set
- 생활 도움 service.
- emergency/help resource.
- residential access.
- receipt / household record availability.
- service availability.
- Local별 finite service/interaction source.
- finite place-bound combat source는 무한 웨이브가 아니라 장소 귀속 위협으로 취급한다.

### causal consequence

```text
service/resource available
→ help/access/record interaction 가능
→ investigation/choice 진행 가능

registration conflict or service unavailable
→ help/access/receipt/protection이 잘못 배정되거나 보류
→ 추가 기록 대조 / 선택 / 정상 귀환 / revisit 필요
```

current slice의 emergency kit, automatic help/open door, receipt/authentication records는 이 ecology의 실물 근거다.

### dependency boundary
- cross-Campaign service dependency는 이번 Entry에서 생성하지 않는다.
- 실제 provider/consumer infrastructure가 확인되기 전에는 `none locked`.
- 같은 Sector 또는 source edge가 있다는 이유만으로 dependency를 만들지 않는다.

### forbidden
- 새 currency 생성.
- 무한 service/resource.
- rumor만으로 inventory/service capacity/physical facility 변경.
- report growth를 현금성/통화성 ecology로 해석.

## 6. persistence_profile

상태: **DEFINED**
class: **STANDARD**

### Direct Memory scope
- quest/checkpoint.
- investigation record.
- important choice.
- normal return.
- incomplete progress.
- report/growth.
- revisit state.

### 저장되는 state
- current quest/follow-up stage.
- 조사 checkpoint 및 확인한 record state.
- 중요한 local choice.
- 정상 귀환 / 미완료 진행 상태.
- report 완료 및 one-time growth 처리 상태.
- revisit에서 필요한 local investigation/source state.

current RPG34/RPG35의 실제 persistence 근거를 Production profile로 canonicalize한 것이며, C01 전체 Unreal implementation 완료 선언이 아니다.

### revisit consequence
- 미완료 정상 귀환 뒤 같은 진행을 이어갈 수 있다.
- 이미 조사한 record/checkpoint와 중요한 choice를 잃지 않는다.
- 완료 보고/성장 중복 지급을 허용하지 않는다.
- follow-up/revisit는 저장된 조사와 선택의 결과를 참조할 수 있다.
- 실제 시설/지형을 영구 변경하려면 별도 structural evidence가 필요하다.

### rumor allowed scope
C01은 Direct Memory 우선이다. rumor/information은 causal channel이 확인될 때 다음 범위만 허용한다.
- household/occupancy/receipt 관련 정보.
- service availability 관련 정보.
- report/record에 대한 전달 정보.

허용 channel은 resident movement, communications, administrative record, support/beacon/recovery record 등 Final Lock이 허용한 실제 channel 중 근거가 있는 것만 사용한다.

### rumor forbidden physical mutation
rumor만으로 다음을 바꾸지 않는다.
- 문/통로의 실제 물리 상태.
- 물자량/재고.
- facility damage/repair.
- service capacity.
- physical route.
- Local geometry.

### STRUCTURAL
`STRUCTURAL physical persistence = NOT LOCKED`.

시설/지형 영구 물리 변경은 별도 production evidence가 있을 때만 승격한다.

## 7. Production Entry 6-field result

| field | status |
|---|---|
| regional_secondary_collapse | DEFINED |
| infrastructure_anchor | DEFINED |
| gameplay_law | DEFINED |
| human_recognition_rule | DEFINED |
| resource_ecology | DEFINED |
| persistence_profile | DEFINED / STANDARD |

Campaign verdict: **DEFINED**.

## 8. Non-implementation boundary

이 문서로 수행하지 않은 것:
- Blueprint/C++ 구현.
- map 변경.
- new Local.
- new source edge.
- R01-L03 exact quest number.
- Sector Relay assignment.
- Structural persistence 승격.

판정: **E01_C01 PRODUCTION ENTRY DEFINED**.
