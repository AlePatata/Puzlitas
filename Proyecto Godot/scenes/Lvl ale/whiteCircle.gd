extends Sprite2D
@onready var palabra_container = %PalabraContainer
@onready var dictionary = %Dictionary
@onready var switch = $"../../Objects/Switch"
@onready var light = $"../.."


var first_use = true # Inicia instrucciones la primera vez que se encuentra Hope
var ocultar = true

func _ready():
	if ocultar:
		hide()
	light.ocultar_whiteCircle.connect(_apagar)
	
func _physics_process(_delta):
	global_position = get_global_mouse_position()
	if ocultar:
		hide()
	else: show()
	
	for emisor in palabra_container.get_children():
		if not emisor.is_connected("prender_luz", _prender):
			emisor.prender_luz.connect(_prender)
			if first_use:
				Dialogic.start("Tutorial2")
				first_use = false
	if not dictionary.is_connected("apagar_luz", _apagar):
		dictionary.apagar_luz.connect(_apagar)
	
func _prender(Emisor):
	ocultar = false
	#print(Emisor) # no sacar, se cae
	
func _apagar(Emisor_dictionary):
	ocultar = true
	#print(Emisor_dictionary)

