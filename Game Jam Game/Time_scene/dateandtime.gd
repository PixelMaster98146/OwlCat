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
# Called when the node enters the scene tree for the first time.
func _ready():
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
	pass


func moveday():
	currday = day[progress + 1]
	progress += 1
