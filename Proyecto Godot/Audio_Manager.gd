extends Node
@export var button_sound: AudioStream
@export var click_sound: AudioStream


func _play_sound(sound):
	if not sound:
		print('se te olvido poner el sonido')
		return
	var player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = sound
	player.play()
	await player.finished
	player.queue_free()

func play(sound_path):
	var sound = load(sound_path)
	await _play_sound(sound)

func play_sound_button():
	await _play_sound(button_sound)
	
func play_sound_click():
	await _play_sound(click_sound)
	
