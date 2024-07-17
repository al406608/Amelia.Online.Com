extends "res://Scripts/scripts_2d/interaction_transfer2d.gd"
@export var image_path = "res://Assets/2D/backgrounds/fondoevento1.png"

func on_object_interaction():
	if dialogue_instance != null:
		var start_scene = GlobalVariables.game_controller.dialogue_scene.instantiate()
		start_scene.dialogue = dialogue
		start_scene.background = image_path
		start_scene.show_crosshair = show_crosshair
		start_scene.scene_to_change = scene_to_change
		GlobalVariables.game_controller.screen_transfer_animation(start_scene,true,false)
