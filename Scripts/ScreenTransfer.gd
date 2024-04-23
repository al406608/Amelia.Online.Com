extends Node

@export var scene_to_change : String
@export var shape : Shape3D = null
# Called when the node enters the scene tree for the first time.
func _ready():
	if (shape != null):
		$Area3D/CollisionShape3D.shape = shape



func _on_area_3d_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene_to_file(scene_to_change)
