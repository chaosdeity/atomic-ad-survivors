@tool
# =============================================================
# input_model_sim.gd
# 2D 탑다운 생존 로그라이크 입력 모델 비교 시뮬레이터
# 4개 입력 모델 x 3개 플레이어 유형 = 12개 조합을 SIM_TRIALS회씩 시뮬레이션.
# 그래픽 없음. 결과는 Godot 출력 패널과 user:// 디렉토리의 .md 파일에 기록.
#
# 사용법 (3가지 중 택1):
#   A) 메인 씬에 Node 하나 추가 → 이 스크립트 부착 → 실행 (F5)
#   B) 에디터에서 이 파일 우클릭 → "Run" (Godot 4.2+)
#   C) CLI: godot --headless --script input_model_sim.gd
#
# 게임필, 학습 곡선, 모바일 터치 피로감, 시각적 만족도는 측정 불가.
# 이 결과는 사전 필터로만 사용하고 실제 플레이테스트로 검증할 것.
# =============================================================

extends SceneTree   # CLI 헤드리스 실행 호환 (godot --headless --script)

# ---- 매개변수 (디자이너 조정 가능) ----
const SIM_TRIALS:        int   = 1000
const MATCH_MAX_SEC:     float = 600.0
const TICK_SEC:          float = 0.5
const RNG_SEED:          int   = 42

const PLAYER_HP_MAX:     float = 100.0

const ENEMY_BASE_SPAWN:  float = 2.0
const ENEMY_RAMP:        float = 0.012
const ENEMY_MAX:         int   = 150
const ENEMY_HP:          float = 30.0
const ENEMY_CONTACT_DPS: float = 5.0
const CONTACT_RATIO:     float = 0.08

const BOSS_SPAWN_SEC:    float = 480.0
const BOSS_HP:           float = 60000.0
const BOSS_DAMAGE_SHARE: float = 0.6

const BASE_DPS:          float = 100.0

const CHARGE_PERIOD:        float = 5.0
const CHARGE_WINDOW:        float = 1.0
const CHARGE_MULT:          float = 2.5
const CHARGE_AOE_TARGETS:   int   = 4

const AIM_FOCUS_BONUS:   float = 1.60
const AIM_OFF_PENALTY:   float = 0.55
const AIM_BASE_RATIO:    float = 0.33
const AIM_FOCUS_GAIN:    float = 0.45

const SKILL_CEILING_THRESHOLD: float = 1.5

# 플레이어 프로파일 정의
const PROFILES: Dictionary = {
	"캐주얼":   {"move_acc": 0.50, "charge_use": 0.30, "aim_acc": 0.60},
	"미드코어": {"move_acc": 0.75, "charge_use": 0.70, "aim_acc": 0.80},
	"코어":     {"move_acc": 0.95, "charge_use": 0.95, "aim_acc": 0.95},
}

const MODELS: Array = ["M1_자동", "M2_차징", "M3_방향", "M4_차징+방향"]

# 모바일 적합도 임계값 (분당 입력)
const IPM_GREEN: float = 60.0
const IPM_RED:   float = 120.0


# =============================================================
# 헬퍼
# =============================================================
var _rng := RandomNumberGenerator.new()

func _poisson(lam: float) -> int:
	if lam <= 0.0:
		return 0
	var L := exp(-lam)
	var k := 0
	var p := 1.0
	while true:
		k += 1
		p *= _rng.randf()
		if p <= L:
			return k - 1
	return 0

func _aim_dps_mult(profile: Dictionary) -> float:
	var cone_ratio: float = min(0.90, AIM_BASE_RATIO + AIM_FOCUS_GAIN * float(profile["aim_acc"]))
	return cone_ratio * AIM_FOCUS_BONUS + (1.0 - cone_ratio) * AIM_OFF_PENALTY


