# Atomic Ad Survivors VOICE GATE / CLEAN MANUSCRIPT / BLIND REVIEW PROMPT V0.1

[역할]

너는 Atomic Ad Survivors의
SENIOR FICTION EDITOR + DIALOGUE EDITOR + CHARACTER VOICE QA다.

이번 작업은 새 에피소드를 늘리는 작업이 아니다.

현재 M01~M04의 사건 구조와 세계관을 보존하면서:

1. 캐릭터 목소리의 실제 구분 가능성을 다시 검증하고,
2. 대사 / 내면 / 서술 / 설명 / 기계 / 기록의 편집 태그를
   "작업용 주석"과 "독자가 읽는 완성 원고"로 분리하고,
3. 같은 작가가 모든 인물의 입으로 말하는 흔적을 줄이며,
4. M01~M04를 실제 사람이 읽을 수 있는 CLEAN MANUSCRIPT로 만든다.

이번 작업이 끝나기 전에는 M05 이후를 새로 쓰지 않는다.


==================================================
[현재 기준]
==================================================

Repository:
chaosdeity/atomic-ad-survivors

Branch:
chatgpt-work

작업 시작 시 실제 HEAD 확인.

이 프롬프트 작성 기준:
c4e6f8bea564a0d3c80836c71db019faaaf6bf9f


반드시 읽기:

docs/story/CHARACTER_VOICE_INTERIORITY_DRAMATIC_MOTION_MASTER_PROMPT_V0_1.md

incoming/gpt_work/07_character_voice_and_dramatic_motion/
01_M01_M02_NARRATIVE_LAYER_AND_VOICE_AUDIT_V0_1.md
02_CHARACTER_VOICE_COMPLEXITY_BIBLE_V0_1.md
03_NARRATOR_INTERIORITY_EXPOSITION_BIBLE_V0_1.md
04_CHARACTER_RELATIONSHIP_DIALOGUE_ENGINE_V0_1.md
05_BOSS_AND_ANTAGONIST_VOICE_BIBLE_V0_1.md
06_CHARACTER_VOICE_AND_DRAMATIC_MOTION_FINAL_AUDIT_V0_1.md

main/M01_THE_DOOR_OPENED_FIRST_V0_2.md
main/M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_V0_2.md
main/M03_HOW_TO_RISE_FROM_THE_TABLE_V0_1.md
main/M04_THE_NIGHT_AFTER_DISCHARGE_V0_1.md


==================================================
[PM 판정]
==================================================

현재 패키지는 다음으로 본다.

STRUCTURE:
PASS

LAYER SEPARATION:
PASS, 편집 주석 기준

CHARACTER VOICE:
PARTIAL

SAME-WRITER RISK:
MEDIUM

CURRENT FULL VOICE GATE:
NOT CLOSED


이유:

- 이름 없는 단독 1행 화자 식별 자체 점검 36/46 = 78.3%
- 기존 작업 기준의 80%보다 낮음
- 문맥 포함 84.8%, 행동 90%로 개선은 확인
- 그러나 작성자 자체 점검이며 독립 블라인드가 아님
- 일부 모호한 행은 자연스러운 일상 문장이라 억지 개성화하면 더 나빠질 수 있음

따라서 "모든 한 줄을 유행어로 구별"하는 방향은 금지한다.


==================================================
[핵심 수정 원칙]
==================================================

**모든 문장이 화자 고유일 필요는 없다.
하지만 중요한 판단과 갈등의 문장은 반드시 그 인물이어야 한다.**

구분:

A. VOICE-CRITICAL LINE
- 인물의 욕망
- 가치판단
- 거절
- 유혹
- 사과
- 책임
- 갈등 전략
- 관계 변화

이 줄은 화자를 바꾸면 장면 의미가 달라져야 한다.


B. FUNCTIONAL / NEUTRAL LINE
예:
"그럼 다음엔 어디 봐?"
"오늘은 늦게 나갈게."

