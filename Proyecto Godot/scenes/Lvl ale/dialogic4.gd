extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	if !Dialogic.VAR.dialog3 or !Globals.page_1:
		hide()
	else: show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
