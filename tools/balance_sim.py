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
BOSS_CONTROLLER = ROOT / "scripts" / "boss_controller.gd"
META_PROGRESSION = ROOT / "scripts" / "meta_progression.gd"
LOCAL_RESPONSE_STATE = ROOT / "scripts" / "local_response_state.gd"
R01_LAYOUT_BLOCKOUT = ROOT / "scripts" / "r01_layout_blockout.gd"

ENEMY_ORDER = ["basic", "fast", "tank", "signal", "elite"]
SPECIAL_ENEMY_ORDER = ["speaker", "charger"]

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
    boss_hp: float
    player_max_hp: float


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


def parse_meta_upgrades(text: str) -> list[dict[str, object]]:
    upgrades_match = re.search(r"const\s+UPGRADES\s*:=\s*\[(?P<body>.*?)\n\]", text, re.S)
    if not upgrades_match:
        raise ValueError("Could not find UPGRADES")

    upgrades: list[dict[str, object]] = []
    for body in re.findall(r"\{(.*?)\}", upgrades_match.group("body"), re.S):
        item: dict[str, object] = {}
        for key, raw_value in re.findall(r'"([^"]+)":\s*("[^"]*"|[^,\n]+)', body):
            value = raw_value.strip()
            if value.startswith('"') and value.endswith('"'):
                item[key] = value.strip('"')
            elif re.match(r"[-+]?\d+(?:\.\d+)?$", value):
                item[key] = float(value) if "." in value else int(value)
            else:
                item[key] = value
        if item:
            upgrades.append(item)
    return upgrades


def load_config() -> BalanceConfig:
    game_config = read_text(GAME_CONFIG)
    enemy_controller = read_text(ENEMY_CONTROLLER)
    level_up_cards = read_text(LEVEL_UP_CARDS)
    boss_controller = read_text(BOSS_CONTROLLER) if BOSS_CONTROLLER.exists() else ""

    base_dps = parse_const(game_config, "BASE_DPS")
    auto_tick = parse_const(game_config, "AUTO_TICK")
    enemy_base_hp = parse_const(game_config, "ENEMY_HP")
    elite_hp = parse_const(game_config, "ELITE_HP")
    player_max_hp = parse_const(game_config, "PLAYER_MAX_HP")
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
        auto_damage_card=0.0,
        charge_damage_card=0.40 if '"id": "terms_no_return_agreement"' in level_up_cards else 0.20,
        boss_hp=parse_const(boss_controller, "MAX_HP") if boss_controller else 1750.0,
        player_max_hp=player_max_hp,
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


def special_enemy_role_table(config: BalanceConfig) -> str:
    behavior_notes = {
        "speaker": "periodic ad pulse; nearby enemies gain slight speed until the ring fades",
        "charger": "windup line then straight dash; sidestep or slow/charge to punish",
    }
    rows: list[list[object]] = []
    for enemy in SPECIAL_ENEMY_ORDER:
        hp = config.enemy_hp.get(enemy)
        if hp is None:
            continue
        auto_damage = effective_damage(config, enemy, "auto", config.auto_damage)
        focused_damage = effective_damage(config, enemy, "focused", config.focused_charge_damage)
        rows.append(
            [
                enemy,
                config.enemy_defense.get(enemy, "normal"),
                fmt_num(hp),
                fmt_num(auto_damage),
                fmt_num(focused_damage),
                behavior_notes.get(enemy, ""),
            ]
        )
    return markdown_table(
        ["role", "defense", "hp", "auto dmg", "focused dmg", "behavior note"],
        rows,
    )


def battlefield_threat_table() -> str:
    rows = [
        ["pressure ring", "150s+", "1.08s warning", "15 damage + knockback", "single active ring; sidestep before collapse"],
        ["danger flyer drop", "150s+ with speaker/signal or model house", "0.82s warning", "10 damage", "max two active drops; clearer in finale"],
        ["finale pressure", "270s+", "shorter intervals", "same damage", "frequency rises without changing boss route or rewards"],
    ]
    return markdown_table(["threat", "starts", "telegraph", "hit effect", "fairness note"], rows)


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


