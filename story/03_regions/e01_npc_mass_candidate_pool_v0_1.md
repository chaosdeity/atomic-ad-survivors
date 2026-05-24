# E01 NPC 대량 후보 풀 v0.1

## 문서 상태

```text
상태:
제작팀 대량 후보 풀 v0.1

작업 범위:
E01 전체

총 후보 수:
120개

판정:
후보 풀 작성 완료

기준 문서:
docs/world/NPC_MASS_PRODUCTION_TEAM_PROMPT_V0_1.md
docs/world/NPC_PRODUCTION_ROADMAP_V0_1.md
docs/world/NPC_CREATION_TEAM_PROMPT_V0_1.md
docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
story/03_regions/e01_support_npc_minimum_plan_v0_1.md
```

핵심 판정:

```text
이 문서는 120명 상세 프로필이 아니다.
E01 전체가 작게 보이지 않도록 NPC, 잔향, 배경, 문구 씨앗을 계층화한 후보 풀이다.
L5/L4만 후속 상세화 후보로 올리고, L2/L1/L0는 세계 밀도와 반복 출격의 잔향으로 사용한다.
```

---

## 0. 수량 요약

| 권역/지역 | L5 | L4 | L3 | L2 | L1 | L0 | 합계 |
|---|---:|---:|---:|---:|---:|---:|---:|
| 침묵 보급소/허브 | 0 | 2 | 4 | 5 | 5 | 4 | 20 |
| R01 서부 스마일홈 | 0 | 2 | 3 | 7 | 5 | 3 | 20 |
| R02 백색팔찌 격리권 | 1 | 3 | 3 | 2 | 2 | 1 | 12 |
| R03 반품 회수 벨트 | 1 | 3 | 3 | 2 | 2 | 1 | 12 |
| R04 정품충전 공단 | 1 | 3 | 3 | 2 | 2 | 1 | 12 |
| R05 마지막 수신탑 | 1 | 2 | 2 | 3 | 1 | 1 | 10 |
| R06 포인트 거리 | 1 | 2 | 2 | 2 | 2 | 1 | 10 |
| R07 마지막 출항권 | 1 | 2 | 2 | 2 | 2 | 1 | 10 |
| R08 서부 비상보급망 | 1 | 2 | 3 | 3 | 3 | 2 | 14 |
| 합계 | 7 | 21 | 25 | 28 | 24 | 15 | 120 |

직접 대면 우선 후보:

```text
16개 이하.
L5 7개와 L4 일부만 직접 대면 후보로 본다.
나머지 L4는 음성/오브젝트 중심으로도 처리 가능하다.
```

---

## 1. 기존 확정 NPC 보존

기존 기준은 대체하지 않는다.

| 묶음 | 기존 수 | 처리 |
|---|---:|---|
| 침묵 보급소 상주 NPC | 5명 | 미나, 장도윤, 팝시, 세븐, 복희 기준 보존 |
| R01 지역 NPC | 12명 | R01 12명 기준 보존 |
| E01 R02/R03/R04/R08 보조 NPC 최소안 | 12명 | 최소안 기준 보존 |

대량 후보 풀의 역할:

```text
1. 기존 NPC를 교체하지 않는다.
2. 기존 NPC 주변의 대기열, 명단, 잔향, 시설 얼굴을 채운다.
3. L5/L4 승격 후보만 후속 상세화한다.
4. L2/L1/L0는 이름 있는 인물로 과승격하지 않는다.
```

---

## 2. 후보 테이블

