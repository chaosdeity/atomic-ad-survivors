# Existing Story Literary Audit V0.1

상태: BATCH A / 표본 문학 감사 완료 / 원본 변경 없음
작성일: 2026-09-19
Repository: chaosdeity/atomic-ad-survivors
Branch: chatgpt-work
Start HEAD: ba45f37abe63ae3b5732885e0ce04cf1e23eae33
작업 규칙: docs/story/LITERARY_NARRATIVE_REBUILD_MASTER_PROMPT_V0_1.md, 1–1542행 실제 판독.

## 1. 결론

현재 원고의 가장 큰 자산은 생활을 책임지는 인물과 사물이다. 가장 큰 문체 문제는 그 사물과 행동이 이미 전달한 뜻을 서술자가 다시 설명한다는 점이다. 윤서와 미나가 서로 다른 판단을 하는데도, 대사를 이어 읽으면 같은 작가가 같은 방식으로 반박하는 소리가 날 때가 있다.

따라서 설정표를 소설로 바꾸지 않는다. 프로필은 정확하게 남기고, 실제 노출할 문장만 장면으로 다시 쓴다. 이번 기준은 세 가지다. 인물이 상대에게 구체적인 일을 요구할 것. 말하지 않은 부분을 독자가 행동에서 읽을 수 있을 것. 다음 조작을 해야 장면이 진행될 것.

판정: LITERARY AUDIT PASS. 이는 아래 표본의 결함과 재작성 순위를 구분했다는 뜻이다. 저장소 전체 문학 품질이나 아직 쓰지 않은 시즌 원고의 PASS가 아니다.

## 2. 선행 패키지와 판독 범위

`incoming/gpt_work/04_story_deepening/`의 01~10 문서가 존재한다. 폴더 tree SHA는 `d98fcd8650697d26d8dfe2deb72a4fac48c962d6`이며, 직전 작업에서 10개를 저장·재조회한 tree와 같다. 완성된 서사 설계 패키지를 선행 자료로 사용한다. D01~D09는 여전히 PM_PENDING이다. 패키지 완성과 후보 승인 완료를 혼동하지 않는다.

선행 패키지의 실제 판독 본문은 같은 대화의 GitHub 조회 결과를 재사용했다. 이번 시작 HEAD에서 폴더와 파일 해시를 확인했고, 10번 결정표의 마지막 부분도 재조회했다. `d9b9dd9..ba45f37` 비교의 유일한 변경은 70번 이동 clarification 추가다. 같은 본문을 새로 전수 열람한 것처럼 보고하지 않는다.

이번 문학 감사 표본은 아래 story 파일 22개다. 19개는 직전 GitHub 실제 판독의 관련 본문을 이어 사용했고, 성장 문서 3개는 이번에 추가로 읽었다. 프로필의 모든 행을 읽었다거나 story 전체 파일을 감사했다고 주장하지 않는다. 이름만 확인한 파일은 표본 수에 넣지 않았다. 파일군 분류와 개별 파일의 전수 이관 조사는 별개다. Phase 10의 전체 migration manifest는 이번에 작성하지 않는다.

### 우선 권위

MASTER의 TIER 1~5를 그대로 사용한다. 직접 판독한 기준은 다음과 같다.

