# E01 Season Back-Half Full Draft Expansion Audit v0.1

최종 목표 상태: **E01 FULL SEASON DRAFT EXPANSION READY FOR PM REVIEW**

상태: CANDIDATE PACKAGE AUDIT / PM REVIEW
작업 기준 branch: story/e01-season-expansion-integrated-v0-2
기준 HEAD: 241a4ad0f9355f4c0242a9361567ca80e9671814
작업 branch: story/e01-full-season-draft-expansion-v0-3
신규 LOCKED canon: 0
기존 story overwrite: 0
main 수정: 0
Unreal 수정: 0

이 감사는 E01 시즌 후반의 실제 스토리 절대량을 늘리기 위한 15개 신규 문서 패키지를 검증한다.

---

## 1. 산출물 수량

총 신규 파일: **15**

### TASK A / M05-M08 full integrated: 4

1. e01_m05_white_wristband_scenario_full_integrated_v0_3.md
2. e01_m06_return_clerk_scenario_full_integrated_v0_3.md
3. e01_m07_repair_meaning_scenario_full_integrated_v0_3.md
4. e01_m08_survivor_rank_scenario_full_integrated_v0_3.md

### TASK B / M09-M12 complete scenarios: 4

5. e01_m09_close_the_doors_scenario_draft_v0_1.md
6. e01_m10_who_spoke_last_scenario_draft_v0_1.md
7. e01_m11_last_departure_pass_scenario_draft_v0_1.md
8. e01_m12_player_made_yunseo_scenario_draft_v0_1.md

### TASK C / Side Story full drafts: 6

9. e01_ss09_good_customer_scenario_full_draft_v0_1.md
10. e01_ss10_lights_out_rescue_lamp_scenario_full_draft_v0_1.md
11. e01_ss11_applause_without_audience_scenario_full_draft_v0_1.md
12. e01_ss12_correction_broadcast_scenario_full_draft_v0_1.md
13. e01_ss13_lost_items_go_first_scenario_full_draft_v0_1.md
14. e01_ss14_owner_of_empty_seat_scenario_full_draft_v0_1.md

### Audit: 1

15. e01_season_back_half_full_draft_expansion_audit_v0_1.md

판정: **15 / 15 PASS**

---

## 2. Authority 적용

읽고 적용한 핵심 기준:

- e01_m05_white_wristband_scenario_draft_v0_1.md
- e01_m05_white_wristband_scenario_draft_v0_2.md
- e01_m06_return_clerk_scenario_draft_v0_1.md
- e01_m06_return_clerk_scenario_draft_v0_2.md
- e01_m07_repair_meaning_scenario_draft_v0_1.md
- e01_m07_repair_meaning_scenario_draft_v0_2.md
- e01_m08_survivor_rank_scenario_draft_v0_1.md
- e01_m08_survivor_rank_scenario_draft_v0_2.md
- e01_episode_registry_v0_1.md
- e01_episode_registry_v0_2.md
- e01_season_expansion_bible_v0_2.md
- 최신 윤서 invariant / mutability / voice / personal horror 문서
- E01 C05 / C07 / C08 Production Entry
- M05-M08 integration cross-audit v0.2

우선순위:
V0.2 integration correction > V0.1 scenario prose.

M01-M04 Voice Gate 재설계: **0**
윤서 character core 재설계: **0**

---

## 3. M05-M08 통합 충돌 제거

### M05

제거/대체:
- “동생 치료 순번”을 C02 주 시스템으로 사용하지 않음.
- 번호표/대기열 승패 제거.
- guardian slot이 치료 우선순위를 자동 생성/삭제한다는 단정 제거.
- exact 17분 mechanic 제거.

통합 중심:
actual care need
!= guardian / care-recipient record
!= eligibility / discharge state
!= finite care / medicine / bed / transfer capacity.

R02-L05:
canonical semantic anchor로만 취급.
physical route 확정 0.

판정: **PASS**

### M06

제거/대체:
- 윤서 장비 원본이 R03에 있다는 확정 제거.
- 윤서가 과거 R03 작업자/회수 담당자였다는 추론 제거.
- 제조사 / 최초 소유 / 지급 경로 확정 0.
- WRONG MOVE가 R02/R08 공급을 끊는다는 cross-campaign dependency 제거.

통합 중심:
구형 C03 field-return protocol과 윤서 장비 일부의 compatibility / design-family similarity.

판정: **PASS**

### M07

제거/대체:
- 시설 “정품/오류”를 객관적 팝시 identity truth로 사용하지 않음.
- diagnostic delete list를 세계관 진실로 확정하지 않음.
- 플레이어가 팝시 최종 선택 버튼을 대신 누르지 않음.

통합 중심:
facility claim / actual operability / 현재 팝시의 decision 분리.

판정: **PASS**

### M08

제거/대체:
- 포인트를 범용 화폐로 확장하지 않음.
- slot 숫자 자체를 인간 가치 점수로 사용하지 않음.
- R06-L01 ingress 발명 0.
- C06 transaction이 다른 Campaign resource를 자동 변경한다는 dependency 0.

