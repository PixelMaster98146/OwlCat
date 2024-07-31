extends Node3D

var save_path = "user://currentdate.save"

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
var date = []

var main

@onready var fadetoblack = $MeshInstance2D
# Called when the node enters the scene tree for the first time.
func _ready():
	main = get_tree().current_scene
	dying = false
	maxdeathtime = 3
	deathtimer = maxdeathtime
	for i in range(12):
		month.insert(i,i+1)
	for i in range(30):
		day.insert(i,i+1)
	for i in range(4):
		week.insert(i,i+1)
	year = 2024
	currday = day[0]
	currweek = week[0]
	currmonth = month[0]
	loading()
	if currday == null:
		date = [9, currmonth,year]
	else:
		date = [21 + currday, currmonth,year]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_P):
		save()
	if Input.is_key_pressed(KEY_O):
		loading()
	if Input.is_key_pressed(KEY_4):
		moveday()
	if Input.is_key_pressed(KEY_R):
		resetsave()
	if dying == true:
		deathtimer -= delta
		fadetoblack.modulate = Color("black", maxdeathtime - deathtimer)

func moveday():
	currday += 1
	progress += 1
	dying = true
	main.notfirsttime = true
	save()
	await get_tree().create_timer(maxdeathtime - 0.3).timeout
	if date[0] >= 30:
		if main.money >= main.payment:
			get_tree().change_scene_to_file("res://endings/Success.tscn")
		else:
			get_tree().change_scene_to_file("res://endings/Fail.tscn")
	else:
		get_tree().change_scene_to_file("res://main_scene/transition.tscn")
	
func save():
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(currday)
	file.store_var(progress)
	if main != null:
		file.store_var(main.money)
		file.store_var(main.notfirsttime)
	
func loading():
	if FileAccess.file_exists(save_path) == true:
		var file = FileAccess.open(save_path, FileAccess.READ)
		currday = file.get_var(currday)
		if currday == null:
			currday = 1
		progress = file.get_var(progress)
		if progress == null:
			progress = 1
		if main != null:
			main.money = file.get_var(main.money)
			if main.money == null:
				main.money = 4
			main.notfirsttime = file.get_var(main.notfirsttime)
		
	else:
		print("no saveo")
		currday = day[0]

func resetsave():
	var file = FileAccess.open(save_path,FileAccess.WRITE_READ)
	currday = 1
	progress = 1
	main.money = 4
	main.notfirsttime = false
	file.store_var(currday)
	file.store_var(progress)
	file.store_var(main.money)
	file.store_var(main.notfirsttime)
	
