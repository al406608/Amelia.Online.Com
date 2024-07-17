extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var walking_sound = preload("res://Assets/Sounds/select_001.ogg")

func _ready():
	add_to_group("player2d")

func _unhandled_key_input(event):
	if ( Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") ) :
		if ! $AnimatedSprite2D.is_playing() :
			$AnimatedSprite2D.play()
	if Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.animation = "up_iddle"
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.animation = "down_iddle"
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.animation = "left_iddle"
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.animation = "right_iddle"
	elif event.is_released():
		$AnimatedSprite2D.pause()
		pass
	
	
func _physics_process(delta):
	step_sound()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	var directionup = Input.get_axis("ui_up","ui_down")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if directionup:
		velocity.y = directionup * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

var reproduced = false
var walk_time = 0.2
const PITCH_VALUE = 0.5
var pitch = PITCH_VALUE
func step_sound():
	if ( Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") ) :
		if reproduced == false:
			SoundManager.play_sound_with_pitch(walking_sound,pitch)
			reproduced = true
			pitch = PITCH_VALUE if pitch == 0.8 else 0.8
			await get_tree().create_timer(walk_time).timeout
			reproduced = false
