# P0 Art Direction Correction

## 1. 기존 리워크 실패 판정

현재 P0 PNG 리워크 결과물은 Godot import/slicing 검증용으로는 사용할 수 있지만, 상업용 후보 또는 PMO 승인용 대표 아트로 승인하지 않는다.

판정:

```text
Godot slicing/import 검증용:
  사용 가능

상업용 최종 후보:
  불합격

PMO 승인용 대표 아트:
  불합격

초기 디자인/세계관 반영:
  부족

추후 reference:
  하지 말아야 할 방향에 가까움
```

실패 원인:

- 파일명, 셀 크기, pivot, slicing 구조 유지에 집중한 나머지 세계관의 핵심 감정과 시각 언어가 약해졌다.
- `B - bright dystopian atomic`을 단순 파스텔 도트로 축소해 해석했다.
- `C`에서 가져와야 할 체념, 버려진 상품의 상처, 로봇의 불안을 어린/치비 귀여움으로 오해할 위험이 생겼다.
- R01 외곽 주택가가 "끝나지 않는 오픈하우스 광고 생태계"라는 점이 충분히 반영되지 않았다.
- 적이 광고 물질과 생활 인프라/재동기화 로봇의 혼합 생태계가 아니라 일반 작은 몬스터처럼 보였다.

현재 PNG를 상업용 후보라고 주장하지 않는다. 이 문서 이후 전체 P0 재양산을 바로 시작하지 않고, 먼저 PMO가 승인할 수 있는 스타일 샘플만 제작한다.

## 2. B/C/A 혼합 톤 재정의

핵심 세계관 문장:

```text
세상은 멸망하지 않았다.
다만 모든 것이 광고가 되었다.
```

R01 외곽 주택가는 폐허가 아니다. 행복한 가족과 완벽한 집을 팔던 동네가 끝나지 않는 오픈하우스 광고 생태계로 변한 장소다. 화면은 밝고 친절해야 한다. 하지만 그 친절함이 불쾌해야 한다.

수정된 톤 비율:

```text
B - bright dystopian atomic: 70%
C - cute dystopian melancholy: 20%
A - atomic steampunk danger signal: 10% 이하
```

### B 70%

표면 톤이다.

- 1950s 광고지
- 파스텔 교외
- 레트로 카탈로그 UI
- 웃는 마스코트
- 밝은 오픈하우스/소비재 광고 분위기
- 종이 쿠폰, 전단, 풍선, 표지판, 가족 포스터
- 친절하고 반복적인 광고 문구

### C 20%

감정층이다. 단, 어린 캐릭터화가 아니다.

- 체념
- 버려진 상품의 상처
- 자기 말과 광고 문구를 구분하지 못하는 로봇의 불안
- 귀엽지만 슬픈 감정층
- 밝은 미소 뒤에 남은 오래 켜진 기계의 피로
- 누군가의 이름, 사진, 문패가 상품명으로 덮이는 슬픔

### A 10% 이하

위험 신호로만 사용한다.

- 방사능 위험 신호
- 장비 과부하
- 신호/기계 위험감
- 독성 그린 누출
- 역송출 장비의 경고선

금지:

- 황동
- 스팀펑크
- 가스마스크
- 어두운 산업 폐허
- 러스트/브라스 중심의 노스탤지어

## 3. 귀여움 기준 정정

이 프로젝트에서 귀여움은 어린/치비/유아 캐릭터 방향이 아니다.

금지:

- 어린아이처럼 귀여운 비례
- 치비화
- 유아 캐릭터 느낌
- 마스코트 장난감만 남는 방향
- 귀여운 눈물 스티커식 슬픔
- 눈물/하트/동글 비례만으로 감정을 처리하는 방식

권장:

- 광고용 미소
- 친절한 소비재 형태
- 생활 오브젝트의 애교
- 버려진 상품의 상처
- 역할에 갇힌 장치
- 웃고 있지만 오래 켜져 있어서 불편한 느낌
- 친절한 말투가 자기 의지가 아닌 것 같은 불안
- 제품으로 설계된 귀여움이 너무 오래 반복되어 생기는 피로

좋은 예:

