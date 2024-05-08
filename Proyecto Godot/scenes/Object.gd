extends Area2D

func _ready():
	# Conectar la señal de eventos de entrada de forma más moderna
	connect("input_event", Callable(self, "_on_input_event"))


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Llamar a la función para mover el objeto
		move_object()

func move_object():
	$AnimationPlayer.play("Move")