def meta_progression_table(config: BalanceConfig) -> str:
    rows: list[list[object]] = []
    stages = [
        ("no meta", 0.0, 0.0, 0.0, "first-sortie baseline"),
        ("auto +1", 1.0, 0.0, 0.0, "광고 잔상 해독"),
        ("charge +2", 0.0, 2.0, 0.0, "수동 송출 안정화"),
        ("hp +5", 0.0, 0.0, 5.0, "보급소 응급처치; TTK unchanged"),
    ]
    for label, auto_bonus, charge_bonus, hp_bonus, note in stages:
        auto_damage = config.auto_damage + auto_bonus
        charge_damage = config.charge_damage + charge_bonus
        focused_damage = charge_damage * (config.focused_charge_damage / config.charge_damage)

        basic_auto = effective_damage(config, "basic", "auto", auto_damage)
        tank_auto = effective_damage(config, "tank", "auto", auto_damage)
        signal_auto = effective_damage(config, "signal", "auto", auto_damage)
        signal_focus = effective_damage(config, "signal", "focused", focused_damage)
        elite_focus = effective_damage(config, "elite", "focused", focused_damage)

        rows.append(
            [
                label,
                fmt_num(100.0 + hp_bonus),
                fmt_num(auto_damage),
                fmt_num(charge_damage),
                fmt_num(focused_damage),
                fmt_sec(ttk_for_auto(shots_to_kill(config.enemy_hp["basic"], basic_auto), config.auto_tick)),
                fmt_sec(ttk_for_auto(shots_to_kill(config.enemy_hp["tank"], tank_auto), config.auto_tick)),
                shots_to_kill(max(0.0, config.enemy_hp["signal"] - signal_focus), signal_auto),
                casts_to_kill(config.enemy_hp["elite"], elite_focus),
                note,
            ]
        )
    return markdown_table(
        ["meta stage", "max hp", "auto dmg", "charge dmg", "focused dmg", "basic auto ttk", "tank auto ttk", "signal focus cleanup", "elite focus casts", "note"],
        rows,
    )


def meta_upgrade_tree_table() -> str:
    upgrades = parse_meta_upgrades(read_text(META_PROGRESSION))
    rows: list[list[object]] = []
    for index, upgrade in enumerate(upgrades, start=1):
        rows.append([
            index,
            upgrade.get("category", "미분류"),
            upgrade.get("name", ""),
            upgrade.get("cost", 0),
            "파편" if str(upgrade.get("trace", "")).endswith("CAMPAIGN_CORE_FRAGMENT") else str(upgrade.get("trace_label", "전단")),
            upgrade.get("max_level", 1),
            upgrade.get("unlock_condition", "-"),
            upgrade.get("effect_text", ""),
        ])
    return markdown_table(["#", "category", "upgrade", "cost", "trace", "max", "unlock", "effect"], rows)


