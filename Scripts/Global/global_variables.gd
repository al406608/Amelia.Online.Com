extends Node

var door_open = true
var game_controller : GameController
func _ready():
	if get_tree().get_nodes_in_group("controller") != [] :
		game_controller = get_tree().get_nodes_in_group("controller")[0]

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc_press"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED :
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

