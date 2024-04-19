extends CanvasLayer
@onready var brain: Button = $brain_button

# Called when the node enters the scene tree for the first time.
func _ready():
	brain.pressed.connect(_on_brain_pressed)

func _on_brain_pressed():
	get_tree().change_scene_to_file("res://scenes/light.tscn")


