extends PanelContainer
@onready var resume = $MarginContainer/VBoxContainer/Resume
@onready var options = $MarginContainer/VBoxContainer/Options
@onready var quit = $MarginContainer/VBoxContainer/Quit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resume.pressed.connect(_on_resume_pressed)
	quit.pressed.connect(_on_quit_pressed)
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
	
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	get_tree().paused = false
