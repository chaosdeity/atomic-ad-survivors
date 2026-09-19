# KEEP / RECOVER / ARCHIVE / DELETE Matrix

분류 수치는 중복을 묶은 **53개 논리 그룹 기준**이다.

| 등급 | 수 | 핵심 판정 |
|---|---:|---|
| A KEEP | 0 | 현재 제작 권위는 `C:\workspace\스팀펑크`의 현행 문서/Unreal 작업이며, 외부 _codex 복사본 중 현재 기준 그 자체로 유지해야 할 것은 확인되지 않았다. |
| B RECOVER | 4 | 현재 프로젝트에 미흡/미반영이며 엔진 비종속 설계·검증 가치가 확인된 독립 proof. |
| C ARCHIVE | 31 | 역사적 의사결정, 실패 원인, 이미 merge된 Godot 구현/자산의 provenance. |
| D DELETE CANDIDATE | 13 | QA temp_project, output, launch copy, 중복 clone, 상위 결과에 흡수된 실행 복사본 그룹. |
| E REVIEW NEEDED | 5 | provenance 또는 최신 기준 흡수 여부가 불충분. |

## B. RECOVER

### B1. campaign-logic-20260905-235627
- 가치: 시설 파괴 → 서비스 상실 → NPC 선택/등록 조건 변화라는 **캠페인 간 인과 규칙**을 독립 Python으로 검증.
- 검증: 기존 검사 20/20, 인과 검사 10/10. 동일 256조건에서 파괴/비파괴의 치료 결과 차이 96/256(37.5%). 실제 플레이 확률이 아님.
- 충돌: 96개 캠페인 구조와 충돌하지 않음. 특정 캠페인 정사로 자동 승격하면 안 됨.
- 회수: 규칙/테스트 방법을 선별 병합. Unreal 코드는 없음.

### B2. map-evolution-proof-20260906-055930
- 가치: 최초 방문 → 시설 파괴 → NPC 이동 → 귀환 → 재방문 → 저장/새 프로세스 복원이라는 **지역 상태 지속성**을 실제 기능 장면으로 검증.
- 검증: proof02 24 checks PASS, control 15 PASS, reload 6 PASS 기록.
- 충돌: 현재 전 지구 상위 구조와 충돌 없음. E01 40노드의 개별 노드 상태 모델로만 사용해야 하며 전 지구 노드 밀도 기준으로 승격 금지.
- 회수: `region.json`, 결과 JSON, 핵심 스크린샷/영상, failure ledger의 상태 모델만 선별. Godot scene/runtime 직접 이식 금지.

### B3. mystery-proof-20260906-011128
- 가치: “문을 열면 해결”이 아니라 기록 대조·동의·자원·후속 의무로 결과가 달라지는 **캠페인 사건 설계 패턴**.
- 검증: 최신 README 기준 450상태·1,092전이·21검사 통과.
- 충돌: 현재 정식 캠페인명을 추가하지 않고 기존 C02 의료/보험 계열의 사건 설계 참고로만 회수하면 충돌 없음.
- 회수: 사건 구조와 검증기만 선별 병합. G-04/H-17 고유 사건을 자동 정사화하지 않음.

### B4. motion-proof-20260905-145830
- 가치: Blender 원본 → GLB → 2D sprite sheet → 실제 renderer capture → 입력/루프/접지 검사로 이어지는 **모션 QA 파이프라인**.
- 검증: run03 기준 통합 30/30, 3D 17/17, 2D 13/13; 실패 run01/02는 원인 기록.
- 충돌: 단순 로봇에 대한 도구 경로 증명이며 윤서/Unreal 애니메이션 품질 PASS가 아님.
- 회수: QA 체크리스트·접지/루프 검증법·Blender 원본 생성/검증 스크립트. Godot proof는 참고용.

## C. ARCHIVE 주요 그룹

