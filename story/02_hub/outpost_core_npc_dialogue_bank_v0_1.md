# 침묵 보급소 초기 NPC 5명 대사 은행 v0.1

## 문서 상태

```text
상태:
스토리팀/구현팀 전달용 v0.1

용도:
침묵 보급소 초기 상주 NPC 5명의 조건 대사를 NPC / 조건 / 대사 / 용도 구조로 정리한다.

판정:
초기 구현 가능

주의:
이 문서는 긴 개인 퀘스트 대사집이 아니다.
보급소 NPC가 상점/강화/도감 UI처럼 보이지 않도록,
런 귀환, 흔적 보존, 상태값 후폭풍에 반응하는 짧은 대사를 우선한다.
```

참조 기준:

```text
story/02_hub/npcs.md
story/02_hub/silence_outpost.md
story/02_hub/outpost_core_npc_profiles_v1_0.md
story/02_hub/mina_npc_profile_v1_0.md
```

---

## 0. 사용 원칙

초기 구현은 NPC당 10줄 내외로 시작한다.

대사는 설명문이 아니라 상태 반응이어야 한다.

```text
좋은 대사:
플레이어가 방금 들고 온 흔적과 보급소 상태를 동시에 건드린다.

나쁜 대사:
시설 사용법을 길게 설명하거나 세계관 용어를 튜토리얼처럼 읊는다.
```

기본 필드:

| 필드 | 설명 |
|---|---|
| NPC | 발화자 |
| 조건 | 대사 트리거 또는 상태 플래그 |
| 대사 | 실제 표시 후보 |
| 용도 | 감정/시스템/후폭풍 목적 |

권장 조건 코드:

```text
hub_greeting_default
run_start_default
run_return_default
trace_preserved
trace_consumed
campaign_density_high
human_stability_low
robot_autonomy_high
r01_boss_after_return
```

---

## 1. 미나

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 미나 | hub_greeting_default | “왔어? 카운터 위에 올려. 좋은 소식부터 보게 해달라는 말은 안 할게.” | 기본 인사. 친절한 상점 주인 톤 방지. |
| 미나 | run_start_default | “나가면 뭐든 가져와. 쓸 수 있는 것, 쓰면 안 되는 것, 둘 다 필요해.” | 출격 전 회수물/흔적 이중성 암시. |
| 미나 | run_return_default | “살아 돌아온 건 정산 안 해. 그건 기본값이어야 하니까.” | 귀환 감정과 건조한 책임감. |
| 미나 | trace_preserved | “이건 소모 금지로 묶을게. 오늘은 손해고, 내일은 누군가의 이름일 수 있어.” | 흔적 보존 선택 확인. |
| 미나 | trace_consumed | “태그로 바꿨어. 오늘 밤은 버텨. 대신 이 물건이 누구 거였는지는 더 흐려졌고.” | 흔적 소모의 대가. |
| 미나 | campaign_density_high | “밖에서 쿠폰 냄새가 나. 좋은 조건처럼 보이면 일단 접어. 펴는 건 나중에 해.” | 캠페인 농도 상승 경고. |
| 미나 | human_stability_low | “침상이 모자라. 계산표는 맞는데, 표 밖에서 사람이 자꾸 늘어.” | 인간 안정도 낮음. |
| 미나 | robot_autonomy_high | “충전 순서표도 다시 짰어. 싫어서가 아니라, 싸움 안 나게 하려고.” | 로봇 자율성 상승과 공존 압력. |
| 미나 | r01_boss_after_return | “가족사진 조각이라. 태그로 바꾸면 값은 나와. 근데 오늘은 그렇게 하지 말자.” | R01 보스 후 흔적 보류. |
| 미나 | supply_pressure_high | “정산표가 맞으면 버틴다고 생각했는데, 표가 사람보다 먼저 숨이 차네.” | 미나의 잘못된 믿음 흔들림. |

---

