extends Node2D
@onready var object = preload("res://scenes/Lvl ale/object.tscn")
var bed_instance
var pilow_instance
var blanket_instance
signal TodosJuntos
var objetos = {}
@onready var switch = $Switch

func _ready():
	_inicializar_objetos()
	start_dialog()
	
		
func _physics_process(_delta):
	
	if len(objetos.values()) == 3:
		if objetos.values()[0] and objetos.values()[1] and objetos.values()[2]:
			TodosJuntos.emit()
		
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func _inicializar_objetos():
	bed_instance = object.instantiate()
	add_child(bed_instance)
	bed_instance.set_sprite("res://assets/cama deshecha.png")
	bed_instance.position = Vector2(switch.position.x + 300, switch.position.y + 200)
	
	pilow_instance = object.instantiate()
	add_child(pilow_instance)
	pilow_instance.set_sprite("res://assets/almohadas (1).png")
	pilow_instance.position = Vector2(bed_instance.position.x + 300, bed_instance.position.y + 100)
	
	blanket_instance = object.instantiate()
	add_child(blanket_instance)
	blanket_instance.set_sprite("res://assets/manta.png")
	blanket_instance.position = Vector2(pilow_instance.position.x + 300, pilow_instance.position.y - 100)
	for i in get_children():
		i.juntos.connect(_Verifica.bind(i, true)) 
		i.separados.connect(_Verifica.bind(i, false)) 
	
func _Verifica(objeto, estan_juntos):
	print("se añadió el objeto: ", objeto.name)
	objetos[objeto] = estan_juntos
