# Motion proof — final run03

결론: 승인된 단순 로봇 1개와 idle/walk/attack 3개 모션의 제작 및 Windows Godot 2D/3D 실행 검증 완료. 최종 결과는 run03만 사용한다. run01과 run02는 실패 증거 보존용이다. 다른 캐릭터나 복잡한 모션에 대한 일반화는 하지 않는다.

## 바로 보기 / 실행

- 모바일 확인용: `C:\workspace\motion-proof-20260905-145830\run03\evidence\mobile-preview.mp4` — 실제 Godot 화면, 자동 순환 9초, 960×540 H.264, 약 0.5 MB. 외부 업로드 없음. 실제 휴대전화에서 재생한 것은 아님.
- 조작 검증 녹화: `run03/evidence/input-tests.mp4` — 실제 게임에 키 이벤트를 넣은 5.25초 실행 화면.
- `powershell -File "C:\workspace\motion-proof-20260905-145830\launch.ps1"` — 2D/3D 함께 실행.
- 같은 명령 뒤 `-Scene proof3d` 또는 `-Scene proof2d` — 독립 장면 실행.
- 같은 명령 뒤 `-Auto` — 자동 모션 순환. 실행 중 Tab으로 전환.
- 조작: 3D WASD/방향키 이동 및 이동 방향 회전, 2D A/D 또는 좌우 방향키 이동·반전, Space 공격. 공격 중 정지, 반복 입력 무시, 종료 후 현재 입력에 맞춰 idle/walk 복귀.
- 자동 순환: idle → 좌우 walk → attack → idle. 바닥의 원/선은 고정 원점·지면 참고 표시이며 이동하는 그림자가 아니다.

## 최종 산출물 절대 경로

- Blender 원본: `C:\workspace\motion-proof-20260905-145830\run03\robot.blend`
- 내보낸 GLB: `C:\workspace\motion-proof-20260905-145830\run03\robot.glb`
- 스프라이트: `C:\workspace\motion-proof-20260905-145830\run03\idle.png`, `walk.png`, `attack.png` (동일 폴더). 각각 1024×128 RGBA, 왼쪽부터 128×128 8프레임.
- 개별 렌더: `C:\workspace\motion-proof-20260905-145830\run03\frames`
- Godot 프로젝트: `C:\workspace\motion-proof-20260905-145830\run03\godot\project.godot`
- 장면: 위 Godot 폴더의 `both.tscn`, `proof3d.tscn`, `proof2d.tscn`; 런타임 `proof.gd`.
- 최종 Blender 생성기: `C:\workspace\motion-proof-20260905-145830\build_robot_v03.py`
- 시트 조립/검사: `C:\workspace\motion-proof-20260905-145830\assemble.py`
- Godot 생성기: `C:\workspace\motion-proof-20260905-145830\make_project.py` 및 `proof.gd`
- 재열기 검사: `C:\workspace\motion-proof-20260905-145830\verify_source.py`
- 최종 증거 집계: `C:\workspace\motion-proof-20260905-145830\run03\evidence\final_checks.json`

## 재생성

`powershell -File "C:\workspace\motion-proof-20260905-145830\launch.ps1" -Rebuild`

항상 새 `regenerated-날짜-시간-고유값` 폴더를 만들며, 이전 산출물을 덮어쓰지 않는다. Blender 생성 → PNG 조립/GLB 검사 → 저장된 Blender 재열기/지면 검사 → Godot 생성/가져오기 → 게임 실행 순서다. 재생성 명령 전체를 추가 실행하지는 않았지만, 구성 단계는 최종 run03에서 모두 실행했고 런처는 PowerShell 구문 검사 오류 0개다.

수동 자동 입력 QA는 새 재생성 폴더에서 Godot에 `--fixed-fps 60 -- --qa`를 전달한다. QA는 해당 실행 폴더의 evidence에 고정 이름 결과를 쓰므로 증거 보존을 위해 기존 run03에서 재실행하지 말고 새 재생성 폴더를 사용한다. 실제 화면 녹화는 `--write-movie <새 파일.avi>`를 사용하며 `--headless`를 붙이지 않는다. headless는 가져오기용으로만 사용했다.

Blender는 Armature를 선택해 Action Editor에서 idle/walk/attack을 선택해 편집할 수 있다. 저장 시 idle이 활성화되어 있고 내보내기용 NLA 트랙들은 중복 재생 방지를 위해 음소거 상태다. 3개 액션 모두 보존되어 있다. 모든 변환 키를 24fps로 베이크했고 GLB 시작 시간을 0으로 맞췄다. 2D는 같은 캐릭터/모션을 고정 직교 카메라와 고정 조명에서 렌더한 것으로, 손으로 그린 픽셀 아트가 아니다.

## 프로그램 / 환경

- 실제 접근 경로: `C:\workspace\스팀펑크`; 원격 연결 여부는 추정하지 않았다.
- Blender 5.2.1 LTS, hash 9e2066aef7ef. 공식 ZIP SHA256 `0e631dad7d0cad6d5d18abdd2e2550f6c0213215334eda00ddbd3d22b96ecb2c` 검증.
- 실행 파일: `C:\workspace\motion-proof-20260905-145830\tools\portable\blender-5.2.1-windows-x64\blender.exe`
- 공식 배포: https://download.blender.org/release/Blender5.2/
- Godot 4.7.stable.official.5b4e0cb0f; `%LOCALAPPDATA%\Microsoft\WinGet\Packages\GodotEngine.GodotEngine_Microsoft.Winget.Source_8wekyb3d8bbwe\Godot_v4.7-stable_win64_console.exe`
- FFmpeg 8.1.2, Python 3.11.9, Pillow 12.3.0.
- 실제 Godot 렌더러: gl_compatibility / OpenGL 3.3, NVIDIA GeForce RTX 4080 SUPER.
- 실제 선택 모델 및 토큰·금액은 관측 불가. 모델을 변경했다고 주장하지 않는다.

