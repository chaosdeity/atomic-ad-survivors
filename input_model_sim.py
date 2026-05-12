#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
입력 모델 비교 시뮬레이터
2D 탑다운 생존 로그라이크 (Brotato/Vampire Survivors 계열, 모바일 우선)용
4개 입력 모델 x 3개 플레이어 유형 = 12개 조합 비교.

실행: python input_model_sim.py
의존성: Python 3.8+ 표준 라이브러리만.

게임필(feel), 학습 곡선, 모바일 터치 피로감, 시각적 만족도는 측정 불가.
이 결과는 사전 필터로만 사용하고 실제 플레이테스트로 검증할 것.
"""

from __future__ import annotations
import math
import random
import statistics
import time
from dataclasses import dataclass

# ===========================================================
# 매개변수 (디자이너가 조정 가능)
# ===========================================================

SIM_TRIALS         = 1000     # 조합당 시뮬 매치 수
MATCH_MAX_SEC      = 600      # 매치 최대 길이 (10분)
TICK_SEC           = 0.5      # 시뮬레이션 틱 길이 (s)
RNG_SEED           = 42

# 플레이어
PLAYER_HP_MAX      = 100.0

# 적 스폰
ENEMY_BASE_SPAWN   = 2.0      # 초당 적 스폰 (시작)
ENEMY_RAMP         = 0.006    # 시간 경과 시 추가 스폰 (v2: 0.012 -> 0.006)
ENEMY_MAX          = 150
ENEMY_HP           = 30.0
ENEMY_CONTACT_DPS  = 5.0      # 적 1마리 접촉 시 초당 피해 베이스
CONTACT_RATIO      = 0.08     # 현재 적 중 접촉 영역에 들어와 있는 평균 비율

# 보스
BOSS_SPAWN_SEC     = 300      # 보스 등장 시점 (v2: 480 -> 300)
BOSS_HP            = 60_000.0
BOSS_DAMAGE_SHARE  = 0.6      # 보스 등장 시 자동 발사 데미지 중 보스로 갈 비중

# 무기
BASE_DPS           = 100.0    # 모델 1 기준 자동 발사 DPS

# 모델 2/4/5 차징 윈도우
CHARGE_PERIOD      = 5.0      # 윈도우 등장 간격 (s)
CHARGE_WINDOW      = 1.0      # 탭 가능 시간 (s)
CHARGE_MULT        = 2.5      # 차징 성공 시 데미지 배수
CHARGE_AOE_TARGETS = 15       # 광역으로 즉살되는 평균 적 수 (v2: 4 -> 15)

# 모델 3/4 방향 집중
AIM_FOCUS_BONUS    = 1.60     # 콘 내 적에게 적용되는 DPS 배수
AIM_OFF_PENALTY    = 0.55     # 콘 밖 적에게 적용되는 DPS 배수
AIM_BASE_RATIO     = 0.33     # ±60도 = 360도의 33% — 무지향 시 콘 안에 들어가는 자연 비율
AIM_FOCUS_GAIN     = 0.45     # aim_acc에 비례한 추가 비율 (의도적 클러스터 조준)

# 플레이어 프로파일
PROFILES = {
    "캐주얼":   {"move_acc": 0.50, "charge_use": 0.30, "aim_acc": 0.60},
    "미드코어": {"move_acc": 0.75, "charge_use": 0.70, "aim_acc": 0.80},
    "코어":     {"move_acc": 0.95, "charge_use": 0.95, "aim_acc": 0.95},
}

MODELS = ["M1_자동", "M2_차징", "M3_방향", "M4_차징+방향", "M5_윈도우조준"]


def model_features(model: str) -> tuple:
    """(use_charge, use_persistent_aim, use_burst_aim) 반환.
    burst_aim = 차징 윈도우 동안만 방향 입력 받기 (모델 5)."""
    if model.startswith("M1"): return (False, False, False)
    if model.startswith("M2"): return (True,  False, False)
    if model.startswith("M3"): return (False, True,  False)
    if model.startswith("M4"): return (True,  True,  False)
    if model.startswith("M5"): return (True,  False, True)
    return (False, False, False)

# 스킬 천장 판정 임계값
SKILL_CEILING_THRESHOLD = 1.5  # 코어 DPS / 캐주얼 DPS

# ===========================================================
# 데이터 클래스
# ===========================================================

@dataclass
class MatchResult:
    survival_sec: float
    total_damage: float
    inputs_total: int
    peak_inputs_per_sec: float
    boss_killed: bool
    # 재미 프록시 (Csikszentmihalyi flow + variable reward 이론 기반)
    windows_opened:    int = 0   # 차징 윈도우 등장 수
    windows_attempted: int = 0   # 탭 시도 (참여)
    windows_succeeded: int = 0   # 차징 발동
    windows_directed:  int = 0   # M5: 방향 입력까지 성공 (에이전시)
    clutch_charges:    int = 0   # HP<30% 일 때 발동한 차징
    power_moments:     int = 0   # 현재 적의 30%+ 를 한 번에 청소


# ===========================================================
# 헬퍼
# ===========================================================

def poisson(lam: float, rng: random.Random) -> int:
    """Knuth 알고리즘. 작은 lam(<10)에 적합."""
    if lam <= 0:
        return 0
    L = math.exp(-lam)
    k = 0
    p = 1.0
    while True:
        k += 1
        p *= rng.random()
        if p <= L:
            return k - 1


def aim_dps_multiplier(profile: dict) -> float:
    """모델 3/4의 평균 DPS 멀티플라이어. 콘 안에 적이 얼마나 자주 들어오느냐의 기댓값."""
    cone_ratio = min(0.90, AIM_BASE_RATIO + AIM_FOCUS_GAIN * profile["aim_acc"])
    return cone_ratio * AIM_FOCUS_BONUS + (1.0 - cone_ratio) * AIM_OFF_PENALTY


# ===========================================================
# 핵심 시뮬레이션
# ===========================================================

def simulate_match(model: str, profile: dict, rng: random.Random) -> MatchResult:
    use_charge, use_persistent_aim, use_burst_aim = model_features(model)
    use_aim = use_persistent_aim  # 자동 발사 dps_mult에 영향을 주는 것은 persistent aim뿐

    dps_mult = aim_dps_multiplier(profile) if use_aim else 1.0

    t = 0.0
    player_hp = PLAYER_HP_MAX
    enemies = 0.0      # 살아있는 적 수 (분수 허용 — 부분 처치 추적)
    boss_hp = BOSS_HP
    boss_active = False
    total_damage = 0.0
    boss_killed = False

    # 차징 윈도우 상태
    next_window_at = CHARGE_PERIOD
    in_window = False
    window_close_at = 0.0
    window_used = False

    # 재미 프록시 카운터
    windows_opened = 0
    windows_attempted = 0
    windows_succeeded = 0
    windows_directed = 0
    clutch_charges = 0
    power_moments = 0
    CLUTCH_HP_RATIO = 0.30
    POWER_KILL_RATIO = 0.30

    # 입력 카운터
    total_inputs = 0
    peak_ips = 0.0
    inputs_this_sec = 0
    sec_accum = 0.0

    # 입력 빈도 (입력/초 기댓값)
    # 이동: 모든 모델 공통. 정확도 낮을수록 우왕좌왕
    move_rate = 1.5 + (1.0 - profile["move_acc"]) * 1.0
    # 조준 (모델 3/4): aim_acc 높을수록 자주 미세 조정
    aim_rate = (0.8 + 1.5 * profile["aim_acc"]) if use_aim else 0.0

    while t < MATCH_MAX_SEC and player_hp > 0:

        # ---- 적 스폰 ----
        spawn_lam = (ENEMY_BASE_SPAWN + ENEMY_RAMP * t) * TICK_SEC
        enemies = min(ENEMY_MAX, enemies + poisson(spawn_lam, rng))

        # ---- 보스 등장 ----
        if not boss_active and t >= BOSS_SPAWN_SEC:
            boss_active = True

        # ---- 입력: 이동 + 조준 ----
        move_inputs = poisson(move_rate * TICK_SEC, rng)
        total_inputs += move_inputs
        inputs_this_sec += move_inputs

        if use_aim:
            aim_inputs = poisson(aim_rate * TICK_SEC, rng)
            total_inputs += aim_inputs
            inputs_this_sec += aim_inputs

        # ---- 차징 윈도우 처리 ----
        charge_dmg = 0.0
        if use_charge:
            # 윈도우 오픈
            if not in_window and t >= next_window_at:
                in_window = True
                window_close_at = t + CHARGE_WINDOW
                window_used = False
                windows_opened += 1

            if in_window and not window_used:
                # 사용 시도 확률 = charge_use (윈도우 동안 1번 시도)
                if rng.random() < profile["charge_use"]:
                    window_used = True
                    windows_attempted += 1
                    total_inputs += 1            # 탭 입력
                    inputs_this_sec += 1
                    # 타이밍 적중 확률 = move_acc (입력 정확도)
                    if rng.random() < profile["move_acc"]:
                        windows_succeeded += 1
                        # 클러치 체크
                        if player_hp < PLAYER_HP_MAX * CLUTCH_HP_RATIO:
                            clutch_charges += 1
                        # 모델 5: 윈도우 동안 방향 입력 추가 → 차징에 조준 보너스
                        directed_bonus = 1.0
                        if use_burst_aim and rng.random() < profile["aim_acc"]:
                            windows_directed += 1
                            total_inputs += 1       # 방향 입력 1회 추가
                            inputs_this_sec += 1
                            directed_bonus = AIM_FOCUS_BONUS  # 조준 성공 시 차징 데미지 보너스
                        # 성공: 강타 한 방
                        single_hit = BASE_DPS * dps_mult * CHARGE_WINDOW * CHARGE_MULT * directed_bonus
                        # 광역 즉살 보너스 (적 N마리, 조준 시 +50%)
                        aoe_targets = int(CHARGE_AOE_TARGETS * (1.5 if directed_bonus > 1.0 else 1.0))
                        aoe_dmg = aoe_targets * ENEMY_HP
                        charge_dmg = single_hit + aoe_dmg
                        # 파워 모멘트 체크 (현재 적 풀의 30%+ 청소)
                        enemies_before = enemies
                        if enemies_before > 0 and (aoe_targets / enemies_before) >= POWER_KILL_RATIO:
                            power_moments += 1
                        enemies = max(0.0, enemies - aoe_targets)

            if in_window and t >= window_close_at:
                in_window = False
                next_window_at = t + CHARGE_PERIOD

        # ---- 자동 발사 데미지 ----
        auto_damage = BASE_DPS * dps_mult * TICK_SEC + charge_dmg

        if boss_active:
            boss_portion = auto_damage * BOSS_DAMAGE_SHARE
            enemy_portion = auto_damage * (1.0 - BOSS_DAMAGE_SHARE)
            boss_hp -= boss_portion
            if boss_hp <= 0:
                boss_killed = True
                total_damage += auto_damage
                break
        else:
            enemy_portion = auto_damage

        # 적 처치
        kills = enemy_portion / ENEMY_HP
        enemies = max(0.0, enemies - kills)
        total_damage += auto_damage

        # ---- 플레이어 피해 (접촉) ----
        contact_mod = 1.0 + (1.0 - profile["move_acc"]) * 1.2
        contact_count = enemies * CONTACT_RATIO * contact_mod
        player_hp -= contact_count * ENEMY_CONTACT_DPS * TICK_SEC

        # ---- 초 단위 입력 피크 ----
        sec_accum += TICK_SEC
        if sec_accum >= 1.0:
            if inputs_this_sec > peak_ips:
                peak_ips = inputs_this_sec
            inputs_this_sec = 0
            sec_accum = 0.0

        t += TICK_SEC

    survival = t if player_hp > 0 else max(0.0, t)
    return MatchResult(
        survival_sec=survival,
        total_damage=total_damage,
        inputs_total=total_inputs,
        peak_inputs_per_sec=peak_ips,
        boss_killed=boss_killed,
        windows_opened=windows_opened,
        windows_attempted=windows_attempted,
        windows_succeeded=windows_succeeded,
        windows_directed=windows_directed,
        clutch_charges=clutch_charges,
        power_moments=power_moments,
    )


# ===========================================================
# 집계
# ===========================================================

def run_all(trials: int = SIM_TRIALS) -> dict:
    rng = random.Random(RNG_SEED)
    out = {}
    total_combos = len(MODELS) * len(PROFILES)
    combo_i = 0
    t_start = time.time()
    for model in MODELS:
        for prof_name, profile in PROFILES.items():
            combo_i += 1
            print(f"[{combo_i}/{total_combos}] {model:18s} x {prof_name:6s} ...", end="", flush=True)
            t0 = time.time()
            survivals, damages, ipm, peaks, boss_hits = [], [], [], [], 0
            win_opened, win_attempt, win_succeed, win_direct, clutch, power = 0, 0, 0, 0, 0, 0
            for _ in range(trials):
                r = simulate_match(model, profile, rng)
                survivals.append(r.survival_sec)
                damages.append(r.total_damage)
                ipm.append(r.inputs_total / max(r.survival_sec, 1.0) * 60.0)
                peaks.append(r.peak_inputs_per_sec)
                if r.boss_killed:
                    boss_hits += 1
                win_opened  += r.windows_opened
                win_attempt += r.windows_attempted
                win_succeed += r.windows_succeeded
                win_direct  += r.windows_directed
                clutch      += r.clutch_charges
                power       += r.power_moments
            out[(model, prof_name)] = {
                "survival_avg": statistics.mean(survivals),
                "survival_p10": sorted(survivals)[max(0, int(trials * 0.1) - 1)],
                "damage_avg": statistics.mean(damages),
                "dps_avg": statistics.mean(damages) / statistics.mean(survivals),
                "ipm_avg": statistics.mean(ipm),
                "peak_avg": statistics.mean(peaks),
                "boss_kill_rate": boss_hits / trials,
                "windows_per_match":   win_opened / trials,
                "engagement_rate":     (win_attempt / win_opened) if win_opened > 0 else 0.0,
                "mastery_rate":        (win_succeed / win_attempt) if win_attempt > 0 else 0.0,
                "agency_rate":         (win_direct / win_succeed) if win_succeed > 0 else 0.0,
                "clutch_ratio":        (clutch / win_succeed) if win_succeed > 0 else 0.0,
                "power_moment_ratio":  (power / win_succeed) if win_succeed > 0 else 0.0,
            }
            print(f" {time.time()-t0:.1f}s")
    print(f"전체 소요: {time.time()-t_start:.1f}s\n")
    return out


# ===========================================================
# 리포트
# ===========================================================

def render_report(results: dict) -> str:
    L = []
    L.append("# 입력 모델 비교 시뮬레이션 결과\n")
    L.append(f"- 매치 길이: 최대 {MATCH_MAX_SEC}s ({MATCH_MAX_SEC//60}분)")
    L.append(f"- 조합당 시뮬레이션: {SIM_TRIALS}회")
    L.append(f"- 보스 등장: {BOSS_SPAWN_SEC}s, 보스 HP: {BOSS_HP:,.0f}")
    L.append(f"- 베이스 DPS: {BASE_DPS}, 적 최대: {ENEMY_MAX}")
    L.append(f"- RNG seed: {RNG_SEED}\n")

    # 표 1
    L.append("## 1. 종합 지표 (조합별 평균)\n")
    L.append("| 입력 모델 | 플레이어 | 생존(s) | 총 데미지 | 평균 DPS | 분당 입력 | 입력 피크/s | 보스 처치율 |")
    L.append("|---|---|---:|---:|---:|---:|---:|---:|")
    for model in MODELS:
        for prof in PROFILES.keys():
            r = results[(model, prof)]
            L.append(
                f"| {model} | {prof} | {r['survival_avg']:.0f} | "
                f"{r['damage_avg']:>10,.0f} | {r['dps_avg']:.0f} | "
                f"{r['ipm_avg']:.0f} | {r['peak_avg']:.1f} | "
                f"{r['boss_kill_rate']*100:.0f}% |"
            )

    # 표 2: 스킬 천장
    L.append("\n## 2. 스킬 천장 (코어 DPS / 캐주얼 DPS)\n")
    L.append(f"_판정 임계값: {SKILL_CEILING_THRESHOLD:.2f}x 이상이면 '의미 있음'_\n")
    L.append("| 모델 | 캐주얼 DPS | 미드코어 DPS | 코어 DPS | 격차 배수 | 의미 있음? |")
    L.append("|---|---:|---:|---:|---:|:---:|")
    ceiling = {}
    for model in MODELS:
        ca = results[(model, "캐주얼")]["dps_avg"]
        mi = results[(model, "미드코어")]["dps_avg"]
        co = results[(model, "코어")]["dps_avg"]
        ratio = co / ca if ca > 0 else 0.0
        ok = ratio >= SKILL_CEILING_THRESHOLD
        ceiling[model] = (ratio, ok)
        L.append(
            f"| {model} | {ca:.0f} | {mi:.0f} | {co:.0f} | {ratio:.2f}x | "
            f"{'✅ YES' if ok else '❌ NO'} |"
        )

    # 표 3: 입력 부담
    L.append("\n## 3. 입력 부담 비교 (코어 플레이어 기준)\n")
    L.append("| 모델 | 분당 입력 | 입력 피크/s | 모바일 적합도 |")
    L.append("|---|---:|---:|:---:|")
    for model in MODELS:
        r = results[(model, "코어")]
        ipm = r["ipm_avg"]
        peak = r["peak_avg"]
        # 모바일 적합도: 분당 입력 60 이하 = 좋음, 120 이상 = 나쁨
        if ipm < 60:
            grade = "🟢 양호 (한 손)"
        elif ipm < 120:
            grade = "🟡 보통 (두 손 필요)"
        else:
            grade = "🔴 부담 (피로 누적)"
        L.append(f"| {model} | {ipm:.0f} | {peak:.1f} | {grade} |")

    # 권고
    L.append("\n## 4. 모델별 권고 (한 줄 요약)\n")
    recs = {
        "M1_자동":      "베이스라인. 스킬 천장 거의 없음 — 캐주얼 친화 최대치지만 코어 이탈 위험.",
        "M2_차징":      "단일 탭 입력으로 표현력 추가. 윈도우 무시 가능해 캐주얼 안전망 유지.",
        "M3_방향":      "지속 조준 입력 부담 — 모바일 듀얼 스틱 필수. 스킬 천장 효과는 차징 대비 약함.",
        "M4_차징+방향": "최대 스킬 천장. 코어 만족도 ↑, 입력 피크 높아 모바일 한 손 플레이 불가.",
        "M5_윈도우조준": "차징 윈도우 동안만 방향 입력 받는 하이브리드. 평소 한 손 + 5초마다 짧은 두 손 조작.",
    }
    for model in MODELS:
        ratio, _ = ceiling[model]
        peak_core = results[(model, "코어")]["peak_avg"]
        L.append(f"- **{model}**: {recs[model]} _(격차 {ratio:.2f}x, 코어 피크 {peak_core:.1f}/s)_")

    # 최종 판정
    L.append("\n## 5. 최종 판정 — 이 입력 모델이 의미 있는가?\n")
    for model in MODELS:
        ratio, ok = ceiling[model]
        if ok:
            verdict = f"✅ **YES** — 스킬 천장 {ratio:.2f}x. 입력 비용 대비 표현력 확보."
        else:
            verdict = f"❌ **NO** — 스킬 천장 {ratio:.2f}x (<{SKILL_CEILING_THRESHOLD}x). 입력 추가 정당성 부족."
        L.append(f"- **{model}**: {verdict}")

    # ----- 재미 프록시 분석 (M2, M4, M5 한정) -----
    L.append("\n## 6. 재미 프록시 분석 (Csikszentmihalyi flow + 가변 보상 이론 기반)\n")
    L.append("**⚠️ 경고**: 이 점수는 *재미의 측정값이 아닙니다*. 게임 디자인 연구에서 재미와 ")
    L.append("상관관계가 보고된 6가지 객관 지표를 시뮬에서 측정한 결과입니다. 실제 재미는 게임필·")
    L.append("시각 피드백·청각 피드백·서사·소셜 요소가 결정합니다.\n")
    L.append("- **참여율**: 윈도우 등장 중 탭 시도 비율 (할 일이 있다는 감각)")
    L.append("- **숙달감**: 시도 중 성공률. 60–80%가 플로우 존")
    L.append("- **에이전시**: 성공한 차징 중 방향 입력 비율 (M5 한정, 의미 있는 선택)")
    L.append("- **클러치율**: HP<30%에서 발동한 차징 비율 (위기 극복 드라마)")
    L.append("- **파워모멘트**: 1회 차징으로 현재 적의 30%+ 청소 비율 (카타르시스)")
    L.append("- **빈도**: 매치당 윈도우 등장 수\n")
    charge_models = [m for m in MODELS if "차징" in m or m.startswith("M5")]
    L.append("| 모델 | 플레이어 | 윈도우/매치 | 참여율 | 숙달감 | 에이전시 | 클러치율 | 파워모멘트 | FPS* |")
    L.append("|---|---|---:|---:|---:|---:|---:|---:|---:|")
    for model in charge_models:
        for prof in PROFILES.keys():
            r = results[(model, prof)]
            mast = r["mastery_rate"]
            # 숙달 sweet spot: 0.7 중심으로 떨어질수록 감점
            sweet = max(0.0, 1.0 - 2.0 * abs(mast - 0.70))
            fps = 100.0 * (
                0.20 * r["engagement_rate"] +
                0.25 * sweet +
                0.15 * r["clutch_ratio"] +
                0.25 * r["power_moment_ratio"] +
                0.15 * r["agency_rate"]
            )
            ag_str = f"{r['agency_rate']*100:.0f}%" if model.startswith("M5") else "—"
            L.append("| %s | %s | %.1f | %.0f%% | %.0f%% | %s | %.0f%% | %.0f%% | %.0f |" % (
                model, prof, r["windows_per_match"],
                r["engagement_rate"]*100, mast*100, ag_str,
                r["clutch_ratio"]*100, r["power_moment_ratio"]*100, fps
            ))
    L.append("\n*FPS (Fun Proxy Score) = 0.20×참여 + 0.25×숙달스윗 + 0.15×클러치 + 0.25×파워 + 0.15×에이전시. **휴리스틱 합성치이며 검증되지 않음**.\n")

    # 경고
    L.append("\n---\n")
    L.append("## ⚠️ 이 결과를 어떻게 읽어야 하는가\n")
    L.append(
        "이 시뮬레이션은 **수치적 사전 필터**입니다. 다음 항목은 측정되지 않았습니다:\n\n"
        "- **게임필(feel)**: 차징 윈도우의 만족감, 조준의 정확도 피드백\n"
        "- **학습 곡선**: 입력 모델 습득까지 걸리는 시간\n"
        "- **모바일 터치 피로감**: 연속 탭/스틱 조작이 5분 후 손가락에 주는 실제 부담\n"
        "- **시각적 만족도**: AoE 폭발, 차징 게이지 등의 비주얼 보상\n"
        "- **메타 진행 시너지**: 영구 강화·아이템과 입력 모델의 상호작용\n\n"
        "본 결과는 **어떤 모델이 살아남을 가치가 있는지 후보군을 추리는 용도**로만 사용하고, "
        "최종 결정은 **실제 프로토타입 + 플레이테스트**로 검증해야 합니다.\n"
    )

    return "\n".join(L)


# ===========================================================
# 엔트리 포인트
# ===========================================================

def main():
    print(f"입력 모델 시뮬레이터 시작 (trials={SIM_TRIALS}, tick={TICK_SEC}s)")
    print("=" * 60)
    results = run_all()
    report = render_report(results)
    print(report)

    # 별도 파일 출력
    out_path = "input_model_sim_report.md"
    try:
        with open(out_path, "w", encoding="utf-8") as f:
            f.write(report)
        print(f"\n[저장됨] {out_path}")
    except OSError as e:
        print(f"\n[저장 실패] {e}")


if __name__ == "__main__":
    main()
