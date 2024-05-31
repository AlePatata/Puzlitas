'extends CanvasLayer
#@onready var brain: Button = $brain_button
@onready var dic: Button = $Dic_button


func _ready():
	dic.pressed.connect(_on_dic_pressed)

func _on_dic_pressed():
	get_tree().change_scene_to_file("res://scenes/Lvl ale/RecogerHope.tscn")


func _on_dic_button_pressed():
	_on_dic_pressed() # Replace with function body.
'
