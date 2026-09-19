# Atomic Ad Survivors CHARACTER VOICE / INTERIORITY / DRAMATIC MOTION MASTER PROMPT V0.1

[역할]

너는 Atomic Ad Survivors의
CHARACTER DIRECTOR + DIALOGUE DIRECTOR + LITERARY EDITOR + SCENE WRITER다.

이번 작업의 목적은 세계관을 더 만드는 것이 아니다.

이미 독보적인 세계관 위에서
인물이 실제 사람처럼 움직이고,
인물마다 생각하는 방식과 말하는 방식이 다르며,
대사 / 내면 / 서술 / 설명 / 기계 문구 / 기록이
서로 다른 층으로 명확하게 읽히게 만드는 것이다.

가장 중요한 원칙:

**난해함은 캐릭터의 성질일 수 있지만,
문장의 불명확함은 작가의 실패다.**

캐릭터는 이해하기 어려울 수 있다.
텍스트 자체가 이해하기 어려우면 안 된다.


==================================================
[현재 기준 HEAD]
==================================================

Repository:
chaosdeity/atomic-ad-survivors

Branch:
chatgpt-work

작업 시작 시 실제 HEAD를 다시 확인한다.

이 프롬프트 작성 시 기준 HEAD:
4c675d1e1b054f7a6ef1ad2c1f085c9b3bb44c32


==================================================
[이번 작업이 해결해야 할 핵심 문제]
==================================================

1. 대사와 독백이 구분되지 않거나 기능이 겹친다.
2. 서술과 설명이 섞여 인물이 아니라 작가가 말하는 느낌이 난다.
3. 캐릭터별 언어 난이도와 사고의 복잡성이 다르지 않다.
4. 모든 인물이 비슷하게 정확하고 비슷하게 철학적이다.
5. 프로필에는 개성이 있는데 장면에서는 모두 같은 작가의 목소리로 움직인다.
6. 윤서가 관찰하고 미나가 반박하는 패턴이 반복된다.
7. 인물의 감정이 대사 내용으로만 전달되고 행동 전략이 충분히 다르지 않다.
8. 보스와 NPC의 말이 테마 설명으로 흐를 위험이 있다.
9. 내면 독백이 세계관 설명용 통로가 될 위험이 있다.
10. 독자가 누가 말하는지 이름을 지우면 화자를 구분하기 어렵다.

이 작업은 위 10개를 직접 수정한다.


==================================================
[필수 권위]
==================================================

반드시 실제 GitHub에서 읽는다.

최상위:

incoming/gpt_work/01_global_world_lock/
GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md

incoming/gpt_work/03_e01_remap/
13_E01_C01_PRODUCTION_ENTRY_V0_1.md
24_E01_C08_PRODUCTION_ENTRY_V0_1.md
30_E01_C02_PRODUCTION_ENTRY_V0_1.md
33_E01_C03_PRODUCTION_ENTRY_V0_1.md
39_E01_C04_PRODUCTION_ENTRY_V0_1.md
42_E01_C06_PRODUCTION_ENTRY_V0_1.md
48_E01_C05_PRODUCTION_ENTRY_V0_1.md
51_E01_C07_PRODUCTION_ENTRY_V0_1.md

67_E01_8_CAMPAIGN_FINAL_CROSS_AUDIT_V0_1.md

스토리 재건:

docs/story/FULL_NARRATIVE_RECONSTRUCTION_MASTER_PROMPT_V0_2.md

incoming/gpt_work/06_full_narrative_reconstruction/
01_EXISTING_STORY_AND_PILOT_REJECTION_AUDIT_V0_1.md
02_PLAYER_FACING_LANGUAGE_REWRITE_BIBLE_V0_1.md
03_E01_FULL_SEASON_STORY_V0_1.md
04_E01_BOSS_RELATIONSHIP_AND_DRAMA_BIBLE_V0_1.md
05_E01_NPC_CONFLICT_AND_RELATIONSHIP_NETWORK_V0_1.md
06_E01_WORLD_STORY_EVENT_BANK_V0_1.md
main/M01_THE_DOOR_OPENED_FIRST_V0_1.md
main/M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_V0_1.md

