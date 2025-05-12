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
	position.y += 80
	if random.randi_range(0,1) == 1:
		if get_animation() == "Right":
			position.x += 80
			speed_scale /= 1.08
		if get_animation() == "Left":
			if speed_scale < 4: speed_scale *= 1.1
			position.x -= 80
		left()
	else:
		if get_animation() == "Right":
			if speed_scale < 4: speed_scale *= 1.1
			position.x += 80
		if get_animation() == "Left":
			speed_scale /= 1.08
			position.x -= 80
		right()
