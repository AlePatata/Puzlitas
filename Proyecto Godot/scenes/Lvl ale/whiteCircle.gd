extends Sprite2D
@onready var palabra_container = %PalabraContainer

func _ready():
	hide()
	
	

func _physics_process(_delta):
	global_position = get_global_mouse_position()
	for emisor in palabra_container.get_children():
		emisor.prender_luz.connect(Callable(self, "_prender"))
	

func _prender(emisor):
	show()
	print(emisor)
