# R01 PORCH-LINE / ROOM-12 재방문 분기 v0.1

## 문서 상태

```text
상태:
스토리팀/시스템팀 연결용 v0.1

용도:
ROOM-12 우회 배급 이후 PORCH-LINE의 줄이 어떻게 바뀌는지,
그리고 P1 재방문에서 두 NPC가 인간 안정도와 선택 플래그에 따라 어떻게 반응하는지 정리한다.

판정:
필요

주의:
이 문서는 두 NPC를 함께 묶되, 같은 문제로 합치는 문서가 아니다.
ROOM-12는 식량태그/거주태그/가족대표 접근권의 문제이고,
PORCH-LINE은 현관 앞 줄/순번/사람들이 서로를 밀지 않게 하는 질서의 문제다.
```

---

## 0. 판정 요약

PORCH-LINE / ROOM-12 재방문 분기는 지금 단계에서 작성해야 한다.

이유:

```text
R01 NPC 선택 분기별 후폭풍은 정리되었다.
R01 보스 전후 시간축도 정리되었다.

이제 ROOM-12 우회 배급이라는 선택이
PORCH-LINE의 현관 줄과 순번표를 어떻게 바꾸는지 고정해야 한다.
```

핵심 결론:

```text
ROOM-12의 변화는 "자리에서 사람을 떼는 것"이다.
PORCH-LINE의 변화는 "줄에서 캠페인이 읽는 정확성을 흐리는 것"이다.

둘 다 사람을 덜 위험하게 만들지만,
하나는 생존 접근권의 문제이고
다른 하나는 사람 사이의 충돌을 늦추는 질서의 문제다.
```

권장 분기:

```text
room12_bypass_ration + porch_line_flexible_ticket
```

이 조합은 완전한 정답이 아니다.

```text
ROOM-12는 잠깐 일어날 수 있다.
PORCH-LINE의 줄은 덜 정확해진다.
하지만 줄이 느려지고 불만이 생기며,
캠페인은 우회 배급과 흐린 순번표를 다시 읽으려 한다.
```

---

## 1. 두 NPC의 차이 잠금

### 1.1 ROOM-12가 다루는 것

ROOM-12의 핵심은 자리다.

```text
방 안 식탁 자리.
가족대표 칸.
식량태그 접근.
거주태그 유지.
침상 접근.
자기가 일어나면 다른 사람들의 저녁이 끊긴다는 믿음.
```

ROOM-12의 질문:

```text
이 사람이 자리에서 일어나도,
다른 사람들의 생존 접근권이 무너지지 않는가?
```

ROOM-12의 변화 방향:

```text
가족대표 역할을 즉시 버리는 것이 아니다.
자기 몸으로 생존 접근권을 붙잡지 않아도 되는 조건을 만든다.
```

금지:

```text
ROOM-12를 현관 줄 관리자처럼 쓰지 않는다.
ROOM-12를 단순 구출 대상처럼 처리하지 않는다.
ROOM-12가 나왔으니 모두 해결됐다고 처리하지 않는다.
```

### 1.2 PORCH-LINE이 다루는 것

PORCH-LINE의 핵심은 줄이다.

```text
현관 앞 순서.
수기 순번표.
입주 대기열.
사람들이 서로를 밀지 않게 하는 임시 질서.
캠페인이 줄을 상담 순번으로 읽는 위험.
```

PORCH-LINE의 질문:

```text
줄이 없어도,
약한 사람이 먼저 밀려나지 않는가?
```

PORCH-LINE의 변화 방향:

```text
줄을 즉시 없애는 것이 아니다.
사람은 서로의 순서를 기억하되,
캠페인이 정확한 상담 자료로 읽기 어렵게 만든다.
```

금지:

```text
PORCH-LINE을 방 안 자리에 묶인 사람처럼 쓰지 않는다.
PORCH-LINE의 줄 폐기를 정답으로 만들지 않는다.
PORCH-LINE을 단순 질서 찬양 NPC로 만들지 않는다.
```

