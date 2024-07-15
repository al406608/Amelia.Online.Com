extends CharacterBody3D

#Variables de velocidad de personaje y de salto
var speed
const JUMP_VELOCITY = 4.5
const WALK_SPEED = 3.0
const SPRINT_SPEED = 6.0
const RAY_LENGTH = 1.8
#Variables con opcion a editar
var sensitivity = 0.001
var bob_freq = 2.0
var bob_amp = 0.065
var t_bob = 0.0
var walk_time = 1.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var inspected_object = null
var interactuable_component = null
@onready var head = $Head
@onready var camera = $Head/Camera3D

var colliding : bool = false
var crosshair = null
var inspecting_object : bool = false
#Funcion para ocultar el raton
func _ready():
	randomize()
	SoundManager.set_sound_volume(0.5)
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	var grupo = get_tree().get_nodes_in_group("controller")
	if !grupo.is_empty():
		crosshair = grupo[0].crosshair
		crosshair.show()
var reproduced = false
@onready var walking_sounds = [preload("res://Assets/Sounds/footstep04.ogg"),preload("res://Assets/Sounds/footstep05.ogg"),preload("res://Assets/Sounds/footstep06.ogg")]

func _set(property, value):
	if property == "t_bob":
		pass

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		if !inspecting_object:
			rotate_y(-event.relative.x * sensitivity)
			camera.rotate_x(-event.relative.y * sensitivity)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))

func _physics_process(delta):
	camera_raycast()
	walking_sound()
	# Add the gravity.
	if !inspecting_object:
		if not is_on_floor():
			velocity.y -= gravity * delta
		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if Input.is_action_pressed("sprint"):
			speed = SPRINT_SPEED
			walk_time = 0.5
		else:
			speed = WALK_SPEED
			walk_time = 1.0
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if is_on_floor():
			if direction:
				velocity.x = direction.x * speed
				velocity.z = direction.z * speed
			else:
				velocity.x = move_toward(velocity.x, 0, speed)
				velocity.z = move_toward(velocity.z, 0, speed)
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 4.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 4.0)
		#Movimiento de cabeza
		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.transform.origin = _headbob(t_bob)
		move_and_slide()

func _headbob(time) -> Vector3 :
	var pos = Vector3.ZERO
	pos.y = sin(time * bob_freq) * bob_amp
	pos.x = cos(time * bob_freq / 2 ) * bob_amp
	return pos

func camera_raycast():
	var space_state = get_world_3d().direct_space_state
	var cam = $Head/Camera3D
	var mousepos = get_viewport().get_mouse_position()
	var origin = cam.project_ray_origin(mousepos)
	var end = origin + cam.project_ray_normal(mousepos) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.exclude = [self]
	query.collide_with_bodies = true
	var result = space_state.intersect_ray(query)
	if !result.is_empty() :
		colliding = true
		if crosshair != null:
			if result.collider.is_in_group("interaction"):
				crosshair.inspect_element(true)
				if(result.collider != inspected_object):
					if(inspected_object != null):
						inspected_object.on_object_lost_focus()
					inspected_object = result.collider
					inspected_object.on_object_hovered()
			else:
				crosshair.inspect_element(false)
				if inspected_object != null:
					inspected_object.on_object_lost_focus()
				inspected_object = null
	else:
		colliding = false
		if crosshair != null:
			crosshair.inspect_element(false)
		if inspected_object != null:
			inspected_object.on_object_lost_focus()
			inspected_object = null

func walking_sound():
	if ( Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_right") ) :
		if reproduced == false:
			SoundManager.play_sound(walking_sounds.pick_random())
			reproduced = true
			await get_tree().create_timer(walk_time).timeout
			reproduced = false