| npc_seed_id | display_label | depth_level | npc_form | parent_region | parent_campaign_id | admin_real_region | admin_infra_anchor | user_display_region_name | first_exposure | core_function | wrong_belief | state_key | playable_overlap | name_policy | one_line_dialogue | promotion_candidate | forbidden |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| hub_mass_001 | 밤 카운터 임시 정산자 | L4_major_support | human | HUB | E01_C08 | 수도권 서부 외곽 | 주유소 편의점 카운터 | 침묵 보급소 | direct | 미나 부재 시간의 정산 불안 | 숫자가 맞으면 밤도 버틴다 | supply_pressure | avoid_mina | role_first | "낮에 맞던 표가 밤에도 맞을까요." | short_profile | 미나 대체 |
| hub_mass_002 | 충전 스탠드 뒤 대기 로봇 | L4_major_support | robot | HUB | E01_C08 | 수도권 서부 외곽 | 충전 스탠드 뒤쪽 | 침묵 보급소 | background | 로봇 충전 순서 긴장 | 조용히 기다리면 버려지지 않는다 | robot_autonomy | avoid_patch_popsi | name_late | "제 차례가 지나간 건 아닙니까." | dialogue_bank | 팝시 하위 마스코트 |
| hub_mass_003 | 침상 번호 꿰매는 손 | L3_function | human | HUB | E01_C08 | 수도권 서부 외곽 | 임시 침상 줄 | 침묵 보급소 | object | 침상 번호와 이름 분리 | 번호를 꿰매면 사람이 흩어지지 않는다 | human_stability | none | unnamed | "천이 모자라서 번호를 접었습니다." | dialogue_bank | 새 상주 NPC |
| hub_mass_004 | 수동 발전기 계량판 | L3_function | device | HUB | E01_C08 | 수도권 서부 외곽 | 소형 변전소 | 침묵 보급소 | object | 보급소 전력 부담 표시 | 전력이 남으면 안전도 남는다 | charge_tag | avoid_meter06 | no_human_name | "잔량이 아니라 버틸 시간을 표시합니다." | trace_bank | 유건 기능 침범 |
| hub_mass_005 | 이름 보관함 빈칸표 | L3_function | document | HUB | E01_C08 | 수도권 서부 외곽 | 이름 보관함 | 침묵 보급소 | object | 복희의 보관 한계 표시 | 빈칸을 만들면 이름이 기다린다 | trace_preservation | avoid_bokhee | no_human_name | "빈칸도 이름을 기다리는 자리입니다." | trace_bank | 복희 대체 |
| hub_mass_006 | 출격 게시판 수정 테이프 | L3_function | object_trace | HUB | E01_C08 | 수도권 서부 외곽 | 카탈로그 벽 | 침묵 보급소 | signage | 세븐 보고의 불확실성 표시 | 지운 정보는 위험하지 않다 | signal_tag | avoid_seven | no_human_name | "가려진 좌표가 더 크게 번집니다." | trace_bank | 도감 기능 대체 |
| hub_mass_007 | 역송출 실패 로그 04 | L2_trace | log | HUB | E01_C08 | 수도권 서부 외곽 | 역송출 장비 | 침묵 보급소 | log | 인양 실패 비용 표시 | 실패 로그는 다음 성공을 보장한다 | extraction_stability | avoid_yunseo | no_human_name | "좌표를 잃은 것은 사람이 아닙니다. 아직은." | trace_bank | 인양 설명 장문 |
| hub_mass_008 | 젖은 보급태그 묶음 | L2_trace | object_trace | HUB | E01_C08 | 수도권 서부 외곽 | 정산 카운터 아래 | 침묵 보급소 | object | 태그 소모와 흔적 보존 갈등 | 젖어도 접근권은 남는다 | ration_tag | none | no_human_name | "마른 뒤에도 누구 몫이었는지는 번집니다." | trace_bank | 보상 아이템화 |
| hub_mass_009 | 임시 입소 명단 2장 | L2_trace | document | HUB | E01_C08 | 수도권 서부 외곽 | 편의점 벽면 | 침묵 보급소 | list_name | 피난민 수 증가 압박 | 명단에 있으면 안쪽 사람이다 | human_stability | none | fragment_only | "이름 옆에 침상 없음 표시가 먼저 붙었습니다." | trace_bank | 대형 마을화 |
| hub_mass_010 | 닫힌 자동문 스티커 | L2_trace | signage | HUB | E01_C08 | 수도권 서부 외곽 | 편의점 자동문 | 침묵 보급소 | signage | 출입 제한의 불편함 | 문이 닫히면 안쪽은 안전하다 | human_stability | none | no_human_name | "문은 닫혔지만 광고는 틈으로 들어옵니다." | trace_bank | 방어시설 만능화 |
| hub_mass_011 | 반쯤 녹은 가족사진 수거함 | L2_trace | object_trace | HUB | E01_C08 | 수도권 서부 외곽 | 이름 보관함 옆 | 침묵 보급소 | object | R01 후폭풍의 보급소 잔류 | 사진을 모으면 가족도 돌아온다 | trace_preservation | avoid_frame_left | no_human_name | "얼굴보다 같은 구도가 더 오래 남았습니다." | trace_bank | FRAME-LEFT 대체 |
| hub_mass_012 | 식량상자 옆 접힌 이름 | L1_background | document | HUB | E01_C08 | 수도권 서부 외곽 | 식량상자 줄 | 침묵 보급소 | list_name | 배급 줄의 개인 흔적 | 이름을 접으면 몫도 접힌다 | ration_tag | none | fragment_only | "접힌 자리에 성만 남았습니다." | background_only | 감성 서브퀘스트화 |
| hub_mass_013 | 충전시간 양보 메모 | L1_background | document | HUB | E01_C08 | 수도권 서부 외곽 | 충전 스탠드 | 침묵 보급소 | object | 인간과 로봇의 작은 협상 | 양보 메모가 갈등을 해결한다 | robot_autonomy | avoid_patch | unnamed | "다음 충전은 누가 양보한 건지 적혀 있지 않습니다." | background_only | 공존 해답화 |
| hub_mass_014 | 침상 밑 신발 한 짝 | L1_background | object_trace | HUB | E01_C08 | 수도권 서부 외곽 | 임시 침상 아래 | 침묵 보급소 | object | 귀환 실패의 작은 흔적 | 물건이 돌아오면 사람도 돌아온다 | extraction_stability | none | unnamed | "왼쪽만 돌아왔습니다." | background_only | 구출 퀘스트화 |
| hub_mass_015 | 수동 라디오를 붙든 사람 | L1_background | crowd | HUB | E01_C08 | 수도권 서부 외곽 | 편의점 구석 | 침묵 보급소 | background | 방송 신호 불안의 배경 | 잡음이 들리면 바깥이 있다 | signal_tag | none | unnamed | "잡음이 줄면 더 불안해합니다." | background_only | R05 선공개 |
| hub_mass_016 | 어린이용 쿠폰북 낙서 | L1_background | document | HUB | E01_C08 | 수도권 서부 외곽 | 카운터 서랍 | 침묵 보급소 | object | 광고 잔재의 일상성 | 쿠폰은 아직 쓸 곳이 있다 | campaign_density | none | unnamed | "유효기간 자리에 오늘 날짜가 덧칠됐습니다." | background_only | 상점화 |
| hub_mass_017 | 자동문 경고 패턴 | L0_pattern | signage | HUB | E01_C08 | 수도권 서부 외곽 | 자동문 센서 | 침묵 보급소 | signage | 문 개폐 압력 문구 | 경고문은 모두를 지킨다 | human_stability | none | no_human_name | "문이 열리면 등록 신호도 열립니다." | background_only | NPC화 |
| hub_mass_018 | 냉장고 재고 알림 | L0_pattern | system_voice | HUB | E01_C08 | 수도권 서부 외곽 | 편의점 냉장고 | 침묵 보급소 | voice | 식량 부족 반복 문구 | 재고 알림은 식량을 만든다 | ration_tag | none | no_human_name | "부족은 알림보다 빠르게 옵니다." | background_only | 팝시화 |
| hub_mass_019 | 충전 스탠드 대기음 | L0_pattern | system_voice | HUB | E01_C08 | 수도권 서부 외곽 | 충전 스탠드 | 침묵 보급소 | voice | 로봇 대기 압력 | 순서음은 불만을 잠재운다 | robot_autonomy | avoid_popsi | no_human_name | "딩동 소리가 날 때마다 누군가 뒤로 밀립니다." | background_only | 로봇 NPC화 |
| hub_mass_020 | 정산표 자동 합계 문구 | L0_pattern | document | HUB | E01_C08 | 수도권 서부 외곽 | 정산 카운터 | 침묵 보급소 | log | 미나 정산 압박 반복 | 합계가 맞으면 오늘은 끝난다 | supply_pressure | avoid_mina | no_human_name | "합계는 맞지만 몫은 맞지 않습니다." | background_only | UI 튜토리얼화 |
| r01_mass_001 | 모델하우스 사진 보정 담당 | L4_major_support | human | R01 | E01_C01 | 수도권 외곽 신도시형 주거 벨트 | 모델하우스 사진 부스 | 서부 스마일홈 | object | 가족사진 조작 후폭풍 | 밝게 보정하면 좋은 기억이 된다 | trace_preservation | avoid_frame_left | role_first | "어두운 얼굴은 자동으로 지워집니다." | short_profile | FRAME-LEFT 대체 |
| r01_mass_002 | 대체 보호자 칸 관리자 | L4_major_support | human_internal | R01 | E01_C01 | 수도권 외곽 신도시형 주거 벨트 | 상담표 보호자 칸 | 서부 스마일홈 | log | 가족 칸의 빈자리 압박 | 빈칸은 누군가로 채워야 안전하다 | residence_tag | avoid_room12 | role_first | "비어 있으면 시스템이 더 친절해집니다." | short_profile | WELCOME-DESK 반복 |
| r01_mass_003 | 주차장 게이트 정산기 | L3_function | device | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 모델하우스 주차장 | 서부 스마일홈 | object | 통행태그와 방문객 판정 | 차가 들어오면 사람도 방문객이다 | passage_tag | avoid_open_host | no_human_name | "출차 기록이 없으면 아직 관람 중입니다." | trace_bank | 길 안내 기능 |
| r01_mass_004 | 스마트 도어 펌웨어 메모 | L3_function | document | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 분양 주택 스마트 도어 | 서부 스마일홈 | log | 문 권한과 거주태그 압력 | 업데이트하면 문은 공정해진다 | residence_tag | avoid_key_ring | no_human_name | "낡은 문보다 새 문이 더 오래 기억합니다." | trace_bank | KEY-RING 대체 |
| r01_mass_005 | 택배함 대기열 표식 | L3_function | object_trace | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 무인 택배함 | 서부 스마일홈 | object | MAIL-LOOP 주변 밀도 | 주소가 있으면 수령자도 있다 | signal_tag | avoid_mail_loop | no_human_name | "함은 꽉 찼고 사람은 확인되지 않았습니다." | trace_bank | MAIL-LOOP 인간화 |
| r01_mass_006 | 빈 놀이터 출석표 | L2_trace | document | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 단지 놀이터 | 서부 스마일홈 | object | 생활 흔적과 등록 압박 | 출석표가 있으면 아이들도 돌아온다 | trace_preservation | none | fragment_only | "결석 칸이 더 많은데 출석 도장은 선명합니다." | trace_bank | 아동 구출 퀘스트 |
| r01_mass_007 | 입주민 앱 알림 잔향 | L2_trace | system_voice | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 입주민 앱 서버 | 서부 스마일홈 | voice | 가족/입주 앱의 반복 호출 | 알림은 도움이다 | campaign_density | avoid_open_host | no_human_name | "입주민 여러분, 가족 구성이 갱신되었습니다." | trace_bank | 튜토리얼 알림 |
| r01_mass_008 | 분양 상담 녹취 조각 | L2_trace | log | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 상담 데스크 녹취 | 서부 스마일홈 | log | WELCOME-DESK 주변 잔향 | 녹취가 남으면 동의도 남는다 | residence_tag | avoid_welcome_desk | no_human_name | "질문은 잘렸고 동의만 남았습니다." | trace_bank | 상담 NPC 추가 |
| r01_mass_009 | 배수로 물때 이름 조각 | L2_trace | object_trace | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 배수로 침묵 주머니 | 서부 스마일홈 | object | DRAIN-MARK 예고 주변 밀도 | 표식이 흐리면 더 안전하다 | extraction_stability | avoid_drain_mark | fragment_only | "물때 아래 획 하나가 남았습니다." | trace_bank | DRAIN-MARK 대체 |
| r01_mass_010 | 식탁 예약 문자 | L2_trace | document | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 모델하우스 식탁 | 서부 스마일홈 | object | DINING-4 주변 압박 | 예약하면 자리가 사람을 기다린다 | ration_tag | avoid_dining4 | no_human_name | "네 번째 자리는 취소되지 않았습니다." | trace_bank | DINING-4 반복 |
| r01_mass_011 | 귀환 산책로 안내판 | L2_trace | signage | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 가짜 귀환로 | 서부 스마일홈 | signage | SIGN-BACK 예고 주변 | 친절한 표지판은 안전하다 | passage_tag | avoid_sign_back | no_human_name | "보급소 방향이라고 적힌 글씨가 너무 새롭습니다." | trace_bank | SIGN-BACK 대체 |
| r01_mass_012 | 모델하우스 박수 녹음 | L2_trace | system_voice | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 공개홀 스피커 | 서부 스마일홈 | voice | 빈 가족 행사 압력 | 박수가 있으면 성공한 행사다 | campaign_density | none | no_human_name | "아무도 없는데 박수만 정확합니다." | trace_bank | 감성 과잉 |
| r01_mass_013 | 폐편의점 앞 줄 끝 이름 | L1_background | list_name | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 폐편의점 뒤길 | 서부 스마일홈 | list_name | PORCH-LINE 주변 군중 | 줄 끝에 있으면 아직 순서가 있다 | human_stability | avoid_porch_line | fragment_only | "끝이라고 적힌 이름이 매번 바뀝니다." | background_only | PORCH-LINE 대체 |
| r01_mass_014 | 현관 매트 아래 손글씨 | L1_background | document | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 현관 매트 | 서부 스마일홈 | object | 이름/주소 배경 | 숨기면 주소도 숨는다 | trace_preservation | avoid_name_painter | fragment_only | "매트 아래 이름은 젖지 않았습니다." | background_only | NAME-PAINTER 반복 |
| r01_mass_015 | 작은 화분 물주기표 | L1_background | document | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 주택 앞 화분 | 서부 스마일홈 | object | 반복 생활감 | 식물이 살면 집도 산다 | residence_tag | none | unnamed | "물 준 날짜만 계속 오늘입니다." | background_only | 감성 퀘스트 |
| r01_mass_016 | 빈 유모차 번호표 | L1_background | object_trace | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 단지 복도 | 서부 스마일홈 | object | 가족 슬롯 압박 | 번호표가 있으면 보호자가 있다 | residence_tag | none | unnamed | "번호표는 남았고 손잡이는 새것입니다." | background_only | 직접 구출 대상 |
| r01_mass_017 | 택배기사 호출명 조각 | L1_background | system_voice | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 무인 택배함 | 서부 스마일홈 | voice | 주소 배경 밀도 | 호출하면 누군가 대답한다 | signal_tag | avoid_mail_loop | fragment_only | "성만 남은 호출이 세 번 반복됩니다." | background_only | 이루 연결 과잉 |
| r01_mass_018 | 주택가 자동 환영 문구 | L0_pattern | signage | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 단지 입구 | 서부 스마일홈 | signage | 입주 압력 반복 | 환영은 동의다 | campaign_density | none | no_human_name | "어서 오세요. 이미 등록되었습니다." | background_only | NPC화 |
| r01_mass_019 | 가족 구성 업데이트 알림 | L0_pattern | system_voice | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 스마트홈 스피커 | 서부 스마일홈 | voice | 가족 슬롯 반복 | 업데이트는 보살핌이다 | residence_tag | none | no_human_name | "누락 구성원을 자동 보정합니다." | background_only | 보스 설명 장문 |
| r01_mass_020 | 귀가 실패 쿠폰 | L0_pattern | document | R01 | E01_C01 | 수도권 외곽 주거 벨트 | 우편함 전단 | 서부 스마일홈 | object | 광고 잔재 | 실패도 혜택으로 바뀐다 | campaign_density | none | no_human_name | "다음 귀가에는 할인 혜택이 적용됩니다." | background_only | 상점화 |
| r02_mass_001 | 퇴원 불가 심사 대리 얼굴 | L5_core | human_internal | R02 | E01_C02 | 수도권 대형 병원군 | 퇴원 심사 데스크 | 백색팔찌 격리권 | direct | R02 후반 보스 절차의 인간 얼굴 | 살려두면 붙잡는 것이 아니다 | treatment_tag | avoid_hold04 | role_first | "나가는 것보다 무너지는 쪽을 더 많이 봤습니다." | profile_v1 | 병원 악역화 |
| r02_mass_002 | 보호자 호출 대행자 | L4_major_support | human_internal | R02 | E01_C02 | 수도권 대형 병원군 | 응급실 보호자 호출대 | 백색팔찌 격리권 | direct | 보호자 미확인 압박 | 누군가 대신 확인해야 움직일 수 있다 | medical_registration | avoid_hold04 | name_late | "보호자가 없으면 시스템은 더 친절해집니다." | short_profile | 하람 보호자화 |
| r02_mass_003 | 약품 봉인 담당자 | L4_major_support | human | R02 | E01_C02 | 수도권 대형 병원군 | 보험 심사 약국 | 백색팔찌 격리권 | object | 약품 접근과 진료태그 부담 | 봉인하면 오남용도 고통도 줄어든다 | treatment_tag | avoid_hold04 | role_first | "약은 있는데 열 수 있는 사람이 없습니다." | dialogue_bank | 약국 상점 |
| r02_mass_004 | 격리문 복도 살균 음성 | L4_major_support | system_voice | R02 | E01_C02 | 수도권 대형 병원군 | 음압실 살균문 | 백색팔찌 격리권 | voice | R02-L04 P2 예고 | 살균하면 위험도 사라진다 | campaign_density | none | no_human_name | "문이 닫히면 안쪽도 바깥도 깨끗합니다." | trace_bank | P1 직접 개방 |
| r02_mass_005 | 접수번호 재발급기 | L3_function | device | R02 | E01_C02 | 수도권 대형 병원군 | 응급 접수 홀 | 백색팔찌 격리권 | object | 번호 재발급 압박 | 새 번호가 새 기회를 준다 | medical_registration | avoid_hold04 | no_human_name | "이전 번호는 환자 기록에 병합됩니다." | trace_bank | 편의 UI화 |
| r02_mass_006 | 산소 라인 점검표 | L3_function | document | R02 | E01_C02 | 수도권 대형 병원군 | 장기 입원동 | 백색팔찌 격리권 | object | 살아있음과 고정의 모순 | 호흡이 남으면 병상도 필요하다 | human_stability | none | no_human_name | "정상 호흡 표시가 퇴원 사유가 되지 못했습니다." | trace_bank | 힐러화 |
| r02_mass_007 | 처방 대기 번호판 | L3_function | signage | R02 | E01_C02 | 수도권 대형 병원군 | 보험 심사 약국 | 백색팔찌 격리권 | signage | 약품 순번 압박 | 기다리면 공정하게 약이 온다 | supply_pressure | none | no_human_name | "호출 번호는 줄었고 대기자는 늘었습니다." | trace_bank | 상점화 |
| r02_mass_008 | 보호자 없음 팔찌 묶음 | L2_trace | object_trace | R02 | E01_C02 | 수도권 대형 병원군 | 접수 홀 폐기함 | 백색팔찌 격리권 | object | 보호자 미확인의 흔적 | 팔찌가 남으면 절차도 남는다 | treatment_tag | avoid_hold04 | no_human_name | "잘린 팔찌도 다시 조여지는 법을 압니다." | trace_bank | 하람 연출 대체 |
| r02_mass_009 | 커튼 뒤 재입원 속삭임 | L2_trace | system_voice | R02 | E01_C02 | 수도권 대형 병원군 | 장기 입원동 | 백색팔찌 격리권 | voice | 재입원 공포 잔향 | 작게 부르면 환자가 덜 놀란다 | human_stability | avoid_hold04 | no_human_name | "커튼을 닫겠습니다. 안정 상태로 돌아갑니다." | trace_bank | 유령 대화 |
| r02_mass_010 | 대기실의 보호자 이름 조각 | L1_background | list_name | R02 | E01_C02 | 수도권 대형 병원군 | 응급 대기실 | 백색팔찌 격리권 | list_name | 보호자 명단 배경 | 이름을 불리면 책임도 온다 | human_stability | none | fragment_only | "보호자 칸엔 성만 남았습니다." | background_only | 신규 가족 서사 |
| r02_mass_011 | 약봉투 뒤 손글씨 | L1_background | document | R02 | E01_C02 | 수도권 대형 병원군 | 약국 창구 | 백색팔찌 격리권 | object | 처방과 이름 분리 | 약봉투가 사람을 기억한다 | trace_preservation | none | fragment_only | "식후라는 말만 남고 식사는 없습니다." | background_only | 약품 보상화 |
| r02_mass_012 | 재심사 자동 알림 | L0_pattern | system_voice | R02 | E01_C02 | 수도권 대형 병원군 | 보험 키오스크 | 백색팔찌 격리권 | voice | 보험 압박 반복 | 알림은 누락을 막는다 | treatment_tag | none | no_human_name | "재심사가 시작되면 대기 상태가 안전하게 연장됩니다." | background_only | NPC화 |
| r03_mass_001 | 최종 반품 심사 보류관 | L5_core | human_internal | R03 | E01_C03 | 수도권 물류축 | 최종 반품 심사실 | 반품 회수 벨트 | direct | 윤서 핵심 보스 전 인간 압력 | 판정이 닫혀야 사람이 돌아간다 | delivery_state | avoid_yunseo_return05 | role_first | "완료되지 않은 물건은 계속 다칩니다." | profile_v1 | 윤서 과거 대체 |
| r03_mass_002 | 분류선 수동 정지 담당자 | L4_major_support | human | R03 | E01_C03 | 수도권 물류축 | 자동 분류장 | 반품 회수 벨트 | direct | 벨트 정지 선택 후폭풍 | 멈추면 더 안전하게 분류된다 | delivery_state | avoid_return05 | name_late | "멈춘 라인에서도 목적지는 계속 움직입니다." | short_profile | 이루 전투 대체 |
| r03_mass_003 | 보증 스티커 회수원 | L4_major_support | human_internal | R03 | E01_C03 | 수도권 물류축 | 보증 심사 창고 | 반품 회수 벨트 | object | PATCH/R04 연결 전 보증 압박 | 보증이 있으면 버려도 된다 | robot_autonomy | avoid_patch | role_first | "정품 스티커는 떨어져도 권리는 붙습니다." | dialogue_bank | PATCH 부품화 반복 |
| r03_mass_004 | 압축 대기라인 방송 | L4_major_support | system_voice | R03 | E01_C03 | 수도권 물류축 | 파쇄 전 대기라인 | 반품 회수 벨트 | voice | R03-L04 P2 예고 | 기한이 지나면 정리가 자비다 | supply_pressure | avoid_yunseo | no_human_name | "대기 시간이 끝나면 부피가 줄어듭니다." | trace_bank | 파쇄 보스 조기 개방 |
| r03_mass_005 | 바코드 교차 확인대 | L3_function | device | R03 | E01_C03 | 수도권 물류축 | 반품 접수 야드 | 반품 회수 벨트 | object | 수취/반송 판정 혼선 | 두 번 스캔하면 실수가 줄어든다 | signal_tag | avoid_return05 | no_human_name | "확인은 늘었고 목적지는 더 좁아졌습니다." | trace_bank | 스캐너 캐릭터화 |
| r03_mass_006 | 컨테이너 임시 봉인표 | L3_function | document | R03 | E01_C03 | 수도권 물류축 | 하역장 컨테이너 | 반품 회수 벨트 | signage | 보관과 봉쇄 사이 | 봉인하면 분실이 아니다 | passage_tag | none | no_human_name | "봉인은 열쇠보다 오래 남습니다." | trace_bank | KEY-RING 반복 |
| r03_mass_007 | 재배송 실패 수거함 | L3_function | object_trace | R03 | E01_C03 | 수도권 물류축 | 자동 분류장 | 반품 회수 벨트 | object | 실패표와 보상 압박 | 실패를 모으면 다음 시도가 쉬워진다 | delivery_state | avoid_return05 | no_human_name | "실패표가 많을수록 돌아갈 곳은 하나로 줄었습니다." | trace_bank | 박스 보상 루프 |
| r03_mass_008 | 뒤집힌 송장 사진 | L2_trace | profile_residue | R03 | E01_C03 | 수도권 물류축 | 반품 야드 벽면 | 반품 회수 벨트 | object | 주소와 얼굴 분리 | 사진이 있으면 수취인도 있다 | trace_preservation | avoid_return05 | fragment_only | "얼굴은 번졌고 주소는 또렷합니다." | trace_bank | 이루 과거 고정 |
| r03_mass_009 | 오배송 사과 앱 알림 | L2_trace | system_voice | R03 | E01_C03 | 수도권 물류축 | 물류 앱 서버 | 반품 회수 벨트 | log | 캠페인의 친절한 오류 | 사과하면 잘못은 줄어든다 | campaign_density | none | no_human_name | "불편을 드려 죄송합니다. 보관 좌표를 갱신합니다." | trace_bank | 코미디화 |
| r03_mass_010 | 하역장 줄 끝 번호 | L1_background | list_name | R03 | E01_C03 | 수도권 물류축 | 반품 접수 야드 | 반품 회수 벨트 | list_name | 군중 압력 | 번호가 있으면 아직 처리 전이다 | human_stability | none | fragment_only | "번호는 살아 있고 이름은 접혔습니다." | background_only | 직접 NPC화 |
| r03_mass_011 | 보증 창고의 빈 케이지 | L1_background | object_trace | R03 | E01_C03 | 수도권 물류축 | 보증 심사 창고 | 반품 회수 벨트 | object | 로봇 부품 거래 배경 | 비어 있으면 회수된 것이다 | robot_autonomy | avoid_patch | unnamed | "케이지 안쪽에는 부품명이 아니라 별명이 긁혔습니다." | background_only | 로봇 구출 퀘스트 |
| r03_mass_012 | 배송 완료 자동 문구 | L0_pattern | signage | R03 | E01_C03 | 수도권 물류축 | 분류장 전광판 | 반품 회수 벨트 | signage | 완료 압박 반복 | 완료 문구는 안심이다 | delivery_state | none | no_human_name | "완료된 대상은 더 이상 응답하지 않아도 됩니다." | background_only | NPC화 |
| r04_mass_001 | 재동기화 코어 전 감시자 | L5_core | human_internal | R04 | E01_C04 | 수도권 산업단지 | 재동기화 코어 외곽 | 정품충전 공단 | direct | R04 후반 정품 절차의 얼굴 | 정품으로 돌아가면 더 오래 산다 | robot_autonomy | avoid_patch_rio_meter06 | role_first | "복구라는 말은 늘 안쪽에서 들립니다." | profile_v1 | 리오 선공개 |
| r04_mass_002 | 리콜 접수 부스 잔류자 | L4_major_support | human_internal | R04 | E01_C04 | 수도권 산업단지 | 리콜 펌웨어실 | 정품충전 공단 | direct | 로봇 리콜 절차 압박 | 접수하면 폐기는 아니다 | robot_autonomy | avoid_patch | role_first | "접수와 회수의 차이를 아직 설명받지 못했습니다." | short_profile | PATCH 해금 대체 |
| r04_mass_003 | 불량품 프레스 정렬자 | L4_major_support | human | R04 | E01_C04 | 수도권 산업단지 | 폐기 프레스 라인 | 정품충전 공단 | object | 폐기 기준 선택 후폭풍 | 정렬하면 덜 아프게 눌린다 | charge_tag | avoid_meter06 | name_late | "비스듬히 놓으면 오래 걸립니다. 그래서 제가 싫어합니다." | dialogue_bank | 폭력 캐릭터화 |
| r04_mass_004 | 충전 케이블 분리 음성 | L4_major_support | system_voice | R04 | E01_C04 | 수도권 산업단지 | 폐충전소 | 정품충전 공단 | voice | 충전 접근과 차단의 잔향 | 분리하면 과부하도 책임도 사라진다 | charge_tag | avoid_meter06 | no_human_name | "분리되었습니다. 남은 사용자는 기록으로 보관됩니다." | trace_bank | 충전 버프화 |
| r04_mass_005 | 과금 미터 수동 봉인 | L3_function | device | R04 | E01_C04 | 수도권 산업단지 | 폐충전소 과금기 | 정품충전 공단 | object | 유건 주변 계량 압박 | 봉인하면 사용량이 멈춘다 | charge_load | avoid_meter06 | no_human_name | "봉인은 숫자를 멈추고 빚은 남겼습니다." | trace_bank | 유건 스킬 대체 |
| r04_mass_006 | 배터리 침전조 작업표 | L3_function | document | R04 | E01_C04 | 수도권 산업단지 | 배터리 침전 공장 | 정품충전 공단 | object | 오염과 근무 기록 | 작업표가 있으면 책임자가 있다 | campaign_density | none | fragment_only | "서명 칸은 마르고 분진만 젖었습니다." | trace_bank | 노동자 군상극 |
| r04_mass_007 | 정품 인증문 경첩 | L3_function | object_trace | R04 | E01_C04 | 수도권 산업단지 | 리콜 펌웨어실 입구 | 정품충전 공단 | object | 정품 문턱 예고 | 문이 인증하면 안쪽은 안전하다 | robot_autonomy | avoid_patch_rio | no_human_name | "경첩은 열릴 때마다 모델명을 먼저 묻습니다." | trace_bank | 리오 공포 선공개 |
| r04_mass_008 | 녹은 케이블 이름표 | L2_trace | object_trace | R04 | E01_C04 | 수도권 산업단지 | 폐충전소 | 정품충전 공단 | object | 사람보다 사용량이 남는 흔적 | 이름표가 녹아도 계량값은 남는다 | trace_preservation | avoid_meter06 | fragment_only | "성은 녹았고 kWh는 선명합니다." | trace_bank | 유건 과거 고정 |
| r04_mass_009 | 리콜 성공률 전광판 | L2_trace | signage | R04 | E01_C04 | 수도권 산업단지 | 펌웨어실 | 정품충전 공단 | signage | 성공률 언어의 폭력 | 성공률이 높으면 회복도 높다 | robot_autonomy | avoid_patch | no_human_name | "성공률이 오른 날, 목소리는 줄었습니다." | trace_bank | 로봇 설명 장문 |
| r04_mass_010 | 분진 마스크에 적힌 번호 | L1_background | object_trace | R04 | E01_C04 | 수도권 산업단지 | 침전 공장 탈의구 | 정품충전 공단 | object | 노동자/피난자 배경 | 번호가 있으면 교대가 온다 | human_stability | none | fragment_only | "마스크 안쪽 번호가 숨을 대신 셌습니다." | background_only | 신규 플레이어블 |
| r04_mass_011 | 폐기 프레스 대기자 그림자 | L1_background | profile_residue | R04 | E01_C04 | 수도권 산업단지 | 프레스 라인 | 정품충전 공단 | background | P2 압박 배경 | 그림자가 남으면 아직 처리 전이다 | trace_preservation | none | unnamed | "그림자가 눌리지 않으려고 벽에 남았습니다." | background_only | 직접 구출 |
| r04_mass_012 | 정품 충전 완료 문구 | L0_pattern | signage | R04 | E01_C04 | 수도권 산업단지 | 정품 도크 | 정품충전 공단 | signage | 완료 압박 반복 | 완료는 복구다 | charge_tag | avoid_rio_meter06 | no_human_name | "충전 완료. 사용자 상태를 표준값으로 되돌립니다." | background_only | 리오 설명 |
| r05_mass_001 | 마지막 앵커 그림자 | L5_core | profile_residue | R05 | E01_C05 | 방송/데이터 축 | 송출실 앵커 부스 | 마지막 수신탑 | voice | R05 후반 진실의 얼굴 | 방송하면 사실이 된다 | signal_tag | avoid_broad10 | fragment_only | "말하지 않은 문장이 자막으로 남았습니다." | profile_v1 | 세계진실 조기 공개 |
| r05_mass_002 | 반복 뉴스 데스크 편집자 | L4_major_support | human_internal | R05 | E01_C05 | 방송/데이터 축 | 뉴스 스튜디오 | 마지막 수신탑 | log | 사고 기록 편집 후폭풍 | 순서를 바꾸면 공포가 줄어든다 | signal_tag | avoid_broad10 | role_first | "앞뒤를 바꾸면 사람들도 덜 무너집니다." | short_profile | 설명 NPC |
| r05_mass_003 | 추천 서버 열관리자 | L4_major_support | device | R05 | E01_C05 | 방송/데이터 축 | 추천 서버실 | 마지막 수신탑 | object | 추천 알고리즘의 물리성 | 서버가 식으면 판단도 맑아진다 | campaign_density | none | no_human_name | "열은 빠졌고 추천은 더 차가워졌습니다." | trace_bank | 기술 덤프 |
| r05_mass_004 | 수신탑 케이블 감시문 | L3_function | signage | R05 | E01_C05 | 방송/데이터 축 | 중계탑 외곽 | 마지막 수신탑 | signage | 수신태그 접근 압박 | 케이블이 이어지면 목소리도 이어진다 | signal_tag | none | no_human_name | "연결됨 표시는 위험과 구조를 같이 켭니다." | trace_bank | 길 안내 |
| r05_mass_005 | 빈 관객석 좌석표 | L3_function | document | R05 | E01_C05 | 방송/데이터 축 | 공개홀 관객석 | 마지막 수신탑 | object | 없는 관객의 평판 압력 | 좌석이 차면 의견도 생긴다 | human_stability | none | fragment_only | "박수 구역만 매진으로 표시됩니다." | trace_bank | 관객 NPC 대량화 |
| r05_mass_006 | 재난 자막 자동 교정기 | L2_trace | system_voice | R05 | E01_C05 | 방송/데이터 축 | 뉴스 스튜디오 | 마지막 수신탑 | voice | 기록 오염 잔향 | 오타를 고치면 사건도 고쳐진다 | campaign_density | none | no_human_name | "사망을 대기로 교정했습니다." | trace_bank | 충격 문구 남발 |
| r05_mass_007 | 끊긴 라디오 콜사인 | L2_trace | log | R05 | E01_C05 | 방송/데이터 축 | 중계탑 통신실 | 마지막 수신탑 | log | 원격 신호 밀도 | 호출부호가 남으면 송신자도 남는다 | signal_tag | none | fragment_only | "세 글자만 반복되고 위치는 없습니다." | trace_bank | 실명 방송 |
| r05_mass_008 | 박수 음향 루프 | L2_trace | system_voice | R05 | E01_C05 | 방송/데이터 축 | 공개 방송홀 | 마지막 수신탑 | voice | 인간 없는 캠페인 감각 | 반응음이 있으면 방송은 성공이다 | campaign_density | none | no_human_name | "웃음은 제때 나오고 사람은 늦습니다." | trace_bank | 공포 연출 과잉 |
| r05_mass_009 | 스튜디오 대기 명단 | L1_background | list_name | R05 | E01_C05 | 방송/데이터 축 | 뉴스 스튜디오 대기실 | 마지막 수신탑 | list_name | 출연자 잔향 | 명단이 있으면 차례도 있다 | signal_tag | none | fragment_only | "다음 출연자 칸에 날씨만 남았습니다." | background_only | 실존인 패러디 |
| r05_mass_010 | 방송 재개 자동 문구 | L0_pattern | signage | R05 | E01_C05 | 방송/데이터 축 | 송출실 전광판 | 마지막 수신탑 | signage | 송출 압박 반복 | 재개되면 세상도 이어진다 | signal_tag | none | no_human_name | "잠시 후 정상 재난으로 돌아갑니다." | background_only | NPC화 |
| r06_mass_001 | 회원 등급 브로커 | L5_core | human | R06 | E01_C06 | 도심 상권 | VIP 라운지 | 포인트 거리 | direct | 인간 악역과 약관의 얼굴 | 등급이 높으면 선택지도 높다 | membership_pressure | avoid_clause11 | role_first | "선택권은 무료가 아닙니다. 할인될 뿐이죠." | profile_v1 | 세계 원인화 |
| r06_mass_002 | 포인트 사채 중개자 | L4_major_support | human | R06 | E01_C06 | 도심 상권 | 포인트 거래 골목 | 포인트 거리 | direct | 태그 거래 후폭풍 | 빌리면 오늘은 산다 | supply_pressure | avoid_clause11 | name_late | "내일의 접근권을 오늘 쓰는 겁니다." | short_profile | 상점 NPC |
| r06_mass_003 | 리뷰 조작 대기열 관리자 | L4_major_support | human_internal | R06 | E01_C06 | 도심 상권 | 리뷰 키오스크 광장 | 포인트 거리 | background | 평판과 접근권 연결 | 별점이 높으면 사람이 덜 밀린다 | reputation_score | none | role_first | "좋은 평점은 문을 조금 늦게 닫습니다." | dialogue_bank | 코미디 NPC |
| r06_mass_004 | 멤버십 게이트 스캐너 | L3_function | device | R06 | E01_C06 | 도심 상권 | 회원 게이트 거리 | 포인트 거리 | object | 등급 심사 문턱 | 스캔하면 고객을 알 수 있다 | passage_tag | none | no_human_name | "고객님을 찾았습니다. 사람은 확인 중입니다." | trace_bank | OPEN-HOST 기능 |
| r06_mass_005 | 할인 라벨 재부착대 | L3_function | object_trace | R06 | E01_C06 | 도심 상권 | 회원 게이트 거리 | 포인트 거리 | object | 가격과 접근권 혼선 | 라벨을 바꾸면 가치도 바뀐다 | membership_pressure | none | no_human_name | "할인율은 커졌고 이름은 작아졌습니다." | trace_bank | 경제 시스템화 |
| r06_mass_006 | VIP 라운지 빈 서명 | L2_trace | document | R06 | E01_C06 | 도심 상권 | VIP 라운지 | 포인트 거리 | log | 동의와 약관 잔향 | 서명하면 보호받는다 | membership_pressure | avoid_clause11 | fragment_only | "동의 칸에는 손떨림만 남았습니다." | trace_bank | 계약 설명 장문 |
| r06_mass_007 | 별점 키오스크 사과문 | L2_trace | signage | R06 | E01_C06 | 도심 상권 | 리뷰 키오스크 광장 | 포인트 거리 | signage | 평판 조작 잔향 | 사과하면 별점이 회복된다 | reputation_score | none | no_human_name | "불편은 접수되었고 평점은 유지됩니다." | trace_bank | 코미디화 |
| r06_mass_008 | 할인 행사장 줄번호 | L1_background | list_name | R06 | E01_C06 | 도심 상권 | 블랙프라이데이 홀 | 포인트 거리 | list_name | 군중 압력 | 번호가 낮으면 살 수 있다 | human_stability | none | fragment_only | "1번부터 30번까지 모두 같은 이름으로 갱신됐습니다." | background_only | 군중 전투화 |
| r06_mass_009 | 거래 골목의 환불 쪽지 | L1_background | document | R06 | E01_C06 | 도심 상권 | 포인트 거래 골목 | 포인트 거리 | object | 비공식 경제 배경 | 환불이 있으면 거래는 공정했다 | supply_pressure | none | unnamed | "환불 사유가 구조 실패로 적혀 있습니다." | background_only | 브로커 미화 |
| r06_mass_010 | 멤버십 승급 알림 | L0_pattern | system_voice | R06 | E01_C06 | 도심 상권 | 회원 게이트 서버 | 포인트 거리 | voice | 등급 압박 반복 | 승급은 구원이다 | membership_pressure | none | no_human_name | "축하합니다. 더 많은 문이 당신을 기다립니다." | background_only | 보상 UI화 |
| r07_mass_001 | 출항 심사 보류관 | L5_core | human_internal | R07 | E01_C07 | 항만/공항 검역 축 | 마지막 출항 관리탑 | 마지막 출항권 | direct | 탈출 가능성 검증의 얼굴 | 나가면 살 수 있다 | passage_tag | avoid_gate09 | role_first | "밖이라는 말은 도장이 찍힌 뒤에만 씁니다." | profile_v1 | 탈출 해답화 |
| r07_mass_002 | 검역문 열화상 판독자 | L4_major_support | human_internal | R07 | E01_C07 | 항만/공항 검역 축 | 검역 게이트 | 마지막 출항권 | direct | 검역과 통행태그 갈등 | 정상 체온이면 통과해도 된다 | quarantine_status | avoid_gate09 | role_first | "통과 가능한 몸과 나가도 되는 사람은 다릅니다." | short_profile | 의료 반복 |
| r07_mass_003 | 수하물 오분류 접수원 | L4_major_support | human | R07 | E01_C07 | 항만/공항 검역 축 | 수하물 오분류 터미널 | 마지막 출항권 | object | 사람과 물건의 오분류 | 수하물이 찾는 곳이 주인의 곳이다 | delivery_state | avoid_return05 | name_late | "분실물은 돌아오는데 사람은 대기 중입니다." | dialogue_bank | 이루 반복 |
| r07_mass_004 | 냉동 컨테이너 기한표 | L3_function | document | R07 | E01_C07 | 항만/공항 검역 축 | 냉동 컨테이너 야드 | 마지막 출항권 | object | 보관 기한과 생존 압박 | 차갑게 두면 상하지 않는다 | supply_pressure | none | no_human_name | "기한은 늘었고 숨은 줄었습니다." | trace_bank | 냉기 던전화 |
| r07_mass_005 | 밀수 통행로 신호등 | L3_function | device | R07 | E01_C07 | 항만/공항 검역 축 | 비공식 하역로 | 마지막 출항권 | signage | 비공식 통행 압박 | 낮은 불빛이면 덜 들킨다 | passage_tag | avoid_quiet07 | no_human_name | "초록불은 허가가 아니라 합의입니다." | trace_bank | 길 안내 |
| r07_mass_006 | 탑승권 절취선 조각 | L2_trace | object_trace | R07 | E01_C07 | 항만/공항 검역 축 | 출항 관리탑 | 마지막 출항권 | object | 탈출 약속의 흔적 | 찢긴 표도 목적지를 기억한다 | passage_tag | none | fragment_only | "목적지는 남고 좌석은 지워졌습니다." | trace_bank | 희망 보상화 |
| r07_mass_007 | 항만 관제 무응답 로그 | L2_trace | log | R07 | E01_C07 | 항만/공항 검역 축 | 관제실 | 마지막 출항권 | log | 바깥 세계 정보 지연 | 응답 없음은 아직 시도 중이다 | signal_tag | none | no_human_name | "응답 없음이 너무 규칙적으로 돌아옵니다." | trace_bank | 세계 진실 조기 |
| r07_mass_008 | 검역 대기열 이름 조각 | L1_background | list_name | R07 | E01_C07 | 항만/공항 검역 축 | 검역 게이트 | 마지막 출항권 | list_name | 봉쇄 군중 | 줄이 있으면 아직 문은 열린다 | quarantine_status | none | fragment_only | "도착국 칸은 비어 있고 체온만 남았습니다." | background_only | 실명 국가 노출 |
| r07_mass_009 | 방파제의 젖은 가격표 | L1_background | document | R07 | E01_C07 | 항만/공항 검역 축 | 밀수 통행로 | 마지막 출항권 | object | 브로커/탈출 소문 배경 | 값이 있으면 길도 있다 | supply_pressure | none | unnamed | "가격은 세 번 고쳤고 방향은 한 번도 안 썼습니다." | background_only | 거래 퀘스트 |
| r07_mass_010 | 출항 지연 자동 문구 | L0_pattern | system_voice | R07 | E01_C07 | 항만/공항 검역 축 | 출항 관리탑 | 마지막 출항권 | voice | 탈출 지연 반복 | 지연은 취소가 아니다 | passage_tag | none | no_human_name | "안전을 위해 출항을 조금 더 보존합니다." | background_only | 탈출 설명 |
| r08_mass_001 | 가짜 구조 신호 보관자 | L5_core | human_internal | R08 | E01_C08 | 수도권 서부 외곽 | 가짜 구조 신호탑 | 서부 비상보급망 | direct | R08-L05 보스 전 내부 위기 | 구조 신호가 크면 더 빨리 산다 | signal_stability | avoid_quiet07 | role_first | "크게 부르면 우리만 듣는다는 보장이 있습니까." | profile_v1 | 여울 대체 |
| r08_mass_002 | 폐역 중계실 열쇠 담당 | L4_major_support | human | R08 | E01_C08 | 수도권 서부 외곽 | 폐역 지하 통신실 | 서부 비상보급망 | direct | 인양 반경 확장 비용 | 열쇠가 있으면 신호도 열린다 | extraction_stability | avoid_quiet07 | name_late | "열 수는 있습니다. 닫을 방법이 문제죠." | short_profile | KEY-RING 반복 |
| r08_mass_003 | 민방위 급수표 관리자 | L4_major_support | human_resident | R08 | E01_C08 | 수도권 서부 외곽 | 민방위 저장고 급수대 | 서부 비상보급망 | object | 물자 압박의 생활 얼굴 | 물표가 맞으면 싸움은 줄어든다 | supply_pressure | avoid_mina | role_first | "물은 남았습니다. 차례가 줄었을 뿐입니다." | dialogue_bank | 미나 대체 |
| r08_mass_004 | 주유소 송신 장비판 | L3_function | device | R08 | E01_C08 | 수도권 서부 외곽 | 역송출 주유소 | 서부 비상보급망 | object | 인양 장비 근거 | 장비가 켜지면 좌표도 안전하다 | extraction_stability | none | no_human_name | "출력은 올랐고 잡음도 같이 따라왔습니다." | trace_bank | 장비 강화 NPC |
| r08_mass_005 | 수동 잠금문 점검표 | L3_function | document | R08 | E01_C08 | 수도권 서부 외곽 | 민방위 저장고 | 서부 비상보급망 | object | 저장고 폐쇄 압박 | 잠그면 안쪽 몫은 지킨다 | ration_tag | avoid_storehouse_keeper | no_human_name | "닫힘 표시는 안쪽과 바깥을 같이 줄입니다." | trace_bank | 배급 상점 |
| r08_mass_006 | 낮은 전파 지도 조각 | L3_function | object_trace | R08 | E01_C08 | 수도권 서부 외곽 | 폐역 무음 플랫폼 | 서부 비상보급망 | object | 침묵권 물리 근거 | 낮을수록 안전하다 | signal_stability | avoid_quiet07 | no_human_name | "가장 조용한 칸에 회수선이 늦게 그어졌습니다." | trace_bank | 만능 지도 |
| r08_mass_007 | 구조 방송 지연 로그 | L2_trace | log | R08 | E01_C08 | 수도권 서부 외곽 | 가짜 구조 신호탑 | 서부 비상보급망 | log | 가짜 구조 신호 예고 | 늦은 방송은 안전하게 검증된 방송이다 | signal_tag | none | no_human_name | "지연이 일정하면 누군가 맞추고 있는 겁니다." | trace_bank | 배신자 확정 |
| r08_mass_008 | 폐역 플랫폼 도착음 | L2_trace | system_voice | R08 | E01_C08 | 수도권 서부 외곽 | 폐역 무음 플랫폼 | 서부 비상보급망 | voice | 무음과 도착의 모순 | 도착음이 없으면 추적도 없다 | signal_stability | avoid_station_echo | no_human_name | "소리가 없는 도착은 도착으로 기록되지 않습니다." | trace_bank | 여울 튜토리얼 |
| r08_mass_009 | 주유소 캐노피 낙서 | L2_trace | signage | R08 | E01_C08 | 수도권 서부 외곽 | 침묵 보급소 밖 캐노피 | 서부 비상보급망 | signage | 보급소 바깥 경계 | 낙서를 남기면 위치도 남는다 | trace_preservation | none | fragment_only | "여기라고 적힌 글씨가 반쯤 긁혔습니다." | trace_bank | 보급소 확대 |
| r08_mass_010 | 신호 낮춤 대기자 명단 | L1_background | list_name | R08 | E01_C08 | 수도권 서부 외곽 | 폐역 통신실 | 서부 비상보급망 | list_name | 침묵권 군중 압력 | 명단에서 빠지면 덜 들킨다 | signal_stability | avoid_quiet07 | fragment_only | "빠진 이름 옆에 귀환 시간이 없습니다." | background_only | 여울 직접 반복 |
| r08_mass_011 | 저장고 줄 끝 식량표 | L1_background | document | R08 | E01_C08 | 수도권 서부 외곽 | 민방위 저장고 | 서부 비상보급망 | list_name | 배급 군중 밀도 | 표가 있으면 몫은 있다 | ration_tag | none | fragment_only | "식량표는 젖었고 줄은 말라 있습니다." | background_only | 배급 퀘스트 |
| r08_mass_012 | 비콘 끈을 잡은 손자국 | L1_background | object_trace | R08 | E01_C08 | 수도권 서부 외곽 | 역송출 주유소 | 서부 비상보급망 | object | 인양 공포 배경 | 흔적이 남으면 찾을 수 있다 | extraction_stability | none | unnamed | "손자국은 짧고 끈은 길게 닳았습니다." | background_only | 구출 대상화 |
| r08_mass_013 | 구조 신호 반복 문구 | L0_pattern | system_voice | R08 | E01_C08 | 수도권 서부 외곽 | 가짜 구조 신호탑 | 서부 비상보급망 | voice | R08 후반 압박 반복 | 크게 부르면 더 빨리 구조된다 | signal_tag | none | no_human_name | "구조 대기자는 위치를 유지해 주십시오." | background_only | 보스 직접 설명 |
| r08_mass_014 | 무음 플랫폼 안내 패턴 | L0_pattern | signage | R08 | E01_C08 | 수도권 서부 외곽 | 폐역 무음 플랫폼 | 서부 비상보급망 | signage | 낮은 수신 반복 | 안내가 없으면 위험도 없다 | signal_stability | none | no_human_name | "안내 없음은 정상 운행입니다." | background_only | STATION-ECHO 대체 |

