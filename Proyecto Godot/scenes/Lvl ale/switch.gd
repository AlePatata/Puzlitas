extends Objeto

signal hope
signal apagar_mouse
signal hope_usado
var dejar_encendida = false
@onready var white_circle = $"../../BackgMovement/whiteCircle"



var original_texture = modulate
var DA = Vector2(200, 200)  

func _ready():
	position = Vector2(400, 200)
	set_sprite("res://assets/switch off.png")
	connect("input_event", _on_area_2d_input_event)
	if Globals.switch_state:
		luz_encendida()
	else: 
		hide()



func _physics_process(delta):
	dragging = false
	var a = white_circle.position < position + DA and white_circle.position > position - DA
	if a and white_circle.visible or dejar_encendida:
		show()
	else:
		if not Globals.switch_state:
			hide()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if modulate == original_texture:
			dejar_encendida = true 
			Globals.switch_state = true
			apagar_mouse.emit() #desactiva la luz del mouse
			hope_usado.emit("Hope") #envía la señal para que la palabra se elimine
			luz_encendida()
		#if event.pressed:
			

func luz_encendida():
	hope.emit()
	set_sprite("res://assets/switch on.png")
	Game.current_palabra = null
	show()
