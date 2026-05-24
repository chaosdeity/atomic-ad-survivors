# E01 R02/R03/R04/R08 보조 NPC 최소안 v0.1

## 문서 상태

```text
상태:
제작팀 전달용 v0.1

용도:
E01의 R02 의료/보험, R03 물류/반품, R04 정품/충전/산업, R08 침묵권/비상보급에 필요한 보조 NPC 규모와 구현 우선순위를 최소 수량으로 고정한다.

판정:
통과

기준 문서:
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
story/06_characters/discharge_hold_patient_profile_v1_0.md
story/06_characters/return_recipient_profile_v1_0.md
story/06_characters/meter_06_profile_v1_0.md
story/06_characters/quiet_07_profile_v1_0.md
```

핵심 판정:

```text
E01 보조 NPC는 이름 수집 작업이 아니다.
각 지역의 플레이어블이 이미 담당하는 기능을 비워 두고,
남는 시설/상태값/선택 후폭풍의 얼굴만 최소로 만든다.
```

---

## 0. 제작 범위 판정

### 0.1 지역별 NPC 수 제한

| 지역 | 연결 플레이어블 | 후보 수 상한 | 이번 문서 후보 수 | 직접 대면 상한 | 판정 |
|---|---|---:|---:|---:|---|
| R02 백색팔찌 격리권 | 강하람 / HOLD-04 | 2~4명 | 3명 | 1명 | 통과 |
| R03 반품 회수 벨트 | 한이루 / RETURN-05 | 2~4명 | 3명 | 1명 | 통과 |
| R04 정품충전 공단 | 차유건 / METER-06, PATCH | 2~4명 | 3명 | 1명 | 통과 |
| R08 서부 비상보급망/침묵권 | 백여울 / QUIET-07 | 2~4명 | 3명 | 1명 | 통과 |

총량:

```text
보조 NPC 후보 12개.
이 중 직접 대면 후보는 4명 이하.
나머지는 음성 잔향, 오브젝트 흔적, 자동 문구, 배경 처리로 자른다.
```

이번 버전에서 만들지 않는 것:

```text
1. R02/R03/R04/R08 각각에 R01처럼 12명씩 붙이기.
2. 모든 후보의 상세 프로필 v1.0 작성.
3. 플레이어블 4~7번이 담당하는 전투/해금/HP 0 기능을 NPC에게 넘기기.
4. R02-L04/L05, R03-L04/L05, R04-L04/L05, R08-L05의 보스/후반 결론 조기 개방.
5. 새 보급소 상주 NPC 추가.
6. R08 침묵권 NPC를 DRAIN-MARK의 상위호환으로 만들기.
```

### 0.2 통과 후보 깊이

| 깊이 | 대상 | 이번 문서 처리 |
|---|---|---|
| A급 보조 후보 | 지역당 직접 대면 1명 | 짧은 상세, 대사 5줄, 프로필 v0.1 후보 |
| B급 잔향 후보 | 지역별 음성/자동 문구 | 짧은 상세, 대사/문구 5줄 |
| B급 오브젝트 후보 | 병상 대장, 보관함, 대기표, 비콘 표식 | 짧은 상세, 조사 문구 5줄 |
| C급 배경 후보 | 군중, 줄, 안내판, 명단 | 이름 없음, 후보표에서 배경 처리 |

---

## 1. 지역별 캠페인 질문

| 지역 | 캠페인 질문 | NPC가 보여줘야 하는 것 |
|---|---|---|
| R02 의료/보험 | 치료가 끝나지 않았다는 말은 보호인가, 붙잡기인가? | 환자 팔찌, 병상 재배정, 보험 재심사가 사람을 살리면서 묶는 구조 |
| R03 물류/반품 | 수취인이 없으면 사람은 어디에 보관되는가? | 라벨, 오배송, 보관 기한이 사람의 목적지를 대신 정하는 구조 |
| R04 정품/충전/산업 | 전기를 받기 위해 계량당하는 것은 보호인가, 소유인가? | 차단기, 충전 순번, 분진 필터가 안전을 이유로 사람과 로봇을 수치화하는 구조 |
| R08 침묵권/비상보급 | 덜 들키는 길은 왜 덜 구해지는 길이 되는가? | 무음 플랫폼, 저장고, 수동 비콘이 보호와 고립을 동시에 만드는 구조 |

---

## 2. 플레이어블 충돌 방지표

| 지역 | 관련 플레이어블 | 플레이어블이 담당하는 기능 | NPC가 절대 가져가면 안 되는 기능 | NPC가 보조해야 하는 기능 |
|---|---|---|---|---|
| R02 | 강하람 / HOLD-04 | 퇴원 취소, 재입원, 심사 보류, 팔찌 절단 신호 | 힐러화, 퇴원 보류 전투, 하람의 해금 결절 | 접수 팔찌 발급, 병상 재배정 압박, 보험 재심사 후폭풍 |
| R03 | 한이루 / RETURN-05 | 수취 보류, 반송 전환, 미수령 보관, 재배송 대기 | 반송 수취인 정체성, 미수령 상태 전투, 이루의 반송 로그 인양 | 라벨 교정 압박, 오배송 방송, 보관 기한 후폭풍 |
| R04 | 차유건 / METER-06 | 계량 초과, 충전 차단, 과금 기준, 정품 도크 회수 직전 인양 | 전기 마법/충전 버퍼, 계량 전투, 유건의 폐충전소 로그 | 차단기 운용, 충전 대기표 압박, 분진/오염 선택 후폭풍 |
| R04 | PATCH | 자기 몸을 부품처럼 써온 보급소 수리 로봇 | 수리 로봇 대체, 부품화 감정, 로봇 자율성 코어 | 정품/리콜 절차의 위험을 오브젝트로 예고 |
| R08 | 백여울 / QUIET-07 | 신호 약화, 호출 회피, 회수선 리스크, 저소음 비콘 | 은신/정찰/침묵권 전투 리듬, 여울의 HP 0 | 저장고 배급 압박, 무음 플랫폼 잔향, 수동 비콘 로그 |
| R08 | DRAIN-MARK | R01 배수로 침묵 주머니 표식 NPC | R08 플레이어블/가이드화, 숨은 루트 상위호환 | R08의 침묵권은 별도 권역임을 분리 |

