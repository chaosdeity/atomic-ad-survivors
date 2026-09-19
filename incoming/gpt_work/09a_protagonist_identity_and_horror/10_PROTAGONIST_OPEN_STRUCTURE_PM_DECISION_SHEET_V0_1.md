# 주인공 개방형 구조 PM 결정표 V0.1

상태: CANDIDATE / 설계 제안. 신규 LOCKED canon 및 런타임 구현 없음.
기준: chaosdeity/atomic-ad-survivors / chatgpt-work / a105ec26aba7926280f8a3ae2318b3913600dfe7.
대조 원고: incoming/gpt_work/08_voice_gate_and_clean_manuscript/clean/의 M01~M04 CLEAN V0.1.

## 권고안

고정된 출발 정체성 + 여섯 성향 + 별도 상황/관계 기억을 권고한다. 성격 수치 UI는 두지 않고, 실제 선택에 따라 표현·기대·책임이 달라지는지 M01~M04의 소규모 보강으로 먼저 확인한다. 이번 작업은 설계 납품이며 원고에 분기나 광고화 사건을 적용한 결과가 아니다.

## 결정 항목 — 9개

| 번호 | PM이 결정할 것 | 권고 / 미결정 시 처리 |
|---|---|---|
| 1 | 윤서의 immutable core 범위 | 문서 02의 여섯 출발 경계를 편집 기준으로 채택. 구체 과거 사건과 이름/광고 공포의 실제 발생은 별도 canon 확인 전 보류. |
| 2 | 최종 벡터 수 | 6개 추천. 비용 축소가 필요하면 BELONGING/ESCAPE는 우선 관계적 경향으로만 읽되 다른 축에 몰래 합산하지 않음. |
| 3 | 성향 UI | 숫자·선악·유형명 비노출. 선택 결과와 NPC 행동으로 드러내며 실제 사실 기록은 별도로 열람 가능하게 검토. |
| 4 | M01~M04 retrofit 범위 | 문서 08의 기존 강제 사건 뒤 선택 4곳만 우선. 전면 재작성과 거짓 분기 금지. 승인 전 CLEAN/SCRIPT에 미적용. |
| 5 | 관계 기억 범위 | 8인 설계, 실제 출력은 등장·직접 목격 범위만. PATCH/브로커 후속 장면을 이번에 만들지 않음. 전언은 직접 목격과 분리. |
| 6 | 시즌 결말 변화 | 실제 문제 해결 사실은 보존하고 관계·내면·다음 책임의 의미를 변주. GOOD/BAD/TRUE 성격 평가 없음. 실제 기존 시즌 결과와 대조 후 편입. |
| 7 | 공포 강도 | M01~M02 UNCANNY, M03~M04 PERSONAL UNEASE. 몸의 불편과 역할 압력을 우선하고 고어·추가 상처·의료 설정은 새로 넣지 않음. |
| 8 | 이름·얼굴·선택의 광고 전용 강도 | 원문/편집본 차이를 다루는 제한 후보. 누가 무엇에 접근해 어떻게 배포하는지 권한·매체 확정 전 실제 사건으로 작성하지 않음. 실제 사용자 개인정보 사용 금지. |
| 9 | 변화 검증과 제작 규모 | 최소 반복·두 맥락 기준은 보정 후보. 한 장면 주축 1+보조 1, BASE fallback. 저장/로드 중복·비목격 기억·강제 사건 귀속 테스트는 구현 승인 후 수행. |

## cognitive repair에 넘길 계약

윤서를 ‘항상 보류하는 검증자’로 잠그지 않는다. 이름을 잘못 붙이는 두려움과 직접 움직이고 싶은 욕구가 부딪치게 한다. M01~M04 V0.2는 기존 대표 경로의 사고·전술만 수술한다. 이 10문서의 새 분기, 성향 수치, 광고화 사건은 그대로 삽입하지 않는다. ROOM-12의 후속 구체 부탁과 보호 정보 공개 시점은 앞당기지 않는다.

## 완료와 남은 검증

문서 포함 점검: audit 12항목, core/mutable/state 분리, vectors 6, dynamic voice BASE+12극단, 관계 8, horror layers 7, retrofit 4편, trajectories 6, PM decisions 9. 이는 설계 구조 점검이며 플레이어 체감·실제 분기·독립 화자 구분 검증은 아니다.

작업 순서: 실제 GitHub 원문과 실패 결과 읽기 → 이 10문서 설계 → cognitive repair가 정체성 계약 참조 → 지정 신규 문서만 커밋 → 커밋 SHA 기준 read-back. 실제 커밋과 read-back 결과는 자기 참조를 피하기 위해 최종 실행 보고로 남긴다. 작성 시점에 완료로 선기재하지 않는다.

DELIVERY_MODE: GitHub create-only 문서 납품.
Start HEAD: a105ec26aba7926280f8a3ae2318b3913600dfe7.
Yunseo charisma: ADEQUATE. Narrative engine: WEAK. Current horror: UNCANNY.
Anchored core: PASS(설계 경계). Mutable vectors: 6. Blank-slate risk: LOW(명세상; 구현 검증 전).
Player-shaped voice: PASS(설계 포함). Relationship reactivity: PASS(설계 포함).
Horror layers: 7/7. Player complicity horror: PASS(설계 포함).
M01-M04 retrofit: PASS(명세). Season trajectory examples: 6.
New locked canon / existing story overwrite / Unreal / main: 의도된 변경 0, 커밋 후 diff로 재검증.

주인공 설계 상태: **PROTAGONIST OPEN STRUCTURE READY FOR PM DECISION**.
통합 납품의 상한: **READY_FOR_EXTERNAL_BLIND_TEST**. 이 설계가 Voice Gate PASS를 뜻하지 않는다.
