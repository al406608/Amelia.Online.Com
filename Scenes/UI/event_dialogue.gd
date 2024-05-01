extends Control

@export var dialogue : PackedStringArray
@export var next_scene : String
var index = 0
var running : bool = false
var tween
@onready var dialogue_node = $NinePatchRect/Dialogue
# Called when the node enters the scene tree for the first time.
func ready():
	show_dialogue()

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") :
		if running:
			end_dialogue()
		elif index < dialogue.size() and !running:
			running = true
			show_dialogue()
		else:
			tween = create_tween()
			tween.tween_property(self,"modulate",Color.BLACK,1)
	if Input.is_action_just_pressed("x_key_press") : 
		pass

func show_dialogue():
	dialogue_node.visible_ratio = 0
	dialogue_node.text = dialogue[index]
	index += 1
	tween = create_tween()
	tween.tween_property(dialogue_node,"visible_ratio",1,0.7)
	tween.tween_property(self,"running",false,0)

func end_dialogue():
	dialogue_node.visible_ratio = 1
	tween.kill()
	running = false
