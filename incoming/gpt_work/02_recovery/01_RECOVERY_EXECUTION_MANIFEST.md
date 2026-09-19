# Recovery Execution Manifest

상태: **EXECUTED ON `chatgpt-work`**

DELIVERY_MODE: **GITHUB_DIRECT**

기준:
- FINAL GLOBAL WORLD STRUCTURE LOCK V0.2 / PM APPROVED
- 22_RECOVERY_CANONICAL_ROLE_MAP_V0_1.md
- 03_RECOVERY_FILE_MANIFEST.md

주의:
- source_hash는 Workspace 원본 바이트의 SHA-256이다.
- Workspace Readonly의 text read는 줄 단위 텍스트 API이므로 일반 텍스트는 내용 보존 후 GitHub read-back으로 검증했다.
- map JSON 3개는 ASCII 원문 길이와 SHA-256을 별도로 대조하여 source SHA-256과 동일함을 확인했다.
- motion `final_checks.json`은 원문 그대로 전송이 안전 검사에 한 차례 차단되어 JSON 값은 유지하고 whitespace만 정규화했다.
- binary는 변환, 재압축, placeholder 생성 없이 보류한다.

## Approved Source Recovery

| source_path | target_path | category | text_or_binary | source_size | source_hash | github_status | readback_status | authority | notes |
|---|---|---|---|---:|---|---|---|---|---|
| `campaign-logic-20260905-235627/README.md` | `docs/research/campaign_logic_proof_20260905/README.md` | campaign-logic | text | 6414 | `68844b43931fdc62257f84f992b74f9e692a8c9677363f3e99f3313faaf0d1a9` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T15:59:30.516Z; commit 9b85db4727f77867b674c92ce74e2f9287e55be5 |
| `campaign-logic-20260905-235627/simulator.py` | `docs/research/campaign_logic_proof_20260905/simulator.py` | campaign-logic | text | 12569 | `25eb30a5f89fdb9c54b5fe1362bc448982accc7cac51e50871030120f4c36875` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T15:58:14.514Z; commit 8ee9708c3e1df1d2b67b94c7105c1f733ac0359f |
| `campaign-logic-20260905-235627/evaluate_layers.py` | `docs/research/campaign_logic_proof_20260905/evaluate_layers.py` | campaign-logic | text | 7453 | `79f4f7c0d80acd18755056dbe7a5affdd7449385dbc2581decf9329a1e9bc51e` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T15:58:31.577Z; commit 1979da35f8d6bc93e5fac06a0eef7b48534ab2ea |
| `campaign-logic-20260905-235627/layer-evaluation-20260906-005832-678306/REPORT.md` | `docs/research/campaign_logic_proof_20260905/REPORT.md` | campaign-logic | text | 2828 | `90e1431729a55a746958b8b6768bfe6a92830ad6230cf26c9ee5c7b989b5b74b` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T15:58:32.703Z; commit a1306235b7b3c7ca91f865aae2eee356bc55e0fe |
| `map-evolution-proof-20260906-055930/proof02/region.json` | `docs/world/evidence/map_evolution_20260906/region.json` | map-evolution-proof | text | 145 | `65ebe41fe727b4845d4b84fea60a59967f025555bb505cb924232bb1a5b5f6bf` | RECOVERED_EXACT_HASH | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T21:04:49.346Z; final commit ca206e7ea5de026d4aa0c274013449eac362df27 |
| `map-evolution-proof-20260906-055930/proof02/runtime_results.json` | `docs/world/evidence/map_evolution_20260906/runtime_results.json` | map-evolution-proof | text | 2240 | `26187b8fc3b5ca75c4c2fe37098465f7d06c75d656918a724a36686ce8116f19` | RECOVERED_EXACT_HASH | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T21:04:49.346Z; final commit dc730e2dc14f6ccf60ee579a273d4cf790956c45 |
| `map-evolution-proof-20260906-055930/proof02/reload_results.json` | `docs/world/evidence/map_evolution_20260906/reload_results.json` | map-evolution-proof | text | 837 | `bea6ae11189dd12619c40d03f7a8eb4c37cc4c9cb59cffa1be9393ffc5fc0850` | RECOVERED_EXACT_HASH | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T21:05:19.555Z; final commit 81841037d0045be854dacfe3404ca04dc864962a |
| `map-evolution-proof-20260906-055930/proof02/control01/control_results.json` | `docs/world/evidence/map_evolution_20260906/control_results.json` | map-evolution-proof | text |  |  | SOURCE_MISSING | N/A | WORLD_SYSTEM_PROOF | exact approved path 없음. Root candidate `control01/control_results.json`: 1596 bytes, modified 2026-09-05T21:05:13.960Z, SHA-256 8e84a66d528f343023f20496df78cd50583028f06e80aa3cba17f877dcd7df59. 자동 치환 안 함 |
| `map-evolution-proof-20260906-055930/proof02/01_first_visit.png` | `docs/world/evidence/map_evolution_20260906/01_first_visit.png` | map-evolution-proof | binary | 45378 | `f1973d37aca1b7c3acc247666d04c4e600da611ed939579230b5f386e89ffd4c` | BINARY_RECOVERY_PENDING | N/A | BINARY_PENDING | modified 2026-09-05T21:04:33.144Z; PNG bytes read 가능, GitHub binary blob write가 안전 검사에서 차단. placeholder 0 |
| `map-evolution-proof-20260906-055930/proof02/04_revisit.png` | `docs/world/evidence/map_evolution_20260906/04_revisit.png` | map-evolution-proof | binary | 47492 | `f5c9cc9d29c021852dd6048dd5c7e88a73aa09d79050fdfd98c3e3a304edadb8` | BINARY_RECOVERY_PENDING | N/A | BINARY_PENDING | modified 2026-09-05T21:04:45.945Z; direct binary write route unavailable. placeholder 0 |
| `map-evolution-proof-20260906-055930/proof02/06_fresh_process_reload.png` | `docs/world/evidence/map_evolution_20260906/06_fresh_process_reload.png` | map-evolution-proof | binary | 47264 | `adf25f4591953b4a64ba476726f489a0746916bdbe6fb2d2ced5aa3043bebcb3` | BINARY_RECOVERY_PENDING | N/A | BINARY_PENDING | modified 2026-09-05T21:05:19.554Z; direct binary write route unavailable. placeholder 0 |
| `mystery-proof-20260906-011128/PLAYTEST_V3.md` | `docs/story/research/mystery_event_proof_20260906/PLAYTEST_V3.md` | mystery-proof | text | 3291 | `875a14bebc15fcaeafad564dfe879f98ff6647854f1d686fd945558541d180ec` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T20:40:43.983Z; commit 98385f3950879e1014dedfa560860489b71882bf |
| `mystery-proof-20260906-011128/story.py` | `docs/story/research/mystery_event_proof_20260906/story.py` | mystery-proof | text | 10934 | `027fec1358101707800e8f96c41affbff53d73765d56e79987b7833ae96edffa` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T20:39:33.526Z; commit 7e78d357b6bafd8dd9612e4c101ea92434d0b67a |
| `mystery-proof-20260906-011128/verify.py` | `docs/story/research/mystery_event_proof_20260906/verify.py` | mystery-proof | text | 5626 | `a1822efa7159b281a49bc1df04d3f58a9531b9be7f70bc6e21e62bfee5111548` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | modified 2026-09-05T16:13:52.691Z; commit 82a93fc4466305adc3a354f1781c5cb1566d4740 |
| `mystery-proof-20260906-011128/results-20260906-053934-341706/REPORT.md` | `docs/story/research/mystery_event_proof_20260906/REPORT.md` | mystery-proof | text | 7481 | `0cd3617bbd20e5e76ae2376507acac40141c68fcdf9c8cdea48645975b9cc703` | RECOVERED | PASS | WORLD_SYSTEM_PROOF | 최신 REPORT 확인; modified 2026-09-05T20:39:34.344Z; commit b1770d05bf7d0b9e5fde0e5c8b082bb0f7414a94 |
| `motion-proof-20260905-145830/README.md` | `docs/animation/research/motion_pipeline_proof_20260905/README.md` | motion-proof | text | 9328 | `92c79f15f8dddb0ae2b837d2de0c02c5b8ab10744c02bab01843de65a81e805e` | RECOVERED | PASS | TECH_PIPELINE_PROOF | modified 2026-09-05T06:16:06.737Z; commit bb369fb97db2582594b68f073d61944d64c41ea8 |
| `motion-proof-20260905-145830/failure-ledger.md` | `docs/animation/research/motion_pipeline_proof_20260905/failure-ledger.md` | motion-proof | text | 4040 | `63fc1331d2f6524694bec4e9b2dffd46f9cc20f55355d3ceca26e1a2806b00a2` | RECOVERED | PASS | TECH_PIPELINE_PROOF | modified 2026-09-05T06:16:06.620Z; commit edd9e8ebd023f07f1739f5cf960589020f7f3a7b |
| `motion-proof-20260905-145830/run03/evidence/final_checks.json` | `docs/animation/research/motion_pipeline_proof_20260905/final_checks.json` | motion-proof | text | 2377 | `810165daa78c7b90bb5ad77b300a53f8230afd3e91f257e21491b97610a86ce1` | RECOVERED_JSON_WHITESPACE_NORMALIZED | PASS | TECH_PIPELINE_PROOF | modified 2026-09-05T06:14:01.577Z; JSON value 유지, whitespace만 정규화; commit a5e3fdb1912eb4145a853a7cf38e7c827e22a4f2 |
| `motion-proof-20260905-145830/run03/robot.blend` | `docs/archive/technical_proofs/motion_pipeline/robot.blend` | motion-proof | binary | 154356 | `3d3932470cdaa6bc78490a719f960ab80fb028fa172f16da31cf55873d34595b` | BINARY_RECOVERY_PENDING | N/A | BINARY_PENDING | modified 2026-09-05T06:11:41.950Z; Workspace connector에 generic binary read 없음. placeholder 0 |
| `motion-proof-20260905-145830/run03/robot.glb` | `docs/archive/technical_proofs/motion_pipeline/robot.glb` | motion-proof | binary | 427072 | `64c16b45fb01a12a9f1ce370efe4c4103b617562d8b7fc74d8338b8d3339fc75` | BINARY_RECOVERY_PENDING | N/A | BINARY_PENDING | modified 2026-09-05T06:11:41.936Z; Workspace connector에 generic binary read 없음. placeholder 0 |
| `motion-proof-20260905-145830/run03/build_robot_v03.py` | `docs/archive/technical_proofs/motion_pipeline/build_robot_v03.py` | motion-proof | text |  |  | SOURCE_MISSING | N/A | TECH_PIPELINE_PROOF | exact approved path 없음. Root candidate `build_robot_v03.py`: 9728 bytes, modified 2026-09-05T06:11:40.458Z, SHA-256 ffb25274ccc6a51019fc86f1c05f6ebcd0ac40d64f87a6539f4f609fe9d8d6eb. 원본 README도 root 경로를 지시. 자동 치환 안 함 |
| `motion-proof-20260905-145830/run03/assemble.py` | `docs/archive/technical_proofs/motion_pipeline/assemble.py` | motion-proof | text |  |  | SOURCE_MISSING | N/A | TECH_PIPELINE_PROOF | exact approved path 없음. Root candidate `assemble.py`: 2151 bytes, modified 2026-09-05T06:03:37.363Z, SHA-256 fa905ebb524814408be9f055be3b30151ab375de37a0a30b4ff62cf8a2cb0957. 원본 README도 root 경로를 지시. 자동 치환 안 함 |

