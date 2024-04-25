extends interactuableComponent

var scene_to_change = "res://Scenes/2d_world/Online_room.tscn"

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") and in_reach:
		if dialogue_prefab_instance != null:
			get_tree().change_scene_to_file(scene_to_change)
		
