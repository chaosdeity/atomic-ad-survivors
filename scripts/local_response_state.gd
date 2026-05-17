extends RefCounted

const R01_BOSS_OUTCOME_NONE := ""
const R01_BOSS_OUTCOME_DESTROY_NODE := "destroy_node"
const R01_BOSS_OUTCOME_EXTRACT_MEMORY := "extract_memory"

const R01_TRACE_CHOICE_PRESERVE := "preserve"
const R01_TRACE_CHOICE_CONSUME := "consume"
const R01_TRACE_CHOICE_CAMPAIGN_USE := "campaign_use"

const R01_MAX_SIGNAL_RECORDS := 3
const R01_MAX_CAMPAIGN_PRESSURE := 5

var r01_revisit_count := 0
var r01_signal_records_found := 0
var r01_boss_outcome := R01_BOSS_OUTCOME_NONE
var r01_campaign_pressure := 0
var r01_trace_preserved_count := 0
var r01_trace_consumed_count := 0
var r01_campaign_used_count := 0

func record_r01_visit() -> void:
	r01_revisit_count += 1

func set_r01_signal_records_found(count: int) -> void:
	r01_signal_records_found = clampi(count, 0, R01_MAX_SIGNAL_RECORDS)
	_recalculate_r01_campaign_pressure()

func set_r01_boss_outcome(outcome: String) -> bool:
	if not _is_valid_r01_boss_outcome(outcome):
		return false
	r01_boss_outcome = outcome
	_recalculate_r01_campaign_pressure()
	return true

func record_r01_trace_choice(choice: String) -> bool:
	if not _is_valid_r01_trace_choice(choice):
		return false
	match choice:
		R01_TRACE_CHOICE_PRESERVE:
			r01_trace_preserved_count += 1
		R01_TRACE_CHOICE_CONSUME:
			r01_trace_consumed_count += 1
		R01_TRACE_CHOICE_CAMPAIGN_USE:
			r01_campaign_used_count += 1
	_recalculate_r01_campaign_pressure()
	return true

func r01_state_summary() -> Dictionary:
	return {
		"r01_revisit_count": r01_revisit_count,
		"r01_signal_records_found": r01_signal_records_found,
		"r01_boss_outcome": r01_boss_outcome,
		"r01_campaign_pressure": r01_campaign_pressure,
		"r01_trace_preserved_count": r01_trace_preserved_count,
		"r01_trace_consumed_count": r01_trace_consumed_count,
		"r01_campaign_used_count": r01_campaign_used_count,
	}

func _recalculate_r01_campaign_pressure() -> void:
	var pressure := r01_signal_records_found + r01_campaign_used_count
	match r01_boss_outcome:
		R01_BOSS_OUTCOME_DESTROY_NODE:
			pressure -= 1
		R01_BOSS_OUTCOME_EXTRACT_MEMORY:
			pressure += 1
	r01_campaign_pressure = clampi(pressure, 0, R01_MAX_CAMPAIGN_PRESSURE)

func _is_valid_r01_boss_outcome(outcome: String) -> bool:
	return outcome == R01_BOSS_OUTCOME_NONE or outcome == R01_BOSS_OUTCOME_DESTROY_NODE or outcome == R01_BOSS_OUTCOME_EXTRACT_MEMORY

func _is_valid_r01_trace_choice(choice: String) -> bool:
	return choice == R01_TRACE_CHOICE_PRESERVE or choice == R01_TRACE_CHOICE_CONSUME or choice == R01_TRACE_CHOICE_CAMPAIGN_USE
