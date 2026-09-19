# E01 Episode Master Registry V0.1

상태: BATCH A / 제안 레지스트리 / BATCH B 확정 전
Canon status: 각 unit 모두 CANDIDATE. 기존 정사와 current runtime은 출처이지 이 새 편성의 자동 승인 근거가 아니다.

## 사용 규칙

`campaign_local`은 MASTER의 campaign/local 항목이다. 아래 18개 필드를 모든 제작 단위에 명시한다. 새로운 런타임 스키마가 아니라 편집 목록이다. 제목은 작품 내 정식 Local 이름을 바꾸지 않는 에피소드 제목 후보다. `implementation_priority`의 P0/P1/P2는 문안 제작 우선순위이며 해금 단계가 아니다.

12 MAIN_EPISODE + 8 SIDE_EPISODE + 3 CHARACTER_SIDE_STORY + 4 HUB_INTERLUDE + 8 ENVIRONMENTAL_STORY_GROUP = 35 unique units.

실제 완성 원고는 E01-M01의 08 파일럿, E01-M02의 09 파일럿, E01-HUB-01의 10 파일럿이다. 나머지는 설계 항목이다. 환경 그룹은 완성 기록의 수가 아니다. 보스 전후 장면과 post-finale hook은 메인 하위 장면으로 중복 집계하지 않는다.

현재 L01/L02 외의 이동·증거 취득·등장 조건은 실제 승인과 관측을 필요로 한다. 특히 C06/C07 ingress, C05 자료 전달, L03 제작, 새 관계 기억은 확인 필요다. 서사 동기를 물리 graph edge로 변환하지 않는다. D01~D09는 선행 패키지 10번을 가리킨다.

## Main episodes

