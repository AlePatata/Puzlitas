extends Node2D
@onready var marco_scene = preload("res://scenes/Frame.tscn")
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var marco_instance_1 = $Area2D



func _ready():
	_inicializar_marcos()
	start_dialog()
	
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	marco_instance_1.desbloquear()
	audio_stream_player_2d.stop()
	await AudioManager.play_sound_button1()
	
	audio_stream_player_2d.play()
	

func _inicializar_marcos():
	
	var marco_instance_2 = marco_scene.instantiate()
	marco_instance_2.position = Vector2(marco_instance_1.position.x + 800, marco_instance_1.position.y + 200)
	add_child(marco_instance_2)
	marco_instance_2.set_marco("res://assets/fotos/Frame18.png")
	
	var marco_instance_3 = marco_scene.instantiate()
	marco_instance_3.position = Vector2(marco_instance_1.position.x + 1200, marco_instance_1.position.y)
	add_child(marco_instance_3)
	marco_instance_3.set_marco("res://assets/fotos/Frame23.png")
