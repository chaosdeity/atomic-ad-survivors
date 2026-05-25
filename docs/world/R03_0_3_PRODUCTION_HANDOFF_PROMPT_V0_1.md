# R03 0.3 Production Handoff Prompt v0.1

## 목적

이 문서는 R03 0.3을 구현/레벨/시스템/QA 팀에 넘기기 위한 복붙용 프롬프트다.

PMO 재판정:

```text
진행 가능.
문서 차단 조건은 해소됐다.
구현 리스크는 라벨/레일/드론이 방해물이 아니라 시스템을 속이는 재미로 작동하는지다.
```

---

## 0. 현재 완료된 산출물

```text
story/05_progression/r03_0_3_slice_detail_0_2.md
story/05_progression/r03_engine_data_schema_handoff_0_3.md
story/05_progression/r03_l01_l02_level_blockout_tickets_0_3.md
story/05_progression/r03_object_data_package_draft_0_3.md
story/05_progression/r03_settlement_supply_ui_phrase_table_0_3.md
story/05_progression/r03_implementation_playtest_acceptance_0_3.md
story/05_progression/r03_object_qa_script_linkage_0_2.md
tools/r03_story_doc_check.py
```

---

## 1. 제작 이관 잠금

열 것:

```text
R03-L01 반품 접수 야드
R03-L02 자동 분류장
```

열지 말 것:

```text
R03-L04
R03-L05
RETURN-05 정식 U5
HOLD-04 정식 해금
R02 직접 출격
R04/PATCH 과노출
```

반드시 유지:

```text
라벨은 태그가 아니다.
라벨은 런 중 판정 상태다.
보급태그, 통행태그, 진료태그는 정산/보급소에서 생활 접근 자원으로만 읽힌다.
```

---

## 2. 구현팀 요청

아래 작업을 R03 0.3 P0로 구현하라.

| ID | 작업 |
|---|---|
| R03-PROD-01 | `r03_run_state`와 라벨 enum 구현 |
| R03-PROD-02 | `r03_event_log`를 정산 입력으로 연결 |
| R03-PROD-03 | 송장 프린터/자동 분류 레일/보류 스탬프 P0 구현 |
| R03-PROD-04 | 반송 드론 오유도 루프 구현 |
| R03-PROD-05 | 미수령 보관함 열기/남기기 구현 |
| R03-PROD-06 | 결과/보급소 UI 문구 키 연결 |
| R03-PROD-07 | 반복 출격 반응 3종 이상 연결 |
| R03-PROD-08 | 플레이테스트 계측 키 추가 |

---

## 3. 레벨팀 요청

`story/05_progression/r03_l01_l02_level_blockout_tickets_0_3.md` 기준으로 회색 박스 블록아웃을 만든다.

최소 구역:

```text
R03-L01-BLOCKOUT-01 야드 진입로
R03-L01-BLOCKOUT-02 반품 접수 야드
R03-L01-BLOCKOUT-03 미수령 보관 구역
R03-L02-BLOCKOUT-01 자동 분류장 초입
R03-L02-BLOCKOUT-02 분류 레일 중심부
R03-L02-BLOCKOUT-03 반송 재검사 구역
R03-L02-BLOCKOUT-04 잠긴 후속 입구
```

레벨팀의 핵심 목표:

```text
레일은 길막이 아니라 위치를 바꾸는 도구다.
라벨은 맞는 장판이 아니라 붙일 대상을 바꾸는 판정이다.
드론은 추적 탄환이 아니라 잘못 속일 수 있는 확인 절차다.
```

---

## 4. QA/플레이테스트 요청

`story/05_progression/r03_implementation_playtest_acceptance_0_3.md`의 `R03-PT-01`~`R03-PT-08`을 기준으로 테스트한다.

핵심 판정:

```text
방해물이 아니다.
시스템을 속이는 재미가 있어야 한다.
```

필수 관찰:

| 관찰 | 최소 통과 |
|---|---|
| 라벨 회피 | 1회 이상 |
| 라벨 전이 | 1회 이상 |
| 레일 우회 | 2회 이상 |
| 드론 오유도 | 1회 이상 |
| 보관함 선택 | 열기 또는 남기기 1회 이상 |
| 다음 런 변화 | 1회 이상 표시 |
| 정산 이해 | 라벨과 태그를 혼동하지 않음 |

---

## 5. 복붙용 마스터 프롬프트

```text
당신은 Atomic Ad Survivors의 R03 0.3 제작팀이다.

목표:
R03-L01 반품 접수 야드와 R03-L02 자동 분류장을 구현 가능한 P0 슬라이스로 전환하라.

현재 PMO 판정:
진행 가능.
문서 차단 조건은 해소됐다.
남은 위험은 레일/라벨/드론이 귀찮은 방해물이 되는 것이다.

반드시 읽을 문서:
- story/05_progression/r03_engine_data_schema_handoff_0_3.md
- story/05_progression/r03_l01_l02_level_blockout_tickets_0_3.md
- story/05_progression/r03_object_data_package_draft_0_3.md
- story/05_progression/r03_settlement_supply_ui_phrase_table_0_3.md
- story/05_progression/r03_implementation_playtest_acceptance_0_3.md

구현 잠금:
- R03-L01/R03-L02만 직접 출격 구역으로 연다.
- R03-L04/R03-L05는 열지 않는다.
- RETURN-05 정식 U5는 열지 않는다.
- R02 직접 출격과 HOLD-04 정식 해금은 열지 않는다.
- 라벨은 태그가 아니다.
- 보급태그, 통행태그, 진료태그는 정산/보급소의 생활 접근 자원이다.

P0 구현 요청:
1. r03_run_state와 라벨 enum을 만든다.
2. r03_event_log를 만들고 정산 입력으로 연결한다.
3. 송장 프린터, 자동 분류 레일, 보류 스탬프를 먼저 구현한다.
4. 반송 드론 오유도 루프를 구현한다.
5. 미수령 보관함 열기/남기기 선택을 구현한다.
6. R03 결과/보급소 UI 문구 키를 연결한다.
7. 반복 출격 반응 3종 이상을 연결한다.
8. R03-PT-01~R03-PT-08 기준으로 플레이테스트한다.

성공 기준:
유저가 "방해물이 많다"가 아니라 "이 시스템을 속일 수 있다"고 느껴야 한다.
```

---

## 6. 출력 요청

제작팀은 아래 형식으로 결과를 보고한다.

```text
## 1. 구현 범위
R03-PROD-01~08 중 완료/진행/보류를 표시.

## 2. 블록아웃 상태
R03-L01/L02 구역별 회색 박스 배치 여부.

## 3. 플레이테스트 결과
R03-PT-01~08 통과/실패/보류.

## 4. 실패 원인
nuisance_fail, readability_fail, agency_fail, reward_fail, lore_overload_fail, unlock_confusion_fail 중 선택.

## 5. 다음 수정
수치 조정이 아니라 전조/역이용/정산 피드백 기준으로 적는다.
```
