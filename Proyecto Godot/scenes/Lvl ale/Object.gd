extends Node2D

class_name Objeto 
signal juntos
signal separados
@onready var sprite = $Sprite2D
@onready var collision_shape = $CollisionShape2D
signal señal_al_padre
var dragging = false
var  new_position

func _ready():
	connect("area_entered", _on_Area2D_body_entered)
	connect("area_exited", _on_Area2D_body_exited)
	connect("input_event", _on_area_2d_input_event)
	if not Globals.objects_positions.has(self.name):
		Globals.save_object_position(name, position)
	
func _physics_process(delta): 
	var mouse = get_global_mouse_position()
	if mouse.y < 300:
		dragging = false
	if dragging:
		global_position = lerp(position, mouse, 30 * delta) 
	else: dragging = false

var padre

func set_padre(padre_node):
	padre = padre_node
	
func set_sprite(ruta = "res://assets/icon.svg"): #Godot por defecto
	sprite.texture = load(ruta)
	if sprite.texture:
		var texture_name = sprite.texture.resource_path.get_file()
		if texture_name == "cama deshecha.png" or texture_name == "cama hecha.png":
			standardize_sprite_size(Vector2(200, 200))
		elif texture_name == "almohadas (1).png":
			standardize_sprite_size(Vector2(100, 100))
		elif texture_name == "switch on.png" or texture_name == "switch off.png":
			standardize_sprite_size(Vector2(25, 70))
		else: standardize_sprite_size(Vector2(150, 150))
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
			if Game.current_palabra == "Get your life together": #si suelto la palabra sobre cualquiera de los objetos
				padre.getyourlifetogether()
			dragging = false
			new_position = self.position
			Globals.objects_positions[self.name] = new_position
			

func _on_Area2D_body_entered(area):
	if area.is_in_group("objetos"): # Puedes usar grupos para filtrar objetos
		juntos.emit()
		#print("se emitió juntos")
		

# Función que se llama cuando un cuerpo sale del área
func _on_Area2D_body_exited(area):
	if area.is_in_group("objetos"):
		#print("se emitió separados")
		separados.emit()

