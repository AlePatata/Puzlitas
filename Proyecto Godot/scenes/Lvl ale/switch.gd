extends Objeto

signal light_on
signal apagar_luz
var dejar_encendida = false
@onready var white_circle = $"../../BackgMovement/whiteCircle"


var original_texture = modulate
var DA = Vector2(200, 200)  

func _ready():
	position = Vector2(400, 200)
	set_sprite("res://assets/brain.png")
	connect("input_event", _on_area_2d_input_event)
	if dejar_encendida:
		show()
	hide()


func _physics_process(delta):
	dragging = false
	var a = white_circle.position < position + DA and white_circle.position > position - DA
	if a and white_circle.visible or dejar_encendida:
		show()
	else:
		hide()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if modulate == original_texture:
			emit_signal("light_on")
			dejar_encendida = true #la deja prendida para siempre cuando la prendiste
			apagar_luz.emit() #desactiva la luz del mouse

