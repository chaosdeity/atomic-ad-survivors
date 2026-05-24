# R01 남은 작업 목록 v0.1

## 문서 상태

```text
상태:
작업 정리용 v0.1

용도:
R01 캠페인 1 NPC 12명 상세화 이후 남은 결재/정리/구현 전환 작업을 우선순위별로 정리한다.

현재 기준:
R01 핵심 NPC 12명 상세 드라마 초안과 v1.0 프로필은 한 바퀴 완료.
R01 NPC 이름 레지스트리 v1.0과 이름 해금 매트릭스 v0.1도 작성 완료.
R01 NPC 선택 분기별 후폭풍 매트릭스 v0.1도 작성 완료.
R01 보스 전후 NPC 상태 변화 정리 v0.1도 작성 완료.
PORCH-LINE / ROOM-12 재방문 분기 v0.1도 작성 완료.
R01 P1 NPC 선택 분기 맵 v0.1도 작성 완료.
R01 상태값 NPC 반응 통합 매트릭스 v0.1도 작성 완료.
R01 NPC 대사 은행 v0.1도 작성 완료.
R01 NPC 데이터 스키마 초안 v0.1도 작성 완료.
```

---

## 0. 현재 완료된 것

```text
1. OPEN-HOST 기준 통과.
2. ROOM-12 상세화 완료.
3. PORCH-LINE 상세화 완료.
4. NAME-PAINTER 상세화 완료.
5. MAIL-LOOP 상세화 완료.
6. VAC-0 상세화 완료.
7. DRAIN-MARK 상세화 완료.
8. SIGN-BACK 상세화 완료.
9. KEY-RING 상세화 완료.
10. DINING-4 상세화 완료.
11. WELCOME-DESK 상세화 완료.
12. FRAME-LEFT 상세화 완료.
13. R01 NPC 이름 레지스트리 v0.1 작성 완료.
14. R01 NPC 이름 레지스트리 v1.0 작성 완료.
15. R01 NPC 이름 해금 매트릭스 v0.1 작성 완료.
16. R01 NPC 선택 분기별 후폭풍 매트릭스 v0.1 작성 완료.
17. R01 보스 전후 NPC 상태 변화 정리 v0.1 작성 완료.
18. PORCH-LINE / ROOM-12 재방문 분기 v0.1 작성 완료.
19. R01 P1 NPC 선택 분기 맵 v0.1 작성 완료.
20. R01 상태값 NPC 반응 통합 매트릭스 v0.1 작성 완료.
21. R01 NPC 대사 은행 v0.1 작성 완료.
22. R01 NPC 데이터 스키마 초안 v0.1 작성 완료.
```

결론:

```text
R01 캠페인 1 NPC 로스터 12명은 통과 추천 상태까지 정리되었다.
이제 새 NPC를 더 늘리기보다, 이름/분기/상태 변화/구현 단위로 정리해야 한다.
```

---

## 1. P0 - 바로 해야 할 작업

### 1.1 R01 NPC 본명/호칭 최종 확정

참조:

```text
story/03_regions/r01_npc_name_registry_v0_1.md
story/03_regions/r01_npc_name_registry_v1_0.md
story/03_regions/r01_npc_name_reveal_matrix_v0_1.md
```

상태:

```text
완료.
R01_NPC_NAME_REGISTRY_V1_0.md와 R01_NPC_NAME_REVEAL_MATRIX_V0_1.md 작성 완료.
```

해야 할 일:

```text
1. R01 핵심 NPC 12명 사이 본명 중복 여부 확인.
2. 윤서, 미나, 복희, 도윤, 리오, PATCH, 세븐, 팝시와 이름/호명감 충돌 확인.
3. 각 본명이 해금 장면과 맞는지 확인.
4. 유저 첫 노출명, 중간 노출명, 본명 해금명을 분리.
5. FRAME-LEFT는 완전 본명보다 이름 조각 우선으로 확정할지 결정.
```

산출물 후보:

```text
완료:
R01_NPC_NAME_REGISTRY_V1_0.md
R01_NPC_NAME_REVEAL_MATRIX_V0_1.md
```

---

### 1.2 R01 NPC 본명 해금 매트릭스

