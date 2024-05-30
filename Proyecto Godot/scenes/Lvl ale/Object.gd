extends Area2D
@onready var raiz_palabras = $"../../Raiz_Palabras"


func _ready():
	pass
	
func _physics_process(delta):
	for emisor in raiz_palabras.get_children():
		if not emisor.is_connected("ordenar_objeto", Callable(self, "_ordenar")):
			emisor.ordenar_objeto.connect(Callable(self, "_ordenar"))
			print("Señal recibida")
	
func _ordenar(Emisor):
	print("Funcion ordenar")
	connect("body_entered", Callable(self, "_move_object"))	#_move_object()
	print(Emisor)
	
func _move_object():
	$AnimationPlayer.play("Move")
