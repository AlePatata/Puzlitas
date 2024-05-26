extends Node2D
@onready var shine = $Shine
@onready var object = $Shine/Object
@onready var raiz_palabras = $Raiz_Palabras
@onready var dictionary = %Dictionary
	
func _ready():
	shine.pressed.connect(_found)
	dictionary.inventario_conectar_ui_palabra.connect(conectar_para_agregar_nodo)

func _found():
	object.set_visibility(false)

func agregar_nodo_palabra(nodo_hijo):
	raiz_palabras.add_child(nodo_hijo)

func conectar_para_agregar_nodo(ui_palabra):
	ui_palabra.me_tomaron.connect(agregar_nodo_palabra)