### 1.3 차이표

| 항목 | ROOM-12 | PORCH-LINE |
|---|---|---|
| 핵심 대상 | 가족대표 자리 | 현관 줄 |
| 묶인 방식 | 식량태그/거주태그/침상 접근권 | 순번/대기/사람 간 충돌 |
| 잘못 믿는 것 | 자리를 지키면 가족이 유지된다 | 줄이 있으면 아직 사람이 망가지지 않았다 |
| 주요 위험 | 강제 이동 시 생존 접근권 붕괴 | 줄 해산 시 약한 사람이 밀림 |
| 캠페인 이용 방식 | 가족대표/수령인/거주태그 유지자로 읽음 | 입주 대기열/상담 순번/가족 구성 보류자로 읽음 |
| 권장 변화 | 우회 배급과 침상 접근 분리 | 유연한 순번표와 서로의 증언 |
| 이름 해금 | 연우 조각 | 지호 조각 |

---

## 2. 재방문 시작 조건

이 문서는 아래 시점 이후를 다룬다.

```text
R01 첫 보스 이후.
FRAME-LEFT 잔향 확인 이후.
ROOM-12 / PORCH-LINE 관련 선택 플래그가 최소 하나 이상 존재.
```

필수 분기 플래그:

```text
room12_bypass_ration
room12_forced_removed
room12_left_in_place
porch_line_flexible_ticket
porch_line_exact_queue
porch_line_dispersed
```

연결 플래그:

```text
room12_name_fragment
porch_line_name_fragment
welcome_desk_question_hold
welcome_desk_ticket_evidence
dining4_fourth_seat_hold
mail_loop_call_hold
name_painter_names_to_bokhee
frame_left_empty_slot_hold
```

재방문 시점 기본 질문:

```text
1. ROOM-12의 저녁은 자리 없이도 나오는가?
2. PORCH-LINE의 줄은 정확한 상담 순번이 되지 않고도 사람을 덜 밀리게 하는가?
3. 12번 기록은 완료/이탈/대기 중 무엇으로 남는가?
4. 이름 조각은 사람을 부르는가, 캠페인이 호출하는가?
```

---

## 3. 핵심 선택 플래그 해석

### 3.1 ROOM-12 플래그

| 플래그 | 의미 | 재방문 기본 상태 | 대가 |
|---|---|---|---|
| `room12_bypass_ration` | 자리와 배급/침상 접근권을 분리하려 했다 | ROOM-12가 잠깐 일어나거나 손을 뗄 수 있다 | 캠페인이 우회 배급 구조를 읽으려 한다 |
| `room12_forced_removed` | ROOM-12를 바로 데려왔다 | ROOM-12는 자리 밖에 있지만 12번 방 배급/거주 상태가 흔들린다 | PORCH-LINE 줄 불안, 미나 보급 압력 증가 |
| `room12_left_in_place` | ROOM-12를 그대로 두었다 | 12번 방은 즉시 무너지지 않았지만 역할 고정이 심해진다 | ROOM-12 이름 조각/복희 연결이 늦어진다 |

### 3.2 PORCH-LINE 플래그

| 플래그 | 의미 | 재방문 기본 상태 | 대가 |
|---|---|---|---|
| `porch_line_flexible_ticket` | 사람은 기억하되 절차는 흐린 순번표를 만들었다 | 줄은 느슨하고 불만이 있지만 덜 위험하다 | 처리 속도 저하, 캠페인 재스캔 위험 |
| `porch_line_exact_queue` | 줄을 정확하게 유지했다 | 현관 앞 충돌은 줄지만 상담 순번화가 강해진다 | WELCOME-DESK 압박 증가 |
| `porch_line_dispersed` | 줄을 해산했다 | 캠페인 대기열은 약해지지만 인간 안정도에 따라 충돌이 난다 | 약한 사람이 밀리고 12번 기록이 흩어진다 |

### 3.3 권장 조합

```text
room12_bypass_ration
porch_line_flexible_ticket
welcome_desk_question_hold
mail_loop_call_hold
```

