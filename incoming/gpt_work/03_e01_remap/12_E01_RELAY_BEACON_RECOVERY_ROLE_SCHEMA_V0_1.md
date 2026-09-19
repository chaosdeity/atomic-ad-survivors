# 12 E01 Relay / Beacon / Recovery Role Schema V0.1

상태: E01 TRAVEL ROLE SCHEMA
범위: E01 Production Fill
구현 상태: NOT UNREAL IMPLEMENTATION

## 0. 원칙

Final Lock의 Global Travel 계약을 E01에 적용한다.

- Sector 이동 기반: Relay.
- Local sortie 기반: Beacon.
- Extraction: Recovery Line + Beacon.
- 무료 순간이동 금지.
- source 37 Local connection을 Relay graph로 사용 금지.

하나의 physical place에 여러 장치가 있을 수 있으나 data role과 assignment state는 분리한다.

## 1. SECTOR_RELAY

### role
Sector/global movement와 장거리 travel availability를 성립시키는 infrastructure role.

### E01 state
- actual location: **TBD / PRODUCTION FILL**.
- R08-L02 assignment: **NOT_ASSIGNED**.

### allowed
- 실제 relay infrastructure와 movement contract가 확보된 뒤 assignment.
- sector travel availability의 한 요소로 사용.

### forbidden
- R08-L02가 old signal/recovery 의미를 가졌다는 이유만으로 Relay 확정.
- source 37의 cross-campaign edge를 Relay로 승격.
- remote_signal을 Relay route로 승격.

## 2. LOCAL_BEACON

### role
Local sortie access와 local approach/return reference를 지원하는 Beacon role.

### E01 state
- actual Beacon assignment: Production Fill 대상.
- R08-L02 `LOCAL_BEACON_SUPPORT = CANDIDATE`.

`LOCAL_BEACON_SUPPORT`는 “R08-L02 자체가 E01의 canonical Beacon이다”라는 뜻이 아니다. Beacon 기능을 지원할 수 있는 physical infrastructure 후보라는 뜻이다.

### allowed
- 실제 Local sortie access 근거와 결합.
- Recovery Line과 함께 extraction의 endpoint/reference를 구성.

### forbidden
- 모든 Local에 자동 Beacon 생성.
- source edge가 있으면 Beacon이 있다고 간주.
- current RPG safe hub와 자동 동일시.

## 3. RECOVERY_LINE

### role
작전 불가 또는 플레이어가 선택한 정상 귀환에서 실제 extraction/recovery causality를 담당하는 line/path/channel.

### E01 state
- exact physical line/anchor: **TBD / PRODUCTION FILL**.
- fixed-time extraction과 분리.

### allowed
- voluntary return.
- emergency physical recovery.
- 실제 geometry/service/support 근거가 있는 extraction.

### forbidden
- 70/88/108 timer를 Recovery Line 조건으로 복구.
- 108초 도달을 Local unlock으로 사용.
- 무료 순간이동.
- one-node all-purpose extraction origin을 근거 없이 확정.

## 4. RECOVERY_SUPPORT

### role
Recovery Line/Beacon 운용을 물리적으로 지원하는 장비, 전력, 인양, 정비, 접근 infrastructure.

### R08-L02 state
`RECOVERY_SUPPORT = CANDIDATE_LOCK`.

근거:
- world_structure 제작 순서의 역송출 주유소/인양 장비 관계.
- old recovery support 의미의 semantic continuity.
- PM-04 확정.

이는 exact device layout, Recovery Line endpoint, Beacon assignment, Sector Relay assignment를 잠그지 않는다.

## 5. R08-L02 role matrix

| data role | state | 의미 |
|---|---|---|
| RECOVERY_SUPPORT | CANDIDATE_LOCK | recovery-support infrastructure 의미를 Production Fill 기준으로 유지 |
| LOCAL_BEACON_SUPPORT | CANDIDATE | Beacon 기능 지원 가능성. actual Beacon assignment 아님 |
| SECTOR_RELAY | NOT_ASSIGNED | E01 Sector Relay actual location 미확정 |
| RECOVERY_LINE_ENDPOINT | NOT_ASSIGNED | exact extraction endpoint 미확정 |

## 6. Physical co-location rule

같은 장소에 예를 들어 recovery 장치와 Beacon-support 장치가 함께 있을 수 있다. 그래도 data에서는 다음을 독립 저장한다.

- role type.
- assignment state.
- support relation.
- actual physical host.
- source evidence.

따라서 “같은 장소”가 “같은 역할”을 뜻하지 않는다.

## 7. R08-L01과의 관계

R08-L01:
- framing / survivor settlement hub.
- current survivor-operated outpost layer.
- current RPG safe hub와 runtime 1:1 동일성은 미확정.

R08-L01이 hub라는 이유만으로 Sector Relay나 Local Beacon을 자동 배정하지 않는다.

## 8. Source 37과의 관계

- R08-L01 → R08-L02 source connection은 historical progression/visibility source로 보존.
- R08-L02 → R01-L01 source connection도 historical mapping source로 보존.
- 두 source edge는 physical travel/Relay/Beacon/Recovery assignment를 자동 생성하지 않는다.

## 9. Result

- E01 Sector Relay: TBD / PRODUCTION FILL.
- R08-L02 Recovery Support: CANDIDATE_LOCK.
- R08-L02 Local Beacon Support: CANDIDATE.
- R08-L02 Sector Relay: NOT_ASSIGNED.
- exact Recovery Line: TBD / PRODUCTION FILL.
- role separation: PASS.
- new physical edge: 0.

판정: **E01 RELAY / BEACON / RECOVERY ROLE SCHEMA / PASS**.
