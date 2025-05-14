extends AnimatedSprite2D

var random = RandomNumberGenerator.new()
var speed : int = 0

func _ready() -> void:
	play("Right")

func _on_animation_finished() -> void:
	var previous = get_animation()
	var next : String
	var options : Array = ["Right","Left"]
	position.y += 80
	next = ["Right","Left"][random.randi_range(0,1)]
	if previous == next:
		if speed_scale < 4.0: speed_scale *=1
	if next == "Right":
		position.x += 80
	else:
		position.x -= 80
	play(next)