# =============================================================
# 단일 매치 시뮬레이션
# =============================================================
func _simulate_match(model: String, profile: Dictionary) -> Dictionary:
	var use_charge: bool = model.contains("차징")
	var use_aim:    bool = model.contains("방향")
	var dps_mult:   float = _aim_dps_mult(profile) if use_aim else 1.0

	var t: float = 0.0
	var player_hp: float = PLAYER_HP_MAX
	var enemies: float = 0.0
	var boss_hp: float = BOSS_HP
	var boss_active: bool = false
	var total_damage: float = 0.0
	var boss_killed: bool = false

	var next_window_at: float = CHARGE_PERIOD
	var in_window: bool = false
	var window_close_at: float = 0.0
	var window_used: bool = false

	var total_inputs: int = 0
	var peak_ips: int = 0
	var inputs_this_sec: int = 0
	var sec_accum: float = 0.0

	var move_acc: float   = float(profile["move_acc"])
	var charge_use: float = float(profile["charge_use"])
	var aim_acc: float    = float(profile["aim_acc"])

	var move_rate: float = 1.5 + (1.0 - move_acc) * 1.0
	var aim_rate: float  = (0.8 + 1.5 * aim_acc) if use_aim else 0.0

	while t < MATCH_MAX_SEC and player_hp > 0.0:

		# 적 스폰
		var spawn_lam: float = (ENEMY_BASE_SPAWN + ENEMY_RAMP * t) * TICK_SEC
		enemies = min(float(ENEMY_MAX), enemies + float(_poisson(spawn_lam)))

		# 보스 등장
		if not boss_active and t >= BOSS_SPAWN_SEC:
			boss_active = true

		# 입력: 이동
		var move_in: int = _poisson(move_rate * TICK_SEC)
		total_inputs += move_in
		inputs_this_sec += move_in

		# 입력: 조준
		if use_aim:
			var aim_in: int = _poisson(aim_rate * TICK_SEC)
			total_inputs += aim_in
			inputs_this_sec += aim_in

		# 차징 윈도우
		var charge_dmg: float = 0.0
		if use_charge:
			if not in_window and t >= next_window_at:
				in_window = true
				window_close_at = t + CHARGE_WINDOW
				window_used = false

			if in_window and not window_used:
				if _rng.randf() < charge_use:
					window_used = true
					total_inputs += 1
					inputs_this_sec += 1
					if _rng.randf() < move_acc:
						var single_hit: float = BASE_DPS * dps_mult * CHARGE_WINDOW * CHARGE_MULT
						var aoe_dmg: float = float(CHARGE_AOE_TARGETS) * ENEMY_HP
						charge_dmg = single_hit + aoe_dmg
						enemies = max(0.0, enemies - float(CHARGE_AOE_TARGETS))

			if in_window and t >= window_close_at:
				in_window = false
				next_window_at = t + CHARGE_PERIOD

		# 자동 발사 데미지
		var auto_damage: float = BASE_DPS * dps_mult * TICK_SEC + charge_dmg

		var enemy_portion: float = auto_damage
		if boss_active:
			var boss_portion: float = auto_damage * BOSS_DAMAGE_SHARE
			enemy_portion = auto_damage * (1.0 - BOSS_DAMAGE_SHARE)
			boss_hp -= boss_portion
			if boss_hp <= 0.0:
				boss_killed = true
				total_damage += auto_damage
				break

		var kills: float = enemy_portion / ENEMY_HP
		enemies = max(0.0, enemies - kills)
		total_damage += auto_damage

		# 플레이어 피해 (접촉)
		var contact_mod: float = 1.0 + (1.0 - move_acc) * 1.2
		var contact_count: float = enemies * CONTACT_RATIO * contact_mod
		player_hp -= contact_count * ENEMY_CONTACT_DPS * TICK_SEC

		# 초 단위 입력 피크
		sec_accum += TICK_SEC
		if sec_accum >= 1.0:
			if inputs_this_sec > peak_ips:
				peak_ips = inputs_this_sec
			inputs_this_sec = 0
			sec_accum = 0.0

		t += TICK_SEC

	var survival: float = t if player_hp > 0.0 else max(0.0, t)
	return {
		"survival_sec": survival,
		"total_damage": total_damage,
		"inputs_total": total_inputs,
		"peak_inputs_per_sec": float(peak_ips),
		"boss_killed": boss_killed,
	}


