extends Node2D

class_name Objeto 
signal victoria
@onready var sprite = $CollisionShape2D/Sprite2D
@onready var collision_shape = $CollisionShape2D
<<<<<<< HEAD
var dragging = false
=======


>>>>>>> a7ec5fdf06a64c69638aeb9930390d28ed6a977b

func _ready():
	connect("input_event", Callable(self, "_on_area_2d_input_event"))
	
func _physics_process(delta): 
	var mouse = get_global_mouse_position()
	if mouse.y < 300:
		dragging = false
	if dragging:
		position = lerp(position, mouse, 30 * delta) 

	
func _ordenar(): 
	set_sprite("res://assets/icon.svg")
	victoria.emit()
	
func set_sprite(ruta = "res://assets/bed.png"): #Cama por defecto
	sprite.texture = load(ruta)
	if sprite.texture:
		standardize_sprite_size(Vector2(100, 100))
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
   
	
func _move_object():
	$AnimationPlayer.play("Move")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if not event.pressed:
			dragging = false
			if Game.current_palabra == "Get your life together":
				_ordenar()
		else:
			dragging = true
