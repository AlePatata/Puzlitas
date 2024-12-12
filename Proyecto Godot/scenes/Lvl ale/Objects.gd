extends Node2D
@onready var object = preload("res://scenes/Lvl ale/object.tscn")
@onready var bed = $Bed
@onready var pillow = $Pillow
@onready var blanket = $Blanket
@onready var timer = $"../Timer"
@onready var timer2 = $"../Timer2"
@onready var node_final = $"../Node2D"
@onready var dictionary = %Dictionary
@onready var camera_2d = $"../Camera2D"



signal TodosJuntos
var objetos = {}
var usando_getyourlifetogether = false
var estamos_juntos = false
signal palabra_usada
@onready var switch = $Switch


func _ready():
	_inicializar_objetos()
	_actualizar_posiciones()
	#start_dialog()
	if Globals.cama_hecha:
		hacerlacama()
	
	

func _physics_process(_delta):
	if len(objetos.values()) == 3:
		if objetos.values()[0] and objetos.values()[1] and objetos.values()[2]:
			estamos_juntos = true
			if usando_getyourlifetogether and estamos_juntos: #si todos los objetos están juntos y usamos la palabra, se hace la cama
				hacerlacama()
	for i in get_children():
		if Globals.switch_on:
			i.show() #muestra los objetos si prendí la luz
		else: i.hide() #los oculta si no he prendido la luz
		
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func _inicializar_objetos():
	#bed.set_sprite("res://assets/cama deshecha.png")
	#pillow.set_sprite("res://assets/almohadas (1).png")
	#blanket.set_sprite("res://assets/manta.png")
	for i in get_children():
		if i.name != "Switch":
			i.set_padre(self) #declaro al padre
			i.juntos.connect(_Verifica.bind(i, true)) 
			i.separados.connect(_Verifica.bind(i, false)) 
		
		
func _actualizar_posiciones():
	if not Globals.objects_positions.is_empty():
		bed.position = Globals.get_object_position("Bed")
		pillow.position = Globals.get_object_position("Pillow")
		blanket.position = Globals.get_object_position("Blanket")
	
func _Verifica(objeto, estan_juntos):
	objetos[objeto] = estan_juntos
	
func getyourlifetogether():
	if estamos_juntos:
		usando_getyourlifetogether = true 

func hacerlacama():
	bed.set_sprite("res://assets/cama hecha.png")
	pillow.queue_free()
	blanket.queue_free()
	palabra_usada.emit("Get your life together")
	Globals.cama_hecha = true
	AudioManager.play_sound_bedmaking()
	timer.start(3)


func _on_timer_timeout():
	Dialogic.start_timeline("CamaHecha")
	timer2.start(10)

func _on_timer_2_timeout():
	
	get_tree().change_scene_to_file("res://scenes/Lvl ale/timepassing.tscn")
	#camera_2d.position = Vector2(640,360)
	#node_final.show()
	#dictionary.hide()
	#$"../Background".hide()
	#$"../BackgMovement".hide()
	#Globals.fin = true
	#$"../Node2D/Timer"
