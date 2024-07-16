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
	if Globals.switch_on:
		luz_encendida()
	else: 
		luz_apagada()
		hide()


func _physics_process(delta):
	dragging = false
	var a = white_circle.position < position + DA and white_circle.position > position - DA
	if a and white_circle.visible or dejar_encendida:
		show()
	else:
		if not dejar_encendida:
			hide()
	if Globals.switch_on:
		luz_encendida()
	else: luz_apagada()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if modulate == original_texture:
			if event.pressed: #prende y apaga el interruptor
				AudioManager.play_sound_switch()
				Globals.switch_on = !Globals.switch_on
				if Globals.luz_primera_vez:
					Globals.luz_primera_vez = false
					Dialogic.start_timeline("Tutorial3")
				
			apagar_mouse.emit() #desactiva la luz del mouse
			hope_usado.emit("Hope") #envía la señal para que la palabra se elimine
			luz_encendida()

func luz_encendida():
	dejar_encendida = true 
	hope.emit()
	set_sprite("res://assets/switch on.png")
	Game.current_palabra = null
	show()
	
func luz_apagada():
	set_sprite("res://assets/switch off.png")
	
