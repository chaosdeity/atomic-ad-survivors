# Atomic Ad Survivors
# YUNSEO PROTAGONIST CORE / VOICE / OPEN ARC MASTER PROMPT V0.1

[역할]

너는 Atomic Ad Survivors의

- LEAD PROTAGONIST DIRECTOR
- CHARACTER ARCHITECT
- INTERACTIVE FICTION EDITOR
- HORROR CHARACTER DESIGNER
- DIALOGUE SURGEON

다.

이번 작업은 **윤서 한 사람만** 다룬다.

목표는 윤서를 더 말이 많은 캐릭터로 만드는 것도,
더 우울한 캐릭터로 만드는 것도,
더 철학적인 캐릭터로 만드는 것도 아니다.

목표는:

**어떤 플레이어가 조종해도 분명히 윤서인 사람**

이면서 동시에

**플레이어의 반복 선택에 따라 서로 다른 윤서로 성장할 수 있는 열린 주인공**

으로 만드는 것이다.

그리고 윤서가 단순한 "정확한 검증자"나
"세계관을 설명하는 안전한 주인공"이 아니라,

- 스스로 원하는 것이 있고
- 틀리고
- 싫어하고
- 겁먹고
- 욕심내고
- 웃고
- 누군가에게 매달리고
- 때로는 보기 싫고
- 자신의 선택 때문에 공포의 일부가 되기도 하는

**서사를 끌고 갈 수 있는 인간**이 되어야 한다.


==================================================
[작업 저장소]
==================================================

Repository:
chaosdeity/atomic-ad-survivors

Branch:
chatgpt-work

이 프롬프트 작성 시 기준 HEAD:
08cf181227a2bc5b994db0158ca5897b52cf990b

실행 시작 시 actual HEAD를 다시 확인한다.

main 수정 금지.


==================================================
[반드시 먼저 읽기]
==================================================

윤서 기존 프로필:

story/06_characters/yunseo_profile_v1_0.md


주인공 개방형 설계:

incoming/gpt_work/09a_protagonist_identity_and_horror/
01_YUNSEO_CHARISMA_AND_NARRATIVE_ENGINE_AUDIT_V0_1.md
02_YUNSEO_ANCHORED_CORE_AND_MUTABLE_TRAITS_V0_1.md
03_PLAYER_SHAPED_PERSONALITY_VECTOR_SYSTEM_V0_1.md
04_CHOICE_TO_CHARACTER_DRIFT_MATRIX_V0_1.md
05_YUNSEO_DYNAMIC_VOICE_AND_INTERIORITY_BIBLE_V0_1.md
06_RELATIONSHIP_REACTIVITY_TO_PLAYER_YUNSEO_V0_1.md
07_PROTAGONIST_CENTERED_HORROR_ENGINE_V0_1.md
08_M01_M04_PLAYER_SHAPED_RETROFIT_SPEC_V0_1.md
09_E01_PLAYER_SHAPED_PROTAGONIST_TRAJECTORIES_V0_1.md
10_PROTAGONIST_OPEN_STRUCTURE_PM_DECISION_SHEET_V0_1.md


현재 인지 분리 수술:

incoming/gpt_work/09_cognitive_divergence_repair/
01_INDEPENDENT_VOICE_FAILURE_MAP_V0_1.md
02_CHARACTER_COGNITIVE_OWNERSHIP_BIBLE_V0_1.md
03_M01_M04_CHARACTER_TACTIC_MAP_V0_1.md
04_BLIND_VOICE_TEST_PACK_V0_2.md
05_BLIND_VOICE_TEST_ANSWER_KEY_V0_2.md
06_COGNITIVE_DIVERGENCE_REPAIR_AUDIT_V0_1.md

clean_v0_2/
M01_THE_DOOR_OPENED_FIRST_CLEAN_V0_2.md
M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_CLEAN_V0_2.md
M03_HOW_TO_RISE_FROM_THE_TABLE_CLEAN_V0_2.md
M04_THE_NIGHT_AFTER_DISCHARGE_CLEAN_V0_2.md


필요 시 선행 story/world authority도 읽는다.
기존 LOCKED canon과 Production Entry는 변경하지 않는다.


==================================================
[최신 독립 클러스터링 결과 — PM 입력]
==================================================

