extends Node

signal inventory_updated
signal palabras_updated

var inventory = {
	palabras = []
} :
	set(value):
		inventory = value
		inventory_updated.emit()


func add_palabra(palabra: String):
	if palabra in inventory.palabras:
		return
	inventory.palabras.push_back(palabra)
	palabras_updated.emit()


var current_palabra