참조:

```text
story/03_regions/r01_npc_name_reveal_matrix_v0_1.md
```

상태:

```text
완료.
R01_NPC_NAME_REVEAL_MATRIX_V0_1.md 작성 완료.
```

해야 할 일:

```text
1. 어떤 선택/상태값에서 본명이 열리는지 표로 정리.
2. 본명 해금이 즉시 구원이 되지 않도록 위험/대가를 붙임.
3. 복희 이름 보관함과 연결되는 NPC를 확정.
4. 세븐 수신 분석과 연결되는 NPC를 확정.
5. 윤서의 보류 표시와 연결되는 NPC를 확정.
```

핵심 기준:

```text
이름을 아는 것은 해방이 아니다.
하지만 역할에서 사람으로 돌아오는 첫 틈이다.
```

산출물 후보:

```text
완료:
R01_NPC_NAME_REVEAL_MATRIX_V0_1.md
```

---

### 1.3 R01 NPC 선택 분기별 후폭풍 정리

참조:

```text
story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md
```

상태:

```text
완료.
R01_NPC_CHOICE_CONSEQUENCE_MATRIX_V0_1.md 작성 완료.
```

해야 할 일:

```text
1. 각 NPC 이벤트에서 유저가 선택할 수 있는 분기를 모은다.
2. 분기별로 인간 안정도, 캠페인 농도, 흔적 보존, 인양 안정도 변화를 정리한다.
3. 선택 결과가 다른 NPC의 대사/상태에 어떻게 반영되는지 연결한다.
4. "좋은 선택 하나"로 끝나지 않게, 각 선택에 대가를 붙인다.
```

우선 연결:

```text
ROOM-12 우회 배급
PORCH-LINE 순번표 유지/변형
NAME-PAINTER 이름 보관/문패 보류
MAIL-LOOP 주소 보관/호출 보류
VAC-0 청소 제외 목록
DRAIN-MARK 회수선 기준점
SIGN-BACK 가짜 비콘음 차단
KEY-RING 열쇠 확인 대기
DINING-4 네 번째 자리 보류
WELCOME-DESK 질문 보류
FRAME-LEFT 역할/이름 분리
```

산출물 후보:

```text
완료:
R01_NPC_CHOICE_CONSEQUENCE_MATRIX_V0_1.md
```

---

### 1.4 R01 보스 전후 NPC 상태 변화 정리

상태:

```text
완료.
R01_BOSS_BEFORE_AFTER_NPC_STATE_V0_1.md 작성 완료.
```

해야 할 일:

```text
1. 첫 보스 전 NPC 상태.
2. 보스 직전 DINING-4/WELCOME-DESK/OPEN-HOST 압박.
3. 보스 후 FRAME-LEFT/복희/세븐 연결.
4. 보스 후 캠페인 농도 변화에 따른 NPC 대사 변화.
5. 보스 후에도 구원이 단순 완료가 아니라는 후폭풍 정리.
```

우선 연결:

```text
OPEN-HOST
DINING-4
WELCOME-DESK
FRAME-LEFT
ROOM-12
NAME-PAINTER
MAIL-LOOP
```

산출물 후보:

```text
완료:
R01_BOSS_BEFORE_AFTER_NPC_STATE_V0_1.md
```

---

### 1.5 PORCH-LINE / ROOM-12 재방문 분기

상태:

```text
완료.
R01_PORCH_LINE_ROOM_12_REVISIT_BRANCH_V0_1.md 작성 완료.
```

해야 할 일:

```text
1. ROOM-12 우회 배급 이후 PORCH-LINE의 줄이 어떻게 바뀌는지 정리.
2. PORCH-LINE의 순번표와 ROOM-12의 가족대표 역할이 서로 어떤 영향을 주는지 정리.
3. 인간 안정도 낮음/중간/높음에 따른 재방문 대사 작성.
4. 두 NPC가 "자리"와 "줄"을 동시에 다루지만 겹치지 않게 분리.
```

산출물 후보:

```text
완료:
R01_PORCH_LINE_ROOM_12_REVISIT_BRANCH_V0_1.md
```

---

## 2. P1 - 다음 묶음 작업

