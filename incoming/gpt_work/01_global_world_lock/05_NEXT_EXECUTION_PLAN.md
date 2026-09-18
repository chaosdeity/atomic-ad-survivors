# 05 Next Execution Plan

상태: 사용자 결정 반영 후 다음 단계 제안 / 사용자 승인 대기

## 결론

아직 E01 상세 재연결이나 실제 플레이 맵으로 내려가지 않는다.

다음 작업은 전 지구 상위 구조를 한 번 더 검증 가능한 데이터 계약으로 만드는 것이다.

## P0-1. 이번 결정 반영 검증

완료 조건:

- 96 ID 변경 0
- display name policy 반영
- visibility 5단계 반영
- E01 global compression 반영
- 6 differentiation fields 반영
- relay + beacon + recovery line 혼합형 반영
- Direct Memory / Rumor Memory 분리

## P0-2. 96 Campaign Schema 최소형

다음 단계 후보 문서:

`GLOBAL_CAMPAIGN_SYSTEM_SCHEMA_V0_1.md`

최소 schema:

- campaign_id
- display_name
- aliases/history
- sector_id
- campaign_family
- regional_secondary_collapse
- infrastructure_anchor
- gameplay_law
- human_recognition_rule
- resource_ecology
- persistence_profile
- visibility_state
- relay/beacon 접근 상태

목적은 96개의 내용을 새로 쓰는 것이 아니라 동일한 제작 질문을 강제하는 것이다.

## P0-3. 중복 위험 6개군 실제 데이터 검증

이번 differentiation gate를 기준으로 각 위험군의 기존 카탈로그/지도 문서를 다시 검사한다.

결과:

- PASS
- NEEDS DIFFERENTIATION
- NAME ONLY DIFFERENCE
- SYSTEM OVERLAP

중 하나로 판정한다.

아직 local node를 만들지 않는다.

## P0-4. Rumor Propagation Link 규칙

전 지구 모든 캠페인을 완전 연결 그래프로 만들지 않는다.

링크 후보는 실제 관계를 가진 경우만 둔다.

- resident movement
- communications
- logistics
- broadcast
- administrative records
- support dependency
- beacon/recovery record

검증할 것:

- 정보가 어디서 시작됐는가
- 왜 이 캠페인까지 도달하는가
- 얼마나 왜곡되는가
- 어떤 gameplay effect까지만 허용되는가

## P0-5. Global Travel Data Contract

relay / beacon / recovery line의 상위 지도 데이터 최소형을 작성한다.

아직 실제 relay 위치를 대량 생성하지 않는다.

구분:

- remote_detected
- relay_candidate
- relay_established
- beacon_fixed
- sortie_available
- extraction_degraded

## P0-6. Final LOCK Candidate

위 검증이 끝난 뒤에만:

`GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md`

후보를 만든다.

현재 `02_GLOBAL_WORLD_STRUCTURE_LOCK_DRAFT_V0_2.md`를 이름만 바꿔 확정하지 않는다.

## 이후 순서

Final LOCK 승인 후:

1. E01 8 campaign과 기존 40 local의 hierarchy 재매핑
2. Unreal RPG34/RPG35 실제 플레이 구간과 E01 node 연결 감사
3. E01 campaign별 persistence/resource 적용
4. 그 뒤 실제 플레이 맵/환경 제작

## 금지 유지

- E01 상세 재연결 선행 금지
- E02~E12 신규 local 생성 금지
- 96 campaign ID 수정 금지
- main write/merge/push 금지
- Godot proof 자동 포팅 금지
- rumor를 단일 reputation 숫자로 축약 금지
- rumor만으로 물리 상태 변경 금지
