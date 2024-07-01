extends Node2D

class_name Objeto 
signal juntos
signal separados
@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D

var dragging = false

func _ready():
	connect("area_entered", _on_Area2D_body_entered)
	connect("area_exited", _on_Area2D_body_exited)
	connect("input_event", _on_area_2d_input_event)

func _physics_process(delta): 
	var mouse = get_global_mouse_position()
	if mouse.y < 300:
		dragging = false
	if dragging:
		global_position = lerp(position, mouse, 30 * delta) 
	else: dragging = false
	
func _ordenar(): 
	set_sprite("res://assets/icon.svg")
	#victoria.emit()
	
func set_sprite(ruta = "res://assets/icon.svg"): #Godot por defecto
	sprite.texture = load(ruta)
	if sprite.texture:
		standardize_sprite_size(Vector2(150, 150))
		update_collision_shape()
		
func standardize_sprite_size(size: Vector2):
	if sprite.texture:
		var texture_size = sprite.texture.get_size()
		var scale = size / texture_size
		sprite.scale = scale

func update_collision_shape():
	if sprite.texture:
		var texture_size = sprite.texture.get_size() * sprite.scale
		if collision_shape.shape is RectangleShape2D:
			collision_shape.shape.extents = texture_size / 2
		elif collision_shape.shape is CapsuleShape2D:
			var radius = min(texture_size.x, texture_size.y) / 2
			collision_shape.shape.radius = radius
			collision_shape.shape.height = texture_size.y - 2 * radius
		elif collision_shape.shape is CircleShape2D:
			collision_shape.shape.radius = min(texture_size.x, texture_size.y) / 2
   
#func _move_object():
#	$AnimationPlayer.play("Move")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
		else: 
			dragging = false

func _on_Area2D_body_entered(area):
	if area.is_in_group("objetos"): # Puedes usar grupos para filtrar objetos
		juntos.emit()
		print("se emitió juntos")
		

# Función que se llama cuando un cuerpo sale del área
func _on_Area2D_body_exited(area):
	if area.is_in_group("objetos"):
		print("se emitió separados")
		separados.emit()
