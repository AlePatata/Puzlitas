extends Sprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta) -> void:
	global_position = get_global_mouse_position()
