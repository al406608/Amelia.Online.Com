extends Control


func show_text(dialogue : String):
	self.show()
	$CenterContainer/Label.text = dialogue
