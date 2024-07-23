extends Node

var orders = ["Apple", "Berry"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func populateorders(ord):
	orders = ord

func retorders():
	return orders
