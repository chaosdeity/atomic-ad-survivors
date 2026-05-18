#!/usr/bin/env python3
"""Static invariant checks for the Atomic Ad Survivors 0.2 loop.

This script intentionally uses only text/regex checks. It is a lightweight
guardrail for the contracts documented in SYSTEM_FLOW_DIAGRAMS.md and
RUN_STATE_FLOW.md; it does not execute Godot code or change game data.
"""

from __future__ import annotations

import re
import sys
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]

PATHS = {
    "system": ROOT / "SYSTEM_FLOW_DIAGRAMS.md",
    "run_state": ROOT / "RUN_STATE_FLOW.md",
    "world_story": ROOT / "WORLD_STORY_DIAGRAMS.md",
    "main": ROOT / "scripts" / "main.gd",
    "result": ROOT / "scripts" / "run_result_evaluator.gd",
    "meta": ROOT / "scripts" / "meta_progression.gd",
    "hud": ROOT / "scripts" / "hud_controller.gd",
    "boss": ROOT / "scripts" / "boss_controller.gd",
    "cards": ROOT / "scripts" / "level_up_cards.gd",
    "debug": ROOT / "scripts" / "debug_tools.gd",
    "config": ROOT / "scripts" / "game_config.gd",
    "balance": ROOT / "tools" / "balance_sim.py",
}


@dataclass(frozen=True)
class Check:
    status: str
    category: str
    message: str


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def strip_comments(text: str) -> str:
    lines: list[str] = []
    for line in text.splitlines():
        lines.append(line.split("#", 1)[0])
    return "\n".join(lines)


def function_body(text: str, name: str, *, static: bool = False) -> str:
    prefix = f"{'static ' if static else ''}func {name}("
    lines = text.splitlines()
    start = -1
    for i, line in enumerate(lines):
        if line.startswith(prefix):
            start = i
            break
    if start == -1:
        return ""
    end = len(lines)
    for i in range(start + 1, len(lines)):
        line = lines[i]
        if line.startswith("func ") or line.startswith("static func "):
            end = i
            break
    return "\n".join(lines[start:end])


def const_array_body(text: str, name: str) -> str:
    match = re.search(rf"const\s+{re.escape(name)}\s*:=\s*\[(?P<body>.*?)\n\]", text, re.S)
    return match.group("body") if match else ""


def const_dict_body(text: str, name: str) -> str:
    match = re.search(rf"const\s+{re.escape(name)}\s*:=\s*\{{(?P<body>.*?)\n\}}", text, re.S)
    return match.group("body") if match else ""


def has_all(text: str, needles: list[str]) -> bool:
    return all(needle in text for needle in needles)


def add(results: list[Check], status: str, category: str, message: str) -> None:
    results.append(Check(status, category, message))


def check_files(texts: dict[str, str], results: list[Check]) -> None:
    for key, path in PATHS.items():
        if path.exists():
            texts[key] = read_text(path)
            add(results, "PASS", "files", f"{path.relative_to(ROOT)} found")
        else:
            add(results, "FAIL", "files", f"{path.relative_to(ROOT)} missing")


def check_result_routing(t: dict[str, str], results: list[Check]) -> None:
    main = t.get("main", "")
    supply_body = function_body(main, "_should_show_supply_after_result")
    terminal_body = function_body(main, "_handle_terminal_action")
    restart_body = function_body(main, "_restart")
    finish_body = function_body(main, "_finish_match")
    debug_outcome_body = function_body(main, "_debug_set_smile_home_boss_outcome")
    hud = t.get("hud", "")
    restart_button_body = function_body(hud, "_on_restart_button_pressed")

    add(results, "PASS" if supply_body else "FAIL", "result routing", "_should_show_supply_after_result exists")
    add(
        results,
        "PASS" if has_all(supply_body, ['result_state == "recalled"', 'result_state == "boss_victory"', "return true"]) else "FAIL",
        "result routing",
        "recalled and boss_victory route to supply",
    )
    add(
        results,
        "PASS" if has_all(supply_body, ["first_recall_done", 'result_state == "victory"', 'result_state == "game_over"']) else "FAIL",
        "result routing",
        "victory and game_over route to supply after first recall",
    )
    add(
        results,
        "PASS" if has_all(terminal_body, ['"victory", "game_over"', "_should_show_supply_after_result", "_show_supply_depot"]) else "FAIL",
        "result routing",
        "_handle_terminal_action sends game_over/victory through supply gate",
    )
    add(
        results,
        "PASS" if has_all(finish_body, ['Callable(self, "_handle_terminal_action")', "hud.show_result_screen"]) else "FAIL",
        "result routing",
        "result screen button uses the same terminal action as space input",
    )
    add(
        results,
        "PASS" if has_all(debug_outcome_body, ['Callable(self, "_handle_terminal_action")']) else "FAIL",
        "result routing",
        "boss victory result refresh preserves terminal action callback",
    )
    add(
        results,
        "PASS" if has_all(restart_button_body, ["restart_callback.is_valid()", "restart_callback.call()"]) else "FAIL",
        "result routing",
        "HUD result button dispatches its assigned terminal callback",
    )
    add(
        results,
        "PASS" if has_all(restart_body, ["was_supply", "was_terminal_redeploy", "sortie_index += 1"]) else "FAIL",
        "result routing",
        "_restart increments sortie on redeploy path",
    )
    add(
        results,
        "PASS" if "sortie_index +=" not in finish_body else "FAIL",
        "result routing",
        "_finish_match does not increment sortie at result entry",
    )

    docs = t.get("run_state", "") + "\n" + t.get("system", "")
    add(
        results,
        "PASS" if "game_over" in docs and "result -> supply" in docs else "FAIL",
        "result routing",
        "documents state game_over after first recall routes to supply",
    )


