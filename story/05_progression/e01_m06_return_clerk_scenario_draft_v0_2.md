# E01 M06 시나리오 통합 보정 v0.2
## 반품 담당자는 누구였나

문서 성격: V0.1 비파괴 integration overlay  
Campaign: E01_C03 반품 회수 벨트  
신규 LOCKED canon: 0

`e01_m06_return_clerk_scenario_draft_v0_1.md`의 공동 작업과 정체성 공포는 유지하되, 장비 기원과 dependency를 아래처럼 교정한다.

## 1. 장비 기원은 미확정

R03에서 확인할 수 있는 것은 윤서 장비와 구형 C03 field-return protocol 사이의 **호환성 또는 설계 계열 유사성**까지다.

확정 금지:

- 윤서 장비의 원본이 R03에 있다는 주장
- 윤서가 R03의 옛 직원 또는 회수 담당자였다는 주장
- 장비의 제조사, 최초 소유자, 지급 경로 확정
- 시스템의 "작업자", "회수 담당자" 분류를 윤서 과거의 사실로 취급
- 장비 호환성을 윤서의 구체 새 과거 사건으로 연결

V0.1 Scene 7의 "윤서의 장비 원본"은 V0.2에서 **동계열 구형 키트 비교**로 읽는다.

허용되는 발견:

```text
R03 구형 현장 키트와
윤서 장비의 일부 프로토콜 / 결합 방식이 호환된다.
왜 그런지는 아직 모른다.
```

## 2. 공포의 초점

공포는 "윤서가 원래 가해 시스템 직원이었다"가 아니다.

```text
지금 사람을 살리는 데 쓰는 손동작과 장비가
사람과 물건의 custody를 분류하던 절차와
너무 잘 맞아떨어진다.
```

이 유사성이 윤서의 과거를 설명하지는 않는다.

## 3. C03 family boundary

M06의 primary verb는 다음으로 제한한다.

- actual custody와 record 대조
- hold / redirect / recover / release
- sender / recipient / custodian / authorized claimant 확인
- destination / return flow 검산

R03-L03 보증 심사 창고에서 authenticity, repairability, charging을 최종 판정하지 않는다. 그 축은 C04다.

## 4. Cross-campaign dependency 교정

V0.1의 "라인 정지로 R02 의료와 R08 식량 공급이 타격"은 V0.2에서 확정 사실로 사용하지 않는다.

최신 authority:

- Common Campaign Dependency Graph rows = 0
- E01_C03 cross_campaign_dependency = NONE_LOCKED
- progression source는 dependency evidence가 아님

따라서 M06의 WRONG MOVE는 R03 내부의 handling / sorting / custody service disruption으로 한정한다. 다른 Campaign의 물류 영향은 별도 검증 전 rumor 또는 미확정 가능성으로만 남긴다.

## 5. Local / travel 경계

Canonical:

- R03-L01 반품 접수 야드
- R03-L02 자동 분류장
- R03-L03 보증 심사 창고
- R03-L04 파쇄 전 대기라인
- R03-L05 최종 반품 심사실

V0.1이 사용하는 L01-L03 이름은 일치한다.

R03-L03 -> R04-L01 source relation은 progression source다. M06 NEXT HOOK는 R04 관련 정보/목표 해금으로만 읽고 physical travel edge나 dependency로 승격하지 않는다.

## 6. 윤서 적용

주축 후보:

- SELF-ERASURE <-> SELF-PRESERVATION
- HOLD <-> COMMIT

도윤과의 정보 공개는 relation-specific trust다.

윤서가 전체 로그를 숨기거나 과다 공개했을 때도 선악 점수 대신 다음을 남긴다.

- 도윤이 다음 장비 점검 전에 묻는 범위
- 윤서가 자기 장비 접근을 허용하는 방식
- 윤서가 "내 장비"라고 말할 때의 거리감
- 잘못 공유한 정보의 실제 후속 비용

## 7. 결말 경계

주임의 협조, 권한 손실, 재방문 반응은 episode candidate다. 윤서의 과거 직업, 장비 origin, R03-R04 실제 이동 방식은 확정하지 않는다.