- `incoming/gpt_work/01_global_world_lock/GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md`: hierarchy, 96 ID, 6 fields, 인과·기억·소문·이동·Production Fill 경계.
- `incoming/gpt_work/03_e01_remap/13_E01_C01_PRODUCTION_ENTRY_V0_1.md`, `24_E01_C08_PRODUCTION_ENTRY_V0_1.md`, `30_E01_C02_PRODUCTION_ENTRY_V0_1.md`, `33_E01_C03_PRODUCTION_ENTRY_V0_1.md`, `39_E01_C04_PRODUCTION_ENTRY_V0_1.md`, `48_E01_C05_PRODUCTION_ENTRY_V0_1.md`, `42_E01_C06_PRODUCTION_ENTRY_V0_1.md`, `51_E01_C07_PRODUCTION_ENTRY_V0_1.md`: 각 캠페인의 역할과 미구현 범위.
- 같은 폴더 `57_E01_8_CAMPAIGN_6FIELD_CROSS_MATRIX_V0_1.md`, `58_E01_CAMPAIGN_DIFFERENTIATION_FINAL_AUDIT_V0_1.md`, `67_E01_8_CAMPAIGN_FINAL_CROSS_AUDIT_V0_1.md`: 차별화와 현재 slice의 경계.
- 같은 폴더 `69_E01_IMPLEMENTATION_GATE_D_PM_APPROVAL_V0_1.md`, `70_E01_L01_L02_PHYSICAL_TRANSITION_PM_CLARIFICATION_V0_1.md`: 이번 추가 판독. Gate D는 L01/L02 alignment에 한해 AUTHORIZED_BOUNDED다. 옛 67번의 NOT AUTHORIZED를 현재 전체 상태로 재인용하지 않는다. 이번 문학 작업 자체는 Unreal 변경 0이다.
- `incoming/gpt_work/04_story_deepening/`의 01~10 전체 문서: 감사, spine, 인물, 허브, beat, 캠페인, mystery, voice, backlog, PM 결정.
- `docs/unreal/r01_rpg34_20260916.md`, `r01_rpg35_20260918.md`, `main_subgame_combat_contract_20260914.md`: 의뢰·수동 유지 공격·유한 전투·자율 귀환·현재 저장의 기록. 게임을 직접 실행한 증거가 아니다.
- `docs/world/WORLD_FOUNDATION_LOCK_V0_3.md`, `WORLD_LORE_LOCK_V0_1.md`, `E01_FIRST_SEASON_LOCAL_NODES_V0_1.md`, `CHARACTER_UNLOCK_STRUCTURE_V0_1.md`, `R01_L03_FIRST_BOSS_DETAIL_V0_1.md`: 관련 세계·등장·보스 구간. 오래된 타이머와 자동공격 표현은 현재 기준으로 이관하지 않는다.
- `AGENTS.md`: 표적 판독, 정확한 쓰기 범위, 증거와 보고 규칙.

이 목록의 경로와 문서 절을 이 패키지의 출처로 사용한다. `[S19 §12]`는 아래 원본의 절이고, `[D03]`은 선행 패키지 10번의 결정이다. 우리 문안은 원문의 직접 인용과 분리한다.

## 3. 파일군 분류와 실제 표본

분류는 파일 전체를 칭찬하거나 폐기하는 등급이 아니다. 한 파일 안에서도 프로필과 실제 대사는 용도가 다르다. `재작성 후보`는 발췌 부분의 staging 후보이며 원본 교체 승인이 아니다.