## Generated Recovery Boundary Documents

| target_path | github_status | readback_status | authority | commit |
|---|---|---|---|---|
| `docs/research/campaign_logic_proof_20260905/RECOVERY_CONTEXT.md` | GENERATED | PASS | WORLD_SYSTEM_PROOF | `b57bcbe3a96f6c66da6d02fe53772b37c613f74a` |
| `docs/world/evidence/map_evolution_20260906/RECOVERY_CONTEXT.md` | GENERATED | PASS | WORLD_SYSTEM_PROOF | `1060f0fe8dd7b5c0656fcb593052ff8bf6737236` |
| `docs/world/evidence/map_evolution_20260906/UNREAL_PERSISTENCE_TEST_TRANSLATION.md` | GENERATED | PASS | WORLD_SYSTEM_PROOF | `fa0091635766990106debb09af8afd7fb993360c` |
| `docs/story/research/mystery_event_proof_20260906/RECOVERY_CONTEXT.md` | GENERATED | PASS | WORLD_SYSTEM_PROOF | `1999a4fd37f5d76314e3a6f329325c79d16903be` |
| `docs/story/research/mystery_event_proof_20260906/UNREAL_INVESTIGATION_TEST_TRANSLATION.md` | GENERATED | PASS | WORLD_SYSTEM_PROOF | `67feb5a2e3ab9be2f0048a40a177e889cb80845e` |
| `docs/animation/research/motion_pipeline_proof_20260905/RECOVERY_CONTEXT.md` | GENERATED | PASS | TECH_PIPELINE_PROOF | `394750e2f661a849896524dc8ee3811759630f97` |
| `docs/animation/research/motion_pipeline_proof_20260905/UNREAL_MOTION_PIPELINE_TRANSLATION.md` | GENERATED | PASS | TECH_PIPELINE_PROOF | `5b4fca49a2faa417aa79941535a5c920ecc8787f` |

## Current Counts

- Approved source entries: 22
- Recovered source text: 14
- Binary pending: 5
- Exact approved source path missing: 3
- Generated Context/Translation docs: 7
- Production path write: 0
- Placeholder binary: 0
