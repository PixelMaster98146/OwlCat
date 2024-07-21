extends Node3D


@onready var head = $MeshInstance3D/Head
@onready var cam = $MeshInstance3D/Head/Camera3D
@onready var itema_label = $MeshInstance3D/Head/Camera3D/itemA_label
@onready var itemb_label = $MeshInstance3D/Head/Camera3D/itemB_label
@onready var results_label = $MeshInstance3D/Head/Camera3D/Results_label




var sens = 0.03

var key = KEY_SPACE
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#optional codes below disables cursor ingame
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func updatelabelA(itemA):
	itema_label.text = itemA
	
func updatelabelB(itemB):
	
	itemb_label.text = itemB
	

func updatelabelR(results):
	
	results_label.text = results
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sens)
		cam.rotate_x(-event.relative.y * sens)
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-40), deg_to_rad(40))