| 키 | 실제 읽은 source_path와 관련 구간 | 주 분류 | 문학적 처리 | 우선 |
|---|---|---|---|---|
| S01 | story/01_bible/campaign_registration_model_0_2.md: 전제, 등록, 손실, 공격 의미 | CANON REFERENCE | 인과와 용어 보존. 선언문을 NPC 입에 복사하지 않음 | 참조 |
| S02 | story/02_hub/silence_outpost.md: 위치, 외형, 분위기, 시설, 화면 구조 | LEGACY STORY DRAFT | 재작성 후보. 생활 소품·공존을 장면으로. 옛 화면 규격 분리 | P0 |
| S03 | story/02_hub/mina_npc_profile_v1_0.md: 핵심, 기능, 상태 반응, 대사 | CANON REFERENCE | 소개문·대사만 재작성 후보. 역할과 판단의 한계 보존 | P0 |
| S04 | story/02_hub/mina_npc_drama_draft_v0_1.md: 첫인상, 과거, 결함, 윤서 관계 | REPLACE CANDIDATE | 실제 노출용 산문은 재작성 후보. 설명이 대신한 행동을 복원 | P0 |
| S05 | story/02_hub/npcs.md: 원전 지위, 초기 5명, 미나·도윤 | LEGACY STORY DRAFT | 재작성 후보. 최신 통합 프로필 우선. 옛 과거 서술 격리 | P0 |
| S06 | story/02_hub/outpost_core_npc_profiles_v1_0.md: 5명, 관계, 노출 순서 | CANON REFERENCE | 정확성 우선. 표를 장문 산문으로 바꾸지 않음 | 참조 |
| S07 | story/02_hub/outpost_core_npc_dialogue_bank_v0_1.md: 조건 대사 | PLAYER-FACING PROSE CANDIDATE | 재작성 후보. 화자별 부탁과 리듬을 분리 | P0 |
| S08 | story/03_regions/r01_suburb.md: 지역 정의, 수장 AI, 하위 구역, 상태 | NARRATIVE DESIGN DOC | 설계문으로 보존. 집의 기관이라는 비유를 매 장면 해설하지 않음 | 참조 |
| S09 | story/03_regions/mail_loop_npc_profile_v1_0.md: 소개, 믿음, 첫 등장 | CANON REFERENCE | 음성·안내문 재작성 후보. 주소 기록과 사람을 구분 | P0 |
| S10 | story/03_regions/vac_0_npc_profile_v1_0.md: 소개, 청소의 이중성 | CANON REFERENCE | 관찰 장면 재작성 후보. 흔적만 보고 행위자를 확정하지 않음 | P0/P1 |
| S11 | story/03_regions/room_12_npc_profile_v1_0.md: 욕망, 식탁, 첫 대면 | CANON REFERENCE | 대면 장면 재작성 후보. 자기 요구가 있는 사람으로 유지 | P1 |
| S12 | story/03_regions/r01_npc_dialogue_bank_v0_1.md: 조건 및 초기 NPC 대사 | PLAYER-FACING PROSE CANDIDATE | 재작성 후보. 명구의 연속과 근거 없는 전언을 줄임 | P0/P1 |
| S13 | story/03_regions/r02_discharge_review_face_profile_v1_0.md: 소개, 위치, 오판 | CANON REFERENCE | L05 대면 경계와 돌봄의 논리 참조. 이번 원고 이관 없음 | P1 참조 |
| S14 | story/03_regions/r03_final_return_review_officer_profile_v1_0.md: 소개, 위치, 오판 | CANON REFERENCE | L05 대면 경계와 custody 참조. 윤서 옛 상사로 만들지 않음 | P1 참조 |
| S15 | story/03_regions/r06_member_rank_broker_profile_v1_0.md: 소개, 첫 노출, 오판 | CANON REFERENCE | L02 흔적/L04 제한 대면 참조. 상점 기능 추가 없음 | P1 참조 |
| S16 | story/05_progression/campaign_story_unit_model_0_2.md: 1–220행 | NARRATIVE DESIGN DOC | 사건·귀환·재방문의 결합을 사용. 범용 loop의 기계적 반복은 피함 | 참조 |
| S17 | story/05_progression/global_mystery_reversal_ending_seed_map_v0_1.md: 전체 | NARRATIVE DESIGN DOC | seed의 후보 지위와 지역성을 보존. 기존 결말을 E01에 가져오지 않음 | P2 참조 |
| S18 | story/05_progression/r03_yunseo_reaction_settlement_phrase_bank_0_2.md: 1–170행 | PLAYER-FACING PROSE CANDIDATE | 재작성 후보. 상황마다 냉소로 닫히는 리듬을 완화 | P1 |
| S19 | story/06_characters/yunseo_profile_v1_0.md: 핵심, 욕망, 실패, §4–22 관련 본문 | CANON REFERENCE | 소개·실제 장면 재작성 후보. 큰 과거 비밀은 미확정 유지 | P0 |
| S20 | story/06_characters/yunseo.md: 최신 프로필 우선 표기, 역할, 외형, 과거 | LEGACY STORY DRAFT | 재작성 후보. 최신 v1.0와 겹치는 해설은 노출에서 제외 | P0 |
| S21 | story/06_characters/patch_profile_v1_0.md: 핵심, 역할, 자기 몸, 과거 | CANON REFERENCE | 짧은 생활 장면 재작성 후보. 자동 희생을 미덕으로 보상하지 않음 | P1 |
| S22 | story/90_implementation/story_deepening_0_2_asset_brief.md: 핵심 기준, R01 공간·자원·문구 | LEGACY STORY DRAFT | 재작성 후보. 소품의 생활 근거만 추출, 옛 제작 규격은 참조 지위 | P0/P1 |

계수: 22개 파일의 관련 본문 감사 / 부분 재작성 후보 14개 / 파일 전체 삭제 후보 0개. 이번 표는 Phase 10의 전체 파일별 이관 명세를 대신하지 않는다.

## 4. 항목별 문학 진단