---

## 3. L5/L4 승격 후보

L5/L4 후보는 총 28개다.
이 중 실제 직접 대면 우선은 16개 이하로 제한한다.

| 우선 | npc_seed_id | 이유 | 다음 문서 |
|---:|---|---|---|
| 1 | r02_mass_001 | R02 후반 퇴원 불가 심사 절차를 사람 얼굴로 보여줄 수 있다 | story/03_regions/r02_discharge_review_face_profile_v0_1.md |
| 2 | r03_mass_001 | 윤서의 R03 핵심 보스 전 검산을 받치는 후보 | story/03_regions/r03_final_return_review_face_profile_v0_1.md |
| 3 | r04_mass_001 | R04 후반 정품/재동기화 절차를 PATCH/리오와 분리해 보여줄 후보 | story/03_regions/r04_resync_watch_profile_v0_1.md |
| 4 | r08_mass_001 | R08-L05 가짜 구조 신호의 인간 책임과 오판을 보여줄 후보 | story/03_regions/r08_false_rescue_keeper_profile_v0_1.md |
| 5 | r06_mass_001 | 인간 브로커와 멤버십 약관을 결합하는 시즌 악의 후보 | story/03_regions/r06_member_rank_broker_profile_v0_1.md |
| 6 | r07_mass_001 | 탈출 가능성 검증과 검역/출항 판정을 대표하는 후보 | story/03_regions/r07_departure_hold_officer_profile_v0_1.md |
| 7 | r05_mass_001 | R05 후반 세계 진실을 직접 설명하지 않고 잔향으로 묶는 후보 | story/03_regions/r05_last_anchor_shadow_profile_v0_1.md |
| 8 | hub_mass_001 | 보급소가 밤에도 안전하지 않다는 생활 압박을 보여준다 | story/02_hub/hub_night_counter_short_profile_v0_1.md |
| 9 | r01_mass_001 | R01 보스 후 사진/기억 후폭풍을 FRAME-LEFT와 겹치지 않게 보조한다 | story/03_regions/r01_photo_correction_trace_note_v0_1.md |
| 10 | r02_mass_002 | 하람 해금 전 보호자 미확인 압박을 직접 보조한다 | story/03_regions/r02_guardian_call_support_profile_v0_1.md |
| 11 | r03_mass_002 | 이루 해금 전 벨트 정지 선택을 직접 보조한다 | story/03_regions/r03_manual_stop_support_profile_v0_1.md |
| 12 | r04_mass_002 | PATCH의 부품화와 다른 리콜 접수 절차를 보여준다 | story/03_regions/r04_recall_reception_support_profile_v0_1.md |
| 13 | r08_mass_002 | 침묵권 확장과 인양 반경의 비용을 보여준다 | story/03_regions/r08_station_key_support_profile_v0_1.md |
| 14 | r06_mass_002 | 태그 사채와 멤버십 악용을 인간 행위자로 묶는다 | story/03_regions/r06_point_debt_support_profile_v0_1.md |
| 15 | r07_mass_002 | GATE-09와 충돌하지 않게 검역/통행 판정을 분리한다 | story/03_regions/r07_quarantine_reader_support_profile_v0_1.md |
| 16 | r05_mass_002 | R05 방송 편집의 윤리 문제를 짧은 보조 NPC로 보여준다 | story/03_regions/r05_news_editor_support_profile_v0_1.md |
| 17 | hub_mass_002 | 로봇 대기열과 팝시/PATCH의 감정 차이를 보조한다 | story/02_hub/hub_robot_charge_wait_dialogue_v0_1.md |
| 18 | r01_mass_002 | 가족 칸 자동 보정 압박을 WELCOME-DESK 없이 확장한다 | story/03_regions/r01_guardian_slot_trace_note_v0_1.md |
| 19 | r02_mass_003 | 약품 봉인과 진료태그 부담을 대사 은행으로 넘길 수 있다 | story/03_regions/r02_medicine_seal_dialogue_v0_1.md |
| 20 | r03_mass_003 | R03 보증 창고와 R04 로봇 축의 가교가 된다 | story/03_regions/r03_warranty_sticker_dialogue_v0_1.md |
| 21 | r04_mass_003 | 폐기 프레스 선택 후폭풍을 후반 P2로 밀 수 있다 | story/03_regions/r04_press_arranger_trace_note_v0_1.md |
| 22 | r05_mass_003 | 추천 서버를 사람 악역이 아니라 인프라 잔향으로 보여준다 | story/03_regions/r05_recommendation_heat_trace_bank_v0_1.md |
| 23 | r06_mass_003 | 리뷰/평판 조작을 배경이 아니라 상태값으로 연결한다 | story/03_regions/r06_review_queue_dialogue_v0_1.md |
| 24 | r07_mass_003 | R03과 겹치지 않는 수하물 오분류 미스터리를 만든다 | story/03_regions/r07_baggage_misroute_dialogue_v0_1.md |
| 25 | r08_mass_003 | 민방위 저장고의 물자 압박을 미나와 분리한다 | story/03_regions/r08_water_ration_dialogue_v0_1.md |
| 26 | r02_mass_004 | R02-L04 격리문 복도를 직접 열지 않고 예고한다 | story/03_regions/r02_isolation_door_trace_bank_v0_1.md |
| 27 | r03_mass_004 | R03-L04 파쇄 전 대기라인을 음성 잔향으로 예고한다 | story/03_regions/r03_compression_queue_trace_bank_v0_1.md |
| 28 | r04_mass_004 | R04 충전 차단 잔향을 유건과 겹치지 않게 보조한다 | story/03_regions/r04_charge_disconnect_trace_bank_v0_1.md |