- 미소 짓는 우편함이 개인 편지가 아니라 광고지를 탄환처럼 뱉는다.
- 홈케어 청소기가 먼지와 기억을 모두 "불필요한 것"으로 분류한다.
- 마스코트가 밝은 표정을 유지하지만, 자기 말과 광고 문구를 구분하지 못한다.

나쁜 예:

- 어린 주인공, 치비 생존자, 봉제 장난감 몬스터만으로 정리된 화면.
- 그냥 귀여운 적이 몰려오는 게임.
- 슬픔을 큰 눈, 눈물, 하트 스티커로만 표현하는 방식.

## 4. 윤서 외형 기준

윤서는 어린 캐릭터가 아니다.

기준:

- 20대 중후반
- 인간
- 기본 주인공
- 반품/물류/정비 실무자 계열
- 캠페인이 완성된 고객 프로필로 읽지 못하는 데이터 빈칸
- 광고 세계에 덜 칠해진 사람

외형:

- 낡은 편의점/배달/정비 작업복
- 바랜 민트
- 흐린 크림
- 짙은 회색/남색
- 손글씨 이름표
- 찢긴 고객 라벨
- 반품 스캐너 또는 도장 장비
- 회수선 릴
- 전단 조각 파우치
- 피곤하지만 무너지지 않은 표정

시각 포인트:

- 캠페인이 붙이려 한 고객 라벨이 찢겨 있고, 그 위에 손글씨 이름표가 붙어 있다.
- 손에 든 장비는 큰 총이 아니라 반품 스캐너/도장기/라벨기 계열이어야 한다.
- 캠페인 신호에 닿아도 완전히 상품화되지 않은 작은 공백이 있어야 한다.
- 밝은 광고 세계 안에서 윤서만 약간 덜 칠해진 사람처럼 보여야 한다.

금지:

- 어린 생존자
- 치비 헬멧 캐릭터
- 군인/용사 느낌
- 과도한 귀여움
- 캠페인 상품처럼 화려한 의상
- 가스마스크/중무장 포스트 아포칼립스 생존자

## 5. R01 적 구성 재정의

R01 외곽 주택가의 적은 단순 좀비/마스코트가 아니다. 적은 캠페인 농도에서 다시 생산되는 광고 생태계의 현상이어야 한다.

첫 지역 적은 최소 두 축이 섞여야 한다.

### 5.1 광고/판촉 물질 계열

광고가 물리 법칙이 된 것을 보여주는 적.

예:

- 쿠폰 전단 떼
- 세일 풍선
- 오픈하우스 표지판
- 광고지 벌레
- 카탈로그 조각
- 찢어진 가족 포스터 잔상

역할:

- 대량 스폰
- 빠른 접근
- 탄막/장판/시야 혼란
- 광고 문구가 실제 위협이 됨
- 종이, 포장재, 쿠폰, 풍선이 살아 움직이는 느낌

전투 의미:

- 플레이어가 "광고가 배경이 아니라 적의 재료"라는 것을 바로 이해하게 한다.
- 죽으면 피가 아니라 종이 조각, 슬라임, 광고 잉크, 별 모양 파편이 흩어진다.

### 5.2 생활 인프라 / 재동기화 로봇 계열

원래 사람을 돕던 생활 장치가 광고 명령에 갇힌 적.

예:

- 미소 우편함
- 홈케어 청소기
- 가족 상담 키오스크
- 자동 스프링클러
- 가전/마스코트 기계
- 부동산 안내 장치

역할:

- 이동 방해
- 원거리 압박
- 흡입/장판/추천 구역 생성
- 악한 로봇이 아니라 역할에 갇힌 장치
- 원래 용도가 전투 패턴으로 뒤틀림

전투 의미:

- 캠페인 환경이 일상을 전투 규칙으로 바꾸는 것을 보여준다.
- 로봇 적은 군대가 아니라 재동기화된 상품/가전/마스코트처럼 보여야 한다.

## 6. Elite / Boss 방향 재정의

### Elite 후보: 행복 보증 상담원

기존 `감염된 1950s 주부`보다 R01 기준으로 더 적합한 첫 엘리트 후보는 `행복 보증 상담원`이다.

정체:

- 무인 부동산 안내 키오스크
- 모델하우스 상담 장치
- 플레이어를 입주 후보로 보는 이동 상담원

외형:

