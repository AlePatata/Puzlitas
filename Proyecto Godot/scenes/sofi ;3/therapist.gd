extends Node2D
@onready var mental_room_button = $MentalRoomButton

func _ready():
	start_dialog()
	
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("jiji")
	$AudioStreamPlayer.play()
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	mental_room_button._go_to_mental_room()
 
func _input(event: InputEvent):
	#if Dialogic.current_timeline != null:
	#	return
	pass
	#if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		#Dialogic.start('jiji')
		#get_viewport().set_input_as_handled()
