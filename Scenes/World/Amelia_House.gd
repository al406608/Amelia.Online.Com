extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVariables.game_controller != null :
		GlobalVariables.game_controller.controller_show_up()