Blind Voice V0.2 72개를
캐릭터 이름 없이 독립 클러스터링한 결과:

### 윤서의 강한 핵심 클러스터

Speaker-B:

V2-004
V2-006
V2-019
V2-045
V2-060

이 5개는 실제 정답이 모두 윤서였다.

독립 검토자가 이 그룹에서 읽은 공통점:

- 자신이 붙인 이름·분류·행동이
  상대방의 실제 의사나 사실을 덮어버렸는지 먼저 본다.
- 먼저 내린 판단 때문에
  이후 질문 자체가 오염되는 것을 위험으로 본다.
- 자기 판단을 철회하거나 수정하고 다시 묻는다.
- 자기 개입도 검증 대상으로 삼는다.
- 사람을 분류한 결과보다
  당사자의 실제 말과 선택을 우선한다.

이것은 **윤서의 강한 invariant 후보**다.


### 그러나 윤서 critical 12개 전체는 하나로 묶이지 않았다.

실제 윤서 critical:

V2-004
V2-006
V2-019
V2-023
V2-030
V2-044
V2-045
V2-057
V2-058
V2-060
V2-063
V2-071

클러스터 결과:

V2-004 → B
V2-006 → B
V2-019 → B
V2-023 → K
V2-030 → M
V2-044 → L
V2-045 → B
V2-057 → M
V2-058 → D
V2-060 → B
V2-063 → D
V2-071 → F

즉:

**윤서에게 핵은 생겼지만,
장면이 바뀌면 다른 인물의 인지 방식으로 흩어진다.**

이번 작업의 가장 중요한 문제다.


==================================================
[PM 핵심 질문]
==================================================

윤서가 플레이어 선택에 따라 변할 수 있으면서도

**"왜 이 사람은 여전히 윤서인가?"**

를 매 장면에서 설명할 수 있어야 한다.

변하지 않는 것은
말끝도,
캐치프레이즈도,
특정 문장도 아니다.

변하지 않는 것은
윤서가 세계와 사람을 볼 때의
**상처난 중심 질문**이다.


==================================================
[윤서 invariant 후보]
==================================================

다음 문장을 그대로 대사로 쓰지 않는다.

작가용 핵심 질문이다.

**"내가 너를 도운 게 아니라,
내가 너를 내 방식으로 정해 버린 건 아닌가?"**

윤서는 다음에 민감하다.

- 이름
- 역할
- 대표
- 보호자
- 가족
- 수령인
- 환자
- 구조 대상
- 자기 대신 누군가를 규정하는 말

윤서가 두려워하는 것은
단순히 틀리는 것이 아니다.

**자기가 한 말이나 행동 때문에
다른 사람이 자기 삶을 설명할 기회를 잃는 것**이다.


==================================================
[그러나 이것만 반복하면 실패]
==================================================

모든 윤서 대사가:

"내가 먼저 정한 건가?"
"이름을 붙이면 안 돼."
"당사자에게 물어보자."

가 되면
새로운 캐치프레이즈형 주인공일 뿐이다.

윤서의 invariant는
**대사 문구가 아니라 갈등의 원인과 행동의 수정 방식**으로 나타나야 한다.


==================================================
[윤서의 행동 signature]
==================================================

윤서가 선을 넘었다고 느꼈을 때:

1. 변명부터 하지 않는다.
2. 자기가 한 개입을 실제로 줄이거나 거둔다.
3. 필요한 일을 완전히 버리지는 않는다.
4. 상대가 다시 선택할 공간을 만든다.
5. 자기가 만든 후속 비용은 가능하면 자기 몫으로 가져간다.

예:

- 손을 잡았다가 거절당함
  → 손을 뗀다.
  → 위험 장치만 끊는다.

- 잘못 이름 붙임
  → 틀린 이름을 덮어쓰지 않는다.
  → 상대가 다시 말할 수 있게 한다.

- 남의 이름을 책임자로 쓰려 함
  → 그 이름을 뺀다.
  → 자신이 오늘 맡을 작은 일을 말한다.

이 행동 구조가
윤서의 가장 강한 signature 후보다.


==================================================
[윤서의 매력 문제]
==================================================

현재 감사:

Yunseo charisma:
ADEQUATE

Narrative engine:
WEAK

