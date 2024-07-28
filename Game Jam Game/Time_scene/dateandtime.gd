extends Node3D

var save_path = "res://save_folder//currentdate.save"

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
	loading()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_P):
		save()
	if Input.is_key_pressed(KEY_O):
		loading()
	if dying == true:
		deathtimer -= delta
		fadetoblack.modulate = Color("black", maxdeathtime - deathtimer)

func moveday():
	currday = day[progress + 1]
	progress += 1
	dying = true
	save()
	await get_tree().create_timer(maxdeathtime - 0.3).timeout
	get_tree().change_scene_to_file("res://main_scene/transition.tscn")
	
func save():
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(currday)
	file.store_var(progress)
	
func loading():
	if FileAccess.file_exists(save_path) == true:
		var file = FileAccess.open(save_path, FileAccess.READ)
		currday = file.get_var(currday)
		progress = file.get_var(progress)
	else:
		print("no saveo")
		currday = day[0]

func resetsave():
	var file = FileAccess.open(save_path,FileAccess.WRITE_READ)
	currday = day[0]
	progress = currday
	file.store_var(currday)
	file.store_var(progress)
	
