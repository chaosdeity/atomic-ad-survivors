#!/usr/bin/env python3
"""Static document checks for the R03 0.3 story slice."""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

PATHS = {
    "slice": ROOT / "story" / "05_progression" / "r03_0_3_slice_detail_0_2.md",
    "objects": ROOT / "story" / "05_progression" / "r03_run_object_prototype_tickets_0_2.md",
    "yunseo": ROOT / "story" / "05_progression" / "r03_yunseo_reaction_settlement_phrase_bank_0_2.md",
    "return05": ROOT / "story" / "05_progression" / "r03_return05_u0_u2_seed_tickets_0_2.md",
    "r02_seed": ROOT / "story" / "05_progression" / "r03_r02_support_seed_patch_0_2.md",
    "ui_samples": ROOT / "story" / "05_progression" / "r03_settlement_ui_compaction_samples_0_2.md",
    "qa_linkage": ROOT / "story" / "05_progression" / "r03_object_qa_script_linkage_0_2.md",
    "engine_schema": ROOT / "story" / "05_progression" / "r03_engine_data_schema_handoff_0_3.md",
    "level_blockout": ROOT / "story" / "05_progression" / "r03_l01_l02_level_blockout_tickets_0_3.md",
    "object_data": ROOT / "story" / "05_progression" / "r03_object_data_package_draft_0_3.md",
    "ui_phrase_table": ROOT / "story" / "05_progression" / "r03_settlement_supply_ui_phrase_table_0_3.md",
    "playtest_acceptance": ROOT / "story" / "05_progression" / "r03_implementation_playtest_acceptance_0_3.md",
    "r02_04_draft": ROOT / "story" / "05_progression" / "r02_0_4_draft_0_1.md",
    "r02_gate": ROOT / "story" / "05_progression" / "r02_0_4_pmo_gate_decision_0_1.md",
    "pmo_prompt": ROOT / "docs" / "world" / "R03_0_3_STORY_PMO_HANDOFF_PROMPT_V0_1.md",
    "production_prompt": ROOT / "docs" / "world" / "R03_0_3_PRODUCTION_HANDOFF_PROMPT_V0_1.md",
    "r02_pmo_prompt": ROOT / "docs" / "world" / "R02_0_4_PMO_DECISION_PROMPT_V0_1.md",
    "ui_probe": ROOT / "tools" / "ui_compaction_probe.gd",
}

FORBIDDEN_TERMS = [
    "밥표",
    "전원표",
    "신호표",
    "배급권",
    "보증태그",
    "반품태그",
    "빠른 배송",
    "택배 기사",
]

REQUIRED_GLOBAL_PHRASES = [
    "R03-L01 반품 접수 야드",
    "R03-L02 자동 분류장",
    "R03-L04",
    "R03-L05",
    "0.3에서 열지 않는다",
    "RETURN-05 정식 U5",
    "보급태그",
    "통행태그",
    "진료태그",
    "라벨은 태그가 아니다",
    "R03 엔진 데이터 스키마",
    "R03-L01/L02 레벨 블록아웃",
    "R03 오브젝트 데이터 패키지",
    "R03 정산/보급소 UI 실제 문구 테이블",
    "R03 구현 플레이테스트 수락 기준",
    "시스템을 속이는 재미",
    "방해물이 아니다",
    "R02 0.4",
    "R03 구현 피드백 1회",
    "R02 0.4 PMO 판정",
    "R02는 살리기 위해 환자 상태를 끝내지 않는 지역이다",
]

REQUIRED_IDS = [
    "R03-OBJ-01",
    "R03-OBJ-02",
    "R03-OBJ-03",
    "R03-OBJ-04",
    "R03-OBJ-05",
    "R03-OBJ-06",
    "R03-RET05-00",
    "R03-RET05-01",
    "R03-RET05-02",
    "R03-RET05-03",
    "R03-RET05-04",
    "R03-R02-SEED-01",
    "R03-R02-SEED-02",
    "R03-R02-SEED-03",
    "R03-R02-SEED-04",
    "R03-R02-SEED-05",
    "R03-DATA-OBJ-01",
    "R03-DATA-OBJ-02",
    "R03-DATA-OBJ-03",
    "R03-DATA-OBJ-04",
    "R03-DATA-OBJ-05",
    "R03-DATA-OBJ-06",
    "R03-L01-BLOCKOUT-01",
    "R03-L01-BLOCKOUT-02",
    "R03-L01-BLOCKOUT-03",
    "R03-L02-BLOCKOUT-01",
    "R03-L02-BLOCKOUT-02",
    "R03-L02-BLOCKOUT-03",
    "R03-L02-BLOCKOUT-04",
    "R02-OBJ-01",
    "R02-OBJ-02",
    "R02-OBJ-03",
    "R02-OBJ-04",
    "R02-OBJ-05",
    "R02-OBJ-06",
    "R02-OBJ-07",
    "R02-OBJ-08",
    "R02-OBJ-09",
    "R02-OBJ-10",
    "R02-OBJ-11",
    "R03-PT-01",
    "R03-PT-02",
    "R03-PT-03",
    "R03-PT-04",
    "R03-PT-05",
    "R03-PT-06",
    "R03-PT-07",
    "R03-PT-08",
    "R03-PROD-01",
    "R03-PROD-02",
    "R03-PROD-03",
    "R03-PROD-04",
    "R03-PROD-05",
    "R03-PROD-06",
    "R03-PROD-07",
    "R03-PROD-08",
    "R02-GATE-01",
    "R02-GATE-02",
    "R02-GATE-03",
    "R02-GATE-04",
    "R02-GATE-CHECK-01",
    "R02-GATE-CHECK-02",
    "R02-GATE-CHECK-03",
    "R02-GATE-CHECK-04",
    "R02-GATE-CHECK-05",
]