이 조합의 의미:

```text
ROOM-12의 자리가 생존 접근권을 독점하지 않는다.
PORCH-LINE의 줄은 정확한 상담 자료가 되지 않는다.
WELCOME-DESK는 순번을 질문으로 바꾸지 않는다.
MAIL-LOOP는 12번 주소/가족 수령인을 자동 호출하지 않는다.
```

대가:

```text
느리다.
불만이 남는다.
일부 사람은 "왜 바로 처리하지 않느냐"고 묻는다.
캠페인은 흐린 순번표와 우회 배급을 다시 정렬하려 한다.
```

---

## 4. 주요 조합별 재방문 결과

### 4.1 우회 배급 + 유연한 순번표

필요 플래그:

```text
room12_bypass_ration
porch_line_flexible_ticket
```

상태:

```text
ROOM-12는 식탁에서 완전히 떠나지 않는다.
하지만 손을 잠깐 떼거나, 방 밖까지 짧게 나올 수 있다.

PORCH-LINE의 줄은 아직 있다.
하지만 번호가 정확히 이어지지 않고, 사람들은 앞뒤 사람을 이름/표식/증언으로 기억한다.
```

PORCH-LINE 대사:

```text
"줄이 아니라 표로 남겨도 되는 거군요.
사람이 밀리지 않는다면."
```

ROOM-12 대사:

```text
"오늘은 손을 조금 떼도 저녁이 바로 끊기지 않았어요.
그게 무섭게 좋네요."
```

윤서 반응:

```text
"이 정도면 아직 줄이야.
다만 저쪽이 읽기 어려운 줄."
```

상태값:

```text
인간 안정도 +
흔적 보존 +
식량/거주 안정도 +
캠페인 농도 보류
```

대가:

```text
대기 시간이 길어진다.
순번 불만이 생긴다.
캠페인이 "비정상 대기열"과 "비정상 배급"을 동시에 감지한다.
```

후속:

```text
PORCH-LINE 이름 조각 "지호" 가능.
ROOM-12 이름 조각 "연우" 가능.
복희 이름 보관함 연결 안정.
WELCOME-DESK 질문 보류와 호환.
```

### 4.2 우회 배급 + 정확한 줄

필요 플래그:

```text
room12_bypass_ration
porch_line_exact_queue
```

상태:

```text
ROOM-12 쪽 생존 접근권은 조금 안정된다.
하지만 PORCH-LINE의 줄은 너무 정확하게 남아 상담 순번으로 읽힌다.
```

PORCH-LINE 대사:

```text
"배급은 덜 흔들립니다.
그런데 줄이 너무 반듯해졌습니다."
```

ROOM-12 대사:

```text
"저녁은 나왔어요.
그런데 다음 질문이 더 빨리 왔습니다."
```

WELCOME-DESK 반응:

```text
"정확한 순서가 생기면,
질문은 그 순서대로 찾아옵니다."
```

상태값:

```text
식량/거주 안정도 +
인간 안정도 +
캠페인 농도 +
흔적 보존 0
```

대가:

```text
상담 순번표 자동 복구가 빨라진다.
12번 기록이 "우회 처리 완료"처럼 굳을 위험이 있다.
```

후속:

```text
WELCOME-DESK 질문 보류가 없으면 P1 상담 데스크 압박 증가.
PORCH-LINE 이름 조각은 지연.
ROOM-12 이름 조각은 복희 연결이 있으면 가능.
```

### 4.3 우회 배급 + 줄 해산

필요 플래그:

```text
room12_bypass_ration
porch_line_dispersed
```

상태:

```text
ROOM-12가 자리에서 잠깐 벗어날 조건은 생겼다.
하지만 현관 앞 줄이 사라져 다른 사람들이 서로를 밀기 시작할 수 있다.
```

PORCH-LINE 대사:

```text
"줄이 사라지면 상담은 느려집니다.
그런데 사람 손은 더 빨라집니다."
```

