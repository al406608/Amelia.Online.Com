extends Control

var dialogue : PackedStringArray = [""]
var scene_to_change
var index = 0
var running : bool = true
var tween
var game_manager : GameController
var resume_after_event : bool = true
var show_crosshair : bool = true
var background : String = "res://Assets/2D/backgrounds/fondoevento1.png"
@onready var dialogue_node = $NinePatchRect/Dialogue
# Called when the node enters the scene tree for the first time.
func _ready():
	show_dialogue()
	dialogue_node.visibility_changed
	$Background.texture = load(background)

func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") :
		if running:
			end_dialogue()
		elif index < dialogue.size() and !running:
			show_dialogue()
		else:
			change_scene()
	if Input.is_action_just_pressed("x_key_press") : 
		change_scene()

func change_scene():
	var next_scene_instance = scene_to_change.instantiate()
	game_manager.screen_transfer_animation(next_scene_instance,resume_after_event,show_crosshair)
	
func show_dialogue():
	running = true
	dialogue_node.visible_ratio = 0
	dialogue_node.text = dialogue[index]
	index += 1
	tween = create_tween()
	var dialogue_length = dialogue_node.text.length() * 0.04
	tween.tween_property(dialogue_node,"visible_ratio",1,dialogue_length)
	tween.tween_callback(end_dialogue)

func end_dialogue():
	dialogue_node.visible_ratio = 1
	tween.kill()
	running = false
