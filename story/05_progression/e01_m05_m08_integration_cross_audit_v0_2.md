# E01 M05-M08 Integration Cross-Audit V0.2

최종 상태: **E01 M05-M08 INTEGRATION READY FOR PM REVIEW**

대상 브랜치: `story/e01-season-expansion-integrated-v0-2`  
통합 기준 base: `chatgpt-work@a6d5004ce15cf11017d5b379f56164e05f97bf58`  
원본 확장 HEAD: `362fd40edc336d7750444efdeedd2e6991f01b25`

## 1. Authority read set

최신 chatgpt-work에서 교차 확인한 상위 기준:

- `incoming/gpt_work/10_yunseo_protagonist_rebuild/`
- `incoming/gpt_work/09a_protagonist_identity_and_horror/`
- `incoming/gpt_work/03_e01_remap/`
- `incoming/gpt_work/01_global_world_lock/GLOBAL_WORLD_STRUCTURE_LOCK_V0_2.md`
- `incoming/gpt_work/01_global_world_lock/31_GLOBAL_WORLD_LOCK_FINALIZATION_AUDIT_V0_1.md`
- 팝시 기존 character authority 및 cognitive/relationship 문서

우선순위는 최신 10_yunseo rebuild > 09a의 이전 open-structure 제안으로 적용했다. 따라서 6축 초안이 아니라 4 global vectors + contextual trust + seasonal belonging을 사용한다.

## 2. 원본 6커밋 통합 기록

원본 커밋 순서:

1. `303d90c810a054dde9b27f450424f3636506436e`
2. `7161abc3bac0fd9ad4ed867f5d309f7d6455ffff`
3. `be0252e6784fccbf33635b6eb00f771a79ea3a01`
4. `458ac8849ed4af0143535574d4ba21e4f098e08f`
5. `48ba3abc10c589915d597a77ded5bd1e59da6c6f`
6. `362fd40edc336d7750444efdeedd2e6991f01b25`

각 커밋은 V0.1 파일 하나를 신규 추가하는 변경이며, 통합 브랜치에서 같은 파일 내용을 같은 순서로 보존했다. V0.1 6파일 수정은 0이다.

## 3. 10개 필수 감사 결과

| # | 감사 항목 | V0.1 발견 | V0.2 처리 | 결과 |
|---:|---|---|---|---|
| 1 | 윤서 최신 invariant 충돌 | V0.1 일부가 일반적 "자율성/보류" 언어에 머묾 | 개입 축소, 선택 복원, 후속 비용 부담과 4-vector 구조로 재정렬 | PASS |
| 2 | 4 global vectors + contextual trust + seasonal belonging | V0.1 Bible이 relationship/voice/interiority/support/trace/autonomy/revisit 7축 사용 | 7개는 표현 태그로 하향, 4 global + 대상별 trust + seasonal belonging 적용 | PASS |
| 3 | M06 장비 기원 canon화 | "장비 원본", "출처", 작업자 인식이 원점 서사처럼 읽힘 | R03 동계열 호환성 가설로 한정. 고용/원소유/제조 기원 미확정 | FIXED |
| 4 | M05 서하/동생/보호자와 C02 충돌 | "치료 순번"과 보호자 slot이 핵심 갈등이 되어 최신 C02 queue 금지와 충돌 | care need / eligibility / discharge / finite capacity mismatch로 교체. 서하/동생은 episode candidate 유지 | FIXED |
| 5 | M07 팝시 memory/genuine/restoration authority | 방향은 기존 자율성 authority와 정합. exact 오류율/삭제 목록은 과도하게 사실처럼 읽힐 수 있음 | 정품/오류/삭제는 facility claim. 기억 결과는 episode candidate, 기존 팝시 core overwrite 0 | PASS WITH GUARD |
| 6 | M08 숫자/slot이 인간극 압도 | slot/등급/장부 표현이 많지만 피해를 로봇 대기와 주민 반응으로 보여주는 장면도 존재 | slot을 concrete service access와 피해 주체에 의무 연결, 추상 점수 승패 금지 | PASS WITH GUARD |
| 7 | R02/R03/R04/R06 Local 이름 및 이동/진입 | 사용 Local 이름은 최신 canonical과 일치. source relation을 physical로 오독할 위험, R06 ingress는 미해결 | Local rename 0, new physical edge 0, R06 ingress KNOWN GAP 유지 | PASS |
| 8 | M09-M12 미확정 travel/ingress prose 확정 | V0.1 registry에 출항로/승인 체인 등 후반 카드가 과도하게 구체적 | V0.2에서는 M09-M12 전체 PM HOLD. 신규 prose 0, travel/ingress/dependency 확정 0 | PASS |
| 9 | 신규 LOCKED canon 0 | V0.1은 draft/candidate 선언이나 일부 문장이 사실형 | V0.2 모든 보정은 candidate/integration layer. Global Final Lock 변경 0 | PASS |
| 10 | 기존 파일 overwrite 금지 | V0.1 6파일은 신규 추가 파일 | V0.2와 CROSS-AUDIT만 별도 추가, overwrite 0 | PASS |

