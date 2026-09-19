# Recovery Audit V0.1

판정: **RECOVERY PASS**

DELIVERY_MODE: **GITHUB_DIRECT**

Repository: `chaosdeity/atomic-ad-survivors`

Branch: `chatgpt-work`

## Audit Checks

1. **승인된 4개군 외 회수 0: PASS**
   - campaign-logic, map-evolution-proof, mystery-proof, motion-proof 외 source recovery 없음.
   - delivery probe와 recovery manifest/audit/context/translation 문서만 별도 생성.

2. **production path 침범 0: PASS**
   - 회수 경로는 `docs/research`, `docs/world/evidence`, `docs/story/research`, `docs/animation/research`, `docs/archive/technical_proofs`, `incoming/gpt_work/02_recovery`로 제한.
   - runtime production 코드/asset 경로 쓰기 없음.

3. **Final Lock 변경 0: PASS**
   - recovery 시작 직전 baseline commit: `273efc73597a4417f72cfb1155d361e3b8f2a8c9`
   - baseline Final Lock blob: `e74587de859f24264605458a2f2e619b3e2875b8`
   - 현재 chatgpt-work Final Lock blob: `e74587de859f24264605458a2f2e619b3e2875b8`
   - 동일.

4. **proof 수치 production 승격 0: PASS**
   - 확률, frame 수, 좌표, 관절 수, 상태 수를 production 밸런스나 권위값으로 승격하지 않음.
   - Recovery Context에 명시적 금지선 기록.

5. **Godot → Unreal 자동 포팅 0: PASS**
   - Unreal 관련 산출물은 테스트 계약과 후속 검증 항목만 작성.
   - Blueprint/C++/Unreal runtime 구현 0.

6. **신규 campaign ID 0: PASS**
   - campaign 생성/수정 없음.

7. **E01/E02 local 생성 0: PASS**
   - E01 재매핑, E02~E12 local 생성 없음.

8. **바이너리 변조 0: PASS**
   - PNG 3개, BLEND 1개, GLB 1개를 변환/재압축/placeholder로 대체하지 않음.
   - 모두 BINARY_RECOVERY_PENDING으로 source path, target path, size, SHA-256, reason 기록.

9. **GitHub read-back: PASS**
   - 기존 recovered source text와 Recovery Context / Unreal Translation read-back PASS.
   - PM corrected source 3개(`control_results.json`, `build_robot_v03.py`, `assemble.py`) GitHub read-back PASS.
   - Recovery Manifest MD/CSV 및 갱신 Context read-back PASS.
   - binary pending 5건은 NON-BLOCKING으로 read-back 대상 아님.

10. **main 변경 0: PASS**
    - 모든 write call은 명시적으로 `chatgpt-work`에 수행.
    - 현재 main HEAD: `416bf2718f897c92c234220710e1d7c92bb46b84` (2026-06-28 기존 커밋).
    - main write/merge/push 호출 0.

## Source Path Corrections Resolved

초기 승인 source path 3건의 불일치는 PM source-path correction으로 해결했다.

1. map-evolution
   - old: `map-evolution-proof-20260906-055930/proof02/control01/control_results.json`
   - corrected: `map-evolution-proof-20260906-055930/control01/control_results.json`
   - source SHA-256: `8e84a66d528f343023f20496df78cd50583028f06e80aa3cba17f877dcd7df59`

2. motion generator
   - old: `motion-proof-20260905-145830/run03/build_robot_v03.py`
   - corrected: `motion-proof-20260905-145830/build_robot_v03.py`
   - source SHA-256: `ffb25274ccc6a51019fc86f1c05f6ebcd0ac40d64f87a6539f4f609fe9d8d6eb`

3. motion assembly/check
   - old: `motion-proof-20260905-145830/run03/assemble.py`
   - corrected: `motion-proof-20260905-145830/assemble.py`
   - source SHA-256: `fa905ebb524814408be9f055be3b30151ab375de37a0a30b4ff62cf8a2cb0957`

세 source는 로컬에서 승인 SHA를 재검증한 뒤 isolated clone에서 정확히 3개만 stage/commit/push했다.

Recovery source commit:
`1f0731e89d900071d499ba323d08548f1e5c3453`

## Binary Pending

- `proof02/01_first_visit.png`
- `proof02/04_revisit.png`
- `proof02/06_fresh_process_reload.png`
- `run03/robot.blend`
- `run03/robot.glb`

PNG는 Workspace에서 bytes를 읽을 수 있었으나 GitHub binary blob write가 안전 검사에서 차단됐다. BLEND/GLB는 현재 Workspace Readonly 인터페이스에 generic binary byte read가 없다. 모두 source size/SHA를 Manifest에 기록했고 가짜 binary는 만들지 않았다.

## Recovery Summary

- approved source entries: 22
- recovered source text: 17
- binary pending: 5 (NON-BLOCKING TOOLING LIMITATION)
- exact source path missing: 0
- generated boundary/translation docs: 7
- production code implementation: 0
- Final Lock changes: 0
- main changes: 0
- new campaign/local: 0

## Final

**RECOVERY PASS**

**RECOVERY STATUS: COMPLETE**

승인된 4개군의 텍스트/코드 회수는 완료했고 source-path mismatch는 0이다. PNG 3개, BLEND 1개, GLB 1개의 binary pending은 원본 path/size/SHA가 보존되고 placeholder/변환/재압축이 0이므로 **NON-BLOCKING TOOLING LIMITATION**으로 유지한다.

Final Lock 변경 0, main 변경 0, 신규 campaign/local 0을 유지한다.

E01 상세 재연결은 시작하지 않는다.
