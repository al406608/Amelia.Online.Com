extends Control


@onready var walking_sound = preload("res://Assets/Sounds/error_005.ogg")
@onready var correct_sound = preload("res://Assets/Sounds/confirmation_004.ogg")
@onready var letters = $NinePatchRect/Letters.get_children()
@onready var letters_bool = []
@export var dialogue : PackedStringArray

@onready var initial_scene = preload("res://Scenes/World/Amelia_House_email_puzzle.tscn")

var original_position : Vector2 = Vector2(657,41)

func _ready():
	GlobalVariables.on_2d_world = true
	GlobalVariables.on_email_puzzle = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	letters_bool.resize(letters.size())
	letters_bool.fill(true)


func activate_letter(node):
	SoundManager.play_sound(walking_sound)
	node.modulate = Color.REBECCA_PURPLE
	if letters_bool.all(func(value) : return value == false):
		puzzle_completed()
		
func puzzle_completed():
	var tween = create_tween()
	for letter in letters:
		tween.tween_property(letter,"position",original_position,0.3)
		original_position.x += 19
	tween.tween_callback(SoundManager.play_sound.bind(correct_sound))
	tween.tween_callback(transfer_to_real_world).set_delay(1)

func _on_oletter_mouse_entered():
	if letters_bool[0]:
		letters_bool[0] = false
		activate_letter(letters[0])
		

func _on_pletter_mouse_entered():
	if letters_bool[1]:
		letters_bool[1] = false
		activate_letter(letters[1])
		

func _on_e_letter_mouse_entered():
	if letters_bool[2]:
		letters_bool[2] = false
		activate_letter(letters[2])
		
		
func _on_n_mouse_entered():
	if letters_bool[3]:
		letters_bool[3] = false
		activate_letter(letters[3])
		

func _on_d_mouse_entered():
	if letters_bool[4]:
		letters_bool[4] = false
		activate_letter(letters[4])
		

func _on_o_mouse_entered():
	if letters_bool[5]:
		letters_bool[5] = false
		activate_letter(letters[5])
		

func _on_o_2_mouse_entered():
	if letters_bool[6]:
		letters_bool[6] = false
		activate_letter(letters[6])
		

func _on_r_mouse_entered():
	if letters_bool[7]:
		letters_bool[7] = false
		activate_letter(letters[7])
		
func transfer_to_real_world():
	var start_scene = GlobalVariables.game_controller.dialogue_scene.instantiate()
	start_scene.dialogue = dialogue
	start_scene.background = "res://Assets/UI/Backgrounds/computer_background.png"
	start_scene.scene_to_change = initial_scene
	start_scene.resume_after_event = false
	GlobalVariables.game_controller.actual_node = self
	GlobalVariables.on_email_puzzle = false
	GlobalVariables.on_email_puzzle_completed = true
	GlobalVariables.game_controller.screen_transfer_animation(start_scene,true,false,false)