def meta_upgrade_effect_preview(config: BalanceConfig) -> str:
    upgrades = parse_meta_upgrades(read_text(META_PROGRESSION))
    totals = {
        "auto_damage_bonus": 0.0,
        "auto_range_bonus": 0.0,
        "charge_damage_bonus": 0.0,
        "charge_period_bonus": 0.0,
        "charge_window_bonus": 0.0,
        "max_hp_bonus": 0.0,
        "xp_gain_mult": 0.0,
        "core_expose_bonus": 0.0,
        "elite_damage_mult": 0.0,
        "boss_shield_damage_mult": 0.0,
        "low_hp_damage_reduction": 0.0,
    }
    for upgrade in upgrades:
        level = int(upgrade.get("max_level", 1))
        for key in totals:
            totals[key] += float(upgrade.get(key, 0.0)) * level

    capped_charge_period = max(1.2, config.charge_period + totals["charge_period_bonus"])
    rows = [
        ["upgrade count", len(upgrades), "target >= 12"],
        ["max hp", fmt_num(config.player_max_hp + totals["max_hp_bonus"]), f"+{fmt_num(totals['max_hp_bonus'])} if fully bought"],
        ["auto damage", fmt_num(config.auto_damage + totals["auto_damage_bonus"]), "flat meta only; card multipliers remain run-local"],
        ["auto range", f"+{fmt_num(totals['auto_range_bonus'])}", "range gain is utility, not raw DPS"],
        ["charge damage", fmt_num(config.charge_damage + totals["charge_damage_bonus"]), "flat meta only"],
        ["charge period", f"{fmt_sec(config.charge_period)} -> {fmt_sec(capped_charge_period)}", "floor remains 1.2s"],
        ["charge window", f"+{fmt_sec(totals['charge_window_bonus'])}", "input leniency only"],
        ["xp gain", f"+{fmt_num(totals['xp_gain_mult'] * 100.0)}%", "accelerates card access"],
        ["core expose", f"+{fmt_sec(totals['core_expose_bonus'])}", "boss response window, not boss HP reduction"],
        ["elite direct damage", f"+{fmt_num(totals['elite_damage_mult'] * 100.0)}%", "direct-hit only"],
        ["boss shield direct damage", f"+{fmt_num(totals['boss_shield_damage_mult'] * 100.0)}%", "shield-state only"],
        ["low HP damage taken", f"-{fmt_num(totals['low_hp_damage_reduction'] * 100.0)}%", "only under 35% HP"],
    ]
    return markdown_table(["preview", "value", "note"], rows)


def build_preview_table(config: BalanceConfig) -> str:
    auto_damage = config.auto_damage * (1.0 + config.auto_damage_card * 2)
    auto_split_damage = auto_damage * 0.70
    charge_damage = config.charge_damage * (1.0 + config.charge_damage_card * 2)
    focused_damage = config.focused_charge_damage * (1.0 + config.charge_damage_card * 2)
    charge_period = max(1.2, config.charge_period - 0.4)
    burst_damage = 30.0
    puddle_dps = 23.0 * 1.10
    residue_total = (10.0 + 3.0) * 1.05

    rows = [
        [
            "Auto",
            "auto damage x2 + split shot",
            fmt_num(auto_damage),
            fmt_sec(ttk_for_auto(shots_to_kill(config.enemy_hp["basic"], auto_damage), config.auto_tick)),
            "split cadence improves to every 3 shots; secondary hit ~%s" % fmt_num(auto_split_damage),
        ],
        [
            "Charge",
            "charge damage x2 + cooldown",
            "%s focused / %ss period" % (fmt_num(focused_damage), fmt_num(charge_period)),
            "%s cleanup shot(s)" % shots_to_kill(max(0.0, config.enemy_hp["signal"] - effective_damage(config, "signal", "focused", focused_damage)), effective_damage(config, "signal", "auto", config.auto_damage)),
            "2+ charge tags add a small focused follow-through hit (~%s)" % fmt_num(focused_damage * 0.28),
        ],
        [
            "Area",
            "burst + puddle",
            "%s burst / %s puddle dps" % (fmt_num(burst_damage), fmt_num(puddle_dps)),
            "basic survives burst alone: %s" % ("yes" if burst_damage < config.enemy_hp["basic"] else "no"),
            "burst can leave a short residue puddle; expected residue total ~%s before defense" % fmt_num(residue_total),
        ],
        [
            "Survival",
            "max HP + heal + emergency",
            "120 max hp / 8 low-HP heal",
            "TTK unchanged",
            "low HP lowers charge-heal threshold by 1 so the recovery feedback appears sooner",
        ],
    ]
    return markdown_table(["build", "preview package", "headline number", "TTK/effect", "expected note"], rows)


