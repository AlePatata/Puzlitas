extends Sprite2D
@onready var palabra_container = %PalabraContainer
@onready var dictionary = %Dictionary

func _ready():
	hide()
	
	

func _physics_process(_delta):
	global_position = get_global_mouse_position()
	for emisor in palabra_container.get_children():
		if not emisor.is_connected("prender_luz", Callable(self, "_prender")):
			emisor.prender_luz.connect(Callable(self, "_prender"))
	if not dictionary.is_connected("apagar_luz", Callable(self, "_apagar")):
		dictionary.apagar_luz.connect(Callable(self, "_apagar"))
	

func _prender(emisor):
	show()
	print(emisor) # no sacar, se cae
	
func _apagar(dictionary):
	hide()
	print(dictionary)