```yaml
- episode_id: E01-M01
  type: MAIN_EPISODE
  campaign_local: E01_C01 / R01-L01; 현재 미나 의뢰·보고 접점
  title: 받을 사람
  POV: 윤서 제한 시점
  premise: 수령과 인증 기록은 남아 있지만 그 기록의 사람을 직접 확인하지 못한다.
  dramatic_question: 완료된 기록은 누구의 일을 끝낸 것인가?
  player_objective: 필수 기록을 조사하고 기존 호출 선택 후 자율 귀환·보고한다.
  personal_stake: 윤서는 확인하지 않은 사람까지 자기 보고에 넣고 싶지 않다.
  conflict: 미나는 쓸 수 있는 결과를 원하고 윤서는 넓어진 결론을 막으려 한다.
  revelation: 절차의 완료와 사람의 현존·관계 확인은 다르다.
  choice: 호출 보류 또는 기존 대기 유지; 새 선택 없음.
  consequence: 고른 호출 처리만 인정하고 실제 가족의 결론은 남긴다.
  revisit_hook: 같은 우편함과 남아 있는 기록을 다른 의미로 읽는다.
  mystery_contribution: 선행 M01~M05의 서비스·수령·인증 질문.
  character_arc_contribution: 유능한 윤서의 손과 과잉 보류, 미나의 현실적 요구를 함께 연다.
  canon_status: CANDIDATE
  implementation_priority: P0 원고; 파일럿 08. 실제 문자열·노출 상태 매핑 후 적용 검토.

- episode_id: E01-M02
  type: MAIN_EPISODE
  campaign_local: E01_C01 / R01-L02; L01 북쪽 관문으로 bounded 진입
  title: 다른 집의 같은 말
  POV: 윤서 제한 시점
  premise: 다른 장소의 세 기록이 사람을 확인한 방식보다 서로의 문구를 먼저 닮아 있다.
  dramatic_question: 기록이 늘면 확인된 사람도 늘어나는가?
  player_objective: 세 기록을 자유 순서로 조사하고 원하면 청소 흔적도 본 뒤 보고한다.
  personal_stake: 윤서는 첫 보고의 한계를 알면서 다음 확인을 자기 일로 받아들인다.
  conflict: 정리된 결론이 필요하지만 반복된 문장을 사람의 증언으로 쓸 수 없다.
  revelation: 한 집의 오류만으로 설명하기 어렵고 독립 확인 여부는 남아 있다.
  choice: 조사 순서·선택 흔적·귀환 시점; 새 정답 제출 메뉴 없음.
  consequence: 관측한 범위만 보고하고 실제 가족·이동·행위자는 확정하지 않는다.
  revisit_hook: 깨끗한 표면과 반복 문구를 처음과 다르게 본다.
  mystery_contribution: 선행 M06~M08; 반복과 부재를 서로 다른 증거 문제로 만든다.
  character_arc_contribution: 윤서가 다음 질문을 떠맡고 미나가 요청 범위를 좁힌다.
  canon_status: CANDIDATE
  implementation_priority: P0 원고; 파일럿 09. D03 및 여섯 조사 순서 매핑 확인 필요.

- episode_id: E01-M03
  type: MAIN_EPISODE
  campaign_local: E01_C01 / R01-L02 후속 대면 또는 R01-L03 전후; exact 배치 TBD
  title: 식탁에서 일어나는 법
  POV: 윤서 제한 시점; ROOM-12의 내면은 발화와 행동으로만
  premise: 식탁에서 떠나고 싶은 사람이 다른 사람의 저녁 때문에 손을 떼지 못한다.
  dramatic_question: 심사를 끝내면 그 사람도 일어날 수 있는가?
  player_objective: 당사자의 요청과 생활 조건을 듣고 승인된 가족심사 결절 구간을 진행한다.
  personal_stake: 윤서는 데려온 뒤의 생활을 책임지지 못했던 실패를 반복하고 싶지 않다.
  conflict: 절차는 가족 역할의 완성을 요구하고 당사자는 자신의 다음 행동을 원한다.
  revelation: 전투 종료는 생활 접근의 해결과 같은 결과가 아니다.
  choice: 승인된 보스 결과와 후속 판단의 범위; 이 목록은 구체 선택을 잠그지 않음.
  consequence: local 절차가 달라져도 당사자의 지원 문제는 남는다.
  revisit_hook: 다음 확인을 약속한 윤서에게 당사자가 새로운 요구를 할 수 있다.
  mystery_contribution: 기록의 역할이 실제 생활 접근과 연결됨을 사람의 행동으로 확인.
  character_arc_contribution: 윤서의 보류가 타인의 시간을 포함하기 시작한다.
  canon_status: CANDIDATE
  implementation_priority: P1 설계; D04와 별도 L03 spec·등장 승인. 현재 구현 아님.

- episode_id: E01-M04
  type: MAIN_EPISODE
  campaign_local: E01_C02 / R02-L01~L03
  title: 퇴원 뒤의 밤
  POV: 윤서 제한 시점
  premise: 퇴원 기록의 처리와 실제 돌봄을 이어갈 조건이 일치하지 않는다.
  dramatic_question: 밖에서 버틸 수 있느냐는 질문은 언제까지 보호인가?
  player_objective: 실제 돌봄 필요·자격·가용 서비스·이후 지원을 구분해 조사한다.
  personal_stake: 윤서는 자기 신중함과 병원의 보류가 닮은 지점을 외면하기 어렵다.
  conflict: 유지가 필요한 돌봄과 끝내고 싶은 환자 역할이 동시에 존재한다.
  revelation: 생존의 유지와 다른 삶을 선택할 여지는 별도로 확인해야 한다.
  choice: 검증된 care 경로의 유지·우회·보류 후보; 무조건 퇴원 성공 규칙 없음.
  consequence: 실제 지원이 없는 구조 약속을 하지 않고 다음 확인의 책임을 남긴다.
  revisit_hook: 이전과 같은 기록 아래 현재 요구나 상태가 달라졌는지 확인한다.
  mystery_contribution: 기록이 서비스 집행을 거쳐 행동을 제한하는 방식.
  character_arc_contribution: 윤서가 자기 말이 상대에게 들리는 방식을 처음 의심한다.
  canon_status: CANDIDATE
  implementation_priority: P1; 실제 R02 진입 승인 필요. L05 심사 얼굴 직접 대면은 포함하지 않음.

- episode_id: E01-M05
  type: MAIN_EPISODE
  campaign_local: E01_C03 / R03-L01~L02; 귀환 후 미나 접점
  title: 받는 쪽의 이름
  POV: 윤서 제한 시점
  premise: 보관·수령 기록을 잘 읽는 윤서가 누가 책임질지까지 대신 정하려 한다.
  dramatic_question: 받을 수 있다는 것과 받아야 한다는 것은 같은가?
  player_objective: 실제 custody와 수령 주장·목적지·보관 조건을 확인한다.
  personal_stake: 익숙한 절차에 대한 자신감이 타인의 책임을 앞질러 버릴 수 있다.
  conflict: 계속 보류하는 비용과 잘못된 인계를 닫는 비용이 서로 맞선다.
  revelation: 처리 완료는 올바른 책임의 완료를 보장하지 않는다.
  choice: 근거 있는 hold·redirect·recover·release 후보; 수리·정품 판정 없음.
  consequence: 미나에게 보관을 맡길 때 다음 확인의 몫도 함께 정해야 한다.
  revisit_hook: 라벨의 완료와 실제 보관 상태가 계속 일치하는지 대조한다.
  mystery_contribution: 기록의 관계와 실제 소유·수령·위치의 차이.
  character_arc_contribution: 윤서의 기술을 과거 비밀이 아닌 현재 판단의 위험으로 사용한다.
  canon_status: CANDIDATE
  implementation_priority: P1; 실제 R03 진입·사건 승인 필요. L05 보류관 조기 대면 없음.

- episode_id: E01-M06
  type: MAIN_EPISODE
  campaign_local: E01_C01 / 승인된 ROOM-12 재방문 위치
  title: 그때까지
  POV: 윤서 제한 시점
  premise: 다시 확인하겠다는 약속을 받은 사람이 그동안 무엇을 해야 하는지 되묻는다.
  dramatic_question: 결정하지 않는 동안의 삶은 누가 결정하고 있는가?
  player_objective: 이전 약속과 현재 요구·실제 지원 조건을 다시 대조한다.
  personal_stake: 윤서는 실패를 피하려는 자기 방식이 상대의 기다림을 늘렸음을 인정해야 한다.
  conflict: 더 확인하려는 윤서와 지금 가능한 작은 행동을 원하는 당사자.
  revelation: 보류는 시간을 멈춘 것이 아니라 현재 역할을 유지한 판단이었다.
  choice: 당사자와 제한된 다음 행동·다음 확인을 정함; 새 대형 피해 선택 없음.
  consequence: 윤서는 모르는 부분만 남기지 않고 맡을 일을 말한다.
  revisit_hook: 상대는 이전에 동의한 부탁을 다음 방문에 바꿀 수 있다.
  mystery_contribution: 시스템의 기록뿐 아니라 인간의 약속도 현재 행동에 영향을 줌.
  character_arc_contribution: midpoint. 무조건 구출이 아니라 공동의 제한된 판단으로 이동.
  canon_status: CANDIDATE
  implementation_priority: P1; D05와 실제 이전 약속 기억 필요. L01 선택 피해 소급 연결 금지.

- episode_id: E01-M07
  type: MAIN_EPISODE
  campaign_local: E01_C04 / R04-L01~L03의 승인된 구간; 별도 허브 장면
  title: 바꾸기 전에
  POV: 윤서 제한 시점
  premise: 작동 문제와 정품 판정이 어긋난 장치를 두고 무엇을 고칠지 먼저 묻게 된다.
  dramatic_question: 다시 작동하면 그 존재가 원한 결과도 돌아오는가?
  player_objective: 실제 상태·진단·인증·가용 부품을 확인하고 변경 범위를 정한다.
  personal_stake: 윤서는 도울 능력이 있을 때에도 상대의 허락을 기다릴 수 있어야 한다.
  conflict: 도윤의 검사·수리 욕구와 로봇의 변경 범위 확인 요구.
  revelation: 고장과 스스로 고른 행동은 같은 정상화 대상으로 처리할 수 없다.
  choice: 실제 capacity 안의 진단·수리·충전·격리 후보; 자동 희생이나 무료 복구 없음.
  consequence: 먼저 손대고 설명하던 순서가 달라진다.
  revisit_hook: 변경 뒤 작동 결과와 당사자의 평가를 따로 묻는다.
  mystery_contribution: 서로 다른 기준이 같은 장치를 다르게 판정한다는 증거.
  character_arc_contribution: 윤서의 변화가 로봇에게도 적용되며 도윤·팝시 관계가 움직인다.
  canon_status: CANDIDATE
  implementation_priority: P1; R04·인물 노출·변경 계약 승인 필요. PATCH U5 해금 없음.

- episode_id: E01-M08
  type: MAIN_EPISODE
  campaign_local: E01_C06 / R06-L02 흔적, R06-L04 제한 대면
  title: 좋은 조건
  POV: 윤서 제한 시점
  premise: 혜택을 받는 선택이 자발적 책임이라는 말로 넓어져 돌아온다.
  dramatic_question: 고를 수 있는 항목이 늘면 책임도 공정해지는가?
  player_objective: entitlement·실제 service·제한·후속 의무를 확인한다.
  personal_stake: 윤서는 필요한 도움을 무조건 거절할 수 없고 미나도 부족을 숨길 수 없다.
  conflict: 브로커의 유리한 요약과 보급소가 감수할 실제 접근 비용.
  revelation: 선택지가 많다는 사실은 그 조건을 함께 정했다는 뜻이 아니다.
  choice: 근거 있는 수락·이의 제기·우회·포기; 수락을 악으로 처벌하지 않음.
  consequence: 확인 가능한 접근 결과만 남기고 미래의 모든 생활을 보장하지 않는다.
  revisit_hook: 다음 사용 때 같은 혜택 설명이 무엇을 생략했는지 본다.
  mystery_contribution: account claim과 인간의 실제 동의 범위 구별.
  character_arc_contribution: 윤서는 더 많이 아는 것이 판단을 편하게만 하지 않음을 겪는다.
  canon_status: CANDIDATE
  implementation_priority: P1/P2; R06 ingress KNOWN GAP, D09. 현재 미노출.

- episode_id: E01-M09
  type: MAIN_EPISODE
  campaign_local: E01_C05 / R05-L02~L03 중심; 실제 자료 취득 후
  title: 잘린 대답
  POV: 윤서 제한 시점
  premise: 윤서의 실제 도움 이용·귀환이 더 큰 동의로 편집된 자료를 찾는다.
  dramatic_question: 사실인 한 문장을 어디까지 줄여도 같은 대답인가?
  player_objective: 실제 확보한 원본·편집·반복·authority claim을 대조한다.
  personal_stake: 윤서는 자신의 유능한 귀환이 원하지 않은 광고 이야기로 쓰이는 것을 두려워한다.
  conflict: 지금 쓸 수 있는 요약과 당사자가 허락한 발언 범위가 충돌한다.
  revelation: 거짓 사실을 추가하지 않아도 문맥을 잘라 의미를 바꿀 수 있다.
  choice: 검증된 정보의 신뢰·보류·공개·전달 후보; 전역 공개 기능 없음.
  consequence: 자기 말의 사용 범위를 정한 채 허브로 가져온다.
  revisit_hook: 같은 사본이 다른 권위로 다시 소개될 때 출처를 확인한다.
  mystery_contribution: provenance와 authority transformation의 직접 대조.
  character_arc_contribution: 윤서의 공포가 현재 관계와 보고 문제로 돌아온다.
  canon_status: CANDIDATE
  implementation_priority: P2; D07, C05 접근·자료 전달 채널 검증 전 미노출.

- episode_id: E01-M10
  type: MAIN_EPISODE
  campaign_local: 현재 수동 허브 / 미나 카운터
  title: 돌려받은 보고
  POV: 윤서 제한 시점
  premise: 미나는 불확실성만 남긴 보고를 돌려주며 오늘 결정할 부분도 요구한다.
  dramatic_question: 틀리지 않는 보고만 남기면 책임은 끝나는가?
  player_objective: 확보한 사실과 적용 범위를 정리하고 실제 맡을 다음 행동을 정한다.
  personal_stake: 윤서는 자기 말을 지키면서 미나에게 판단을 전부 넘기지 않아야 한다.
  conflict: 확인되지 않은 결론을 막으려는 윤서와 현재 사용할 결론이 필요한 미나.
  revelation: 두 사람이 서로를 대신 처리해 온 방식에는 빈 몫이 있었다.
  choice: 누구의 일을 어떻게 나눌지 정하는 장면 후보; 새 호감도 메뉴 없음.
  consequence: 보고와 부탁의 순서가 달라진다. 배신·영구 결별 없음.
  revisit_hook: 다음 귀환에서 실제로 맡은 몫을 먼저 확인한다.
  mystery_contribution: 확인과 요약의 문제를 시스템 밖 인간 관계에서도 시험.
  character_arc_contribution: late-season rupture. 선의의 유무가 아닌 책임의 분담이 바뀜.
  canon_status: CANDIDATE
  implementation_priority: P2; D02/D07/D08, 앞선 관측과 관계 기억 필요.

- episode_id: E01-M11
  type: MAIN_EPISODE
  campaign_local: E01_C07 / 승인된 R07 passage·transfer 구간
  title: 문 다음의 일
  POV: 윤서 제한 시점
  premise: 통과 판정은 존재하지만 도착한 뒤의 생활은 그 문서에 없다.
  dramatic_question: 나갈 수 있다는 확인은 어디까지 보장하는가?
  player_objective: 검역·통과·이송 조건과 목적지 정보의 확인 수준을 분리한다.
  personal_stake: 윤서는 나가는 행동을 대신 결정하지 않으면서 필요한 조건을 확인하려 한다.
  conflict: 출발을 닫고 싶은 절차와 도착 뒤의 공백을 알고 싶은 사람의 요구.
  revelation: passage의 성공은 survival allocation의 성공과 다른 범위다.
  choice: 실제 route·capacity 안의 clear·hold·reroute 후보; 새 탈출 경로 없음.
  consequence: 관측한 통과 범위만 남기고 바깥 전체를 안다고 말하지 않는다.
  revisit_hook: 이전 출항·검역 판정이 현재 조건에도 유효한지 확인한다.
  mystery_contribution: 미관측 외부와 확인된 passage를 구분한다.
  character_arc_contribution: 윤서가 제한된 답으로도 상대에게 선택을 돌려줄 준비를 한다.
  canon_status: CANDIDATE
  implementation_priority: P2; R07 ingress KNOWN GAP, D09. 즉시 출항·Sector 개방 없음.

- episode_id: E01-M12
  type: MAIN_EPISODE
  campaign_local: E01_C01 당사자 대면 / 현재 수동 허브; 후행 자료 장면
  title: 손을 뗀 뒤
  POV: 윤서 제한 시점
  premise: 확인된 한정 지원 안에서 당사자가 움직이거나 남는 행동을 직접 고른다.
  dramatic_question: 다 알지 못해도 지금 가능하게 만들 수 있는 선택은 무엇인가?
  player_objective: 실제 지원·책임자·적용 범위를 확인하고 당사자가 고른 행동을 돕는다.
  personal_stake: 윤서는 자신이 구했다는 결론보다 상대가 선택할 여지를 지켜야 한다.
  conflict: 당장 가능한 작은 성취와 모든 위험을 없애고 싶은 욕구.
  revelation: 이름 하나의 삭제가 아니라 실제 조건과 당사자의 판단을 함께 바꿔야 했다.
  choice: 유효한 조건에서 움직임 또는 남음; 지원 부재이면 성공 원고 재생 금지.
  consequence: 제한된 행동 결과를 확인하고 맡은 책임을 보고한다.
  revisit_hook: 일회성 지원을 영구 보증으로 만들지 않고 다음 요청을 다시 묻는다.
  mystery_contribution: 확보한 C05 자료가 있을 때만 원본·사본 계보의 다음 질문을 남김.
  character_arc_contribution: 윤서와 미나가 모름을 지우지 않고 판단을 함께 맡는다.
  canon_status: CANDIDATE
  implementation_priority: P2; D06/D07/D08 및 실제 서비스·자원·대면 계약 필요.
```

