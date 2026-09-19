# R08-L01 보급소 제작

작업 ID: R08-SUPPLY-20260912. 경로: C:/workspace/스팀펑크.
사용자 승인: 세계 구조 교정 후 다음 단계 실행. 기본 Astra medium 요청 유지. 이번 범위는 보급소 후보 맵 제작/렌더 점검이며 기존 샘플이나 정사를 변경하지 않는다.
현재 단계: 보급소 공간 후보 저장 및 반복 렌더 검토. 생산 시각/기능/플레이 완료는 아님.

최신 사용자 지시 반영: 이 산업용 후보는 공간 참고용으로만 유지한다. 서브컬처 미술을 나중에 재질로 입히는 방식으로 확장하지 않는다. 캐릭터와 환경을 함께 맞추는 후속 작업은 `r08_subculture_slice_20260912.md`에서 관리한다.

## 제작 판단

세계 구조 기록과 보급소 정사를 읽고, Astra medium의 독립 사전 비평을 적용했다. 귀환→정산→휴식이 연결되어야 하며, 산업 모듈이 주유소/생존자 생활 정체성을 삼키지 않아야 한다. L02 역송출 장치는 L01에 옮기지 않는다.

36×32m 부지, 캐노피와 개조 상점, 분리된 전기 설비장은 제작 가정이다. 정사의 방위나 지리 좌표를 새로 확정한 것이 아니다. 열린 상점 입구와 부분 지붕은 공간 검토용이며 지붕 가림 처리가 완료된 게임 맵이 아니다.

## 실행