| 항목 | 표본 판정 | 근거와 처리 |
|---|---|---|
| 강점 | 유지 | 수령 기록, 식탁 리더기, 회수선, 정산 카운터는 추상을 행동으로 바꿀 수 있는 사물이다. 인물의 욕망을 새로 발명할 필요가 없다. S03/S11/S19/S21. |
| 설명문 비율 | 프로필·설계문에서 높음, 대사 은행에서 낮음 | 이는 용도별 정성 판정이다. 전체 corpus의 문장 수·비율은 계측하지 않았다. 프로필의 높은 설명 비율 자체는 결함이 아니다. 그 문장을 그대로 플레이어용 산문으로 옮길 때 문제다. |
| 인물 음성 | 구별의 씨앗은 강하나 연속 청취 위험 있음 | 미나는 사용처, 윤서는 확인 범위, 복희는 이름을 다루지만 모두 대조문과 명구로 끝나면 차이가 사라진다. S07/S12/S18. |
| Subtext | 대화에는 존재, 해설에서 자주 해소됨 | 가방을 먼저 묻는 장면 뒤에 왜 그런지 설명하면 독자가 미나를 오해하고 다시 보는 시간이 사라진다. S04 §2. |
| 장면성 | 강한 원형, 연결 행동 부족 | ROOM-12가 리더기에서 손을 떼지 않는 모습은 이미 장면이다. 프로필의 반복 설명보다 플레이어의 질문과 멈춤을 붙일 가치가 크다. S11 §6. |
| 산문 호흡 | 짧은 선언문의 균일성이 위험 | 윤서는 실패했다, 그래도 나간다, 이것이 윤서다 같은 설명을 연속 이관하면 모든 문장이 결론처럼 들린다. S19 §8–14. |
| 클리셰 위험 | 구원자·현자·귀여운 로봇을 경계한 원문은 유효 | 반대로 그 금지를 모든 장면에서 설명하면 인물이 금지사항의 시연으로 남는다. S06/S10/S21. |
| AI-like prose risk | 노출 후보의 연속 편집에서 MEDIUM~HIGH | X가 아니라 Y, 세 항목 병렬, 냉소적 종결, 주제 재해설이 반복된다. 실제 저자 판정이나 자동 탐지 결과가 아니다. |
| 이관 우선 | L01/L02와 미나 접점 | 실제 관측 상태와 맞는 문장을 먼저 만든다. 박식한 장문과 신규 사건보다 보고·부분 귀환·재방문에서 말이 달라져야 한다. SD05/SD09. |

### 선행 패키지에도 적용할 비평

04_story_deepening은 명확한 설계문으로 유용하지만 문학 완성본은 아니다. `확인한 것/모르는 것/가능한 행동`이라는 설계 개념을 모든 인물이 말하게 하면 원고가 검수 회의가 된다. 이번 파일럿은 그 차이를 손을 내미는 순서, 놓을 자리, 돌아가려는 몸, 계속 남아 있는 화면으로 옮긴다. 친절한 시스템도 매번 철학적인 말을 하지 않는다. 접수 결과를 출력하고 다음 업무를 계속하는 것만으로 충분한 장면이 있다.

## 5. 원문에서 실제로 살릴 것과 줄일 것

다음 따옴표는 원문 짧은 인용이다. 수정 방향은 새 문안의 편집 판단이다.

**S19, 윤서의 결함:** “너무 많이 보류한다.” 프로필에서는 정확하다. 실제 산문에서 이 말을 반복하는 대신 상대가 기다리다 먼저 다른 부탁을 하게 한다. 행동으로 옮긴다고 새로운 과거 피해자를 만들지 않는다.

**S04, 미나의 첫인상:** “가방은?” / “사람은?” 이미 말의 순서에 관계가 있다. 바로 뒤에 미나가 차가운 사람이 아니라고 해설하지 않는다. 부상 확인이나 자리를 비워 주는 행동이 두 번째 읽기를 만든다. 단 강제 첫 인양 장면으로 현재 시작을 바꾸지 않는다.

**S11, ROOM-12:** “제가 나가면 저 사람들 저녁이 끊겨요.” 상대가 무엇을 막는지 정확하다. 같은 장면에서 해방의 정의를 설명하는 대사를 덧붙이지 않는다. 이 말은 인물의 믿음이다. 실제 서비스 조건과 항상 일치한다고 서술하지 않는다.

