# Atomic Ad Survivors Story

이 폴더는 `Atomic Ad Survivors`의 스토리, 세계관, 거점, NPC, 지역, 보스, 아이템 문체를 개발에 바로 연결하기 위한 작업 공간이다.

## 원칙

- `00_source`는 버전 고정 원전이다. 큰 방향을 바꿀 때만 새 버전을 추가한다.
- `01_bible`부터는 실제 구현과 밸런스 작업에 쓰기 쉬운 조각 문서다.
- 한 문서는 한 책임만 가진다. 예: NPC는 NPC 문서, 카드 문체는 카드 문서에 둔다.
- 긴 설정 설명보다 반복 출격, 짧은 대사, 아이템 설명, 보스 선택으로 전달 가능한 내용을 우선한다.

## 폴더 구조

```text
story/
  00_source/
    story_0.001.md
  01_bible/
    world_overview.md
    glossary.md
    factions.md
    population_model.md
    malice_in_the_environment.md
    player_experience_philosophy.md
    campaign_registration_model_0_2.md
    visible_terminology_rules_0_2.md
  02_hub/
    silence_outpost.md
    npcs.md
  03_regions/
    r01_suburb.md
    r01_boss.md
  04_content/
    trace_items.md
    run_cards.md
  05_progression/
    region_evolution_model.md
    broadcast_records_and_recovery.md
    environment_response_operations.md
    campaign_story_unit_model_0_2.md
    long_term_story_architecture.md
    local_ecology_roadmap.md
    local_mystery_layers.md
    story_trigger_schema.md
    linked_scenario_system.md
    endings.md
    run_story_hooks.md
  06_characters/
    character_long_term_model.md
    player_characters.md
    yunseo.md
    character_npc_review.md
    character_affection_monetization.md
    yunseo_0_2_playable_spec.md
  90_implementation/
    backlog.md
    region_progression_analysis_prompt.md
    story_integration_notes.md
    implementation_0_2_story_directive.md
    reward_growth_loop_0_2.md
    outpost_growth_minimum_0_2.md
    r01_suburb_content_lock_0_2.md
    character_score_upgrade_backlog.md
    godot_scope_0_2_from_story.md
    story_cross_validation_0_2.md
    playtest_observation_0_2.md
    expansion_candidates_0_3.md
    outpost_prototype_directive_0_2.md
    card_data_directive_0_2.md
    trace_reward_directive_0_2.md
    first_boss_directive_0_2.md
    story_deepening_0_2_asset_brief.md
```

## 작업 순서

1. `00_source/story_0.001.md`를 기준 원전으로 고정한다.
2. `01_bible`에 세계 법칙, 용어, 유저 노출 용어, 진영, 인구 비율, 환경 속 악의, 플레이어 경험 철학, 캠페인 등록/인양 규칙을 짧고 반복 참조 가능한 형태로 분리한다.
3. `02_hub`에 침묵 보급소와 첫 NPC 5명을 구현 가능한 데이터로 정리한다.
4. `03_regions`에 첫 지역과 첫 보스를 적/패턴/보상 단위로 정리한다.
5. `04_content`에 흔적 아이템과 런 카드 문체를 데이터화한다.
6. `05_progression/region_evolution_model.md`에 지역 재방문, 캠페인 농도, 보스 선택 후 지역 미래, 몬스터 적응 규칙을 고정한다.
7. `05_progression`에 엔딩 축, 반복 런 스토리 훅, 송출 기록/첫 회수 구조, 장기 서사 구조, 캠페인 스토리 단위 모델, 환경 반응형 운영, 로컬 미스터리 층, 트리거 규칙, 연쇄 시나리오 구조를 연결한다.
8. `06_characters`에 플레이어블 캐릭터의 적응 원리, 차징 스킬, 해금 구조를 둔다.
9. 첫 지역을 계속 확장하기 전에 `90_implementation/region_progression_analysis_prompt.md`로 전체 지역 로드맵과 재방문 구조를 검토한다.
10. `90_implementation`에 Godot 데이터 구조, UI 연결, 우선순위 백로그, 0.2 작업 지시서, 보상/성장 루프 기준을 둔다.
