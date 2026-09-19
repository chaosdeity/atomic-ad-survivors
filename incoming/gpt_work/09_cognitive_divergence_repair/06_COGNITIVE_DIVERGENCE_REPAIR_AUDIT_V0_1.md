# Cognitive Divergence Repair Audit V0.1

## 결론

**READY_FOR_EXTERNAL_BLIND_TEST**. 기존 독립 Voice Gate는 **HOLD**를 유지한다. 새 정확도·화자 재식별 점수는 작성하지 않았다. 변경은 지정된 신규 문서뿐이며, 기존 CLEAN은 비교 기준으로 남긴다.

대사는 신중함의 강도를 달리하는 대신 자기 명명이 만드는 역할(윤서), 복제 경로(세븐), 오늘의 노동 배치(미나), 반환 경로와 허락(복희), 물리적 실패 조건(도윤), 그릇 인계 뒤 자기 몫(ROOM-12), 작은 요청 주체(환자), 편의와 역할의 자동 결합(가족심사 기계), 실제 야간 인계와 자신의 업무 책임(심사 대리)으로 분리했다. 이는 편집 의도와 실제 수정 근거이지 외부 효과 입증이 아니다.

## 납품

repair 신규 14문서: 실패 지도·인지 바이블·전술 지도·블라인드 팩·정답키·이 감사 + CLEAN V0.2 4편 + SCRIPT DELTA V0.2 4편. protagonist 신규 10문서는 별도 09a 폴더다. 총 24개 신규 Markdown만 허용한다. MASTER PROMPT의 앞부분 ‘15개’는 말미 명시된 실제 목록/14개 정정에 맞췄다.

분류: PASS 8 / A MUST_REWRITE 25 / B CONTEXT_REPAIR 11 / C NATURAL_OVERLAP 5. 독립 오답 41개를 41줄 치환하지 않았다. 42개 편집 블록에서 한 대화의 여러 표본을 함께 다뤘고 인접 행동을 보강했다. 과거 PASS는 원 표본 보존이지 현 버전 품질 승인 아님.

## 주요 쌍의 실제 수술과 남은 위험

| 혼동쌍 | 실제 새 CLEAN의 차이 | 확인 필요 |
|---|---|---|
| 윤서 / 세븐 | M02 윤서는 자기가 가족으로 묶으면 되묻기 어려워짐을 경계한다. 세븐은 자기 오기를 남기고 문장 경로를 따로 묶는다. | 윤서의 이름·역할 문장이 새 주제 캐치프레이즈처럼 들리는지 외부 확인. |
| 윤서 / 도윤 | M01 도윤은 시험에서 자기 받치는 손을 빼고 추가 절삭을 멈춘다. 윤서는 자기 사용에 매달려 놓친 확인을 인정하고 천을 푼다. | 짧은 물리 지시·일반 손 놓기 문장은 여전히 겹칠 수 있다. |
| 미나 / 복희 | M02 미나는 밤마다 돌아갈 동선을 요구하고 복희는 반환 인식을 지키며 자기 보관 공간을 내준다. | 복희 critical 표본 3개뿐이라 전체 보이스 검증으로 일반화 불가. |
| ROOM-12 / 환자 / 담당자 | ROOM-12는 그릇 인계 뒤 자기 저녁을 원한다. 환자는 자기 몸과 작은 요청의 주체를 되찾는다. 담당자는 지원 가능 시간과 다시 물을 순서를 만든다. | 식사·그릇 명사만으로 구분되는지, 노동의 연쇄가 실제로 읽히는지 확인. |
| 두 심사 역할 | 기계는 팔 쉬기와 대표 확인을 한 서비스로 잇는다. 인간은 실제 일어날 사람·자기가 승인할 인계를 묻고 잘못 적용한 퇴원 항목을 수정한다. | 기계가 절차적 인간처럼 들리거나 인간이 업무 설명 장치로 남는 위험. |

## 자연스러움 감사

새 사투리·유행어·인물 전용 명언은 넣지 않았다. PASS8, B11의 원 표본, C5, 기능15는 문자 그대로 보존했다. 전체 대화가 고유 문장이어야 한다고 요구하지 않는다. 공통 짧은 거절과 사실 응답은 다른 사람이 말해도 자연스러운 상태로 남긴다.

대사가 일부 길어졌다. 특히 M01 보고, M02 자료 분리, M03 대표 제안, M04 인계 설명은 더 길다. 이것은 무조건 개선이라고 볼 수 없다. 아래 평균은 따옴표 한 발화의 문자 수(공백 포함)로, 기계 출력도 포함한 구조 지표다. 길이 증가가 또 다른 설명 과잉이 되는지 독립 독해가 필요하다. 희망 효과를 PASS로 기록하지 않는다.

