extends Control

@onready var movementtip = $VBoxContainer/MovementTip
@onready var etip = $VBoxContainer/Etip
func _ready():
	get_tree().paused = true

func _unhandled_input(event):
	if(event.is_action_pressed("e_key_press")):
		if !etip.visible :
			movementtip.hide()
			etip.show()
		else:
			get_tree().paused = false;
			call_deferred("queue_free");
