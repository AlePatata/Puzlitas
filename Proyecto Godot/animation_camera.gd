extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("El nodo está listo y ha entrado en la escena")
	var animation_player = $AnimationPlayer  # Asume que hay un nodo AnimationPlayer como hijo
	animation_player.play("avanza")  # Reemplaza con el nombre real de tu animación


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
