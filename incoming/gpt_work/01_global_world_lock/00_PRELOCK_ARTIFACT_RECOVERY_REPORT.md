# PRELOCK 산출물 복구 보고서

작성일: 2026-09-19 (Asia/Seoul)
저장소: `chaosdeity/atomic-ad-survivors`
작업 브랜치: `chatgpt-work`
저장 위치: `incoming/gpt_work/01_global_world_lock/`

## 결론과 범위

`DELIVERY_MODE = GITHUB_DIRECT`를 실제 update, commit SHA 수령, branch read-back으로 확인했다. GitHub에 없던 07~14는 이전 Library 산출물 8개에서 회수했다. 새 설계로 재구성한 파일은 0개다. 신규 작성물은 이 복구 보고서뿐이다.

07~11은 원본 바이트를 유지한다. 12~14는 원본 앞에 복구 시점과 적용 범위를 설명하는 동일한 주석만 추가한다. 주석을 제외한 본문은 원본과 바이트 단위로 동일하다. CSV의 UTF-8 BOM과 CRLF도 보존했다.

**PREVIOUS PRELOCK READY**
**NOT FINAL CANONICAL PRELOCK**

이 보고서는 이전 PRELOCK의 저장 누락을 복구한 기록이다. 최신 109개 감사와의 canonical reconciliation, 새로운 차별화 판정, Final LOCK 또는 Final Lock Candidate는 만들지 않는다.

## 실제 Delivery Gate

- 기존 파일 read: `06_USER_DECISIONS_APPLIED_V0_1.md` 및 기존 delivery probe를 `chatgpt-work`에서 읽었다.
- 실제 update: `incoming/gpt_work/00_delivery/GITHUB_DIRECT_PROBE.md`에 검증 토큰을 추가했다.
- 검증 토큰: `prelock-artifact-recovery-2026-09-19-v1`
- probe commit: `ad1fe7e60fde65aa1f50a0a34dcb2abe20389304`
- read-back blob: `b8f9b74792bdb42e749e45173f88da2d0fcc766c`
- 다시 읽은 branch 파일에서 동일한 토큰과 blob SHA를 확인했다. 과거 probe의 PASS 문구만으로 성공 판정하지 않았다.

복구 파일은 위 probe commit 다음의 별도 단일 커밋으로 묶는다. 커밋 메시지는 `docs: recover missing global world prelock artifacts`다. 복구 commit SHA는 이 보고서를 최초 추가한 커밋으로 식별한다. 본문 안에 자기 자신의 미래 commit SHA나 미실행 read-back 성공을 미리 기록하지 않는다.

## GitHub 기존 상태

작업 시작 시 대상 디렉터리 전체 목록에는 01~06만 있었다. 07~14는 각각 `fetch_file(ref=chatgpt-work)`을 호출했고 모두 404였다. 이전 작업자의 생성 보고를 존재 증거로 사용하지 않았다.

| 기존 파일 | 실제 read에서 확인한 blob SHA | 처리 |
|---|---|---|
| 01_RECOVERED_SYSTEM_CONTRACTS.md | `0907082f491af16e4589f38a5b67e8b9de3f902c` | 원본 유지 |
| 02_GLOBAL_WORLD_STRUCTURE_LOCK_DRAFT_V0_2.md | `7562e9f179edc3263d732f8317226e0ff2028b1f` | 원본 유지 |
| 03_GLOBAL_WORLD_DECISION_MATRIX_V0_1.md | `54b2dd9b083b7a39604ddbeb0a1503c4fa6af551` | 원본 유지 |
| 04_CAMPAIGN_DIFFERENTIATION_GATE.md | `26117cc1f2536019f7f18fd00c8b34a7efbabd6a` | 원본 유지 |
| 05_NEXT_EXECUTION_PLAN.md | `cc50e67a7f979903584e6397d4e7782ecf474206` | 원본 유지; 과거 후속 계획은 이번 실행 승인 아님 |
| 06_USER_DECISIONS_APPLIED_V0_1.md | `d9815e2b2cec604fddba3b0fbd93b5cb35ba0341` | 원본 유지 |

## 로컬 확인과 회수 출처

Workspace Readonly는 `C:\workspace` 아래 상대경로만 허용했다. 실제 프로젝트 경로 `스팀펑크/incoming/gpt_work/01_global_world_lock`의 전체 목록은 01~06뿐이었다. 따라서 지정 Workspace에서 회수한 07~14는 0개다.

보조 경로 `C:\chatgpt-worktrees\chaosdeity__atomic-ad-survivors\incoming\gpt_work\01_global_world_lock`는 허용된 Workspace root 밖이다. 접근 가능한 원본으로 확인하지 못했으며, 파일이 없다고 단정하지 않는다. root 밖으로 우회하지 않았다.

대신 Library에서 이전 생성 산출물의 실제 파일을 찾고 raw bytes를 회수했다. Library 회수와 Windows 로컬 회수는 구분한다. 아래 8개가 이번 복구의 본문 원본이다.