## Side episodes

```yaml
- episode_id: E01-S-C01-01
  type: SIDE_EPISODE
  campaign_local: E01_C01 / NAME-PAINTER의 승인된 R01 노출 구간
  title: 칠하지 않은 자리
  POV: 윤서 제한 시점
  premise: 문패를 다시 칠하려는 손 앞에서 오래된 글씨를 어디에 남길지 묻는다.
  dramatic_question: 남겨 두는 장소까지 같은 사람을 돕는가?
  player_objective: 기존 문패 흔적을 보고 허용된 보존 범위를 확인한다.
  personal_stake: 윤서는 이름을 떼기 전에 더 보고 싶다.
  conflict: 빈칸을 메우려는 손일과 덮지 말아 달라는 부탁.
  revelation: 읽을 수 있게 만드는 일과 맞는 관계를 확인하는 일은 다르다.
  choice: 관찰·보류·보관 후보; 새 실제 가족 확인 없음.
  consequence: 무엇을 남겼는지와 무엇을 확정하지 않았는지가 갈린다.
  revisit_hook: 같은 글씨가 어느 자리에 남았는지 다시 본다.
  mystery_contribution: 오래된 기록을 자동으로 진실로 취급하지 않게 한다.
  character_arc_contribution: 윤서의 손이 능숙하게 움직이지 못하는 순간.
  canon_status: CANDIDATE
  implementation_priority: P1; 인물 노출 승인 후. 메인 필수 답 독점 없음.

- episode_id: E01-S-C01-02
  type: SIDE_EPISODE
  campaign_local: E01_C01 / R01-L02 선택 청소 흔적
  title: 청소가 지나간 곳
  POV: 윤서 제한 시점
  premise: 깨끗한 면 옆에 닦이지 않은 좁은 자국이 남아 있다.
  dramatic_question: 흔적이 없는 것과 없앤 것은 어떻게 구별하는가?
  player_objective: 기존 선택 흔적을 관찰한다.
  personal_stake: 윤서는 기록의 공백을 너무 빨리 사람의 부재로 적고 싶지 않다.
  conflict: 더 조사하려는 욕구와 지금 돌아가도 되는 현재 목표.
  revelation: 청소 흔적은 보았지만 행위자와 지워진 내용은 알지 못한다.
  choice: 선택 조사 또는 지나감; 필수 네 번째 기록 없음.
  consequence: 본 플레이만 청소 관찰을 보고에 포함한다.
  revisit_hook: 뒤늦게 보아도 기존 완료와 보상을 다시 처리하지 않는다.
  mystery_contribution: 부재의 해석을 보완하되 핵심 세 기록 결론을 대신하지 않음.
  character_arc_contribution: 윤서가 모르는 원인을 함부로 채우지 않는다.
  canon_status: CANDIDATE
  implementation_priority: P0 문안; 09의 선택 장면과 공유. 별도 본문 완료로 중복 집계하지 않음.

- episode_id: E01-S-C02-01
  type: SIDE_EPISODE
  campaign_local: E01_C02 / R02-L03 보험 심사 약국
  title: 봉인 안의 약
  POV: 윤서 제한 시점
  premise: 약품의 존재와 사용할 수 있는 서비스 조건이 서로 다른 기록에 남아 있다.
  dramatic_question: 있다는 사실만으로 지금 쓸 수 있다고 말할 수 있는가?
  player_objective: 약품·자격·실제 가용 service를 구분해 확인한다.
  personal_stake: 허브에 가능한 도움만 약속하고 싶다.
  conflict: 당장의 필요와 검증되지 않은 접근 가능성.
  revelation: 재고 관찰과 치료 가능 판정은 별개의 확인이다.
  choice: 근거 있는 유지·추가 확인·보류; 처방이나 의료 수치 창작 없음.
  consequence: 미나에게 확보하지 않은 약품을 가져왔다고 보고하지 않는다.
  revisit_hook: 같은 봉인의 의미가 현재 service에 따라 달라지는지 확인한다.
  mystery_contribution: care eligibility와 실제 capacity의 차이를 생활 문제로 좁힘.
  character_arc_contribution: 윤서가 안심시키는 말 대신 구체적으로 맡을 일을 정한다.
  canon_status: CANDIDATE
  implementation_priority: P1; 실제 R02 사건·접근 승인 후. 새 상점 NPC 없음.

- episode_id: E01-S-C03-01
  type: SIDE_EPISODE
  campaign_local: E01_C03 / R03-L01~L02; 귀환 후 미나
  title: 인수 전 서명
  POV: 윤서 제한 시점
  premise: 한쪽은 인계 완료를 주장하고 다른 기록에는 수령 확인이 남지 않았다.
  dramatic_question: 같은 물건을 두고 두 기록이 다른 완료를 말하면 누가 맡는가?
  player_objective: 실제 보관 위치와 인계·수령 주장의 범위를 대조한다.
  personal_stake: 윤서는 빈 수령 칸을 자기 이름으로 채워 쉽게 끝내고 싶지 않다.
  conflict: 보관 부담을 끝내려는 절차와 책임을 확인해야 하는 현재 업무.
  revelation: 인계 발행과 인수 확인은 독립 검증이 필요하다.
  choice: 근거에 따른 보류·회수 후보; 정품·수리 판정 없음.
  consequence: 허브가 맡은 것과 아직 맡지 않은 책임을 나눈다.
  revisit_hook: 처리 문구가 아니라 실제 보관·인수 상태를 다시 본다.
  mystery_contribution: 상충하는 증언의 확인 범위 비교.
  character_arc_contribution: 윤서와 미나의 부탁에 다음 확인 책임이 붙는다.
  canon_status: CANDIDATE
  implementation_priority: P1; 기존 기록과 실제 사건의 대응 확인 필요.

- episode_id: E01-S-C04-01
  type: SIDE_EPISODE
  campaign_local: E01_C04 / 승인된 R04 충전·진단 접점
  title: 꺼진 쪽의 이름
  POV: 윤서 제한 시점
  premise: 작동하지 않는 장치의 승인 표기와 실제 상태가 서로 어긋난다.
  dramatic_question: 승인된 이름이 남아 있으면 장치도 정상인가?
  player_objective: 전력·장치 상태·유효성 기록을 따로 관찰한다.
  personal_stake: 윤서는 사용할 수 있다는 말로 다른 존재를 다시 소모시키고 싶지 않다.
  conflict: 서비스가 허용됐다는 기록과 실제 작동을 책임져야 하는 사람의 요구.
  revelation: 유효성은 전력과 부품을 만들어 주지 않는다.
  choice: 실제 가능한 진단·격리·추가 확인 후보.
  consequence: 정상 판정과 사용할 수 있다는 보고를 분리한다.
  revisit_hook: 기록이 아니라 실제 작동을 다시 확인한다.
  mystery_contribution: 인간 recognition과 device validity를 구별한다.
  character_arc_contribution: 먼저 확인하고 설명하는 윤서의 태도를 시험한다.
  canon_status: CANDIDATE
  implementation_priority: P1; 실제 R04 접근·service 승인 후. 무한 수리 없음.

- episode_id: E01-S-C06-01
  type: SIDE_EPISODE
  campaign_local: E01_C06 / R06-L02의 기존 약정·혜택 흔적
  title: 다음번의 몫
  POV: 윤서 제한 시점
  premise: 오늘 사용할 수 있는 혜택이 다음 접근의 조건과 함께 적혀 있다.
  dramatic_question: 지금 고른 조건을 다음번에도 같은 선택이라고 부를 수 있는가?
  player_objective: entitlement의 적용 시점과 실제 사용 범위를 읽는다.
  personal_stake: 미나에게 오늘의 이득만 가져가는 보고를 하고 싶지 않다.
  conflict: 지금 필요한 접근과 뒤로 밀리는 의무의 차이.
  revelation: 혜택의 표제와 다음 사용 조건이 같은 범위를 말하지 않는다.
  choice: 실제 가능한 수락·이의 제기·포기 후보; 범용 화폐 교환 없음.
  consequence: 메인에서 이미 알려 준 결과의 구체 조건을 더 읽게 한다.
  revisit_hook: 이전 조건을 당사자의 영구 동의로 적용하지 않는지 본다.
  mystery_contribution: 계정 기록의 지속과 사람의 현재 의사 분리.
  character_arc_contribution: 윤서와 미나가 당장의 필요를 숨기지 않고 이야기한다.
  canon_status: CANDIDATE
  implementation_priority: P1/P2; R06 ingress와 실제 접근 조건 해결 전 미노출.

- episode_id: E01-S-C05-01
  type: SIDE_EPISODE
  campaign_local: 실제 전달 근거가 있는 허브 접점 / C05 정보 축
  title: 한 번 더 온 소식
  POV: 윤서 제한 시점; 세븐과 자료를 대조
  premise: 여러 번 도착한 문장이 서로 다른 증언처럼 묶이려 한다.
  dramatic_question: 소식이 다시 왔는가, 같은 사본이 다시 왔는가?
  player_objective: 실제 확보한 자료의 출처와 재전달 흔적을 비교한다.
  personal_stake: 윤서는 확신이 늘었다는 말을 너무 빨리 믿고 싶지 않다.
  conflict: 자료를 합쳐 추천하려는 세븐과 독립 근거를 확인하려는 요청.
  revelation: 반복된 도착이 독립 증인의 증가를 의미하지 않는다.
  choice: 출처 확인·별도 보관 후보; 전역 소문 발송 없음.
  consequence: 한 출처의 여러 사본으로 기록 범위를 줄인다.
  revisit_hook: 새 자료가 오면 내용보다 출처가 달라졌는지 먼저 본다.
  mystery_contribution: rumor-origin 추적의 작은 연습.
  character_arc_contribution: 세븐의 자료량에 대한 믿음이 구체 업무에서 바뀐다.
  canon_status: CANDIDATE
  implementation_priority: P2; 실제 통신·전달 채널과 취득 상태가 선행. 가짜 독립 증인 생성 금지.

- episode_id: E01-S-RE-01
  type: SIDE_EPISODE
  campaign_local: E01_C01 / 승인된 ROOM-12 재방문
  title: 오늘은 부르지 말기
  POV: 윤서 제한 시점
  premise: 전에 허락한 호명이나 확인 방식을 오늘은 원하지 않는다는 부탁을 받는다.
  dramatic_question: 기억한다는 이유로 계속 같은 방식으로 불러도 되는가?
  player_objective: 당사자의 현재 부탁을 듣고 가능한 범위를 확인한다.
  personal_stake: 윤서는 이전에 잘한 행동을 다시 하면 충분하다고 생각하기 쉽다.
  conflict: 이미 정리된 보고와 달라진 현재 요구.
  revelation: 이전 동의가 모든 다음 만남의 동의는 아니다.
  choice: 허용된 부름·보류·다음 확인 후보; 이름 해금 신설 없음.
  consequence: 상대를 아는 방식보다 묻는 방식이 달라진다.
  revisit_hook: 다음에도 이전 부탁을 기계적으로 고정하지 않는다.
  mystery_contribution: 기록의 지속과 살아 있는 선택의 차이를 작은 규모로 회수.
  character_arc_contribution: 윤서가 결말 뒤에도 상대의 시간을 자기 것으로 만들지 않음.
  canon_status: CANDIDATE
  implementation_priority: P2; D08의 관계 기억과 실제 대면 조건 필요. finale 성공 필수 조건 아님.
```

