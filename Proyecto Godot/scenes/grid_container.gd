extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is Label:
			child.connect("gui_input", Callable(self, "_on_label_gui_input"))

func _on_label_gui_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		var label = event.target
		if label is Label:
			Game.tomar_palabra(label.text,label)
			
func _handle_label_click(label):
	# Aquí puedes definir la acción que deseas realizar al hacer clic en el Label
	print("Se hizo clic en el Label con el texto: " + label.text)
