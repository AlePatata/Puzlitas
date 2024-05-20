extends Sprite2D
var prendio = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta) -> void:
	pass

func isOn() -> bool:
	return prendio

func pressed() -> void:
	prendio = !prendio
