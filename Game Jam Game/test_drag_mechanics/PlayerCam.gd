extends Node3D


@onready var head = $MeshInstance3D/Head
@onready var cam = $MeshInstance3D/Head/Camera3D
@onready var itema_label = $MeshInstance3D/Head/Camera3D/itemA_label
@onready var itemb_label = $MeshInstance3D/Head/Camera3D/itemB_label
@onready var results_label = $MeshInstance3D/Head/Camera3D/Results_label
@onready var timer = $MeshInstance3D/Head/Camera3D/Timer
@onready var label = $MeshInstance3D/Head/Camera3D/Label
@onready var label2 = $MeshInstance3D/Head/Camera3D/Label2

@onready var dateandtime = $Dateandtime
var basemaxtime = 2
var maxtime
var onemin = 60
var secs = 20

var sens = 0.03

var key = KEY_SPACE
var timestop
# Called when the node enters the scene tree for the first time.
func _ready():
	maxtime = basemaxtime
	onemin = 3 #change to 60 for 1 minute
	secs = onemin
	timestop = false #toggle this to true when pressing start base value == false
	#optional codes below disables cursor ingame
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label.text = str(dateandtime.date[0]) + "/" + str(dateandtime.date[1]) + "/" + str(dateandtime.date[2])
	label2.text = str(maxtime)+ " : " + str("%.2f" % secs)
	timerstuff(delta)
	
func updatelabelA(itemA):
	itema_label.text = itemA
	
func updatelabelB(itemB):
	
	itemb_label.text = itemB
	

func updatelabelR(results):
	
	results_label.text = results
	
func resetlabel():
	itema_label.text = ""
	itemb_label.text = ""
	results_label.text = ""

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * sens)
		cam.rotate_x(-event.relative.y * sens)
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-40), deg_to_rad(40))
		
func timerstuff(framesecs):
	if timestop == false:
		secs -= framesecs
	if secs <= 0:
		maxtime -= 1
		if maxtime >= 0:
			secs = onemin
	if maxtime <= 0 && secs <= 0:
		dateandtime.moveday()
		maxtime = basemaxtime
		timestop = true