| 원고 | 기존/신규 전체 줄 | 그대로 남은 기존 줄 | 기존/신규 발화 수 | 기존/신규 평균 발화 문자 |
|---|---:|---:|---:|---:|
| M01 | 312/322 | 303 | 62/65 | 16.2/18.7 |
| M02 | 301/315 | 291 | 57/60 | 18.8/21.9 |
| M03 | 319/325 | 306 | 87/89 | 16.3/19.5 |
| M04 | 419/431 | 411 | 116/118 | 19.3/21.2 |

그대로 남은 줄 수는 순서 일치 기반 텍스트 diff 지표이며 사건 보존율이나 품질 점수가 아니다. 모든 원고의 소제목 순서와 사실 RECORD 행은 동일성을 별도로 검사했다. 추가 설명은 인물의 지각·과업·거절 뒤 실제 행동과 짝을 짓는다. 그 연결이 읽히지 않으면 외부 테스트에서 다시 수술할 대상이다.

## 보호한 경계

M01 우편 안내 중단은 우편 보관·수령 당사자 확정을 바꾸지 않는다. M02 보조 메모 손실은 원기록 손실·조사 상태 초기화가 아니다. M03 검사 중단은 배식 독립·당일 잔류와 병존한다. ROOM-12의 자기 저녁은 오늘의 몫이며 보호된 후속 외부 식사 부탁·생존 선택 공개를 당겨 쓰지 않는다. M04 창가 왕복은 전면 퇴원·보급소 이주가 아니다. 야간 경험은 지속 돌봄 능력의 증거가 아니며 미나의 장기 동의도 아니다.

09a는 PM 명세다. M05~M12는 후속 배치가 미확정인 추상 선택 슬롯/감정적 방향으로만 표기하고 사건·장면·대사를 쓰지 않았다. 09a의 선택 분기·성향 저장·광고 전용 사건은 새 CLEAN/SCRIPT에 적용하지 않았다. 신규 LOCKED canon, 의료 설정, 엔진 기능, Unreal 수정은 없다.

## 실행한 구조 검증

- M01 V0.1 Git blob hash: PASS
- M01 all headings preserved: PASS
- M01 factual records unchanged: PASS
- M01 clean has no editor tags: PASS
- M01 script replacement exact match: PASS
- M02 V0.1 Git blob hash: PASS
- M02 all headings preserved: PASS
- M02 factual records unchanged: PASS
- M02 clean has no editor tags: PASS
- M02 script replacement exact match: PASS
- M03 V0.1 Git blob hash: PASS
- M03 all headings preserved: PASS
- M03 factual records unchanged: PASS
- M03 clean has no editor tags: PASS
- M03 script replacement exact match: PASS
- M04 V0.1 Git blob hash: PASS
- M04 all headings preserved: PASS
- M04 factual records unchanged: PASS
- M04 clean has no editor tags: PASS
- M04 script replacement exact match: PASS
- PASS8/B11/C5 exact original quote preserved: PASS
- Functional V0.1 all15 preserved: PASS
- A25 original sentences replaced: PASS
- classification49 8/25/11/5 disjoint: PASS
- sample72 unique / critical56 functional16: PASS
- no V0.1 sample exact repetition: PASS
- sample source line72 matches: PASS
- ownership13 x8 axes: PASS
- tactic map21 x7 fields: PASS
- protagonist10 files: PASS
- vector6 / horror7 / trajectory6: PASS

검사된 PASS는 문자열·문서 구조의 검사에만 적용된다. 새 화자 맞히기, 독립 블라인드 점수, 외부 독자 평가, 플레이 테스트, Unreal/Godot 실행, 저장/로드 E2E는 **NOT RUN**이다. SCRIPT는 기존 구현 제약을 상속하는 문서 델타이며 실제 바인딩을 실행하지 않았다.

## Blind V0.2 전달

72개 모두 신규 CLEAN의 실제 발화와 정확한 줄로 연결된다. critical56 / functional16. V0.1 표본과 동일 문장 0개, 중복 0개. 답안과 출처는 정답키 파일로 분리했다. 작성자는 정답을 아는 출처 대조만 수행했고 스스로 추정하거나 재식별 점수를 만들지 않았다. 1차 독립 검토자는 팩만 읽고 응답을 고정한 뒤 진행자가 키를 열어 채점한다.

## 실제 읽은 원문 — 17파일

모든 기준은 시작 HEAD a105ec26aba7926280f8a3ae2318b3913600dfe7에 고정했다. 최초 요청의 독립 실패 결과를 먼저 읽었다. 이후 두 master, 원고/스크립트 및 필요한 기존 바이블을 읽었다. 디렉터리 목록·브랜치 ref·tree 조회는 아래 파일 읽기 수와 분리한다.

