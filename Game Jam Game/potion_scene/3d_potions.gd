extends RigidBody3D

var testing = false
var ID = ["Apple", "Berry", "Chocolate"]
var real_ID

const potionprefab = preload("res://potion_scene/3d_potions.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	real_ID = ID.pick_random()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func makeittrue():
	testing = true
	print(testing)

func respawn():
	pass


func _on_area_3d_area_entered(area):
	if area.is_in_group("cauldron"):
		var parea = area.get_parent_node_3d()
		print("this is mixarea")
		if parea.itemA == null:
			parea.itemA = real_ID
			print(parea.itemA)
		elif parea.itemB == null:
			parea.itemB = real_ID
			print(parea.itemB)
		else:
			pass
