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

이번 전달은 스무 부분으로 나눈다.

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
12. 윤서가 왜 사람을 바로 데려오지 못하거나 강제로 데려올 수 없는지 유저가 이해할 수 있는가?
13. R01 NPC들이 캠페인화 인간을 "껍데기"가 아니라 "선택한 사람들"로 보이게 하는가?
```
