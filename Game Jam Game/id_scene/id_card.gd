extends Node3D

@onready var DOB = $DOB
@onready var photo = $Photo
@onready var occupation = $Occupation
@onready var full_name = $Name
@onready var residence = $Residence

#DOB
var even_day = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
var odd_day = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
var feb = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
var year = [1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005]
#Only relevant for expiry

#photo


#occupations
var job = ["Builder", "Teacher", "Receptionist", "Cleaner", "Chef", "Radiologist", "Acarologist", "Adenologist", "Biologist", "Meteorologist", "Voice actor", "Game developer", "Artist", "Bus driver", "Site manager", "Hospitality", "Machinist", "Solicitor", "Marketer", "Data analyst", "Banker", "Doctor", "Nurse", "Plumber", "Electrician"]
var fake_job = ["Adventurer", "Ratician", "Wizard","Fitness", "Pig wrangler", "Pig trainer", "Pig carer", "God", "Being awesome", "Rich"]
var hard_fake_job = ["Mammalology", "Electrition", "Soliciter", "Cleener", "Receptonist", "Meteorologist", "Voce actor", "Plumer", "Computology"]

#names
var last_name = ["Amrane", "Bredenrath", "Dangeo", "Deding", "Piltane", "Morindes", "Bogson", "Bainly", "Chibourath", "Sedgeholm", "Bexnora", "Brudermark", "Stokeming", "Wortry", "Delisster", "Smith", "John", "Cucoo", "Endlas", "Dunfair", "Griffrid", "Farnram", "Vimroot", "Dalebran", "Keelfait"]
var first_name = ["Hadboia", "Galtrie", "Quelaag", "Joldurn", "Thorblin", "Nortane", "Verstall", "Cardlow", "Cresmar", "Neetham", "Loncord", "Blainford", "Kirnach", "John", "Gorb", "Tortus", "Gort", "Chakron", "Kamaro", "Golu", "Shibron", "Grimmond", "Hulter", "Swaiton", "Bogworth"]
var fake_last_name = ["Worcester", "Monsieur", "Hollijoll", "Cliffcord", "Keartham", "Cabrosol", "Birbourg", "Ruthamp", "Leaming", "of the Swamp", ]
var fake_first_name = ["Bloingo", "Blitty", "Broque", "Ashei", "Doylan", "Berlow", "Temis", "Shurden", "Linlam", "Swaamp"]
#var hard_fake_last_name = [???
#var hard_fake_first_name = [???

#residence
var suburb1 = ["Darkroot", "Catarina", "Izalith"]
var suburb2 = ["Kelsher", "Mauk", "Soter"]
var suburb3 = ["Holm", "Bolderoll", "Brava"]
var suburb4 = ["Bramble", "Kore", "Klifftop"]
var suburb5 = ["Thornfelt", "Ginso", "Sein"]
var suburb6 = ["Wubba", "Poplin", "Tumble"]
var suburb7 = ["Taltal", "Castor", "Bowelet"]
var suburb8 = ["Aeonia", "Sellia", "Caelem"]
var suburb9 = ["Gladen", "Polder", "Sloudon"]
var suburb10 = ["Burraga", "Tuckerbil", "Banksia"]
var all_suburbs = [suburb1, suburb2, suburb3, suburb4, suburb5, suburb6, suburb7, suburb8, suburb9, suburb10]
var state = ["Blighttown", "Satorl", "Crimmire", "Kremquay", "Nibel", "Fungine", "Goponga", "Caelid", "Swale", "Toolibin"]
var testate = ["Test1", "Test2"]
#var fake_state = []

#expiry


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#print("start")
	get_random_info()
	#Choose from them randomly, weighted towards being real

func _process(delta):
	pass

