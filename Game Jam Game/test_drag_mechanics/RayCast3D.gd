extends RayCast3D

var obj = null
var key = KEY_E
var mouse = MOUSE_BUTTON_LEFT
@onready var point = %Grabby



func _process(delta):
	if Input.is_key_pressed(key) || Input.is_mouse_button_pressed(mouse):
		if obj == null:
			
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					obj = collider
		
		if obj != null:
			obj.position = point.global_position
	else:
		obj = null