ROOM-12 대사:

```text
"제가 일어나도 저녁은 끊기지 않았어요.
그런데 밖이 더 시끄러워졌습니다."
```

미나 반응:

```text
"배급표만으로는 사람을 세울 수 없어.
누가 먼저 밀렸는지도 봐야지."
```

상태값:

```text
식량/거주 안정도 +
캠페인 농도 -
인간 안정도 --
흔적 보존 -
```

대가:

```text
약한 사람이 밀린다.
12번 앞뒤 사람의 증언이 끊긴다.
PORCH-LINE이 자기 실패로 받아들인다.
```

후속:

```text
인간 안정도 낮음이면 줄 재구성 이벤트 필요.
PORCH-LINE 이름 조각 해금 실패.
ROOM-12는 자책 대사 증가.
```

### 4.4 강제 이동 + 유연한 순번표

필요 플래그:

```text
room12_forced_removed
porch_line_flexible_ticket
```

상태:

```text
PORCH-LINE의 줄은 덜 위험해졌지만,
ROOM-12가 맡고 있던 생존 접근권은 갑자기 비어 있다.
```

PORCH-LINE 대사:

```text
"줄은 조금 견딥니다.
하지만 12번 방은 줄 밖의 문제였습니다."
```

ROOM-12 대사:

```text
"제가 나온 건 맞아요.
그런데 저쪽은요?"
```

미나 반응:

```text
"줄을 고친 건 좋아.
이제 비어버린 저녁을 봐야 해."
```

상태값:

```text
인간 안정도 0 또는 -
식량/거주 안정도 --
흔적 보존 +
캠페인 농도 보류
```

대가:

```text
ROOM-12는 구출되었지만 자책이 커진다.
12번 방 남은 사람들의 배급/침상 접근이 흔들린다.
```

후속:

```text
강제 이동 후속 보급 이벤트 필요.
PORCH-LINE은 유연한 순번표를 유지하지만 12번 기록을 완료 처리하지 못하게 막아야 한다.
```

### 4.5 그대로 둠 + 유연한 순번표

필요 플래그:

```text
room12_left_in_place
porch_line_flexible_ticket
```

상태:

```text
현관 앞 줄은 개선되었다.
하지만 ROOM-12는 여전히 가족대표 자리에 묶인다.
```

PORCH-LINE 대사:

```text
"앞사람 이름은 기억하게 됐습니다.
그런데 12번은 아직 번호로 남아 있습니다."
```

ROOM-12 대사:

```text
"줄이 덜 아프게 바뀐 건 알아요.
저는 아직 자리 쪽입니다."
```

복희 반응:

```text
"이름 조각은 말릴 수 있어.
근데 저쪽 자리가 아직 이름을 붙잡고 있네."
```

상태값:

```text
인간 안정도 +
흔적 보존 0 또는 +
식량/거주 안정도 0
캠페인 농도 보류
```

대가:

```text
ROOM-12 역할 고정이 깊어진다.
연우 이름 조각이 늦어지거나 오염된다.
```

후속:

```text
ROOM-12 우회 배급 재시도 분기.
PORCH-LINE은 12번을 "완료"가 아니라 "보류"로 계속 남긴다.
```

### 4.6 그대로 둠 + 정확한 줄

필요 플래그:

```text
room12_left_in_place
porch_line_exact_queue
```

상태:

```text
겉보기로는 가장 조용하다.
하지만 두 NPC 모두 R01 절차가 읽기 쉬운 상태로 남는다.
```

PORCH-LINE 대사:

```text
"줄은 조용합니다.
그래서 더 안 좋습니다."
```

ROOM-12 대사:

```text
"대표 수령인은 자리를 유지하고 있습니다.
...방금 건 제가 한 말이 아니에요."
```

MAIL-LOOP 반응:

```text
"12번 방.
대표 수령인 이탈 없음.
가족 수령 대기."
```

상태값:

```text
인간 안정도 0
식량/거주 안정도 0
캠페인 농도 ++
흔적 보존 -
```

