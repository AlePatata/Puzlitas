extends Control
@onready var back_to_main = $Back_to_main

func _ready() -> void:
	back_to_main.pressed.connect(_on_back_to_main_pressed)
	
func _on_back_to_main_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