## 2. 장도윤

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 장도윤 | hub_greeting_default | “장비 내려놔. 멀쩡한 척하는 부품이 제일 먼저 터져.” | 기본 인사. 정비 벤치 톤. |
| 장도윤 | run_start_default | “버튼은 하나면 돼. 문제는 그 버튼을 누른 뒤에 누가 우리를 보는지지.” | 출격 전 역송출 위험 암시. |
| 장도윤 | run_return_default | “좋아, 살아 돌아왔고 장비도 반쯤 살아 있네. 둘 중 하나만 고르라면 곤란했는데.” | 귀환 후 정비 반응. |
| 장도윤 | trace_preserved | “안 뜯는다고? 아깝긴 한데 맞는 판단일 수도 있어. 부품이 아니라 증거면 더 그렇고.” | 흔적 보존 인정. |
| 장도윤 | trace_consumed | “이걸 출력으로 돌렸어. 성능은 올라가. 대신 원래 용도는 이제 못 물어본다.” | 흔적 소모와 개조 대가. |
| 장도윤 | campaign_density_high | “저 신호, 막을 수도 있고 되쏠 수도 있어. 맞아, 후자가 더 위험하고 더 유혹적이지.” | 고위험 강화 유혹. |
| 장도윤 | human_stability_low | “오늘은 화력 말고 셔터부터 손보자. 밖을 이기는 것보다 안이 무너지지 않는 게 먼저야.” | 인간 안정도 낮음. |
| 장도윤 | robot_autonomy_high | “로봇 신호가 자기 판단을 섞기 시작했어. 좋은 소식인지, 내가 건드리면 안 되는 소식인지 아직 모르겠네.” | 로봇 자율성 상승. |
| 장도윤 | r01_boss_after_return | “가짜 비콘음? 그건 기술 문제가 아니야. 누가 구조 소리를 흉내 내기로 마음먹은 거지.” | R01 가짜 귀환/보스 후 연결. |
| 장도윤 | extraction_unstable | “역송출 장비를 세게 만들 수는 있어. 근데 회수선이 약한 날엔 세게 쏠수록 더 멀리 튕긴다.” | 인양 안정도 경고. |

---

## 3. 팝시

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 팝시 | hub_greeting_default | “상쾌한 하루를 드릴게요! ...방금 건 자동 문구예요. 다시 말할게요. 돌아와서 다행이에요.” | 기본 인사. 광고 말투와 자기 말 분리. |
| 팝시 | run_start_default | “카드를 다시 고를 수는 있어요. 하지만 나간 뒤의 길은 리롤이 안 됩니다. 아마도요.” | 출격 전 리롤 기능과 위험. |
| 팝시 | run_return_default | “먼지가 많네요. 먼지는 괜찮아요. 먼지는 돌아왔다는 뜻일 때도 있으니까요.” | 귀환 후 부드러운 반응. |
| 팝시 | trace_preserved | “보관함에 넣는 거죠? 버려진 게 아니라 기다리는 거라고 적어도 될까요?” | 흔적 보존 감정. |
| 팝시 | trace_consumed | “사용 완료 알림을 띄워야 하는데요. 음... 고맙다는 말은 물건에게도 필요한가요?” | 흔적 소모의 불편함. |
| 팝시 | campaign_density_high | “징글이 자꾸 따라와요. 제가 부르는 게 아니에요. 따라오는 거예요.” | 캠페인 농도 상승. |
| 팝시 | human_stability_low | “오늘은 큰 소리로 말하지 않을게요. 쉬는 사람들한테 광고처럼 들리면 싫으니까요.” | 인간 안정도 낮음. |
| 팝시 | robot_autonomy_high | “방금 문장은 제가 골랐어요. 짧지만, 제 문장이에요.” | 로봇 자율성 상승. |
| 팝시 | r01_boss_after_return | “가족사진은 웃고 있네요. 웃는 얼굴이 기본값이면, 기분은 어디에 저장되나요?” | R01 보스 후 FRAME-LEFT 연결. |
| 팝시 | robot_resync_warning | “반품 대상 목록에 제 모델명이 있어요. 제 이름은 아직 안 올라갔고요. 그게 좋은 건가요?” | 재동기화/리콜 불안. |

