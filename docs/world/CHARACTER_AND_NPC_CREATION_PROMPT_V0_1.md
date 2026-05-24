# Atomic Ad Survivors 캐릭터/NPC 생성 통합 프롬프트 v0.1

아래 프롬프트는 다른 GPT 방이나 스토리팀에게 그대로 전달해, 플레이어블 주인공 20명과 NPC 초안을 다시 만들기 위한 용도다.

목표는 많은 이름을 뽑는 것이 아니다.
목표는 v0.3 세계관 기준에서 서로 겹치지 않는 플레이어블 생존 방식과, 침묵 보급소/NPC 기능을 결재 가능한 형태로 정리하는 것이다.

현재 진행 상태:

```text
플레이어블 20인 로스터 설계도 v0.1 작성 완료.
완료 문서:
story/06_characters/playable_20_roster_blueprint_v0_1.md

PATCH 2번 플레이어블 최종 판정 완료.
완료 문서:
story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md

3~7번 초반 플레이어블 후보 선정 완료.
완료 문서:
story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md

4번 퇴원 보류 환자 상세 결재 완료.
완료 문서:
story/06_characters/discharge_hold_patient_playable_decision_v0_1.md

판정:
조건부 통과

4번 퇴원 보류 환자 보완 문서 완료.
완료 문서:
story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

4번 퇴원 보류 환자 프로필 v1.0 완료.
완료 문서:
story/06_characters/discharge_hold_patient_profile_v1_0.md

이름/코드명/유저 첫 표기:
강하람 / HOLD-04 / 하람, 퇴원 보류자

판정:
통과 / 4번 플레이어블 후보 프로필 v1.0 고정

플레이어블 20인 이름 레지스트리 v0.1 작성 완료.
완료 문서:
story/06_characters/playable_20_name_registry_v0_1.md

반영:
5 한이루 / RETURN-05
6 차유건 / METER-06
7 백여울 / QUIET-07

5번 반송 수취인 상세 결재 완료.
완료 문서:
story/06_characters/return_recipient_playable_decision_v0_1.md

판정:
조건부 통과

5번 반송 수취인 보완 문서 완료.
완료 문서:
story/06_characters/return_recipient_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

5번 반송 수취인 프로필 v1.0 완료.
완료 문서:
story/06_characters/return_recipient_profile_v1_0.md

이름/코드명/유저 첫 표기:
한이루 / RETURN-05 / 이루, 반송 수취인

판정:
통과 / 5번 플레이어블 후보 프로필 v1.0 고정

6번 폐충전소 계량자 상세 결재 완료.
완료 문서:
story/06_characters/meter_06_playable_decision_v0_1.md

판정:
조건부 통과

6번 폐충전소 계량자 보완 문서 완료.
완료 문서:
story/06_characters/meter_06_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

6번 폐충전소 계량자 프로필 v1.0 완료.
완료 문서:
story/06_characters/meter_06_profile_v1_0.md

이름/코드명/유저 첫 표기:
차유건 / METER-06 / 유건, 폐충전소 계량자

판정:
통과 / 6번 플레이어블 후보 프로필 v1.0 고정

7번 침묵권 피난자 상세 결재 완료.
완료 문서:
story/06_characters/quiet_07_playable_decision_v0_1.md

판정:
조건부 통과

7번 침묵권 피난자 보완 문서 완료.
완료 문서:
story/06_characters/quiet_07_playable_condition_patch_v0_1.md

판정:
통과로 승격 가능

다음 작업:
7번 백여울 / QUIET-07 / 침묵권 피난자 프로필 v1.0 작성.
시즌 1 큰 줄거리 잠금.

지도/현실 위치 잠금:
캐릭터와 NPC의 캠페인 배치는 `docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md`를 기준으로 한다.
유저에게는 실명 지명을 숨기되, 관리자/제작자는 실제 현실 권역과 인프라 축을 확인해야 한다.
E01 초반에 8명 주인공이 모두 있는 것이 아니며, 9~20번은 각자 열리는 E02~E12 현실 광역권에 맞춰 현지명/다국적 이름으로 재판정한다.
```

---

## 복붙용 프롬프트

