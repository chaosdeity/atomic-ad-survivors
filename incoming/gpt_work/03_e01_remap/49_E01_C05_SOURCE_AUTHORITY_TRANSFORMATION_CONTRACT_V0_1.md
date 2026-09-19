# 49 E01 C05 Source / Authority Transformation Contract V0.1

상태: **E01_C05 SOURCE AUTHORITY CONTRACT**
구현 상태: **NOT UNREAL IMPLEMENTATION**
Campaign: **E01_C05 방송 / source / authority**

## 0. 목적

E01_C05의 campaign-specific anti-repeat law를 source provenance와 authority transformation chain으로 고정한다.

핵심 chain:

source / received signal  
→ editorial transformation  
→ recommendation / ranking transformation  
→ public presentation / amplification  
→ final anchor transmission

각 단계는 upstream source를 자동으로 더 진실하게 만들지 않는다. authority claim은 검증 가능해야 하며, 변형 단계가 추가될수록 provenance 추적이 중요해진다.

## 1. Stage 1: source acquisition

Local anchor: **R05-L01 수신탑 외곽**

- input: received signal, archive reference, source submission, source witness record.
- transformation: 수신 / 수집 / 기록. 원본의 존재와 provenance를 보존하는 범위이며 의미를 재창작하지 않는다.
- authority claim: 이 정보가 특정 source 또는 수신 경로에서 왔다는 provenance claim.
- verification possibility: 원본 source, archive, source witness, signal record, current reality를 대조.
- failure consequence: source가 불명확하거나 stale이면 이후 단계의 authority 근거가 약해지고 verified 상태로 승격하지 못한다.

source acquisition 자체가 truth 또는 final authority를 보장하지 않는다.

## 2. Stage 2: editorial transformation

Local anchor: **R05-L02 반복 뉴스 스튜디오**

- input: acquired source, archive excerpt, prior broadcast material.
- transformation: 편집, 반복, framing, context 축소 또는 재배열.
- authority claim: 편집된 presentation이 source를 대표한다는 claim.
- verification possibility: 편집본을 upstream source / archive와 대조해 누락, 반복, stale framing을 확인.
- failure consequence: 원래 context와 분리된 메시지가 반복되며 현재 상황에 맞는 정보처럼 보일 수 있다.

편집 과정은 source provenance를 삭제하는 권한을 자동 획득하지 않는다.

## 3. Stage 3: recommendation / ranking transformation

Local anchor: **R05-L03 추천 서버실**

- input: editorial output, recommendation / ranking logs, source metadata.
- transformation: 우선순위 부여, 노출 순서 변경, 일부 메시지의 반복 또는 가시성 증폭.
- authority claim: 높은 rank 또는 recommendation이 더 중요하거나 적합하다는 claim.
- verification possibility: ranking input, recommendation record, upstream source, 실제 현재 상황을 대조.
- failure consequence: 높은 rank가 truth authority로 오해되어 변형된 정보가 original source보다 더 신뢰받을 수 있다.

새 AI 설정을 창작하지 않는다. 기존 추천 시스템 / 로그 수준만 사용한다.

## 4. Stage 4: public presentation / amplification

Local anchor: **R05-L04 빈 관객석 공개홀**

- input: selected / ranked message, public presentation record, audience-role record.
- transformation: 공개 presentation, 반복, amplification, audience-facing framing.
- authority claim: 공개적으로 크게 제시되거나 반복된 메시지가 공적 중요성 또는 합의처럼 보인다는 claim.
- verification possibility: upstream source / edit / ranking chain과 audience-role record를 대조.
- failure consequence: amplification이 provenance보다 앞서면서 popularity / repetition / staging이 authority처럼 작동할 수 있다.

audience 반응 또는 presentation은 physical facility state를 자동 변경하지 않는다.

## 5. Stage 5: final broadcast authority

Local anchor: **R05-L05 마지막 앵커 송출실**

- input: source provenance, editorial output, ranking output, public amplification state, current reality.
- transformation: 최종 송출 선택, outgoing message packaging, 현재 사실로 취급할 claim의 확정 또는 보류.
- authority claim: final anchor transmission이 현재 시점에 내보낼 수 있는 공식 또는 준공식 broadcast authority claim.
- verification possibility: chain 전체를 역추적하고 current reality와 직접 대조.
- failure consequence: stale / altered / context-loss message가 현재 사실처럼 송출되거나, 반대로 검증 가능한 정보가 근거 없이 보류될 수 있다.

R05-L05는 자동 전체 진실 공개 또는 엔딩이 아니다.

## 6. Authority transformation law

E01_C05에서 authority는 다음 원칙을 따른다.

1. source existence ≠ verified truth.
2. edit ≠ source.
3. rank ≠ truth.
4. amplification ≠ truth.
5. final broadcast ≠ omniscient truth.
6. authority claim은 upstream provenance와 current reality에 의해 검증 가능해야 한다.
7. verified upstream evidence 없이 downstream presentation만으로 authority를 자동 승격하지 않는다.

player 판단 후보:
- trust information.
- withhold information.
- expose transformation.
- redirect information to a different information target/channel.

redirect information은 physical route 변경이 아니다.

## 7. Failure / recovery contract

실패는 시설 파괴가 아니라 provenance와 authority 검증 실패를 중심으로 둔다.

- source unavailable → verification 보류.
- archive unavailable → transformation 비교 제한.
- verification capacity 부족 → verified state 보류.
- recommendation processing unavailable → ranking provenance 확인 제한.
- broadcast channel unavailable → outgoing transmission 제한.
- record integrity 불명 → authority claim 보류.

복구 / 재시도는 실제 source, archive, verification, processing, channel availability가 확인될 때만 가능하다.

무한 검증, 무한 archive access, 무한 transmission을 만들지 않는다.

## 8. Information is not currency

정보 자체를 currency, 구매력, universal token으로 만들지 않는다.

정보는:
- provenance.
- verification state.
- authority claim.
- Direct Memory.
- Rumor / Information.

으로 취급한다.

정보만으로:
- 시설 수리.
- 송신탑 작동.
- physical route open.
- stock 증가.
- service capacity 생성.

을 하지 않는다.

## 9. Result

source acquisition: **DEFINED**  
editorial transformation: **DEFINED**  
recommendation / ranking transformation: **DEFINED**  
public amplification: **DEFINED**  
final broadcast authority: **DEFINED**

판정: **E01_C05 SOURCE / AUTHORITY TRANSFORMATION CONTRACT PASS**.
