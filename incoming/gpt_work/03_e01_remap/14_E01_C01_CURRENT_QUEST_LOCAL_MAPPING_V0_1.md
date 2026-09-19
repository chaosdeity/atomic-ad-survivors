# 14 E01_C01 Current Quest / Local Mapping V0.1

상태: CURRENT QUEST ↔ LOCAL CANONICAL MAPPING
범위: current RPG34/RPG35 의미를 E01_C01 Local 구조에 연결
구현 상태: NOT UNREAL IMPLEMENTATION

## 0. Mapping 원칙

현재 구현된 RPG quest slice와 C01 전체 campaign을 동일시하지 않는다.

- RPG34/RPG35: current first playable / follow-up slice.
- E01_C01: R01-L01~R01-L05 전체 residential campaign contract.
- current safe hub: R08-L01과 runtime 1:1 동일 공간으로 확정하지 않음.
- exact Unreal geometry boundary와 canonical Local semantic mapping을 구분.

## 1. R01-L01 침묵 가장자리

mapping: **CURRENT FIRST PLAYABLE RESIDENTIAL SLICE**

current quest 의미:
1. safe hub에서 의뢰 수락.
2. residential local entry.
3. 시간제한 없는 탐사.
4. 장소 귀속 유한 전투.
5. 수령/인증/household 관련 기록 조사.
6. 선택 조사 가능.
7. current MAIL-LOOP 상태 선택.
8. 플레이어 선택 정상 귀환.
9. 보고 및 일회성 성장.
10. revisit에서 저장된 상태 확인.

C01 의미:
- household / occupancy / recipient recognition을 처음 체감하는 주거 slice.
- “108초 인양 tutorial”로 해석하지 않는다.

금지:
- R08-L02를 반드시 거쳐야만 L01에 입장한다고 확정.
- 108초 완료 → L02 unlock.
- main auto-fire.

## 2. R01-L02 분양 주택 루프

mapping: **CURRENT FOLLOW-UP HOUSING-RECORD INVESTIGATION / REVISIT**

current RPG35 의미:
1. 첫 보고 이후 후속 의뢰 수락.
2. follow-up housing area 진입.
3. 서로 다른 주거 기록 3개 대조.
4. 선택 조사 흔적 확인 가능.
5. 장소 귀속 유한 전투.
6. 미완료 진행 보존.
7. 자율 귀환.
8. 후속 보고 및 일회성 성장.
9. 완료 이후에도 탐사/재방문 가능.

C01 의미:
- first slice에서 제시한 household/occupancy 기록 충돌을 반복 방문과 기록 대조로 확장하는 early follow-up Local.

주의:
- RPG35의 현재 map geometry가 canonical Local boundary의 최종 production geometry라는 뜻은 아니다.
- old timer/boss-signal progression은 적용하지 않는다.

## 3. R01-L03 모델하우스 결절

mapping: **FUTURE C01 EARLY-SEASON BOSS MILESTONE**

최소 progression:
```text
R01-L01 first quest
→ voluntary return
→ report/growth
→ R01-L02 follow-up investigation/revisit
→ additional C01 progression
→ R01-L03 boss milestone
```

- exact quest number: **TBD**.
- current RPG34/RPG35에 boss 구현 없음.
- first 15 minutes boss가 아님.
- 240초/signal gate 금지.

현재 확정되는 것은 milestone position의 방향뿐이며 boss encounter 세부, quest count, arena, reward는 새로 창작하지 않는다.

## 4. R01-L04 배수로 침묵 주머니

mapping: **FUTURE PRODUCTION FILL / REVISIT CANDIDATE**

현재 유지:
- Local ID/name.
- 기존 차폐/숨은 회수 의미의 historical reference.

현재 미정:
- current quest assignment.
- exact gameplay law.
- physical travel.
- persistence consequence.

새 quest chain을 만들지 않는다.

## 5. R01-L05 가짜 귀환로

mapping: **FUTURE PRODUCTION FILL / REVISIT CANDIDATE**

현재 유지:
- Local ID/name.
- 기존 재방문/거짓 귀환 의미의 historical reference.

현재 boundary:
- current main의 voluntary return을 무효화하는 전역 함정으로 만들지 않는다.
- actual false-return mechanic, quest placement, physical route는 Production Fill 전까지 TBD.

## 6. Safe hub / R08 boundary

current RPG의 safe hub는 quest/report/growth의 runtime context로 확인된다.

그러나:
- safe hub = R08-L01 canonical 동일 공간: **NOT LOCKED**.
- R08-L01은 framing/survivor settlement hub role.
- R08-L02는 optional/support infrastructure.
- `R08-L01 → R08-L02 → R01-L01` mandatory tutorial chain: 금지.

## 7. Mapping result

| Local | mapping |
|---|---|
| R01-L01 | CURRENT FIRST PLAYABLE RESIDENTIAL SLICE |
| R01-L02 | CURRENT FOLLOW-UP HOUSING-RECORD INVESTIGATION / REVISIT |
| R01-L03 | FUTURE C01 EARLY-SEASON BOSS MILESTONE / exact quest TBD |
| R01-L04 | FUTURE PRODUCTION FILL / REVISIT CANDIDATE |
| R01-L05 | FUTURE PRODUCTION FILL / REVISIT CANDIDATE |

new quest chain creation: 0.
new Local: 0.
new source edge: 0.

판정: **CURRENT QUEST ↔ LOCAL MAPPING / PASS**.