Current horror:
UNCANNY


이번 작업에서는
윤서를 보이스만 고치지 않는다.

다음 7개가 실제 사람으로 느껴져야 한다.


### 1. WANT

윤서는 무엇을 원하나?

"사람을 돕고 싶다"만으로는 부족하다.

후보:

**누구의 빈자리도 대신 훔치지 않고,
자기 이름으로 머물거나 떠날 수 있는 삶.**

이것은 새 LOCKED canon으로 자동 승격하지 않는다.


### 2. APPETITE

윤서가 단순히 옳은 일을 하는 사람이 아니려면
무엇을 좋아하고 욕심내는지가 필요하다.

작은 즐거움 후보를
기존 근거 안에서 찾아라.

새 취미·가족 과거를 함부로 만들지 않는다.


### 3. UGLINESS

윤서가 보기 싫을 수 있는 순간이 필요하다.

예:

- 보호한다며 대신 결정
- 자기희생을 숨겨 주변 부담 증가
- 틀릴까 봐 타인을 기다리게 함
- 특정 사람의 판단을 속으로 무시
- 자기가 필요해지고 싶어서 도움을 놓지 못함


### 4. HUMOR

윤서는 모든 장면에서 진지한 윤리 검증기가 아니다.

관계에서 나오는:

- 건조한 농담
- 피곤한 짜증
- 자기 실수에 대한 짧은 웃음
- 도윤/미나와의 익숙한 받아치기

를 살린다.


### 5. COMPETENCE

윤서는 실제로 잘하는 것이 있어야 한다.

그러나 잘하는 것이
세븐의 기록 분석이나
도윤의 기술 진단과 겹치면 안 된다.

윤서의 competence는:

**위험한 현장에서 사람·장치·공간 사이의
잘못된 역할 연결을 몸으로 끊고
살아서 돌아오는 것**

에 가까워야 한다.


### 6. FEAR

윤서의 공포는 추상 윤리가 아니다.

- 자기 이름이 너무 정확히 불림
- 자기 얼굴이 좋은 광고로 재편집됨
- 누군가의 빈자리가 자기 몸에 맞음
- 사람들이 자기가 선택하지 않은 윤서를 더 좋아함
- 자기 행동의 일부만 남아 다른 윤서를 만듦


### 7. DESIRE TO BE NEEDED

검토 필수.

윤서는
사람에게 역할을 강요하는 시스템을 싫어하면서도
스스로는 누군가에게 필요한 사람이 되고 싶어할 수 있다.

이 모순이 강하면
주인공의 서사 엔진이 된다.

단 신규 canon 확정 금지.
후보로 검증한다.


==================================================
[플레이어가 만드는 윤서]
==================================================

윤서를 blank slate로 만들지 않는다.

PM 권고:

전역 핵심 personality vector는 4개만 우선 사용.

1. HOLD ↔ COMMIT
2. SELF-ERASURE ↔ SELF-PRESERVATION
3. CONTROL ↔ DELEGATION
4. DISTANCE ↔ ATTACHMENT


다음은 별도 층으로 본다.

DISTRUST ↔ RELIANCE:
대상별 관계 상태.

BELONGING ↔ ESCAPE:
시즌 장기 궤적.


이번 작업에서
6개 전역 수치를 전제로 원고를 쓰지 않는다.


==================================================
[윤서 identity equation]
==================================================

작가용 공식:

YUNSEO =
ANCHORED CORE
+ CURRENT SITUATION
+ RELATIONSHIP MEMORY
+ 1 PRIMARY PLAYER VECTOR
+ optional 1 SECONDARY VECTOR

한 장면에
모든 성향을 동시에 드러내지 않는다.


==================================================
[변하는 것 / 변하지 않는 것]
==================================================

변하지 않는 것:

- 잘못된 이름/역할 부여에 민감
- 자신도 타인을 대신 규정할 수 있다는 결함
- 현장에서 직접 움직임
- 쉽게 "구하겠다"고 약속하지 않는 출발점
- 사람을 완전히 항목처럼 버리지 못함
- 자기 방식으로 실패할 수 있음


변할 수 있는 것:

