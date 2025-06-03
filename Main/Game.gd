extends Node2D

var price_changer : PackedScene = preload("res://PriceChanger/PriceChanger.tscn")
var random = RandomNumberGenerator.new()
var risk : int
var bet : float

func _ready():
	$CanvasLayer/WinScreen.hide()
	gen_triangle(Vector2.ZERO)

func gen_triangle(pos):
	for j in 20:
		var layer = pos.y+j*96-pos.y
		if int(layer) % 192 != 0 or layer == 0:
			for i in 1+(layer)/96:
				if random.randi_range(0,5-risk) == 0:
					spawn_changer(Vector2((i*192)-layer+pos.x,layer+pos.y), pos)

func _on_ball_animation_finished():
	if (int($Ball.position.y) + 960) % 1920 == 0:
		gen_triangle($Ball.end_pos)

func spawn_changer(pos : Vector2, offset : Vector2) -> void:
	var instance = price_changer.instantiate()
	instance.offset = offset
	instance.position = pos
	add_child(instance)
