extends "res://Scripts/interaction_object_base.gd"

@export_file("*.tscn") var scene_route : String
@onready var scene_to_change = load(scene_route)

func on_object_interaction():
	if dialogue_instance != null:
		dialogue_instance.show_text()
		GlobalVariables.game_controller.screen_transfer_animation(scene_to_change.instantiate())
