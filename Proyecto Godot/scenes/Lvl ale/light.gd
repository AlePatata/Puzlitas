extends Node2D
@onready var raiz_palabras = $Raiz_Palabras
@onready var dictionary = %Dictionary
@onready var label = $Label
@onready var nuevo_stream = preload("res://assets/music/Canciones propias/Alegre.wav")
@onready var audio_player = $AudioStreamPlayer2D
@onready var objects = $Objects
@onready var switch = $Objects/Switch
@onready var background = $Background

signal eliminar_palabra
signal RecibeTodosJuntos
signal ocultar_whiteCircle

func _ready():
	dictionary.inventario_conectar_ui_palabra.connect(conectar_para_agregar_nodo)
	objects.TodosJuntos.connect(_emitir_RecibeTodosJuntos)
	objects.palabra_usada.connect(eliminar_palabra_usada)
	switch.apagar_mouse.connect(ocultar_luz)
	switch.hope_usado.connect(eliminar_palabra_usada)
	Game.update()
	#background.apagar_mouse.connect(ocultar_luz)
	
	_start_dialog()
	
func _start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("Tutorial")
	Dialogic.VAR.set("HOPE", false)

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func agregar_nodo_palabra(nodo_hijo):
	raiz_palabras.add_child(nodo_hijo)

func conectar_para_agregar_nodo(ui_palabra):
	print("señal recibida por light")
	ui_palabra.me_tomaron.connect(agregar_nodo_palabra)
	
func mostrar_victoria():
	label.visible = true
	audio_player.stream = nuevo_stream
	audio_player.play()

func _emitir_RecibeTodosJuntos():
	RecibeTodosJuntos.emit()
	print("se emitio RecibeTodosJuntos")
	
func eliminar_palabra_usada(palabra):
	print("la señal de eliminar se envió desde light")
	eliminar_palabra.emit(palabra)

	
func ocultar_luz():
	ocultar_whiteCircle.emit(self)
	



