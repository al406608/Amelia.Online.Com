extends "res://Scripts/scripts_2d/interaction_object_2d.gd"

@export_file("*.tscn") var scene_route : String
@onready var scene_to_change = load(scene_route)
@export var show_crosshair = true

func on_object_interaction():
	if dialogue_instance != null:
		dialogue_instance.show_text()
		GlobalVariables.game_controller.screen_transfer_animation(scene_to_change.instantiate(),true,show_crosshair)
