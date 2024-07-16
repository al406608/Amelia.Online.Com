extends "res://Scenes/World/interaction_animated_object.gd"

func on_object_interaction():
	if GlobalVariables.first_world_interaction:
		super()

func on_object_hovered():
	if GlobalVariables.first_world_interaction:
		super()
