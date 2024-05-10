extends Node2D

var dragging = false
var picked_up = false
var drop_location_id = 0 
var drop_location
@export var item_id = 1
var dropped = false
var timer_off = true

@export var palabra: String:
	set(value):
		palabra = value
		if label:
			label.text = palabra
		
@onready var label = $Label

func _ready():
	self.palabra = palabra

# Called when the node enters the scene tree for the first time.

func _physics_process(delta): 
	if dragging:
		global_position = lerp(global_position, get_global_mouse_position(), 30 * delta) 
		print("dragging")
		#dropped = false
	#else: 
		#if picked_up:
			#if !dropped:
				#drop_location = get_parent().set_drop_location(self)
				#if timer_off:
					#$Timer.start()
					#timer_off = false
			#global_position = lerp(global_position, drop_location, 20 * delta)
			

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:

		if event.pressed:
			picked_up = true
			
			dragging = true
			z_index = 10
			Game.current_palabra = self
				
		else:
			dragging = false


func _on_timer_timeout():
	dropped = true
