# GLOBAL NPC L3 이하 텍스트 엔진 데이터 패키지 작성팀 프롬프트 v0.1

## 문서 상태

```text
상태:
작성 완료 v0.1

작업 성격:
전역 NPC L3 이하 240개 샘플 문구를 실제 엔진 데이터 패키지 형태로 정리하게 하는 제작팀 프롬프트.
이 문서는 프롬프트 문서이며 실제 데이터 패키지 산출물이 아니다.

전제 판정:
story/03_regions/global_npc_l3_below_text_engine_level_pre_conversion_validation_v0_1.md의 최종 판정은 변환 프롬프트 작성 가능이다.

실제 산출물:
story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md

허용 범위:
Markdown 문서 안의 parseable JSON 코드블록 패키지까지만 허용한다.

금지:
실제 data/ 디렉터리 생성 금지.
실제 .json 파일 생성 금지.
실제 .csv 파일 생성 금지.
Godot 리소스 생성 금지.
GDScript/로더 코드 작성 금지.
```

---

## 1. 작업 목표

너는 Atomic Ad Survivors의 전역 NPC L3 이하 240개 샘플 문구 엔진 데이터 패키지 작성팀이다.

목표는 검증 완료된 240개 샘플 문구와 240개 적용 티켓을 실제 엔진/레벨/UI/오디오 팀이 읽을 수 있는 Markdown 내부 JSON 패키지로 정리하는 것이다.

작성할 실제 산출물은 아래 1개뿐이다.

```text
story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md
```

작업 원칙:

1. 240개 샘플과 240개 티켓의 1:1 연결을 유지한다.
2. 새 문구를 쓰지 않는다.
3. 새 NPC를 만들지 않는다.
4. 새 이름을 만들지 않는다.
5. 직접 대면 이벤트를 만들지 않는다.
6. L5/L4 192개를 변경하지 않는다.
7. 원 은행 1,856개 전체 작성으로 확장하지 않는다.
8. 실제 엔진 파일을 만들지 않고 Markdown 안 JSON 코드블록까지만 작성한다.

---

## 2. 입력 문서 목록

반드시 아래 문서를 읽고, 여기서 확인된 수량과 금지선을 유지한다.

```text
story/03_regions/global_npc_l3_below_first_text_samples_v0_1.md
story/03_regions/global_npc_l3_below_first_text_samples_qa_v0_1.md
story/03_regions/global_npc_l3_below_text_application_standard_v0_1.md
story/03_regions/global_npc_l3_below_text_application_tickets_v0_1.md
story/03_regions/global_npc_l3_below_text_application_ticket_qa_v0_1.md
story/03_regions/global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md
story/03_regions/global_npc_l3_below_text_engine_level_pre_conversion_validation_v0_1.md
```

입력 문서 역할:

| 문서 | 역할 |
|---|---|
| `global_npc_l3_below_first_text_samples_v0_1.md` | 240개 샘플 문구 원문 |
| `global_npc_l3_below_first_text_samples_qa_v0_1.md` | 샘플 문구 QA 결과 |
| `global_npc_l3_below_text_application_standard_v0_1.md` | 적용 기준 |
| `global_npc_l3_below_text_application_tickets_v0_1.md` | 240개 적용 티켓 원본 |
| `global_npc_l3_below_text_application_ticket_qa_v0_1.md` | ticket_id/sample_id 1:1 QA |
| `global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md` | 필드, 상태 키, 플래그, 레벨 전달 기준 |
| `global_npc_l3_below_text_engine_level_pre_conversion_validation_v0_1.md` | 변환 프롬프트 작성 가능 판정 |

---

## 3. 허용 산출물

| 산출물 | 허용 여부 | 조건 |
|---|---|---|
| `story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md` | 허용 | Markdown 문서 1개만 작성 |
| Markdown 내부 JSON 코드블록 | 허용 | parseable JSON 패키지 형태로 작성 |
| `text_samples` 배열 | 허용 | 기존 240개 샘플 문구만 사용 |
| `application_tickets` 배열 | 허용 | 기존 240개 티켓과 sample_id 1:1 유지 |
| `placement_hints` 배열 또는 객체 | 허용 | 실제 좌표가 아닌 배치 힌트만 |
| `state_keys` 배열 또는 객체 | 허용 | 해금/승격/직접 대면이 아닌 상태 참조 키만 |
| `flags` 배열 또는 객체 | 허용 | 연출/표시/노출 제어용 플래그만 |
| `qa_guards` 배열 또는 객체 | 허용 | 금지선과 검산 조건 |
| `validation_summary` 객체 | 허용 | 수량, 금지선, `actual_files_created=false` 기록 |

