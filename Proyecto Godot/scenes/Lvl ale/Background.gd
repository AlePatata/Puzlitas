extends Sprite2D
@onready var white_circle = $"../BackgMovement/whiteCircle"
@onready var switch = $"../Objects/Switch"


# Called when the node enters the scene tree for the first time.
func _ready():
	switch.connect("light_on", set_light)
	modulate = Color("733bdb")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_light():
	print("Se prendió la luz")
	modulate = Color("ffffff")
	Dialogic.start("Tutorial3")
