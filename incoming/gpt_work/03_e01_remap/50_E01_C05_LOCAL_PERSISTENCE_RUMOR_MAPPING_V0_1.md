# 50 E01 C05 Local / Persistence / Rumor Mapping V0.1

상태: **E01_C05 LOCAL PERSISTENCE RUMOR MAPPING**
구현 상태: **NOT UNREAL IMPLEMENTATION**
persistence_profile.class: **STANDARD**

## 0. 공통 원칙

E01_C05의 5 Local을 source provenance / authority transformation chain에 매핑한다.

현재 Unreal 구현은 5 Local 모두 없다.

implementation_status:
**FUTURE_PRODUCTION_FILL**

Direct Memory는 직접 확보 / 검증한 사건 상태다. Rumor / Information은 송출, 재전달, 해석, credibility 정보이며 Direct를 자동 덮어쓰지 않는다.

## 1. Local mapping

| Local | source role | authority role | transformation role | recognition role | resource / service role | Direct Memory | Rumor candidate | implementation_status |
|---|---|---|---|---|---|---|---|---|
| R05-L01 수신탑 외곽 | received signal / original source acquisition / coverage boundary | provenance claim의 시작점 | 수신 / 수집 단계. downstream 의미 변형은 아직 확정하지 않음 | receiver, source witness / submitter | receiver / transmission capacity, source availability, record integrity | 직접 확보한 source, signal provenance, verified source witness state | signal availability, source credibility, 외부에서 들은 수신 해석 | **FUTURE_PRODUCTION_FILL** |
| R05-L02 반복 뉴스 스튜디오 | upstream source와 archive excerpt를 비교 | editorial presentation authority | repetition / edit / stale framing | authorized contributor, broadcast subject | archive availability, verification capacity, editorial processing | 확인한 edit chain, 원본 대비 누락/반복, verified archive | 반복 송출 내용, 편집본 interpretation, stale framing 정보 | **FUTURE_PRODUCTION_FILL** |
| R05-L03 추천 서버실 | editorial output / source metadata input | ranking / recommendation authority claim | priority / recommendation / ranking transformation | authorized contributor, broadcast subject, source subject | processing / recommendation capacity, log availability, record integrity | 확인한 ranking input/output, recommendation transformation | 무엇이 우선 노출된다는 정보, ranking credibility 정보 | **FUTURE_PRODUCTION_FILL** |
| R05-L04 빈 관객석 공개홀 | selected / ranked message의 public source context | public presentation / amplification authority | presentation / repetition / amplification | audience member, public participant, broadcast subject | presentation / channel availability, audience-role record | 확인한 amplification state, audience-role interpretation, upstream 대비 변화 | public interpretation, repeated presentation, audience reaction 정보 | **FUTURE_PRODUCTION_FILL** |
| R05-L05 마지막 앵커 송출실 | chain 전체의 outgoing source package | final broadcast authority claim | 최종 송출 선택 / packaging / current-fact claim | receiver, authorized contributor, broadcast subject | broadcast channel, verification capacity, provenance integrity | 직접 확인한 final authority state, outgoing choice, verified vs unverified result | 송출 내용, 재전달 정보, final-anchor interpretation | **FUTURE_PRODUCTION_FILL** |

## 2. Direct Memory contract

STANDARD Direct Memory 후보:
- original source acquisition.
- verified archive.
- verified editorial transformation.
- verified recommendation / ranking transformation.
- verified amplification state.
- final authority state.
- source credibility investigation.
- important information choice.
- verified vs unverified state.
- report / revisit consequence.

Direct Memory는 실제 조사 / 검증 결과를 저장한다.

## 3. Rumor / Information contract

Rumor 후보:
- broadcast content.
- retransmitted information.
- source credibility information.
- broadcast interpretation.
- recommendation / ranking interpretation.
- transmission availability information.

허용 channel:
- communications.
- broadcast.
- administrative record.
- resident movement.
- recovery / beacon record.
- 실제 source delivery channel.

Rumor가 영향을 줄 수 있는 것:
- 질문.
- 준비.
- 신뢰 / 보류 판단.
- 추가 검증 우선순위.
- public interpretation.

Rumor만으로 바꿀 수 없는 것:
- actual facility repair.
- actual transmission operation.
- physical route.
- stock.
- service capacity.

## 4. STRUCTURAL boundary

persistence_profile.class = **STANDARD**  
STRUCTURAL physical persistence = **NOT LOCKED**

자동 확정 금지:
- 방송망 영구 재건.
- 송신탑 영구 파괴.
- 항만/공항 영구 폐쇄.
- 도로/탑승교 영구 변경.
- 대규모 인구 이동.
- 물리 route 영구 개방.

## 5. Graph protection

historical source refs:
- 28 R08-L03 → R05-L01.
- 29 R05-L01 → R05-L02.
- 30 R05-L02 → R05-L03.
- 31 R05-L03 → R05-L04.
- 32 R05-L04 → R05-L05.

이 mapping은 source edge 또는 Common Graph를 수정하지 않는다.

new source edge = **0**  
new visibility edge = **0**  
new physical edge = **0**  
new dependency edge = **0**

판정: **E01_C05 LOCAL / PERSISTENCE / RUMOR MAPPING PASS**.