산출물은 반드시 Markdown 문서 안에 있어야 한다. 별도 데이터 파일로 분리하지 않는다.

---

## 4. 금지 산출물

아래 산출물은 만들지 않는다.

```text
data/ 디렉터리
data/**/*.json
*.json 실제 파일
*.csv 실제 파일
Godot .tres/.res/.tscn 리소스
GDScript 파일
로더 코드
엔진 코드
새 NPC 문서
새 이름 목록
새 직접 대면 이벤트 문서
L5/L4 승격 문서
1,856개 전체 문구 문서
```

금지 판정:

```text
실제 산출물은 Markdown 1개다.
Markdown 내부 JSON 코드블록은 허용하지만, 실제 JSON 파일 생성은 금지한다.
```

---

## 5. JSON 코드블록 구성안

실제 산출물에는 아래 구조의 JSON 코드블록을 포함한다.

중요:

1. 아래 예시는 구조안이다.
2. 실제 패키지 작성 시 배열에는 입력 문서의 240개 샘플/티켓만 채운다.
3. 새 샘플, 새 티켓, 새 문구, 새 NPC, 새 이름을 추가하지 않는다.
4. `actual_files_created`는 반드시 `false`다.

```json
{
  "package_id": "global_npc_l3_below_text_engine_data_package_v0_1",
  "package_type": "markdown_embedded_json_only",
  "actual_files_created": false,
  "source_documents": [
    "story/03_regions/global_npc_l3_below_first_text_samples_v0_1.md",
    "story/03_regions/global_npc_l3_below_first_text_samples_qa_v0_1.md",
    "story/03_regions/global_npc_l3_below_text_application_standard_v0_1.md",
    "story/03_regions/global_npc_l3_below_text_application_tickets_v0_1.md",
    "story/03_regions/global_npc_l3_below_text_application_ticket_qa_v0_1.md",
    "story/03_regions/global_npc_l3_below_text_engine_level_handoff_standard_v0_1.md",
    "story/03_regions/global_npc_l3_below_text_engine_level_pre_conversion_validation_v0_1.md"
  ],
  "text_samples": [],
  "application_tickets": [],
  "placement_hints": [],
  "state_keys": [],
  "flags": [],
  "qa_guards": [],
  "validation_summary": {
    "ticket_count": 240,
    "sample_id_count": 240,
    "unique_sample_id_count": 240,
    "campaign_distribution": {
      "E01": 16,
      "E02": 32,
      "E03": 18,
      "E04": 18,
      "E05": 18,
      "E06": 18,
      "E07": 18,
      "E08": 18,
      "E09": 18,
      "E10": 18,
      "E11": 18,
      "E12": 18,
      "cross_region": 12
    },
    "global_bank_total_written": false,
    "global_bank_total_count": 1856,
    "l5_l4_count_changed": false,
    "l5_l4_locked_count": 192,
    "actual_files_created": false,
    "forbidden_outputs_created": {
      "data_directory": false,
      "json_files": false,
      "csv_files": false,
      "godot_resources": false,
      "gdscript_or_loader_code": false
    }
  }
}
```

JSON 코드블록 구성 요소:

| key | 역할 | 수량/형태 | 금지 |
|---|---|---|---|
| `text_samples` | 240개 샘플 문구 원문 또는 적용 텍스트 | 240개 | 새 문구 추가 |
| `application_tickets` | 240개 ticket_id와 sample_id 1:1 연결 | 240개 | ticket 추가/삭제 |
| `placement_hints` | 실제 좌표가 아닌 배치 힌트 | ticket 기준 또는 공통 기준 | 좌표 확정 |
| `state_keys` | 상태 참조 키 | 입력 문서의 허용 키 | 해금 조건화 |
| `flags` | 표시/노출 제어용 플래그 | 입력 문서의 허용 플래그 | NPC 승격/대면 이벤트 플래그 |
| `qa_guards` | 금지선과 검산 조건 | 공통/티켓별 가능 | 금지선 완화 |
| `validation_summary` | 수량과 파일 생성 여부 검산 | 객체 | `actual_files_created=true` |

---

## 6. 필수 필드 정의

`text_samples`와 `application_tickets`를 연결하는 각 적용 레코드는 아래 필드를 반드시 포함한다.

