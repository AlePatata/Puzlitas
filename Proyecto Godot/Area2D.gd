extends Area2D

# Cargar el script de Emisor
@onready var Emisor = $"../Palabra"


func _ready():
	print("Ready function called.")
	connect("body_entered", Callable(self, "_on_Area2D_body_entered"))
	print("Signal connected.")

# Esta función se llama cuando un cuerpo entra en el Area2D
func _on_Area2D_body_entered(body):
	print("Body entered:", body.name)
	# Comprueba si el cuerpo es el nodo2D Emisor
	if body.get_script() == Emisor:
		print("Emisor detected.")
		_move_object(body)
	else:
		print("Another body entered:", body.name)

# La función que se ejecutará cuando Emisor entre en el Area2D
func _move_object(emisor):
	print("El emisor ha entrado en el área!")
	# Aquí defines lo que quieres que haga el Emisor
	# Por ejemplo, podrías mover el Emisor a otra posición
	global_position = Vector2(0, 0)
	print("Emisor moved to position:", emisor.position)
