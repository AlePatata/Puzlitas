extends CanvasLayer

@onready var pared: Sprite2D = $"../Cuatroparedessimple"
@onready var next: Button = $Next
@onready var back: Button = $Back

var pos1 = 2563
var pos2 = 1278
var pos3 = -8
var pos4 = -1294
var positions = [pos1, pos2, pos3, pos4]
  


# Called when the node enters the scene tree for the first time.
func _ready():
	next.pressed.connect(_on_next_pressed)
	back.pressed.connect(_on_back_pressed)

func _on_next_pressed():
	if abs(pared.position.x - pos1) < 0.1:
		get_node("AnimationPlayer").play("fw12")
	elif abs(pared.position.x - pos2) < 0.1:
		get_node("AnimationPlayer").play("fw23")
	elif abs(pared.position.x - pos3) < 0.1:
		get_node("AnimationPlayer").play("fw34")
	elif abs(pared.position.x - pos4) < 0.1:
		get_node("AnimationPlayer").play("fw41")
	else:
		get_node("AnimationPlayer").play("cualquiercosa")

func _on_back_pressed():
	if abs(pared.position.x - pos1) < 0.1:
		get_node("AnimationPlayer").play_backwards("fw41")
	elif abs(pared.position.x - pos2) < 0.1:
		get_node("AnimationPlayer").play_backwards("fw12")
	elif abs(pared.position.x - pos3) < 0.1:
		get_node("AnimationPlayer").play_backwards("fw23")
	elif abs(pared.position.x - pos4) < 0.1:
		get_node("AnimationPlayer").play_backwards("fw34")

