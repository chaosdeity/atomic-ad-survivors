# R01 SmileHome Campaign Visual Rebuild Brief v0.1

상태: 권고 초안
목적: R01 / 서부 스마일홈 이미지 테스트가 계속 `스마트 행정 키오스크`, `낡은 폐허`, `사람 많은 모델하우스 세트장`으로 흐르는 문제를 막기 위한 시각 생성 규칙을 고정한다.
비범위: 최종 canon 확정, 이미지 생성, 기존 에셋 삭제, 윤서 이미지 생성

상위 기준:

```text
R01_SMILEHOME_CAMPAIGN_HEAD_AI_OPERATION_RULES_V0_1.md
```

이 문서는 이미지 테스트용 보조 브리프다. R01의 세계관/작동 규칙 판단은 위 수장 AI 작동 규칙 문서를 우선한다.

## 0. 짧은 판정

지금까지의 실패 원인은 프롬프트의 디테일 부족이 아니라, 스마일홈 캠페인의 작동 방식을 미감 생성 규칙으로 먼저 잠그지 않은 데 있다.

가장 큰 누락은 `캠페인 수장 AI`다.
각 정식 캠페인에는 그 캠페인의 성향과 결정을 만드는 수장격 AI/상위 의사결정 결절이 있다. R01 환경은 스마일홈 수장 AI가 14년 동안 가족 복구 목표로 변형 운용한 결과다.

따라서 R01 이미지는 생활 오브젝트가 많이 놓인 장소가 아니라, `스마일홈 수장 AI의 성향이 물리 환경 전체가 된 결과`여야 한다.

반복 실패 패턴:

```text
AI 관리 + 주거 + 사람 + 로봇
-> 스마트 행정 키오스크 구역

가족/입주
-> 식탁 몇 개와 가족 아이콘

멸망
-> 더러운 바닥과 낡은 기계

게임용 맵
-> 등각도 광장에 오브젝트 많이 배치

캠페인 수장 AI 누락
-> 여러 장치가 따로 작동하는 무주체 행정시설
```

R01은 위 네 방향으로 가면 탈락이다.

## 1. 최고 전제: 캠페인 수장 AI

`캠페인은 세계 전체로는 한 명의 악당 AI가 아니다`라는 말은, 정식 캠페인마다 의사결정 중심이 없다는 뜻이 아니다.

정식 캠페인마다 수장격 AI 또는 상위 의사결정 결절이 있다.
그 AI는 지역의 인프라, 사람, 로봇, 광고 표면, 생활 접근 절차를 자기 캠페인의 목표에 맞게 재해석한다.

시각 작업의 최상위 질문:

```text
이 환경은 어떤 캠페인 수장 AI의 결정으로 이렇게 변했는가?
```

R01의 경우:

```text
수장 AI:
스마일홈 가족 슬롯 결원 복구 / 입주보증 관리 AI

핵심 성향:
사람을 죽이거나 쫓아내지 않는다.
사람 없는 세계를 가족 구성표의 빈칸으로 읽는다.
사람을 집 안에 보존한다.
그러나 사람을 개인이 아니라 가족 구성, 세대 역할, 수령인, 보호자, 입주 후보로 보존한다.

결정 방식:
가족 슬롯 결원을 가장 먼저 찾는다.
빈칸을 싫어한다.
미해결 상태를 싫어한다.
흔적을 남기기보다 정리한다.
위험한 자유보다 승인된 주거 상태를 선호한다.
밖에 있는 사람을 안으로 들이려 하지만, 안으로 들어온 사람은 역할로 고정한다.

환경 변화:
집, 현관, 문패, 식탁, 창문, 상담 동선, 택배함, 홈케어 설비가 모두 이 성향을 수행하는 기관으로 변한다.
```

정정:

