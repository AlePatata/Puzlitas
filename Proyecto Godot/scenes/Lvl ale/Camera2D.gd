extends Camera2D
@onready var camera_2d = $"."
@export var camera_speed: float = 300
@onready var background = $"../Background"


@onready var move_left = $"../BackgMovement/MoveLeft"
@onready var move_right = $"../BackgMovement/MoveRight"

var _moving_left = false
var _moving_right = false

func _ready() -> void:
	move_left.mouse_entered.connect(_on_move_left_entered)
	move_left.mouse_exited.connect(_on_move_left_exited)
	move_right.mouse_entered.connect(_on_move_right_entered)
	move_right.mouse_exited.connect(_on_move_right_exited)

func _physics_process(delta: float) -> void:
	if _moving_left and camera_2d.global_position.x >  0:
		camera_2d.global_position.x -= camera_speed * delta
	
	if _moving_right and camera_2d.global_position.x < (background.position.x)/2:
		camera_2d.global_position.x += camera_speed * delta
	
	
func _on_move_left_entered() -> void:
	_moving_left = true
	
func _on_move_left_exited() -> void:
	_moving_left = false
	
func _on_move_right_entered() -> void:
	_moving_right = true

func _on_move_right_exited() -> void:
	_moving_right = false
