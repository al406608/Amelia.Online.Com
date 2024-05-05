extends Control

@export var dialogue : PackedStringArray
@export var next_scene : PackedScene
var index = 0
var running : bool = false
var tween
@onready var dialogue_node = $NinePatchRect/Dialogue
# Called when the node enters the scene tree for the first time.
func _ready():
	show_dialogue()

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") :
		if running:
			end_dialogue()
		elif index < dialogue.size() and !running:
			running = true
			show_dialogue()
		else:
			change_scene()
	if Input.is_action_just_pressed("x_key_press") : 
		change_scene()

func change_scene():
	tween = create_tween()
	tween.tween_property(self,"modulate",Color.BLACK,1)
	tween.tween_callback(change_node)

func change_node():
	get_tree().change_scene_to_packed(next_scene)

func show_dialogue():
	dialogue_node.visible_ratio = 0
	dialogue_node.text = dialogue[index]
	index += 1
	tween = create_tween()
	var dialogue_length = dialogue_node.text.length() * 0.04
	tween.tween_property(dialogue_node,"visible_ratio",1,dialogue_length)
	tween.tween_property(self,"running",false,0)

func end_dialogue():
	dialogue_node.visible_ratio = 1
	tween.kill()
	running = false
