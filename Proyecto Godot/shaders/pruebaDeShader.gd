extends Node2D

var shader_material : ShaderMaterial
@onready var color_rect = $CanvasLayer/ColorRect
@onready var control = $CanvasLayer2/Control

@onready var progress_bar = control.get_child(0).get_child(0)

var health = 1.0
func _ready():
	shader_material = color_rect.material
	

func _process(delta):
	# Cambiar el color con el tiempo (ejemplo)
	health = float(progress_bar.value)/100.0
	shader_material.set_shader_parameter("health", health)
	#print(shader_material.get_shader_parameter("color"))
