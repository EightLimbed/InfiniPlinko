extends AnimatedSprite2D

var random = RandomNumberGenerator.new()
var speed : int = 0

func _ready() -> void:
	left()

func left():
	play("Left")

func right():
	play("Right")

func _on_animation_finished() -> void:
	if random.randi_range(0,10) != 0:
		speed_scale += 0.1
	else:
		speed_scale /= 2.0
	if get_animation() == "Right":
		position.x += 64
	if get_animation() == "Left":
		position.x -= 64
	position.y += 64
	if random.randi_range(0,1) == 1:
		left()
	else:
		right()