---

## 3. NPC 후보표

| 번호 | npc_id | 코드명/역할명 | 분류 | 첫 위치 | 담당 기능 | 상태값 | 잘못 믿는 것 | 직접 구현 | 플레이어블 충돌 | 판정 |
|---:|---|---|---|---|---|---|---|---|---|---|
| 1 | `r02_wrist_clerk` | WRIST-CLERK / 접수 팔찌 담당자 | human_internal | R02-L01 응급 접수 홀 | 팔찌 발급, 보호자 미확인, 접수번호 압박 | `medical_registration`, `human_stability`, `treatment_tag` | 번호가 붙어야 사람을 놓치지 않는다고 믿는다 | 직접 대면 1회 | 하람의 퇴원 보류 기능 침범 금지 | 조건부 통과 |
| 2 | `r02_claim_window` | CLAIM-WINDOW / 보험 재심사 창구 | system_residue | R02-L03 보험 심사 약국 | 약품 접근, 보험 재심사, 진료태그 부담 | `treatment_tag`, `supply_pressure`, `campaign_density` | 심사가 닫혀야 약을 줄 수 있다고 믿는다 | 음성/창구 잔향 | 하람의 보험 도장 전투와 분리 | 통과 |
| 3 | `r02_bed_ledger` | BED-LEDGER / 병상 대장 | object_trace | R02-L02 장기 입원동 | 병상 재배정, 커튼, 침상 번호 | `human_stability`, `bed_reassign_pressure`, `trace_preservation` | 빈 병상은 가장 안전한 대상에게 다시 배정해야 한다고 믿는다 | 오브젝트 | 하람의 HP 0 병상 재배정과 보조 연결만 허용 | 통과 |
| 4 | `r03_label_foreman` | LABEL-FOREMAN / 라벨 교정반장 | human_internal | R03-L01 반품 접수 야드 | 송장 오류, 라벨 교정, 분류 순서 | `delivery_state`, `passage_tag`, `human_stability` | 정확한 라벨이 사람을 덜 다치게 한다고 믿는다 | 직접 대면 1회 | 이루의 반송 수취인 기능 침범 금지 | 조건부 통과 |
| 5 | `r03_misroute_speaker` | MISROUTE-SPEAKER / 오배송 안내 방송 | system_residue | R03-L02 자동 분류장 | 오배송 경고, 컨베이어 분기, 주소 재확인 | `delivery_state`, `signal_tag`, `campaign_density` | 목적지를 다시 읽으면 반드시 바로잡힌다고 믿는다 | 음성 잔향 | MAIL-LOOP/이루와 주소 기능 중복 주의 | 통과 |
| 6 | `r03_hold_cage` | HOLD-CAGE / 미수령 보관함 3열 | object_trace | R03-L02 자동 분류장 | 보관 기한, 임시 적재, 재배송 대기 | `trace_preservation`, `delivery_state`, `supply_pressure` | 닫아 두면 잃어버리지 않는다고 믿는다 | 오브젝트 | 이루의 미수령 전투 공간과 직접 중복 금지 | 통과 |
| 7 | `r04_breaker_marshal` | BREAKER-MARSHAL / 차단기 감시원 | human_internal | R04-L01 폐충전소 | 차단 순서, 과부하 안전, 수동 전원컷 | `charge_load`, `robot_autonomy`, `campaign_density` | 전원을 끊으면 모두 안전해진다고 믿는다 | 직접 대면 1회 | 유건의 계량 초과 전투 침범 금지 | 조건부 통과 |
| 8 | `r04_charge_queue` | CHARGE-QUEUE / 충전 대기표 88번 | object_trace | R04-L01 폐충전소 | 충전 순번, 대기열, 접근권 압박 | `charge_tag`, `supply_pressure`, `extraction_stability` | 순번이 있으면 공정하게 충전된다고 믿는다 | 오브젝트/자동 문구 | 유건의 사용량/계량 로그와 분리 | 통과 |
| 9 | `r04_ash_filter` | ASH-FILTER / 회색 분진 필터 | object_trace | R04-L02 배터리 침전 공장 | 회색 분진, 오염 차단, 폐기 기준 | `campaign_density`, `robot_autonomy`, `trace_preservation` | 걸러낸 것은 안전하게 사라진다고 믿는다 | 오브젝트 | PATCH/VAC-0/리오의 흔적 삭제 축 침범 금지 | 통과 |
| 10 | `r08_storehouse_keeper` | STOREHOUSE-KEEPER / 저장고 기록자 | human_resident | R08-L04 민방위 저장고 | 수동 잠금문, 배급 기록, 실제 재고 | `supply_pressure`, `human_stability`, `ration_tag` | 재고표가 맞으면 아무도 굶지 않는다고 믿는다 | 직접 대면 1회 | 미나의 정산/배급 기능 대체 금지 | 조건부 통과 |
| 11 | `r08_station_echo` | STATION-ECHO / 무음 플랫폼 안내 잔향 | system_residue | R08-L03 폐역 무음 플랫폼 | 꺼진 안내판, 낮은 수신, 인양 반경 | `signal_stability`, `extraction_stability`, `campaign_density` | 방송이 멈추면 위험도 멈춘다고 믿는다 | 음성/전광판 잔향 | 여울의 수신 조절 전투 침범 금지 | 통과 |
| 12 | `r08_manual_beacon` | MANUAL-BEACON / 수동 비콘 표식대 | object_trace | R08-L02/R08-L03 | 비콘 끈, 좌표 조각, 지연 로그 | `extraction_stability`, `signal_stability`, `trace_preservation` | 작게 남기면 안전하게 찾을 수 있다고 믿는다 | 오브젝트 | DRAIN-MARK 표식과 혼동 금지 | 통과 |

탈락/배경 처리 기준:

