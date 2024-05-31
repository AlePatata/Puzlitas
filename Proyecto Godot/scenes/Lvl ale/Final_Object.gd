extends Area2D
@onready var objects = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	var otro_objeto = objects.get_child(1)
	global_position = otro_objeto.global_position
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
