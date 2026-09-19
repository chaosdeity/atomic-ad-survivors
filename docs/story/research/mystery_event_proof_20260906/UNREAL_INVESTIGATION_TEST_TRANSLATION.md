# Unreal Investigation Test Translation

STATUS: RECOVERED RESEARCH / PROOF ONLY

NOT PRODUCTION AUTHORITY

NOT GAME BALANCE

NOT UNREAL PASS

이 문서는 mystery proof의 Python 구현을 Unreal로 포팅하지 않는다. 향후 조사형 사건을 Unreal에서 검증할 때 필요한 상태 머신 요구사항과 회귀테스트 질문만 정리한다.

## 상태 머신 요구사항

- Evidence state는 조사한 기록의 집합을 보존해야 한다.
- Conflicting record는 단일 입력만으로 확정 결론을 만들지 않아야 한다.
- Cross-validation 조건을 충족한 뒤에만 특정 inference state가 열려야 한다.
- Consent state는 extraction 여부와 별개로 추적되어야 한다.
- Resource state는 선택 비용을 반영하고 반복 입력으로 중복 차감되지 않아야 한다.
- Location state는 사건의 가능한 행동과 후속 책임에 영향을 줄 수 있어야 한다.
- Premature extraction은 이후 조사와 복구 가능성을 모두 자동 삭제하지 않아야 한다.
- 과거 행동의 consequence는 합의가 성립해도 자동으로 지워지지 않아야 한다.
- Terminal state는 최소한 필수 정보, 동의, 필요한 자원 조건을 확인한 뒤 닫혀야 한다.

## 회귀테스트 질문

- 필요한 기록을 읽지 않고 결론 또는 종결을 실행할 수 있는가?
- 단서 순서를 바꾸면 같은 사실 관계가 모순되는가?
- 같은 단서를 반복 입력했을 때 로그, 비용, 상태가 중복 변경되는가?
- 자원이 부족한데 대체 경로가 무료로 생성되는가?
- 동의 없이 종결 상태에 도달할 수 있는가?
- 강제 extraction 이후 책임 상태가 사라지는가?
- 위치가 바뀐 뒤에도 이전 위치에서만 가능한 행동이 남는가?
- cross-validation 이전에 반전 또는 결론이 노출되는가?
- 미종결 상태 중 어떠한 합법적 마무리 경로도 없는 dead state가 생기는가?
- 사건 고유 NPC 또는 문구가 전역 규칙으로 자동 승격되는가?

## 범위 경계

proof의 450 states, 1,092 transitions, 세 가지 사례는 테스트 proof의 결과다. Unreal production 콘텐츠의 목표 수량이나 확률이 아니다.

이 문서는 Blueprint, C++, DataAsset, 실제 사건 구현을 포함하지 않는다.
