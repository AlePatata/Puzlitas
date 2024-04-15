extends CharacterBody2D

@onready var background = $"../Background"

func _physics_process(delta) -> void:
	global_position = get_global_mouse_position()
	while not is_on_wall(): 
		background.global_position = get_global_mouse_position()
	
