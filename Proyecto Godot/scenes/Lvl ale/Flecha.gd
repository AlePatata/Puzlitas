extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	if name == "flecha_der":
		if !Dialogic.VAR.dialog3:
			hide()
		else: show() # Replace with function body.
	if name == "flecha_izq":
		if Globals.page_1:
			hide()
		else: show()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
