# V0.3 Remaining Cleanup Note v0.1

작성일: 2026-05-23

## 0. 목적

이 문서는 `WORLD_FOUNDATION_LOCK_V0_3.md`가 상위 기준이 된 뒤에도 작업트리에 남아 있는 문서/에셋/설정 변경을 당장 어떻게 볼지 정리한다.

삭제나 되돌리기를 지시하지 않는다. 내일 윤서와 20명 플레이어블 캐릭터 작업을 시작할 때, 낡은 기준을 잘못 읽지 않기 위한 임시 안내서다.

## 1. 오늘 정리 완료

- `main`을 `origin/main`에 푸시했다.
- 세계관 v0.3, 캐릭터 로스터 프롬프트, 캐릭터/구현 기획, 스크립트 용어 정리를 분리 커밋했다.
- `.gitignore`에 `.idea/`, `*.import`, `*.uid`를 추가했다.
- Godot/IDE 부산물은 작업트리 status에서 숨겨지게 했다.

## 2. 현재 상위 기준

캐릭터 초안, 윤서 재검토, 20명 로스터 작업은 아래 순서로 읽는다.

1. `docs/world/WORLD_FOUNDATION_LOCK_V0_3.md`
2. `docs/world/LEGACY_TERM_MIGRATION_V0_1.md`
3. `docs/world/PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md`
4. `story/06_characters/yunseo.md`

주의:

- `밥표/전원표/신호표`는 기본 UI 용어가 아니다.
- 기본 UI와 유저 노출 용어는 `식량태그/충전태그/수신태그` 계열을 우선한다.
- `밥표/전원표/신호표`는 NPC 속어, 낡은 표지, 손글씨 정산표 같은 맥락에서만 제한적으로 쓴다.
- HP 0은 사망/부활이 아니라 등록 임계와 긴급 인양이다.

## 3. 커밋 보류

아래는 아직 v0.3 기준으로 정리 전이므로 바로 커밋하지 않는다.

| 묶음 | 이유 |
| --- | --- |
| 루트의 `0_2`, `V1` 계열 기획 문서 | `밥표/전원표/신호표`, `0.2` 중심 표현이 많이 남아 있음 |
| `SYSTEM_FLOW_DIAGRAMS.md`, `WORLD_STORY_DIAGRAMS.md` | 다이어그램은 유용하지만 v0.3 태그 용어로 재작성 필요 |
| `README_GAME.md`, `RPG_ARCHITECTURE_PLAN.md` | 새 상위 기준 참조로 갱신 후 커밋 필요 |
| `story/00_source` ~ `story/05_progression` | 좋은 내용이 있으나 v0.2 기준과 섞여 있어 선별 필요 |
| `assets/art_inbox/`, `assets/style_samples/` | PMO/아트 검수 전 대량 커밋 금지 |
| tracked PNG 교체분 | 기존 런타임 에셋을 덮어쓴 상태라 이미지 검수 후 별도 커밋 |
| `project.godot` | 에디터 재저장 변경인지 실제 설정 변경인지 확인 필요 |
| `tools/*probe*.gd`, `tools/balance_sim.py`, `tools/qa_check.ps1` | 현재 용어/루프 기준으로 한 번 더 확인 필요 |

## 4. 내일 우선순위

1. 윤서 재검토는 v0.3 기준과 `story/06_characters/yunseo.md`만 우선 참조한다.
2. 20명 로스터 초안은 `PLAYABLE_CHARACTER_20_ROSTER_PROMPT_V0_1.md`를 그대로 사용한다.
3. 루트의 오래된 0.2 문서는 캐릭터 생성의 상위 기준으로 쓰지 않는다.
4. 캐릭터 작업이 안정된 뒤, 루트 다이어그램/README/아키텍처 문서를 v0.3 용어로 별도 마이그레이션한다.
5. 에셋은 캐릭터 설정이 확정된 뒤 윤서부터 다시 승인한다.

## 5. 현재 판단

작업트리에는 아직 살릴 후보가 많다. 다만 지금 가장 위험한 것은 문서 양이 아니라, 낡은 용어와 새 v0.3 기준이 섞여 캐릭터 초안이 다시 흔들리는 것이다.

따라서 당장 우선 정리는 "모두 커밋"이 아니라 "상위 기준 고정, 부산물 숨김, 보류 대상 명시"로 둔다.