대가:

```text
줄은 상담 순번으로 굳고,
ROOM-12는 가족대표로 더 굳는다.
```

후속:

```text
P1 NPC 선택 분기에서 WELCOME-DESK 상담표 복구 위험 증가.
MAIL-LOOP 주소 호출 위험 증가.
```

---

## 5. 인간 안정도별 재방문 상태

### 5.1 인간 안정도 낮음

기본 상태:

```text
사람들이 빠른 창구, 큰 안내문, 가장 친절한 길을 따른다.
줄을 해산하면 약한 사람이 먼저 밀린다.
ROOM-12는 다른 사람들의 저녁이 흔들릴까 봐 더 움직이지 못한다.
```

PORCH-LINE 상태:

```text
말보다 몸으로 줄을 막는다.
유연한 순번표를 만들어도 사람들이 "그럼 내 차례는 언제냐"고 묻는다.
정확한 줄을 포기하기 어렵다.
```

PORCH-LINE 대사:

```text
"지금은 줄을 없애면 안 됩니다.
사람들이 서로를 먼저 볼 상태가 아니에요."
```

ROOM-12 상태:

```text
우회 배급이 있어도 손을 오래 떼지 못한다.
강제 이동된 경우 자책과 불안이 커진다.
그대로 둔 경우 역할 말투가 늘어난다.
```

ROOM-12 대사:

```text
"지금은 못 가요.
저쪽 줄도 흔들려요."
```

공동 장면:

```text
PORCH-LINE은 12번 기록을 지우지 못한다.
ROOM-12는 자기 자리가 비는 것보다 현관 앞 사람들이 밀리는 소리를 더 무서워한다.
```

실패 위험:

```text
porch_line_dispersed가 있으면 인간 안정도 --.
room12_forced_removed가 있으면 보급 압력 ++.
MAIL-LOOP 주소 호출이 켜져 있으면 현관 대기열이 가족 수령 대기로 바뀐다.
```

### 5.2 인간 안정도 중간

기본 상태:

```text
일부 보류를 견딘다.
줄은 느려도 유지된다.
ROOM-12는 짧게 손을 떼거나 문 앞까지 나올 수 있다.
```

PORCH-LINE 상태:

```text
수기 순번표를 정확한 번호 대신 흐린 표식으로 바꾼다.
앞뒤 사람의 증언을 일부 받아들인다.
WELCOME-DESK 상담표와 연결할지 보류한다.
```

PORCH-LINE 대사:

```text
"불평이 들리면 아직 괜찮습니다.
고객번호만 들리는 줄보다는요."
```

ROOM-12 상태:

```text
우회 배급이 있으면 잠깐 움직인다.
이름 조각을 복희에게 맡길 수 있다.
하지만 12번 방을 완전히 떠나지는 않는다.
```

ROOM-12 대사:

```text
"기다리는 건 익숙해요.
근데 이번엔... 저를 잊지 말아 주세요."
```

공동 장면:

```text
PORCH-LINE이 12번을 번호가 아니라 "아직 끝나지 않은 사람"으로 적는다.
ROOM-12는 그 표기를 보고 처음으로 자기 차례가 상담 완료가 아니었다고 말한다.
```

후속 가능:

```text
room12_name_fragment 가능.
porch_line_name_fragment 준비.
WELCOME-DESK 질문 보류와 연결 가능.
```

### 5.3 인간 안정도 높음

기본 상태:

```text
사람들이 이름을 바로 확정하지 않고 빈칸을 잠시 견딘다.
줄은 줄의 형태를 조금 내려놓을 수 있다.
ROOM-12는 자리와 자기 자신을 분리하는 경험을 한다.
```

PORCH-LINE 상태:

```text
순번표 없이도 짧은 이동을 허용한다.
사람들이 앞뒤 사람을 증언한다.
이름 조각 "지호"가 열릴 수 있다.
```

PORCH-LINE 대사:

```text
"오늘은 사람들이 앞사람 이름을 기억하네요.
이런 날은 드뭅니다."
```

