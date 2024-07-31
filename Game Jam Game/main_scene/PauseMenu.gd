extends Sprite2D

var game_paused = false
var disabled = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enable():
	disabled = false
	
func disable():
	disabled = true

##Turn off during loads and game over

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause") and disabled != true:
		print("pause")
		if game_paused == false:
			game_paused = true
			get_tree().paused = true
			print(get_tree().paused)
			self.show()
			##Focus button
		elif game_paused == true:
			game_paused = false
			#print("unpausing")
			get_tree().paused = false
			self.hide()
			get_parent().get_node("Patrons").superunlockcam()

func _on_continue_pressed():
	game_paused = false
	#print("unpausing")
	get_tree().paused = false
	self.hide()
	get_parent().get_node("Patrons").superunlockcam()

func _on_quit_pressed():
	##Save ##get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)	(???)
	get_tree().quit()
