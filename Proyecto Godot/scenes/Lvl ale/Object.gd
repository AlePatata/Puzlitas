extends Node2D
var nueva_textura = preload("res://assets/icon.svg")  # Cambia esto por la ruta correcta a tu archivo de textura
signal victoria

func _ready():
	pass
	
#func _physics_process(delta):
	#for emisor in raiz_palabras.get_children():
#		if not emisor.is_connected("ordenar_objeto", Callable(self, "_ordenar")):
#			emisor.ordenar_objeto.connect(Callable(self, "_ordenar"))
#			print("Señal recibida")
	
func _ordenar():
	var sprite = $Sprite2D  # Asegúrate de que 'Sprite2D' coincida con el nombre del nodo Sprite en la jerarquía
	sprite.texture = nueva_textura
	victoria.emit()
	
	
	
func _move_object():
	$AnimationPlayer.play("Move")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			print(Game.current_palabra)
			if Game.current_palabra == "Get your life together":
				_ordenar()
