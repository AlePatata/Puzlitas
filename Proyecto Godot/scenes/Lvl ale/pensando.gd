extends Node2D
@onready var rich_text_label = $RichTextLabel
@onready var timer = $Timer
@onready var timer2 = $Timer2



# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start_timeline("Pensando") # Replace with function body.
	timer.start(5)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	rich_text_label.show()
	timer2.start(5)
	


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://scenes/Credits/Credits.tscn") # Replace with function body.
