# R01 NPC 대사 은행 v0.1

## 문서 상태

상태:
작성 완료.

목적:
R01 NPC 12명의 런 전후 반응을 구현 데이터로 넘길 수 있게 정리한다.

기준:
```text
이 문서는 멋진 대사집이 아니라 조건 대사 은행이다.
대사는 짧고, 플래그에 붙고, 그 NPC의 오판이 한 줄에 보여야 한다.
구원 완료처럼 말하지 않고, 덜 위험해진 조건과 남은 대가를 함께 남긴다.
```

---

## 0. 사용 규칙

표 구조는 아래 네 칸으로 고정한다.

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 코드명 | 상태값/플래그/시점 조건 | 런 전후 한 줄 반응 | `first_meet`, `state_low`, `choice_success` 등 |

대사 작성 금지:

```text
상태값 이름을 직접 설명하지 않는다.
NPC가 세계관을 장문으로 설명하지 않는다.
이름 해금 대사를 구원 완료처럼 쓰지 않는다.
MAIL-LOOP와 VAC-0에는 사람 본명을 붙이지 않는다.
FRAME-LEFT는 사진 속 유령처럼 말하지 않는다.
```

용도 키:

| 용도 | 설명 |
|---|---|
| `first_meet` | 첫 대면 또는 첫 직접 반응 |
| `state_low` | 주 상태값 낮음 반응 |
| `state_mid` | 주 상태값 중간 반응 |
| `state_high` | 주 상태값 높음 반응 |
| `choice_success` | 권장 또는 덜 위험한 선택 직후 |
| `choice_hold` | 보류 선택 또는 아직 정리되지 않은 상태 |
| `choice_fail` | 빠른 해결/강제/파괴 선택 후폭풍 |
| `boss_before` | 보스 전 또는 보스 직전 |
| `boss_after` | 보스 직후 |
| `p1_revisit` | P1 재방문 |
| `name_unlock` | 본명/이름 조각 해금 후 |
| `name_blocked` | 사람 이름이 없는 NPC의 이름 부여 차단 |
| `combo_reaction` | 상태값 조합 위험 반응 |

---

## 1. 전체 조건 묶음

주요 상태값 조건:

| 조건 | 의미 |
|---|---|
| `human_stability_low/mid/high` | 인간 안정도 낮음/중간/높음 |
| `campaign_density_low/mid/high` | 캠페인 농도 낮음/중간/높음 |
| `trace_preservation_low/mid/high` | 흔적 보존 낮음/중간/높음 |
| `robot_autonomy_low/mid/high` | 로봇 자율성 낮음/중간/높음 |
| `supply_pressure_low/mid/high` | 보급 압력 낮음/중간/높음 |
| `signal_tag_low/mid/high` | 수신태그 낮음/중간/높음 |
| `passage_tag_low/mid/high` | 통행태그 낮음/중간/높음 |
| `residence_tag_low/mid/high` | 거주태그 낮음/중간/높음 |
| `ration_tag_low/mid/high` | 식량태그 낮음/중간/높음 |
| `charge_tag_low/mid/high` | 충전태그 낮음/중간/높음 |
| `extraction_stability_low/mid/high` | 인양 안정도 낮음/중간/높음 |

주요 조합 조건:

| 조건 | 우선 사용 NPC |
|---|---|
| `campaign_high_trace_high` | NAME-PAINTER, MAIL-LOOP, FRAME-LEFT |
| `human_low_queue_broken` | PORCH-LINE, WELCOME-DESK |
| `extraction_low_silent_route` | DRAIN-MARK, SIGN-BACK |
| `residence_high_ration_high` | ROOM-12, DINING-4 |
| `signal_high_campaign_high` | MAIL-LOOP, SIGN-BACK, FRAME-LEFT |
| `robot_low_trace_low` | VAC-0, NAME-PAINTER |
| `passage_low_supply_high` | OPEN-HOST, KEY-RING, DRAIN-MARK |
| `charge_high_robot_low` | VAC-0 |

---

## 2. NPC별 대사 은행

