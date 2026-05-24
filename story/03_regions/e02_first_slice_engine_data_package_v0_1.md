# E02 첫 외부 슬라이스 엔진 데이터 패키지 v0.1

## 0. 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
E02 첫 외부 슬라이스 실제 엔진 데이터 변환용 Markdown 패키지.
실제 엔진 코드 작성 아님.
실제 JSON 파일 작성 아님.
실제 CSV/Godot 리소스 작성 아님.

판정:
엔진 데이터 패키지 작성 완료

실제 파일 생성:
false
```

---

## 1. 소스 잠금

| source_document | locked_role | locked_count_or_scope |
|---|---|---:|
| `story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md` | 변환 전 최종 검산 | 9 대상 / 36 application / 36 reaction / 18 object |
| `story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md` | 필드 사전, enum, read/set 그래프 | 11 flag / 12 state key |
| `story/03_regions/e02_first_slice_state_object_data_application_v0_1.md` | application 매핑 원본 | 36행 |
| `story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md` | reaction 문구 원본 | 36개 |
| `story/03_regions/e02_first_slice_object_text_bank_v0_1.md` | object default/changed 문구 원본 | 18개 |
| `story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md` | 금지 해금/직접 대면 제한 검산 | 통과 |
| `story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md` | 노출 범위 기준 | 직접 대면 2행 |

잠금 원칙:

```text
새 NPC, 새 문구, 새 ID를 만들지 않는다.
실제 data/e02/*.json 파일은 만들지 않는다.
아래 JSON 코드블록은 Markdown 내부 변환 패키지로만 유지한다.
```

---

## 2. 패키지 manifest

```json
{
  "schema_version": "e02_first_slice_engine_data_v0_1",
  "source_package": "E02 first external slice",
  "data_status": "engine_data_package_markdown_only",
  "actual_files_created": false,
  "counts": {
    "targets": 9,
    "applications": 36,
    "reactions": 36,
    "object_texts": 18,
    "flags": 11,
    "state_keys": 12,
    "reaction_only_applications": 8,
    "direct_encounters": 2,
    "protected_playable": 12,
    "forbidden_unlock": 16
  },
  "source_documents": [
    "story/03_regions/e02_first_slice_engine_data_pre_conversion_validation_v0_1.md",
    "story/03_regions/e02_first_slice_engine_schema_handoff_v0_1.md",
    "story/03_regions/e02_first_slice_state_object_data_application_v0_1.md",
    "story/03_regions/e02_first_slice_state_reaction_matrix_v0_1.md",
    "story/03_regions/e02_first_slice_object_text_bank_v0_1.md",
    "story/03_regions/e02_first_slice_npc_qa_checklist_v0_1.md",
    "story/03_regions/e02_first_slice_npc_implementation_scope_v0_1.md"
  ]
}
```

---

## 3. applications JSON

```json
[
  {"application_id":"e02_app_001","reaction_id":"e02_sr_001","object_text_id":"e02_obj_001","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"delivery_state","trigger_flag":"e02_locker_expiry_seen","condition_expression":"보관 만료 UI 최초 확인","display_surface":"locker_ui","text_source":"object.changed_text","state_result":"보관함은 닫힌 채 수신태그 부담을 올린다","flag_result":"read e02_locker_expiry_seen","implementation_phase":"first_seen","protected_playable":["RETURN-05"],"qa_guard":"보상 상자나 택배 퀘스트로 변환 금지"},
  {"application_id":"e02_app_002","reaction_id":"e02_sr_002","object_text_id":"e02_obj_005","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"passage_tag","trigger_flag":"e02_last_train_missed","condition_expression":"막차 뒤 회수실 진입","display_surface":"collection_room_light","text_source":"object.changed_text","state_result":"물건 칸 점등으로 통행 기록 우선 보존","flag_result":"read e02_last_train_missed","implementation_phase":"pre_boss","protected_playable":["GATE-09"],"qa_guard":"빠른 이동, 환승 해금 금지"},
  {"application_id":"e02_app_003","reaction_id":"e02_sr_003","object_text_id":null,"is_reaction_only":true,"application_type":"direct_encounter","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"trace_preservation","trigger_flag":"e02_locker_recipient_spoken","condition_expression":"보관함 앞 제한 대면 1회","display_surface":"direct_encounter","text_source":"reaction.line_or_change","state_result":"이름 공개 없이 보관 흔적만 보존","flag_result":"set e02_locker_recipient_spoken","implementation_phase":"first_seen","protected_playable":["RETURN-05"],"qa_guard":"새 오브젝트 문구 추가 금지. 직접 대면 1회 이하"},
  {"application_id":"e02_app_004","reaction_id":"e02_sr_004","object_text_id":"e02_obj_002","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"delivery_state","trigger_flag":"e02_locker_extension_refused","condition_expression":"보관 연장 거부","display_surface":"locker_ui","text_source":"object.changed_text","state_result":"수취인 호출 로그가 약화된다","flag_result":"set/read e02_locker_extension_refused","implementation_phase":"post_boss","protected_playable":["RETURN-05"],"qa_guard":"반품 상점, 즉시 구원 금지"},
  {"application_id":"e02_app_005","reaction_id":"e02_sr_005","object_text_id":"e02_obj_004","is_reaction_only":false,"application_type":"hub_reaction_candidate","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"signal_tag","trigger_flag":"e02_locker_expiry_seen","condition_expression":"보급소 수신태그 낮음","display_surface":"hub_reaction","text_source":"reaction.line_or_change","state_result":"보급소 반응 후보만 열고 구조는 열지 않는다","flag_result":"read e02_locker_expiry_seen","implementation_phase":"hub_after_return","protected_playable":["미나","복희"],"qa_guard":"정답 안내, 이름 해금 금지"},
  {"application_id":"e02_app_006","reaction_id":"e02_sr_006","object_text_id":"e02_obj_006","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"signal_stability","trigger_flag":"e02_disaster_phrase_delayed","condition_expression":"승인 지연 최초 확인","display_surface":"billboard","text_source":"object.changed_text","state_result":"방송 지연과 등록 압력을 동시에 늦춘다","flag_result":"set/read e02_disaster_phrase_delayed","implementation_phase":"first_seen","protected_playable":["BROAD-10"],"qa_guard":"방송 장악, 아나운서 NPC 금지"},
  {"application_id":"e02_app_007","reaction_id":"e02_sr_007","object_text_id":"e02_obj_009","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"campaign_density","trigger_flag":"e02_phrase_approved_too_late","condition_expression":"캠페인 농도 상승","display_surface":"caption","text_source":"object.changed_text","state_result":"늦은 승인 문구를 잔향으로 보존한다","flag_result":"set/read e02_phrase_approved_too_late","implementation_phase":"post_boss","protected_playable":["BROAD-10"],"qa_guard":"세계 진실 설명 금지"},
  {"application_id":"e02_app_008","reaction_id":"e02_sr_008","object_text_id":"e02_obj_007","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"human_stability","trigger_flag":"e02_guidance_loop_muted","condition_expression":"인간 안정도 낮음, 반복 안내 차단","display_surface":"billboard","text_source":"object.changed_text","state_result":"반복 차단 후 불안정한 침묵을 남긴다","flag_result":"set/read e02_guidance_loop_muted","implementation_phase":"optional_trace","protected_playable":["QUIET-07","BROAD-10"],"qa_guard":"낮은 수신 튜토리얼 금지"},
  {"application_id":"e02_app_009","reaction_id":"e02_sr_009","object_text_id":"e02_obj_008","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"trace_preservation","trigger_flag":"e02_caption_cut_recovered","condition_expression":"잘린 자막 조각 회수","display_surface":"caption","text_source":"object.changed_text","state_result":"정정 자막을 보존하고 보급소 반응 후보를 연다","flag_result":"set/read e02_caption_cut_recovered","implementation_phase":"optional_trace","protected_playable":["세븐","복희"],"qa_guard":"도감 정답 판정 금지"},
  {"application_id":"e02_app_010","reaction_id":"e02_sr_010","object_text_id":"e02_obj_010","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"signal_tag","trigger_flag":"e02_disaster_phrase_delayed","condition_expression":"수신태그 부족","display_surface":"studio_log","text_source":"object.default_text","state_result":"안내가 줄고 보급소 비콘이 흔들린다","flag_result":"read e02_disaster_phrase_delayed","implementation_phase":"pre_boss","protected_playable":["BROAD-10"],"qa_guard":"수신태그 보상 금지"},
  {"application_id":"e02_app_011","reaction_id":"e02_sr_011","object_text_id":null,"is_reaction_only":true,"application_type":"direct_encounter","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"passage_tag","trigger_flag":"e02_last_train_missed","condition_expression":"막차 종료 후 플랫폼 진입","display_surface":"direct_encounter","text_source":"reaction.line_or_change","state_result":"GATE-09 전 압력을 올리되 이동 기능은 열지 않는다","flag_result":"read e02_last_train_missed; may set e02_transfer_hold_spoken","implementation_phase":"first_seen","protected_playable":["GATE-09"],"qa_guard":"빠른 이동, 역무원 선역화 금지"},
  {"application_id":"e02_app_012","reaction_id":"e02_sr_012","object_text_id":"e02_obj_011","is_reaction_only":false,"application_type":"ambient_log","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"passage_tag","trigger_flag":"e02_gate_unpassed_log_seen","condition_expression":"개찰 미통과 로그 확인","display_surface":"gate_log","text_source":"object.changed_text","state_result":"통행태그 압박을 보류 상태로 표시한다","flag_result":"set/read e02_gate_unpassed_log_seen","implementation_phase":"pre_boss","protected_playable":["GATE-09"],"qa_guard":"해금 판정 대체 금지"},
  {"application_id":"e02_app_013","reaction_id":"e02_sr_013","object_text_id":"e02_obj_014","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"human_stability","trigger_flag":"e02_transfer_hold_spoken","condition_expression":"보류관 대면 후 인간 안정도 낮음","display_surface":"pass_reader","text_source":"reaction.line_or_change","state_result":"잔류 명단이 선명해지지만 안심은 주지 않는다","flag_result":"read e02_transfer_hold_spoken","implementation_phase":"revisit","protected_playable":["GATE-09"],"qa_guard":"플랫폼 구출 장면 금지"},
  {"application_id":"e02_app_014","reaction_id":"e02_sr_014","object_text_id":"e02_obj_013","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"campaign_density","trigger_flag":"e02_platform_residue_preserved","condition_expression":"잔류 흔적 보존 선택","display_surface":"platform_list","text_source":"object.default_text","state_result":"잔류표를 보존하고 캠페인 농도를 올린다","flag_result":"set/read e02_platform_residue_preserved","implementation_phase":"post_boss","protected_playable":["GATE-09"],"qa_guard":"HP 0 처리 대체 금지"},
  {"application_id":"e02_app_015","reaction_id":"e02_sr_015","object_text_id":null,"is_reaction_only":true,"application_type":"reaction_only","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"signal_tag","trigger_flag":"e02_last_train_missed","condition_expression":"막차 안내 신호와 보급소 신호 충돌","display_surface":"billboard","text_source":"reaction.line_or_change","state_result":"보급소 인양 단서를 흔들리게 한다","flag_result":"read e02_last_train_missed","implementation_phase":"optional_trace","protected_playable":["GATE-09"],"qa_guard":"인양 안정 보상 금지"},
  {"application_id":"e02_app_016","reaction_id":"e02_sr_016","object_text_id":"e02_obj_015","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"delivery_state","trigger_flag":"e02_locker_extension_refused","condition_expression":"보관 연장 거부 후 카운터 접근","display_surface":"receipt","text_source":"object.default_text","state_result":"편의점은 상점이 아니라 회수 기록으로 남는다","flag_result":"read e02_locker_extension_refused","implementation_phase":"revisit","protected_playable":["RETURN-05"],"qa_guard":"판매/교환 NPC 금지"},
  {"application_id":"e02_app_017","reaction_id":"e02_sr_017","object_text_id":"e02_obj_004","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"signal_tag","trigger_flag":"e02_locker_expiry_seen","condition_expression":"수신태그 낮음","display_surface":"locker_log","text_source":"reaction.line_or_change","state_result":"수취인 여부를 끝까지 확정하지 않는다","flag_result":"read e02_locker_expiry_seen","implementation_phase":"revisit","protected_playable":["RETURN-05"],"qa_guard":"미수령품 보상 금지"},
  {"application_id":"e02_app_018","reaction_id":"e02_sr_018","object_text_id":"e02_obj_005","is_reaction_only":false,"application_type":"ambient_log","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"trace_preservation","trigger_flag":"e02_last_train_missed","condition_expression":"막차 뒤 회수실 조명 확인","display_surface":"collection_room_light","text_source":"reaction.line_or_change","state_result":"물건 흔적만 남기고 인물 대면은 열지 않는다","flag_result":"read e02_last_train_missed","implementation_phase":"optional_trace","protected_playable":["RETURN-05"],"qa_guard":"점원 NPC화 금지"},
  {"application_id":"e02_app_019","reaction_id":"e02_sr_019","object_text_id":null,"is_reaction_only":true,"application_type":"reaction_only","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"campaign_density","trigger_flag":"e02_locker_expiry_seen","condition_expression":"캠페인 농도 상승","display_surface":"receipt","text_source":"reaction.line_or_change","state_result":"회수 압력을 배경으로 확산한다","flag_result":"read e02_locker_expiry_seen","implementation_phase":"revisit","protected_playable":["RETURN-05"],"qa_guard":"상점 개방 금지"},
  {"application_id":"e02_app_020","reaction_id":"e02_sr_020","object_text_id":"e02_obj_008","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"signal_stability","trigger_flag":"e02_caption_cut_recovered","condition_expression":"잘린 자막 조각 회수","display_surface":"caption","text_source":"reaction.line_or_change","state_result":"자막은 짧아지고 책임 문구가 길어진다","flag_result":"read e02_caption_cut_recovered","implementation_phase":"optional_trace","protected_playable":["BROAD-10"],"qa_guard":"정답 송출 금지"},
  {"application_id":"e02_app_021","reaction_id":"e02_sr_021","object_text_id":"e02_obj_007","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"campaign_density","trigger_flag":"e02_guidance_loop_muted","condition_expression":"반복 안내 일시 차단","display_surface":"billboard","text_source":"object.changed_text","state_result":"반복을 줄이되 남은 문구의 무게를 키운다","flag_result":"read e02_guidance_loop_muted","implementation_phase":"optional_trace","protected_playable":["BROAD-10"],"qa_guard":"방송 해킹 금지"},
  {"application_id":"e02_app_022","reaction_id":"e02_sr_022","object_text_id":"e02_obj_009","is_reaction_only":false,"application_type":"ambient_log","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"human_stability","trigger_flag":"e02_phrase_approved_too_late","condition_expression":"늦은 승인 후 인간 안정도 낮음","display_surface":"caption","text_source":"reaction.line_or_change","state_result":"안정도 회복 없이 정정 로그만 보존한다","flag_result":"read e02_phrase_approved_too_late","implementation_phase":"revisit","protected_playable":["BROAD-10"],"qa_guard":"공식 안내 버프 금지"},
  {"application_id":"e02_app_023","reaction_id":"e02_sr_023","object_text_id":null,"is_reaction_only":true,"application_type":"device_voice","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"signal_tag","trigger_flag":"e02_disaster_phrase_delayed","condition_expression":"수신태그 부족","display_surface":"studio_log","text_source":"reaction.line_or_change","state_result":"청취 확인 압력을 후속 지역 씨앗으로 남긴다","flag_result":"read e02_disaster_phrase_delayed","implementation_phase":"optional_trace","protected_playable":["BROAD-10"],"qa_guard":"노라 기능 선점 금지"},
  {"application_id":"e02_app_024","reaction_id":"e02_sr_024","object_text_id":"e02_obj_014","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"passage_tag","trigger_flag":"e02_gate_unpassed_log_seen","condition_expression":"개찰 미통과 로그 후 판독기 접근","display_surface":"pass_reader","text_source":"reaction.line_or_change","state_result":"통행태그를 소모품이 아니라 판정 흔적으로 남긴다","flag_result":"read e02_gate_unpassed_log_seen","implementation_phase":"revisit","protected_playable":["GATE-09"],"qa_guard":"무료 재통과 금지"},
  {"application_id":"e02_app_025","reaction_id":"e02_sr_025","object_text_id":"e02_obj_012","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"human_stability","trigger_flag":"e02_transfer_hold_spoken","condition_expression":"보류관 대면 후 인간 안정도 낮음","display_surface":"pass_reader","text_source":"reaction.line_or_change","state_result":"개찰 실패를 기록 압력으로 남긴다","flag_result":"read e02_transfer_hold_spoken","implementation_phase":"revisit","protected_playable":["GATE-09"],"qa_guard":"개찰 튜토리얼 금지"},
  {"application_id":"e02_app_026","reaction_id":"e02_sr_026","object_text_id":"e02_obj_013","is_reaction_only":false,"application_type":"ambient_log","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"campaign_density","trigger_flag":"e02_platform_residue_preserved","condition_expression":"잔류 명단 보존","display_surface":"platform_list","text_source":"reaction.line_or_change","state_result":"잔류표를 선명하게 하고 캠페인 농도를 올린다","flag_result":"read e02_platform_residue_preserved","implementation_phase":"post_boss","protected_playable":["GATE-09"],"qa_guard":"해금 장면 대체 금지"},
  {"application_id":"e02_app_027","reaction_id":"e02_sr_027","object_text_id":null,"is_reaction_only":true,"application_type":"reaction_only","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"signal_tag","trigger_flag":"e02_last_train_missed","condition_expression":"막차 안내 신호 약화","display_surface":"billboard","text_source":"reaction.line_or_change","state_result":"신호 약화를 길 안내가 아니라 판정 지연으로 표시한다","flag_result":"read e02_last_train_missed","implementation_phase":"optional_trace","protected_playable":["GATE-09"],"qa_guard":"빠른 이동 안내 금지"},
  {"application_id":"e02_app_028","reaction_id":"e02_sr_028","object_text_id":"e02_obj_016","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C04_g4_001","campaign":"E02_C04","trigger_state":"robot_autonomy","trigger_flag":null,"condition_expression":"로봇 자율성 상승","display_surface":"inspection_sheet","text_source":"object.changed_text","state_result":"자율성을 리콜 사유로 오독한다","flag_result":"no flag","implementation_phase":"optional_trace","protected_playable":["PATCH","RIO"],"qa_guard":"로봇 동료/수리 NPC 금지"},
  {"application_id":"e02_app_029","reaction_id":"e02_sr_029","object_text_id":"e02_obj_016","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C04_g4_001","campaign":"E02_C04","trigger_state":"charge_tag","trigger_flag":null,"condition_expression":"충전태그 부족","display_surface":"inspection_sheet","text_source":"reaction.line_or_change","state_result":"차단/검수 압력만 남기고 강화는 열지 않는다","flag_result":"no flag","implementation_phase":"optional_trace","protected_playable":["METER","PATCH"],"qa_guard":"충전/강화 UI 금지"},
  {"application_id":"e02_app_030","reaction_id":"e02_sr_030","object_text_id":"e02_obj_016","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C04_g4_001","campaign":"E02_C04","trigger_state":"trace_preservation","trigger_flag":null,"condition_expression":"리콜 라벨 조각 보존","display_surface":"inspection_sheet","text_source":"reaction.line_or_change","state_result":"사람 이름 없이 모델명 흔적만 남긴다","flag_result":"no flag","implementation_phase":"optional_trace","protected_playable":["PATCH","RIO"],"qa_guard":"정품 복구 설명 금지"},
  {"application_id":"e02_app_031","reaction_id":"e02_sr_031","object_text_id":"e02_obj_017","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C08_g4_001","campaign":"E02_C08","trigger_state":"signal_stability","trigger_flag":"e02_guidance_loop_muted","condition_expression":"반복 차단 후 대피실 접근","display_surface":"shelter_speaker","text_source":"object.default_text","state_result":"낮은 수신을 안전과 구조 지연으로 동시에 읽힌다","flag_result":"read e02_guidance_loop_muted","implementation_phase":"optional_trace","protected_playable":["QUIET-07","BROAD-10"],"qa_guard":"안전지대, 낮은 수신 튜토리얼 금지"},
  {"application_id":"e02_app_032","reaction_id":"e02_sr_032","object_text_id":null,"is_reaction_only":true,"application_type":"reaction_only","target_seed":"g_E02_C08_g4_001","campaign":"E02_C08","trigger_state":"supply_pressure","trigger_flag":null,"condition_expression":"보급 압력 상승","display_surface":"shelter_speaker","text_source":"reaction.line_or_change","state_result":"보급품은 남지만 사람 상태 갱신은 늦어진다","flag_result":"no flag","implementation_phase":"optional_trace","protected_playable":["RATION-16","복희"],"qa_guard":"회복소/보급 상점 금지"},
  {"application_id":"e02_app_033","reaction_id":"e02_sr_033","object_text_id":"e02_obj_017","is_reaction_only":false,"application_type":"device_voice","target_seed":"g_E02_C08_g4_001","campaign":"E02_C08","trigger_state":"extraction_stability","trigger_flag":null,"condition_expression":"인양 안정도 낮음","display_surface":"shelter_speaker","text_source":"object.changed_text","state_result":"보급소 인양 단서를 약하게 만든다","flag_result":"no flag","implementation_phase":"optional_trace","protected_playable":["QUIET-07"],"qa_guard":"긴급 인양 안정화 금지"},
  {"application_id":"e02_app_034","reaction_id":"e02_sr_034","object_text_id":"e02_obj_018","is_reaction_only":false,"application_type":"ambient_log","target_seed":"g_E02_C01_g4_001","campaign":"E02_C01","trigger_state":"residence_tag","trigger_flag":null,"condition_expression":"거주태그 흔들림","display_surface":"commuter_pass_log","text_source":"object.default_text","state_result":"가족권이 이동권보다 먼저 갱신된다","flag_result":"no flag","implementation_phase":"optional_trace","protected_playable":["OPEN-HOST"],"qa_guard":"R01 가족칸 반복 금지"},
  {"application_id":"e02_app_035","reaction_id":"e02_sr_035","object_text_id":"e02_obj_018","is_reaction_only":false,"application_type":"object_text","target_seed":"g_E02_C01_g4_001","campaign":"E02_C01","trigger_state":"passage_tag","trigger_flag":"e02_gate_unpassed_log_seen","condition_expression":"개찰 미통과 로그 후 가족권 로그 접근","display_surface":"commuter_pass_log","text_source":"object.changed_text","state_result":"한 사람의 통행 실패를 가족 단위 기록으로 번지게 한다","flag_result":"read e02_gate_unpassed_log_seen","implementation_phase":"optional_trace","protected_playable":["GATE-09","OPEN-HOST"],"qa_guard":"빠른 이동, 가족 구출 금지"},
  {"application_id":"e02_app_036","reaction_id":"e02_sr_036","object_text_id":null,"is_reaction_only":true,"application_type":"reaction_only","target_seed":"g_E02_C01_g4_001","campaign":"E02_C01","trigger_state":"human_stability","trigger_flag":"e02_last_train_missed","condition_expression":"막차 종료 후 가족권 알림 확인","display_surface":"commuter_pass_log","text_source":"reaction.line_or_change","state_result":"안정도 회복 없이 가족/통근 압력만 남긴다","flag_result":"read e02_last_train_missed","implementation_phase":"optional_trace","protected_playable":["OPEN-HOST"],"qa_guard":"주거 튜토리얼, R01 재탕 금지"}
]
```

---

## 4. object_texts JSON

```json
[
  {"object_text_id":"e02_obj_001","object_group":"역전 보관함 만료 UI","campaign":"E02_C03","placement_node":"역전 보관함 앞","form":"UI","first_seen":"역전 보관함 앞","trigger_condition":"e02_locker_expiry_seen 최초 확인","default_text":"보관 만료 예정: 칸 042. 수취인 호출 대기.","changed_text":"연장 가능: 수취인 상태 미확인. 물품 상태 우선 보존.","implied_mystery":"보관함은 사람을 확인하지 않고 물건의 대기만 연장한다","linked_seed":"g_E02_C03_g5_001","linked_reactions":["e02_sr_001"],"reads_states":["delivery_state"],"reads_flags":["e02_locker_expiry_seen"],"visibility_rule":"보관함 최초 확인 시 표시","replay_rule":"재방문 시 변경 문구 유지","protected_playable":["RETURN-05"],"qa_guard":"보상 상자 금지"},
  {"object_text_id":"e02_obj_002","object_group":"역전 보관함 만료 UI","campaign":"E02_C03","placement_node":"보관 연장 선택창","form":"UI","first_seen":"보관 연장 선택창","trigger_condition":"e02_locker_extension_refused","default_text":"연장 승인 전. 호출 로그를 유지합니다.","changed_text":"연장 거부 기록. 호출 로그 일부를 접습니다.","implied_mystery":"연장 거부는 해방이 아니라 호출 기록의 손실을 만든다","linked_seed":"g_E02_C03_g5_001","linked_reactions":["e02_sr_004"],"reads_states":["delivery_state"],"reads_flags":["e02_locker_extension_refused"],"visibility_rule":"보관 연장 거부 선택 후 표시","replay_rule":"후속 방문에서 거부 상태 유지","protected_playable":["RETURN-05","복희"],"qa_guard":"이름 해금 금지"},
  {"object_text_id":"e02_obj_003","object_group":"보관함 만료 로그","campaign":"E02_C03","placement_node":"보관함 측면 점검 패널","form":"로그","first_seen":"보관함 측면 점검 패널","trigger_condition":"delivery_state 오염","default_text":"수령 가능 시간 초과. 폐기 아님.","changed_text":"회수 지연. 수취인 재호출 실패 3회.","implied_mystery":"만료와 폐기는 다르며, 실패는 여러 번 반복된다","linked_seed":"g_E02_C03_g5_001","linked_reactions":["e02_sr_001","e02_sr_016"],"reads_states":["delivery_state"],"reads_flags":[],"visibility_rule":"점검 패널 조사 시 표시","replay_rule":"상태가 바뀌어도 로그는 누적형","protected_playable":["RETURN-05"],"qa_guard":"반송 전투 대체 금지"},
  {"object_text_id":"e02_obj_004","object_group":"보관함 만료 로그","campaign":"E02_C03","placement_node":"막차 후 보관함 재방문","form":"로그","first_seen":"막차 후 보관함 재방문","trigger_condition":"signal_tag 낮음","default_text":"알림 송신 완료. 수신 확인 없음.","changed_text":"알림 송신 반복 중지. 보급소 비콘 혼입.","implied_mystery":"보관함 알림과 보급소 신호가 같은 수취인을 두고 엇갈린다","linked_seed":"g_E02_C03_g5_001","linked_reactions":["e02_sr_005","e02_sr_017"],"reads_states":["signal_tag"],"reads_flags":["e02_locker_expiry_seen"],"visibility_rule":"만료 확인 후 재방문 시 표시","replay_rule":"보급소 귀환 후 반응 후보 유지","protected_playable":["미나","세븐","RETURN-05"],"qa_guard":"정답 분석 UI 금지"},
  {"object_text_id":"e02_obj_005","object_group":"막차 뒤 회수실 조명","campaign":"E02_C03","placement_node":"막차 뒤 회수실","form":"환경 오브젝트","first_seen":"막차 뒤 회수실","trigger_condition":"e02_last_train_missed","default_text":"회수실 조명: 1, 3, 5번 선반 점등.","changed_text":"사람 감지 없음. 물품 칸만 순차 점등.","implied_mystery":"회수실은 사람보다 칸 번호를 먼저 본다","linked_seed":"g_E02_C03_g4_001","linked_reactions":["e02_sr_002","e02_sr_018"],"reads_states":["passage_tag","trace_preservation"],"reads_flags":["e02_last_train_missed"],"visibility_rule":"막차 뒤 회수실 진입 시 표시","replay_rule":"조명 패턴은 재방문마다 유지","protected_playable":["RETURN-05","GATE-09"],"qa_guard":"편의점 점원/빠른 이동 금지"},
  {"object_text_id":"e02_obj_006","object_group":"반복 전광판","campaign":"E02_C05","placement_node":"방재 생방송권 입구","form":"전광판","first_seen":"방재 생방송권 입구","trigger_condition":"e02_disaster_phrase_delayed","default_text":"승인 대기: 안전 문구 검토 중.","changed_text":"승인 대기 연장: 대피 완료 표기는 보류.","implied_mystery":"안전한 문구를 기다리는 사이 대피 완료 기록도 늦어진다","linked_seed":"g_E02_C05_g5_001","linked_reactions":["e02_sr_006"],"reads_states":["signal_stability"],"reads_flags":["e02_disaster_phrase_delayed"],"visibility_rule":"승인 지연 확인 시 표시","replay_rule":"프리보스 구간에서 반복 표시","protected_playable":["BROAD-10"],"qa_guard":"정답 안내 금지"},
  {"object_text_id":"e02_obj_007","object_group":"반복 전광판","campaign":"E02_C05","placement_node":"반복 안내 교차로","form":"전광판","first_seen":"반복 안내 교차로","trigger_condition":"e02_guidance_loop_muted","default_text":"같은 안내를 반복합니다.","changed_text":"반복 일시 중지. 이전 안내는 삭제되지 않음.","implied_mystery":"반복을 끊어도 이미 들은 기록은 사라지지 않는다","linked_seed":"g_E02_C05_g4_001","linked_reactions":["e02_sr_008","e02_sr_021"],"reads_states":["campaign_density","human_stability"],"reads_flags":["e02_guidance_loop_muted"],"visibility_rule":"반복 안내 차단 후 표시","replay_rule":"반복은 줄되 변경 문구 유지","protected_playable":["BROAD-10","QUIET-07"],"qa_guard":"방송 해킹, 낮은 수신 튜토리얼 금지"},
  {"object_text_id":"e02_obj_008","object_group":"잘린 방재 자막","campaign":"E02_C05","placement_node":"깨진 전광판 하단","form":"자동 자막","first_seen":"깨진 전광판 하단","trigger_condition":"e02_caption_cut_recovered","default_text":"대피는 오른쪽... 안전...","changed_text":"대피는 [잘림]. 안전 문구 승인 전.","implied_mystery":"잘린 자막은 더 적게 말해서 더 오래 남는다","linked_seed":"g_E02_C05_g5_001","linked_reactions":["e02_sr_009","e02_sr_020"],"reads_states":["trace_preservation","signal_stability"],"reads_flags":["e02_caption_cut_recovered"],"visibility_rule":"자막 조각 회수 전후 표시","replay_rule":"회수 후 변경 문구 고정","protected_playable":["BROAD-10"],"qa_guard":"세계 진실 공개 금지"},
  {"object_text_id":"e02_obj_009","object_group":"잘린 방재 자막","campaign":"E02_C05","placement_node":"자막 조각 보관 화면","form":"자동 자막","first_seen":"자막 조각 회수 후","trigger_condition":"campaign_density 상승","default_text":"정정 예정 문구가 있습니다.","changed_text":"정정 도착. 도착 전 청취자는 정정 대상 아님.","implied_mystery":"정정 문구는 늦게 온 사람과 먼저 들은 사람을 갈라놓는다","linked_seed":"g_E02_C05_g4_001","linked_reactions":["e02_sr_007","e02_sr_022"],"reads_states":["campaign_density","human_stability"],"reads_flags":["e02_phrase_approved_too_late"],"visibility_rule":"늦은 승인 후 표시","replay_rule":"포스트보스 재방문 시 유지","protected_playable":["BROAD-10"],"qa_guard":"공식 안내 버프 금지"},
  {"object_text_id":"e02_obj_010","object_group":"방재 스튜디오 송출 로그","campaign":"E02_C05","placement_node":"송출 지연 콘솔","form":"로그","first_seen":"송출 지연 콘솔","trigger_condition":"e02_phrase_approved_too_late","default_text":"송출 전 승인 필요.","changed_text":"승인 완료. 송출 가능 시간 초과.","implied_mystery":"승인된 문구도 너무 늦으면 사람을 절차 밖에 남긴다","linked_seed":"g_E02_C05_g5_001","linked_reactions":["e02_sr_010","e02_sr_023"],"reads_states":["signal_tag"],"reads_flags":["e02_disaster_phrase_delayed","e02_phrase_approved_too_late"],"visibility_rule":"스튜디오 로그 조사 시 표시","replay_rule":"지연 상태는 누적형","protected_playable":["BROAD-10"],"qa_guard":"아나운서 NPC 금지"},
  {"object_text_id":"e02_obj_011","object_group":"개찰 미통과 로그","campaign":"E02_C07","placement_node":"환승 게이트 뒤쪽","form":"로그","first_seen":"환승 게이트 뒤쪽","trigger_condition":"e02_gate_unpassed_log_seen","default_text":"개찰 미통과. 실패 처리 전.","changed_text":"미통과 보존. 환승 판정 닫힘 대기.","implied_mystery":"미통과는 실패가 아니라 실패 처리 직전의 상태다","linked_seed":"g_E02_C07_g5_001","linked_reactions":["e02_sr_012","e02_sr_027"],"reads_states":["passage_tag","signal_tag"],"reads_flags":["e02_gate_unpassed_log_seen"],"visibility_rule":"개찰 로그 확인 시 표시","replay_rule":"보류 상태는 재방문 시 유지","protected_playable":["GATE-09"],"qa_guard":"해금 판정/빠른 이동 금지"},
  {"object_text_id":"e02_obj_012","object_group":"개찰 미통과 로그","campaign":"E02_C07","placement_node":"정기권 판독기 옆","form":"로그","first_seen":"정기권 판독기 옆","trigger_condition":"passage_tag 부족","default_text":"통행태그 부족. 재판독 권장.","changed_text":"재판독 실패. 사람보다 표의 상태가 먼저 닫힘.","implied_mystery":"표가 통과하지 못한 것이 사람의 상태로 번진다","linked_seed":"g_E02_C07_g4_001","linked_reactions":["e02_sr_024","e02_sr_025"],"reads_states":["passage_tag","human_stability"],"reads_flags":["e02_gate_unpassed_log_seen","e02_transfer_hold_spoken"],"visibility_rule":"정기권 판독 실패 후 표시","replay_rule":"재판독해도 무료 통과 없음","protected_playable":["GATE-09"],"qa_guard":"무료 재통과 금지"},
  {"object_text_id":"e02_obj_013","object_group":"플랫폼 잔류 명단","campaign":"E02_C07","placement_node":"막차 심사 플랫폼","form":"문서","first_seen":"막차 심사 플랫폼","trigger_condition":"e02_platform_residue_preserved","default_text":"잔류 명단 접힘. 다음 판정까지 보류.","changed_text":"잔류 명단 보존. 캠페인 농도 상승.","implied_mystery":"명단을 보존하면 사람도 더 선명히 플랫폼에 묶인다","linked_seed":"g_E02_C07_g5_001","linked_reactions":["e02_sr_014","e02_sr_026"],"reads_states":["campaign_density"],"reads_flags":["e02_platform_residue_preserved"],"visibility_rule":"잔류 흔적 보존 선택 후 표시","replay_rule":"포스트보스에서 더 선명히 표시","protected_playable":["GATE-09"],"qa_guard":"HP 0 처리 대체 금지"},
  {"object_text_id":"e02_obj_014","object_group":"정기권 판독기","campaign":"E02_C07","placement_node":"개찰기 판독 실패 지점","form":"장치 메시지","first_seen":"개찰기 판독 실패","trigger_condition":"e02_transfer_hold_spoken","default_text":"정기권 판독 중. 매일권 확인.","changed_text":"오늘의 사람은 재판독 필요.","implied_mystery":"정기권은 매일을 기억하지만 사람은 매번 다시 판정된다","linked_seed":"g_E02_C07_g4_001","linked_reactions":["e02_sr_013","e02_sr_024"],"reads_states":["passage_tag","human_stability"],"reads_flags":["e02_transfer_hold_spoken","e02_gate_unpassed_log_seen"],"visibility_rule":"보류관 대면 또는 미통과 로그 후 표시","replay_rule":"반복 판독은 가능하나 통과 해금 없음","protected_playable":["GATE-09"],"qa_guard":"개찰 튜토리얼 금지"},
  {"object_text_id":"e02_obj_015","object_group":"편의점 카운터 영수증/닫힌 셔터","campaign":"E02_C03","placement_node":"닫힌 편의점 카운터","form":"영수증","first_seen":"닫힌 편의점 카운터","trigger_condition":"e02_locker_extension_refused","default_text":"수령 카운터 마감. 미수령품은 보관함으로 반송.","changed_text":"보관함 반송 실패. 호출 번호는 영수증에만 남음.","implied_mystery":"카운터가 닫히면 이름보다 호출 번호가 오래 남는다","linked_seed":"g_E02_C03_g4_001","linked_reactions":["e02_sr_016","e02_sr_019"],"reads_states":["delivery_state","trace_preservation"],"reads_flags":["e02_locker_extension_refused"],"visibility_rule":"보관 연장 거부 후 표시","replay_rule":"영수증 재확인 가능","protected_playable":["RETURN-05"],"qa_guard":"상점/교환 기능 금지"},
  {"object_text_id":"e02_obj_016","object_group":"리콜 검사표/미세부품 검사표","campaign":"E02_C04","placement_node":"미세부품 리콜 라인","form":"검사표","first_seen":"미세부품 리콜 라인","trigger_condition":"robot_autonomy 상승 또는 charge_tag 부족","default_text":"미세 균열은 정품 여부와 별도로 회수됩니다.","changed_text":"자율 판단 흔적 발견. 정품 판정과 분리 회수.","implied_mystery":"정품 인증은 안전을 보장하지 않고 자율성을 묶을 수 있다","linked_seed":"g_E02_C04_g4_001","linked_reactions":["e02_sr_028","e02_sr_029","e02_sr_030"],"reads_states":["robot_autonomy","charge_tag","trace_preservation"],"reads_flags":[],"visibility_rule":"리콜 검사표 조사 시 표시","replay_rule":"후속 로봇 반응 후보만 남김","protected_playable":["PATCH","METER","RIO"],"qa_guard":"수리/강화 UI 금지"},
  {"object_text_id":"e02_obj_017","object_group":"무음 대피소 안내 스피커","campaign":"E02_C08","placement_node":"소등 후 대피실","form":"시스템 음성","first_seen":"소등 후 대피실","trigger_condition":"signal_stability 낮음 또는 supply_pressure 상승","default_text":"안내 없음은 정상 대피 상태입니다.","changed_text":"구조 요청은 낮은 음량으로 보존됩니다.","implied_mystery":"침묵은 안전 상태처럼 보이지만 인양 단서도 약하게 만든다","linked_seed":"g_E02_C08_g4_001","linked_reactions":["e02_sr_031","e02_sr_032","e02_sr_033"],"reads_states":["signal_stability","supply_pressure","extraction_stability"],"reads_flags":["e02_guidance_loop_muted"],"visibility_rule":"대피실 접근 시 표시","replay_rule":"안전지대처럼 반복 보상 없음","protected_playable":["QUIET-07","BROAD-10"],"qa_guard":"회복소/안전지대 금지"},
  {"object_text_id":"e02_obj_018","object_group":"가족 정기권 거래 로그/세대 갱신 알림","campaign":"E02_C01","placement_node":"가족 정기권 아파트","form":"거래 로그","first_seen":"가족 정기권 아파트","trigger_condition":"residence_tag 흔들림 또는 passage_tag 부족","default_text":"동반 가족 정기권은 세대 갱신 후 다시 판독됩니다.","changed_text":"미통과 가족권은 대표 통근자에게 임시 귀속됩니다.","implied_mystery":"한 사람의 이동 실패가 가족 단위 기록으로 번진다","linked_seed":"g_E02_C01_g4_001","linked_reactions":["e02_sr_034","e02_sr_035","e02_sr_036"],"reads_states":["residence_tag","passage_tag","human_stability"],"reads_flags":["e02_gate_unpassed_log_seen","e02_last_train_missed"],"visibility_rule":"가족권 로그 조사 시 표시","replay_rule":"주거/통근 압력만 유지","protected_playable":["OPEN-HOST","GATE-09"],"qa_guard":"가족 구출 퀘스트 금지"}
]
```

---

## 5. reactions JSON

```json
[
  {"reaction_id":"e02_sr_001","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"delivery_state","trigger_flag":"e02_locker_expiry_seen","threshold_or_condition":"보관 만료 최초 확인","reaction_form":"로그","line_or_change":"보관 기간 연장 가능. 수취인 생존 여부는 확인하지 않음.","consequence":"보관함은 닫힌 채 수신태그 부담이 증가한다","display_surface":"locker_ui","implementation_phase":"first_seen","protected_playable":["RETURN-05"],"forbidden_overlap":["반송 전투","택배 퀘스트"]},
  {"reaction_id":"e02_sr_002","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"passage_tag","trigger_flag":"e02_last_train_missed","threshold_or_condition":"막차 뒤 회수실 진입","reaction_form":"잔향 오브젝트","line_or_change":"막차 뒤 회수실 조명이 물건 칸만 순서대로 밝힌다","consequence":"사람보다 물건의 통행 기록이 먼저 보존된다","display_surface":"collection_room_light","implementation_phase":"pre_boss","protected_playable":["GATE-09"],"forbidden_overlap":["빠른 이동","환승 해금"]},
  {"reaction_id":"e02_sr_003","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"trace_preservation","trigger_flag":"e02_locker_recipient_spoken","threshold_or_condition":"제한 대면 1회","reaction_form":"직접 대면","line_or_change":"보관 기간은 연장됐습니다. 수취인이 연장됐다는 뜻은 아닙니다.","consequence":"이름 공개 없이 보관 흔적만 보존된다","display_surface":"direct_encounter","implementation_phase":"first_seen","protected_playable":["RETURN-05"],"forbidden_overlap":["인간판 MAIL-LOOP","구출 NPC"]},
  {"reaction_id":"e02_sr_004","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"delivery_state","trigger_flag":"e02_locker_extension_refused","threshold_or_condition":"보관 연장 거부","reaction_form":"영수증","line_or_change":"수령 실패는 파기가 아닙니다. 호출 로그만 먼저 정리됩니다.","consequence":"물건 일부 회수, 수취인 호출 로그 약화","display_surface":"locker_ui","implementation_phase":"post_boss","protected_playable":["RETURN-05"],"forbidden_overlap":["보상 상자","반품 상점"]},
  {"reaction_id":"e02_sr_005","target_seed":"g_E02_C03_g5_001","campaign":"E02_C03","trigger_state":"signal_tag","trigger_flag":"e02_locker_expiry_seen","threshold_or_condition":"보급소 수신태그 낮음","reaction_form":"장치 음성","line_or_change":"알림은 도착했습니다. 수취인은 아직 알림 밖에 있습니다.","consequence":"보급소 반응 대사만 열고 즉시 구조하지 않는다","display_surface":"hub_reaction","implementation_phase":"hub_after_return","protected_playable":["미나","복희"],"forbidden_overlap":["정답 안내","이름 해금"]},
  {"reaction_id":"e02_sr_006","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"signal_stability","trigger_flag":"e02_disaster_phrase_delayed","threshold_or_condition":"승인 지연 최초 확인","reaction_form":"자동 자막","line_or_change":"승인 대기: 안전 문구는 아직 안전을 증명하지 않음.","consequence":"방송이 늦어지고 등록 압력도 늦어진다","display_surface":"billboard","implementation_phase":"first_seen","protected_playable":["BROAD-10"],"forbidden_overlap":["방송 장악","아나운서 NPC"]},
  {"reaction_id":"e02_sr_007","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"campaign_density","trigger_flag":"e02_phrase_approved_too_late","threshold_or_condition":"캠페인 농도 상승","reaction_form":"전광판","line_or_change":"정정 도착. 정정 전 대피자는 정정 대상에서 제외.","consequence":"늦은 승인 문구가 잔향으로 남는다","display_surface":"caption","implementation_phase":"post_boss","protected_playable":["BROAD-10"],"forbidden_overlap":["세계 진실 설명"]},
  {"reaction_id":"e02_sr_008","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"human_stability","trigger_flag":"e02_guidance_loop_muted","threshold_or_condition":"인간 안정도 낮음","reaction_form":"장치 음성","line_or_change":"한 번만 말한 안내가 더 오래 남을 수 있습니다.","consequence":"반복 안내 차단 후 불안정한 침묵이 남는다","display_surface":"billboard","implementation_phase":"optional_trace","protected_playable":["QUIET-07","BROAD-10"],"forbidden_overlap":["낮은 수신 튜토리얼"]},
  {"reaction_id":"e02_sr_009","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"trace_preservation","trigger_flag":"e02_caption_cut_recovered","threshold_or_condition":"잘린 자막 조각 회수","reaction_form":"문서","line_or_change":"잘린 자막은 승인되지 않은 문장으로 보관됩니다.","consequence":"정정 자막 보존, 세븐/복희 반응 후보 열림","display_surface":"caption","implementation_phase":"optional_trace","protected_playable":["세븐","복희"],"forbidden_overlap":["정답 판정","도감 기능"]},
  {"reaction_id":"e02_sr_010","target_seed":"g_E02_C05_g5_001","campaign":"E02_C05","trigger_state":"signal_tag","trigger_flag":"e02_disaster_phrase_delayed","threshold_or_condition":"수신태그 부족","reaction_form":"자동 자막","line_or_change":"수신 확인 실패. 안전 문구는 반복되지 않음.","consequence":"안내가 줄어드는 대신 보급소 비콘이 흔들린다","display_surface":"studio_log","implementation_phase":"pre_boss","protected_playable":["BROAD-10"],"forbidden_overlap":["수신태그 보상"]},
  {"reaction_id":"e02_sr_011","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"passage_tag","trigger_flag":"e02_last_train_missed","threshold_or_condition":"막차 종료 후 플랫폼 진입","reaction_form":"직접 대면","line_or_change":"막차를 놓친 게 아니라, 아직 환승이 끝나지 않은 겁니다.","consequence":"GATE-09 전 압력 상승, 이동 기능은 열지 않음","display_surface":"direct_encounter","implementation_phase":"first_seen","protected_playable":["GATE-09"],"forbidden_overlap":["빠른 이동","역무원 선역화"]},
  {"reaction_id":"e02_sr_012","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"passage_tag","trigger_flag":"e02_gate_unpassed_log_seen","threshold_or_condition":"개찰 미통과 로그 확인","reaction_form":"로그","line_or_change":"미통과는 실패 처리 전 단계입니다.","consequence":"통행태그 압박이 보류 상태로 표시된다","display_surface":"gate_log","implementation_phase":"pre_boss","protected_playable":["GATE-09"],"forbidden_overlap":["해금 판정 대체"]},
  {"reaction_id":"e02_sr_013","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"human_stability","trigger_flag":"e02_transfer_hold_spoken","threshold_or_condition":"대면 후 인간 안정도 낮음","reaction_form":"장치 음성","line_or_change":"표가 사람을 앞서갈 때 플랫폼은 조용해집니다.","consequence":"잔류 명단이 더 잘 보이나 안심은 주지 않는다","display_surface":"pass_reader","implementation_phase":"revisit","protected_playable":["GATE-09"],"forbidden_overlap":["플랫폼 구출 장면"]},
  {"reaction_id":"e02_sr_014","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"campaign_density","trigger_flag":"e02_platform_residue_preserved","threshold_or_condition":"잔류 흔적 보존 선택","reaction_form":"문서","line_or_change":"잔류 처리 보류. 다음 판정까지 명단 접힘.","consequence":"캠페인 농도 상승, 잔류표 보존","display_surface":"platform_list","implementation_phase":"post_boss","protected_playable":["GATE-09"],"forbidden_overlap":["HP 0 처리 대체"]},
  {"reaction_id":"e02_sr_015","target_seed":"g_E02_C07_g5_001","campaign":"E02_C07","trigger_state":"signal_tag","trigger_flag":"e02_last_train_missed","threshold_or_condition":"막차 안내 신호와 보급소 신호 충돌","reaction_form":"전광판","line_or_change":"\"출발 완료 / 환승 대기\"가 번갈아 점멸한다","consequence":"보급소 인양 단서가 흔들린다","display_surface":"billboard","implementation_phase":"optional_trace","protected_playable":["GATE-09"],"forbidden_overlap":["인양 안정 보상"]},
  {"reaction_id":"e02_sr_016","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"delivery_state","trigger_flag":"e02_locker_extension_refused","threshold_or_condition":"보관 연장 거부 후 카운터 접근","reaction_form":"영수증","line_or_change":"카운터는 닫혔고 알림은 정상 영업 중입니다.","consequence":"편의점은 상점이 아니라 회수 기록으로만 남는다","display_surface":"receipt","implementation_phase":"revisit","protected_playable":["RETURN-05"],"forbidden_overlap":["판매/교환 NPC"]},
  {"reaction_id":"e02_sr_017","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"signal_tag","trigger_flag":"e02_locker_expiry_seen","threshold_or_condition":"수신태그 낮음","reaction_form":"장치 음성","line_or_change":"수령 가능 시간은 지났지만, 수령인이 지났다는 기록은 없습니다.","consequence":"수취인 여부가 끝까지 확정되지 않는다","display_surface":"locker_log","implementation_phase":"revisit","protected_playable":["RETURN-05"],"forbidden_overlap":["미수령품 보상"]},
  {"reaction_id":"e02_sr_018","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"trace_preservation","trigger_flag":"e02_last_train_missed","threshold_or_condition":"막차 뒤 회수실 조명 확인","reaction_form":"로그","line_or_change":"미수령품은 버려지기 전까지 가장 성실하게 기다립니다.","consequence":"물건 흔적만 남고 인물 대면은 열리지 않는다","display_surface":"collection_room_light","implementation_phase":"optional_trace","protected_playable":["RETURN-05"],"forbidden_overlap":["점원 NPC화"]},
  {"reaction_id":"e02_sr_019","target_seed":"g_E02_C03_g4_001","campaign":"E02_C03","trigger_state":"campaign_density","trigger_flag":"e02_locker_expiry_seen","threshold_or_condition":"캠페인 농도 상승","reaction_form":"잔향 오브젝트","line_or_change":"닫힌 셔터의 영업 시간표가 회수 시간표로 바뀐다","consequence":"회수 압력이 지역 배경으로 번진다","display_surface":"receipt","implementation_phase":"revisit","protected_playable":["RETURN-05"],"forbidden_overlap":["상점 개방"]},
  {"reaction_id":"e02_sr_020","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"signal_stability","trigger_flag":"e02_caption_cut_recovered","threshold_or_condition":"잘린 자막 조각 회수","reaction_form":"자동 자막","line_or_change":"반복 횟수 감소. 명령성이 낮아졌으나 책임 문구 누락.","consequence":"자막은 짧아지고 책임은 길어진다","display_surface":"caption","implementation_phase":"optional_trace","protected_playable":["BROAD-10"],"forbidden_overlap":["정답 송출"]},
  {"reaction_id":"e02_sr_021","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"campaign_density","trigger_flag":"e02_guidance_loop_muted","threshold_or_condition":"반복 안내 일시 차단","reaction_form":"전광판","line_or_change":"한 번 송출된 안내는 삭제되지 않습니다.","consequence":"반복은 줄지만 남은 문구의 무게가 커진다","display_surface":"billboard","implementation_phase":"optional_trace","protected_playable":["BROAD-10"],"forbidden_overlap":["방송 해킹"]},
  {"reaction_id":"e02_sr_022","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"human_stability","trigger_flag":"e02_phrase_approved_too_late","threshold_or_condition":"늦은 승인 후 인간 안정도 낮음","reaction_form":"로그","line_or_change":"정정은 틀린 말보다 늦게 도착해서 더 오래 남습니다.","consequence":"안정도 회복 없이 정정 로그만 보존된다","display_surface":"caption","implementation_phase":"revisit","protected_playable":["BROAD-10"],"forbidden_overlap":["공식 안내 버프"]},
  {"reaction_id":"e02_sr_023","target_seed":"g_E02_C05_g4_001","campaign":"E02_C05","trigger_state":"signal_tag","trigger_flag":"e02_disaster_phrase_delayed","threshold_or_condition":"수신태그 부족","reaction_form":"장치 음성","line_or_change":"방송은 멈출 수 있습니다. 수신 확인은 따로 멈춰야 합니다.","consequence":"청취 확인 압력이 후속 지역으로 남는다","display_surface":"studio_log","implementation_phase":"optional_trace","protected_playable":["BROAD-10"],"forbidden_overlap":["노라 기능 선점"]},
  {"reaction_id":"e02_sr_024","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"passage_tag","trigger_flag":"e02_gate_unpassed_log_seen","threshold_or_condition":"개찰 미통과 로그 후 판독기 접근","reaction_form":"장치 음성","line_or_change":"정기권은 매일을 기억하지만, 오늘의 사람은 매번 다시 판독합니다.","consequence":"통행태그가 소모품처럼 보이지 않고 판정 흔적으로 남는다","display_surface":"pass_reader","implementation_phase":"revisit","protected_playable":["GATE-09"],"forbidden_overlap":["무료 재통과"]},
  {"reaction_id":"e02_sr_025","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"human_stability","trigger_flag":"e02_transfer_hold_spoken","threshold_or_condition":"보류관 대면 후 인간 안정도 낮음","reaction_form":"장치 음성","line_or_change":"게이트가 닫힌 건 길이 닫힌 게 아니라 기록이 먼저 닫힌 겁니다.","consequence":"개찰 실패가 구원이 아니라 기록 압력으로 남는다","display_surface":"pass_reader","implementation_phase":"revisit","protected_playable":["GATE-09"],"forbidden_overlap":["개찰 튜토리얼"]},
  {"reaction_id":"e02_sr_026","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"campaign_density","trigger_flag":"e02_platform_residue_preserved","threshold_or_condition":"잔류 명단 보존","reaction_form":"로그","line_or_change":"환승 시간은 끝났고, 환승 판정은 아직 남아 있습니다.","consequence":"잔류표가 더 선명해지고 캠페인 농도가 오른다","display_surface":"platform_list","implementation_phase":"post_boss","protected_playable":["GATE-09"],"forbidden_overlap":["해금 장면 대체"]},
  {"reaction_id":"e02_sr_027","target_seed":"g_E02_C07_g4_001","campaign":"E02_C07","trigger_state":"signal_tag","trigger_flag":"e02_last_train_missed","threshold_or_condition":"막차 안내 신호 약화","reaction_form":"전광판","line_or_change":"미통과는 실패가 아닙니다. 실패로 처리되기 전 단계입니다.","consequence":"신호 약화가 길 안내가 아니라 판정 지연으로 읽힌다","display_surface":"billboard","implementation_phase":"optional_trace","protected_playable":["GATE-09"],"forbidden_overlap":["빠른 이동 안내"]},
  {"reaction_id":"e02_sr_028","target_seed":"g_E02_C04_g4_001","campaign":"E02_C04","trigger_state":"robot_autonomy","trigger_flag":null,"threshold_or_condition":"로봇 자율성 상승","reaction_form":"문서","line_or_change":"자율 판단 부품은 정품 여부와 별도로 회수됩니다.","consequence":"자율성이 리콜 사유로 오독된다","display_surface":"inspection_sheet","implementation_phase":"optional_trace","protected_playable":["PATCH","RIO"],"forbidden_overlap":["로봇 동료/수리 NPC"]},
  {"reaction_id":"e02_sr_029","target_seed":"g_E02_C04_g4_001","campaign":"E02_C04","trigger_state":"charge_tag","trigger_flag":null,"threshold_or_condition":"충전태그 부족","reaction_form":"문서","line_or_change":"충전 부족 상태의 미세 균열은 사용자 과실로 분류되지 않음.","consequence":"차단/검수 압력이 남지만 강화는 열리지 않는다","display_surface":"inspection_sheet","implementation_phase":"optional_trace","protected_playable":["METER","PATCH"],"forbidden_overlap":["충전/강화 UI"]},
  {"reaction_id":"e02_sr_030","target_seed":"g_E02_C04_g4_001","campaign":"E02_C04","trigger_state":"trace_preservation","trigger_flag":null,"threshold_or_condition":"리콜 라벨 조각 보존","reaction_form":"잔향 오브젝트","line_or_change":"리콜 라벨의 이름 칸이 모델명으로 덮인다","consequence":"사람 이름 없이 정품 절차의 흔적만 남는다","display_surface":"inspection_sheet","implementation_phase":"optional_trace","protected_playable":["PATCH","RIO"],"forbidden_overlap":["정품 복구 설명"]},
  {"reaction_id":"e02_sr_031","target_seed":"g_E02_C08_g4_001","campaign":"E02_C08","trigger_state":"signal_stability","trigger_flag":"e02_guidance_loop_muted","threshold_or_condition":"안내 반복 차단 후 대피실 접근","reaction_form":"장치 음성","line_or_change":"안내 없음은 정상 대피 상태입니다.","consequence":"낮은 수신이 안전과 구조 지연을 동시에 만든다","display_surface":"shelter_speaker","implementation_phase":"optional_trace","protected_playable":["QUIET-07","BROAD-10"],"forbidden_overlap":["안전지대","낮은 수신 튜토리얼"]},
  {"reaction_id":"e02_sr_032","target_seed":"g_E02_C08_g4_001","campaign":"E02_C08","trigger_state":"supply_pressure","trigger_flag":null,"threshold_or_condition":"보급 압력 상승","reaction_form":"문서","line_or_change":"비상식량 명단은 수령자보다 먼저 갱신됩니다.","consequence":"보급품은 남지만 사람의 상태는 늦게 갱신된다","display_surface":"shelter_speaker","implementation_phase":"optional_trace","protected_playable":["RATION-16","복희"],"forbidden_overlap":["회복소/보급 상점"]},
  {"reaction_id":"e02_sr_033","target_seed":"g_E02_C08_g4_001","campaign":"E02_C08","trigger_state":"extraction_stability","trigger_flag":null,"threshold_or_condition":"인양 안정도 낮음","reaction_form":"장치 음성","line_or_change":"구조 요청은 낮은 음량으로 보존됩니다.","consequence":"보급소 인양 단서는 약해지고 대피소는 안전하지 않다","display_surface":"shelter_speaker","implementation_phase":"optional_trace","protected_playable":["QUIET-07"],"forbidden_overlap":["긴급 인양 안정화"]},
  {"reaction_id":"e02_sr_034","target_seed":"g_E02_C01_g4_001","campaign":"E02_C01","trigger_state":"residence_tag","trigger_flag":null,"threshold_or_condition":"거주태그 흔들림","reaction_form":"로그","line_or_change":"동반 가족 정기권은 세대 갱신 후 다시 판독됩니다.","consequence":"가족권이 이동권보다 먼저 갱신된다","display_surface":"commuter_pass_log","implementation_phase":"optional_trace","protected_playable":["OPEN-HOST"],"forbidden_overlap":["R01 가족칸 반복"]},
  {"reaction_id":"e02_sr_035","target_seed":"g_E02_C01_g4_001","campaign":"E02_C01","trigger_state":"passage_tag","trigger_flag":"e02_gate_unpassed_log_seen","threshold_or_condition":"개찰 미통과 로그 확인 후 가족권 로그 접근","reaction_form":"거래 로그","line_or_change":"미통과 가족권은 대표 통근자에게 임시 귀속됩니다.","consequence":"한 사람의 통행 실패가 가족 단위로 번진다","display_surface":"commuter_pass_log","implementation_phase":"optional_trace","protected_playable":["GATE-09","OPEN-HOST"],"forbidden_overlap":["빠른 이동","가족 구출"]},
  {"reaction_id":"e02_sr_036","target_seed":"g_E02_C01_g4_001","campaign":"E02_C01","trigger_state":"human_stability","trigger_flag":"e02_last_train_missed","threshold_or_condition":"막차 종료 후 가족권 알림 확인","reaction_form":"문서","line_or_change":"막차 전 세대 알림은 이미 읽은 사람에게만 재발송됩니다.","consequence":"안정도 회복 없이 가족/통근 압력만 남는다","display_surface":"commuter_pass_log","implementation_phase":"optional_trace","protected_playable":["OPEN-HOST"],"forbidden_overlap":["주거 튜토리얼","R01 재탕"]}
]
```

---

## 6. flags JSON

```json
[
  {"flag":"e02_locker_expiry_seen","set_by_application":"e02_app_001","read_by_applications":["e02_app_005","e02_app_017","e02_app_019"],"player_facing_surface":["locker_ui","locker_log","hub_reaction"],"downstream_effect":"보관 만료 확인 후 회수/보급소 반응 후보가 열린다","forbidden_unlock":["배송 전투","이름 해금"]},
  {"flag":"e02_last_train_missed","set_by_application":"e02_app_002_or_e02_c07_entry_trigger","read_by_applications":["e02_app_011","e02_app_015","e02_app_018","e02_app_027","e02_app_036"],"player_facing_surface":["collection_room_light","direct_encounter","billboard","commuter_pass_log"],"downstream_effect":"막차 이후 회수실/플랫폼/가족권 압력이 열린다","forbidden_unlock":["빠른 이동","무료 환승"]},
  {"flag":"e02_locker_recipient_spoken","set_by_application":"e02_app_003","read_by_applications":[],"player_facing_surface":["direct_encounter"],"downstream_effect":"보관함 앞 제한 대면 완료만 기록한다","forbidden_unlock":["반복 대면","구출 장면"]},
  {"flag":"e02_locker_extension_refused","set_by_application":"e02_app_004","read_by_applications":["e02_app_016"],"player_facing_surface":["locker_ui","receipt"],"downstream_effect":"호출 로그 약화와 닫힌 카운터 문구를 연다","forbidden_unlock":["반품 상점","즉시 보상"]},
  {"flag":"e02_disaster_phrase_delayed","set_by_application":"e02_app_006","read_by_applications":["e02_app_010","e02_app_023"],"player_facing_surface":["billboard","studio_log"],"downstream_effect":"승인 지연과 수신태그 압력을 연결한다","forbidden_unlock":["방송 장악","정답 송출"]},
  {"flag":"e02_caption_cut_recovered","set_by_application":"e02_app_009","read_by_applications":["e02_app_020"],"player_facing_surface":["caption"],"downstream_effect":"잘린 자막 보존과 편집자 반응을 연결한다","forbidden_unlock":["세계 진실 공개"]},
  {"flag":"e02_guidance_loop_muted","set_by_application":"e02_app_008","read_by_applications":["e02_app_021","e02_app_031"],"player_facing_surface":["billboard","shelter_speaker"],"downstream_effect":"반복 안내 차단 후 무음 대피소 압력을 연다","forbidden_unlock":["낮은 수신 튜토리얼","안전지대"]},
  {"flag":"e02_phrase_approved_too_late","set_by_application":"e02_app_007","read_by_applications":["e02_app_022"],"player_facing_surface":["caption","studio_log"],"downstream_effect":"늦은 승인 문구와 인간 안정도 압력을 연결한다","forbidden_unlock":["공식 안내 버프"]},
  {"flag":"e02_gate_unpassed_log_seen","set_by_application":"e02_app_012","read_by_applications":["e02_app_024","e02_app_035"],"player_facing_surface":["gate_log","pass_reader","commuter_pass_log"],"downstream_effect":"개찰 미통과가 정기권/가족권 판독으로 번진다","forbidden_unlock":["GATE-09 해금 대체","빠른 이동"]},
  {"flag":"e02_transfer_hold_spoken","set_by_application":"e02_app_011","read_by_applications":["e02_app_013","e02_app_025"],"player_facing_surface":["direct_encounter","pass_reader"],"downstream_effect":"보류관 대면 후 판독기 반응을 바꾼다","forbidden_unlock":["플랫폼 구출","개찰 튜토리얼"]},
  {"flag":"e02_platform_residue_preserved","set_by_application":"e02_app_014","read_by_applications":["e02_app_026"],"player_facing_surface":["platform_list"],"downstream_effect":"잔류 명단 보존과 캠페인 농도 상승을 연결한다","forbidden_unlock":["HP 0 처리 대체"]}
]
```

---

## 7. state_keys JSON

```json
[
  {"state_key":"delivery_state","used_by_applications":["e02_app_001","e02_app_004","e02_app_016"],"read_only_or_mutating":"mutating candidate","allowed_effect":"보관 만료, 연장 거부, 회수 기록 변화","forbidden_effect":"배송 전투, 상점 보상"},
  {"state_key":"passage_tag","used_by_applications":["e02_app_002","e02_app_011","e02_app_012","e02_app_024","e02_app_035"],"read_only_or_mutating":"read mostly","allowed_effect":"막차/개찰/가족권 판정 지연","forbidden_effect":"빠른 이동, 무료 통과"},
  {"state_key":"signal_tag","used_by_applications":["e02_app_005","e02_app_010","e02_app_015","e02_app_017","e02_app_023","e02_app_027"],"read_only_or_mutating":"read mostly","allowed_effect":"보급소 비콘 흔들림, 알림/방송 신호 어긋남","forbidden_effect":"수신태그 보상, 정답 공개"},
  {"state_key":"signal_stability","used_by_applications":["e02_app_006","e02_app_020","e02_app_031"],"read_only_or_mutating":"read mostly","allowed_effect":"전광판/자막/대피소 안내 변화","forbidden_effect":"방송 장악, 안전지대"},
  {"state_key":"campaign_density","used_by_applications":["e02_app_007","e02_app_014","e02_app_019","e02_app_021","e02_app_026"],"read_only_or_mutating":"mutating candidate","allowed_effect":"캠페인 압력 상승, 잔향 선명화","forbidden_effect":"보스 해금, 정답 설명"},
  {"state_key":"human_stability","used_by_applications":["e02_app_008","e02_app_013","e02_app_022","e02_app_025","e02_app_036"],"read_only_or_mutating":"read mostly","allowed_effect":"불안정 문구, 재판독, 안정도 회복 없는 후폭풍","forbidden_effect":"회복소, 안정도 보상"},
  {"state_key":"trace_preservation","used_by_applications":["e02_app_003","e02_app_009","e02_app_018","e02_app_030"],"read_only_or_mutating":"mutating candidate","allowed_effect":"흔적 보존, 자막/라벨/보관 흔적 유지","forbidden_effect":"본명 해금, 구출 확정"},
  {"state_key":"robot_autonomy","used_by_applications":["e02_app_028"],"read_only_or_mutating":"read mostly","allowed_effect":"자율 판단 흔적을 리콜 사유로 표시","forbidden_effect":"로봇 동료 추가, PATCH 대체"},
  {"state_key":"charge_tag","used_by_applications":["e02_app_029"],"read_only_or_mutating":"read only","allowed_effect":"충전 부족을 검수 압력으로 표시","forbidden_effect":"충전/강화 UI"},
  {"state_key":"extraction_stability","used_by_applications":["e02_app_033"],"read_only_or_mutating":"read mostly","allowed_effect":"인양 단서 약화, 보급소 비콘 불안","forbidden_effect":"긴급 인양 안정화"},
  {"state_key":"residence_tag","used_by_applications":["e02_app_034"],"read_only_or_mutating":"read mostly","allowed_effect":"세대 갱신/가족권 재판독 노출","forbidden_effect":"OPEN-HOST 주거 안내 대체"},
  {"state_key":"supply_pressure","used_by_applications":["e02_app_032"],"read_only_or_mutating":"read mostly","allowed_effect":"대피소 보급 압력과 사람 상태 지연 표시","forbidden_effect":"보급 상점, 회복소"}
]
```

---

## 8. validation_manifest JSON

```json
{
  "actual_files_created": false,
  "checks": [
    {"check_id":"targets_count","expected":9,"actual":9,"result":"pass","evidence":"manifest counts.targets"},
    {"check_id":"applications_count","expected":36,"actual":36,"result":"pass","evidence":"applications JSON length"},
    {"check_id":"reactions_count","expected":36,"actual":36,"result":"pass","evidence":"reactions JSON length"},
    {"check_id":"object_texts_count","expected":18,"actual":18,"result":"pass","evidence":"object_texts JSON length"},
    {"check_id":"reaction_only_count","expected":8,"actual":8,"result":"pass","evidence":"applications with is_reaction_only true and object_text_id null"},
    {"check_id":"direct_encounter_count","expected":2,"actual":2,"result":"pass","evidence":"e02_app_003 and e02_app_011 only"},
    {"check_id":"flags_count","expected":11,"actual":11,"result":"pass","evidence":"flags JSON length"},
    {"check_id":"state_keys_count","expected":12,"actual":12,"result":"pass","evidence":"state_keys JSON length"},
    {"check_id":"protected_playable_count","expected":12,"actual":12,"result":"pass","evidence":"GATE-09, BROAD-10, RETURN-05, QUIET-07, OPEN-HOST, PATCH, METER, RIO, 미나, 복희, 세븐, RATION-16"},
    {"check_id":"forbidden_unlock_count","expected":16,"actual":16,"result":"pass","evidence":"schema handoff forbidden_unlock enum retained"},
    {"check_id":"no_overflow_ids","expected":true,"actual":true,"result":"pass","evidence":"no e02_app_037, e02_sr_037, e02_obj_019 or higher"},
    {"check_id":"no_actual_files_created","expected":true,"actual":true,"result":"pass","evidence":"Markdown package only; data/e02 output files not created"}
  ]
}
```

---

## 9. 실제 파일 생성 게이트

이번 문서에서는 실제 파일을 만들지 않았다.

실제 파일 생성이 필요하면 별도 작업으로 아래 후보만 제안한다.

```text
data/e02/first_slice_applications.json
data/e02/first_slice_object_texts.json
data/e02/first_slice_reactions.json
data/e02/first_slice_flags.json
data/e02/first_slice_state_keys.json
data/e02/first_slice_validation.json
```

게이트 조건:

```text
Markdown 패키지 검산 통과.
엔진 포맷 JSON 확정.
저장 경로 data/e02/ 확정.
실제 파일 생성 명시 지시 수신.
```

금지:

```text
별도 명시 없이 data/e02/*.json 작성 금지.
CSV, Godot 리소스, GDScript 병행 작성 금지.
새 ID, 새 문구, 새 NPC 추가 금지.
```

---

## 10. 최종 검산

```text
[x] JSON 코드블록은 parseable JSON 구조로 작성했다.
[x] e02_app_001~036이 모두 정확히 1회 있다.
[x] e02_sr_001~036이 모두 정확히 1회 있다.
[x] e02_obj_001~018이 모두 정확히 1회 있다.
[x] e02_app_037, e02_sr_037, e02_obj_019 이상이 없다.
[x] reaction-only 8행의 object_text_id는 모두 null이다.
[x] 직접 대면은 e02_app_003, e02_app_011뿐이다.
[x] 플래그 11개가 기존 read/set 그래프를 유지한다.
[x] 상태 키 12개가 기존 허용 효과만 가진다.
[x] 플레이어블 보호 대상 12개가 빠지지 않았다.
[x] 금지 해금 16개 기준을 유지한다.
[x] actual_files_created는 false다.
[x] 실제 JSON/CSV/Godot 리소스 파일을 작성하지 않았다.
```

---

## 11. 최종 판정

```text
판정:
엔진 데이터 패키지 작성 완료

다음 작업:
실제 JSON 파일 생성 여부 결정 완료.
조건 해소 문서까지 완료.
실제 파일 생성은 다음 actual JSON writing 프롬프트와 별도 명시 지시가 있을 때만 진행한다.
```

후속 결정 문서:

```text
story/03_regions/e02_first_slice_json_file_creation_decision_v0_1.md
story/03_regions/e02_first_slice_json_file_creation_condition_patch_v0_1.md
```
