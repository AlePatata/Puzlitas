extends MarginContainer
@onready var start: Button = $PanelContainer/MarginContainer/VBoxContainer/Start
@onready var options: Button = $PanelContainer/MarginContainer/VBoxContainer/Options
@onready var quit: Button = $PanelContainer/MarginContainer/VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	quit.pressed.connect(_on_quit_pressed)
	
		

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
