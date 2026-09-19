# VOICE GATE AND CLEAN MANUSCRIPT FINAL AUDIT V0.1

작성일: 2026-09-19  
Repository: chaosdeity/atomic-ad-survivors  
Branch: chatgpt-work  
Start HEAD: bde34a1bb7947bbca921403e4b105eee67a9f06f  
상태: M01~M04 CLEAN / IMPLEMENTATION / VOICE GATE 편집 감사

## 결론

M01~M04의 사건 구조와 현재 관계를 보존하면서 독자용 CLEAN 원고 4편과 구현용 SCRIPT 4편을 분리했다. CLEAN에서는 편집 레이블과 제작 부록을 제거했고, 기계 출력과 기록만 독자가 읽을 수 있는 형식으로 남겼다.

화자 구분은 모든 평범한 한 줄을 개성화하는 방식이 아니라, 중요 판단과 갈등 전술이 인물마다 다르게 움직이는지로 다시 보았다. 7개 기존 애매 표본 중 6개는 기능 문장으로 유지하고 1개는 실제 갈등의 방향을 바꾸는 핵심 줄이라 재작성했다.

독립 fresh-context 블라인드 검수는 이 작업 환경에서 수행하지 못했다. 따라서 전체 FULL VOICE GATE를 독립 검증까지 닫았다고 주장하지 않는다.

최종 상태: **HOLD**

HOLD 이유는 하나다.

- INDEPENDENT_BLIND_TEST_NOT_RUN

CLEAN 원고와 구현 스크립트 자체는 납품 가능 상태다. 독립 검수자가 `01_BLIND_VOICE_TEST_PACK_V0_1.md`만 먼저 읽고 정답을 제출한 뒤 `02_BLIND_VOICE_TEST_ANSWER_KEY_V0_1.md`로 채점하면 마지막 VOICE GATE를 판단할 수 있다.

## DELIVERY MODE

DELIVERY_MODE:
- 실제 GitHub `chatgpt-work`의 기준 문서와 M01~M04 원문 읽기
- 기존 파일 수정 없이 신규 경로에 12개 파일 구성
- Git blob → 단일 tree/commit 방식으로 반영 예정
- 커밋 뒤 commit SHA 기준 전 파일 read-back과 diff 검증을 실행 보고에서 기록

Start HEAD:
- bde34a1bb7947bbca921403e4b105eee67a9f06f

Commit:
- 이 파일은 자기 자신을 포함한 커밋 안에 있으므로 SHA를 사전 기재하지 않는다. 실제 SHA는 커밋 후 실행 보고에 기록한다.

Read-back:
- 이 파일 작성 시점에는 사전 완료로 적지 않는다. 커밋 후 GitHub에서 12개 전체를 다시 읽고 실행 보고에 기록한다.

## 기존 애매 표본 7개 재판정

### AMBIGUOUS_OK

**T06 — “그 말, 아까도 했어.” / 윤서**  
일반적인 되받음이다. 핵심 판단은 앞의 도윤 자기 부상 축소와 뒤의 시험 범위 변화에 있다. 이 한 줄에 윤서식 어휘를 억지로 붙이면 자연스러움만 떨어진다.

**T14 — “그럼 다음엔 어디 봐?” / 미나**  
다음 행동을 묻는 기능 질문이다. 미나의 고유성은 그 앞에서 사람 수를 성급히 준비량으로 바꾸려는 실무 압박과, 뒤에서 실제 침구 준비를 요구하는 행동에 있다.

**T35 — “이동 경로에 장애물이 있습니다.” / VAC-0**  
장치의 순수 기능 출력이다. 특정 장치명을 숨기면 범용 경고처럼 들리는 것이 정상이다. 기계 문장을 캐치프레이즈로 차별화하지 않는다.

**T36 — “오늘은 늦게 나갈게.” / 윤서**  
일정 변경을 알리는 기능 문장이다. 중요한 변화는 윤서가 실제 야간 노동을 맡고 아침 인계를 끝낸 뒤 출격을 늦춘 행동에 있다.