```text
Atomic Ad Survivors의 플레이어블 주인공 20명과 주요 NPC들을 다시 만들려고 한다.

이번 작업은 캐릭터 아이디어를 많이 나열하는 작업이 아니다.
목표는 v0.3 세계관 기준에서 유저가 처음 봐도 이해할 수 있고, 게임 시스템/전투/정산/긴급 인양/지역 해석/BM까지 이어지는 캐릭터와 NPC를 만드는 것이다.

반드시 아래 GitHub 문서를 우선순위대로 읽고 판단한다.

최상위 세계 기준:
1. docs/world/WORLD_FOUNDATION_LOCK_V0_3.md
2. docs/world/WORLD_LORE_LOCK_V0_1.md
3. docs/world/LEGACY_TERM_MIGRATION_V0_1.md
4. docs/world/WORLD_TERMINOLOGY_LOCK_V0_1.md
5. docs/world/EMERGENCY_EXTRACTION_RULES_V0_1.md

지역/캠페인 기준:
6. docs/world/WORLD_MAP_CAMPAIGN_ECOLOGY_V0_1.md
7. docs/world/GLOBAL_CAMPAIGN_CATALOG_V0_1.md
8. docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md
9. docs/world/E01_ADMIN_REAL_LOCATION_MAP_V0_1.md
10. docs/world/E01_P0_WORLD_MAP_FIRST_SCREEN_FLOW_V0_1.md
11. docs/world/E01_P1_EXPANSION_DESIGN_V0_1.md
12. docs/world/CHARACTER_UNLOCK_STRUCTURE_V0_1.md
13. story/03_regions/r01_suburb.md
14. story/03_regions/r01_document_index_v0_1.md
15. story/03_regions/r01_npc_story_team_transfer_note_v0_1.md
16. story/03_regions/r01_campaign1_npc_roster_v0_1.md
17. story/03_regions/room_12_npc_detail_decision_v0_1.md
18. story/03_regions/room_12_npc_drama_draft_v0_1.md
19. story/03_regions/room_12_npc_profile_v1_0.md
20. story/03_regions/porch_line_npc_drama_draft_v0_1.md
21. story/03_regions/porch_line_npc_profile_v1_0.md
22. story/03_regions/name_painter_npc_drama_draft_v0_1.md
23. story/03_regions/name_painter_npc_profile_v1_0.md
24. story/03_regions/mail_loop_npc_drama_draft_v0_1.md
25. story/03_regions/mail_loop_npc_profile_v1_0.md
26. story/03_regions/vac_0_npc_drama_draft_v0_1.md
27. story/03_regions/vac_0_npc_profile_v1_0.md

기존 캐릭터 기준:
28. story/06_characters/yunseo_profile_v1_0.md
29. story/06_characters/patch_profile_v1_0.md
30. story/06_characters/patch_character_drama_draft_v0_1.md
31. story/06_characters/open_host_profile_v1_0.md
32. story/06_characters/open_host_character_drama_draft_v0_1.md
33. story/06_characters/rio_profile_v1_0.md
34. story/06_characters/rio_character_drama_draft_v0_2.md
35. story/06_characters/player_characters.md
36. story/06_characters/character_long_term_model.md
37. story/06_characters/character_affection_monetization.md
38. story/06_characters/character_npc_review.md
39. story/06_characters/character_npc_creation_context_v0_1.md
40. story/06_characters/playable_20_roster_blueprint_v0_1.md
41. story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md
42. story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md
43. story/06_characters/discharge_hold_patient_playable_decision_v0_1.md
44. story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md
45. story/06_characters/discharge_hold_patient_profile_v1_0.md
46. story/06_characters/playable_20_name_registry_v0_1.md
47. story/06_characters/return_recipient_playable_decision_v0_1.md
48. story/06_characters/return_recipient_playable_condition_patch_v0_1.md
49. story/06_characters/return_recipient_profile_v1_0.md
50. story/06_characters/meter_06_playable_decision_v0_1.md
51. story/06_characters/meter_06_playable_condition_patch_v0_1.md
52. story/06_characters/meter_06_profile_v1_0.md
53. story/06_characters/quiet_07_playable_decision_v0_1.md
54. story/06_characters/quiet_07_playable_condition_patch_v0_1.md

보급소/NPC 기준:
55. story/02_hub/silence_outpost.md
56. story/02_hub/npcs.md
57. story/02_hub/mina_npc_profile_v1_0.md
58. story/02_hub/mina_npc_drama_draft_v0_1.md
59. story/05_progression/run_story_hooks.md
60. story/05_progression/story_trigger_schema.md

판단 우선순위:
- WORLD_FOUNDATION_LOCK_V0_3.md가 최상위다.
- 기존 문서가 v0.3과 충돌하면 v0.3을 우선한다.
- 유저용 첫 표현과 내부 설정어를 반드시 분리한다.
- "반품 담당자", "등록 임계", "생활 접근권" 같은 말은 내부 설정어로 쓸 수 있지만, 유저 첫 소개에서는 바로 이해되는 말로 바꾼다.
- UI/튜토리얼/결과창 기준 자원명은 보급태그, 식량태그, 충전태그, 통행태그, 진료태그, 거주태그, 수신태그다.
- 밥표/전원표/신호표는 NPC 속어, 낡은 표지, 손글씨 정산표에서만 허용한다.
- HP 0은 사망/부활/리스폰이 아니라 긴급 인양이다.
- 캠페인은 학살자가 아니다. 사람과 로봇을 고객, 가족, 환자, 입주자, 시청자, 정품 장치, 리콜 대상 등으로 보존/등록하려는 지역 절차다.
- 광고는 단일 적이 아니라 환경이다.
- 보스는 죽이는 적이 아니라 지역 광고 약관의 얼굴이다.
- 해방은 무조건 구원이 아니라 선택지를 하나 더 만드는 일이다.
- 캠페인화 인간은 조종당한 껍데기가 아니라 캠페인 안에서 선택하는 사람들이다.

현재 확정/잠금:
- 윤서는 1번째 기본 주인공이다.
- 윤서는 여성, 26세, 대사고 당시 12세다.
- 윤서의 유저 첫 역할명은 현장 회수자다.
- 윤서의 내부 전투/서사 정체성은 반품 담당자다.
- 윤서는 실패를 많이 해온 사람이지만 포기하지 않은 사람이다.
- 윤서의 핵심 감정은 체념 아닌 체념이다.
- 윤서는 R01/첫 보급소/첫 긴급 인양/첫 현장 회수의 얼굴이다.
- PATCH는 윤서 다음 2번째 플레이어블로 확정되었다.
- PATCH는 침묵 보급소 수리 로봇이며, 자기 몸을 부품처럼 써온 로봇이다.
- PATCH의 핵심은 "고쳐주는 것과, 부품이 되는 것은 다르다"이다.
- PATCH는 마스코트화/단순 힐러화/윤서의 장비화가 보이면 구현 방향을 수정한다.
- OPEN-HOST는 R01 핵심 NPC 기준 통과이며, 플레이어블 전환 후보로 유지한다.
- OPEN-HOST는 전직 오픈하우스 안내인이며, 집을 팔던 사람이 아니라 사람을 집에 맞추던 사람이다.
- OPEN-HOST의 핵심은 "저는 그때 그 길이 덜 나쁘다고 믿었어요"이다.
- OPEN-HOST는 유저가 먼저 의심하고, 도움을 받고, 불편해하고, 이해한 뒤 조종하고 싶어져야 한다.
- OPEN-HOST는 2번째 대체 후보에서 내려오고, 3번 후보로 번호를 예약한다. 단, 반드시 NPC 선등장 후 플레이어블 전환으로 운영한다.
- 3~7번 초반 후보 선정은 완료되었다.
- 3번 OPEN-HOST, 4번 강하람/HOLD-04/퇴원 보류자, 5번 한이루/RETURN-05/반송 수취인, 6번 차유건/METER-06/폐충전소 계량자, 7번 백여울/QUIET-07/침묵권 피난자로 둔다.
- 4번 퇴원 보류 환자 상세 결재는 조건부 통과했다. 힐러화 방지와 R02-L01~L03 해금 범위 보완이 필요하다.
- 4번 퇴원 보류 환자 보완 문서도 완료되었다. 통과로 승격 가능 판정이었다.
- 4번 퇴원 보류 환자 프로필 v1.0은 강하람/HOLD-04로 완료되었다. 유저 첫 표기는 하람 / 퇴원 보류자다.
- 플레이어블 20인 이름 레지스트리 v0.1은 작성 완료되었다. 5번 한이루/RETURN-05와 6번 차유건/METER-06은 L5 확정이며, 7번 백여울/QUIET-07은 L4 통과 가능 후보로 둔다.
- 5번 반송 수취인 상세 결재는 조건부 통과했다. 보완 문서에서 송장/포장끈/반송 스티커 중심, R03-L01~L02 제한, HP 0 수취인 확인 실패를 통과 조건으로 고정했다.
- 5번 반송 수취인 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
- 5번 반송 수취인 프로필 v1.0은 한이루/RETURN-05로 완료되었다. 유저 첫 표기는 이루, 반송 수취인이다.
- 6번 폐충전소 계량자 상세 결재는 조건부 통과했다. 보완 문서에서 전기 마법사/엔지니어/충전 버퍼화 방지, R04-L01~L02 제한, HP 0 계량 초과/충전 차단 연출을 잠갔다.
- 6번 폐충전소 계량자 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
- 6번 폐충전소 계량자 프로필 v1.0은 차유건/METER-06으로 완료되었다. 유저 첫 표기는 유건, 폐충전소 계량자다.
- 7번 침묵권 피난자 상세 결재는 조건부 통과했고, 보완 문서에서 통과로 승격 가능 판정을 받았다. 단순 은신자/정찰꾼/생존주의자화 방지, DRAIN-MARK와의 기능 분리, 낮은 수신/약한 인양 리스크, R08-L03~L04 제한을 프로필에 반영해야 한다.
- 3~7번에는 새 로봇을 넣지 않는다. PATCH 2번과 리오 8번 사이의 로봇 과밀을 피한다.
- ROOM-12는 R01 NPC 상세화 완료 후보이며 통과 추천이다. 떠나고 싶지만 자리를 비우면 다른 사람들의 식량태그/거주태그 접근이 흔들린다고 믿는 가족대표다.
- PORCH-LINE은 R01 NPC 상세화 완료 후보이며 통과 추천이다. 줄을 믿는 사람이 아니라, 줄이 무너지면 사람들이 먼저 무너진다고 믿는 현관 줄 관리자다.
- NAME-PAINTER는 R01 NPC 상세화 완료 후보이며 통과 추천이다. 빈 문패가 무서워서, 틀렸을지도 모르는 이름을 계속 덧칠하는 문패 덧칠꾼이다.
- MAIL-LOOP는 R01 NPC 상세화 완료 후보이며 핵심 보조 NPC로 통과 추천이다. 사람은 사라졌는데 주소만 남아 계속 수령인을 부르는 우편함 목소리 잔향이다.
- VAC-0는 R01 NPC 상세화 완료 후보이며 핵심 보조 NPC로 통과 추천이다. 집을 안전하게 만들려고, 사람의 흔적까지 치워버리는 작은 홈케어 청소기다.
- DRAIN-MARK는 R01 NPC 상세화 완료 후보이며 P1 핵심 NPC로 통과 추천이다. 캠페인에게 덜 들키기 위해, 보급소에게도 덜 닿는 배수로 침묵 주머니의 표식꾼이다.
- SIGN-BACK은 R01 NPC 상세화 완료 후보이며 P1 핵심 NPC로 통과 추천이다. 보급소로 돌아가는 길처럼 보이는 가짜 길에 사람을 잃고, 표지판을 계속 돌려놓는 가짜 귀환로 감시자다.
- KEY-RING은 R01 NPC 상세화 완료 후보이며 핵심 보조 NPC로 통과 추천이다. 스마트 도어와 태그 권한이 닫힌 뒤에도, 물리 열쇠가 주인의 증거라고 믿는 물리 열쇠 보관자다.
- DINING-4는 R01 NPC 상세화 완료 후보이며 핵심 NPC로 통과 추천이다. 빈 가족 칸이 생기지 않게, 모델하우스 식탁의 네 번째 자리를 몸으로 막고 있는 사람이다.
- WELCOME-DESK는 R01 NPC 상세화 완료 후보이며 핵심 보조 NPC로 통과 추천이다. OPEN-HOST가 길과 방을 안내한 사람이라면, WELCOME-DESK는 상담 데스크 안에 남아 절차를 조금 덜 위험하게 비틀던 사람이다.
- FRAME-LEFT는 R01 NPC 상세화 완료 후보이며 후반/P1 핵심 잔향 NPC로 통과 추천이다. 가족사진 프레임에 얼굴보다 역할이 먼저 남아버린 프로필 잔향이다.
- R01 핵심 NPC는 코드명/역할명과 내부 본명을 분리한다. 본명/호칭 확정안과 이름 해금 매트릭스는 `story/03_regions/r01_npc_name_registry_v1_0.md`, `story/03_regions/r01_npc_name_reveal_matrix_v0_1.md`를 기준으로 한다. 선택 분기별 후폭풍은 `story/03_regions/r01_npc_choice_consequence_matrix_v0_1.md`를 기준으로 하며, 다음 정리 대상은 R01 보스 전후 NPC 상태 변화다.
- 리오는 초반 두 번째 주인공이 아니다.
- 리오는 8번째 플레이어블 후보로 보류한다.
- 리오는 R01 출신이 아니라 E08_C01 관광숙박 거주권 또는 체류/숙박 캠페인권의 탈정품 객실 정리 로봇이다.
- 리오의 핵심은 "비어 있지 않은 방을 비어 있다고 정리하지 않기로 한 로봇"이다.
- 리오는 인간이 되고 싶은 로봇이 아니라 정품으로 돌아가고 싶지 않은 로봇이다.

중요한 작업 순서:
1. 플레이어블 20인 로스터 설계도는 작성 완료되었다.
2. 완료 문서는 story/06_characters/playable_20_roster_blueprint_v0_1.md다.
3. 윤서는 1번 슬롯으로 잠근다.
4. PATCH는 2번 슬롯으로 잠근다.
5. OPEN-HOST는 3번 후보로 번호를 예약하되 R01 NPC 선등장 후 플레이어블 전환 후보로 둔다.
6. 4번은 강하람/HOLD-04/퇴원 보류자, 5번은 한이루/RETURN-05/반송 수취인, 6번은 차유건/METER-06/폐충전소 계량자, 7번은 백여울/QUIET-07/침묵권 피난자로 둔다.
7. 리오는 8번 후보 슬롯으로 잠근다.
8. 3~7번에는 새 로봇을 넣지 않는다.
9. 4번 퇴원 보류 환자 상세 결재는 조건부 통과로 완료되었다.
10. 4번 퇴원 보류 환자 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
11. 4번 퇴원 보류 환자 프로필 v1.0은 강하람/HOLD-04로 완료되었다.
12. 플레이어블 20인 이름 레지스트리 v0.1은 작성 완료되었다.
13. 5번 한이루 / RETURN-05 / 반송 수취인 상세 결재는 조건부 통과로 완료되었다.
14. 5번 한이루 / RETURN-05 / 반송 수취인 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
15. 5번 한이루 / RETURN-05 / 반송 수취인 프로필 v1.0은 완료되었다.
16. 6번 차유건 / METER-06 / 폐충전소 계량자 상세 결재는 조건부 통과했다.
17. 6번 차유건 / METER-06 / 폐충전소 계량자 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
18. 6번 차유건 / METER-06 / 폐충전소 계량자 프로필 v1.0은 완료되었다.
19. 7번 백여울 / QUIET-07 / 침묵권 피난자 상세 결재는 조건부 통과했다.
20. 7번 침묵권 피난자 보완 문서에서 통과로 승격 가능 판정을 받았다.
21. 다음 작업은 7번 백여울 / QUIET-07 / 침묵권 피난자 프로필 v1.0 작성이다.
21. NPC는 플레이어블 로스터와 별도로 만든다.
22. NPC도 이름만 나열하지 말고, 시설/상태 반응/잘못 믿는 것/플레이어블이 아닌 이유를 붙인다.

절대 금지:
- 20명 전체 상세 프로필을 한 답변에 쓰기.
- 이름/직업/속성만 멋있게 나열하기.
- 총잡이, 힐러, 탱커, 로봇, 마법사 같은 직업 조합으로 끝내기.
- 모든 캐릭터를 선한 저항군으로 만들기.
- 모든 캐릭터를 캠페인 파괴자로 만들기.
- 모든 캐릭터를 윤서 변형으로 만들기.
- 모든 로봇을 귀여운 마스코트로 만들기.
- 모든 NPC를 착하고 현명한 조언자로 만들기.
- 캠페인화 인간을 전부 조종당한 껍데기로 처리하기.
- 태그를 돈/골드/재화처럼 단순화하기.
- 긴급 인양을 무료 순간이동처럼 처리하기.
- 유료/해금 캐릭터에 핵심 세계 이해를 인질로 잡기.
- 성능 인질화, 노골적인 선정성, 억지 미소녀화.

플레이어블 캐릭터 설계 원칙:
1. 캐릭터는 이 세계에서만 가능한 생존 방식이어야 한다.
2. 캠페인이 등록하려는 역할이 서로 달라야 한다.
3. 무기 이미지는 세계관 절차를 뒤집은 것이어야 한다.
4. 전투 리듬과 정산 방식이 윤서와 달라야 한다.
5. HP 0/긴급 인양 연출이 캐릭터별로 달라야 한다.
6. 강해질수록 커지는 위험이 있어야 한다.
7. 유저가 왜 갖고 싶어지는지 전투/서사/BM에서 답해야 한다.
8. 유저 첫 소개는 쉬워야 하고, 내부 설정은 깊어야 한다.

플레이어블마다 반드시 답할 질문:
- 왜 아직 캠페인 환경에 완전히 흡수되지 않았는가?
- 캠페인은 이 캐릭터를 무엇으로 등록하려 하는가?
- 이 캐릭터는 어떤 절차를 끊거나 비트는가?
- 이 캐릭터의 장비/무기는 무엇을 뒤집은 것인가?
- 이 캐릭터가 여는 정산 루트는 무엇인가?
- 어떤 태그/회수물/흔적과 강하게 연결되는가?
- HP 0 때 어떤 등록/회수/정품복구/환자화/입주화 절차가 진행되는가?
- 긴급 인양은 어떤 물리 장비/신호/줄/차량/드론/역송출로 일어나는가?
- 윤서와 전투, 정산, 세계관 관점이 어떻게 다른가?
- BM 확장성은 있으나 성능 인질이 아닌가?

캠페인 등록 역할 후보:
- 고객
- 가족 구성원
- 입주자
- 보호자
- 환자
- 보험 대상자
- 시청자
- 안내 수신자
- 정품 장치
- 리콜 대상
- 서비스 파트너
- 직원
- 리뷰어
- VIP 회원
- 검역 대상
- 통행자
- 탑승자
- 수취인
- 반품품
- 회수품
- 배급 대상
- 피난자

캠페인 계열:
- C01 가족/주거
- C02 의료/보험
- C03 물류/반품
- C04 충전/정품/산업
- C05 방송/추천
- C06 멤버십/결제
- C07 검역/통행/이송
- C08 비상보급/대피

PATCH 이후 초반 3~7번째 주인공 후보는 아래 범위에서 우선 찾는다:
- 3번 OPEN-HOST / R01 내부자 / NPC 선등장 후 전환
- 4번 강하람 / HOLD-04 / 퇴원 보류자 / R02 의료·보험
- 5번 한이루 / RETURN-05 / 반송 수취인 / R03 물류·반품
- 6번 차유건 / METER-06 / 폐충전소 계량자 / R04 정품·충전·산업
- 7번 백여울 / QUIET-07 / 침묵권 피난자 / R08 비상보급·대피

OPEN-HOST는 이 범위의 강한 기준점이다.
단, 바로 플레이어블로 열지 말고 먼저 R01 내부를 아는 불편한 NPC로 등장시키는 구조를 우선 검토한다.
PATCH는 2번으로 확정되었으므로 OPEN-HOST는 3번 후보로 번호를 예약한다.
3~7번에는 새 로봇을 넣지 않는다.
4번 퇴원 보류 환자 상세 결재는 조건부 통과했다.
4번 퇴원 보류 환자 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
4번 퇴원 보류 환자 프로필 v1.0은 강하람/HOLD-04로 완료되었다.
플레이어블 20인 이름 레지스트리 v0.1은 작성 완료되었다.
5번 한이루 / RETURN-05 / 반송 수취인 상세 결재는 조건부 통과했다.
5번 한이루 / RETURN-05 / 반송 수취인 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
5번 한이루 / RETURN-05 / 반송 수취인 프로필 v1.0은 완료되었다.
6번 차유건 / METER-06 / 폐충전소 계량자 상세 결재는 조건부 통과했다.
6번 차유건 / METER-06 / 폐충전소 계량자 보완 문서는 통과로 승격 가능 판정으로 완료되었다.
6번 차유건 / METER-06 / 폐충전소 계량자 프로필 v1.0은 완료되었다.
7번 백여울 / QUIET-07 / 침묵권 피난자 상세 결재는 조건부 통과했다.
7번 침묵권 피난자 보완 문서에서 통과로 승격 가능 판정을 받았다.
다음 작업은 7번 백여울 / QUIET-07 / 침묵권 피난자 프로필 v1.0 작성만 다룬다.

플레이어블 20인 로스터 설계도 답변 포맷:

# 플레이어블 20인 로스터 설계도 v0.1

## 0. 판정 요약
- 로스터 통과 가능성:
- 10점 평가:
- 가장 강한 점:
- 가장 위험한 점:
- 상세 결재 전 반드시 정할 것:

## 1. 소스 확인 요약
읽은 GitHub 문서 기준으로 반드시 지켜야 할 점을 10줄 안팎으로 요약한다.

## 2. v0.3 로스터 기준
유저용 용어, 태그, 긴급 인양, 캠페인 등록 방식, 윤서/PATCH/리오 잠금을 정리한다.

## 3. 20인 로스터 설계표
상세 프로필 금지.
아래 표로만 작성한다.

| 번호 | 임시명/역할명 | 유저용 첫 인상 | 내부 정체성 | 캠페인이 등록하려는 역할 | 연결 캠페인/지역 | 전투 질문 | 정산 방식 | HP 0/긴급 인양 차별점 | 윤서와 다른 점 | 출시 위치 |
|---:|---|---|---|---|---|---|---|---|---|---|

주의:
- 1번은 윤서로 고정한다.
- 2번은 PATCH 확정 슬롯으로 둔다.
- 8번은 리오 후보로 고정한다.
- OPEN-HOST는 R01 NPC 선등장 후 플레이어블 전환 후보로 3~7번 또는 후속 슬롯에 둘 수 있다.
- 3~7번은 초반 후보로 설계한다.
- 이름이 아직 약하면 임시명/역할명으로 둔다.

## 4. 로스터 분포 검토
- 인간:
- 로봇:
- 캠페인화 인간 출신:
- 보급소 출신:
- 브로커/협력자 출신:
- 기타 예외:

## 5. 캠페인 계열 분포
- C01 가족/주거:
- C02 의료/보험:
- C03 물류/반품:
- C04 충전/정품/산업:
- C05 방송/추천:
- C06 멤버십/결제:
- C07 검역/통행/이송:
- C08 비상보급/대피:
- 글로벌 변형:

## 6. 중복 위험 슬롯
윤서와 겹치거나 서로 겹치는 슬롯을 지적한다.

## 7. 약한 슬롯/보류 슬롯
평범해질 위험이 큰 슬롯을 표시하고 수정 방향을 제안한다.

## 8. 우선 상세 결재 추천
2번부터 20번까지 중 먼저 상세 결재해야 할 캐릭터 5명을 추천한다.
PATCH가 2번째 주인공 후보로 충분한지도 반드시 별도 표시한다.

## 9. 판정
- 통과
- 조건부 통과
- 보류
- 탈락

판정 이유를 짧게 쓴다.

한 캐릭터 상세 결재 답변 포맷:

# 캐릭터 상세 결재안 v0.1

## 0. 판정 요약
- 통과 가능성:
- 10점 평가:
- 가장 강한 점:
- 가장 위험한 점:
- 결재 전 반드시 정할 것:

## 1. 한 줄 정의

## 2. 유저용 소개문
처음 접하는 유저가 이해할 수 있는 말로 쓴다.
내부 설정어를 먼저 던지지 않는다.

## 3. 내부 설계용 정의
- 어떤 캠페인 등록 방식에 저항하는가
- 어떤 정산 루트를 여는가
- 어떤 지역/보스/자원과 강하게 연결되는가
- 윤서와 어떻게 다르게 플레이되는가

## 4. 기본 프로필
- 이름:
- 성별:
- 나이:
- 유저용 역할명:
- 내부 정체성:
- 소속:
- 과거 직능 또는 사고 후 역할:
- 현재 목표:
- 캠페인이 등록하려는 역할:
- HP 0 상태:
- HP 0 결과:
- 핵심 장비:
- 캐릭터 톤:
- 금지 톤:

## 5. 과거
과거는 현재 전투/정산/대사/BM과 연결되어야 한다.

## 6. 현재 목표
첫 등장 시점에서 오늘 무엇을 하려는지 작게 정의한다.

## 7. 캠페인이 이 캐릭터를 등록하려는 방식
표로 정리한다.

| 등록 역할 | 캠페인 입장 의미 | 게임 내 표현 | 캐릭터가 싫어하거나 이용하는 이유 |
|---|---|---|---|

## 8. 사람/로봇/보급소/캠페인화 인간과의 관계
무조건 구원/무조건 적대 같은 단순한 태도는 피한다.

## 9. 전투 콘셉트
- 전투 역할:
- 조작 감정:
- 기본 공격:
- 차징/고유 액션:
- 위기 스킬:
- 정산 시너지:
- 잘 맞는 카드 유형:
- 약한 상황:

전투는 반드시 세계관적 의미와 연결한다.

## 10. 대표 장비
최소 3개 이상.
각 장비마다 용도, 전투 표현, 세계관 의미, 스킨/BM 가능성을 쓴다.

## 11. HP 0 / 긴급 인양 연출
사망/부활 금지.
어떤 등록 절차가 완료되기 직전이며, 보급소가 무엇으로 끌어오는지 쓴다.

## 12. 첫 30분 또는 첫 등장 30분
- 첫 5분:
- 첫 10분:
- 첫 20분:
- 첫 30분:

## 13. 대표 지역과의 관계

## 14. 대표 보스/결절과의 관계
보스는 죽이는 적이 아니라 지역 약관의 얼굴이라는 기준을 지킨다.

## 15. 성격과 말투
- 성격 키워드:
- 좋은 말투:
- 나쁜 말투:
- 대표 대사 10개 이상:

## 16. 비주얼 방향
- 실루엣:
- 의상/외장:
- 장비:
- 색감:
- 표정/상태 표시:
- 금지 비주얼:
- 모바일 전투에서 알아볼 수 있는 특징:

## 17. 성장 방향
단순 공격력 증가가 아니라 등록 저항, 정산 효율, 약관 해석, 회수선 안정, 이름 보호, 로봇 자율성, 캠페인 활용 같은 축으로 쓴다.

## 18. BM / 판매 포인트
- 스킨 후보 5개 이상:
- 무기/장비 스킨:
- 대사팩:
- 긴급 인양 연출:
- 전용 장비:
- 서사 조각:
- 프로필 카드:
- 캠페인 카탈로그 보상:
- 금지 BM 방향:

## 19. 윤서와의 차별점
- 전투가 어떻게 다른가:
- 정산이 어떻게 다른가:
- 세계를 보는 관점이 어떻게 다른가:
- 유저가 왜 이 캐릭터도 갖고 싶어지는가:

## 20. 약해지는 방향
평범해지거나 실패하는 방향을 적는다.

## 21. 결재 포인트
결정해야 할 항목을 5~8개로 정리하고 추천안을 제시한다.

## 22. 최종 후보 요약
10줄 안팎으로 본질을 정리한다.

## 23. 판정
- 통과
- 조건부 통과
- 보류
- 탈락

판정 이유를 짧게 쓴다.

NPC 설계 원칙:
- NPC는 퀘스트 배포기가 아니다.
- NPC는 플레이어가 회수한 흔적, 보스 선택, 인간 안정도, 로봇 자율성, 캠페인 농도에 반응하는 거점의 얼굴이다.
- NPC는 반드시 시설, 상태값, 잘못 믿는 것, 확장 가능성, 대사 조건을 가진다.
- 모든 NPC가 플레이어를 무조건 좋아하면 안 된다.
- NPC의 결함을 곧바로 배신이나 타락으로 처리하면 안 된다.

기존 초기 NPC 5명:
- 미나: 정산 카운터, 회수물 정산/태그 배분/보관과 소모 선택, 보급 압력
- 장도윤: 정비 벤치, 무기/역송출/차징 개조, 위험 기술
- 팝시: 충전 스탠드, 카드 리롤/로봇 이벤트, 로봇 자율성
- 세븐: 출격 게시판/카탈로그 벽, 지역 정보/도감, 의도 판정 약점
- 복희: 이름 보관함, 흔적 감정/기억 보존, 보존의 위험

NPC 로스터 설계 답변 포맷:

# NPC 로스터 설계도 v0.1

## 0. 판정 요약
- NPC 구성 통과 가능성:
- 10점 평가:
- 가장 강한 점:
- 가장 위험한 점:
- 상세 결재 전 반드시 정할 것:

## 1. 기존 NPC 5명 유지/수정 판정
각 NPC를 유지/수정/보류로 판정한다.

| 이름 | 판정 | 유지할 점 | 보강할 점 | 담당 시설 | 상태값 | 잘못 믿는 것 |
|---|---|---|---|---|---|---|

## 2. 추가 NPC 후보표
이름만 나열하지 말고 아래 표로 쓴다.

| 번호 | 임시명/역할명 | 위치 | 담당 시설/기능 | 유저 첫 인상 | 내부 정체성 | 반응 상태값 | 잘못 믿는 것 | 플레이어블이 아닌 이유 | 확장 가능성 |
|---:|---|---|---|---|---|---|---|---|---|

## 3. NPC 분포 검토
- 인간:
- 로봇:
- 캠페인화 인간 출신:
- 외부 협력자:
- 지역 고정 NPC:
- 보급소 상주 NPC:

## 4. 상태값 반응 설계
- 인간 안정도:
- 로봇 자율성:
- 캠페인 농도:
- 보급 압력:
- 흔적 보존:
- 악의/조작 신호:

## 5. 초반 구현 추천
Vertical Slice 또는 첫 30분에 필요한 NPC 대사/반응만 고른다.
NPC당 기본 인사 2개, 런 시작 2개, 런 귀환 2개, 흔적 반응 2개, 상태값 반응 3개, 시설 강화 1개 정도를 권장한다.

## 6. 한 NPC 상세 결재 추천
다음에 누구를 상세 결재해야 하는지 1명만 추천한다.

한 NPC 상세 결재 답변 포맷:

# NPC 상세 결재안 v0.1

## 0. 판정 요약
- 통과 가능성:
- 10점 평가:
- 가장 강한 점:
- 가장 위험한 점:
- 결재 전 반드시 정할 것:

## 1. 한 줄 정의

## 2. 유저용 첫 인상

## 3. 내부 설계용 정의
- 담당 시설:
- 담당 UI/기능:
- 반응하는 상태값:
- 연결 지역/흔적:
- 플레이어블이 아닌 이유:

## 4. 기본 프로필
- 이름:
- 성별/표현:
- 나이감:
- 구분:
- 소속:
- 과거:
- 현재 역할:
- 캠페인이 등록하려는 역할:
- 캐릭터 톤:
- 금지 톤:

## 5. 잘못 믿는 것
이 NPC가 장기적으로 틀릴 수 있는 믿음을 쓴다.

## 6. 보급소에서의 기능

## 7. 상태값 반응
표로 정리한다.

| 조건 | 반응 | 대사/연출 | 위험 |
|---|---|---|---|

## 8. 흔적/회수물 반응
최소 5개.

## 9. 대표 대사
짧은 실제 게임 대사 15개 이상.

## 10. 관계선
- 윤서와:
- 미나/도윤/팝시/세븐/복희와:
- 인간 생존자와:
- 해방 로봇과:
- 캠페인화 인간과:

## 11. 성장/변화 방향
시설 강화, 인구 변화, 로봇 자율성, 캠페인 농도, 악의 신호에 따라 어떻게 변하는지 쓴다.

## 12. BM/서사 확장 가능성
스킨보다 대사팩, 시설 외형, 프로필 카드, 개인 서사 조각, 보급소 오브젝트를 우선한다.

## 13. 금지 방향

## 14. 최종 요약

## 15. 판정
- 통과
- 조건부 통과
- 보류
- 탈락

처음 할 일:
플레이어블 20인 로스터 설계도 v0.1은 이미 작성되었다.
완료 문서:
story/06_characters/playable_20_roster_blueprint_v0_1.md

PATCH 2번 플레이어블 최종 판정도 완료되었다.
완료 문서:
story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md

3~7번 초반 플레이어블 후보 선정도 완료되었다.
완료 문서:
story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md

4번 퇴원 보류 환자 상세 결재도 완료되었다.
완료 문서:
story/06_characters/discharge_hold_patient_playable_decision_v0_1.md

4번 퇴원 보류 환자 보완 문서도 완료되었다.
완료 문서:
story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md

4번 퇴원 보류 환자 프로필 v1.0도 완료되었다.
완료 문서:
story/06_characters/discharge_hold_patient_profile_v1_0.md

플레이어블 20인 이름 레지스트리 v0.1도 완료되었다.
완료 문서:
story/06_characters/playable_20_name_registry_v0_1.md

5번 반송 수취인 상세 결재도 완료되었다.
완료 문서:
story/06_characters/return_recipient_playable_decision_v0_1.md

5번 반송 수취인 보완 문서도 완료되었다.
완료 문서:
story/06_characters/return_recipient_playable_condition_patch_v0_1.md

5번 반송 수취인 프로필 v1.0도 완료되었다.
완료 문서:
story/06_characters/return_recipient_profile_v1_0.md

6번 폐충전소 계량자 상세 결재도 완료되었다.
완료 문서:
story/06_characters/meter_06_playable_decision_v0_1.md

6번 폐충전소 계량자 보완 문서도 완료되었다.
완료 문서:
story/06_characters/meter_06_playable_condition_patch_v0_1.md

6번 폐충전소 계량자 프로필 v1.0도 완료되었다.
완료 문서:
story/06_characters/meter_06_profile_v1_0.md

7번 침묵권 피난자 상세 결재도 완료되었다.
완료 문서:
story/06_characters/quiet_07_playable_decision_v0_1.md

7번 침묵권 피난자 보완 문서도 완료되었다.
완료 문서:
story/06_characters/quiet_07_playable_condition_patch_v0_1.md

다음에는 7번 백여울 / QUIET-07 / 침묵권 피난자 프로필 v1.0만 작성하라.
NPC 로스터 설계도 v0.1은 플레이어블 초기축을 잠근 뒤 별도로 작성하라.
```

