extends Node3D

signal fake
signal real
@onready var real_id = true

@onready var DOB = $DOB
@onready var photo = $Photo
@onready var occupation = $Occupation
@onready var full_name = $Name
@onready var residence = $Residence
@onready var expiry = $Expiry

#DOB
var even_day = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
var odd_day = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
var feb = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29]
var possible_year = [1954, 1955, 1956, 1957, 1958, 1959, 1960, 1961, 1962, 1963, 1964, 1965, 1966, 1967, 1968, 1969, 1970, 1971, 1972, 1973, 1974, 1975, 1976, 1977, 1978, 1979, 1980, 1981, 1982, 1983, 1984, 1985, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005]
var young_year = [2007, 2008, 2009, 2010]
#2006

#expiry
##need date system

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
var state = ["Blighttown", "Satorl", "Crimmire", "Kremquay", "Nibel", "Fungine", "Goponga", "Caelid", "Swale", "Toolibin"]
#(extension) var fake_state = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	#print("start")
	#get_random_info()

func _process(delta):
	pass

func get_random_info():
	real_id = true
	var legal_age = randf()
	var month_length = randi_range(1, 12)
	var birth_odd_day = odd_day.pick_random()
	var birth_even_day = even_day.pick_random()
	var birth_feb = feb.pick_random()
	var birth_year = possible_year.pick_random()
	#print(month_length + birth_year)
	if legal_age <0.98:
		if month_length == 1 or 3 or 5 or 7 or 8 or 10 or 12:
			DOB.text = "DoB: " + str(birth_odd_day) + "-" + str(month_length) + "-" + str(birth_year)
			#print(year)
			#print("good, odd")
		elif month_length == 4 or 6 or 9 or 11:
			DOB.text = "DoB: " + str(birth_even_day) + "-" + str(month_length) + "-" + str(birth_year)
			#print("good, even")
		else: #2/feb
			DOB.text = "DoB: " + str(birth_feb) + "-" + str(month_length) + "-" + str(birth_year)
			#print("good, feb")
	elif legal_age <0.99:
		if month_length == 1 or 3 or 5 or 7 or 8 or 10 or 12:
			DOB.text = "DoB: " + str(birth_odd_day) + "-" + str(month_length) + "-" + str(birth_year)
			real_id = false
			#print("bad, odd")
		elif month_length == 4 or 6 or 9 or 11:
			DOB.text = "DoB: " + str(birth_even_day) + "-" + str(month_length) + "-" + str(birth_year)
			real_id = false
			#print("bad, even")
		else: #2/feb
			DOB.text = "DoB: " + str(birth_feb) + "-" + str(month_length) + "-" + str(birth_year)
			real_id = false
			#print("bad, feb")
	else: #might need to assign .pick_random to a variable for math-After date sysytem
		if month_length == 1 or 3 or 5 or 7 or 8 or 10 or 12:
			DOB.text = "DoB: " + str(birth_odd_day) + "-" + str(month_length) + "-" + str(2006)
			real_id = false
			##If date </> #full date as extension
			#print("2006, odd")
		elif month_length == 4 or 6 or 9 or 11:
			DOB.text = "DoB: " + str(birth_even_day) + "-" + str(month_length) + "-" + str(2006)
			real_id = false
			##If date </> #full date as extension
			#print("2006, even")
		else: #2/feb
			DOB.text = "DoB: " + str(birth_feb) + "-" + str(month_length) + "-" + str(2006)
			real_id = false
			##If date </> #full date as extension
			#print("2006, feb")
	
	#Expiry
	var expire_date = randf()
	##Need date system to finish. For now current year = 2024
	var current_year = 2024
	if expire_date <0.973:
		expiry.text = "Expiry: " + str(odd_day.pick_random()) + "-" + str(randi_range(1, 12)) + "-" + str(current_year + randi_range(1, 5))
		#print("good")
	elif expire_date >0.99:
		expiry.text = "Expiry: " + str(odd_day.pick_random()) + "-" + str(randi_range(1, 12)) + "-" + str(current_year - randi_range(1, 5))
		real_id = false
		#print("expired")
	else:
		expiry.text = "Expiry: " + str(odd_day.pick_random()) + "-" + str(randi_range(1, 12)) + "-" + str(current_year)
		real_id = false
		##If date </>
		#if month and day higher. Maybe just year based
		##Extension: exact date

	#photo
	
	var real_job = randf()
	if real_job <0.973:
		occupation.text = "Occupation: " + str(job.pick_random())
		#print("real")
	elif real_job <0.99:
		occupation.text = "Occupation: " + str(fake_job.pick_random())
		real_id = false
		#print("fake")
	else:
		occupation.text = "Occupation: " + str(hard_fake_job.pick_random())
		real_id = false
		#print("hard fake")
	
	var real_last_name = randf()
	var real_first_name = randf()
	if real_last_name <0.973 and real_first_name <0.973:
		full_name.text = str(last_name.pick_random()) + ", " + str(first_name.pick_random())
		#print("real, real")
	elif real_last_name <0.973 and real_first_name >0.973:
		full_name.text = str(last_name.pick_random()) + ", " + str(fake_first_name.pick_random())
		real_id = false
		#print("real, fake")
	elif real_last_name >0.973 and real_first_name <0.973:
		full_name.text = str(fake_last_name.pick_random()) + ", " + str(first_name.pick_random())
		real_id = false
		#print("fake, real")
	else:
		full_name.text = str(fake_last_name.pick_random()) + ", " + str(fake_first_name.pick_random())
		real_id = false
		#print("fake, fake")
		
	var real_state = randf()
	var suburb_choice = randi_range(1, 10)
	if suburb_choice == 1 and real_state <0.973:
		residence.text = str(suburb1.pick_random()) + " Blighttown"
		#print("1, correct")
	elif suburb_choice == 1:
		var _state = state.duplicate(true)
		_state.remove_at(0)
		residence.text = str(suburb1.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("1, wrong")
	elif suburb_choice == 2 and real_state <0.973:
		residence.text = str(suburb2.pick_random()) + " Satorl"
		#print("2, correct")
	elif suburb_choice == 2:
		var _state = state.duplicate(true)
		_state.remove_at(1)
		residence.text = str(suburb2.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("2, wrong")
	elif suburb_choice == 3 and real_state <0.973:
		residence.text = str(suburb3.pick_random()) + " Crimmire"
		#print("3, correct")
	elif suburb_choice == 3:
		var _state = state.duplicate(true)
		_state.remove_at(2)
		residence.text = str(suburb3.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("3, wrong")
	elif suburb_choice == 4 and real_state <0.973:
		residence.text = str(suburb4.pick_random()) + " Kremquay"
		#print("4, correct")
	elif suburb_choice == 4:
		var _state = state.duplicate(true)
		_state.remove_at(3)
		residence.text = str(suburb4.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("4, wrong")
	elif suburb_choice == 5 and real_state <0.973:
		residence.text = str(suburb5.pick_random()) + " Nibel"
		#print("5, correct")
	elif suburb_choice == 5:
		var _state = state.duplicate(true)
		_state.remove_at(4)
		residence.text = str(suburb5.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("5, wrong")
	elif suburb_choice == 6 and real_state <0.973:
		residence.text = str(suburb6.pick_random()) + " Fungine"
		#print("6, correct")
	elif suburb_choice == 6:
		var _state = state.duplicate(true)
		_state.remove_at(5)
		residence.text = str(suburb6.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("6, wrong")
	elif suburb_choice == 7 and real_state <0.973:
		residence.text = str(suburb7.pick_random()) + " Goponga"
		#print("7, correct")
	elif suburb_choice == 7:
		var _state = state.duplicate(true)
		_state.remove_at(6)
		residence.text = str(suburb7.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("7, wrong")
	elif suburb_choice == 8 and real_state <0.973:
		residence.text = str(suburb8.pick_random()) + " Caelid"
		#print("8, correct")
	elif suburb_choice == 8:
		var _state = state.duplicate(true)
		_state.remove_at(7)
		residence.text = str(suburb8.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("8, wrong")
	elif suburb_choice == 9 and real_state <0.973:
		residence.text = str(suburb9.pick_random()) + " Swale"
		#print("9, correct")
	elif suburb_choice == 9:
		var _state = state.duplicate(true)
		_state.remove_at(8)
		residence.text = str(suburb9.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("9, wrong")
	elif suburb_choice == 10 and real_state <0.973:
		residence.text = str(suburb10.pick_random()) + " Toolibin"
		#print("10, correct")
	elif suburb_choice == 10:
		var _state = state.duplicate(true)
		_state.remove_at(9)
		residence.text = str(suburb10.pick_random()) + " " + str(_state.pick_random())
		real_id = false
		#print("10, wrong")
	else:
		print("not working")
		
	if real_id == true:
		real.emit()
	elif real_id == false:
		fake.emit()
	
	#for testing
	#customer_ID()
	

func customer_ID():
	await get_tree().create_timer(2.0).timeout
	get_random_info()