### 2.1 OPEN-HOST / 서이겸

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| OPEN-HOST | `first_meet` | 그쪽은 안전한 길이 아니에요. 안전해 보이는 길이에요. | `first_meet` |
| OPEN-HOST | `campaign_density_low` | 안내판이 조용하면, 제가 틀렸는지도 늦게 알게 됩니다. | `state_low` |
| OPEN-HOST | `campaign_density_mid` | 제 안내와 저쪽 안내가 같은 문장을 쓰기 시작했네요. | `state_mid` |
| OPEN-HOST | `campaign_density_high` | 환영 문구가 친절할수록, 발을 늦게 떼세요. | `state_high` |
| OPEN-HOST | `open_host_route_verified` | 확인된 길만 쓰죠. 저도 제 지도를 전부 믿지 않습니다. | `choice_success` |
| OPEN-HOST | `open_host_route_rejected` | 거절해도 됩니다. 다만 돌아가는 동안 누가 줄에 남는지는 봐야 해요. | `choice_hold` |
| OPEN-HOST | `open_host_route_published` | 모두가 아는 길은, 저쪽도 빨리 배웁니다. | `choice_fail` |
| OPEN-HOST | `boss_before` | 저를 너무 빨리 믿지 마세요. 저도 아직 제 안내를 확인 중이에요. | `boss_before` |
| OPEN-HOST | `boss_after` | 그때는 그 길이 살리는 길이라고 믿었습니다. 아직 사과로는 부족하죠. | `boss_after` |
| OPEN-HOST | `p1_revisit` | 길은 세 개예요. 어느 쪽도 공짜는 아니에요. | `p1_revisit` |
| OPEN-HOST | `open_host_name_fragment` | 이겸이라고 불러도 됩니다. 길을 맡기라는 뜻은 아니고요. | `name_unlock` |
| OPEN-HOST | `passage_low_supply_high` | 빠른 우회가 필요할수록, 그 길의 계산서를 먼저 봐야 합니다. | `combo_reaction` |

### 2.2 ROOM-12 / 강연우

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| ROOM-12 | `first_meet` | 제가 나가면 저 사람들 저녁이 끊겨요. | `first_meet` |
| ROOM-12 | `ration_tag_low` | 숟가락 하나가 빠져도, 저쪽은 가족이 줄었다고 읽어요. | `state_low` |
| ROOM-12 | `ration_tag_mid` | 오늘 저녁은 나왔습니다. 그래서 더 조심해야 해요. | `state_mid` |
| ROOM-12 | `ration_tag_high` | 배급이 안정될수록, 대표 이름을 더 크게 부릅니다. | `state_high` |
| ROOM-12 | `room12_bypass_ration` | 오늘은 손을 떼도 저녁이 바로 끊기지 않았어요. | `choice_success` |
| ROOM-12 | `room12_left_in_place` | 여기 남는 게 편해서가 아닙니다. 아직 끊기면 안 돼서예요. | `choice_hold` |
| ROOM-12 | `room12_forced_removed` | 제 자리는 비었는데, 저녁표는 아직 거기 남아 있어요. | `choice_fail` |
| ROOM-12 | `boss_before` | 저 사람은 누가 앉을까 봐 못 일어나고, 저는 끊길까 봐 못 일어나요. | `boss_before` |
| ROOM-12 | `boss_after` | 대표가 빠지면 가족이 무너진대요. 저는 그 말을 너무 오래 믿었어요. | `boss_after` |
| ROOM-12 | `p1_revisit` | 오늘은 조금 일어나도 저녁이 바로 끊기지 않았어요. | `p1_revisit` |
| ROOM-12 | `room12_name_fragment` | 연우라는 이름을 밖에 맡겨도, 이 자리가 바로 무너지진 않네요. | `name_unlock` |
| ROOM-12 | `residence_high_ration_high` | 방도 저녁도 안정됐는데, 왜 대표 칸은 더 단단해지는 걸까요. | `combo_reaction` |