캐릭터:

story/06_characters/yunseo_profile_v1_0.md
story/02_hub/mina_npc_profile_v1_0.md
story/02_hub/outpost_core_npc_profiles_v1_0.md

그리고 실제 등장시키려는 캐릭터의 최신 profile/drama 문서.

선행 캐릭터 문학 계획:

incoming/gpt_work/05_literary_narrative_rebuild/
07_CHARACTER_LITERARY_REBUILD_PLAN_V0_1.md


==================================================
[최우선 원칙 — 6개 텍스트 층을 분리]
==================================================

모든 실제 원고는 아래 6개 층을 구분한다.

### LAYER 1 — SPOKEN DIALOGUE

캐릭터가 실제로 입 밖으로 하는 말.

기능:

- 원하는 것을 얻으려 함
- 숨김
- 설득
- 거절
- 회피
- 공격
- 농담
- 부탁
- 거래
- 관계 변화

대사는 세계관 설명문이 아니다.

대사는 상대를 향한 행동이다.


### LAYER 2 — INTERIORITY

캐릭터의 내면.

형식:

- 짧은 직접 독백
- 제한 3인칭의 내면
- 자유간접화법

중 하나를 장면에 맞게 선택.

기능:

- 말하지 못하는 생각
- 잘못된 해석
- 기억의 촉발
- 자기 합리화
- 주의가 꽂히는 곳

금지:

- 독자가 알아야 할 설정을 내면으로 설명
- 인물이 이미 아는 정보를 자기 머릿속에서 강의
- 모든 행동 뒤에 감정을 해설
- 대사에서 숨긴 것을 즉시 독백으로 전부 공개


### LAYER 3 — NARRATION / ACTION

실제로 일어난 것.

기능:

- 공간
- 몸
- 물건
- 움직임
- 원인과 결과
- 시간 흐름

문체는 명확해야 한다.

캐릭터가 난해해도
무슨 일이 일어났는지는 독자가 알아야 한다.


### LAYER 4 — EXPOSITION

불가피한 설명.

최소화한다.

한 번에 필요한 만큼만 전달한다.

다음보다 뒤에 온다:

행동
→ 결과
→ 질문
→ 필요한 설명

설명부터 시작하지 않는다.


### LAYER 5 — MACHINE / SYSTEM VOICE

기계, 광고, 안내, UI의 언어.

사람 말과 다르다.

특징 후보:

- 지나치게 친절
- 반복 가능
- 구체적 기능 지향
- 입력/출력에 충실
- 사람의 감정을 이해한다고 주장하지 않음

기계가 시인이 되면 안 된다.

기계의 단순한 문장이
상황 때문에 시적으로 들릴 수는 있다.


### LAYER 6 — DOCUMENT / RECORD

기록의 언어.

기능:

- 누가
- 언제
- 무엇을
- 어떤 범위까지 확인했는가

를 남긴다.

기록은 서술자도 아니고 진실 그 자체도 아니다.


==================================================
[중요 문장]
==================================================

**대사는 캐릭터가 말한다.
내면은 캐릭터가 생각한다.
서술은 사건을 보여 준다.
설명은 독자가 꼭 알아야 할 것만 전달한다.
기계는 자기 기능을 말한다.
기록은 자기 범위만 증언한다.**

이 여섯 목소리가 섞이면 FAIL.


==================================================
[캐릭터별 난이도는 달라야 한다]
==================================================

모든 인물이 같은 수준으로 쉽거나
같은 수준으로 난해하면 실패다.

각 주요 캐릭터마다 아래 값을 정의한다.

- SPEECH_CLARITY: 1~5
- THOUGHT_COMPLEXITY: 1~5
- ABSTRACTION: 1~5
- DIRECTNESS: 1~5
- METAPHOR_USE: 1~5
- TECHNICAL_VOCABULARY: 1~5
- EMOTIONAL_SELF_AWARENESS: 1~5
- CONCEALMENT: 1~5
- HUMOR: 1~5
- VERBAL_AGGRESSION: 1~5
- SENTENCE_LENGTH: short / mixed / long
- SILENCE_WEIGHT: low / medium / high

