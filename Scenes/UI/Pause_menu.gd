extends Control

@onready var main_menu = preload("res://Scenes/UI/Main_menu.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalVariables.game_controller.crosshair.hide()
	get_tree().paused = true


func _on_resume_button_button_down():
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	GlobalVariables.game_controller.game_pausable = true
	GlobalVariables.game_controller.crosshair.show()
	call_deferred("queue_free")


func _on_main_menu_button_button_down():
	var main_menu_instance = main_menu.instantiate()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	GlobalVariables.game_controller.screen_transfer_animation(main_menu_instance,true,false,false)
	call_deferred("queue_free")

func _on_exit_button_button_down():
	get_tree().quit()
	pass # Replace with function body.
