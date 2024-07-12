extends Node

var door_open = true
var game_controller : GameController
func _ready():
	if get_tree().get_nodes_in_group("controller") != [] :
		game_controller = get_tree().get_nodes_in_group("controller")[0]

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc_press"):
		game_controller.pause_game()
		