---

## 4. 세븐

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 세븐 | hub_greeting_default | “귀환 확인. 손상 기록 갱신. 생존 기록은 별도 보관하겠습니다.” | 기본 인사. 기록 로봇 톤. |
| 세븐 | run_start_default | “추천 목표가 있습니다. 버리면 안 되는 물건입니다. 아마도.” | 출격 전 회수 목표 추천. |
| 세븐 | run_return_default | “회수물 7개. 위험물 2개. 분류 보류 3개. 보류가 늘어나는 것은 좋은 징후일 수 있습니다.” | 귀환 후 분류. |
| 세븐 | trace_preserved | “폐기 대상에서 제외합니다. 사유: 기록보다 이름에 가까움.” | 흔적 보존. |
| 세븐 | trace_consumed | “소모 기록 완료. 원래 소유자 식별 가능성은 낮아졌습니다.” | 흔적 소모. |
| 세븐 | campaign_density_high | “행복, 보장, 가족, 추천 단어 빈도 상승. 외곽 광고 문장이 보급소 문턱까지 접근했습니다.” | 캠페인 농도 상승 분석. |
| 세븐 | human_stability_low | “침상 점유율 위험. 숫자는 즉시 이해됩니다. 불안은 조금 늦게 이해됩니다.” | 인간 안정도 낮음. |
| 세븐 | robot_autonomy_high | “로봇 발화에서 제품 문구 비율이 감소했습니다. 오류가 아니라 변화일 수 있습니다.” | 로봇 자율성 상승. |
| 세븐 | r01_boss_after_return | “가족사진 프레임 기록 분석 중. 개인 식별 신뢰도 낮음. 역할 고정 신뢰도 높음.” | R01 보스 후 분석. |
| 세븐 | intent_unknown | “의도 판정 실패. 그러나 우연일 확률도 낮습니다.” | 세븐의 한계 고정. |

---

## 5. 복희

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 복희 | hub_greeting_default | “왔니. 이름표가 젖었으면 말려두고 가라. 젖은 이름은 잘 찢어진단다.” | 기본 인사. 이름 보관함 톤. |
| 복희 | run_start_default | “밖에서 이름을 보면 바로 부르지 말고, 먼저 들어봐라. 이름도 놀라면 숨어.” | 출격 전 흔적 대하는 법. |
| 복희 | run_return_default | “무사히 온 건 네 이름이 아직 여기 붙어 있다는 뜻이겠지. 그래도 한 번 더 적어둘까?” | 귀환 후 정서. |
| 복희 | trace_preserved | “그래, 이건 여기 두자. 돌아갈 길이 물건보다 작게 남아 있을 때도 있단다.” | 흔적 보존. |
| 복희 | trace_consumed | “썼구나. 필요한 일이었겠지. 그래도 빈 자리에 점 하나는 찍어두마.” | 흔적 소모의 애도. |
| 복희 | campaign_density_high | “가짜 이름은 글씨가 너무 반듯해. 사람이 쓴 이름은 대개 조금 떨린단다.” | 캠페인 농도 상승/가짜 이름 경계. |
| 복희 | human_stability_low | “새 이름이 너무 많이 들어온다. 종이는 넓어도, 사람이 누울 자리는 좁구나.” | 인간 안정도 낮음. |
| 복희 | robot_autonomy_high | “로봇 이름도 적어도 되냐고? 물어보고 적어야지. 사람도 그렇잖니.” | 로봇 자율성 상승. |
| 복희 | r01_boss_after_return | “사진에는 얼굴이 남고, 여기엔 이름이 남는다. 둘이 꼭 같은 사람은 아니더라.” | R01 보스 후 FRAME-LEFT 연결. |
| 복희 | name_fragment_found | “조각이어도 이름은 이름이다. 접어서 보관하면 돼. 없어지는 것보단 낫지.” | 이름 조각 회수. |

