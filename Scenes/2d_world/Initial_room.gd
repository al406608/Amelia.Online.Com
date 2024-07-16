extends Node2D

@onready var initial_room_music = preload("res://Assets/Sounds/9- White.ogg")
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.first_world_interaction = true
	$CanvasLayer2.show()
	SoundManager.play_music(initial_room_music)
	if(GlobalVariables.game_controller != null):
		GlobalVariables.game_controller.crosshair.hide()
