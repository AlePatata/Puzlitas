extends Node2D
@onready var palabra = $Palabra3
signal ordenar_objeto_raiz


# Called when the node enters the scene tree for the first time.
func _ready():
	palabra.ordenar_objeto.connect(_on_palabra_ordenar_objeto) 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_palabra_ordenar_objeto():
	print("hola1") #este no se printea
	ordenar_objeto_raiz.emit()
