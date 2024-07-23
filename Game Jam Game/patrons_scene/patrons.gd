extends Node3D

var orderID1
var orderID2
var orderID = PotIDs.orders
var fullorder
var redroluff
@onready var toplabel = $MeshInstance3D/Label3D
@onready var botlabel = $MeshInstance3D/Label3D2

# Called when the node enters the scene tree for the first time.
func _ready():
	orderID1 = orderID.pick_random()
	orderID2 = orderID.pick_random()
	fullorder = orderID1 + orderID2
	redroluff = orderID2 + orderID1
	updateLabel(orderID1, orderID2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func updateLabel(order1,order2):
	toplabel.text = order1
	botlabel.text = order2

func grat():
	updateLabel("thanks",":)")
