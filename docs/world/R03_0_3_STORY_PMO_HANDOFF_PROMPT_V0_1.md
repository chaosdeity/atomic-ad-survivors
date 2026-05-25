# R03 0.3 Story PMO Handoff Prompt v0.1

## 목적

이 문서는 스토리 PMO에게 `R03 0.3 슬라이스`의 현재 완료 범위와 다음 의사결정 요청을 전달하기 위한 복붙용 프롬프트다.

이번 프롬프트의 역할:

```text
새 문서를 대신 작성하게 하는 것이 아니다.
지금까지 잠긴 R03 0.3 기준을 PMO 관점에서 검토하고,
다음 제작 순서와 보류/차단 항목을 판정받는 것이다.
```

---

## 0. 현재 완료된 산출물

아래 문서들은 작성 및 1차 검산까지 완료된 상태다.

```text
story/05_progression/campaign_experience_atlas_0_2.md
story/05_progression/r01_campaign_experience_audit_0_2.md
story/05_progression/r01_settlement_phrase_bank_0_2.md
story/05_progression/r01_revisit_reaction_ticket_0_2.md
story/05_progression/r01_c02_conflict_ticket_0_2.md
story/05_progression/r02_r03_0_3_candidate_selection_0_2.md
story/05_progression/r03_0_3_slice_detail_0_2.md
story/05_progression/r03_run_object_prototype_tickets_0_2.md
story/05_progression/r03_yunseo_reaction_settlement_phrase_bank_0_2.md
story/05_progression/r03_return05_u0_u2_seed_tickets_0_2.md
story/05_progression/r03_r02_support_seed_patch_0_2.md
story/05_progression/r03_settlement_ui_compaction_samples_0_2.md
story/05_progression/r03_object_qa_script_linkage_0_2.md
story/05_progression/r03_engine_data_schema_handoff_0_3.md
story/05_progression/r03_l01_l02_level_blockout_tickets_0_3.md
story/05_progression/r03_object_data_package_draft_0_3.md
story/05_progression/r03_settlement_supply_ui_phrase_table_0_3.md
story/05_progression/r02_0_4_draft_0_1.md
docs/world/R03_0_3_STORY_PMO_HANDOFF_PROMPT_V0_1.md
tools/r03_story_doc_check.py
tools/ui_compaction_probe.gd
tools/qa_check.ps1
```

핵심 완료 상태:

| 축 | 완료 내용 |
|---|---|
| 캠페인 계열 | 8개 캠페인 계열의 경험 엔진 잠금 |
| 0.3 후보 | R03 물류/반품을 0.3 주 후보로 선정 |
| R03 범위 | R03-L01 반품 접수 야드, R03-L02 자동 분류장만 주 슬라이스로 지정 |
| 오브젝트 | 송장 프린터, 자동 분류 레일, 미수령 보관함, 반송 드론, 보류 스탬프, 압축 경고선 티켓화 |
| 윤서 | R03 현장 반응/정산/보급소/반복 출격 문구 은행 작성 |
| RETURN-05 | U0~U2 씨앗 티켓 작성. 정식 U5 금지 |
| R02 | 처방 봉투, 진료태그 로그, 백색팔찌, HOLD-04 원격 번호 씨앗 패치 작성 |
| UI | R03 정산/보급소 압축 샘플을 Godot UI compaction probe에 연결 |
| 제작 핸드오프 | 엔진 데이터 스키마, L01/L02 블록아웃 티켓, 오브젝트 데이터 패키지, 실제 UI 문구 테이블 작성 |
| R02 0.4 | R02-L01~L03 후보 초안 작성. L04/L05와 HOLD-04 정식 해금은 보류 |
| QA | R03 문서군 정적 검산 스크립트 추가 및 local QA 진입점에 연결 |

---

## 1. 현재 잠긴 0.3 범위

열 것:

```text
R03-L01 반품 접수 야드
R03-L02 자동 분류장
R03 런 오브젝트 6종 P0 프로토타입
윤서 R03 심화
RETURN-05 U0~U2 씨앗
R02 보조 씨앗
R04/PATCH 보증 부품 씨앗
```

씨앗만 둘 것:

```text
R03-L03 보증 심사 창고 입구
R02 백색팔찌 격리권 방향 신호
HOLD-04 원격 번호
RETURN-05 미확인 반송 수취인 신호
PATCH/R04 보증 부품 로그
```

열지 말 것:

```text
R03-L04 파쇄 전 대기라인
R03-L05 최종 반품 심사실
최종 반품 심사 보류관 직접 대면
RETURN-05 정식 U5
HOLD-04 정식 해금
R02-L04/R02-L05
윤서 사고 전 직업 확정
라벨/송장/보관함의 태그 자원화
```

---

## 2. PMO에게 요청할 판정

스토리 PMO는 아래를 판정해 달라.

### 2.1 진행 가능 여부

```text
R03 0.3 슬라이스를 다음 단계인 구현 데이터 스키마화/블록아웃 티켓으로 넘겨도 되는가?
```

판정 선택지:

| 판정 | 의미 |
|---|---|
| 진행 가능 | 현재 문서군으로 R03-L01/L02 제작 티켓화 진행 |
| 조건부 진행 | 보완할 문서/금지선만 보강 후 진행 |
| 보류 | R03 0.3 후보 자체를 다시 비교 |

### 2.2 다음 작업 순서

아래 후보 중 무엇을 먼저 할지 정해 달라.

| 후보 | 산출물 |
|---|---|
| A | R03-L01/L02 레벨 블록아웃 티켓 |
| B | R03 엔진 데이터 스키마 핸드오프 |
| C | R03 오브젝트별 실제 데이터 패키지 초안 |
| D | R03 정산/보급소 UI 실제 문구 테이블 |
| E | R02를 0.4 후보로 밀기 위한 R02-L01~L03 초안 |
| F | RETURN-05 U3 이후 개인 결절 보류 검토 |

### 2.3 리스크 검토

PMO는 아래 리스크의 우선순위를 매겨 달라.

| 리스크 | 질문 |
|---|---|
| R03 과확장 | R03-L03/R04/R02 씨앗이 너무 많아 보이는가? |
| 캐릭터 과노출 | RETURN-05와 HOLD-04가 너무 빨리 캐릭터 해금처럼 보이는가? |
| 윤서 약화 | 윤서가 다른 캐릭터 씨앗을 소개하는 임시 주인공처럼 보이는가? |
| UI 과밀 | 정산/보급소에서 정보가 많아 유저가 보상을 놓치는가? |
| 톤 | 물류/의료 소재가 생존자 조롱으로 보일 위험이 있는가? |
| 0.3 신선도 | R01 이후 R03이 충분히 새 경험으로 느껴지는가? |

### 2.4 보류선 확인

아래 보류선이 맞는지 확인해 달라.

```text
R03-L05 보스권은 P2 또는 후속 윤서 핵심 결절로 보류.
RETURN-05 정식 U5는 0.3에서 금지.
HOLD-04 정식 해금은 R02-L01~L03 이후 검토.
R02는 0.3에서 직접 출격 지역이 아니라 보조 씨앗만.
R04/PATCH는 보증 부품 씨앗만.
```

---

## 3. 스토리 PMO 복붙용 마스터 프롬프트

아래 블록을 그대로 스토리 PMO에게 전달한다.

