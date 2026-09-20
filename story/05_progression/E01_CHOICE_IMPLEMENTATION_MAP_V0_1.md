# E01 CHOICE IMPLEMENTATION MAP V0.1

상태: PRODUCTION CANDIDATE / NOT UI LOCK
기준 HEAD: `e8e79edfb9d8799351d04de50ba040f1133e0cc6`

분류:
- **MAJOR CHOICE SCREEN**: 플레이를 멈추고 consequence를 비교하는 명시적 major screen.
- **RELATIONSHIP PERMISSION**: 허용 범위/관계 경계를 짧게 묻는 interaction.
- **DIEGETIC INTERACTION**: 현장 조작·거래·배치·대화 진행 자체가 선택을 표현.
- **OBSERVE / NO CHOICE**: NPC가 자기 결정을 하고 플레이어는 겪고 관찰.

| Unit | Candidate implementation | Production note |
|---|---|---|
| M01 | OBSERVE / NO CHOICE | 기존 유지 |
| M02 | OBSERVE / NO CHOICE | 기존 유지 |
| M03 | DIEGETIC INTERACTION | 손을 떼고 식사/자세를 지키는 플레이 |
| M04 | DIEGETIC INTERACTION | 컵·문·야간 인계 |
| M05 | MAJOR CHOICE SCREEN | 서하 대신 결론을 고르지 않음 |
| M06 | RELATIONSHIP PERMISSION | 도윤 장비/로그 접근 범위 |
| M07 | MAJOR CHOICE SCREEN | Popsy의 결정 조건만 선택 |
| M08 | DIEGETIC INTERACTION | 거래/우회/조건 공개를 현장 행동으로 |
| M09 | MAJOR CHOICE SCREEN | 보급소 운영 consequence |
| M10 | MAJOR CHOICE SCREEN | provenance 공개 원칙 |
| M11 | MAJOR CHOICE SCREEN | verification capacity 우선순위 |
| M12 | MAJOR CHOICE SCREEN | 구체 현재 행동/위임/거절 |
| SS01 | DIEGETIC INTERACTION | 생활 자원 배치 |
| SS02 | RELATIONSHIP PERMISSION | 서하가 자기 말을 직접 하게 하는 범위 |
| SS03 | DIEGETIC INTERACTION | 실제 시간표 협상 |
| SS04 | RELATIONSHIP PERMISSION | 수리 허용 범위 |
| SS05 | OBSERVE / NO CHOICE | 복희가 직접 처리 |
| SS06 | RELATIONSHIP PERMISSION | Popsy가 사용할 말의 범위 |
| SS07 | DIEGETIC INTERACTION | Seven이 이유를 말하고 결정 |
| SS08 | DIEGETIC INTERACTION | review 현장 행동 |
| SS09 | OBSERVE / NO CHOICE | ARCHIVED / NOT DEFAULT PRODUCTION |
| SS10 | DIEGETIC INTERACTION | 현장 튜닝 |
| SS11 | DIEGETIC INTERACTION | carrier 조작 |
| SS12 | OBSERVE / NO CHOICE | MERGED INTO M10 CODA |
| SS13 | DIEGETIC INTERACTION | 외부 단서 확인 후 최소 inspection |
| SS14 | OBSERVE / NO CHOICE | DEFAULT OFF / identity mystery 확대 금지 |
| HRI01 | DIEGETIC INTERACTION | 컵 UI 없음 |
| HRI02 | RELATIONSHIP PERMISSION | scanner 대여 범위 |
| HRI03 | DIEGETIC INTERACTION | Popsy가 번복 요청을 직접 말함 |
| HRI04 | OBSERVE / NO CHOICE | MERGED INTO SS07 |
| HRI05 | OBSERVE / NO CHOICE | 복희가 직접 처리 |
| HRI06 | OBSERVE / NO CHOICE | 미나/도윤/세븐이 윤서 없이 합의 |
| HRI07 | OBSERVE / NO CHOICE | REQUIRED bridge / table WANT 보존 |

## Choice budget

- 편집 전 explicit choice section: **29/33**.
- 편집 후 **MAJOR CHOICE SCREEN: 6/33**.
- RELATIONSHIP PERMISSION까지 compact explicit prompt로 구현해도 screen-capable interaction 최대 **11/33**.
- production target **약 14/33 이하**를 충족하는 후보안이다.
- DIEGETIC INTERACTION과 OBSERVE / NO CHOICE는 explicit choice screen으로 세지 않는다.
- 이 수치는 production target이며 게임 UI LOCK이 아니다.
