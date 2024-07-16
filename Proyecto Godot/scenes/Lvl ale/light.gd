extends Node2D
@onready var raiz_palabras = $Raiz_Palabras
@onready var dictionary = %Dictionary
@onready var label = $Label
@onready var nuevo_stream = preload("res://assets/music/Canciones propias/Alegre.wav")
@onready var audio_player = $AudioStreamPlayer2D
@onready var objects = $Objects
@onready var switch = $Objects/Switch
@onready var background = $Background

@onready var _shader = preload("res://shaders/pruebaDeShader.tscn")

signal eliminar_palabra
signal RecibeTodosJuntos
signal ocultar_whiteCircle

func _ready():
	dictionary.inventario_conectar_ui_palabra.connect(conectar_para_agregar_nodo)
	objects.TodosJuntos.connect(_emitir_RecibeTodosJuntos)
	#raiz_palabras.ordenar_objeto_raiz.connect(_ordenar_objeto)
	objects.palabra_usada.connect(eliminar_palabra_usada)
	switch.apagar_mouse.connect(ocultar_luz)
	switch.hope_usado.connect(eliminar_palabra_usada)
	Game.update()
	print(Game.inventory.palabras)
	#background.apagar_mouse.connect(ocultar_luz)
	
	_start_dialog()
	var shader = _shader.instantiate()
	add_child(shader)
	shader.set_process_input(false)
	
func _start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("Tutorial")
	Dialogic.VAR.set("HOPE", false)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func agregar_nodo_palabra(nodo_hijo):
	raiz_palabras.add_child(nodo_hijo)

func conectar_para_agregar_nodo(ui_palabra):
	ui_palabra.me_tomaron.connect(agregar_nodo_palabra)
	
func mostrar_victoria():
	label.visible = true
	audio_player.stream = nuevo_stream
	audio_player.play()

func _emitir_RecibeTodosJuntos():
	RecibeTodosJuntos.emit()
	
func eliminar_palabra_usada(palabra):
	eliminar_palabra.emit(palabra)

	
func ocultar_luz():
	ocultar_whiteCircle.emit(self)
	



