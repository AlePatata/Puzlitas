extends Node

# Diccionarios para guardar las posiciones de los objetos
var objects_positions = {}
var words_positions = {}
var switch_on = false
var cama_hecha = false
var light_dialog_started = false
var health = 1.0 #de la barra de salud mental

var hope_guardado = false
var luz_primera_vez = true
var dialog1 = false
var dialog2 = false
var page_1 = true

var fin = false

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