```text
당신은 Atomic Ad Survivors의 스토리 PMO다.

목표:
R03 0.3 슬라이스 문서군이 다음 제작 단계로 넘어갈 수 있는지 판정하고,
다음 작업 순서와 보완 지시를 내려라.

현재 완료된 산출물:
- story/05_progression/campaign_experience_atlas_0_2.md
- story/05_progression/r02_r03_0_3_candidate_selection_0_2.md
- story/05_progression/r03_0_3_slice_detail_0_2.md
- story/05_progression/r03_run_object_prototype_tickets_0_2.md
- story/05_progression/r03_yunseo_reaction_settlement_phrase_bank_0_2.md
- story/05_progression/r03_return05_u0_u2_seed_tickets_0_2.md
- story/05_progression/r03_r02_support_seed_patch_0_2.md
- story/05_progression/r03_settlement_ui_compaction_samples_0_2.md
- story/05_progression/r03_object_qa_script_linkage_0_2.md
- story/05_progression/r03_engine_data_schema_handoff_0_3.md
- story/05_progression/r03_l01_l02_level_blockout_tickets_0_3.md
- story/05_progression/r03_object_data_package_draft_0_3.md
- story/05_progression/r03_settlement_supply_ui_phrase_table_0_3.md
- story/05_progression/r02_0_4_draft_0_1.md
- tools/r03_story_doc_check.py
- tools/ui_compaction_probe.gd
- tools/qa_check.ps1

현재 잠금:
- R03 0.3은 R03-L01 반품 접수 야드와 R03-L02 자동 분류장만 주 슬라이스로 연다.
- 핵심 재미는 송장 프린터, 자동 분류 레일, 미수령 보관함, 반송 드론, 보류 스탬프, 압축 경고선이다.
- 윤서는 R03에서 해설자가 아니라 현장 판단과 보류 감각을 보여준다.
- RETURN-05는 U0~U2 씨앗만 허용한다. 정식 U5, 직접 조작, 동행, 캐릭터 선택 화면 노출은 금지한다.
- R02는 처방 봉투, 진료태그 부족 로그, 백색팔찌, HOLD-04 원격 번호 같은 보조 씨앗만 허용한다.
- R03-L03은 보증 심사 창고 입구 씨앗만, R03-L04/R03-L05는 열지 않는다.
- 라벨, 송장, 보관함, 보류 도장은 태그 자원이 아니다.
- 유저-facing 자원명은 보급태그, 식량태그, 충전태그, 통행태그, 진료태그, 거주태그, 수신태그 기준을 유지한다.
- R03 제작 핸드오프는 엔진 상태값, 블록아웃 티켓, 오브젝트 데이터, UI 문구표까지 작성되었다.
- R02 0.4 초안은 R02-L01/L02 중심이며 R02-L04/R02-L05와 HOLD-04 정식 해금은 보류한다.

요청 사항:
1. 이 문서군을 기준으로 R03 0.3을 다음 제작 단계로 넘겨도 되는지 판정하라.
2. 진행 가능 / 조건부 진행 / 보류 중 하나로 결론을 내려라.
3. 다음 작업 순서를 A~F 후보 중 우선순위로 정하라.
   A. R03-L01/L02 레벨 블록아웃 티켓
   B. R03 엔진 데이터 스키마 핸드오프
   C. R03 오브젝트별 실제 데이터 패키지 초안
   D. R03 정산/보급소 UI 실제 문구 테이블
   E. R02를 0.4 후보로 밀기 위한 R02-L01~L03 초안
   F. RETURN-05 U3 이후 개인 결절 보류 검토
4. R03 과확장, 캐릭터 과노출, 윤서 약화, UI 과밀, 톤 리스크, 0.3 신선도를 각각 낮음/중간/높음으로 평가하라.
5. 반드시 유지해야 할 보류선을 다시 적어라.
6. 보완이 필요하다면 파일명 단위로 지시하라.

출력 형식:

## 1. 판정
진행 가능 / 조건부 진행 / 보류 중 하나.

## 2. 이유
짧은 bullet 5개 이하.

## 3. 다음 작업 우선순위
A~F 후보를 순서대로 나열하고, 각 이유를 1문장으로 적어라.

## 4. 리스크 검토
| 리스크 | 등급 | 보완 지시 |

## 5. 반드시 유지할 보류선
R03-L04/R03-L05, RETURN-05 U5, HOLD-04 정식 해금, R02 직접 오픈, R04/PATCH 과노출 관련 보류선을 정리하라.

## 6. 파일별 보완 지시
필요한 경우에만 작성하라. 없으면 "보완 없음"이라고 쓴다.

주의:
- 새 설정을 즉흥 추가하지 말라.
- R03-L05 보스권을 당기지 말라.
- RETURN-05나 HOLD-04를 정식 해금처럼 쓰지 말라.
- 의료/물류 소재로 사람이나 노동자를 조롱하지 말라.
- 유저에게 철학을 강요하지 말고, 런 재미와 캐릭터 기대감 기준으로 판정하라.
```

---

## 4. PMO 응답 후 처리 기준

| PMO 판정 | 다음 처리 |
|---|---|
| 진행 가능 | R03 엔진 데이터 스키마 핸드오프 또는 R03-L01/L02 블록아웃 티켓 작성 |
| 조건부 진행 | 지적 파일만 패치하고 QA 재검산 |
| 보류 | R02/R03 0.3 후보 비교 문서로 되돌아가 재판정 |

---

## 5. 최종 잠금

이 프롬프트는 PMO에게 결정을 맡기는 문서다.

PMO에게 요청하는 핵심은 하나다.

```text
R03 0.3 문서군은 이제 제작 단계로 넘어가도 되는가,
아니면 아직 스토리 기준에서 보완해야 하는가?
```

추천 다음 작업:

```text
1. PMO 판정 수령
2. 판정이 진행 가능이면 R03 엔진 데이터 스키마 핸드오프 작성
3. 조건부 진행이면 지적 파일만 패치
4. 보류면 R02/R03 0.3 후보 비교로 복귀
```