통합 중심:
entitlement / service access와 실제 대기/유지보수/식량/충전 영향.

판정: **PASS**

---

## 4. M09-M12 필수 14항목

각 Main에 다음이 모두 존재한다.

- OPENING
- YUNSEO PERSONAL WANT
- OTHER CHARACTER WANT
- HUMAN CONFLICT
- HORROR
- PLAYER CHOICE
- WRONG MOVE
- REVERSAL
- CLIMAX
- COST
- RETURN
- RELATIONSHIP CHANGE
- REVISIT CONSEQUENCE
- NEXT HOOK

### M09

장르: siege / community drama

핵심 충돌:
- 미나는 현재 survivor capacity를 지키기 위해 문을 닫으려 한다.
- 윤서는 자기 구조 방식 때문에 보급소가 무너질 수 있다는 책임을 느낀다.
- 미나의 근거는 유한한 water / bed / medicine / charge / watch burden과 verification 노동이다.

선악 대립:
**없음**

핵심 공포:
보급소가 admission condition을 만들며 싫어했던 캠페인 언어를 닮아감.

판정: **PASS**

### M10

장르: media horror / psychological identity horror

사용 재료:
- 실제 player-selected Yunseo action만 evidence로 사용.
- context deletion.
- 좋은 이야기.
- “always / never / 원래” 같은 편집형 totalization.

윤서 반응:
- 좋은 버전을 완전히 거부하지 않음.
- 사람들이 믿고 좋아하는 일부를 윤서 자신도 좋아함.

거짓말 only:
**아님**

판정: **PASS**

### M11

장르: departure drama / hope and separation

분기된 사람:
- 가고 싶은 사람.
- 남고 싶은 사람.
- 갈 수 있지만 안 가는 사람.
- 가고 싶지만 현재는 못 가는 사람.

실제 departure:
episode-local candidate 한 명이 실제로 departure complete까지 간다.

가짜 희망:
**아님**

GOOD/BAD 선택:
**없음**

판정: **PASS**

### M12

장르: ensemble finale / consequence mosaic

세계 구원:
**없음**

E01 완전 해결:
**없음**

핵심:
NPC는 숨은 personality score가 아니라 시즌 동안 직접 본 반복 행동만 근거로 윤서를 예상한다.

동적 기대 후보:
- “윤서는 원래 기다리잖아.”
- “윤서는 결국 직접 해.”
- “윤서는 기록부터 보잖아.”
- “윤서는 사람보다 기록부터 보진 않아.”
- “윤서는 원래 버텨.”
- “윤서는 마지막엔 물어봐.”

실제 누적 행동이 없는 문장은 활성화하지 않는다.

finale choice:
“어떤 윤서가 옳은가”가 아니라
“이번 상황에서도 그 습관을 계속 쓸 것인가 / 변주할 것인가 / 위임할 것인가.”

판정: **PASS**

---

## 5. Side Story 완결 구조

6편 모두:

- opening
- want
- conflict
- choice
- reversal
- cost
- aftermath

를 가진다.

### SS-09 좋은 고객

장르: dark comedy / transactional relationship drama

사건:
브로커의 “무료” entitlement가 진짜일 때도 비용 provenance를 어떻게 확인할지.

reversal:
원 이용자는 자발 포기했을 수 있으며, 숨은 단일 피해자 대신 maintenance / capacity의 분산 비용이 남는다.

설정 설명 단편: **아님**

### SS-10 꺼진 구조등

장르: mystery / technical anxiety

사건:
100% true/false signal 판정기를 원하는 도윤과 UNKNOWN을 운영해야 하는 공동체.

reversal:
가장 깨끗한 신호가 더 의심스럽고 weak signal에 인간의 수동 패턴이 남아 있음.

설정 설명 단편: **아님**

### SS-11 박수 없는 관객석

장르: absurd horror / acoustic mystery

사건:
빈 관객석 applause loop를 끄면 human-origin candidate signal도 사라짐.

reversal:
누군가 applause timing을 이용해 의도적으로 신호를 보낸 흔적.

설정 설명 단편: **아님**

### SS-12 정정 방송

장르: quiet tragedy / record ethics

사건:
사망자 명단의 한 이름을 고칠 수 있지만 alive를 확인하지 못함.

reversal:
가장 오래된 source부터 “확인 전 단정 금지” 상태였고, editorial transformation이 uncertainty를 지움.

설정 설명 단편: **아님**

### SS-13 분실물은 먼저 간다

장르: relationship drama / procedural mystery

사건:
사람보다 먼저 transfer된 것으로 보이는 baggage와 privacy.

reversal:
먼저 간 것은 사람이나 가방 자체보다 baggage state record.

설정 설명 단편: **아님**

### SS-14 빈 좌석의 주인

장르: warm but unsettling / personal mystery

사건:
R01 empty family slot과 C07 seat identifier가 닮았고 윤서 자신이 연결되길 바람.