| 후보 유형 | 판정 | 이유 |
|---|---|---|
| R02 의사/간호사 동료 NPC | 탈락 | 하람의 의료 절차 비틀기를 힐러/의료인 서사로 오해시킨다 |
| R03 택배 기사/스캐너 상인 | 탈락 | 이루와 윤서의 기능을 동시에 침범한다 |
| R04 충전 로봇 도우미 | 탈락 | PATCH/리오/팝시 축과 겹친다 |
| R08 침묵권 정찰대장 | 탈락 | 여울을 은신/정찰 캐릭터로 오독시킨다 |
| R08 보급소 상주 신입 | 배경 처리 | 보급소 상주 NPC 5명 기준을 흔든다 |

---

## 4. 통과 후보 짧은 상세

### 4.1 R02 / 백색팔찌 격리권

```text
npc_id:
r02_wrist_clerk

code_name:
WRIST-CLERK

유저 첫 표기:
접수 팔찌 담당자

내부 본명:
오다은

npc_type:
human_internal

admin_real_region:
서울 도심/서부/강남/신촌/수원권 대형 병원군

admin_infra_anchor:
응급실 접수 키오스크, 환자 팔찌 발급대

user_display_region_name:
백색팔찌 격리권 / 응급 접수 홀

first_location:
R02-L01 응급 접수 홀

first_exposure:
접수번호 전광판과 팔찌 발급대 사이의 짧은 직접 대면

core_function:
사람을 놓치지 않기 위해 번호와 보호자 확인을 먼저 붙이는 절차의 얼굴

wrong_belief:
번호가 붙어야 사람을 놓치지 않는다고 믿는다.

state_keys:
medical_registration, human_stability, treatment_tag, campaign_density

choice_flags:
r02_wrist_clerk_seen, r02_wristband_issue_hold, r02_guardian_missing_flag

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
R02-L02 접근 계산, 환자 팔찌 흔적, 하람 첫 조우 단서

forbidden:
하람의 퇴원 보류 전투, 치료/힐러 기능, 선한 접수원 구원 서사
```

```text
npc_id:
r02_claim_window

code_name:
CLAIM-WINDOW

유저 첫 표기:
보험 재심사 창구

내부 본명:
없음

npc_type:
system_residue

admin_real_region:
서울/수도권 대형 병원군

admin_infra_anchor:
보험 정산 키오스크, 약국 처방 창구

user_display_region_name:
백색팔찌 격리권 / 보험 심사 약국

first_location:
R02-L03 보험 심사 약국

first_exposure:
닫힌 창구 너머 반복되는 재심사 안내 음성

core_function:
약품 접근과 진료태그 부담을 심사 완료 상태로 묶는 잔향

wrong_belief:
심사가 닫혀야 약을 줄 수 있다고 믿는다.

state_keys:
treatment_tag, supply_pressure, campaign_density, human_stability

choice_flags:
r02_claim_window_heard, r02_claim_reopen_delayed, r02_prescription_access_risk

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
진료태그 부담, 약품 접근 선택, R06 브로커 단서 약한 연결

forbidden:
상점 약국 NPC, 보험 할인 NPC, 하람의 보험 도장 전투 대체
```

```text
npc_id:
r02_bed_ledger

code_name:
BED-LEDGER

유저 첫 표기:
병상 대장

내부 본명:
없음

npc_type:
object_trace

admin_real_region:
수도권 요양/회복 병동

admin_infra_anchor:
장기 입원동 자동 침대, 병상 커튼, 침상 번호판

user_display_region_name:
백색팔찌 격리권 / 장기 입원동

first_location:
R02-L02 장기 입원동

first_exposure:
커튼 옆에 걸린 재배정 대장과 비어 있지 않은 빈 병상

core_function:
구출하면 남는 병상과 밀려나는 사람의 후폭풍을 오브젝트로 보여준다.

wrong_belief:
빈 병상은 가장 안전한 대상에게 다시 배정해야 한다고 믿는다.

state_keys:
human_stability, bed_reassign_pressure, trace_preservation, treatment_tag

choice_flags:
r02_bed_ledger_seen, r02_bed_reassign_warning, r02_curtain_hold_mark

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
하람의 병상 재배정 공포 보조, 장기 입원동 선택 후폭풍

forbidden:
병상 회복 포인트, 무료 치료 시설, 하람 HP 0 연출의 본체화
```

### 4.2 R03 / 반품 회수 벨트

```text
npc_id:
r03_label_foreman

code_name:
LABEL-FOREMAN

유저 첫 표기:
라벨 교정반장

내부 본명:
나규민

npc_type:
human_internal

admin_real_region:
인천-김포-부천-군포-이천형 수도권 물류축

admin_infra_anchor:
반품 접수 야드, 송장 교정대, 컨테이너 라벨 라인

user_display_region_name:
반품 회수 벨트 / 반품 접수 야드

first_location:
R03-L01 반품 접수 야드

first_exposure:
반품 라벨을 손으로 떼지 못하고 접수 순서를 재검산하는 직접 대면

core_function:
라벨이 틀리면 사람이 더 위험해진다는 공포를 보여주는 R03 보조 얼굴

wrong_belief:
정확한 라벨이 사람을 덜 다치게 한다고 믿는다.

state_keys:
delivery_state, passage_tag, human_stability, campaign_density

choice_flags:
r03_label_foreman_seen, r03_label_sort_hold, r03_label_manual_override

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
R03-L02 접근 계산, 이루 첫 조우 단서, 오배송 안내 방송 활성화

forbidden:
택배 기사, 라벨 상인, 윤서의 반품 담당자 반복, 이루의 반송 수취인 대체
```

