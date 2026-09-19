# Audit Scope Used

목표: C:\workspace의 Atomic Ad Survivors 관련 Codex 작업 산출물을 인벤토리화하고 KEEP, RECOVER, ARCHIVE, DELETE CANDIDATE, REVIEW NEEDED로 분류한다.

범위:
- _codex_* 및 _codex_archive*
- R01 QA/output/temp_project
- Yunseo QA/output/worktree
- world/map/campaign 관련 작업 결과
- 현재 기준 5개 월드 문서와 비교
- 12개 광역권 x 8개 정식 캠페인, E01 40노드/37연결, E02-E12 단계적 상세화 원칙 검증

작업 규칙:
- 메타데이터를 먼저 확인하고 중복 복사본을 묶은 뒤 가치 있는 후보만 깊게 읽는다.
- 기존 프로젝트 파일은 변경하지 않는다.
- main에는 쓰지 않는다.
- 과거 Godot 구현을 현재 Unreal 제작 기준으로 자동 승격하지 않는다.
- 사용자 확정 전 제작된 게임 구조와 환경 자료를 정본으로 승격하지 않는다.
- 96개 캠페인을 재작성하거나 E02-E12를 E01 수준으로 대량 상세화하지 않는다.
- 이번 단계에서는 실제 회수, 삭제, 병합을 실행하지 않는다.

완료 결과:
인벤토리, 중복 그룹, 분류표, 회수 매니페스트, 삭제 후보 근거, 월드맵 일관성 감사, 사용자 결정 항목, 다음 실행 계획을 chatgpt-work 브랜치의 incoming/gpt_work/00_codex_audit/에 기록한다.