## Character side stories

```yaml
- episode_id: E01-CH-YUNSEO-01
  type: CHARACTER_SIDE_STORY
  campaign_local: 허브 / 이름 보관 접점
  title: 내 것부터
  POV: 윤서 제한 시점
  premise: 남의 이름을 다루던 윤서가 자기 물건의 표기를 남에게 맡기려 한다.
  dramatic_question: 자기 이름에는 같은 확인을 적용할 수 있는가?
  player_objective: 기존 보관 맥락에서 어디까지 읽거나 적을지 정하는 장면을 본다.
  personal_stake: 정확히 읽히는 이름에 대한 공포를 과거 폭로 없이 드러낸다.
  conflict: 윤서의 실무적 익숙함과 자기 이름 앞의 머뭇거림.
  revelation: 잘하는 일에서도 자기에게 적용하지 못하는 부분이 있다.
  choice: 말할 범위·잠깐 미루기 후보; 새 실제 이름이나 가족 공개 없음.
  consequence: 복희가 대신 완성하지 않고 윤서의 범위를 기다린다.
  revisit_hook: 자기 물건을 남에게 맡기는 손이 이전과 달라진다.
  mystery_contribution: 큰 과거의 답 대신 현재의 회피를 관찰.
  character_arc_contribution: 윤서가 도움을 받는 쪽에도 설 수 있게 한다.
  canon_status: CANDIDATE
  implementation_priority: P1 원고; 복희 접점 승인 후. 스킬·캐릭터 해금과 무관.

- episode_id: E01-CH-MINA-01
  type: CHARACTER_SIDE_STORY
  campaign_local: 허브 / 카운터
  title: 끝나지 않은 저녁
  POV: 미나 제한 시점
  premise: 남의 귀환을 처리하는 동안 미뤄진 작은 식사를 끝내려 한다.
  dramatic_question: 일을 맡은 사람도 잠깐 그 자리를 비워도 되는가?
  player_objective: 자율적으로 들른 짧은 생활 장면에서 부탁을 듣거나 자리를 내준다.
  personal_stake: 미나는 큰 희생이 아니라 작은 휴식을 부탁하는 데 서툴다.
  conflict: 계속 들어오는 손일과 오늘 자기 식사를 끝내고 싶은 요구.
  revelation: 필요한 사람이라는 사실이 자기 부탁을 지우는 면허는 아니다.
  choice: 곁에 머무름·자리 비움 후보; 시간 압박·부재 페널티 없음.
  consequence: 윤서가 잠깐 실제 손일을 맡고 미나는 설명 없이 먹는다.
  revisit_hook: 다음 부탁이 명령이나 희생으로만 들리지 않는다.
  mystery_contribution: 허브도 기록·배분의 판단을 사람이 수행한다는 감각.
  character_arc_contribution: 미나의 자기 요구를 거대한 비밀 없이 보여준다.
  canon_status: CANDIDATE
  implementation_priority: P1 원고; HUB-01과 사건 중복 여부를 Batch B에서 검수. 같은 본문 재사용 금지.

- episode_id: E01-CH-PATCH-01
  type: CHARACTER_SIDE_STORY
  campaign_local: 승인된 허브 PATCH 체류 맥락
  title: 남겨 둔 나사
  POV: 윤서 제한 시점; PATCH 내면 확정 없음
  premise: 남을 고치려는 PATCH가 자기 몸에서 빼려던 부품을 잠깐 남긴다.
  dramatic_question: 도움이 되지 않는 순간에도 자기 몸은 남겨도 되는가?
  player_objective: 고장과 가용 부품을 확인하는 생활 장면에 참여한다.
  personal_stake: PATCH는 자기 자신을 계산에서 먼저 빼는 습관을 멈추기 어렵다.
  conflict: 지금 고치려는 요구와 자기 몸을 남기는 필요.
  revelation: 수리의 완료와 PATCH의 소모는 같은 보상이 아니다.
  choice: 실제 다른 방법을 확인하거나 수리를 미룸; 무료 부품 생성 없음.
  consequence: 자동 희생 대신 남길 것을 말하는 작은 행동이 생긴다.
  revisit_hook: 이후에도 자기 부품을 먼저 내놓는지 묻는다.
  mystery_contribution: 장치의 유용성과 자기 선택을 분리.
  character_arc_contribution: 윤서는 보호를 이유로 PATCH 대신 몸의 변경을 결정하지 않음.
  canon_status: CANDIDATE
  implementation_priority: P1 원고; PATCH 노출·관계 승인 후. U5·수리 시스템 추가 없음.
```