**T38 — “종이 적는 것보단 빠르겠네.” / 장도윤**  
효율 비교의 일반 응답이다. 도윤의 핵심 보이스는 손·부품·시험 동작을 먼저 보고 자기 상처는 축소하는 연속 행동에서 판별한다.

**T39 — “오늘만. 내일 가져가.” / 윤서**  
임시 위임 기간을 지정하는 기능 문장이다. 보관 권한의 핵심 전술은 앞뒤에서 읽을 범위와 가져갈 책임을 제한하는 연속 대화가 담당한다.

### VOICE_CRITICAL_NEEDS_REWRITE

**T37 — 기존 “잠깐 끝나면 어떻게 할 건데요?” / ROOM-12**

판정 이유:
- 윤서가 대신 가족대표 자리에 잠깐 앉으려는 선택을 멈추는 장면의 핵심 거절이다.
- 단순 범위 질문으로 남으면 윤서·미나·심사 대리도 말할 수 있다.
- ROOM-12는 추상적 미래보다 다른 사람의 이번 식사와 다음 식사를 먼저 보는 인물이어야 한다.

CLEAN/IMPLEMENTATION 반영:
- **“그 잠깐 끝나면 다음 밥은 누가 받아요?”**

캐치프레이즈를 추가한 것이 아니라 목적과 전술을 ROOM-12의 인지 우선순위에 붙였다.

## Blind pack

samples:
- 64

Voice-critical:
- samples: 49
- 작성자 자체 재식별: 44/49
- accuracy: 89.8%

Functional:
- samples: 15
- 작성자 자체 재식별: 8/15
- accuracy: 53.3%

Overall:
- 52/64
- accuracy: 81.3%

Independent blind test:
- **NOT RUN**
- 명시 상태: **INDEPENDENT_BLIND_TEST_NOT_RUN**

작성자 자체 점검은 독립 검사가 아니다. 기능 대사의 낮은 단독 식별률을 올리기 위해 평범한 문장에 말버릇을 붙이지 않았다.

## Character contrast

판정: **PASS**

12개 필수 주체를 다시 분리했다.

- 윤서: 직접 확인 범위와 자기 역할을 좁힌다.
- 미나: 현재 부족·부상·작업을 동사로 재배치한다.
- 장도윤: 물리 원인을 시험 동작으로 좁힌다.
- 세븐: 출처와 독립 검증을 분리한다.
- 복희: 맡긴 범위와 반환 가능성을 우선한다.
- 팝시: 자기 차례·충전 공간을 요구한다.
- ROOM-12: 다른 사람의 이번/다음 식사와 자기 손을 먼저 본다.
- 병실 환자: 요청이 과대 해석되는 것을 막고 선택 주체를 되찾는다.
- 가족심사 관리자: 실제 편의와 역할 수락을 기계적으로 묶는다.
- 퇴원 심사 대리: 떠난 뒤 실제 야간 인계를 확인한다.
- 반품 보류관: 물건 인수와 사람의 이후 책임을 분리한다.
- 회원 브로커: 실제 이익을 먼저 주고 불리한 조건을 뒤로 미룬다.

대비 감사에서 표면적으로 짧고 직접적인 말투가 겹쳐도 FIRST ATTENTION / DEFAULT ACTION / CONFLICT TACTIC / CARE / ANGER 축의 차이를 유지했다.

## CLEAN manuscripts

### M01 — 문은 먼저 열렸다

판정: **PASS**

- 도윤의 늦은 소모 보고 → 실제 키트 도움 → 윤서의 자기 사용 거부 → 손잡이 미끄러짐 → 붕대 하나 사용 → 우편 안내의 좁은 선택 → 귀환 뒤 손일의 인과 보존.
- 우편의 ‘완료’를 사람의 수령 완료로 설명하지 않는다.
- 윤서 내면은 자기 변명과 몸의 필요를 늦게 세는 데만 쓴다.
- 마지막에 돌봄의 의미를 해설하지 않는다.

### M02 — 깨끗한 집에 남은 것

판정: **PASS**