```text
npc_id:
r03_misroute_speaker

code_name:
MISROUTE-SPEAKER

유저 첫 표기:
오배송 안내 방송

내부 본명:
없음

npc_type:
system_residue

admin_real_region:
수도권 자동 물류 분류 라인

admin_infra_anchor:
컨베이어 분류 게이트, 오배송 경고 스피커

user_display_region_name:
반품 회수 벨트 / 자동 분류장

first_location:
R03-L02 자동 분류장

first_exposure:
벨트가 멈추지 않는 상태에서 목적지를 다시 읽는 반복 방송

core_function:
주소를 다시 읽는 것이 항상 구조가 아니라 재분류일 수 있음을 보여준다.

wrong_belief:
목적지를 다시 읽으면 반드시 바로잡힌다고 믿는다.

state_keys:
delivery_state, signal_tag, campaign_density, trace_preservation

choice_flags:
r03_misroute_voice_heard, r03_route_recalculated, r03_wrong_address_hold

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
컨베이어 분기 선택, 반송 로그 조각, MAIL-LOOP와 약한 대비

forbidden:
MAIL-LOOP의 인간판, 힌트 방송, 이루의 목적지 전투 대체
```

```text
npc_id:
r03_hold_cage

code_name:
HOLD-CAGE

유저 첫 표기:
미수령 보관함 3열

내부 본명:
없음

npc_type:
object_trace

admin_real_region:
수도권 자동 물류 분류 라인

admin_infra_anchor:
임시 보관 케이지, 재배송 대기 선반

user_display_region_name:
반품 회수 벨트 / 자동 분류장

first_location:
R03-L02 자동 분류장

first_exposure:
보관 기한이 지나도 열리지 않은 미수령 케이지

core_function:
보관이 보호와 폐기 대기 사이에 있다는 후폭풍을 오브젝트로 남긴다.

wrong_belief:
닫아 두면 잃어버리지 않는다고 믿는다.

state_keys:
delivery_state, trace_preservation, supply_pressure, human_stability

choice_flags:
r03_hold_cage_seen, r03_storage_expiry_flag, r03_unclaimed_hold_mark

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
이루의 미수령 보관 공포 보조, 보관 기한 선택 후폭풍

forbidden:
박스 보상 상자, 루팅 케이지, 이루 전투 공간 대체
```

### 4.3 R04 / 정품충전 공단

```text
npc_id:
r04_breaker_marshal

code_name:
BREAKER-MARSHAL

유저 첫 표기:
차단기 감시원

내부 본명:
손도겸

npc_type:
human_internal

admin_real_region:
반월/시화/안산/시흥/평택형 산업단지

admin_infra_anchor:
산업단지 외곽 충전 스테이션, 수동 차단기함

user_display_region_name:
정품충전 공단 / 폐충전소

first_location:
R04-L01 폐충전소

first_exposure:
차단기함 앞에서 충전 대기열보다 과부하 순서를 먼저 보는 직접 대면

core_function:
안전을 위해 끊는 선택이 누구를 먼저 어둡게 만드는지 보여준다.

wrong_belief:
전원을 끊으면 모두 안전해진다고 믿는다.

state_keys:
charge_load, robot_autonomy, campaign_density, extraction_stability

choice_flags:
r04_breaker_marshal_seen, r04_breaker_order_changed, r04_manual_cut_risk

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
R04-L02 접근 계산, 유건 계량 로그 단서, 로봇 자율성 압박

forbidden:
엔지니어, 수리공, 전기 버퍼, PATCH 보조, 유건 전투 대체
```

```text
npc_id:
r04_charge_queue

code_name:
CHARGE-QUEUE

유저 첫 표기:
충전 대기표 88번

내부 본명:
없음

npc_type:
object_trace

admin_real_region:
산업단지 외곽 충전 스테이션

admin_infra_anchor:
충전 순번표, 대기표 발급기, 과금 미터

user_display_region_name:
정품충전 공단 / 폐충전소

first_location:
R04-L01 폐충전소

first_exposure:
현재 호출 번호보다 오래 남아 있는 88번 대기표

core_function:
순번과 공정성이 사람/로봇을 대기 상태로 고정하는 압박을 보여준다.

wrong_belief:
순번이 있으면 공정하게 충전된다고 믿는다.

state_keys:
charge_tag, supply_pressure, extraction_stability, robot_autonomy

choice_flags:
r04_charge_ticket_seen, r04_charge_queue_overrun, r04_waiting_number_hold

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
충전태그 부담, 유건 정산 루트 보조, 정품 도크 위험 예고

forbidden:
충전 상점, 리롤 스탠드, 팝시 기능 반복, 유건의 계량 로그 대체
```

```text
npc_id:
r04_ash_filter

code_name:
ASH-FILTER

유저 첫 표기:
회색 분진 필터

내부 본명:
없음

npc_type:
object_trace

admin_real_region:
배터리 제조/폐기 공장

admin_infra_anchor:
배터리 침전조, 분진 필터, 폐기 기준표

user_display_region_name:
정품충전 공단 / 배터리 침전 공장

first_location:
R04-L02 배터리 침전 공장

first_exposure:
회색 분진을 거르고 남은 필터 안쪽의 작은 이름표 조각

core_function:
오염을 걸러내는 일이 흔적 삭제와 폐기 기준으로 변하는 위험을 남긴다.

wrong_belief:
걸러낸 것은 안전하게 사라진다고 믿는다.

state_keys:
campaign_density, robot_autonomy, trace_preservation, charge_tag

choice_flags:
r04_ash_filter_seen, r04_gray_dust_warning, r04_filtered_trace_hold

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
회색 오염 선택 후폭풍, PATCH/세븐 반응, R04-L03 리콜실 보류 예고

forbidden:
VAC-0 흔적 삭제 반복, 리오 정품 복구 선공개, 로봇 해방 결론 조기 개방
```

### 4.4 R08 / 침묵권과 서부 비상보급망

