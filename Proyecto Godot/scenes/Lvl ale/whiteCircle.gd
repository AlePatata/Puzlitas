extends Sprite2D
@onready var raiz_palabras = $"../../Raiz_Palabras"

func _ready():
	hide()
	for emisor in raiz_palabras.get_children():
		emisor.prender_luz.connect(Callable(self, "_prender"))
	

func _physics_process(_delta):
	global_position = get_global_mouse_position()
	

func _prender(emisor):
	show()
	print(emisor)
