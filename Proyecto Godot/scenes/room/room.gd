extends Node2D

@onready var brain: Sprite2D = %Brain
@onready var target: Marker2D = %Target
@onready var target2: Marker2D = %Target2
@onready var target3: Marker2D = %Target3
@onready var target4: Marker2D = %Target4

func _ready():
	await get_tree().create_timer(1).timeout
	var tween = create_tween()
	tween.tween_property(brain, "global_position", target.global_position, 2).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(brain, "scale:x", 4, 2)
	tween.tween_property(brain, "global_position", target2.global_position, 2)
	tween.tween_property(brain, "global_position", target3.global_position, 2)
	tween.tween_property(brain, "global_position", target4.global_position, 2).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
