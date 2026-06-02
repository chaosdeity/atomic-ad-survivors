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
const R01_ROLE_EXTERNAL := "외부인"
const R01_ROLE_VISITOR := "방문객"
const R01_ROLE_CUSTOMER_HELD := "고객 보류"
const R01_ROLE_GUARDIAN_CANDIDATE := "보호자 후보"
const R01_ROLE_RECIPIENT_CANDIDATE := "수령인 후보"
const R01_ROLE_FAMILY_SLOT := "가족 슬롯"
const R01_ROLE_ORDER := [
	R01_ROLE_EXTERNAL,
	R01_ROLE_VISITOR,
	R01_ROLE_CUSTOMER_HELD,
	R01_ROLE_GUARDIAN_CANDIDATE,
	R01_ROLE_RECIPIENT_CANDIDATE,
	R01_ROLE_FAMILY_SLOT,
]

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
var r01_yunseo_role_guess := R01_ROLE_EXTERNAL
var r01_fake_recall_accuracy := 0
var r01_name_pressure := 0
var r01_tag_contamination := 0
var r01_route_memory := 0
var r01_source_suppression_memory := 0
var r01_boss_residue := 0
var r01_outpost_trace_leak := 0

func record_r01_visit() -> void:
	r01_revisit_count += 1
	_raise_r01_role_guess(R01_ROLE_VISITOR)

func set_r01_signal_records_found(count: int) -> void:
	r01_signal_records_found = clampi(count, 0, R01_MAX_SIGNAL_RECORDS)
	_recalculate_r01_campaign_pressure()

func set_r01_boss_outcome(outcome: String) -> bool:
	if not _is_valid_r01_boss_outcome(outcome):
		return false
	if outcome != R01_BOSS_OUTCOME_NONE and r01_boss_outcome != outcome:
		r01_boss_residue += 1
	r01_boss_outcome = outcome
	_recalculate_r01_campaign_pressure()
	return true

func record_r01_boss_rejection(residue_gain: int = 1, tag_contamination_gain: int = 0) -> Dictionary:
	var residue_delta := maxi(1, residue_gain)
	r01_boss_residue += residue_delta
	r01_name_pressure += 1
	r01_tag_contamination += maxi(0, tag_contamination_gain)
	r01_yunseo_role_guess = R01_ROLE_CUSTOMER_HELD
	_recalculate_r01_campaign_pressure()
	return r01_state_summary()

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
	r01_tag_contamination += total
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

func record_r01_source_learning(source_key: String, state_id: String, action: String = "") -> Dictionary:
	if source_key == "":
		return r01_state_summary()
	r01_route_memory += 1
	if state_id == "suppressed" or state_id == "overloaded" or state_id == "spent" or action == "suppressed" or action == "overloaded":
		r01_source_suppression_memory += 1
	match source_key:
		"nameplate":
			r01_name_pressure += 1
			if r01_name_pressure >= 3:
				_raise_r01_role_guess(R01_ROLE_GUARDIAN_CANDIDATE)
			else:
				_raise_r01_role_guess(R01_ROLE_CUSTOMER_HELD)
		"family_photo_window":
			if state_id == "overloaded":
				_raise_r01_role_guess(R01_ROLE_FAMILY_SLOT)
			elif r01_revisit_count >= 2:
				_raise_r01_role_guess(R01_ROLE_GUARDIAN_CANDIDATE)
			else:
				_raise_r01_role_guess(R01_ROLE_CUSTOMER_HELD)
		"mailbox":
			_raise_r01_role_guess(R01_ROLE_RECIPIENT_CANDIDATE)
			if state_id == "overloaded":
				r01_tag_contamination += 1
		"front_sensor":
			if state_id == "overloaded" or r01_source_suppression_memory >= 2:
				_raise_r01_role_guess(R01_ROLE_GUARDIAN_CANDIDATE)
			else:
				_raise_r01_role_guess(R01_ROLE_VISITOR)
		"drain_silence_pocket":
			r01_outpost_trace_leak += 1
			if state_id == "overloaded":
				r01_tag_contamination += 1
		"fake_recall_marker":
			r01_fake_recall_accuracy += 1
			if state_id == "overloaded":
				r01_tag_contamination += 1
		"model_house":
			r01_boss_residue += 1
		_:
			pass
	_recalculate_r01_campaign_pressure()
	return r01_state_summary()

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
		"r01_yunseo_role_guess": r01_yunseo_role_guess,
		"r01_fake_recall_accuracy": r01_fake_recall_accuracy,
		"r01_name_pressure": r01_name_pressure,
		"r01_tag_contamination": r01_tag_contamination,
		"r01_route_memory": r01_route_memory,
		"r01_source_suppression_memory": r01_source_suppression_memory,
		"r01_boss_residue": r01_boss_residue,
		"r01_outpost_trace_leak": r01_outpost_trace_leak,
	}

func _recalculate_r01_campaign_pressure() -> void:
	var pressure := r01_signal_records_found + r01_campaign_used_count + mini(2, r01_contamination_total) + mini(2, r01_tag_contamination) + mini(1, int(r01_name_pressure / 2))
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

func _raise_r01_role_guess(role: String) -> void:
	var current_index := R01_ROLE_ORDER.find(r01_yunseo_role_guess)
	var next_index := R01_ROLE_ORDER.find(role)
	if current_index == -1:
		current_index = 0
	if next_index == -1:
		return
	if next_index > current_index:
		r01_yunseo_role_guess = role
