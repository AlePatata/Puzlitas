extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start("jiji")
	$AudioStreamPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event: InputEvent):
	if Dialogic.current_timeline != null:
		return

	if event is InputEventKey and event.keycode == KEY_ENTER and event.pressed:
		Dialogic.start('jiji')
		get_viewport().set_input_as_handled()
