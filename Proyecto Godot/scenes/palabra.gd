extends Node2D

var dragging = false
signal palabra_tomada
signal prender_luz

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
	if palabra == "Hope": prender_luz.emit(self)

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
			Game.current_palabra = self
				
		else:
			dragging = false
			z_index = 0
	
