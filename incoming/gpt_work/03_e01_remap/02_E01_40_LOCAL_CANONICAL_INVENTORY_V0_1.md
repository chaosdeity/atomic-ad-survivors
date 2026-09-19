# 02 E01 40 Local Canonical Inventory V0.1

상태: E01 40 Local inventory 확정 감사
기준: FINAL GLOBAL WORLD STRUCTURE LOCK V0.2 + 기존 E01 inventory + 최신 local Unreal/RPG
목표: 기존 40 Local을 삭제·추가·개명하지 않고 8 Campaign 내부 Production Local로 재정렬한다.

## 0. 계층과 수량

GLOBAL
→ E01
→ E01_C01~E01_C08
→ R01~R08 Local

- Campaign: 8
- Local: 40
- 각 Campaign당 Local: 5
- 기존 priority: P0 5 / P1 16 / P2 19
- ID 변경: 0
- 이름 변경: 0

주의: Rxx는 과거 제작 권역 표기이며 global node가 아니다. 각 Rxx-Lyy는 대응하는 E01_Cxx 내부 Local이다.

## 1. Canonical inventory

| local_id | campaign_id | current_name | priority | existing_role | current_authority | Unreal relevance | status |
|---|---|---|---|---|---|---|---|
| R01-L01 | E01_C01 | 침묵 가장자리 | P0 | 첫 출격, 주거 캠페인 경계, 첫 현장 학습 | CURRENT R01 RPG + legacy inventory | HIGH: RPG34 first quest/field 의미와 연결 | KEEP_REINTERPRET |
| R01-L02 | E01_C01 | 분양 주택 루프 | P0 | 주거 반복 구간, 가족/입주 기록 추적 | CURRENT RPG35 + legacy inventory | HIGH: RPG35 분양 주택 기록 대조와 의미 연속 | KEEP_REINTERPRET |
| R01-L03 | E01_C01 | 모델하우스 결절 | P0 | 첫 boss, 가족 적합성 심사 | Final Lock family + legacy boss design | MEDIUM/FUTURE: 최신 RPG35에서 boss 미구현·조기 진행 금지 | KEEP_REINTERPRET |
| R01-L04 | E01_C01 | 배수로 침묵 주머니 | P1 | 침묵/차폐 근거, 숨은 회수 | legacy inventory only | FUTURE: 최신 Unreal 구현 근거 없음 | NEEDS_PRODUCTION_FILL |
| R01-L05 | E01_C01 | 가짜 귀환로 | P1 | 재방문 변형, 거짓 귀환 신호 | legacy inventory only | FUTURE: 최신 Unreal 구현 근거 없음 | NEEDS_PRODUCTION_FILL |
| R02-L01 | E01_C02 | 응급 접수 홀 | P1 | 의료 진입, 환자 등록 | Final Lock C02 + legacy inventory | NONE-YET: current local Unreal 구현 없음 | NEEDS_PRODUCTION_FILL |
| R02-L02 | E01_C02 | 장기 입원동 | P1 | 장기 치료/등록 인간, 구출 윤리 | Final Lock C02 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R02-L03 | E01_C02 | 보험 심사 약국 | P1 | 진료 entitlement, 약품 선택 | Final Lock C02 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R02-L04 | E01_C02 | 격리문 복도 | P2 | 격리/오염 구간 | Final Lock C02 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R02-L05 | E01_C02 | 퇴원 불가 병동 | P2 | 의료 boss/퇴원 심사 | Final Lock C02 + legacy inventory/proof reference | NONE-YET | NEEDS_PRODUCTION_FILL |
| R03-L01 | E01_C03 | 반품 접수 야드 | P1 | 반품/회수 진입, 윤서 회수 정체성 | Final Lock C03 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R03-L02 | E01_C03 | 자동 분류장 | P1 | 물류 분류/벨트/flow | Final Lock C03 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R03-L03 | E01_C03 | 보증 심사 창고 | P1 | custody/보증/부품 회수 | Final Lock C03 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R03-L04 | E01_C03 | 파쇄 전 대기라인 | P2 | 옛 시간 제한 회수, 폐기 직전 custody | Final Lock C03 + conflicting legacy behavior | NONE-YET | LEGACY_BEHAVIOR_REMOVE |
| R03-L05 | E01_C03 | 최종 반품 심사실 | P2 | 반품/회수 최종 심사 | Final Lock C03 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R04-L01 | E01_C04 | 폐충전소 | P1 | 충전/operability 진입 | Final Lock C04 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R04-L02 | E01_C04 | 배터리 침전 공장 | P1 | 에너지/산업 오염/maintenance | Final Lock C04 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R04-L03 | E01_C04 | 리콜 펌웨어실 | P1 | validity/repair/re-synchronization | Final Lock C04 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R04-L04 | E01_C04 | 폐기 프레스 라인 | P2 | 폐기 전 operability/custody 선택 | Final Lock C04 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R04-L05 | E01_C04 | 재동기화 코어 | P2 | 정품/재동기화 boss | Final Lock C04 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R05-L01 | E01_C05 | 수신탑 외곽 | P2 | broadcast/source 진입 | Final Lock C05 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R05-L02 | E01_C05 | 반복 뉴스 스튜디오 | P2 | source/edited record | Final Lock C05 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R05-L03 | E01_C05 | 추천 서버실 | P2 | source/authority/추천 기록 | Final Lock C05 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R05-L04 | E01_C05 | 빈 관객석 공개홀 | P2 | broadcast audience/authority 연출 | Final Lock C05 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R05-L05 | E01_C05 | 마지막 앵커 송출실 | P2 | broadcast 최종 절차 | Final Lock C05 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R06-L01 | E01_C06 | 회원 게이트 거리 | P1 | membership/entitlement 진입 | Final Lock C06 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R06-L02 | E01_C06 | 포인트 거래 골목 | P1 | account/entitlement 악용, broker | Final Lock C06 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R06-L03 | E01_C06 | 리뷰 키오스크 광장 | P1 | loyalty/reputation access | Final Lock C06 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R06-L04 | E01_C06 | VIP 라운지 | P2 | membership tier/협력자 | Final Lock C06 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R06-L05 | E01_C06 | 블랙프라이데이 홀 | P2 | payment/membership 최종 심사 | Final Lock C06 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R07-L01 | E01_C07 | 검역 게이트 | P2 | passage/quarantine 진입 | Final Lock C07 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R07-L02 | E01_C07 | 냉동 컨테이너 야드 | P2 | transfer/custody 물류 | Final Lock C07 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R07-L03 | E01_C07 | 수하물 오분류 터미널 | P2 | transfer/misclassification | Final Lock C07 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R07-L04 | E01_C07 | 밀수 통행로 | P2 | 비공식 passage/rumor route | Final Lock C07 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R07-L05 | E01_C07 | 마지막 출항 관리탑 | P2 | passage/quarantine/transfer 최종 심사 | Final Lock C07 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R08-L01 | E01_C08 | 침묵 보급소 | P0 | 생존자 hub, 정산, 휴식/귀환 | CURRENT_SUPPORTING R08 Unreal + Final Lock C08 | HIGH-SPATIAL: Unreal 후보 공간 존재, 기능/플레이 미완료 | KEEP_REINTERPRET |
| R08-L02 | E01_C08 | 역송출 주유소 | P0 | 옛 인양 장비 근거/출격 장비 | CURRENT_SUPPORTING world_structure + legacy extraction | MEDIUM: 제작 순서에는 있으나 최신 RPG/Final Lock 역할 분리 미완료 | KEEP_REINTERPRET |
| R08-L03 | E01_C08 | 폐역 무음 플랫폼 | P1 | silence network/중계 후보 | Final Lock C08 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R08-L04 | E01_C08 | 민방위 저장고 | P1 | shelter/supply capacity | Final Lock C08 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |
| R08-L05 | E01_C08 | 가짜 구조 신호탑 | P2 | relief/shelter 신호 위기 | Final Lock C08 + legacy inventory | NONE-YET | NEEDS_PRODUCTION_FILL |

