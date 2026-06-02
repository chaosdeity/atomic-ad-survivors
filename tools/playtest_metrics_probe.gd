extends SceneTree

const MainScene := preload("res://scenes/main.tscn")

var failures: Array[String] = []

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	var main = await _new_main()
	await _probe_scripted_first_5_metrics(main)
	await _finish_main(main)

	if failures.is_empty():
		print("PLAYTEST_METRICS_PROBE PASS")
		quit(0)
	else:
		for failure in failures:
			push_error(failure)
		print("PLAYTEST_METRICS_PROBE FAIL %d" % failures.size())
		quit(1)

func _new_main():
	var main := MainScene.instantiate()
	root.add_child(main)
	await process_frame
	await process_frame
	return main

func _finish_main(main: Node) -> void:
	if main.has_method("_cleanup_audio_players"):
		main._cleanup_audio_players()
	root.remove_child(main)
	main.free()
	await process_frame
	await process_frame
	await process_frame

func _record(label: String, ok: bool, detail: String = "") -> void:
	var status := "pass" if ok else "fail"
	print("%s: %s%s" % [label, status, "" if detail == "" else " - %s" % detail])
	if not ok:
		failures.append("%s failed%s" % [label, "" if detail == "" else " - %s" % detail])

func _probe_scripted_first_5_metrics(main) -> void:
	main.first_sortie = false
	main.first_recall_done = true
	main.sortie_index = 2
	main.state_machine.change_state("playing")
	main._reset_r01_run_tracking()
	main._reset_audit_run_tracking()
	main._reset_playtest_metrics()

	main.elapsed = 12.0
	main._record_playtest_charge(3, false)

	main.elapsed = 28.0
	main._add_audit_processing(180.0, "charge_hit")
	main._update_playtest_runtime_metrics()
	main.elapsed = 31.0
	main._update_audit_director(0.0)

	main.elapsed = 36.0
	main._show_level_card()
	main._apply_card_choice(0)

	main.elapsed = 82.0
	main._show_level_card()
	main._apply_card_choice(0)

	main.elapsed = 95.0
	main.r01_zone_times["open_house_street_anchor"] = 26.0
	main._record_playtest_zone_entry("open_house_street_anchor")
	main._update_open_house_signal_candidate()
	main._update_playtest_runtime_metrics()

	main.elapsed = 130.0
	main._update_playtest_runtime_metrics()
	main._finish_match("game_over")

	var result: Dictionary = main.last_run_result
	var metrics: Dictionary = result.get("playtest_metrics", {})
	var score := int(result.get("playtest_score", 0))
	var target_count := int(result.get("playtest_target_count", 0))
	var summary := str(metrics.get("summary", ""))
	var reward_lines: Array = Array(result.get("reward_lines", []))
	var has_metric_line := false
	for line in reward_lines:
		if str(line).begins_with("플레이테스트 계측:"):
			has_metric_line = true
			break

	_record("playtest metrics returned", not metrics.is_empty(), JSON.stringify(result))
	_record("playtest score reaches first-5 threshold", score >= 4 and target_count == 7, summary)
	_record("playtest result line shown", has_metric_line, "\n".join(reward_lines))
	_record("playtest records charge hit rate", float(metrics.get("charge_hit_rate", 0.0)) > 0.0, summary)
	_record("playtest records card chain", int(metrics.get("level_up_choices", 0)) >= 2, summary)
	_record("playtest records ration candidate timing", float(metrics.get("first_ration_candidate_time", -1.0)) >= 0.0, summary)
