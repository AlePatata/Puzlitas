extends MarginContainer
@onready var start: Button = $PanelContainer/MarginContainer/VBoxContainer/Start
@onready var options: Button = $PanelContainer/MarginContainer/VBoxContainer/Options
@onready var lvlselector: Button = $PanelContainer/MarginContainer/VBoxContainer/lvlselector
@onready var credits: Button = $PanelContainer/MarginContainer/VBoxContainer/Credits
@onready var quit: Button = $PanelContainer/MarginContainer/VBoxContainer/Quit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	lvlselector.pressed.connect(_on_lvlselector_pressed)
	credits.pressed.connect(_on_credits_pressed)
	quit.pressed.connect(_on_quit_pressed)
		
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/sofi ;3/therapist.tscn")
	
func _on_lvlselector_pressed():
	get_tree().change_scene_to_file("res://scenes/lvl_selector.tscn")
	
func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/Credits/Credits.tscn")
	
func _on_quit_pressed():
	get_tree().quit()