| 파일 | GitHub 최초 상태 | Library source file ID | 복구 상태 |
|---|---|---|---|
| 07_GLOBAL_CAMPAIGN_SYSTEM_SCHEMA_V0_1.md | 404 | `file_00000000242c820b8931abb49d7e4160` | 원본 그대로 회수 |
| 08_GLOBAL_96_CAMPAIGN_REGISTRY_DRAFT.csv | 404 | `file_00000000411c820bbf7502c1dc0ad2f7` v1 | 원본 그대로 회수 |
| 09_DUPLICATE_CAMPAIGN_SYSTEM_VALIDATION_V0_1.md | 404 | `file_00000000628c820bb411678063b2703b` v1 | 원본 그대로 회수 |
| 10_RUMOR_INFORMATION_PROPAGATION_CONTRACT_V0_1.md | 404 | `file_00000000a758820b89acdcb91d02d878` | 원본 그대로 회수 |
| 11_GLOBAL_RELAY_BEACON_RECOVERY_CONTRACT_V0_1.md | 404 | `file_000000009f3c820bb63a36c4bd96c86b` | 원본 그대로 회수 |
| 12_GLOBAL_WORLD_PRELOCK_VALIDATION_V0_2.md | 404 | `file_0000000087c0820baee75f68b0500b2a` | 원본 회수 + 이전 결과 주석 |
| 13_CAMPAIGN_DIFFERENTIATION_CANDIDATE_LOCK_V0_1.md | 404 | `file_000000009e1c820bba0c1f968a918758` v1 | 원본 회수 + PREVIOUS PRELOCK 주석 |
| 14_DIFFERENTIATION_PRELOCK_RESULT_V0_1.md | 404 | `file_000000000fc0820ba64b95c47d0edd5e` | 원본 회수 + PREVIOUS PRELOCK 주석 |
| 00_PRELOCK_ARTIFACT_RECOVERY_REPORT.md | 목록에 없음 | 이번 실제 호출·조회·검증 결과 | 복구 경위 보고서 신규 작성 |

재구성한 설계 파일: **0**. Workspace 로컬 회수: **0**. Library 원본 회수: **8**. 원본 내용을 대체하거나 96개 세부값을 새로 채우지 않았다.

## 원본 및 저장본 식별

아래 SHA는 UTF-8 원본 바이트와 Git blob 형식으로 계산하고 실제 GitHub blob 생성 결과와 대조했다. 12~14는 동일한 복구 주석을 제거하면 원본 blob과 일치한다.

| 파일 번호 | 원본 blob SHA | 저장본 blob SHA |
|---|---|---|
| 07 | `badc623dbe30b5fa51a40ba719f6fe61787e230a` | `badc623dbe30b5fa51a40ba719f6fe61787e230a` |
| 08 | `33b3ba31f108ecbe6963ba067e517247e4e2f4f0` | `33b3ba31f108ecbe6963ba067e517247e4e2f4f0` |
| 09 | `b27b52f76ac67d5eb3748d961bfa313cc02bccde` | `b27b52f76ac67d5eb3748d961bfa313cc02bccde` |
| 10 | `289005d9a50e1bb083484a3bb9611192d023e6e7` | `289005d9a50e1bb083484a3bb9611192d023e6e7` |
| 11 | `6bd6c5feef0e2cc5cb394d117a52ded339a26f82` | `6bd6c5feef0e2cc5cb394d117a52ded339a26f82` |
| 12 | `fc7e795e1f4468590e5142110e9870e68d1c8041` | `1babcfcf9bc32423e90698f94cb9e211036b991e` |
| 13 | `d5347fff6026b22c7bbf58f43e15f7ef0a4865ea` | `bd8affccec4bb072d169fe897f46f50ab1bc6c8a` |
| 14 | `c924ad1af5c9e1abe671bf3525343f6c3ba9b968` | `161368d71c5a0c2c9716b0f1f407947f50180eb0` |

## 이전 PRELOCK과 최신 감사의 시간적 관계

Library metadata에 기록된 07·10·11 원본 생성 시각은 2026-09-18 19:01 UTC대, 08·09·12·13·14는 같은 날 19:23 UTC대다. 한국 시각으로는 2026-09-19 04:01~04:23이다.

최신 감사 commit `20c850c775d57543f8a83c6aed1a503d15b3efce`의 GitHub commit 시각은 2026-09-19 00:25:22 UTC, 한국 시각 09:25:22다. 메시지는 `docs: correct audit count basis`다. 원본의 보관 시각과 이 commit metadata를 확인했으며, `_codex_*` 컨테이너를 다시 감사하지 않았다.

최신 감사 기준인 109 candidate containers, 18 duplicate families, RECOVER 4, ARCHIVE 64, DELETE CANDIDATE 36, REVIEW NEEDED 5는 이번 PM 지시에서 지정한 기준이다. 이 숫자를 다시 산출하거나 감사 문서를 고치지 않는다.

13/14의 후보 판단과 12의 15/15 PASS는 **최신 감사 이전 PRELOCK 범위**다. 복구 commit이 최신 감사 이후에 생성되더라도 내용의 검토 시점이 새로워지는 것은 아니다. 원문에 남긴 WRITE_BLOCKED는 당시 전달 실패 기록이며 현재 Delivery Gate 결과가 아니다.