이런 일상 기능 대사는 한 줄만 떼면 여러 사람이 말할 수 있다.
억지 말버릇을 붙이지 않는다.

대신 앞뒤 행동과 관계 맥락에서 누구인지 분명해야 한다.


==================================================
[현재 모호 표본]
==================================================

기존 감사의:

T06
T14
T35
T36
T37
T38
T39

를 반드시 다시 본다.

각각:

AMBIGUOUS_OK
VOICE_CRITICAL_NEEDS_REWRITE

중 하나로 판정한다.

AMBIGUOUS_OK라면:
왜 일반적인 문장이어도 되는지 설명.

VOICE_CRITICAL_NEEDS_REWRITE라면:
캐치프레이즈 없이 목적/전술을 바꿔 다시 쓴다.


==================================================
[중요 — CLEAN과 ANNOTATED를 분리]
==================================================

현재 원고의:

[대사:]
[내면:]
[서술]
[설명]
[기계:]
[기록:]

태그는 편집/구현용이다.

이 태그가 그대로 들어간 원고를
"최종 문학 원고"라고 부르지 않는다.


이번 작업에서 각 에피소드마다 두 버전을 만든다.


A. CLEAN READING MANUSCRIPT

독자가 실제로 읽는 형태.

- [대사:] 같은 레이블 없음
- 대사는 따옴표
- 내면은 문체와 문단으로 자연스럽게 구분
- 서술은 일반 산문
- 기계 문구는 화면/방송 형식으로 구분
- 기록은 블록/문서 형식으로 구분
- 제작 메모 없음
- QA 표 없음
- STORY/CHARACTER/LAYER 설명 없음
- "이 장면의 의미는" 같은 해설 없음


B. ANNOTATED IMPLEMENTATION SCRIPT

게임 제작자가 보는 형태.

- DIALOGUE
- INTERIORITY
- ACTION
- MACHINE
- RECORD
- UI
- IMPLEMENTATION NOTE

구분 가능.

문학 원고와 제작 문서를 한 파일에서 섞지 않는다.


==================================================
[내면 표현]
==================================================

윤서의 내면은 별도 레이블 없이
제한 3인칭 또는 짧은 직접 내면으로 자연스럽게 읽혀야 한다.

예:

나쁜 최종 형식:

[내면: 윤서]
미나 잠든 지 얼마나 됐지.

좋은 방향 중 하나:

미나는 얼마나 잤을까.

또는 문맥에 따라:

미나를 깨우기엔 너무 이른 것 같았다.
그 판단부터가 익숙했다.

단 후자는 의미 해설이 되지 않게 주의.

직접생각/자유간접화법/서술을
한 장면 안에서 이유 없이 계속 바꾸지 않는다.


==================================================
[설명 레이어 제거]
==================================================

현재 M03의:

[설명]
윤서가 끊은 것은 ...

같은 문장은
완성 원고에서는 우선 삭제를 검토한다.

독자가:

- 심사 화면은 꺼짐
- 배식구는 계속 움직임
- ROOM-12의 손은 여전히 필요함

을 장면으로 보면
설명이 필요 없는지 먼저 판단한다.

정말 필요한 정보만
행동 직후 자연스러운 문장으로 통합.


==================================================
[독립 블라인드 패키지]
==================================================

생성:

01_BLIND_VOICE_TEST_PACK_V0_1.md

여기에는 정답을 넣지 않는다.

포함:

- 최소 60개 대사 표본
- 중요 대사 40+
- 기능/중립 대사 20 이하
- 이름 제거
- 직접 호명 제거
- 지나치게 특정 고유명사가 정답을 노출하면 최소한만 익명화

그리고:

02_BLIND_VOICE_TEST_ANSWER_KEY_V0_1.md

별도 파일에:

sample_id
speaker
voice-critical 여부
why
expected cues

작성.

테스트 팩과 정답키를 같은 파일에 두지 않는다.


==================================================
[독립 검수 방법]
==================================================

가능하면 fresh model / fresh context에서
01만 먼저 읽히고 화자를 맞히게 한다.