def preboss_progression_table() -> str:
    rows = [
        ["sortie 1", "forced recall", "1.00x", "warning 70s, surge 88s, recall ~108s"],
        ["sortie 2", "baseline 5-min run", "1.00x", "faint boss signal event at 120s"],
        ["sortie 3", "signal/tank pressure", "~1.05x after 150s", "+tank/+signal weights after 150s; detected event at 180s"],
        ["sortie 4", "boss signal near", "~1.11x after 210s", "+elite chance/+signal weight after 210s; near event at 240s"],
    ]
    return markdown_table(["session step", "preboss role", "wave pressure note", "expected event"], rows)


def first_boss_preview_table(config: BalanceConfig) -> str:
    hp = config.boss_hp
    plated_auto = config.auto_damage * DEFENSE_TYPES["plated"]["auto"]
    plated_charge = config.charge_damage * DEFENSE_TYPES["plated"]["charge"]
    exposed_auto = config.auto_damage * DEFENSE_TYPES["exposed_core"]["auto"]
    exposed_focus = config.focused_charge_damage * DEFENSE_TYPES["exposed_core"]["focused"]
    anti_charge_auto = config.auto_damage * DEFENSE_TYPES["anti_charge"]["auto"]
    anti_charge_focus = config.focused_charge_damage * DEFENSE_TYPES["anti_charge"]["focused"]
    distortion_window = 5.0
    distortion_auto_shots = math.floor(distortion_window / config.auto_tick)
    distortion_auto_damage = distortion_auto_shots * anti_charge_auto
    focused_loss = config.focused_charge_damage - anti_charge_focus
    demo_hit_damage = 34.0
    demo_hits_to_danger = math.floor(config.player_max_hp / demo_hit_damage) + 1
    demo_core_window = 2.2
    demo_auto_shots = math.floor(demo_core_window / config.auto_tick)
    demo_window_damage = exposed_focus + demo_auto_shots * exposed_auto
    exposed_window = 2.0
    exposed_auto_shots = math.floor(exposed_window / config.auto_tick)
    exposed_window_damage = exposed_focus + exposed_auto_shots * exposed_auto
    rows = [
        [
            "auto-only vs plated",
            fmt_num(plated_auto),
            f"{shots_to_kill(hp, plated_auto)} shots",
            fmt_sec(ttk_for_auto(shots_to_kill(hp, plated_auto), config.auto_tick)),
            "too slow alone; confirms boss is not a raw auto DPS check",
        ],
        [
            "normal charge vs plated",
            fmt_num(plated_charge),
            f"{casts_to_kill(hp, plated_charge)} casts",
            fmt_sec(repeated_charge_time(casts_to_kill(hp, plated_charge), config.charge_period)),
            "charge-only remains inefficient outside response windows",
        ],
        [
            "focused charge during exposed_core",
            fmt_num(exposed_focus),
            f"{casts_to_kill(hp, exposed_focus)} casts",
            fmt_sec(repeated_charge_time(casts_to_kill(hp, exposed_focus), config.charge_period)),
            "core exposure gives a visible directional-charge reward",
        ],
        [
            "one exposed window",
            f"{fmt_num(exposed_focus)} focus + {exposed_auto_shots} autos",
            fmt_num(exposed_window_damage),
            f"{fmt_num(exposed_window_damage / hp * 100.0)}% boss HP",
            "rough 2s window expectation before cards/meta bonuses",
        ],
        [
            "auto during happiness reset",
            fmt_num(anti_charge_auto),
            f"{distortion_auto_shots} shots",
            fmt_num(distortion_auto_damage),
            "stable 5s damage while charge is resisted",
        ],
        [
            "focused charge during happiness reset",
            fmt_num(anti_charge_focus),
            f"-{fmt_num(focused_loss)} vs normal focus",
            f"{fmt_num(anti_charge_focus / config.focused_charge_damage * 100.0)}% efficiency",
            "family-pressure state makes blind charge timing a bad trade",
        ],
        [
            "home inspection charge hit",
            fmt_num(demo_hit_damage),
            f"{demo_hits_to_danger} hits down base HP",
            f"{fmt_num(demo_hit_damage / config.player_max_hp * 100.0)}% player HP",
            "threatening but not an instant failure from full HP",
        ],
        [
            "home inspection recover core",
            f"{fmt_num(exposed_focus)} focus + {demo_auto_shots} autos",
            fmt_num(demo_window_damage),
            f"{fmt_num(demo_window_damage / hp * 100.0)}% boss HP",
            "2.2s counter window rewards dodging across the rail",
        ],
    ]
    return markdown_table(["scenario", "hit value", "count", "time/value", "note"], rows)


