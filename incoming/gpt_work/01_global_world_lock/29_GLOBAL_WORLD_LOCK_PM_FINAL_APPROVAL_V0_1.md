# 29 GLOBAL WORLD LOCK PM FINAL APPROVAL V0.1

상태: **PM FINAL APPROVED**  
대상: **FINAL GLOBAL WORLD STRUCTURE LOCK V0.2**  
승인 기준:
- Candidate 28: `28_GLOBAL_WORLD_STRUCTURE_LOCK_V0_2_CANDIDATE.md`
- Audit 30: `30_GLOBAL_WORLD_LOCK_CANDIDATE_AUDIT_V0_1.md`
- Canonical PRELOCK 26: `26_GLOBAL_WORLD_PRELOCK_CANONICAL_V0_1.md`
- PM Summary 27: `27_CANONICAL_PRELOCK_PM_SUMMARY_V0_1.md`

## 이번 LOCK에서 잠기는 것

1. GLOBAL → SECTOR E01~E12 → CAMPAIGN E##_C01~C08 → LOCAL NODE 계층
2. E01~E12 × C01~C08, 총 96 Campaign ID
3. ID 추가/삭제/sector 이동/family 재배열 금지
4. ID immutable, Display Name 별도 관리
5. Display Name 변경 시 alias/history 보존
6. Global Visibility 5단계
7. E01 40 local은 global node가 아니라 campaign 내부 local
8. E01의 local 밀도를 세계 기본값으로 사용하지 않음
9. Campaign Differentiation 6필드 유지
10. 새 top-level field 추가 없이 service/registration/refusal/dependency/persistence를 기존 필드 내부에 흡수
11. C03/C04 family boundary
12. C07/C08 family boundary
13. C01/C06 family boundary
14. C05 family anti-repeat contract
15. resource_ecology 기반 실제 자원/서비스 제약
16. resource_ecology.dependency_contract와 all-to-all dependency 금지
17. Persistence class NONE/LIGHT/STANDARD/STRUCTURAL의 semantic 의미
18. Direct Memory와 Rumor/Information 분리, rumor-only physical mutation 금지
19. Sector=Relay / Local sortie=Beacon / Extraction=Recovery Line+Beacon
20. E02~E12 기본 확장 방식은 season slice

## 잠기지 않는 것

아래는 **PRODUCTION FILL**이다.

- 96 campaign 개별 service 상세값
- 96 campaign 개별 persistence class
- C05 12개 개별 gameplay law
- 실제 rumor link graph
- 실제 service dependency graph
- 실제 relay/beacon 좌표
- E01 40 local 상세 재연결
- E02~E12 local 제작
- Unreal implementation
- actual RECOVER execution

이 항목은 상위 world structure 미확정으로 보지 않는다. 제작 진입 시 campaign별 근거를 채우는 영역이다.

## PRELOCK 결과

- PASS: **19**
- PARTIAL: **1 NON-BLOCKING**
- HOLD: **0**
- READY: **YES**
- PARTIAL: **C05 campaign-specific production fill**
- C05 family anti-repeat contract: 유지

## Registry

- rows: **96**
- unique: **96**
- missing: **0**
- unexpected: **0**

ID 추가, 삭제, 재배열 없음.

## 주요 Family Boundary

### C03 / C04
- C03: custody / flow / return / recovery
- C04: validity / authenticate / charge / repair

### C07 / C08
- C07: passage / quarantine / transfer
- C08: survival allocation / relief / shelter capacity

### C01 / C06
- C01: household / occupancy / family role
- C06: membership / payment / entitlement

### C05 anti-repeat
지역과 미술만 바꾼 동일 방송/추천 loop 반복 금지. 각 production campaign은 source, authority, recognition, transformation, resource ecology, persistence/rumor에서 차이를 만들어야 한다.

## 위험

LOCK 이후 위 상위 구조를 변경하면 다음 하위 작업의 재설계가 필요하다.

- ID/계층 변경: Registry, world navigation, campaign reference, save/reference 계약 재설계
- family boundary 변경: gameplay law, recognition, resource ecology, production brief 재검토
- Direct/Rumor 경계 변경: persistence, NPC 정보 상태, cross-campaign propagation 재설계
- dependency 규칙 변경: service degradation, resource flow, recovery condition 재설계
- Relay/Beacon/Recovery 변경: travel access, sortie, extraction 구조 재설계
- E01 compression 또는 season slice 변경: global map 밀도와 E02~E12 production scope 재산정

반대로 Production Fill 값의 작성과 보강은 이 상위 구조를 깨지 않는 범위에서 계속 가능하다.

## 승인

[x] APPROVE FINAL GLOBAL WORLD LOCK V0.2

[ ] HOLD

[ ] RETURN FOR REVISION

승인 상태: **PM FINAL APPROVED**

PM 최종 승인에 따라 `GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md`를 별도 Final Lock 파일로 생성한다.
