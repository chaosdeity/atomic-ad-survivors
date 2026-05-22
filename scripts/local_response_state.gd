extends RefCounted

const R01_BOSS_OUTCOME_NONE := ""
const R01_BOSS_OUTCOME_DESTROY_NODE := "destroy_node"
const R01_BOSS_OUTCOME_EXTRACT_MEMORY := "extract_memory"

const R01_TRACE_CHOICE_PRESERVE := "preserve"
const R01_TRACE_CHOICE_CONSUME := "consume"
const R01_TRACE_CHOICE_CAMPAIGN_USE := "campaign_use"

const R01_MAX_SIGNAL_RECORDS := 3
const R01_MAX_CAMPAIGN_PRESSURE := 5
const TICKET_FOOD := "food"
const TICKET_POWER := "power"
const TICKET_SIGNAL := "signal"

var r01_revisit_count := 0
var r01_signal_records_found := 0
var r01_boss_outcome := R01_BOSS_OUTCOME_NONE
var r01_campaign_pressure := 0
var r01_trace_preserved_count := 0
var r01_trace_consumed_count := 0
var r01_campaign_used_count := 0
var r01_contaminated_food_count := 0
var r01_contaminated_power_count := 0
var r01_contaminated_signal_count := 0
var r01_contamination_total := 0
var r01_last_contamination_ticket := ""

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

func record_r01_contamination(contaminated: Dictionary) -> Dictionary:
	var food_count := maxi(0, int(contaminated.get(TICKET_FOOD, 0)))
	var power_count := maxi(0, int(contaminated.get(TICKET_POWER, 0)))
	var signal_count := maxi(0, int(contaminated.get(TICKET_SIGNAL, 0)))
	var total := food_count + power_count + signal_count
	if total <= 0:
		return {
			"changed": false,
			"summary": r01_contamination_summary(),
			"last_ticket": r01_last_contamination_ticket,
			"total": r01_contamination_total,
		}
	r01_contaminated_food_count += food_count
	r01_contaminated_power_count += power_count
	r01_contaminated_signal_count += signal_count
	r01_contamination_total += total
	if signal_count > 0:
		r01_last_contamination_ticket = TICKET_SIGNAL
	elif power_count > 0:
		r01_last_contamination_ticket = TICKET_POWER
	else:
		r01_last_contamination_ticket = TICKET_FOOD
	_recalculate_r01_campaign_pressure()
	return {
		"changed": true,
		"summary": r01_contamination_summary(),
		"last_ticket": r01_last_contamination_ticket,
		"total": r01_contamination_total,
		"new_total": total,
		"food": r01_contaminated_food_count,
		"power": r01_contaminated_power_count,
		"signal": r01_contaminated_signal_count,
	}

func r01_contamination_summary() -> String:
	if r01_contamination_total <= 0:
		return "오염 꼬리표 없음"
	var parts: Array[String] = []
	if r01_contaminated_food_count > 0:
		parts.append("식량태그%d" % r01_contaminated_food_count)
	if r01_contaminated_power_count > 0:
		parts.append("충전태그%d" % r01_contaminated_power_count)
	if r01_contaminated_signal_count > 0:
		parts.append("수신태그%d" % r01_contaminated_signal_count)
	return "오염 꼬리표 %s" % " ".join(parts)

func r01_state_summary() -> Dictionary:
	return {
		"r01_revisit_count": r01_revisit_count,
		"r01_signal_records_found": r01_signal_records_found,
		"r01_boss_outcome": r01_boss_outcome,
		"r01_campaign_pressure": r01_campaign_pressure,
		"r01_trace_preserved_count": r01_trace_preserved_count,
		"r01_trace_consumed_count": r01_trace_consumed_count,
		"r01_campaign_used_count": r01_campaign_used_count,
		"r01_contaminated_food_count": r01_contaminated_food_count,
		"r01_contaminated_power_count": r01_contaminated_power_count,
		"r01_contaminated_signal_count": r01_contaminated_signal_count,
		"r01_contamination_total": r01_contamination_total,
		"r01_last_contamination_ticket": r01_last_contamination_ticket,
		"r01_contamination_summary": r01_contamination_summary(),
	}

func _recalculate_r01_campaign_pressure() -> void:
	var pressure := r01_signal_records_found + r01_campaign_used_count + mini(2, r01_contamination_total)
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