### 2.1 R01 P1 NPC 선택 분기 정리

상태:

```text
완료.
R01_P1_NPC_BRANCH_MAP_V0_1.md 작성 완료.
```

대상:

```text
DRAIN-MARK
SIGN-BACK
KEY-RING
VAC-0
WELCOME-DESK
FRAME-LEFT
```

해야 할 일:

```text
1. P1 재방문 시 어떤 NPC가 먼저 열리는지 정리.
2. 침묵권, 가짜 귀환로, 낡은 관리실, 빈 집 내부, 상담 데스크, 가족사진 프레임의 순서를 정리.
3. 통행태그/수신태그/거주태그/인양 안정도/로봇 자율성/흔적 보존 상태값에 따른 루트 개폐를 정리.
4. P1 NPC가 단순 확장 퀘스트가 아니라 R01 후폭풍으로 보이게 연결.
```

산출물 후보:

```text
완료:
R01_P1_NPC_BRANCH_MAP_V0_1.md
```

---

### 2.2 R01 상태값 통합 매트릭스

상태:

```text
완료.
R01_STATE_VALUE_NPC_REACTION_MATRIX_V0_1.md 작성 완료.
```

해야 할 일:

```text
1. 인간 안정도.
2. 캠페인 농도.
3. 흔적 보존.
4. 로봇 자율성.
5. 보급 압력.
6. 수신태그.
7. 통행태그.
8. 거주태그.
9. 식량태그.
10. 충전태그.
11. 인양 안정도.
```

위 상태값이 각 NPC에게 미치는 영향을 한 표로 모은다.

산출물 후보:

```text
완료:
R01_STATE_VALUE_NPC_REACTION_MATRIX_V0_1.md
```

---

### 2.3 R01 NPC 대사 은행 정리

상태:

```text
완료.
R01_NPC_DIALOGUE_BANK_V0_1.md 작성 완료.
NPC 12명의 첫 만남, 상태값 낮음/중간/높음, 선택 성공/보류/실패, 보스 전후, P1 재방문, 이름 해금/차단 대사를 조건 플래그로 정리했다.
```

해야 할 일:

```text
1. 첫 만남 대사.
2. 상태값 낮음/중간/높음 대사.
3. 보스 전후 대사.
4. 선택 후 대사.
5. 본명 해금 후 대사.
6. 보급소/복희/세븐/PATCH 연결 대사.
```

주의:

```text
설명문이 아니라 런 전후 한 줄 반응 중심.
```

산출물 후보:

```text
완료:
R01_NPC_DIALOGUE_BANK_V0_1.md
```

---

## 3. P2 - 구현 전환 작업

### 3.1 R01 NPC 데이터 스키마 초안

상태:

```text
완료.
R01_NPC_DATA_SCHEMA_DRAFT_V0_1.md 작성 완료.
NPC 기본 프로필, 상태값 반응, 선택 플래그, 이름 해금, 대사 조건을 공통 구현 스키마로 묶었다.
```

해야 할 일:

```text
1. NPC 코드명.
2. 역할명.
3. 본명 해금 상태.
4. 위치.
5. 첫 등장 조건.
6. 상태값 반응.
7. 선택 분기.
8. 후속 대사 플래그.
9. 보급소/복희/세븐/PATCH 연결 플래그.
```

산출물 후보:

```text
완료:
R01_NPC_DATA_SCHEMA_DRAFT_V0_1.md
```

---

### 3.2 Vertical Slice 구현 우선순위 재정리

상태:

```text
다음 작업.
R01 NPC 데이터 스키마 초안까지 완료되었으므로, Vertical Slice에 실제로 넣을 NPC, 플래그, 상태값, 대사 참조 범위를 추린다.
```

현재 추천:

```text
필수:
OPEN-HOST
ROOM-12
MAIL-LOOP
PORCH-LINE

있으면 좋음:
NAME-PAINTER
DINING-4
VAC-0

P1 이후:
DRAIN-MARK
SIGN-BACK
KEY-RING
WELCOME-DESK
FRAME-LEFT
```

해야 할 일:

