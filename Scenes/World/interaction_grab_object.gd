extends "res://Scripts/interaction_object_base.gd"

var under_inspection : bool = false
var sensitivity = 0.01
var original_transform
@onready var player = get_tree().get_nodes_in_group("player")[0]
@onready var original_position = global_position
var player_head
var in_reach : bool = false

func _ready():
	description = "to inspect "
	original_transform = transform
	player_head = player.get_node("Head")

func _unhandled_input(event):
	if under_inspection:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * sensitivity)
			rotate_x(-event.relative.y * sensitivity)
func on_object_lost_focus():
	if !under_inspection:
		super.on_object_lost_focus()
		
	
func on_object_hovered():
	if !under_inspection:
		super.on_object_hovered()

func on_object_interaction():
	inspected_()

func inspected_():
	var tween = create_tween()
	if !under_inspection :
		tween.tween_property(self,"global_position",lerp(original_position, player_head.global_position, 0.5),0.2)
		tween.tween_property(self,"under_inspection",true,0.01)
		player.inspecting_object = true
	else:
		tween.tween_property(self,"under_inspection",false,0.01)
		tween.tween_property(self,"transform",original_transform,0.2)
		player.inspecting_object = false
