extends Sprite2D


@onready var animation_player = $"../AnimationPlayer"
@onready var terapia = $"../Terapia"
@onready var timer = $"../Timer"

func _ready():
	# Reproducir la animación de rotación
	animation_player.play("timepassing")


func _on_animation_player_animation_finished(anim_name):
	hide()
	terapia.modulate = "ffffff"
	await Dialogic.start_timeline("MensajeFinal") # Replace with function body.
	timer.start(5)
	


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/Lvl ale/pensando.tscn") # Replace with function body.
