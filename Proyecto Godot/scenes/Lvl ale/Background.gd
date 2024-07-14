extends Sprite2D
@onready var white_circle = $"../BackgMovement/whiteCircle"
@onready var switch = $"../Objects/Switch"

signal apagar_mouse


# Called when the node enters the scene tree for the first time.
func _ready():
	switch.connect("hope", set_light)
	modulate = Color("733bdb")



func set_light():
	print("Se prendió la luz")
	modulate = Color("ffffff")
	apagar_mouse.emit()
	#Dialogic.start("Tutorial3") #ta entero desordenao papito
