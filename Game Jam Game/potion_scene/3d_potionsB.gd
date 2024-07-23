extends RigidBody3D
var spawnID = 2
var IDs = PotIDs.orders
var real_ID
var lol = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	real_ID = IDs[1]
	#real_ID = IDs.pick_random()
	#print(real_ID)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

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
