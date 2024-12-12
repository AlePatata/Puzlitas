extends Node2D
@onready var rich_text_label = $RichTextLabel
@onready var timer = $Timer
@onready var timer2 = $Timer2




func _ready():
	timer2.start(5)



func _process(delta):
	pass



func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://scenes/Credits/Credits.tscn")
