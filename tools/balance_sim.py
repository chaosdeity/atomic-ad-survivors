#!/usr/bin/env python3
"""Combat balance tables for the Godot prototype.

The simulator reads the current combat constants from the Godot scripts where
possible, then prints markdown tables that are easy to paste into balance notes.
"""

from __future__ import annotations

import math
import re
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
GAME_CONFIG = ROOT / "scripts" / "game_config.gd"
ENEMY_CONTROLLER = ROOT / "scripts" / "enemy_controller.gd"
LEVEL_UP_CARDS = ROOT / "scripts" / "level_up_cards.gd"

ENEMY_ORDER = ["basic", "fast", "tank", "signal", "elite"]

DEFENSE_TYPES = {
    "normal": {"auto": 1.00, "charge": 1.00, "focused": 1.00, "burst": 1.00, "puddle": 1.00},
    "anti_auto": {"auto": 0.58, "charge": 1.00, "focused": 1.00, "burst": 1.08, "puddle": 1.08},
    "anti_charge": {"auto": 1.00, "charge": 0.62, "focused": 0.62, "burst": 1.00, "puddle": 1.00},
    "plated": {"auto": 0.76, "charge": 0.76, "focused": 0.76, "burst": 0.76, "puddle": 0.76},
    "exposed_core": {"auto": 0.82, "charge": 1.00, "focused": 1.35, "burst": 1.00, "puddle": 1.00},
}


@dataclass(frozen=True)
class BalanceConfig:
    auto_damage: float
    auto_tick: float
    charge_damage: float
    focused_charge_damage: float
    charge_period: float
    enemy_hp: dict[str, float]
    enemy_defense: dict[str, str]
    auto_damage_card: float
    charge_damage_card: float


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def parse_const(text: str, name: str) -> float:
    pattern = rf"const\s+{re.escape(name)}\s*:=\s*([-+]?\d+(?:\.\d+)?)"
    match = re.search(pattern, text)
    if not match:
        raise ValueError(f"Could not find const {name}")
    return float(match.group(1))


def parse_role_hp_mults(text: str) -> dict[str, float]:
    role_stats_match = re.search(r"const\s+ROLE_STATS\s*:=\s*\{(?P<body>.*?)\n\}", text, re.S)
    if not role_stats_match:
        raise ValueError("Could not find ROLE_STATS")

    role_hp: dict[str, float] = {}
    for role, body in re.findall(r'"([^"]+)":\s*\{([^}]*)\}', role_stats_match.group("body")):
        hp_match = re.search(r'"hp":\s*([-+]?\d+(?:\.\d+)?)', body)
        if hp_match:
            role_hp[role] = float(hp_match.group(1))
    return role_hp


def parse_string_consts(text: str) -> dict[str, str]:
    return {
        name: value
        for name, value in re.findall(r"const\s+([A-Z0-9_]+)\s*:=\s*\"([^\"]+)\"", text)
    }


def parse_role_defenses(text: str) -> dict[str, str]:
    role_stats_match = re.search(r"const\s+ROLE_STATS\s*:=\s*\{(?P<body>.*?)\n\}", text, re.S)
    if not role_stats_match:
        raise ValueError("Could not find ROLE_STATS")

    string_consts = parse_string_consts(text)
    role_defenses: dict[str, str] = {}
    for role, body in re.findall(r'"([^"]+)":\s*\{([^}]*)\}', role_stats_match.group("body")):
        defense_match = re.search(r'"defense":\s*([A-Z0-9_"]+)', body)
        if defense_match:
            token = defense_match.group(1).strip('"')
            role_defenses[role] = string_consts.get(token, token)
    elite_match = re.search(r"const\s+ELITE_DEFENSE_TYPE\s*:=\s*([A-Z0-9_]+|\"[^\"]+\")", text)
    if elite_match:
        token = elite_match.group(1).strip('"')
        role_defenses["elite"] = string_consts.get(token, token)
    else:
        role_defenses["elite"] = "plated"
    return role_defenses


def parse_card_value(text: str, card_id: str) -> float:
    card_match = re.search(rf'"id":\s*"{re.escape(card_id)}".*?"value":\s*([-+]?\d+(?:\.\d+)?)', text, re.S)
    if not card_match:
        raise ValueError(f"Could not find card value for {card_id}")
    return float(card_match.group(1))