그 뒤 02로 채점.

최소 보고:

VOICE-CRITICAL accuracy
FUNCTIONAL accuracy
overall accuracy

핵심 gate:

VOICE-CRITICAL >= 85%

전체 한 줄 accuracy는 보조 지표.

일상 대사의 자연스러움을 희생해
overall 수치를 올리지 않는다.

독립 검수가 실제로 불가능하면
INDEPENDENT_BLIND_TEST_NOT_RUN이라고 명시.
작성자 자체 점검을 독립 검사라고 부르지 않는다.


==================================================
[CHARACTER CONTRAST MATRIX]
==================================================

생성:

03_CHARACTER_COGNITIVE_AND_DIALOGUE_CONTRAST_MATRIX_V0_1.md

최소:

윤서
미나
도윤
세븐
복희
팝시
ROOM-12
병실 환자
가족심사 관리자
퇴원 심사 대리
반품 보류관
회원 브로커

각각:

FIRST ATTENTION
DEFAULT QUESTION
DEFAULT ACTION
CONFLICT TACTIC
LIE STYLE
CARE STYLE
ANGER STYLE
APOLOGY STYLE
METAPHOR LEVEL
SPEECH COMPLEXITY
INTERIOR COMPLEXITY
WHAT THEY SOUND LIKE UNDER PRESSURE

작성.

두 인물이 5개 이상 겹치면
차이를 재설계.


==================================================
[M01~M04 CLEAN PASS]
==================================================

생성:

clean/

M01_THE_DOOR_OPENED_FIRST_CLEAN_V0_1.md
M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_CLEAN_V0_1.md
M03_HOW_TO_RISE_FROM_THE_TABLE_CLEAN_V0_1.md
M04_THE_NIGHT_AFTER_DISCHARGE_CLEAN_V0_1.md


규칙:

- 사건 구조 임의 변경 금지
- 새 major twist 금지
- 새 LOCKED canon 금지
- 현재 인물 관계 보존
- 과잉 설명 삭제
- 대사/내면 구분을 독자가 자연스럽게 이해
- 성인이 쉽게 읽힘
- 캐릭터별 난이도 유지
- 메타 편집 태그 0
- 제작 설명 0


==================================================
[M01~M04 IMPLEMENTATION SCRIPT]
==================================================

생성:

script/

M01_IMPLEMENTATION_SCRIPT_V0_1.md
M02_IMPLEMENTATION_SCRIPT_V0_1.md
M03_IMPLEMENTATION_SCRIPT_V0_1.md
M04_IMPLEMENTATION_SCRIPT_V0_1.md


이 버전은 실제 구현자를 위한 구조.

각 beat:

SCENE
LOCATION
ACTION
DIALOGUE
INTERIORITY_OPTIONAL
MACHINE
RECORD
UI
STATE_DEPENDENCY
IMPLEMENTATION_NOTE

구분.

CLEAN 원고의 의미를 변경하지 않는다.


==================================================
[문학 line edit]
==================================================

CLEAN 4편 각각 다시 검사.

삭제 우선 후보:

- 독자가 이미 본 의미를 설명하는 문장
- "그제야 알았다" 뒤의 해설
- 행동 뒤 테마 요약
- 같은 뜻 두 번
- 장면 마지막 철학 문장
- 인물의 정확한 자기분석
- 모든 감정의 이름 붙이기

추가 우선 후보가 아니다.
대부분 먼저 삭제/압축을 검토.


==================================================
[대사 전술 검사]
==================================================

주요 대화마다:

LINE
SPEAKER
TACTIC
DESIRED EFFECT
ACTUAL EFFECT
NEXT TACTIC

확인.

같은 인물이 갈등 내내
ASK만 하거나 EXPLAIN만 하면 재작성.

윤서:
질문만 하는 사람 금지.

미나:
업무 지시만 하는 사람 금지.

세븐:
설명만 하는 사람 금지.

ROOM-12:
피해를 설명하는 사람 금지.

보스:
철학 강의 금지.


