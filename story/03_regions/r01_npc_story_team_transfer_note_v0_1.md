# R01 캠페인 1 NPC 설계 전달 메모 v0.1

## 목적

이 문서는 `Atomic Ad Survivors`의 첫 캠페인 지역인 **R01 / E01_C01 서부 스마일홈**에 필요한 NPC 설계 방향을 스토리팀에 전달하기 위한 메모다.

R01은 단순 주택가가 아니다.

```text
R01은 가족, 주거, 입주, 오픈하우스, 거주태그, 식량태그가 사람의 선택을 묶는 첫 캠페인 지역이다.
```

R01 NPC는 퀘스트 배포기가 아니다.
R01 NPC는 이 지역에서 사람들이 왜 나가지 못했는지, 왜 스스로 안쪽으로 들어갔는지, 왜 해방이 바로 좋은 일이 아닌지를 보여주는 얼굴이다.

---

## 현재 잠금 사항

```text
OPEN-HOST는 통과.
R01 핵심 NPC로 사용한다.
처음부터 플레이어블로 공개하지 않고, NPC 선등장 후 플레이어블 전환 후보로 둔다.
```

OPEN-HOST의 핵심:

```text
집을 팔던 사람이 아니라,
사람을 집에 맞추던 사람.
```

핵심 대사:

```text
저는 그때 그 길이 덜 나쁘다고 믿었어요.
```

---

## 이번 전달 범위

이번 전달은 서른다섯 부분으로 나눈다.

