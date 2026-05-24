# 전역 NPC L3 이하 잔향/오브젝트 은행 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
전역 NPC 통과 슬롯 중 L3 이하 1,856개를 직접 대면 NPC가 아닌 은행형 월드 반응 슬롯으로 정리하는 문서.
새 NPC 생산 아님.
E01 한국권 NPC 추가 생산 아님.
L5/L4 192개 후보 수정 아님.
직접 대면 NPC 수 증가 아님.
E02 이후 한국어 이름 기본값 사용 아님.

판정:
통과
```

입력 문서:

```text
story/03_regions/global_npc_passed_slot_registry_v0_1.md
story/03_regions/global_npc_review_report_v0_1.md
story/03_regions/global_npc_2048_pre_review_wave_v0_1.md
story/03_regions/global_npc_full_scale_target_ladder_v0_1.md
```

수량 잠금:

```text
총 L3 이하 슬롯은 1,856개로 유지한다.
L5/L4 192개는 이 문서에서 건드리지 않는다.
E01은 전체 120개 고정이며 추가 생산하지 않는다.
E02 이후 한국어 이름 기본값을 쓰지 않는다.
직접 대면 NPC 수를 늘리지 않는다.
```

`slot_id` 끝의 세 자리 숫자는 해당 은행 묶음의 슬롯 수량이다.

---

## 0. 은행 요약

| 계층 | 수량 | 처리 | 판정 |
|---|---:|---|---|
| L3 기능/상태 반응 | 413 | 대사 은행, 로그 | 이름 제거 |
| L2 잔향/로그/오브젝트 | 642 | 잔향, 오브젝트, 자동 음성, 영수증, 표지 | 잔향화 |
| L1 배경/목록/호출 번호 | 446 | 호출번호, 목록, 대기열 기록 | 오브젝트화 |
| L0 제도 흔적/자동 문구 | 355 | 자동 음성, 표지, 안내문성 문구 | 오브젝트화 |
| 합계 | 1,856 | 직접 대면 없음 | 통과 |

지역별 잠금:

| 권역 | L3 이하 수량 | 처리 |
|---|---:|---|
| E01 | 100 | 기존 E01 은행 유지. 추가 생산 없음 |
| E02 | 172 | 일본권/이주권 은행화 |
| E03~E12 | 1,540 | 권역당 154개 은행화 |
| cross_region | 44 | 스포일러 잔향/자동 문구 보류 |
| 합계 | 1,856 | 통과 |

---

## 1. L3 이하 은행 표

| slot_id | 캠페인 | 계층 | 표현 방식 | 이름 사용 여부 | 오브젝트/잔향 표기 | 상태 키 | 작은 결말 연결 | 판정 |
|---|---|---|---|---|---|---|---|---|
| `bank_E01_l3_dialogue_024` | E01_C01~C08 | L3 | 대사 은행 | 본명 추가 없음 | E01 기존 상태 반응 대사 묶음 | `campaign_density`, `human_stability` | 보급소 귀환 후 믿음 흔들림 | 이름 제거 |
| `bank_E01_l2_echo_034` | E01_C01~C08 | L2 | 잔향 | 본명 추가 없음 | 현관 호출음, 반품 알림, 수신탑 잡음 | `trace_retained`, `broadcast_trust` | 돌아온 집이 안전지대가 아니었음 | 잔향화 |
| `bank_E01_l1_call_024` | E01_C01~C08 | L1 | 호출번호 | 본명 추가 없음 | 접수번호, 탑승번호, 대기표 | `route_access`, `supply_pressure` | 구조 순번이 구조를 보장하지 않음 | 오브젝트화 |
| `bank_E01_l0_sign_018` | E01_C01~C08 | L0 | 표지 | 이름 없음 | 안내판, 라벨, 빈칸, 폐쇄 문구 | `campaign_density` | 자동 문구가 사람보다 오래 남음 | 오브젝트화 |
| `bank_E02_l3_dialogue_040` | E02_C01~C08 | L3 | 대사 은행 | 이름 없음 | 일본권 등록/통행/방송 반응 대사 | `identity_mismatch`, `route_access` | 통과 실패가 오히려 생존 경로가 됨 | 이름 제거 |
| `bank_E02_l2_object_060` | E02_C01~C08 | L2 | 오브젝트 | 이름 없음 | 사물함 표식, 검역 스티커, 수신 단말 | `trace_spent`, `quarantine_delay` | 보관된 물건이 주인을 대신함 | 오브젝트화 |
| `bank_E02_l1_list_042` | E02_C01~C08 | L1 | 목록 | 이름 없음 | 탑승 명단, 예약 목록, 청취 확인 목록 | `broadcast_trust`, `route_access` | 명단에 없는 쪽이 살아남음 | 오브젝트화 |
| `bank_E02_l0_auto_voice_030` | E02_C01~C08 | L0 | 자동 음성 | 이름 없음 | 자동 환승 안내, 재시도 음성, 폐쇄 안내 | `robot_autonomy`, `campaign_density` | 안내가 끝나도 문은 열리지 않음 | 잔향화 |
| `bank_E03_l3_dialogue_034` | E03_C01~C08 | L3 | 대사 은행 | 이름 없음 | 항만 접수, 플랫폼 반려, 제조 라인 반응 | `return_loop`, `identity_mismatch` | 반품 화물이 원래 주소를 드러냄 | 이름 제거 |
| `bank_E03_l2_log_054` | E03_C01~C08 | L2 | 로그 | 이름 없음 | 선적 로그, 제조 로그, 플랫폼 접수 실패 | `return_loop`, `trace_retained` | 실패 기록이 진짜 배송 경로가 됨 | 오브젝트화 |
| `bank_E03_l1_queue_037` | E03_C01~C08 | L1 | 대기열 기록 | 이름 없음 | 창고 대기열, 컨테이너 호출열 | `supply_pressure`, `route_access` | 순번이 밀릴수록 진실에 가까워짐 | 오브젝트화 |
| `bank_E03_l0_sign_029` | E03_C01~C08 | L0 | 표지 | 이름 없음 | 컨테이너 라벨, 반입 금지 표지 | `campaign_density` | 경고 표지가 마지막 증언이 됨 | 오브젝트화 |
| `bank_E04_l3_dialogue_034` | E04_C01~C08 | L3 | 대사 은행 | 이름 없음 | 침수 주거, 페리, 고지대 보급 반응 | `supply_pressure`, `route_access` | 고지대 표식이 구조 기준을 뒤집음 | 이름 제거 |
| `bank_E04_l2_echo_054` | E04_C01~C08 | L2 | 잔향 | 이름 없음 | 페리 방송, 배달선 무전, 물 차는 복도 소리 | `human_stability`, `campaign_density` | 물에 잠긴 안내가 계속 반복됨 | 잔향화 |
| `bank_E04_l1_queue_037` | E04_C01~C08 | L1 | 대기열 기록 | 이름 없음 | 선착장 대기열, 고지대 진입 순번 | `route_access`, `supply_pressure` | 줄의 끝이 피난처가 아님 | 오브젝트화 |
| `bank_E04_l0_auto_voice_029` | E04_C01~C08 | L0 | 자동 음성 | 이름 없음 | 침수 안내, 배수 실패 안내 | `campaign_density` | 자동 안내만 수면 위에 남음 | 잔향화 |
| `bank_E05_l3_dialogue_034` | E05_C01~C08 | L3 | 대사 은행 | 이름 없음 | 철도, 급수, 모바일 결제 상태 반응 | `payment_failure`, `supply_pressure` | 결제 실패가 물표를 남김 | 이름 제거 |
| `bank_E05_l2_receipt_054` | E05_C01~C08 | L2 | 영수증 | 이름 없음 | 모바일 결제 실패 영수증, 급수권 영수증 | `payment_failure`, `trace_retained` | 영수증이 구조권보다 오래 남음 | 오브젝트화 |
| `bank_E05_l1_list_037` | E05_C01~C08 | L1 | 목록 | 이름 없음 | 급수 명단, 열차 예약 목록 | `route_access`, `supply_pressure` | 예약된 자리가 비어 있음 | 오브젝트화 |
| `bank_E05_l0_sign_029` | E05_C01~C08 | L0 | 표지 | 이름 없음 | 급수 제한 표지, 플랫폼 폐쇄 문구 | `campaign_density` | 닫힌 플랫폼이 대피로가 됨 | 오브젝트화 |
| `bank_E06_l3_dialogue_034` | E06_C01~C08 | L3 | 대사 은행 | 이름 없음 | 냉방, 에너지, 노동 숙소 상태 반응 | `human_stability`, `supply_pressure` | 냉방 배정표가 생존 계층을 드러냄 | 이름 제거 |
| `bank_E06_l2_auto_voice_054` | E06_C01~C08 | L2 | 자동 음성 | 이름 없음 | 냉방 제한 안내, 공항 대기 방송 | `campaign_density`, `route_access` | 자동 음성이 피난 시간을 지움 | 잔향화 |
| `bank_E06_l1_call_037` | E06_C01~C08 | L1 | 호출번호 | 이름 없음 | 숙소 호출번호, 탑승 게이트 번호 | `identity_mismatch`, `route_access` | 호출된 번호의 사람이 없음 | 오브젝트화 |
| `bank_E06_l0_sign_029` | E06_C01~C08 | L0 | 표지 | 이름 없음 | 냉방 구역 라벨, 물 배급 표지 | `supply_pressure` | 라벨이 생존 가능 구역을 가름 | 오브젝트화 |
| `bank_E07_l3_dialogue_034` | E07_C01~C08 | L3 | 대사 은행 | 이름 없음 | 복지, 보험, 통관 상태 반응 | `identity_mismatch`, `payment_failure` | 복지 승인이 통관 거절로 이어짐 | 이름 제거 |
| `bank_E07_l2_log_054` | E07_C01~C08 | L2 | 로그 | 이름 없음 | 보험 승인 로그, 통관 재시도 로그 | `payment_failure`, `trace_retained` | 승인 로그가 사람을 대신 증명함 | 오브젝트화 |
| `bank_E07_l1_list_037` | E07_C01~C08 | L1 | 목록 | 이름 없음 | 복지번호 목록, 통관 대기 명단 | `identity_mismatch`, `route_access` | 목록의 빈칸이 작은 결말이 됨 | 오브젝트화 |
| `bank_E07_l0_auto_voice_029` | E07_C01~C08 | L0 | 자동 음성 | 이름 없음 | 공영 안내, 통관 자동 거절 음성 | `campaign_density` | 거절 음성이 구조 방송처럼 들림 | 잔향화 |
| `bank_E08_l3_dialogue_034` | E08_C01~C08 | L3 | 대사 은행 | 이름 없음 | 항만, 관광권, 피난 검역 상태 반응 | `quarantine_delay`, `route_access` | 관광권이 피난권으로 둔갑함 | 이름 제거 |
| `bank_E08_l2_sign_054` | E08_C01~C08 | L2 | 표지 | 이름 없음 | 항만 표식, 검역 라벨, 관광 안내판 | `campaign_density`, `quarantine_delay` | 안내판의 번역 차이가 길을 바꿈 | 오브젝트화 |
| `bank_E08_l1_call_037` | E08_C01~C08 | L1 | 호출번호 | 이름 없음 | 피난 호출번호, 선석 번호 | `route_access`, `supply_pressure` | 호출번호가 사라진 배를 가리킴 | 오브젝트화 |
| `bank_E08_l0_auto_voice_029` | E08_C01~C08 | L0 | 자동 음성 | 이름 없음 | 항만 자동 안내, 피난 검역 안내 | `quarantine_delay` | 안내가 끝나야 검역이 시작됨 | 잔향화 |
| `bank_E09_l3_dialogue_034` | E09_C01~C08 | L3 | 대사 은행 | 이름 없음 | 보험, 고속도로, 소매 상태 반응 | `payment_failure`, `human_stability` | 보상 불가 문구가 구조 단서가 됨 | 이름 제거 |
| `bank_E09_l2_receipt_053` | E09_C01~C08 | L2 | 영수증 | 이름 없음 | 대형마트 영수증, 보험 청구 실패 | `payment_failure`, `trace_spent` | 환불 불가가 작은 결말이 됨 | 오브젝트화 |
| `bank_E09_l1_queue_037` | E09_C01~C08 | L1 | 대기열 기록 | 이름 없음 | 고속도로 대피열, 계산대 대기열 | `route_access`, `campaign_density` | 대기열이 목적지를 잃음 | 오브젝트화 |
| `bank_E09_l0_sign_030` | E09_C01~C08 | L0 | 표지 | 이름 없음 | 폐쇄 램프, 매장 안내문, 보험 고지 | `campaign_density` | 닫힌 출구가 유일한 길이 됨 | 오브젝트화 |
| `bank_E10_l3_dialogue_034` | E10_C01~C08 | L3 | 대사 은행 | 이름 없음 | 구독배송, 물류, 알고리즘 상태 반응 | `robot_autonomy`, `return_loop` | 알고리즘 추천이 구조를 방해함 | 이름 제거 |
| `bank_E10_l2_object_053` | E10_C01~C08 | L2 | 오브젝트 | 이름 없음 | 배송 라벨, 창고 스캐너, 추천 단말 | `return_loop`, `trace_retained` | 라벨이 실제 목적지를 숨김 | 오브젝트화 |
| `bank_E10_l1_call_037` | E10_C01~C08 | L1 | 호출번호 | 이름 없음 | 창고 피킹 번호, 드론 회수 번호 | `robot_autonomy`, `route_access` | 호출된 물건이 사람보다 먼저 옴 | 오브젝트화 |
| `bank_E10_l0_auto_voice_030` | E10_C01~C08 | L0 | 자동 음성 | 이름 없음 | 구독 갱신 안내, 배송 실패 음성 | `payment_failure`, `campaign_density` | 실패 안내가 계속 결제를 유도함 | 잔향화 |
| `bank_E11_l3_dialogue_034` | E11_C01~C08 | L3 | 대사 은행 | 이름 없음 | 항만시장, 송금, 전력복구 상태 반응 | `payment_failure`, `supply_pressure` | 송금 실패가 가족 위치를 남김 | 이름 제거 |
| `bank_E11_l2_log_053` | E11_C01~C08 | L2 | 로그 | 이름 없음 | 송금 로그, 전력 복구 기록, 항만시장 장부 | `trace_retained`, `payment_failure` | 장부의 누락 줄이 생존자를 가리킴 | 오브젝트화 |
| `bank_E11_l1_list_036` | E11_C01~C08 | L1 | 목록 | 이름 없음 | 시장 좌판 목록, 전력 복구 명단 | `supply_pressure`, `identity_mismatch` | 복구 명단이 사라진 구역을 증명함 | 오브젝트화 |
| `bank_E11_l0_sign_031` | E11_C01~C08 | L0 | 표지 | 이름 없음 | 항만시장 표지, 정전 안내문 | `campaign_density` | 불 꺼진 표지가 마지막 방향이 됨 | 오브젝트화 |
| `bank_E12_l3_dialogue_034` | E12_C01~C08 | L3 | 대사 은행 | 이름 없음 | 이동진료, 자원항만, 모바일머니 상태 반응 | `payment_failure`, `human_stability` | 이동진료 기록이 누락자를 살림 | 이름 제거 |
| `bank_E12_l2_echo_053` | E12_C01~C08 | L2 | 잔향 | 이름 없음 | 이동진료 호출, 항만 무전, 우물 펌프음 | `supply_pressure`, `trace_retained` | 우물 소리가 대피 경로를 남김 | 잔향화 |
| `bank_E12_l1_queue_036` | E12_C01~C08 | L1 | 대기열 기록 | 이름 없음 | 진료 대기열, 모바일머니 승인 대기 | `payment_failure`, `route_access` | 승인 대기열이 생존 순서를 뒤집음 | 오브젝트화 |
| `bank_E12_l0_sign_031` | E12_C01~C08 | L0 | 표지 | 이름 없음 | 우물 보급 표지, 자원항만 경고문 | `campaign_density`, `supply_pressure` | 경고문이 구조 신호로 오인됨 | 오브젝트화 |
| `bank_cross_l3_log_009` | cross_region | L3 | 로그 | 이름 없음 | 권역 공통 삭제 로그, 반복 서명 | `identity_mismatch`, `broadcast_trust` | 같은 서명이 다른 권역에서 반복됨 | 보류 |
| `bank_cross_l2_auto_voice_012` | cross_region | L2 | 자동 음성 | 이름 없음 | 다국어 자동 안내음, 검역 반복 음성 | `quarantine_delay`, `campaign_density` | 모든 권역의 안내가 같은 문장으로 끝남 | 보류 |
| `bank_cross_l1_call_012` | cross_region | L1 | 호출번호 | 이름 없음 | 전역 호출번호, 누락자 번호 묶음 | `route_access`, `identity_mismatch` | 번호가 사람보다 오래 살아남음 | 보류 |
| `bank_cross_l0_sign_011` | cross_region | L0 | 표지 | 이름 없음 | 삭제된 표지, 전역 공통 자동 문구 | `broadcast_trust`, `campaign_density` | 같은 표지가 세계 끝을 가리킴 | 보류 |

---

## 2. 표현 방식 검산

| 표현 방식 | 대표 용도 | 판정 |
|---|---|---|
| 대사 은행 | L3 상태 반응, 짧은 조건 대사 | 이름 제거 |
| 잔향 | L2 음성 흔적, 장소 후폭풍 | 잔향화 |
| 오브젝트 | L2 사물, 표식, 단말 | 오브젝트화 |
| 호출번호 | L1 번호 기반 노출 | 오브젝트화 |
| 목록 | L1 명단, 예약, 승인 목록 | 오브젝트화 |
| 자동 음성 | L2/L0 안내 음성 | 잔향화 |
| 로그 | L2 기록, 삭제 로그, 장부 | 오브젝트화 |
| 표지 | L2/L0 안내문, 라벨, 경고문 | 오브젝트화 |
| 영수증 | L2 결제 실패, 환불 불가, 권리 흔적 | 오브젝트화 |
| 대기열 기록 | L1 대기열, 순번, 진입 순서 | 오브젝트화 |

---

## 3. 검수표

| 검수 항목 | 기준 | 결과 | 판정 |
|---|---:|---:|---|
| 총 L3 이하 수량 | 1,856 | 1,856 | 통과 |
| L3 수량 | 413 | 413 | 통과 |
| L2 수량 | 642 | 642 | 통과 |
| L1 수량 | 446 | 446 | 통과 |
| L0 수량 | 355 | 355 | 통과 |
| L5/L4 침범 | 0 | 0 | 통과 |
| E01 전체 상한 | 120 | 120 | 통과 |
| E01 L3 이하 | 100 | 100 | 통과 |
| E02 이후 한국어 이름 기본값 | 0 | 0 | 통과 |
| 직접 대면 NPC 증가 | 0 | 0 | 통과 |

---

## 4. 다음 작업 포인터

전역 NPC L3 이하 은행 검수

최종 판정:

```text
통과.
L3 이하 1,856개 슬롯을 직접 대면 NPC가 아니라 은행형 월드 반응으로 정리했다.
L5/L4 192개는 건드리지 않았다.
E01은 120 고정이며 추가 생산하지 않았다.
E02 이후 한국어 이름 기본값을 쓰지 않았다.
직접 대면 NPC 수는 증가하지 않았다.
다음 작업은 이 은행을 중복/표현 방식/상태 키 기준으로 검수하는 것이다.
```