---

## 6. 관계 대사 후보

### 6.1 미나 / 장도윤

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 미나 | risky_upgrade_suggested | “도윤, 또 위험한 걸 고쳤다고 하지 마.” | 위험 개조 견제. |
| 장도윤 | risky_upgrade_suggested | “위험한 걸 덜 위험하게 만든 거야. 표현이 중요하지.” | 도윤식 합리화. |

### 6.2 미나 / 팝시

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 미나 | popsy_ad_line_seen | “그 멘트, 네가 고른 거야?” | 광고 말투 불신. |
| 팝시 | popsy_ad_line_seen | “아직 확인 중이에요.” | 자기 말 찾기. |

### 6.3 장도윤 / 세븐

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 장도윤 | seven_overreports_risk | “그건 농담이야.” | 도윤의 빈정거림. |
| 세븐 | seven_overreports_risk | “위험 정보로 분류하지 않아도 됩니까?” | 세븐의 정확함. |

### 6.4 복희 / 팝시

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 복희 | robot_name_event | “네 이름, 네가 골라도 된단다.” | 로봇 이름 허락. |
| 팝시 | robot_name_event | “그 기능은... 아직 잠겨 있는 것 같아요.” | 자율성 씨앗. |

### 6.5 세븐 / 복희

| NPC | 조건 | 대사 | 용도 |
|---|---|---|---|
| 세븐 | frame_left_analysis | “개인 식별 신뢰도는 낮습니다.” | 데이터 한계. |
| 복희 | frame_left_analysis | “그래도 부를 때 쓸 조각은 있겠지.” | 이름 보관 관점. |

---

## 7. 구현 태그 초안

```text
dialogue_group:
outpost_core

npc_ids:
hub_mina
hub_doyun
hub_popsy
hub_seven
hub_bokhee
```

```text
condition_tags:
hub_greeting_default
run_start_default
run_return_default
trace_preserved
trace_consumed
campaign_density_high
human_stability_low
robot_autonomy_high
r01_boss_after_return
supply_pressure_high
extraction_unstable
robot_resync_warning
intent_unknown
name_fragment_found
```

우선순위:

```text
1. r01_boss_after_return
2. campaign_density_high
3. human_stability_low
4. robot_autonomy_high
5. trace_preserved / trace_consumed
6. run_return_default
7. hub_greeting_default
```

---

## 8. 다음 작업 상태

NPC-2 산출물은 작성 완료했다.

```text
story/03_regions/r01_vertical_slice_npc_implementation_list_v0_1.md

목표:
R01 NPC 12명을 실제 Vertical Slice에서 어떻게 노출할지
직접 대면 / 음성 잔향 / 오브젝트 흔적 / 보스 후 잔향 / P1 보류로 다시 자른다.
```

다음 작업은 NPC-3으로 넘어간다.

```text
다음 산출물:
story/03_regions/r01_npc_data_schema_application_v0_1.md

목표:
R01 구현 목록의 씬/오브젝트/플래그/대사 참조를 데이터 스키마 적용표로 옮긴다.
```

보급소 5명은 이 대사 은행을 기준으로 우선 구현 가능하다.

---

## 9. 최종 요약

보급소 초기 NPC 5명의 첫 대사 은행은 통과 가능하다.

미나는 계산의 한계를 말한다.
장도윤은 위험한 신호의 유혹을 말한다.
팝시는 자기 말과 광고 문구를 구분하려 한다.
세븐은 기록과 의도 사이에서 멈춘다.
복희는 이름을 적되, 붙잡는 일의 무게를 안다.

이 대사들은 보급소 시설 사용법보다 먼저 다음을 보여줘야 한다.

```text
밖에서 가져온 것은 보상이 아니라 후폭풍이다.
그리고 보급소는 그 후폭풍을 매번 조금씩 나눠 가진다.
```