def check_reward_economy(t: dict[str, str], results: list[Check]) -> None:
    result = t.get("result", "")
    tier_names = ["TIER_SURVIVED_60", "TIER_STABLE_90", "TIER_SIGNAL_120", "TIER_DEEP_180", "TIER_BOSS_ROUTE_240"]
    eval_body = function_body(result, "evaluate_run_result", static=True)
    flyer_body = function_body(result, "_torn_ad_flyer_reward", static=True)
    core_body = function_body(result, "_campaign_core_fragment_reward", static=True)
    clue_body = function_body(result, "_signal_clue_candidates", static=True)

    add(
        results,
        "PASS" if "const MIN_GENERAL_REWARD_SECONDS := 45.0" in result else "FAIL",
        "reward economy",
        "45s anti-farm threshold exists",
    )
    add(
        results,
        "PASS" if has_all(eval_body, ["general_reward_allowed", "elapsed >= MIN_GENERAL_REWARD_SECONDS", "else 0"]) else "FAIL",
        "reward economy",
        "45s below-threshold general reward is blocked",
    )
    add(
        results,
        "PASS" if all(name in result for name in tier_names) and all(value in result for value in ["60.0", "90.0", "120.0", "180.0", "240.0"]) else "FAIL",
        "reward economy",
        "60/90/120/180/240 reward tiers exist",
    )
    add(results, "PASS" if '"reward_lines": reward_lines' in result else "FAIL", "reward economy", "reward_lines returned")
    add(results, "PASS" if '"anti_farm_reason": anti_farm_reason' in result else "FAIL", "reward economy", "anti_farm_reason returned")
    add(
        results,
        "PASS" if has_all(eval_body, ["torn_ad_flyer_reward", "signal_clue_candidates", "_torn_ad_flyer_reward", "_signal_clue_candidates"]) else "FAIL",
        "reward economy",
        "signal clue candidates and flyer reward are evaluated separately",
    )
    add(
        results,
        "PASS" if has_all(core_body, ['match_state == "boss_victory"', 'boss_result_reason == "boss_recall"', "boss_hp_ratio <= 0.65"]) else "FAIL",
        "reward economy",
        "core fragment reward is gated by boss victory or boss recall HP performance",
    )
    add(
        results,
        "PASS" if not any(fragment_word in clue_body for fragment_word in ["campaign_core_fragment", "fragment_reward", "fragments_awarded"]) else "FAIL",
        "reward economy",
        "signal clue candidates do not directly grant core fragments",
    )
    add(
        results,
        "PASS" if "var reward := 0" in flyer_body and "TIER_WARMUP" not in flyer_body else "FAIL",
        "reward economy",
        "warmup tier does not define positive flyer base reward",
    )


def check_signal_and_boss_route(t: dict[str, str], results: list[Check]) -> None:
    main = t.get("main", "")
    meta = t.get("meta", "")
    result = t.get("result", "")
    signal_body = const_array_body(meta, "SIGNAL_CLUES")
    clue_count = len(re.findall(r"SIGNAL_CLUE_[A-Z0-9_]+", signal_body))
    grant_body = function_body(meta, "grant_signal_clue_candidates")
    sync_body = function_body(main, "_sync_boss_signal_from_clues")
    route_body = function_body(main, "_boss_route_ready")
    core_body = function_body(result, "_campaign_core_fragment_reward", static=True)

    add(results, "PASS" if clue_count == 3 else "FAIL", "signal clue", f"signal clue requirement is 3 (found {clue_count})")
    add(
        results,
        "PASS" if has_all(grant_body, ["duplicates.append", "duplicate_flyers_awarded", "_duplicate_signal_flyer_value"]) else "FAIL",
        "signal clue",
        "duplicate signal clues convert to flyer value",
    )
    add(
        results,
        "PASS" if has_all(sync_body, ["clue_count >= 3", "boss_signal_unlocked = true"]) else "FAIL",
        "boss route",
        "boss_signal_unlocked opens at 3 signal clues",
    )
    add(
        results,
        "PASS" if "meta_progression.has_all_signal_clues()" in route_body else "FAIL",
        "boss route",
        "_boss_route_ready uses all signal clues",
    )
    add(
        results,
        "PASS" if not any(needle in core_body for needle in ['boss_active', 'boss_signal_unlocked', 'elapsed >= 240']) else "FAIL",
        "boss route",
        "core fragment reward is not granted for boss encounter or route readiness alone",
    )
    add(
        results,
        "PASS" if "보스 조우만으로 코어 파편" in t.get("system", "") else "FAIL",
        "boss route",
        "no-core-on-encounter rule is documented",
    )


