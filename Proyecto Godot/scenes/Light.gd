extends Node2D
@onready var shine = $Shine
@onready var object = $Shine/Object


func _ready():
	shine.pressed.connect(_found)

func _found():
	object.set_visibility(false)
	