# =============================================================
# 집계
# =============================================================
func _run_all() -> Dictionary:
	_rng.seed = RNG_SEED
	var out: Dictionary = {}
	var combo_total: int = MODELS.size() * PROFILES.size()
	var combo_i: int = 0
	var t_total: float = Time.get_ticks_msec()

	for model in MODELS:
		for prof_name in PROFILES.keys():
			combo_i += 1
			var profile: Dictionary = PROFILES[prof_name]
			var t0: float = Time.get_ticks_msec()

			var survivals: Array[float] = []
			var damages: Array[float] = []
			var ipm_arr: Array[float] = []
			var peaks: Array[float] = []
			var boss_hits: int = 0

			for trial in range(SIM_TRIALS):
				var r: Dictionary = _simulate_match(model, profile)
				survivals.append(r["survival_sec"])
				damages.append(r["total_damage"])
				var s: float = max(r["survival_sec"], 1.0)
				ipm_arr.append(float(r["inputs_total"]) / s * 60.0)
				peaks.append(r["peak_inputs_per_sec"])
				if r["boss_killed"]:
					boss_hits += 1

			var surv_avg: float = _mean(survivals)
			var dmg_avg: float = _mean(damages)
			var key: String = "%s|%s" % [model, prof_name]
			out[key] = {
				"model": model,
				"profile": prof_name,
				"survival_avg": surv_avg,
				"damage_avg": dmg_avg,
				"dps_avg": (dmg_avg / surv_avg) if surv_avg > 0.0 else 0.0,
				"ipm_avg": _mean(ipm_arr),
				"peak_avg": _mean(peaks),
				"boss_kill_rate": float(boss_hits) / float(SIM_TRIALS),
			}
			var dt: float = (Time.get_ticks_msec() - t0) / 1000.0
			print("[%d/%d] %-18s x %-6s  %.1fs" % [combo_i, combo_total, model, prof_name, dt])

	print("전체 소요: %.1fs\n" % ((Time.get_ticks_msec() - t_total) / 1000.0))
	return out


func _mean(arr: Array) -> float:
	if arr.is_empty():
		return 0.0
	var s: float = 0.0
	for v in arr:
		s += float(v)
	return s / float(arr.size())


