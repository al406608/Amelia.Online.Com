extends "res://Scripts/interaction_object_base.gd"
@export var scene_route : PackedScene
@onready var scene_to_change = scene_route.instantiate()

func on_object_interaction():
	if dialogue_instance != null:
		dialogue_instance.show_text()
		GlobalVariables.game_controller.screen_transfer_animation(scene_to_change)
