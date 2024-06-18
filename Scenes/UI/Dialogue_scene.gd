extends Control

var text_shown = false

func setup(dialogue : String,title : String = ""):
	$TipLabel/CenterContainer/HBoxContainer/Object.text = title
	$DialogueWindow/VBoxContainer/CenterContainer/VBoxContainer/HBoxContainer2/Title.text = title
	$DialogueWindow/VBoxContainer/CenterContainer/VBoxContainer/CenterContainer/Label.text = dialogue
	show()

func show_text():
	text_shown = !text_shown
	$TipLabel.visible = !text_shown
	$DialogueWindow.visible = text_shown
		