def load_config() -> BalanceConfig:
    game_config = read_text(GAME_CONFIG)
    enemy_controller = read_text(ENEMY_CONTROLLER)
    level_up_cards = read_text(LEVEL_UP_CARDS)

    base_dps = parse_const(game_config, "BASE_DPS")
    auto_tick = parse_const(game_config, "AUTO_TICK")
    enemy_base_hp = parse_const(game_config, "ENEMY_HP")
    elite_hp = parse_const(game_config, "ELITE_HP")
    charge_damage = parse_const(game_config, "CHARGE_DAMAGE")
    directed_bonus = parse_const(game_config, "DIRECTED_BONUS")
    charge_period = parse_const(game_config, "CHARGE_PERIOD")
    role_hp_mults = parse_role_hp_mults(enemy_controller)
    role_defenses = parse_role_defenses(enemy_controller)

    enemy_hp = {role: enemy_base_hp * role_hp_mults[role] for role in role_hp_mults}
    enemy_hp["elite"] = elite_hp

    return BalanceConfig(
        auto_damage=base_dps * auto_tick,
        auto_tick=auto_tick,
        charge_damage=charge_damage,
        focused_charge_damage=charge_damage * directed_bonus,
        charge_period=charge_period,
        enemy_hp=enemy_hp,
        enemy_defense=role_defenses,
        auto_damage_card=parse_card_value(level_up_cards, "auto_damage"),
        charge_damage_card=parse_card_value(level_up_cards, "charge_damage"),
    )


def shots_to_kill(hp: float, damage: float) -> int:
    if damage <= 0:
        return math.inf
    return max(0, math.ceil(hp / damage))


def ttk_for_auto(shots: int, auto_tick: float) -> float:
    if shots <= 0:
        return 0.0
    return shots * auto_tick


def casts_to_kill(hp: float, damage: float) -> int:
    if damage <= 0:
        return math.inf
    return max(0, math.ceil(hp / damage))


def repeated_charge_time(casts: int, charge_period: float) -> float:
    if casts <= 0:
        return 0.0
    return casts * charge_period


def fmt_num(value: float) -> str:
    if abs(value - round(value)) < 0.001:
        return str(int(round(value)))
    return f"{value:.2f}".rstrip("0").rstrip(".")


def fmt_sec(value: float) -> str:
    return f"{fmt_num(value)}s"


def effective_damage(config: BalanceConfig, enemy: str, damage_type: str, base_damage: float) -> float:
    defense = config.enemy_defense.get(enemy, "normal")
    return base_damage * DEFENSE_TYPES.get(defense, DEFENSE_TYPES["normal"]).get(damage_type, 1.0)


def markdown_table(headers: list[str], rows: list[list[object]]) -> str:
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    for row in rows:
        lines.append("| " + " | ".join(str(cell) for cell in row) + " |")
    return "\n".join(lines)


def base_ttk_table(config: BalanceConfig) -> str:
    rows: list[list[object]] = []
    for enemy in ENEMY_ORDER:
        hp = config.enemy_hp[enemy]
        auto_damage = effective_damage(config, enemy, "auto", config.auto_damage)
        charge_damage = effective_damage(config, enemy, "charge", config.charge_damage)
        focused_damage = effective_damage(config, enemy, "focused", config.focused_charge_damage)
        auto_shots = shots_to_kill(hp, auto_damage)
        after_charge = max(0.0, hp - charge_damage)
        after_focus = max(0.0, hp - focused_damage)
        rows.append(
            [
                enemy,
                config.enemy_defense.get(enemy, "normal"),
                fmt_num(hp),
                fmt_num(auto_damage),
                fmt_num(focused_damage),
                auto_shots,
                fmt_sec(ttk_for_auto(auto_shots, config.auto_tick)),
                shots_to_kill(after_charge, auto_damage),
                shots_to_kill(after_focus, auto_damage),
            ]
        )
    return markdown_table(
        ["enemy", "defense", "hp", "auto dmg", "focused dmg", "auto shots", "auto ttk", "normal charge + shots", "focused charge + shots"],
        rows,
    )


def charge_efficiency_table(config: BalanceConfig) -> str:
    rows: list[list[object]] = []
    for enemy in ENEMY_ORDER:
        hp = config.enemy_hp[enemy]
        charge_damage = effective_damage(config, enemy, "charge", config.charge_damage)
        focused_damage = effective_damage(config, enemy, "focused", config.focused_charge_damage)
        normal_casts = casts_to_kill(hp, charge_damage)
        focused_casts = casts_to_kill(hp, focused_damage)
        rows.append(
            [
                enemy,
                config.enemy_defense.get(enemy, "normal"),
                fmt_num(hp),
                fmt_num(charge_damage),
                fmt_num(focused_damage),
                normal_casts,
                fmt_sec(repeated_charge_time(normal_casts, config.charge_period)),
                focused_casts,
                fmt_sec(repeated_charge_time(focused_casts, config.charge_period)),
            ]
        )
    return markdown_table(
        ["enemy", "defense", "hp", "charge dmg", "focused dmg", "normal casts", "normal time", "focused casts", "focused time"],
        rows,
    )