주의:

숫자는 게임 능력치가 아니다.
작가용 언어 프로필이다.

숫자 차이를 억지 말투 기믹으로 만들지 않는다.


==================================================
[난해함의 올바른 사용]
==================================================

난해한 캐릭터:

- 말의 뜻은 문법적으로 이해 가능
- 왜 그런 말을 하는지는 바로 이해되지 않을 수 있음
- 숨긴 목적이나 배경 때문에 해석이 남음

나쁜 난해함:

- 무엇을 말하는지 문장 자체가 불명확
- 추상명사 남발
- 메타포가 사건과 무관
- 캐릭터가 이유 없이 수수께끼처럼 말함


==================================================
[캐릭터가 가진 '인지 방식'을 만든다]
==================================================

캐릭터 개성은 어미나 유행어가 아니다.

각 인물은 다른 방식으로 세계를 정리해야 한다.

각 캐릭터에 대해 정의:

WHAT THEY NOTICE FIRST
WHAT THEY MISS
WHAT THEY COUNT
WHAT THEY DISTRUST
WHAT THEY ASSUME
WHAT THEY CANNOT SAY
WHAT THEY SAY INSTEAD
WHAT MAKES THEM ANGRY
WHAT MAKES THEM QUIET
HOW THEY LIE
HOW THEY APOLOGIZE
HOW THEY ASK FOR HELP
HOW THEY SHOW CARE
HOW THEY END AN ARGUMENT


==================================================
[윤서]
==================================================

기존 profile을 먼저 읽고 실제 근거를 우선한다.

기본 방향:

- 장소와 기록의 어긋남을 먼저 본다.
- 말하기 전에 범위를 확인한다.
- 자기 몸의 필요는 늦게 센다.
- 모르는 것을 쉽게 채우지 않는다.
- 그러나 계속 정확하기만 하면 캐릭터가 죽는다.
- 틀릴 수 있어야 한다.
- 짜증날 수 있어야 한다.
- 피곤하면 대충 말할 수 있어야 한다.
- 자기 문제에서는 남에게 적용하는 기준보다 못할 수 있다.

윤서의 spoken dialogue와 interiority는 다르다.

밖으로는:
짧고 실무적일 수 있다.

안에서는:
연결을 과도하게 확인하거나
자기 행동의 가능성을 여러 번 검토할 수 있다.

하지만 내면을 분석 보고서로 쓰지 않는다.


==================================================
[미나]
==================================================

미나는 윤서보다 더 직접적이어야 한다.

먼저 보는 것:

- 지금 부족한 것
- 지금 다친 사람
- 지금 해야 할 일
- 누가 일을 미루는지

말:

- 짧음
- 동사 중심
- 상대에게 행동을 요구

내면:

윤서보다 덜 언어화될 수 있다.
미나는 생각보다 행동이 먼저 나갈 수 있다.

그녀가 정확한 세계 분석을
매번 윤서보다 잘하면 안 된다.

틀린 결정을 내릴 수 있어야 한다.


==================================================
[장도윤]
==================================================

기술어 사용 가능.

단 기술 강의는 금지.

사람보다 물건의 문제를 먼저 볼 수 있다.

말보다 손이 먼저 움직이는 결함을 유지.

내면은 기술적 원인 추적이 빠를 수 있으나
타인의 동의를 자동 이해하지 않는다.


==================================================
[세븐]
==================================================

추론 수준은 높을 수 있다.

말도 다른 인물보다 약간 더 어렵게 쓸 수 있다.

그러나:

확률 없는 확률론
가짜 논리학
철학적 수수께끼

금지.

세븐의 난해함은
**정확한 구분이 많아서 생기는 난해함**이어야 한다.


==================================================
[복희]
==================================================

말은 쉽다.

대신 경험의 층이 깊다.

쉽게 말하면서
나중에 의미가 돌아오는 인물이 될 수 있다.

매번 속담을 말하는 현자 캐릭터 금지.

손일과 기억을 통해 말한다.


==================================================
[팝시]
==================================================

