extends Button
@onready var button = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	button.pressed.connect(_on_pressed)
	
func _on_pressed():
	get_tree().change_scene_to_file("res://scenes/Lvl ale/light.tscn")