## 검증 결과와 범위

| 대상 | 제작 / 가져오기 | 게임 실행 | 시각 확인 |
|---|---|---|---|
| 3D | 편집 가능한 13관절, 27리깅 메시. 내보낸 GLB를 Godot가 실제 로드. idle 2초, walk 1초, attack 1초 | 독립 17/17, 통합에 포함된 이동·회전·공격·연타 무시·복귀 검사 통과. 실행 중 armR 회전 변화 측정 | 실제 게임 idle/walk/attack 캡처와 자동 녹화의 추출 프레임 확인. 명백한 관절 분리/잘림 없음 |
| 2D | 24개 128×128 투명 프레임, 모션별 8프레임 시트. 실제 AtlasTexture/AnimatedSprite2D 로드 | 독립 13/13, 이동·좌우반전·공격 잠금·연타 무시·복귀 통과 | 24프레임 접촉 시트 및 실제 게임 캡처 확인. 고정 프레임·카메라, 잘림 없음 |

- 통합 30/30, 독립 3D 17/17, 독립 2D 13/13. 같은 종류의 검사를 독립 장면에서도 확인한 것이며 서로 다른 60개 기능이라는 의미는 아니다.
- 입력 검사는 `Input.parse_input_event(InputEventKey)`를 통한 자동 입력이다. 사람이 직접 키보드로 플레이했다고 주장하지 않는다.
- 가져오기/최종 실행 로그 ERROR 및 WARNING 0개. Headless 성공을 시각 PASS로 사용하지 않았다.
- GLB idle/walk 처음과 마지막 키의 위치·회전 연속성 검사 통과.
- 스프라이트 마지막→처음 알파 차이가 내부 최대 프레임 차이의 1.25배 이하. 반복 경계가 수치상 이상치가 아니며, 접촉 시트/실행 캡처에서 명백한 자세 단절 없음. 시각 평가는 캡처 및 영상 추출 프레임 기반이다.
- 저장된 Blender 원본을 다시 열고 idle 49, walk 25, attack 25개 베이크 프레임 검사. XY 루트 이동 0; 걷기 지지발 바닥 높이 최대 절대오차 약 5.22e-8. 바닥 관통 결함 수정 완료.
- PNG 알파 경계는 전 프레임에서 가장자리 2픽셀 이상 안쪽. 카메라, 조명, 원점 고정; 프레임별 자동 크롭/재중심화 없음.
- 휴대전화 하드웨어 테스트, 모바일 게임 빌드, 터치 입력은 이 작업에 포함하지 않았다. 미리보기 MP4를 제공했다.

## 수정 / 남은 환경 문제 / 사용량

- 최초 제작 + 수정 2회. 1차: GLB 시작 시각 보정. 2차: 발 본의 반대 로컬 X축에 맞춰 보정 부호 수정. 원본 실패 결과와 failure-ledger.md 보존.
- 생성/렌더 실행 3회, 각 24프레임, 총 72프레임. 별도 에이전트, 이미지·영상 생성 AI, 유료 API, 외부 업로드 사용 없음. 토큰·비용 확정값은 알 수 없다.
- 초기 winget MSI 설치는 UAC 대기 때문에 포터블로 대체했다. winget은 중지했으나 해당 consent/msiexec 종료는 Access denied였다. 남은 관리자 권한 창은 사용자가 취소하면 된다. 포터블 실행/제작에는 영향 없다. 추가 권한 획득이나 보안 우회는 하지 않았다.
- 기존 저장소에 쓰기·삭제·이동·스테이징·커밋·push 없음. 처음과 끝 Git 변경 항목은 635개, 추적 파일 변경 목록도 동일. 파일 내용 전체 해시 비교를 수행한 것은 아니다.

## 실제 읽은 파일 / 증거

기존 저장소: `C:\workspace\스팀펑크\AGENTS.md` 전체; `docs\failure-ledger.md`의 서두/공통 규칙, Runtime And QA Integration, Godot Runtime Work, headless Movie Maker 및 Dummy SubViewport 실패 관련 부분·제목 검색. 기존 게임 소스는 열지 않았다.

실험 소스: build_robot.py, build_robot_v02.py, build_robot_v03.py, assemble.py, make_project.py, proof.gd, verify_source.py, final_checks.py, launch.ps1 (실행/검사 또는 수정용 읽기). 설치 ZIP과 공식 .sha256은 체크섬 검사에 사용.

산출물 검사: run01/run02/run03의 robot.glb, 각 frames/{idle,walk,attack}_00.png부터 _07.png, 생성 Godot 리소스; run02/run03의 robot.blend 재열기. build01.log/build02.log/build03.log; run01/run02 가져오기·실행 및 game_checks_0.json; run02 source_checks.log; run03 evidence의 import03.log, both.log/.err, proof3d.log/.err, proof2d.log/.err, auto03.log/.err, game_checks_0.json/1.json/2.json, source_checks.json/.log. final_checks.json은 위 증거를 집계한다.

직접 시각 확인: run01 sprite_contact.png/game_0_150.png; run02 game_0_20.png/auto-contact.png; 최종 run03 sprite_contact.png, game_0_50.png, game_0_150.png, auto-contact.png. 영상은 실제 Godot가 기록한 AVI를 FFmpeg로 변환했고, FFprobe로 MP4 규격/9초 길이를 확인했다.

