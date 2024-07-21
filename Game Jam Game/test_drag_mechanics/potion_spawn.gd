extends Node3D

const potionprefab = preload("res://potion_scene/3d_potions.tscn")
@onready var potion_spawn = $PotionSpawn


func spawnpot():
	print("spawning pots")
	var spawnloc = potion_spawn.global_position
	var potfab = potionprefab.instantiate()
	potfab.position =  spawnloc
	add_child(potfab)
