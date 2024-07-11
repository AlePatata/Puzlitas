@tool
extends ProgressBar


const EXCESSIVE_CLICKS_THRESHOLD = 5
const INACTIVITY_THRESHOLD = 3.0
const TIME_INTERVAL = 2.0 
const INCREASE = 0.05


var movement_counter : float = 0.0
var clicks_counter : int = 0
var inactivity_timer : float = 0.0
var last_mouse_position : Vector2
var timer : float = 0.0


func _ready():
	value = 50
	_update_style("C9E4D3")
	last_mouse_position = get_viewport().get_mouse_position()


func _process(delta):
	
	_colors()
	_mentalPeace(delta)

func _mentalPeace(delta):
	var current_mouse_position = get_viewport().get_mouse_position()
	var distance_moved: float = last_mouse_position.distance_to(current_mouse_position)
	
	if distance_moved > 0:
		movement_counter += distance_moved
		inactivity_timer = 0.0  # Resetear el temporizador de inactividad
	last_mouse_position = current_mouse_position

	inactivity_timer += delta
	
	if inactivity_timer >= INACTIVITY_THRESHOLD/2:
		clicks_counter = 0.0
	if inactivity_timer >= INACTIVITY_THRESHOLD:
		on_mouse_inactivity()
	
	if clicks_counter >= EXCESSIVE_CLICKS_THRESHOLD:
		on_excessive_mouse_activity()
	

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		clicks_counter += 1
		print(clicks_counter)
		inactivity_timer = 0.0  # Resetear el temporizador de inactividad


func on_mouse_inactivity():
	increase(INCREASE)
	
func on_excessive_mouse_activity():
	increase(-INCREASE)


func _colors():
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

func increase(delta):
	value += delta
	
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