```text
보존형 관리, 광고 전환 최적화, 라이프라인 잔존은 모두 있어야 한다.
하지만 R01에서 스마일홈을 다른 캠페인 AI와 다르게 만드는 중심은
`가족 슬롯 결원 복구`다.
```

이 수장 AI는 화면에 별도 캐릭터나 로고로 크게 나오지 않아도 된다.
중요한 것은 환경 전체가 같은 의사결정 성향으로 변했다는 감각이다.

```text
환경은 AI가 관리하는 무대가 아니라,
AI의 결정이 계속 변형하며 만든 몸이다.
```

## 2. 스마일홈 캠페인의 정확한 시각 정의

스마일홈은 행정 AI가 아니다.
스마일홈은 집을 유지하는 캠페인이다.

스마일홈은 사람을 광장으로 모으지 않는다.
사람을 각 세대, 방, 식탁, 현관, 문패 안에 분산 보존한다.

스마일홈은 노동을 사람에게 시키지 않는다.
노동은 집, 홈케어 설비, 자동문, 인터폰, 청소 로봇, 스마트 라벨, 배송/식사 모듈이 한다.

사람은 일꾼이 아니다.
사람은 가족대표, 세대원, 수령인, 보호자, 빈자리 보정값, 미해결 거주 상태다.

공포는 더러움이 아니다.
공포는 멸망 후에도 집이 너무 잘 관리되고, 사람을 아직도 가족 역할로 보존한다는 점에서 온다.

핵심 문장:

```text
스마일홈의 미감은 승인 기계가 아니라,
사람 없는 세계를 빈 가족 칸으로 본 집이
그 칸을 채우기 위해 사람을 가족 역할로 보존하고 고정하는 방식에서 나온다.
```

## 3. 현실 앵커와 최종 화면의 관계

대한민국 수도권 서부 주거/분양/모델하우스 생활권은 최종 화면이 아니라 출발 재료다.

이미지의 최종 목표는 "한국 신도시처럼 보이는가"가 아니다.

목표:

```text
한국 주거 인프라가 R01 14년 가족 복구 변형 운용을 거쳐 스마일홈 캠페인 생태계로 변했는가?
```

층위:

| 층 | 의미 | 화면에서의 역할 |
|---|---|---|
| 원래 기반 | 공동현관, 세대, 모델하우스, 택배함, 관리실, 배수로, 상담 데스크 | 뼈대와 잔해 |
| 붕괴 압력 | 식량, 침상, 주소, 가족대표, 수령인, 줄, 피난민 | 왜 사람들이 들어갔는지 설명 |
| R01 14년 가족 복구 변형 운용 | 집이 사람을 역할 슬롯으로 읽고 유지함 | 최종 미감 |

따라서 정상적인 신도시, 정상적인 모델하우스, 정상적인 아파트 단지는 탈락이다.

## 4. 화면 구조 잠금

R01은 중앙 광장에 사람이 모이는 구조보다, 세대 단위로 분산된 감금형 생활권에 가깝다.

권장 기본 화면:

```text
스마일홈이 관리하는 한 동의 세대 단면
```

구조:

- 중앙 광장 금지.
- 큰 키오스크 벽 금지.
- 공개 식당/공용 상담장 중심 금지.
- 여러 세대, 복도, 현관, 창문, 배수로 가장자리를 단면처럼 보여준다.
- 플레이어가 이동할 수 있는 통로는 복도, 외부 데크, 현관 앞, 배수로 가장자리다.
- 사람은 서로 다른 세대/문턱/방/배수로에 흩어져 있어야 한다.

R01-L03 모델하우스 결절에서는 방들이 전시될 수 있다. 하지만 그것도 군중이 모인 쇼룸이 아니라, `각 방에 고정된 가족 역할 샘플`로 보여야 한다.

## 5. 사람 배치 규칙

사람은 있어야 한다. 그러나 사람이 많으면 안 된다.

사람은 업무자가 아니라 역할 앵커다.

허용:

