# 11 GLOBAL RELAY BEACON RECOVERY CONTRACT V0.1

상태: **PRELOCK DATA CONTRACT / 실제 relay 위치 생성 아님**

```text
REMOTE SIGNAL
→ RELAY CANDIDATE
→ RELAY ESTABLISHED
→ BEACON FIXED
→ SORTIE AVAILABLE
→ EXTRACTION
```

정보는 신체 이동보다 먼저 도달할 수 있지만 실제 출격/인양은 물리 접근 계약을 요구한다.

## 1. 상태축

### remote_signal_state
`unknown | remote_detected | decoded`

### relay_state
`none | relay_candidate | relay_established | degraded`

### beacon_state
`none | candidate | beacon_fixed | degraded | contaminated`

### sortie_state
`locked | sortie_available | active`

### extraction_state
`unavailable | available | extraction_degraded | blocked`

## 2. 단계별 계약

| 단계 | 열기 위해 알아야 할 것 | 물리적 필요 | 저장 상태 | 실패 | 실패 후 남는 것 | 글로벌 지도 |
|---|---|---|---|---|---|---|
| REMOTE SIGNAL | sector 방향/신호 존재 | 원격 수신 가능성 | signal/decode 상태 | 가능 | 노이즈/오염 | 원격 감지 cluster |
| RELAY CANDIDATE | 현지 중계 가능 인프라 | 폐역/대피소/무전소/항만창고 등 후보 | candidate와 발견 근거 | 가능 | 후보 상실/접근 불가 | 부분 복원 anchor |
| RELAY ESTABLISHED | candidate 검증 | 작동 가능한 중계점/침묵점 | relay 상태/지원 범위 | 가능 | degraded relay | sector 접근 근거 |
| BEACON FIXED | local 고정 좌표 | 현지 beacon/회수 기준점 | beacon/좌표 품질/노출 | 가능 | degradation/contamination/exposure | local 진입점 |
| SORTIE AVAILABLE | decoded + relay + beacon | 태그 호환/작전 준비/회수선 | sortie/risk | 가능 | sortie lock/조건 강화 | 출격 가능 local |
| EXTRACTION | 회수 경로 | recovery line + beacon + 회수 capacity | extraction 결과/손실/노출 | 가능 | delay/loss/degradation/contamination | 귀환 상태/위험 |

## 3. 최소 출격 gate

- `remote_signal_state = decoded`
- `relay_state = relay_established`
- `beacon_state = beacon_fixed`
- local/campaign tag 및 infrastructure compatibility 허용
- recovery line이 `available` 또는 사용자 승인된 degraded 상태

## 4. Extraction 실패 영향 후보

- extraction delay
- recovered item loss
- beacon degradation
- coordinate contamination
- signal exposure
- local campaign learning

`local campaign learning`은 다음 중 하나가 있을 때만 가능:

- 현지 campaign의 직접 관측
- beacon/recovery record를 읽는 causal link
- 주민/지원 네트워크의 실제 정보 전달

실패 사실이 전 세계에 자동 broadcast되지 않는다.

## 5. persistence

```yaml
travel_access:
  remote_signal_state: ...
  relay_state: ...
  beacon_state: ...
  sortie_state: ...
  extraction_state: ...
  coordinate_quality: unknown | coarse | fixed | contaminated
  signal_exposure: none | low | elevated
```

보조값은 `travel_access` 내부에 두고 campaign 최상위 field를 늘리지 않는다.

## 6. 글로벌 지도 노출

- remote_detected: 방향/sector 가명/신호 농도
- decoded: campaign family 또는 cluster 일부
- relay_candidate: 부분 복원 인프라 축
- relay_established: sector 접근 근거
- beacon_fixed: local 진입점 후보
- sortie_available: 출격 가능한 local과 extraction 위험
- truth_restored는 travel state가 아니라 별도 visibility state

## 7. 이번 작업에서 만들지 않는 것

- 실제 relay 좌표
- 실제 beacon 좌표
- E02~E12 local node
- 이동 시간/비용 수치
- Unreal travel code
