extends interactuableComponent

var open : bool = false
@onready var original_rotation = rotation.y
# Called when the node enters the scene tree for the first time.

func open_door():
	if(open):
		var tween = create_tween()
		tween.tween_property(self,"rotation:y", original_rotation,1)
		print("abro")
		open = false
	else:
		var tween2 = create_tween()
		tween2.tween_property(self,"rotation:y", 0,1)
		print("cierro")
		open = true


func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") and in_reach:
			open_door()
		
