extends Label

@onready var dialogue_sound = preload("res://Assets/Sounds/glitch_004.ogg")
var reproduced : bool = false

func _set(property, value):
	if property == "visible_ratio":
		if reproduced == false:
			SoundManager.play_ui_sound(dialogue_sound)
			reproduced = true
			await get_tree().create_timer(0.1).timeout
			reproduced = false