def boss_analysis_upgrade_table(config: BalanceConfig) -> str:
    hp = config.boss_hp
    exposed_auto = config.auto_damage * DEFENSE_TYPES["exposed_core"]["auto"]
    exposed_focus = config.focused_charge_damage * DEFENSE_TYPES["exposed_core"]["focused"]
    core_bonus = 0.2
    rows = []
    for label, base_window in [
        ("standard core expose", 2.0),
        ("home inspection recover core", 2.2),
    ]:
        base_autos = base_window / config.auto_tick
        boosted_window = base_window + core_bonus
        boosted_autos = boosted_window / config.auto_tick
        base_damage = exposed_focus + base_autos * exposed_auto
        boosted_damage = exposed_focus + boosted_autos * exposed_auto
        rows.append([
            label,
            f"{fmt_num(base_window)}s -> {fmt_num(boosted_window)}s",
            f"{fmt_num(base_damage)} -> {fmt_num(boosted_damage)}",
            f"+{fmt_num(boosted_damage - base_damage)}",
            f"{fmt_num(boosted_damage / hp * 100.0)}% boss HP",
        ])
    return markdown_table(["window", "duration", "expected damage", "gain", "boosted share"], rows)


def boss_victory_reward_table() -> str:
    rows = [
        [
            "smile home node clear",
            "campaign_core_fragment +2",
            "boss analysis set to 3/3",
            "returns to Silence Outpost as a node-processing result",
        ],
        [
            "repeat node clear",
            "campaign_core_fragment +2",
            "clear count increments",
            "keeps boss rematches useful without save/load",
        ],
    ]
    return markdown_table(["event", "trace reward", "analysis state", "loop note"], rows)


def smile_home_outcome_table() -> str:
    rows = [
        ["none", "스마일 홈 결절 처리 방식 선택 대기", "post-node hook is open; no hidden state shown"],
        ["destroy_node", "결절 파괴", "스마일 홈의 결절을 끊어냈습니다."],
        ["extract_memory", "기억 추출", "가족사진 뒤편의 기억을 보급소로 가져왔습니다."],
    ]
    return markdown_table(["state", "label", "display note"], rows)


def local_response_state_preview_table() -> str:
    source = read_text(LOCAL_RESPONSE_STATE) if LOCAL_RESPONSE_STATE.exists() else ""
    max_records_match = re.search(r"R01_MAX_SIGNAL_RECORDS\s*:=\s*(\d+)", source)
    max_pressure_match = re.search(r"R01_MAX_CAMPAIGN_PRESSURE\s*:=\s*(\d+)", source)
    max_records = max_records_match.group(1) if max_records_match else "3"
    max_pressure = max_pressure_match.group(1) if max_pressure_match else "5"
    rows = [
        ["visit", "record_r01_visit()", "increments once per sortie hook; no reward payout"],
        ["signal records", f"0..{max_records}", "mirrors current story clues; records are not spent"],
        ["boss outcome", "none / destroy_node / extract_memory", "synced from smile_home_boss_outcome"],
        ["campaign pressure", f"0..{max_pressure}", "hidden debug band from records, outcome, campaign-use traces"],
        ["trace choice", "preserve / consume / campaign_use", "aggregate counters only; no trace UI or payout here"],
    ]
    return markdown_table(["state area", "preview", "boundary note"], rows)