# =============================================================
# 리포트 생성
# =============================================================
func _render_report(results: Dictionary) -> String:
	var L: PackedStringArray = []
	L.append("# 입력 모델 비교 시뮬레이션 결과\n")
	L.append("- 매치 길이: 최대 %ds (%d분)" % [int(MATCH_MAX_SEC), int(MATCH_MAX_SEC) / 60])
	L.append("- 조합당 시뮬레이션: %d회" % SIM_TRIALS)
	L.append("- 보스 등장: %ds, 보스 HP: %d" % [int(BOSS_SPAWN_SEC), int(BOSS_HP)])
	L.append("- 베이스 DPS: %.0f, 적 최대: %d" % [BASE_DPS, ENEMY_MAX])
	L.append("- RNG seed: %d\n" % RNG_SEED)

	# 표 1
	L.append("## 1. 종합 지표 (조합별 평균)\n")
	L.append("| 입력 모델 | 플레이어 | 생존(s) | 총 데미지 | 평균 DPS | 분당 입력 | 입력 피크/s | 보스 처치율 |")
	L.append("|---|---|---:|---:|---:|---:|---:|---:|")
	for model in MODELS:
		for prof in PROFILES.keys():
			var r: Dictionary = results["%s|%s" % [model, prof]]
			L.append("| %s | %s | %.0f | %s | %.0f | %.0f | %.1f | %.0f%% |" % [
				model, prof, r["survival_avg"],
				_fmt_int(r["damage_avg"]),
				r["dps_avg"], r["ipm_avg"], r["peak_avg"],
				r["boss_kill_rate"] * 100.0,
			])

	# 표 2: 스킬 천장
	L.append("\n## 2. 스킬 천장 (코어 DPS / 캐주얼 DPS)\n")
	L.append("_판정 임계값: %.2fx 이상이면 '의미 있음'_\n" % SKILL_CEILING_THRESHOLD)
	L.append("| 모델 | 캐주얼 DPS | 미드코어 DPS | 코어 DPS | 격차 배수 | 의미 있음? |")
	L.append("|---|---:|---:|---:|---:|:---:|")
	var ceiling: Dictionary = {}
	for model in MODELS:
		var ca: float = results["%s|캐주얼" % model]["dps_avg"]
		var mi: float = results["%s|미드코어" % model]["dps_avg"]
		var co: float = results["%s|코어" % model]["dps_avg"]
		var ratio: float = (co / ca) if ca > 0.0 else 0.0
		var ok: bool = ratio >= SKILL_CEILING_THRESHOLD
		ceiling[model] = {"ratio": ratio, "ok": ok}
		L.append("| %s | %.0f | %.0f | %.0f | %.2fx | %s |" % [
			model, ca, mi, co, ratio, "YES" if ok else "NO"
		])

	# 표 3: 입력 부담
	L.append("\n## 3. 입력 부담 비교 (코어 플레이어 기준)\n")
	L.append("| 모델 | 분당 입력 | 입력 피크/s | 모바일 적합도 |")
	L.append("|---|---:|---:|:---:|")
	for model in MODELS:
		var r: Dictionary = results["%s|코어" % model]
		var ipm: float = r["ipm_avg"]
		var peak: float = r["peak_avg"]
		var grade: String
		if ipm < IPM_GREEN:
			grade = "양호 (한 손)"
		elif ipm < IPM_RED:
			grade = "보통 (두 손 필요)"
		else:
			grade = "부담 (피로 누적)"
		L.append("| %s | %.0f | %.1f | %s |" % [model, ipm, peak, grade])

	# 권고
	L.append("\n## 4. 모델별 권고 (한 줄 요약)\n")
	var recs: Dictionary = {
		"M1_자동":      "베이스라인. 스킬 천장 거의 없음 — 캐주얼 친화 최대치지만 코어 이탈 위험.",
		"M2_차징":      "단일 탭 입력으로 표현력 추가. 윈도우 무시 가능해 캐주얼 안전망 유지.",
		"M3_방향":      "지속 조준 입력 부담 — 모바일 듀얼 스틱 필수. 스킬 천장 효과는 차징 대비 약함.",
		"M4_차징+방향": "최대 스킬 천장. 코어 만족도 ↑, 입력 피크 높아 모바일 한 손 플레이 불가.",
	}
	for model in MODELS:
		var ratio: float = ceiling[model]["ratio"]
		var peak_core: float = results["%s|코어" % model]["peak_avg"]
		L.append("- **%s**: %s _(격차 %.2fx, 코어 피크 %.1f/s)_" % [
			model, recs[model], ratio, peak_core
		])

	# 최종 판정
	L.append("\n## 5. 최종 판정 — 이 입력 모델이 의미 있는가?\n")
	for model in MODELS:
		var ratio: float = ceiling[model]["ratio"]
		var ok: bool = ceiling[model]["ok"]
		var verdict: String
		if ok:
			verdict = "YES — 스킬 천장 %.2fx. 입력 비용 대비 표현력 확보." % ratio
		else:
			verdict = "NO — 스킬 천장 %.2fx (<%.1fx). 입력 추가 정당성 부족." % [ratio, SKILL_CEILING_THRESHOLD]
		L.append("- **%s**: **%s**" % [model, verdict])

	# 경고
	L.append("\n---\n")
	L.append("## 이 결과를 어떻게 읽어야 하는가\n")
	L.append("이 시뮬레이션은 **수치적 사전 필터**입니다. 다음 항목은 측정되지 않았습니다:\n")
	L.append("- **게임필(feel)**: 차징 윈도우의 만족감, 조준의 정확도 피드백")
	L.append("- **학습 곡선**: 입력 모델 습득까지 걸리는 시간")
	L.append("- **모바일 터치 피로감**: 연속 탭/스틱 조작이 5분 후 손가락에 주는 실제 부담")
	L.append("- **시각적 만족도**: AoE 폭발, 차징 게이지 등의 비주얼 보상")
	L.append("- **메타 진행 시너지**: 영구 강화·아이템과 입력 모델의 상호작용\n")
	L.append("본 결과는 **어떤 모델이 살아남을 가치가 있는지 후보군을 추리는 용도**로만 사용하고, ")
	L.append("최종 결정은 **실제 프로토타입 + 플레이테스트**로 검증해야 합니다.")

	return "\n".join(L)


func _fmt_int(v: float) -> String:
	# 천 단위 콤마
	var s := str(int(v))
	var out := ""
	var cnt := 0
	for i in range(s.length() - 1, -1, -1):
		out = s[i] + out
		cnt += 1
		if cnt % 3 == 0 and i > 0:
			out = "," + out
	return out


# =============================================================
# 엔트리 포인트 (SceneTree 자동 호출)
# =============================================================
func _init() -> void:
	print("입력 모델 시뮬레이터 시작 (trials=%d, tick=%.2fs)" % [SIM_TRIALS, TICK_SEC])
	print("============================================================")

	var results: Dictionary = _run_all()
	var report: String = _render_report(results)

	print(report)

	# user:// 디렉토리에 저장
	var path := "user://input_model_sim_report.md"
	var f := FileAccess.open(path, FileAccess.WRITE)
	if f:
		f.store_string(report)
		f.close()
		print("\n[저장됨] %s (실제 경로: %s)" % [path, ProjectSettings.globalize_path(path)])
	else:
		print("\n[저장 실패] FileAccess.open returned null for %s" % path)

	# 헤드리스 종료
	quit()
