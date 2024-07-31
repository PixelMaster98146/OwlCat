extends Node3D

@onready var whitemesh = $MeshInstance2D

var timer
var maxtime = 3
var countdown = false
const playcam = preload("res://test_drag_mechanics/PlayerCam.tscn")
const gamescene = preload("res://main_scene/main.tscn")
const bargaming = preload("res://test_drag_mechanics/bar_gaming.tscn")
var savepath
@onready var moneytext = $moneytext

# Called when the node enters the scene tree for the first time.
func _ready():
	#savepath = "user://currentdate.save"
	#if FileAccess.file_exists(savepath) == true:
		#var file = FileAccess.open(savepath, FileAccess.READ)
	moneytext.text = "Great Work!"
	timer = maxtime
	countdown = false
	set_process_input(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	if countdown == true:
		timer -= delta
		whitemesh.modulate = Color(107,107,107, timer/maxtime)
	if timer <= 0:
		await get_tree().create_timer(0.4).timeout
		get_tree().change_scene_to_packed(gamescene)

func _input(event):
	pass

func returntomain():
	countdown = true

func _on_texture_button_pressed():
	returntomain()
