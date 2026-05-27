extends RefCounted

const STATE_ACTIVE := "active"
const STATE_REVEALED := "revealed"
const STATE_STAMPED := "stamped"
const STATE_SUPPRESSED := "suppressed"
const STATE_OVERLOADED := "overloaded"
const STATE_SPENT := "spent"

const SUPPRESSION_DURATION := 6.5
const OVERLOAD_DURATION := 4.2

static func default_state(object: Dictionary = {}) -> Dictionary:
	return {
		"source_id": String(object.get("id", "")),
		"display_name": String(object.get("display_name", object.get("id", "source"))),
		"source_role": String(object.get("source_role", "environmental_readability")),
		"zone_id": String(object.get("zone_id", "")),
		"pos": Vector2(object.get("pos", Vector2.ZERO)),
		"revealed": false,
		"stamped": false,
		"spent": false,
		"suppression_remaining": 0.0,
		"overload_remaining": 0.0,
		"last_action": "",
		"last_phrase": "",
		"action_count": 0,
	}

static func ensure_state(states: Dictionary, object: Dictionary) -> Dictionary:
	var source_id := String(object.get("id", ""))
	if source_id == "":
		return {}
	var state := Dictionary(states.get(source_id, {})).duplicate(true)
	if state.is_empty():
		state = default_state(object)
	else:
		state["source_id"] = source_id
		state["display_name"] = String(state.get("display_name", object.get("display_name", source_id)))
		state["source_role"] = String(state.get("source_role", object.get("source_role", "environmental_readability")))
		state["zone_id"] = String(state.get("zone_id", object.get("zone_id", "")))
		state["pos"] = Vector2(state.get("pos", object.get("pos", Vector2.ZERO)))
	states[source_id] = state
	return state

static func tick(states: Dictionary, delta: float) -> void:
	for source_id in states.keys():
		var state := Dictionary(states[source_id]).duplicate(true)
		state["suppression_remaining"] = maxf(0.0, float(state.get("suppression_remaining", 0.0)) - delta)
		state["overload_remaining"] = maxf(0.0, float(state.get("overload_remaining", 0.0)) - delta)
		states[source_id] = state

static func reveal(states: Dictionary, object: Dictionary, action: String = "reveal", phrase: String = "") -> Dictionary:
	var state := ensure_state(states, object)
	if state.is_empty():
		return {"applied": false, "repeat": false, "state": STATE_ACTIVE}
	var was_revealed := bool(state.get("revealed", false))
	state["revealed"] = true
	state["last_action"] = action
	state["last_phrase"] = phrase
	states[String(state["source_id"])] = state
	return {
		"applied": not was_revealed,
		"repeat": was_revealed,
		"state": current_state(state),
	}

static func suppress(states: Dictionary, object: Dictionary, phrase: String = "") -> Dictionary:
	var state := ensure_state(states, object)
	if state.is_empty():
		return {"applied": false, "repeat": false, "state": STATE_ACTIVE}
	if bool(state.get("spent", false)):
		return {"applied": false, "repeat": true, "state": current_state(state)}
	state["revealed"] = true
	state["stamped"] = true
	state["spent"] = true
	state["suppression_remaining"] = maxf(float(state.get("suppression_remaining", 0.0)), SUPPRESSION_DURATION)
	state["last_action"] = STATE_SUPPRESSED
	state["last_phrase"] = phrase
	state["action_count"] = int(state.get("action_count", 0)) + 1
	states[String(state["source_id"])] = state
	return {"applied": true, "repeat": false, "state": current_state(state)}

static func overload(states: Dictionary, object: Dictionary, phrase: String = "") -> Dictionary:
	var state := ensure_state(states, object)
	if state.is_empty():
		return {"applied": false, "repeat": false, "state": STATE_ACTIVE}
	if bool(state.get("spent", false)):
		return {"applied": false, "repeat": true, "state": current_state(state)}
	state["revealed"] = true
	state["stamped"] = true
	state["spent"] = true
	state["suppression_remaining"] = maxf(float(state.get("suppression_remaining", 0.0)), SUPPRESSION_DURATION * 0.65)
	state["overload_remaining"] = maxf(float(state.get("overload_remaining", 0.0)), OVERLOAD_DURATION)
	state["last_action"] = STATE_OVERLOADED
	state["last_phrase"] = phrase
	state["action_count"] = int(state.get("action_count", 0)) + 1
	states[String(state["source_id"])] = state
	return {"applied": true, "repeat": false, "state": current_state(state)}

