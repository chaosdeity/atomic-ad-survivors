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

static func _wav_from_data(sample_rate: int, data: PackedByteArray) -> AudioStreamWAV:
	var stream := AudioStreamWAV.new()
	stream.format = AudioStreamWAV.FORMAT_16_BITS
	stream.mix_rate = sample_rate
	stream.stereo = false
	stream.data = data
	return stream
