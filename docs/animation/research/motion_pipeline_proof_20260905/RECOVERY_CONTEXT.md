# Motion Pipeline Recovery Context

STATUS: RECOVERED RESEARCH / PROOF ONLY

NOT PRODUCTION AUTHORITY

NOT GAME BALANCE

NOT UNREAL PASS

## 역할

motion-proof는 WORLD SYSTEM이 아니라 TECH PIPELINE proof다. Blender에서 GLB를 만들고, 실패를 보존하고, grounding, loop, renderer capture를 검증한 기술 절차를 참고하기 위한 자료다.

## 유효하게 회수한 것

- Blender → GLB 제작 과정의 재현성
- failure ledger를 통한 실패 원인과 재사용 금지 기록
- grounding 검사
- animation loop 검사
- headless 결과와 실제 renderer capture를 분리하는 QA 원칙
- 반복 가능한 기술 proof 구성

## 승격 금지

- robot PASS를 Yunseo PASS로 해석하지 않는다.
- Godot pipeline을 Unreal production pipeline으로 간주하지 않는다.
- motion proof를 campaign law, resource ecology, persistence world state에 연결하지 않는다.
- proof의 프레임 수, 임계값, 관절 수를 production 기준으로 자동 승격하지 않는다.

## 원본 경로 불일치 해결

**RESOLVED BY PM SOURCE PATH CORRECTION**

초기 승인 경로 `run03/build_robot_v03.py`, `run03/assemble.py`는 Workspace에 존재하지 않았다.

원본 README가 최종 Blender 생성기와 시트 조립/검사 스크립트를 proof 루트의 `build_robot_v03.py`, `assemble.py`로 명시하는 것을 다시 검증했고 PM이 이 root source를 승인했다.

회수 완료:
- `build_robot_v03.py` → `docs/archive/technical_proofs/motion_pipeline/build_robot_v03.py`
- `assemble.py` → `docs/archive/technical_proofs/motion_pipeline/assemble.py`

로컬 승인 SHA를 확인한 뒤 격리 clone을 통해 `chatgpt-work`에 저장했고 GitHub read-back을 확인했다.

Recovery commit: `1f0731e89d900071d499ba323d08548f1e5c3453`

## Binary Recovery Pending

`run03/robot.blend`와 `run03/robot.glb`는 원본 존재, 크기, SHA-256까지 확인했다. 현재 GitHub connector 경로에서 원본 binary direct write를 안전하게 수행할 수 없어 변환, 재압축, placeholder 생성 없이 보류했다.

상세 source path, target path, size, SHA는 Recovery Execution Manifest에 기록한다.
