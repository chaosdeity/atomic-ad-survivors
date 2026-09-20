# E01 M08 시나리오 통합 보정 v0.2
## 살아남는 사람의 등급

문서 성격: V0.1 비파괴 integration overlay  
Campaign: E01_C06 포인트 거리  
신규 LOCKED canon: 0

`e01_m08_survivor_rank_scenario_draft_v0_1.md`의 거래 인간극을 유지하되, 숫자/slot/ingress 경계를 아래처럼 고정한다.

## 1. C06의 핵심

C06은 다음을 다룬다.

- membership / account
- transaction
- tier
- review / reputation
- benefit entitlement
- service access

"포인트"는 이 Campaign의 entitlement/access record다. 범용 세계 화폐나 모든 Campaign을 연결하는 단일 경제 재화로 확장하지 않는다.

## 2. Slot 사용 규칙

slot이라는 단어를 사용할 때 반드시 구체 service와 영향을 받는 주체를 함께 보여준다.

좋은 예:

```text
VIP 유지보수 entitlement 하나가 이동한다.
그 결과 특정 충전 스테이션의 실제 이용 가능 시간이 줄고,
기다리던 로봇들이 더 늦게 충전된다.
```

금지:

- slot 수 자체가 인간 가치 점수처럼 작동
- "등급 +3" 같은 추상 점수 승패
- 숫자만 보고 누가 사는지 결정
- 포인트를 실제 service availability와 동일시
- 한 transaction이 자동으로 다른 Campaign resource를 생성/삭제

## 3. 인간극 우선순위

M08의 중심은 장부 수학이 아니다.

각 거래 장면은 최소 하나를 보여준다.

- 누가 기다리게 되는가
- 누가 자기 entitlement를 잃는가
- 누가 다른 사람의 손실을 알고도 거래를 받는가
- 누가 거래를 거절해서 보급소의 부족을 더 오래 감당하는가
- 브로커가 어떤 조건을 뒤로 미뤘는가
- 미나와 윤서가 어떤 비용을 서로에게 공개했는가

장부, tier, slot, 재판매 횟수는 이 인간 비용을 추적하기 위한 증거다.

## 4. R06 Local

Canonical:

- R06-L01 회원 게이트 거리
- R06-L02 포인트 거래 골목
- R06-L03 리뷰 키오스크 광장
- R06-L04 VIP 라운지
- R06-L05 블랙프라이데이 홀

V0.1이 사용한 L01-L04 이름은 일치한다.

## 5. R06 ingress 경계

R06-L01 external ingress는 최신 graph에서 **KNOWN GAP**이다.

따라서 M08 시작은 다음 중 하나로만 취급한다.

- entry가 별도 production 단계에서 해결된 뒤의 in-medias-res 장면
- 아직 route가 붙지 않은 narrative scene candidate

이번 문서가 보급소 -> R06, R04 -> R06, 또는 다른 Local -> R06-L01 physical edge를 만들지 않는다.

## 6. Dependency 경계

C06 거래가 보급소 부족과 관련돼도 Common Campaign Dependency edge를 새로 만들지 않는다. 물품/서비스 영향이 다른 Campaign까지 이어진다는 사실은 별도 provider/consumer/resource/failure/recovery evidence 전에는 확정하지 않는다.

## 7. 윤서 적용

주축 후보:

- SELF-ERASURE <-> SELF-PRESERVATION
- CONTROL <-> DELEGATION

미나, 브로커, 주민 각각의 DISTRUST <-> RELIANCE는 별도 관계 기억이다.

"깨끗한 선택"을 고집하는 태도는 선악 점수가 아니다. 윤서가 어떤 비용을 자기 몫으로 두고 어떤 비용을 타인에게 넘기는지가 다음 대사에 남는다.

## 8. M09 경계

M08 종료 후 허용되는 hook은 다음 수준이다.

```text
침묵 보급소 또는 그 주변을 향한 외부 관심/압력이 감지된다.
정확한 주체, 이동 경로, ingress, 공격 방식, dependency는 미확정이다.
```

M09 완전 시나리오, 보급망 travel, 구조 신호의 물리 경로, 보급소 ingress 규칙은 이번 파일에서 작성하지 않는다.
