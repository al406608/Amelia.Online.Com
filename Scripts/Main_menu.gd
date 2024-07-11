extends Control

var game_controller : GameController
var start_dialogue : PackedStringArray = PackedStringArray(["Amelia, ready to start a new stage, which she thought would be full of opportunities and open doors",\
"She was leaving a life behind with her friends and acquaintances to start a new one, all because her mother had been transferred at work.",\
"What filled her with hope was to share her last year of university with her friend Emi",\
"But inside, Amelia was worried, her friend Emi hadn't answered her messages for a week.",\
"-Emi…-"])
@onready var initial_scene = preload("res://Scenes/World/Amelia_House.tscn")
# Called when the node enters the scene tree for the first time.

func start_game():
	if(game_controller != null):
		var start_scene = game_controller.dialogue_scene.instantiate()
		start_scene.dialogue = start_dialogue
		start_scene.scene_to_change = initial_scene
		game_controller.actual_node = self
		game_controller.screen_transfer_animation(start_scene)
		

func _on_start_button_button_down():
	start_game()

func _on_settings_button_button_down():
	pass # Replace with function body.
 

func _on_credits_button_button_down():
	pass # Replace with function body.


func _on_exit_button_button_down():
	pass # Replace with function body.
