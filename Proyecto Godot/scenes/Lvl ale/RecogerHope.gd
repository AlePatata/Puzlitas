extends Node2D
@onready var raiz_palabras = $Raiz_Palabras
@onready var dictionary = %Dictionary
@onready var flecha_izq = $flecha_izq
@onready var flecha_der = $flecha_der


signal ocultar_whiteCircle
signal get_recoger

func _ready():
	dictionary.inventario_conectar_ui_palabra.connect(conectar_para_agregar_nodo)

func agregar_nodo_palabra(nodo_hijo):
	raiz_palabras.add_child(nodo_hijo)

func conectar_para_agregar_nodo(ui_palabra):
	ui_palabra.me_tomaron.connect(agregar_nodo_palabra)
	
func ocultar_luz():
	ocultar_whiteCircle.emit()

		
func _on_area_2d_pressed(): #flecha_der_pressed
	AudioManager.play_sound_takingobject()
	page_2()
	
func page_2():
	for object in get_tree().get_nodes_in_group("page1"):
		object.hide()
	for object in get_tree().get_nodes_in_group("page2"):
		object.show()
	flecha_izq.show()
	flecha_der.hide()
	Globals.page_1 = false

func _on_flecha_izq_pressed():
	AudioManager.play_sound_takingobject()
	page_1()

func page_1():	
	for object in get_tree().get_nodes_in_group("page2"):
		object.hide()
	for object in get_tree().get_nodes_in_group("page1"):
		object.show()
	flecha_der.show()
	flecha_izq.hide()
	Globals.page_1 = true

