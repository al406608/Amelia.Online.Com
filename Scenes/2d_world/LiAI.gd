extends Sprite2D

@onready var original_position = position
# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween().set_loops()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self,"position:y",position.y + 8,1.5)
	tween.tween_property(self,"position:y",original_position.y,1.5)
