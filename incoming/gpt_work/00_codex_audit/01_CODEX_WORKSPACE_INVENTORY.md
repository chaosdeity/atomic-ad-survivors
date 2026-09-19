# Atomic Ad Survivors Codex Workspace Inventory

## 집계 기준
- 감사 후보 컨테이너: **109개**
- 중복/파생 복사본 패밀리: **18개**
- A/B/C/D/E 수치는 **109개 후보 컨테이너 기준**이다.
- 상세 분류는 `02_KEEP_RECOVER_ARCHIVE_DELETE_MATRIX.md`와 `codex_asset_inventory.csv`를 따른다.

## 범위별 후보 수
- core/launch/first-10: 15
- R01: 19
- Yunseo: 59
- 독립 proof/misc: 6
- _codex_archive 역사 패키지: 10
- 현재 프로젝트 내부 `_codex_playtest`: 1
- 합계: 109

## 중복 패밀리
1. R01 background batch2
2. R01 full-map art
3. R01 full-map playtest
4. R01 production fixtures
5. R01 procedure/background temp copies
6. core loop S0/S1 pressure/reward
7. core loop S2 reward choice
8. core loop S3 reward depth
9. first-10 preflight/manual
10. launch/live-origin/PR playtest
11. Yunseo runtime-state
12. Yunseo walk-cycle
13. Yunseo walk16/guided walk
14. Yunseo walk-feel
15. Yunseo 96px
16. Yunseo default-walk
17. Yunseo layered-walk
18. Yunseo pseudo-socket

## 현재 기준
월드 감사 기준은 지정된 5개 current world 문서다. 현재 로컬 프로젝트에는 2026-09 Unreal 전환 작업이 있으며, 최종 구현 엔진은 Unreal Engine 5.8 기준으로 판정했다. Godot 산출물은 설계·검증·역사 자료로만 평가했다.

## 확인된 역사 Git 기록
- R01 procedure: `codex/r01-procedure-interactions` / `d2b122b70be2c78b446f37f9cff682f654a777f0`
- R01 full map art: `codex/r01-full-map-art-rework` / `220e0d9a251c9c3c91444fe8eb15ec2b152856d4`
- R01 background batch2 feature: `bcc28ba93274a4d18081e16afc79f1308431413a`; merge commit 기록 `0b9851596748e0b91a89368d9cba6e6129434f9e`
- Yunseo runtime-state v02, walk16 refedit, walk-feel S2 R2는 archive merge/report 기록 존재.

모든 하위 폴더의 Git 메타데이터를 직접 질의할 수 있는 인터페이스가 없어, 보고서로 확인되지 않은 branch/HEAD 값은 추정하지 않았다.
