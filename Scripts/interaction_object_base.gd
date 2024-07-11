extends Node3D

var hovered : bool = false
var dialogue_node 
@onready var dialogue_prefab = preload("res://Scenes/UI/Dialogue_scene.tscn")
var dialogue_instance = null

@export var title : String
@export var dialogue : PackedStringArray
@export var description : String = "to interact with"

func _ready():
	add_to_group("interaction")

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") and hovered:
		on_object_interaction()

func on_object_lost_focus():
	hovered = false
	if(dialogue_instance != null):
		dialogue_instance.queue_free()
		
	
func on_object_hovered():
	hovered = true
	if(dialogue_instance == null):
		dialogue_instance = dialogue_prefab.instantiate()
		add_child(dialogue_instance)
		dialogue_instance.setup(dialogue,title,description)

func on_object_interaction():
	if dialogue_instance != null:
			dialogue_instance.show_text()