- 화면 얼굴
- 접이식 다리
- 부동산 안내판/키오스크 몸체
- 친절한 미소
- 광고 카탈로그/매물표 조각
- 작은 스피커, 번호표, 추천 배지
- 유독 그린 슬라임이 화면 모서리나 다리 관절에서 새어 나옴

패턴 연결:

- 추천 매물 구역
- 상담 예약
- 고객 동선 최적화
- 주변 잡몹 이동속도 상승
- 광고 오라

### Boss 방향: 스마일 홈 시어머니

첫 지역의 대형 결절/보스 방향은 `스마일 홈 시어머니`다.

정체:

- 첫 지역의 캠페인 결절
- 원래 모델하우스 가족 상담형 홈 어시스턴트
- 빈집과 거리 전체를 하나의 오픈하우스 가족 세트로 묶는 장치
- 목표는 플레이어를 죽이는 것이 아니라 행복한 가족 구성원으로 편입하는 것

외형:

- 둥근 1950s 가전 실루엣
- CRT/곡면 화면에 웃는 여성 얼굴
- 주방 믹서 + 진공청소기 + 인터폰 + 부동산 키오스크 혼합
- 쿠폰 종이 치마
- 전선 다발
- 모델하우스 미니 지붕/안테나
- 가족사진 프레임, 초인종, 청소기 호스, 쿠폰을 전투 중 소환할 수 있는 형태

금지:

- 악한 로봇 엄마 캐릭터로 단순화
- 고어 좀비 보스
- 스팀펑크 기계 보스
- 단순 큰 마스코트

## 7. 기존 PNG 폐기/참고/유지 구분

### 폐기 판정

상업용 후보로는 폐기한다.

- 현재 리워크된 플레이어/적 PNG 전체
- 현재 리워크된 480x270 mock 이미지를 대표 아트로 사용하는 것
- 현재 리워크 결과를 PMO 승인용 상업 후보로 보고하는 것

### 참고 가능

구조 참고로만 사용한다.

- 파일명
- 셀 크기
- 행/열 구조
- pivot 기준
- Godot slicing/import 검증 결과
- `scripts/sprite_assets.gd`가 기대하는 region 구조

### 유지

당장 유지해야 하는 것:

- 기존 Godot slicing 구조
- `ASSET_IMPORT_NOTES.md`의 셀 구조
- 기존 파일명을 사용하는 임시 연결 방식
- nearest/pixel snap/pivot 기준

## 8. 1차 스타일 샘플 제작 지시

전체 P0를 한 번에 다시 만들지 않는다. 먼저 PMO 승인용 스타일 샘플만 제작한다.

### 1차 샘플 대상

1. 윤서 48x48 샘플

- 가능하면 1방향 2프레임 또는 4방향 러프
- 손글씨 이름표
- 반품 스캐너/도장 장비
- 실무자 복장
- 어린/치비 느낌 금지
- 광고 세계에 덜 칠해진 사람

2. 쿠폰 전단 떼 32x32

- 광고/판촉 물질 계열
- 종이 벌레처럼 접히고 펼쳐지는 느낌
- 대량 스폰용
- 피/고어 없이 종이 조각과 유독 그린 광고 잉크

3. 미소 우편함 또는 홈케어 청소기 32x32

- 생활 인프라/재동기화 계열
- 친절하지만 불편한 미소
- 역할에 갇힌 장치 느낌
- 우편함이면 광고지를 탄환처럼 뱉는 입 구조
- 청소기면 먼지와 기억을 모두 흡입하는 느낌

4. 행복 보증 상담원 40x40

- 엘리트 후보
- 부동산 안내 키오스크 + 화면 얼굴 + 접이식 다리
- 주부 좀비보다 세계관 적합도 높음
- 플레이어를 입주 후보로 보는 상담 장치

## 9. 2차 P0 확장 조건

1차 샘플이 PMO 승인된 뒤에만 전체 P0로 확장한다.

확장 대상:

- 윤서 48x48 4방향 2프레임
- Tier1 3종
  - 쿠폰 전단 떼
  - 미소 우편함
  - 세일 풍선 또는 홈케어 청소기
- Elite 1종
  - 행복 보증 상담원
- 80x80 대형 결절/마스코트
  - 스마일 홈 시어머니 계열 후보