ROOM-12 상태:

```text
우회 배급이 있으면 식탁에서 일어나 문 밖까지 나올 수 있다.
이름 조각 "연우"를 복희에게 맡길 수 있다.
```

ROOM-12 대사:

```text
"오늘은... 잠깐 일어나도 될까요?"
```

공동 장면:

```text
PORCH-LINE은 12번 기록을 "완료"로 찍지 않는다.
대신 "보류, 증언 있음"으로 남긴다.
ROOM-12는 자기 자리가 비어도 저녁이 바로 끊기지 않는 것을 본다.
```

대가:

```text
캠페인이 보류/증언/우회 배급을 비정상 처리로 감지한다.
높은 안정도는 안전이 아니라 보류를 견딜 힘이다.
```

---

## 6. 후속 반응 연결

### 6.1 복희 이름 보관함

복희의 역할:

```text
ROOM-12의 "연우" 조각과 PORCH-LINE의 "지호" 조각을
문패/순번표 표면이 아니라 보관함 쪽으로 분리한다.
```

조건:

```text
room12_bypass_ration
porch_line_flexible_ticket
name_painter_names_to_bokhee 또는 흔적 보존 중간 이상
```

복희 반응:

```text
ROOM-12 우회 배급 성공:
"역할은 저쪽에 두고, 이름은 여기 말려두자."

PORCH-LINE 유연한 순번표 성공:
"번호 말고, 앞뒤 사람이 부른 이름부터 말려두자."

둘 다 성공:
"연우, 지호.
둘 다 오늘은 밖에 크게 적지 말자.
저쪽이 읽으면 다시 줄 세워."
```

이름 위험:

```text
인간 안정도 낮음:
이름을 공개하면 캠페인 호출로 오염될 수 있다.

캠페인 농도 높음:
연우는 가족대표 호출로,
지호는 순번 관리자 호출로 오염될 수 있다.
```

### 6.2 WELCOME-DESK 순번표

WELCOME-DESK의 역할:

```text
PORCH-LINE의 현관 줄이 상담 순번표로 자동 변환되지 않게 한다.
ROOM-12의 가족대표 기록이 상담 완료 처리되지 않게 한다.
```

조건:

```text
welcome_desk_question_hold
welcome_desk_ticket_evidence
porch_line_flexible_ticket
```

WELCOME-DESK 반응:

```text
"순번표가 너무 정확하면,
질문이 그 순서대로 찾아옵니다."
```

후속:

```text
porch_line_exact_queue가 있으면 상담표 복구 위험 상승.
porch_line_flexible_ticket가 있으면 질문 보류와 호환.
room12_forced_removed가 있으면 12번 완료 처리 방지 필요.
```

### 6.3 DINING-4 빈자리

DINING-4의 역할:

```text
ROOM-12의 가족대표 자리와 DINING-4의 네 번째 식탁 자리가 같은 문제가 아니라는 것을 되짚는다.
```

차이:

```text
ROOM-12:
자리가 비면 저녁/침상 접근이 흔들린다고 믿는다.

DINING-4:
자리가 비면 캠페인이 새 가족 구성원을 끼워 넣는다고 믿는다.
```

DINING-4 반응:

```text
room12_bypass_ration 성공:
"그 사람은 저녁 때문에 못 일어났고,
저는 누가 앉을까 봐 못 일어났습니다."

room12_forced_removed:
"빈자리가 생기면,
저쪽은 참지 못합니다."

porch_line_flexible_ticket:
"줄도 자리를 조금 비워둘 수 있나요?"
```

후속:

```text
dining4_fourth_seat_hold가 있으면 ROOM-12 재방문 안정 상승.
없으면 ROOM-12 자리 이탈이 DINING-4 빈칸 공포를 다시 자극한다.
```

### 6.4 MAIL-LOOP 주소 호출

MAIL-LOOP의 역할:

```text
12번 방 주소와 현관 대기열 호출이 자동으로 결합하지 않게 한다.
```

