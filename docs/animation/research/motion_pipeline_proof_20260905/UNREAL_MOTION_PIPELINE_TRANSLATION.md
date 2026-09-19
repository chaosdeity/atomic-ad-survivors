# Unreal Motion Pipeline Translation

STATUS: RECOVERED RESEARCH / PROOF ONLY

NOT PRODUCTION AUTHORITY

NOT GAME BALANCE

NOT UNREAL PASS

motion-proof에서 재사용할 것은 엔진 결과물이 아니라 검증 습관이다. 아래 항목은 Unreal production 구현 전 다시 검증해야 할 계약과 후속 작업 후보만 정리한다.

## 재사용 가능한 QA 원칙

- 생성 원본과 export 산출물을 모두 보존한다.
- 실패한 run을 덮어쓰지 않고 failure ledger에 원인, 금지 재사용, 교체 방법, 재검증 gate를 남긴다.
- animation clip의 시작과 끝 continuity를 수치 검사와 실제 렌더 확인으로 나눈다.
- root motion 여부와 planted foot grounding을 별도 검사한다.
- headless import 성공을 visual PASS로 사용하지 않는다.
- renderer capture와 입력 상태 검사를 분리해 둘 다 확인한다.
- 자동 입력 검사를 사람이 직접 플레이한 결과로 표현하지 않는다.
- 수정 횟수와 재검증 run을 추적해 proof의 범위를 넘겨 일반화하지 않는다.

## 폐기할 엔진 종속 부분

- Godot scene 구조와 GDScript runtime
- Godot Animation import 길이의 구체적 오차 처리
- Input.parse_input_event 기반 입력 harness
- Godot Movie Maker 사용 방식
- gl_compatibility renderer 자체를 production Unreal 기준으로 사용하는 것
- proof 로봇의 관절 수, clip 길이, 프레임 수를 윤서 기준으로 사용하는 것

## Unreal에서 다시 검증해야 할 항목

- Blender 또는 최종 DCC 원본에서 Unreal import까지 skeleton hierarchy가 유지되는가
- idle, walk, attack 등 승인 clip의 시작 시간과 실제 재생 길이가 의도와 일치하는가
- 루트 이동 정책이 animation asset과 Character Movement 정책에 맞는가
- planted foot가 실제 gameplay pose와 retarget 결과에서 지면을 뚫지 않는가
- loop seam이 수치와 실제 renderer capture 양쪽에서 허용 가능한가
- retarget 또는 compression 이후 관절 분리, clipping, scale drift가 생기지 않는가
- packaged build에서도 editor preview와 같은 핵심 결과가 재현되는가
- 실제 입력, 자동화 입력, cinematic capture의 목적을 구분해 증거를 남기는가

## Astra / Codex 후속 구현 작업 후보

아래는 다음 승인 이후에만 시작한다.

- Unreal import 및 animation validation harness 설계
- approved character 기준 grounding 검사 방법 구현
- loop continuity 자동 검사 구현
- renderer capture 기반 회귀 QA 파이프라인 구성
- retarget 전후 skeleton/clip metadata 비교 검사
- packaged build 재현성 체크
- 실패 ledger 자동 첨부와 증거 경로 표준화

현재 단계에서는 위 구현을 수행하지 않는다. robot PASS는 Yunseo PASS가 아니며, Godot proof는 Unreal production PASS가 아니다.
