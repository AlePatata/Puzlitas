#Este script es para eliminar una palabra cuando ya estaba en nuestro diccionario
extends Label
signal me_tomaron
signal prender_luz
signal ordenar_objeto
var nodo_hijo: Node2D
var palabra_scene = preload("res://scenes/Lvl ale/palabra.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("gui_input", Callable(self, "_on_input_event"))
	
#Si tomamos la palabra
func _on_input_event(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		tomar_palabra()

func tomar_palabra(): #tomarla del diccionario
	Game.current_palabra = text
	if text == "Hope": 
		prender_luz.emit(self)
	
	# Crea un Nodo2D para la palabra para que aparezca en el mundo del juego.
	nodo_hijo = palabra_scene.instantiate()
	nodo_hijo.palabra = text
	nodo_hijo.dragging = true

	# añade el nodo hijo al mundo
	me_tomaron.emit(nodo_hijo)

	# Elimina la palabra del diccionario
	Game.remove_palabra(text)
	self.queue_free()
	Game.current_palabra = null
	Game.nodoporeliminar = null
	Game.nodoporeliminar = nodo_hijo

	