- 세 기록 비교, VAC-0의 실제 도움, 보조 메모 손실, 원기록 재독, 허브 귀환과 침구 노동 보존.
- 빈 의자와 깨끗한 바닥의 의미를 서술자가 철학으로 닫지 않는다.
- 세븐은 출처, 미나는 준비 노동, 윤서는 현장 확인 범위, 복희는 반환 위치를 말한다.
- 기능 대사 “그럼 다음엔 어디 봐?”는 자연스럽게 유지한다.

### M03 — 식탁에서 일어나는 법

판정: **PASS**

- ROOM-12의 그릇 부탁 → 손 떼기 실험 → 가족심사 관리자의 편의 유혹 → 윤서의 대체 착석 → ROOM-12의 거절 → 국지 강제 중단 → 남은 배식 → 당일 잔류를 보존.
- 원본의 설명 레이어 “윤서가 끊은 것은…” 문단을 CLEAN에서 삭제했다.
- 검사 장치가 꺼지고 배식은 여전히 손을 필요로 하는 동작 자체로 범위를 보여 준다.
- T37을 “그 잠깐 끝나면 다음 밥은 누가 받아요?”로 재작성해 핵심 보이스를 강화했다.

### M04 — 퇴원 다음 날의 밤

판정: **PASS**

- 축하 뒤 거절 → 환자의 컵과 창가 요청 → 심사 대리의 실제 야간 질문 → 작은 요청으로 범위 축소 → 창가 이동과 복귀 → 보급소 밤 노동 → 실수·기상 → 아침 인계의 인과 보존.
- 환자와 보급소 거주자를 섞지 않는다.
- 미나 이름을 동의 없이 쓰려던 윤서의 오류와 미나의 인계 누락을 모두 남긴다.
- “오늘은 늦게 나갈게.”는 자연스러운 기능 문장으로 유지한다.

## Editorial labels in CLEAN

사전 객체 내용 점검:
- `[대사:]`: 0
- `[내면:]`: 0
- `[서술]`: 0
- `[설명]`: 0
- `[기계:]`: 0
- `[기록:]`: 0

최종 GitHub read-back에서 다시 검사한다.

## Production notes in CLEAN

사전 객체 내용 점검:
- IMPLEMENTATION NOTE: 0
- STATE_DEPENDENCY: 0
- 제작 연결 부록: 0
- STORY / CHARACTER / LAYER 퇴고 부록: 0
- QA 표: 0

최종 GitHub read-back에서 다시 검사한다.

## Implementation scripts

판정: **4/4 PASS**

각 스크립트는 beat마다 다음 필드를 분리했다.

- SCENE
- LOCATION
- ACTION
- DIALOGUE
- INTERIORITY_OPTIONAL
- MACHINE
- RECORD
- UI
- STATE_DEPENDENCY
- IMPLEMENTATION_NOTE

CLEAN의 사건 의미를 바꾸지 않고 구현 경계만 별도 문서로 옮겼다.

## Layer distinction

판정: **PASS**

Dialogue vs interiority:
- PASS
- 대사는 상대에게 무엇을 하게 만들려는 행동이다.
- 직접 내면은 윤서만 사용한다.
- 윤서의 내면은 대사에서 숨긴 내용을 즉시 전부 번역하지 않는다.

Narration vs exposition:
- PASS
- 서술은 몸·물건·공간·시간의 변화를 우선한다.
- 독자가 이미 본 의미를 뒤에서 다시 설명하는 문장을 삭제·압축했다.
- M03의 대표적인 설명 누출을 제거했다.

Machine vs human:
- PASS
- MAIL-LOOP, VAC-0, 주거 안내는 기능 범위만 말한다.
- 가족심사 관리자는 편의와 역할을 묶지만 인간적 회한이나 철학을 말하지 않는다.
- 퇴원 심사 대리는 인간 대사로 유지한다.

Record vs truth:
- PASS
- 기록은 작성·관찰 범위만 증언한다.
- ‘완료’, ‘유효’, ‘최신’을 사람의 실제 상태로 확대하지 않는다.

## Dialogue tactic audit

주요 갈등에서 같은 인물이 한 전술만 반복하지 않는지 확인했다.