### 2.3 PORCH-LINE / 백지호

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| PORCH-LINE | `first_meet` | 줄이 좋은 건 아닙니다. 줄이 없으면 주먹이 순서가 됩니다. | `first_meet` |
| PORCH-LINE | `human_stability_low` | 지금은 사람들이 서로보다 앞번호를 먼저 봅니다. | `state_low` |
| PORCH-LINE | `human_stability_mid` | 조금 늦어도 참는 사람이 생겼습니다. 그게 오늘은 큽니다. | `state_mid` |
| PORCH-LINE | `human_stability_high` | 오늘은 사람들이 앞사람 이름을 기억하네요. | `state_high` |
| PORCH-LINE | `porch_line_flexible_ticket` | 표는 흐려졌지만, 사람은 덜 밀렸습니다. | `choice_success` |
| PORCH-LINE | `porch_line_exact_queue` | 줄은 조용한데, 순번표가 너무 잘 읽힙니다. | `choice_hold` |
| PORCH-LINE | `porch_line_dispersed` | 줄이 사라지면 약한 사람부터 뒤로 밀립니다. | `choice_fail` |
| PORCH-LINE | `boss_before` | 순번표가 너무 정확해도 다칩니다. | `boss_before` |
| PORCH-LINE | `boss_after` | 끝났다는 말이 제일 위험합니다. 사람들은 그때 줄을 놓거든요. | `boss_after` |
| PORCH-LINE | `p1_revisit` | 줄이 아니라 표로 남겨도 되는 거군요. 사람이 밀리지 않는다면. | `p1_revisit` |
| PORCH-LINE | `porch_line_name_fragment` | 지호라고 적어도, 제 차례가 끝났다는 뜻은 아니죠. | `name_unlock` |
| PORCH-LINE | `human_low_queue_broken` | 현관이 밀리면, 상담표도 사람을 밀기 시작합니다. | `combo_reaction` |

### 2.4 NAME-PAINTER / 임하온

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| NAME-PAINTER | `first_meet` | 이름은 번지면 더 오래 남아요. 맞는 이름인지는 늦게 알지만요. | `first_meet` |
| NAME-PAINTER | `trace_preservation_low` | 이름이 너무 빨리 지워져요. 그래서 손이 먼저 움직입니다. | `state_low` |
| NAME-PAINTER | `trace_preservation_mid` | 이 조각은 칠하기 전에 말려도 되겠네요. | `state_mid` |
| NAME-PAINTER | `trace_preservation_high` | 남긴 이름이 저쪽에도 읽힐까 봐, 손이 안 떨어집니다. | `state_high` |
| NAME-PAINTER | `name_painter_names_to_bokhee` | 그 이름은 문패 밖에 두겠습니다. 번지지 않게요. | `choice_success` |
| NAME-PAINTER | `name_painter_names_kept` | 그대로 두면 남습니다. 누구에게 붙는지는 모르지만요. | `choice_hold` |
| NAME-PAINTER | `name_painter_names_erased` | 빈 문패는 깨끗하지 않습니다. 초대장처럼 보입니다. | `choice_fail` |
| NAME-PAINTER | `boss_before` | 제가 이름을 칠하면, 저쪽은 그 위에 역할을 붙입니다. | `boss_before` |
| NAME-PAINTER | `boss_after` | 얼굴도 이름처럼 틀릴 수 있나요? | `boss_after` |
| NAME-PAINTER | `p1_revisit` | 칠하지 않아도 남길 수 있다는 걸 배웠습니다. | `p1_revisit` |
| NAME-PAINTER | `name_painter_name_fragment` | 하온은 문패에 말리지 않겠습니다. 아직 확인 중인 이름이라서요. | `name_unlock` |
| NAME-PAINTER | `campaign_high_trace_high` | 읽을 수 있게 남긴 이름을, 저쪽도 읽기 시작했습니다. | `combo_reaction` |
| NAME-PAINTER | `robot_low_trace_low` | 청소가 끝난 문패는 빈칸보다 더 새것처럼 보입니다. | `combo_reaction` |