```text
npc_id:
r08_storehouse_keeper

code_name:
STOREHOUSE-KEEPER

유저 첫 표기:
저장고 기록자

내부 본명:
고은재

npc_type:
human_resident

admin_real_region:
수도권 서북/서부 외곽 간선도로권

admin_infra_anchor:
민방위 저장고, 급수/배급 창고, 수동 잠금문

user_display_region_name:
서부 비상보급망 / 민방위 저장고

first_location:
R08-L04 민방위 저장고

first_exposure:
잠금문 안쪽의 재고표와 손으로 고친 배급 기록

core_function:
비상보급이 보급소 확장이 아니라 실제 물자 압박임을 보여준다.

wrong_belief:
재고표가 맞으면 아무도 굶지 않는다고 믿는다.

state_keys:
supply_pressure, human_stability, ration_tag, trace_preservation

choice_flags:
r08_storehouse_keeper_seen, r08_storehouse_ration_lock, r08_manual_stock_recount

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
R08-L04 선택 후폭풍, 보급 압력 상태값, 여울 해금 전 생활 압박

forbidden:
미나 대체, 상점/배급 NPC, 새 보급소 상주 승격, 안전한 피난처 판매
```

```text
npc_id:
r08_station_echo

code_name:
STATION-ECHO

유저 첫 표기:
무음 플랫폼 안내 잔향

내부 본명:
없음

npc_type:
system_residue

admin_real_region:
수도권 서부 외곽 폐역권

admin_infra_anchor:
외곽 폐역, 지하 플랫폼, 통신실

user_display_region_name:
서부 비상보급망 / 폐역 무음 플랫폼

first_location:
R08-L03 폐역 무음 플랫폼

first_exposure:
꺼진 안내판에 한 박자 늦게 뜨는 무음 안내 문구

core_function:
방송이 멈춘 것이 안전이 아니라 수신 공백임을 보여준다.

wrong_belief:
방송이 멈추면 위험도 멈춘다고 믿는다.

state_keys:
signal_stability, extraction_stability, campaign_density, supply_pressure

choice_flags:
r08_station_echo_heard, r08_platform_signal_low, r08_silent_arrival_mark

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
인양 반경 보정 단서, 여울 수신 리스크 보조, R05 원격 신호 약한 연결

forbidden:
지도 안내 NPC, 만능 경로 개방, 여울의 신호 조절 전투 대체
```

```text
npc_id:
r08_manual_beacon

code_name:
MANUAL-BEACON

유저 첫 표기:
수동 비콘 표식대

내부 본명:
없음

npc_type:
object_trace

admin_real_region:
수도권 서부 외곽 주유소-폐역 연결권

admin_infra_anchor:
역송출 주유소, 무음 플랫폼, 수동 비콘 끈

user_display_region_name:
서부 비상보급망 / 역송출 주유소와 무음 플랫폼 사이

first_location:
R08-L02 또는 R08-L03

first_exposure:
큰 구조 신호 대신 짧게 당긴 비콘 끈과 지연 로그

core_function:
작게 남기는 신호가 안전과 인양 지연을 동시에 만든다는 증거

wrong_belief:
작게 남기면 안전하게 찾을 수 있다고 믿는다.

state_keys:
extraction_stability, signal_stability, trace_preservation, campaign_density

choice_flags:
r08_manual_beacon_seen, r08_beacon_log_delayed, r08_low_signal_trace_saved

dialogue_refs_min:
first_exposure, state_low, state_stable, choice_success, choice_fail

reward_or_unlock:
여울 HP 0 리스크 보조, 인양 안정도 튜토리얼 후속, DRAIN-MARK와 분리된 R08 표식

forbidden:
DRAIN-MARK 표식 대체, 무료 탈출 버튼, 안전한 침묵권 증명
```

---

## 5. 직접 구현 우선순위

| 우선순위 | NPC/잔향 | 구현 방식 | 필요한 에셋 | 필요한 플래그 | 대사량 | 이번 버전 포함 여부 |
|---:|---|---|---|---|---:|---|
| 1 | `r02_wrist_clerk` | 직접 대면 1회 | 팔찌 발급대, 접수번호 전광판, 간단 초상 | `r02_wrist_clerk_seen`, `r02_wristband_issue_hold` | 5줄 | 조건부 포함 |
| 2 | `r03_label_foreman` | 직접 대면 1회 | 라벨 교정대, 반품 접수 야드 초상 | `r03_label_foreman_seen`, `r03_label_sort_hold` | 5줄 | 조건부 포함 |
| 3 | `r04_breaker_marshal` | 직접 대면 1회 | 수동 차단기함, 충전 경고등, 간단 초상 | `r04_breaker_marshal_seen`, `r04_breaker_order_changed` | 5줄 | 조건부 포함 |
| 4 | `r08_storehouse_keeper` | 직접 대면 1회 | 수동 잠금문, 재고표, 간단 초상 | `r08_storehouse_keeper_seen`, `r08_storehouse_ration_lock` | 5줄 | 조건부 포함 |
| 5 | `r02_claim_window` | 창구 음성 잔향 | 보험 키오스크, 처방 창구, 스피커 UI | `r02_claim_window_heard`, `r02_claim_reopen_delayed` | 5줄 | 포함 |
| 6 | `r03_misroute_speaker` | 안내 방송 | 컨베이어 스피커, 오배송 전광판 | `r03_misroute_voice_heard`, `r03_route_recalculated` | 5줄 | 포함 |
| 7 | `r08_station_echo` | 전광판/무음 안내 잔향 | 꺼진 안내판, 지연 자막 | `r08_station_echo_heard`, `r08_platform_signal_low` | 5줄 | 포함 |
| 8 | `r02_bed_ledger` | 오브젝트 조사 | 병상 대장, 커튼, 침상 번호 | `r02_bed_ledger_seen`, `r02_bed_reassign_warning` | 5문구 | 포함 |
| 9 | `r03_hold_cage` | 오브젝트 조사 | 미수령 케이지, 보관 기한표 | `r03_hold_cage_seen`, `r03_storage_expiry_flag` | 5문구 | 포함 |
| 10 | `r04_charge_queue` | 오브젝트/자동 문구 | 대기표 발급기, 과금 미터 | `r04_charge_ticket_seen`, `r04_charge_queue_overrun` | 5문구 | 포함 |
| 11 | `r04_ash_filter` | 오브젝트 조사 | 분진 필터, 침전조, 이름표 조각 | `r04_ash_filter_seen`, `r04_gray_dust_warning` | 5문구 | 포함 |
| 12 | `r08_manual_beacon` | 오브젝트 조사 | 수동 비콘 끈, 지연 로그 패널 | `r08_manual_beacon_seen`, `r08_beacon_log_delayed` | 5문구 | 포함 |

