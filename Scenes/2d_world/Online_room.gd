extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalVariables.door_open:
		$ClosedDoor.queue_free()
	else:
		$OpenDoor.queue_free()
