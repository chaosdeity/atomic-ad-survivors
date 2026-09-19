# 22 RECOVERY CANONICAL ROLE MAP V0.1

상태: **RECOVER 4 역할 분리 / 실제 RECOVER 실행 아님**

최신 감사의 RECOVER 4개는 동일 층위가 아니다. world-system 증거 3개와 tech-pipeline 증거 1개로 분리한다.

## WORLD SYSTEM

### campaign-logic
역할:
- campaign resource ecology
- service degradation
- inter-campaign support/dependency

허용:
- 시설/서비스의 물리 상태가 소비 capacity와 downstream service에 영향을 주는 인과 규칙
- dependency contract의 회귀검증 아이디어

금지:
- proof 수치를 실제 게임 확률로 승격
- 96 campaign 값을 자동 생성
- 전 세계 자동 dependency graph 생성

### map-evolution-proof
역할:
- direct persistence
- revisit physical state
- route / patrol consequence
- save/reload 뒤에도 유지되는 지역 상태의 최소 증거

허용:
- `persistence_profile`의 STANDARD/STRUCTURAL 의미 검증
- facility/NPC/route state의 direct persistence 참고

금지:
- E01 proof의 node 밀도를 글로벌 표준으로 승격
- Godot runtime 직접 포팅
- E02~E12 local 생성

### mystery-proof
역할:
- investigation cross-validation
- conflicting records
- incomplete conclusion / responsibility
- 기록·동의·자원·후속 의무가 결론을 바꾸는 사건 규칙

허용:
- investigation형 `gameplay_law`와 persistence 정보 충돌 규칙 참고

금지:
- 고유 사건/등장인물 자동 정사화
- C02 하나에만 종속된 세계 규칙으로 축소

## TECH PIPELINE

### motion-proof
역할:
- Blender → GLB → Unreal 제작 pipeline 참고
- failure ledger
- renderer capture / loop / grounding 기술 검증 reference

world-system 비포함:
- campaign law
- resource ecology
- human recognition
- rumor propagation
- persistence world state

**motion-proof를 world rule에 섞지 않는다.**

## Canonical 사용 규칙

| proof | canonical layer | 실제 회수 | 이번 PRELOCK |
|---|---|---|---|
| campaign-logic | World System | 금지 | 계약 근거만 반영 |
| map-evolution-proof | World System | 금지 | persistence 의미만 반영 |
| mystery-proof | World System | 금지 | investigation rule만 반영 |
| motion-proof | Tech Pipeline | 금지 | world 문서와 분리 표기 |

이번 작업은 역할만 잠근다. 파일 복사, binary 이동, Godot→Unreal production port는 0이다.