- `Content/Python/build_r08_supply_candidate.py`: 기존 맵 덮어쓰기를 거부하고 `/Game/R08_Candidates/Maps/R08_L01_Supply_v01`을 신규 생성했다. 산업 모듈 및 프로젝트 아스팔트 재질로 48개 구조물을 배치했다.
- 기존 거짓 전투를 상속하지 않도록 후보 맵은 GameModeBase를 지정했다. 원본 샘플/기존 런타임 C++는 변경하지 않았다.
- `Content/Python/capture_r08_supply_candidate.py`: 저장된 맵을 읽어 1920×1080 렌더 및 별도 메타데이터를 생성한다. 처음의 일반 콜백 방식은 엔진이 먼저 종료되어 실패했고, AutomationScheduler 방식으로 수정했다.
- 자산 제작용 프로젝트에 런타임 DLL이 없어 첫 실행이 실패했다. 이번 에디터 프로세스에만 `-DisablePlugins=AASPlaytestRuntime`를 사용하여 해결했다. 설정 파일을 바꾸거나 샘플 DLL을 복제하지 않았다.
- C:/UnrealWork/AtomicAdSurvivorsUE는 원본 프로젝트를 가리키는 새 ASCII 경로 junction이다. 프로젝트 복사/이동/삭제는 하지 않았다.
- `tools/build_r08_owned_props.py`로 프로젝트 소유 주유기·발전기·침상·정산대 OBJ/MTL을 제작했다. 외부 미디어 입력은 없다. `AssetPipeline/R08OwnedProps/r08_owned_props_manifest.json`에 도구/모델/날짜/치수/삼각형 수/권리 출처와 후보 상태를 기록했다.
- `Content/Python/prepare_r08_supply_v02.py`는 후보 맵 복제/저장만 하고 종료한다. `integrate_r08_owned_props.py`는 다음 프로세스에서 해당 후보를 로드한다. 같은 프로세스에서 복제 후 로드한 시도는 엔진 World Memory Leaks로 실패했으며 재사용하지 않는다.
- v01 실제 이미지를 열어 확인했을 때 하늘만 보였다. 캡처 JSON과 Unreal PythonStub에서 Rotator의 순서가 roll/pitch/yaw임을 확인했다. v02에서는 카메라·광원·모든 구조물에 이름 있는 인수를 사용하고 저장된 중심/피벗으로 재배치했다. v01은 실패 증거로 보존한다.
- `Saved/Logs/R08_PropsImport_v04.log`에 AAS_R08_V02_SAVED, `Saved/R08/supply_v02_import.json`에 네 소품의 실제 임포트 치수와 재질 개수가 기록됐다. 임포트 치수는 소스와 2cm 이내 일치했다. 새로운 맵은 `/Game/R08_Candidates/Maps/R08_L01_Supply_v02`다.
- v02에서는 발전기 역할 누락이 해소됐으며 signal_shielding만 여전히 실패한다. 이를 숨기거나 다른 벽에 태그를 붙여 통과시키지 않았다.
- v02 두 실제 프레임을 부모와 Astra가 검토하고 생산 시각 게이트 FAIL로 판정했다. 캐노피 가림과 창고형 전면을 구조적으로 수정하기 위해 `refine_r08_supply_candidate.py`와 다섯 번째 소유 메시 `r08_repurposed_storefront.obj`를 추가했다. 원본 실패 프레임은 보존한다.
- Revision B는 얇은 부분 차양/보 구조, 1.4m 열린 출입구와 낮은 연속 상점 전면, 안쪽 정산/침상, 설비 공간과 발전기 케이블, 도로 경계를 추가했다. `Saved/Logs/R08_Refine_v01.log`의 AAS_R08_REVISION_B_SAVED와 `Saved/R08/supply_v02_revision_b.json`으로 저장을 확인했다. 금속 설비 공간만으로 실제 차폐 검증을 통과시키지 않는다.
- Sol 검토를 반영해 캡처 카메라를 transient로 생성하고 keep-alive를 finally에서 정리한다. 두 번째 이미지는 실제 플레이어 없는 정적 상세 뷰이므로 game-scale 명칭을 폐기했다. 재질 메타데이터도 프로젝트 소유 소품 재질을 포함한다.
- `언리얼_보급소후보.cmd`와 프로젝트 `Open-R08SupplyCandidate.ps1`는 후보 맵을 편집기로 여는 검토용 진입점이다. 사용자 프로필이나 기존 전투 테스트를 실행하지 않는다. 이 대화에서 해당 수동 런처 자체는 실행하지 않았다.
- Revision B 렌더에서는 실내등 1800의 기본 단위 때문에 입구/실내가 과노출됐다. `correct_r08_practical_light.py`로 후보 조명을 명시적인 20cd로 고쳤으며 `R08_PracticalCorrection.log`의 저장 마커를 확인했다. 촬영 결과는 revision_c 파일명으로 분리하여 이전 실패 이미지를 보존한다.

## 현재 증거와 한계

최종 확인: `Saved/Logs/R08_SupplyCapture_revision_c.log`의 AAS_R08_REVISION_C_CAPTURE_SAVED와 1920×1080 overview/detail 두 PNG를 직접 열어 확인했다. 잘못된 카메라 회전과 실내 과노출은 해소됐다. 상점 전면과 입구, 귀환 공간, 발전기/설비 구역의 구분은 이전 후보보다 읽힌다.

**판정: 후보 공간 조립/임포트/저장/렌더는 확인, 생산 시각 게이트는 미통과.** 생활 물자 밀도와 재질 디테일이 부족하고, 주유기 일부는 여전히 차양에 가리며, 주변 환경과 캐릭터가 없다. 원래 섹터의 지형/생활권을 완성한 맵으로 소개하지 않는다. 다음 구조 보완은 사람이 쓰는 구체적인 물자/정산·보관 흔적, 주유기 전면 가독성, 차폐 구조의 접합/접지와 설비 동선이다. 태그 통과를 위한 이름 붙이기나 카메라 이동으로 대신하지 않는다.

정산·귀환·발전기 태그가 있는 것은 후보의 배치 의미다. 정산 UI, 발전/차폐 상태, 캐릭터 이동, 충돌 경로, 정상 속도 플레이 검증은 구현 완료로 보고하지 않는다. 수동 런처는 문법 검사만 통과했으며 실제 실행은 하지 않았다.