- `_codex_archive/*` 10개 merge/history 패키지 전부.
- 이미 merge된 R01 production fixture/background/full-map-art 결과와 그 provenance.
- June Yunseo runtime state/walk16/walk-feel 계열.
- 사용자 확정 이전 R01 주택가/환경 원화와 full-map art는 제작 기준이 아닌 역사 자료.
- September Yunseo 실패/부분 성공 실험: 2.5D, authored-volume, fullbody, head-structure, face/face-fit, feature-mesh, shoulder-gate, VRoid. 현행 V105 기준보다 낮은 권위이며 실패 원인/방법론만 보존.
- `yunseo-face-design-20260907`은 측면/토폴로지 제안 자체가 현행 V105 권위가 아니므로 C. 필요 시 방법론만 참고.

## D. DELETE CANDIDATE 주요 그룹

삭제는 실행하지 않았다. 아래는 최소 2개 근거가 있는 그룹만 D다.

| 그룹 | 근거 1 | 근거 2 |
|---|---|---|
| R01 background batch2 final_visual_qa_output/temp_project | 상위 merged archive 존재 | 실행용 복사본이며 QA 보고서가 결과를 보존 |
| R01 full-map v02 final QA temp_project | merged archive 존재 | 동일 결과의 assets/backup/QA 파생본 존재 |
| R01 full-map playtest output family | 동일 playtest 목적의 output/feedback/screenshot 파생 | 현재 Unreal 최종 엔진 기준과 직접 호환 안 됨 |
| core loop pressure/reward QA copies | 상위 implementation/report가 현재 프로젝트에 존재 | QA copy 이름/용도상 독립 자산 아님 |
| first-10-minute preflight copy | full-manual v2 후속 존재 | preflight는 중간 검증물 |
| launch_latest_game variants | 동일 실행 목적의 여러 copy | live-origin/PR playtest 후속 존재 |
| Yunseo runtime-state QA temp copies | merged archive + current project report 존재 | QA/temp_project 복사본 |
| Yunseo walk-cycle runtime QA output | static assets/report 상위본 존재 | 실행 결과 복사본 |
| Yunseo walk-feel probe/output copies | merged archive 존재 | probe/output 파생 |
| Yunseo default-walk QA/output copies | final/hotfix/postmerge 계열 존재 | 현행 V105 기준보다 구형 |
| Yunseo failed-frame QA outputs | 실패 증거는 report로 보존 가능 | runtime/output 복사본 |
| `_codex_imagegen_tmp` | 명시적 tmp | 현재 권위 자산 경로가 아님 |
| `스팀펑크/_codex_playtest` | 현재 프로젝트 내부 임시 플레이테스트 영역 | 정식 문서/Unreal runtime과 분리된 임시 copy |

## E. REVIEW NEEDED

1. `_codex_patches`: 패치 원본과 현재 프로젝트 적용 여부를 commit 단위로 재확인 필요.
2. `yunseo-crosspose-20260905-203016`: V105 이후 기준과 identity/side-ownership 관계 재확인 필요.
3. `yunseo-edge-refine-20260905-205604`: 현행 V105/모듈 계약에 흡수됐는지 추가 확인 필요.
4. 일부 Yunseo face-fit source-transfer 산출물: provenance 파일은 있으나 현행 사용자 승인 입력으로 쓸 수 있는지 확인 필요.
5. 일부 R01 NPC/style review 이미지: 사용자 확정 전 산출물 가능성이 있어 제작 기준 승격 금지, 원본 승인 이력 확인 필요.

## 핵심 원칙

- 파일명이 FINAL/LOCK이어도 현행 권위로 자동 승격하지 않았다.
- 수정일이 최신이어도 승인/현재 문서와 충돌하면 C/E다.
- Godot 구현은 Unreal 코드로 직접 복사하지 않는다.
- 사용자 확정 전 R01 환경 원화/주택가 맵은 C 또는 D이며 월드맵 정본이 아니다.
