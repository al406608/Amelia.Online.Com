extends Node
class_name GameController
@onready var dialogue_scene = load("res://Scenes/UI/event.tscn")
@onready var transfer_ui = preload("res://Scenes/UI/Transfer_UI.tscn")
@export var dialogue : PackedStringArray
@onready var crosshair = $CanvasLayer/CanvasGroup/AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	$Main_menu.game_controller = self

func change_node(self_node,node_to_change):
	if(self_node != null):
		self_node.call_deferred("queue_free")
	if("game_manager" in node_to_change):
		node_to_change.game_manager = self
	add_child(node_to_change)

func screen_transfer_animation(self_node,node_to_change):
	var ui_transfer_instance = transfer_ui.instantiate()
	add_child(ui_transfer_instance)
	await ui_transfer_instance.transmision_finished
	change_node(self_node,node_to_change)