프로젝트 `Saved/Logs/R08_SupplyBuild_v02.log`와 `Saved/R08/supply_v01_build.json`에 저장 경로, 모든 구조물의 자산/배치/크기, 카메라, 미완료 항목이 기록되어 있다. 프로세스 종료 코드 0만으로 전체 성공을 판정하지 않았다.

태그 검사는 manual_power와 signal_shielding 누락을 정확히 보고했다. 전기 패널을 발전기로, 벽을 검증된 차폐 설비로 표시하지 않았다. 귀환 앵커와 정산대 태그는 공간 의미이며 상호작용 완성을 의미하지 않는다. 실제 캐릭터, 기능, 경로, 정상 속도 플레이, 최종 아트는 미완료다.

## 읽은 파일과 모델

- `docs/unreal/world_structure_execution_20260912.md`: 이번 단계와 승인 범위.
- `docs/failure-ledger.md` 관련 끝부분: 보급소 오해와 과거 제작법 금지. 이번 시작/캡처 실패를 추가 기록.
- `docs/world/WORLD_FOUNDATION_LOCK_V0_3.md` 보급소 절, `docs/world/E01_FIRST_SEASON_LOCAL_NODES_V0_1.md` R08행: Astra 비평 근거.
- 프로젝트 `.uproject`, `Config/DefaultEngine.ini`, `Content/Python/init_unreal.py`: 실행과 자동 시작/렌더 설정.
- `Content/Python/build_r01_hero_block.py`, `inspect_r01_mesh_bounds.py`, `capture_r01.py`, `prepare_r01_environment_pilot_v11.py`, `import_r01_fab_sources.py`의 관련 함수: 기존 API/피벗/캡처/임포트 방식만 참고. 기존 맵 생성기를 실행하지 않음.
- `Saved/Logs/InspectR01MeshBounds.log`: 산업 벽/바닥의 측정된 피벗.
- `AssetPipeline/r01_fab_pilot_manifest.json`: 기존 자산의 출처 기록. 외부 에셋을 생성형 미디어 입력으로 사용하지 않음.
- `Intermediate/PythonStub/unreal.py`의 임포트 관련 API 항목: SDK 계약 확인.
- 이번 생성/캡처 코드, 빌드 JSON과 로그: 부모가 직접 검토.
- 소품 생성기의 기하/OBJ 출력 부분과 소품 manifest/MTL: 부모가 직접 검토. Python 구조 검사 중 생긴 `tools/__pycache__`의 해당 생성기 바이트코드는 정리하지 않았다.

부모는 통합/구현/렌더 판정, Luna low는 허용된 세 자산 폴더의 파일명 조사, Astra medium은 사전 공간 비평, Terra medium은 독립적인 프로젝트 소유 소품 후보 제작, Sol high는 통합 코드 독립 검토를 담당한다. 실제 부모 추론/속도 메타데이터는 별도 확인되지 않았으며 설정만으로 확정하지 않는다.

새 후보만 저장하며 삭제·이동·스테이징·커밋·원본 샘플 저장은 하지 않았다. 최종 아트 승인과 사용자 정상 속도 플레이 검토는 남아 있다.

## 변경 파일 범위

이번 기록과 세계 구조 기록의 후속 링크, 실패 기록, `tools/build_r08_owned_props.py`, 프로젝트 `Content/Python` 아래 build_r08_supply_candidate / prepare_r08_supply_v02 / integrate_r08_owned_props / refine_r08_supply_candidate / correct_r08_practical_light / capture_r08_supply_candidate 여섯 스크립트, 검토용 PS1/CMD 런처, `AssetPipeline/R08OwnedProps`의 소유 OBJ/MTL/manifest, `Content/R08_Candidates`의 신규 후보 맵/재질/메시가 작업 결과다. 자동 생성한 로그/이미지/JSON은 프로젝트 Saved/R08 및 Saved/Logs의 R08 이름 파일에 있다. 모든 해당 소스/후보는 Git 미추적 상태이며 빈 diff를 검증 근거로 사용하지 않았다.
