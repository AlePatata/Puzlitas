extends Objeto

signal light_on
@onready var white_circle = $"../../BackgMovement/whiteCircle"

var original_texture = modulate
var DA = Vector2(200, 200)  

func _ready():
	position = Vector2(400, 200)
	set_sprite("res://assets/icon.svg")
	modulate = Color(modulate.r, modulate.g, modulate.b, 0.5)
	connect("input_event", _on_area_2d_input_event)

func _physics_process(delta):
	var a = white_circle.position < position + DA and white_circle.position > position - DA
	if a and white_circle.visible:
		modulate = original_texture
	else:
		modulate = Color(modulate.r, modulate.g, modulate.b, 0.5)

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if modulate == original_texture:
			emit_signal("light_on")
