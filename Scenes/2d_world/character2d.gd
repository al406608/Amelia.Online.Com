extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _unhandled_key_input(event):
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