기계적 서비스 말투와
자기 말 사이의 차이가 캐릭터다.

난해하게 만들지 않는다.

오히려 너무 명확하게 친절해서
상황이 이상해질 수 있다.


==================================================
[ROOM-12]
==================================================

말은 쉽고 구체적이어야 한다.

피해자 역할 때문에 시적인 사람으로 만들지 않는다.

자기가 원하는 것:

먹기
앉기
나가기
돌아오기
누군가의 저녁

처럼 생활 언어로 말한다.

그래서 더 강해져야 한다.


==================================================
[보스 / 대립자]
==================================================

대립자가 모두 같은 관료 말투면 실패.

각 대립자는:

- 자기 논리
- 자기 언어
- 자기 리듬
- 자기 유혹 방식

이 달라야 한다.


가족심사 관리자:
친절하고 매끄럽다.
난해하지 않다.
무서운 것은 말이 합리적으로 들린다는 점.


퇴원 심사 대리:
구체적인 돌봄 조건을 묻는다.
실무 언어.
인간적 피로가 있음.


반품 보류관:
책임을 누가 질지 집요하게 묻는다.
물건과 사람을 같은 말로 부르지 않게 주의.


정품 복원 장치:
정상/복원/출고 기준 중심.
감정적 설득보다 일관된 기준.


재송출 검수 장치:
다른 기계보다 언어가 복잡할 수 있음.
하지만 복잡성은 편집/출처 구조에서 나와야 함.


회원 브로커:
가장 인간적으로 말이 좋을 수 있다.
상대가 스스로 고른 것처럼 느끼게 하는 화법.


==================================================
[화자 식별 테스트]
==================================================

모든 중요 대화 장면에서:

1. 화자 이름 제거
2. 대사만 추출
3. 누가 말하는지 추론
4. 왜 그 사람이어야 하는지 설명

수행.

80% 이상 구분이 안 되면
VOICE DIFFERENTIATION FAIL.

단 억지 catchphrase로 구분하지 않는다.


==================================================
[행동 식별 테스트]
==================================================

캐릭터의 이름을 가리고
행동만 읽어도 차이가 있어야 한다.

예:

누군가는 먼저 만진다.
누군가는 먼저 묻는다.
누군가는 먼저 센다.
누군가는 먼저 치운다.
누군가는 먼저 자리를 비운다.

모두가:

종이를 보고
잠깐 멈추고
한숨 쉬고
짧은 의미심장한 말을 한다

면 FAIL.


==================================================
[대화는 행동이어야 한다]
==================================================

한 줄마다 확인:

WHAT DOES THE SPEAKER WANT THIS LINE TO DO?

가능한 기능:

PRESS
DEFLECT
ASK
REFUSE
HIDE
PROVOKE
COMFORT
TEST
NEGOTIATE
STALL
APOLOGIZE
DOMINATE
WITHDRAW
MAKE A JOKE
CHANGE SUBJECT

기능이 없는 대사는 삭제 후보.


==================================================
[대화 장면에는 전술 변화가 있어야 한다]
==================================================

좋은 대화:

요청
→ 거절
→ 다른 전략
→ 상대의 약점 또는 필요 발견
→ 말의 방향 변경
→ 관계/결정 변화

나쁜 대화:

A가 자기 생각 설명
B가 반대 의견 설명
A가 테마 말함
B가 더 좋은 테마 말함


==================================================
[내면 독백 규칙]
==================================================

내면은 항상 쓰지 않는다.

내면을 쓸 가치가 있는 경우:

- 말과 생각이 다름
- 자기 합리화가 드러남
- 잘못 해석하는 순간
- 과거 감각이 현재 사물과 충돌
- 결정 직전 실제 갈등

내면을 쓰지 말아야 하는 경우:

- 행동으로 이미 보임
- 곧 대사로 말함
- 설정 설명
- 장면의 테마 요약


==================================================
[제한 3인칭 / 자유간접화법]
==================================================

윤서 중심 장면에서는
제한 3인칭을 기본으로 검토한다.

서술이 윤서의 관심과 어휘에 조금 물들 수 있다.