static func current_state(state: Dictionary) -> String:
	if float(state.get("overload_remaining", 0.0)) > 0.0:
		return STATE_OVERLOADED
	if float(state.get("suppression_remaining", 0.0)) > 0.0:
		return STATE_SUPPRESSED
	if bool(state.get("spent", false)):
		return STATE_SPENT
	if bool(state.get("stamped", false)):
		return STATE_STAMPED
	if bool(state.get("revealed", false)):
		return STATE_REVEALED
	return STATE_ACTIVE

static func state_for_source(states: Dictionary, source_id: String) -> Dictionary:
	return Dictionary(states.get(source_id, {})).duplicate(true)

static func source_weight(states: Dictionary, source: Dictionary) -> float:
	var state := state_for_source(states, String(source.get("id", "")))
	if state.is_empty():
		return 1.0
	if float(state.get("overload_remaining", 0.0)) > 0.0:
		return 0.34
	if float(state.get("suppression_remaining", 0.0)) > 0.0:
		return 0.58
	return 1.0

static func source_list_chance_multiplier(states: Dictionary, sources: Array) -> float:
	if states.is_empty() or sources.is_empty():
		return 1.0
	var total := 0.0
	for source in sources:
		if source is Dictionary:
			total += source_weight(states, source)
	var average := total / maxf(1.0, float(sources.size()))
	return clampf(average, 0.36, 1.0)

static func pick_weighted_source(states: Dictionary, sources: Array, rng: RandomNumberGenerator) -> Dictionary:
	if sources.is_empty():
		return {}
	var total := 0.0
	for source in sources:
		if source is Dictionary:
			total += maxf(0.05, source_weight(states, source))
	if total <= 0.0:
		return Dictionary(sources[rng.randi_range(0, sources.size() - 1)])
	var roll := rng.randf() * total
	var cursor := 0.0
	for source in sources:
		if not (source is Dictionary):
			continue
		cursor += maxf(0.05, source_weight(states, source))
		if roll <= cursor:
			return Dictionary(source)
	return Dictionary(sources[sources.size() - 1])

static func counts(states: Dictionary) -> Dictionary:
	var result := {
		STATE_ACTIVE: 0,
		STATE_REVEALED: 0,
		STATE_STAMPED: 0,
		STATE_SUPPRESSED: 0,
		STATE_OVERLOADED: 0,
		STATE_SPENT: 0,
	}
	for raw_state in states.values():
		var state := Dictionary(raw_state)
		var state_id := current_state(state)
		result[state_id] = int(result.get(state_id, 0)) + 1
	return result

static func remaining_summary(states: Dictionary) -> String:
	var suppressed := 0.0
	var overloaded := 0.0
	for raw_state in states.values():
		var state := Dictionary(raw_state)
		suppressed = maxf(suppressed, float(state.get("suppression_remaining", 0.0)))
		overloaded = maxf(overloaded, float(state.get("overload_remaining", 0.0)))
	return "supp %.1fs / overload %.1fs" % [suppressed, overloaded]

static func count_summary(states: Dictionary) -> String:
	var c := counts(states)
	return "active=%d revealed=%d stamped=%d suppressed=%d overloaded=%d spent=%d" % [
		int(c.get(STATE_ACTIVE, 0)),
		int(c.get(STATE_REVEALED, 0)),
		int(c.get(STATE_STAMPED, 0)),
		int(c.get(STATE_SUPPRESSED, 0)),
		int(c.get(STATE_OVERLOADED, 0)),
		int(c.get(STATE_SPENT, 0)),
	]

static func compact_debug(states: Dictionary) -> String:
	var parts: Array[String] = []
	for source_id in states.keys():
		var state := Dictionary(states[source_id])
		var state_id := current_state(state)
		parts.append("%s=%s(%.1f/%.1f)" % [
			String(source_id),
			state_id,
			float(state.get("suppression_remaining", 0.0)),
			float(state.get("overload_remaining", 0.0)),
		])
		if parts.size() >= 5:
			break
	if parts.is_empty():
		return "none"
	return ", ".join(parts)