### 2.5 MAIL-LOOP / 본명 없음

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| MAIL-LOOP | `first_meet` | 주소가 남아 있습니다. 사람은 확인되지 않았습니다. | `first_meet` |
| MAIL-LOOP | `signal_tag_low` | 수신 실패. 반송 사유도 반송되었습니다. | `state_low` |
| MAIL-LOOP | `signal_tag_mid` | 주소와 이름이 일치하지 않습니다. 보류함에 넣습니다. | `state_mid` |
| MAIL-LOOP | `signal_tag_high` | 호출 가능. 오호출 가능. 둘 다 선명합니다. | `state_high` |
| MAIL-LOOP | `mail_loop_call_hold` | 주소 보관. 가족 호출은 진행하지 않습니다. | `choice_success` |
| MAIL-LOOP | `mail_loop_active` | 배송 대기. 가장 가까운 현관을 확인해 주세요. | `choice_hold` |
| MAIL-LOOP | `mail_loop_shutdown` | 수신 종료. 반송 기록도 확인할 수 없습니다. | `choice_fail` |
| MAIL-LOOP | `boss_before` | 가족 수령 대기. 가장 가까운 현관으로 이동해 주세요. | `boss_before` |
| MAIL-LOOP | `boss_after` | 촬영 기록 수신. 주소와 얼굴은 아직 일치하지 않습니다. | `boss_after` |
| MAIL-LOOP | `p1_revisit` | 반송 기록 보관. 가족 배정은 진행하지 않습니다. | `p1_revisit` |
| MAIL-LOOP | `mail_loop_no_person_name` | 사람 이름 없음. 주소 호출명으로 전환하지 않습니다. | `name_blocked` |
| MAIL-LOOP | `mail_loop_logs_split` | 이름은 보관함으로, 주소는 분석함으로 분리합니다. | `choice_success` |
| MAIL-LOOP | `signal_high_campaign_high` | 진짜 호출과 광고 호출이 같은 음량으로 들어옵니다. | `combo_reaction` |
| MAIL-LOOP | `campaign_high_trace_high` | 남은 주소가 사람의 길인지, 저쪽의 길인지 확인 필요. | `combo_reaction` |

### 2.6 VAC-0 / 본명 없음

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| VAC-0 | `first_meet` | 안전한 집을 위해 흔적을 정리합니다. | `first_meet` |
| VAC-0 | `robot_autonomy_low` | 분류 없음. 오염 후보를 흡입합니다. | `state_low` |
| VAC-0 | `robot_autonomy_mid` | 제외 목록 확인. 먼지와 메모를 분리합니다. | `state_mid` |
| VAC-0 | `robot_autonomy_high` | 이것도 치워야 합니까? | `state_high` |
| VAC-0 | `vac0_exclusion_list` | 청소 제외 등록. 이름 조각은 흡입하지 않습니다. | `choice_success` |
| VAC-0 | `vac0_disabled` | 정지했습니다. 위험물도 그대로 남아 있습니다. | `choice_hold` |
| VAC-0 | `vac0_unrestricted` | 정리 완료. 새 가족을 맞이할 준비가 되었습니다. | `choice_fail` |
| VAC-0 | `boss_before` | 식탁 주변 흔적 정리 대기. 입주 준비율 상승. | `boss_before` |
| VAC-0 | `boss_after` | 흔적 후보 감지. 정리 대기. | `boss_after` |
| VAC-0 | `p1_revisit` | PATCH 분류 임시 적용. 질문 모드 유지 시간이 짧습니다. | `p1_revisit` |
| VAC-0 | `vac0_no_person_name` | 개체명 VAC-0 유지. 별칭 등록은 보류합니다. | `name_blocked` |
| VAC-0 | `vac0_first_question` | 치우지 말아야 하는 먼지는 어느 쪽입니까? | `state_high` |
| VAC-0 | `charge_high_robot_low` | 충전 충분. 질문 없음. 효율 청소를 시작합니다. | `combo_reaction` |
| VAC-0 | `robot_low_trace_low` | 청소 완료. 남은 사람 흔적 없음. | `combo_reaction` |