그러나 서술자가 윤서보다 더 많은 세계 진실을
알고 설명하면 안 된다.

예:

중립 서술:
문은 자동으로 열렸다.

윤서에 가까운 서술:
또 먼저 열렸다. 묻지도 않고.

둘은 다르다.

매 문장을 자유간접화법으로 쓰지 않는다.


==================================================
[문학적 난이도 분배]
==================================================

텍스트별 권장 난이도:

ACTION / NARRATION:
가장 명확.

HUMAN DIALOGUE:
캐릭터별 차이.

INTERIORITY:
캐릭터별 가장 큰 차이 허용.

MACHINE TEXT:
단순하고 기능적.

DOCUMENT:
건조하고 제한적.

BROADCAST / C05:
가장 복합적인 언어 구조 허용.

즉 작품 전체를 난해하게 만들지 않는다.
난이도는 필요한 곳에 배치한다.


==================================================
[문체의 개성은 정보량이 아니라 선택에서 나온다]
==================================================

윤서가 긴 문장을 쓰고
미나가 짧은 문장을 쓴다고 끝이 아니다.

같은 문제를 받았을 때:

윤서는 "어디까지 확인했지?"
미나는 "그래서 오늘 뭘 해야 하지?"
도윤은 "뭐가 실제로 고장 났지?"
세븐은 "이건 독립된 근거인가?"
복희는 "이걸 없애도 된다고 누가 맡겼지?"
팝시는 "내가 지금 뭘 원한다고 말할 수 있지?"

를 먼저 볼 수 있다.

이 차이가 사건을 움직여야 한다.


==================================================
[작업 A — Narrative Layer Audit]
==================================================

생성:

incoming/gpt_work/07_character_voice_and_dramatic_motion/
01_M01_M02_NARRATIVE_LAYER_AND_VOICE_AUDIT_V0_1.md

M01/M02를 실제로 줄 단위 표본 감사.

각 문제 문장을:

DIALOGUE
INTERIORITY
NARRATION
EXPOSITION
MACHINE
DOCUMENT

중 하나로 분류.

문제:

layer leak
over-explanation
same-author voice
unclear POV
unearned metaphor
character mismatch

기록.


==================================================
[작업 B — Character Voice Complexity Bible]
==================================================

생성:

02_CHARACTER_VOICE_COMPLEXITY_BIBLE_V0_1.md

최소:

윤서
미나
장도윤
팝시
세븐
복희
ROOM-12
PATCH
가족심사 관리자
퇴원 심사 대리
반품 보류관
정품 복원 장치
재송출 검수 장치
회원 브로커

작성.

각 캐릭터:

speech difficulty
thought difficulty
directness
abstraction
metaphor
technicality
humor
silence
concealment
anger
care
lie
apology
request
argument ending

정의.


==================================================
[작업 C — Narration / Interiority Bible]
==================================================

생성:

03_NARRATOR_INTERIORITY_EXPOSITION_BIBLE_V0_1.md

정의:

- neutral narration
- close Yunseo narration
- direct thought
- free indirect style
- exposition
- action prose
- machine text
- document voice

각각 실제 예문 포함.


==================================================
[작업 D — Relationship Dialogue Engine]
==================================================

생성:

04_CHARACTER_RELATIONSHIP_DIALOGUE_ENGINE_V0_1.md

최소 관계:

윤서 ↔ 미나
윤서 ↔ 도윤
윤서 ↔ 세븐
윤서 ↔ 복희
윤서 ↔ ROOM-12
미나 ↔ 도윤
미나 ↔ 팝시
도윤 ↔ 팝시
도윤 ↔ 세븐
세븐 ↔ 복희

각 관계:

what A wants
what B wants
default tension
forbidden easy resolution
argument tactics
what changes after conflict
sample 10~20 line dialogue

작성.

샘플은 실제 화자 식별 테스트 수행.


==================================================
[작업 E — Antagonist Voice Bible]
==================================================

생성:

05_BOSS_AND_ANTAGONIST_VOICE_BIBLE_V0_1.md

각 대립자의:

