extends Node

var door_open = false

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc_press"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED :
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