def route_phrase_preview_table() -> str:
    rows = [
        ["records=0 / outcome=none", "외곽 주택가의 신호 이벤트를 추적한다.", "외곽 주택가 신호는 아직 가족 광고의 외피를 유지 중이다."],
        ["records=1 / outcome=none", "첫 잡음 영수증을 보급소 기록판에 고정했다. 다음 신호는 더 긴 광고 뒤에 숨어 있다.", "외곽 주택가 신호는 아직 가족 광고의 외피를 유지 중이다."],
        ["records=2 / outcome=none", "길 잃은 카탈로그가 주택가 루프의 방향을 맞추기 시작했다.", "외곽 주택가 신호는 아직 가족 광고의 외피를 유지 중이다."],
        ["records=3 / outcome=none", "개장 전 점검표가 스마일 홈 심사관 접근 절차를 확정했다. 중심 결절을 노출시킨다.", "외곽 주택가 신호는 아직 가족 광고의 외피를 유지 중이다."],
        ["records=3 / outcome=destroy_node", "스마일 홈의 낮아진 광고음 사이로 남은 결절 잔향을 확인한다.", "스마일 홈의 광고음이 한 겹 낮아졌다."],
        ["records=3 / outcome=extract_memory", "가족사진 뒤편의 상위 송출 잔향을 대조한다.", "이름 보관함 뒤편에서 낡은 가족사진 냄새가 난다."],
        ["post-boss followup", "스마일 홈 결절 처리 기록을 바탕으로 상위 송출 잔향을 추적한다.", "캠페인 송출관은 후속 신호 문맥으로만 표시"],
    ]
    return markdown_table(["state", "sortie board / next goal", "outpost phrase note"], rows)


def finale_recovery_phrase_preview_table() -> str:
    rows = [
        ["records=0", "정상 회수", "침묵 보급소가 외곽 주택가의 회수선을 고정했습니다. 주택가의 광고음은 아직 윤서의 이름을 정확히 발음하지 못합니다.", "다음 출격: 첫 신호 이벤트 추적"],
        ["records=1", "정상 회수", "첫 잡음 영수증이 끊기기 전에 회수됐습니다. 다음 광고는 더 긴 문장 뒤에 숨어 있습니다.", "다음 출격: 두 번째 신호 기록 추적"],
        ["records=2", "정상 회수", "길 잃은 카탈로그가 모델하우스 쪽으로 접혔습니다. 아직 마지막 절차가 빠져 있습니다.", "다음 출격: 모델하우스 접근 신호 확인"],
        ["records=3", "정상 회수", "개장 전 점검표가 완성됐습니다. 외곽 주택가 중앙의 모델하우스 결절이 다음 출격을 기다립니다.", "다음 출격: 모델하우스 결절 접근 준비"],
        ["first forced recall", "신호 과부하 긴급 인양", "캠페인이 윤서의 이름과 주소를 등록하기 직전, 침묵 보급소가 회수선을 당겼습니다.", "first sortie only"],
    ]
    return markdown_table(["state", "result title", "description preview", "progress note"], rows)


def boss_enrage_preview_table() -> str:
    rows = [
        [
            "phase threshold",
            "25% HP",
            "phase 3",
            "final family inspection begins; no new pattern rules",
        ],
        [
            "pattern cooldown",
            "1.7s -> 0.95s",
            "44% shorter rest",
            "pressure rises through cadence instead of raw damage",
        ],
        [
            "telegraphs",
            "table/inspection/happiness 1.25/1.25/1.15 -> 1.05/1.05/0.95",
            "still readable",
            "finale asks mastery of known tells",
        ],
        [
            "core windows",
            "-0.25s before meta bonus",
            "minimum 1.15s",
            "keeps core reward but removes long free damage",
        ],
        [
            "shields",
            "54 -> 46.4 HP",
            "faster to break",
            "higher pace without creating a wall at the finish",
        ],
    ]
    return markdown_table(["knob", "value", "effect", "design note"], rows)


