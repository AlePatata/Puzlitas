extends Area2D
@export var ruta_nivel = "res://scenes/Lvl ale/light.tscn"
@export var desbloqueado = false
@onready var reflejo_1 = $"reflejo"
@onready var Marco: Sprite2D = $Marco
@export var mostrar = true


func _ready():
	connect("input_event", _on_marco)
	connect("mouse_entered", Callable(self, "cambiar_reflejo"))
	connect("mouse_exited", Callable(self, "cambiar_reflejo"))

func _on_marco(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and desbloqueado:
		get_tree().change_scene_to_file(ruta_nivel)
		
func cambiar_reflejo():
	mostrar = !mostrar
		
func _physics_process(delta):
	if mostrar:
		reflejo_1.show()
	elif !mostrar and desbloqueado:
		reflejo_1.hide()
		
func set_marco(ruta = "res://assets/Frame17.png"):
	Marco.texture = load(ruta)

func desbloquear():
	desbloqueado = true
	print("El nivel se desbloqueó")