func get_random_info():
	var legal_age = randf()
	var month_length = randi_range(1, 12)
	if month_length == 1 or 3 or 5 or 7 or 8 or 10 or 12:
		DOB.text = "DoB: " + str(odd_day.pick_random()) + "-" + str(month_length) + "-" + str(year.pick_random())
		#print("good, odd")
	elif month_length == 4 or 6 or 9 or 11:
		DOB.text = "DoB: " + str(even_day.pick_random()) + "-" + str(month_length) + "-" + str(year.pick_random())
		#print("good, even")
	else: #2/feb
		DOB.text = "DoB: " + str(feb.pick_random()) + "-" + str(month_length) + "-" + str(year.pick_random())
		#print("good, feb")
	
	#photo
	
	var real_job = randf()
	if real_job <0.95:
		occupation.text = "Occupation: " + str(job.pick_random())
		#print("real")
	elif real_job <0.99:
		occupation.text = "Occupation: " + str(fake_job.pick_random())
		#print("fake")
	else:
		occupation.text = "Occupation: " + str(hard_fake_job.pick_random())
		#print("hard fake")
	
	var real_last_name = randf()
	var real_first_name = randf()
	if real_last_name <0.95 and real_first_name <0.95:
		full_name.text = str(last_name.pick_random()) + ", " + str(first_name.pick_random())
		#print("real, real")
	elif real_last_name <0.95 and real_first_name >0.95:
		full_name.text = str(last_name.pick_random()) + ", " + str(fake_first_name.pick_random())
		#print("real, fake")
	elif real_last_name >0.95 and real_first_name <0.95:
		full_name.text = str(fake_last_name.pick_random()) + ", " + str(first_name.pick_random())
		#print("fake, real")
	else:
		full_name.text = str(fake_last_name.pick_random()) + ", " + str(fake_first_name.pick_random())
		#print("fake, fake")
		
	var real_state = randf()
	var suburb_choice = randi_range(1, 10)
	if suburb_choice == 1 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Blighttown"
		#print("1, correct")
	elif suburb_choice == 1:
		var _state = state.duplicate(true)
		_state.remove_at(0)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("1, wrong")
	elif suburb_choice == 2 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Satorl"
		#print("2, correct")
	elif suburb_choice == 2:
		var _state = state.duplicate(true)
		_state.remove_at(1)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("2, wrong")
	elif suburb_choice == 3 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Crimmire"
		#print("3, correct")
	elif suburb_choice == 3:
		var _state = state.duplicate(true)
		_state.remove_at(2)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("3, wrong")
	elif suburb_choice == 4 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Kremquay"
		#print("4, correct")
	elif suburb_choice == 4:
		var _state = state.duplicate(true)
		_state.remove_at(3)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("4, wrong")
	elif suburb_choice == 5 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Nibel"
		#print("5, correct")
	elif suburb_choice == 5:
		var _state = state.duplicate(true)
		_state.remove_at(4)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("5, wrong")
	elif suburb_choice == 6 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Fungine"
		#print("6, correct")
	elif suburb_choice == 6:
		var _state = state.duplicate(true)
		_state.remove_at(5)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("6, wrong")
	elif suburb_choice == 7 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Goponga"
		#print("7, correct")
	elif suburb_choice == 7:
		var _state = state.duplicate(true)
		_state.remove_at(6)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("7, wrong")
	elif suburb_choice == 8 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Caelid"
		#print("8, correct")
	elif suburb_choice == 8:
		var _state = state.duplicate(true)
		_state.remove_at(7)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("8, wrong")
	elif suburb_choice == 9 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Swale"
		#print("9, correct")
	elif suburb_choice == 9:
		var _state = state.duplicate(true)
		_state.remove_at(8)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("9, wrong")
	elif suburb_choice == 10 and real_state <0.95:
		residence.text = str(suburb1.pick_random()) + " Toolibin"
		#print("10, correct")
	elif suburb_choice == 10:
		var _state = state.duplicate(true)
		_state.remove_at(9)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		#print("10, wrong")
	else:
		print("not working")
	
	#Expiry
	
	#for testing
	customer_ID()
	


func customer_ID():
	await get_tree().create_timer(2.0).timeout
	get_random_info()
