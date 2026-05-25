extends SceneTree

const MainScene := preload("res://scenes/main.tscn")
const MetaProgression := preload("res://scripts/meta_progression.gd")

var failures: Array[String] = []

func _init() -> void:
	call_deferred("_run")

func _run() -> void:
	var main = await _new_main()
	await _probe_contamination_visual_budget(main)
	await _probe_contamination_labels_hide_under_swarm(main)
	await _probe_contamination_hidden_during_boss(main)
	await _finish_main(main)

	if failures.is_empty():
		print("CONTAMINATION_READABILITY_PROBE PASS")
		quit(0)
	else:
		for failure in failures:
			push_error(failure)
		print("CONTAMINATION_READABILITY_PROBE FAIL %d" % failures.size())
		quit(1)

func _new_main():
	var main := MainScene.instantiate()
	root.add_child(main)
	await process_frame
	await process_frame
	main.first_sortie = false
	main.first_recall_done = true
	main.match_state = "playing"
	main.game_over = false
	main.paused_for_card = false
	return main

func _finish_main(main: Node) -> void:
	if main.has_method("_cleanup_audio_players"):
		main._cleanup_audio_players()
	root.remove_child(main)
	main.free()
	await process_frame
	await process_frame

func _record(label: String, ok: bool, detail: String = "") -> void:
	var status := "pass" if ok else "fail"
	print("%s: %s%s" % [label, status, "" if detail == "" else " - %s" % detail])
	if not ok:
		failures.append("%s failed%s" % [label, "" if detail == "" else " - %s" % detail])

func _seed_contamination(main) -> void:
	main.meta_progression.local_response_state.record_r01_contamination({
		MetaProgression.TICKET_FOOD: 3,
		MetaProgression.TICKET_POWER: 2,
		MetaProgression.TICKET_SIGNAL: 3,
	})

func _probe_contamination_visual_budget(main) -> void:
	_seed_contamination(main)
	main.elapsed = 144.0
	main.player_pos = main.r01_blockout.anchor_position("open_house_street_anchor") + Vector2(72, -92)
	var snapshot: Dictionary = main._r01_contamination_readability_snapshot()
	_record("contamination marks visible after contaminated settlement", bool(snapshot.get("visible", false)), JSON.stringify(snapshot))
	_record("contamination mark count capped", int(snapshot.get("mark_count", 0)) <= 4, JSON.stringify(snapshot))
	_record("contamination radius stays below threat scale", float(snapshot.get("max_radius", 999.0)) <= 28.5, JSON.stringify(snapshot))
	_record("contamination fill alpha stays subtle", float(snapshot.get("max_fill_alpha", 1.0)) <= 0.08, JSON.stringify(snapshot))
	_record("contamination edge alpha stays below active telegraph", float(snapshot.get("max_edge_alpha", 1.0)) <= 0.34, JSON.stringify(snapshot))
	_record("contamination labels stay sparse", int(snapshot.get("label_count", 99)) <= 1, JSON.stringify(snapshot))

func _probe_contamination_labels_hide_under_swarm(main) -> void:
	var mark_pos: Vector2 = main.r01_blockout.anchor_position("open_house_street_anchor") + Vector2(72, -92)
	main.player_pos = mark_pos
	main.enemies.enemies.clear()
	for i in range(12):
		main.enemies.enemies.append({
			"pos": mark_pos + Vector2(float(i % 4) * 9.0, float(i / 4) * 9.0),
			"radius": 10.0,
		})
	var snapshot: Dictionary = main._r01_contamination_readability_snapshot()
	_record("contamination labels hide under dense combat", int(snapshot.get("label_count", 99)) == 0, JSON.stringify(snapshot))

func _probe_contamination_hidden_during_boss(main) -> void:
	main.enemies.enemies.clear()
	main.boss.active = true
	var snapshot: Dictionary = main._r01_contamination_readability_snapshot()
	_record("contamination marks hidden during boss", not bool(snapshot.get("visible", true)), JSON.stringify(snapshot))