| 경로 | 범위 |
|---|---|
| `AGENTS.md` | 작업 규칙 전체 |
| `docs/story/CHARACTER_COGNITIVE_DIVERGENCE_REPAIR_MASTER_PROMPT_V0_1.md` | 전체; 잘린 응답 뒤 범위를 이어 읽음 |
| `docs/story/PROTAGONIST_IDENTITY_PLAYER_SHAPED_ARC_AND_HORROR_MASTER_PROMPT_V0_1.md` | 전체; 1~300 /301~610 /611~990 /991~끝 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/05_INDEPENDENT_BLIND_VOICE_TEST_RESULT_V0_1.md` | 전체 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/01_BLIND_VOICE_TEST_PACK_V0_1.md` | 전체 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/02_BLIND_VOICE_TEST_ANSWER_KEY_V0_1.md` | 전체 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/03_CHARACTER_COGNITIVE_AND_DIALOGUE_CONTRAST_MATRIX_V0_1.md` | 전체 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/04_VOICE_GATE_AND_CLEAN_MANUSCRIPT_FINAL_AUDIT_V0_1.md` | 전체 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/clean/M01_THE_DOOR_OPENED_FIRST_CLEAN_V0_1.md` | 전체; 작업 사본 Git blob hash 일치 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/clean/M02_WHAT_REMAINED_IN_THE_CLEAN_HOUSE_CLEAN_V0_1.md` | 전체; 작업 사본 Git blob hash 일치 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/clean/M03_HOW_TO_RISE_FROM_THE_TABLE_CLEAN_V0_1.md` | 전체; 작업 사본 Git blob hash 일치 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/clean/M04_THE_NIGHT_AFTER_DISCHARGE_CLEAN_V0_1.md` | 전체; 작업 사본 Git blob hash 일치 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/script/M01_IMPLEMENTATION_SCRIPT_V0_1.md` | 전체; 잘린 응답 후 이어 읽음 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/script/M02_IMPLEMENTATION_SCRIPT_V0_1.md` | 전체; 잘린 응답 후 이어 읽음 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/script/M03_IMPLEMENTATION_SCRIPT_V0_1.md` | 전체; 잘린 응답 후 이어 읽음 |
| `incoming/gpt_work/08_voice_gate_and_clean_manuscript/script/M04_IMPLEMENTATION_SCRIPT_V0_1.md` | 전체; 잘린 응답 후 이어 읽음 |
| `incoming/gpt_work/07_character_voice_and_dramatic_motion/02_CHARACTER_VOICE_COMPLEXITY_BIBLE_V0_1.md` | 부분: 첫 응답의 윤서·미나·도윤 및 팝시 도입(응답 잘림),190~280의 PATCH·두 심사 역할. 전수 읽음으로 보고하지 않음 |

원본 CLEAN의 Git blob 검증:

- M01: `3a02c32f141892a2e8fc9ee925f229156dd8cd29`
- M02: `d7eb142a0333e423dfdd24fe724b79ad1f2a26a6`
- M03: `985b4be7bb4da59657f78a145492a418cc2a5a1c`
- M04: `ca2683b25b921490ac3e38a10ee68bedc867128e`

## GitHub 적용·read-back 계약

Start HEAD: a105ec26aba7926280f8a3ae2318b3913600dfe7.
Start tree: fabe995512152d349ba87b5d5d7e8a5ff8cac959.
Observed main: 416bf2718f897c92c234220710e1d7c92bb46b84.
Workspace Readonly 루트는 Git 저장소가 아니었으며, 기본 목록은 여러 작업 폴더의 부분 목록이었다. 임의의 로컬 사본을 현재 브랜치로 간주하지 않았다. 실제 기준은 GitHub다.

커밋 직전 HEAD를 다시 읽고 강제 갱신 없이 지정 브랜치만 갱신한다. 커밋 후 시작 SHA 대비 diff에서 지정 폴더의 24개 added 외 변경이 없는지, 원본 blob과 main이 유지되는지 확인한다. 최종 commit의 tree/blob을 신규 파일 전부에 대해 작업 사본과 대조하고 내용 read-back을 수행한다. 이 문서는 자기 commit SHA를 포함할 수 없으므로 실제 commit 및 read-back 완료 증거는 최종 실행 보고에 별도로 제공한다. 미래 작업을 이미 수행했다고 기재하지 않는다.

최종 상태 상한: **READY_FOR_EXTERNAL_BLIND_TEST**.
기존 독립 Voice Gate: **HOLD**.
외부 독립 Blind V0.2: **NOT RUN**.
주인공 설계: **PROTAGONIST OPEN STRUCTURE READY FOR PM DECISION**.
