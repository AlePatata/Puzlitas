extends Camera2D
@onready var camera_2d = $"."
@export var camera_speed: float = 200
@onready var background = $"../Background"


@onready var move_left = $"../BackgMovement/MoveLeft"
@onready var move_right = $"../BackgMovement/MoveRight"
@onready var move_up = $"../BackgMovement/MoveUp"
@onready var move_down = $"../BackgMovement/MoveDown"


var _moving_left = false
var _moving_right = false
var _moving_up = new Move()
var _moving_down = false

func _ready() -> void:
	move_left.mouse_entered.connect(_on_move_left_entered)
	move_left.mouse_exited.connect(_on_move_left_exited)
	move_right.mouse_entered.connect(_on_move_right_entered)
	move_right.mouse_exited.connect(_on_move_right_exited)
	move_up.mouse_entered.connect(move_up.on_move_entered())

func _process(delta: float) -> void:
	if _moving_left and camera_2d.global_position.x >  0:
		camera_2d.global_position.x -= camera_speed * delta
	
	if _moving_right and camera_2d.global_position.x < background.position.x:
		camera_2d.global_position.x += camera_speed * delta
		
	if _moving_up:
		camera_2d.global_position.y += camera_speed * delta
	
	
func _on_move_left_entered() -> void:
	_moving_left = true
	
func _on_move_left_exited() -> void:
	_moving_left = false
	
func _on_move_right_entered() -> void:
	_moving_right = true

func _on_move_right_exited() -> void:
	_moving_right = false

class Move:
	func _init():
		var moving = false
		
	func on_move_entered() -> void:
		self.moving = true
		
	func _on_move_exited(moving: bool) -> void:
		self.moving = false