```text
1. R01_CAMPAIGN1_NPC_ROSTER_V0_1.md
   - R01 NPC 전체 설계도
   - 각 NPC의 위치, 역할, 잘못 믿는 것, 상태값 반응, 플레이어블 가능성 정리

2. ROOM_12_NPC_DETAIL_DECISION_V0_1.md
   - ROOM-12 상세화 진행 결재 결과
   - R01의 감정 핵심인 "떠나고 싶지만 자리를 비울 수 없는 사람" 설계 기준

3. ROOM_12_NPC_DRAMA_DRAFT_V0_1.md
   - ROOM-12의 감정 축, 과거, 욕망, 공포, 유저 선택 분기 정리

4. ROOM_12_NPC_PROFILE_V1_0.md
   - ROOM-12의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

5. PORCH_LINE_NPC_DRAMA_DRAFT_V0_1.md
   - PORCH-LINE의 감정 축, R01 대기열 의미, ROOM-12/OPEN-HOST와의 차이 정리

6. PORCH_LINE_NPC_PROFILE_V1_0.md
   - PORCH-LINE의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

7. NAME_PAINTER_NPC_DRAMA_DRAFT_V0_1.md
   - NAME-PAINTER의 감정 축, R01 이름 오염, 윤서/복희와의 충돌 정리

8. NAME_PAINTER_NPC_PROFILE_V1_0.md
   - NAME-PAINTER의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

9. MAIL_LOOP_NPC_DRAMA_DRAFT_V0_1.md
   - MAIL-LOOP의 감정 축, R01 주소 잔향, NAME-PAINTER/ROOM-12와의 연결 정리

10. MAIL_LOOP_NPC_PROFILE_V1_0.md
   - MAIL-LOOP의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

11. VAC_0_NPC_DRAMA_DRAFT_V0_1.md
   - VAC-0의 감정 축, R01 흔적 삭제, PATCH/리오와의 차이 정리

12. VAC_0_NPC_PROFILE_V1_0.md
   - VAC-0의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

13. DRAIN_MARK_NPC_DRAMA_DRAFT_V0_1.md
   - DRAIN-MARK의 감정 축, R01 배수로 침묵 주머니, 안전하지 않은 자유 정리

14. DRAIN_MARK_NPC_PROFILE_V1_0.md
   - DRAIN-MARK의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

15. SIGN_BACK_NPC_DRAMA_DRAFT_V0_1.md
   - SIGN-BACK의 감정 축, R01 가짜 귀환로, 긴급 인양과 가짜 귀환 대비 정리

16. SIGN_BACK_NPC_PROFILE_V1_0.md
   - SIGN-BACK의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

17. KEY_RING_NPC_DRAMA_DRAFT_V0_1.md
   - KEY-RING의 감정 축, R01 물리 열쇠/스마트 도어/거주태그 갈등 정리

18. KEY_RING_NPC_PROFILE_V1_0.md
   - KEY-RING의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

19. DINING_4_NPC_DRAMA_DRAFT_V0_1.md
   - DINING-4의 감정 축, 첫 보스 전 빈 가족 칸, ROOM-12와의 차이 정리

20. DINING_4_NPC_PROFILE_V1_0.md
   - DINING-4의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

21. WELCOME_DESK_NPC_DRAMA_DRAFT_V0_1.md
   - WELCOME-DESK의 감정 축, 상담 데스크 내부 절차, OPEN-HOST와의 차이 정리

22. WELCOME_DESK_NPC_PROFILE_V1_0.md
   - WELCOME-DESK의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

23. FRAME_LEFT_NPC_DRAMA_DRAFT_V0_1.md
   - FRAME-LEFT의 감정 축, 가족사진 프레임, 보스 후 기억 추출, 프로필 잔향 구조 정리

24. FRAME_LEFT_NPC_PROFILE_V1_0.md
   - FRAME-LEFT의 NPC 기준, 첫 등장 장면, 상태값 반응, 관계선, 대사 방향 고정

25. R01_NPC_NAME_REGISTRY_V0_1.md
   - R01 NPC 코드명/역할명/내부 본명 후보와 이름 해금 시점 정리

26. R01_NPC_NAME_REGISTRY_V1_0.md
   - R01 NPC 코드명/역할명/내부 본명 확정안과 호칭 노출 단계 정리

27. R01_NPC_NAME_REVEAL_MATRIX_V0_1.md
   - R01 NPC 이름 조각/본명 해금 조건, 복희/세븐/윤서 보류 연결 정리

28. R01_NPC_CHOICE_CONSEQUENCE_MATRIX_V0_1.md
   - R01 NPC별 핵심 선택지, 상태값 변화, 다른 NPC 반응, 이름 해금 후폭풍 정리

29. R01_REMAINING_WORK_LIST_V0_1.md
   - R01 NPC 12명 상세화 이후 남은 본명/분기/상태 변화/구현 전환 작업 정리

30. R01_BOSS_BEFORE_AFTER_NPC_STATE_V0_1.md
   - 첫 보스 전, 보스 직전, 보스 직후, P1 재방문 시점별 NPC 상태/대사/상태값/선택 후폭풍 정리

31. R01_PORCH_LINE_ROOM_12_REVISIT_BRANCH_V0_1.md
   - ROOM-12 우회 배급 이후 PORCH-LINE의 줄 변화, 인간 안정도별 재방문 대사, 복희/WELCOME-DESK/DINING-4/MAIL-LOOP 후속 반응 정리

32. R01_P1_NPC_BRANCH_MAP_V0_1.md
   - DRAIN-MARK / SIGN-BACK / KEY-RING / VAC-0 / WELCOME-DESK / FRAME-LEFT의 P1 개방 순서, 선택 플래그, 상태값 루트 개폐 정리

33. R01_STATE_VALUE_NPC_REACTION_MATRIX_V0_1.md
   - R01 핵심 상태값 11개의 낮음/중간/높음 기준, NPC 12명 반응, 조합 위험, 시점별 프리셋 정리

34. R01_NPC_DIALOGUE_BANK_V0_1.md
   - NPC 12명의 첫 만남, 상태값 낮음/중간/높음, 선택 성공/보류/실패, 보스 전후, P1 재방문, 이름 해금/차단 대사를 조건 플래그로 정리

35. R01_NPC_DATA_SCHEMA_DRAFT_V0_1.md
   - NPC 12명의 구현 공통 필드, npc_type, 선택 플래그, 대사 참조, 이름 해금 조건, 금지 방향을 샘플 데이터 블록으로 정리
```

---

## 스토리팀 검토 포인트

스토리팀은 아래를 우선 봐주면 된다.

