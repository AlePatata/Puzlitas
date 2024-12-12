extends Sprite2D


@onready var animation_player = $"../AnimationPlayer"
@onready var terapia = $"../Terapia"
@onready var timer = $"../Timer"

func _ready():
	# Reproducir la animación de rotación
	animation_player.play("timepassing")


func _on_animation_player_animation_finished(anim_name):
	_on_timer_timeout()


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/Lvl ale/pensando.tscn")
