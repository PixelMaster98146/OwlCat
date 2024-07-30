extends Node3D

var itemA
var itemB

var results

var order = ["pholder1","pholder2"]
@onready var player_cam = $"../PlayerCam"
@onready var potion_spawn = $"../PotionSpawn"
@onready var potion
@onready var patrons = $"../Patrons"

var x = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itemA != null && x == 0:
		player_cam.updatelabelA(itemA)
		x = 1
	if itemB != null && x == 1:
		player_cam.updatelabelB(itemB)
		x = 2
	if x == 2:
		results = itemA + itemB
		if results == patrons.fullorder || results == patrons.redroluff:
			player_cam.updatelabelR("Succ")
			patrons._on_order_complete()
		else:
			if patrons.selected == true:
				player_cam.updatelabelR("Fail")
				patrons.cuss()
		x = 9
		resetorders()
		player_cam.resetlabel()
		



func updateorder(order1,order2):
	order[0] = order1
	order[1] = order2


func resetorders():
	print("resetti")
	itemA = null
	itemB = null
	x = 0

func _on_area_3d_area_entered(area):
	if area.is_in_group("grab"):
		print(get_parent_node_3d())
		var parental = area.get_parent_node_3d()
		#parental.makeittrue()
		if get_parent_node_3d().get_node("potion_spawnnode") != null:
			get_parent_node_3d().get_node("potion_spawnnode").spawnpot(parental.spawnID)
		else:
			get_parent_node_3d().spawnpot(parental.spawnID)
		parental.queue_free()
	else:
		print("Notpot")




func _on_tree_entered():
	pass # Replace with function body.