REQUIRED_UI_PROBE_PHRASES = [
    "r03 result panel",
    "r03 supply panel",
    "목적지 판정 보류 귀환",
    "반송 드론 재검사",
]

REQUIRED_PMO_PHRASES = [
    "스토리 PMO",
    "현재 완료된 산출물",
    "요청 사항",
    "출력 형식",
    "R03 0.3",
]


@dataclass(frozen=True)
class Check:
    status: str
    category: str
    message: str


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def add(results: list[Check], status: str, category: str, message: str) -> None:
    results.append(Check(status, category, message))


def check_files(results: list[Check]) -> dict[str, str]:
    texts: dict[str, str] = {}
    for key, path in PATHS.items():
        if path.exists():
            texts[key] = read_text(path)
            add(results, "PASS", "files", f"{path.relative_to(ROOT)} found")
        else:
            add(results, "FAIL", "files", f"{path.relative_to(ROOT)} missing")
    return texts


def check_forbidden_terms(texts: dict[str, str], results: list[Check]) -> None:
    for key, text in texts.items():
        hits = [term for term in FORBIDDEN_TERMS if term in text]
        if hits:
            add(results, "FAIL", "terminology", f"{key} contains forbidden terms: {', '.join(hits)}")
        else:
            add(results, "PASS", "terminology", f"{key} has no forbidden legacy terms")


def check_required_content(texts: dict[str, str], results: list[Check]) -> None:
    all_story_text = "\n".join(texts.values())
    for phrase in REQUIRED_GLOBAL_PHRASES:
        add(
            results,
            "PASS" if phrase in all_story_text else "FAIL",
            "r03 locks",
            f"required phrase present: {phrase}",
        )
    for required_id in REQUIRED_IDS:
        add(
            results,
            "PASS" if required_id in all_story_text else "FAIL",
            "ticket ids",
            f"required id present: {required_id}",
        )


def check_markdown_fences(texts: dict[str, str], results: list[Check]) -> None:
    for key, text in texts.items():
        if not key.endswith("probe") and key != "ui_probe":
            fence_count = len(re.findall(r"```", text))
            add(
                results,
                "PASS" if fence_count % 2 == 0 else "FAIL",
                "markdown",
                f"{key} code fences are balanced ({fence_count})",
            )


def check_ui_probe(texts: dict[str, str], results: list[Check]) -> None:
    text = texts.get("ui_probe", "")
    for phrase in REQUIRED_UI_PROBE_PHRASES:
        add(
            results,
            "PASS" if phrase in text else "FAIL",
            "ui probe",
            f"ui probe includes: {phrase}",
        )


def check_pmo_prompt(texts: dict[str, str], results: list[Check]) -> None:
    text = texts.get("pmo_prompt", "")
    for phrase in REQUIRED_PMO_PHRASES:
        add(
            results,
            "PASS" if phrase in text else "FAIL",
            "pmo prompt",
            f"PMO prompt includes: {phrase}",
        )


def print_results(results: list[Check]) -> None:
    print("# R03 Story Document Check\n")
    width_status = max(len(r.status) for r in results)
    width_category = max(len(r.category) for r in results)
    for result in results:
        print(f"{result.status:<{width_status}} {result.category:<12}: {result.message}")

    counts = {status: sum(1 for r in results if r.status == status) for status in ["PASS", "WARN", "FAIL"]}
    print("\n# Summary")
    print(f"PASS {counts['PASS']}")
    print(f"WARN {counts['WARN']}")
    print(f"FAIL {counts['FAIL']}")


def main() -> int:
    results: list[Check] = []
    texts = check_files(results)
    if any(r.status == "FAIL" and r.category == "files" for r in results):
        print_results(results)
        return 1

    check_forbidden_terms(texts, results)
    check_required_content(texts, results)
    check_markdown_fences(texts, results)
    check_ui_probe(texts, results)
    check_pmo_prompt(texts, results)
    print_results(results)
    return 1 if any(r.status == "FAIL" for r in results) else 0


if __name__ == "__main__":
    raise SystemExit(main())
