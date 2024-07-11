extends "res://Scripts/interaction_transfer_object.gd"

func on_object_interaction():
	if dialogue_instance != null:
		var start_scene = GlobalVariables.game_controller.dialogue_scene.instantiate()
		start_scene.dialogue = dialogue
		start_scene.scene_to_change = scene_route
		GlobalVariables.game_controller.screen_transfer_animation(start_scene,true,false)
