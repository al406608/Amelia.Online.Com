extends interactuableComponent

var open : bool = false
var running : bool = false
@onready var original_rotation = rotation.y
# Called when the node enters the scene tree for the first time.
var tween
func open_door():
	if !running:
		running = true
		if open:
			tween = create_tween()
			tween.tween_property(self,"rotation:y", original_rotation,1)
			tween.tween_property(self,"running",false,0)
			print("abro")
			open = false
			GlobalVariables.door_open = false
		else:
			tween = create_tween()
			tween.tween_property(self,"rotation:y", 0,1)
			tween.tween_property(self,"running",false,0)
			print("cierro")
			open = true
			GlobalVariables.door_open = true


func _unhandled_key_input(_event):
	if Input.is_action_just_pressed("e_key_press") and in_reach:
			open_door()
		
