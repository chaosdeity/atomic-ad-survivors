extends RefCounted

static func make_tone_stream(start_hz: float, seconds: float, volume: float, end_hz: float = -1.0) -> AudioStreamWAV:
	var sample_rate := 22050
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var phase := 0.0
	for i in range(count):
		var t := float(i) / float(maxi(1, count - 1))
		var hz := lerpf(start_hz, end_hz if end_hz > 0.0 else start_hz, t)
		phase += TAU * hz / sample_rate
		var env := sin(PI * t)
		var sample := int(clampf(sin(phase) * env * volume, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	return _wav_from_data(sample_rate, data)

static func make_burst_stream(seconds: float, rng: RandomNumberGenerator) -> AudioStreamWAV:
	var sample_rate := 22050
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var phase_low := 0.0
	var phase_high := 0.0
	for i in range(count):
		var t := float(i) / float(maxi(1, count - 1))
		var env := pow(1.0 - t, 2.2)
		phase_low += TAU * lerpf(120.0, 48.0, t) / sample_rate
		phase_high += TAU * lerpf(1200.0, 240.0, t) / sample_rate
		var noise := rng.randf_range(-1.0, 1.0) * 0.18
		var wave := sin(phase_low) * 0.42 + sin(phase_high) * 0.18 + noise
		var sample := int(clampf(wave * env * 0.85, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	return _wav_from_data(sample_rate, data)

static func make_double_tone_stream(first_hz: float, second_hz: float, seconds: float, volume: float) -> AudioStreamWAV:
	var sample_rate := 22050
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var phase := 0.0
	for i in range(count):
		var t := float(i) / float(maxi(1, count - 1))
		var split := 0.46
		var hz := first_hz if t < split else second_hz
		phase += TAU * hz / sample_rate
		var local_t := t / split if t < split else (t - split) / (1.0 - split)
		var env := sin(PI * clampf(local_t, 0.0, 1.0)) * (1.0 - t * 0.25)
		var sample := int(clampf(sin(phase) * env * volume, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	return _wav_from_data(sample_rate, data)

static func make_noise_sweep_stream(start_hz: float, end_hz: float, seconds: float, volume: float, rng: RandomNumberGenerator, noise_amount: float = 0.18) -> AudioStreamWAV:
	var sample_rate := 22050
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var phase := 0.0
	for i in range(count):
		var t := float(i) / float(maxi(1, count - 1))
		var hz := lerpf(start_hz, end_hz, t)
		phase += TAU * hz / sample_rate
		var attack := clampf(t / 0.08, 0.0, 1.0)
		var env := attack * pow(1.0 - t, 1.55)
		var noise := rng.randf_range(-1.0, 1.0) * noise_amount
		var wave := sin(phase) * (1.0 - noise_amount * 0.45) + noise
		var sample := int(clampf(wave * env * volume, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	return _wav_from_data(sample_rate, data)

static func make_sfx_stream(name: String, rng: RandomNumberGenerator) -> AudioStreamWAV:
	var key := name
	if key.begins_with("sfx_"):
		key = key.substr(4)
	if key == "auto_attack_fire":
		key = "auto_fire"
	elif key == "auto_attack_hit" or key == "enemy_hit_paper" or key == "enemy_hit_appliance":
		key = "enemy_hit"
	elif key == "mark_apply":
		key = "return_stamp_mark"
	elif key == "mark_expire":
		key = "return_stamp_expire"
	elif key == "return_stamp_pierce_bonus":
		key = "return_stamp_combo"
	elif key == "pressure_ring_warn":
		key = "pressure_ring"
	elif key == "flyer_drop_warn":
		key = "danger_flyer_drop"
	elif key == "boss_pattern_warn":
		key = "boss_warning"
	match key:
		"auto_fire":
			return make_noise_sweep_stream(1180.0, 620.0, 0.055, 0.13, rng, 0.08)
		"enemy_hit":
			return make_tone_stream(1320.0, 0.050, 0.070, 920.0)
		"return_stamp_ready":
			return make_double_tone_stream(520.0, 860.0, 0.200, 0.140)
		"return_stamp_hit":
			return make_noise_sweep_stream(180.0, 920.0, 0.125, 0.180, rng, 0.14)
		"return_stamp_whiff":
			return make_noise_sweep_stream(460.0, 120.0, 0.150, 0.100, rng, 0.24)
		"return_stamp_mark":
			return make_double_tone_stream(780.0, 430.0, 0.090, 0.080)
		"return_stamp_expire":
			return make_noise_sweep_stream(360.0, 940.0, 0.120, 0.080, rng, 0.22)
		"return_stamp_combo":
			return make_double_tone_stream(900.0, 1320.0, 0.180, 0.110)
		"enemy_kill":
			return make_burst_stream(0.180, rng)
		"xp_pickup":
			return make_tone_stream(980.0, 0.080, 0.070, 1280.0)
		"speaker_pulse":
			return make_double_tone_stream(450.0, 170.0, 0.260, 0.105)
		"charger_warn":
			return make_noise_sweep_stream(240.0, 920.0, 0.240, 0.105, rng, 0.12)
		"charger_dash":
			return make_burst_stream(0.145, rng)
		"pressure_ring":
			return make_double_tone_stream(230.0, 440.0, 0.300, 0.100)
		"pressure_ring_hit":
			return make_burst_stream(0.220, rng)
		"danger_flyer_drop":
			return make_noise_sweep_stream(920.0, 1240.0, 0.240, 0.085, rng, 0.26)
		"danger_flyer_hit":
			return make_double_tone_stream(640.0, 280.0, 0.130, 0.095)
		"boss_warning":
			return make_double_tone_stream(680.0, 430.0, 0.300, 0.110)
		"boss_hit":
			return make_double_tone_stream(170.0, 260.0, 0.110, 0.100)
		"boss_core_expose":
			return make_noise_sweep_stream(320.0, 760.0, 0.280, 0.125, rng, 0.16)
		"outpost_return":
			return make_double_tone_stream(300.0, 620.0, 0.260, 0.115)
		"upgrade_buy":
			return make_double_tone_stream(620.0, 980.0, 0.180, 0.120)
		"result_settle":
			return make_noise_sweep_stream(540.0, 220.0, 0.220, 0.105, rng, 0.18)
		_:
			return make_tone_stream(520.0, 0.100, 0.080, 520.0)

static func make_placeholder_loop_stream(name: String, rng: RandomNumberGenerator) -> AudioStreamWAV:
	var sample_rate := 22050
	var seconds := 4.0
	var count := int(sample_rate * seconds)
	var data := PackedByteArray()
	data.resize(count * 2)
	var low_hz := 86.0
	var mid_hz := 172.0
	var tick_hz := 620.0
	var volume := 0.045
	var tick_rate := 1.0
	if name == "amb_outpost_loop":
		low_hz = 72.0
		mid_hz = 144.0
		tick_hz = 420.0
		volume = 0.035
		tick_rate = 0.50
	elif name == "bgm_boss_smile_home":
		low_hz = 104.0
		mid_hz = 312.0
		tick_hz = 780.0
		volume = 0.058
		tick_rate = 2.0
	var phase_low := 0.0
	var phase_mid := 0.0
	var phase_tick := 0.0
	for i in range(count):
		var t := float(i) / float(sample_rate)
		phase_low += TAU * low_hz / sample_rate
		phase_mid += TAU * (mid_hz + sin(t * TAU * 0.25) * 3.0) / sample_rate
		phase_tick += TAU * tick_hz / sample_rate
		var beat := fposmod(t * tick_rate, 1.0)
		var tick_env := pow(1.0 - beat, 8.0) if beat < 0.35 else 0.0
		var boss_square := (1.0 if sin(phase_mid) >= 0.0 else -1.0) * 0.035 if name == "bgm_boss_smile_home" else 0.0
		var paper_noise := rng.randf_range(-1.0, 1.0) * 0.018
		var wave := sin(phase_low) * 0.44 + sin(phase_mid) * 0.16 + sin(phase_tick) * tick_env * 0.18 + boss_square + paper_noise
		var sample := int(clampf(wave * volume, -1.0, 1.0) * 32767.0)
		data.encode_s16(i * 2, sample)
	var stream := _wav_from_data(sample_rate, data)
	stream.loop_mode = AudioStreamWAV.LOOP_FORWARD
	stream.loop_begin = 0
	stream.loop_end = count
	return stream

static func _wav_from_data(sample_rate: int, data: PackedByteArray) -> AudioStreamWAV:
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = sample_rate
	stream.stereo = false
	stream.data = data
	return stream
