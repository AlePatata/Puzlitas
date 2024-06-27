extends Node2D
@onready var marco_scene = preload("res://scenes/Frame.tscn")
var marco_instance_1

func _ready():
	_inicializar_marcos()
	start_dialog()
	
func start_dialog():
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start("LvlSelector")
	
func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	print("terminó")
	marco_instance_1.desbloquear()

func _inicializar_marcos():
	marco_instance_1 = marco_scene.instantiate()
	add_child(marco_instance_1)
	
	var marco_instance_2 = marco_scene.instantiate()
	marco_instance_2.position = Vector2(marco_instance_1.position.x + 400, marco_instance_1.position.y + 200)
	add_child(marco_instance_2)
	marco_instance_2.set_marco("res://assets/Frame17.png")
	
	var marco_instance_3 = marco_scene.instantiate()
	marco_instance_3.position = Vector2(marco_instance_1.position.x + 800, marco_instance_1.position.y)
	add_child(marco_instance_3)
	marco_instance_3.set_marco("res://assets/Frame17.png")