- 이후 UI/HUD/Card
- 이후 Tile/VFX

확장 전 조건:

- 1차 샘플이 어린/치비 방향으로 보이지 않아야 한다.
- B 표면 톤과 C 감정층이 동시에 보여야 한다.
- 광고 물질 계열과 생활 인프라 계열 적이 명확히 나뉘어야 한다.
- PMO가 R01 외곽 주택가의 오픈하우스 광고 생태계를 이미지에서 읽을 수 있어야 한다.

## 10. 생성 프롬프트 초안

아래 프롬프트는 스타일 샘플 제작용이다. 이미지 생성물 자체를 최종 승인하지 않는다. 생성 후 PMO가 방향을 판단하고, 승인된 방향만 전체 P0로 확장한다.

### 10.1 윤서 48x48 샘플

목적: 기본 플레이어 윤서의 방향 승인. 48x48 셀 기준, 1방향 2프레임 또는 4방향 러프 샘플.

Prompt:

```text
Pixel-art character sprite sample, fixed 48x48 canvas, transparent background, readable pixel-art silhouette. 1950s bright dystopian atomic world, pastel suburb advertising environment. Adult Korean woman survivor in her late 20s, not chibi, not childlike. She is a returns/logistics/repair worker, not a soldier. Faded mint and worn cream utility workwear, dark gray/navy undersuit, torn customer label with a handwritten name tag, small return scanner or stamp device in hand, recovery cable reel and flyer scrap pouch. She looks tired but steady, lightly under-colored compared to the loud advertising world around her. Cocoa/ink pixel outline, toxic green and neon red only as small equipment warning accents. Bright but uneasy advertising dystopia tone.
```

Negative prompt:

```text
chibi, childlike, toddler proportions, cute child survivor, oversized helmet mascot, soldier, hero armor, gas mask, steampunk, brass, rusty pipes, dark industrial wasteland, gore, blood, realistic zombie, glossy high resolution painting, blurry antialiasing, text baked into the image
```

Output requirements:

- Fixed 48x48 pixel canvas per frame.
- Transparent background.
- If animated, 2 frames only for sample.
- Keep pivot near x 24, y 43.
- Readable at 1x in a 480x270 game screen.

Notes:

- The sample must prove that Yunseo is an adult practical worker.
- The handwritten name tag and return scanner/stamp are more important than a weapon.
- If she reads as a child, mascot, soldier, or generic survivor, reject.

### 10.2 쿠폰 전단 떼 32x32

목적: 광고/판촉 물질 계열 tier1 적의 방향 승인.

Prompt:

```text
Pixel-art enemy sprite sample, fixed 32x32 canvas, transparent background, readable pixel-art silhouette. 1950s bright dystopian atomic, pastel suburb advertising. A swarm-like coupon flyer creature made from folded sale coupons, catalog scraps, open-house paper, and small toxic green advertising ink leaks. Not chibi, not childlike. It should feel like advertising material became a physical threat, folding and unfolding like a paper insect. Bright cream paper, pastel beige, coral sale marks, lemon yellow coupon blocks, cocoa/ink outline, small toxic green slime accents. No readable text, only simple ad-like bars and shapes. Designed for mass spawning in a 480x270 top-down survivor game.
```

Negative prompt:

```text
childlike monster, cute baby creature, plush toy, gore, blood, zombie flesh, steampunk, brass, gas mask, dark horror, realistic insect, high resolution painterly style, blurry edges, readable text labels
```

Output requirements:

- Fixed 32x32 pixel canvas per frame.
- Transparent background.
- 2 idle frames if possible.
- Pivot near x 16, y 28.
- Must be distinct from mailbox/appliance enemies.

Notes:

- This enemy represents advertising material becoming hostile.
- It should be small and numerous, not individually monstrous.
- Paper silhouette must be readable at 1x.

### 10.3 미소 우편함 / 홈케어 청소기 32x32

목적: 생활 인프라/재동기화 로봇 계열 tier1 적의 방향 승인.

Prompt:

```text
Pixel-art enemy sprite sample, fixed 32x32 canvas, transparent background, readable pixel-art silhouette. 1950s bright dystopian atomic pastel suburb advertising. A smiling suburban mailbox or homecare vacuum enemy, originally a friendly household object, now resynced by advertising commands. Not chibi, not childlike. It has a forced friendly smile, simple consumer-product shape, small mechanical legs or wheels, and toxic green slime leaking from a seam. It should feel like a helpful device trapped in its role, not an evil robot army. Pastel mint, ad paper cream, coral red flag or button, sage green, cocoa/ink outline, small neon toxic green leak. Bright, friendly, and uncomfortable.
```

Negative prompt:

```text
child toy robot, chibi mascot, scary killer robot, military robot, steampunk, brass, gas mask, rusty industrial machine, gore, blood, dark horror, photorealism, heavy gradients, readable text baked into sprite
```

Output requirements:

- Fixed 32x32 pixel canvas per frame.
- Transparent background.
- 2 idle frames if possible.
- Pivot near x 16, y 28.
- Must read as household infrastructure, not generic monster.

Notes:

- Mailbox version may imply ranged ad-flyer shots.
- Vacuum version may imply suction and cleanup behavior.
- The key emotion is forced friendliness, not malice.

### 10.4 행복 보증 상담원 40x40

목적: R01 elite 후보 방향 승인. 기존 주부 좀비보다 세계관 적합한 엘리트 샘플.

Prompt:

```text
Pixel-art elite enemy sprite sample, fixed 40x40 canvas, transparent background, readable pixel-art silhouette. 1950s bright dystopian atomic, pastel suburb advertising, open-house sales ecosystem. A "Happy Guarantee Consultant" enemy: unmanned real-estate information kiosk with a small smiling screen face, fold-out legs, catalog-paper panels, speaker grille, numbered ticket badge, and a tiny open-house sign. Not chibi, not childlike. It sees the player as a move-in candidate. Friendly consumer-service design, but unsettling because it is trapped in its sales role. Pastel mint body, cream display, coral and lemon ad accents, cocoa/ink outline, small toxic green slime leak in a joint. No gore, no steampunk.
```

Negative prompt:

```text
young cute girl, chibi, childlike, housewife zombie gore, blood, horror corpse, military robot, steampunk brass machine, gas mask, dark industrial ruin, photorealistic kiosk, high-res painting, blurry antialiasing, readable text labels
```

Output requirements:

- Fixed 40x40 pixel canvas per frame.
- Transparent background.
- 2 frames if possible.
- Pivot near x 20, y 37.
- Must look taller/more important than 32x32 tier1 enemies.

Notes:

- The design should suggest future patterns: recommended listing zone, appointment marker, route optimization.
- The screen smile must be friendly but uncomfortable.
- Reject if it reads as a generic robot, zombie, or childlike mascot.

## 11. PMO 승인 체크리스트

PMO는 1차 샘플을 보고 아래 항목만 판단한다.

- 윤서가 어린 캐릭터처럼 보이지 않는가?
- 윤서가 반품/물류/정비 실무자 계열로 보이는가?
- 손글씨 이름표와 반품 스캐너/도장 장비가 읽히는가?
- 적이 광고 물질 계열과 생활 인프라 계열로 나뉘는가?
- 화면이 밝고 친절하지만 불쾌한가?
- B 톤이 표면이고, C 감정층이 과하지 않게 섞였는가?
- A 요소가 스팀펑크로 새지 않았는가?
- R01의 "끝나지 않는 오픈하우스 광고 생태계"가 보이는가?
- 적이 단순 좀비/마스코트/치비 몬스터로 보이지 않는가?
- 이 방향으로 전체 P0를 확장해도 되는가?

## 금지사항 요약

- 전체 P0 재양산 시작 금지
- 코드 수정 금지
- Godot import 작업 금지
- 기존 PNG를 상업용 후보라고 승인 금지
- 어린/치비 방향 금지
- 어두운 스팀펑크 방향 금지
- 새 파일명 체계 확정 금지
- 이미지 생성물 자체를 최종 승인하지 말 것

## 다음 작업 추천

1. 이 문서를 PMO에게 전달해 방향 승인 기준을 먼저 확인한다.
2. 승인 전에는 P0 전체 PNG를 다시 만들지 않는다.
3. 1차 샘플 4종만 제작한다.
4. 샘플을 480x270 mock에 배치해 PMO 체크리스트로 검토한다.
5. 승인된 뒤에만 전체 P0 에셋으로 확장한다.
