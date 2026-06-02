extends RefCounted

const STATE_PLAYING = "playing"
const STATE_LEVEL_UP = "level_up"
const STATE_GAME_OVER = "game_over"
const STATE_VICTORY = "victory"
const STATE_RECALLED = "recalled"
const STATE_BOSS_VICTORY = "boss_victory"
const STATE_SUPPLY = "supply"

var current_state := STATE_PLAYING

func _init(initial_state: String = STATE_PLAYING) -> void:
	current_state = initial_state

func change_state(new_state: String) -> void:
	current_state = new_state

func get_state() -> String:
	return current_state

func is_playing() -> bool:
	return current_state == STATE_PLAYING

func is_level_up() -> bool:
	return current_state == STATE_LEVEL_UP

func is_active_gameplay() -> bool:
	return current_state == STATE_PLAYING or current_state == STATE_LEVEL_UP

func is_supply() -> bool:
	return current_state == STATE_SUPPLY

func is_terminal() -> bool:
	return current_state in [STATE_GAME_OVER, STATE_VICTORY, STATE_RECALLED, STATE_BOSS_VICTORY, STATE_SUPPLY]

func is_match_over() -> bool:
	return current_state in [STATE_GAME_OVER, STATE_VICTORY, STATE_RECALLED, STATE_BOSS_VICTORY]