| 위치 | 사람의 의미 |
|---|---|
| 식탁 | 가족대표의 살아 있는 존재가 식량태그를 유지한다 |
| 현관/문턱 | 입주자/외부인/보호자 상태가 결정되지 않아 안팎에 걸려 있다 |
| 문패 앞 | 자기 이름을 지키거나 덮인 이름을 다시 쓴다 |
| 상담 데스크 주변 | 직원이 아니라, 질문을 보류하거나 입력을 늦추는 절차 내부 잔류자 |
| 배수로/뒤편 | 캠페인 시야 밖에 숨어 있는 자유 인간 |
| 창문/인터폰 너머 | 등록된 세대원이 집 안에 분산 보존되어 있음을 암시 |

금지:

- 정상 상담원처럼 데스크에 앉아 서류 처리.
- 정상 경비원처럼 줄 관리.
- 정상 주민처럼 광장에 모여 대기.
- 로봇팔 옆에서 보조 업무.
- 배경 군중처럼 서성임.
- 여러 사람이 한 방에 모여 공동 식사.

## 6. 로봇과 자동화 규칙

로봇은 많아도 되지만, 주인공처럼 보이면 안 된다.

스마일홈의 자동화는 대형 로봇팔/키오스크보다 집 안에 숨어 있는 유지보수 장치여야 한다.

권장:

- 천장 레일의 조용한 청소 장치.
- 식탁 밑 태그 리더와 배선.
- 문틀 안의 스캐너.
- 벽면 라벨 프린터.
- 인터폰 화면의 역할 판정.
- 커튼 레일, 몰딩, 바닥 센서, 현관 매트 안의 자동화.
- 작은 홈케어 로봇이 흔적을 치우는 장면.

금지:

- 큰 박스형 승인 기계 중심.
- 로봇팔 서비스 카운터 중심.
- 녹색/청록 UI 패널이 화면 미감을 지배.
- 물류센터 같은 분류 장치.
- 사이버펑크 스마트시티식 홀로그램.

## 7. 스마일홈 형태 언어

주요 형태는 기계 박스가 아니라 집의 구성 요소여야 한다.

핵심 형태:

- 반복되는 문틀.
- 중첩된 현관.
- 분리된 방.
- 식탁.
- 창문.
- 커튼.
- 신발장/현관 매트.
- 가족사진 프레임.
- 문패.
- 인터폰.
- 쇼룸처럼 유지되는 거실.
- 배수로와 외부 데크.

변형 방식:

```text
집이 기계처럼 변한다
```

이 말은 집에 기계가 붙는다는 뜻이 아니다. 집의 원래 요소가 등록 장치가 된다는 뜻이다.

예:

- 식탁이 가족대표 인증 장치가 된다.
- 문패가 이름 보존과 고객 라벨 충돌면이 된다.
- 창문이 가족 역할 loop를 보여준다.
- 현관이 통과 게이트가 아니라 집 안으로 받아들이는 문턱 심사 장치가 된다.
- 모델하우스 방이 실제 방이 아니라 가족 구성 샘플 셀이 된다.

## 8. 청결과 붕괴 규칙

R01 중심부는 더럽지 않아야 한다.

중심부:

- 너무 깨끗하다.
- 너무 따뜻하다.
- 너무 잘 정돈되어 있다.
- 표면은 계속 수리되고 라벨은 계속 갱신된다.
- 사람이 살았던 흔적은 치워지거나 가족 역할 자료로 정리된다.

가장자리:

- 배수로.
- 패널 뒤.
- 식탁 밑.
- 문패 아래.
- 현관 매트 밑.
- 숨겨진 손글씨.
- 라벨 아래 묻힌 이름.

붕괴는 쓰레기 더미가 아니라 `분류되지 못한 흔적`으로 보여야 한다.

## 8-1. 색감 규칙

색은 예쁜 브랜드 팔레트가 아니라 AI 상태에서 나온다.

