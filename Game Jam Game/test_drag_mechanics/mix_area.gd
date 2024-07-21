extends Node3D

var itemA
var itemB

var results
@onready var player_cam = $"../PlayerCam"
@onready var potion_spawn = $"../PotionSpawn"

var x = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itemA != null && x == 0:
		player_cam.updatelabelA(itemA)
		x = 1
	if itemB != null && x == 1:
		player_cam.updatelabelB(itemB)
		x = 2
	if x == 2:
		results = itemA + " " + itemB
		player_cam.updatelabelR(results)
		x = 9







func _on_area_3d_area_entered(area):
	if area.is_in_group("grab"):
		var parental = area.get_parent_node_3d()
		#parental.makeittrue()
		get_parent_node_3d().spawnpot()
		parental.queue_free()
	else:
		print("Notpot")