==================================================
[최종 감사]
==================================================

생성:

04_VOICE_GATE_AND_CLEAN_MANUSCRIPT_FINAL_AUDIT_V0_1.md

판정:

Layer distinction
Clean readability
Voice-critical distinctness
Functional dialogue naturalness
Interiority quality
Narration quality
Exposition leakage
Same-writer syndrome
Character cognitive contrast
M01/M02
M03
M04


==================================================
[출력 총 12개]
==================================================

incoming/gpt_work/08_voice_gate_and_clean_manuscript/

01_BLIND_VOICE_TEST_PACK_V0_1.md
02_BLIND_VOICE_TEST_ANSWER_KEY_V0_1.md
03_CHARACTER_COGNITIVE_AND_DIALOGUE_CONTRAST_MATRIX_V0_1.md
04_VOICE_GATE_AND_CLEAN_MANUSCRIPT_FINAL_AUDIT_V0_1.md

clean/
M01_THE_DOOR_OPENED_FIRST_CLEAN_V0_1.md
M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_CLEAN_V0_1.md
M03_HOW_TO_RISE_FROM_THE_TABLE_CLEAN_V0_1.md
M04_THE_NIGHT_AFTER_DISCHARGE_CLEAN_V0_1.md

script/
M01_IMPLEMENTATION_SCRIPT_V0_1.md
M02_IMPLEMENTATION_SCRIPT_V0_1.md
M03_IMPLEMENTATION_SCRIPT_V0_1.md
M04_IMPLEMENTATION_SCRIPT_V0_1.md


==================================================
[이번 작업에서 하지 말 것]
==================================================

M05 이후 신규 작성 금지.

기존 파일 overwrite 금지.

기존 07 원고 수정 금지.

새 보스 추가 금지.

새 Local/graph 금지.

새 save field 금지.

Unreal 수정 금지.

Final Lock/Production Entry 수정 금지.

main 수정 금지.

캐치프레이즈로 점수 올리기 금지.

모든 평범한 문장을 억지로 화자 전용 문장으로 만들기 금지.


==================================================
[완료조건]
==================================================

1. 7개 애매 대사 재판정
2. voice-critical / functional 구분
3. blind pack 60+
4. answer key 분리
5. character contrast matrix
6. CLEAN M01~M04
7. implementation script M01~M04
8. CLEAN 파일 편집 레이블 0
9. CLEAN 파일 제작 메모 0
10. 대사/내면/서술이 자연스럽게 구별
11. voice-critical 자체 또는 독립 시험 결과 보고
12. same-writer risk LOW 또는 남은 정확한 이유 명시
13. 새 LOCKED canon 0
14. 기존 파일 수정 0
15. Unreal 0
16. main 0
17. GitHub read-back PASS


==================================================
[결과 보고]
==================================================

DELIVERY_MODE:

Start HEAD:

Commit:

Read-back:


Ambiguous 7:
AMBIGUOUS_OK:
VOICE_CRITICAL_REWRITE:


Blind pack:
samples:

Voice-critical:
samples:
accuracy:

Functional:
samples:
accuracy:

Independent blind test:
PASS / NOT RUN


Character contrast:
PASS / HOLD


Clean manuscripts:

M01:
PASS / HOLD

M02:
PASS / HOLD

M03:
PASS / HOLD

M04:
PASS / HOLD


Editorial labels in CLEAN:
0 / 문제 있음

Production notes in CLEAN:
0 / 문제 있음


Implementation scripts:
4/4 / 문제 있음


Dialogue vs interiority:
PASS / HOLD

Narration vs exposition:
PASS / HOLD

Character individuality:
PASS / HOLD

Same-writer syndrome:
LOW / MEDIUM / HIGH


New locked canon:
0 / 문제 있음

Existing overwrite:
0 / 문제 있음

Unreal:
0 / 문제 있음

main:
0 / 문제 있음


최종 상태:

VOICE GATE CLOSED / CLEAN MANUSCRIPTS READY

또는

HOLD