def check_meta_progression(t: dict[str, str], results: list[Check]) -> None:
    main = t.get("main", "")
    meta = t.get("meta", "")
    upgrade_body = const_array_body(meta, "UPGRADES")
    upgrade_count = len(re.findall(r'"id"\s*:', upgrade_body))
    reset_body = function_body(main, "_reset_player_stats")
    save_needles = ["FileAccess", "ConfigFile", "user://", "store_string", "get_as_text", "save_game", "load_game"]
    save_hits = sorted({needle for needle in save_needles if needle in strip_comments(main + "\n" + meta)})

    add(results, "PASS" if t.get("meta") else "FAIL", "meta progression", "MetaProgression file exists")
    add(results, "PASS" if upgrade_count == 16 else "FAIL", "meta progression", f"16 upgrade definitions exist (found {upgrade_count})")
    for name in ["upgrade_defs", "can_buy", "buy", "is_unlocked", "upgrade_level", "bonuses"]:
        add(results, "PASS" if function_body(meta, name) else "FAIL", "meta progression", f"{name}() exists")
    add(
        results,
        "PASS" if has_all(reset_body, ["meta_progression.bonuses()", "auto_damage_bonus", "charge_damage_bonus", "max_hp_bonus"]) else "FAIL",
        "meta progression",
        "meta bonuses are applied when next sortie stats reset",
    )
    if save_hits:
        add(results, "WARN", "save boundary", f"save/load-like API tokens found: {', '.join(save_hits)}")
    else:
        add(results, "PASS", "save boundary", "no save/load API tokens found")


def check_level_card_separation(t: dict[str, str], results: list[Check]) -> None:
    main = t.get("main", "")
    cards = t.get("cards", "")
    show_body = function_body(main, "_show_level_card")
    apply_body = function_body(main, "_apply_card_choice")
    record_body = function_body(main, "_record_card_choice")
    reset_body = function_body(main, "_reset_player_stats")
    restart_body = function_body(main, "_restart")
    card_meta_mix = any(token in cards for token in ["MetaProgression", "meta_progression", "FileAccess", "ConfigFile", "user://"])

    add(results, "PASS" if "const CARDS := [" in cards and "static func pick_three" in cards else "FAIL", "level cards", "level_up_cards.gd owns runtime card definitions and picker")
    add(
        results,
        "PASS" if has_all(show_body, ['match_state = "level_up"', "paused_for_card = true", "LevelUpCards.pick_three"]) else "FAIL",
        "level cards",
        "main shows runtime cards through level_up state",
    )
    add(
        results,
        "PASS" if has_all(apply_body, ["_record_card_choice", "_apply_card_effect", 'match_state = "playing"', "paused_for_card = false"]) else "FAIL",
        "level cards",
        "card choice applies runtime effect then returns to playing",
    )
    add(
        results,
        "PASS" if has_all(record_body, ["card_counts", "build_counts"]) else "FAIL",
        "level cards",
        "runtime card/build counts are tracked in player_stats",
    )
    add(
        results,
        "PASS" if has_all(reset_body, ['"card_counts": {}', '"build_counts": {}']) and "_reset_player_stats()" in restart_body else "FAIL",
        "level cards",
        "runtime card stats reset on restart",
    )
    add(
        results,
        "PASS" if not card_meta_mix else "FAIL",
        "level cards",
        "level card catalog is not coupled to meta progression or save APIs",
    )