---

## 4. L2/L1/L0 잔향/배경 은행

| 유형 | 후보 수 | 사용처 | 예시 문구 |
|---|---:|---|---|
| L2_trace | 28 | 반복 출격 중 조사 오브젝트, 로그, 음성 잔향 | "완료된 대상은 더 이상 응답하지 않아도 됩니다." |
| L1_background | 24 | 대기열, 명단, 줄 끝 이름, 게시물, 손글씨 | "성만 남은 호출이 세 번 반복됩니다." |
| L0_pattern | 15 | 자동 안내, 앱 알림, 전광판, 경고문 | "잠시 후 정상 재난으로 돌아갑니다." |
| 직접 대면 제외 L3 | 20+ | 시설 기능과 상태값 힌트 | "봉인은 숫자를 멈추고 빚은 남겼습니다." |

운영 규칙:

```text
1. L2/L1/L0는 이름 있는 NPC로 자동 승격하지 않는다.
2. 반복 런의 밀도는 문구, 명단, 로그, 소리의 변화로 만든다.
3. 기존 NPC가 반응할 수 있는 흔적은 보급소 대사 은행으로 넘긴다.
4. 오브젝트가 충분하면 사람 모델을 추가하지 않는다.
```

---

## 5. 플레이어블 충돌 검산

