extends Node

@export var dialogue : String = "Necesito texto"
@onready var dialogue_prefab = preload("res://Scenes/UI/Dialogue_scene.tscn")
var dialogue_prefab_instance 
func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		dialogue_prefab_instance = dialogue_prefab.instantiate()
		add_child(dialogue_prefab_instance)
		dialogue_prefab_instance.show_text(dialogue)

func _on_area_3d_body_exited(body):
	if body.is_in_group("Player"):
		if dialogue_prefab_instance != null :
			dialogue_prefab_instance.queue_free()
