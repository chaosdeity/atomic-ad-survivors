# 15 E01 P0 Metadata Interpretation V0.1

상태: P0 METADATA REINTERPRETATION
범위: 기존 P0 source metadata를 수정하지 않고 current Production 의미를 분리
구현 상태: NOT UNREAL IMPLEMENTATION

## 0. 원칙

기존 source metadata의 `P0` 값은 그대로 보존한다.

다만 current authority에서는 한 개의 P0가 두 가지 의미를 동시에 담당하지 않도록 다음 관점을 분리한다.

- `production_priority`: Production Design에서 얼마나 일찍 설계/제작해야 하는가.
- `first_play_priority`: 실제 첫 플레이 흐름에서 얼마나 일찍/필수적으로 노출되는가.

이 구분은 source enum을 변경하는 작업이 아니라 **해석 layer**다.

## 1. Canonical interpretation

| Local | existing source metadata | production_priority | first_play_priority | current interpretation |
|---|---|---|---|---|
| R01-L01 침묵 가장자리 | P0 | EARLY_CORE | FIRST_PLAYABLE_R01 | current first playable residential slice |
| R01-L02 분양 주택 루프 | P0 | EARLY_CORE | EARLY_FOLLOWUP | first report 이후 current follow-up housing-record investigation |
| R01-L03 모델하우스 결절 | P0 | EARLY | NOT_FIRST_15_MIN | early-season C01 boss milestone, exact quest TBD |
| R08-L01 침묵 보급소 | P0 | EARLY_HUB | CONTEXTUAL | framing / survivor settlement hub. current RPG safe hub와 1:1 미확정 |
| R08-L02 역송출 주유소 | P0 | EARLY_SUPPORT | OPTIONAL / CONTEXTUAL | recovery-support infrastructure. mandatory tutorial step 아님 |

## 2. P0가 더 이상 뜻하지 않는 것

P0라고 해서 다음을 자동으로 뜻하지 않는다.

- first 15 minutes strict chain.
- mandatory gameplay unlock order.
- `R08-L01 → R08-L02 → R01-L01 → R01-L02 → R01-L03` 강제 진행.
- 108초 forced extraction.
- 108초 → L02 unlock.
- R01-L03 first 15 minutes boss.
- physical travel edge validation.

## 3. Production priority와 gameplay order 분리

Production Fill 순서:
1. E01_C01.
2. E01 common Travel/Graph Schema.
3. E01_C08.
4. E01_C02 / E01_C03.
5. E01_C04 / E01_C06.
6. E01_C05 / E01_C07.

이 순서는 gameplay unlock order가 아니다.

마찬가지로 P0는 제작상 early focus를 설명할 수 있으나 first-play mandatory order를 결정하지 않는다.

## 4. Source metadata protection

- 기존 `P0/P1/P2` 값 수정: 0.
- Local ID/name 수정: 0.
- source 37 edge 수정: 0.
- 새 enum schema 도입: 0.

`EARLY_CORE`, `FIRST_PLAYABLE_R01` 등은 이 문서의 해석값이며 원본 source metadata를 overwrite하지 않는다.

## 5. Result

- R01-L01: production EARLY_CORE / first-play FIRST_PLAYABLE_R01.
- R01-L02: production EARLY_CORE / first-play EARLY_FOLLOWUP.
- R01-L03: production EARLY / first-play NOT_FIRST_15_MIN.
- R08-L01: production EARLY_HUB / first-play CONTEXTUAL.
- R08-L02: production EARLY_SUPPORT / first-play OPTIONAL / CONTEXTUAL.

판정: **P0 METADATA REINTERPRETATION / PASS**.
