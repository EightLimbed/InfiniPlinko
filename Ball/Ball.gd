extends AnimatedSprite2D

var random = RandomNumberGenerator.new()
var speed : int = 0
var value : float = 0
var premoves : Array = []
var end_pos : Vector2 = Vector2.ZERO
var index : int = 0
var bounces : int = 0

func _ready() -> void:
	pregenerate()
	play(premoves[0])
	value = get_parent().bet
	bounces = min(max(32,round(value/2)),999)
	get_parent().get_node("CanvasLayer/Money").text = "Money: $"+str(value)
	get_parent().get_node("CanvasLayer/Bounces").text = "Bounces: "+str(bounces)

func pregenerate():
	end_pos = position
	premoves = []
	for i in 20:
		var next =["Right","Left"][random.randi_range(0,1)]
		if next == "Right":
			end_pos += Vector2(96,96)
		else:
			end_pos += Vector2(-96,96)
		premoves.append(next)

func _on_animation_finished() -> void:
	var previous = get_animation()
	if previous == "Right":
		position.x += 96
	else:
		position.x -= 96
	position.y += 96
	if int(position.y) % 1920 == 0:
		index = 0
		pregenerate()
	var next = premoves[index]
	if previous == next:
		if speed_scale < 4.0: speed_scale *=1.06
	else:
		speed_scale /= 1.05
	play(next)
	index += 1
	bounces -= 1
	get_parent().get_node("CanvasLayer/Bounces").text = "Bounces: "+str(bounces)
	if bounces <= 0:
		get_parent().get_node("CanvasLayer/WinScreen").win(value)
		get_parent().get_node("CanvasLayer/Money").hide()
		get_parent().get_node("CanvasLayer/Bounces").hide()
		stop()
