extends Label
signal me_tomaron

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("gui_input", Callable(self, "_on_input_event"))
	
func _on_input_event(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		tomar_palabra()

var nodo_hijo: Node2D
var palabra_scene = preload("res://scenes/Palabra.tscn")

func tomar_palabra():

	# Crea un nuevo Node2D y asigna el script necesario
	#show

# añade el nodo hijo
	me_tomaron.emit(nodo_hijo)

# Elimínalo la palabra del diccionario
	Game.remove_palabra(text)
	self.queue_free()


	
