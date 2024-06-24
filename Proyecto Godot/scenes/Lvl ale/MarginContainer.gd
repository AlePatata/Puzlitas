extends MarginContainer
@onready var progress_bar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	progress_bar.set_hp(50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	while progress_bar.value != 100:
		progress_bar.set_hp(progress_bar.value+1)

