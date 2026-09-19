# 10 E01 Remap Canonical V0.1

상태: **E01 REMAP CANONICAL**
권위: **PRODUCTION FILL AUTHORITY**
구현 상태: **NOT UNREAL IMPLEMENTATION**
기준 브랜치: `chatgpt-work`
Authority sync commit: `73c1fd68859ea5a49755c7b33709f1304e0eed62`

## 0. Canonical 판정

E01 Remap Draft에 PM-01~07을 적용한다. 이 문서는 E01 Production Fill에서 hierarchy, source mapping, current/legacy 경계, P0 해석, graph separation, 작업 순서를 판단하는 canonical 문서다.

Final Global World Structure Lock V0.2는 수정하지 않는다. 이 문서가 Unreal runtime authority를 대체하지도 않는다.

## 1. Hierarchy

```text
GLOBAL
→ SECTOR E01
→ CAMPAIGN E01_C01~E01_C08
→ LOCAL R01-L01~R08-L05
```

- Campaign: 8
- Local: 40
- Local ID/name 변경: 0
- E01 Local을 global node로 승격: 금지

## 2. Canonical 40 Local

| Campaign | Local ID | Canonical name |
|---|---|---|
| E01_C01 | R01-L01 | 침묵 가장자리 |
| E01_C01 | R01-L02 | 분양 주택 루프 |
| E01_C01 | R01-L03 | 모델하우스 결절 |
| E01_C01 | R01-L04 | 배수로 침묵 주머니 |
| E01_C01 | R01-L05 | 가짜 귀환로 |
| E01_C02 | R02-L01 | 응급 접수 홀 |
| E01_C02 | R02-L02 | 장기 입원동 |
| E01_C02 | R02-L03 | 보험 심사 약국 |
| E01_C02 | R02-L04 | 격리문 복도 |
| E01_C02 | R02-L05 | 퇴원 불가 병동 |
| E01_C03 | R03-L01 | 반품 접수 야드 |
| E01_C03 | R03-L02 | 자동 분류장 |
| E01_C03 | R03-L03 | 보증 심사 창고 |
| E01_C03 | R03-L04 | 파쇄 전 대기라인 |
| E01_C03 | R03-L05 | 최종 반품 심사실 |
| E01_C04 | R04-L01 | 폐충전소 |
| E01_C04 | R04-L02 | 배터리 침전 공장 |
| E01_C04 | R04-L03 | 리콜 펌웨어실 |
| E01_C04 | R04-L04 | 폐기 프레스 라인 |
| E01_C04 | R04-L05 | 재동기화 코어 |
| E01_C05 | R05-L01 | 수신탑 외곽 |
| E01_C05 | R05-L02 | 반복 뉴스 스튜디오 |
| E01_C05 | R05-L03 | 추천 서버실 |
| E01_C05 | R05-L04 | 빈 관객석 공개홀 |
| E01_C05 | R05-L05 | 마지막 앵커 송출실 |
| E01_C06 | R06-L01 | 회원 게이트 거리 |
| E01_C06 | R06-L02 | 포인트 거래 골목 |
| E01_C06 | R06-L03 | 리뷰 키오스크 광장 |
| E01_C06 | R06-L04 | VIP 라운지 |
| E01_C06 | R06-L05 | 블랙프라이데이 홀 |
| E01_C07 | R07-L01 | 검역 게이트 |
| E01_C07 | R07-L02 | 냉동 컨테이너 야드 |
| E01_C07 | R07-L03 | 수하물 오분류 터미널 |
| E01_C07 | R07-L04 | 밀수 통행로 |
| E01_C07 | R07-L05 | 마지막 출항 관리탑 |
| E01_C08 | R08-L01 | 침묵 보급소 |
| E01_C08 | R08-L02 | 역송출 주유소 |
| E01_C08 | R08-L03 | 폐역 무음 플랫폼 |
| E01_C08 | R08-L04 | 민방위 저장고 |
| E01_C08 | R08-L05 | 가짜 구조 신호탑 |

