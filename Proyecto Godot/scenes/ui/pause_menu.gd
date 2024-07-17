extends CanvasLayer
@onready var resume: Button  = $PanelContainer/MarginContainer/VBoxContainer/Resume
@onready var main: Button  = $PanelContainer/MarginContainer/VBoxContainer/Main
@onready var levels: Button  = $PanelContainer/MarginContainer/VBoxContainer/Levels
@onready var quit: Button  = $PanelContainer/MarginContainer/VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.process_mode = Node.PROCESS_MODE_ALWAYS
	resume.pressed.connect(_on_resume_pressed)
	quit.pressed.connect(_on_quit_pressed)
	main.pressed.connect(_on_main_pressed)
	hide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Dialogic.paused = !Dialogic.paused
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused
		

func _on_resume_pressed():
	get_tree().paused = false
	await AudioManager.play_sound_button()
	hide()
	
	
func _on_quit_pressed():
	get_tree().paused = false
	await AudioManager.play_sound_button()
	get_tree().quit()
	
func _on_main_pressed():
	get_tree().paused = false
	Dialogic.end_timeline()
	await AudioManager.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/ui/main_menu.tscn")
	
func _on_lvl_selector_pressed():
	get_tree().paused = false
	await AudioManager.play_sound_button()
	get_tree().change_scene_to_file("res://scenes/Lvl_selector.tscn")