직접 대면 제한:

```text
한 지역에 직접 대면 후보는 1명만 둔다.
해당 직접 대면 후보도 첫 버전에서는 긴 개인 퀘스트가 아니라
플레이어블 해금 단서와 상태값 후폭풍을 받쳐 주는 짧은 장면으로 제한한다.
```

---

## 6. 최소 대사 / 문구 5줄씩

### 6.1 R02

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| WRIST-CLERK | 첫 노출 | "팔찌가 없으면 놓칩니다. 이름보다 번호가 먼저 잡히는 이유가 있어요." | 접수번호 오판 |
| WRIST-CLERK | 인간 안정도 낮음 | "대기열이 무너지면, 아픈 사람부터 사라져요. 그래서 제가 번호를 놓지 못합니다." | 상태값 후폭풍 |
| WRIST-CLERK | 상태 안정 | "오늘은 팔찌를 늦게 채워도 되겠네요. 아직 사람 얼굴이 먼저 보입니다." | 안정 반응 |
| WRIST-CLERK | 선택 성공 | "보호자 미확인으로 남겼습니다. 데려가도 된다는 뜻은 아니고, 아직 닫히지 않았다는 뜻이에요." | 보류 선택 |
| WRIST-CLERK | 선택 실패/후폭풍 | "번호가 비었습니다. 병상 쪽에서 벌써 다른 사람을 부르고 있어요." | 실패 비용 |
| CLAIM-WINDOW | 첫 노출 | "재심사 접수. 약품 접근은 승인 뒤 가능합니다." | 보험 잔향 |
| CLAIM-WINDOW | 보급 압력 높음 | "약품 재고 부족. 미승인 처방은 다음 대기열로 이월됩니다." | 공급 압박 |
| CLAIM-WINDOW | 상태 안정 | "심사 지연 허용. 처방 기록은 아직 환자 번호에 병합되지 않았습니다." | 안정 반응 |
| CLAIM-WINDOW | 선택 성공 | "재심사 완료가 보류되었습니다. 약은 열렸지만, 기록은 닫히지 않았습니다." | 성공 비용 |
| CLAIM-WINDOW | 선택 실패/후폭풍 | "심사 재개. 복귀 기록이 보험 대기표에 붙습니다." | 실패 비용 |
| BED-LEDGER | 첫 노출 | "빈 병상: 없음. 비어 보이는 침상 3개는 재배정 대기 중." | 오브젝트 첫 문구 |
| BED-LEDGER | 인간 안정도 낮음 | "커튼이 닫힌 침상부터 번호가 새로 붙습니다." | 상태값 후폭풍 |
| BED-LEDGER | 상태 안정 | "재배정 보류. 침상 번호와 이름이 아직 합쳐지지 않았습니다." | 안정 반응 |
| BED-LEDGER | 선택 성공 | "커튼 고정핀에 보류 표시가 남아 있습니다." | 흔적 보존 |
| BED-LEDGER | 선택 실패/후폭풍 | "방금 비운 병상에 다른 번호가 들어왔습니다." | 실패 비용 |

### 6.2 R03

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| LABEL-FOREMAN | 첫 노출 | "라벨을 떼면 더 위험해져요. 틀린 라벨이어도, 없는 것보단 덜 굴러갑니다." | 라벨 오판 |
| LABEL-FOREMAN | 인간 안정도 낮음 | "사람들이 자기 이름보다 송장을 먼저 내밀어요. 그래야 벨트가 멈추니까요." | 상태값 후폭풍 |
| LABEL-FOREMAN | 상태 안정 | "오늘은 수기로 보류해도 라인이 버팁니다. 그게 이렇게 큰일일 줄은 몰랐네요." | 안정 반응 |
| LABEL-FOREMAN | 선택 성공 | "교정이 아니라 보류로 붙였습니다. 어디로 가야 하는지는 아직 쓰지 않았어요." | 보류 선택 |
| LABEL-FOREMAN | 선택 실패/후폭풍 | "라벨이 너무 깨끗합니다. 이런 건 대개 사람이 아니라 목적지만 남습니다." | 실패 비용 |
| MISROUTE-SPEAKER | 첫 노출 | "오배송 감지. 목적지를 다시 읽습니다." | 시스템 잔향 |
| MISROUTE-SPEAKER | 캠페인 농도 높음 | "목적지 재확인 중. 이전 목적지, 다음 목적지, 보관 목적지가 모두 일치합니다." | 캠페인 압력 |
| MISROUTE-SPEAKER | 상태 안정 | "분류 지연 허용. 대상은 아직 배송 완료가 아닙니다." | 안정 반응 |
| MISROUTE-SPEAKER | 선택 성공 | "경로 재계산이 보류되었습니다. 벨트가 잠시 같은 방향을 반복하지 않습니다." | 성공 반응 |
| MISROUTE-SPEAKER | 선택 실패/후폭풍 | "오배송 정정 완료. 대상은 더 정확하게 잘못 보관됩니다." | 실패 비용 |
| HOLD-CAGE | 첫 노출 | "3열 보관함. 수령 확인 없음. 보관 기한은 계속 갱신 중." | 오브젝트 첫 문구 |
| HOLD-CAGE | 보급 압력 높음 | "공간 부족. 오래 닫힌 칸부터 압축 대기열로 이동합니다." | 상태값 후폭풍 |
| HOLD-CAGE | 상태 안정 | "임시 보관 연장. 잠금은 열리지 않았지만, 폐기표도 붙지 않았습니다." | 안정 반응 |
| HOLD-CAGE | 선택 성공 | "칸 안쪽에 '아직 도착하지 않음' 표시가 남았습니다." | 흔적 보존 |
| HOLD-CAGE | 선택 실패/후폭풍 | "보관 기한이 정리되었습니다. 정리된 물건은 더 오래 못 기다립니다." | 실패 비용 |

