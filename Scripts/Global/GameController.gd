extends Node

@onready var dialogue_scene = preload("res://Scenes/UI/event.tscn")
@export var start_dialogue : PackedStringArray
# Called when the node enters the scene tree for the first time.
func _ready():
	start_game()
	pass # Replace with function body.


func change_node(self_node,node_to_change):
	if(self_node != null):
		self_node.call_deferred("queue_free")
	var node_instance = node_to_change.instance()
	add_child(node_instance)

func start_game():
	var start_scene = dialogue_scene.instantiate()
	start_scene.dialogue = start_dialogue
	add_child(start_scene)
	

func screen_transfer_animation(self_node,node_to_change):
	var tween = create_tween()
	tween.tween_property(self,"modulate",Color.BLACK,1)
	tween.tween_callback(change_node)

