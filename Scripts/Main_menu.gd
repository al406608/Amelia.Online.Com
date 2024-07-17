extends Control

var game_controller : GameController
var start_dialogue : PackedStringArray = PackedStringArray(["Amelia, ready to start a new stage, which she thought would be full of opportunities and open doors",\
"She was leaving a life behind with her friends and acquaintances to start a new one, all because her mother had been transferred at work.",\
"What filled her with hope was to share her last year of university with her friend Emi",\
"But inside, Amelia was worried, her friend Emi hadn't answered her messages for a week.",\
"-Emi…-"])
@onready var initial_scene = preload("res://Scenes/World/Amelia_House.tscn")
@onready var menu_music = preload("res://Assets/Sounds/Stream Loops 2024-02-14_L01.ogg")
@onready var menu_button = preload("res://Assets/Sounds/powerUp2.ogg")
@onready var weird_button = preload("res://Assets/Sounds/error_003.ogg")
@onready var puzzle_scene = preload("res://Scenes/World/Amelia_House_email_puzzle.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	SoundManager.play_music(menu_music)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	GlobalVariables.first_world_interaction = false
	if GlobalVariables.game_controller != null:
		game_controller = GlobalVariables.game_controller
	GlobalVariables.door_open = false
	GlobalVariables.on_2d_world = false
	GlobalVariables.on_email_puzzle = false
	GlobalVariables.on_email_puzzle_completed = false
	GlobalVariables.first_world_interaction = false

func start_game():
	if(game_controller != null):
		var start_scene = game_controller.dialogue_scene.instantiate()
		start_scene.dialogue = start_dialogue
		start_scene.background = "res://Assets/UI/Backgrounds/AmeliaHouseNight.png"
		start_scene.scene_to_change = initial_scene
		start_scene.resume_after_event = false
		game_controller.actual_node = self
		game_controller.screen_transfer_animation(start_scene,true,false,false)

func _on_start_button_button_down():
	SoundManager.play_ui_sound(menu_button)
	start_game()
 

func _on_credits_button_button_down():
	SoundManager.play_ui_sound(menu_button)
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/StartButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/ExtrasButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/CreditsButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/ExitButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/Credits.show()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/Back.show()


func _on_exit_button_button_down():
	SoundManager.play_ui_sound(menu_button)
	get_tree().quit()

func _on_back_button_down():
	SoundManager.play_ui_sound(weird_button)
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/StartButton.show()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/ExtrasButton.show()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/CreditsButton.show()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/ExitButton.show()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/InitialPuzzle.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/Credits.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/Back.hide()


func _on_extras_button_button_down():
	SoundManager.play_ui_sound(menu_button)
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/StartButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/ExtrasButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/CreditsButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/ExitButton.hide()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/InitialPuzzle.show()
	$Node2D/VBoxContainer/NinePatchRect/NinePatchRect/VBoxContainer2/Back.show()


func _on_initial_puzzle_button_down():
	SoundManager.play_ui_sound(menu_button)
	game_controller.actual_node = self
	game_controller.screen_transfer_animation(puzzle_scene.instantiate(),true,true,true)
	pass # Replace with function body.