**Latest 109-audit integration: NOT DONE**

C03 ↔ C04, C07 ↔ C08, C01 ↔ C06, C05 반복 위험은 다음 PM 지시의 canonical reconciliation 대상으로 남긴다. 과거 문서가 언급하는 Final LOCK 후보 작성 가능성도 이번 작업의 실행 승인으로 해석하지 않는다.

## 이번 복구에서 실제 수행한 검증

| 검증 | 결과 | 방법과 범위 |
|---|---|---|
| Registry rows | 96 | 실제 CSV를 UTF-8-sig로 읽고 csv.DictReader로 집계 |
| Registry unique IDs | 96 | campaign_id 집합 크기 |
| missing | 0 | E01~E12 × C01~C08 기대 집합과 차집합 비교 |
| unexpected | 0 | 실제 ID 집합에서 기대 집합 차감 |
| display-name changes | 0 | chatgpt-work 공식 catalog의 ID별 표시명 96개와 exact 비교 |
| sector/family 정합 | PASS | 각 ID가 sector_id + '_' + campaign_family와 일치 |
| 위험군 후보 연결 | PASS | 13의 26개 unique campaign과 CSV DEFINED_CANDIDATE 26개가 동일 |
| 기존 6개 위험군 | DEFINED_CANDIDATE 6 | 이전 09·13·14 내용과 사용자 확정 Candidate Lock 대조 |
| 기존 PRELOCK 결과 | 15/15 PASS 보존 | 12 원본의 15개 PASS gate를 확인; 최신 감사 재판정 아님 |
| Rumor physical mutation | 0 | 계약상 rumor-only 물리 변경 허용 없음; runtime 변경 없음 |
| E02~E12 신규 local | 0 | 복구 문서와 보고서만 대상; 새로운 좌표/노드 데이터 생성 없음 |
| E01 상세 재연결 | 0 | 기존 계층·local 연결 변경 없음 |

표시명 비교 원문은 `docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md`, branch `chatgpt-work`, blob `6ce6320e6d58a828eaf94332b2cee0d6e9844677`이다. 공식 catalog 자체는 수정하지 않는다.

중요: PARTIAL 0 / HOLD 0은 **이전 6개 중복 위험군의 집계**다. Registry에는 DEFINED_CANDIDATE 26개와 NOT_AUDITED 70개가 그대로 남아 있다. 70개를 설계 완료로 승격하지 않았고, 개별 필드의 PARTIAL/TBD나 과거 notes도 삭제·재작성하지 않았다. 모든 96개 상세설계가 완료됐다는 뜻이 아니다.

Rumor 검증은 문서 계약과 이번 변경 범위에 대한 정적 검증이다. 실제 게임 엔진이나 운영 중인 세계 상태를 실행 검증했다는 의미는 아니다.

## Commit 후 read-back 완료조건

이 보고서와 07~14, 총 9개를 각각 `fetch_file(ref=chatgpt-work)`로 다시 읽고, GitHub가 반환하는 전체 파일 blob SHA가 준비한 내용과 같은지 비교한다. 부분 line 조회를 사용해도 비교 대상은 전체 파일 blob SHA다. 00 보고서 역시 별도 계산한 blob SHA와 대조한다.

동시에 probe commit 이후의 diff가 이 9개 파일 추가뿐인지 확인한다. 01~06, 최신 감사 결과, 공식 world 문서와 runtime은 변경하지 않는다. `main` 기준 HEAD는 `416bf2718f897c92c234220710e1d7c92bb46b84`이며 완료 시 재조회하여 동일한지 확인한다. main 대상 write/merge/push 호출은 하지 않는다.

9개 read-back과 main 재조회가 모두 통과한 뒤에만 최종 실행 보고에서 복구 완료를 선언한다. 파일 생성 호출이나 blob 생성만으로 완료 처리하지 않는다.

## 실제 읽은 자료와 실행하지 않은 작업

실제 본문을 읽은 자료는 현재 GitHub의 01~06, root `AGENTS.md`, 기존 delivery probe, 공식 `GLOBAL_CAMPAIGN_CATALOG_V0_1.md`의 96개 campaign 행, Library 07·09~14 원문과 08 raw CSV다. 추가로 Library 원본 metadata, 대상 폴더 목록, branch refs, 최신 감사 commit metadata를 확인했다. 최신 109개 감사의 내용 재작성이나 컨테이너별 재검사는 하지 않았다.

실행하지 않은 작업: `_codex_*` 재감사, DELETE 후보 삭제, Final LOCK/Final Lock Candidate 생성, 최신 canonical PRELOCK 작성, E01 상세 재연결, E02~E12 local 생성, 실제 플레이 맵 제작, 96 ID 변경, main write/merge/push, 새 ZIP 제작, 엔진 코드 변경.

## 다음 작업

이번 복구를 commit 및 read-back 검증한 뒤 종료한다. 최신 109개 감사와 PRELOCK의 canonical reconciliation은 다음 PM 지시가 있을 때 별도 작업으로 진행한다.
