extends Node3D

const potionprefab = preload("res://potion_scene/3d_potions.tscn")
const potionprefab2 = preload("res://potion_scene/3d_potionsB.tscn")
@onready var potion_spawn = $PotionSpawn
@onready var mixarea = $Node3D
var spawnloc
var spawnloc2

func _ready():
	if get_parent_node_3d() == null:
		mixarea = get_node("Node3D")
	else:
		mixarea = get_parent_node_3d().get_node("Node3D")
func spawnpot(potsID):
	print("spawning pots")
	if get_parent_node_3d() == null:
		spawnloc = get_node("PotionSpawn").global_position
		spawnloc2 = get_node("PotionSpawn2").global_position
	else:
		spawnloc = get_parent_node_3d().get_node("PotionSpawn").global_position
		spawnloc2 = get_parent_node_3d().get_node("PotionSpawn2").global_position
	var potfab
	if potsID == 1:
		potfab = potionprefab.instantiate()
		potfab.position =  spawnloc
	if potsID == 2:
		potfab = potionprefab2.instantiate()
		potfab.position =  spawnloc2
	add_child(potfab)
	renode(potfab)

func renode(potf):
	mixarea.potion = potf

