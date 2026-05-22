# Card Data Directive 0.2

상태: 0.2 런 카드 데이터 적용 작업 지시서  
목적: `run_cards.md`의 카드 12장을 Godot 프로토타입 데이터로 옮길 수 있게 고정한다.  
기준: 카드는 자주 읽히는 세계관 문장이지만, 먼저 전투 선택으로 재미있어야 한다.

## 핵심 목표

0.2 카드는 세 가지를 동시에 해야 한다.

```text
고르는 순간 웃긴다.
효과는 바로 이해된다.
런 플레이가 실제로 달라진다.
```

카드는 철학 설명서가 아니다. 카드 이름과 광고 문구는 밝고 짧아야 하며, 실제 효과 문장은 오해 없이 숫자와 행동으로 읽혀야 한다.

## 카드 풀

### 기본 카드 8장

| ID | 이름 | 역할 |
| --- | --- | --- |
| `card_fresh_return_001` | 상쾌한 반품 | 방어/반사 |
| `card_free_radiation_001` | 오늘만 무료 방사능 | 자동공격/장판 |
| `card_smile_stabilizer_001` | 미소 유지 장치 | 이동 방어 |
| `card_like_new_heart_001` | 새것 같은 마음 | 1회 생존 |
| `card_sweet_rebroadcast_001` | 달콤한 역송출 | 차징 피해 |
| `card_shining_customer_001` | 빛나는 고객님 | 경험치/위험 |
| `card_expired_love_001` | 유효기간 지난 사랑 | 저체력 공격 |
| `card_family_bundle_001` | 가족 세트 할인 | 보조 투사체 |

### 해금 카드 4장

| ID | 이름 | 해금 방향 |
| --- | --- | --- |
| `card_premium_silence_001` | 프리미엄 침묵 | 무음 라디오/침묵권/결절 파괴 |
| `card_mascot_handshake_001` | 마스코트의 악수 | 마스코트 배지/로봇 씨앗 |
| `card_surprise_repurchase_001` | 깜짝 재구매 | 쿠폰북/캠페인 농도/위험 보상 |
| `card_homecare_vortex_001` | 홈케어 회오리 | 홈케어 청소기/로봇 자동화 |

0.2에서는 카드 12장 이상으로 늘리지 않는다. 카드 수가 많아지면 문체와 밸런스 검증이 흐려진다.

## 데이터 구조

권장 필드:

```text
RunCard
  id
  name
  flavor_text
  effect_text
  tags
  rarity
  unlock_condition
  stack_rule
  narrative_axis
  risk_level
  pool
```

필드 원칙:

- `flavor_text`는 광고풍/귀여운 디스토피아 문장이다.
- `effect_text`는 실제 효과만 쓴다.
- `risk_level`은 내부 정렬용이다. 유저에게 위험 점수처럼 보여주지 않는다.
- `narrative_axis`는 해금/대사/지역 반응 연결용이다.

## 카드 데이터

### card_fresh_return_001

```text
name = "상쾌한 반품"
flavor_text = "마음에 안 드셨나요? 돌려드립니다. 힘껏."
effect_text = "피격 시 일정 확률로 가장 가까운 적에게 피해를 반사합니다."
tags = ["defense", "campaign_risk"]
rarity = "common"
pool = "base"
risk_level = 1
```

중첩: 반사 확률과 반사 피해가 소폭 증가한다.

### card_free_radiation_001

```text
name = "오늘만 무료 방사능"
flavor_text = "빛나면 더 건강해 보입니다."
effect_text = "일정 주기마다 독성 장판을 남기는 탄을 발사합니다."
tags = ["auto_attack", "campaign_risk"]
rarity = "common"
pool = "base"
risk_level = 2
```

중첩: 장판 피해와 지속시간이 증가한다.

### card_smile_stabilizer_001

```text
name = "미소 유지 장치"
flavor_text = "웃는 얼굴은 흔들리지 않는 법."
effect_text = "이동 중 받는 피해가 감소합니다."
tags = ["defense"]
rarity = "common"
pool = "base"
risk_level = 0
```

중첩: 피해 감소량이 증가한다.

### card_like_new_heart_001

```text
name = "새것 같은 마음"
flavor_text = "흠집은 추억이 아닙니다. 제거하세요."
effect_text = "런 중 최초 1회 치명상을 막고 체력을 일부 회복합니다."
tags = ["defense", "healing"]
rarity = "rare"
pool = "base"
risk_level = 1
```