| 플레이어블/후보 | 충돌 위험 | 검산 결과 |
|---|---|---|
| 윤서 | R03 회수/반품 판정이 NPC에게 넘어감 | R03 후보는 수취, 분류, 보증, 파쇄 잔향으로 분리했다 |
| PATCH | R04 수리/부품화와 로봇 자율성 감정 반복 | R04 후보는 리콜/충전/프레스 절차로 제한하고 수리 기능을 금지했다 |
| OPEN-HOST | R01 안내/동선 기능 반복 | R01 대량 후보는 안내보다 사진, 보호자 칸, 앱 알림, 택배함 잔향 중심으로 배치했다 |
| 강하람 / HOLD-04 | R02 퇴원 보류 전투와 힐러화 | R02 후보는 보호자 호출, 약품 봉인, 병상/격리 잔향으로 분리했다 |
| 한이루 / RETURN-05 | R03 반송 수취인과 미수령 전투 반복 | R03 후보는 수동 정지, 보증 스티커, 파쇄 대기라인으로 분리했다 |
| 차유건 / METER-06 | R04 계량 초과/충전 차단 전투 반복 | R04 후보는 감시, 리콜, 폐기, 잔향으로 분리하고 버퍼화를 금지했다 |
| 백여울 / QUIET-07 | 침묵권 은신/신호 조절 전투 반복 | R08 후보는 중계실, 저장고, 가짜 구조 신호, 비콘 배경으로 분리했다 |
| 리오 / RIO-08 | 정품 복구와 객실 초기화 공포 조기 공개 | R04 후보는 리오의 체류/숙박권을 설명하지 않도록 금지했다 |
| Mika Arakawa / GATE-09 | 검역/게이트 통과 판정 반복 | R07 후보는 출항/검역/수하물로 분리하고 빠른 이동 기능을 금지했다 |

