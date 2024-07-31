extends Node2D

var timer
var maxtime = 2
@onready var mesh2d = $MeshInstance2D

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = maxtime


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta
	mesh2d.modulate = Color("black",timer/maxtime)
