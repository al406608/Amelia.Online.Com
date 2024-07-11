extends Node
class_name GameController
@onready var dialogue_scene = load("res://Scenes/UI/event.tscn")
@onready var transfer_ui = preload("res://Scenes/UI/Transfer_UI.tscn")
@onready var control_scene = preload("res://Scenes/UI/Controls_to_use.tscn")
@export var dialogue : PackedStringArray
@onready var crosshair = $CanvasLayer/CanvasGroup/AnimatedSprite2D
var actual_node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Main_menu.game_controller = self

func change_node(self_node,node_to_change):
	if(self_node != null):
		self_node.call_deferred("queue_free")
	if("game_manager" in node_to_change):
		node_to_change.game_manager = self
	actual_node = node_to_change
	add_child(node_to_change)

func screen_transfer_animation(node_to_change,end_pause = true):
	var ui_transfer_instance = transfer_ui.instantiate()
	ui_transfer_instance.end_pause = end_pause
	add_child(ui_transfer_instance)
	await ui_transfer_instance.transmision_finished
	change_node(actual_node,node_to_change)

func controller_show_up():
	var control_scene_instance = control_scene.instantiate()
	add_child(control_scene_instance)
