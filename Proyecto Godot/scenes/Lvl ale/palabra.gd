extends Node2D

var dragging = false
signal palabra_tomada
signal ordenar_objeto
@onready var light = $"../.."
var new_position


#para que el label siempre sea el correspondiente a la palabra
@export var palabra: String:
	set(value):
		palabra = value
		if label:
			label.text = palabra
		
@onready var label = $Label

#Hace que la palabra sea igual a su valor al iniciar la escena 
func _ready():
	self.palabra = palabra
	#el siguiente codigo es para que se conecte a la señal de light ssi está en la escena de light.
	var parent = get_parent()
	if parent:
		var grandparent = parent.get_parent()
		if grandparent and grandparent.name == "Light":
			light.eliminar_palabra.connect(quit_self)
			print("la señal de eliminar desde light llegó a la palabra")
			


func _physics_process(delta): 
	#si arrastro, puedo cambiar la posición de mi palabra u objeto
	if dragging:
		global_position = lerp(global_position, get_global_mouse_position(), 30 * delta) 
		z_index = 10
	else:
		z_index = 0
	
	
	
			

func _on_area_2d_input_event(viewport, event, shape_idx):
	#si hice click sobre mi palabra u objeto
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			z_index = 10 #le cambio el z_index para que se vea sobre el diccionario. 
			palabra_tomada.emit(self)
			Game.current_palabra = palabra
			Game.nodoporeliminar = self
				
		else:
			dragging = false
			z_index = 0
			new_position = self.position
			Globals.save_word_position(self.name, new_position)
	
#func _ordenar():
#	print("hola0") #este sí se printea
#	ordenar_objeto.emit() #esta señal sí se emite porque se printea el hola

func quit_self(palabra):
	if self.palabra == palabra:
		self.queue_free()
	
	
	
	
	
	
