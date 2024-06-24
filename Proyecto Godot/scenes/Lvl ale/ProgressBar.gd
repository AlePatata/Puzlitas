extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	value = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_hp(new_hp):
	value = min(max_value, new_hp)