중첩: 회복량만 증가한다. 치명상 방지는 1회 유지한다.

### card_sweet_rebroadcast_001

```text
name = "달콤한 역송출"
flavor_text = "받은 만큼 돌려주는 친절한 서비스."
effect_text = "차징 스킬 피해량이 증가합니다."
tags = ["charge"]
rarity = "common"
pool = "base"
risk_level = 0
```

중첩: 차징 피해량이 증가한다.

### card_shining_customer_001

```text
name = "빛나는 고객님"
flavor_text = "당신은 선택받았습니다. 거절할 수 없습니다."
effect_text = "경험치 획득량이 증가하지만 적 이동속도도 증가합니다."
tags = ["xp", "campaign_risk"]
rarity = "common"
pool = "base"
risk_level = 3
```

중첩: 경험치 보너스와 적 이동속도 보너스가 함께 증가한다.

### card_expired_love_001

```text
name = "유효기간 지난 사랑"
flavor_text = "끝났다고 적혀 있지만 아직 버릴 수 없습니다."
effect_text = "체력이 낮을 때 공격속도가 증가합니다."
tags = ["auto_attack", "trace"]
rarity = "common"
pool = "base"
risk_level = 0
```

중첩: 발동 체력 기준 또는 공격속도 증가량이 오른다.

### card_family_bundle_001

```text
name = "가족 세트 할인"
flavor_text = "혼자여도 괜찮아요. 곧 여럿이 됩니다."
effect_text = "보조 투사체가 1개 추가됩니다."
tags = ["auto_attack", "boss_unlock"]
rarity = "uncommon"
pool = "base"
risk_level = 1
```

중첩: 보조 투사체 수 또는 피해가 증가한다. 초반 과밀하면 피해 증가 위주로 조정한다.

### card_premium_silence_001

```text
name = "프리미엄 침묵"
flavor_text = "아무 말도 하지 않는 고급 경험."
effect_text = "일정 범위 안 적의 발사 빈도가 감소합니다."
tags = ["silence", "defense"]
rarity = "uncommon"
pool = "unlock"
risk_level = 0
```

해금: 무음 라디오 획득, 침묵권 진행, 또는 결절 파괴 후 후보로 추가한다.  
중첩: 범위 또는 감소율이 증가한다. 적 행동을 완전히 끊지 않는다.

### card_mascot_handshake_001

```text
name = "마스코트의 악수"
flavor_text = "부드러운 손. 차가운 관절. 진짜 인사."
effect_text = "로봇형 적 처치 시 회복 구슬을 떨어뜨릴 확률이 생깁니다."
tags = ["robot", "healing"]
rarity = "uncommon"
pool = "unlock"
risk_level = 0
```

해금: 고장 난 마스코트 배지 획득 후 후보로 추가한다.  
중첩: 회복 구슬 드롭 확률이 증가한다.

### card_surprise_repurchase_001

```text
name = "깜짝 재구매"
flavor_text = "이미 가진 것도 다시 갖고 싶게."
effect_text = "같은 카드가 다시 등장할 확률이 증가합니다."
tags = ["loot", "campaign_risk"]
rarity = "uncommon"
pool = "unlock"
risk_level = 3
```

해금: 캠페인 농도 높음, 오래된 쿠폰북 계열, 또는 위험 카드 선택 누적 후 후보로 추가한다.  
중첩: 재등장 확률이 증가한다. 과도한 중복으로 빌드가 무너지면 상한을 둔다.

### card_homecare_vortex_001

```text
name = "홈케어 회오리"
flavor_text = "먼지, 죄책감, 침입자를 한 번에."
effect_text = "주기적으로 주변 아이템과 약한 적을 끌어당기는 회오리를 생성합니다."
tags = ["auto_attack", "loot", "robot"]
rarity = "uncommon"
pool = "unlock"
risk_level = 1
```

해금: 홈케어 청소기 처치 또는 청소기 먼지통 계열 흔적 획득 후 후보로 추가한다.  
중첩: 흡입 범위와 피해가 증가한다.

## 카드 선택 화면

권장 표시:

```text
카드 이름
광고풍 설명
실제 효과
태그 아이콘 1~2개
```

모바일 주의:

- 한 카드의 설명은 3줄을 넘기지 않는다.
- `flavor_text`와 `effect_text`를 시각적으로 분리한다.
- 위험 보상 카드는 효과 문장 안에 위험을 반드시 쓴다.
- 카드 선택은 빠르게 끝나야 한다. 읽는 재미가 있어도 전투 흐름을 끊으면 안 된다.

