extends Sprite2D
@onready var white_circle = $"../BackgMovement/whiteCircle"
@onready var switch = $"../Objects/Switch"


# Called when the node enters the scene tree for the first time.
func _ready():
	switch.connect("light_on", set_light)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_light():
	print("Se prendió la luz")
	modulate = Color(modulate.r, modulate.g+50, modulate.b, modulate.a)
	Dialogic.start("Tutorial3")