**S18, 반응 은행:** “빠르다고 맞는 길은 아니지.” 한 번은 쓸 수 있다. 느린 길·돌아가는 길·나가는 문에 같은 대조를 연속 배치하면 동작마다 작가의 논평이 붙는다. 위험 구간에서는 방향을 짚는 짧은 말이나 무언의 멈춤으로 바꿀 수 있다.

**S07, 복희의 목소리:** 이름이 놀라 숨는다는 식의 표현은 정서적이지만 반복하면 현자형 목소리가 된다. 젖은 종이를 말리고 어디까지 읽어도 되는지 묻는 현실적인 손일을 우선한다.

**S09/S10, 비인간:** MAIL-LOOP의 주소와 VAC-0의 청소에는 목적이 있다. 불길한 수수께끼를 일부러 말하게 하지 않는다. 기능상 성실한 문구와 현장 사이의 어긋남을 읽게 한다. 청소 흔적의 존재만으로 VAC-0를 현장 행위자로 지목하지 않는다.

## 6. 그대로 이관하지 않을 구간

DO NOT MIGRATE는 아래 세 구간에 적용한다. 해당 파일 전체를 폐기하는 판정이 아니다.

1. S02의 초기 2D 고정 거점 화면과 탐험맵이 아니라는 구현 전제. 현재 이동 가능한 RPG 허브를 덮어쓰지 않는다. 편의점형 거점의 생활 소품은 살린다.
2. S05의 장도윤이 사고 전 장비 개발 하청에 참여했다는 옛 과거. 장기 시간축과 현재 인물의 출처를 확인하지 않고 사실로 이관하지 않는다. 새 장수·복제·기억 이식 설정으로 봉합하지 않는다.
3. S19의 첫 5분 인양과 첫 귀환 장면을 모든 플레이의 강제 패배·강제 손실로 적용하는 해석. 긴급 인양이라는 세계 규칙과 현재 자율 귀환은 함께 유지한다.

추가 확인 필요: S04의 ‘대사고 직후’ 표현이 현재 미나의 직접 경험으로 읽히는 부분, 옛 Yunseo 초안의 세부 과거와 최신 프로필 관계, asset brief의 옛 화면·장르·미술 전제. 근거 없이 정정문을 만들어 원본을 대체하지 않는다.

## 7. 이번 쓰기 대상과 완료 기준

쓰기 대상은 `incoming/gpt_work/05_literary_narrative_rebuild/` 아래 다음 10개뿐이다.

01_EXISTING_STORY_LITERARY_AUDIT_V0_1.md
02_ATOMIC_AD_LITERARY_STYLE_BIBLE_V0_1.md
03_NARRATIVE_FORM_AND_TEXT_TYPE_BIBLE_V0_1.md
04_LEGACY_STORY_REWRITE_STANDARD_V0_1.md
05_E01_COMPLETE_STORY_ARCHITECTURE_V0_1.md
06_E01_EPISODE_MASTER_REGISTRY_V0_1.md
07_CHARACTER_LITERARY_REBUILD_PLAN_V0_1.md
08_LITERARY_PILOT_R01_L01_QUEST_AND_RETURN_V0_1.md
09_LITERARY_PILOT_R01_L02_RECORDS_V0_1.md
10_LITERARY_PILOT_HUB_INTERLUDE_V0_1.md

01~07은 설계·편집 문서다. 08~10은 실제 읽을 원고와 별도의 노출·검수 메모다. 각 파일럿에 scene truth → voice/subtext → line edit의 수정 근거를 남긴다. 편집 자체 검수와 사용자 낭독·게임 적용 검증을 구분한다. 문학상 수상이나 외부 심사의 품질 판정은 주장하지 않는다.

세 파일럿의 심각한 결함이 남으면 bulk writing으로 넘어가지 않는다. 이번에는 게이트 결과와 무관하게 Batch A에서 끝내며, Episode Registry는 Batch B에서 범위와 조건을 확정한다. main_episodes, side_episodes, rewrite_staging, 11번 migration manifest, 12번 final audit는 이번 생성 대상이 아니다.

기존 story / Final Lock / Production Entry / Common Graph / Unreal 변경 0. 신규 LOCKED 정사 0. 외부 서비스 구매·배포·전체 QA·main 쓰기 0.