## Hub interludes

```yaml
- episode_id: E01-HUB-01
  type: HUB_INTERLUDE
  campaign_local: 현재 수동 허브 / 미나 카운터; 복희 등장 후보
  title: 마를 자리
  POV: 윤서 제한 시점
  premise: 말릴 종이를 어디에 둘지 때문에 미나의 늦은 식사와 복희의 손일이 겹친다.
  dramatic_question: 아직 정리하지 못한 일을 누구의 자리 위에 둘 것인가?
  player_objective: 자율 귀환 뒤 선택적으로 머물며 작은 부탁을 수행한다.
  personal_stake: 윤서는 보고를 끝내고 싶고 미나는 자기 식사를 시작하고 싶다.
  conflict: 서로 다른 용도로 쓰려는 좁은 카운터.
  revelation: 정리할 수 없다는 대답 뒤에도 맡을 수 있는 손일은 있다.
  choice: 장면 열람·대화 계속·떠남; 새 도덕 선택 메뉴 없음.
  consequence: 윤서가 손을 빌려 주고 미나는 늦은 식사를 시작한다.
  revisit_hook: 다음 귀환의 부탁과 놓을 자리가 다르게 느껴진다.
  mystery_contribution: 새 세계 사실 없음. 허브의 수동 판단을 생활로 보여줌.
  character_arc_contribution: 윤서·미나의 상호 의존과 복희의 현실적인 손일.
  canon_status: CANDIDATE
  implementation_priority: P0 문학 파일럿 10; 복희·소품·노출 조건 매핑 전 게임 적용 아님.

- episode_id: E01-HUB-02
  type: HUB_INTERLUDE
  campaign_local: 허브 / 팝시 충전 접점
  title: 오늘의 인사
  POV: 윤서 제한 시점
  premise: 팝시가 익숙한 환영 문구 대신 지금 필요한 작은 부탁을 하려 한다.
  dramatic_question: 반기지 않는 말도 자기 말로 해도 되는가?
  player_objective: 필요한 부탁을 듣고 현재 가능한 작은 도움을 확인한다.
  personal_stake: 팝시는 유용하고 밝아야만 남을 수 있다고 여기기 쉽다.
  conflict: 자동 안내 습관과 현재의 요구.
  revelation: 다른 말을 하는 것이 고장이나 배은망덕은 아니다.
  choice: 듣기·머무르기·떠남 후보; 충전량·호감도 보상 없음.
  consequence: 윤서가 문구를 재촉하지 않고 부탁을 구체적으로 듣는다.
  revisit_hook: 다음 인사가 같지 않아도 정상화하려 들지 않는다.
  mystery_contribution: 자아의 기원 설명 없이 자기 선택을 관찰.
  character_arc_contribution: 팝시가 안내가 아닌 요청을 말하는 첫 작은 변화.
  canon_status: CANDIDATE
  implementation_priority: P1; 팝시 등장·상태 매핑 필요.

- episode_id: E01-HUB-03
  type: HUB_INTERLUDE
  campaign_local: 허브 / 도윤의 정비 접점과 세븐의 기록 맥락
  title: 고장 이름 붙이기
  POV: 윤서 제한 시점
  premise: 도윤은 손에 잡히는 증상을 말하고 세븐은 정확한 분류를 요구한다.
  dramatic_question: 같은 고장을 다른 말로 부르면 누가 일을 시작하는가?
  player_objective: 선택 장면에서 두 인물이 실제 맡을 일을 나누는 것을 본다.
  personal_stake: 도윤은 작업을 끝내고 싶고 세븐은 틀린 기록을 남기고 싶지 않다.
  conflict: 일단 만져 볼 수 있는 것과 먼저 분류해야 하는 것의 순서.
  revelation: 기록과 수리는 서로를 대신하지 않아도 협력할 수 있다.
  choice: 별도 선택 필수 없음; 장면 종료와 이동 자유.
  consequence: 말싸움이 분담으로 바뀌고 작은 업무상 농담이 남는다.
  revisit_hook: 고장 이름보다 누가 무엇을 했는지 먼저 물을 수 있다.
  mystery_contribution: 분류 언어와 실제 상태를 가벼운 사건으로 재해석.
  character_arc_contribution: 세븐과 도윤의 다른 욕망·속도를 분리.
  canon_status: CANDIDATE
  implementation_priority: P1; 실제 정비 기능 성공이나 무료 수리 보상으로 취급하지 않음.

- episode_id: E01-HUB-04
  type: HUB_INTERLUDE
  campaign_local: 허브 / 결말 뒤 승인된 생활 공간
  title: 다음 부탁 전
  POV: 윤서 제한 시점
  premise: 귀환한 윤서가 새 의뢰를 바로 묻지 않고 잠깐 머문다.
  dramatic_question: 다음에 나갈 사람도 지금은 돌아온 사람으로 있어도 되는가?
  player_objective: 선택적으로 머물거나 다음 행동을 택한다.
  personal_stake: 윤서는 일을 해야만 자신의 귀환이 유효하다고 느끼기 쉽다.
  conflict: 다음 일을 찾는 습관과 작은 생활의 여유.
  revelation: 새 위기 없이도 함께 있는 시간이 관계의 결과가 될 수 있다.
  choice: 머무름·떠남; 기다려야 열리는 보상 없음.
  consequence: 큰 화해 연설 없이 부탁의 간격이 달라진다.
  revisit_hook: 이후 출격이 강요가 아닌 다시 고른 행동으로 느껴진다.
  mystery_contribution: 새 lore 없음. 제한된 결말의 일상적 여운.
  character_arc_contribution: 윤서와 미나가 일을 주고받는 속도가 달라짐.
  canon_status: CANDIDATE
  implementation_priority: P2; finale 결과와 실제 허브 노출 상태가 선행.
```

