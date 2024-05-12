extends Control

@onready var texture_rect = $TextureRect
var game_controller = null
signal transmision_finished
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true
	var tween = create_tween()
	tween.tween_method(
	  func(value): texture_rect.material.set_shader_parameter("alpha", value),  
	  0.0,  # Start value
	  1.0,  # End value
	  0.75     # Duration
	)
	tween.tween_callback(end_transtion)

func end_transtion():
	var tween = create_tween()
	transmision_finished.emit()
	tween.tween_method(
		func(value): texture_rect.material.set_shader_parameter("alpha", value),
			1.0,  # Start value
			0.0,  # End value
			0.75    # Duration
		)
	tween.tween_property(get_tree(),"paused",false,0)
	tween.tween_callback(call_deferred.bind("queue_free"))