reversal:
identifier는 재사용 가능성이 있으나 더 좁고 구체적인 timestamp/annotation 의심이 남음.

윤서 childhood twist 확정:
**0**

---

## 6. 장르 중복 감사

| Story | Primary temperature |
|---|---|
| M09 | siege / community drama |
| M10 | media horror / psychological identity horror |
| M11 | departure drama / hope and separation |
| M12 | ensemble finale / consequence mosaic |
| SS-09 | dark comedy / transactional drama |
| SS-10 | mystery / technical anxiety |
| SS-11 | absurd horror / acoustic mystery |
| SS-12 | quiet tragedy / record ethics |
| SS-13 | relationship drama / procedural mystery |
| SS-14 | warm but unsettling / personal mystery |

같은 “선택권 윤리”를 소품만 바꿔 반복:
**NO**

판정: **PASS**

---

## 7. 윤서 invariant 감사

유지:

- 잘못된 이름/역할이 당사자보다 먼저 확정되는 것에 민감.
- 자신도 도움 명분으로 타인을 대신 규정할 수 있음.
- 현장에서 몸과 도구를 직접 사용.
- 쉽게 구원을 약속하지 않음.
- 사람을 항목처럼 완전히 버리지 못함.
- 선을 넘으면 개입을 줄이고, 필요한 일을 남기고, 선택권을 돌리고, 후속 비용을 부담.
- HOLD / COMMIT / SELF-ERASURE / SELF-PRESERVATION / CONTROL / DELEGATION / DISTANCE / ATTACHMENT 모두 실패 가능.
- 관계 trust는 대상별 memory.
- BELONGING / ESCAPE는 시즌 trajectory.

추가 감정/욕망:

- 인정받고 싶음.
- 필요해지고 싶음.
- 도망가고 싶음.
- 쉬고 싶음.
- 자기 장비를 도윤이 “기술”보다 “윤서 물건”으로 봐주길 바람.
- 미나가 자기 departure 관심에 서운해하길 바라면서도 부담스러워함.
- 누군가 자기 빈자리를 기억했으면 하는 욕심.
- 다른 사람이 자기 일을 잘하면 안도하면서도 질투함.
- 화내고 농담하고 틀리고 피곤해함.

반복 catchphrase “내가 대신 정했나?”:
**사용하지 않음**

윤서 core redesign:
**0**

판정: **PASS**

---

## 8. World / graph guard

신규 Local: **0**
Local rename: **0**
new physical travel edge: **0**
new external ingress: **0**
new Campaign Dependency: **0**
new Relay assignment: **0**
new Beacon assignment: **0**
new Recovery Line geometry: **0**
exact travel geometry lock: **0**

R06-L01 external ingress:
KNOWN GAP 유지.

R07-L01 external ingress:
KNOWN GAP 유지.

M09-M12 필요한 진입:
[ENTRY / PHYSICAL ROUTE: PRODUCTION FILL] 또는 동등한 production-fill guard 사용.

C05/C07/C08 historical source / information relation을 physical travel proof로 승격:
**0**

판정: **PASS**

---

## 9. Canon / authority guard

신규 story detail:
**CANDIDATE**

M09-M12 world authority 승격:
**0**

기존 Final Lock 수정:
**0**

기존 story overwrite:
**0**

기존 V0.1 / V0.2 수정:
**0**

main 수정:
**0**

Unreal 수정:
**0**

판정: **PASS**

---

## 10. PM review 핵심 확인점

이 패키지는 초고량 확장을 완료했으며 다음 PM 판단은 story selection / trimming / production conversion 단계다.

확인 필요:

1. M09의 보급소 admission governance 중 어떤 variation을 기본 staging candidate로 둘지.
2. M10에서 player-history evidence를 runtime flag와 어떤 granularity로 연결할지.
3. M11 episode-local departure candidate 이름/등장 분량을 유지할지 다른 roster 인물로 치환할지.
4. M12 observable habit evidence의 최소 반복 횟수 및 tie 처리.
5. SS-14 personal mystery를 E02까지 carry할지 E01 local uncertainty로 남길지.
6. 모든 [ENTRY / PHYSICAL ROUTE: PRODUCTION FILL]을 실제 production graph 승인 이후에만 치환할 것.

위 항목은 이 문서에서 확정하지 않는다.

---

## 11. Final gate

- 신규 파일: 15 / 15
- 기존 파일 수정: 0 intended
- M05-M08 full integrated: 4 / 4
- M09-M12 complete full scenario: 4 / 4
- Side Story full draft: 6 / 6
- Season back-half audit: 1 / 1
- M09-M12 필수 14항목: PASS
- Side Story 필수 7항목: PASS
- genre diversity: PASS
- Yunseo invariant: PASS
- new LOCKED canon: 0
- graph authority invention: 0

**CONTENT VERDICT: E01 FULL SEASON DRAFT EXPANSION READY FOR PM REVIEW**

Git-level “existing file modifications 0 / exactly 15 additions / remote branch read-back”은 이 패키지 커밋 직후 원격 diff에서 최종 검증한다.
