extends Area2D

signal hope
signal apagar_mouse
signal hope_usado
signal mental_health_increase
var dejar_encendida = false
var switchon #sprite
var switchoff #sprite
@onready var white_circle = $"../../BackgMovement/whiteCircle"
@onready var sprite = $"../Switch/Sprite2D"



var original_texture = modulate
var DA = Vector2(200, 200)  

func _ready():
	connect("input_event", _on_area_2d_input_event)
	
	if Globals.switch_on:
		luz_encendida()
	else: 
		luz_apagada()
		hide()


func _physics_process(delta):
	var switch_coords = Vector2(839,188)
	var a = white_circle.position < switch_coords + DA and white_circle.position > switch_coords - DA
	if (a and white_circle.visible) or dejar_encendida:
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
					mental_health_increase.emit()
			apagar_mouse.emit() #desactiva la luz del mouse
			hope_usado.emit("Hope") #envía la señal para que la palabra se elimine
			luz_encendida()

func luz_encendida():
	dejar_encendida = true 
	hope.emit()
	switchon = load("res://assets/switch on.png")
	if switchon:
		sprite.texture = switchon
	Game.current_palabra = null
	show()
	
func luz_apagada():
	switchoff = load("res://assets/switch off.png")
	if switchoff:
		sprite.texture = switchoff
	
