extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	connect("input_event", _on_area_2d_input_event)

func _go_to_mental_room():
	show()
	
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		get_tree().change_scene_to_file("res://scenes/Lvl_selector.tscn")