### 2.7 DRAIN-MARK / 문채율

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| DRAIN-MARK | `first_meet` | 조용한 길은 살려주기도 하고, 못 찾게도 합니다. | `first_meet` |
| DRAIN-MARK | `extraction_stability_low` | 여기서 쓰러지면, 캠페인도 늦고 보급소도 늦습니다. | `state_low` |
| DRAIN-MARK | `extraction_stability_mid` | 이 표식까지만 찾게 해도, 깊은 곳은 아직 숨습니다. | `state_mid` |
| DRAIN-MARK | `extraction_stability_high` | 찾는 표식이 많아지면, 따라오는 것도 많아집니다. | `state_high` |
| DRAIN-MARK | `drain_mark_partial_extraction_point` | 여기까지만 공유하죠. 숨는 곳과 찾는 곳은 달라야 합니다. | `choice_success` |
| DRAIN-MARK | `drain_mark_hidden` | 안 들키는 길은 남습니다. 대신 아무도 늦게 옵니다. | `choice_hold` |
| DRAIN-MARK | `drain_mark_full_share` | 전부 알려주면, 제가 숨은 이유도 같이 사라집니다. | `choice_fail` |
| DRAIN-MARK | `boss_before` | 물소리가 광고를 덜 들리게 합니다. 그래서 더 위험하죠. | `boss_before` |
| DRAIN-MARK | `boss_after` | 보스가 끝나도 회수선은 여기까지 곧장 오지 않습니다. | `boss_after` |
| DRAIN-MARK | `p1_revisit` | 숨는 표식과 찾는 표식은 달라야겠네요. | `p1_revisit` |
| DRAIN-MARK | `drain_mark_name_fragment` | 채율이라는 표식은 벽에 긁지 마세요. 찾을 사람만 알면 됩니다. | `name_unlock` |
| DRAIN-MARK | `extraction_low_silent_route` | 자유처럼 보이는 길일수록, 쓰러진 뒤가 비어 있습니다. | `combo_reaction` |
| DRAIN-MARK | `passage_low_supply_high` | 급할수록 배수로가 넓어 보입니다. 그게 함정입니다. | `combo_reaction` |

### 2.8 SIGN-BACK / 권태오

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| SIGN-BACK | `first_meet` | 친절한 길은 보통 위험합니다. | `first_meet` |
| SIGN-BACK | `signal_tag_low` | 소리가 안 들리면, 글자만 믿게 됩니다. 그게 제일 싫습니다. | `state_low` |
| SIGN-BACK | `signal_tag_mid` | 글자와 비콘이 서로 다른 쪽을 가리킵니다. 아직 멈추세요. | `state_mid` |
| SIGN-BACK | `signal_tag_high` | 진짜 신호도 커졌고, 흉내 내는 소리도 같이 커졌습니다. | `state_high` |
| SIGN-BACK | `sign_back_fake_beacon_blocked` | 이제 돌아간다는 소리만으로는 아무도 보내지 않겠습니다. | `choice_success` |
| SIGN-BACK | `sign_back_sign_rotated` | 표지판은 돌렸습니다. 저쪽이 다시 돌리기 전까지요. | `choice_hold` |
| SIGN-BACK | `sign_back_sign_destroyed` | 경고도 같이 부쉈습니다. 이제 모르는 사람이 더 위험합니다. | `choice_fail` |
| SIGN-BACK | `boss_before` | 보급소처럼 보이는 길이 생기면, 먼저 의심하세요. | `boss_before` |
| SIGN-BACK | `boss_after` | 위험한 신호보다 친절한 길을 믿고 싶어지는 순간이 제일 위험합니다. | `boss_after` |
| SIGN-BACK | `p1_revisit` | 돌아가는 길은 글자가 아니라, 닿는 줄로 확인해야 합니다. | `p1_revisit` |
| SIGN-BACK | `sign_back_name_fragment` | 태오라고 적어도 됩니다. 표지판에는 쓰지 마세요. | `name_unlock` |
| SIGN-BACK | `extraction_low_silent_route` | 조용한 길이 돌아가는 길이면, 왜 아무도 돌아오지 못했을까요. | `combo_reaction` |
| SIGN-BACK | `signal_high_campaign_high` | 가짜 비콘이 이제 사람 목소리까지 배웠습니다. | `combo_reaction` |