def r01_collision_nav_preview_table() -> str:
    source = read_text(R01_LAYOUT_BLOCKOUT) if R01_LAYOUT_BLOCKOUT.exists() else ""
    class_by_kind: dict[str, str] = {}
    for kind, class_token in re.findall(r'"([^"]+)":\s*\{"collision_class":\s*COLLISION_([A-Z]+)', source):
        class_by_kind[kind] = {
            "HARD": "hard_blocker",
            "SOFT": "soft_blocker",
            "HAZARD": "passable_hazard",
            "TRIGGER": "trigger",
            "NONE": "no_collision",
        }.get(class_token, class_token.lower())

    counts = {
        "hard_blocker": 0,
        "soft_blocker": 0,
        "passable_hazard": 0,
        "trigger": 0,
        "no_collision": 0,
    }
    for kind in re.findall(r'"kind":\s*"([^"]+)"', source):
        collision_class = class_by_kind.get(kind, "no_collision")
        counts[collision_class] = counts.get(collision_class, 0) + 1

    rows = [
        ["blockers count", counts["hard_blocker"], "house/model node structures block player and enemy"],
        ["soft blockers count", counts["soft_blocker"], "mailbox/sign style path pressure; not a wall"],
        ["hazards count", counts["passable_hazard"], "flyer/slime/floor-plan warnings stay passable"],
        ["triggers count", counts["trigger"], "signal/phrase/event anchors only"],
        ["no collision count", counts["no_collision"], "tiny paper/decal density layer"],
        ["30 enemy probe", "pass", "baseline runtime probe target: no early hard-stuck enemies"],
        ["100 enemy probe", "warning/pass", "acceptable only if stuck count remains low and lanes stay readable"],
        ["300 enemy probe", "warning/pass", "density/pathing preview only; no HP/no AI density layer"],
        ["model_house_node", "pass target", "boss/elite/objective anchor must keep wide access"],
        ["fake_return_route", "pass target", "trigger/phrase route; never a recovery UI"],
    ]
    return markdown_table(["preview", "value", "note"], rows)


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
    print("## Special Enemy Role Preview")
    print()
    print(special_enemy_role_table(config))
    print()
    print("## Battlefield Threat Preview")
    print()
    print(battlefield_threat_table())
    print()
    print("## Growth Stages")
    print()
    print(growth_stage_table(config))
    print()
    print("## Defense Type Preview")
    print()
    print(defense_type_table(config))
    print()
    print("## Meta Progression Preview")
    print()
    print(meta_progression_table(config))
    print()
    print("## Meta Upgrade Tree")
    print()
    print(meta_upgrade_tree_table())
    print()
    print("## Meta Upgrade Effect Preview")
    print()
    print(meta_upgrade_effect_preview(config))
    print()
    print("## Build Preview")
    print()
    print(build_preview_table(config))
    print()
    print("## Preboss Progression Preview")
    print()
    print(preboss_progression_table())
    print()
    print("## First Boss Skeleton Preview")
    print()
    print(first_boss_preview_table(config))
    print()
    print("## Boss Analysis Upgrade Preview")
    print()
    print(boss_analysis_upgrade_table(config))
    print()
    print("## Boss Node Result Preview")
    print()
    print(boss_victory_reward_table())
    print()
    print("## Smile Home Outcome Preview")
    print()
    print(smile_home_outcome_table())
    print()
    print("## R01 Local Response State Preview")
    print()
    print(local_response_state_preview_table())
    print()
    print("## R01 Route Phrase Preview")
    print()
    print(route_phrase_preview_table())
    print()
    print("## R01 Finale Recovery Phrase Preview")
    print()
    print(finale_recovery_phrase_preview_table())
    print()
    print("## Boss Enrage Preview")
    print()
    print(boss_enrage_preview_table())
    print()
    print("## R01 Collision/Nav Preview")
    print()
    print(r01_collision_nav_preview_table())
    print()
    print("## Current Findings")
    print()
    print(findings(config))


if __name__ == "__main__":
    main()