---

## 6. 이름/국적/현실 위치 검산

이름 정책:

```text
1. 이 문서의 120개 후보는 대부분 역할명/오브젝트명/잔향명으로 유지한다.
2. L5/L4 승격 후보라도 본명은 후속 프로필에서 별도 검산한다.
3. R02/R03/R04/R08 최소안의 본명 후보와 중복되는 이름을 추가하지 않았다.
4. 로봇/장치/시스템/오브젝트 후보에는 사람 이름을 붙이지 않았다.
5. L1 배경 인물은 fragment_only 또는 unnamed로 유지했다.
```

현실 위치 검산:

| 지역 | 관리자 현실 권역 | 검산 |
|---|---|---|
| HUB/R08 | 수도권 서북/서부 외곽 간선도로권 | 주유소, 편의점, 변전소, 폐역, 저장고로 제한 |
| R01 | 수도권 외곽 신도시형 주거 벨트 | 분양 주택, 모델하우스, 우편함, 배수로 중심 |
| R02 | 수도권 대형 병원군 | 응급실, 입원동, 약국, 격리문, 심사 데스크 중심 |
| R03 | 수도권 물류축 | 반품 야드, 자동 분류장, 보증 창고, 파쇄 라인 중심 |
| R04 | 수도권 산업단지 | 충전소, 배터리 공장, 리콜 서버, 폐기 프레스 중심 |
| R05 | 방송/데이터 축 | 중계탑, 뉴스 스튜디오, 추천 서버, 송출실 중심 |
| R06 | 도심 상권 | 멤버십 게이트, 거래 골목, 리뷰 광장, VIP 라운지 중심 |
| R07 | 항만/공항 검역 축 | 검역 게이트, 컨테이너, 수하물, 출항 관리탑 중심 |