def growth_stage_table(config: BalanceConfig) -> str:
    # Current card logic: main.gd adds level_up_cards.gd value to a cumulative
    # multiplier, then applies base_damage * (1.0 + multiplier).
    stages = [
        ("none", 0, 0),
        ("auto damage x1", 1, 0),
        ("auto damage x3", 3, 0),
        ("charge damage x1", 0, 1),
        ("charge damage x3", 0, 3),
        ("auto x3 + charge x3", 3, 3),
    ]
    auto_rows: list[list[object]] = []
    focus_rows: list[list[object]] = []
    for label, auto_cards, charge_cards in stages:
        auto_damage = config.auto_damage * (1.0 + config.auto_damage_card * auto_cards)
        charge_damage = config.charge_damage * (1.0 + config.charge_damage_card * charge_cards)
        focused_damage = config.focused_charge_damage * (1.0 + config.charge_damage_card * charge_cards)
        auto_row: list[object] = [label, fmt_num(auto_damage), fmt_num(charge_damage), fmt_num(focused_damage)]
        focus_row: list[object] = [label, fmt_num(auto_damage), fmt_num(focused_damage)]
        for enemy in ENEMY_ORDER:
            enemy_auto_damage = effective_damage(config, enemy, "auto", auto_damage)
            enemy_focused_damage = effective_damage(config, enemy, "focused", focused_damage)
            auto_shots = shots_to_kill(config.enemy_hp[enemy], enemy_auto_damage)
            auto_row.append(fmt_sec(ttk_for_auto(auto_shots, config.auto_tick)))

            cleanup_shots = shots_to_kill(max(0.0, config.enemy_hp[enemy] - enemy_focused_damage), enemy_auto_damage)
            focus_row.append(fmt_sec(ttk_for_auto(cleanup_shots, config.auto_tick)))
        auto_rows.append(auto_row)
        focus_rows.append(focus_row)

    auto_table = markdown_table(
        ["stage", "auto dmg", "charge dmg", "focused dmg", "basic ttk", "fast ttk", "tank ttk", "signal ttk", "elite ttk"],
        auto_rows,
    )
    focus_table = markdown_table(
        ["stage", "auto dmg", "focused dmg", "basic cleanup", "fast cleanup", "tank cleanup", "signal cleanup", "elite cleanup"],
        focus_rows,
    )
    return (
        "### Auto-only TTK\n\n"
        + auto_table
        + "\n\n### Focused charge opener + auto cleanup\n\n"
        + focus_table
    )


def defense_type_table(config: BalanceConfig) -> str:
    rows: list[list[object]] = []
    for defense, mults in DEFENSE_TYPES.items():
        auto_damage = config.auto_damage * mults["auto"]
        normal_charge = config.charge_damage * mults["charge"]
        focused_charge = config.focused_charge_damage * mults["focused"]
        burst_damage = 30.0 * mults["burst"]
        puddle_tick = 23.0 * 0.16 * mults["puddle"]
        basic_hp = config.enemy_hp["basic"]
        rows.append(
            [
                defense,
                fmt_num(auto_damage),
                fmt_num(normal_charge),
                fmt_num(focused_charge),
                fmt_num(burst_damage),
                fmt_num(puddle_tick),
                shots_to_kill(basic_hp, auto_damage),
                shots_to_kill(max(0.0, basic_hp - focused_charge), auto_damage),
                casts_to_kill(basic_hp, focused_charge),
            ]
        )
    return markdown_table(
        ["defense", "auto dmg", "normal charge", "focused charge", "burst", "puddle", "basic auto shots", "focus + shots", "focus casts"],
        rows,
    )


def findings(config: BalanceConfig) -> str:
    basic_hp = config.enemy_hp["basic"]
    basic_auto = effective_damage(config, "basic", "auto", config.auto_damage)
    basic_focus = effective_damage(config, "basic", "focused", config.focused_charge_damage)
    basic_survives_focus = basic_focus < basic_hp
    focused_followup = shots_to_kill(basic_hp - basic_focus, basic_auto)
    tank_auto = shots_to_kill(config.enemy_hp["tank"], effective_damage(config, "tank", "auto", config.auto_damage))
    signal_focus_cleanup = shots_to_kill(max(0.0, config.enemy_hp["signal"] - effective_damage(config, "signal", "focused", config.focused_charge_damage)), effective_damage(config, "signal", "auto", config.auto_damage))
    elite_focus = casts_to_kill(config.enemy_hp["elite"], effective_damage(config, "elite", "focused", config.focused_charge_damage))

    rows = [
        ["focused charge deletes basic?", "no" if basic_survives_focus else "yes", "target: no for weak first sortie"],
        ["basic follow-up after focus", f"{focused_followup} auto shot(s)", "keeps auto-fire relevant"],
        ["tank auto shots", tank_auto, "anti-auto armor pushes players toward charge, burst, or puddle"],
        ["signal focused opener cleanup", f"{signal_focus_cleanup} auto shot(s)", "exposed core rewards directional focus"],
        ["elite focused casts", elite_focus, "charge-only kill is intentionally slow"],
    ]
    return markdown_table(["check", "current", "note"], rows)


def main() -> None:
    config = load_config()
    print("# Combat Balance Simulation")
    print()
    print("## Base TTK")
    print()
    print(base_ttk_table(config))
    print()
    print("## Charge Efficiency")
    print()
    print(charge_efficiency_table(config))
    print()
    print("## Growth Stages")
    print()
    print(growth_stage_table(config))
    print()
    print("## Defense Type Preview")
    print()
    print(defense_type_table(config))
    print()
    print("## Current Findings")
    print()
    print(findings(config))


if __name__ == "__main__":
    main()
