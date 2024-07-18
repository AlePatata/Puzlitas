extends Node2D
@onready var raiz_palabras = $Raiz_Palabras
@onready var dictionary = %Dictionary
@onready var label = $Label
@onready var nuevo_stream = preload("res://assets/music/Canciones propias/Alegre.wav")
@onready var audio_player = $AudioStreamPlayer2D
@onready var objects = $Objects
@onready var switch = $Objects/Switch
@onready var background = $Background
@onready var node_2d_2 = $Node2D2
@onready var node_2d = $Node2D


@onready var _shader = preload("res://shaders/pruebaDeShader.tscn")

var shader

signal eliminar_palabra
signal RecibeTodosJuntos
signal ocultar_whiteCircle

func _ready():
	node_2d.hide()
	node_2d_2.hide()
	dictionary.inventario_conectar_ui_palabra.connect(conectar_para_agregar_nodo)
	objects.palabra_usada.connect(eliminar_palabra_usada)
	switch.apagar_mouse.connect(ocultar_luz)
	switch.hope_usado.connect(eliminar_palabra_usada)
	switch.mental_health_increase.connect(increase_progress_bar)
	
	Game.update() #importante para que funcione el diccionario correctamente
	
	if not Globals.light_dialog_started:
		_start_dialog()
		Globals.light_dialog_started = true #para decir que ya se reprodujo una vez
	
	shader = _shader.instantiate()
	add_child(shader)
	shader.set_process_input(false)
	
func _process(delta):
	if Globals.fin:
		shader.hide()
	
func increase_progress_bar():
	if shader:
		shader.increase(10)	
	
func _start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("Tutorial")

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func agregar_nodo_palabra(nodo_hijo):
	raiz_palabras.add_child(nodo_hijo)

func conectar_para_agregar_nodo(ui_palabra):
	ui_palabra.me_tomaron.connect(agregar_nodo_palabra)

func eliminar_palabra_usada(palabra):
	eliminar_palabra.emit(palabra)

func ocultar_luz():
	ocultar_whiteCircle.emit(self)
