@tool
extends ProgressBar

		

# Called when the node enters the scene tree for the first time.
func _ready():
	value = 50
	_update_style("C9E4D3")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if value < 20:
		_update_style("F9C6C9")
	elif value < 40:
		_update_style("F7D9C4")
	elif value < 70:
		_update_style("FAEDCB")
	else:
		_update_style("C9E4D3")

func set_hp(new_hp):
	value = min(max_value, new_hp)

func _update_style(color = "C9E4D3"):
	if theme == null:
		theme = Theme.new()
		self.theme = theme
	
	var stylebox = theme.get_stylebox("fill", "ProgressBar") as StyleBoxFlat
	if stylebox == null:
		stylebox = StyleBoxFlat.new()
	
	# Set the desired color
	stylebox.bg_color = Color(color)
	
	# Apply the stylebox to the theme
	theme.set_stylebox("fill", "ProgressBar", stylebox)
