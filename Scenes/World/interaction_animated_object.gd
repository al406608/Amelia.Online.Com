extends "res://Scripts/interaction_object_base.gd"
var open : bool = false
var running : bool = false
@onready var original_rotation = rotation.y
var tween : Tween

func on_object_interaction():
	if !running:
		running = true
		if tween != null:
			tween.kill()
		if open:
			tween = create_tween()
			tween.tween_property(self,"rotation:y", original_rotation,1)
			tween.tween_property(self,"running",false,0)
			open = false
			GlobalVariables.door_open = false
		else:
			tween = create_tween()
			tween.tween_property(self,"rotation:y", 0,1)
			tween.tween_property(self,"running",false,0)
			open = true
			GlobalVariables.door_open = true