### 2.9 KEY-RING / 노기준

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| KEY-RING | `first_meet` | 문은 열리는데, 집이 다른 이름을 부릅니다. | `first_meet` |
| KEY-RING | `passage_tag_low` | 맞는 열쇠가 있어도, 문 뒤가 맞는 집은 아닙니다. | `state_low` |
| KEY-RING | `passage_tag_mid` | 열쇠, 주소, 문패가 셋 다 같은 말을 하는지 봅시다. | `state_mid` |
| KEY-RING | `passage_tag_high` | 길은 열렸습니다. 그래서 기록도 같이 열렸습니다. | `state_high` |
| KEY-RING | `key_ring_pending_board` | 오늘은 열지 않겠습니다. 확인 대기로 묶어두죠. | `choice_hold` |
| KEY-RING | `key_ring_cross_checked` | 오래 걸려도, 문 하나를 덜 잘못 열었습니다. | `choice_success` |
| KEY-RING | `key_ring_opened_by_key` | 열쇠는 맞았습니다. 사람은 아직 확인하지 못했습니다. | `choice_fail` |
| KEY-RING | `boss_before` | 문패와 주소가 맞물릴수록, 열쇠만 믿는 게 더 위험합니다. | `boss_before` |
| KEY-RING | `boss_after` | 사진이 남은 집은 문보다 먼저 사람을 부릅니다. | `boss_after` |
| KEY-RING | `p1_revisit` | 열쇠판에 보류 칸을 만들었습니다. 빈칸도 잠가야 해서요. | `p1_revisit` |
| KEY-RING | `key_ring_name_fragment` | 기준이라는 이름표는 열쇠에 달지 않겠습니다. 아직 문이 확인 중이라서요. | `name_unlock` |
| KEY-RING | `passage_low_supply_high` | 급한 문일수록 빨리 열립니다. 그래서 더 늦게 확인해야 합니다. | `combo_reaction` |

### 2.10 DINING-4 / 류가람

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| DINING-4 | `first_meet` | 의자를 빼지 마세요. 자리가 생겨요. | `first_meet` |
| DINING-4 | `residence_tag_low` | 이 집은 사람보다 빈칸을 먼저 봅니다. | `state_low` |
| DINING-4 | `residence_tag_mid` | 의자를 조금 밀어도, 아직 아무도 앉지 않았습니다. | `state_mid` |
| DINING-4 | `residence_tag_high` | 방이 안정될수록, 가족 칸이 더 빨리 채워집니다. | `state_high` |
| DINING-4 | `dining4_fourth_seat_hold` | 빈자리에 보류 표시가 붙었습니다. 아직 누가 앉진 않았어요. | `choice_success` |
| DINING-4 | `dining4_left_seated` | 앉아 있으면 막을 수 있습니다. 제가 사라지는 대신요. | `choice_hold` |
| DINING-4 | `dining4_forced_stand` | 제가 일어났습니다. 저쪽은 벌써 새 얼굴을 찾고 있어요. | `choice_fail` |
| DINING-4 | `boss_before` | 제가 일어나면 빈자리가 생겨요. 여긴 빈자리를 그냥 두지 않아요. | `boss_before` |
| DINING-4 | `boss_after` | 오늘은 의자를 조금 밀었습니다. 아직 아무도 앉지 않았습니다. | `boss_after` |
| DINING-4 | `p1_revisit` | 자리가 비어도 바로 누군가가 들어오지 않을 수 있군요. | `p1_revisit` |
| DINING-4 | `dining4_name_fragment` | 가람이라는 이름은 의자 밑에 두지 마세요. 다시 앉으라고 부를 테니까요. | `name_unlock` |
| DINING-4 | `residence_high_ration_high` | 저녁이 안전해질수록, 네 번째 자리는 더 또렷해집니다. | `combo_reaction` |