근거 inventory는 `02_E01_40_LOCAL_CANONICAL_INVENTORY_V0_1.md`다. 이 문서는 이름을 재창작하지 않는다.

## 3. Canonical 37 source connection preservation

기존 37 connection은 원본 그대로 보존한다. 이 집합은 새 physical travel graph가 아니라 **HISTORICAL PROGRESSION / VISIBILITY MAPPING SOURCE**다.

| # | source → target | source type |
|---:|---|---|
| 1 | R08-L01 → R08-L02 | P0/main |
| 2 | R08-L02 → R01-L01 | P0/main |
| 3 | R01-L01 → R01-L02 | P0/main |
| 4 | R01-L02 → R01-L03 | P0/main |
| 5 | R01-L02 → R01-L04 | P1/branch |
| 6 | R01-L03 → R01-L05 | P1/branch |
| 7 | R08-L02 → R08-L03 | P1/branch |
| 8 | R08-L03 → R08-L04 | P1/branch |
| 9 | R01-L05 → R03-L01 | P1/branch |
| 10 | R03-L01 → R03-L02 | P1/branch |
| 11 | R03-L02 → R03-L03 | P1/branch |
| 12 | R01-L03 → R02-L01 | P1/branch |
| 13 | R02-L01 → R02-L02 | P1/branch |
| 14 | R02-L02 → R02-L03 | P1/branch |
| 15 | R03-L03 → R04-L01 | P1/branch |
| 16 | R04-L01 → R04-L02 | P1/branch |
| 17 | R04-L02 → R04-L03 | P1/branch |
| 18 | R06-L01 → R06-L02 | P1/branch |
| 19 | R06-L02 → R06-L03 | P1/branch |
| 20 | R03-L03 → R03-L04 | P2/boss_branch |
| 21 | R03-L04 → R03-L05 | P2/boss_branch |
| 22 | R02-L03 → R02-L04 | P2/boss_branch |
| 23 | R02-L04 → R02-L05 | P2/boss_branch |
| 24 | R04-L03 → R04-L04 | P2/boss_branch |
| 25 | R04-L04 → R04-L05 | P2/boss_branch |
| 26 | R06-L03 → R06-L04 | P2/boss_branch |
| 27 | R06-L04 → R06-L05 | P2/boss_branch |
| 28 | R08-L03 → R05-L01 | P2/remote_signal |
| 29 | R05-L01 → R05-L02 | P2/remote_signal |
| 30 | R05-L02 → R05-L03 | P2/remote_signal |
| 31 | R05-L03 → R05-L04 | P2/remote_signal |
| 32 | R05-L04 → R05-L05 | P2/remote_signal |
| 33 | R07-L01 → R07-L02 | P2/blockade |
| 34 | R07-L02 → R07-L03 | P2/blockade |
| 35 | R07-L03 → R07-L04 | P2/blockade |
| 36 | R07-L04 → R07-L05 | P2/blockade |
| 37 | R08-L04 → R08-L05 | P2/internal_crisis |

보존 규칙:
- source/target 변경 금지.
- source type 변경 금지.
- edge 추가/삭제 금지.
- `remote_signal`을 physical travel로 자동 해석 금지.
- R06-L01/R07-L01의 외부 ingress 부재를 신규 edge로 보정 금지.

## 4. Current authority / legacy 분리

### CURRENT gameplay authority
R01 main은 다음 backbone을 따른다.

```text
quest accept
→ safe hub
→ local entry
→ time-unlimited exploration
→ finite place-bound combat
→ investigation / record comparison
→ choice
→ voluntary return
→ report / permanent growth
→ revisit / follow-up
```

main basic attack:
- 좌클릭 유지 중 반복 공격.
- 좌클릭 해제 시 중지.
- 적 대상 aim assist 가능.
- 서브게임 auto attack 계약과 분리.

### LEGACY gameplay behavior
다음은 current main progression으로 복구하지 않는다.
- 70초 timer pressure.
- 88초 signal collapse.
- 108초 forced extraction.
- 108초 완료 → L02 unlock.
- fixed-time survival run.
- main-game auto-fire.
- 240초 boss gate.

