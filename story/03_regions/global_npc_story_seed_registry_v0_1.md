# 전역 NPC 스토리 시드 레지스트리 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 범위:
E01~E12 / 96개 정식 캠페인 / 전역 NPC, 잔향, 기록, 배경 씨앗 420개

판정:
조건부 통과

조건:
E01 120개 후보 풀은 기존 문서를 전역 레지스트리에 연결한다.
E02는 첫 외부 슬라이스용 48개 씨앗을 별도 묶음으로 둔다.
E03~E12는 96개 캠페인 빈칸 방지를 위한 최소 240개 씨앗을 먼저 깐다.
전역 교차 축 12개를 추가해 장기 미스터리와 플레이어블 연결을 받는다.
```

이 문서는 모든 씨앗을 장문 프로필로 쓰는 문서가 아니다.
목표는 96개 캠페인 어디에서 이야기가 튀어나와도 받을 최소 얼굴, 잔향, 기록, 배경을 미리 배치하는 것이다.

후속 수량 기준:

```text
420개는 1차 게이트다.
전역 수량 만족 기준은 story/03_regions/global_npc_quantity_satisfaction_matrix_v0_1.md에서 768개 제작 슬롯으로 확장했다.
실제 증분 +348 슬롯은 story/03_regions/global_npc_expansion_slot_registry_v0_1.md에서 E02~E12와 cross_region에만 배정했다.
검수 전 기준은 story/03_regions/global_npc_pre_review_overfill_matrix_v0_1.md에서 1,024개 제작 슬롯으로 확장했다.
장기 목표는 story/03_regions/global_npc_full_scale_target_ladder_v0_1.md에서 10,240개 제작 슬롯으로 설정했다.
1차 검수 배치는 story/03_regions/global_npc_2048_pre_review_wave_v0_1.md에서 2,048개 제작 슬롯으로 확장했다.
```

---

## 0. 수량 요약

| 범위 | 수 | 처리 |
|---|---:|---|
| E01 기존 후보 풀 | 120 | `story/03_regions/e01_npc_mass_candidate_pool_v0_1.md`를 전역 기준점으로 연결 |
| E02 첫 외부 슬라이스 | 48 | 캠페인당 6개 씨앗, GATE-09 중심이지만 C03/C04/C05/C07에 과밀하지 않게 분산 |
| E03~E12 기본 커버리지 | 240 | 10개 광역권 x 8개 캠페인 x 3개 씨앗 |
| 전역 교차 축 | 12 | 광역권별 장기 미스터리, 반전, 작은 결말 연결점 |
| 합계 | 420 | 340~480 목표 범위 안 |

계층 분포 기준:

| 계층 | 기준 수 | 용도 |
|---|---:|---|
| G5_global_core | 24 | 광역권 대표, 장기 미스터리, 플레이어블 장기 연결 |
| G4_season_core | 62 | 시즌 핵심, 반전, 작은 결말 후보 |
| G3_campaign_function | 104 | 96개 캠페인의 절차 얼굴 |
| G2_trace_record | 126 | 로그, 방송, 사진, 영수증, 명단, 자동 음성 |
| G1_background / G0_pattern | 104 | 군중, 대기열, 자동 문구, 표지판 |
| 합계 | 420 | 전역 1차 게이트 |

주의:

```text
420개는 모두 완성급 NPC가 아니다.
완성급 NPC 20명 기준은 유지한다.
이 문서의 다수는 대사 은행, 잔향 은행, 배경 은행 후보로 남긴다.
```

---

## 1. 전역 제작 원칙

1. E01은 버리지 않고 첫 기준점으로 둔다.
2. E02는 첫 외부 슬라이스이므로 직접 대면 후보를 조금 두껍게 둔다.
3. E03~E12는 빈 캠페인을 없애는 최소 씨앗을 우선한다.
4. 각 정식 캠페인은 최소 `G3 기능 NPC`, `G2 잔향/기록`, `G1/G0 배경/패턴`을 가진다.
5. 이름은 먼저 붙이지 않는다. 역할명, 조각명, 시스템명, 명단명을 우선한다.
6. 플레이어블 20인과 연결되지 않는 고립 NPC를 대량 생산하지 않는다.
7. 현실 권역은 관리자 필드로만 쓰고, 유저 노출명은 캠페인식 가명을 쓴다.

공통 금지:

```text
전부 직접 대면 NPC화
전부 장문 프로필 v1.0화
실명 도시/기관/기업 노출
플레이어블 기능 대체
E01만 두껍게 만들고 외부를 비우기
```

---

## 2. E01 연결 요약

E01은 신규로 다시 만들지 않는다.

| 기준 | 수 | 전역 연결 |
|---|---:|---|
| E01 후보 풀 | 120 | 전역 레지스트리의 E01 기준점 |
| E01 L5/L4 검토 | 28 | G5/G4/G3 승격 검산 기준 |
| 프로필 v1.0 1차 | 3 | 완성급 NPC 20명에 포함 |
| v0.1 짧은 프로필 | 8 | G4/G3 조건부 후보 |
| 대사 은행 | 8 | G3/G2 조건 대사 후보 |
| 잔향/배경 하향 | 7 | G2/G1/G0 유지 후보 |

E01 연결 문서:

```text
story/03_regions/e01_npc_mass_candidate_pool_v0_1.md
story/03_regions/e01_npc_l5_l4_promotion_review_v0_1.md
story/03_regions/e01_l5_l4_short_profiles_v0_1.md
story/03_regions/e01_l5_l4_dialogue_bank_v0_1.md
story/03_regions/e01_npc_trace_background_bank_v0_1.md
story/03_regions/e01_npc_name_location_registry_v0_1.md
```

E01에서 외부로 넘어가는 핵심 다리:

| E01 축 | 외부 연결 | 쓰임 |
|---|---|---|
| R05 마지막 수신탑 | E02_C05, E07_C05, E09_C05, E12_C05 | 수신/공영/케이블/모바일 방송의 반복 진실 |
| R06 포인트 거리 | E02_C06, E06_C06, E09_C06, E11_C06, E12_C06 | 멤버십과 결제 예외의 전역 변형 |
| R07 마지막 출항권 | E02_C07, E06_C07, E08_C07, E10_C07 | 통행/검역/환승/피난 심사의 변형 |
| R08 서부 비상보급망 | E04_C08, E06_C08, E10_C08, E12_C08 | 비상보급, 급수, 침묵권, 낮은 수신의 변형 |

---

## 3. E02 첫 외부 슬라이스 씨앗 48개

E02는 `Mika Arakawa / GATE-09`와 연결되지만 E02_C07만 두껍게 만들지 않는다.
각 캠페인에 6개 씨앗을 둔다.

| 캠페인 | 핵심 6개 씨앗 | 플레이어블 연결 | 승격 후보 |
|---|---|---|---|
| E02_C01 통근 가족주택권 | `g_E02_C01_g4_001` 가족 정기권 보류자, `g_E02_C01_g3_001` 세대 갱신 창구, `g_E02_C01_g2_001` 통근 정기권 로그, `g_E02_C01_g2_002` 환승 주택 호출음, `g_E02_C01_g1_001` 가족 정기권 명단 조각, `g_E02_C01_g0_001` 막차 전 세대 알림 | OPEN-HOST, OBS-20 | profile_v0_1 후보 |
| E02_C02 만성 대기 진료권 | `g_E02_C02_g4_001` 예약 보류 심사자, `g_E02_C02_g3_001` 번호표 재발급 담당, `g_E02_C02_g2_001` 야간 클리닉 접수 로그, `g_E02_C02_g2_002` 처방 대기 음성, `g_E02_C02_g1_001` 만성 대기 명단, `g_E02_C02_g0_001` 예약 지연 안내 | HOLD-04, OBS-20 | dialogue_bank 후보 |
| E02_C03 역전 수령함 회수권 | `g_E02_C03_g5_001` 마지막 보관함 수취인, `g_E02_C03_g4_001` 편의점 회수 카운터 잔류자, `g_E02_C03_g3_001` 미수령품 보관 담당, `g_E02_C03_g2_001` 물품보관함 만료 로그, `g_E02_C03_g1_001` 막차 뒤 수령명단, `g_E02_C03_g0_001` 보관 연장 자동문구 | RETURN-05, GATE-09 | profile_v1 후보 |
| E02_C04 정밀부품 리콜권 | `g_E02_C04_g4_001` 미세부품 검수자, `g_E02_C04_g3_001` 리콜 검사 라인 담당, `g_E02_C04_g2_001` 부품 인증 실패 로그, `g_E02_C04_g2_002` 정밀 조립실 경고음, `g_E02_C04_g1_001` 리콜 라벨 조각, `g_E02_C04_g0_001` 보증 미세문자 | PATCH, METER-06, RIO-08 | profile_v0_1 후보 |
| E02_C05 재난안내 생방송권 | `g_E02_C05_g5_001` 방재 문구 승인자, `g_E02_C05_g4_001` 반복 안내 편집자, `g_E02_C05_g3_001` 전광판 수신 확인 담당, `g_E02_C05_g2_001` 재난 생방송 지연 로그, `g_E02_C05_g1_001` 잘린 안내 자막, `g_E02_C05_g0_001` 대피 방향 자동문구 | BROAD-10, QUIET-07 | profile_v1 후보 |
| E02_C06 편의점 멤버십권 | `g_E02_C06_g4_001` 심야 적립 예외자, `g_E02_C06_g3_001` 포인트 키오스크 관리자, `g_E02_C06_g2_001` 편의점 영수증 로그, `g_E02_C06_g2_002` 적립 실패 음성, `g_E02_C06_g1_001` 야간 회원 대기열, `g_E02_C06_g0_001` 할인 종료 문구 | CLAUSE-11, RATION-16 | dialogue_bank 후보 |
| E02_C07 지하철 환승 심사권 | `g_E02_C07_g5_001` 막차 환승 보류관, `g_E02_C07_g4_001` 정기권 판독자, `g_E02_C07_g3_001` 플랫폼 잔류 처리 담당, `g_E02_C07_g2_001` 개찰 미통과 로그, `g_E02_C07_g1_001` 막차 탑승권 조각, `g_E02_C07_g0_001` 환승 종료 안내 | GATE-09, TRANSIT-14 | profile_v1 후보 |
| E02_C08 무음 대피소권 | `g_E02_C08_g4_001` 지하 대피실 조용한 관리자, `g_E02_C08_g3_001` 방재창고 배급표 담당, `g_E02_C08_g2_001` 고가 하부 대피 로그, `g_E02_C08_g2_002` 무음 구역 수신음, `g_E02_C08_g1_001` 비상식량 명단, `g_E02_C08_g0_001` 소등 후 대피문구 | QUIET-07, RATION-16 | trace_bank 후보 |

---

## 4. E03~E12 기본 커버리지 240개

아래 표의 각 행은 캠페인당 3개 씨앗을 의미한다.
seed id는 `g_[campaign_id]_g3_001`, `g_[campaign_id]_g2_001`, `g_[campaign_id]_g1_001` 형식으로 고정한다.

| 광역권 | 캠페인 | G3 기능 NPC | G2 잔향/기록 | G1/G0 배경 | 주요 연결 |
|---|---|---|---|---|---|
| E03 | C01 스마트단지 입주권 | 얼굴인증 단지 입주 보류자 | 스마트 세대 갱신 로그 | 얼굴 없는 입주 명단 | OPEN-HOST, NAME-18 |
| E03 | C02 도시보험 진료권 | 자동 처방 승인 담당 | 보험 접수 결제 로그 | 처방 대기 번호 조각 | HOLD-04, CLAUSE-11 |
| E03 | C03 초대형 분류항 회수권 | 항만 분류항 회수 담당 | 자동 반품 터미널 로그 | 컨테이너 수취인 조각 | RETURN-05, LEDGER-12 |
| E03 | C04 제조클러스터 정품권 | 부품 인증 게이트 담당 | 생산품 추적 실패 로그 | 인증 라벨 조각 | PATCH, METER-06 |
| E03 | C05 플랫폼 추천권 | 추천 서버 프로필 관리자 | 라이브 피드 편집 로그 | 잘린 개인화 문구 | REVIEW-15, BROAD-10 |
| E03 | C06 라이브커머스 회원권 | 즉시구매 대기열 관리자 | 결제 예약 방송 로그 | 구매자 호출 조각 | CLAUSE-11, LEDGER-12 |
| E03 | C07 항만통관 이동권 | 통관 게이트 보류관 | 고속철 검문 로그 | 통관 대기열 이름 조각 | GATE-09, TRANSIT-14 |
| E03 | C08 지하 배급망권 | 지하 배급로 명단 담당 | 폐쇄 방공 상점 영수증 | 지하 상가 피난 명단 | RATION-16, QUIET-07 |
| E04 | C01 수상주거 가족권 | 임시 주소 부표 관리자 | 침수 세대 갱신 로그 | 젖은 가족 명단 | OPEN-HOST, NAME-18 |
| E04 | C02 열대격리 진료권 | 살균 텐트 격리 판정자 | 열대 격리소 경고음 | 격리 손목표 조각 | HOLD-04, QUIET-07 |
| E04 | C03 배달앱 회수권 | 침수 픽업존 회수 담당 | 배달 실패 앱 로그 | 기사 대기명 조각 | RETURN-05, LINE-19 |
| E04 | C04 침수충전 정품권 | 배터리 건조실 판독자 | 침수 충전 차단 로그 | 젖은 충전표 | METER-06, PATCH |
| E04 | C05 관광추천 수신권 | 추천 투어 보류 안내자 | 오디오 가이드 반복 로그 | 투어 명단 조각 | BROAD-10, REVIEW-15 |
| E04 | C06 야시장 멤버십권 | 노점 리뷰판 관리자 | 모바일 결제 실패 로그 | 야시장 할인표 | CLAUSE-11, LEDGER-12 |
| E04 | C07 페리검역 통행권 | 섬 검역 부표 판독자 | 승선 심사 지연 로그 | 페리 탑승권 조각 | GATE-09, TRANSIT-14 |
| E04 | C08 고지대 보급권 | 빗물 저장고 배급 담당 | 고지대 학교 보급 로그 | 물표 명단 조각 | RATION-16, QUIET-07 |
| E05 | C01 고밀도 세대등록권 | 세대번호 계단 등록자 | 임차인 갱신 로그 | 계단 주소 조각 | OPEN-HOST, NAME-18 |
| E05 | C02 대기열 진료권 | 무한 접수줄 판정자 | 처방 대기 마당 로그 | 대기표 이름 조각 | HOLD-04, RATION-16 |
| E05 | C03 철도소포 반품권 | 철도 소포창고 보류관 | 역전 반품시장 로그 | 소포 수취인 조각 | RETURN-05, GATE-09 |
| E05 | C04 전력피크 충전권 | 피크타임 충전 제한자 | 전력 배급 변전 로그 | 충전 순번표 | METER-06, LOCKOUT-17 |
| E05 | C05 모바일 안내 수신권 | 안내 문자 승인 담당 | 기지국 광장 수신 로그 | 문자 실패 명단 | BROAD-10, OBS-20 |
| E05 | C06 초저가 회원권 | 할인 시장 결제 보류자 | 결제 QR 실패 로그 | 쿠폰 조각 | CLAUSE-11, REVIEW-15 |
| E05 | C07 철도탑승 통행권 | 승강장 심사대 보류관 | 탑승권 터널 로그 | 미탑승 승객표 | GATE-09, TRANSIT-14 |
| E05 | C08 공동급수 보급권 | 물배급 줄 조정자 | 학교 보급 창고 로그 | 급수 명단 조각 | RATION-16, QUIET-07 |
| E06 | C01 냉방주거 입주권 | 냉방 타워 입주 판정자 | 스마트 로비 냉방 로그 | 냉방층 세대명 | OPEN-HOST, METER-06 |
| E06 | C02 프리미엄 케어권 | 웰니스 병동 예약 보류자 | VIP 진료 승인 로그 | 프리미엄 대기명 | HOLD-04, CLAUSE-11 |
| E06 | C03 자동배송 회수권 | 드론 포트 미수령 담당 | 자동배송 창고 로그 | 주문 캡슐 이름표 | RETURN-05, LINE-19 |
| E06 | C04 에너지 정품충전권 | 에너지 게이트 인증자 | 배터리 팜 충전 로그 | 태양광 사용표 | METER-06, PATCH |
| E06 | C05 스마트시티 추천권 | 도시 관제 추천 담당 | 광고 스크린 판단 로그 | 추천 경관 명단 | BROAD-10, REVIEW-15 |
| E06 | C06 몰 VIP 결제권 | VIP 게이트 등급 판정자 | 명품 보관 결제 로그 | 라운지 대기명 | CLAUSE-11, LEDGER-12 |
| E06 | C07 공항검역 이송권 | 환승 검역홀 보류관 | 자동 탑승 터널 로그 | 탑승 게이트 조각 | GATE-09, TRANSIT-14 |
| E06 | C08 물배급 대피권 | 담수 배급 밸브 담당 | 지하 물탱크 로그 | 급수권 명단 | RATION-16, QUIET-07 |
| E07 | C01 임대복지 거주권 | 임대 심사 단지 담당 | 복지 세대 갱신 로그 | 임차인 명단 조각 | OPEN-HOST, NAME-18 |
| E07 | C02 보험통합 진료권 | 보험 진료센터 보류관 | 복지 약국 정산 로그 | 보험 접수번호 | HOLD-04, CLAUSE-11 |
| E07 | C03 철도물류 반품권 | 철도 컨테이너 반품 담당 | 하역장 회수 로그 | 화물 수취인 조각 | RETURN-05, LEDGER-12 |
| E07 | C04 산업표준 정품권 | 표준 검사소 인증자 | 규격 창고 실패 로그 | 표준 라벨 조각 | METER-06, LOCKOUT-17 |
| E07 | C05 공영안내 수신권 | 공영 안내 청취 확인자 | 안내 라디오탑 로그 | 정정 방송 자막 | BROAD-10, OBS-20 |
| E07 | C06 박람회 회원권 | 전시장 방문 등록자 | 박람회 리뷰홀 로그 | 방문객 배지 조각 | REVIEW-15, CLAUSE-11 |
| E07 | C07 통관철도 통행권 | 국경 플랫폼 통관 보류관 | 검문소 통행 로그 | 통관철도 표 조각 | GATE-09, TRANSIT-14 |
| E07 | C08 방공대피 보급권 | 방공 대피실 보급 담당 | 구호품 지하창고 로그 | 지하 대피 명단 | RATION-16, QUIET-07 |
| E08 | C01 관광숙박 거주권 | 장기투숙 로비 잔류자 | 객실 체크아웃 로그 | 투숙객 카드 조각 | RIO-08, OPEN-HOST |
| E08 | C02 해안격리 진료권 | 항만 약국 봉인 담당 | 해안 격리병동 로그 | 격리 팔찌 조각 | HOLD-04, RATION-16 |
| E08 | C03 항만창고 회수권 | 분실 화물 시장 회수자 | 항만 창고열 로그 | 화물 주인명 조각 | RETURN-05, LEDGER-12 |
| E08 | C04 수리조선 정품권 | 선박 부품 인증 담당 | 수리 독 정품 로그 | 부품 부두 라벨 | METER-06, PATCH |
| E08 | C05 관광안내 수신권 | 관광 안내 광장 승인자 | 오디오 가이드 반복 로그 | 투어 자막 조각 | BROAD-10, REVIEW-15 |
| E08 | C06 면세상권 회원권 | 면세 게이트 결제 판정자 | 기념품 결제 로그 | 회원 쿠폰 조각 | CLAUSE-11, LEDGER-12 |
| E08 | C07 피난검역 통행권 | 피난 심사 부두 보류관 | 검역 대기선 로그 | 피난 통행표 조각 | GATE-09, QUIET-07 |
| E08 | C08 성채형 보급권 | 성채 보급소 명단 담당 | 지하 저장실 배급 로그 | 오래된 보급명 | RATION-16, NAME-18 |
| E09 | C01 교외단지 가족권 | HOA 가족칸 조정자 | 모델하우스 규약 로그 | 교외 가족표 | OPEN-HOST, NAME-18 |
| E09 | C02 병원네트워크 진료권 | 보험 승인 병동 보류관 | 네트워크 접수 로그 | 승인 대기명 | HOLD-04, CLAUSE-11 |
| E09 | C03 고속도로 반품권 | 휴게소 회수장 담당 | 트럭 허브 분류 로그 | 배송 기사명 조각 | RETURN-05, LINE-19 |
| E09 | C04 오대호 공업 정품권 | 리콜 서비스 베이 판정자 | 자동차 부품 리콜 로그 | 부품 보증표 | METER-06, LOCKOUT-17 |
| E09 | C05 케이블뉴스 수신권 | 케이블 중계소 편집자 | 뉴스 스튜디오 송출 로그 | 앵커 자막 조각 | BROAD-10, OBS-20 |
| E09 | C06 대형마트 멤버십권 | 자동결제 약관 보류자 | 멤버십 카운터 로그 | 환불 예외 영수증 | CLAUSE-11, RATION-16 |
| E09 | C07 주간이동 통행권 | 주 경계 게이트 심사자 | 렌터카 허브 승인 로그 | 주간 이동표 | GATE-09, TRANSIT-14 |
| E09 | C08 지하철역 보급권 | 플랫폼 보급소 담당 | 학교 체육관 배급 로그 | 대피소 명단 조각 | RATION-16, QUIET-07 |
| E10 | C01 산불대피 주거권 | 연기 차단문 입주자 | 대피 주택 보험 로그 | 대피 세대명 | OPEN-HOST, QUIET-07 |
| E10 | C02 원격진료 보험권 | 텔레헬스 승인 보류자 | 약 배송 클리닉 로그 | 원격 환자표 | HOLD-04, BROAD-10 |
| E10 | C03 구독배송 회수권 | 구독 박스 창고 담당 | 반송 드론 포트 로그 | 미배송 상자명 | RETURN-05, LINE-19 |
| E10 | C04 빅테크 정품권 | 계정 인증 랩 보류자 | 디바이스 서비스 로그 | 계정 소유권 조각 | PATCH, RIO-08 |
| E10 | C05 알고리즘 추천권 | 모델 학습 센터 판정자 | 개인화 광고 로그 | 추천 프로필 조각 | REVIEW-15, OBS-20 |
| E10 | C06 앱스토어 결제권 | 구독 관리 라운지 담당 | 앱 결제 실패 로그 | 구독 예외명 | CLAUSE-11, BROAD-10 |
| E10 | C07 항만내륙 이송권 | 항만 게이트 이송 보류관 | 내륙 컨테이너 로그 | 트럭 통행표 | GATE-09, TRANSIT-14 |
| E10 | C08 산악 대피권 | 산악 무전소 침묵 관리자 | 침묵 캠프 비콘 로그 | 낮은 수신 명단 | QUIET-07, RATION-16 |
| E11 | C01 고지대 주거권 | 케이블카 단지 주소 담당 | 경사 주거 등록 로그 | 언덕 세대명 | OPEN-HOST, NAME-18 |
| E11 | C02 공공병원 진료권 | 응급 텐트 접수 보류자 | 공공병원 마당 로그 | 약품 창구 번호 | HOLD-04, RATION-16 |
| E11 | C03 항만시장 회수권 | 항만시장 장부 중개자 | 노점 반품로 거래 로그 | 비공식 화물명 | LEDGER-12, RETURN-05 |
| E11 | C04 전력복구 충전권 | 임시 발전소 복구 담당 | 수리 공방 충전 로그 | 전력 매대 표식 | METER-06, LOCKOUT-17 |
| E11 | C05 텔레노벨라 수신권 | 팬 투표 방송실 편집자 | 드라마 세트장 송출 로그 | 팬 계정 조각 | BROAD-10, REVIEW-15 |
| E11 | C06 거리상권 회원권 | 모바일 매대 결제 담당 | 할인 스피커 로그 | 거리 회원표 | CLAUSE-11, LEDGER-12 |
| E11 | C07 버스터미널 통행권 | 터미널 검표장 보류관 | 고가도로 검문 로그 | 미탑승 버스표 | GATE-09, TRANSIT-14 |
| E11 | C08 성당/학교 보급권 | 성당 보급소 조정자 | 학교 급식 창고 로그 | 공동체 배급명 | RATION-16, NAME-18 |
| E12 | C01 해안정착 거주권 | 임시 주소 사무소 담당 | 해안 정착 등록 로그 | 임시 세대명 | OPEN-HOST, NAME-18 |
| E12 | C02 이동진료 승인권 | 이동진료 트럭 승인자 | 임시 약품 천막 로그 | 승인 환자표 | HOLD-04, RATION-16 |
| E12 | C03 자원항만 회수권 | 자원 컨테이너 회수 담당 | 광물 분류 창고 로그 | 화물 주인 조각 | RETURN-05, LEDGER-12 |
| E12 | C04 마이크로그리드 충전권 | 배터리 교환소 판정자 | 태양광 충전 마당 로그 | 전력 사용자표 | METER-06, PATCH |
| E12 | C05 모바일방송 수신권 | 라디오 중계탑 안내자 | 모바일 방송 밴 로그 | 안내 수신자 조각 | BROAD-10, OBS-20 |
| E12 | C06 모바일머니 회원권 | 송금 대리점 보류자 | 모바일머니 키오스크 로그 | 송금 계정명 | CLAUSE-11, LEDGER-12 |
| E12 | C07 항만검문 통행권 | 항만 검문문 판정자 | 국경 트럭 대기 로그 | 통행자 표식 | GATE-09, TRANSIT-14 |
| E12 | C08 우물/창고 보급권 | 우물 보급소 명단 담당 | 곡물 창고 배급 로그 | 급수 대상명 | RATION-16, QUIET-07 |

---

## 5. 전역 교차 축 12개

| seed_id | display_label | depth | parent | story_function_tags | 연결 |
|---|---|---|---|---|---|
| `g_global_001` | 동기화 전 마지막 표준시 로그 | G5 | cross_region | `world_truth_fragment`, `mystery_seed` | 윤서, OBS-20 |
| `g_global_002` | 회수선이 놓친 첫 외부 좌표 | G5 | cross_region | `rescue_failure`, `cross_region_clue` | 윤서, LINE-19 |
| `g_global_003` | 약관 예외가 처음 사람을 살린 영수증 | G4 | C06 spine | `small_ending`, `resource_ethics` | CLAUSE-11, LEDGER-12 |
| `g_global_004` | 정품 인증이 일부러 실패한 부품 라벨 | G4 | C04 spine | `reversal_trigger`, `playable_contrast` | PATCH, METER-06, RIO-08 |
| `g_global_005` | 안내 방송이 늦어서 산 명단 | G5 | C05 spine | `false_answer`, `small_ending` | BROAD-10, QUIET-07 |
| `g_global_006` | 통행 불가 도장이 만든 안전지대 | G4 | C07 spine | `route_reversal`, `small_ending` | GATE-09, TRANSIT-14 |
| `g_global_007` | 미수령품 보관 기간 연장 기록 | G4 | C03 spine | `memory_recovery`, `cross_region_clue` | RETURN-05, 윤서 |
| `g_global_008` | 배급명단 밖에서 끓인 첫 냄비 | G4 | C08 spine | `small_ending`, `outpost_pressure` | RATION-16, 미나 |
| `g_global_009` | 이름을 지워서 살아남은 명찰 | G5 | name spine | `world_truth_fragment`, `memory_recovery` | NAME-18, 복희 |
| `g_global_010` | 낮은 수신을 일부러 택한 대피소 지도 | G4 | quiet spine | `route_block`, `rescue_failure` | QUIET-07, OBS-20 |
| `g_global_011` | 자동결제가 끊기며 열린 문 | G4 | payment spine | `reversal_trigger`, `resource_ethics` | CLAUSE-11 |
| `g_global_012` | 마지막으로 사람을 고객이 아니라고 적은 로그 | G5 | final spine | `final_truth_guard`, `world_truth_fragment` | 윤서, OBS-20 |

---

## 6. 필드 적용 규칙

모든 seed id는 아래 값을 가진 것으로 처리한다.

| 필드 | 적용 방식 |
|---|---|
| `global_seed_id` | 표의 seed id |
| `display_label` | 표의 표시명 |
| `depth_level` | G5/G4/G3/G2/G1/G0 |
| `npc_form` | human, system_voice, document, object_trace, crowd, broadcast, transaction_log 중 하나 |
| `parent_region_code` | E01~E12 또는 cross_region |
| `parent_campaign_id` | 캠페인 ID 또는 cross_region |
| `admin_real_region` | `GLOBAL_ADMIN_REAL_LOCATION_MAP_V0_1.md`의 권역 |
| `admin_infra_anchor` | 해당 캠페인 제작 인프라 앵커 |
| `user_display_region_name` | 정식 캠페인명 |
| `first_exposure` | direct, voice, object, list_name, log, broadcast, map_noise 중 하나 |
| `name_policy` | role_first, name_late, fragment_only, no_human_name, list_only |
| `exposure_phase` | P1_foreshadow, P2_remote_signal, S1_available, S2_later, finale_locked |
| `spoiler_grade` | low, medium, high, final |
| `promotion_path` | profile_v1, profile_v0_1, dialogue_bank, trace_bank, background_only, later_season_lock |

---

## 7. 다음 산출물

| 산출물 | 상태 |
|---|---|
| `story/03_regions/global_campaign_npc_coverage_matrix_v0_1.md` | 작성 완료 |
| `story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md` | 작성 완료 |
| `story/06_characters/playable_global_npc_link_matrix_v0_1.md` | 작성 완료 |
| `story/03_regions/global_npc_name_location_exposure_registry_v0_1.md` | 작성 완료 |
| `story/03_regions/global_npc_quantity_satisfaction_matrix_v0_1.md` | 작성 완료 |
| `story/03_regions/global_npc_expansion_slot_registry_v0_1.md` | 작성 완료 |
| `story/03_regions/global_npc_pre_review_overfill_matrix_v0_1.md` | 작성 완료 |
| `story/03_regions/global_npc_full_scale_target_ladder_v0_1.md` | 작성 완료 |
| `story/03_regions/global_npc_2048_pre_review_wave_v0_1.md` | 작성 완료 |
| `docs/world/GLOBAL_NPC_REVIEW_TEAM_PROMPT_V0_1.md` | 작성 완료 |

최종 판정:

```text
조건부 통과.
전역 NPC 스토리 네트워크는 420개 씨앗 기준으로 실제 산출 단계에 들어왔다.
후속으로 전역 NPC 수량은 768개 제작 슬롯 기준까지 충족했다.
검수팀 전달 전 기준은 2,048개 제작 슬롯으로 확장했다.
장기 풀스케일 목표는 10,240개 제작 슬롯으로 설정했다.
96개 캠페인 커버리지, 미스터리/반전/작은 결말, 플레이어블 연결, 이름/위치/노출 레지스트리는 작성 완료했다.
후속으로 E02 승격 후보 v0.1 검토, 전역 확장 슬롯 레지스트리, 검수팀 전달 프롬프트도 작성 완료했다.
```