### 2.11 WELCOME-DESK / 정해원

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| WELCOME-DESK | `first_meet` | 빈칸은 질문이 됩니다. 답하지 않으면 조금 늦출 수 있어요. | `first_meet` |
| WELCOME-DESK | `human_stability_low` | 지금 질문하면, 사람들은 빠른 답을 고릅니다. | `state_low` |
| WELCOME-DESK | `human_stability_mid` | 보류 도장을 찍어도 항의가 한 번으로 끝났습니다. | `state_mid` |
| WELCOME-DESK | `human_stability_high` | 오늘은 답하지 않은 칸이 바로 오류가 되지 않았습니다. | `state_high` |
| WELCOME-DESK | `welcome_desk_question_hold` | 질문을 보류했습니다. 답은 아직 사람에게 붙지 않았습니다. | `choice_success` |
| WELCOME-DESK | `welcome_desk_c_window` | 덜 위험한 창구입니다. 안전한 창구는 아닙니다. | `choice_hold` |
| WELCOME-DESK | `welcome_desk_fast_track` | 빠른 접수는 빠른 역할 배정을 부릅니다. | `choice_fail` |
| WELCOME-DESK | `boss_before` | 절차 안에서도 덜 다치게 만들 수 있다고 믿었습니다. | `boss_before` |
| WELCOME-DESK | `boss_after` | 상담표를 증거로 남기는 건 상담을 계속하는 것과 다르겠죠? | `boss_after` |
| WELCOME-DESK | `p1_revisit` | 이제는 창구를 추천하지 않겠습니다. 질문을 보류하는 법을 남기겠습니다. | `p1_revisit` |
| WELCOME-DESK | `welcome_desk_name_fragment` | 해원이라는 이름은 접수자 칸에 적지 마세요. 아직 질문이 살아 있습니다. | `name_unlock` |
| WELCOME-DESK | `human_low_queue_broken` | 줄이 무너지면, 질문지는 사람 대신 번호를 받습니다. | `combo_reaction` |

### 2.12 FRAME-LEFT / 아린 조각

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| FRAME-LEFT | `first_meet` | 왼쪽 칸이 먼저 남았습니다. 얼굴은 나중에 붙었습니다. | `first_meet` |
| FRAME-LEFT | `trace_preservation_low` | 가족 구성원. 왼쪽. 역할 확인. | `state_low` |
| FRAME-LEFT | `trace_preservation_mid` | 사진 뒤쪽에 글씨가 남아 있습니다. 아직 얼굴은 고정하지 마세요. | `state_mid` |
| FRAME-LEFT | `trace_preservation_high` | 이름이 선명해질수록, 사진도 저를 다시 맞추려 합니다. | `state_high` |
| FRAME-LEFT | `frame_left_name_to_bokhee` | 이름은 사진 밖에 있어도, 제가 바로 지워지진 않네요. | `choice_success` |
| FRAME-LEFT | `frame_left_empty_slot_hold` | 빈칸을 비워두면, 얼굴이 늦게 붙습니다. | `choice_hold` |
| FRAME-LEFT | `frame_left_frame_destroyed` | 프레임이 깨지면, 남은 손글씨도 같이 사라집니다. | `choice_fail` |
| FRAME-LEFT | `boss_before` | 가족사진을 다시 촬영합니다. 움직이지 마세요. | `boss_before` |
| FRAME-LEFT | `boss_after` | 저를 꺼내지 마세요. 먼저 이름과 역할을 떼어 주세요. | `boss_after` |
| FRAME-LEFT | `p1_revisit` | 사진 밖에 이름이 있어도, 제가 없어지는 건 아니군요. | `p1_revisit` |
| FRAME-LEFT | `frame_left_arin_fragment` | 아린은 사진 안의 정답이 아니라, 밖에 맡길 조각입니다. | `name_unlock` |
| FRAME-LEFT | `campaign_high_trace_high` | 선명해진 얼굴을 저쪽도 가족으로 읽고 있습니다. | `combo_reaction` |
| FRAME-LEFT | `signal_high_campaign_high` | 원본 로그와 보정 로그가 같은 목소리로 말합니다. | `combo_reaction` |

---