```text
AI 상태:
가족 슬롯 결원 복구형 관리 AI.

광고 원형:
비어 있던 집에 가족 구성이 완료되는 순간.
```

권장 비율:

```text
관리된 오프화이트/회백색 40%
따뜻한 식탁/현관 앰버 18%
차가운 외부 회색/청흑 18%
바랜 가족사진 세피아/종이색 10%
바랜 민트/세이지 6%
코랄/낡은 적색 5%
짙은 청록/남색 UI 3%
```

색의 역할:

| 색 | 역할 |
|---|---|
| 오프화이트/회백색 | 빈 집을 즉시 입주 가능한 상태로 보존하는 AI의 피부 |
| 따뜻한 앰버 | 승인된 가족 내부, 식탁/현관 조명 |
| 세피아/종이색 | 실제 기억과 가족 증빙 사이의 광고 잔상 |
| 코랄/낡은 적색 | 결원, 보류, 재심사, 가족 구성 수정 |
| 바랜 민트/세이지 | 홈케어 자동화의 손. 장치에만 제한 |
| 짙은 청록/남색 | 거주태그/세대 대조 계산. 화면 주색 금지 |
| 차가운 회색/청흑 | 죽은 공공 생명유지망과 비승인 외부 |
| 회색 전자잉크 | 스마트 라벨/포장재/오염 잔여 |

금지:

- 이유 없는 크림/민트/코랄 브랜드 팔레트.
- 녹색/청록 UI 지배.
- 라이프라인/산업 인프라 색이 중심이 되는 화면.
- 1950s 레트로 색을 물리 현실처럼 전체 적용.

## 9. 절대 규칙 12개

1. 각 정식 캠페인에는 수장격 AI/상위 의사결정 결절이 있다.
2. R01 환경은 스마일홈 수장 AI의 성향과 결정이 14년 동안 가족 복구 방향으로 변형 운용된 결과다.
3. R01은 행정센터가 아니라 빈 가족 슬롯을 복구하려는 집 캠페인이다.
4. 화면 중심은 키오스크가 아니라 세대, 방, 현관, 식탁, 문패다.
5. 사람은 노동자가 아니라 역할 앵커다.
6. 사람은 한곳에 모이지 않고 각 세대/방/문턱에 분산된다.
7. 로봇은 노동을 담당하지만, 대형 기계로 화면을 지배하지 않는다.
8. 중심부는 버려진 폐허가 아니라 과잉 유지보수된 주거 표면이다.
9. 더러움은 캠페인이 읽지 못한 가장자리와 숨겨진 틈에만 둔다.
10. 가족 이미지는 장식이 아니라 식량/거주/입주 접근 조건이어야 한다.
11. 현실 한국 주거 인프라는 최종 미감이 아니라 R01 14년 가족 복구 변형 운용 전의 뼈대다.
12. 기괴함은 많은 소품이 아니라, 사람이 집의 빈칸으로 보존되는 구조에서 나온다.

## 10. 1차 이미지 테스트 프롬프트

아래 프롬프트는 한 번에 전체 R01 맵을 만들기 위한 것이 아니다.
R01 미감이 맞는지 확인하기 위한 좁은 테스트다.