| field | type | required | source | rule |
|---|---|---|---|---|
| `ticket_id` | string | yes | 적용 티켓 문서 | 기존 240개 ticket_id만 사용 |
| `sample_id` | string | yes | 샘플/티켓 문서 | 기존 240개 sample_id만 사용 |
| `source_slot_id` | string | yes | 샘플 문서 | 원본 슬롯 참조만 유지 |
| `campaign` | string | yes | 샘플/티켓 문서 | E01~E12 또는 `cross_region` |
| `region_band` | string | yes | 캠페인에서 파생 | 현실권/언어권 권역 표기 |
| `layer` | enum | yes | 샘플 문서 | L3, L2, L1, L0 중 하나 |
| `expression_type` | enum | yes | 샘플/티켓 문서 | 허용 표현 방식만 사용 |
| `text` | string | yes | 샘플 문서 | 원문 유지, 새 문구 작성 금지 |
| `placement_hint` | string | yes | 티켓/핸드오프 문서 | 실제 좌표가 아닌 후보 위치 |
| `state_key` | string | yes | 티켓/핸드오프 문서 | 상태 참조 키만 허용 |
| `flag` | string | yes | 티켓/핸드오프 문서 | 표시/노출 제어만 허용 |
| `owning_team` | enum | yes | 티켓 문서 | 스토리, 레벨, UI, 오브젝트, 오디오, QA |
| `application_mode` | string | yes | 티켓 문서 | 기존 적용 방식 유지 |
| `forbidden_overlap` | string | yes | 티켓/QA 문서 | 새 NPC/이름/대면/L5-L4 금지 명시 |
| `qa_guard` | string | yes | QA/핸드오프 문서 | 수량과 금지선 검산 조건 |

허용 표현 방식:

```text
대사 은행
잔향
오브젝트
호출번호
목록
자동 음성
로그
표지
영수증
대기열 기록
```

허용 담당 팀:

```text
스토리
레벨
UI
오브젝트
오디오
QA
```

---

## 7. 수량 잠금

| 항목 | 잠금값 | 유지 방식 |
|---|---:|---|
| ticket 총수 | 240 | `application_tickets`에 240개만 작성 |
| sample_id 총수 | 240 | `text_samples`와 연결된 sample_id 240개 유지 |
| 고유 sample_id | 240 | 중복 sample_id 금지 |
| ticket/sample 1:1 연결 | 240 | ticket 하나당 sample 하나 |
| 원 은행 전체 작성 | 0 | 1,856개 전체 문구 작성 금지 |
| 원 은행 전체 기준 수량 | 1,856 | 참조 수량으로만 기록 |
| L5/L4 변경 | 0 | 192개 변경 금지 |
| 실제 파일 생성 | 0 | `actual_files_created=false` 유지 |

수량 잠금 문구:

```text
ticket 240개를 유지한다.
sample_id 240개를 유지한다.
고유 sample_id 240개를 유지한다.
원 은행 1,856개 전체를 작성하지 않는다.
L5/L4 192개는 변경하지 않는다.
```

---

## 8. 캠페인별 분배 잠금

| 캠페인 | ticket 수 | sample_id 수 | 판정 |
|---|---:|---:|---|
| E01 | 16 | 16 | 고정 |
| E02 | 32 | 32 | 고정 |
| E03 | 18 | 18 | 고정 |
| E04 | 18 | 18 | 고정 |
| E05 | 18 | 18 | 고정 |
| E06 | 18 | 18 | 고정 |
| E07 | 18 | 18 | 고정 |
| E08 | 18 | 18 | 고정 |
| E09 | 18 | 18 | 고정 |
| E10 | 18 | 18 | 고정 |
| E11 | 18 | 18 | 고정 |
| E12 | 18 | 18 | 고정 |
| cross_region | 12 | 12 | 고정 |
| 합계 | 240 | 240 | 고정 |

캠페인 잠금:

```text
E01은 16개만 작성한다.
E02는 32개만 작성한다.
E03~E12는 각 18개만 작성한다.
cross_region은 12개만 작성한다.
E01 120 슬롯 자체를 늘리지 않는다.
E02 이후 한국어 이름 기본값을 쓰지 않는다.
```

---

## 9. 금지선

절대 금지:

