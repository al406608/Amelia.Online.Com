extends Control

var text_shown = false
var index : int = 0
var dialogue_data : PackedStringArray
@onready var open_sound = preload("res://Assets/Sounds/maximize_008.ogg")
@onready var close_sound = preload("res://Assets/Sounds/minimize_009.ogg")
func _ready():
	SoundManager.play_ui_sound(open_sound)

func _exit_tree():
	SoundManager.play_ui_sound(close_sound)

func setup(dialogue : PackedStringArray,title : String = "",description : String = "to interact with"):
	dialogue_data = dialogue
	$TipLabel/CenterContainer/HBoxContainer/Object.text = title
	$TipLabel/CenterContainer/HBoxContainer/Description.text = description
	$DialogueWindow/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer2/Title.text = title
	if dialogue.size() > 0:
		$DialogueWindow/VBoxContainer/CenterContainer/VBoxContainer/CenterContainer/Label.text = dialogue[0]
	show()

func show_text():
	if dialogue_data.size() > 0:
		if index == 0:
			text_shown = !text_shown
			$TipLabel.visible = !text_shown
			$DialogueWindow.visible = text_shown
			$DialogueWindow/VBoxContainer/CenterContainer/VBoxContainer/CenterContainer/Label.text = dialogue_data[index]
		else:
			if index < dialogue_data.size():
				$DialogueWindow/VBoxContainer/CenterContainer/VBoxContainer/CenterContainer/Label.text = dialogue_data[index]
			else:
				text_shown = !text_shown
				$TipLabel.visible = !text_shown
				$DialogueWindow.visible = text_shown
		if index < dialogue_data.size():
			index += 1
		else:
			index = 0
	
