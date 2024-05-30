extends Node2D

# No olvides asignar el AnimationPlayer en el inspector o por script
@onready var anim_player = $AnimationPlayer

@export var ui_palabra: PackedScene
@onready var palabra_container = %PalabraContainer

signal inventario_conectar_ui_palabra
signal apagar_luz


func _ready():
	Game.palabras_updated.connect(_on_palabras_updated)
	_on_palabras_updated()

func _on_palabras_updated():
	for child in palabra_container.get_children():
		palabra_container.remove_child(child)
		child.queue_free()
	for palabra in Game.inventory.palabras:
		var palabra_inst = ui_palabra.instantiate()
		inventario_conectar_ui_palabra.emit(palabra_inst)
		palabra_container.add_child(palabra_inst)
		palabra_inst.text = palabra

func _on_Book_mouse_entered():
	anim_player.play("asomar_libro")
func _on_area_2d_mouse_entered():
	_on_Book_mouse_entered()

func _on_Book_mouse_exited():
	anim_player.play_backwards("asomar_libro")
func _on_area_2d_mouse_exited():
	_on_Book_mouse_exited()

@warning_ignore("unused_parameter")
func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if Game.current_palabra == "Hope":
				apagar_luz.emit(self)
			if Game.current_palabra:
				Game.add_palabra(Game.current_palabra)
				Game.nodoporeliminar.queue_free()
				Game.current_palabra = null
				Game.nodoporeliminar = null
