extends Node2D
@onready var object = preload("res://scenes/Lvl ale/object.tscn")
var bed_instance
var pilow_instance
var TodosJuntos = false
var objetos = {}
@onready var switch = $Switch

func _ready():
	_inicializar_objetos()
	start_dialog()
		
func _physics_process(_delta):
	for i in get_children():
		if i:
			if not i.is_connected("juntos", Callable(self, "_Verifica").bind([i, true])):
				i.connect("juntos", Callable(self, "_Verifica").bind([i, true])) 
			if not i.is_connected("separados", Callable(self, "_Verifica").bind([i, false])):
				i.connect("separados", Callable(self, "_Verifica").bind([i, false]))
	if !objetos.is_empty():
		if objetos.values():
			TodosJuntos.emit()

func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func _inicializar_objetos():
	bed_instance = object.instantiate()
	add_child(bed_instance)
	bed_instance.set_sprite("res://assets/bed.png")
	
	pilow_instance = object.instantiate()
	bed_instance.position = Vector2(switch.position.x + 600, switch.position.y + 200)
	pilow_instance.position = Vector2(bed_instance.position.x + 600, bed_instance.position.y + 100)
	add_child(pilow_instance)
	pilow_instance.set_sprite("res://assets/pilow.png")
	
func _Verifica(objeto, estan_juntos):
	print("se añadió el objeto: ", objeto.name)
	objetos[objeto] = estan_juntos
