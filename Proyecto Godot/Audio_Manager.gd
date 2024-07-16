extends Node
@export var button_sound: AudioStream
@export var button_sound1: AudioStream
@export var bedmaking_sound: AudioStream
@export var meow_sound: AudioStream
@export var pencilwriting_sound: AudioStream
@export var takingobject_sound: AudioStream
@export var mentalbar_sound: AudioStream
@export var switch_sound: AudioStream

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
	
func play_sound_button1():
	await _play_sound(button_sound1)
	
func play_sound_meow():
	await _play_sound(meow_sound)
	
func play_sound_pencilwriting():
	await _play_sound(pencilwriting_sound)
	
func play_sound_takingobject():
	await _play_sound(takingobject_sound)
	
func play_sound_bedmaking():
	await _play_sound(bedmaking_sound)
	
func play_sound_mentalbar():
	await _play_sound(mentalbar_sound)
	
func play_sound_switch():
	await _play_sound(switch_sound)
	