## 해금 규칙

0.2 권장:

```text
처음부터 기본 카드 8장 활성
흔적/보스/지역 상태에 따라 해금 카드 4장 후보 추가
```

해금 카드 후보 조건:

| 카드 | 조건 |
| --- | --- |
| 프리미엄 침묵 | `trace_silent_radio_001` 또는 `boss_outcome = destroy_node` |
| 마스코트의 악수 | `trace_mascot_badge_001` |
| 깜짝 재구매 | `campaign_pressure >= 75` 또는 위험 카드 선택 누적 |
| 홈케어 회오리 | 홈케어 청소기 처치 또는 관련 흔적 획득 |

P1 흔적이 빠진 빌드에서는 해금 카드 일부를 보스 결과 또는 지역 농도로 우회 해금한다.

## 중첩 규칙

공통 원칙:

- 피해 증가는 선형 증가.
- 확률 증가는 초반 빠르게, 후반 완만하게.
- 위험 보상 카드는 이득과 위험이 함께 증가.
- 1회성 생존 카드는 발동 횟수를 늘리지 않는다.
- 침묵/방해 카드는 적 행동을 완전히 제거하지 않는다.

중첩 표시 예:

```text
상쾌한 반품 Lv.2
반사 확률과 반사 피해가 증가합니다.
```

## 전투 재미 체크

0.2 카드 풀은 아래 역할이 최소 1개씩 있어야 한다.

| 역할 | 카드 |
| --- | --- |
| 자동공격 강화 | 오늘만 무료 방사능, 가족 세트 할인 |
| 차징 강화 | 달콤한 역송출 |
| 생존 | 미소 유지 장치, 새것 같은 마음 |
| 위험 보상 | 빛나는 고객님, 깜짝 재구매 |
| 수집/회수 | 홈케어 회오리 |
| 세계관 감정 | 유효기간 지난 사랑, 프리미엄 침묵 |

부족한 점:

```text
0.2는 차징 카드가 1장뿐이라 윤서 손맛이 약해질 수 있다.
```

보완 방향:

- 0.2 구현 중 차징 선택률이 낮으면 `조용한 보증`을 P1 카드로 앞당긴다.
- 윤서가 기본캐로 좋아져야 하므로 차징 강화 체감은 반드시 관찰한다.

## 유저 선호 점수

예상 점수:

| 기준 | 점수 | 이유 |
| --- | ---: | --- |
| 문체 매력 | 8 | 밝은 광고와 불길한 효과가 살아 있음 |
| 전투 선택성 | 7 | 기본 역할은 갖췄지만 차징 계열이 적음 |
| 모바일 적합성 | 8 | 3줄 구조로 압축 가능 |
| 세계관 연결 | 8 | 흔적/보스/지역 상태와 연결됨 |
| 반복 재미 | 7 | 12장만으로는 장기 반복에 한계 |
| 구현 현실성 | 9 | 데이터 수가 작고 명확함 |

종합:

```text
7.8 / 10
```

10점으로 올리기 위한 다음 개선:

- 윤서 차징 카드 2~3장 추가.
- 팝시-제로 출시 시 로봇/리롤 카드군 확장.
- 폐쇼핑몰 도입 시 쿠폰/환불/재구매 카드군 확장.
- 카드 선택 시 사운드와 종이 카탈로그 연출 추가.

## 검증 항목

| 관찰 | 합격 기준 | 실패 시 수정 |
| --- | --- | --- |
| 카드 설명 이해 | 첫 선택에서 효과 오해가 적음 | 효과 문장 단순화 |
| 카드 선택 속도 | 선택이 전투 흐름을 심하게 끊지 않음 | 설명 길이 축소 |
| 위험 카드 선택률 | 강한 유혹으로 느껴짐 | 보상 수치 상향 또는 위험 완화 |
| 차징 카드 선호 | 윤서 유저가 차징 강화를 고름 | 차징 카드 추가/수치 조정 |
| 카드 문체 반응 | 유저가 이름을 기억함 | 이름/광고 문구 재작성 |

## 금지 방향

- 카드 설명을 설정 해설로 쓰지 않는다.
- 위험 보상의 위험을 숨기지 않는다.
- 모든 카드가 같은 농담처럼 보이게 하지 않는다.
- 내부 성향 수치를 카드 UI에 표시하지 않는다.
- 카드가 일반 RPG 버프 이름처럼 보이게 하지 않는다.
- 0.2에서 카드 수를 과하게 늘리지 않는다.