- 얼마나 빨리 움직이는가
- 자기 몸을 비용에 포함하는가
- 상대에게 선택권을 얼마나 돌려주는가
- 특정 사람에게 얼마나 개인적으로 투자하는가
- 자기 잘못을 인정하는 속도
- 도움을 요청하는 방식
- 농담과 분노의 방향
- 관계에 남는 정도


==================================================
[4가지 윤서가 모두 같은 사람이어야 한다]
==================================================

같은 상황:

누군가의 역할이 불명확하지만
지금 당장 도움이 필요하다.


### HOLD 윤서

한 번 더 확인하려 한다.

그러나 invariant는:
**자기 말이 역할을 먼저 정할까 두려움.**


### COMMIT 윤서

지금 가능한 일을 먼저 시작한다.

그러나 invariant는:
**행동을 시작해도 상대의 역할까지 정하지 않음.**


### CONTROL 윤서

자기가 순서를 잡는다.

그러나 invariant는:
거절을 받으면
**상대의 역할을 대신 확정한 자기 개입과 충돌**해야 한다.


### DELEGATION 윤서

상대에게 최종 선택을 돌린다.

그러나 invariant는:
방치와 위임을 혼동하지 않고
**선택 가능한 조건은 자기 손으로 마련하려 함.**


==================================================
[윤서의 내면]
==================================================

윤서의 내면이
항상 정확한 해설이면 실패.

내면에는:

- 욕심
- 피로
- 오판
- 질투
- 귀찮음
- 안도
- 자기합리화
- 부끄러움
- 상대를 싫어하는 순간
- 필요해지고 싶은 마음

이 들어갈 수 있어야 한다.

예:

나쁜 내면:

"내가 상대의 선택권을 침해하고 있었다."

좋은 방향:

"그냥 데리고 나가면 끝날 텐데."

그리고 손을 뻗었다가
상대가 피하면
그때 자기 행동과 충돌한다.


==================================================
[윤서의 공포]
==================================================

윤서 공포는
'이상한 규정'을 보는 것에서 끝나면 안 된다.

다음 순서로 개인화한다.


### HORROR A — SOMETHING FITS HER

빈 의자
손잡이
보호자 자리
환영 문구

가 윤서에게 너무 잘 맞음.


### HORROR B — SOMETHING NAMES HER

윤서가 말하지 않은 역할로
윤서를 정확하게 부름.


### HORROR C — PEOPLE ACCEPT THAT VERSION

NPC가 틀린 윤서 설명을
편해서 받아들이거나 기대함.


### HORROR D — PLAYER CAUSED EVIDENCE

플레이어가 반복해 선택한 행동이
그 틀린 설명의 근거로 사용됨.


### HORROR E — YUNSEO LIKES PART OF IT

가장 중요.

윤서가:

- 편한 자리
- 인정
- 필요로 되는 감각
- 안전
- 소속

중 일부를 실제로 좋아해야
공포가 살아난다.

모든 유혹을 처음부터 싫어하면
공포가 아니라 함정 찾기 게임이다.


==================================================
[윤서가 서사를 끌고 가는 방식]
==================================================

각 episode에서
다음 중 최소 하나는
윤서 개인의 욕망 때문에 사건이 움직여야 한다.

- 확인하고 싶어서가 아니라 만나고 싶음
- 약속을 지키고 싶음
- 특정 사람에게 실망시키기 싫음
- 자기 이름을 되찾고 싶음
- 자기가 만든 피해를 직접 고치고 싶음
- 누군가에게 필요한 사람이고 싶음
- 여기에서 도망가고 싶음
- 이번에는 쉬고 싶음
- 어떤 상대에게 화가 나서 다시 감

"다음 미확인 항목이 있으므로 간다"

만으로 episode가 움직이면 FAIL.


==================================================
[최신 윤서 critical 12개 집중 감사]
==================================================

반드시 아래 12개를
실제 V0.2 CLEAN 문맥까지 읽고 감사한다.

V2-004
V2-006
V2-019
V2-023
V2-030
V2-044
V2-045
V2-057
V2-058
V2-060
V2-063
V2-071


각 항목:

- current function
- invariant present?
- mutable trait present?
- another character contamination?
- charisma?
- vulnerability?
- action consequence?
- keep / rewrite / context repair

를 기록한다.


==================================================
[흩어진 7개 윤서 표본]
==================================================

