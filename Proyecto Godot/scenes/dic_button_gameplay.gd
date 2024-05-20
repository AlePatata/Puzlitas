extends CanvasLayer
#@onready var brain: Button = $brain_button
@onready var dic: Button = $Dic_button
@onready var white_circle = $"../Camera2D/whiteCircle"


func _ready():
	dic.pressed.connect(_on_dic_pressed)

func _on_dic_pressed():
	get_tree().change_scene_to_file("res://scenes/diario.tscn")