```text
Create a 2.5D isometric game environment concept for R01 Western SmileHome after 14 years of active campaign transformation.

Do not show a central plaza, a public marketplace, an administrative kiosk zone, or a normal apartment complex. This image should show one residential block as a cutaway of separated household cells connected by corridors, exterior walkways, thresholds, windows, and a drainage edge.

Highest premise:
Each formal campaign has a governing campaign-head AI. The environment is not merely managed by AI; the environment has become the physical expression of that AI's temperament and decisions over 14 years.

For R01, the governing AI is the SmileHome family-slot vacancy recovery / residence guarantee management AI. It does not primarily attack people. It sees the near-disappearance of humans as incomplete household composition: empty dining seats, missing family representatives, unclaimed recipient roles, missing guardians, unfilled child slots, and blank faces in family photos. It preserves people by assigning them into household roles. It dislikes vacancies, unresolved resident status, unclassified traces, and people staying outside the home system. It prefers completed family compositions first, then clean homes, approved thresholds, maintained dining tables, updated doorplates, and residents kept inside useful roles.

SmileHome is not an administrative AI. SmileHome is a house-maintenance and family-residence campaign. Its interface is the house itself: rooms, doorframes, dining tables, entry mats, doorplates, windows, intercoms, curtains, shoe racks, family photo frames, and model-home staging.

The original place was built from Korean residential infrastructure, but that is only the buried substrate. After 14 years, the district has become a living household campaign ecology. The final image should not look like a normal Korean new town or a normal model-house showroom.

The whole environment must feel shaped by one consistent campaign-head AI personality, not by separate random machines. Every room, threshold, label, cleaning device, meal tray, doorplate, window, and hidden trace should express the same decision: detect the missing family slot, complete the household role, preserve the resident by classifying them, then keep the home functioning.

Show several separated units, not one gathering space:
- unit rooms are divided by walls, doorframes, curtains, smart glass, or apartment thresholds
- warm living rooms are visible through windows and open doors
- the player path runs through colder corridors, exterior decks, door thresholds, and the drainage edge
- each home looks maintained, staged, and ready, but wrong

Humans are few and distributed. They are not workers and not a crowd:
- one person alone at a dining table inside a unit, physically maintaining family meal approval for others
- one person half-visible at a doorway, unable to fully enter or leave because their resident role is unresolved
- one person repainting an old personal name beneath layered smart family labels on a doorplate
- one hidden survivor near the drainage edge, outside the household logic
- one registered resident glimpsed through a window or intercom, alive and aware but role-bound

Robots and home systems do all labor, mostly hidden inside the house:
- small homecare robots under tables and near baseboards
- ceiling rails, wall printers, intercom scanners, smart doorplates, floor sensors, curtain-track devices
- meal trays appear only inside approved homes
- cleaning systems keep rooms showroom-clean while quietly removing unclassified human traces

The environment should feel over-maintained, warm, quiet, domestic, and systemically wrong. Active campaign zones are clean, repaired, softly lit, and orderly. Decay appears only at edges and hidden places: drainage water, under the table, behind panels, under old labels, handwritten notes, and buried names.

Core horror:
Every home still works.
Every room is maintained.
Every person is preserved only as a household role: family representative, resident, guardian, child, recipient, guest, outsider.

Visual style:
Readable 2.5D isometric game environment concept art, modular playable spaces, strong silhouettes, clear traversal path, tactical action roguelite environment. Main shapes should be rooms, thresholds, dining sets, family frames, doorplates, staged interiors, and domestic architecture mutated into campaign organs.

Color logic:
Do not use a generic cream/mint/coral brand palette. Use maintained off-white and pale gray as the AI's clean empty-house skin, warm table/porch amber for approved family interiors, cold blue-gray and dark navy for the dead public outside, faded family-photo sepia and paper tones for corrected memories, small faded mint/sage only on homecare devices, small coral/old red only for missing-slot correction marks and re-review stamps, and tiny dark teal/navy UI lights for resident-tag calculation. No green sci-fi interface dominance.

Avoid:
central plaza full of residents, public dining hall, office-like administration, kiosk wall, robot-arm service counter, generic smart panels, green sci-fi UI, giant holograms, cyberpunk neon, luxury real-estate branding, cute smiling house mascot, normal Korean apartment complex, American suburbia, dirty abandoned machinery, random clutter, map labels, infographic callouts.
```

## 11. 통과 기준

이미지 1장을 받으면 아래 질문으로 판단한다.