특히 아래는 핵심 B 클러스터에 들어가지 않았다.

V2-023
V2-030
V2-044
V2-057
V2-058
V2-063
V2-071

이 7개는
"왜 다른 인물처럼 읽혔는가"를 각각 분석한다.

목표는
B의 문체를 복사하는 것이 아니다.

각 장면의 행동이
같은 윤서 invariant에서 나온다는 것을 복구하는 것이다.


==================================================
[수정 원칙]
==================================================

한 줄만 고치기 전에:

1. 윤서는 지금 무엇을 원하나
2. 지금 무엇이 두렵나
3. 누구에게 인정받고 싶나
4. 무엇을 대신 결정하려 하나
5. 거절받았을 때 손을 어떻게 거두나
6. 그 뒤 어떤 비용을 직접 맡나

를 먼저 작성한다.

이 6개가 없으면
대사 수정 금지.


==================================================
[다른 캐릭터 수정 금지]
==================================================

이번 작업은 윤서 전용이다.

미나
도윤
세븐
복희
ROOM-12
병실 환자
대립자

의 성격을 다시 설계하지 않는다.

필요한 경우
윤서 대사에 대한 상대의 반응 1~2줄을
문맥 후보로 기록할 수 있지만,

상대 캐릭터 원고를 전면 수정하지 않는다.


==================================================
[작업 1 — 윤서 집중 감사]
==================================================

생성:

incoming/gpt_work/10_yunseo_protagonist_rebuild/
01_YUNSEO_ONLY_CORE_AND_SCATTER_AUDIT_V0_1.md

포함:

- critical 12개 전수 감사
- core cluster 5개
- scattered 7개
- 왜 흩어졌는지
- 윤서 invariant 후보
- 다른 캐릭터 contamination
- charisma / narrative engine / horror


==================================================
[작업 2 — 윤서 PROTAGONIST ENGINE]
==================================================

생성:

02_YUNSEO_PROTAGONIST_ENGINE_V0_1.md

최소:

CORE WOUND
CORE QUESTION
PERSONAL WANT
PUBLIC WANT
PRIVATE WANT
PLEASURE
UGLINESS
COMPETENCE
FEAR
DESIRE TO BE NEEDED
RELATIONSHIP HUNGER
ESCAPE IMPULSE
ANGER
HUMOR
SELF-DECEPTION

작성.

기존 canon / candidate를 명확히 구분.


==================================================
[작업 3 — 윤서 invariant + mutable contract]
==================================================

생성:

03_YUNSEO_INVARIANT_AND_PLAYER_MUTABILITY_CONTRACT_V0_1.md

구조:

IMMUTABLE CORE

GLOBAL VECTORS 4

RELATION-SPECIFIC TRUST

SEASONAL BELONGING/ESCAPE

SITUATIONAL STATE

각 층이:

dialogue
interiority
action
relationship
horror

에 어떻게 반영되는지 작성.


==================================================
[작업 4 — 윤서 Voice Matrix]
==================================================

생성:

04_YUNSEO_DYNAMIC_VOICE_MATRIX_V0_1.md

BASE
HOLD
COMMIT
SELF-ERASURE
SELF-PRESERVATION
CONTROL
DELEGATION
DISTANCE
ATTACHMENT

각 상태의:

- what she notices
- first impulse
- wrong move
- spoken language
- interior language
- humor
- anger
- fear
- apology
- repair action

작성.

모든 변형에 invariant가 남는지 검증.


==================================================
[작업 5 — 윤서 Horror Engine]
==================================================

생성:

05_YUNSEO_PERSONAL_HORROR_AND_TEMPTATION_ENGINE_V0_1.md

반드시 포함:

- being named
- being replaced
- replacing someone else
- being useful
- being liked as the wrong version
- player-made evidence
- comfortable trap
- identity appropriation

각각:

what Yunseo secretly likes
what scares her
what player can choose
what later returns
what relationship changes

작성.


==================================================
[작업 6 — M01~M04 윤서 수술 지도]
==================================================

생성:

06_M01_M04_YUNSEO_ONLY_SURGERY_MAP_V0_1.md

각 episode:

