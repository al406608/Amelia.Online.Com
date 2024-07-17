extends Node2D

@onready var zone_music = preload("res://Assets/Sounds/8- Quiet.ogg")
# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_music_at_volume(zone_music,0.5)
