#Script del juego
extends Node

signal inventory_updated
signal palabras_updated

#diccionario
var inventory = {
	palabras = []
} :
	set(value):
		inventory = value
		inventory_updated.emit()

#para añadir palabra
func add_palabra(palabra: String):
	if palabra in inventory.palabras:
		return
	inventory.palabras.push_back(palabra)
	palabras_updated.emit()
	print(palabra)
	
#para eliminar una palabra
func remove_palabra(palabra: String):
	if not palabra in inventory.palabras:
		return
	inventory.palabras.erase(palabra)
	palabras_updated.emit()
	
func update():
	palabras_updated.emit()
	

var current_palabra
var nodoporeliminar
#################################