조건:

```text
mail_loop_call_hold
mail_loop_logs_split
```

MAIL-LOOP 반응:

```text
호출 보류 성공:
"12번 방.
저녁 배송 보류 해제.
대표 수령인 호출은 보류됩니다."

호출 활성:
"12번 방.
대표 수령인 이탈 없음.
가족 수령 대기자는 현관 앞으로 이동해 주세요."
```

후속:

```text
mail_loop_call_hold가 없으면 PORCH-LINE의 줄이 주소 호출로 흔들린다.
porch_line_exact_queue가 있으면 MAIL-LOOP 호출이 상담 순번과 결합한다.
porch_line_flexible_ticket가 있으면 주소는 보관하되 호출은 지연된다.
```

---

## 7. 재방문 장면 구조

### 7.1 장면 1 - 현관 앞 12번 기록

위치:

```text
R01-L01 주택가 입구
PORCH-LINE 수기 순번표 앞
```

기본 연출:

```text
순번표의 12번이 지워지지 않고 남아 있다.
캠페인 출력표는 12번을 완료/재호출/대표 유지 중 하나로 처리하려 한다.
PORCH-LINE은 그 위에 손글씨 보류 표식을 붙인다.
```

분기:

```text
room12_bypass_ration:
12번 옆에 "배급 우회 / 자리 확인 대기"가 적힌다.

room12_forced_removed:
12번 옆에 "대표 이탈 / 배급 불안정"이 찍힌다.

room12_left_in_place:
12번 옆에 "대표 유지 / 이름 확인 불가"가 반복된다.
```

### 7.2 장면 2 - ROOM-12 짧은 이동

위치:

```text
12번 방 문턱 또는 현관 안쪽 짧은 거리
```

기본 연출:

```text
ROOM-12가 식탁에서 완전히 떠나지는 않는다.
그러나 우회 배급이 있으면 문턱까지 움직일 수 있다.
줄 상태에 따라 밖의 소리가 다르게 들린다.
```

분기:

```text
porch_line_flexible_ticket:
밖은 느리지만 덜 무너진다.

porch_line_exact_queue:
밖은 조용하지만 상담 호출음이 선명하다.

porch_line_dispersed:
밖은 자유로워 보이지만 서로 밀리는 소리가 난다.
```

### 7.3 장면 3 - 둘의 짧은 대면

위치:

```text
12번 방과 현관 줄 사이의 낮은 담장 또는 문턱.
```

권장 대화:

```text
PORCH-LINE:
"당신 차례는 왔었습니다.
그런데 차례가 왔다고 나갈 수 있는 건 아니더군요."

ROOM-12:
"저는 차례가 온 적이 있어요.
그래서 더 못 움직였어요."

윤서:
"차례랑 자리는 다른 문제야.
둘 다 저쪽이 읽고 있었을 뿐이지."
```

분기 대화:

```text
우회 배급 + 유연 순번표:
PORCH-LINE:
"오늘은 12번을 완료로 찍지 않았습니다.
보류로 남겼습니다."

ROOM-12:
"보류가 끝이 아니라는 걸 처음 알았습니다."
```

```text
강제 이동 + 줄 해산:
PORCH-LINE:
"줄도 자리도 한꺼번에 비우면,
사람들이 먼저 빈칸을 차지하려 합니다."

ROOM-12:
"제가 나온 게 맞는데,
왜 저쪽이 더 비어 보일까요."
```

---

## 8. 구현 플래그

### 8.1 입력 플래그

```text
room12_bypass_ration
room12_forced_removed
room12_left_in_place
porch_line_flexible_ticket
porch_line_exact_queue
porch_line_dispersed
welcome_desk_question_hold
welcome_desk_ticket_evidence
dining4_fourth_seat_hold
mail_loop_call_hold
name_painter_names_to_bokhee
```

### 8.2 출력 플래그

