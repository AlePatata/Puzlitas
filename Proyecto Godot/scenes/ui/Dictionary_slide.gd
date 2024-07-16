#El script del diccionario

extends Node2D

@onready var anim_player = $AnimationPlayer
@export var ui_palabra: PackedScene
@onready var palabra_container = %PalabraContainer

signal inventario_conectar_ui_palabra
signal apagar_luz

#siempre actualizar diccionario de palabras
func _ready():
	Game.palabras_updated.connect(_on_palabras_updated)

#va revisando las palabras en el diccionario y les actualiza su valor
func _on_palabras_updated():
	for child in palabra_container.get_children():
		palabra_container.remove_child(child)
		child.queue_free()
	for palabra in Game.inventory.palabras:
		var palabra_inst = ui_palabra.instantiate()
		inventario_conectar_ui_palabra.emit(palabra_inst)
		palabra_container.add_child(palabra_inst)
		palabra_inst.text = palabra
		
#animacion del diccionario		
func _on_Book_mouse_entered():
	anim_player.play("asomar_libro")
func _on_area_2d_mouse_entered():
	_on_Book_mouse_entered()

func _on_Book_mouse_exited():
	anim_player.play_backwards("asomar_libro")
func _on_area_2d_mouse_exited():
	_on_Book_mouse_exited()

#@warning_ignore("unused_parameter")

#Función que define qué pasa cuanod arrastramos una palabra al diccionario
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if Game.current_palabra:
				Game.add_palabra(Game.current_palabra)
				AudioManager.play_sound_pencilwriting()
				if is_instance_valid(Game.nodoporeliminar):
					Game.nodoporeliminar.queue_free()
				if Game.current_palabra == "Hope":
					apagar_luz.emit(self)#apagar la luz cuando guardamos la palabra
				Game.current_palabra = null
				Game.nodoporeliminar = null
