# 전역 NPC L3 이하 1차 샘플 문구 적용 티켓 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
전역 NPC L3 이하 1차 샘플 문구 240개를 실제 적용 가능한 티켓 단위로 정리한 문서.
새 문구 작성 아님.
새 NPC 생산 아님.
새 이름 생산 아님.
직접 대면 이벤트 추가 아님.
L5/L4 192개 수정 아님.
1,856개 전체 적용 아님.

판정:
조건부 적용
```

입력 문서:

```text
story/03_regions/global_npc_l3_below_text_application_standard_v0_1.md
story/03_regions/global_npc_l3_below_first_text_samples_qa_v0_1.md
story/03_regions/global_npc_l3_below_first_text_samples_v0_1.md
```

적용 잠금:

```text
티켓 총량은 240개로 유지한다.
sample_id 240개와 ticket_id 240개를 1:1로 연결한다.
새 문구를 쓰지 않는다.
새 NPC를 만들지 않는다.
새 이름을 붙이지 않는다.
직접 대면 이벤트를 추가하지 않는다.
L5/L4를 늘리지 않는다.
1,856개 전체 적용으로 확장하지 않는다.
실제 도시/기관/회사 실명을 노출하지 않는다.
```

---

## 0. 적용 티켓 요약

| 항목 | 기대값 | 실제값 | 판정 |
|---|---:|---:|---|
| 총 티켓 | 240 | 240 | 통과 |
| sample_id 연결 | 240 | 240 | 통과 |
| 새 문구 | 0 | 0 | 통과 |
| 새 NPC/새 이름/직접 대면 | 0 | 0 | 통과 |
| L5/L4 증가 | 0 | 0 | 통과 |
| 1,856개 전체 적용 | 0 | 0 | 통과 |

---

## 1. 적용 티켓 표

| ticket_id | sample_id | 캠페인 | 적용 위치 | 표현 방식 | 상태 키/플래그 | 담당 팀 | 적용 방식 | 금지선 | 판정 |
|---|---|---|---|---|---|---|---|---|---|
| `e01_l3txt_001` | `l3s_001` | E01_C01 | 조건 반응 패널 | 대사 은행 | `campaign_density` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_002` | `l3s_002` | E01_C03 | 조건 반응 패널 | 대사 은행 | `trace_retained` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_003` | `l3s_003` | E01_C05 | 조건 반응 패널 | 대사 은행 | `broadcast_trust` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_004` | `l3s_004` | E01_C08 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e02_l3txt_001` | `l3s_005` | E02_C01 | 조건 반응 패널 | 대사 은행 | `identity_mismatch` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_002` | `l3s_006` | E02_C02 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_003` | `l3s_007` | E02_C03 | 조건 반응 패널 | 대사 은행 | `trace_retained` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_004` | `l3s_008` | E02_C04 | 조건 반응 패널 | 대사 은행 | `quarantine_delay` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_005` | `l3s_009` | E02_C05 | 조건 반응 패널 | 대사 은행 | `broadcast_trust` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_006` | `l3s_010` | E02_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_007` | `l3s_011` | E02_C08 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e03_l3txt_001` | `l3s_012` | E03_C01 | 조건 반응 패널 | 대사 은행 | `identity_mismatch` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_002` | `l3s_013` | E03_C03 | 조건 반응 패널 | 대사 은행 | `return_loop` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_003` | `l3s_014` | E03_C04 | 조건 반응 패널 | 대사 은행 | `robot_autonomy` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_004` | `l3s_015` | E03_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_001` | `l3s_016` | E04_C01 | 조건 반응 패널 | 대사 은행 | `campaign_density` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_002` | `l3s_017` | E04_C03 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_003` | `l3s_018` | E04_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_004` | `l3s_019` | E04_C08 | 조건 반응 패널 | 대사 은행 | `human_stability` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_001` | `l3s_020` | E05_C02 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_002` | `l3s_021` | E05_C03 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_003` | `l3s_022` | E05_C06 | 조건 반응 패널 | 대사 은행 | `identity_mismatch` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_004` | `l3s_023` | E05_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_001` | `l3s_024` | E06_C01 | 조건 반응 패널 | 대사 은행 | `human_stability` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_002` | `l3s_025` | E06_C04 | 조건 반응 패널 | 대사 은행 | `robot_autonomy` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_003` | `l3s_026` | E06_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_004` | `l3s_027` | E06_C08 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_001` | `l3s_028` | E07_C02 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_002` | `l3s_029` | E07_C03 | 조건 반응 패널 | 대사 은행 | `identity_mismatch` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_003` | `l3s_030` | E07_C06 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_004` | `l3s_031` | E07_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_001` | `l3s_032` | E08_C01 | 조건 반응 패널 | 대사 은행 | `quarantine_delay` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_002` | `l3s_033` | E08_C03 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_003` | `l3s_034` | E08_C05 | 조건 반응 패널 | 대사 은행 | `campaign_density` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_004` | `l3s_035` | E08_C08 | 조건 반응 패널 | 대사 은행 | `quarantine_delay` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_001` | `l3s_036` | E09_C02 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_002` | `l3s_037` | E09_C03 | 조건 반응 패널 | 대사 은행 | `trace_spent` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_003` | `l3s_038` | E09_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_004` | `l3s_039` | E09_C08 | 조건 반응 패널 | 대사 은행 | `campaign_density` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_001` | `l3s_040` | E10_C03 | 조건 반응 패널 | 대사 은행 | `robot_autonomy` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_002` | `l3s_041` | E10_C04 | 조건 반응 패널 | 대사 은행 | `return_loop` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_003` | `l3s_042` | E10_C06 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_004` | `l3s_043` | E10_C07 | 조건 반응 패널 | 대사 은행 | `route_access` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_001` | `l3s_044` | E11_C02 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_002` | `l3s_045` | E11_C03 | 조건 반응 패널 | 대사 은행 | `trace_retained` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_003` | `l3s_046` | E11_C06 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_004` | `l3s_047` | E11_C08 | 조건 반응 패널 | 대사 은행 | `campaign_density` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_001` | `l3s_048` | E12_C02 | 조건 반응 패널 | 대사 은행 | `human_stability` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_002` | `l3s_049` | E12_C03 | 조건 반응 패널 | 대사 은행 | `payment_failure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_003` | `l3s_050` | E12_C07 | 조건 반응 패널 | 대사 은행 | `trace_retained` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_004` | `l3s_051` | E12_C08 | 조건 반응 패널 | 대사 은행 | `supply_pressure` / `flag_l3_sample_visible` | 스토리 | 상태 반응 은행 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `cross_l3txt_001` | `l3s_052` | cross_region | 단말 로그 | 로그 | `identity_mismatch` / `flag_cross_region_echo_hold` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `e01_l3txt_005` | `l2s_001` | E01_C01 | 환경 잔향 트리거 | 잔향 | `trace_retained` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_006` | `l2s_002` | E01_C03 | 환경 잔향 트리거 | 잔향 | `return_loop` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_007` | `l2s_003` | E01_C05 | 환경 잔향 트리거 | 잔향 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_008` | `l2s_004` | E01_C06 | 환경 잔향 트리거 | 잔향 | `payment_failure` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_009` | `l2s_005` | E01_C07 | 환경 잔향 트리거 | 잔향 | `route_access` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_010` | `l2s_006` | E01_C08 | 환경 잔향 트리거 | 잔향 | `supply_pressure` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e02_l3txt_008` | `l2s_007` | E02_C01 | 흔적 오브젝트 | 오브젝트 | `identity_mismatch` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_009` | `l2s_008` | E02_C02 | 흔적 오브젝트 | 오브젝트 | `quarantine_delay` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_010` | `l2s_009` | E02_C03 | 흔적 오브젝트 | 오브젝트 | `trace_retained` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_011` | `l2s_010` | E02_C04 | 흔적 오브젝트 | 오브젝트 | `robot_autonomy` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_012` | `l2s_011` | E02_C05 | 흔적 오브젝트 | 오브젝트 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_013` | `l2s_012` | E02_C06 | 흔적 오브젝트 | 오브젝트 | `payment_failure` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_014` | `l2s_013` | E02_C07 | 흔적 오브젝트 | 오브젝트 | `route_access` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_015` | `l2s_014` | E02_C08 | 흔적 오브젝트 | 오브젝트 | `supply_pressure` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_016` | `l2s_015` | E02_C01 | 흔적 오브젝트 | 오브젝트 | `identity_mismatch` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_017` | `l2s_016` | E02_C03 | 흔적 오브젝트 | 오브젝트 | `trace_spent` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_018` | `l2s_017` | E02_C05 | 흔적 오브젝트 | 오브젝트 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_019` | `l2s_018` | E02_C07 | 흔적 오브젝트 | 오브젝트 | `route_access` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e03_l3txt_005` | `l2s_019` | E03_C01 | 단말 로그 | 로그 | `identity_mismatch` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_006` | `l2s_020` | E03_C03 | 단말 로그 | 로그 | `return_loop` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_007` | `l2s_021` | E03_C04 | 단말 로그 | 로그 | `robot_autonomy` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_008` | `l2s_022` | E03_C05 | 단말 로그 | 로그 | `broadcast_trust` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_009` | `l2s_023` | E03_C07 | 단말 로그 | 로그 | `route_access` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_010` | `l2s_024` | E03_C08 | 단말 로그 | 로그 | `supply_pressure` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_005` | `l2s_025` | E04_C01 | 환경 잔향 트리거 | 잔향 | `campaign_density` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_006` | `l2s_026` | E04_C03 | 환경 잔향 트리거 | 잔향 | `supply_pressure` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_007` | `l2s_027` | E04_C04 | 환경 잔향 트리거 | 잔향 | `robot_autonomy` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_008` | `l2s_028` | E04_C05 | 환경 잔향 트리거 | 잔향 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_009` | `l2s_029` | E04_C07 | 환경 잔향 트리거 | 잔향 | `route_access` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_010` | `l2s_030` | E04_C08 | 환경 잔향 트리거 | 잔향 | `human_stability` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_005` | `l2s_031` | E05_C01 | 영수증 오브젝트 | 영수증 | `supply_pressure` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_006` | `l2s_032` | E05_C02 | 영수증 오브젝트 | 영수증 | `payment_failure` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_007` | `l2s_033` | E05_C03 | 영수증 오브젝트 | 영수증 | `return_loop` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_008` | `l2s_034` | E05_C06 | 영수증 오브젝트 | 영수증 | `payment_failure` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_009` | `l2s_035` | E05_C07 | 영수증 오브젝트 | 영수증 | `route_access` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_010` | `l2s_036` | E05_C08 | 영수증 오브젝트 | 영수증 | `supply_pressure` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_005` | `l2s_037` | E06_C01 | 자동 안내 음성 | 자동 음성 | `human_stability` / `flag_l2_object_trace_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_006` | `l2s_038` | E06_C02 | 자동 안내 음성 | 자동 음성 | `supply_pressure` / `flag_l2_object_trace_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_007` | `l2s_039` | E06_C04 | 자동 안내 음성 | 자동 음성 | `robot_autonomy` / `flag_l2_object_trace_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_008` | `l2s_040` | E06_C05 | 자동 안내 음성 | 자동 음성 | `identity_mismatch` / `flag_l2_object_trace_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_009` | `l2s_041` | E06_C07 | 자동 안내 음성 | 자동 음성 | `route_access` / `flag_l2_object_trace_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_010` | `l2s_042` | E06_C08 | 자동 안내 음성 | 자동 음성 | `campaign_density` / `flag_l2_object_trace_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_005` | `l2s_043` | E07_C01 | 단말 로그 | 로그 | `identity_mismatch` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_006` | `l2s_044` | E07_C02 | 단말 로그 | 로그 | `payment_failure` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_007` | `l2s_045` | E07_C03 | 단말 로그 | 로그 | `return_loop` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_008` | `l2s_046` | E07_C05 | 단말 로그 | 로그 | `broadcast_trust` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_009` | `l2s_047` | E07_C07 | 단말 로그 | 로그 | `route_access` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_010` | `l2s_048` | E07_C08 | 단말 로그 | 로그 | `supply_pressure` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_005` | `l2s_049` | E08_C01 | 레벨 표지/라벨 | 표지 | `quarantine_delay` / `flag_l2_object_trace_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_006` | `l2s_050` | E08_C02 | 레벨 표지/라벨 | 표지 | `human_stability` / `flag_l2_object_trace_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_007` | `l2s_051` | E08_C03 | 레벨 표지/라벨 | 표지 | `route_access` / `flag_l2_object_trace_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_008` | `l2s_052` | E08_C05 | 레벨 표지/라벨 | 표지 | `broadcast_trust` / `flag_l2_object_trace_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_009` | `l2s_053` | E08_C07 | 레벨 표지/라벨 | 표지 | `quarantine_delay` / `flag_l2_object_trace_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_010` | `l2s_054` | E08_C08 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l2_object_trace_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_005` | `l2s_055` | E09_C01 | 영수증 오브젝트 | 영수증 | `identity_mismatch` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_006` | `l2s_056` | E09_C02 | 영수증 오브젝트 | 영수증 | `payment_failure` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_007` | `l2s_057` | E09_C03 | 영수증 오브젝트 | 영수증 | `return_loop` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_008` | `l2s_058` | E09_C05 | 영수증 오브젝트 | 영수증 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_009` | `l2s_059` | E09_C06 | 영수증 오브젝트 | 영수증 | `supply_pressure` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_010` | `l2s_060` | E09_C07 | 영수증 오브젝트 | 영수증 | `route_access` / `flag_l2_object_trace_visible` | 오브젝트 | 읽기 가능한 소형 오브젝트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_005` | `l2s_061` | E10_C01 | 흔적 오브젝트 | 오브젝트 | `identity_mismatch` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_006` | `l2s_062` | E10_C03 | 흔적 오브젝트 | 오브젝트 | `robot_autonomy` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_007` | `l2s_063` | E10_C04 | 흔적 오브젝트 | 오브젝트 | `return_loop` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_008` | `l2s_064` | E10_C05 | 흔적 오브젝트 | 오브젝트 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_009` | `l2s_065` | E10_C06 | 흔적 오브젝트 | 오브젝트 | `payment_failure` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_010` | `l2s_066` | E10_C07 | 흔적 오브젝트 | 오브젝트 | `route_access` / `flag_l2_object_trace_visible` | 오브젝트 | 오브젝트 텍스트 슬롯 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_005` | `l2s_067` | E11_C01 | 단말 로그 | 로그 | `campaign_density` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_006` | `l2s_068` | E11_C02 | 단말 로그 | 로그 | `payment_failure` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_007` | `l2s_069` | E11_C03 | 단말 로그 | 로그 | `trace_retained` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_008` | `l2s_070` | E11_C05 | 단말 로그 | 로그 | `broadcast_trust` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_009` | `l2s_071` | E11_C07 | 단말 로그 | 로그 | `route_access` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_010` | `l2s_072` | E11_C08 | 단말 로그 | 로그 | `supply_pressure` / `flag_l2_object_trace_visible` | UI | 짧은 로그 엔트리 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_005` | `l2s_073` | E12_C01 | 환경 잔향 트리거 | 잔향 | `human_stability` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_006` | `l2s_074` | E12_C02 | 환경 잔향 트리거 | 잔향 | `payment_failure` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_007` | `l2s_075` | E12_C03 | 환경 잔향 트리거 | 잔향 | `supply_pressure` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_008` | `l2s_076` | E12_C05 | 환경 잔향 트리거 | 잔향 | `broadcast_trust` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_009` | `l2s_077` | E12_C07 | 환경 잔향 트리거 | 잔향 | `route_access` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_010` | `l2s_078` | E12_C08 | 환경 잔향 트리거 | 잔향 | `payment_failure` / `flag_l2_object_trace_visible` | 오디오 | 짧은 음성/환경음 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `cross_l3txt_002` | `l2s_079` | cross_region | 자동 안내 음성 | 자동 음성 | `campaign_density` / `flag_cross_region_echo_hold` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_003` | `l2s_080` | cross_region | 자동 안내 음성 | 자동 음성 | `quarantine_delay` / `flag_cross_region_echo_hold` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_004` | `l2s_081` | cross_region | 자동 안내 음성 | 자동 음성 | `broadcast_trust` / `flag_cross_region_echo_hold` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_005` | `l2s_082` | cross_region | 자동 안내 음성 | 자동 음성 | `identity_mismatch` / `flag_cross_region_echo_hold` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `e01_l3txt_011` | `l1s_001` | E01_C01 | 호출번호 UI | 호출번호 | `identity_mismatch` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_012` | `l1s_002` | E01_C03 | 호출번호 UI | 호출번호 | `return_loop` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_013` | `l1s_003` | E01_C07 | 호출번호 UI | 호출번호 | `route_access` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_014` | `l1s_004` | E01_C08 | 호출번호 UI | 호출번호 | `supply_pressure` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e02_l3txt_020` | `l1s_005` | E02_C01 | 목록 UI | 목록 | `identity_mismatch` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_021` | `l1s_006` | E02_C02 | 목록 UI | 목록 | `quarantine_delay` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_022` | `l1s_007` | E02_C03 | 목록 UI | 목록 | `trace_retained` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_023` | `l1s_008` | E02_C04 | 목록 UI | 목록 | `robot_autonomy` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_024` | `l1s_009` | E02_C05 | 목록 UI | 목록 | `broadcast_trust` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_025` | `l1s_010` | E02_C06 | 목록 UI | 목록 | `payment_failure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_026` | `l1s_011` | E02_C07 | 목록 UI | 목록 | `route_access` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_027` | `l1s_012` | E02_C08 | 목록 UI | 목록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e03_l3txt_011` | `l1s_013` | E03_C01 | 대기열 기록 UI | 대기열 기록 | `identity_mismatch` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_012` | `l1s_014` | E03_C03 | 대기열 기록 UI | 대기열 기록 | `return_loop` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_013` | `l1s_015` | E03_C07 | 대기열 기록 UI | 대기열 기록 | `route_access` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_014` | `l1s_016` | E03_C08 | 대기열 기록 UI | 대기열 기록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_011` | `l1s_017` | E04_C01 | 대기열 기록 UI | 대기열 기록 | `campaign_density` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_012` | `l1s_018` | E04_C03 | 대기열 기록 UI | 대기열 기록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_013` | `l1s_019` | E04_C07 | 대기열 기록 UI | 대기열 기록 | `route_access` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_014` | `l1s_020` | E04_C08 | 대기열 기록 UI | 대기열 기록 | `human_stability` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_011` | `l1s_021` | E05_C02 | 목록 UI | 목록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_012` | `l1s_022` | E05_C03 | 목록 UI | 목록 | `payment_failure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_013` | `l1s_023` | E05_C06 | 목록 UI | 목록 | `route_access` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_014` | `l1s_024` | E05_C08 | 목록 UI | 목록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_011` | `l1s_025` | E06_C01 | 호출번호 UI | 호출번호 | `human_stability` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_012` | `l1s_026` | E06_C04 | 호출번호 UI | 호출번호 | `robot_autonomy` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_013` | `l1s_027` | E06_C07 | 호출번호 UI | 호출번호 | `route_access` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_014` | `l1s_028` | E06_C08 | 호출번호 UI | 호출번호 | `supply_pressure` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_011` | `l1s_029` | E07_C02 | 목록 UI | 목록 | `payment_failure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_012` | `l1s_030` | E07_C03 | 목록 UI | 목록 | `identity_mismatch` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_013` | `l1s_031` | E07_C07 | 목록 UI | 목록 | `route_access` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_014` | `l1s_032` | E07_C08 | 목록 UI | 목록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_011` | `l1s_033` | E08_C01 | 호출번호 UI | 호출번호 | `quarantine_delay` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_012` | `l1s_034` | E08_C03 | 호출번호 UI | 호출번호 | `route_access` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_013` | `l1s_035` | E08_C05 | 호출번호 UI | 호출번호 | `broadcast_trust` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_014` | `l1s_036` | E08_C08 | 호출번호 UI | 호출번호 | `supply_pressure` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_011` | `l1s_037` | E09_C02 | 대기열 기록 UI | 대기열 기록 | `payment_failure` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_012` | `l1s_038` | E09_C03 | 대기열 기록 UI | 대기열 기록 | `return_loop` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_013` | `l1s_039` | E09_C07 | 대기열 기록 UI | 대기열 기록 | `route_access` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_014` | `l1s_040` | E09_C08 | 대기열 기록 UI | 대기열 기록 | `campaign_density` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_011` | `l1s_041` | E10_C03 | 호출번호 UI | 호출번호 | `robot_autonomy` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_012` | `l1s_042` | E10_C04 | 호출번호 UI | 호출번호 | `return_loop` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_013` | `l1s_043` | E10_C06 | 호출번호 UI | 호출번호 | `payment_failure` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_014` | `l1s_044` | E10_C07 | 호출번호 UI | 호출번호 | `route_access` / `flag_l1_registry_visible` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_011` | `l1s_045` | E11_C02 | 목록 UI | 목록 | `payment_failure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_012` | `l1s_046` | E11_C03 | 목록 UI | 목록 | `trace_retained` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_013` | `l1s_047` | E11_C07 | 목록 UI | 목록 | `route_access` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_014` | `l1s_048` | E11_C08 | 목록 UI | 목록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 목록 행 텍스트 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_011` | `l1s_049` | E12_C02 | 대기열 기록 UI | 대기열 기록 | `payment_failure` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_012` | `l1s_050` | E12_C03 | 대기열 기록 UI | 대기열 기록 | `supply_pressure` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_013` | `l1s_051` | E12_C07 | 대기열 기록 UI | 대기열 기록 | `route_access` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_014` | `l1s_052` | E12_C08 | 대기열 기록 UI | 대기열 기록 | `trace_retained` / `flag_l1_registry_visible` | UI | 큐 기록 UI 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `cross_l3txt_006` | `l1s_053` | cross_region | 호출번호 UI | 호출번호 | `identity_mismatch` / `flag_cross_region_echo_hold` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_007` | `l1s_054` | cross_region | 호출번호 UI | 호출번호 | `quarantine_delay` / `flag_cross_region_echo_hold` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_008` | `l1s_055` | cross_region | 호출번호 UI | 호출번호 | `broadcast_trust` / `flag_cross_region_echo_hold` | UI | 번호표/게이트 화면 연결 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `e01_l3txt_015` | `l0s_001` | E01_C01 | 레벨 표지/라벨 | 표지 | `identity_mismatch` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e01_l3txt_016` | `l0s_002` | E01_C08 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e02_l3txt_028` | `l0s_003` | E02_C01 | 자동 안내 음성 | 자동 음성 | `identity_mismatch` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_029` | `l0s_004` | E02_C02 | 자동 안내 음성 | 자동 음성 | `quarantine_delay` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_030` | `l0s_005` | E02_C04 | 자동 안내 음성 | 자동 음성 | `robot_autonomy` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_031` | `l0s_006` | E02_C07 | 자동 안내 음성 | 자동 음성 | `route_access` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e02_l3txt_032` | `l0s_007` | E02_C08 | 자동 안내 음성 | 자동 음성 | `supply_pressure` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 적용 가능 |
| `e03_l3txt_015` | `l0s_008` | E03_C01 | 레벨 표지/라벨 | 표지 | `identity_mismatch` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_016` | `l0s_009` | E03_C03 | 레벨 표지/라벨 | 표지 | `return_loop` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_017` | `l0s_010` | E03_C04 | 레벨 표지/라벨 | 표지 | `robot_autonomy` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e03_l3txt_018` | `l0s_011` | E03_C08 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_015` | `l0s_012` | E04_C01 | 자동 안내 음성 | 자동 음성 | `campaign_density` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_016` | `l0s_013` | E04_C03 | 자동 안내 음성 | 자동 음성 | `supply_pressure` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_017` | `l0s_014` | E04_C07 | 자동 안내 음성 | 자동 음성 | `route_access` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e04_l3txt_018` | `l0s_015` | E04_C08 | 자동 안내 음성 | 자동 음성 | `human_stability` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_015` | `l0s_016` | E05_C02 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_016` | `l0s_017` | E05_C03 | 레벨 표지/라벨 | 표지 | `payment_failure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_017` | `l0s_018` | E05_C07 | 레벨 표지/라벨 | 표지 | `route_access` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e05_l3txt_018` | `l0s_019` | E05_C08 | 레벨 표지/라벨 | 표지 | `payment_failure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_015` | `l0s_020` | E06_C01 | 레벨 표지/라벨 | 표지 | `human_stability` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_016` | `l0s_021` | E06_C04 | 레벨 표지/라벨 | 표지 | `robot_autonomy` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_017` | `l0s_022` | E06_C07 | 레벨 표지/라벨 | 표지 | `route_access` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e06_l3txt_018` | `l0s_023` | E06_C08 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_015` | `l0s_024` | E07_C02 | 자동 안내 음성 | 자동 음성 | `payment_failure` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_016` | `l0s_025` | E07_C03 | 자동 안내 음성 | 자동 음성 | `identity_mismatch` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_017` | `l0s_026` | E07_C07 | 자동 안내 음성 | 자동 음성 | `route_access` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e07_l3txt_018` | `l0s_027` | E07_C08 | 자동 안내 음성 | 자동 음성 | `supply_pressure` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_015` | `l0s_028` | E08_C01 | 자동 안내 음성 | 자동 음성 | `quarantine_delay` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_016` | `l0s_029` | E08_C03 | 자동 안내 음성 | 자동 음성 | `route_access` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_017` | `l0s_030` | E08_C05 | 자동 안내 음성 | 자동 음성 | `broadcast_trust` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e08_l3txt_018` | `l0s_031` | E08_C08 | 자동 안내 음성 | 자동 음성 | `supply_pressure` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_015` | `l0s_032` | E09_C02 | 레벨 표지/라벨 | 표지 | `payment_failure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_016` | `l0s_033` | E09_C03 | 레벨 표지/라벨 | 표지 | `return_loop` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_017` | `l0s_034` | E09_C07 | 레벨 표지/라벨 | 표지 | `route_access` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e09_l3txt_018` | `l0s_035` | E09_C08 | 레벨 표지/라벨 | 표지 | `campaign_density` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_015` | `l0s_036` | E10_C03 | 자동 안내 음성 | 자동 음성 | `robot_autonomy` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_016` | `l0s_037` | E10_C04 | 자동 안내 음성 | 자동 음성 | `return_loop` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_017` | `l0s_038` | E10_C06 | 자동 안내 음성 | 자동 음성 | `payment_failure` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e10_l3txt_018` | `l0s_039` | E10_C07 | 자동 안내 음성 | 자동 음성 | `route_access` / `flag_l0_background_text_visible` | 오디오 | 반복 음성/자막 트리거 연결 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_015` | `l0s_040` | E11_C02 | 레벨 표지/라벨 | 표지 | `payment_failure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_016` | `l0s_041` | E11_C03 | 레벨 표지/라벨 | 표지 | `trace_retained` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_017` | `l0s_042` | E11_C07 | 레벨 표지/라벨 | 표지 | `route_access` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e11_l3txt_018` | `l0s_043` | E11_C08 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_015` | `l0s_044` | E12_C02 | 레벨 표지/라벨 | 표지 | `human_stability` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_016` | `l0s_045` | E12_C03 | 레벨 표지/라벨 | 표지 | `payment_failure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_017` | `l0s_046` | E12_C07 | 레벨 표지/라벨 | 표지 | `route_access` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `e12_l3txt_018` | `l0s_047` | E12_C08 | 레벨 표지/라벨 | 표지 | `supply_pressure` / `flag_l0_background_text_visible` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 조건부 적용 |
| `cross_l3txt_009` | `l0s_048` | cross_region | 레벨 표지/라벨 | 표지 | `broadcast_trust` / `flag_cross_region_echo_hold` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_010` | `l0s_049` | cross_region | 레벨 표지/라벨 | 표지 | `identity_mismatch` / `flag_cross_region_echo_hold` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_011` | `l0s_050` | cross_region | 레벨 표지/라벨 | 표지 | `quarantine_delay` / `flag_cross_region_echo_hold` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |
| `cross_l3txt_012` | `l0s_051` | cross_region | 레벨 표지/라벨 | 표지 | `campaign_density` / `flag_cross_region_echo_hold` | 레벨 | 배경 표지 텍스트 배치 | 새 NPC/이름/대면/L5-L4 금지 | 보류 |

---

## 2. 캠페인별 티켓 검산

| 캠페인 | 기대값 | 실제값 | ticket_id 범위 | 판정 |
|---|---:|---:|---|---|
| E01 | 16 | 16 | `e01_l3txt_001~e01_l3txt_016` | 통과 |
| E02 | 32 | 32 | `e02_l3txt_001~e02_l3txt_032` | 통과 |
| E03 | 18 | 18 | `e03_l3txt_001~e03_l3txt_018` | 통과 |
| E04 | 18 | 18 | `e04_l3txt_001~e04_l3txt_018` | 통과 |
| E05 | 18 | 18 | `e05_l3txt_001~e05_l3txt_018` | 통과 |
| E06 | 18 | 18 | `e06_l3txt_001~e06_l3txt_018` | 통과 |
| E07 | 18 | 18 | `e07_l3txt_001~e07_l3txt_018` | 통과 |
| E08 | 18 | 18 | `e08_l3txt_001~e08_l3txt_018` | 통과 |
| E09 | 18 | 18 | `e09_l3txt_001~e09_l3txt_018` | 통과 |
| E10 | 18 | 18 | `e10_l3txt_001~e10_l3txt_018` | 통과 |
| E11 | 18 | 18 | `e11_l3txt_001~e11_l3txt_018` | 통과 |
| E12 | 18 | 18 | `e12_l3txt_001~e12_l3txt_018` | 통과 |
| cross_region | 12 | 12 | `cross_l3txt_001~cross_l3txt_012` | 통과 |
| 합계 | 240 | 240 | 전체 | 통과 |

---

## 3. 다음 작업 포인터

전역 NPC L3 이하 1차 적용 티켓 엔진/레벨 핸드오프 기준 작성

최종 판정:

```text
조건부 적용.
240개 샘플 문구를 240개 적용 티켓으로 1:1 연결했다.
새 문구, 새 NPC, 새 이름, 직접 대면 이벤트를 추가하지 않았다.
L5/L4 192개는 건드리지 않았다.
1,856개 전체 적용으로 확장하지 않았다.
후속 QA에서 240개 ticket_id와 240개 sample_id의 1:1 연결, 캠페인별 수량, 허용값을 검수했다.
다음 작업은 적용 티켓 엔진/레벨 핸드오프 기준 작성이다.
```
