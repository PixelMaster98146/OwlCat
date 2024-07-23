extends Node3D

const potionprefab = preload("res://potion_scene/3d_potions.tscn")
const potionprefab2 = preload("res://potion_scene/3d_potionsB.tscn")
@onready var potion_spawn = $PotionSpawn
@onready var mixarea = $Node3D


func spawnpot(potsID):
	print("spawning pots")
	var spawnloc = potion_spawn.global_position
	var potfab
	if potsID == 1:
		potfab = potionprefab.instantiate()
	if potsID == 2:
		potfab = potionprefab2.instantiate()
	potfab.position =  spawnloc
	add_child(potfab)
	renode(potfab)

func renode(potf):
	mixarea.potion = potf

