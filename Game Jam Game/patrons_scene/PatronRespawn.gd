extends Node3D

const PATRONS = preload("res://patrons_scene/patrons.tscn")
@onready var mixarea = $"../Node3D"
@onready var bar_gaming = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func spawnpatron():
	print("spawn")
	await get_tree().create_timer(1.3).timeout
	var patronfab = PATRONS.instantiate()
	patronfab.position = position
	patronfab.rotation = rotation
	bar_gaming.add_child(patronfab)
	renode(patronfab)
	
func renode(patronprefab):
	mixarea.patrons = patronprefab
