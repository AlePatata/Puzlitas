extends Node2D
@onready var shine = $Shine
@onready var object = $Shine/Object
var slot_1_filled = false
var slot_2_filled = false
var slot_3_filled = false
var slot_4_filled = false
var slot_5_filled = false
var slot_6_filled = false

func _ready():
	shine.pressed.connect(_found)

func _found():
	object.set_visibility(false)

######Inicio Inventario
	
func fill_slot(slot):
	match slot:
		1: slot_1_filled = true
		2: slot_2_filled = true
		3: slot_3_filled = true
		4: slot_4_filled = true
		5: slot_5_filled = true
		6: slot_6_filled = true
		
func empty_slot(slot):
	match slot:
		1: slot_1_filled = false
		2: slot_2_filled = false
		3: slot_3_filled = false
		4: slot_4_filled = false
		5: slot_5_filled = false
		6: slot_6_filled = false
		
func chosen_slot(item):
	var chosen_slot = 1
	if !slot_1_filled:
		chosen_slot = $Dictionary/Palabra1.global_position
		slot_1_filled = true
		item.drop_location_id = 1
	elif !slot_2_filled:
		chosen_slot = $Dictionary/Palabra2.global_position
		slot_2_filled = true
		item.drop_location_id = 2
	elif !slot_3_filled:
		chosen_slot = $Dictionary/Palabra3.global_position
		slot_3_filled = true
		item.drop_location_id = 3
	elif !slot_4_filled:
		chosen_slot = $Dictionary/Palabra4.global_position
		slot_4_filled = true
		item.drop_location_id = 4
	elif !slot_5_filled:
		chosen_slot = $Dictionary/Palabra5.global_position
		slot_5_filled = true
		item.drop_location_id = 5
	elif !slot_6_filled:
		chosen_slot = $Dictionary/Palabra6.global_position
		slot_6_filled = true
		item.drop_location_id = 6
	return chosen_slot
	
func set_drop_location(item):
	var drop_location
	match item.drop_location_id:
		0: drop_location = item.global_position
		1: drop_location = $Dictionary/Palabra1.global_position
		2: drop_location = $Dictionary/Palabra2.global_position
		3: drop_location = $Dictionary/Palabra3.global_position
		4: drop_location = $Dictionary/Palabra4.global_position
		5: drop_location = $Dictionary/Palabra5.global_position
		6: drop_location = $Dictionary/Palabra6.global_position
	return drop_location
	
func _on_palabra_1_area_entered(area):
	if area.is_in_group("item") and !slot_1_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().droplocation_id = 1
		fill_slot(area.get_parent().drop_location_id)
		
func _on_palabra_2_area_entered(area):
	if area.is_in_group("item") and !slot_2_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().droplocation_id = 2
		fill_slot(area.get_parent().drop_location_id)
		
func _on_palabra_3_area_entered(area):
	if area.is_in_group("item") and !slot_3_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().droplocation_id = 3
		fill_slot(area.get_parent().drop_location_id)
		
func _on_palabra_4_area_entered(area):
	if area.is_in_group("item") and !slot_4_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().droplocation_id = 4
		fill_slot(area.get_parent().drop_location_id)
		
func _on_palabra_5_area_entered(area):
	if area.is_in_group("item") and !slot_5_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().droplocation_id = 5
		fill_slot(area.get_parent().drop_location_id)
		
func _on_palabra_6_area_entered(area):
	if area.is_in_group("item") and !slot_6_filled:
		empty_slot(area.get_parent().drop_location_id)
		area.get_parent().droplocation_id = 6
		fill_slot(area.get_parent().drop_location_id)

######Fin inventario

