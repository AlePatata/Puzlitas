extends CanvasLayer
@onready var dic: Button = $Dic_button


func _ready():
	dic.pressed.connect(_on_dic_pressed)

func _on_dic_pressed():
	get_tree().change_scene_to_file("res://scenes/diario.tscn")

