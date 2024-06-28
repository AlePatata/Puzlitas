extends Node2D
@onready var object = preload("res://scenes/Lvl ale/object.tscn")
var bed_instance

func _ready():
	_inicializar_marcos()
	start_dialog()
	
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)

func _inicializar_marcos():
	bed_instance = object.instantiate()
	add_child(bed_instance)
	
	var pilow_instance = object.instantiate()
	pilow_instance.position = Vector2(bed_instance.position.x + 400, bed_instance.position.y + 200)
	add_child(pilow_instance)
	pilow_instance.set_sprite("res://assets/pilow.png")
	
	