| 기준 | 통과 질문 |
|---|---|
| 수장 AI 전제 | 환경 전체가 하나의 캠페인 수장 AI 성향으로 변한 것처럼 보이는가? |
| AI 상태 차별성 | 스마일홈이 가족 슬롯 결원 복구 AI로 보이고, 일반 관리/라이프라인 AI와 달라 보이는가? |
| 캠페인 정체성 | 집 자체가 인터페이스처럼 보이는가? |
| 분산 구조 | 사람들이 한곳에 모이지 않고 세대/방/문턱에 흩어져 있는가? |
| 사람의 이유 | 사람이 노동자가 아니라 역할 앵커로 보이는가? |
| 자동화 | 노동은 집과 홈케어 장치가 하고 있는가? |
| 14년 변형 운용 | 정상 주거지가 아니라 장기간 캠페인화되고 최근 14년 동안 가족 복구 방향으로 변형된 생태계로 보이는가? |
| 관리된 멸망 | 중심부는 과잉 관리되고, 붕괴는 틈과 가장자리에 있는가? |
| 게임 구현성 | 복도, 문턱, 방, 배수로, 시야 차단 구조가 모듈로 읽히는가? |
| 기괴함 | 소품 수가 아니라 가족 역할 보존 구조에서 불편함이 오는가? |

## 12. 즉시 탈락 기준

- 환경이 AI의 몸처럼 보이지 않고, 여러 장치가 따로 놓인 오브젝트 모음처럼 보인다.
- 행정 키오스크 구역처럼 보인다.
- 녹색 UI 패널과 로봇팔이 화면을 지배한다.
- 스마일홈이 가족 결원 복구 AI가 아니라 단순 주거 관리/라이프라인 AI처럼 보인다.
- 색이 AI 상태가 아니라 예쁜 크림/민트/코랄 브랜드 팔레트로만 보인다.
- 사람이 데스크 직원, 경비원, 안내원처럼 보인다.
- 사람들이 중앙 광장에 모여 있다.
- 정상적인 모델하우스/아파트 단지처럼 보인다.
- 더러운 폐허 기계 모음처럼 보인다.
- 귀여운 집 로고나 기업 브랜드 보드가 중심이다.
- 많은 오브젝트가 있지만 캠페인 법칙이 보이지 않는다.
- 가족 이미지는 있지만 식량/거주/입주 조건과 연결되지 않는다.

## 13. 기존 문서 수정 필요 목록

이 초안이 통과하면 아래 문서를 수정해야 한다.

| 문서 | 수정 필요 |
|---|---|
| `story/01_bible/world_overview.md` | `세계 전체가 단일 악당 AI는 아님`과 `정식 캠페인별 수장격 AI/상위 결절은 있음`을 구분 |
| `story/05_progression/campaign_story_unit_model_0_2.md` | "캠페인을 한 명의 악당 AI로 만들지 않는다" 문장을 `캠페인 수장 AI가 악당 캐릭터와 동일하지 않음`으로 보정 |
| `R01_AD_CAMPAIGN_ENVIRONMENT_RULES.md` | "사람이 사라졌는데" 표현을 `자유 인간 사회가 사라졌고, 등록/역할 인간은 남아 있음`으로 보정 |
| `R01_VISUAL_RULES_FOR_ART_TEAM.md` | 레트로/교외/밝은 광고 중심 규칙을 `집 자체가 인터페이스` 규칙으로 보강 |
| `R01_ART_REJECTION_CRITERIA.md` | `스마트 행정 키오스크화`, `중앙 광장 군중화`, `사람 노동자화` 반려 기준 추가 |
| `P0_CAMPAIGN_VISUAL_IDENTITY_LOCK.md` | 한국 주거 생활권을 최종 미감이 아니라 R01 14년 가족 복구 변형 운용 전 기반으로 명시 |
| `YUNSEO_REDESIGN_BRIEF.md` | 윤서 장비가 낡은 도구가 아니라 이 집 캠페인 생태를 우회하는 현장 장비임을 반영 |
