extends Node3D

signal guess_id_real
signal guess_id_fake
signal db_start
signal day_start
signal intro_cutscene
signal game_over_good
signal game_over_bad
@onready var patrons = $Patrons

var money = 74
var payment = 400
var intro_played = true #should be saved

# Called when the node enters the scene tree for the first time.
func _ready():
	$HUD/MainMenuBase/Start.grab_focus()
	$MainMenuMusic.play()

func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if $HUD/Credits.is_visible_in_tree() == true: ## or options == true:
			$HUD/Credits.hide()
			##options.hide()

func _on_start_game_pressed():
	pass 
	$MainMenuMusic.stop()
	$GameplayMusic.play()
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$HUD/MainMenuBase.hide()
	$PlayerCam/MeshInstance3D/Head/Camera3D.set_current(true)
	if intro_played == true:
		intro_cutscene.emit()
		#Rent man walks in, breifly explains 7 week cycle, leaves
	else:
		day_start.emit() #Customers start coming in and day 1 starts
	print("sent")
	
func _on_options_pressed():
	pass #Do as extension
	
func _on_credits_pressed():
	$HUD/Credits.show()

func _on_credits_backout_pressed():
	$HUD/Credits.hide()

func _on_quit_pressed():
	get_tree().quit()

func _on_patrons_id_check():
	##move camera
	%AcceptDeny.show()
	$HUD/AcceptDeny/VBoxContainer/Accept.grab_focus()

func _on_accept_pressed():
	guess_id_real.emit()
	%AcceptDeny.hide()
	if patrons.noID == false:
		patrons.id_card.position = patrons.default_id_pos
	
func _on_deny_pressed():
	guess_id_fake.emit()
	%AcceptDeny.hide()
	if patrons.noID == false:
		patrons.id_card.position = patrons.default_id_pos

func _on_database_pressed():
	##move camera
	$Database.show()
	$HUD/AcceptDeny.hide()
	db_start.emit()

func _on_database_db_backout():
	##move camera back
	$Database.hide()
	$HUD/AcceptDeny.show()

func _on_patrons_payment():
	#print("payed")
	money += 50
	$HUD/Money.text = "Money: $" + str(money)
	##Needs to be saved
	
##func end of week ##triggered after 7 days pass (how)
	##Corporat enters and says what you owe him
	##If amount met
		##money -= payment
		##text
		##corporat leaves
		##game_over_bad.emit()
		##next week+increase payment (extension)
	##else
		##text
		##game_over_bad.emit()
		##reset game and save

func _on_patrons_raid():
	#print("raid")
	money -= 50
	$HUD/Money.text = "Money: $" + str(money)
	##Needs to be saved
	##await get_tree().create_timer(120).timeout
	##cutscene
	##end day
