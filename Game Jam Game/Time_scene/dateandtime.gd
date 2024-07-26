extends Node3D

var day = []
var currday
var week = []
var currweek
var month = []
var currmonth
var year = []
var curryear
var i = 0
var progress = 0
var dying
var deathtimer #transition duration
var maxdeathtime 
@onready var fadetoblack = $MeshInstance2D

# Called when the node enters the scene tree for the first time.
func _ready():
	dying = false
	maxdeathtime = 3
	deathtimer = maxdeathtime
	for i in range(12):
		month.insert(i,i+1)
	for i in range(30):
		day.insert(i,i+1)
	for i in range(4):
		week.insert(i,i+1)
	year = 1987
	currday = day[0]
	currweek = week[0]
	currmonth = month[0]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dying == true:
		deathtimer -= delta
		fadetoblack.modulate = Color("black", maxdeathtime - deathtimer)

func moveday():
	currday = day[progress + 1]
	progress += 1
	dying = true
	await get_tree().create_timer(maxdeathtime - 0.3).timeout
	get_tree().change_scene_to_file("res://main_scene/transition.tscn")