```text
r01_revisit_room12_porchline_started
r01_revisit_12_record_hold
r01_revisit_12_record_completed_risk
r01_revisit_12_record_scattered
r01_revisit_flexible_ticket_stable
r01_revisit_exact_queue_counseling_risk
r01_revisit_dispersed_crowd_risk
r01_revisit_room12_short_step
r01_revisit_room12_supply_gap
r01_revisit_room12_role_deepened
r01_revisit_porch_line_name_fragment_ready
r01_revisit_room12_name_fragment_ready
```

### 8.3 이름 조각 조건

ROOM-12 / 연우:

```text
필수:
room12_bypass_ration

권장 보조:
name_painter_names_to_bokhee
porch_line_flexible_ticket
인간 안정도 중간 이상

실패:
room12_forced_removed + 인간 안정도 낮음
room12_left_in_place + 캠페인 농도 높음
```

PORCH-LINE / 지호:

```text
필수:
porch_line_flexible_ticket

권장 보조:
room12_bypass_ration
welcome_desk_question_hold
인간 안정도 중간 이상

실패:
porch_line_exact_queue + 캠페인 농도 높음
porch_line_dispersed + 인간 안정도 낮음
```

---

## 9. 결재 포인트

스토리팀/시스템팀은 다음을 확인하면 된다.

```text
1. ROOM-12와 PORCH-LINE이 둘 다 "자리를 못 떠나는 사람"으로 뭉개지지 않는가?
2. ROOM-12는 식량태그/거주태그/가족대표 접근권의 문제로 남아 있는가?
3. PORCH-LINE은 현관 앞 줄과 순번, 사람이 서로를 밀지 않게 하는 질서의 문제로 남아 있는가?
4. room12_bypass_ration이 단순 구출 완료가 아니라 PORCH-LINE 재방문 변화를 여는가?
5. porch_line_flexible_ticket이 정답 버튼이 아니라 느림/불만/재스캔 위험을 남기는가?
6. 인간 안정도 낮음/중간/높음에 따라 대사와 상태가 실제로 달라지는가?
7. 복희, WELCOME-DESK, DINING-4, MAIL-LOOP 후속 반응이 각각 이름/상담표/빈자리/주소 호출 축으로 분리되어 있는가?
8. 다음 작업이 R01 P1 NPC 선택 분기 정리로 자연스럽게 넘어가는가?
```

---

## 10. 다음 작업

바로 다음 산출물:

```text
R01_P1_NPC_BRANCH_MAP_V0_1.md
```

목표:

```text
P1 재방문 시 어떤 NPC가 먼저 열리는지 정리한다.
DRAIN-MARK, SIGN-BACK, KEY-RING, VAC-0, WELCOME-DESK, FRAME-LEFT의 선택 분기를
통행태그/수신태그/인양 안정도/흔적 보존 상태값과 연결한다.
```

이유:

```text
PORCH-LINE / ROOM-12 재방문 분기로 인간 안정도와 줄/자리 후폭풍은 고정되었다.
다음에는 P1 재방문에서 배수로, 가짜 귀환로, 낡은 관리실, 상담 데스크, 가족사진 프레임이
어떤 순서와 조건으로 열리는지 정리해야 한다.
```

---

## 11. 최종 요약

PORCH-LINE / ROOM-12 재방문 분기의 핵심은 둘을 같이 구하거나 같이 실패시키는 것이 아니다.

```text
ROOM-12는 자리와 생존 접근권을 분리해야 한다.
PORCH-LINE은 줄과 상담 순번을 분리해야 한다.
```

가장 좋은 방향은 빠른 해결이 아니다.

```text
ROOM-12는 잠깐 일어날 수 있다.
PORCH-LINE은 줄을 조금 흐릴 수 있다.
사람들은 서로의 순서를 증언할 수 있다.
캠페인은 아직 이 모든 것을 다시 읽으려 한다.
```

따라서 이 분기의 감정은 승리가 아니라, 덜 위험한 재배치다.

```text
줄과 자리는 사라지지 않는다.
다만 더 이상 사람을 정확히 삼키는 형태로만 남지는 않는다.
```
