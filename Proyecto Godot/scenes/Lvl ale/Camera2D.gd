extends Camera2D
@onready var camera_2d = $"."
@export var camera_speed: float = 200
@onready var background = $"../Background"
@onready var white_circle = $whiteCircle
@onready var dark_background = $"../darkBackground"
@onready var object_2 = $"../Object2"


@onready var move_left = $"../BackgMovement/MoveLeft"
@onready var move_right = $"../BackgMovement/MoveRight"


var _moving_left = false
var _moving_right = false

func _ready() -> void:
	move_left.mouse_entered.connect(_on_move_left_entered)
	move_left.mouse_exited.connect(_on_move_left_exited)
	move_right.mouse_entered.connect(_on_move_right_entered)
	move_right.mouse_exited.connect(_on_move_right_exited)



func _process(delta: float) -> void:
	object_2.hide()
	white_circle.global_position = get_global_mouse_position()
	if white_circle.isOn(): 
		background.hide()
		object_2.show()
		dark_background.show()
	else:
		background.show()
		object_2.hide()
		dark_background.hide()
	
	
	if _moving_left and camera_2d.global_position.x >  0:
		camera_2d.global_position.x -= camera_speed * delta
	
	if _moving_right and camera_2d.global_position.x < background.position.x:
		camera_2d.global_position.x += camera_speed * delta
	
	
func _on_move_left_entered() -> void:
	_moving_left = true
	
func _on_move_left_exited() -> void:
	_moving_left = false
	
func _on_move_right_entered() -> void:
	_moving_right = true

func _on_move_right_exited() -> void:
	_moving_right = false