```text
1. P0 첫 30분에 실제로 보여줄 NPC/흔적 확정.
2. 첫 보스 전 필수 NPC 확정.
3. 보스 후 잔향/기억 추출 범위 확정.
4. P1 재방문 NPC는 구현 보류인지, 흔적 선노출인지 결정.
```

산출물 후보:

```text
R01_VERTICAL_SLICE_NPC_IMPLEMENTATION_PRIORITY_V0_1.md
```

---

### 3.3 R01 보스 문서와 NPC 연결

해야 할 일:

```text
1. 스마일 홈 가족심사 관리자 보스와 DINING-4 연결.
2. 보스 후 FRAME-LEFT 기억 추출 연결.
3. WELCOME-DESK 상담표와 보스 심사 절차 연결.
4. OPEN-HOST 안내 후폭풍 연결.
5. ROOM-12/NAME-PAINTER/MAIL-LOOP가 보스 후 어떻게 반응하는지 정리.
```

산출물 후보:

```text
R01_BOSS_NPC_LINKS_V0_1.md
```

---

## 4. 플레이어블/장기 캐릭터 쪽 남은 작업

NPC 12명 상세화가 끝났으므로, 별도 축으로 아래가 남아 있다.

```text
1. 플레이어블 20인 로스터 설계도 작성.
2. PATCH를 윤서 다음 2번째 플레이어블로 통과시킬지 최종 판정.
3. OPEN-HOST의 NPC 선등장 후 플레이어블 전환 가능성 재검토.
4. 3~7번째 플레이어블 후보를 R01/R02/R03/R04/R08 안에서 선정.
5. 리오를 8번째 후보로 유지할지 재확인.
6. 플레이어블 후보가 NPC 기능을 빼앗지 않는지 검토.
```

주의:

```text
NPC 후속 작업과 플레이어블 로스터 작업을 섞지 않는다.
R01 NPC는 지금부터 분기/상태/구현 스코프로 정리하고,
플레이어블은 별도 로스터 설계도로 들어간다.
```

---

## 5. 추천 다음 순서

가장 먼저 할 작업:

```text
1. Vertical Slice 구현 우선순위 재정리
```

이유:

```text
R01 보스 전후 NPC 상태 변화 정리, PORCH-LINE / ROOM-12 재방문 분기, R01 P1 NPC 선택 분기 맵, R01 상태값 NPC 반응 통합 매트릭스, R01 NPC 대사 은행, R01 NPC 데이터 스키마 초안은 완료되었다.
이제 Vertical Slice에서 실제로 구현할 NPC, 상태값, 선택 플래그, 대사 참조 범위를 추려야 한다.
```

그 다음:

```text
2. 플레이어블 20인 로스터 설계도
```

---

## 6. 지금 하면 안 되는 것

```text
새 R01 NPC 추가.
모든 NPC 본명을 첫 화면에 노출.
FRAME-LEFT를 사진 속 유령으로 바꾸기.
WELCOME-DESK와 OPEN-HOST를 합치기.
P1 NPC를 단순 서브퀘스트로 분리하기.
NPC 선택 분기 없이 대사만 늘리기.
바로 플레이어블 20명 상세 프로필로 점프하기.
```

지금은 R01 NPC를 더 늘리는 단계가 아니다.

```text
역할명으로 만난 사람들이 언제 이름으로 돌아오는지와,
그 선택이 R01의 상태값에 어떻게 남는지는 정리되었다.
그 결과가 보스 전후 시간표와 P1 재방문 상태 변화로 어떻게 보이는지도 정리되었다.
ROOM-12의 자리와 PORCH-LINE의 줄이 재방문에서 어떻게 재배치되는지도 분리되었다.
P1 NPC 선택 분기도 통행태그/수신태그/거주태그/인양 안정도/로봇 자율성/흔적 보존 조건으로 정리되었다.
R01 상태값도 NPC 12명 반응과 한 표로 묶였다.
R01 NPC 대사 은행도 조건 플래그에 붙는 한 줄 반응으로 정리되었다.
R01 NPC 데이터 스키마 초안도 공통 필드와 12명 샘플 데이터 블록으로 정리되었다.
이제 Vertical Slice 구현 우선순위를 추릴 단계다.
```
