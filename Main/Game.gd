extends Node2D

var price_changer : PackedScene = preload("res://PriceChanger/PriceChanger.tscn")
var random = RandomNumberGenerator.new()

func _on_ball_animation_finished() -> void:
	var layer = $Ball.position.y
	if int(layer) % 192 == 0:
		for i in 1+layer/96:
			#if random.randi_range(0,10) == 0:
			var spawn_position = Vector2((i*192)-layer,layer)
			spawn_changer(spawn_position)

func spawn_changer(pos : Vector2) -> void:
	var instance = price_changer.instantiate()
	instance.position = pos
	add_child(instance)
