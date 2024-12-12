extends Area2D

signal juntos
signal separados
signal señal_al_padre

var dragging = false
var  new_position
var is_la_palabra = false
var padre

func _ready():
	connect("area_entered", _on_Area2D_body_entered)
	connect("area_exited", _on_Area2D_body_exited)
	connect("input_event", _on_area_2d_input_event)
	if not Globals.objects_positions.has(self.name):
		Globals.save_object_position(name, position)
	
func _physics_process(delta): 
	var mouse = get_global_mouse_position()
	#if mouse.y < 300:
		#dragging = false
	if dragging:
		global_position = lerp(global_position, get_global_mouse_position(), 30 * delta)

func set_padre(padre_node):
	padre = padre_node
	print(padre)
	
func set_sprite(ruta = "res://assets/icon.svg"): #Godot por defecto
	for child in get_children():
		if child is Sprite2D:
			child.texture = load(ruta)
   

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			dragging = true
			if Game.current_palabra == "Get your life together":
				is_la_palabra = true
			#AudioManager.play_sound_takingobject()
		else: 
			if is_la_palabra:#si suelto la palabra sobre cualquiera de los objetos
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

