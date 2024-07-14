extends Node2D
@onready var object = preload("res://scenes/Lvl ale/object.tscn")
var bed
var pillow
var blanket
signal TodosJuntos
var objetos = {}
var usando_getyourlifetogether = false
var estamos_juntos = false
signal palabra_usada
@onready var switch = $Switch

func _ready():
	_inicializar_objetos()
	start_dialog()

func _physics_process(_delta):
	if len(objetos.values()) == 3:
		if objetos.values()[0] and objetos.values()[1] and objetos.values()[2]:
			#TodosJuntos.emit()# esto se puede borrar
			estamos_juntos = true
			if usando_getyourlifetogether and estamos_juntos: #si todos los objetos están juntos y usamos la palabra, se hace la cama
				hacerlacama()
		
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func _inicializar_objetos():
	bed = object.instantiate()
	add_child(bed)
	bed.set_sprite("res://assets/cama deshecha.png")
	bed.position = Vector2(switch.position.x + 300, switch.position.y + 200)
	
	pillow = object.instantiate()
	add_child(pillow)
	pillow.set_sprite("res://assets/almohadas (1).png")
	pillow.position = Vector2(bed.position.x + 300, bed.position.y + 100)
	
	blanket = object.instantiate()
	add_child(blanket)
	blanket.set_sprite("res://assets/manta.png")
	blanket.position = Vector2(pillow.position.x + 300, pillow.position.y - 100)
	for i in get_children():
		i.set_padre(self) #declaro al padre
		i.juntos.connect(_Verifica.bind(i, true)) 
		i.separados.connect(_Verifica.bind(i, false)) 
	
func _Verifica(objeto, estan_juntos):
	#print("se añadió el objeto: ", objeto.name)
	objetos[objeto] = estan_juntos
	
func getyourlifetogether():
	if estamos_juntos:
		usando_getyourlifetogether = true 
	

func hacerlacama():
	bed.set_sprite("res://assets/cama hecha.png")
	pillow.queue_free()
	blanket.queue_free()
	palabra_usada.emit("Get your life together")
