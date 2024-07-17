extends "res://Scenes/World/interaction_animated_object.gd"

func on_object_interaction():
	if GlobalVariables.first_world_interaction:
		GlobalVariables.door_open = !GlobalVariables.door_open
		super()

func on_object_hovered():
	if GlobalVariables.first_world_interaction:
		super()
