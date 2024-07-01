extends Sprite2D
@onready var palabra_container = %PalabraContainer
@onready var dictionary = %Dictionary
var first_use = true # Inicia instrucciones la primera vez que se encuentra Hope

func _ready():
	hide()
	
func _physics_process(_delta):
	global_position = get_global_mouse_position()
	for emisor in palabra_container.get_children():
		if not emisor.is_connected("prender_luz", _prender):
			emisor.prender_luz.connect(_prender)
			if first_use:
				Dialogic.start("Tutorial2")
				first_use = false
	if not dictionary.is_connected("apagar_luz", _apagar):
		dictionary.apagar_luz.connect(_apagar)
		
func _prender(Emisor):
	show()
	print(Emisor) # no sacar, se cae
	
func _apagar(Emisor_dictionary):
	hide()
	print(Emisor_dictionary)
