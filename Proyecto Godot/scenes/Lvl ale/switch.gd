extends Objeto

signal light_on
@onready var white_circle = $"../../BackgMovement/whiteCircle"


var original_texture = modulate
var DA = Vector2(200, 200)  

func _ready():
	position = Vector2(400, 200)
	set_sprite("res://assets/icon.svg")
	hide()
	connect("input_event", _on_area_2d_input_event)

func _physics_process(delta):
	dragging = false
	var a = white_circle.position < position + DA and white_circle.position > position - DA
	if a and white_circle.visible:
		show()
	else:
		hide()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if modulate == original_texture:
			emit_signal("light_on")
