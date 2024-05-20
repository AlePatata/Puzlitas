extends Area2D

@onready var white_circle = $"../Camera2D/whiteCircle"

func _ready():
	# Conectar la señal de eventos de entrada de forma más moderna
	connect("input_event", Callable(self, "_on_input_event"))


func _on_input_event(viewport, event, shape_idx):
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Llamar a la función para mover el objeto
		_on_pressed()
		

func _on_pressed() -> void:
	white_circle.pressed()
