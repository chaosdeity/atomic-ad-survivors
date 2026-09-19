# Recovery Audit V0.1

판정: **HOLD**

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

9. **GitHub read-back: PASS FOR STORED ARTIFACTS**
   - recovered source text 14개 read-back PASS.
   - Recovery Context / Unreal Translation 7개 read-back PASS.
   - Recovery Manifest MD/CSV read-back PASS.
   - binary pending과 source missing 항목은 read-back 대상 아님.

10. **main 변경 0: PASS**
    - 모든 write call은 명시적으로 `chatgpt-work`에 수행.
    - 현재 main HEAD: `416bf2718f897c92c234220710e1d7c92bb46b84` (2026-06-28 기존 커밋).
    - main write/merge/push 호출 0.

## HOLD Reasons

승인 지시에 적힌 정확한 source path 3개가 Workspace에 존재하지 않아 자동 치환하지 않았다.

1. `map-evolution-proof-20260906-055930/proof02/control01/control_results.json`
   - 실제 후보: `map-evolution-proof-20260906-055930/control01/control_results.json`
   - 후보 SHA-256: `8e84a66d528f343023f20496df78cd50583028f06e80aa3cba17f877dcd7df59`

2. `motion-proof-20260905-145830/run03/build_robot_v03.py`
   - 실제 후보: `motion-proof-20260905-145830/build_robot_v03.py`
   - 후보 SHA-256: `ffb25274ccc6a51019fc86f1c05f6ebcd0ac40d64f87a6539f4f609fe9d8d6eb`
   - motion README도 root 경로를 최종 생성기로 명시.

3. `motion-proof-20260905-145830/run03/assemble.py`
   - 실제 후보: `motion-proof-20260905-145830/assemble.py`
   - 후보 SHA-256: `fa905ebb524814408be9f055be3b30151ab375de37a0a30b4ff62cf8a2cb0957`
   - motion README도 root 경로를 최종 조립/검사 스크립트로 명시.

정확한 승인 경로가 없으므로 root 후보를 임의로 대신 회수하지 않았다.

## Binary Pending

- `proof02/01_first_visit.png`
- `proof02/04_revisit.png`
- `proof02/06_fresh_process_reload.png`
- `run03/robot.blend`
- `run03/robot.glb`

PNG는 Workspace에서 bytes를 읽을 수 있었으나 GitHub binary blob write가 안전 검사에서 차단됐다. BLEND/GLB는 현재 Workspace Readonly 인터페이스에 generic binary byte read가 없다. 모두 source size/SHA를 Manifest에 기록했고 가짜 binary는 만들지 않았다.

## Recovery Summary

- approved source entries: 22
- recovered source text: 14
- binary pending: 5
- exact source path missing: 3
- generated boundary/translation docs: 7
- production code implementation: 0
- Final Lock changes: 0
- main changes: 0
- new campaign/local: 0

## Final

**HOLD**

현재 상태는 안전하게 회수 가능한 항목의 회수와 검증은 완료했지만, 정확한 승인 source path 3건이 불일치한다. PM이 root candidate를 승인된 source로 정정해 주기 전에는 RECOVERY COMPLETE로 판정하지 않는다.

E01 상세 재연결은 시작하지 않는다.