```text
새 NPC 생성 금지.
새 이름 생성 금지.
새 대면 이벤트 생성 금지.
L5/L4 승격 금지.
1,856개 전체 문구 작성 금지.
실제 JSON 파일 생성 금지.
CSV 생성 금지.
Godot 리소스 생성 금지.
GDScript/로더 코드 생성 금지.
플레이어블 해금 조건 작성 금지.
E02 이후 한국어 이름 기본값 금지.
```

데이터 해석 금지:

1. `state_key`를 플레이어블 해금 조건으로 해석하지 않는다.
2. `flag`를 NPC 승격 또는 직접 대면 이벤트 생성 플래그로 해석하지 않는다.
3. `placement_hint`를 실제 좌표 또는 레벨 리소스 수정 지시로 해석하지 않는다.
4. `owning_team`을 새 업무 범위 확장 지시로 해석하지 않는다.
5. `text`를 새 대사 작성 요청으로 해석하지 않는다.
6. E02 이후 슬롯에 한국어 이름 기본값을 넣지 않는다.

---

## 10. 검증 체크리스트

작성 후 아래를 모두 검증한다.

| 항목 | 기대값 | 검증 방식 | 실패 처리 |
|---|---:|---|---|
| 출력 문서 | 1 | `story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md`만 생성 | 반려 |
| 실제 JSON 파일 | 0 | `.json` 파일 생성 여부 확인 | 반려 |
| 실제 CSV 파일 | 0 | `.csv` 파일 생성 여부 확인 | 반려 |
| Godot 리소스 | 0 | `.tres`, `.res`, `.tscn` 생성 여부 확인 | 반려 |
| GDScript/로더 코드 | 0 | `.gd`, loader 관련 파일 생성 여부 확인 | 반려 |
| ticket 수 | 240 | JSON 코드블록 내 `application_tickets` 수량 검산 | 보정 필요 |
| sample_id 수 | 240 | JSON 코드블록 내 sample_id 수량 검산 | 보정 필요 |
| 고유 sample_id 수 | 240 | 중복 sample_id 검산 | 보정 필요 |
| E01 분배 | 16 | 캠페인별 수량 검산 | 보정 필요 |
| E02 분배 | 32 | 캠페인별 수량 검산 | 보정 필요 |
| E03~E12 분배 | 각 18 | 캠페인별 수량 검산 | 보정 필요 |
| cross_region 분배 | 12 | 캠페인별 수량 검산 | 보정 필요 |
| 필수 필드 | 15 | 각 레코드 필드 검산 | 보정 필요 |
| `actual_files_created` | `false` | `validation_summary` 확인 | 반려 |
| 새 NPC/이름/대면 | 0 | 금지선 검산 | 반려 |
| L5/L4 변경 | 0 | 192개 미변경 확인 | 반려 |
| 원 은행 전체 작성 | 0 | 1,856개 전체 확장 없음 확인 | 반려 |
| 코드펜스 균형 | 통과 | Markdown 코드펜스 수 짝수 확인 | 보정 필요 |
| trailing whitespace | 0 | 줄 끝 공백 확인 | 보정 필요 |
| `git diff --check` | 통과 | 변경 파일 검산 | 보정 필요 |

검증 문구:

```text
validation_summary.actual_files_created=false를 반드시 기록한다.
validation_summary.ticket_count=240을 반드시 기록한다.
validation_summary.sample_id_count=240을 반드시 기록한다.
validation_summary.unique_sample_id_count=240을 반드시 기록한다.
validation_summary.l5_l4_locked_count=192를 반드시 기록한다.
validation_summary.global_bank_total_count=1856을 반드시 기록한다.
```

---

## 11. 다음 작업 포인터

전역 NPC L3 이하 240개 엔진 데이터 패키지 작성

다음 작업 제한:

```text
다음 작업은 story/03_regions/global_npc_l3_below_text_engine_data_package_v0_1.md 작성이다.
실제 data/ 디렉터리, JSON 파일, CSV 파일, Godot 리소스, GDScript, 로더 코드는 만들지 않는다.
Markdown 내부 JSON 코드블록 패키지까지만 작성한다.
240개 샘플/티켓만 다룬다.
1,856개 전체 문구 작성으로 확장하지 않는다.
새 NPC, 새 이름, 직접 대면 이벤트, L5/L4 승격을 만들지 않는다.
```

최종 지시:

```text
입력 문서를 읽고, 240개 샘플과 240개 티켓을 1:1로 연결한 Markdown 내부 JSON 패키지를 작성하라.
검증 실패 시 새 데이터를 만들지 말고 보정 필요 항목만 표시하라.
```