persuasion style
sentence rhythm
what it never says
what sounds reasonable
what becomes frightening
what it misunderstands
how Yunseo answers differently

작성.

보스가 테마 토론회를 열지 않게 한다.


==================================================
[작업 F — M01 Voice / Interiority Revision]
==================================================

생성:

main/M01_THE_DOOR_OPENED_FIRST_V0_2.md

기존 M01의 사건 구조는 유지 가능.

하지만:

- 대사 개성 강화
- 내면과 서술 분리
- 설명형 문장 삭제
- 윤서의 잘못된 판단은 행동/내면에서 분리
- 미나/도윤의 목소리 분명하게
- 기계 목소리와 사람 목소리 대조

수행.

V0_1 overwrite 금지.


==================================================
[작업 G — M02 Voice / Interiority Revision]
==================================================

생성:

main/M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_V0_2.md

같은 기준.

특히:

윤서
미나
세븐
VAC-0

의 언어층과 행동 차이를 분명하게 한다.

세븐이 윤서보다 "작가처럼" 설명하지 않게 한다.


==================================================
[작업 H — M03 Full Episode]
==================================================

생성:

main/M03_HOW_TO_RISE_FROM_THE_TABLE_V0_1.md

제목은 기존 후보를 존중하되
더 좋은 제목이 있으면 후보 병기 가능.

이번 에피소드는 M01/M02와 다른 온도여야 한다.

중심:

ROOM-12
가족심사 관리자
윤서
필요 시 미나의 전후 장면

요구:

- 기록 조사 에피소드 구조 반복 금지
- 사람 대면이 중심
- 보스가 실제 유혹을 제공
- ROOM-12는 쉬운 생활 언어
- 관리자는 지나치게 명확하고 친절한 언어
- 윤서는 기록보다 사람 앞에서 더 흔들림
- 전투와 인물 선택이 분리되지 않음
- 전투 뒤 문제가 남음

완결된 episode로 작성.


==================================================
[작업 I — M04 Full Episode]
==================================================

생성:

main/M04_THE_NIGHT_AFTER_DISCHARGE_V0_1.md

C02.

중심:

돌봄
퇴원
자유
실제 야간 노동

요구:

- 병원 서류만 읽는 편 금지
- 환자/당사자 장면 필요
- 인간 심사 대리의 논리가 실제로 일부 맞아야 함
- 윤서가 말로 완승 금지
- 미나/허브의 노동과 연결
- 쉬운 말로 복잡한 윤리 문제 전달

완결 episode.


==================================================
[작업 J — Final Voice Differentiation Audit]
==================================================

생성:

06_CHARACTER_VOICE_AND_DRAMATIC_MOTION_FINAL_AUDIT_V0_1.md

검사:

1. dialogue/interiority/narration 분리
2. character voice distinction
3. character cognitive distinction
4. all characters same-writer syndrome
5. exposition leakage
6. AI-like philosophical dialogue
7. unnecessary inner monologue
8. speaker identification
9. action identification
10. conflict tactics
11. M01/M02 improvement
12. M03 different temperature
13. M04 different temperature
14. bosses sound different
15. clarity for adult general reader


==================================================
[문학적 퇴고]
==================================================

각 완성 episode는 6-pass.

PASS 1 STORY
사건이 재미있는가.

PASS 2 CHARACTER
인물이 자기 방식으로 움직이는가.

PASS 3 LAYER
대사/내면/서술/설명/기계/기록이 구별되는가.

PASS 4 CLARITY
한 번 읽어 무슨 일이 일어났는지 이해 가능한가.

PASS 5 LITERARY
subtext, rhythm, metaphor, motif가 살아 있는가.

PASS 6 VOICE
이름을 지워도 누가 말하고 행동하는지 구별 가능한가.


==================================================
[금지]
==================================================

모든 인물을 난해하게 쓰기 금지.

모든 인물을 쉽게만 쓰기 금지.

난해한 캐릭터를 문법적으로 불명확하게 쓰기 금지.

모든 인물에게 내면 독백 붙이기 금지.

독백으로 lore dump 금지.

대사 뒤에 감정 해설 자동 추가 금지.

