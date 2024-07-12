extends Node3D
class_name  interactuableComponent

@export var dialogue : String = ""
@export var title : String
@onready var dialogue_prefab = preload("res://Scenes/UI/Dialogue_scene.tscn")
var dialogue_prefab_instance 
var in_reach = false

func show_object_label():
	dialogue_prefab_instance = dialogue_prefab.instantiate()
	add_child(dialogue_prefab_instance)
	dialogue_prefab_instance.show_tip(title)

func hide_object_label():
	if dialogue_prefab_instance != null :
			dialogue_prefab_instance.queue_free()
	in_reach = false

func show_text():
	if in_reach:
		if dialogue_prefab_instance != null:
			if !dialogue_prefab_instance.text_shown:
				dialogue_prefab_instance.show_text(dialogue,title)
			else:
				dialogue_prefab_instance.queue_free()

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") and in_reach:
		if dialogue != "" :
			if !dialogue_prefab_instance.text_shown:
				dialogue_prefab_instance.show_text(dialogue,title)
			else:
				dialogue_prefab_instance.queue_free()
		