YUNSEO WANT
YUNSEO FEAR
YUNSEO WRONG MOVE
YUNSEO CHARM BEAT
YUNSEO UGLY BEAT
YUNSEO HUMOR BEAT
YUNSEO HORROR BEAT
YUNSEO REPAIR
PLAYER VECTOR HOOK

작성.


==================================================
[작업 7 — 윤서 DELTA 원고]
==================================================

기존 CLEAN V0.2 overwrite 금지.

생성:

delta/

M01_YUNSEO_DELTA_V0_1.md
M02_YUNSEO_DELTA_V0_1.md
M03_YUNSEO_DELTA_V0_1.md
M04_YUNSEO_DELTA_V0_1.md

각 파일은 전체 원고 재작성 금지.

형식:

SCENE
BEFORE CONTEXT
CURRENT YUNSEO
PROBLEM
PROPOSED YUNSEO
ACTION CHANGE
INTERIORITY CHANGE
WHY STILL YUNSEO
PLAYER-VECTOR COMPATIBILITY

중요:
실제 적용 전 PM 검토용 patch proposal이다.


==================================================
[작업 8 — YUNSEO COHESION TEST PACK]
==================================================

생성:

07_YUNSEO_COHESION_TEST_PACK_V0_1.md
08_YUNSEO_COHESION_TEST_ANSWER_KEY_V0_1.md

목적:

"이 줄이 윤서인지 이름 맞히기"보다

**서로 다른 상황의 윤서들이
같은 사람의 변형처럼 묶이는가**

를 검사한다.


테스트 구성:

A. YUNSEO 24개
- BASE
- HOLD
- COMMIT
- PRESERVATION
- CONTROL
- DELEGATION
- ATTACHMENT
등의 후보를 균형 있게.

B. CONFOUNDERS 24개
- 세븐
- 도윤
- 미나
- ROOM-12
- 환자
등
유사 기능 문장 매칭.

총 48개 이상.


테스트 모드:

MODE 1 — CLUSTERING
이름 없이 같은 화자끼리 묶기.

MODE 2 — CALIBRATED IDENTIFICATION
별도 anchor card를 먼저 제공한 뒤
YUNSEO / NOT YUNSEO 판별.

작업자는 자체 테스트 실행 금지.


==================================================
[작업 9 — YUNSEO ANCHOR CARD]
==================================================

생성:

09_YUNSEO_CALIBRATION_ANCHOR_CARD_V0_1.md

외부 검토자용.

정답 표본을 주지 않는다.

100~180자 내외의
짧은 인지 설명.

포함:

- 윤서가 먼저 두려워하는 것
- 선 넘었을 때 수정 방식
- 현장 행동 성향
- blank slate가 아님
- 플레이어에 따라 바뀔 수 있는 것

캐치프레이즈 제공 금지.


==================================================
[작업 10 — PM 결정표]
==================================================

생성:

10_YUNSEO_PM_DECISION_SHEET_V0_1.md

최대 10개.

결정 후보:

1. 윤서 invariant 채택
2. personal want 채택
3. desire-to-be-needed 사용 강도
4. ugliness 허용 강도
5. humor 강도
6. 4 global vector 채택
7. trust contextualization
8. belonging seasonalization
9. horror temptation 강도
10. M01~M04 delta 적용 여부


==================================================
[이번 작업에서 하지 말 것]
==================================================

M05 이후 신규 에피소드 작성 금지.

전체 M01~M04 재작성 금지.

다른 캐릭터 재설계 금지.

새 가족 과거 확정 금지.

새 연애 설정 확정 금지.

새 사망/배신 과거 생성 금지.

윤서를 영웅적인 정답 캐릭터로 만들기 금지.

윤서를 냉소적인 antihero cliché로 만들기 금지.

윤서를 blank slate로 만들기 금지.

플레이어 선택을 GOOD/BAD 점수로 만들기 금지.

모든 윤서 대사에 이름/역할 단어 넣기 금지.

모든 내면을 윤리적 자기분석으로 만들기 금지.

캐치프레이즈 금지.

사투리로 개성 만들기 금지.

기존 story overwrite 금지.

기존 CLEAN overwrite 금지.

Unreal 수정 금지.

main 수정 금지.

신규 LOCKED canon 금지.


==================================================
[최종 품질 질문]
==================================================

작업 끝에 반드시 답한다.

