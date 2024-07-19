extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Title Screen/HBoxContainer/StartGame".grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_game_pressed():
	pass #Transition to game
	#Move camera into first person POV
	#Rent man walks in, breifly explains 7 week cycle, leaves
	#Customers start coming in and day 1 starts

func _on_options_pressed():
	pass #Do as extension
