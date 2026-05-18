# Vertical Slice 0.2 Playflow Checklist

작성일: 2026-05-18
목표: 5~10분 루프가 손맛 테스트가 아니라 하나의 게임 흐름으로 이어지는지 검증한다.

## 1. 통과 기준

0.2는 아래가 끊기지 않아야 한다.

```text
게임 시작
-> 윤서 조작
-> R01 진입
-> 첫 회수
-> 보급소
-> 재출격
-> 송출 기록 1/2/3
-> 모델하우스 결절
-> 스마일 홈 시어머니
-> 보스 회수/처리
-> 결절 파괴/기억 추출 hook
-> 보급소 복귀
-> 다음 목표 표시
```

## 2. 체크리스트

| 단계 | 확인 질문 | 통과 기준 | 상태 |
| --- | --- | --- | --- |
| 1. 게임 시작 | 첫 화면이 내부 prototype처럼 보이지 않는가 | 윤서/R01/HUD가 최소 세계관 톤으로 읽힘 | 미검증 |
| 2. 윤서 조작 | 윤서가 adult 실무자로 보이는가 | 어린/치비/군인으로 읽히지 않음 | PMO 필요 |
| 3. R01 진입 | R01이 한 화면 arena가 아닌 local map으로 보이는가 | 침묵 가장자리에서 분양 루프로 이동 이유가 보임 | 조건부 |
| 4. 첫 회수 | 첫 강제 회수가 사망이 아니라 보급소 회수로 읽히는가 | 긴급 회수 문구/연출/SFX 필요 | 후속 필요 |
| 5. 보급소 | 정산/업글 메뉴가 장소에 붙어 있는가 | 정산 카운터/정비대/게시판/보관함 anchor | 계획 필요 |
| 6. 재출격 | 다음 목표가 자연문으로 안내되는가 | 내부 수치 없이 R01 목적 표시 | 조건부 |
| 7. 송출 기록 1 | 첫 신호가 이벤트처럼 기억되는가 | speaker/route/record cue 필요 | 후속 필요 |
| 8. 송출 기록 2 | 모델하우스 방향이 더 선명해지는가 | house loop/family window/kiosk 증가 | 후속 필요 |
| 9. 송출 기록 3 | 보스 접근이 열렸음을 이해하는가 | open-house/node 방향 고정 | 조건부 |
| 10. 모델하우스 결절 | 결절이 보스 본체가 아니라 접근점으로 읽히는가 | clear anchor + boss arena transition | 후속 필요 |
| 11. 스마일 홈 시어머니 | 첫 보스가 실제 boss silhouette로 보이는가 | CRT/가전/가족 상품화 결절 정체성 | PMO 필요 |
| 12. 보스 회수/처리 | 실패/HP threshold/승리가 다르게 정리되는가 | 65/25 성과, 처리 결과 문구 | 후속 필요 |
| 13. 결절 파괴 hook | 지역이 조용해지는 이유가 보이는가 | 문패/route 끊김/광고음 감소 | 계획 필요 |
| 14. 기억 추출 hook | 더 위험하지만 더 많이 안다는 감각이 있는가 | photo/receipt/fake memory 증가 | 계획 필요 |
| 15. 보급소 복귀 | 결과가 장소에 남는가 | 보관함/게시판/카운터 상태 변화 | 계획 필요 |
| 16. 다음 목표 표시 | 0.3 또는 다음 R01 목표가 보이는가 | 캠페인 송출관은 상위 신호로만 암시 | 후속 필요 |

## 3. 화면/소리 체크

| 항목 | 최소 통과 |
| --- | --- |
| HUD | HP, charge, next goal이 작고 읽힘. debug id 없음. |
| Debug | F12에서만 zone/collision/pathing 정보 표시. |
| SFX | 자동공격, 반품 도장 ready/hit/whiff, 피격, 귀환, 정산 분리. |
| BGM | R01 ambient, 보급소 ambient, 피날레 pressure, boss music 최소 placeholder. |
| Result | 정상 회수/긴급 회수/보스 처리 결과가 다른 문구. |
| Outpost | 최소 시설 5개가 장소로 보임. |

## 4. R01 체크

- R01 world-space가 최소 4~6 screens 이상, 현재 blockout은 12 screens 기준.
- 5 zone anchor가 실제 이동 동선으로 연결.
- 일반 화면에서 내부 id 숨김.
- fake return route가 실제 귀환 UI처럼 보이지 않음.
- model house node 주변 boss/elite/objective anchor 확보.
- enemy가 hard/soft blocker를 완전히 무시하지 않음.
- passable hazard가 blocker와 혼동되지 않음.

## 5. 에셋 체크

- 윤서: adult worker, scanner/stamp/reel/name tag.
- Tier1: coupon swarm, mailbox/homecare, third role 분리.
- Elite: happy guarantee consultant.
- Boss: smile home mother-in-law, not giant consultant, not campaign transmitter.
- UI: catalog/receipt tone but not monetization shop.
- VFX: return stamp, mark, hit, hazard, boss cue.

## 6. 중단 조건

다음 중 하나라도 발생하면 세부 밸런스 테스트를 중단하고 볼륨/가독성 수정으로 돌아간다.

- 윤서가 어린/치비로 읽힘.
- R01이 빈 arena로 읽힘.
- fake return route가 실제 회수 UI처럼 보임.
- 보급소가 단순 상점/가챠 UI로 읽힘.
- 보스가 큰 잡몹/상담원으로 읽힘.
- F12 debug id가 일반 화면에 노출됨.
- 소리가 없어 hit/ready/hazard 판단이 왜곡됨.

## 7. 재개 조건

- 윤서/적/보스 최소 에셋 적용 또는 PMO 승인된 적용 계획 확정.
- R01 collision/navigation 화면 QA 통과.
- SFX placeholder 적용 또는 적용 목록 확정.
- 보급소 visual placeholder 적용 또는 적용 계획 확정.
- 5~10분 루프가 결과/보급소/재출격까지 끊기지 않음.

## 8. 다음 Codex 구현 후보

1. F12 overlay 단계화와 `none` collision 숨김 옵션.
2. fake return route visual/UI 혼동 제거.
3. `AudioFactory` 기반 P0 SFX 이벤트 분리.
4. 보급소 one-screen placeholder scene/panel 연결.
5. 스마일 홈 시어머니 boss silhouette/pattern cue placeholder 적용.
