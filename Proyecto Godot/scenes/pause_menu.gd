extends PanelContainer
@onready var resume = $MarginContainer/VBoxContainer/Resume
@onready var options = $MarginContainer/VBoxContainer/Options
@onready var main = $MarginContainer/VBoxContainer/Main
@onready var quit = $MarginContainer/VBoxContainer/Quit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	quit.pressed.connect(_on_quit_pressed)
	main.pressed.connect(_on_main_pressed)
	hide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused
		

func _on_resume_pressed():
	get_tree().paused = false
	hide()
	
func _on_quit_pressed():
	get_tree().quit()
	
func _on_main_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
