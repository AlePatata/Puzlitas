extends Node2D

# No olvides asignar el AnimationPlayer en el inspector o por script
@onready var anim_player = $AnimationPlayer

@export var ui_palabra: PackedScene
@onready var palabra_container = %PalabraContainer

signal light_conectar_ui_palabra

func _ready():
	Game.palabras_updated.connect(_on_palabras_updated)

func _on_palabras_updated():
	for child in palabra_container.get_children():
		palabra_container.remove_child(child)
		child.queue_free()
	print(Game.inventory.palabras)
	for palabra in Game.inventory.palabras:
		var palabra_inst = ui_palabra.instantiate()
		light_conectar_ui_palabra.emit(palabra_inst)
		palabra_container.add_child(palabra_inst)
		print(palabra)
		palabra_inst.text = palabra

func _on_Book_mouse_entered():
	anim_player.play("asomar_libro")
func _on_area_2d_mouse_entered():
	_on_Book_mouse_entered()

func _on_Book_mouse_exited():
	anim_player.play_backwards("asomar_libro")
func _on_area_2d_mouse_exited():
	_on_Book_mouse_exited()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			if Game.current_palabra:
				Game.add_palabra(Game.current_palabra.palabra)
				Game.current_palabra.queue_free()
				Game.current_palabra = null

