# Recovery File Manifest

실제 회수는 실행하지 않았다. 아래는 승인 후 회수할 정확한 후보 파일이다.

| 우선 | 원본 경로 | 회수 대상 위치 후보 | 회수 내용 | 가치 | 충돌 | 방식 | 엔진 호환 |
|---:|---|---|---|---|---|---|---|
| 1 | `C:\workspace\campaign-logic-20260905-235627\README.md` | `docs/research/campaign_logic_proof_20260905/` | 실험 가정·검증 범위 | 캠페인 인과 규칙 근거 | 정사 자동승격 금지 | 선별 병합 | 엔진 비종속 |
| 2 | `C:\workspace\campaign-logic-20260905-235627\simulator.py` | 동일 | 상태 전이 시뮬레이터 | 파괴/치료/등록 연결 회귀 테스트 | 실제 게임 수치 아님 | 그대로 보존 + 필요 시 포팅 | Python 독립 |
| 3 | `C:\workspace\campaign-logic-20260905-235627\evaluate_layers.py` + `layer-evaluation-20260906-005832-678306\REPORT.md` | 동일 | 10/10 인과 검사 | 설계 변경 회귀검증 | 37.5%를 확률로 해석 금지 | 그대로 보존 | 엔진 비종속 |
| 4 | `C:\workspace\map-evolution-proof-20260906-055930\proof02\region.json` | `docs/world/evidence/map_evolution_20260906/` | 재방문 상태 최소 데이터 모델 | E01 로컬 영속 상태 설계 | 전 지구 노드 밀도와 무관 | 선별 병합 | 데이터 호환 |
| 5 | `C:\workspace\map-evolution-proof-20260906-055930\proof02\runtime_results.json` + `reload_results.json` + `control01\control_results.json` | 동일 | 24/15/6 검증 증거 | 저장·재로드·상태 파생 QA | Godot PASS=Unreal PASS 아님 | 결과 보존, 테스트 재작성 | 테스트 논리 호환 |
| 6 | `C:\workspace\map-evolution-proof-20260906-055930\proof02\01_first_visit.png`, `04_revisit.png`, `06_fresh_process_reload.png` | 동일 evidence | 전/후 시각 증거 | 지역 변화 UX 참고 | 최종 아트 아님 | 그대로 참고 보존 | 엔진 무관 |
| 7 | `C:\workspace\mystery-proof-20260906-011128\PLAYTEST_V3.md` | `docs/story/research/mystery_event_proof_20260906/` | 사건 구조·가설 검증 행동 | C02 사건 설계 심도 | 고유 사건 정사화 금지 | 선별 병합 | 엔진 비종속 |
| 8 | `C:\workspace\mystery-proof-20260906-011128\story.py`, `verify.py`, 최신 `REPORT.md` | 동일 | 450상태/1,092전이/21검사 검증기 | 분기 누락 회귀검증 | UI/재미 미검증 | 그대로 보존 후 포팅 | Python 독립 |
| 9 | `C:\workspace\motion-proof-20260905-145830\README.md`, `failure-ledger.md`, `run03\evidence\final_checks.json` | `docs/animation/research/motion_pipeline_proof_20260905/` | 모션 QA 절차 | Unreal 캐릭터 QA에 재사용 | 로봇 PASS를 윤서 PASS로 전환 금지 | 선별 병합 | 방법론 호환 |
| 10 | `C:\workspace\motion-proof-20260905-145830\run03\robot.blend`, `robot.glb`, `build_robot_v03.py`, `assemble.py` | `docs/archive/technical_proofs/motion_pipeline/` | 편집 가능한 기술 proof | Blender→GLB→프레임 재현 | 제품 자산 아님 | 그대로 보존 | Blender/Unreal 참고 |

## 윤서 관련 추가 참고

아래는 B가 아니라 C 보존이다. 현행 V105 사용자 승인 권위보다 앞선 자료라 제작 입력으로 바로 쓰지 않는다.

- `yunseo-head-structure-20260906/research-audit-20260907.md`
- `yunseo-face-design-20260907/design-data.json`, `front-observation.svg`, `side-proposal.svg`, `feature-flow.svg`
- `yunseo-feature-mesh-20260907/production-feasibility-audit-20260907.md`
- `yunseo-authored-20260906-174051/DESIGN.md`
- `yunseo-25d-20260905-200439/ownership.png`, `layers.json`

## 승인 후 순서
1. B 문서·JSON·Python read-only 복사.
2. 현재 문서와 diff.
3. 정사 문구·확률·엔진 종속 표현 제거.
4. Unreal 테스트 계약으로 재작성할 것만 별도 구현 계획.
5. 윤서 C 자료는 V105 권위와 대조 후 방법론만 인용.