```text
1. R01 NPC들이 전부 피해자처럼만 보이지 않는가?
2. 각 NPC가 R01의 다른 면을 보여주는가?
3. OPEN-HOST와 ROOM-12의 관계가 단순 가해/피해가 아닌가?
4. PORCH-LINE이 단순 줄 관리자나 문지기가 아니라, R01의 질서 있는 기다림을 보여주는가?
5. NAME-PAINTER가 단순 이름 수집가가 아니라, R01의 이름 오염과 윤서의 이름 상처를 비추는가?
6. MAIL-LOOP가 단순 힌트 장치가 아니라, R01의 주소/가족 배정 공포를 비추는가?
7. VAC-0가 귀여운 청소 로봇이 아니라, R01의 흔적 삭제와 로봇 자율성 씨앗을 비추는가?
8. DRAIN-MARK가 멋있는 은신자가 아니라, 침묵권과 안전하지 않은 자유를 비추는가?
9. SIGN-BACK이 단순 표지판 수리공이 아니라, 가짜 귀환로와 친절한 표지판의 위험을 비추는가?
10. KEY-RING이 열쇠 상인이 아니라, R01의 문/권한/소유 흔적 갈등을 비추는가?
11. DINING-4가 ROOM-12 반복이 아니라, 첫 보스 전 빈 가족 칸의 공포를 비추는가?
12. WELCOME-DESK가 OPEN-HOST 복제가 아니라, 상담 데스크 안의 절차 보류를 비추는가?
13. FRAME-LEFT가 사진 속 유령이 아니라, 보스 후 가족사진 프레임의 프로필 잔향을 비추는가?
14. R01 핵심 NPC 이름 후보가 중복 없이 관리되며, 코드명/역할명과 본명 해금 시점이 분리되는가?
15. R01 NPC 본명/호칭 확정안과 이름 해금 조건이 분리되어 관리되는가?
16. R01 NPC 선택 분기가 정답 버튼이 아니라 상태값 후폭풍과 대가를 남기는가?
17. R01 NPC 12명 상세화 이후 남은 상태 변화/구현 전환 작업의 우선순위가 명확한가?
18. 윤서가 왜 사람을 바로 데려오지 못하거나 강제로 데려올 수 없는지 유저가 이해할 수 있는가?
19. R01 NPC들이 캠페인화 인간을 "껍데기"가 아니라 "선택한 사람들"로 보이게 하는가?
20. 보스 전후 상태 변화가 구원 완료가 아니라 보류/분리/검증의 후폭풍으로 이어지는가?
21. PORCH-LINE / ROOM-12 재방문 분기에서 "자리"와 "줄"이 서로 겹치지 않게 분리되는가?
22. R01 P1 NPC 선택 분기에서 침묵권/가짜 귀환로/낡은 관리실/빈 집 내부/상담 데스크/가족사진 프레임의 개방 순서가 명확한가?
23. R01 상태값 통합 매트릭스가 RPG 능력치가 아니라 윤리/생활/절차 압력으로 읽히는가?
24. R01 NPC 대사 은행이 멋진 문장보다 재사용 가능한 조건 대사로 정리되었는가?
25. R01 NPC 데이터 스키마 초안이 문학 설정을 잃지 않으면서 구현 필드로 읽히는가?
26. 다음 작업이 Vertical Slice 구현 우선순위 재정리로 명확히 넘어가는가?
```

---

## 다음 작업 기준

R01 NPC 데이터 스키마 초안은 완료되었다.

바로 다음 작업은 아래 문서로 넘긴다.

```text
R01_VERTICAL_SLICE_NPC_IMPLEMENTATION_PRIORITY_V0_1.md
```

목표:

```text
R01 NPC 12명 중 Vertical Slice에 실제로 넣을 NPC와 흔적,
상태값, 선택 플래그, 대사 참조, 이름 해금 조건의 최소 범위를 정한다.

핵심은 전부 구현하려는 욕심을 줄이고,
OPEN-HOST, ROOM-12, MAIL-LOOP, PORCH-LINE을 필수 축으로 둔 뒤
NAME-PAINTER, DINING-4, VAC-0와 P1 NPC를 어느 범위까지 선노출할지 정하는 것이다.
```
