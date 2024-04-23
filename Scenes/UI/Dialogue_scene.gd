extends Control

var text_shown = false

func show_text(dialogue : String, title : String = ""):
	$TipLabel.hide()
	$DialogueWindow.show()
	$DialogueWindow/CenterContainer/Label.text = dialogue
	$DialogueWindow/Title.text = title
	text_shown = true

func show_tip(item : String ):
	$TipLabel/CenterContainer/HBoxContainer/Object.text = item
