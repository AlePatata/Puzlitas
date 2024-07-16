extends Node

# Diccionarios para guardar las posiciones de los objetos
var objects_positions = {}
var words_positions = {}
var switch_state = false
var cama_hecha = false

func _ready():
	pass

func save_object_position(name, position):
	objects_positions[name] = position

func save_word_position(name, position):
	words_positions[name] = position

func get_object_position(name):
	return objects_positions.get(name, null)

func get_word_position(name):
	return words_positions.get(name, null)
