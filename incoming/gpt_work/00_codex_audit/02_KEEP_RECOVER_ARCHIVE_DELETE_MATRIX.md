# KEEP / RECOVER / ARCHIVE / DELETE Matrix

분류 수치는 **감사 후보 컨테이너 109개 기준**이다. 동일/파생 결과는 별도로 18개 중복 패밀리로 묶어 해석했다.

| 등급 | 수 | 핵심 판정 |
|---|---:|---|
| A KEEP | 0 | 외부 _codex 복사본 중 현재 제작 권위 그 자체로 유지해야 할 항목은 확인되지 않았다. 현재 권위는 C:\workspace\스팀펑크 현행 문서/Unreal 작업이다. |
| B RECOVER | 4 | 현재 프로젝트에 미흡/미반영이며 엔진 비종속 설계·검증 가치가 확인된 독립 proof. |
| C ARCHIVE | 64 | 역사적 의사결정, 실패 원인, 이미 merge된 Godot 구현/자산 provenance. |
| D DELETE CANDIDATE | 36 | QA temp_project, output, launch copy, 중복 clone, 상위 결과에 흡수된 실행 복사본. |
| E REVIEW NEEDED | 5 | provenance 또는 최신 기준 흡수 여부가 불충분. |

## B. RECOVER

### B1. campaign-logic-20260905-235627
- 시설 파괴 → 서비스 상실 → NPC 선택/등록 조건 변화라는 캠페인 간 인과 규칙을 독립 Python으로 검증.
- 기존 검사 20/20, 인과 검사 10/10. 동일 256조건에서 파괴/비파괴 치료 결과 차이 96/256(37.5%). 실제 플레이 확률이 아니다.
- 96개 캠페인 구조와 충돌하지 않는다. 정사 자동 승격 금지.
- 규칙/테스트 방법을 선별 병합한다.

### B2. map-evolution-proof-20260906-055930
- 최초 방문 → 시설 파괴 → NPC 이동 → 귀환 → 재방문 → 저장/새 프로세스 복원을 기능 장면으로 검증.
- proof02 24 checks PASS, control 15 PASS, reload 6 PASS 기록.
- E01 로컬 상태 모델로 참고하되 전 지구 노드 밀도 기준으로 승격하지 않는다.
- JSON/결과/핵심 화면을 회수하고 Godot runtime은 직접 이식하지 않는다.

### B3. mystery-proof-20260906-011128
- 기록 대조·동의·자원·후속 의무로 결과가 달라지는 캠페인 사건 설계 패턴.
- 최신 기록 기준 450상태·1,092전이·21검사 통과.
- 기존 C02 의료/보험 계열 사건 참고로만 회수하고 고유 사건을 자동 정사화하지 않는다.

### B4. motion-proof-20260905-145830
- Blender 원본 → GLB → 2D sprite sheet → 실제 renderer capture → 입력/루프/접지 검사 QA 파이프라인.
- run03 기준 통합 30/30, 3D 17/17, 2D 13/13.
- 단순 로봇 proof이므로 윤서/Unreal 애니메이션 품질 PASS가 아니다.
- QA 체크리스트와 Blender 검증법만 선별 회수한다.

## C. ARCHIVE

- _codex_archive/* 10개 merge/history 패키지.
- 이미 merge된 R01 production fixture/background/full-map-art 결과와 provenance.
- June Yunseo runtime-state/walk16/walk-feel 계열.
- 사용자 확정 이전 R01 주택가/환경 원화와 full-map art.
- September Yunseo 실패/부분 성공 실험: 2.5D, authored-volume, fullbody, head-structure, face/face-fit, feature-mesh, shoulder-gate, VRoid.
- yunseo-face-design-20260907은 방법론 참고만 허용. 현행 V105 권위보다 낮다.

## D. DELETE CANDIDATE

삭제는 실행하지 않았다. 최소 2개 근거가 있는 복사본/출력 계열만 D다.

| 그룹 | 근거 1 | 근거 2 |
|---|---|---|
| R01 background batch2 QA/temp | 상위 merged archive 존재 | QA 보고서가 결과 보존 |
| R01 full-map v02 QA/temp | merged archive 존재 | assets/backup/QA 파생본 중복 |
| R01 full-map playtest output family | 동일 목적 output/feedback/screenshot 파생 | 현재 Unreal 최종 엔진과 직접 호환 안 됨 |
| core-loop QA copies | 상위 implementation/report 존재 | QA copy는 독립 자산 아님 |
| first-10 preflight | full-manual v2 후속 존재 | 중간 검증물 |
| launch_latest_game variants | 동일 실행 목적 복사본 | live-origin/PR playtest 후속 존재 |
| Yunseo runtime-state QA/temp | merged archive + 현재 보고서 존재 | temp/runtime 복사본 |
| Yunseo walk-cycle/walk-feel QA output | 상위 assets/report/merge 존재 | probe/output 파생 |
| Yunseo default-walk/failed-frame QA outputs | final/hotfix 또는 실패 보고 존재 | 현행 V105보다 구형 |
| _codex_imagegen_tmp | 명시적 tmp | 현재 권위 경로 아님 |
| 스팀펑크/_codex_playtest | 임시 playtest 영역 | 정식 Unreal/runtime 문서와 분리 |

## E. REVIEW NEEDED

1. _codex_patches: 현재 적용 여부를 commit 단위로 확인 필요.
2. yunseo-crosspose-20260905-203016: V105 이후 기준과 identity/side-ownership 관계 확인 필요.
3. yunseo-edge-refine-20260905-205604: 현행 V105/모듈 계약 흡수 여부 확인 필요.
4. 일부 Yunseo face-fit/shoulder 산출물: provenance는 있으나 현행 승인 입력으로 사용 가능한지 확인 필요.
5. 일부 R01 NPC/style review: 사용자 확정 전 산출물 여부와 승인 이력 확인 필요.

## 공통 판정 규칙
- FINAL/LOCK 이름이나 최신 수정시각만으로 권위 승격하지 않았다.
- Godot 구현은 Unreal 코드로 직접 복사하지 않는다.
- 사용자 확정 전 R01 환경 원화/주택가 맵은 정본이 아니다.