## 5. P0 current interpretation

기존 source priority metadata는 수정하지 않는다. 다만 의미를 두 층으로 읽는다.

- `production_priority`: 제작 우선순위.
- `first_play_priority`: 실제 first-play 노출/진행 의미.

따라서 기존 P0는 자동으로 “첫 15분 필수 진행”을 뜻하지 않는다.

핵심 해석:
- R01-L01: first playable R01.
- R01-L02: early follow-up.
- R01-L03: early production boss milestone, NOT first 15 min.
- R08-L01: early hub/framing, contextual.
- R08-L02: early support, optional/contextual.

상세값은 `15_E01_P0_METADATA_INTERPRETATION_V0_1.md`를 따른다.

## 6. R08 framing rule

- R08-L01은 survivor settlement/supply outpost framing hub 역할을 유지한다.
- R08-L02는 optional/support infrastructure다.
- `R08-L01 → R08-L02 → R01-L01` 강제 튜토리얼 체인을 만들지 않는다.
- current RPG safe hub와 R08-L01의 runtime 1:1 동일성은 미확정이다.
- E01_C08 historical relief/shelter infrastructure와 current survivor-operated silence zone layer를 동일 운영 주체로 취급하지 않는다.

## 7. R01-L03 milestone rule

R01-L03은 first 15 minutes boss가 아니다.

최소 progression:
```text
R01-L01 first quest
→ voluntary return
→ report/growth
→ R01-L02 follow-up investigation/revisit
→ C01 progression
→ R01-L03 boss milestone
```

- exact quest number: TBD.
- 새 초 단위 timer: 금지.
- boss role: 유지.
- first-play strict endpoint 해석: 폐기.

## 8. Legacy alias rule

old Godot identifiers는 문서 alias/reference로만 보존한다.

`silence_edge_start`, `outer_recovery_lane_anchor`, `subdivision_loop_center`, `open_house_street_anchor`, `model_house_node_anchor`, `drain_pocket_anchor`, `fake_return_route_anchor`.

Unreal runtime authority는 새 semantic tag/runtime identifier를 사용한다. old exact identifier를 runtime authority로 부활시키지 않는다.

## 9. Graph separation rule

Production data는 다음 3개 graph로 분리한다.

1. `LOCAL_VISIBILITY_PROGRESSION_GRAPH`
2. `LOCAL_PHYSICAL_TRAVEL_GRAPH`
3. `CAMPAIGN_DEPENDENCY_GRAPH`

37 source connection은 위 graph의 canonical edge 자체가 아니라 historical mapping source다.

이번 canonicalization에서:
- new physical edge: 0.
- new campaign dependency edge: 0.
- source edge modification: 0.

## 10. Relay / Beacon / Recovery rule

- E01 Sector Relay actual location: TBD / PRODUCTION FILL.
- R08-L02 `RECOVERY_SUPPORT = CANDIDATE_LOCK`.
- R08-L02 `LOCAL_BEACON_SUPPORT = CANDIDATE`.
- R08-L02 `SECTOR_RELAY = NOT_ASSIGNED`.
- 하나의 physical place에 복수 장치가 있어도 data role은 분리한다.

## 11. Production Fill order

1. E01_C01
2. E01 common Travel/Graph Schema
3. E01_C08
4. E01_C02 / E01_C03
5. E01_C04 / E01_C06
6. E01_C05 / E01_C07

이는 **Production Design 작업 순서**이며 gameplay unlock order가 아니다.

## 12. Canonical result

- hierarchy: LOCKED BY FINAL LOCK
- 40 Local: PRESERVED
- 37 source connection: PRESERVED
- current/legacy gameplay: SEPARATED
- R08 framing: CANONICALIZED
- R01-L03 milestone: CANONICALIZED
- legacy alias: DOCUMENT-ONLY
- graph separation: CANONICALIZED
- Production Fill order: CANONICALIZED
- Unreal implementation: 0

판정: **E01 REMAP CANONICAL / PASS**.