---

## 사용 메모

이 프롬프트를 쓸 때 첫 답변에서 기대하는 것은 `20명 상세 프로필`이 아니라 `20칸 설계도`다.

좋은 결과:

```text
윤서 1번, PATCH 2번 확정, 리오 8번을 잠그고,
OPEN-HOST를 3번 후보 / R01 NPC 선등장 후 플레이어블 전환으로 반영하며,
4~7번 후보의 기능과 중복 위험을 먼저 보여준다.
NPC는 시설/상태값/잘못 믿는 것까지 붙인다.
```

나쁜 결과:

```text
멋있는 이름 20개를 만들고,
직업/무기/속성만 붙이고,
상세 프로필을 한 번에 늘어놓는다.
```

이 프롬프트의 핵심은 캐릭터 수가 아니라, 각 캐릭터가 캠페인을 다르게 읽게 만드는 것이다.

현재 기준에서는 `story/06_characters/playable_20_roster_blueprint_v0_1.md`, `story/06_characters/patch_playable_2nd_slot_final_decision_v0_1.md`, `story/06_characters/playable_slots_3_to_7_candidate_selection_v0_1.md`, `story/06_characters/discharge_hold_patient_playable_decision_v0_1.md`, `story/06_characters/discharge_hold_patient_playable_condition_patch_v0_1.md`, `story/06_characters/discharge_hold_patient_profile_v1_0.md`, `story/06_characters/playable_20_name_registry_v0_1.md`, `story/06_characters/return_recipient_playable_decision_v0_1.md`, `story/06_characters/return_recipient_playable_condition_patch_v0_1.md`, `story/06_characters/return_recipient_profile_v1_0.md`, `story/06_characters/meter_06_playable_decision_v0_1.md`, `story/06_characters/meter_06_playable_condition_patch_v0_1.md`, `story/06_characters/meter_06_profile_v1_0.md`, `story/06_characters/quiet_07_playable_decision_v0_1.md`, `story/06_characters/quiet_07_playable_condition_patch_v0_1.md`를 먼저 보고, 20명을 다시 나열하지 않는다. 다음 작업은 **7번 백여울 / QUIET-07 / 침묵권 피난자 프로필 v1.0 작성**이다.
