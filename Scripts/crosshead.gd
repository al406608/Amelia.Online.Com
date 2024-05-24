extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
@onready var initial_color = self.modulate
var inspection_color = Color.DARK_ORCHID
var inspecting = false
func _ready():
	hide()

func inspect_element(value):
	if value == inspecting:
		return
	inspecting = value
	if inspecting :
		modulate = inspection_color
		scale = Vector2(1,1)
		play("default")
	else:
		modulate = initial_color
		scale = Vector2(0.8,0.8)
		stop()
	
