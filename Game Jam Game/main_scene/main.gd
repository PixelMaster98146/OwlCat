extends Node3D

signal guess_id_real
signal guess_id_fake

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/TitleScreen/VBoxContainer/StartGame.grab_focus()

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

func _on_patrons_id_check():
	##move camera
	%AcceptDeny.show()
	$HUD/AcceptDeny/VBoxContainer/Accept.grab_focus()

func _on_accept_pressed():
	guess_id_real.emit()

func _on_deny_pressed():
	guess_id_fake.emit()

func _on_database_pressed():
	pass # Replace with function body.
	##move camera over cauldron
