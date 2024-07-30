extends Node3D

## Used for checking if the mouse is inside the Area3D.
var is_mouse_inside := false

## The last processed input touch/mouse event. Used to calculate relative movement.
var last_event_pos2D := Vector2()

## The time of the last event in seconds since engine start.
var last_event_time := -1.0

@onready var node_viewport: SubViewport = $SubViewport
@onready var node_quad: MeshInstance3D = $Quad
@onready var node_area: Area3D = $Quad/Area3D

var Menu = "DBcategories"
signal db_backout

# Called when the node enters the scene tree for the first time.
func _ready():
	node_area.mouse_entered.connect(_mouse_entered_area)
	node_area.mouse_exited.connect(_mouse_exited_area)
	node_area.input_event.connect(_mouse_input_event)
	$SubViewport/DBcategories/Names.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_db_start():
	node_area.mouse_entered.connect(_mouse_entered_area)
	node_area.mouse_exited.connect(_mouse_exited_area)
	node_area.input_event.connect(_mouse_input_event)
	#$SubViewport/DBcategories/Names.grab_focus()

func _mouse_entered_area() -> void:
	is_mouse_inside = true

func _mouse_exited_area() -> void:
	is_mouse_inside = false

func _mouse_input_event(_camera: Camera3D, event: InputEvent, event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	# Get mesh size to detect edges and make conversions. This code only supports PlaneMesh and QuadMesh.
	var quad_mesh_size: Vector2 = node_quad.mesh.size

	# Event position in Area3D in world coordinate space.
	var event_pos3D := event_position

	# Current time in seconds since engine start.
	var now := Time.get_ticks_msec() / 1000.0

	# Convert position to a coordinate space relative to the Area3D node.
	# NOTE: `affine_inverse()` accounts for the Area3D node's scale, rotation, and position in the scene!
	event_pos3D = node_quad.global_transform.affine_inverse() * event_pos3D

	var event_pos2D := Vector2()

	if is_mouse_inside:
		# Convert the relative event position from 3D to 2D.
		event_pos2D = Vector2(event_pos3D.x, -event_pos3D.y)

		# Right now the event position's range is the following: (-quad_size/2) -> (quad_size/2)
		# We need to convert it into the following range: -0.5 -> 0.5
		event_pos2D.x = event_pos2D.x / quad_mesh_size.x
		event_pos2D.y = event_pos2D.y / quad_mesh_size.y
		# Then we need to convert it into the following range: 0 -> 1
		event_pos2D.x += 0.5
		event_pos2D.y += 0.5

		# Finally, we convert the position to the following range: 0 -> viewport.size
		event_pos2D.x *= node_viewport.size.x
		event_pos2D.y *= node_viewport.size.y
		# We need to do these conversions so the event's position is in the viewport's coordinate system.

	elif last_event_pos2D != null:
		# Fall back to the last known event position.
		event_pos2D = last_event_pos2D

	# Set the event's position and global position.
	event.position = event_pos2D
	if event is InputEventMouse:
		event.global_position = event_pos2D

	# Calculate the relative event distance.
	if event is InputEventMouseMotion or event is InputEventScreenDrag:
		# If there is not a stored previous position, then we'll assume there is no relative motion.
		if last_event_pos2D == null:
			event.relative = Vector2(0, 0)
		# If there is a stored previous position, then we'll calculate the relative position by subtracting
		# the previous position from the new position. This will give us the distance the event traveled from prev_pos.
		else:
			event.relative = event_pos2D - last_event_pos2D
			event.velocity = event.relative / (now - last_event_time)

	# Update last_event_pos2D with the position we just calculated.
	last_event_pos2D = event_pos2D

	# Update last_event_time to current time.
	last_event_time = now

	# Finally, send the processed input event to the viewport.
	node_viewport.push_input(event)

func _on_names_pressed():
	%DBcategories.hide()
	%FNameLName.show()
	%BackArrowimage.show()
	Menu = "FnameLname"

func _on_occupations_pressed():
	%DBcategories.hide()
	%AllOccupationsBox.show()
	%BackArrowimage.show()
	Menu = "Occupations"

func _on_states_pressed():
	%DBcategories.hide()
	%AllStatesBox.show()
	%BackArrowimage.show()
	Menu = "States"

func _on_rules_pressed():
	%DBcategories.hide()
	%RulesLabel.show()
	%BackArrowimage.show()
	Menu = "Rules"

func _on_first_names_pressed():
	%FNameLName.hide()
	%AllFNamesBox.show()
	%BackArrowimage.show()
	Menu = "FirstNames"

func _on_last_names_pressed():
	%FNameLName.hide()
	%AllLNamesBox.show()
	%BackArrowimage.show()
	Menu = "LastNames"

func _on_blighttown_pressed():
	%AllStatesBox.hide()
	%BlSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Blighttown"

func _on_caelid_pressed():
	%AllStatesBox.hide()
	%CaSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Caelid"

func _on_crimmire_pressed():
	%AllStatesBox.hide()
	%CrSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Crimmire"

func _on_fungine_pressed():
	%AllStatesBox.hide()
	%FuSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Fungine"

func _on_goponga_pressed():
	%AllStatesBox.hide()
	%GoSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Goponga"

func _on_kremquay_pressed():
	%AllStatesBox.hide()
	%KrSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Kremquay"

func _on_nibel_pressed():
	%AllStatesBox.hide()
	%NiSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Nibel"

func _on_satorl_pressed():
	%AllStatesBox.hide()
	%SaSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Satorl"

func _on_swale_pressed():
	%AllStatesBox.hide()
	%SwSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Swale"

func _on_toolibin_pressed():
	%AllStatesBox.hide()
	%ToSuburbsV.show()
	%BackArrowimage.show()
	Menu = "Toolibin"

func _on_back_arrow_pressed():
	#print("working")
	if Menu == "DBcategories":
		pass #Potentially send to accept deny menu
	if Menu == "FnameLname":
		%FNameLName.hide()
		%DBcategories.show()
		%BackArrowimage.hide()
		Menu = "DBcategories"
	if Menu == "Occupations":
		%AllOccupationsBox.hide()
		%DBcategories.show()
		%BackArrowimage.hide()
		Menu = "DBcategories"
	if Menu == "States":
		%AllStatesBox.hide()
		%DBcategories.show()
		%BackArrowimage.hide()
		Menu = "DBcategories"
	if Menu == "Rules":
		%RulesLabel.hide()
		%DBcategories.show()
		%BackArrowimage.hide()
		Menu = "DBcategories"
	if Menu == "FirstNames":
		%AllFNamesBox.hide()
		%FNameLName.show()
		Menu = "FnameLname"
	if Menu == "LastNames":
		%AllLNamesBox.hide()
		%FNameLName.show()
		Menu = "FnameLname"
	if Menu == "Blighttown":
		%BlSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Caelid":
		%CaSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Crimmire":
		%CrSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Fungine":
		%FuSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Goponga":
		%GoSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Kremquay":
		%KrSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Nibel":
		%NiSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Satorl":
		%SaSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Swale":
		%SwSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
	if Menu == "Toolibin":
		%ToSuburbsV.hide()
		%AllStatesBox.show()
		Menu = "States"
