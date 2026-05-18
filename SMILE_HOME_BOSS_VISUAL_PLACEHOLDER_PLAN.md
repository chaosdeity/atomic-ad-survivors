# Smile Home Boss Visual Placeholder Plan

작성일: 2026-05-18
대상: 스마일 홈 시어머니 visual / animation placeholder.
주의: 첫 보스는 거대 상담원/키오스크/송출관 본체가 아니다.

## 1. 정체성 고정

스마일 홈 시어머니는 R01 가족 상품화 법칙의 얼굴이다.

정체성:

- 모델하우스에 설치된 가족 행복 관리/상담 어시스턴트.
- 친절한 시어머니식 접객과 가족 평가 압박.
- 집/가족/문패/사진/쿠폰/청소기/초인종이 결합된 결절.
- 상담원 elite의 대형판이 아니다.
- 캠페인 송출관 자체가 아니다.

## 2. 기본 실루엣

권장 silhouette:

- 둥근 1950s 가전 body.
- CRT/곡면 화면 안의 웃는 여성 얼굴.
- 쿠폰 종이 치마 또는 brochure skirt.
- 모델하우스 작은 지붕/안테나.
- 청소기 호스, 초인종, 가족사진 frame, 문패 label이 부착.
- 바퀴/짧은 다리/접이식 받침으로 무대 중앙을 점유.

크기 기준:

- gameplay body: 100~135px tall 후보.
- distant/intro LOD: 80~95px.
- hitbox는 artwork보다 단순한 circle/capsule.

## 3. 패턴별 visual cue

| 패턴/상태 | cue 방향 | 읽혀야 하는 정보 |
| --- | --- | --- |
| 가족 특가 / coupon fan | brochure skirt가 펼쳐지고 쿠폰 부채꼴 예고선 | 종이 탄막 방향 |
| 깨끗한 거실 / vacuum pull | 청소기 호스가 바닥을 훑고 먼지/기억 조각이 끌림 | 흡입 방향과 안전지대 |
| 기념사진 시간 / photo flash | 가족사진 frame, 초인종 projector, 짧은 flash rectangle | 멈춤/둔화 위험 |
| 상담 예약 / pressure ring | CRT 얼굴이 더 크게 웃고 ring guide가 바닥에 생김 | ring warning 위치 |
| 모델하우스 평면도 | floor plan line이 켜지되 background decal보다 선명 | passable hazard line |
| core exposed | CRT smile glitch, body panel 열림, warm core 노출 | 공격 기회 |

## 4. HP 65 / 25 성과 연출

HP 65:

- 외피 panel 일부 탈락.
- 가족사진 frame 하나가 꺼짐.
- 결과/정산에서 "외피 손상 기록"으로 읽힘.
- 실패해도 성과가 남는다는 감각.

HP 25:

- core layer가 더 오래 노출.
- 문패/이름 조각이 잠깐 보임.
- 결과/정산에서 "코어 파편 / 처리 절차 접근"으로 읽힘.
- 보스 완전 처치 전에도 다음 출격 동기 제공.

주의:

- 보상 수치 변경은 하지 않는다.
- HP threshold visual은 성과 이해용이다.

## 5. 회수/처리 결과 연출

### 결절 파괴

Visual:

- CRT 화면 꺼짐.
- brochure skirt가 바닥에 조용히 떨어짐.
- 모델하우스 지붕/안테나가 꺼지고 동네 광고음이 낮아짐.
- 문패 일부가 광고 label 아래에서 드러남.

R01 hook:

- fake return route 일부 끊김.
- drain pocket / silence edge 쪽 흔적 조사 강화.

### 기억 추출

Visual:

- CRT 화면이 완전히 꺼지지 않고 가족사진 afterimage를 남김.
- 이름/영수증/사진 조각이 보관함으로 옮겨지는 느낌.
- 광고 농도는 덜 줄지만 정보가 더 많이 남음.

R01 hook:

- fake return route와 family photo hazard 강화.
- 다음 목표가 "후속 신호/기억 잔향"으로 이어짐.

## 6. 결절 파괴 / 기억 추출 hook 시각 방향

| hook | R01 변화 | 보급소 변화 |
| --- | --- | --- |
| 결절 파괴 | node light 감소, route decal 끊김, 일부 문패 선명 | 이름 보관함에 조용한 문패 slot |
| 기억 추출 | photo afterimage 증가, fake route 더 설득력 있음 | 사진/영수증 slot이 밝지만 불안하게 점등 |

## 7. 보스 전투용 단순화 기준

반드시 줄일 것:

- 얼굴 내부 디테일.
- brochure skirt의 글자/작은 쿠폰 text.
- 청소기/초인종/사진 frame의 과한 장식.
- full detail source를 모든 frame에 그대로 쓰는 것.

반드시 유지할 것:

- 둥근 가전 body.
- CRT smile.
- model-home roof/antenna.
- coupon/paper skirt.
- domestic tool appendage.
- core exposed silhouette.

LOD 기준:

- LOD0: boss close/default, full silhouette.
- LOD1: attack frame simplified, pattern cue 우선.
- LOD2: distant/intro or result screen icon.

## 8. 현재 후보 판단

`assets/style_samples/p0_direction/hybrid_production_candidate/smile_home_mother_in_law_boss_candidate.png`

판단:

- 첫 보스 정체성 후보로 유효.
- 스마일 홈 시어머니가 캠페인 송출관 자체로 보이지 않는 점이 좋다.
- 다만 gameplay frame으로는 디테일이 많다.
- 전투용 단순화와 pattern cue sheet가 필요하다.

## 9. 금지/주의

- 단순 큰 상담원/키오스크로 만들지 않는다.
- 고어 좀비 엄마, 악마형 mother boss, 스팀펑크 기계 보스 금지.
- 캠페인 송출관을 0.2 보스로 직접 구현하지 않는다.
- 보스/보상/성장 수치 변경 금지.

## 10. PMO 판단 필요

- 보스 후보 이미지를 0.2 placeholder로 승인할지.
- 전투용 boss size를 100~135px 중 어디로 둘지.
- HP 65/25 성과 visual을 0.2에 넣을지, 결과 문구로만 둘지.
- 결절 파괴/기억 추출 선택 UI를 보스 직후에 보여줄지, 보급소 정산에서 처리할지.