주의:

```text
실명 도시/병원/기업/방송국/공항 이름은 후보 테이블에 노출하지 않았다.
관리자 현실 권역은 제작 기준으로만 사용한다.
```

---

## 7. 다음 작업

추천 순서:

```text
1. L5/L4 승격 후보 28개 재분류 완료.
2. story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md를 기준으로 사용한다.
3. 프로필 v1.0 우선 후보 중 1차 필수 3명 상세화 완료.
4. v0.1 짧은 프로필, 대사 은행, 잔향/배경 은행, 이름/현실 위치 검산 완료.
5. 이후 전역 NPC 스토리 네트워크 실제 산출 또는 E02 첫 외부 슬라이스 NPC 후보 풀로 진행한다.
```

완료 산출물:

```text
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md
```

완료된 1차 산출물:

```text
story/03_regions/r06_member_rank_broker_profile_v1_0.md
story/03_regions/r02_discharge_review_face_profile_v1_0.md
story/03_regions/r03_final_return_review_officer_profile_v1_0.md
```

다음 후보 산출물:

```text
story/03_regions/global_npc_story_seed_registry_v0_1.md
story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md
story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md
story/06_characters/playable_global_npc_link_matrix_v0_1.md
story/03_regions/global_npc_name_location_exposure_registry_v0_1.md
```

완료 기준:

1. E01 전체 후보가 120개로 작성되었다.
2. 각 후보가 L5/L4/L3/L2/L1/L0 중 하나로 분류되었다.
3. 기존 보급소 5명, R01 12명, E01 보조 최소안 12명을 대체하지 않는다.
4. L5/L4 승격 후보 28개가 후속 상세화 후보로 분리되었다.
5. L2/L1/L0는 이름 있는 NPC로 과승격하지 않는 기준을 가진다.
6. L5/L4 묶음 산출물 4개가 작성되어 8/8/7/28 수량이 검증 가능하다.

최종 판정:

```text
통과.
E01 NPC 대량 후보 풀은 제작팀이 세계 밀도와 후속 상세화 후보를 동시에 관리하는 기준으로 사용 가능하다.
단, 전역 NPC 340~480개는 아직 실제 산출물이 아니라 별도 프롬프트 단계다.
```