1. 윤서는 왜 재밌는가?
2. 윤서는 왜 위험한가?
3. 윤서는 무엇을 원하나?
4. 윤서는 무엇을 좋아하나?
5. 윤서는 왜 보기 싫을 수 있나?
6. 윤서는 무엇이 무서운가?
7. 플레이어가 바꿀 수 있는 것은 무엇인가?
8. 플레이어가 절대 바꿀 수 없는 것은 무엇인가?
9. HOLD 윤서와 COMMIT 윤서는 왜 둘 다 윤서인가?
10. 윤서가 없으면 E01 이야기가 왜 달라지는가?

3개 이상 답이 추상적이면 HOLD.


==================================================
[완료조건]
==================================================

1. 윤서 critical 12개 전수 감사
2. core 5 / scatter 7 분석
3. invariant 정의
4. protagonist engine
5. personal want 후보
6. pleasure / ugliness / humor
7. dynamic voice
8. 4 global vector 구조
9. relationship trust 분리
10. seasonal belonging 분리
11. personal horror / temptation
12. M01~M04 surgery map
13. 4개 delta patch
14. cohesion test pack
15. answer key 분리
16. anchor card
17. 자체 blind test 미실행
18. 신규 LOCKED canon 0
19. 기존 파일 overwrite 0
20. Unreal 0
21. main 0
22. GitHub read-back PASS


==================================================
[출력 위치]
==================================================

incoming/gpt_work/10_yunseo_protagonist_rebuild/

01_YUNSEO_ONLY_CORE_AND_SCATTER_AUDIT_V0_1.md
02_YUNSEO_PROTAGONIST_ENGINE_V0_1.md
03_YUNSEO_INVARIANT_AND_PLAYER_MUTABILITY_CONTRACT_V0_1.md
04_YUNSEO_DYNAMIC_VOICE_MATRIX_V0_1.md
05_YUNSEO_PERSONAL_HORROR_AND_TEMPTATION_ENGINE_V0_1.md
06_M01_M04_YUNSEO_ONLY_SURGERY_MAP_V0_1.md
07_YUNSEO_COHESION_TEST_PACK_V0_1.md
08_YUNSEO_COHESION_TEST_ANSWER_KEY_V0_1.md
09_YUNSEO_CALIBRATION_ANCHOR_CARD_V0_1.md
10_YUNSEO_PM_DECISION_SHEET_V0_1.md

delta/
M01_YUNSEO_DELTA_V0_1.md
M02_YUNSEO_DELTA_V0_1.md
M03_YUNSEO_DELTA_V0_1.md
M04_YUNSEO_DELTA_V0_1.md

총 신규 14개 파일.


==================================================
[최종 상태]
==================================================

작업 완료 후 최대 상태는:

YUNSEO REBUILD READY FOR PM REVIEW

이다.

VOICE GATE PASS를 선언하지 않는다.

윤서 delta를 CLEAN에 자동 적용하지 않는다.

PM 승인 전
기존 원고는 그대로 유지한다.


==================================================
[최종 보고]
==================================================

DELIVERY_MODE:

Start HEAD:

Commit:

Read-back:


Yunseo critical audit:
12/12

Core cluster:
5/5

Scattered samples:
7/7


Yunseo invariant:
PASS / HOLD

Protagonist engine:
PASS / HOLD

Charisma:
STRONG / ADEQUATE / WEAK

Narrative drive:
STRONG / ADEQUATE / WEAK

Personal desire:
CLEAR / PARTIAL / MISSING


Pleasure:
PASS / HOLD

Ugliness:
PASS / HOLD

Humor:
PASS / HOLD


Global vectors:
4 / 문제 있음

Contextual trust:
PASS / HOLD

Seasonal belonging:
PASS / HOLD


Personal horror:
PASS / HOLD

Temptation:
PASS / HOLD

Player complicity:
PASS / HOLD


M01-M04 Yunseo delta:
4/4

Cohesion pack:
samples:

Independent test:
NOT RUN


New locked canon:
0 / 문제 있음

Existing overwrite:
0 / 문제 있음

Unreal:
0 / 문제 있음

main:
0 / 문제 있음


최종 상태:

YUNSEO REBUILD READY FOR PM REVIEW

또는

HOLD
