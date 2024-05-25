extends CanvasLayer
@onready var brain_button = $brain_button

# Called when the node enters the scene tree for the first time.
func _ready():
	brain_button.pressed.connect(_on_brain_pressed)

func _on_brain_pressed():
	get_tree().change_scene_to_file("res://scenes/Lvl ale/light.tscn")


