extends Node

var door_open : bool = false
var game_controller : GameController
var on_2d_world : bool  = false
var on_email_puzzle : bool = false
var on_email_puzzle_completed : bool = false
var first_world_interaction : bool = false


func _ready():
	if get_tree().get_nodes_in_group("controller") != [] :
		game_controller = get_tree().get_nodes_in_group("controller")[0]

func _unhandled_input(event):
	if Input.is_action_just_pressed("esc_press"):
		game_controller.pause_game()
		

