extends Node2D

var selected = false
var onpoint = false
# Called when the node enters the scene tree for the first time.

func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	if selected == true:
		followMouse()
	if selected == false:
		if onpoint == true:
			combine()





func followMouse():
	position = get_global_mouse_position()


func combine():
	print("dropped")

	queue_free()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed == true:
			selected = true
			
		else:
			selected = false




#func respawnpot():
	#print("spawned")
	#inst = ITEM.instantiate()
	#
	#add_child(inst)
	#


func _on_area_2d_area_entered(area):
	onpoint = true



func _on_area_2d_area_exited(area):
	onpoint = false
