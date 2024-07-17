extends Node3D

@onready var ambient_sound = preload("res://Assets/Sounds/10- Time Whistle.ogg")
# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_music(ambient_sound)
	GlobalVariables.on_2d_world = false
	if GlobalVariables.game_controller != null :
		if !GlobalVariables.first_world_interaction:
			GlobalVariables.game_controller.controller_show_up()
		else:
			get_tree().paused = false