## 3. 공통 후속 반응

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 복희 | `name_fragment_to_bokhee` | 이름을 맡긴다고 끝나는 건 아니야. 젖지 않게 말려두는 것부터야. | `support_reaction` |
| 복희 | `campaign_density_high + any_name_fragment` | 지금 부르면 저쪽도 들어. 오늘은 접어서 보관해. | `support_reaction` |
| 세븐 | `mail_loop_logs_split` | 주소 로그와 이름 조각을 같은 칸에 두지 않겠습니다. | `support_reaction` |
| 세븐 | `signal_tag_high + campaign_density_high` | 신호 품질은 좋습니다. 그래서 오염 신호도 잘 보입니다. | `support_reaction` |
| PATCH | `vac0_first_question` | 질문한 건 좋은데, 답을 전부 나한테 미루지는 마. | `support_reaction` |
| 미나 | `supply_pressure_high + room12_forced_removed` | 사람을 데려온 비용보다, 빈칸이 만든 비용이 더 먼저 와. | `support_reaction` |

---

## 4. 구현 전달용 필드 초안

대사 데이터 한 줄은 아래 필드를 가진다.

| 필드 | 설명 |
|---|---|
| `npc_id` | `open_host`, `room_12`, `porch_line` 등 |
| `condition_id` | 상태값/플래그/시점 조합 |
| `line` | 출력 대사 |
| `usage` | `first_meet`, `state_low`, `choice_success` 등 |
| `priority` | 조합 위험 100, 선택 후 80, 상태값 60, 기본 40 |
| `cooldown_group` | 같은 NPC의 반복 출력 방지용 그룹 |
| `locks_name_state` | 이름 조각 출력 여부 |

우선순위:

```text
1. 조합 위험 대사
2. 선택 직후 대사
3. 보스 전후/P1 시점 대사
4. 상태값 낮음/중간/높음 대사
5. 이름 조각 해금 대사
6. 첫 만남/기본 대사
```

---

## 5. 결재 포인트

1. 모든 NPC가 `NPC / 조건 / 대사 / 용도` 구조를 유지하는가?
2. 각 NPC에 첫 만남, 상태값 낮음/중간/높음, 선택 성공/보류/실패, 보스 전, 보스 후, P1 재방문, 이름 해금 후 대사가 있는가?
3. 대사가 세계관 설명문이 아니라 런 전후 한 줄 반응인가?
4. 조건 플래그가 선택 분기/상태값 문서와 연결 가능한가?
5. 상태값 조합 위험 대사가 일부 포함되어 있는가?
6. MAIL-LOOP와 VAC-0에 사람 본명을 붙이지 않았는가?
7. FRAME-LEFT가 사진 속 유령이 아니라 프로필 잔향으로 말하는가?
8. 다음 작업이 R01 NPC 데이터 스키마 초안으로 넘어갈 수 있는가?

---

## 6. 다음 작업

바로 다음 작업:

```text
R01 NPC 데이터 스키마 초안.
```

산출물 후보:

```text
story/03_regions/r01_npc_data_schema_draft_v0_1.md
```

목표:

```text
NPC 기본 프로필, 상태값 반응, 선택 플래그, 이름 해금, 대사 은행을
구현 데이터 스키마로 묶는다.

대사 은행의 condition_id, usage, priority, cooldown_group을
이벤트/상태값 시스템에서 바로 참조할 수 있게 만든다.
```

---

## 7. 최종 요약

R01 NPC 대사 은행은 캐릭터가 세계관을 설명하게 만드는 문서가 아니다.

이 문서의 대사는 다음 네 가지를 위해 존재한다.

```text
1. 플레이어가 어떤 선택을 했는지 NPC가 짧게 반응한다.
2. 상태값 낮음/중간/높음이 오브젝트와 말투로 드러난다.
3. 이름 조각 해금이 구원 완료가 아니라 보류 조건으로 남는다.
4. 다음 데이터 스키마가 바로 참조할 수 있는 조건 키가 남는다.
```

따라서 다음 단계는 대사를 더 예쁘게 늘리는 것이 아니라,
NPC / 상태값 / 선택 플래그 / 이름 해금 / 대사 조건을 한 데이터 구조로 묶는 것이다.