def check_boss_reward(t: dict[str, str], results: list[Check]) -> None:
    main = t.get("main", "")
    meta = t.get("meta", "")
    boss = t.get("boss", "")
    world = t.get("world_story", "")
    system = t.get("system", "")
    result = t.get("result", "")
    finish_body = function_body(main, "_finish_match")
    recall_body = function_body(meta, "record_boss_recall")
    victory_body = function_body(meta, "record_boss_victory")
    outcome_body = function_body(meta, "set_smile_home_boss_outcome")
    core_body = function_body(result, "_campaign_core_fragment_reward", static=True)

    add(results, "PASS" if 'const BOSS_NAME := "스마일 홈 시어머니"' in boss else "FAIL", "boss reward", "first boss display name is 스마일 홈 시어머니")
    add(
        results,
        "PASS" if "캠페인 송출관" in world and "상위 결절" in world and "후속 목표" in world else "FAIL",
        "boss reward",
        "campaign broadcaster is documented as higher signal/follow-up objective",
    )
    add(
        results,
        "PASS" if has_all(finish_body, ["record_boss_recall", "record_boss_victory", 'result_state == "boss_victory"', 'boss_result_reason == "boss_recall"']) else "FAIL",
        "boss reward",
        "boss_victory and boss_recall meta rewards are separated",
    )
    add(
        results,
        "PASS" if has_all(recall_body, ["boss_hp_ratio <= 0.65", "boss_hp_ratio <= 0.25", "fragments_awarded"]) else "FAIL",
        "boss reward",
        "boss recall reward is HP threshold based",
    )
    add(
        results,
        "PASS" if has_all(victory_body, ["boss_clear_count", "fragments", "TRACE_CAMPAIGN_CORE_FRAGMENT"]) else "FAIL",
        "boss reward",
        "boss victory reward has distinct clear/fragments path",
    )
    add(
        results,
        "PASS" if has_all(meta + boss + outcome_body, ["destroy_node", "extract_memory", "set_smile_home_boss_outcome"]) else "FAIL",
        "boss reward",
        "destroy_node and extract_memory outcome hooks exist",
    )
    no_encounter_fragment_doc = (
        "보스 조우만으로 코어 파편 지급 금지" in system
        or "보스 조우만으로 코어 파편 지급 없음" in system
        or "보스 조우만으로 코어 파편을 주지 않는다" in system
    )
    add(
        results,
        "PASS" if not any(needle in core_body for needle in ["BOSS_NAME", "boss.active", "boss_active", "encounter"]) and no_encounter_fragment_doc else "FAIL",
        "boss reward",
        "boss encounter alone does not grant fragments",
    )


def check_ui_debug_boundary(t: dict[str, str], results: list[Check]) -> None:
    system = t.get("system", "")
    config = t.get("config", "")
    debug = t.get("debug", "")
    main = t.get("main", "")
    hud = t.get("hud", "")

    add(results, "PASS" if "DEBUG_TOOLS_ENABLED" in config else "FAIL", "ui/debug", "DEBUG_TOOLS_ENABLED exists")
    add(
        results,
        "PASS" if has_all(debug, ["if not C.DEBUG_TOOLS_ENABLED", "KEY_F12", "outpost", "r01"]) else "FAIL",
        "ui/debug",
        "F12/debug tools gate outpost/R01 internal info",
    )
    add(
        results,
        "PASS" if has_all(main, ["_debug_overlay_text", "C.DEBUG_TOOLS_ENABLED", "debug_tools.detail_debug_visible"]) else "FAIL",
        "ui/debug",
        "main only builds detailed debug overlay behind debug gate",
    )
    add(
        results,
        "PASS" if has_all(system, ["일반 UI에 internal id", "debug label", "F12"]) else "FAIL",
        "ui/debug",
        "internal-id/debug-only UI boundary is documented",
    )
    add(
        results,
        "PASS" if "set_debug_text" in hud and "debug_panel" in hud else "FAIL",
        "ui/debug",
        "HUD has dedicated debug text surface",
    )


def print_results(results: list[Check]) -> None:
    print("# Logic Invariant Check\n")
    width_status = max(len(r.status) for r in results)
    width_category = max(len(r.category) for r in results)
    for result in results:
        print(f"{result.status:<{width_status}} {result.category:<{width_category}}: {result.message}")

    counts = {status: sum(1 for r in results if r.status == status) for status in ["PASS", "WARN", "FAIL"]}
    print("\n# Summary")
    print(f"PASS {counts['PASS']}")
    print(f"WARN {counts['WARN']}")
    print(f"FAIL {counts['FAIL']}")


def main() -> int:
    texts: dict[str, str] = {}
    results: list[Check] = []
    check_files(texts, results)

    if any(r.status == "FAIL" and r.category == "files" for r in results):
        print_results(results)
        return 1

    check_result_routing(texts, results)
    check_reward_economy(texts, results)
    check_signal_and_boss_route(texts, results)
    check_meta_progression(texts, results)
    check_level_card_separation(texts, results)
    check_boss_reward(texts, results)
    check_ui_debug_boundary(texts, results)
    print_results(results)
    return 1 if any(r.status == "FAIL" for r in results) else 0


if __name__ == "__main__":
    raise SystemExit(main())