### 6.3 R04

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| BREAKER-MARSHAL | 첫 노출 | "불을 끄면 멈춥니다. 문제는, 멈춘 쪽부터 더 빨리 버려진다는 거죠." | 차단 오판 |
| BREAKER-MARSHAL | 로봇 자율성 상승 | "자기 충전량을 스스로 말하는 장치가 늘었어요. 그래서 더 자주 끊으라는 지시가 옵니다." | 로봇 상태 |
| BREAKER-MARSHAL | 상태 안정 | "오늘은 전체 차단까지 가지 않아도 됩니다. 아직 몇 줄은 따로 끊을 수 있어요." | 안정 반응 |
| BREAKER-MARSHAL | 선택 성공 | "차단 순서를 바꿨습니다. 안전해진 게 아니라, 누가 먼저 어두워질지 늦춘 겁니다." | 성공 비용 |
| BREAKER-MARSHAL | 선택 실패/후폭풍 | "한 번에 내렸습니다. 편하죠. 그래서 늘 제일 위험합니다." | 실패 비용 |
| CHARGE-QUEUE | 첫 노출 | "현재 호출: 12번. 남은 대기표: 88번." | 오브젝트 첫 문구 |
| CHARGE-QUEUE | 보급 압력 높음 | "대기열 과밀. 충전 접근권은 낮은 잔량 순서로 재정렬됩니다." | 상태값 후폭풍 |
| CHARGE-QUEUE | 상태 안정 | "대기표 보류. 순번은 남았지만, 호출은 아직 시작되지 않았습니다." | 안정 반응 |
| CHARGE-QUEUE | 선택 성공 | "88번 표 뒷면에 이름 대신 사용량이 지워져 있습니다." | 흔적 보존 |
| CHARGE-QUEUE | 선택 실패/후폭풍 | "순번이 앞으로 당겨졌습니다. 정품 도크도 같이 열렸습니다." | 실패 비용 |
| ASH-FILTER | 첫 노출 | "필터 교체 기록: 정상. 내부 잔류물: 미분류." | 오브젝트 첫 문구 |
| ASH-FILTER | 캠페인 농도 높음 | "회색 분진이 늘수록 폐기 기준표의 글씨가 선명해집니다." | 캠페인 압력 |
| ASH-FILTER | 상태 안정 | "분진 포집 지연. 걸러진 흔적 일부가 아직 남아 있습니다." | 안정 반응 |
| ASH-FILTER | 선택 성공 | "필터 안쪽의 작은 이름표 조각을 보존했습니다." | 흔적 보존 |
| ASH-FILTER | 선택 실패/후폭풍 | "걸러낸 것은 깨끗합니다. 깨끗해서, 누가 있었는지 모릅니다." | 실패 비용 |

### 6.4 R08

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| STOREHOUSE-KEEPER | 첫 노출 | "숫자는 맞아요. 그래서 더 무섭습니다. 맞는 숫자가 부족하다는 뜻이니까요." | 재고 오판 |
| STOREHOUSE-KEEPER | 인간 안정도 낮음 | "배급표를 고치면 싸움은 늦출 수 있어요. 굶주림이 사라지는 건 아니고요." | 상태값 후폭풍 |
| STOREHOUSE-KEEPER | 상태 안정 | "오늘은 문을 끝까지 잠그지 않아도 됩니다. 그 정도면 좋은 날이죠." | 안정 반응 |
| STOREHOUSE-KEEPER | 선택 성공 | "재고표에 소모가 아니라 보류로 적었습니다. 누가 못 받은 건지는 아직 지우지 않았어요." | 성공 비용 |
| STOREHOUSE-KEEPER | 선택 실패/후폭풍 | "표는 맞았습니다. 대신 줄 끝 사람이 사라졌습니다." | 실패 비용 |
| STATION-ECHO | 첫 노출 | "도착 안내 없음. 출발 안내 없음. 플랫폼은 정상 침묵 상태입니다." | 시스템 잔향 |
| STATION-ECHO | 수신 안정도 낮음 | "신호 지연. 구조 방송과 추적 방송을 구분할 수 없습니다." | 상태값 후폭풍 |
| STATION-ECHO | 상태 안정 | "낮은 수신 유지. 회수선 보정이 끊기지 않을 정도의 잡음이 남았습니다." | 안정 반응 |
| STATION-ECHO | 선택 성공 | "무음 안내가 한 칸 늦게 갱신됩니다. 늦어서, 아직 닫히지 않았습니다." | 성공 반응 |
| STATION-ECHO | 선택 실패/후폭풍 | "완전 무음 전환. 아무도 부르지 않고, 아무도 듣지 않습니다." | 실패 비용 |
| MANUAL-BEACON | 첫 노출 | "비콘 끈을 짧게 당긴 흔적. 좌표는 일부만 남아 있습니다." | 오브젝트 첫 문구 |
| MANUAL-BEACON | 인양 안정도 낮음 | "로그 지연. 작은 신호는 캠페인도 늦게 듣고, 보급소도 늦게 듣습니다." | 상태값 후폭풍 |
| MANUAL-BEACON | 상태 안정 | "수동 비콘 흔적 보존. 큰 구조 신호로 전환되지 않았습니다." | 안정 반응 |
| MANUAL-BEACON | 선택 성공 | "짧은 좌표 조각이 남았습니다. 안전한 길은 아니지만, 찾을 수는 있습니다." | 흔적 보존 |
| MANUAL-BEACON | 선택 실패/후폭풍 | "비콘 로그가 너무 깨끗합니다. 깨끗한 침묵은 대개 늦게 발견됩니다." | 실패 비용 |

---

## 7. 이름/노출 정책

