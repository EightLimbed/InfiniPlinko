extends AnimatedSprite2D

var random = RandomNumberGenerator.new()
var speed : int = 0
var value : int = 100

func _ready() -> void:
	play("Right")

func _on_animation_finished() -> void:
	var previous = get_animation()
	var next : String
	position.y += 96
	next = ["Right","Left"][random.randi_range(0,1)]
	if previous == next:
		if speed_scale < 4.0: speed_scale *=1.05
	else:
		speed_scale /= 1.05
	if next == "Right":
		position.x += 96
	else:
		position.x -= 96
	play(next)
