extends Node2D
@onready var raiz_palabras = $Raiz_Palabras
@onready var dictionary = %Dictionary
@onready var flecha_izq = $flecha_izq
@onready var flecha_der = $flecha_der


signal ocultar_whiteCircle

func _ready():
	dictionary.inventario_conectar_ui_palabra.connect(conectar_para_agregar_nodo)
	#print(Dialogic.simple_history_content())

func agregar_nodo_palabra(nodo_hijo):
	raiz_palabras.add_child(nodo_hijo)

func conectar_para_agregar_nodo(ui_palabra):
	ui_palabra.me_tomaron.connect(agregar_nodo_palabra)
	
func ocultar_luz():
	ocultar_whiteCircle.emit()

		
func _on_area_2d_pressed(): #flecha_der_pressed
	for object in get_tree().get_nodes_in_group("page1"):
		hide()
	flecha_izq.show()
	flecha_der.hide()


func _on_flecha_izq_pressed():
	for object in get_tree().get_nodes_in_group("page2"):
		hide()
	flecha_der.show()
	flecha_izq.hide()