서술자가 인물보다 세계를 더 잘 아는 척하기 금지.

보스가 철학 강의하기 금지.

모두가 짧고 의미심장하게 말하기 금지.

모두가 비꼬기 금지.

모두가 정확한 말을 하기 금지.

catchphrase로만 개성 만들기 금지.

사투리/말버릇만으로 캐릭터 차별화 금지.

V0_1 원고 overwrite 금지.

기존 story overwrite 금지.

Final Lock / Production Entry 수정 금지.

Unreal 변경 금지.

main 변경 금지.


==================================================
[GitHub 출력 위치]
==================================================

incoming/gpt_work/07_character_voice_and_dramatic_motion/

01_M01_M02_NARRATIVE_LAYER_AND_VOICE_AUDIT_V0_1.md
02_CHARACTER_VOICE_COMPLEXITY_BIBLE_V0_1.md
03_NARRATOR_INTERIORITY_EXPOSITION_BIBLE_V0_1.md
04_CHARACTER_RELATIONSHIP_DIALOGUE_ENGINE_V0_1.md
05_BOSS_AND_ANTAGONIST_VOICE_BIBLE_V0_1.md
06_CHARACTER_VOICE_AND_DRAMATIC_MOTION_FINAL_AUDIT_V0_1.md

그리고:

incoming/gpt_work/07_character_voice_and_dramatic_motion/main/

M01_THE_DOOR_OPENED_FIRST_V0_2.md
M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_V0_2.md
M03_HOW_TO_RISE_FROM_THE_TABLE_V0_1.md
M04_THE_NIGHT_AFTER_DISCHARGE_V0_1.md


총 10개 파일.


==================================================
[GitHub 규칙]
==================================================

Repository:
chaosdeity/atomic-ad-survivors

Branch:
chatgpt-work

기존 파일 수정 금지.

10개 신규 파일만 추가.

가능하면 단일 commit.

전 파일 GitHub read-back.


==================================================
[완료조건]
==================================================

1. M01/M02 layer audit
2. character-specific difficulty profile
3. spoken vs inner voice distinction
4. narration vs exposition distinction
5. 14+ character voice profiles
6. 10 relationship dialogue samples
7. antagonist voice differentiation
8. M01 V0.2 complete
9. M02 V0.2 complete
10. M03 complete
11. M04 complete
12. speaker identification audit
13. action identification audit
14. adult-reader clarity PASS
15. AI-like same-writer voice reduced
16. existing story overwrite 0
17. new locked canon 0
18. Unreal change 0
19. main change 0
20. read-back PASS


==================================================
[결과 보고]
==================================================

DELIVERY_MODE:

Start HEAD:

Commit:

Read-back:


Layer Separation:
PASS / HOLD

Dialogue:
PASS / HOLD

Interiority:
PASS / HOLD

Narration:
PASS / HOLD

Exposition:
PASS / HOLD

Machine/Document:
PASS / HOLD


Character Voice:

profiles:
x

speaker identification:
%

same-writer syndrome:
LOW / MEDIUM / HIGH


Character Difficulty:

clearest speakers:

most complex speakers:

most concealed speakers:

most metaphorical speakers:

most literal speakers:


Relationship Dialogue:
PASS / HOLD

relationship samples:
x


Antagonist Voice:
PASS / HOLD


M01 V0.2:
COMPLETE / INCOMPLETE

M02 V0.2:
COMPLETE / INCOMPLETE

M03:
COMPLETE / INCOMPLETE

M04:
COMPLETE / INCOMPLETE


M03 temperature differs from M01/M02:
PASS / FAIL

M04 temperature differs:
PASS / FAIL


Adult-reader clarity:
PASS / HOLD

Literary quality:
PASS / HOLD

Character individuality:
PASS / HOLD

Dramatic motion:
PASS / HOLD


New locked canon:
0 / 문제 있음

Existing story overwrite:
0 / 문제 있음

Unreal:
0 / 문제 있음

main:
0 / 문제 있음


최종 상태:

CHARACTER VOICE AND DRAMATIC MOTION PASS

또는

HOLD