## 4. Local canonical check

### R02

- R02-L01 응급 접수 홀
- R02-L02 장기 입원동
- R02-L03 보험 심사 약국
- R02-L04 격리문 복도
- R02-L05 퇴원 불가 병동

### R03

- R03-L01 반품 접수 야드
- R03-L02 자동 분류장
- R03-L03 보증 심사 창고
- R03-L04 파쇄 전 대기라인
- R03-L05 최종 반품 심사실

### R04

- R04-L01 폐충전소
- R04-L02 배터리 침전 공장
- R04-L03 리콜 펌웨어실
- R04-L04 폐기 프레스 라인
- R04-L05 재동기화 코어

### R06

- R06-L01 회원 게이트 거리
- R06-L02 포인트 거래 골목
- R06-L03 리뷰 키오스크 광장
- R06-L04 VIP 라운지
- R06-L05 블랙프라이데이 홀

V0.1 M05-M08이 명시한 Local 이름은 위 canonical과 일치한다.

## 5. Graph audit

최신 E01 graph authority 기준:

- historical visibility/progression source: physical travel proof 아님
- validated physical travel: 별도 evidence 필요
- Common Campaign Dependency rows: 0
- R06-L01 external ingress: KNOWN GAP
- R07-L01 external ingress: KNOWN GAP
- Relay actual host: TBD / production fill
- Local Beacon actual assignment: TBD / production fill
- Recovery Line exact geometry: TBD / production fill

이번 통합 변경:

- new physical edge: 0
- new visibility edge: 0
- new Campaign Dependency edge: 0
- new ingress: 0
- new Relay/Beacon/Recovery assignment: 0

## 6. Campaign boundary audit

### C02

patient / care / eligibility / isolation / discharge / actual capacity mismatch 유지. 번호표/대기열 중심 0.

### C03

custody / flow / return / recovery 유지. authenticity/repair/charging 흡수 0. cross-campaign dependency 확정 0.

### C04

validity / authentication / charging / diagnosis / repair / operability 유지. C03 custody destination으로 환원 0.

### C06

membership / account / transaction / tier / review / entitlement / service access 유지. new global currency 0.

## 7. 팝시 authority audit

유지:

- 광고 문구와 자기 말의 경계
- 충전 필요와 자기 차례
- 수리 범위를 먼저 듣고 결정할 권리
- 버려진 마스코트와 재기동 배경
- resync/recall 불안

추가하지 않음:

- 객관적 "진짜 팝시" 판정
- 시설 분류가 정체성 truth라는 선언
- 새 기억을 LOCKED canon으로 승격
- 복구 결과로 기존 character authority 삭제

## 8. PM 확인 필요

아래는 통합 결함이 아니라 PM/후속 production decision이다.

1. M05에서 서하를 장기 roster candidate로 올릴지 episode-local로 둘지
2. R02-L05 퇴원 장면의 실제 physical route/entry
3. M06 장비 호환 단서를 시즌 미스터리로 유지할지 이후 별도 origin reveal로 연결할지
4. M07 복구 결과를 실제 persistence로 저장할 범위
5. R06-L01 external ingress 해결
6. M09-M12 전체 story/travel/dependency 설계

이번 작업에서는 위 항목을 확정하지 않았다.

## 9. Integration gate

- V0.1 6파일 overwrite: 0
- V0.2 신규 파일: 6
- CROSS-AUDIT 신규 파일: 1
- M09-M12 신규 완전 시나리오: 0
- new LOCKED canon: 0
- main 변경: 0

**E01 M05-M08 INTEGRATION READY FOR PM REVIEW**
