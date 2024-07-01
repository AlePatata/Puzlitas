extends CanvasLayer
@onready var dic_button = $Dic_button


# Called when the node enters the scene tree for the first time.
func _ready():
	# Desconecta primero la señal en caso de que ya esté conectada
	if dic_button.pressed.is_connected(_on_dic_button_pressed):
		dic_button.pressed.disconnect(_on_dic_button_pressed)
	# Conecta la señal
	dic_button.pressed.connect(_on_dic_button_pressed)

func _on_dic_button_pressed():
	print("Hola")
	get_tree().change_scene("res://scenes/Lvl ale/RecogerHope.tscn")