| NPC | 첫 표기 | 본명 공개 | 본명 공개 조건 | 이름 금지/보류 이유 |
|---|---|---|---|---|
| WRIST-CLERK | 접수 팔찌 담당자 | 오다은 | R02-L01/L02에서 팔찌 발급 보류 선택을 본 뒤 | 첫 노출에서 이름보다 환자 번호 압박이 먼저여야 한다 |
| CLAIM-WINDOW | 보험 재심사 창구 | 없음 | 없음 | 시스템 잔향이므로 사람 이름 금지 |
| BED-LEDGER | 병상 대장 | 없음 | 없음 | 병상 번호와 커튼이 핵심인 오브젝트 흔적 |
| LABEL-FOREMAN | 라벨 교정반장 | 나규민 | R03-L01에서 수기 보류 라벨을 남긴 뒤 | 라벨/역할명이 사람보다 먼저 읽혀야 한다 |
| MISROUTE-SPEAKER | 오배송 안내 방송 | 없음 | 없음 | MAIL-LOOP처럼 시스템 잔향이며 인간화 금지 |
| HOLD-CAGE | 미수령 보관함 3열 | 없음 | 없음 | 보관함 자체가 상태값의 얼굴이다 |
| BREAKER-MARSHAL | 차단기 감시원 | 손도겸 | R04-L01에서 전체 차단 대신 순서 변경을 선택한 뒤 | 수리공/엔지니어로 읽히지 않게 역할 우선 |
| CHARGE-QUEUE | 충전 대기표 88번 | 없음 | 없음 | 대기표와 순번 압박이 핵심이다 |
| ASH-FILTER | 회색 분진 필터 | 없음 | 없음 | 장치형 오브젝트에 사람 이름 금지 |
| STOREHOUSE-KEEPER | 저장고 기록자 | 고은재 | R08-L04에서 재고표를 소모가 아니라 보류로 남긴 뒤 | 보급소 상주 NPC처럼 보이지 않게 역할 우선 |
| STATION-ECHO | 무음 플랫폼 안내 잔향 | 없음 | 없음 | 안내 잔향이며 정식 NPC 이름 금지 |
| MANUAL-BEACON | 수동 비콘 표식대 | 없음 | 없음 | DRAIN-MARK와 혼동을 피하기 위해 사람 이름 금지 |

국적/현실 위치 규칙:

```text
1. E01 초반 인간 직접 대면 후보는 한국어권 이름을 허용한다.
2. 유저 첫 표기에는 실명 지명과 본명을 전면 노출하지 않는다.
3. 관리자 문서에는 현실 권역과 인프라 앵커를 유지한다.
4. 오브젝트/시스템 잔향은 사람 이름을 붙이지 않는다.
5. 같은 지역의 플레이어블 이름과 발음 감각이 겹치면 본명 공개를 보류한다.
```

---

## 8. 금지 방향

공통 금지:

```text
상점 NPC 만들기.
강화 NPC 만들기.
도감 NPC 만들기.
길 안내 NPC 만들기.
각 지역 12명 로스터 만들기.
모든 후보에게 본명과 감성 사연 붙이기.
플레이어블 해금 장면을 NPC 개인 퀘스트로 바꾸기.
R02/R03/R04/R08을 R01만큼 상세한 NPC 군상극으로 즉시 확장하기.
```

지역별 금지:

| 지역 | 금지 |
|---|---|
| R02 | 의사/간호사/힐러 NPC, 약국 상점, 병원 악의 조직화, 하람의 퇴원 보류 기능 대체 |
| R03 | 택배 기사, 빠른 배송 농담 캐릭터, 박스 보상 루프, MAIL-LOOP 인간판, 이루의 반송 수취인 기능 대체 |
| R04 | 엔지니어/수리공/충전 버퍼, PATCH 전용 보조, 리오 정품 복구 선공개, 전기 속성 마법화 |
| R08 | 은신/정찰 대장, 저항군 연락책, 보급소 새 상주 NPC, DRAIN-MARK 후계자, 안전한 침묵권 가이드 |

---

## 9. 다음 작업 포인터

### 9.1 NPC 트랙

바로 다음 후보:

```text
E02 첫 외부 슬라이스 NPC 예산
```

목표:

```text
E02_C03/C07/C05/C04 중 실제 시즌 슬라이스로 여는 1~3개 캠페인에 대해
핵심 NPC 5~7명, 잔향/기록 4~8개 안에서 예산을 먼저 잡는다.
이름 확정보다 부모 캠페인, 현실 권역, 직접/잔향/오브젝트 분리를 먼저 한다.
```

### 9.2 E01 후속 상세화

프로필 v0.1 우선 후보:

| 우선 | 후보 | 이유 |
|---:|---|---|
| 1 | `r02_wrist_clerk` | 하람 해금 전후 팔찌/보호자 미확인 압박을 가장 직접적으로 받친다 |
| 2 | `r03_label_foreman` | 이루 해금 전후 라벨/목적지 오판을 직접 보여준다 |
| 3 | `r08_storehouse_keeper` | 보급소 상주가 아닌 R08 외부 물자 압박을 분리해 보여준다 |
| 4 | `r04_breaker_marshal` | 유건/PATCH와 충돌하지 않는지 구현 전 한 번 더 검토가 필요하다 |

대사 은행 후속:

```text
story/03_regions/e01_support_npc_dialogue_bank_v0_1.md
```

데이터 적용 후속:

```text
story/03_regions/e01_support_npc_data_schema_application_v0_1.md
```

### 9.3 완료 기준

이 문서의 완료 기준:

1. R02/R03/R04/R08이 각 3명 후보로 제한되었다.
2. 직접 대면이 지역당 1명 이하로 제한되었다.
3. 플레이어블 4~7번의 기능을 NPC가 빼앗지 않는다.
4. 시스템/오브젝트 잔향에는 억지 사람 이름을 붙이지 않았다.
5. R01처럼 12명씩 만드는 방식이 금지되었다.
6. 다음 작업이 E02 첫 외부 슬라이스 NPC 예산으로 넘어간다.

최종 판정:

```text
통과.
E01 R02/R03/R04/R08 보조 NPC 최소안은 제작팀 전달용 기준으로 사용 가능하다.
```