## Environmental story groups

```yaml
- episode_id: E01-ENV-C01
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C01 / 주거·수령·세대 기록 접점
  title: 수령과 세대
  POV: 기록을 만든 업무의 제한된 시야
  premise: 주거 역할의 확인과 실제 사람의 확인이 같은 완료 표시 아래 모인다.
  dramatic_question: 이 기록은 무엇만 확인했는가?
  player_objective: 발행 주체·대상·참조 범위를 읽는다.
  personal_stake: 윤서는 관계를 대신 확정하지 않으려 한다.
  conflict: 유효한 형식과 미확인 인간관계.
  revelation: 기록이 정확하게 처리한 범위도 제한되어 있다.
  choice: 읽기·대조; 기록 문안 자체는 선택을 강요하지 않음.
  consequence: Direct Memory에 기록의 claim을 구분한다.
  revisit_hook: 같은 확인란의 의미가 달라진다.
  mystery_contribution: 서비스·역할·현실의 첫 구분.
  character_arc_contribution: 윤서의 관찰과 미나의 보고 목적을 연결.
  canon_status: CANDIDATE
  implementation_priority: P0; 08/09 일부 문안 포함. 그룹 전체 작성 완료 아님.

- episode_id: E01-ENV-C02
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C02 / 접수·약국·격리·퇴원 기록
  title: 퇴원 확인란
  POV: care eligibility와 처리 기록
  premise: 환자의 현재 필요와 남아 있는 자격·처리 상태가 다르다.
  dramatic_question: 치료와 퇴원 중 무엇을 확인하는 서류인가?
  player_objective: 실제 상태·자격·서비스의 적용 범위를 대조한다.
  personal_stake: 도움을 약속하기 전 실제 조건을 알고 싶다.
  conflict: 행정 처리와 돌봄의 지속 필요.
  revelation: 자격만으로 병상·약품·돌봄이 생기지 않는다.
  choice: 기록 열람·대조; 임의 처방 없음.
  consequence: 보장하지 않은 돌봄을 보고에 넣지 않는다.
  revisit_hook: 현재 care 조건이 문서와 달라졌는지 확인.
  mystery_contribution: 역할 판정이 service를 거쳐 행동을 제한함.
  character_arc_contribution: 윤서의 신중함을 다른 업무 언어에서 듣게 함.
  canon_status: CANDIDATE
  implementation_priority: P1; C02 실제 사건·수치·진입 검증 후.

- episode_id: E01-ENV-C03
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C03 / 수령·반품·보관·인계 라벨
  title: 미수령 보관표
  POV: custody와 flow 처리 기록
  premise: 인계·보관·반품의 서로 다른 완료가 같은 대상으로 이어진다.
  dramatic_question: 어디로 보냈으며 누가 받았는가?
  player_objective: claim과 실제 위치·수령 관계를 대조한다.
  personal_stake: 자기 이름으로 빈 책임을 닫지 않으려 한다.
  conflict: 빠른 처리와 올바른 인수 확인.
  revelation: 보낸 쪽의 완료는 받은 쪽의 확인을 대신하지 않는다.
  choice: 읽기·검증; 새로운 수리·정품 판정 없음.
  consequence: 실제 맡은 custody만 기록한다.
  revisit_hook: 라벨과 실제 보관 상태의 차이.
  mystery_contribution: 완료의 범위를 세분화.
  character_arc_contribution: 윤서의 익숙한 기술과 빠른 판단을 시험.
  canon_status: CANDIDATE
  implementation_priority: P1; C03 물류 근거와 실제 처리 경로 필요.

- episode_id: E01-ENV-C04
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C04 / 충전·진단·리콜·펌웨어 문안
  title: 정품과 작동
  POV: validity와 service 기록
  premise: 승인된 장치와 실제 작동 가능한 장치가 어긋난다.
  dramatic_question: 무엇을 정상이라고 부르는가?
  player_objective: 진단·에너지·부품·인증의 범위를 읽는다.
  personal_stake: 작동을 이유로 다른 존재의 선택을 지우지 않으려 한다.
  conflict: 인증 판정과 실제 변경의 대가.
  revelation: 유효성과 자기 선택은 같은 확인 대상이 아니다.
  choice: 기록 열람·변경 범위 확인; 자동 동의 없음.
  consequence: 실제 시행한 변경만 Direct Memory에 남긴다.
  revisit_hook: 정상 표기와 당사자의 현재 상태를 다시 대조.
  mystery_contribution: 실제 고장과 규칙의 오류 분리.
  character_arc_contribution: 도윤·팝시·PATCH가 서로 다른 요구를 가질 자리.
  canon_status: CANDIDATE
  implementation_priority: P1; 실제 장치·capacity·변경 승인 필요.

- episode_id: E01-ENV-C05
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C05 / 수신·편집·추천·송출 기록
  title: 정정 이력
  POV: source와 변환·송출 기록
  premise: 내용의 반복과 권위의 상승이 원본 확인을 대신한다.
  dramatic_question: 어느 부분이 원문이고 누가 줄였는가?
  player_objective: 원본·사본·변환·권위 주장을 대조한다.
  personal_stake: 자기 행동과 말을 다른 동의로 쓰지 못하게 하려 한다.
  conflict: 쓸 수 있는 요약과 삭제된 문맥.
  revelation: 같은 내용의 재전달이 독립 확인은 아니다.
  choice: 검증된 신뢰·보류·전달 판단; 전역 폭로 기능 없음.
  consequence: 출처와 확인 범위를 분리해 기록한다.
  revisit_hook: 새로 온 기록의 계보를 먼저 본다.
  mystery_contribution: 대사고 설명을 뒤집지 않고 자료의 계보를 묻는 방법.
  character_arc_contribution: 윤서의 공포와 세븐의 추론 한계를 함께 시험.
  canon_status: CANDIDATE
  implementation_priority: P2; 실제 취득·통신 채널 없으면 미노출.

- episode_id: E01-ENV-C06
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C06 / account·review·tier·benefit 문안
  title: 혜택 갱신
  POV: entitlement 처리 기록
  premise: 혜택을 사용할 수 있는 상태가 인간의 더 넓은 동의로 소개된다.
  dramatic_question: 계정이 허용한 것과 사람이 고른 것은 같은가?
  player_objective: 실제 service·조건·시점·책임 범위를 읽는다.
  personal_stake: 당장의 필요 때문에 미래의 모든 요구를 대신 승인하지 않으려 한다.
  conflict: 유리한 표제와 제한된 접근 조건.
  revelation: 높은 등급도 무한 service를 만들지 않는다.
  choice: 열람·이의 제기 후보; 범용 point currency 없음.
  consequence: 확인한 access 결과만 남긴다.
  revisit_hook: 이전 조건을 자동 영구 동의로 적용하는지 확인.
  mystery_contribution: recognition과 entitlement의 범위를 분리.
  character_arc_contribution: 윤서·미나의 필요와 책임이 같은 문서에 걸림.
  canon_status: CANDIDATE
  implementation_priority: P1/P2; R06 ingress 및 실제 혜택 근거 필요.

- episode_id: E01-ENV-C07
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C07 / 검역·manifest·통과·출항 기록
  title: 검역과 출항
  POV: passage와 transfer 처리 기록
  premise: 통과의 완료가 도착 뒤 생활까지 설명하는 듯 읽힌다.
  dramatic_question: 이 승인으로 어디까지 움직일 수 있는가?
  player_objective: 대상·검역·실제 route·이송 capacity를 구분한다.
  personal_stake: 떠나면 된다는 약속을 쉽게 하지 않으려 한다.
  conflict: 출발을 확정하려는 절차와 확인되지 않은 목적지.
  revelation: 통과와 바깥의 생존은 별개 범위다.
  choice: 읽기·검증; 소문만으로 route 개방 없음.
  consequence: 관측한 passage 상태만 남긴다.
  revisit_hook: 이전 출항 기록의 유효 범위를 다시 확인.
  mystery_contribution: 미관측 외부와 검증된 이동의 경계.
  character_arc_contribution: 윤서가 제한된 답을 상대의 선택으로 돌려줌.
  canon_status: CANDIDATE
  implementation_priority: P2; R07 ingress KNOWN GAP. 실제 접근 전 미노출.

- episode_id: E01-ENV-C08
  type: ENVIRONMENTAL_STORY_GROUP
  campaign_local: E01_C08 역사적 비상지원 흔적 / 현재 허브 수동 기록은 별도 표기
  title: 대피 지원 배분
  POV: 역사적 eligibility 기록과 현재 수동 관찰을 분리
  premise: 기록된 필요와 실제 수용·지원 가능성이 일치하지 않는다.
  dramatic_question: 누구의 현재 필요를 어떤 실제 용량으로 받치는가?
  player_objective: 필요·capacity·지원자·적용 범위를 확인한다.
  personal_stake: 미나는 감당하지 못할 도움을 약속할 수 없다.
  conflict: 남은 기록의 우선순위와 지금 눈앞의 요구.
  revelation: 명단과 실제 물자·침상·전력은 같은 것이 아니다.
  choice: 검증된 제한 지원의 유지·우회·재배치 후보.
  consequence: 실제 가능한 지원만 약속하고 기록한다.
  revisit_hook: 한 번의 지원을 영구 보증으로 읽지 않는지 확인.
  mystery_contribution: 수동 공동체와 역사적 자동배분의 다른 판단 주체.
  character_arc_contribution: 미나의 계산과 윤서의 부탁이 같은 실제 조건을 다룸.
  canon_status: CANDIDATE
  implementation_priority: P1/P2; 역사적·현재 layer 구분과 실제 자원 근거 필요.
```

## Batch B에서 확정할 것

첫째, 35개 단위를 전부 실제 제작하겠다는 약속으로 바꾸지 않는다. 실제 진입·노출·관계 기억과 중복을 확인한다. 특히 CH-MINA-01은 HUB-01과 다른 시점·요구가 충분하지 않으면 통합 후보로 둔다. 현재는 삭제하지 않는다.

둘째, M01/M02의 문학 파일럿을 런타임 현재 문자열과 연결하는 D03 검증을 우선한다. HUB-01은 복희와 생활 소품의 연출 후보이므로 현재 미나 단독 접점에 그대로 적용하지 않는다.

셋째, 배치가 정해지면 main은 최대 3편, side는 최대 4편만 실제 집필한다. 각 batch의 실제 파일·commit·read-back·품질 판정을 따로 남긴다. 이번 Registry의 존재로 본문 작성 완료 또는 정사 승인 완료를 보고하지 않는다.

Registry completeness: 35 unique units / 각 18개 필수 필드 명시 / 새 Campaign·Local·graph·runtime schema 생성 0. Batch B 확정 전 상태: PROPOSED_REGISTRY_COMPLETE.