## 2. Campaign별 고정 소속

| campaign_id | Local set | inventory 판정 |
|---|---|---|
| E01_C01 | R01-L01~R01-L05 | 5/5 확인 |
| E01_C02 | R02-L01~R02-L05 | 5/5 확인 |
| E01_C03 | R03-L01~R03-L05 | 5/5 확인 |
| E01_C04 | R04-L01~R04-L05 | 5/5 확인 |
| E01_C05 | R05-L01~R05-L05 | 5/5 확인 |
| E01_C06 | R06-L01~R06-L05 | 5/5 확인 |
| E01_C07 | R07-L01~R07-L05 | 5/5 확인 |
| E01_C08 | R08-L01~R08-L05 | 5/5 확인 |

## 3. 최신 Unreal과 직접 연결되는 Local

현재 직접 근거가 강한 Local은 제한적이다.

- R01-L01: current R01 RPG first quest/field 의미.
- R01-L02: RPG35의 후속 분양 주택 기록 대조 구간과 의미 연속.
- R01-L03: boss Local로서 기존 role은 남지만 current RPG35에서 boss 자체가 아직 미구현.
- R08-L01: survivor-operated supply outpost의 Unreal 공간 후보가 존재하나 production visual/function/play PASS는 아님.
- R08-L02: world_structure의 제작 순서에는 남아 있으나 Relay/Beacon/Recovery 역할을 Final Lock에 맞춰 다시 분리해야 함.

그 외 35 Local은 Final Lock family + 기존 E01 inventory를 근거로 ID/이름/기존 역할만 유지하며 Production Fill이 필요하다.

## 4. Legacy behavior 분리

Local을 삭제하지 않고 행동 규칙만 분리한다.

- R01-L01의 108초 강제 회수 완료 조건: 제거 대상 legacy behavior.
- R01-L02의 fixed-time boss signal 축적: current RPG 근거 없음.
- R01-L03의 240초 boss timing: current RPG 근거 없음.
- R03-L04의 “시간 제한 회수”는 Local 이름/ID가 아니라 기존 role 설명의 legacy behavior다. C03의 custody/return/recovery 가족에 맞춰 목적 기반 압력으로 재설계가 필요하다.
- R08-L02를 global travel Relay나 모든 Local의 단일 extraction origin으로 자동 정의하지 않는다.

## 5. Inventory 완료 조건

- 8 Campaign: PASS
- 40 Local: PASS
- ID 변경: 0
- 이름 변경: 0
- P0/P1/P2 기존 값 보존: PASS
- current/legacy 충돌 분리: PASS
- Unreal 구현 생성: 0