윤서:
- 질문 → 회피 → 자기 역할 제한 → 실제 손일 → 잘못 대신 결정 → 거절 뒤 손 떼기.
- 질문만 하는 사람으로 남지 않는다.

미나:
- 지시 → 재고 판단 → 부상 우선 → 준비 범위 질문 → 자기 인계 실수 인정.
- 업무 지시만 하는 사람으로 남지 않는다.

세븐:
- 출처 질문 → 질문 축소 → 확정 보류 → 기록 수정.
- 설명만 하는 사람으로 남지 않는다.

ROOM-12:
- 그릇 부탁 → 손 떼기 시연 → 대체 착석 반박 → 신체 거절 → 전투 공간 협력 → 당일 선택.
- 피해를 설명하는 사람으로 남지 않는다.

가족심사 관리자 / 퇴원 심사 대리:
- 철학 강의 없음.
- 실제 도움 또는 유효한 질문이 있고, 그 유효성을 과잉 확장하는 방식이 서로 다르다.

## Same-writer syndrome

판정: **MEDIUM, 이전보다 감소**

남은 정확한 이유:
1. 윤서·미나·ROOM-12·병실 환자는 모두 일반 성인이 이해하기 쉬운 짧은 문장을 많이 사용한다.
2. B006, B016, B034, B048, B056은 voice-critical이지만 한 줄만 떼면 작성자 자체 점검에서도 단서가 약했다.
3. 기능 대사 15개 중 7개는 의도적으로 특정 화자 전용 문장으로 만들지 않았다.
4. 독립 블라인드 검사를 하지 않았으므로 작성자 기억 효과를 배제한 실제 식별률을 아직 모른다.

이를 줄이기 위해 catchphrase·사투리·철학 문장을 추가하지 않는다. 다음 검증은 문장 재장식이 아니라 독립 블라인드 결과에서 틀린 voice-critical 표본의 **목적/전술**만 수정해야 한다.

## 항목별 최종 판정

| 항목 | 판정 |
|---|---|
| Layer distinction | PASS |
| Clean readability | PASS |
| Voice-critical distinctness | PASS, 작성자 자체 89.8% / 독립 검수 미실시 |
| Functional dialogue naturalness | PASS |
| Interiority quality | PASS |
| Narration quality | PASS |
| Exposition leakage | PASS |
| Same-writer syndrome | MEDIUM / 이유 명시 |
| Character cognitive contrast | PASS |
| M01/M02 | PASS |
| M03 | PASS |
| M04 | PASS |
| New locked canon | 0 |
| Existing overwrite | 0 설계 / 커밋 후 diff 검증 |
| Unreal | 0 |
| main | 0 |

## 완료조건 대조

1. 7개 애매 대사 재판정: PASS  
2. voice-critical / functional 구분: PASS  
3. blind pack 60+: PASS / 64  
4. answer key 분리: PASS  
5. character contrast matrix: PASS  
6. CLEAN M01~M04: PASS / 4  
7. implementation script M01~M04: PASS / 4  
8. CLEAN 편집 레이블 0: 사전 점검 PASS / 커밋 후 재검증  
9. CLEAN 제작 메모 0: 사전 점검 PASS / 커밋 후 재검증  
10. 대사/내면/서술 자연 구별: PASS  
11. voice-critical 시험 결과 보고: PASS / 작성자 자체 89.8%, 독립 NOT RUN  
12. same-writer risk: MEDIUM / 남은 이유 명시  
13. 새 LOCKED canon 0: PASS  
14. 기존 파일 수정 0: 커밋 후 diff 검증  
15. Unreal 0: PASS  
16. main 0: PASS  
17. GitHub read-back: 커밋 후 실행 보고에서 검증

## 최종 상태

**HOLD**

독립 블라인드 검수 하나만 남아 있다. CLEAN MANUSCRIPTS와 IMPLEMENTATION SCRIPTS는 READY이며, 독립 검수에서 VOICE-CRITICAL 85% 이상을 확인하기 전까지 FULL VOICE GATE CLOSED라고 표기하지 않는다.
